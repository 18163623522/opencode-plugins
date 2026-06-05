# UE 4.26 源码详细解释文档

## 目录
1. [Core 模块详解](#core-模块详解)
2. [CoreUObject 模块详解](#coreuobject-模块详解)
3. [Engine 模块详解](#engine-模块详解)
4. [关键设计模式](#关键设计模式)
5. [源码阅读技巧](#源码阅读技巧)

---

## Core 模块详解

### 1. 容器类系统

#### TArray - 动态数组

**文件位置**: `Engine/Source/Runtime/Core/Public/Containers/Array.h`

TArray 是 UE4 中最常用的容器，类似于 std::vector，但提供了更多功能。

**核心特性**:
```cpp
template<typename T, typename Allocator = FDefaultAllocator>
class TArray
{
public:
    // 类型定义
    typedef T ElementType;
    typedef int32 SizeType;
    
    // 添加元素
    void Add(const T& Item);
    void Add(T&& Item);
    int32 AddUnique(const T& Item);
    void Insert(const T& Item, int32 Index);
    
    // 删除元素
    void Remove(const T& Item);
    void RemoveAt(int32 Index);
    void RemoveAll(const T& Item);
    void Empty();
    
    // 查询
    int32 Num() const;
    bool IsValidIndex(int32 Index) const;
    int32 Find(const T& Item) const;
    bool Contains(const T& Item) const;
    
    // 排序
    void Sort();
    template<typename Predicate>
    void Sort(const Predicate& Pred);
    
    // 迭代器
    TIterator begin();
    TIterator end();
};
```

**内存管理**:
- 使用 Allocator 模板参数控制内存分配策略
- 默认使用 FDefaultAllocator（堆分配）
- 支持 TInlineAllocator<N> 用于小数组优化

**使用示例**:
```cpp
// 创建数组
TArray<int32> Numbers;

// 添加元素
Numbers.Add(1);
Numbers.Add(2);
Numbers.Add(3);

// 访问元素
int32 First = Numbers[0];

// 查找
int32 Index = Numbers.Find(2);

// 排序
Numbers.Sort([](int32 A, int32 B) { return A < B; });

// 范围遍历
for (int32 Num : Numbers)
{
    UE_LOG(LogTemp, Log, TEXT("Number: %d"), Num);
}
```

#### TMap - 哈希映射

**文件位置**: `Engine/Source/Runtime/Core/Public/Containers/Map.h`

TMap 是基于哈希表的键值对容器。

**核心特性**:
```cpp
template<typename KeyType, typename ValueType, 
         typename SetAllocator = FDefaultSetAllocator,
         typename KeyFuncs = TDefaultMapKeyFuncs<KeyType, ValueType>>
class TMap
{
public:
    // 添加元素
    void Add(const KeyType& Key, const ValueType& Value);
    ValueType& FindOrAdd(const KeyType& Key);
    
    // 查找
    ValueType* Find(const KeyType& Key);
    const ValueType* Find(const KeyType& Key) const;
    bool Contains(const KeyType& Key) const;
    
    // 删除
    bool Remove(const KeyType& Key);
    void Empty();
    
    // 查询
    int32 Num() const;
    
    // 迭代
    TIterator begin();
    TIterator end();
};
```

**使用示例**:
```cpp
// 创建映射
TMap<FString, int32> NameToAge;

// 添加元素
NameToAge.Add("Alice", 30);
NameToAge.Add("Bob", 25);

// 查找
int32* Age = NameToAge.Find("Alice");
if (Age)
{
    UE_LOG(LogTemp, Log, TEXT("Alice's age: %d"), *Age);
}

// 检查是否存在
if (NameToAge.Contains("Charlie"))
{
    // ...
}
```

#### TSet - 哈希集合

**文件位置**: `Engine/Source/Runtime/Core/Public/Containers/Set.h`

TSet 是基于哈希表的集合容器，元素唯一。

**核心特性**:
```cpp
template<typename ElementType, typename KeyFuncs = DefaultKeyFuncs<ElementType>,
         typename Allocator = FDefaultSetAllocator>
class TSet
{
public:
    // 添加元素
    void Add(const ElementType& Element);
    bool AddUnique(const ElementType& Element);
    
    // 查找
    bool Contains(const ElementType& Element) const;
    const ElementType* Find(const ElementType& Element) const;
    
    // 删除
    bool Remove(const ElementType& Element);
    
    // 集合运算
    TSet Union(const TSet& Other) const;
    TSet Intersect(const TSet& Other) const;
    TSet Difference(const TSet& Other) const;
};
```

#### FString - 字符串

**文件位置**: `Engine/Source/Runtime/Core/Public/Containers/UnrealString.h`

FString 是 UE4 的字符串类，类似于 std::string，但提供了更多功能。

**核心特性**:
```cpp
class FString
{
public:
    // 构造
    FString();
    FString(const TCHAR* Src);
    FString(const FString& Other);
    
    // 操作
    int32 Len() const;
    bool IsEmpty() const;
    void Empty();
    
    // 查找
    int32 Find(const TCHAR* SubStr, ESearchCase::Type SearchCase = ESearchCase::IgnoreCase) const;
    bool Contains(const TCHAR* SubStr) const;
    
    // 转换
    int32 ToInt() const;
    float ToFloat() const;
    FString ToLower() const;
    FString ToUpper() const;
    
    // 格式化
    static FString Printf(const TCHAR* Fmt, ...);
    
    // 运算符重载
    FString operator+(const FString& Other) const;
    FString& operator+=(const FString& Other);
    bool operator==(const FString& Other) const;
};
```

**使用示例**:
```cpp
// 创建字符串
FString Name = TEXT("Unreal Engine");

// 格式化
FString Message = FString::Printf(TEXT("Hello, %s! Version: %d"), *Name, 4);

// 查找
if (Name.Contains(TEXT("Unreal")))
{
    // ...
}

// 转换
FString NumberStr = TEXT("42");
int32 Number = FCString::Atoi(*NumberStr);
```

#### FName - 名称

**文件位置**: `Engine/Source/Runtime/Core/Public/UObject/NameTypes.h`

FName 是用于标识资源、属性等的轻量级名称类型。

**核心特性**:
```cpp
class FName
{
public:
    // 构造
    FName();
    FName(const TCHAR* Name);
    FName(FString Name);
    
    // 比较（不区分大小写）
    bool operator==(const FName& Other) const;
    bool operator!=(const FName& Other) const;
    
    // 转换
    FString ToString() const;
    const TCHAR* operator*() const;
    
    // 查询
    bool IsNone() const;
    int32 GetNumber() const;
};
```

**使用示例**:
```cpp
// 创建名称
FName BoneName = TEXT("spine_01");
FName SocketName = TEXT("Muzzle");

// 比较
if (BoneName == TEXT("spine_01"))
{
    // ...
}

// 转换为字符串
FString NameStr = BoneName.ToString();
```

#### FText - 本地化文本

**文件位置**: `Engine/Source/Runtime/Core/Public/Internationalization/Text.h`

FText 用于支持本地化的文本。

**核心特性**:
```cpp
class FText
{
public:
    // 构造
    FText();
    FText(const FString& InText);
    
    // 创建
    static FText FromString(const FString& InString);
    static FText Format(const FText& Fmt, ...);
    static FText AsNumber(int32 Value);
    
    // 转换
    FString ToString() const;
    
    // 比较
    bool operator==(const FText& Other) const;
};
```

### 2. 委托系统

**文件位置**: `Engine/Source/Runtime/Core/Public/Delegates/Delegate.h`

UE4 的委托系统是事件驱动编程的核心。

#### 单播委托

```cpp
// 声明委托类型
DECLARE_DELEGATE(FSimpleDelegate);
DECLARE_DELEGATE_OneParam(FStringDelegate, const FString&);
DECLARE_DELEGATE_RetVal(bool, FBoolDelegate);

// 使用委托
class FMyClass
{
    FSimpleDelegate OnComplete;
    FStringDelegate OnMessage;
    
    void BindDelegates()
    {
        // 绑定成员函数
        OnComplete.BindRaw(this, &FMyClass::HandleComplete);
        
        // 绑定 Lambda
        OnMessage.BindLambda([](const FString& Msg)
        {
            UE_LOG(LogTemp, Log, TEXT("Message: %s"), *Msg);
        });
    }
    
    void BroadcastDelegates()
    {
        // 执行委托
        OnComplete.ExecuteIfBound();
        OnMessage.ExecuteIfBound(TEXT("Hello"));
    }
    
    void HandleComplete()
    {
        UE_LOG(LogTemp, Log, TEXT("Complete!"));
    }
};
```

#### 多播委托

```cpp
// 声明多播委托类型
DECLARE_MULTICAST_DELEGATE(FMulticastDelegate);
DECLARE_MULTICAST_DELEGATE_OneParam(FOnDamage, float);

// 使用多播委托
class AMyActor : public AActor
{
    FOnDamage OnDamageReceived;
    
    void BindDelegates()
    {
        // 绑定成员函数
        OnDamageReceived.AddUObject(this, &AMyActor::HandleDamage);
        
        // 绑定 Lambda
        OnDamageReceived.AddLambda([](float Damage)
        {
            UE_LOG(LogTemp, Log, TEXT("Damage: %f"), Damage);
        });
    }
    
    void TakeDamage(float Damage)
    {
        // 广播给所有绑定的函数
        OnDamageReceived.Broadcast(Damage);
    }
    
    void HandleDamage(float Damage)
    {
        // 处理伤害
    }
};
```

#### 动态委托

```cpp
// 声明动态委托（可序列化，可在蓝图中使用）
DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnHealthChanged, float, NewHealth);

UCLASS()
class AMyCharacter : public ACharacter
{
    GENERATED_BODY()
    
public:
    // 蓝图可绑定的事件
    UPROPERTY(BlueprintAssignable, Category = "Events")
    FOnHealthChanged OnHealthChanged;
    
    void SetHealth(float NewHealth)
    {
        Health = NewHealth;
        OnHealthChanged.Broadcast(NewHealth);
    }
};
```

### 3. 智能指针

**文件位置**: `Engine/Source/Runtime/Core/Public/Templates/SharedPointer.h`

#### TSharedPtr - 共享指针

```cpp
// 创建共享指针
TSharedPtr<FMyObject> SharedObj = MakeShared<FMyObject>();

// 访问对象
SharedObj->DoSomething();

// 检查是否有效
if (SharedObj.IsValid())
{
    // ...
}

// 获取原始指针
FMyObject* RawPtr = SharedObj.Get();
```

#### TWeakPtr - 弱指针

```cpp
// 创建弱指针
TWeakPtr<FMyObject> WeakObj = SharedObj;

// 检查对象是否仍然存在
if (WeakObj.IsValid())
{
    // 提升为共享指针
    TSharedPtr<FMyObject> PinnedObj = WeakObj.Pin();
    if (PinnedObj.IsValid())
    {
        PinnedObj->DoSomething();
    }
}
```

#### TUniquePtr - 独占指针

```cpp
// 创建独占指针
TUniquePtr<FMyObject> UniqueObj = MakeUnique<FMyObject>();

// 访问对象
UniqueObj->DoSomething();

// 转移所有权
TUniquePtr<FMyObject> MovedObj = MoveTemp(UniqueObj);
```

### 4. 数学库

**文件位置**: `Engine/Source/Runtime/Core/Public/Math/`

#### FVector - 三维向量

```cpp
struct FVector
{
    float X, Y, Z;
    
    // 构造
    FVector();
    FVector(float InX, float InY, float InZ);
    
    // 运算
    FVector operator+(const FVector& Other) const;
    FVector operator-(const FVector& Other) const;
    FVector operator*(float Scale) const;
    
    // 方法
    float Size() const;
    float SizeSquared() const;
    FVector GetSafeNormal() const;
    float Dot(const FVector& Other) const;
    FVector Cross(const FVector& Other) const;
    float Distance(const FVector& Other) const;
    
    // 常量
    static const FVector ZeroVector;
    static const FVector UpVector;      // (0, 0, 1)
    static const FVector ForwardVector; // (1, 0, 0)
    static const FVector RightVector;   // (0, 1, 0)
};
```

#### FRotator - 旋转

```cpp
struct FRotator
{
    float Pitch; // 俯仰角
    float Yaw;   // 偏航角
    float Roll;  // 翻滚角
    
    // 构造
    FRotator();
    FRotator(float InPitch, float InYaw, float InRoll);
    
    // 方法
    FVector Vector() const;
    FQuat Quaternion() const;
    FRotator GetNormalized() const;
    
    // 常量
    static const FRotator ZeroRotator;
};
```

#### FTransform - 变换

```cpp
struct FTransform
{
    FQuat Rotation;
    FVector Translation;
    FVector Scale3D;
    
    // 构造
    FTransform();
    FTransform(const FRotator& InRotation);
    FTransform(const FVector& InTranslation);
    FTransform(const FRotator& InRotation, const FVector& InTranslation, const FVector& InScale);
    
    // 方法
    FVector GetLocation() const;
    FRotator GetRotation() const;
    FVector GetScale3D() const;
    
    // 变换操作
    FVector TransformPosition(const FVector& V) const;
    FVector TransformVector(const FVector& V) const;
    FTransform operator*(const FTransform& Other) const;
    
    // 逆变换
    FTransform Inverse() const;
};
```

### 5. 模块系统

**文件位置**: `Engine/Source/Runtime/Core/Public/Modules/ModuleManager.h`

```cpp
// 定义模块接口
class IMyModule : public IModuleInterface
{
public:
    virtual void StartupModule() override;
    virtual void ShutdownModule() override;
    virtual bool IsGameModule() const override;
    
    // 自定义接口
    virtual void DoSomething() = 0;
};

// 实现模块
class FMyModule : public IMyModule
{
public:
    virtual void StartupModule() override
    {
        UE_LOG(LogTemp, Log, TEXT("MyModule started"));
    }
    
    virtual void ShutdownModule() override
    {
        UE_LOG(LogTemp, Log, TEXT("MyModule shutdown"));
    }
    
    virtual void DoSomething() override
    {
        // 实现
    }
};

// 注册模块
IMPLEMENT_MODULE(FMyModule, MyModule);

// 获取模块
IMyModule& MyModule = FModuleManager::GetModuleChecked<IMyModule>("MyModule");
MyModule.DoSomething();
```

### 6. 日志系统

**文件位置**: `Engine/Source/Runtime/Core/Public/Logging/LogMacros.h`

```cpp
// 声明日志类别
DECLARE_LOG_CATEGORY_EXTERN(LogMyGame, Log, All);

// 定义日志类别
DEFINE_LOG_CATEGORY(LogMyGame);

// 使用日志
void SomeFunction()
{
    // 基本日志
    UE_LOG(LogMyGame, Log, TEXT("This is a log message"));
    
    // 警告
    UE_LOG(LogMyGame, Warning, TEXT("This is a warning"));
    
    // 错误
    UE_LOG(LogMyGame, Error, TEXT("This is an error"));
    
    // 格式化日志
    FString Name = TEXT("Player");
    int32 Health = 100;
    UE_LOG(LogMyGame, Log, TEXT("%s has %d health"), *Name, Health);
}
```

---

## CoreUObject 模块详解

### 1. UObject 系统

**文件位置**: `Engine/Source/Runtime/CoreUObject/Public/UObject/Object.h`

UObject 是所有 UE4 对象的基类，提供了反射、序列化、垃圾回收等核心功能。

#### UObject 基类

```cpp
class COREUOBJECT_API UObject : public UObjectBaseUtility
{
public:
    // 构造函数
    UObject();
    UObject(const FObjectInitializer& ObjectInitializer);
    
    // 对象信息
    virtual FString GetDetailedInfoInternal() const;
    virtual void PostInitProperties();
    virtual void PostCDOContruct();
    
    // 序列化
    virtual void Serialize(FArchive& Ar);
    
    // 销毁
    virtual void BeginDestroy();
    virtual void FinishDestroy();
    
    // 标记为需要销毁
    void MarkPendingKill();
    
    // 获取类信息
    UClass* GetClass() const;
    FName GetFName() const;
    UObject* GetOuter() const;
    
    // 子对象
    template<class TReturnType>
    TReturnType* CreateDefaultSubobject(FName SubobjectName, UClass* ReturnType = TReturnType::StaticClass());
    
    // 查找子对象
    UObject* GetDefaultSubobjectByName(FName ToFind);
    
    // 获取所有子对象
    void GetDefaultSubobjects(TArray<UObject*>& OutDefaultSubobjects);
};
```

#### 对象生命周期

```cpp
// 创建对象
UMyObject* NewObj = NewObject<UMyObject>(GetOuter(), UMyObject::StaticClass(), NAME_None);

// 销毁对象
NewObj->MarkPendingKill();
// 或者
NewObj->ConditionalBeginDestroy();

// 检查对象是否有效
if (IsValid(NewObj))
{
    // 对象有效
}

// 检查对象是否被标记为待销毁
if (NewObj->IsPendingKill())
{
    // 对象即将被销毁
}
```

### 2. 反射系统

**文件位置**: `Engine/Source/Runtime/CoreUObject/Public/UObject/Class.h`

反射系统允许在运行时检查和操作类、属性、函数。

#### 类定义宏

```cpp
UCLASS(BlueprintType, Blueprintable, meta=(ShortTooltip="My custom class"))
class MYGAME_API UMyObject : public UObject
{
    GENERATED_BODY()
    
public:
    // 属性
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Settings")
    FString Name;
    
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Stats")
    int32 Health;
    
    UPROPERTY(EditDefaultsOnly, Category = "Settings")
    float Speed;
    
    // 函数
    UFUNCTION(BlueprintCallable, Category = "Actions")
    void DoSomething();
    
    UFUNCTION(BlueprintPure, Category = "Getters")
    FString GetName() const;
    
    // 蓝图实现事件
    UFUNCTION(BlueprintImplementableEvent, Category = "Events")
    void OnSomethingHappened();
    
    // 原生实现，蓝图可覆盖
    UFUNCTION(BlueprintNativeEvent, Category = "Events")
    void OnDamageReceived(float Damage);
    virtual void OnDamageReceived_Implementation(float Damage);
};
```

#### 属性说明符

```cpp
// 编辑器相关
UPROPERTY(EditAnywhere)           // 在任何地方可编辑
UPROPERTY(EditDefaultsOnly)       // 仅在类默认值中可编辑
UPROPERTY(EditInstanceOnly)       // 仅在实例中可编辑
UPROPERTY(VisibleAnywhere)        // 在任何地方可见（只读）
UPROPERTY(VisibleDefaultsOnly)    // 仅在类默认值中可见
UPROPERTY(VisibleInstanceOnly)    // 仅在实例中可见

// 蓝图相关
UPROPERTY(BlueprintReadWrite)     // 蓝图可读写
UPROPERTY(BlueprintReadOnly)      // 蓝图只读
UPROPERTY(BlueprintAssignable)    // 蓝图可绑定委托
UPROPERTY(BlueprintCallable)      // 蓝图可调用

// 网络相关
UPROPERTY(Replicated)             // 网络复制
UPROPERTY(ReplicatedUsing=OnRep_VarName) // 带回调的网络复制

// 分类和元数据
UPROPERTY(Category = "Settings", meta = (ClampMin = "0", ClampMax = "100"))
```

#### 函数说明符

```cpp
// 蓝图相关
UFUNCTION(BlueprintCallable)      // 蓝图可调用
UFUNCTION(BlueprintPure)          // 蓝图纯函数（无副作用）
UFUNCTION(BlueprintImplementableEvent) // 蓝图实现事件
UFUNCTION(BlueprintNativeEvent)   // 原生实现，蓝图可覆盖

// 网络相关
UFUNCTION(Server)                 // 服务器端执行
UFUNCTION(Client)                 // 客户端执行
UFUNCTION(NetMulticast)           // 多播执行

// 其他
UFUNCTION(Category = "Actions")   // 分类
UFUNCTION(meta = (DeprecatedFunction)) // 标记为已弃用
```

### 3. 垃圾回收系统

**文件位置**: `Engine/Source/Runtime/CoreUObject/UObject/GarbageCollection.cpp`

UE4 使用标记-清除垃圾回收器自动管理 UObject 生命周期。

#### GC 工作原理

1. **标记阶段**: 从根对象开始，遍历所有可达对象并标记
2. **清除阶段**: 销毁所有未标记的对象

#### GC 相关代码

```cpp
// 手动触发 GC
GEngine->ForceGarbageCollection(true);

// 在 GC 期间保持对象存活
UPROPERTY() // UPROPERTY 标记的指针会被 GC 追踪

// 添加自定义引用
void UMyObject::AddReferencedObjects(UObject* InThis, FReferenceCollector& Collector)
{
    UMyObject* This = CastChecked<UMyObject>(InThis);
    Collector.AddReferencedObject(This->MyReference);
    // 调用父类
    Super::AddReferencedObjects(InThis, Collector);
}

// 检查对象是否被 GC 管理
if (NewObj->IsRooted())
{
    // 对象被根化，不会被 GC 回收
}
```

#### GC 优化技巧

```cpp
// 1. 使用 UPROPERTY 标记所有 UObject 指针
UPROPERTY()
UMyObject* MyObject;

// 2. 避免循环引用
// 使用 TWeakObjectPtr 打破循环
TWeakObjectPtr<UMyObject> WeakRef;

// 3. 及时清理不需要的引用
MyObject = nullptr;

// 4. 使用 MarkPendingKill 标记不再需要的对象
MyObject->MarkPendingKill();
```

### 4. 序列化系统

**文件位置**: `Engine/Source/Runtime/CoreUObject/Public/Serialization/`

#### FArchive 序列化

```cpp
// 保存对象
void SaveObject(UMyObject* Obj, const FString& Filename)
{
    FBufferArchive ToBinary;
    Obj->Serialize(ToBinary);
    
    if (ToBinary.Num() > 0)
    {
        FFileHelper::SaveArrayToFile(ToBinary, *Filename);
    }
    ToBinary.FlushCache();
    ToBinary.Empty();
}

// 加载对象
void LoadObject(UMyObject* Obj, const FString& Filename)
{
    TArray<uint8> BinaryArray;
    if (!FFileHelper::LoadFileToArray(BinaryArray, *Filename))
    {
        return;
    }
    
    FMemoryReader FromBinary = FMemoryReader(BinaryArray, true);
    FromBinary.Seek(0);
    Obj->Serialize(FromBinary);
}
```

#### 自定义序列化

```cpp
class UMyObject : public UObject
{
    GENERATED_BODY()
    
    // 自定义序列化
    virtual void Serialize(FArchive& Ar) override
    {
        Super::Serialize(Ar);
        
        // 序列化基本类型
        Ar << MyInt;
        Ar << MyFloat;
        Ar << MyString;
        
        // 序列化数组
        Ar << MyArray;
        
        // 条件序列化
        if (Ar.IsSaving())
        {
            // 保存时的特殊处理
        }
        if (Ar.IsLoading())
        {
            // 加载时的特殊处理
        }
    }
};
```

---

## Engine 模块详解

### 1. 游戏框架

#### AGameModeBase - 游戏模式

**文件位置**: `Engine/Source/Runtime/Engine/Classes/GameFramework/GameModeBase.h`

```cpp
UCLASS()
class AMyGameMode : public AGameModeBase
{
    GENERATED_BODY()
    
public:
    AMyGameMode();
    
    // 游戏开始
    virtual void StartPlay() override;
    
    // 处理玩家登录
    virtual void PostLogin(APlayerController* NewPlayer) override;
    
    // 处理玩家登出
    virtual void Logout(AController* Exiting) override;
    
    // 生成默认 Pawn
    virtual UClass* GetDefaultPawnClassForController_Implementation(AController* InController) override;
    
    // 生成玩家
    virtual void RestartPlayer(AController* NewPlayer) override;
    
    // 游戏状态检查
    virtual bool ReadyToStartMatch_Implementation() override;
    virtual bool ReadyToEndMatch_Implementation() override;
};
```

#### APlayerController - 玩家控制器

**文件位置**: `Engine/Source/Runtime/Engine/Classes/GameFramework/PlayerController.h`

```cpp
UCLASS()
class AMyPlayerController : public APlayerController
{
    GENERATED_BODY()
    
public:
    // 输入处理
    virtual void SetupInputComponent() override;
    
    // 玩家输入
    void MoveForward(float Value);
    void MoveRight(float Value);
    void Turn(float Value);
    void LookUp(float Value);
    
    // 游戏逻辑
    void OnFire();
    void OnJump();
    
    // UI
    virtual void BeginPlay() override;
    virtual void Tick(float DeltaTime) override;
};
```

#### ACharacter - 角色

**文件位置**: `Engine/Source/Runtime/Engine/Classes/GameFramework/Character.h`

```cpp
UCLASS()
class AMyCharacter : public ACharacter
{
    GENERATED_BODY()
    
public:
    AMyCharacter();
    
    // 组件
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera)
    USpringArmComponent* CameraBoom;
    
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera)
    UCameraComponent* FollowCamera;
    
    // 属性
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Stats)
    float Health;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = Stats)
    float MaxHealth;
    
    // 方法
    UFUNCTION(BlueprintCallable, Category = "Combat")
    void TakeDamage(float DamageAmount);
    
    UFUNCTION(BlueprintCallable, Category = "Combat")
    void Heal(float HealAmount);
    
    // 蓝图事件
    UFUNCTION(BlueprintImplementableEvent, Category = "Events")
    void OnHealthChanged(float NewHealth);
    
protected:
    virtual void BeginPlay() override;
    virtual void Tick(float DeltaTime) override;
    
    // 输入
    virtual void SetupPlayerInputComponent(UInputComponent* PlayerInputComponent) override;
};
```

### 2. 组件系统

#### USceneComponent - 场景组件

**文件位置**: `Engine/Source/Runtime/Engine/Classes/Components/SceneComponent.h`

```cpp
UCLASS()
class USceneComponent : public UActorComponent
{
    GENERATED_BODY()
    
public:
    // 变换
    UPROPERTY(Replicated)
    FVector RelativeLocation;
    
    UPROPERTY(Replicated)
    FRotator RelativeRotation;
    
    UPROPERTY(Replicated)
    FVector RelativeScale3D;
    
    // 附加
    UPROPERTY(Replicated)
    USceneComponent* AttachParent;
    
    UPROPERTY(Replicated)
    TArray<USceneComponent*> AttachChildren;
    
    // 方法
    virtual void SetWorldLocation(const FVector& NewLocation);
    virtual void SetWorldRotation(const FRotator& NewRotation);
    virtual void SetWorldTransform(const FTransform& NewTransform);
    
    virtual void SetRelativeLocation(const FVector& NewLocation);
    virtual void SetRelativeRotation(const FRotator& NewRotation);
    
    FVector GetForwardVector() const;
    FVector GetRightVector() const;
    FVector GetUpVector() const;
    
    // 附加/分离
    void AttachToComponent(USceneComponent* Parent, FAttachmentTransformRules AttachmentRules);
    void DetachFromComponent(FDetachmentTransformRules DetachmentRules);
    
    // 碰撞体积
    UPROPERTY()
    APhysicsVolume* PhysicsVolume;
};
```

#### UPrimitiveComponent - 图元组件

**文件位置**: `Engine/Source/Runtime/Engine/Classes/Components/PrimitiveComponent.h`

```cpp
UCLASS()
class UPrimitiveComponent : public USceneComponent
{
    GENERATED_BODY()
    
public:
    // 渲染
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Rendering")
    UMaterialInterface* Material;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Rendering")
    bool bVisible;
    
    // 碰撞
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Collision")
    TEnumAsByte<ECollisionEnabled::Type> CollisionEnabled;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Collision")
    FCollisionResponseContainer CollisionResponses;
    
    // 物理
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Physics")
    bool bSimulatePhysics;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Physics")
    float Mass;
    
    // 方法
    virtual void SetMaterial(int32 ElementIndex, UMaterialInterface* Material);
    virtual void SetVisibility(bool bNewVisibility);
    
    // 碰撞
    virtual bool K2_SphereTraceComponent(const FVector& Start, const FVector& End, float Radius, FHitResult& HitResult);
    
    // 物理
    virtual void AddForce(const FVector& Force);
    virtual void AddImpulse(const FVector& Impulse);
    virtual void SetSimulatePhysics(bool bSimulate);
};
```

#### UStaticMeshComponent - 静态网格组件

**文件位置**: `Engine/Source/Runtime/Engine/Classes/Components/StaticMeshComponent.h`

```cpp
UCLASS()
class UStaticMeshComponent : public UMeshComponent
{
    GENERATED_BODY()
    
public:
    // 网格
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "StaticMesh")
    UStaticMesh* StaticMesh;
    
    // 方法
    UFUNCTION(BlueprintCallable, Category = "Rendering")
    bool SetStaticMesh(UStaticMesh* NewMesh);
    
    // 材质
    UFUNCTION(BlueprintCallable, Category = "Rendering")
    void SetMaterial(int32 ElementIndex, UMaterialInterface* Material);
    
    // 碰撞
    UFUNCTION(BlueprintCallable, Category = "Collision")
    void SetCollisionEnabled(ECollisionEnabled::Type NewType);
};
```

### 3. Actor 生命周期

**文件位置**: `Engine/Source/Runtime/Engine/Classes/GameFramework/Actor.h`

#### 生命周期阶段

```cpp
UCLASS()
class AMyActor : public AActor
{
    GENERATED_BODY()
    
public:
    // 1. 构造函数
    AMyActor();
    
    // 2. PostInitProperties - 属性初始化后
    virtual void PostInitProperties() override;
    
    // 3. PostInitializeComponents - 组件初始化后
    virtual void PostInitializeComponents() override;
    
    // 4. BeginPlay - 游戏开始
    virtual void BeginPlay() override;
    
    // 5. Tick - 每帧更新
    virtual void Tick(float DeltaTime) override;
    
    // 6. EndPlay - 游戏结束
    virtual void EndPlay(const EEndPlayReason::Type EndPlayReason) override;
    
    // 7. BeginDestroy - 开始销毁
    virtual void BeginDestroy() override;
    
    // 8. FinishDestroy - 完成销毁
    virtual void FinishDestroy() override;
    
    // 9. Destroyed - 销毁完成
    virtual void Destroyed() override;
    
protected:
    // 组件
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Components")
    UStaticMeshComponent* MeshComponent;
    
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Components")
    USphereComponent* CollisionComponent;
    
    // 属性
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Settings")
    float MoveSpeed;
    
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "State")
    bool bIsActive;
};
```

#### 生命周期流程图

```
构造函数 (Constructor)
    ↓
PostInitProperties()
    ↓
PostInitializeComponents()
    ↓
BeginPlay()
    ↓
Tick() [每帧调用]
    ↓
EndPlay()
    ↓
BeginDestroy()
    ↓
FinishDestroy()
```

### 4. 渲染系统

#### 渲染管线

```cpp
// 渲染线程主循环
void FRendererModule::RenderViewFamily()
{
    // 1. 初始化
    FSceneRenderer* Renderer = new FSceneRenderer(ViewFamily);
    
    // 2. 准备渲染数据
    Renderer->PrepareViewResources();
    
    // 3. 渲染
    Renderer->Render();
    
    // 4. 提交到 GPU
    Renderer->SubmitCommands();
}

// 渲染代理
class FStaticMeshSceneProxy : public FPrimitiveSceneProxy
{
public:
    FStaticMeshSceneProxy(UStaticMeshComponent* Component);
    
    // 获取渲染数据
    virtual FPrimitiveViewRelevance GetViewRelevance(const FSceneView* View) const override;
    
    // 绘制动态网格
    virtual void DrawDynamicElements(const FMeshBatch* Mesh, FMeshElementCollector& Collector) const override;
    
    // 绘制静态网格
    virtual void DrawStaticElements(FStaticPrimitiveDrawInterface* PDI) const override;
};
```

### 5. 物理系统

#### 物理场景

```cpp
// 物理场景管理
class FPhysScene
{
public:
    // 初始化
    void Init();
    
    // 模拟
    void StartPhysics(float DeltaTime);
    void EndPhysics(float DeltaTime);
    
    // 碰撞检测
    bool RaycastSingle(const FVector& Start, const FVector& End, FHitResult& HitResult);
    bool SweepSingle(const FVector& Start, const FVector& End, const FQuat& Rotation, const FCollisionShape& Shape, FHitResult& HitResult);
    
    // 物理体管理
    FBodyInstance* CreateBody(UObject* Owner);
    void DestroyBody(FBodyInstance* Body);
};

// 物理体实例
class FBodyInstance
{
public:
    // 属性
    float Mass;
    FVector CenterOfMass;
    FTransform MassSpaceOrientation;
    
    // 方法
    void SetLinearVelocity(const FVector& Velocity);
    void SetAngularVelocity(const FVector& Velocity);
    void AddForce(const FVector& Force);
    void AddImpulse(const FVector& Impulse);
    
    // 碰撞
    void SetCollisionEnabled(ECollisionEnabled::Type Type);
    void SetCollisionProfileName(FName ProfileName);
};
```

### 6. 动画系统

#### 动画实例

```cpp
UCLASS()
class UMyAnimInstance : public UAnimInstance
{
    GENERATED_BODY()
    
public:
    // 属性
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Animation")
    float Speed;
    
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Animation")
    float Direction;
    
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Animation")
    bool bIsFalling;
    
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Animation")
    bool bIsCrouching;
    
    // 动画蓝图事件
    UFUNCTION(BlueprintImplementableEvent, Category = "Animation")
    void OnAnimNotify(const FName& NotifyName);
    
protected:
    // 动画更新
    virtual void NativeUpdateAnimation(float DeltaSeconds) override;
    
    // 动画初始化
    virtual void NativeInitializeAnimation() override;
};
```

#### 动画状态机

```cpp
// 在动画蓝图中定义状态机
// 状态: Idle, Walk, Run, Jump, Fall
// 转换条件: Speed > 0, IsFalling, etc.

// 动画通知
UCLASS()
class UMyAnimNotify : public UAnimNotify
{
    GENERATED_BODY()
    
public:
    // 通知触发
    virtual void Notify(USkeletalMeshComponent* MeshComp, UAnimSequenceBase* Animation) override;
    
    // 通知名称
    virtual FString GetNotifyName_Implementation() const override;
};
```

---

## 关键设计模式

### 1. 组件模式

UE4 大量使用组件模式，通过组合而非继承来构建功能。

```cpp
// 组件化设计
UCLASS()
class AMyActor : public AActor
{
    GENERATED_BODY()
    
public:
    // 视觉组件
    UPROPERTY(VisibleAnywhere)
    UStaticMeshComponent* Mesh;
    
    // 碰撞组件
    UPROPERTY(VisibleAnywhere)
    USphereComponent* Collision;
    
    // 移动组件
    UPROPERTY(VisibleAnywhere)
    UCharacterMovementComponent* Movement;
    
    // 音频组件
    UPROPERTY(VisibleAnywhere)
    UAudioComponent* Audio;
    
    // 粒子组件
    UPROPERTY(VisibleAnywhere)
    UParticleSystemComponent* Particles;
    
    AMyActor()
    {
        // 创建组件
        Mesh = CreateDefaultSubobject<UStaticMeshComponent>(TEXT("Mesh"));
        RootComponent = Mesh;
        
        Collision = CreateDefaultSubobject<USphereComponent>(TEXT("Collision"));
        Collision->SetupAttachment(RootComponent);
        
        Audio = CreateDefaultSubobject<UAudioComponent>(TEXT("Audio"));
        Audio->SetupAttachment(RootComponent);
    }
};
```

### 2. 委托模式

用于事件驱动编程和解耦。

```cpp
// 事件发布者
UCLASS()
class AEventPublisher : public AActor
{
    GENERATED_BODY()
    
public:
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnSomethingHappened, int32, Value);
    
    UPROPERTY(BlueprintAssignable)
    FOnSomethingHappened OnSomethingHappened;
    
    void DoSomething()
    {
        // 触发事件
        OnSomethingHappened.Broadcast(42);
    }
};

// 事件订阅者
UCLASS()
class AEventSubscriber : public AActor
{
    GENERATED_BODY()
    
public:
    void BeginPlay()
    {
        Super::BeginPlay();
        
        // 查找发布者
        AEventPublisher* Publisher = FindActorOfClass<AEventPublisher>();
        if (Publisher)
        {
            // 绑定事件
            Publisher->OnSomethingHappened.AddDynamic(this, &AEventSubscriber::HandleSomething);
        }
    }
    
    UFUNCTION()
    void HandleSomething(int32 Value)
    {
        UE_LOG(LogTemp, Log, TEXT("Received: %d"), Value);
    }
};
```

### 3. 策略模式

通过接口和多态实现可替换的算法。

```cpp
// 移动策略接口
UINTERFACE()
class UMovementStrategy : public UInterface
{
    GENERATED_BODY()
};

class IMovementStrategy
{
    GENERATED_BODY()
    
public:
    virtual FVector CalculateMovement(const AActor* Actor, float DeltaTime) = 0;
};

// 直线移动策略
UCLASS()
class ULinearMovementStrategy : public UObject, public IMovementStrategy
{
    GENERATED_BODY()
    
public:
    virtual FVector CalculateMovement(const AActor* Actor, float DeltaTime) override
    {
        return Actor->GetActorForwardVector() * Speed * DeltaTime;
    }
    
    UPROPERTY(EditAnywhere)
    float Speed = 100.0f;
};

// 正弦波移动策略
UCLASS()
class USineWaveMovementStrategy : public UObject, public IMovementStrategy
{
    GENERATED_BODY()
    
public:
    virtual FVector CalculateMovement(const AActor* Actor, float DeltaTime) override
    {
        float Time = GetWorld()->GetTimeSeconds();
        float Offset = FMath::Sin(Time * Frequency) * Amplitude;
        return Actor->GetActorForwardVector() * Speed * DeltaTime + FVector(0, 0, Offset);
    }
    
    UPROPERTY(EditAnywhere)
    float Speed = 100.0f;
    
    UPROPERTY(EditAnywhere)
    float Frequency = 1.0f;
    
    UPROPERTY(EditAnywhere)
    float Amplitude = 50.0f;
};
```

### 4. 观察者模式

通过事件和委托实现。

```cpp
// 游戏事件管理器
UCLASS()
class UGameEventManager : public UGameInstanceSubsystem
{
    GENERATED_BODY()
    
public:
    // 游戏事件
    DECLARE_DYNAMIC_MULTICAST_DELEGATE(FOnGameStart);
    DECLARE_DYNAMIC_MULTICAST_DELEGATE(FOnGameEnd);
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnPlayerDeath, APlayerController*, Player);
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_TwoParams(FOnScoreChanged, int32, OldScore, int32, NewScore);
    
    UPROPERTY(BlueprintAssignable)
    FOnGameStart OnGameStart;
    
    UPROPERTY(BlueprintAssignable)
    FOnGameEnd OnGameEnd;
    
    UPROPERTY(BlueprintAssignable)
    FOnPlayerDeath OnPlayerDeath;
    
    UPROPERTY(BlueprintAssignable)
    FOnScoreChanged OnScoreChanged;
    
    // 触发事件
    void TriggerGameStart()
    {
        OnGameStart.Broadcast();
    }
    
    void TriggerPlayerDeath(APlayerController* Player)
    {
        OnPlayerDeath.Broadcast(Player);
    }
    
    void TriggerScoreChanged(int32 OldScore, int32 NewScore)
    {
        OnScoreChanged.Broadcast(OldScore, NewScore);
    }
};
```

---

## 源码阅读技巧

### 1. 使用 IDE 导航

- **跳转到定义**: F12
- **查找所有引用**: Shift+F12
- **转到文件**: Ctrl+T
- **转到符号**: Ctrl+Shift+T
- **查看调用层次**: Ctrl+K, Ctrl+T

### 2. 使用文档

- **官方文档**: https://docs.unrealengine.com
- **API 参考**: https://docs.unrealengine.com/API
- **源码注释**: 大多数类和方法都有详细注释

### 3. 调试技巧

```cpp
// 使用日志
UE_LOG(LogTemp, Log, TEXT("Debug: %s"), *SomeString);

// 使用断点
__debugbreak(); // 或 FPlatformMisc::DebugBreak();

// 使用屏幕显示
GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Red, TEXT("Debug Message"));

// 使用可视化调试
DrawDebugSphere(GetWorld(), Location, Radius, 12, FColor::Red, false, 5.0f);
```

### 4. 源码阅读顺序建议

1. **入门阶段**:
   - `Core/Public/Containers/` - 容器类
   - `Core/Public/Delegates/` - 委托系统
   - `CoreUObject/Public/UObject/Object.h` - UObject 基类

2. **进阶阶段**:
   - `CoreUObject/Public/UObject/Class.h` - 反射系统
   - `Engine/Classes/GameFramework/` - 游戏框架
   - `Engine/Classes/Components/` - 组件系统

3. **高级阶段**:
   - `Engine/Private/` - 引擎实现细节
   - `Renderer/` - 渲染系统
   - `PhysicsCore/` - 物理系统

### 5. 常用调试命令

```cpp
// 控制台命令
stat fps          // 显示帧率
stat game         // 显示游戏线程统计
stat scenerendering // 显示渲染统计
stat memory       // 显示内存统计

// 调试绘制
showdebug         // 显示调试信息
drawdebug ...     // 绘制调试形状
```

---

## 总结

UE 4.26 是一个庞大而复杂的代码库，理解其架构和设计模式对于开发高质量的游戏至关重要。本文档提供了：

1. **核心模块详解** - 容器、委托、智能指针、数学库
2. **对象系统详解** - UObject、反射、GC、序列化
3. **引擎模块详解** - 游戏框架、组件系统、生命周期
4. **设计模式** - 组件、委托、策略、观察者模式
5. **阅读技巧** - IDE 导航、调试、阅读顺序

通过系统地学习这些内容，你将能够：
- 理解 UE4 的核心架构
- 高效地使用引擎 API
- 阅读和理解引擎源码
- 开发高质量的游戏和工具

---

**文档创建日期**: 2026年6月5日
**维护者**: 团子
**版本**: 1.0.0
