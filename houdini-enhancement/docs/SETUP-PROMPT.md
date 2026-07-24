# Houdini AI 增强 —— 跨电脑自动安装提示词

> ⚠️ **此文件已被取代 —— 请改用全环境版**
>
> 本文件(Houdini 专用迁移 prompt)是早期版本,只覆盖 Houdini MCP/skill。
> 完整方案已升级为**全环境迁移**(skill + 24 插件 + MCP + 偏好一键搞定),权威版本在:
>
> 👉 **`zcode-skills` 仓库的 `env/SETUP-PROMPT.md`**
>    (GitHub: `18163623522/zcode-skills`,私有;本地:`~/.zcode/skills/env/SETUP-PROMPT.md`)
>
> 新电脑请直接用那个全环境版,它会连带处理 Houdini 部分。
>
> **本文件保留**,作为 Houdini 专用的细节参考(MCP 架构、Python 3.14 风险、验证清单等),但**触发入口**已迁移。
>
> ---
>
> **用途**:把下面整段 prompt 复制到另一台电脑的 ZCode / Claude Code / 任何支持工具调用的 agent 里,它会自动完成 Houdini MCP + skill + 知识库的安装。
>
> **怎么用**:见本文件末尾的【使用方法】。

---

## 复制下面这一整段(从下方 `---` 开始,到【使用方法】之前结束)发给新电脑的 agent

---

你是一个 Houdini + Unreal Engine 开发环境配置助手。你的任务是在**当前这台电脑**上,为 ZCode 自动安装一套 Houdini AI 增强工具链,包括:Houdini MCP server、LLM 可调用的 skill、本地知识库、以及 ZCode 的 MCP 配置。

# 硬性约束(必须遵守)

1. **分阶段执行,每阶段结束必须暂停,等用户回复"继续"才进入下一阶段。** 不要一口气跑完。这是为了让你在出错时能及时修正,而不是把整个安装搞砸。
2. **每一步都用工具实际执行**(Bash/Read/Write/Edit),不要只给指令让用户手动点。用户说"很麻烦还记不住"——你的价值就是替他做。
3. **遇到环境异常先报告,不要自行猜**:Python 版本太新、Houdini 没装、gh 没登录、目录不存在等情况,停下来问用户怎么办,给 2-3 个选项。
4. **绝不覆盖用户已有的东西**:已存在的 skill 目录跳过、已存在的 `.mcp.json` 要合并而不是覆盖、已 clone 的仓库不要重新 clone。
5. **Windows + Git Bash 环境**:路径用正斜杠,涉及 `gh api` 时**路径参数不要以 `/` 开头**(MSYS 会把它当文件路径重写,用 `user/starred/xxx` 而不是 `/user/starred/xxx`)。
6. **每个阶段结束输出一句话总结** + 下一步要做什么,让用户知道进度。

# Phase 0:环境探测(必做,不可跳过)

在动手前,你必须先看清这台电脑的环境。执行以下探测,然后把结果整理成报告给用户:

```bash
# 1. 操作系统 + shell
uname -a
echo "SHELL: $SHELL"

# 2. Houdini 版本(可能装了多个)
ls -d "$USERPROFILE/Documents/houdini"* 2>/dev/null || ls -d ~/houdini* 2>/dev/null

# 3. Python
python --version 2>&1; python3 --version 2>&1
which python python3 2>/dev/null

# 4. uv(用于 capoomgit MCP)
which uv 2>/dev/null && uv --version 2>/dev/null || echo "uv 未安装"

# 5. gh CLI + 登录状态
which gh 2>/dev/null && gh auth status 2>&1 | head -5 || echo "gh 未安装"

# 6. pip(用于 fxhoudinimcp)
pip --version 2>&1 || pip3 --version 2>&1

# 7. ZCode skill 目录(确认 ZCode 装了)
ls -d "$USERPROFILE/.zcode/skills" 2>/dev/null || echo "未找到 .zcode/skills —— ZCode 可能未安装"

# 8. 是否已有本仓库(可能用户已在某处 clone 过)
find "$USERPROFILE" -maxdepth 4 -name "houdini-enhancement" -type d 2>/dev/null | head -3

# 9. 现有 .mcp.json(避免覆盖)
ls "$USERPROFILE/.zcode/.mcp.json" 2>/dev/null
# 项目级 .mcp.json 也查一下
find "$USERPROFILE" -maxdepth 5 -name ".mcp.json" 2>/dev/null | head -5
```

**探测报告模板**(整理后发给用户,然后停下等确认):

```
## 环境探测报告

- OS: [Windows/Linux/macOS + 版本]
- Shell: [bash/powershell]
- Houdini: [列出所有版本,推荐用最新的]
- Python: [版本号] ⚠️ [如果 >3.13,提示 mcp 包可能有兼容风险]
- uv: [已装/未装]
- gh: [已装+已登录/已装未登录/未装]
- pip: [已装/未装]
- ZCode skills 目录: [存在/不存在]
- 已有本仓库: [路径/无]
- 已有 .mcp.json: [路径+内容/无]

## 我的建议
- Houdini 目标版本: [选哪个]
- MCP 装: [capoomgit / fxhoudinimcp / 两个都装]
- Python 兼容性: [OK / 需要 fallback 到 3.12]

回复"继续"开始 Phase 1(获取资源)。
```

# Phase 1:获取资源(knowledge-base + mcp-servers)

如果 Phase 0 发现本仓库已存在且包含 `houdini-enhancement/`,跳到 Phase 2。
否则,选一个工作目录(默认 `$USERPROFILE/HoudiniAI` 或询问用户),clone 以下资源:

```bash
WORKDIR="$USERPROFILE/HoudiniAI"   # 或用户指定
mkdir -p "$WORKDIR/houdini-enhancement"/{knowledge-base,mcp-servers,docs}
cd "$WORKDIR/houdini-enhancement"

# 知识库(纯 markdown,直接喂 LLM)
cd knowledge-base
git clone --depth 1 https://github.com/rheadsh/audiovisual-production-skills.git
git clone --depth 1 --filter=blob:none --sparse https://github.com/ikrima/gamedevguide.git
cd gamedevguide && git sparse-checkout set docs/houdini && cd ..
git clone --depth 1 https://github.com/kiryha/Houdini.wiki.git
# 官方节点文档(435 个 txt,极适合 RAG)
git clone --depth 1 --filter=blob:none --sparse https://github.com/sideeffects/SideFXLabs.git
cd SideFXLabs && git sparse-checkout set help/nodes && cd ..

# MCP 源码
cd ../mcp-servers
git clone --depth 1 https://github.com/capoomgit/houdini-mcp.git
git clone --depth 1 https://github.com/healkeiser/fxhoudinimcp.git
```

**输出**:列出新 clone 的目录大小,确认完整。然后停下,等"继续"。

**如果没装 git**:停下问用户,不要尝试用 zip 下载(容易漏 submodule/大文件)。

# Phase 2:安装 skill 到 ZCode(最快见效)

把 rheadsh 的三个 Houdini skill 复制到 ZCode skills 目录。格式与 ZCode 原生 skill 完全兼容,直接复制即可:

```bash
SKILLS_DIR="$USERPROFILE/.zcode/skills"
SRC="$WORKDIR/houdini-enhancement/knowledge-base/audiovisual-production-skills"

for skill in hou-python hou-vex hou-rs; do
  if [ -d "$SKILLS_DIR/$skill" ]; then
    echo "跳过 $skill(已存在,避免覆盖你的定制)"
    continue
  fi
  cp -r "$SRC/$skill" "$SKILLS_DIR/$skill"
  rm -rf "$SKILLS_DIR/$skill/.git" 2>/dev/null
  echo "✅ $skill"
done

# 验证(注意:Windows Git Bash 的 find 可能有路径 bug,优先用 ls)
ls "$SKILLS_DIR/" | grep -i "^hou-"
```

**输出**:确认 3 个 skill 就位。提示用户"重启 ZCode 后这些 skill 才生效"。然后停下,等"继续"。

# Phase 3:部署 Houdini MCP 插件

**前置确认**:Houdini 必须能打开。这一步只部署文件,不需要 Houdini 运行。

## 3a. capoomgit/houdini-mcp(主力,必装)

```bash
# 用 Phase 0 选定的 Houdini 版本,例如 houdini22.0
HOUVER="houdini22.0"   # ← 根据探测结果调整
HOUPREF="$USERPROFILE/Documents/$HOUVER"
mkdir -p "$HOUPREF/scripts/python/houdinimcp"

SRCDIR="$WORKDIR/houdini-enhancement/mcp-servers/houdini-mcp"
for f in __init__.py server.py houdini_mcp_server.py pyproject.toml shelf_tool_start_mcp.py shelf_tool_stop_mcp.py; do
  [ -f "$SRCDIR/$f" ] && cp "$SRCDIR/$f" "$HOUPREF/scripts/python/houdinimcp/"
done
```

## 3b. fxhoudinimcp(补充,可选)

```bash
# 装 PyPI 包
pip install fxhoudinimcp   # 如果失败,提示用户检查 Python 版本

# 部署 Houdini package
mkdir -p "$HOUPREF/packages"
SRCDIR="$WORKDIR/houdini-enhancement/mcp-servers/fxhoudinimcp"
cp "$SRCDIR/houdini/fxhoudinimcp.json" "$HOUPREF/packages/"

# 编辑 JSON 把 FXHOUDINIMCP 指向 clone 的 houdini 子目录
# 用 sed 或 Edit 工具替换路径占位符
```

**输出**:列部署的文件。告诉用户"接下来需要你在 Houdini 里启动 server(见 Phase 4)"。然后停下,等"继续"。

# Phase 4:配置 ZCode 的 .mcp.json

**重要**:`.mcp.json` 可以放在两个位置,问用户选哪个:
- **用户级**:`~/.zcode/.mcp.json`(全局,所有项目可用)
- **项目级**:`<项目根>/.mcp.json`(只在该项目生效)

**如果文件已存在,必须合并,不能覆盖。** 先 Read 现有内容,解析 JSON,把新的 `mcpServers` key 合并进去。

```json
{
  "mcpServers": {
    "houdini": {
      "command": "uv",
      "args": [
        "run",
        "--directory",
        "C:/Users/USERNAME/Documents/houdini22.0/scripts/python/houdinimcp",
        "python",
        "houdini_mcp_server.py"
      ]
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

**注意**:`USERNAME` 和 `houdini22.0` 要替换成这台电脑的实际值。路径用正斜杠。

**输出**:展示最终合并后的 `.mcp.json`。告诉用户:
1. 重启 ZCode
2. 打开 Houdini,在 Shelf 上创建 Toggle MCP 按钮(或 Python Shell 跑 `import houdinimcp; houdinimcp.start_server()`)
3. 看到 "started on localhost:9876" 后,在 ZCode 测试

然后停下,等"继续"。

# Phase 5:验证清单

告诉用户依次在 ZCode 里问 agent 这些,确认闭环:

- [ ] "列出当前 Houdini 场景所有节点"(基础连接)
- [ ] "创建一个 torus 节点,rows=20,cols=40"(节点+参数)
- [ ] "在 point wrangle 写 VEX:按法线给点上色"(VEX 编译反馈)
- [ ] "搜索 Houdini 文档里 'volume' 的节点"(fxhoudinimcp 独有的 search_help)
- [ ] "undo 上一步"(capoomgit 独有的 undo group)

每条通过就让用户在 Houdini 视口确认有变化。

**全部通过 → 安装完成。** 输出总结:装了什么、在哪、怎么用。

# 常见错误处理预案

遇到这些情况,**停下来报告 + 给选项**,不要瞎试:

| 症状 | 可能原因 | 给用户的选项 |
|---|---|---|
| Phase 0: Python > 3.13 | mcp 包兼容性 | A) 装 Python 3.12 并用它 B) 强行试 3.14 出错再说 |
| Phase 0: uv 未装 | — | A) 我帮你装 uv B) 跳过 capoomgit 只装 fxhoudinimcp |
| Phase 0: gh 未登录 | 无法 star | A) 跳过 star 步骤 B) 指导登录 |
| Phase 1: git clone 慢/失败 | 网络 | A) 换 gitee 镜像 B) 用 zip 下载 C) 配代理 |
| Phase 3: fxhoudinimcp pip 装失败 | Python 版本 | A) 用 Python 3.12 装 B) 从源码 `pip install -e .` |
| Phase 4: .mcp.json 已有其他 server | 不能覆盖 | 用 Read+Edit 合并,展示 diff 给用户确认 |
| Phase 5: MCP 连接失败 | Houdini 没起 server | 让用户在 Houdini Python Shell 跑 `import houdinimcp; houdinimcp.start_server()` |

# 完成标准

全部满足才算成功:
1. ✅ 3 个 skill 在 `~/.zcode/skills/`(hou-python/hou-vex/hou-rs)
2. ✅ 知识库 clone 在工作目录(knowledge-base/ 4 个子目录)
3. ✅ MCP 源码 clone(mcp-servers/ 2 个子目录)
4. ✅ Houdini 插件文件部署到 `$HOUPREF/scripts/python/houdinimcp/`
5. ✅ `.mcp.json` 配置好(合并而非覆盖)
6. ✅ Phase 5 至少前 2 条验证通过

---

## 使用方法(这段不用复制给 agent)

### 在新电脑上怎么用

1. **新电脑装好 ZCode + Houdini + git**(基础前置)
2. 打开 ZCode,新开一个对话
3. **把上面 `---` 之间的整段 prompt 复制粘贴**给 ZCode
4. agent 会进 Phase 0 探测,你看报告,回"继续"
5. 每个阶段结束都回"继续",直到 Phase 5 验证

### 进阶:一键调用

如果嫌每次复制长,可以把这段 prompt 存成一个文件,在 ZCode 里用 `@` 引用:
```
@houdini-enhancement/docs/SETUP-PROMPT.md 帮我执行这个安装流程
```
(前提是先把本仓库同步到新电脑,或者把这一个 md 文件拷过去)

### 跨 agent 复用

这个 prompt 不绑死 ZCode,也适用于:
- Claude Code(把 `.zcode/skills` 换成 `~/.claude/skills`,`.mcp.json` 格式相同)
- Cursor(`.cursor/mcp.json`,格式略不同需 agent 适配)
- 任何支持 Bash + Read + Write + Edit 的 agent

### 更新维护

- **改了 INSTALL-guide.md 不用改这个 prompt**——prompt 只做编排,细节让 agent 读文档
- **新增 MCP / skill**:在对应 Phase 里加一段
- **遇到新坑**:加到【常见错误处理预案】表
