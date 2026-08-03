# Vision Bridge MCP · 视觉能力桥接

让**无视觉能力的主模型**也能"看图"——当需要图片理解时，自动调用有视觉能力的外部模型（小米 MiMo-V2.5 / 智谱 GLM-4.6V），把分析结果拿回来用。

## 它解决什么问题

主模型（如 GLM-5.2 文本版）没有视觉能力。本桥接器作为一个 MCP 工具，让主模型在需要"看图"时**自动调用**，由桥接器转发给视觉模型处理。对主模型而言，就像自己长了眼睛。

## 支持的视觉模型

| Provider | 模型 | 协议 | 多模态能力 | API 平台 |
|----------|------|------|-----------|---------|
| `glm` | **glm-4.6v** / glm-4.6v-flash(免费) / glm-5v-turbo / 4.5V | OpenAI | 图/视频/文档/GUI | [open.bigmodel.cn](https://open.bigmodel.cn) |
| `kimi` | **kimi-k3** / kimi-k2.7-code | Anthropic | 图/视频，原生视觉 | [platform.kimi.com](https://platform.kimi.com) |
| `mimo` | **mimo-v2.5** / V2.5-Pro / V2-Omni | OpenAI | 图/视频/音频，1M 上下文 | [platform.xiaomimimo.com](https://platform.xiaomimimo.com) |

桥接器内部按 provider 自动适配协议（OpenAI / Anthropic），**支持自动切换（auto）**：首选失败自动 fallback 到备选。

### 各 Key 前缀对应的端点（重要，避免 401）

| Key 前缀 | 归属 | 正确端点 |
|----------|------|---------|
| 智谱标准 Key | GLM | `open.bigmodel.cn/api/paas/v4` |
| `sk-kimi-...` | Kimi Code（Anthropic 协议） | `api.kimi.com/coding` |
| `tp-...` | MiMo Token Plan | 需从 platform.xiaomimimo.com/token-plan 页面复制专属 base_url |

## 安装

### 1. 安装依赖

```bash
cd D:/001_Archive/AI/vision-bridge-mcp
python -m pip install -r requirements.txt
```

### 2. 获取 API Key

- **智谱 GLM**：注册 [open.bigmodel.cn](https://open.bigmodel.cn) → 控制台 → API Keys。`glm-4.6v-flash` 有免费档，`glm-5v-turbo` 是多模态 Coding 模型（需单独开通/充值）。
- **Kimi K3**：注册 [platform.kimi.com](https://platform.kimi.com) → 获取 API Key（`sk-kimi-` 前缀）。注意这是 Kimi Code 平台，用 Anthropic 协议，与老的 Moonshot 平台不互通。
- **小米 MiMo**：注册 [platform.xiaomimimo.com](https://platform.xiaomimimo.com) → 获取 API Key。`tp-` 前缀是 Token Plan，需用专属 base_url（见平台 Token Plan 页面）。

### 3. 配置 MCP

复制示例配置：
```bash
cp .mcp.json.example .mcp.json
```

编辑 `.mcp.json`，把两个 API Key 填进 `env` 字段。

#### 放哪里生效？

| 位置 | 生效范围 |
|------|---------|
| `C:/Users/<你的用户名>/.zcode/.mcp.json` | **全局**（所有会话都能用，推荐） |
| `<项目根>/.mcp.json` | 仅该项目 |

> 如果该文件已存在，把 `vision-bridge` 这一项合并进已有的 `mcpServers`，不要覆盖整个文件。

### 4. 重启 ZCode

让 MCP 配置生效。重启后主模型就能在需要时自动调用 `analyze_image`。

## 暴露的 MCP 工具

### `analyze_image` —— 分析图片（核心）

```
image:        图片输入（三选一）
              - 本地路径：D:/shot.png（自动压缩防爆 token）
              - 公网 URL：https://example.com/x.jpg（原样透传）
              - base64：data:image/png;base64,...（原样透传）
question:     想问的问题，如"把 UI 布局列成 markdown"
provider:     glm / kimi / mimo / auto（默认 auto，按可用性自动选，首选失败自动 fallback）
model:        指定模型（可选），如 glm-4.6v-flash 走免费档
max_tokens:   回复最大 token（默认 1024）
detail:       图像采样精度 low/high/auto（默认 auto）
```

### `list_vision_models` —— 探查就绪状态

返回当前哪些 provider 已配置 Key、各自支持哪些模型。主模型不确定可用项时先调这个。

## 使用示例（对话中）

配置生效后，你只需像往常一样对话，主模型会在需要时自动调用：

> **你**：帮我看看 `D:/001_Archive/AI/ue_matwin.png` 这个 UE 材质编辑器截图，节点结构是怎样的？
>
> *（主模型自动调用 analyze_image，你看到结果）*
>
> **主模型**：这张截图显示的是一个材质编辑器窗口，包含以下节点……

你也可以显式要求：

> **你**：用 GLM 的免费模型分析这张 UI 截图 `./design.png`，列出布局结构。

## 行为配置（环境变量，可选）

| 变量 | 默认 | 说明 |
|------|------|------|
| `VISION_DEFAULT_PROVIDER` | `auto` | 默认 provider |
| `VISION_DEFAULT_MODEL_GLM` | `glm-4.6v` | GLM 默认模型 |
| `VISION_DEFAULT_MODEL_MIMO` | `mimo-v2.5` | MiMo 默认模型 |
| `VISION_MAX_IMAGE_EDGE` | `1568` | 图片压缩长边上限（0=不压缩） |
| `VISION_REQUEST_TIMEOUT` | `120` | HTTP 超时秒 |
| `VISION_LOG_LEVEL` | `INFO` | 日志级别 |

都写在 `.mcp.json` 的 `env` 字段里。

## 安全

- API Key 只从环境变量读，**绝不硬编码**，绝不写进 git。
- `.mcp.json` 已被 `.gitignore` 忽略。
- `list_vision_models` 只显示就绪状态，**不泄露密钥本身**。

## 故障排查

**工具没出现在 ZCode 里**
- 确认 `.mcp.json` 路径正确（用户级 `~/.zcode/.mcp.json` 或项目根）
- 确认 JSON 格式有效（无尾逗号、引号匹配）
- 重启 ZCode

**`没有可用的视觉 provider`**
- `.mcp.json` 的 `env` 里至少填一个 Key
- 确认 Key 没有多余的引号或空格

**`HTTP 401 / 403`**
- API Key 错误或过期，去对应平台重新获取

**`HTTP 404` 或 `model not found`**
- 模型名拼错，用 `list_vision_models` 查支持的模型清单

**Python 路径问题**
- `.mcp.json` 里的 `command` 用 `python`，如果你的环境里要 `python3` 或完整路径，相应修改

## 手动验证（不通过 ZCode）

```bash
# 列出工具（模拟 MCP 客户端）
python -c "
import json, subprocess, sys, time
p = subprocess.Popen([sys.executable,'server.py'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)
p.stdin.write(json.dumps({'jsonrpc':'2.0','id':1,'method':'initialize','params':{'protocolVersion':'2025-06-18','capabilities':{},'clientInfo':{'name':'t','version':'1'}}})+'\n')
p.stdin.write(json.dumps({'jsonrpc':'2.0','method':'notifications/initialized','params':{}})+'\n')
p.stdin.write(json.dumps({'jsonrpc':'2.0','id':2,'method':'tools/list','params':{}})+'\n')
p.stdin.flush(); time.sleep(1); p.stdin.close()
print(p.communicate(timeout=5)[0])
"
```

应看到 `analyze_image` 和 `list_vision_models` 两个工具。

## 架构

```
主模型(无视觉) ──MCP/stdio──▶ vision-bridge server.py
                                  │
                                  ├─ image_utils.py  (base64/压缩/URL 识别)
                                  ├─ providers.py    (按 protocol 分派调用)
                                  └─ config.py       (env 加载)
                                          │
                    ┌─────────────────────┼─────────────────────┐
                    ▼ (openai 协议)       ▼ (anthropic 协议)     ▼ (openai 协议)
            智谱 GLM-4.6V           Kimi K3                小米 MiMo-V2.5
            open.bigmodel.cn        api.kimi.com/coding    api.xiaomimimo.com
```

桥接器支持两种协议（OpenAI / Anthropic），按 provider 自动选择。auto 模式首选 GLM（有免费档），失败自动 fallback 到 Kimi / MiMo。新增 provider 只需在 `providers.py` 的 `SPECS` 表加一项并标明 protocol。
