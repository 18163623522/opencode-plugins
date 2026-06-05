# UE 4.26 源码阅读指南

## 概述

本指南基于本地 UE 4.26 源码版（路径：`D:\SoftWave\UnrealEngine\UE4.26\UE_4.26`），提供详细的源码结构分析和阅读建议。

## 源码目录结构

```
Engine/
├── Source/
│   ├── Runtime/          # 运行时代码（150个模块）
│   ├── Editor/           # 编辑器代码（110个模块）
│   ├── Developer/        # 开发者工具（101个模块）
│   ├── ThirdParty/       # 第三方库
│   └── Programs/         # 独立程序
├── Shaders/              # 着色器文件
├── Content/              # 默认内容
├── Plugins/              # 引擎插件
├── Binaries/             # 编译输出
├── Build/                # 构建系统
└── Config/               # 配置文件
```

## 核心模块架构

### 1. Core 模块（基础层）

**路径**: `Engine/Source/Runtime/Core/`

Core 是 UE 的最底层模块，提供所有其他模块依赖的基础功能。

#### 目录结构
```
Core/
├── Public/
│   ├── Core.h              # 主头文件
│   ├── CoreMinimal.h       # 最小化头文件（推荐包含）
│   ├── CoreTypes.h         # 基础类型定义
│   ├── CoreGlobals.h       # 全局变量和函数
│   ├── Containers/         # 容器类（TArray, TMap, TSet等）
│   ├── Delegates/          # 委托系统
│   ├── Async/              # 异步任务系统
│   ├── Math/               # 数学库
│   ├── Memory/             # 内存管理
│   ├── Serialization/      # 序列化系统
│   ├── Logging/            # 日志系统
│   ├── Modules/            # 模块系统
│   ├── HAL/                # 硬件抽象层
│   ├── GenericPlatform/    # 平台抽象
│   ├── Windows/            # Windows平台实现
│   ├── Misc/               # 杂项工具
│   ├── Templates/          # 模板工具
│   ├── Traits/             # 类型特征
│   ├── Stats/              # 统计系统
│   ├── ProfilingDebugging/ # 性能分析
│   └── Internationalization/ # 国际化
└── Private/
    └── ...                 # 实现文件
```

#### 核心子系统

**1.1 容器类 (Containers/)**

UE 的自定义容器，不依赖 STL。

```cpp
// 核心容器
TArray<T>        # 动态数组（类似 std::vector）
TMap<K, V>       # 哈希映射（类似 std::unordered_map）
TSet<T>          # 哈希集合（类似 std::unordered_set）
TList<T>         # 链表
TQueue<T>        # 队列
TStack<T>        # 栈
TBitArray        # 位数组
TSparseArray<T>  # 稀疏数组
TIndirectArray<T># 间接数组

// 字符串
FString          # 可变字符串
FName            # 名称（Interned string，快速比较）
FText            # 本地化文本
FStringView      # 字符串视图（C++17 风格）
```

**1.2 委托系统 (Delegates/)**

UE 的事件/回调系统。

```cpp
// 单播委托
DECLARE_DELEGATE(MyDelegate)
DECLARE_DELEGATE_OneParam(MyDelegate, int32)
DECLARE_DELEGATE_RetVal(bool, MyDelegate)

// 多播委托
DECLARE_MULTICAST_DELEGATE(MyMulticastDelegate)
DECLARE_MULTICAST_DELEGATE_OneParam(MyMulticastDelegate, int32)

// 动态委托（可序列化，用于蓝图）
DECLARE_DYNAMIC_DELEGATE(FMyDynDelegate)
DECLARE_DYNAMIC_MULTICAST_DELEGATE(FMyDynMulticastDelegate)

// 事件（带接受者管理的多播委托）
DECLARE_EVENT(MyClass, FMyEvent)
```

**1.3 异步系统 (Async/)**

```cpp
FAsyncTask<T>           # 异步任务
FAsync<void>            # 简化异步
FAutoDeleteAsyncTask<T> # 自动删除的异步任务
IQueuedWork             # 队列工作接口
FQueuedThreadPool       # 线程池
FThreadSafeCounter      # 线程安全计数器
FThreadSafeBool         # 线程安全布尔
FEvent                  # 同步事件
FCriticalSection        # 临界区
FScopeLock              # 作用域锁
```

**1.4 数学库 (Math/)**

```cpp
FVector         # 3D向量
FVector2D       # 2D向量
FVector4        # 4D向量
FRotator        # 旋转（欧拉角）
FQuat           # 四元数
FTransform      # 变换（位置+旋转+缩放）
FMatrix         # 4x4矩阵
FBox            # 包围盒
FSphere         # 包围球
FPlane          # 平面
FColor          # 颜色（RGBA, 8位）
FLinearColor    # 线性颜色（RGBA, 浮点）
FMath           # 数学工具函数
```

**1.5 智能指针 (Memory/)**

```cpp
TSharedPtr<T>     # 共享指针（引用计数）
TSharedRef<T>     # 共享引用（非空）
TWeakPtr<T>       # 弱指针
TUniquePtr<T>     # 独占指针
TRefCountBase     # 引用计数基类
```

**1.6 模块系统 (Modules/)**

```cpp
IModuleInterface        # 模块接口
FModuleManager          # 模块管理器
IMPLEMENT_MODULE        # 实现模块宏
FDefaultModuleImpl      # 默认模块实现

// 模块类型
ELoadingPhase::EarliestPossible
ELoadingPhase::PostConfigInit
ELoadingPhase::PostEngineInit
ELoadingPhase::None
```

**1.7 日志系统 (Logging/)**

```cpp
DECLARE_LOG_CATEGORY_EXTERN(LogMyCategory, Log, All)
DEFINE_LOG_CATEGORY(LogMyCategory)

UE_LOG(LogMyCategory, Log, TEXT("Message %d"), value)
UE_LOG(LogMyCategory, Warning, TEXT("Warning"))
UE_LOG(LogMyCategory, Error, TEXT("Error"))
UE_LOG(LogMyCategory, Fatal, TEXT("Fatal - will crash"))
```

---

### 2. CoreUObject 模块（对象系统）

**路径**: `Engine/Source/Runtime/CoreUObject/`

CoreUObject 构建在 Core 之上，提供 UObject 对象系统。

#### 目录结构
```
CoreUObject/
├── Public/
│   ├── UObject/            # UObject 核心
│   ├── Blueprint/          # 蓝图系统
│   ├── Serialization/      # 对象序列化
│   ├── AssetRegistry/      # 资产注册表
│   └── Templates/          # 模板工具
└── Private/
    └── ...
```

#### 核心概念

**2.1 UObject 系统**

UObject 是 UE 中几乎所有对象的基类。

```cpp
UObject
├── AActor                 # 游戏对象
│   ├── APawn              # 可控制对象
│   │   └── ACharacter     # 角色
│   ├── AGameModeBase      # 游戏模式
│   ├── APlayerController  # 玩家控制器
│   └── AInfo              # 信息类
├── UActorComponent        # 组件
│   ├── USceneComponent    # 场景组件
│   │   ├── UPrimitiveComponent # 图元组件
│   │   └── UMovementComponent # 移动组件
│   └── UInputComponent    # 输入组件
├── UStruct                # 结构体基类
│   └── UFunction          # 函数
├── UField                 # 字段基类
│   ├── UProperty          # 属性
│   └── UEnum              # 枚举
└── UPackage               # 包
```

**2.2 反射系统**

UE 的反射系统允许在运行时查询和操作类型信息。

```cpp
// 类声明宏
UCLASS()
class MYCLASS_API UMyClass : public UObject
{
    GENERATED_BODY()
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    int32 MyProperty;
    
    UFUNCTION(BlueprintCallable)
    void MyFunction();
    
    UFUNCTION(BlueprintPure)
    int32 GetMyValue() const;
};

// 结构体
USTRUCT(BlueprintType)
struct FMyStruct
{
    GENERATED_BODY()
    
    UPROPERTY(EditAnywhere)
    float Value;
};

// 枚举
UENUM(BlueprintType)
enum class EMyEnum : uint8
{
    Value1,
    Value2,
    Value3
};
```

**2.3 垃圾回收**

UE 使用标记-清除垃圾回收系统。

```cpp
// 防止被回收
UPROPERTY()
UMyObject* MyObject;

// 弱引用（不阻止回收）
TWeakObjectPtr<UMyObject> WeakPtr;

// 阻止 GC 的独立引用
FGCObject ScopeGuard;

// GC 系统类
FGCObject                # GC 对象基类
FReferenceCollector      # 引用收集器
FGarbageCollectionHistory # GC 历史
```

**2.4 序列化系统**

```cpp
// 基本序列化
FArchive& operator<<(FArchive& Ar, FMyStruct& MyStruct)

// 对象序列化
UObject::Serialize(FArchive& Ar)

// 包加载
UPackage* Package = LoadPackage(nullptr, *PackageName, LOAD_None)

// 资产注册表
FAssetRegistryModule& AssetRegistry = FModuleManager::LoadModuleChecked<FAssetRegistryModule>("AssetRegistry")
```

---

### 3. Engine 模块（游戏引擎核心）

**路径**: `Engine/Source/Runtime/Engine/`

Engine 是游戏引擎的核心模块，包含游戏框架、渲染、物理、音频等。

#### 目录结构
```
Engine/
├── Classes/              # 类声明（头文件）
│   ├── Engine/           # 引擎核心类
│   ├── GameFramework/    # 游戏框架
│   ├── Components/       # 组件
│   ├── Animation/        # 动画
│   ├── Materials/        # 材质
│   ├── Sound/            # 音频
│   ├── PhysicsEngine/    # 物理
│   ├── AI/               # AI
│   └── ...
├── Public/               # 公共头文件
├── Private/              # 实现文件
└── Engine.Build.cs       # 构建配置
```

#### 核心子系统

**3.1 游戏框架 (GameFramework/)**

```cpp
// 游戏模式
AGameModeBase             # 游戏模式基类
AGameMode                 # 完整游戏模式（带状态机）
AGameSession              # 游戏会话
AGameStateBase            # 游戏状态基类
AGameState                # 完整游戏状态

// 玩家
APlayerController         # 玩家控制器
APlayerState              # 玩家状态
APlayerCameraManager      # 相机管理
AHUD                      # HUD 基类

// Actor
AActor                    # 所有游戏对象基类
APawn                     # 可控制对象
ACharacter                # 角色（带移动组件）
AInfo                     # 信息类（不渲染）
```

**3.2 组件系统 (Components/)**

```cpp
// 场景组件
USceneComponent           # 位置/旋转/缩放
├── UPrimitiveComponent   # 可渲染图元
│   ├── UMeshComponent    # 网格组件
│   │   ├── UStaticMeshComponent    # 静态网格
│   │   ├── USkeletalMeshComponent  # 骨骼网格
│   │   └── UInstancedStaticMeshComponent # 实例化网格
│   ├── UShapeComponent   # 形状组件
│   │   ├── UBoxComponent
│   │   ├── USphereComponent
│   │   ├── UCapsuleComponent
│   │   └── UBrushComponent
│   └── ULandscapeComponent # 地形组件
├── UCameraComponent      # 相机
├── UArrowComponent       # 箭头（调试）
├── UChildActorComponent  # 子 Actor
└── UAudioComponent       # 音频

// 功能组件
UActorComponent           # 组件基类
├── UMovementComponent    # 移动组件
│   ├── UCharacterMovementComponent
│   ├── UFloatingPawnMovement
│   └── UProjectileMovementComponent
├── UInputComponent       # 输入组件
├── UActorTickComponent   # Tick 组件
└── URotatingMovementComponent
```

**3.3 Actor 生命周期**

```cpp
// 生命周期顺序
1. UObject::PostInitProperties()    # 对象初始化后
2. AActor::PostActorCreated()       # Actor 创建后
3. UActorComponent::OnComponentCreated() # 组件创建后
4. AActor::BeginPlay()              # 游戏开始
5. UActorComponent::BeginPlay()     # 组件游戏开始
6. Tick()                           # 每帧更新
7. UActorComponent::EndPlay()       # 组件结束
8. AActor::EndPlay()                # Actor 结束
9. UObject::BeginDestroy()          # 开始销毁
10. UObject::FinishDestroy()        # 销毁完成
```

**3.4 Tick 系统**

```cpp
// Actor Tick
virtual void Tick(float DeltaTime) override;

// 组件 Tick
virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

// Tick 设置
PrimaryActorTick.bCanEverTick = true;
PrimaryActorTick.bStartWithTickEnabled = true;
PrimaryActorTick.TickInterval = 0.0f; // 每帧

// Tick 组
ETickingGroup::TG_PrePhysics
ETickingGroup::TG_StartPhysics
ETickingGroup::TG_DuringPhysics
ETickingGroup::TG_EndPhysics
ETickingGroup::TG_PostPhysics
ETickingGroup::TG_PostUpdateWork
```

**3.5 渲染系统**

```cpp
// 渲染核心
FRendererModule             # 渲染器模块
FSceneViewFamily            # 视图族
FSceneView                  # 单个视图
FSceneProxy                 # 场景代理
FPrimitiveSceneProxy        # 图元场景代理
FLightSceneProxy            # 光源场景代理

// 材质系统
UMaterialInterface          # 材质接口
UMaterial                   # 材质
UMaterialInstance           # 材质实例
UMaterialInstanceDynamic    # 动态材质实例
FMaterialRenderProxy        # 材质渲染代理

// 网格渲染
FStaticMeshRenderData       # 静态网格渲染数据
FSkeletalMeshRenderData     # 骨骼网格渲染数据
FMeshBatch                  # 网格批次
FMeshBatchElement           # 网格批次元素

// 着色器
FShader                     # 着色器基类
FGlobalShader               # 全局着色器
FMaterialShader             # 材质着色器
FMeshMaterialShader         # 网格材质着色器
```

**3.6 物理系统**

```cpp
// 物理引擎
FPhysScene                  # 物理场景
FBodyInstance               # 物理体实例
UPrimitiveComponent::GetBodyInstance()

// 碰撞
FCollisionProfileName       # 碰撞配置名
ECollisionChannel           # 碰撞通道
FCollisionResponseContainer # 碰撞响应容器
FHitResult                  # 命中结果

// 物理查询
LineTraceSingleByChannel()
LineTraceMultiByChannel()
SweepSingleByChannel()
OverlapMultiByChannel()

// 物理约束
UPhysicsConstraintComponent # 物理约束组件
```

**3.7 动画系统**

```cpp
// 骨骼网格
USkeletalMesh               # 骨骼网格资产
USkeletalMeshComponent      # 骨骼网格组件
FReferenceSkeleton          # 参考骨骼

// 动画序列
UAnimationAsset             # 动画资产基类
UAnimSequence               # 动画序列
UAnimMontage                # 动画蒙太奇
UAnimComposite              # 动画复合
UAnimBlendSpace             # 动画混合空间

// 动画蓝图
UAnimInstance               # 动画实例
UAnimBlueprintGeneratedClass # 动画蓝图生成类

// 状态机
FAnimNode_StateMachine      # 状态机节点
FAnimNode_Base              # 动画节点基类
```

**3.8 音频系统**

```cpp
// 音频资产
USoundBase                  # 音频基类
USoundCue                   # 音频线索
USoundWave                  # 音频波形
USoundMix                   # 音频混合
USoundAttenuation           # 音频衰减

// 音频组件
UAudioComponent             # 音频组件
FAudioComponentPool         # 音频组件池

// 音频系统
FAudioDevice                # 音频设备
FSoundSource                # 音频源
```

---

## 编辑器模块

### 4.1 编辑器核心

**路径**: `Engine/Source/Editor/`

```
Editor/
├── UnrealEd/             # 编辑器核心
├── LevelEditor/          # 关卡编辑器
├── PropertyEditor/       # 属性编辑器
├── DetailCustomizations/ # 细节面板自定义
├── ContentBrowser/       # 内容浏览器
├── Kismet/               # 蓝图编辑器
├── AnimationEditor/      # 动画编辑器
├── MaterialEditor/       # 材质编辑器
├── StaticMeshEditor/     # 静态网格编辑器
├── SkeletalMeshEditor/   # 骨骼网格编辑器
└── ...                   # 其他编辑器
```

### 4.2 编辑器扩展

```cpp
// 编辑器模块
IModuleInterface
IAssetEditor            # 资产编辑器接口
IAssetTypeActions       # 资产类型动作

// 工具栏扩展
FExtender               # 扩展器
FToolBarBuilder         # 工具栏构建器
FMenuBuilder            # 菜单构建器

// 自定义面板
IDetailCustomization    # 细节面板自定义
IDetailRootObjectCustomization

// 资产编辑器
FAssetEditorManager     # 资产编辑器管理器
```

---

## 开发者工具模块

### 5.1 自动化测试

**路径**: `Engine/Source/Developer/AutomationController/`

```cpp
// 测试框架
FAutomationTestBase     # 自动化测试基类
IMPLEMENT_SIMPLE_AUTOMATION_TEST # 实现简单测试

// 测试宏
BEGIN_DEFINE_SPEC(MyTestSpec, "Category.TestName", EAutomationTestFlags::ApplicationContextMask | EAutomationTestFlags::ProductFilter)
END_DEFINE_SPEC

// 断言
TestEqual("Description", Actual, Expected)
TestTrue("Description", Condition)
TestFalse("Description", Condition)
TestNull("Description", Pointer)
TestNotNull("Description", Pointer)
```

### 5.2 性能分析

```cpp
// 性能分析宏
SCOPE_CYCLE_COUNTER(STAT_MyStat)
DECLARE_STATS_GROUP(TEXT("MyGroup"), STATGROUP_MyGroup, STATCAT_Advanced)
DECLARE_CYCLE_STAT(TEXT("MyStat"), STAT_MyStat, STATGROUP_MyGroup)

// CSV 分析
CSV_SCOPED_TIMING_STAT(MyCategory, MyStat)

// GPU 分析
SCOPED_GPU_EVENT(RHICmdList, MyEvent)
```

---

## 构建系统

### 6.1 模块构建文件

```csharp
// MyModule.Build.cs
using UnrealBuildTool;

public class MyModule : ModuleRules
{
    public MyModule(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;
        
        PublicDependencyModuleNames.AddRange(new string[] {
            "Core",
            "CoreUObject",
            "Engine",
            "InputCore"
        });
        
        PrivateDependencyModuleNames.AddRange(new string[] {
            "Slate",
            "SlateCore",
            "UMG"
        });
        
        // 条件编译
        if (Target.Platform == UnrealTargetPlatform.Win64)
        {
            PublicDefinitions.Add("MY_PLATFORM_WINDOWS");
        }
    }
}
```

### 6.2 目标构建文件

```csharp
// MyGame.Target.cs
using UnrealBuildTool;

public class MyGameTarget : TargetRules
{
    public MyGameTarget(TargetInfo Target) : base(Target)
    {
        Type = TargetType.Game;
        DefaultBuildSettings = BuildSettingsVersion.V2;
        ExtraModuleNames.AddRange(new string[] { "MyGame" });
    }
}

// MyGameEditor.Target.cs
public class MyGameEditorTarget : TargetRules
{
    public MyGameEditorTarget(TargetInfo Target) : base(Target)
    {
        Type = TargetType.Editor;
        DefaultBuildSettings = BuildSettingsVersion.V2;
        ExtraModuleNames.AddRange(new string[] { "MyGame" });
    }
}
```

---

## 源码阅读建议

### 阅读顺序

1. **Core 模块** → 理解基础类型和系统
2. **CoreUObject 模块** → 理解 UObject 系统
3. **Engine 模块** → 理解游戏框架
4. **特定子系统** → 根据需求深入

### 重要文件

```
Core/Public/CoreMinimal.h          # 最常包含的头文件
CoreUObject/Public/UObject/Object.h # UObject 基类
Engine/Classes/Engine/Engine.h      # 引擎主头文件
Engine/Classes/GameFramework/Actor.h # AActor 基类
```

### 调试技巧

```cpp
// 断点
FPlatformMisc::DebugBreak()

// 日志
UE_LOG(LogTemp, Warning, TEXT("Debug: %s"), *MyString)

// 绘制调试信息
DrawDebugLine(World, Start, End, FColor::Red, false, 5.0f)
DrawDebugSphere(World, Location, Radius, 12, FColor::Green)

// 屏幕消息
GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, TEXT("Message"))

// 确保宏
ensure(MyPointer != nullptr)
ensureMsgf(Condition, TEXT("Error: %s"), *Message)
check(Condition) // 仅 Debug
checkf(Condition, TEXT("Error: %s"), *Message)
```

---

## 常见问题

### Q: 为什么 UE 不使用 STL？

UE 使用自定义容器的原因：
1. 跨平台一致性
2. 内存分配器集成
3. 反射系统支持
4. 性能优化（如 TArray 的内存布局）
5. 调试支持

### Q: UPROPERTY 和 UFUNCTION 的作用？

这些宏为反射系统提供元数据：
- 序列化
- 蓝图集成
- 垃圾回收
- 编辑器属性面板
- 网络复制

### Q: 如何添加新模块？

1. 创建模块目录
2. 创建 `.Build.cs` 文件
3. 创建模块头文件和实现
4. 在 `.uproject` 或父模块中添加依赖

---

## 参考资源

- [UE 官方文档](https://docs.unrealengine.com/)
- [UE 源码 GitHub](https://github.com/EpicGames/UnrealEngine)
- [UE Wiki](https://wiki.unrealengine.com/)
- [Tom Looman 的 UE 教程](https://www.tomlooman.com/)

---

*本指南基于 UE 4.26 源码版创建，路径：`D:\SoftWave\UnrealEngine\UE4.26\UE_4.26`*
