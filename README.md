# opencode-plugins

基于 [cc-haha](https://github.com/NanmiCoder/cc-haha)、[XIAOMI-MiModex](https://github.com/Gurabit77/XIAOMI-MiModex) 和官方 [opencode](https://opencode.ai) 为 opencode 开发的增强插件套件。

> **兼容性原则**: 所有插件均为 opencode 自有功能之外的增强，不与 opencode 内置功能冲突或覆盖。

## 功能模块

### 新增插件（v0.2.0+）

| 模块 | 命令 | 来源 | 说明 |
|------|------|------|------|
| Token 统计 | `/usage` `token_usage` | cc-haha | Token 用量追踪、成本估算、模型价格表，支持 OpenAI/DeepSeek/Gemini |
| 定时任务 | `/cron` `cron_*` | cc-haha | Cron 表达式调度，自动执行 AI 任务，支持启用/禁用/历史记录 |
| TTS 语音 | `/tts` `tts_speak` | MiModex | 文本转语音，支持 Edge TTS (免费) 和 OpenAI TTS，多语言多音色 |
| 系统诊断 | `/doctor` `doctor_*` | MiModex | 环境健康检查、网络诊断、磁盘检测、配置健康度 |
| Git Worktree | `/worktree` `worktree_*` | cc-haha | Git Worktree 创建/删除/列表/清理、并行分支开发 |

### 增强插件（已有）

| 模块 | 命令 | 说明 |
|------|------|------|
| 记忆系统 | `/memory` `/remember` `/forget` | 跨会话持久化记忆，4 种类型（user/feedback/project/reference） |
| 桌面控制 | `/screenshot` `/desktop` | Computer Use — 截屏、点击、键盘、应用管理 |
| IM 接入 | `/im` | Telegram / 飞书 / 钉钉 / **微信** 远程对话和审批 |
| 多 Agent | `/coordinate` `/review` | 任务分解、并行执行、代码审查 |
| 设置面板 | `/settings` | 图形化设置管理 |

## 安装

```bash
# 克隆到你的项目目录
git clone https://github.com/18163623522/opencode-plugins.git
cd opencode-plugins

# Computer Use 需要安装 Python 依赖
cd .opencode/mcp-servers/computer-use
pip install -r requirements.txt
# Windows: 运行 setup.bat
```

## 配置

在 `opencode.json` 中配置 IM 平台（可选）：

```json
{
  "im": {
    "telegram": { "bot_token": "your_token", "chat_id": "your_chat_id" },
    "feishu": { "app_id": "your_id", "app_secret": "your_secret", "chat_id": "your_chat_id" },
    "dingtalk": { "webhook": "your_webhook" },
    "wechat": { "webhook": "your_webhook", "chat_id": "your_chat_id" }
  }
}
```

TTS 配置（可选）：

```json
{
  "tts": {
    "provider": "edge",
    "voice": "zh-CN-XiaoxiaoNeural",
    "speed": 1.0,
    "format": "mp3"
  }
}
```

## 插件详情

### 1. Token 统计 (`token-stats-plugin.ts`)

参考 cc-haha 的 `cost-tracker.ts` 实现，自动追踪每次 API 调用的 token 消耗，支持：

- 总计/今日 Token 用量统计
- 按模型估算成本（支持 Claude/OpenAI/DeepSeek/Gemini 价格表）
- 会话级别的用量记录
- 模型价格查询
- 统计数据持久化存储

### 2. 定时任务 (`scheduled-tasks-plugin.ts`)

参考 cc-haha 的 `cronService.ts` 和 `scheduled-tasks.ts` 实现：

- 标准 5 段式 Cron 表达式
- 任务创建/删除/启用/禁用
- 执行历史及状态跟踪
- Cron 表达式帮助和示例
- 数据持久化到本地 JSON

### 3. TTS 语音合成 (`tts-plugin.ts`)

参考 MiModex 的语音工作区设计：

- **Edge TTS**: 免费、无需 API Key，15+ 中英日语音
- **OpenAI TTS**: 6 种标准英语语音 (alloy/echo/fable/onyx/nova/shimmer)
- 语速调节 (0.5x-2.0x)
- MP3/WAV 输出格式
- 语音列表查询（按语言筛选）

### 4. 系统诊断 (`doctor-plugin.ts`)

参考 MiModex 的诊断模块：

- 环境检查：OS、Node.js、Git、Python、Bun、Rust/Cargo
- 系统资源：CPU、内存使用率
- 网络诊断：Anthropic/OpenAI/GitHub API 连通性
- 配置检查：opencode.json 健康度
- 磁盘空间检测
- 环境变量展示（已脱敏）

### 5. Git Worktree (`git-worktree-plugin.ts`)

参考 cc-haha 的 Worktree 管理功能：

- 列出所有 Worktree（分支、路径、状态）
- 创建新 Worktree（指定分支、基分支、路径）
- 删除 Worktree（支持强制删除）
- 清理失效记录
- 当前 Worktree 状态（文件变更、Stash 数量）

### 6. IM 桥接（增强版）

已将微信 Webhook 集成到 im-bridge-plugin.ts：

- 微信企业微信机器人 Webhook 支持
- 与 Telegram/飞书/钉钉 统一管理
- 权限审批统一路由

## 目录结构

```
.opencode/
├── opencode.json                    # 主配置（插件注册 + 命令）
├── plugins/
│   ├── memory-plugin.ts             # 记忆系统
│   ├── computer-use-plugin.ts       # 桌面控制
│   ├── im-bridge-plugin.ts          # IM 桥接 (含微信)
│   ├── conversation-viewer-plugin.ts # 对话查看器
│   ├── conversation-viewer-tui-plugin.tsx # 对话查看器 TUI
│   ├── settings-plugin.tsx          # 设置面板
│   ├── token-stats-plugin.ts        # [NEW] Token 统计
│   ├── scheduled-tasks-plugin.ts    # [NEW] 定时任务
│   ├── tts-plugin.ts                # [NEW] TTS 语音
│   ├── doctor-plugin.ts             # [NEW] 系统诊断
│   └── git-worktree-plugin.ts       # [NEW] Git Worktree
├── skills/
│   ├── memory/SKILL.md
│   ├── computer-use/SKILL.md
│   ├── im-bridge/SKILL.md
│   ├── conversation-viewer/SKILL.md
│   └── settings/SKILL.md
├── agent/
│   ├── memory-extractor.md
│   ├── coordinator.md
│   ├── coder.md
│   └── reviewer.md
└── mcp-servers/computer-use/
    ├── server.ts
    ├── helper.py
    ├── requirements.txt
    └── setup.bat
```

## 参考来源

| 功能 | 参考项目 | 参考模块 |
|------|----------|----------|
| Token 统计 | cc-haha | `src/cost-tracker.ts`, `src/utils/modelCost.ts` |
| 定时任务 | cc-haha | `src/server/api/scheduled-tasks.ts`, `src/server/services/cronService.ts` |
| TTS 语音 | MiModex | `src/components/Audio/`, `src/services/mimoApi.ts` |
| 系统诊断 | MiModex | `scripts/doctor`, `src/services/diagnostics.ts` |
| Git Worktree | cc-haha | Worktree 会话管理 |
| 微信 IM | cc-haha | `adapters/` IM 适配器 |
| 记忆/桌面/IM | cc-haha | 核心功能移植 |

## 致谢

- [cc-haha](https://github.com/NanmiCoder/cc-haha) — Claude Code 泄露源码修复项目
- [XIAOMI-MiModex](https://github.com/Gurabit77/XIAOMI-MiModex) — MiMo 桌面控制器
- [opencode](https://opencode.ai) — AI 编码助手平台

## License

MIT
