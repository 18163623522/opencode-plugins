"""图片预处理：把多种输入格式统一成 API 可接受的 image_url 字段。

支持三种输入：
  1. 本地路径（绝对/相对）→ 读文件 → base64 → data: URI（自动推 MIME，大图压缩）
  2. http(s) URL → 原样透传
  3. data:image/...;base64,... → 原样透传
"""
from __future__ import annotations
import base64
import mimetypes
import os
import re
from pathlib import Path

import config

# Pillow 是可选依赖：没有也能用（跳过压缩），有的话做尺寸压缩防爆 token
try:
    from PIL import Image  # type: ignore
    _HAS_PIL = True
except ImportError:
    _HAS_PIL = False

_DATA_URI_RE = re.compile(r"^data:[^;]+;base64,", re.IGNORECASE)

# 扩展名 → MIME 的兜底表（mimetypes 在 Windows 偶尔漏几种）
_EXT_MIME = {
    ".jpg": "image/jpeg", ".jpeg": "image/jpeg",
    ".png": "image/png", ".gif": "image/gif",
    ".webp": "image/webp", ".bmp": "image/bmp",
    ".tiff": "image/tiff", ".tif": "image/tiff",
}


def _looks_like_path(s: str) -> bool:
    return not (s.startswith("http://") or s.startswith("https://")
                or _DATA_URI_RE.match(s))


def _mime_for(path: str) -> str:
    ext = Path(path).suffix.lower()
    return _EXT_MIME.get(ext) or mimetypes.guess_type(path)[0] or "image/png"


def _compress_if_needed(raw: bytes, mime: str) -> tuple[bytes, str, bool]:
    """超过长边上限则等比缩小并转 PNG；返回 (数据, mime, 是否实际压缩)。"""
    max_edge = config.MAX_IMAGE_EDGE
    if not _HAS_PIL or max_edge <= 0:
        return raw, mime, False

    try:
        import io
        img = Image.open(io.BytesIO(raw))
    except Exception:
        return raw, mime, False  # 不是合法图片或 Pillow 不支持，原样透传

    w, h = img.size
    longest = max(w, h)
    if longest <= max_edge:
        return raw, mime, False  # 没超阈值，不压缩

    scale = max_edge / longest
    new_size = (max(1, int(w * scale)), max(1, int(h * scale)))
    img = img.convert("RGB") if img.mode in ("RGBA", "P") else img
    img = img.resize(new_size, Image.LANCZOS)

    import io
    buf = io.BytesIO()
    img.save(buf, format="PNG")
    return buf.getvalue(), "image/png", True


def prepare_image(image: str) -> tuple[str, dict]:
    """把任意输入格式转成 (image_url 字符串, 元信息)。

    返回元信息含 source_type(path/url/data) 和是否经过压缩。
    """
    if not image or not image.strip():
        raise ValueError("image 参数为空")

    # 2) 公网 URL：原样透传
    if image.startswith(("http://", "https://")):
        return image, {"source_type": "url", "compressed": False}

    # 3) 已经是 data: URI：原样透传
    if _DATA_URI_RE.match(image):
        return image, {"source_type": "data", "compressed": False}

    # 1) 本地路径
    path = os.path.expanduser(image)
    if not os.path.isfile(path):
        raise FileNotFoundError(
            f"图片路径不存在: {path}（也不像 URL 或 base64）")

    with open(path, "rb") as f:
        raw = f.read()

    mime = _mime_for(path)
    raw, mime, compressed = _compress_if_needed(raw, mime)
    b64 = base64.b64encode(raw).decode("ascii")
    return (f"data:{mime};base64,{b64}",
            {"source_type": "path", "compressed": compressed,
             "original_path": path})
