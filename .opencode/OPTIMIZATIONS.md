# OpenCode Optimizations

基于cc-haha项目优化opencode的功能。

## 新增功能

### 1. 记忆系统增强 (memory-plugin.ts)

**功能特点：**
- 自动提取对话中的记忆信息
- 支持四种记忆类型：user, feedback, project, reference
- 对话缓冲区管理
- 会话结束时自动触发记忆提取

**使用方法：**
- 手动保存记忆：`"Remember: [信息]"`
- 列出所有记忆：`"List memories"`
- 搜索记忆：`"Search memories about [主题]"`
- 删除记忆：`"Forget about [主题]"`
- 手动提取记忆：`"Extract memories"`
- 清除缓冲区：`"Clear buffer"`

**自动提取规则：**
- 会话结束时自动提取
- 至少需要4条消息
- 距离上次提取至少5分钟
- 提取用户偏好、行为反馈、项目上下文、外部引用

### 2. 对话记录查看器 (conversation-viewer-plugin.ts + conversation-viewer-tui-plugin.tsx)

**功能特点：**
- 查看历史对话会话
- 搜索对话内容
- 获取数据库信息
- 支持JSONL格式的会话文件
- **opencode风格的原生TUI界面**

**使用方法：**
- 列出最近对话：`"Show my recent conversations"`
- 查看特定对话：`"View conversation [会话ID]"`
- 搜索对话：`"Find conversations about [关键词]"`
- 数据库信息：`"Where is my opencode database?"`
- **快捷键：`Ctrl+H` 打开对话历史**

**工具说明：**
- `list_conversations`: 列出最近的对话会话
- `view_conversation`: 查看特定对话的详细内容
- `search_conversations`: 按关键词搜索对话
- `get_database_info`: 获取数据库位置和状态信息

**TUI界面特点：**
- 使用opencode原生UI组件
- 支持键盘快捷键导航
- 搜索栏实时过滤
- 相对时间显示（"5m ago", "2h ago"）
- 角色标识（👤 User, 🤖 Assistant）

## 配置文件

### opencode.json

```json
{
  "plugin": [
    "./.opencode/plugins/memory-plugin.ts",
    "./.opencode/plugins/computer-use-plugin.ts",
    "./.opencode/plugins/im-bridge-plugin.ts",
    "./.opencode/plugins/conversation-viewer-plugin.ts",
    "./.opencode/plugins/conversation-viewer-tui-plugin.tsx"
  ],
  "skills": {
    "paths": [".opencode/skills"]
  }
}
```

## 目录结构

```
.opencode/
├── plugins/
│   ├── memory-plugin.ts              # 记忆系统插件
│   ├── conversation-viewer-plugin.ts # 对话记录查看器（工具）
│   ├── conversation-viewer-tui-plugin.tsx  # 对话记录查看器（TUI界面）
│   ├── computer-use-plugin.ts        # 计算机使用插件
│   └── im-bridge-plugin.ts           # IM桥接插件
├── skills/
│   ├── memory/
│   │   └── SKILL.md                  # 记忆系统技能
│   ├── conversation-viewer/
│   │   └── SKILL.md                  # 对话查看器技能
│   ├── computer-use/
│   │   └── SKILL.md                  # 计算机使用技能
│   └── im-bridge/
│       └── SKILL.md                  # IM桥接技能
└── opencode.json                     # 配置文件
```

## 存储位置

### 记忆文件
- **Linux/macOS**: `~/.config/opencode/memory/`
- **Windows**: `%USERPROFILE%\.config\opencode\memory\`

### 对话数据库
- **Linux/macOS**: `~/.local/share/opencode/opencode.db`
- **Windows**: `%APPDATA%\opencode\opencode.db`

## 故障排除

### 记忆系统不工作
1. 检查memory目录是否存在
2. 确认memory-plugin.ts已正确加载
3. 查看控制台是否有错误信息

### 对话记录查看器不工作
1. 运行`get_database_info`检查数据库位置
2. 确认opencode已创建过会话
3. 检查文件权限

### TUI界面不显示
1. 确认conversation-viewer-tui-plugin.tsx已正确加载
2. 检查TypeScript/JSX语法是否正确
3. 尝试使用快捷键`Ctrl+H`打开
4. 查看opencode启动日志是否有错误

### 插件加载失败
1. 检查TypeScript语法是否正确
2. 确认依赖包已安装
3. 查看opencode启动日志

## 参考资料

- [opencode文档](https://opencode.ai/docs)
- [cc-haha项目](https://github.com/NanmiCoder/cc-haha)
- [opencode插件开发指南](https://opencode.ai/docs/plugins)