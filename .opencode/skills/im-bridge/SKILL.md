---
name: im-bridge
description: Bridge conversations from IM platforms (Telegram, Feishu/Lark, WeChat, DingTalk) to opencode. Use when configuring remote access or IM integration.
---

# IM Bridge

Connect opencode to messaging platforms for remote dialog and approval workflows.

## Supported Platforms

| Platform | Features |
|----------|----------|
| **Telegram** | Bot API, inline buttons for approval |
| **Feishu/Lark** | Card messages, approval flows |
| **WeChat** | Enterprise WeChat webhook |
| **DingTalk** | Robot webhook, card actions |

## How It Works

1. IM message arrives via webhook
2. Plugin routes message to opencode conversation
3. For approval requests, sends interactive card to IM
4. User responds in IM → result routes back to opencode
5. opencode continues execution with approval result

## Configuration

Set environment variables for your IM platform:

```bash
# Telegram
TELEGRAM_BOT_TOKEN=your_token
TELEGRAM_CHAT_ID=your_chat_id

# Feishu/Lark
FEISHU_APP_ID=your_app_id
FEISHU_APP_SECRET=your_app_secret
FEISHU_CHAT_ID=your_chat_id
```

## Use Cases

- Remote code review and approval from phone
- Receive notifications about long-running tasks
- Approve dangerous commands when away from terminal
- Multi-user collaboration on shared sessions
