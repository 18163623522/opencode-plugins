# 测试opencode插件

## 测试记忆系统插件

### 1. 测试手动保存记忆

在opencode中运行：
```
Remember: I prefer using TypeScript over JavaScript for all projects
```

**预期结果：**
- 创建文件：`~/.config/opencode/memory/user_typescript-preference.md`
- 更新索引：`~/.config/opencode/memory/MEMORY.md`

### 2. 测试列出记忆

```
List memories
```

**预期结果：**
- 显示所有保存的记忆
- 包含类型和描述

### 3. 测试搜索记忆

```
Search memories about TypeScript
```

**预期结果：**
- 返回包含"TypeScript"的记忆
- 显示匹配内容预览

### 4. 测试自动提取

创建一个新会话，进行多轮对话：
```
用户: I'm working on a React project with TypeScript
AI: [回应]

用户: We use Tailwind CSS for styling
AI: [回应]

用户: The project deadline is next Friday
AI: [回应]
```

等待会话结束或手动触发：
```
Extract memories
```

**预期结果：**
- 自动提取用户偏好、项目上下文
- 创建相应的记忆文件

## 测试对话记录查看器

### 1. 测试获取数据库信息

```
Where is my opencode database?
```

**预期结果：**
- 显示数据库路径
- 显示数据库是否存在
- 显示找到的会话文件数量

### 2. 测试列出对话

```
Show my recent conversations
```

**预期结果：**
- 列出最近的对话会话
- 显示会话ID、日期、消息数量

### 3. 测试搜索对话

```
Find conversations about [关键词]
```

**预期结果：**
- 返回包含关键词的对话
- 显示匹配数量和预览

### 4. 测试查看对话

```
View conversation [会话ID]
```

**预期结果：**
- 显示对话的详细内容
- 包含用户和AI的消息

## 故障排除

### 插件未加载

检查opencode.json配置：
```json
{
  "plugin": [
    "./.opencode/plugins/memory-plugin.ts",
    "./.opencode/plugins/conversation-viewer-plugin.ts"
  ]
}
```

### 记忆未保存

检查目录权限：
```bash
ls -la ~/.config/opencode/memory/
```

### 对话未找到

检查数据库位置：
```bash
ls -la ~/.local/share/opencode/opencode.db
```

## 验证清单

- [ ] 记忆系统插件加载成功
- [ ] 能够手动保存记忆
- [ ] 能够列出记忆
- [ ] 能够搜索记忆
- [ ] 自动提取功能工作
- [ ] 对话查看器插件加载成功
- [ ] 能够获取数据库信息
- [ ] 能够列出对话
- [ ] 能够搜索对话
- [ ] 能够查看对话详情