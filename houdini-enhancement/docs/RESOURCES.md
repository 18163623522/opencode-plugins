# Houdini AI 增强资源总览

> 调研日期:2026-07-24。所有 stars / 维护状态均为实查。
> 本文档是 GLM 在 Houdini 方向的"能力地图",按用途分类。

---

## 一、MCP Server(让 LLM 实时控制 Houdini)

| 项目 | Stars | 端口 | 能力要点 | 推荐度 |
|---|---|---|---|---|
| **[capoomgit/houdini-mcp](https://github.com/capoomgit/houdini-mcp)** | 271 | TCP 9876 | 节点增删改、批量设参(did-you-mean)、VEX wrangle 即时编译、**整组 undo**、有测试 | ⭐⭐⭐⭐⭐ 首选 |
| **[healkeiser/fxhoudinimcp](https://github.com/healkeiser/fxhoudinimcp)** | 133 | HTTP 8100 | **179 工具**覆盖 22 类,内置 `search_help` 读官方文档压幻觉,USD/Solaris/TOPs/Render/VEX 全有 | ⭐⭐⭐⭐ 补充 |
| [oculairmedia/houdini-mcp](https://github.com/oculairmedia/houdini-mcp) | 41 | hrpyc 18811 | 基于官方 RPyC,远程/Docker 友好,scene diff | ⭐⭐⭐ 远程场景 |
| [dcc-mcp/dcc-mcp-houdini](https://github.com/dcc-mcp/dcc-mcp-houdini) | 6 | HTTP 9765 | 跨 DCC 统一框架(Maya/Blender/Houdini),Rust core,工程化最好但早期 | ⭐⭐ 观望 |

**⚠️ 避坑**:
- `capoom/houdini-mcp`(不带 git,59★,2025-03 停更)是**旧版**,要装 `capoomgit` 那个
- SideFX **官方没有 MCP**(官网的 "mcp" 是无关的视频转码 CLI)
- `Kazama-Suichiku/Houdini-Agent`(325★)是 standalone 产品,**不暴露 MCP 接口**,不符合需求

---

## 二、知识库(纯 markdown,直接喂 LLM)

### 第一梯队:必留本地(已 clone 到 `knowledge-base/`)

| 仓库 | 本地路径 | 价值 |
|---|---|---|
| **[rheadsh/audiovisual-production-skills](https://github.com/rheadsh/audiovisual-production-skills)** | `knowledge-base/audiovisual-production-skills/` | **模板最佳**。57 个 md 按 LLM 消费格式编排,基于 Houdini 21 校验。含 hou-python/hou-vex/hou-rs 三套 skill,可整段借鉴结构 |
| **[ikrima/gamedevguide](https://github.com/ikrima/gamedevguide)** (sparse: `docs/houdini/`) | `knowledge-base/gamedevguide/docs/houdini/` | **广度最全**。43 个 md 覆盖 basics/dops/vellum/volumes/rendering/techniques/extensibility 全栈,TA 视角百科 |
| **[kiryha/Houdini wiki](https://github.com/kiryha/Houdini.wiki)** | `knowledge-base/Houdini.wiki/` | **深度**。18 个 md 约 4 万字,VEX-for-artists(1 万字)、Python-for-artists、Pixar-USD-Python-API 是亮点 |

### 第二梯队:官方节点文档(已 sparse clone)

| 仓库 | 本地路径 | 说明 |
|---|---|---|
| **[sideeffects/SideFXLabs](https://github.com/sideeffects/SideFXLabs)** (sparse: `help/nodes/`) | `knowledge-base/SideFXLabs/help/nodes/` | **官方权威**。435 个 .txt 节点文档(sop 358/out 20/top 16/cop2 13/lop 9 等),每个文件独立小知识块,极适合 RAG |

### 第三梯队:可读 VEX 源码补充(未 clone,需要时再拉)

| 仓库 | Stars | 价值 |
|---|---|---|
| [Fe-Elf/FeELib-for-Houdini](https://github.com/Fe-Elf/FeELib-for-Houdini) | 270 | 81 个 `.vfl` VEX 源码 + 172 txt,中文作者 |

### ❌ 避免浪费时间的高 star 仓库(二进制 .hip,LLM 读不了)

- `jhorikawa/HoudiniHowtos`(1114★)— 287 个 .hiplc,需 Houdini 打开
- `jtomori/vex_tutorial`(754★)— 主文件是 .hipnc
- `MysteryPancake/Houdini-Fun`(251★)— 113 个 .hip

---

## 三、UE ↔ Houdini 管线

### 特效管线标准三件套

| 路径 | 用途 | 仓库 |
|---|---|---|
| **VAT(Vertex Animation Textures)** | 特效回放首选,纯 GPU shader | [sideeffects/SideFXLabs](https://github.com/sideeffects/SideFXLabs) 的 `vertex_animation_textures.3.x.hda` + UE 的 Create New VAT 向导 |
| **Alembic** | 复杂拓扑变化 | UE 原生支持,无需插件 |
| **HDA** | 程序化生成/迭代(非运行时特效) | [sideeffects/HoudiniEngineForUnreal](https://github.com/sideeffects/HoudiniEngineForUnreal) |

### 关键仓库

| 仓库 | Stars | 状态 | 说明 |
|---|---|---|---|
| **[sideeffects/HoudiniEngineForUnreal](https://github.com/sideeffects/HoudiniEngineForUnreal)** | 1585 | 活跃,2026-07 更新 | 官方插件,最新 v3.0.7 支持 UE5.0–5.7+Houdini 22.0,有 PCG 集成分支 |
| **[sideeffects/HoudiniNiagara](https://github.com/sideeffects/HoudiniNiagara)** | 373 | — | 官方:Houdini→UE Niagara 数据接口 |
| [sideeffects/SideFXLabs](https://github.com/sideeffects/SideFXLabs) | 1212 | 日更 | VAT 烘焙 ROP 的真正出处,`unreal/` 下有 4.24–5.8 每个版本预编译插件 |
| [AdrianPanGithub/HoudiniEngineForUnreal](https://github.com/AdrianPanGithub/HoudiniEngineForUnreal) | 134 | 活跃 | 官方插件重写版,声称 I/O 快 2-15x,适合大规模程序化 |
| [AdrianPanGithub/HoudiniPCGTranslator](https://github.com/AdrianPanGithub/HoudiniPCGTranslator) | 70 | — | UE PCG ⇋ Houdini 桥接,做散布类特效有用 |

### ⚠️ HoudiniEngineForUnreal 版本配对坑

- 插件版本**必须**和 Houdini 版本精确对应,装错会"不 cook 不报错"
- 在 UE 的 `HoudiniEngine > Installation info` 面板核对版本
- UE5.4/5.5/5.6/5.7 均官方支持;UE5.8 用源码 5.0 分支或 HEAD
- Landscape bake 用最新版(有 GC 修复)

---

## 四、AI 驱动管线的现状与机会

**现状:`unreal-mcp` 完全不支持 Houdini/HDA 操作。**
- `chongdashu/unreal-mcp`(2040★)、`flopperam/unreal-engine-mcp`(1064★)等主流 unreal-mcp 都没有 Houdini 集成

**当前最佳实践(分治 + 文件桥接):**
```
GLM ─houdini-mcp─▶ Houdini 烘焙 VAT/abc ──文件──▶ unreal-mcp ─▶ UE 导入放置
```

**机会点**:如果以后要打通,可以自己在 unreal-mcp 上加 HDA 操作工具(空白领域)。

---

## 五、你之前已 star 的额外发现(本轮调研意外收获)

你 GitHub 上早就 star 过这些,值得我留意:

| 仓库 | 说明 |
|---|---|
| `innogames/IG-VFX-Houdini-Tools` | InnoGames 的 VFX 工具 |
| `sideshowroberto/vfx-agent-toolkit` | VFX agent 工具 |
| `zhangxiao6776/houdini-skills-for-share` | **中文社区 Houdini skills**,可能值得参考其结构 |
| `loopmaster303/houdini-ai-tool` | Houdini AI 工具 |
| `skothr/houdini-plugin` | — |

---

## 六、本地目录结构

```
D:/001_Archive/AI/houdini-enhancement/
├── docs/                          # 本文档 + 安装指南(跟踪进 git)
│   ├── RESOURCES.md               # 你正在看的
│   └── INSTALL-guide.md           # MCP 安装指南
├── knowledge-base/                # 知识库(.gitignore 忽略,本地用)
│   ├── audiovisual-production-skills/
│   ├── gamedevguide/docs/houdini/
│   ├── Houdini.wiki/
│   └── SideFXLabs/help/nodes/
└── mcp-servers/                   # MCP 源码(.gitignore 忽略,本地用)
    ├── houdini-mcp/               # capoomgit
    └── fxhoudinimcp/              # healkeiser
```

> `knowledge-base/` 和 `mcp-servers/` 故意不入库(体积大、是上游仓库 clone),只跟踪我们自己的 `docs/`。
