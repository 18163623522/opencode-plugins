# Niagara 函数完整列表文档

## 目录
1. [蓝图函数库](#蓝图函数库)
2. [数据接口数组函数库](#数据接口数组函数库)
3. [数据通道函数库](#数据通道函数库)
4. [SimCache 函数库](#simcache-函数库)
5. [内置模块函数](#内置模块函数)
6. [数据接口函数](#数据接口函数)
7. [VectorVM 函数](#vectorvm-函数)

---

## 蓝图函数库

### UNiagaraFunctionLibrary

**文件位置**: `Source/Niagara/Public/NiagaraFunctionLibrary.h`

#### 生成粒子系统

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `SpawnSystemAtLocation` | `WorldContextObject, SystemTemplate, SpawnLocation, SpawnRotation, Scale, bAutoDestroy, bAutoActivate` | `UNiagaraComponent*` | 在世界位置生成粒子系统 |
| `SpawnSystemAtLocationWithParams` | `FFXSystemSpawnParameters SpawnParams` | `UNiagaraComponent*` | 使用参数结构体在世界位置生成粒子系统 |
| `SpawnSystemAttached` | `SystemTemplate, AttachToComponent, AttachPointName, Location, Rotation, LocationType, bAutoDestroy, bAutoActivate` | `UNiagaraComponent*` | 在组件上附加粒子系统 |
| `SpawnSystemAttachedWithParams` | `FFXSystemSpawnParameters SpawnParams` | `UNiagaraComponent*` | 使用参数结构体在组件上附加粒子系统 |

#### 纹理对象设置

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `SetTextureObject` | `NiagaraSystem, OverrideName, Texture` | `void` | 设置 Niagara 纹理数据接口用户参数 |
| `SetTexture2DArrayObject` | `NiagaraSystem, OverrideName, Texture2DArray` | `void` | 设置 Niagara 2D 数组纹理数据接口用户参数 |
| `SetVolumeTextureObject` | `NiagaraSystem, OverrideName, VolumeTexture` | `void` | 设置 Niagara 体积纹理数据接口用户参数 |

#### 渲染目标覆盖

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `Override NiagaraSystemSceneCapture2D` | `NiagaraSystem, OverrideName, SceneCapture2D, ManagedCaptureSource, ManagedTextureSize, ManagedTextureFormat, ManagedProjectionType, ManagedFOVAngle, ManagedOrthoWidth, bManagedCaptureEveryFrame, bManagedCaptureOnMovement, ShowOnlyActors` | `void` | 覆盖 Niagara 场景捕获 2D 数据接口 |

#### 用户参数查询

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetAllUserParameters` | `NiagaraSystem` | `TArray<FNiagaraUserParameterInfo>` | 返回 Niagara 系统的所有用户参数信息 |
| `GetAllEmitters` | `NiagaraSystem` | `TArray<FNiagaraMinimalEmitterInfo>` | 返回 Niagara 系统的所有发射器信息 |

#### 数据接口访问

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetDataInterface` | `DIClass, NiagaraSystem, OverrideName` | `UNiagaraDataInterface*` | 查找指定类的数据接口 |
| `GetDataInterface<T>` | `NiagaraSystem, OverrideName` | `TDIType*` | 模板版本，查找指定类型的数据接口 |

#### 参数集合

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetNiagaraParameterCollection` | `WorldContextObject, Collection` | `UNiagaraParameterCollectionInstance*` | 获取参数集合实例 |
| `CreateNiagaraParameterCollectionInstance` | `WorldContextObject, ParentCollection` | `UNiagaraParameterCollectionInstance*` | 创建参数集合实例 |

#### GPU 射线追踪碰撞

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `SetComponentNiagaraGPURayTracedCollisionGroup` | `WorldContextObject, Primitive, CollisionGroup` | `void` | 设置组件的 GPU 射线追踪碰撞组 |
| `SetActorNiagaraGPURayTracedCollisionGroup` | `WorldContextObject, Actor, CollisionGroup` | `void` | 设置 Actor 的 GPU 射线追踪碰撞组 |
| `AcquireNiagaraGPURayTracedCollisionGroup` | `WorldContextObject` | `int32` | 获取空闲的碰撞组 |
| `ReleaseNiagaraGPURayTracedCollisionGroup` | `WorldContextObject, CollisionGroup` | `void` | 释放碰撞组 |

#### 内部函数

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetVectorVMFastPathOps` | `bIgnoreConsoleVariable` | `const TArray<FNiagaraFunctionSignature>&` | 获取 VectorVM 快速路径操作 |
| `DefineFunctionHLSL` | `FunctionSignature, HlslOutput` | `bool` | 定义 HLSL 函数 |
| `GetVectorVMFastPathExternalFunction` | `BindingInfo, OutFunc` | `bool` | 获取 VectorVM 快速路径外部函数 |

---

## 数据接口数组函数库

### UNiagaraDataInterfaceArrayFunctionLibrary

**文件位置**: `Source/Niagara/Classes/NiagaraDataInterfaceArrayFunctionLibrary.h`

#### 设置数组数据

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `SetNiagaraArrayFloat` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置浮点数组 |
| `SetNiagaraArrayVector2D` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置 2D 向量数组 |
| `SetNiagaraArrayVector` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置向量数组 |
| `SetNiagaraArrayPosition` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置位置数组 |
| `SetNiagaraArrayVector4` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置 4D 向量数组 |
| `SetNiagaraArrayColor` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置颜色数组 |
| `SetNiagaraArrayQuat` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置四元数数组 |
| `SetNiagaraArrayMatrix` | `NiagaraSystem, OverrideName, ArrayData, bApplyLWCRebase` | `void` | 设置矩阵数组 |
| `SetNiagaraArrayInt32` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置 Int32 数组 |
| `SetNiagaraArrayUInt8` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置 UInt8 数组 |
| `SetNiagaraArrayBool` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置布尔数组 |
| `SetNiagaraArrayNiagaraID` | `NiagaraSystem, OverrideName, ArrayData` | `void` | 设置 Niagara ID 数组 |

#### 获取数组数据

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetNiagaraArrayFloat` | `NiagaraSystem, OverrideName` | `TArray<float>` | 获取浮点数组 |
| `GetNiagaraArrayVector2D` | `NiagaraSystem, OverrideName` | `TArray<FVector2D>` | 获取 2D 向量数组 |
| `GetNiagaraArrayVector` | `NiagaraSystem, OverrideName` | `TArray<FVector>` | 获取向量数组 |
| `GetNiagaraArrayPosition` | `NiagaraSystem, OverrideName` | `TArray<FVector>` | 获取位置数组 |
| `GetNiagaraArrayVector4` | `NiagaraSystem, OverrideName` | `TArray<FVector4>` | 获取 4D 向量数组 |
| `GetNiagaraArrayColor` | `NiagaraSystem, OverrideName` | `TArray<FLinearColor>` | 获取颜色数组 |
| `GetNiagaraArrayQuat` | `NiagaraSystem, OverrideName` | `TArray<FQuat>` | 获取四元数数组 |
| `GetNiagaraArrayMatrix` | `NiagaraSystem, OverrideName` | `TArray<FMatrix>` | 获取矩阵数组 |
| `GetNiagaraArrayInt32` | `NiagaraSystem, OverrideName` | `TArray<int32>` | 获取 Int32 数组 |
| `GetNiagaraArrayUInt8` | `NiagaraSystem, OverrideName` | `TArray<int32>` | 获取 UInt8 数组 |
| `GetNiagaraArrayBool` | `NiagaraSystem, OverrideName` | `TArray<bool>` | 获取布尔数组 |
| `GetNiagaraArrayNiagaraID` | `NiagaraSystem, OverrideName` | `TArray<FNiagaraID>` | 获取 Niagara ID 数组 |

#### 获取单个数组值

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetNiagaraArrayFloatValue` | `NiagaraSystem, OverrideName, Index` | `float` | 获取浮点数组单个值 |
| `GetNiagaraArrayVector2DValue` | `NiagaraSystem, OverrideName, Index` | `FVector2D` | 获取 2D 向量数组单个值 |
| `GetNiagaraArrayVectorValue` | `NiagaraSystem, OverrideName, Index` | `FVector` | 获取向量数组单个值 |
| `GetNiagaraArrayPositionValue` | `NiagaraSystem, OverrideName, Index` | `FVector` | 获取位置数组单个值 |
| `GetNiagaraArrayVector4Value` | `NiagaraSystem, OverrideName, Index` | `FVector4` | 获取 4D 向量数组单个值 |
| `GetNiagaraArrayColorValue` | `NiagaraSystem, OverrideName, Index` | `FLinearColor` | 获取颜色数组单个值 |
| `GetNiagaraArrayQuatValue` | `NiagaraSystem, OverrideName, Index` | `FQuat` | 获取四元数数组单个值 |
| `GetNiagaraArrayMatrixValue` | `NiagaraSystem, OverrideName, Index, bApplyLWCRebase` | `FMatrix` | 获取矩阵数组单个值 |
| `GetNiagaraArrayInt32Value` | `NiagaraSystem, OverrideName, Index` | `int32` | 获取 Int32 数组单个值 |
| `GetNiagaraArrayUInt8Value` | `NiagaraSystem, OverrideName, Index` | `int32` | 获取 UInt8 数组单个值 |
| `GetNiagaraArrayBoolValue` | `NiagaraSystem, OverrideName, Index` | `bool` | 获取布尔数组单个值 |

#### C++ 专用函数

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `SetNiagaraArrayInt32` | `NiagaraSystem, OverrideName, TConstArrayView<int64>` | `void` | 设置 Int32 数组 (C++ 版本) |
| `SetNiagaraArrayFloat` | `NiagaraSystem, OverrideName, TConstArrayView<double>` | `void` | 设置浮点数组 (C++ 版本) |
| `SetNiagaraArrayVector2D` | `NiagaraSystem, OverrideName, TConstArrayView<FVector2f>` | `void` | 设置 2D 向量数组 (C++ 版本) |
| `SetNiagaraArrayVector` | `NiagaraSystem, OverrideName, TConstArrayView<FVector3f>` | `void` | 设置向量数组 (C++ 版本) |
| `SetNiagaraArrayVector4` | `NiagaraSystem, OverrideName, TConstArrayView<FVector4f>` | `void` | 设置 4D 向量数组 (C++ 版本) |
| `SetNiagaraArrayQuat` | `NiagaraSystem, OverrideName, TConstArrayView<FQuat4f>` | `void` | 设置四元数数组 (C++ 版本) |
| `SetNiagaraArrayMatrix` | `NiagaraSystem, OverrideName, TConstArrayView<FMatrix44f>` | `void` | 设置矩阵数组 (C++ 版本) |
| `SetNiagaraArrayUInt8` | `NiagaraSystem, OverrideName, TConstArrayView<uint8>` | `void` | 设置 UInt8 数组 (C++ 版本) |

---

## 数据通道函数库

### UNiagaraDataChannelLibrary

**文件位置**: `Source/Niagara/Public/NiagaraDataChannelFunctionLibrary.h`

#### 数据通道访问

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetNiagaraDataChannel` | `WorldContextObject, Channel` | `UNiagaraDataChannelHandler*` | 获取数据通道处理器 |

#### 写入数据通道 (Legacy)

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `WriteToNiagaraDataChannel` | `WorldContextObject, Channel, SearchParams, Count, bVisibleToGame, bVisibleToCPU, bVisibleToGPU, DebugSource` | `UNiagaraDataChannelWriter*` | 写入数据通道 (Legacy) |

#### 读取数据通道 (Legacy)

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `ReadFromNiagaraDataChannel` | `WorldContextObject, Channel, SearchParams, bReadPreviousFrame` | `UNiagaraDataChannelReader*` | 读取数据通道 (Legacy) |

#### 获取数据通道元素数量 (Legacy)

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetDataChannelElementCount` | `WorldContextObject, Channel, SearchParams, bReadPreviousFrame` | `int32` | 获取数据通道元素数量 (Legacy) |

#### 写入数据通道 (新版)

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `WriteToNiagaraDataChannel_WithContext` | `WorldContextObject, Channel, AccessContext, Count, bVisibleToBlueprint, bVisibleToNiagaraCPU, bVisibleToNiagaraGPU, DebugSource` | `UNiagaraDataChannelWriter*` | 写入数据通道 |

#### 读取数据通道 (新版)

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `ReadFromNiagaraDataChannel_WithContext` | `WorldContextObject, Channel, AccessContext, bReadPreviousFrame` | `UNiagaraDataChannelReader*` | 读取数据通道 |

#### 获取数据通道元素数量 (新版)

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `GetDataChannelElementCount_WithContext` | `WorldContextObject, Channel, AccessContext, bReadPreviousFrame` | `int32` | 获取数据通道元素数量 |

#### 订阅数据通道

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `SubscribeToNiagaraDataChannel` | `WorldContextObject, Channel, AccessContext, UpdateDelegate, bReadPreviousFrame` | `FNDCToGameSubscribeDelegate` | 订阅数据通道更新 |

#### NDC 访问上下文操作

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `MakeNDCAccessContextInstance` | `WorldContextObject, Channel, SearchParams` | `FNDCAccessContextInst` | 创建 NDC 访问上下文实例 |
| `GetMembersInNDCAccessContextInstance` | `AccessContext, ContextStruct` | `void` | 获取 NDC 访问上下文实例成员 |
| `SetMembersInNDCAccessContextInstance` | `AccessContext, ContextStruct` | `void` | 设置 NDC 访问上下文实例成员 |
| `GetSinglePropertyInNDCAccessContextInstance` | `AccessContext, ContextStruct, PropertyName, Value` | `void` | 获取 NDC 访问上下文实例中的单个属性 |
| `SetSinglePropertyInNDCAccessContextInstance` | `AccessContext, ContextStruct, PropertyName, Value` | `void` | 设置 NDC 访问上下文实例中的单个属性 |

---

## SimCache 函数库

### UNiagaraSimCacheFunctionLibrary

**文件位置**: `Source/Niagara/Classes/NiagaraSimCacheFunctionLibrary.h`

#### 同步捕获

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `CaptureNiagaraSimCacheImmediate` | `SimCache, CreateParameters, NiagaraComponent, OutSimCache, bAdvanceSimulation, AdvanceDeltaTime` | `bool` | 立即捕获模拟缓存 |

#### 创建缓存

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `CreateNiagaraSimCache` | `WorldContextObject` | `UNiagaraSimCache*` | 创建模拟缓存对象 |

### UAsyncNiagaraCaptureSimCache

#### 异步捕获

| 函数名 | 参数 | 返回值 | 说明 |
|--------|------|--------|------|
| `CaptureNiagaraSimCacheMultiFrame` | `SimCache, CreateParameters, NiagaraComponent, OutSimCache, NumFrames, CaptureRate, bAdvanceSimulation, AdvanceDeltaTime` | `UAsyncNiagaraCaptureSimCache*` | 异步捕获多帧模拟缓存 |
| `CaptureNiagaraSimCacheUntilComplete` | `SimCache, CreateParameters, NiagaraComponent, OutSimCache, CaptureRate, bAdvanceSimulation, AdvanceDeltaTime` | `UAsyncNiagaraCaptureSimCache*` | 异步捕获模拟缓存直到完成 |
| `CaptureNiagaraSimCache` | `SimCache, CreateParameters, NiagaraComponent, CaptureParameters, OutSimCache` | `UAsyncNiagaraCaptureSimCache*` | 异步捕获模拟缓存 (自定义参数) |

---

## 内置模块函数

### Stateless 模块

**文件位置**: `Source/Niagara/Internal/Stateless/Modules/`

#### 粒子初始化模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `InitializeParticle` | `NiagaraStatelessModule_InitializeParticle.h` | 初始化粒子属性 |

#### 位置模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `ShapeLocation` | `NiagaraStatelessModule_ShapeLocation.h` | 在形状内生成粒子位置 |

#### 速度模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `AddVelocity` | `NiagaraStatelessModule_AddVelocity.h` | 添加速度 |
| `CalculateAccurateVelocity` | `NiagaraStatelessModule_CalculateAccurateVelocity.h` | 计算精确速度 |
| `SolveVelocitiesAndForces` | `NiagaraStatelessModule_SolveVelocitiesAndForces.h` | 求解速度和力 |

#### 力模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `AccelerationForce` | `NiagaraStatelessModule_AccelerationForce.h` | 加速力 |
| `GravityForce` | `NiagaraStatelessModule_GravityForce.h` | 重力 |
| `Drag` | `NiagaraStatelessModule_Drag.h` | 阻力 |
| `CurlNoiseForce` | `NiagaraStatelessModule_CurlNoiseForce.h` | 卷曲噪声力 |

#### 缩放模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `ScaleSpriteSize` | `NiagaraStatelessModule_ScaleSpriteSize.h` | 缩放精灵大小 |
| `ScaleSpriteSizeBySpeed` | `NiagaraStatelessModule_ScaleSpriteSizeBySpeed.h` | 按速度缩放精灵大小 |
| `ScaleMeshSize` | `NiagaraStatelessModule_ScaleMeshSize.h` | 缩放网格大小 |
| `ScaleMeshSizeBySpeed` | `NiagaraStatelessModule_ScaleMeshSizeBySpeed.h` | 按速度缩放网格大小 |
| `ScaleRibbonWidth` | `NiagaraStatelessModule_ScaleRibbonWidth.h` | 缩放 Ribbon 宽度 |
| `ScaleColor` | `NiagaraStatelessModule_ScaleColor.h` | 缩放颜色 |

#### 旋转模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `SpriteRotationRate` | `NiagaraStatelessModule_SpriteRotationRate.h` | 精灵旋转速率 |
| `MeshRotationRate` | `NiagaraStatelessModule_MeshRotationRate.h` | 网格旋转速率 |
| `SpriteFacingAndAlignment` | `NiagaraStatelessModule_SpriteFacingAndAlignment.h` | 精灵朝向和对齐 |
| `InitialMeshOrientation` | `NiagaraStatelessModule_InitialMeshOrientation.h` | 初始网格方向 |
| `RotateAroundPoint` | `NiagaraStatelessModule_RotateAroundPoint.h` | 围绕点旋转 |

#### 网格模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `MeshIndex` | `NiagaraStatelessModule_MeshIndex.h` | 网格索引 |

#### 材质模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `DynamicMaterialParameters` | `NiagaraStatelessModule_DynamicMaterialParameters.h` | 动态材质参数 |
| `DecalAttributes` | `NiagaraStatelessModule_DecalAttributes.h` | 贴花属性 |

#### 光照模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `LightAttributes` | `NiagaraStatelessModule_LightAttributes.h` | 光源属性 |

#### UV 动画模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `SubUVAnimation` | `NiagaraStatelessModule_SubUVAnimation.h` | SubUV 动画 |

#### 相机模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `CameraOffset` | `NiagaraStatelessModule_CameraOffset.h` | 相机偏移 |

#### Owner 模块

| 模块名 | 文件 | 说明 |
|--------|------|------|
| `ApplyOwnerScaleToAttributes` | `NiagaraStatelessModule_ApplyOwnerScaleToAttributes.h` | 应用 Owner 缩放到属性 |

---

## 数据接口函数

### 数据接口基类

**文件位置**: `Source/NiagaraCore/Public/NiagaraDataInterfaceBase.h`

#### 虚函数接口

| 函数名 | 说明 |
|--------|------|
| `CanExecuteOnTarget` | 检查是否可以在目标上执行 |
| `InitPerInstanceData` | 初始化每实例数据 |
| `DestroyPerInstanceData` | 销毁每实例数据 |
| `GetShaderParameters` | 获取着色器参数 |
| `SetShaderParameters` | 设置着色器参数 |
| `ReadFloat` | 读取浮点值 |
| `ReadVector` | 读取向量值 |
| `WriteFloat` | 写入浮点值 |
| `WriteVector` | 写入向量值 |

### 常用数据接口

#### 静态网格体数据接口

**文件**: `NiagaraDataInterfaceStaticMesh.h`

| 函数名 | 说明 |
|--------|------|
| `GetMeshVertices` | 获取网格顶点 |
| `GetMeshNormals` | 获取网格法线 |
| `SampleSurface` | 在表面随机采样 |

#### 骨骼网格体数据接口

**文件**: `NiagaraDataInterfaceSkeletalMesh.h`

| 函数名 | 说明 |
|--------|------|
| `GetBoneTransform` | 获取骨骼变换 |
| `SampleSkeletalMesh` | 在骨骼网格体表面采样 |

#### 碰撞数据接口

**文件**: `NiagaraDataInterfaceCollision.h`

| 函数名 | 说明 |
|--------|------|
| `Raycast` | 射线检测 |
| `SphereOverlap` | 球体重叠检测 |

#### 音频数据接口

**文件**: `NiagaraDataInterfaceAudioSpectrum.h`

| 函数名 | 说明 |
|--------|------|
| `GetAudioSpectrum` | 获取音频频谱 |
| `GetAudioVolume` | 获取音量 |

#### 渲染目标数据接口

**文件**: `NiagaraDataInterfaceRenderTarget2D.h`

| 函数名 | 说明 |
|--------|------|
| `ReadPixel` | 读取像素颜色 |
| `WritePixel` | 写入像素颜色 |

#### 曲线数据接口

**文件**: `NiagaraDataInterfaceCurve.h`

| 函数名 | 说明 |
|--------|------|
| `EvalFloatCurve` | 评估浮点曲线 |
| `EvalColorCurve` | 评估颜色曲线 |

#### 纹理数据接口

**文件**: `NiagaraDataInterfaceTexture.h`

| 函数名 | 说明 |
|--------|------|
| `SampleTexture` | 采样纹理 |
| `ReadTexturePixel` | 读取纹理像素 |

#### 数据表数据接口

**文件**: `NiagaraDataInterfaceDataTable.h`

| 函数名 | 说明 |
|--------|------|
| `GetTableRow` | 获取数据表行 |
| `GetTableCell` | 获取数据表单元格 |

#### 虚拟纹理数据接口

**文件**: `NiagaraDataInterfaceVirtualTexture.h`

| 函数名 | 说明 |
|--------|------|
| `SampleVirtualTexture` | 采样虚拟纹理 |

#### GBuffer 数据接口

**文件**: `NiagaraDataInterfaceGBuffer.h`

| 函数名 | 说明 |
|--------|------|
| `ReadGBuffer` | 读取 GBuffer 数据 |

#### 场景捕获 2D 数据接口

**文件**: `NiagaraDataInterfaceSceneCapture2D.h`

| 函数名 | 说明 |
|--------|------|
| `CaptureScene` | 捕获场景 |
| `GetCaptureTexture` | 获取捕获纹理 |

#### SimCache 读取器数据接口

**文件**: `NiagaraDataInterfaceSimCacheReader.h`

| 函数名 | 说明 |
|--------|------|
| `ReadSimCache` | 读取模拟缓存 |

#### UObject 属性读取器数据接口

**文件**: `NiagaraDataInterfaceUObjectPropertyReader.h`

| 函数名 | 说明 |
|--------|------|
| `ReadObjectProperty` | 读取 UObject 属性 |

#### 动态网格数据接口

**文件**: `NiagaraDataInterfaceDynamicMesh.h`

| 函数名 | 说明 |
|--------|------|
| `GetMeshData` | 获取网格数据 |
| `UpdateMesh` | 更新网格 |

#### 调试绘制数据接口

**文件**: `NiagaraDataInterfaceDebugDraw.h`

| 函数名 | 说明 |
|--------|------|
| `DrawDebugLine` | 绘制调试线 |
| `DrawDebugPoint` | 绘制调试点 |
| `DrawDebugSphere` | 绘制调试球 |

#### 物理资产数据接口

**文件**: `NiagaraDataInterfacePhysicsAsset.h`

| 函数名 | 说明 |
|--------|------|
| `SamplePhysicsAsset` | 采样物理资产 |

#### 刚体碰撞查询数据接口

**文件**: `NiagaraDataInterfaceRigidMeshCollisionQuery.h`

| 函数名 | 说明 |
|--------|------|
| `QueryCollision` | 查询碰撞 |

#### 异步 GPU 追踪数据接口

**文件**: `NiagaraDataInterfaceAsyncGpuTrace.h`

| 函数名 | 说明 |
|--------|------|
| `TraceRay` | GPU 射线追踪 |

#### 数据通道写入数据接口

**文件**: `NiagaraDataInterfaceDataChannelWrite.h`

| 函数名 | 说明 |
|--------|------|
| `WriteToChannel` | 写入数据通道 |

#### 数据通道读取数据接口

**文件**: `NiagaraDataInterfaceDataChannelRead.h`

| 函数名 | 说明 |
|--------|------|
| `ReadFromChannel` | 从数据通道读取 |

#### 相机数据接口

**文件**: `NiagaraDataInterfaceCamera.h`

| 函数名 | 说明 |
|--------|------|
| `GetCameraTransform` | 获取相机变换 |
| `GetCameraFOV` | 获取相机 FOV |

#### 音频频谱数据接口

**文件**: `NiagaraDataInterfaceAudioSpectrum.h`

| 函数名 | 说明 |
|--------|------|
| `GetSpectrumData` | 获取频谱数据 |

#### 音频振荡器数据接口

**文件**: `NiagaraDataInterfaceAudioOscilloscope.h`

| 函数名 | 说明 |
|--------|------|
| `GetOscilloscopeData` | 获取振荡器数据 |

#### 音频播放器数据接口

**文件**: `NiagaraDataInterfaceAudioPlayer.h`

| 函数名 | 说明 |
|--------|------|
| `PlayAudio` | 播放音频 |
| `StopAudio` | 停止音频 |

#### Curl 噪声数据接口

**文件**: `NiagaraDataInterfaceCurlNoise.h`

| 函数名 | 说明 |
|--------|------|
| `SampleCurlNoise` | 采样 Curl 噪声 |

#### 立方体纹理数据接口

**文件**: `NiagaraDataInterfaceCubeTexture.h`

| 函数名 | 说明 |
|--------|------|
| `SampleCubeTexture` | 采样立方体纹理 |

#### 2D 数组纹理数据接口

**文件**: `NiagaraDataInterface2DArrayTexture.h`

| 函数名 | 说明 |
|--------|------|
| `Sample2DArrayTexture` | 采样 2D 数组纹理 |

#### Grid3D 集合数据接口

**文件**: `NiagaraDataInterfaceGrid3DCollection.h`

| 函数名 | 说明 |
|--------|------|
| `ReadGridCell` | 读取网格单元 |
| `WriteGridCell` | 写入网格单元 |

#### Grid3D 集合实用工具

**文件**: `NiagaraDataInterfaceGrid3DCollectionUtils.h`

| 函数名 | 说明 |
|--------|------|
| `GetGridNeighbors` | 获取网格邻居 |
| `InterpolateGrid` | 插值网格 |

#### 材质实例动态数据接口

**文件**: `NiagaraDataInterfaceMaterialInstanceDynamic.h`

| 函数名 | 说明 |
|--------|------|
| `SetMaterialParameter` | 设置材质参数 |

#### 材质参数集合数据接口

**文件**: `NiagaraDataInterfaceMaterialParameterCollection.h`

| 函数名 | 说明 |
|--------|------|
| `GetCollectionParameter` | 获取集合参数 |
| `SetCollectionParameter` | 设置集合参数 |

#### 发射器绑定数据接口

**文件**: `NiagaraDataInterfaceEmitterBinding.h`

| 函数名 | 说明 |
|--------|------|
| `BindToEmitter` | 绑定到发射器 |
| `GetBoundEmitter` | 获取绑定的发射器 |

#### 绑定实例数据接口

**文件**: `NiagaraDataInterfaceBindingInstance.h`

| 函数名 | 说明 |
|--------|------|
| `CreateBinding` | 创建绑定 |
| `DestroyBinding` | 销毁绑定 |

---

## VectorVM 函数

### 数学函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `Add` | `float Add(float A, float B)` | 加法 |
| `Subtract` | `float Subtract(float A, float B)` | 减法 |
| `Multiply` | `float Multiply(float A, float B)` | 乘法 |
| `Divide` | `float Divide(float A, float B)` | 除法 |
| `Modulo` | `float Modulo(float A, float B)` | 取模 |
| `Abs` | `float Abs(float A)` | 绝对值 |
| `Floor` | `float Floor(float A)` | 向下取整 |
| `Ceil` | `float Ceil(float A)` | 向上取整 |
| `Round` | `float Round(float A)` | 四舍五入 |
| `Clamp` | `float Clamp(float A, float Min, float Max)` | 钳制 |
| `Min` | `float Min(float A, float B)` | 最小值 |
| `Max` | `float Max(float A, float B)` | 最大值 |
| `Sqrt` | `float Sqrt(float A)` | 平方根 |
| `Pow` | `float Pow(float A, float B)` | 幂运算 |
| `Log` | `float Log(float A)` | 对数 |
| `Log2` | `float Log2(float A)` | 以 2 为底的对数 |
| `Log10` | `float Log10(float A)` | 以 10 为底的对数 |
| `Exp` | `float Exp(float A)` | 指数 |
| `Sin` | `float Sin(float A)` | 正弦 |
| `Cos` | `float Cos(float A)` | 余弦 |
| `Tan` | `float Tan(float A)` | 正切 |
| `Asin` | `float Asin(float A)` | 反正弦 |
| `Acos` | `float Acos(float A)` | 反余弦 |
| `Atan` | `float Atan(float A)` | 反正切 |
| `Atan2` | `float Atan2(float Y, float X)` | 反正切 (双参数) |

### 向量函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `VectorAdd` | `Vector3f VectorAdd(Vector3f A, Vector3f B)` | 向量加法 |
| `VectorSubtract` | `Vector3f VectorSubtract(Vector3f A, Vector3f B)` | 向量减法 |
| `VectorMultiply` | `Vector3f VectorMultiply(Vector3f A, float B)` | 向量乘法 |
| `VectorDivide` | `Vector3f VectorDivide(Vector3f A, float B)` | 向量除法 |
| `VectorDot` | `float VectorDot(Vector3f A, Vector3f B)` | 向量点积 |
| `VectorCross` | `Vector3f VectorCross(Vector3f A, Vector3f B)` | 向量叉积 |
| `VectorNormalize` | `Vector3f VectorNormalize(Vector3f A)` | 向量归一化 |
| `VectorLength` | `float VectorLength(Vector3f A)` | 向量长度 |
| `VectorLengthSquared` | `float VectorLengthSquared(Vector3f A)` | 向量长度平方 |
| `VectorDistance` | `float VectorDistance(Vector3f A, Vector3f B)` | 向量距离 |
| `VectorLerp` | `Vector3f VectorLerp(Vector3f A, Vector3f B, float Alpha)` | 向量线性插值 |
| `VectorRotate` | `Vector3f VectorRotate(Vector3f A, Quat4f B)` | 向量旋转 |
| `VectorAbs` | `Vector3f VectorAbs(Vector3f A)` | 向量绝对值 |
| `VectorMin` | `Vector3f VectorMin(Vector3f A, Vector3f B)` | 向量最小值 |
| `VectorMax` | `Vector3f VectorMax(Vector3f A, Vector3f B)` | 向量最大值 |

### 插值函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `Lerp` | `float Lerp(float A, float B, float Alpha)` | 线性插值 |
| `VLerp` | `Vector3f VLerp(Vector3f A, Vector3f B, float Alpha)` | 向量线性插值 |
| `Slerp` | `Quat4f Slerp(Quat4f A, Quat4f B, float Alpha)` | 球面线性插值 |
| `SmoothStep` | `float SmoothStep(float A, float B, float Alpha)` | 平滑步进 |
| `SmootherStep` | `float SmootherStep(float A, float B, float Alpha)` | 更平滑步进 |

### 随机函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `RandomFloat` | `float RandomFloat()` | 随机浮点数 |
| `RandomVector` | `Vector3f RandomVector()` | 随机向量 |
| `RandomFloatFromStream` | `float RandomFloatFromStream(int32 Stream)` | 从流中获取随机浮点数 |
| `RandomVectorFromStream` | `Vector3f RandomVectorFromStream(int32 Stream)` | 从流中获取随机向量 |

### 比较函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `Equal` | `bool Equal(float A, float B)` | 等于 |
| `NotEqual` | `bool NotEqual(float A, float B)` | 不等于 |
| `Greater` | `bool Greater(float A, float B)` | 大于 |
| `Less` | `bool Less(float A, float B)` | 小于 |
| `GreaterEqual` | `bool GreaterEqual(float A, float B)` | 大于等于 |
| `LessEqual` | `bool LessEqual(float A, float B)` | 小于等于 |

### 逻辑函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `And` | `bool And(bool A, bool B)` | 逻辑与 |
| `Or` | `bool Or(bool A, bool B)` | 逻辑或 |
| `Not` | `bool Not(bool A)` | 逻辑非 |
| `Select` | `float Select(bool Condition, float True, float False)` | 条件选择 |

### 转换函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `FloatToInt` | `int32 FloatToInt(float A)` | 浮点转整数 |
| `IntToFloat` | `float IntToFloat(int32 A)` | 整数转浮点 |
| `FloatToVector` | `Vector3f FloatToVector(float A)` | 浮点转向量 |
| `VectorToFloat` | `float VectorToFloat(Vector3f A)` | 向量转浮点 |

### 噪声函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `Noise1D` | `float Noise1D(float A)` | 1D 噪声 |
| `Noise2D` | `float Noise2D(float A, float B)` | 2D 噪声 |
| `Noise3D` | `float Noise3D(float A, float B, float C)` | 3D 噪声 |
| `CurlNoise` | `Vector3f CurlNoise(Vector3f A)` | Curl 噪声 |

### 矩阵函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `MatrixMultiply` | `Matrix44f MatrixMultiply(Matrix44f A, Matrix44f B)` | 矩阵乘法 |
| `MatrixInverse` | `Matrix44f MatrixInverse(Matrix44f A)` | 矩阵逆 |
| `MatrixTranspose` | `Matrix44f MatrixTranspose(Matrix44f A)` | 矩阵转置 |
| `MatrixTransformVector` | `Vector3f MatrixTransformVector(Matrix44f A, Vector3f B)` | 矩阵变换向量 |

### 四元数函数

| 函数名 | 签名 | 说明 |
|--------|------|------|
| `QuatMultiply` | `Quat4f QuatMultiply(Quat4f A, Quat4f B)` | 四元数乘法 |
| `QuatInverse` | `Quat4f QuatInverse(Quat4f A)` | 四元数逆 |
| `QuatRotateVector` | `Vector3f QuatRotateVector(Quat4f A, Vector3f B)` | 四元数旋转向量 |
| `QuatFromAxisAngle` | `Quat4f QuatFromAxisAngle(Vector3f Axis, float Angle)` | 从轴角创建四元数 |
| `QuatToAxisAngle` | `void QuatToAxisAngle(Quat4f A, Vector3f& Axis, float& Angle)` | 四元数转轴角 |
| `QuatSlerp` | `Quat4f QuatSlerp(Quat4f A, Quat4f B, float Alpha)` | 四元数球面线性插值 |

---

## 总结

Niagara 提供了丰富的函数库，包括：

1. **蓝图函数库** - 用于生成、控制和查询 Niagara 系统
2. **数据接口数组函数库** - 用于操作 Niagara 数组数据
3. **数据通道函数库** - 用于 Niagara 系统之间的通信
4. **SimCache 函数库** - 用于捕获和回放模拟缓存
5. **内置模块函数** - 用于粒子行为控制
6. **数据接口函数** - 用于与外部数据源交互
7. **VectorVM 函数** - 用于数学、向量、插值、随机等计算

通过熟练掌握这些函数，你可以创建出功能强大、性能优异的粒子效果。

---

**文档创建日期**: 2026年6月5日
**维护者**: 团子
**版本**: 1.0.0
