# Houdini MCP 安装指南(Windows + ZCode)

> 针对本机环境定制:Houdini 19.5/20.0/20.5/21.0/22.0 共存,uv 0.11.13 已装,Python 3.14。
> 目标:让 ZCode 里的 GLM 能实时控制 Houdini。
> 两个 MCP **可以并存**(端口不冲突:capoomgit=9876 TCP,fxhoudinimcp=8100 HTTP)。

---

## 0. 选哪个?决策树

```
只想跑通闭环、踩最少坑             → 先装 capoomgit(271★,生态最厚)
想要 USD/Solaris/TOPs/Render 全覆盖 → 两个都装(本指南默认路径)
只想要文档查询压幻觉(search_help) → 只装 fxhoudinimcp
```

**建议:两个都装。** 先 capoomgit 跑通(15 分钟),再叠加 fxhoudinimcp(15 分钟)。

---

## 1. capoomgit/houdini-mcp —— 主力 MCP

### 架构
```
ZCode/GLM  ──stdio──▶  houdini_mcp_server.py  ──TCP 9876──▶  Houdini 插件
(uv run)                   (bridge)                          (hou.session)
```

### 步骤 1.1 — 部署 Houdini 插件到 22.0

> 用 22.0(最新)。若必须用老版本,把路径里的 `houdini22.0` 换成对应版本。

```bash
# 在 Git Bash 里执行
HOUPREF="C:/Users/pengxiwei/Documents/houdini22.0"
mkdir -p "$HOUPREF/scripts/python/houdinimcp"

# 复制插件文件(源码已 clone 到本地)
SRCDIR="D:/001_Archive/AI/houdini-enhancement/mcp-servers/houdini-mcp"
cp "$SRCDIR"/__init__.py            "$HOUPREF/scripts/python/houdinimcp/"
cp "$SRCDIR"/server.py              "$HOUPREF/scripts/python/houdinimcp/"
cp "$SRCDIR"/houdini_mcp_server.py  "$HOUPREF/scripts/python/houdinimcp/"
cp "$SRCDIR"/pyproject.toml         "$HOUPREF/scripts/python/houdinimcp/"
cp "$SRCDIR"/shelf_tool_start_mcp.py  "$HOUPREF/scripts/python/houdinimcp/" 2>/dev/null
cp "$SRCDIR"/shelf_tool_stop_mcp.py   "$HOUPREF/scripts/python/houdinimcp/" 2>/dev/null

ls "$HOUPREF/scripts/python/houdinimcp/"
```

### 步骤 1.2 — 装 mcp Python 包(用 uv)

```bash
cd "C:/Users/pengxiwei/Documents/houdini22.0/scripts/python/houdinimcp"
uv add "mcp[cli]"
# 验证
uv run python -c "import mcp.server.fastmcp; print('MCP OK')"
```

> ⚠️ **Python 3.14 风险**:`mcp` 包官方测试到 3.12/3.13。如果 `uv add` 失败,强制用 3.12:
> ```bash
> uv python install 3.12
> uv venv --python 3.12
> uv add "mcp[cli]"
> ```

### 步骤 1.3 — 在 Houdini 里启动 server(两种方式)

**方式 A:Shelf Tool(推荐,可视)**

1. 打开 Houdini 22.0
2. Shelf 区右键 → New Shelf → 命名 `MCP`
3. 新 Shelf 上右键 → New Tool → Name: `Toggle MCP Server`,Label: `MCP`
4. Script 标签页粘:
   ```python
   import hou
   import houdinimcp
   if hasattr(hou.session, "houdinimcp_server") and hou.session.houdinimcp_server:
       houdinimcp.stop_server()
       hou.ui.displayMessage("Houdini MCP Server stopped")
   else:
       houdinimcp.start_server()
       hou.ui.displayMessage("Houdini MCP Server started on localhost:9876")
   ```
5. 点这个 shelf 按钮 → 看到 "started on localhost:9876"

**方式 B:Python Shell 直接跑(快速验证)**

Houdini 的 Windows → Python Shell,粘:
```python
import houdinimcp
houdinimcp.start_server()
```

### 步骤 1.4 — 让 ZCode 用上它

ZCode 接 MCP 走**项目级 `.mcp.json`**(和 Claude Code 同格式)。在项目根 `D:/001_Archive/AI/` 创建 `.mcp.json`:

```json
{
  "mcpServers": {
    "houdini": {
      "command": "uv",
      "args": [
        "run",
        "--directory",
        "C:/Users/pengxiwei/Documents/houdini22.0/scripts/python/houdinimcp",
        "python",
        "houdini_mcp_server.py"
      ]
    }
  }
}
```

> 如果 `.mcp.json` 已存在(比如配了 unreal-mcp),把 `"houdini"` 这个 key **合并**进去,别覆盖。

然后重启 ZCode,在对话里测试:"帮我在 Houdini 里创建一个 box 节点"。如果 Houdini 里出现了 box,闭环跑通。

---

## 2. healkeiser/fxhoudinimcp —— 补充 MCP(179 工具)

### 架构
```
ZCode/GLM  ──stdio──▶  python -m fxhoudinimcp  ──HTTP 8100──▶  Houdini hwebserver
```

### 步骤 2.1 — 装 MCP server

```bash
pip install fxhoudinimcp
# 或带开发依赖
pip install -e "D:/001_Archive/AI/houdini-enhancement/mcp-servers/fxhoudinimcp[dev]"
```

### 步骤 2.2 — 部署 Houdini 插件(package 方式)

```bash
HOUPREF="C:/Users/pengxiwei/Documents/houdini22.0"
mkdir -p "$HOUPREF/packages"
SRCDIR="D:/001_Archive/AI/houdini-enhancement/mcp-servers/fxhoudinimcp"

# 复制 package 描述文件
cp "$SRCDIR/houdini/fxhoudinimcp.json" "$HOUPREF/packages/"

# 编辑它,把 FXHOUDINIMCP 指向你 clone 的 houdini 子目录
# 用 sed 替换(也可手动编辑)
```

打开 `$HOUPREF/packages/fxhoudinimcp.json`,把 `FXHOUDINIMCP` 环境变量指向:
```
D:/001_Archive/AI/houdini-enhancement/mcp-servers/fxhoudinimcp/houdini
```

### 步骤 2.3 — 重启 Houdini 验证

启动 Houdini 22.0,在 Python Shell:
```python
import fxhoudinimcp_server
print("loaded")  # 看是否自动启动了 hwebserver:8100
```

或浏览器访问 `http://localhost:8100` —— 应返回 fxhoudinimcp 的响应。

### 步骤 2.4 — 加到 `.mcp.json`(与 capoomgit 合并)

```json
{
  "mcpServers": {
    "houdini": {
      "command": "uv",
      "args": ["run", "--directory", "C:/Users/pengxiwei/Documents/houdini22.0/scripts/python/houdinimcp", "python", "houdini_mcp_server.py"]
    },
    "fxhoudini": {
      "command": "python",
      "args": ["-m", "fxhoudinimcp"],
      "env": {
        "HOUDINI_HOST": "localhost",
        "HOUDINI_PORT": "8100"
      }
    }
  }
}
```

两个 server 名字不同(`houdini` vs `fxhoudini`),可以并存。

---

## 3. 验证清单

装完两项后,在 ZCode 里依次问 GLM,确认能跑通:

- [ ] "列出当前 Houdini 场景里的所有节点"(基础连接)
- [ ] "创建一个 torus 节点,rows=20,cols=40"(节点创建 + 设参数)
- [ ] "在 point wrangle 里写 VEX:把所有点的颜色按法线方向上色"(VEX 即时编译反馈)
- [ ] "搜索 Houdini 文档里关于 'volume' 的节点"(fxhoudinimcp 的 search_help —— 这是它独有)
- [ ] "undo 上一步操作"(capoomgit 的 undo group —— 这是它独有)

每条通过就在 ZCode 反馈里看 Houdini 视口是否有相应变化。

---

## 4. 常见坑

| 症状 | 原因 | 解决 |
|---|---|---|
| ZCode 报 "MCP server houdini failed to start" | Houdini 没开 / server 没起 | 先在 Houdini 里点 shelf 启动,看到 9876 提示再重启 ZCode |
| `uv add` 报 Python 版本不兼容 | 你是 3.14,太新 | 强制 `uv venv --python 3.12` |
| fxhoudinimcp 启动但 8100 不通 | hwebserver 没自动启 | Python Shell 跑 `import hwebserver; hwebserver.start(8100)` |
| 节点创建了但参数没变 | 写操作跨线程 | capoomgit 用 `hdefereval.executeInMainThreadWithResult`,确保 Houdini 主线程没卡 |
| 两个 MCP 同时连同一个 Houdini 冲突 | 不会冲突 | 9876 和 8100 是不同端口,各走各的 |

---

## 5. 两个 MCP 分工建议

| 任务 | 用谁 |
|---|---|
| 快速建节点/设参数/迭代 VEX | **capoomgit**(undo 友好,反馈快) |
| 查 Houdini 节点文档(防幻觉) | **fxhoudinimcp** 的 `search_help` |
| USD/Solaris/LOP 工作 | **fxhoudinimcp**(18 个 LOP 工具) |
| Pyro/FLIP/Vellum 一键 workflow | **fxhoudinimcp**(8 个 workflow 工具) |
| 大批量节点操作要能撤销 | **capoomgit**(整组 undo) |

日常默认走 capoomgit,需要文档查询或 USD/复杂 workflow 时切 fxhoudinimcp。
