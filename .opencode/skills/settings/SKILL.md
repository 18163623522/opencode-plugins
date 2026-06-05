---
name: settings
description: "Manage plugin settings and configuration. Use when user says '/settings' or asks to configure plugins, API keys, or settings."
---

# Settings Management

## When to Use
- User says `/settings` or "设置"
- User wants to configure API keys (Telegram, Feishu, DingTalk)
- User wants to enable/disable plugins or features
- User asks about current configuration

## How It Works

### TUI Mode (Desktop)
The settings plugin provides a visual settings panel accessible via:
- `/settings` command
- `Ctrl+Shift+S` keyboard shortcut
- Click "⚙️ 设置" on the home screen

### CLI Mode
When TUI is not available, the agent can directly edit `.opencode/opencode.json`:

#### Read current config
```typescript
import { readFileSync } from "fs"
const config = JSON.parse(readFileSync(".opencode/opencode.json", "utf-8"))
```

#### Update config
```typescript
import { writeFileSync } from "fs"
config.im.telegram.bot_token = "new_token"
writeFileSync(".opencode/opencode.json", JSON.stringify(config, null, 2))
```

## Configuration Categories

### IM Bridge (即时通讯)
- `im.telegram.bot_token` — Telegram Bot Token
- `im.telegram.chat_id` — Telegram Chat ID
- `im.feishu.app_id` — 飞书 App ID
- `im.feishu.app_secret` — 飞书 App Secret
- `im.feishu.chat_id` — 飞书 Chat ID
- `im.dingtalk.webhook` — 钉钉 Webhook

### Computer Use (桌面控制)
- `computer_use.enabled` — Enable/disable desktop control

### Memory (记忆系统)
- `memory.auto_save` — Auto-extract memories from conversations

### Plugins (插件)
- `plugin` — Array of loaded plugin paths

## Important Notes
- Changes to `opencode.json` require restarting opencode to take effect
- Sensitive values (tokens, secrets) should be kept secure
- The settings panel reads/writes `opencode.json` in the workspace root
