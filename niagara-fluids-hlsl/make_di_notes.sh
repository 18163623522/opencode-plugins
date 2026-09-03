#!/bin/bash
# =============================================================================
# make_di_notes.sh — 从 UE5.7_DI_signatures.md 生成六篇分类详表笔记（Obsidian）
#
# 用法:   bash make_di_notes.sh <签名表文件> <输出目录>
# 产物:   A-网格与场 / B-渲染缓冲与纹理 / C-网格资产采样 / D-相机碰撞与环境
#         / E-数据输入 / F-粒子信息与工具 六篇 md（每 DI 一节、每函数一行）
#
# 行级清洗规则（对生成的表行做）:
#   类型归一: Int/Float/Bool→int/float/bool, Vec2/3/4→float2/3/4, Position/Quat→小写
#   属性列重建: E→E, G✗→仅CPU, C✗→仅GPU, 组合用 · 连接，空→—
#   去噪: 尾部悬空 ", ?" 参数、ParticleRead 名字尾部 Function、⏵ 动态名特殊改名
# 特例注入（自动解析不出来的动态命名族，硬编码手工表）:
#   GBuffer（Decode+14属性）、Array 家族、Grid Reader 继承说明
# =============================================================================
set -e
SIG="$1"; OUTDIR="$2"
mkdir -p "$OUTDIR"
VAULT_NOTE_PREFIX="DI函数面详表"   # 输出文件名前缀

# ---------- 行处理函数：清洗一行表数据 ----------
clean_row() {
  awk -F'|' -v DESCFILE="$(dirname "$(readlink -f "$0")")/desc_overrides.txt" '
  BEGIN {
    # 载入手工中文注释覆盖表：源码无官方描述时按 精确名→最长前缀 匹配补齐
    if (DESCFILE != "") while ((getline line < DESCFILE) > 0) {
      split(line, a, "\t")
      if (a[1] != "" && a[2] != "") rules[a[1]]=a[2]
    }
  }
  {
    name=$2; inn=$3; out=$4; fl=$5; desc=$6
    # 去首尾空白
    gsub(/^ +| +$/, "", name); gsub(/^ +| +$/, "", inn); gsub(/^ +| +$/, "", out); gsub(/^ +| +$/, "", fl); gsub(/^ +| +$/, "", desc)
    # ParticleRead 等常量尾巴
    if (name ~ /Function$/) sub(/Function$/, "", name)
    # 尾部悬空动态参数
    gsub(/, \? *$/, "", inn); gsub(/, \? *$/, "", out)
    # 类型归一（带空格边界；行首/行尾单独处理）
    split("Int int Float float Bool bool Vec2 float2 Vec3 float3 Vec4 float4 Position position Quat quat", m, " ")
    for (i=1; i in m; i+=2) {
      inn=prefix_type(inn, m[i], m[i+1]); out=prefix_type(out, m[i], m[i+1])
    }
    # 属性列重建
    f=""
    if (fl ~ /E/) f="E"
    if (fl ~ /G✗/) f=f (f==""?"":"·") "仅CPU"
    if (fl ~ /C✗/) f=f (f==""?"":"·") "仅GPU"
    if (f=="") f="—"
    # 说明列：优先源码官方 LOCTEXT 描述；无则查手工覆盖表（精确名 → 最长前缀）
    if (desc=="" || desc=="—") {
      if (name in rules) desc=rules[name]
      else {
        best=""; bl=0
        for (k in rules) if (index(name, k)==1 && length(k)>bl) { best=k; bl=length(k) }
        if (best!="") desc=rules[best]
      }
    }
    gsub(/\t/, " ", desc); gsub(/ +/, " ", desc); gsub(/\|/, "／", desc)
    if (length(desc) > 260) desc=substr(desc, 1, 260) "…"
    printf "| %s | %s | %s | %s | %s |\n", name, (inn==""?"—":inn), (out==""?"—":out), f, (desc==""?"—":desc)
  }
  function prefix_type(s, from, to) {
    gsub(" " from " ", " " to " ", s)              # 中段
    if (index(s, from " ")==1) s=to substr(s, length(from)+1)  # 行首
    gsub(" " from "$", " " to, s)                  # 行尾
    return s
  }'
}

# ---------- 把一个 DI 的小节从签名表里抽出来，清洗后输出 ----------
emit_di() {
  local di="$1"
  awk -v di="$di" '
    $0=="@@@ "di { grab=1; next }
    /^@@@ / { grab=0 }
    grab && /^\|/ { print }
  ' "$SIG" | clean_row
}

# ---------- 写一篇笔记 ----------
# 用法: write_note <文件名后缀> <标题> <引言> <DI名...>
write_note() {
  local suffix="$1" title="$2" intro="$3"; shift 3
  local f="$OUTDIR/${VAULT_NOTE_PREFIX}${suffix}.md"
  {
    echo "---"
    echo "title: ${title}"
    echo "created: 2026-09-03 00:00"
    echo "source: 引擎源码 GetFunctions 签名构造自动解析（UE5.7）"
    echo "tags:"
    echo "  - Niagara"
    echo "  - DataInterface"
    echo "  - 速查"
    echo "---"
    echo
    echo "# ${title}"
    echo
    echo "> 《[[Niagara Data Interface 全目录函数面速查]]》分类详表之一。"
    echo "> 列含义：输入/输出为源码签名（\`DI\`=自身句柄，点调用时不传；\`—\`=签名经辅助函数构造，看节点面板）；属性 \`E\`=需 Exec 引脚（非纯函数）、\`仅CPU\`/\`仅GPU\`=模拟目标限制；**说明 = 源码官方 LOCTEXT 描述原文（英文，讲作用与用法要点）**，\`—\`=源码未提供。循环生成的同族签名个别行属性可能继承模板行，以节点警告为准。"
    echo
    echo "$intro"
    echo
    for di in "$@"; do
      echo "## ${di}"
      echo
      case "$di" in
        # ---- 特例：动态命名族的手工表 ----
        GBuffer)
          echo '统一签名：`(float2 ScreenUV, bool ApplyViewportOffset=true) → (bool IsValid, 属性值)`，函数名 = **Decode + 属性名**，全部仅 GPU（内容资产另暴露 `引脚名_VelocityTexture/Sampler` 直接采样与引擎 `GetGBufferData(ScreenUV)` 后门）。'
          echo
          echo '| 函数 | 输出类型 | 说明 |'
          echo '|---|---|---|'
          echo '| DecodeDiffuseColor | float3 | 漫反射色 |'
          echo '| DecodeWorldNormal | float3 | 世界法线 |'
          echo '| DecodeScreenVelocity | float3 | 屏幕空间速度（UV 域、每帧值） |'
          echo '| DecodeWorldVelocity | float3 | 世界速度估计（重建、不精确） |'
          echo '| DecodeBaseColor | float3 | |'
          echo '| DecodeMetallic / DecodeSpecular / DecodeRoughness | float | PBR 标量 |'
          echo '| DecodeDepth / DecodePartialDepth / DecodeCustomDepth | float | 深度族 |'
          echo '| DecodeCustomStencil | int | 自定义模板 |'
          echo '| DecodeSceneColor | float4 | 场景色（不含半透明，PostOpaque 时机） |'
          echo '| DecodeShadingModelID | int | 着色模型 |'
          ;;
        ArrayDistrib)
          echo '| 函数 | 说明 |'
          echo '|---|---|'
          echo '| SetArrayElem | 按索引写（资产实证；读为 Get，编辑器亦显示 GetArrayElem） |'
          echo '| Get | 按索引读 |'
          echo '| Add / Resize | 追加 / 定容 |'
          echo '| Length / LastIndex / IsValidIndex | 规模查询 |'
          echo '| Clear / RemoveLastElem | 清空 / 弹尾 |'
          echo '| AtomicAdd / AtomicMax / AtomicMin | GPU 原子操作（float/int 类型数组） |'
          echo
          echo '类型变体：ArrayFloat / ArrayInt / ArrayNiagaraID / ArrayMesh / ArrayDistributionInt（GetRandomValue / GetProbabilityAlias）。'
          ;;
        Grid2DCollectionReader|Grid3DCollectionReader)
          echo "无自有函数常量——**继承对应 Collection 的完整读表面**（去掉所有 Set*/Clear* 等写函数），见上/下一篇的 Collection 表。"
          ;;
        *)
          echo '| 函数 | 输入 | 输出 | 属性 | 说明 |'
          echo '|---|---|---|---|---|'
          emit_di "$di"
          ;;
      esac
      echo
    done
  } > "$f"
  echo "生成: $f"
}

# ---------- 六篇分类 ----------
write_note "A-网格与场" "DI 函数面详表 A · 网格与场" \
"Grid2D/3D Collection 的坐标体系、双缓冲语义、邻居遍历模板与官方实例见 [[Niagara Grid2D 与 Fluids 官方 HLSL 调用手册]]；本篇只放函数签名表。RW 节是 Grid2D/3D 共同继承的坐标换算基类函数。" \
"Grid2DCollection" "Grid2DCollectionReader" "Grid3DCollection" "Grid3DCollectionReader" "RasterizationGrid3D" "NeighborGrid3D" "RW" "VectorField" "CurlNoise" "VolumeCache"

write_note "B-渲染缓冲与纹理" "DI 函数面详表 B · 渲染缓冲与纹理" \
"RenderTarget 四兄弟（2D/2DArray/Cube/Volume）函数面一致，仅维度不同；IntRenderTarget2D 是整数版且带原子操作。GBuffer 的属性表为手工核对（函数名动态生成）。" \
"GBuffer" "RenderTarget2D" "RenderTarget2DArray" "RenderTargetCube" "RenderTargetVolume" "IntRenderTarget2D" "SceneCapture2D" "Texture" "2DArrayTexture" "CubeTexture" "VolumeTexture" "SparseVolumeTexture" "VirtualTextureSample" "VirtualTexture" "Landscape"

write_note "C-网格资产采样" "DI 函数面详表 C · 网格资产采样" \
"StaticMesh/SkeletalMesh 命名规律：前缀（Random/Get/IsValid）× 修饰（Filtered/Unfiltered/Skinned）× 空间（本地/WS）× 帧插值（Interpolated）。SkeletalMesh 的三套采样面在 ·BoneSampling/·TriangleSampling/·VertexSampling 三节；SkeletalMeshConnectivity 与 StaticMeshUvMapping 函数面动态构造（见节点）。" \
"StaticMesh" "SkeletalMesh" "SkeletalMesh·BoneSampling" "SkeletalMesh·TriangleSampling" "SkeletalMesh·VertexSampling" "RigidMeshCollisionQuery" "PhysicsAsset" "DynamicMesh" "SocketReader"

write_note "D-相机碰撞与环境" "DI 函数面详表 D · 相机、碰撞与环境查询" \
"GPU 查询族（Camera GPU 变体 / CollisionQuery 的 Query*GPU / AsyncGpuTrace）全部仅 GPU；CPU 查询（Sync/AsyncCPU、AudioPlayer 类）全部仅 CPU——跨模拟目标时会静默失效，注意 Emitter 的 Sim Target。" \
"Camera" "CollisionQuery" "AsyncGpuTrace" "Occlusion" "ActorComponent" "UObjectPropertyReader"

write_note "E-数据输入" "DI 函数面详表 E · 数据输入（NDC/数组/曲线/表/样条/音频）" \
"NDC 的 Read/Consume/Append 输入输出里的"变量"按你在图上绑定的 NDC 变量展开（RequiredInputs/Outputs 机制），SpawnDirect/ScaleSpawnCount 需 <VarName=\"x\", VarType=\"Float\">。Array 家族为描述键反推（特例表）。" \
"DataChannelRead" "DataChannelWrite" "ArrayDistrib" "ArrayDistributionInt" "Curve" "ColorCurve" "VectorCurve" "Vector2DCurve" "Vector4Curve" "DataTable" "Spline" "AudioPlayer" "AudioSpectrum" "AudioOscilloscope"

# ---- E 篇追加：NDC 游戏侧/蓝图/C++ 补全（自动解析覆盖不到的部分）----
cat >> "$OUTDIR/${VAULT_NOTE_PREFIX}E-数据输入.md" <<'NDCEOF'

## NDC 游戏侧与蓝图 API 补全（上面 DI 表只覆盖模拟侧）

**蓝图函数库 `UNiagaraDataChannelFunctionLibrary`（5.7 源码验证）**——多数函数标记 `BlueprintInternalUseOnly`，实际通过 **K2Node_ReadDataChannel / K2Node_WriteDataChannel** 蓝图节点使用（5.8 新增 `K2Node_DataChannel_WithContext` 上下文节点）：

| API | 说明 |
|---|---|
| WriteToNiagaraDataChannelSingle / WriteToNiagaraDataChannel(Batch) | 游戏侧写入；带 `bVisibleToBlueprint / bVisibleToNiagaraCPU / bVisibleToNiagaraGPU` 可见性、SearchParams、DebugSource（Legacy 后缀为旧版） |
| ReadFromNiagaraDataChannelSingle / (Batch) | 游戏侧读取；`bReadPreviousFrame` 可读上一帧 |
| GetDataChannelElementCount | 元素计数（可读上一帧） |
| SubscribeToNiagaraDataChannel / Unsubscribe | 订阅/退订 NDC 更新委托 |
| GetNiagaraDataChannel / FindDataChannelHandler | 按名取 NDC 资产 / 处理器 |
| CreateDataChannelReader / CreateDataChannelWriter | 创建读写句柄（WithContext 模式用） |
| MakeNDCAccessContextInstance / GetUsableAccessContextFromNDC(Ref) / GetMembers... / GetSingleProperty... | Access Context 系统（结构化上下文读写） |

**C++ 侧 `FNiagaraDataChannelAccessor`**：为 NDC 每个变量生成 `Read<Var>(Index, OutValue)` / `Write<Var>(Index, Value)`（宏展开），支持批量区间（StartIndex/Count）与 `bReadingPreviousFrame`；底层 `FNDIReader::ReadData / FNDIWriter::WriteData`，写完 `Cleanup()`。

**官方示例**：
- `NiagaraFluids/Content/DataChannels/NDC_FluidCollision.uasset`（5.8）——游戏写碰撞体（Position/Radius/Velocity），流体读去做碰撞；
- 5.8 引擎内置 C++ 演示 `NiagaraDataChannel_{GameplayBurst,Global,Islands,Map}.cpp`——GameplayBurst 把角色运动爆发按空间网格 cell 写入 NDC（含 int64 压缩 cell 坐标的手法，值得抄）；
- 流体 Gas 模板存在 `SplatDataChannelintoRasterGrid` 模拟阶段（NDC → 栅格桥接的官方管线证据）。

## NDC 运行时架构（5.8 源码验证）

- **`UNiagaraDataChannelAsset` 只是壳**：蓝图类型 "Niagara Data Channel"，内部 Instanced 挂一个 `UNiagaraDataChannel` 实例——**选通道类型就是选传输/管理策略**，换类型时编辑器会尝试拷贝同名属性。
- **`UNiagaraDataChannel` 基类设置**（已验证字段）：`bKeepPreviousFrameData`（保留上一帧数据——读侧 `bReadPreviousFrame` 的前提）、`bEnforceTickGroupReadWriteOrder`（跨 tick 组强制读写顺序）、`VersionGuid`（变量布局版本号；C++ Accessor 的 stale-layout 校验就是对它）。
- **引擎托管通道类型**（5.8 内置）：`_Global`（全局单例通道 + 专用 Handler）、`_Islands`（按岛屿/区域激活管理，自带 DebugDraw 调试绘制设置）、`_Map`（按地图条目管理）、`_GameplayBurst`（挂在角色组件上的运动爆发写入器，AttachmentSettings）。
- **`UNiagaraDataChannelHandler`**（UObject，蓝图可调）：`GetDataChannelWriter()` / `GetDataChannelReader()` 拿读写上下文；`SubscribeToDataChannelUpdates(_WithContext)` / `UnsubscribeFromDataChannelUpdates` 订阅新数据委托（仅对发布到 game thread 的数据生效，GPU-only 数据不触发）；底层对接 GPU dispatch。
- 5.8 另有 `FNiagaraDataChannelSimCacheVisualizer`（NDC 数据在 SimCache 中可视化）与 `NiagaraDataChannelDebugUtilities`（调试工具）。
- 注：5.8 Niagara 插件官方内容里**没有**现成的"写 NDC"模块——写侧要么用 DataChannelWrite DI 自建模块，要么走游戏侧 API。
NDCEOF

write_note "F-粒子信息与工具" "DI 函数面详表 F · 粒子信息与写出/调试工具" \
"ParticleRead 的 ByID/ByIndex 系列都带 <Attribute=\"...\"> 选择器，可读任意自定义粒子属性；DebugDraw 仅编辑器可见。" \
"ParticleRead" "MeshRendererInfo" "SpriteRendererInfo" "EmitterProperties" "Export" "SimCacheReader" "RenderTargetSimCacheData" "MemoryBuffer" "SimpleCounter" "DebugDraw" "MaterialInstanceDynamic" "MaterialParameterCollection" "ConsoleVariable" "PlatformSet"

echo "全部完成"
