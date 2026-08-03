"""视觉模型 provider 抽象层。

支持两种协议：
  - openai：智谱 GLM、小米 MiMo（兼容 OpenAI Chat Completions）
  - anthropic：Kimi Code（api.kimi.com/coding，Anthropic Messages 协议）

用一个 provider 配置表驱动，按 provider.protocol 分派到对应调用路径。
"""
from __future__ import annotations
from dataclasses import dataclass, field
from typing import Any

import httpx

import config


@dataclass(frozen=True)
class ProviderSpec:
    """单个 provider 的静态配置。"""
    name: str                 # glm / mimo / kimi
    protocol: str             # 'openai' 或 'anthropic'
    base_url: str             # API 根（不含具体路径）
    default_model: str
    auth_header: str          # 'Authorization' 或 'x-api-key'
    auth_prefix: str          # 'Bearer ' 或 ''
    env_var: str              # 存放 API Key 的环境变量名
    label: str                # 人类可读名称
    models: tuple[str, ...]   # 该 provider 支持的视觉模型清单


# ---- provider 配置表 ----
SPECS: dict[str, ProviderSpec] = {
    "glm": ProviderSpec(
        name="glm",
        protocol="openai",
        base_url="https://open.bigmodel.cn/api/paas/v4",
        default_model=config.DEFAULT_MODEL_GLM,
        auth_header="Authorization",
        auth_prefix="Bearer ",
        env_var="GLM_API_KEY",
        label="智谱 GLM",
        models=("glm-5v-turbo",         # 2026/04 多模态 Coding 模型，看图/视频最强
                "glm-4.6v", "glm-4.6v-flash", "glm-4.6v-flashx",
                "glm-4.5v", "glm-4v-plus", "glm-4v-flash"),
    ),
    "mimo": ProviderSpec(
        name="mimo",
        protocol="openai",
        base_url="https://api.xiaomimimo.com/v1",
        default_model=config.DEFAULT_MODEL_MIMO,
        auth_header="api-key",
        auth_prefix="",
        env_var="MIMO_API_KEY",
        label="小米 MiMo-V2.5",
        models=("mimo-v2.5", "mimo-v2.5-pro", "mimo-v2-omni"),
    ),
    "kimi": ProviderSpec(
        name="kimi",
        protocol="anthropic",
        base_url="https://api.kimi.com/coding",   # Anthropic Messages 协议
        default_model=config.DEFAULT_MODEL_KIMI,
        auth_header="x-api-key",
        auth_prefix="",
        env_var="KIMI_API_KEY",
        label="Kimi K3 (Code)",
        models=("kimi-k3", "kimi-k2.7-code", "kimi-k2.6"),
    ),
}


def is_ready(provider: str) -> bool:
    """该 provider 是否已配置 API Key（密钥本身不外泄）。"""
    spec = SPECS.get(provider)
    if not spec:
        return False
    return bool(getattr(config, spec.env_var, ""))


def ready_providers() -> list[str]:
    """返回所有已就绪的 provider 名（按 glm 优先的顺序，glm 有免费档）。"""
    return [p for p in ("glm", "mimo", "kimi") if is_ready(p)]


@dataclass
class VisionResult:
    """一次视觉分析的返回。"""
    text: str                          # 模型回答文本
    provider: str                      # 实际使用的 provider
    model: str                         # 实际使用的模型
    usage: dict[str, int] = field(default_factory=dict)  # prompt_tokens 等
    raw_finish_reason: str = ""        # stop / length 等


def resolve(provider: str, model: str | None) -> tuple[str, str, ProviderSpec]:
    """把用户传入的 provider/model 解析成具体的 (provider, model, spec)。

    provider='auto' 时按就绪状态自动选；指定 provider 但未就绪时报错。
    """
    if provider == "auto":
        ready = ready_providers()
        if not ready:
            raise RuntimeError(
                "没有可用的视觉 provider：GLM_API_KEY / MIMO_API_KEY / KIMI_API_KEY "
                "均未配置。请在 .mcp.json 的 env 中至少填一个。")
        provider = ready[0]  # glm 优先（有免费档）

    spec = SPECS.get(provider)
    if spec is None:
        raise ValueError(f"未知 provider: {provider}（可选: glm/mimo/kimi/auto）")

    if not is_ready(provider):
        raise RuntimeError(
            f"provider '{provider}' 未就绪：环境变量 {spec.env_var} 未设置。")

    model = model or spec.default_model
    return provider, model, spec


def call_vision(
    *,
    provider: str,
    model: str,
    spec: ProviderSpec,
    image_url: str,           # 已经预处理好的 URL（公网 http(s) 或 data:base64）
    question: str,
    max_tokens: int = 1024,
    detail: str = "auto",
    timeout: int | None = None,
) -> VisionResult:
    """统一调用入口，按 spec.protocol 分派到对应协议路径。"""
    if spec.protocol == "anthropic":
        return _call_anthropic(provider=provider, model=model, spec=spec,
                               image_url=image_url, question=question,
                               max_tokens=max_tokens, timeout=timeout)
    return _call_openai(provider=provider, model=model, spec=spec,
                        image_url=image_url, question=question,
                        max_tokens=max_tokens, detail=detail, timeout=timeout)


def _call_openai(
    *, provider, model, spec, image_url, question, max_tokens, detail, timeout,
) -> VisionResult:
    """OpenAI Chat Completions 协议（GLM / MiMo）。"""
    api_key = getattr(config, spec.env_var, "")
    headers = {
        spec.auth_header: f"{spec.auth_prefix}{api_key}",
        "Content-Type": "application/json",
    }
    payload: dict[str, Any] = {
        "model": model,
        "messages": [
            {
                "role": "user",
                "content": [
                    {"type": "image_url",
                     "image_url": {"url": image_url, "detail": detail}},
                    {"type": "text", "text": question},
                ],
            }
        ],
        "max_tokens": max_tokens,
    }
    url = f"{spec.base_url}/chat/completions"
    timeout = timeout or config.REQUEST_TIMEOUT

    try:
        with httpx.Client(timeout=timeout) as client:
            resp = client.post(url, headers=headers, json=payload)
    except httpx.HTTPError as e:
        raise RuntimeError(f"网络错误 [{provider}]: {e}") from e

    if resp.status_code != 200:
        body = resp.text[:600]
        raise RuntimeError(f"[{provider}] HTTP {resp.status_code}: {body}")

    data = resp.json()
    choices = data.get("choices") or []
    if not choices:
        raise RuntimeError(f"[{provider}] 响应无 choices: {data}")
    msg = choices[0].get("message", {})
    text = msg.get("content", "") or ""
    finish = choices[0].get("finish_reason", "")

    # 防御 thinking 模型（如 GLM-4.6V）：当 content 为空但 reasoning_content
    # 有内容时（max_tokens 太小，token 全被思考消耗），回退到 reasoning 末尾，
    # 总比返回空字符串给用户强。并提示增大 max_tokens。
    if not text.strip():
        reasoning = msg.get("reasoning_content", "") or ""
        if reasoning.strip():
            text = (reasoning.strip()[:800]
                    + "\n\n[注：模型思考耗尽了 max_tokens，正式回答被截断，"
                    "建议增大 max_tokens 重试]")

    return VisionResult(
        text=text, provider=provider, model=model,
        usage=data.get("usage", {}) or {}, raw_finish_reason=finish,
    )


def _data_uri_to_anthropic(image_url: str) -> dict | None:
    """把 data:image/png;base64,xxx 拆成 Anthropic 的 source 结构。
    公网 URL 返回 None（调用方改用 url 类型）。
    """
    if image_url.startswith(("http://", "https://")):
        return {"type": "url", "url": image_url}
    # data:image/png;base64,xxxx
    if image_url.startswith("data:"):
        try:
            header, data = image_url.split(",", 1)
            # data:image/png;base64 -> image/png
            media = header.split(":")[1].split(";")[0]
            return {"type": "base64", "media_type": media, "data": data}
        except (ValueError, IndexError):
            return None
    return None


def _call_anthropic(
    *, provider, model, spec, image_url, question, max_tokens, timeout,
) -> VisionResult:
    """Anthropic Messages 协议（Kimi Code）。

    与 OpenAI 协议的关键差异：
    - 端点 /v1/messages（不是 /chat/completions）
    - 认证 x-api-key + anthropic-version header
    - 图片用 {type:image, source:{type:base64, media_type, data}}
    - 响应 content[] 含 thinking/text 块，只取 text
    """
    api_key = getattr(config, spec.env_var, "")
    headers = {
        spec.auth_header: f"{spec.auth_prefix}{api_key}",
        "anthropic-version": "2023-06-01",
        "Content-Type": "application/json",
    }
    source = _data_uri_to_anthropic(image_url)
    if source is None:
        raise RuntimeError(
            f"[{provider}] 无法把图片转成 Anthropic 格式（不支持的输入）")

    image_block = {"type": "image", "source": source}
    payload: dict[str, Any] = {
        "model": model,
        "max_tokens": max_tokens,
        "messages": [{
            "role": "user",
            "content": [image_block, {"type": "text", "text": question}],
        }],
    }
    url = f"{spec.base_url}/v1/messages"
    timeout = timeout or config.REQUEST_TIMEOUT

    try:
        with httpx.Client(timeout=timeout) as client:
            resp = client.post(url, headers=headers, json=payload)
    except httpx.HTTPError as e:
        raise RuntimeError(f"网络错误 [{provider}]: {e}") from e

    if resp.status_code != 200:
        body = resp.text[:600]
        raise RuntimeError(f"[{provider}] HTTP {resp.status_code}: {body}")

    data = resp.json()
    # Anthropic：content 是块数组，拼接所有 text 块（跳过 thinking）
    text_parts = [b.get("text", "") for b in data.get("content", [])
                  if b.get("type") == "text"]
    text = "".join(text_parts).strip()
    # usage 字段名与 OpenAI 不同，统一成 prompt_tokens/completion_tokens
    raw_usage = data.get("usage", {}) or {}
    usage = {
        "prompt_tokens": raw_usage.get("input_tokens", 0),
        "completion_tokens": raw_usage.get("output_tokens", 0),
        "total_tokens": (raw_usage.get("input_tokens", 0)
                         + raw_usage.get("output_tokens", 0)),
    }

    return VisionResult(
        text=text, provider=provider, model=model,
        usage=usage, raw_finish_reason=data.get("stop_reason", ""),
    )
