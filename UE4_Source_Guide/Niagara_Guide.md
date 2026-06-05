# Niagara 模块、函数和动态输入详细文档

## 目录
1. [Niagara 概述](#niagara-概述)
2. [模块架构](#模块架构)
3. [核心类详解](#核心类详解)
4. [脚本系统](#脚本系统)
5. [动态输入系统](#动态输入系统)
6. [数据接口系统](#数据接口系统)
7. [数据通道系统](#数据通道系统)
8. [函数库详解](#函数库详解)
9. [渲染器系统](#渲染器系统)
10. [最佳实践](#最佳实践)

---

## Niagara 概述

Niagara 是 UE5 的下一代粒子系统，取代了旧的 Cascade 粒子系统。它提供了更灵活、更强大的粒子模拟能力。

### Niagara vs Cascade 对比

| 特性 | Niagara | Cascade |
|------|---------|---------|
| 架构 | 模块化、可扩展 | 固定功能 |
| 脚本 | 可视化脚本 + HLSL | 仅参数调整 |
| 数据接口 | 支持任意数据源 | 有限 |
| GPU 计算 | 完整支持 | 有限 |
| 调试 | 强大的调试工具 | 基础 |
| 性能 | 更高效 | 较低 |

### Niagara 核心概念

1. **System（系统）**: 粒子系统的顶层容器
2. **Emitter（发射器）**: 控制粒子的生成和行为
3. **Module（模块）**: 可重用的功能单元
4. **Dynamic Input（动态输入）**: 运行时可变的参数输入
5. **Data Interface（数据接口）**: 与外部数据源的连接
6. **Renderer（渲染器）**: 控制粒子的渲染方式

---

## 模块架构

### 源码目录结构

```
Engine/Plugins/FX/Niagara/
├── Source/
│   ├── Niagara/                    # 核心运行时模块
│   │   ├── Classes/               # 核心类定义
│   │   ├── Public/                # 公共头文件
│   │   ├── Private/               # 实现文件
│   │   └── Niagara.Build.cs
│   ├── NiagaraCore/               # 核心基础模块
│   │   ├── Classes/
│   │   ├── Public/
│   │   ├── Private/
│   │   └── NiagaraCore.Build.cs
│   ├── NiagaraEditor/             # 编辑器模块
│   │   ├── Classes/
│   │   ├── Public/
│   │   ├── Private/
│   │   └── NiagaraEditor.Build.cs
│   ├── NiagaraShader/             # 着色器模块
│   ├── NiagaraVertexFactories/    # 顶点工厂
│   ├── NiagaraRenderer/           # 渲染器模块
│   └── NiagaraShapeDebugger/      # 形状调试器
├── Content/                       # 内容资源
├── Docs/                          # 文档
├── Shaders/                       # 着色器文件
└── Niagara.uplugin               # 插件描述文件
```

### 模块依赖关系

```
NiagaraCore (基础)
    ↓
Niagara (核心运行时)
    ↓
NiagaraShader (着色器)
    ↓
NiagaraRenderer (渲染器)
    ↓
NiagaraEditor (编辑器)
```

---

## 核心类详解

### 1. UNiagaraSystem - 粒子系统

**文件位置**: `Source/Niagara/Classes/NiagaraSystem.h`

UNiagaraSystem 是粒子系统的顶层容器，包含多个发射器。

```cpp
UCLASS(BlueprintType, editinlinenew)
class NIAGARA_API UNiagaraSystem : public UObject, public INiagaraMergeManager
{
    GENERATED_UCLASS_BODY()

public:
    // 系统脚本
    UPROPERTY()
    UNiagaraScript* SystemSpawnScript;
    
    UPROPERTY()
    UNiagaraScript* SystemUpdateScript;
    
    // 发射器列表
    UPROPERTY(EditAnywhere, Category = "Emitter")
    TArray<FNiagaraEmitterHandle> EmitterHandles;
    
    // 用户参数
    UPROPERTY(EditAnywhere, Category = "Parameters")
    FNiagaraUserRedirectionParameterStore ExposedParameters;
    
    // 系统参数
    UPROPERTY(EditAnywhere, Category = "System")
    FNiagaraSystemCompiledData SystemCompiledData;
    
    // 性能设置
    UPROPERTY(EditAnywhere, Category = "Performance")
    float WarmupTime;
    
    UPROPERTY(EditAnywhere, Category = "Performance")
    int32 WarmupTickCount;
    
    // 方法
    UFUNCTION(BlueprintCallable, Category = "Niagara")
    TArray<FNiagaraEmitterHandle> GetEmitterHandles() const;
    
    UFUNCTION(BlueprintCallable, Category = "Niagara")
    UNiagaraEmitter* GetEmitterHandleById(FGuid Id) const;
    
    UFUNCTION(BlueprintCallable, Category = "Niagara")
    bool IsValid() const;
};
```

### 2. UNiagaraEmitter - 发射器

**文件位置**: `Source/Niagara/Classes/NiagaraEmitter.h`

UNiagaraEmitter 定义了粒子的行为和属性。

```cpp
UCLASS(BlueprintType, editinlinenew)
class NIAGARA_API UNiagaraEmitter : public UObject
{
    GENERATED_UCLASS_BODY()

public:
    // 发射器属性
    UPROPERTY(EditAnywhere, Category = "Emitter")
    FName EmitterName;
    
    UPROPERTY(EditAnywhere, Category = "Emitter")
    UNiagaraEmitterProperties* EmitterProperties;
    
    // 模块列表
    UPROPERTY(EditAnywhere, Category = "Modules")
    TArray<UNiagaraScript*> Scripts;
    
    // 渲染器
    UPROPERTY(EditAnywhere, Category = "Renderer")
    TArray<UNiagaraRendererProperties*> RendererProperties;
    
    // 事件
    UPROPERTY(EditAnywhere, Category = "Events")
    TArray<FNiagaraEventScriptProperties> EventHandlers;
    
    // 属性
    UPROPERTY(EditAnywhere, Category = "Emitter")
    bool bLocalSpace;
    
    UPROPERTY(EditAnywhere, Category = "Emitter")
    bool bDeterministic;
    
    // 方法
    UFUNCTION(BlueprintCallable, Category = "Niagara")
    UNiagaraEmitterProperties* GetProperties() const;
    
    UFUNCTION(BlueprintCallable, Category = "Niagara")
    bool IsValid() const;
};
```

### 3. UNiagaraScript - 脚本

**文件位置**: `Source/Niagara/Classes/NiagaraScript.h`

UNiagaraScript 代表一个 Niagara 脚本，可以是模块、函数或动态输入。

```cpp
UCLASS(BlueprintType)
class NIAGARA_API UNiagaraScript : public UNiagaraScriptBase
{
    GENERATED_UCLASS_BODY()

public:
    // 脚本使用类型
    UPROPERTY(EditAnywhere, Category = "Script")
    ENiagaraScriptUsage Usage;
    
    // 脚本参数
    UPROPERTY(EditAnywhere, Category = "Parameters")
    TArray<FNiagaraScriptResolvedDataInterfaceInfo> ResolvedDataInterfaces;
    
    // 编译后的脚本
    UPROPERTY()
    FNiagaraScriptResolvedDependencyInfo Dependencies;
    
    // VM 脚本
    UPROPERTY()
    FVMExternalFunctionBindingInfo ExternalFunctionBinding;
    
    // 着色器脚本
    UPROPERTY()
    FNiagaraShaderScriptParameters ShaderScriptParameters;
    
    // 方法
    UFUNCTION(BlueprintCallable, Category = "Niagara")
    ENiagaraScriptUsage GetUsage() const;
    
    UFUNCTION(BlueprintCallable, Category = "Niagara")
    bool IsReadyToRun() const;
    
    UFUNCTION(BlueprintCallable, Category = "Niagara")
    bool IsComplete() const;
    
    // 内部方法
    void Execute(uint32 NumInstances, FNiagaraDataBuffer* OutputData, void* ContextData);
    void UpdateBindings();
};
```

### 4. ENiagaraScriptUsage - 脚本使用类型

**文件位置**: `Source/Niagara/Public/NiagaraCommon.h`

```cpp
enum class ENiagaraScriptUsage : uint8
{
    // 函数定义
    Function,
    
    // 模块定义
    Module,
    
    // 动态输入定义
    DynamicInput,
    
    // 粒子脚本
    ParticleSpawnScript,           // 粒子生成时
    ParticleSpawnScriptInterpolated, // 粒子生成（插值）
    ParticleUpdateScript,          // 粒子更新
    ParticleEventScript,           // 粒子事件
    ParticleSimulationStageScript, // 粒子模拟阶段
    ParticleGPUComputeScript,      // GPU 计算
    
    // 发射器脚本
    EmitterSpawnScript,            // 发射器生成时
    EmitterUpdateScript,           // 发射器更新
    
    // 系统脚本
    SystemSpawnScript,             // 系统生成时
    SystemUpdateScript,            // 系统更新
};
```

---

## 脚本系统

### 脚本执行流程

```
1. 系统生成 (SystemSpawnScript)
   ↓
2. 系统更新 (SystemUpdateScript)
   ↓
3. 发射器生成 (EmitterSpawnScript)
   ↓
4. 发射器更新 (EmitterUpdateScript)
   ↓
5. 粒子生成 (ParticleSpawnScript)
   ↓
6. 粒子更新 (ParticleUpdateScript)
   ↓
7. 粒子事件 (ParticleEventScript)
   ↓
8. 粒子模拟阶段 (ParticleSimulationStageScript)
```

### 模块系统

模块是 Niagara 中可重用的功能单元。

#### 模块类型

1. **输入模块**: 读取数据（位置、速度等）
2. **处理模块**: 处理数据（数学运算、条件判断等）
3. **输出模块**: 写入数据（设置位置、颜色等）

#### 模块定义示例

```cpp
// 在 Niagara 脚本中定义模块
// 模块输入
Input: Position (Vector)
Input: Velocity (Vector)
Input: DeltaTime (Float)

// 模块逻辑
NewPosition = Position + Velocity * DeltaTime

// 模块输出
Output: Position (Vector) = NewPosition
```

### 函数系统

函数是 Niagara 中可重用的计算单元。

#### 函数签名

```cpp
struct FNiagaraFunctionSignature
{
    FName Name;                          // 函数名
    TArray<FNiagaraVariable> Inputs;     // 输入参数
    TArray<FNiagaraVariableBase> Outputs; // 输出参数
    bool bRequiresContext;               // 是否需要上下文
    bool bMemberFunction;                // 是否是成员函数
    bool bSupportsCPU;                   // 是否支持 CPU
    bool bSupportsGPU;                   // 是否支持 GPU
    bool bWriteFunction;                 // 是否是写函数
    bool bReadFunction;                  // 是否是读函数
    uint32 ModuleUsageBitmask;           // 模块使用位掩码
};
```

#### 内置函数示例

```cpp
// 数学函数
Vector3f Add(Vector3f A, Vector3f B)
float Multiply(float A, float B)
Vector3f Normalize(Vector3f V)

// 随机函数
float RandomFloat()
Vector3f RandomVector()

// 插值函数
float Lerp(float A, float B, float Alpha)
Vector3f VLerp(Vector3f A, Vector3f B, float Alpha)
```

---

## 动态输入系统

### 动态输入概述

动态输入（Dynamic Input）是 Niagara 中一种特殊的输入机制，允许在运行时动态改变参数值。与静态输入不同，动态输入可以：

1. **运行时计算**: 根据当前状态计算值
2. **随机化**: 生成随机值
3. **曲线驱动**: 使用曲线控制值
4. **数据绑定**: 从数据接口读取值

### 动态输入脚本类型

```cpp
// ENiagaraScriptUsage::DynamicInput
// 动态输入脚本用于提供运行时可变的参数值
```

### 动态输入的工作原理

```
┌─────────────────────────────────────────────────────────┐
│                    Niagara 模块                          │
├─────────────────────────────────────────────────────────┤
│  静态输入: 0.5                                          │
│  动态输入: ┌─────────────────────────────────────────┐  │
│           │  Random Float (0.0 ~ 1.0)               │  │
│           └─────────────────────────────────────────┘  │
│           ↓                                             │
│  结果: 运行时随机值                                      │
└─────────────────────────────────────────────────────────┘
```

### 动态输入类型

#### 1. 随机动态输入

```cpp
// 随机浮点数
class UNiagaraDynamicInputFloatRandom : public UNiagaraDynamicInput
{
    UPROPERTY(EditAnywhere, Category = "Random")
    float Min = 0.0f;
    
    UPROPERTY(EditAnywhere, Category = "Random")
    float Max = 1.0f;
    
    virtual float Evaluate(const FNiagaraDataInterfaceExecutionContext& Context) override
    {
        return FMath::RandRange(Min, Max);
    }
};

// 随机向量
class UNiagaraDynamicInputVectorRandom : public UNiagaraDynamicInput
{
    UPROPERTY(EditAnywhere, Category = "Random")
    FVector Min;
    
    UPROPERTY(EditAnywhere, Category = "Random")
    FVector Max;
    
    virtual FVector Evaluate(const FNiagaraDataInterfaceExecutionContext& Context) override
    {
        return FVector(
            FMath::RandRange(Min.X, Max.X),
            FMath::RandRange(Min.Y, Max.Y),
            FMath::RandRange(Min.Z, Max.Z)
        );
    }
};
```

#### 2. 曲线动态输入

```cpp
// 浮点曲线
class UNiagaraDynamicInputFloatCurve : public UNiagaraDynamicInput
{
    UPROPERTY(EditAnywhere, Category = "Curve")
    FRichCurve Curve;
    
    virtual float Evaluate(const FNiagaraDataInterfaceExecutionContext& Context) override
    {
        float Time = Context.GetNormalizedAge();
        return Curve.Eval(Time);
    }
};

// 颜色曲线
class UNiagaraDynamicInputColorCurve : public UNiagaraDynamicInput
{
    UPROPERTY(EditAnywhere, Category = "Curve")
    FLinearColorCurve Curve;
    
    virtual FLinearColor Evaluate(const FNiagaraDataInterfaceExecutionContext& Context) override
    {
        float Time = Context.GetNormalizedAge();
        return Curve.Eval(Time);
    }
};
```

#### 3. 数据接口动态输入

```cpp
// 从数据接口读取
class UNiagaraDynamicInputDataInterface : public UNiagaraDynamicInput
{
    UPROPERTY(EditAnywhere, Category = "DataInterface")
    UNiagaraDataInterface* DataInterface;
    
    UPROPERTY(EditAnywhere, Category = "DataInterface")
    FName AttributeName;
    
    virtual float Evaluate(const FNiagaraDataInterfaceExecutionContext& Context) override
    {
        if (DataInterface)
        {
            return DataInterface->ReadFloat(Context, AttributeName);
        }
        return 0.0f;
    }
};
```

### 动态输入格式令牌

```cpp
// 内联动态输入格式令牌
struct FNiagaraInlineDynamicInputFormatToken
{
    ENiagaraInlineDynamicInputFormatTokenUsage Usage;
    FString Text;
    FNiagaraVariable InputVariable;
    
    // 令牌类型
    enum class ENiagaraInlineDynamicInputFormatTokenUsage
    {
        Input,      // 输入参数
        Decorator,  // 装饰器文本
        LineBreak   // 换行符
    };
};
```

### 动态输入的使用场景

#### 场景 1: 粒子初始速度

```
发射器设置:
├── 初始速度 X: 动态输入 (Random: -100 ~ 100)
├── 初始速度 Y: 动态输入 (Random: -100 ~ 100)
└── 初始速度 Z: 动态输入 (Curve: 0 → 500)
```

#### 场景 2: 粒子颜色

```
粒子更新:
├── 颜色 R: 动态输入 (Curve: 1 → 0)
├── 颜色 G: 动态输入 (Curve: 1 → 0)
├── 颜色 B: 动态输入 (Curve: 1 → 0)
└── 颜色 A: 动态输入 (Curve: 1 → 0)
```

#### 场景 3: 粒子大小

```
粒子更新:
└── 大小: 动态输入 (Curve: 0.1 → 1.0 → 0.0)
```

---

## 数据接口系统

### 数据接口概述

数据接口（Data Interface）是 Niagara 与外部数据源连接的桥梁。

### 基类定义

```cpp
UCLASS(abstract, editinlinenew)
class NIAGARA_API UNiagaraDataInterface : public UNiagaraDataInterfaceBase
{
    GENERATED_UCLASS_BODY()

public:
    // VM 绑定
    virtual bool CanExecuteOnTarget(ENiagaraSimTarget Target) const { return true; }
    virtual bool InitPerInstanceData(void* PerInstanceData, FNiagaraSystemInstance* SystemInstance);
    virtual void DestroyPerInstanceData(void* PerInstanceData, FNiagaraSystemInstance* SystemInstance);
    
    // GPU 着色器
    virtual void GetShaderParameters(FNiagaraShaderParameters* Parameters) const;
    virtual void SetShaderParameters(const FNiagaraShaderParameters* Parameters) const;
    
    // 数据读写
    virtual bool ReadFloat(const FNiagaraDataInterfaceExecutionContext& Context, FName AttributeName, float& OutValue);
    virtual bool ReadVector(const FNiagaraDataInterfaceExecutionContext& Context, FName AttributeName, FVector& OutValue);
    virtual bool WriteFloat(const FNiagaraDataInterfaceExecutionContext& Context, FName AttributeName, float Value);
    virtual bool WriteVector(const FNiagaraDataInterfaceExecutionContext& Context, FName AttributeName, FVector Value);
};
```

### 常用数据接口

#### 1. 网格体数据接口

```cpp
// 从静态网格体读取数据
UCLASS(editinlinenew)
class UNiagaraDataInterfaceStaticMesh : public UNiagaraDataInterface
{
    UPROPERTY(EditAnywhere, Category = "Mesh")
    UStaticMesh* Mesh;
    
    // 读取顶点位置
    virtual bool GetMeshVertices(const FNiagaraDataInterfaceExecutionContext& Context, 
                                 TArray<FVector>& OutVertices) override;
    
    // 读取法线
    virtual bool GetMeshNormals(const FNiagaraDataInterfaceExecutionContext& Context,
                                TArray<FVector>& OutNormals) override;
    
    // 在表面随机采样
    virtual bool SampleSurface(const FNiagaraDataInterfaceExecutionContext& Context,
                               FVector& OutPosition, FVector& OutNormal) override;
};
```

#### 2. 骨骼网格体数据接口

```cpp
// 从骨骼网格体读取数据
UCLASS(editinlinenew)
class UNiagaraDataInterfaceSkeletalMesh : public UNiagaraDataInterface
{
    UPROPERTY(EditAnywhere, Category = "Mesh")
    USkeletalMesh* Mesh;
    
    // 读取骨骼变换
    virtual bool GetBoneTransform(const FNiagaraDataInterfaceExecutionContext& Context,
                                  FName BoneName, FTransform& OutTransform) override;
    
    // 在骨骼表面采样
    virtual bool SampleSkeletalMesh(const FNiagaraDataInterfaceExecutionContext& Context,
                                    FVector& OutPosition, FVector& OutNormal) override;
};
```

#### 3. 碰撞数据接口

```cpp
// 碰撞检测
UCLASS(editinlinenew)
class UNiagaraDataInterfaceCollision : public UNiagaraDataInterface
{
    // 射线检测
    virtual bool Raycast(const FNiagaraDataInterfaceExecutionContext& Context,
                        const FVector& Start, const FVector& End,
                        FHitResult& OutHit) override;
    
    // 球体检测
    virtual bool SphereOverlap(const FNiagaraDataInterfaceExecutionContext& Context,
                               const FVector& Center, float Radius,
                               TArray<FHitResult>& OutHits) override;
};
```

#### 4. 音频数据接口

```cpp
// 音频频谱数据
UCLASS(editinlinenew)
class UNiagaraDataInterfaceAudioSpectrum : public UNiagaraDataInterface
{
    UPROPERTY(EditAnywhere, Category = "Audio")
    UAudioComponent* AudioComponent;
    
    // 读取频谱数据
    virtual bool GetAudioSpectrum(const FNiagaraDataInterfaceExecutionContext& Context,
                                  TArray<float>& OutSpectrum) override;
    
    // 读取音量
    virtual bool GetAudioVolume(const FNiagaraDataInterfaceExecutionContext& Context,
                                float& OutVolume) override;
};
```

#### 5. 渲染目标数据接口

```cpp
// 从渲染目标读取数据
UCLASS(editinlinenew)
class UNiagaraDataInterfaceRenderTarget2D : public UNiagaraDataInterface
{
    UPROPERTY(EditAnywhere, Category = "RenderTarget")
    UTextureRenderTarget2D* RenderTarget;
    
    // 读取像素颜色
    virtual bool ReadPixel(const FNiagaraDataInterfaceExecutionContext& Context,
                          const FVector2D& UV, FLinearColor& OutColor) override;
    
    // 写入像素颜色
    virtual bool WritePixel(const FNiagaraDataInterfaceExecutionContext& Context,
                           const FVector2D& UV, const FLinearColor& Color) override;
};
```

---

## 数据通道系统

### 数据通道概述

数据通道（Data Channel）是 UE5.8 引入的新系统，用于 Niagara 系统之间以及与游戏代码之间的通信。

### 数据通道架构

```
┌─────────────────────────────────────────────────────────┐
│                    数据通道系统                           │
├─────────────────────────────────────────────────────────┤
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐  │
│  │ 游戏代码    │    │ Niagara     │    │ Niagara     │  │
│  │ (Blueprint) │    │ 系统 A      │    │ 系统 B      │  │
│  └──────┬──────┘    └──────┬──────┘    └──────┬──────┘  │
│         │                  │                  │         │
│         └──────────────────┼──────────────────┘         │
│                            ↓                            │
│                    ┌───────────────┐                     │
│                    │  数据通道     │                     │
│                    │  (共享数据)   │                     │
│                    └───────────────┘                     │
└─────────────────────────────────────────────────────────┘
```

### 数据通道类

```cpp
UCLASS(abstract, EditInlineNew)
class NIAGARA_API UNiagaraDataChannel : public UObject
{
    GENERATED_BODY()

public:
    // 通道变量
    UPROPERTY(EditAnywhere, Category = "Data Channel")
    TArray<FNiagaraDataChannelVariable> ChannelVariables;
    
    // 是否保留上一帧数据
    UPROPERTY(EditAnywhere, Category = "Data Channel")
    bool bKeepPreviousFrameData;
    
    // 最终写入 Tick 组
    UPROPERTY(EditAnywhere, Category = "Data Channel")
    ETickingGroup FinalWriteTickGroup;
    
    // 方法
    const UNiagaraDataChannelAsset* GetAsset() const;
    TConstArrayView<FNiagaraDataChannelVariable> GetVariables() const;
    bool KeepPreviousFrameData() const;
    
    // 访问上下文
    FNDCAccessContextInst& GetTransientAccessContext() const;
    
    // 创建处理器
    virtual UNiagaraDataChannelHandler* CreateHandler() const;
    
    // 遍历所有数据通道
    template<typename TAction>
    static void ForEachDataChannel(TAction Func);
};
```

### 数据通道类型

#### 1. 全局数据通道

```cpp
// 全局数据通道 - 所有系统共享
UCLASS()
class UNiagaraDataChannel_Global : public UNiagaraDataChannel
{
    GENERATED_BODY()
    
    // 全局数据存储
    static TArray<FNiagaraDataChannelData> GlobalData;
};
```

#### 2. 岛屿数据通道

```cpp
// 岛屿数据通道 - 按区域分组
UCLASS()
class UNiagaraDataChannel_Islands : public UNiagaraDataChannel
{
    GENERATED_BODY()
    
    // 岛屿划分
    UPROPERTY(EditAnywhere, Category = "Islands")
    float IslandSize = 1000.0f;
    
    // 获取岛屿 ID
    int32 GetIslandId(const FVector& Position) const;
};
```

#### 3. 地图数据通道

```cpp
// 地图数据通道 - 基于空间分区
UCLASS()
class UNiagaraDataChannel_Map : public UNiagaraDataChannel
{
    GENERATED_BODY()
    
    // 空间分区
    UPROPERTY(EditAnywhere, Category = "Map")
    FVector CellSize = FVector(100.0f);
    
    // 获取单元格坐标
    FIntVector GetCellCoord(const FVector& Position) const;
};
```

#### 4. 游戏突发数据通道

```cpp
// 游戏突发数据通道 - 单次事件
UCLASS()
class UNiagaraDataChannel_GameplayBurst : public UNiagaraDataChannel
{
    GENERATED_BODY()
    
    // 突发事件
    void BurstEvent(const FNiagaraDataChannelData& Data);
};
```

### 数据通道变量

```cpp
USTRUCT()
struct FNiagaraDataChannelVariable
{
    GENERATED_BODY()
    
    UPROPERTY(EditAnywhere, Category = "Variable")
    FNiagaraVariable Variable;
    
    UPROPERTY(EditAnywhere, Category = "Variable")
    FName Name;
    
    UPROPERTY(EditAnywhere, Category = "Variable")
    ENiagaraDataChannelVariableType Type;
};
```

### 数据通道访问上下文

```cpp
// 访问上下文
struct FNDCAccessContextInst
{
    // 初始化
    void Init(TNDCAccessContextType Type);
    
    // 读取数据
    bool Read(FNiagaraDataChannelData& OutData) const;
    
    // 写入数据
    bool Write(const FNiagaraDataChannelData& Data);
    
    // 获取变量值
    template<typename T>
    T GetValue(int32 Index, const FNiagaraDataChannelVariable& Variable) const;
    
    // 设置变量值
    template<typename T>
    void SetValue(int32 Index, const FNiagaraDataChannelVariable& Variable, const T& Value);
};
```

### 数据通道使用示例

#### 蓝图使用

```cpp
// 获取数据通道
UNiagaraDataChannel* DataChannel = UNiagaraDataChannelManager::GetDataChannel("MyChannel");

// 写入数据
FNDCAccessContextInst& Context = DataChannel->GetTransientAccessContext();
Context.SetValue<FVector>(0, PositionVariable, HitLocation);
Context.SetValue<float>(1, DamageVariable, DamageAmount);

// 读取数据
FVector Position = Context.GetValue<FVector>(0, PositionVariable);
float Damage = Context.GetValue<float>(1, DamageVariable);
```

#### C++ 使用

```cpp
// 获取数据通道资产
UNiagaraDataChannelAsset* ChannelAsset = LoadObject<UNiagaraDataChannelAsset>(nullptr, TEXT("/Game/DataChannels/DC_MyChannel"));

// 获取数据通道
UNiagaraDataChannel* DataChannel = ChannelAsset->GetChannel();

// 访问数据
FNDCAccessContextInst& Context = DataChannel->GetTransientAccessContext();
if (Context.Read(Data))
{
    // 处理数据
    for (int32 i = 0; i < Data.GetNumInstances(); i++)
    {
        FVector Position = Data.GetValue<FVector>(i, PositionVariable);
        // ...
    }
}
```

---

## 函数库详解

### UNiagaraFunctionLibrary

**文件位置**: `Source/Niagara/Public/NiagaraFunctionLibrary.h`

UNiagaraFunctionLibrary 提供了蓝图和 C++ 可调用的 Niagara 工具函数。

#### 生成粒子系统

```cpp
// 在世界位置生成粒子系统
UFUNCTION(BlueprintCallable, Category = "Niagara")
static UNiagaraComponent* SpawnSystemAtLocation(
    UObject* WorldContextObject,
    UNiagaraSystem* SystemTemplate,
    FVector SpawnLocation,
    FRotator SpawnRotation = FRotator::ZeroRotator,
    FVector Scale = FVector(1.0f),
    bool bAutoDestroy = true,
    bool bAutoActivate = true
);

// 在组件上附加粒子系统
UFUNCTION(BlueprintCallable, Category = "Niagara")
static UNiagaraComponent* SpawnSystemAttached(
    UNiagaraSystem* SystemTemplate,
    USceneComponent* AttachToComponent,
    FName AttachPointName,
    FVector Location,
    FRotator Rotation,
    EAttachLocation::Type LocationType,
    bool bAutoDestroy = true,
    bool bAutoActivate = true
);
```

#### 获取 Niagara 组件

```cpp
// 从 Actor 获取 Niagara 组件
UFUNCTION(BlueprintCallable, Category = "Niagara")
static UNiagaraComponent* GetNiagaraComponent(AActor* Actor);

// 获取所有 Niagara 组件
UFUNCTION(BlueprintCallable, Category = "Niagara")
static TArray<UNiagaraComponent*> GetAllNiagaraComponents(AActor* Actor);
```

#### 设置 Niagara 参数

```cpp
// 设置浮点参数
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void SetNiagaraParameterFloat(
    UNiagaraComponent* NiagaraSystem,
    FName ParameterName,
    float Value
);

// 设置向量参数
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void SetNiagaraParameterVector(
    UNiagaraComponent* NiagaraSystem,
    FName ParameterName,
    FVector Value
);

// 设置颜色参数
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void SetNiagaraParameterColor(
    UNiagaraComponent* NiagaraSystem,
    FName ParameterName,
    FLinearColor Value
);

// 设置布尔参数
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void SetNiagaraParameterBool(
    UNiagaraComponent* NiagaraSystem,
    FName ParameterName,
    bool Value
);
```

#### Niagara 系统控制

```cpp
// 激活 Niagara 系统
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void ActivateSystem(UNiagaraComponent* NiagaraSystem, bool bReset = false);

// 停止 Niagara 系统
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void DeactivateSystem(UNiagaraComponent* NiagaraSystem);

// 重置 Niagara 系统
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void ResetSystem(UNiagaraComponent* NiagaraSystem);

// 检查系统是否激活
UFUNCTION(BlueprintCallable, Category = "Niagara")
static bool IsSystemActive(UNiagaraComponent* NiagaraSystem);
```

#### 性能统计

```cpp
// 获取粒子数量
UFUNCTION(BlueprintCallable, Category = "Niagara")
static int32 GetNumParticles(UNiagaraComponent* NiagaraSystem);

// 获取活动粒子数量
UFUNCTION(BlueprintCallable, Category = "Niagara")
static int32 GetNumActiveParticles(UNiagaraComponent* NiagaraSystem);

// 获取最大粒子数量
UFUNCTION(BlueprintCallable, Category = "Niagara")
static int32 GetMaxParticles(UNiagaraComponent* NiagaraSystem);
```

#### GPU 射线追踪碰撞

```cpp
// 设置 GPU 射线追踪碰撞组
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void SetComponentNiagaraGPURayTracedCollisionGroup(
    UObject* WorldContextObject,
    UPrimitiveComponent* Primitive,
    int32 CollisionGroup
);

// 为 Actor 设置 GPU 射线追踪碰撞组
UFUNCTION(BlueprintCallable, Category = "Niagara")
static void SetActorNiagaraGPURayTracedCollisionGroup(
    UObject* WorldContextObject,
    AActor* Actor,
    int32 CollisionGroup
);

// 获取空闲碰撞组
UFUNCTION(BlueprintCallable, Category = "Niagara")
static int32 GetFreeGPURayTracedCollisionGroup(UObject* WorldContextObject);
```

#### HLSL 函数定义

```cpp
// 定义 HLSL 函数
static bool DefineFunctionHLSL(
    const FNiagaraFunctionSignature& FunctionSignature,
    FString& HlslOutput
);

// 获取 VectorVM 快速路径外部函数
static bool GetVectorVMFastPathExternalFunction(
    const FVMExternalFunctionBindingInfo& BindingInfo,
    FVMExternalFunction& OutFunc
);
```

---

## 渲染器系统

### 渲染器类型

Niagara 支持多种渲染器类型：

#### 1. 精灵渲染器

```cpp
UCLASS(editinlinenew)
class UNiagaraSpriteRendererProperties : public UNiagaraRendererProperties
{
    // 材质
    UPROPERTY(EditAnywhere, Category = "Sprite")
    UMaterialInterface* Material;
    
    // 纹理
    UPROPERTY(EditAnywhere, Category = "Sprite")
    UTexture2D* Texture;
    
    // 排序模式
    UPROPERTY(EditAnywhere, Category = "Sprite")
    ENiagaraSortMode SortMode;
    
    // 对齐模式
    UPROPERTY(EditAnywhere, Category = "Sprite")
    ENiagaraSpriteAlignment Alignment;
    
    // 朝向模式
    UPROPERTY(EditAnywhere, Category = "Sprite")
    ENiagaraSpriteFacingMode FacingMode;
};
```

#### 2. 网格体渲染器

```cpp
UCLASS(editinlinenew)
class UNiagaraMeshRendererProperties : public UNiagaraRendererProperties
{
    // 网格体列表
    UPROPERTY(EditAnywhere, Category = "Mesh")
    TArray<FNiagaraMeshRendererMeshProperties> Meshes;
    
    // 材质覆盖
    UPROPERTY(EditAnywhere, Category = "Mesh")
    TArray<UMaterialInterface*> MaterialOverrides;
    
    // 排序模式
    UPROPERTY(EditAnywhere, Category = "Mesh")
    ENiagaraSortMode SortMode;
};
```

#### 3. 光照渲染器

```cpp
UCLASS(editinlinenew)
class UNiagaraLightRendererProperties : public UNiagaraRendererProperties
{
    // 光源半径
    UPROPERTY(EditAnywhere, Category = "Light")
    float RadiusScale;
    
    // 光源强度
    UPROPERTY(EditAnywhere, Category = "Light")
    float IntensityScale;
    
    // 颜色模式
    UPROPERTY(EditAnywhere, Category = "Light")
    ENiagaraRendererSourceMode ColorMode;
};
```

#### 4. Ribbon 渲染器

```cpp
UCLASS(editinlinenew)
class UNiagaraRibbonRendererProperties : public UNiagaraRendererProperties
{
    // 材质
    UPROPERTY(EditAnywhere, Category = "Ribbon")
    UMaterialInterface* Material;
    
    // 宽度
    UPROPERTY(EditAnywhere, Category = "Ribbon")
    float Width;
    
    // 平滑度
    UPROPERTY(EditAnywhere, Category = "Ribbon")
    float Smoothness;
    
    // UV 模式
    UPROPERTY(EditAnywhere, Category = "Ribbon")
    ENiagaraRibbonUVMode UVMode;
};
```

---

## 最佳实践

### 1. 性能优化

#### 粒子数量管理

```cpp
// 设置合理的最大粒子数
Emitter->MaxParticles = 1000;

// 使用 LOD
Emitter->bEnableLOD = true;
Emitter->LODDistance[0] = 1000.0f;  // 高细节
Emitter->LODDistance[1] = 2000.0f;  // 中细节
Emitter->LODDistance[2] = 5000.0f;  // 低细节
```

#### GPU 优化

```cpp
// 使用 GPU 计算
Emitter->bUseGPUCompute = true;

// 设置合适的线程组大小
Emitter->GPUThreadGroupSize = 64;
```

#### 内存优化

```cpp
// 使用对象池
UNiagaraComponentPool* Pool = UNiagaraComponentPool::Get();
Pool->SetPoolSize(SystemTemplate, 100);

// 及时销毁
Component->DestroyComponent();
```

### 2. 调试技巧

#### 使用 Niagara 调试器

```cpp
// 启用详细日志
System->bVerboseLogging = true;

// 使用可视化调试
System->bVisualDebugging = true;
System->DebugLifeTime = 5.0f;
```

#### 性能分析

```cpp
// 使用 stat 命令
stat Niagara
stat NiagaraParticles
stat NiagaraMemory

// 使用 GPU 分析
ProfileGPU
```

### 3. 常见问题

#### 粒子不显示

1. 检查材质是否正确设置
2. 检查渲染器是否启用
3. 检查粒子数量是否大于 0
4. 检查发射器是否激活

#### 性能问题

1. 减少粒子数量
2. 使用 GPU 计算
3. 启用 LOD
4. 优化材质复杂度

#### 内存泄漏

1. 及时销毁组件
2. 使用对象池
3. 检查数据接口引用

### 4. 代码示例

#### 完整的粒子系统创建

```cpp
// 创建 Niagara 系统
UNiagaraSystem* NiagaraSystem = NewObject<UNiagaraSystem>();

// 创建发射器
UNiagaraEmitter* Emitter = NewObject<UNiagaraEmitter>();
Emitter->EmitterName = "MyEmitter";
Emitter->MaxParticles = 1000;
Emitter->bLocalSpace = false;

// 添加模块
UNiagaraScript* SpawnScript = NewObject<UNiagaraScript>();
SpawnScript->Usage = ENiagaraScriptUsage::ParticleSpawnScript;
Emitter->Scripts.Add(SpawnScript);

// 添加渲染器
UNiagaraSpriteRendererProperties* Renderer = NewObject<UNiagaraSpriteRendererProperties>();
Renderer->Material = LoadObject<UMaterialInterface>(nullptr, TEXT("/Game/Materials/M_Particle"));
Emitter->RendererProperties.Add(Renderer);

// 添加发射器到系统
NiagaraSystem->EmitterHandles.Add(FNiagaraEmitterHandle(Emitter));

// 生成组件
UNiagaraComponent* Component = UNiagaraFunctionLibrary::SpawnSystemAtLocation(
    GetWorld(),
    NiagaraSystem,
    FVector::ZeroVector
);

// 设置参数
UNiagaraFunctionLibrary::SetNiagaraParameterFloat(Component, "SpawnRate", 100.0f);
UNiagaraFunctionLibrary::SetNiagaraParameterVector(Component, "InitialVelocity", FVector(0, 0, 100));
```

#### 蓝图使用示例

```cpp
// 在蓝图中
// 1. 获取 Niagara 组件
UNiagaraComponent* NiagaraComp = GetNiagaraComponent();

// 2. 设置参数
NiagaraComp->SetNiagaraVariableFloat("Health", CurrentHealth);
NiagaraComp->SetNiagaraVariableVector("TargetLocation", TargetLocation);

// 3. 激活/停止
NiagaraComp->Activate(true);
NiagaraComp->Deactivate();

// 4. 监听事件
NiagaraComp->OnSystemFinished.AddDynamic(this, &AMyActor::OnNiagaraFinished);
```

---

## 总结

Niagara 是 UE5 中功能强大的粒子系统，提供了：

1. **模块化架构**: 通过模块和函数构建复杂的粒子效果
2. **动态输入**: 运行时可变的参数，支持随机、曲线、数据接口等
3. **数据接口**: 与外部数据源的无缝连接
4. **数据通道**: Niagara 系统之间以及与游戏代码的通信
5. **GPU 计算**: 高效的 GPU 加速粒子模拟
6. **强大的调试**: 完善的调试和性能分析工具

通过深入理解这些概念和 API，你可以创建出令人惊叹的粒子效果，并优化性能以满足项目需求。

---

**文档创建日期**: 2026年6月5日
**维护者**: 团子
**版本**: 1.0.0
