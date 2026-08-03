"""配置加载 —— 全部来自环境变量，绝不硬编码密钥。

环境变量约定：
  MIMO_API_KEY              小米 MiMo API 密钥
  GLM_API_KEY               智谱 GLM API 密钥
  KIMI_API_KEY              Kimi (月之暗面) API 密钥
  VISION_DEFAULT_PROVIDER   默认 provider：glm / mimo / kimi / auto（默认 auto）
  VISION_DEFAULT_MODEL_GLM  GLM 默认模型（默认 glm-4.6v）
  VISION_DEFAULT_MODEL_MIMO MiMo 默认模型（默认 mimo-v2.5）
  VISION_DEFAULT_MODEL_KIMI Kimi 默认模型（默认 kimi-k3）
  VISION_MAX_IMAGE_EDGE     图片压缩长边上限（默认 1568，0=不压缩）
  VISION_REQUEST_TIMEOUT    HTTP 超时秒（默认 120）
  VISION_LOG_LEVEL          日志级别（默认 INFO）
"""
from __future__ import annotations
import os


def _env(key: str, default: str = "") -> str:
    return os.environ.get(key, "").strip() or default


def _env_int(key: str, default: int) -> int:
    try:
        return int(os.environ.get(key, "").strip() or default)
    except (ValueError, TypeError):
        return default


# ---- API Keys（缺失时为空字符串，对应 provider 标记为未就绪）----
MIMO_API_KEY = _env("MIMO_API_KEY")
GLM_API_KEY = _env("GLM_API_KEY")
KIMI_API_KEY = _env("KIMI_API_KEY")

# ---- 行为配置 ----
DEFAULT_PROVIDER = _env("VISION_DEFAULT_PROVIDER", "auto").lower()
DEFAULT_MODEL_GLM = _env("VISION_DEFAULT_MODEL_GLM", "glm-4.6v")
DEFAULT_MODEL_MIMO = _env("VISION_DEFAULT_MODEL_MIMO", "mimo-v2.5")
DEFAULT_MODEL_KIMI = _env("VISION_DEFAULT_MODEL_KIMI", "kimi-k3")
MAX_IMAGE_EDGE = _env_int("VISION_MAX_IMAGE_EDGE", 1568)
REQUEST_TIMEOUT = _env_int("VISION_REQUEST_TIMEOUT", 120)
LOG_LEVEL = _env("VISION_LOG_LEVEL", "INFO").upper()

# ---- provider 白名单（用于校验用户传入的 provider 参数）----
VALID_PROVIDERS = {"glm", "mimo", "kimi", "auto"}
