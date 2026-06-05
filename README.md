# opencode-plugins

基于 [cc-haha](https://github.com/NanmiCoder/cc-haha) 核心功能，为 [opencode](https://opencode.ai) 开发的插件套件。

## 功能模块

| 模块 | 命令 | 说明 |
|------|------|------|
| 记忆系统 | `/memory` `/remember` `/forget` | 跨会话持久化记忆，4 种类型（user/feedback/project/reference） |
| 桌面控制 | `/screenshot` `/desktop` | Computer Use — 截屏、点击、键盘、应用管理 |
| IM 接入 | `/im` | Telegram / 飞书 / 钉钉 远程对话和审批 |
| 多 Agent | `/coordinate` `/review` | 任务分解、并行执行、代码审查 |

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
    "dingtalk": { "webhook": "your_webhook" }
  }
}
```

## 目录结构

```
.opencode/
├── opencode.json                    # 主配置
├── plugins/
│   ├── memory-plugin.ts             # 记忆系统插件
│   ├── computer-use-plugin.ts       # 桌面控制插件
│   └── im-bridge-plugin.ts          # IM 接入插件
├── skills/
│   ├── memory/SKILL.md              # 记忆管理 Skill
│   ├── computer-use/SKILL.md        # 桌面控制 Skill
│   └── im-bridge/SKILL.md           # IM 桥接 Skill
├── agent/
│   ├── memory-extractor.md          # 记忆提取 Agent
│   ├── coordinator.md               # 任务协调 Agent
│   ├── coder.md                     # 编码 Agent
│   └── reviewer.md                  # 代码审查 Agent
└── mcp-servers/computer-use/
    ├── server.ts                    # MCP 服务器
    ├── helper.py                    # Python 桌面控制
    ├── requirements.txt             # Python 依赖
    └── setup.bat                    # Windows 安装脚本
```

## 致谢

- [cc-haha](https://github.com/NanmiCoder/cc-haha) — Claude Code 泄露源码修复项目，本插件的核心功能来源
- [opencode](https://opencode.ai) — AI 编码助手平台

## License

MIT
