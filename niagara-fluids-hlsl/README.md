# Niagara Fluids 官方 HLSL 提取库（分引擎版本）

> 提取日期：2026-09-03。来源：本机 6 套引擎（4.26.2 / 5.3 / 5.4 / 5.6 / 5.7.4 / 5.8）自带的 NiagaraFluids 插件内容资产 + Niagara 插件源码。
> 方法：直接从 .uasset 二进制中抽取可打印字符串里的 HLSL 代码行（Niagara 的 Custom HLSL / HLSL Graph 以明文存储在资产内），再用源码（FName 常量表 + GetFunctionHLSL 生成模板 + GPU 模板 .ush）交叉核验函数名与签名。

## 目录结构

```
niagara-fluids-hlsl/
├── README.md            ← 本手册
├── raw_parts/<版本>/     ← 全内容提取原文分卷（≤8MB/卷，小节不跨卷；由 split_raw.sh 从 raw/ 切出并字节级校验；
│                             原始单文件可用 extract_version.sh 重新生成）
├── split/<版本>/         ← 按资产拆分的独立 .hlsl 文件（路径中 / 换成 __）
├── inv/<版本>_dicalls.txt      ← DI 函数调用频次统计（排除命名空间访问）
├── inv/<版本>_calls_unique.txt ← 全部独特点调用清单（含 <Attribute="..."> 模板）
├── inv/<版本>_all_DI_functions.txt ← 全部 75 个 DI 家族的函数名面（extract_all_di.sh）
├── inv/UE5.7_DI_signatures.md ← 66 DI / 654 函数的签名+官方描述表（extract_di_signatures.sh）
├── desc_overrides.txt         ← 手工中文注释规则表（make_di_notes.sh 用，官方描述优先）
├── extract_version.sh / analyze.sh / split_all.sh / extract_all_di.sh / extract_di_signatures.sh / make_di_notes.sh  ← 可复用脚本
```

版本覆盖：UE5.3 / UE5.4 / UE5.6 / UE5.7 / UE5.8 全内容；UE4.26 无 NiagaraFluids 内容（该插件内容目录为空，仅有源码级函数面）。

---

## 1. Custom HLSL 调用 DI 的语法（4.26 与 5.x 通用）

```hlsl
DI输入引脚名.函数名<Specifier="值">(参数);
// 常见形式：属性选择器
MyGrid.GetPreviousFloatValue<Attribute="Pressure">(X, Y, OutVal);
MyGrid.SamplePreviousGridVector2DValue<Attribute="Velocity">(float2 Unit, OutVel);
```

- Custom HLSL 节点必须把 DI 作为**输入引脚**接入，引脚名 = 调用前缀。
- 函数无返回值，输出一律 `out` 参数；`Set*Value` / `Interlocked*` 尾部有一个 `out int IGNORE` 之类占位输出。
- 编译器按 `引脚名.函数名` token 扫描识别调用（证据：4.26 `NiagaraNodeCustomHlsl.cpp:136` 注释、5.7 `CallsImpureDataInterfaceFunctions()` 拼接逻辑）。
- 生成后的真实函数名形如 `GetPreviousVector4Value_Emitter_Grid2DCollection_AttributeRGBA`（函数名_DI符号_属性名），需要看生成的 HLSL dump 时按此模式找。

## 2. Grid2D Collection（2D 网格，Texture2DArray 双缓冲）

坐标体系三层：**整数格坐标 (IndexX, IndexY)** ↔ **单位坐标 Unit (0~1)** ↔ **世界/模拟坐标**。读写按整数格，采样按单位坐标。

### 2.1 值读写（按格坐标）
| 调用 | 说明 |
|---|---|
| `GetPreviousFloatValue<Attribute="A">(X,Y,out v)` | 读**上一帧**；Vector2D/Vector3(旧名 Vector)/Vector4 同理 |
| `SetFloatValue<Attribute="A">(X,Y,v)` | 写**当前帧**；SetVector2DValue/SetVector3Value(旧名 SetVectorValue)/SetVector4Value |
| `GetGridValue(X,Y,AttrIndex,out v)` | 按属性**索引**读（配合 GetFloatAttributeIndex，或矢量分量偏移） |
| `SetGridValue(X,Y,AttrIndex,v, out IGNORE)` | 按索引写 |
| `SetValueAtIndex / GetPreviousValueAtIndex` | (5.x) 与上同族的 AtIndex 别名 |

### 2.2 采样（按 0~1 单位坐标，自动双线性/三次）
| 调用 | 说明 |
|---|---|
| `SampleGridFloatValue<Attribute="A">(float2 Unit, out v)` | 双线性，当前帧 |
| `SamplePreviousGridFloatValue<Attribute="A">(float2 Unit, out v)` | 双线性，上一帧（Vector2D/3/4 同理） |
| `CubicSamplePreviousGridFloatValue<Attribute="A">(Unit, out v)` | 单调三次插值（5.x） |
| `SamplePreviousGridAtIndex / CubicSamplePreviousGridAtIndex` | 按属性索引采上一帧（5.x） |

### 2.3 坐标与网格信息（继承自 RW 基类，Grid2D/3D 通用）
| 调用 | 说明 |
|---|---|
| `ExecutionIndexToGridIndex(out X, out Y)` | **模拟阶段里取当前 cell 坐标**（最常用） |
| `ExecutionIndexToUnit(out Unit)` | 当前执行单元 → 单位坐标 |
| `GetNumCells(out int2)` / `GetCellSize(out float2)` / `GetWorldBBoxSize(out float2)` | 网格规模 |
| `IndexToUnit(X,Y,out Unit)` / `UnitToIndex(Unit,out X,out Y)` / `UnitToFloatIndex` | 格 ↔ 单位 |
| `SimulationToUnit(World,out Unit)` / `UnitToSimulation(Unit,out World)` | 世界 ↔ 单位 |
| `IndexToLinear(X,Y,out Idx)` / `LinearToIndex(Idx,out X,out Y)` | ↔ 线性索引 |
| `IndexToUnitStaggeredX / IndexToUnitStaggeredY` | 交错网格（MAC）半格偏移 |

### 2.4 工具
`ClearCell(X,Y)`；`CopyPreviousToCurrentForCell(X,Y)`（把上一帧拷入当前帧，跳过重算时用）；`GetFloatAttributeIndex / GetVectorAttributeIndex / GetVector2DAttributeIndex / GetVector4AttributeIndex`（查属性索引，配合 GetGridValue/分量偏移）。

### 2.5 双缓冲语义（源码级验证）
- 5.x：所有 `Get*/Sample*` 走 `_Grid` 贴图 = **上一帧**；所有 `Set*` 写 `_OutputGrid` UAV = **当前帧**。同一 stage 内"先读邻居再写自己"不会读到本帧被改的值。
- 4.26：无 `GetPrevious* / SamplePreviousGrid* / Cubic*` 家族（已 grep 源码确认）。跨帧读靠 map 属性连线语义 + `SampleGrid*Value`，读写分离要靠多 Simulation Stage。

### 2.6 直接纹理访问（引擎生成符号，Fluids 大量使用）
```hlsl
Emitter_SimGrid_Grid.Load(int4(X, Y, AttributeIndex, 0));        // Grid2D Collection → Texture2DArray
Emitter_SimRT_Texture.Load(...); Emitter_SimRT_Texture.SampleLevel(...); // RW Texture DI
```
命名规则：DI 参数全名中的 `.` 换成 `_` + `_Grid`/`_Texture` 后缀。属于引擎内部约定（非正式 API），版本升级可能变。

## 3. Grid3D Collection（3D 体素，Texture3D）

函数面是 Grid2D 超集（5.7 全表已核验），除坐标多一维外新增：
- `Set/Get FullGridValue / GetFullGridPreviousValue / SamplePreviousFullGrid / CubicSamplePreviousFullGrid`：整网格（全属性）读写，用于整帧拷贝/处理。
- `CopyMaskedPreviousToCurrentForCell`：按掩码拷贝。
- 各类型 `AtIndex` 变体更全（SetVector2ValueAtIndex / GetPreviousVector4ValueAtIndex …）。
- 签名与 2D 同构：`(X, Y, Z, ...)`、采样传 `float3 Unit`。

## 4. RasterizationGrid3D（粒子 → 网格 splat 专用，带原子操作）

| 调用 | 说明 |
|---|---|
| `InterlockedAddFloatGridValue(X,Y,Z,AttrIdx,v, out IGNORE)` | 原子加 |
| `InterlockedAddFloatGridValueSafe(...)` | 越界安全的原子加 |
| `InterlockedMaxFloatGridValue / InterlockedMinFloatGridValue` | 原子最值 |
| `InterlockedAddIntGridValue` | 整数原子加 |
| `GetFloatGridValue / GetIntGridValue / SetFloatGridValue / SetIntGridValue` | 平凡读写 |
| `SetFloatResetValue / SetNumAttributes / SetNumCells / FloatToInt / IntToFloat` | 配置与换算 |

注意：**Interlocked* 在 Grid2D/3D Collection 上没有**（已核验源码），只在 RasterizationGrid3D 上。官方 splat 模块（含拖尾 streaking）就是用 `CompMode>0 ? InterlockedMax : InterlockedAdd` 实现的。

## 5. NeighborGrid3D + ParticleRead（邻居查询黄金组合）

```hlsl
// NeighborGrid3D 函数面：AddParticle / SetParticleNeighbor / GetParticleNeighbor /
//   GetParticleNeighborCount / SetParticleNeighborCount / NeighborGridIndexToLinear / MaxNeighborsPerCell
int3 IndexToUse;
NeighborGrid.UnitToIndex(float3(Unit,0), IndexToUse.x, IndexToUse.y, IndexToUse.z);
int MaxN; NeighborGrid.MaxNeighborsPerCell(MaxN);
for (int i = 0; i < MaxN; ++i) {
    int NeighborLinearIndex;
    NeighborGrid.NeighborGridIndexToLinear(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, NeighborLinearIndex);
    int CurrIdx;
    NeighborGrid.GetParticleNeighbor(NeighborLinearIndex, CurrIdx);
    if (CurrIdx >= 0) {
        bool Valid;
        float3 ParticlePos;
        ParticleReader.GetVectorByIndex<Attribute="Position">(CurrIdx, Valid, ParticlePos);
        float Radius;
        ParticleReader.GetFloatByIndex<Attribute="fluids_source_radius">(CurrIdx, Valid, Radius);
        // ... 逐邻居处理
    }
}
```
ParticleRead DI：`GetInt/Bool/Float/Vector2/Vector3(=Vector)/Vector4/Position/Color ByIndex<Attribute="名字">(Idx, out bool Valid, out T Val)`，另有 `GetLocalSpace`。Attribute 不仅可以是内建（Position/Velocity/SpriteSize...），也能是**任意用户自定义粒子属性**（上例 fluids_source_* 系列）。

## 6. NDC 数据通道（Niagara Data Channels，UE5 专属，4.26 无）

### 6.1 函数面（源码级，按版本）
| | UE5.3 | UE5.7 / UE5.8 |
|---|---|---|
| Read 侧 | Num, Read, Consume, SpawnConditional, SpawnFromSpawnInfo | Num, Read, Consume, SpawnConditional, **SpawnDirect**, **ScaleSpawnCount**, **GetNDCSpawnData** |
| Write 侧 | Num, Write, Append | Num, Write, Append（Allocate 源码中被禁用） |

- `Read(Index, out Success, {按 NDC 变量展开的输出...})`：读到的 NDC 变量按你绑定的输出展开；没有的变量给默认值。
- `Consume(out Success, out Index, {输出...})`：消费式读取（读完即删，每项只被一个实例拿到）。
- `Append(Emit, {输入...}, out Success)`：追加写入（GPU 可用）。
- `Write(Emit, Index, {输入...}, out Success)`：**仅 CPU**（源码 `bSupportsGPU=false`，GPU 上所有 NDC DI 共享同一缓冲，不能按索引直写）。
- `SpawnDirect / ScaleSpawnCount` 用 `<VarName="x", VarType="Float">` 指定依据变量；GetNDCSpawnData 在粒子生成帧反查"我是哪条 NDC 生成的"。
- 引擎内容里 NDC 走图节点而非 Custom HLSL 点调用（扫描未发现实例）；模板 .ush 签名见 `Shaders/Private/DataChannel/NiagaraDataInterfaceDataChannelTemplate_*.ush`。

### 6.2 官方 NDC 资产范例
`NiagaraFluids/Content/DataChannels/NDC_FluidCollision.uasset`（5.8）：`NiagaraDataChannelAsset`，变量 = Position(NiagaraPosition) / Radius(NiagaraDouble) / Velocity(Vector)——游戏侧写入碰撞体数据、流体侧读取做碰撞的标准桥。5.3~5.7 在插件根有 `NDC_Grid3D_Gas.uasset` 同类。

## 7. 其他 DI 惯用法（均出自官方资产原文）

### 7.1 DebugDraw（调试绘制，编辑器可见）
全表：DrawBox / DrawCircle / DrawCone / DrawCoordinateSystem / DrawCylinder / DrawGrid2D / DrawGrid3D / DrawLine / DrawRectangle / DrawSphere / DrawTorus（各有 *Persistent 持久版）。
```hlsl
DebugDraw.DrawSphere(true, WorldParticleCenter, 1.0, 4, float4(1,0,0,1));
DebugDraw.DrawLine(true, CurrWorldPos, CurrWorldPos + normalize(FractionIntegral)*-50, float4(1,0,0,1));
```

### 7.2 其他
- 曲线：`SampleCurve(...)`；数组：`SetArrayElem(...)` / GetDimensions。
- 距离场：`GetClosestPointMeshDistanceFieldNoNormal` / `GetElementPointMeshDistanceFieldNoNormal`。
- LWC 大世界坐标帮助函数在 Custom HLSL 里可用：`LWCToFloat / LWCAdd / LWCGetTile / LWCSetTile / MakeLWCVector3`。
- HLSL Graph（5.3+ 文本图）风格：`Context.MapSimStage9_Sourcing.XXX`、`Context.Map_Get/Set...`——与经典 Custom HLSL 并存。

## 8. 官方片段精选（Grid2D 求解器模块，出自 Modules/Grid2D/）

**旋度（central difference，矢量分量偏移读法）：**
```hlsl
float Vy_right; Grid.GetGridValue(IndexX+1, IndexY, VectorIndex+1, Vy_right);
float Vy_left;  Grid.GetGridValue(IndexX-1, IndexY, VectorIndex+1, Vy_left);
float Vx_up;    Grid.GetGridValue(IndexX, IndexY+1, VectorIndex, Vx_up);
float Vx_down;  Grid.GetGridValue(IndexX, IndexY-1, VectorIndex, Vx_down);
curl = ((Vy_right-Vy_left) - (Vx_up-Vx_down)) / (2. * dx);
```
> `GetGridValue` + 属性索引+分量偏移 是官方读矢量分量的标准手法（VectorIndex 是向量属性基索引，+0/+1/+2 取分量）。

**浅水二次发射（邻居采样 + 曲率判定，出自 Functions/Grid2D/Grid2D_SW_ComputeSecondaryEmission）：**
```hlsl
int IndexX, IndexY;
NormalReader.ExecutionIndexToGridIndex(IndexX, IndexY);
NormalReader.IndexToUnit(IndexX, IndexY, UnitXY);
NormalReader.SamplePreviousGridVector3Value<Attribute="Normal">(UnitXY, Normal);
NormalReader.SamplePreviousGridVector3Value<Attribute="Normal">(UnitXY + float2(0,1)*UnitDX, Normal_up);
NormalReader.SamplePreviousGridVector3Value<Attribute="Normal">(UnitXY + float2(1,0)*UnitDX, Normal_right);
float Curvature = abs(((1.-dot(Normal,Normal_right)) + (1.-dot(Normal,Normal_up))) * .5);
```

## 9. 版本差异总表

### 9.1 官方 Fluids 资产中出现的独特 DI 调用数（去重后，仅函数级）
| UE5.3 | UE5.4 | UE5.6 | UE5.7 | UE5.8 |
|---|---|---|---|---|
| 93 | 109 | 123 | 130 | 136 |

资产数（含代码）：268 / 311 / 439 / 444 / 456。**跨版本无函数被移除，单调增长。**

### 9.2 逐版新增（inv/*_dicalls.txt 集合差）
- **5.3→5.4**：DrawLine/DrawSphere（调试绘制开始使用）、CubicSamplePreviousGridAtIndex、UnitToFloatIndex、GetClosestElement/GetClosestPointSimple（距离场）、ParticleRead 扩展（GetColorByIndex / GetQuaternionByIndex / PrevPosition / Scale）
- **5.4→5.6**：**GatherRed**（纹理 Gather）、LinearToIndex、SampleTexture2D / GetTextureDimensions（RW Texture DI）、DrawBox、FFT 求解器痕迹（`Set/GetFloatValue<Attribute="RealPart/ImaginaryPart">`，Grid2D ComputeFFT）
- **5.6→5.7**：Get/SampleRenderTargetValue（RenderTarget DI）、SetFixedBounds / SetMeshProperties / SetSectionCount / SetSectionData（水面程序化网格生成）
- **5.7→5.8**：**GetOutputGridFloatValue**（Grid3D 显式读当前帧输出网格）、**NeighborQuery 新 DI**（见 9.3）、GetPositionByID / GetPositionByIndex、UnitToCellCornerFloatIndex；（GetTextureDimensions 在 5.8 资产中不再出现）

### 9.3 UE5.8 新 DI：NeighborQuery（NiagaraDataInterfaceNeighborQuery.cpp）
`SetNumCells / MaxCellsPerParticle / AddParticle / AddParticleWithRadius / AddParticleToOverlappedCells / AddParticleToNeighborCells / GetParticleNeighborCount / GetParticleNeighbor / UnitToCellCornerFloatIndex`
—— NeighborGrid3D 的进化版：注册粒子时可选带半径、写重叠格或邻接格（对大半径粒子更省内存），流体资产已改用它。

### 9.4 其他
- **4.26**：无 Fluids 内容资产（插件内容目录为空）；Grid2D 无 Previous*/Cubic* 家族；无 NDC。
- **5.8**：新增 `Functions/General/ComputeSORRelaxation`（SOR 松弛求解器）、枚举 ENiagaraPNQAddMethod、M_WaterScreenSpace 材质、独立 DataChannels 目录（NDC_FluidCollision）。
- NDC 函数面：5.3 无 SpawnDirect / ScaleSpawnCount / GetNDCSpawnData；5.7/5.8 有（Write 依旧 CPU-only）。

## 10. 已验证 / 未验证

✅ 已验证（源码行级或资产原文级）：
- Custom HLSL DI 调用语法与编译器识别机制（4.26 `NiagaraNodeCustomHlsl.cpp:136`；5.7 同文件 280-328 行）
- Grid2D / RW 基类 / Grid3D / RasterizationGrid3D / NeighborGrid3D / ParticleRead / DebugDraw / NDC Read+Write 全部函数名（5.7 源码 FName 常量；NDC 另对 5.3/5.8 做了集合对比）
- NDC GPU 模板函数签名（5.7 `Shaders/Private/DataChannel/NiagaraDataInterfaceDataChannelTemplate_*.ush:10`）
- Grid2D 双缓冲目标（5.7 `NiagaraDataInterfaceGrid2DCollection.cpp` GetFunctionHLSL 1394-1465：Get*→`_Grid`.Load，Set*→`_OutputGrid`[]）
- 所有第 5/7/8 节代码片段 = 官方资产明文提取，未做改写（仅按资产内去重）

⚠️ 未逐条验证：
- 4.26 各 Set/Get 分别读写哪个 buffer（只验证了函数名存在性与缺失家族）
- `_Grid`/`_Texture` 直接符号访问在 5.3~5.8 间的命名稳定性（内容资产中 5.3~5.8 均见同款命名，但属引擎内部约定）
- UE5.8 的 Grid2D/3D 函数面（未单独 grep 5.8 源码；与 5.7 同代，无破坏性变更的旁证：内容资产调用集一致）
