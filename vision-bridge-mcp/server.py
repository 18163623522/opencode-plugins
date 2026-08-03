"""视觉能力桥接 MCP Server（stdio 传输）。

把图片转发给有视觉能力的外部模型（小米 MiMo-V2.5 / 智谱 GLM-4.6V），
让无视觉的主模型也能"看图"。

暴露 2 个工具：
  - analyze_image      分析单张图片
  - list_vision_models 列出可用 provider/模型/就绪状态（自描述）
"""
from __future__ import annotations
import logging
import sys

from mcp.server.fastmcp import FastMCP

import config
from providers import (SPECS, call_vision, is_ready, ready_providers, resolve)
from image_utils import prepare_image

# ---- 日志：写到 stderr，绝不污染 stdio（MCP 协议在 stdio 上跑）----
logging.basicConfig(
    level=getattr(logging, config.LOG_LEVEL, logging.INFO),
    stream=sys.stderr,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
)
log = logging.getLogger("vision-bridge")

mcp = FastMCP(
    name="vision-bridge",
    instructions=(
        "视觉能力桥接：当需要理解/分析图片时调用 analyze_image。"
        "支持本地路径、http(s) URL、base64 三种输入。"
        "provider 默认 auto（按可用性自动选）。"),
)


@mcp.tool()
def analyze_image(
    image: str,
    question: str,
    provider: str = "auto",
    model: str = "",
    max_tokens: int = 1024,
    detail: str = "auto",
) -> str:
    """分析一张图片并回答问题。

    Args:
        image: 图片输入，三选一：
               - 本地路径（如 D:/shot.png 或 ./ui.jpg，会自动压缩防爆 token）
               - 公网 http(s) URL（原样透传）
               - data:image/...;base64,... 字符串（原样透传）
        question: 想问的问题，如"这张图里有什么？"、"把 UI 布局列成 markdown"。
        provider: glm / mimo / kimi / auto（默认 auto，按可用性自动选）。
        model: 指定模型（可选）。留空用 provider 默认，如 glm-4.6v-flash 免费档。
        max_tokens: 回复最大 token（默认 1024）。
        detail: 图像采样精度 low/high/auto（默认 auto，OpenAI 兼容字段）。

    Returns:
        模型回答文本 + provider/model/usage 元信息。
    """
    provider = (provider or "auto").lower()
    if provider not in config.VALID_PROVIDERS:
        return f"错误：provider 必须是 {sorted(config.VALID_PROVIDERS)} 之一，收到: {provider}"

    try:
        provider_resolved, model_resolved, spec = resolve(
            provider, model or None)
    except (RuntimeError, ValueError) as e:
        return f"错误：{e}"

    try:
        image_url, img_meta = prepare_image(image)
    except (FileNotFoundError, ValueError) as e:
        return f"错误：图片准备失败 - {e}"

    log.info("analyze_image provider=%s model=%s src=%s q=%.60s",
             provider_resolved, model_resolved,
             img_meta.get("source_type"), question)

    try:
        result = call_vision(
            provider=provider_resolved,
            model=model_resolved,
            spec=spec,
            image_url=image_url,
            question=question,
            max_tokens=max_tokens,
            detail=detail,
        )
    except RuntimeError as e:
        log.error("调用失败: %s", e)
        # auto 模式下，若首选失败且还有备用 provider，自动 fallback 一次
        if provider == "auto":
            fallbacks = [p for p in ready_providers() if p != provider_resolved]
            if fallbacks:
                fb_provider, fb_model, fb_spec = resolve(fallbacks[0], None)
                log.warning("auto fallback 到 %s", fb_provider)
                try:
                    result = call_vision(
                        provider=fb_provider, model=fb_model, spec=fb_spec,
                        image_url=image_url, question=question,
                        max_tokens=max_tokens, detail=detail)
                except RuntimeError as e2:
                    return f"错误：主备 provider 均失败。\n  主({provider_resolved}): {e}\n  备({fb_provider}): {e2}"
            else:
                return f"错误：{e}"
        else:
            return f"错误：{e}"

    # 组装给主模型的返回：先放答案，再附元信息
    usage = result.usage or {}
    usage_str = ""
    if usage:
        usage_str = (f"prompt={usage.get('prompt_tokens', '?')} "
                     f"completion={usage.get('completion_tokens', '?')} "
                     f"total={usage.get('total_tokens', '?')}")

    return (
        f"{result.text}\n\n"
        f"---\n"
        f"[provider: {result.provider} | model: {result.model} | {usage_str}]"
    )


@mcp.tool()
def list_vision_models() -> str:
    """列出当前可用的视觉 provider、模型和就绪状态（不泄露密钥）。

    用途：主模型在不确定有哪些视觉模型可选时先调用此工具探查。
    """
    ready = ready_providers()
    lines = [f"视觉桥接器就绪状态（已配置的 provider: {ready or '无'}）", ""]

    for key in ("glm", "mimo", "kimi"):
        spec = SPECS[key]
        status = "✓ 就绪" if is_ready(key) else "✗ 未配置 Key"
        env_hint = f"（需 {spec.env_var}）" if not is_ready(key) else ""
        lines.append(f"### {spec.label}  [{key}]  {status} {env_hint}")
        lines.append(f"  默认模型: {spec.default_model}")
        lines.append(f"  可选模型: {', '.join(spec.models)}")
        lines.append("")

    lines.append(f"当前默认 provider: {config.DEFAULT_PROVIDER}")
    if not ready:
        lines.append("⚠️ 没有任何 provider 就绪。请在 .mcp.json 的 env 中"
                     "至少配置一个 API Key。")
    return "\n".join(lines)


if __name__ == "__main__":
    # stdio 传输：ZCode 通过 command+args 拉起本进程，MCP 协议在 stdin/stdout 上跑
    mcp.run(transport="stdio")
