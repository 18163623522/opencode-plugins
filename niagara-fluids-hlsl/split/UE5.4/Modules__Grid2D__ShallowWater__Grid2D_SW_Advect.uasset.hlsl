VelocityX = Input_VelocityX;
VelocityY = Input_VelocityY;
WaterDepth = Input_WaterDepth;
float Scale = DtOverDx * AdvectionVelocityMult;
float2 Index = float2(IndexX, IndexY);
float TmpVal;
float TmpA;
float TmpB;
float TmpC;
float2 TmpVector;
float3 SampleUnit;
  // advect x velocity
  // velocity.x is current sample, velocity.y is average of (x,y) and (x,y+1)
  float2 Velocity = float2(Input_VelocityX, Input_VelocityY);
  // velocity y is average
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY+1, TmpVector);
  TmpA = TmpVector.y;
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY+1, TmpVector);
  TmpB = TmpVector.y;
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY, TmpVector);
  TmpC = TmpVector.y;
  Velocity.y = .25 * (TmpA + TmpB + TmpC + Input_VelocityY);
  float2 SampleIndex = Index - Scale * Velocity;
  GridCollection.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
  GridCollection.SamplePreviousGridVector2DValue<Attribute = "Velocity">(SampleUnit, TmpVector);
  VelocityX = TmpVector.x;
  // advect y velocity
  // velocity.x is current sample, velocity.y is average of (x,y) and (x+1,y)
  // velocity x is average
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY, TmpVector);
  TmpA = TmpVector.x;
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY-1, TmpVector);
  TmpB = TmpVector.x;
  GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY-1, TmpVector);
  TmpC = TmpVector.x;
  Velocity.x = .25 * (TmpA + TmpB + TmpC + Input_VelocityX);
  float2 SampleIndex = Index - Scale * Velocity; 
  VelocityY = TmpVector.y;
  // advect depth
  // velocity.x is average of (x,y) and (x+1,y), velocity.y is average of (x,y) and (x,y+1)
  // velocity is average
  Velocity.x = .5 * (TmpVector.x + Input_VelocityX);
  Velocity.y = .5 * (TmpVector.y + Input_VelocityY);
  // @todo(dmp): this is needed to be stable, but not sure why...
  SampleUnit += 1e-6;
  float FillSrc;
  GridCollection.SamplePreviousGridFloatValue<Attribute = "IsCollider">(SampleUnit, FillSrc);
  GridCollection.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(SampleUnit, TmpVal);
  // account for a difference in fill value between source voxel and destination
  // you are fitting an amount of water in a tighter or bigger space
  WaterDepth = TmpVal * (1.- FillSrc) / (1.-Input_IsCollider);
// compute height
WaterHeight = Input_BottomContour + WaterDepth;
VelocityX = 0;
VelocityY = 0;
WaterDepth = 0;
WaterHeight = 0;
VelocityX = Input_Velocity.x;
VelocityY = Input_Velocity.y;
float2 Velocity;
float2 SampleIndex;
      // velocity.x is current sample, velocity.y is average of (x,y) and (x,y+1)
      Velocity = Input_Velocity;
      // velocity y is average
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY+1, TmpVector);
      TmpA = TmpVector.y;
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY+1, TmpVector);
      TmpB = TmpVector.y;
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX-1, IndexY, TmpVector);
      TmpC = TmpVector.y;
      Velocity.y = .25 * (TmpA + TmpB + TmpC + Input_Velocity.y);
      SampleIndex = Index - Scale * Velocity;
      GridCollection.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
      VelocityGrid.SamplePreviousGridVector2DValue<Attribute = "Velocity">(SampleUnit, TmpVector);
      VelocityX = TmpVector.x;
      // velocity.x is current sample, velocity.y is average of (x,y) and (x+1,y)
      // velocity x is average
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY, TmpVector);
      TmpA = TmpVector.x;
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY-1, TmpVector);
      TmpB = TmpVector.x;
      VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY-1, TmpVector);
      TmpC = TmpVector.x;
      Velocity.x = .25 * (TmpA + TmpB + TmpC + Input_Velocity.x);
      SampleIndex = Index - Scale * Velocity; 
      VelocityY = TmpVector.y;
      // velocity.x is average of (x,y) and (x+1,y), velocity.y is average of (x,y) and (x,y+1)
      // velocity is average
      Velocity.x = .5 * (TmpVector.x + Input_Velocity.x);
      Velocity.y = .5 * (TmpVector.y + Input_Velocity.y);
      // @todo(dmp): this is needed to be stable, but not sure why...
      // commenting out 11/22 - more testing needed
      // SampleUnit += 1e-6;
      float FillSrc;
      GridCollection.SamplePreviousGridFloatValue<Attribute = "IsCollider">(SampleUnit, FillSrc);
      WaterGrid.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(SampleUnit, TmpVal);
      // account for a difference in fill value between source voxel and destination
      // you are fitting an amount of water in a tighter or bigger space
      WaterDepth = TmpVal * (1.- FillSrc) / (1.-Input_IsCollider);
      if (CubicInterpolation)
        VelocityGrid.CubicSamplePreviousGridVector2DValue<Attribute = "Velocity">(SampleUnit, TmpVector);
      else 
        VelocityGrid.SamplePreviousGridVector2DValue<Attribute = "Velocity">(SampleUnit, TmpVector);
         WaterGrid.CubicSamplePreviousGridFloatValue<Attribute = "WaterDepth">(SampleUnit, TmpVal);
         WaterGrid.SamplePreviousGridFloatValue<Attribute = "WaterDepth">(SampleUnit, TmpVal);
      // float FillSrc;
      // GridCollection.SamplePreviousGridFloatValue<Attribute = "IsCollider">(SampleUnit, FillSrc);
      // WaterDepth = TmpVal * (1.- FillSrc) / (1.-Input_IsCollider);
      WaterDepth = TmpVal;
// Shader generated by Niagara HLSL Translator
// Compile Data> PinToConstantValues Input: 
int ID;
int Index;
int AcquireTag;
float Engine_WorldDeltaTime;
float Engine_DeltaTime;
float Engine_InverseDeltaTime;
float Engine_Time;
float Engine_RealTime;
int Engine_QualityLevel;
int Engine_PaddingInt32_0;
int Engine_PaddingInt32_1;
float Engine_Owner_TimeSinceRendered;
float Engine_Owner_LODDistance;
float Engine_Owner_LODDistanceFraction;
float Engine_System_Age;
int Engine_Owner_ExecutionState;
int Engine_System_TickCount;
int Engine_System_NumEmitters;
int Engine_System_NumEmittersAlive;
int Engine_System_SignificanceIndex;
int Engine_System_RandomSeed;
int Engine_System_CurrentTimeStep;
int Engine_System_NumTimeSteps;
float Engine_System_TimeStepFraction;
int Engine_System_NumParticles;
int Engine_System_PaddingInt32_0;
int Engine_System_PaddingInt32_1;
float4x4 Engine_Owner_SystemLocalToWorld;
float4x4 Engine_Owner_SystemWorldToLocal;
float4x4 Engine_Owner_SystemLocalToWorldTransposed;
float4x4 Engine_Owner_SystemWorldToLocalTransposed;
float4x4 Engine_Owner_SystemLocalToWorldNoScale;
float4x4 Engine_Owner_SystemWorldToLocalNoScale;
float4 Engine_Owner_Rotation;
float3 Engine_Owner_Position;
int Engine_Owner_PaddingInt32_0;
float3 Engine_Owner_Velocity;
int Engine_Owner_PaddingInt32_1;
float3 Engine_Owner_SystemXAxis;
int Engine_Owner_PaddingInt32_2;
float3 Engine_Owner_SystemYAxis;
int Engine_Owner_PaddingInt32_3;
float3 Engine_Owner_SystemZAxis;
int Engine_Owner_PaddingInt32_4;
float3 Engine_Owner_Scale;
int Engine_Owner_PaddingInt32_5;
float4 Engine_Owner_LWCTile;
int Engine_Emitter_NumParticles;
int Engine_Emitter_TotalSpawnedParticles;
float Engine_Emitter_SpawnCountScale;
float Emitter_Age;
int Emitter_RandomSeed;
int Engine_Emitter_InstanceSeed;
int Engine_Emitter_PaddingInt32_0;
int Engine_Emitter_PaddingInt32_1;
float Emitter_WorldScale;
float Emitter_DtOverDx;
float Emitter_dx;
float WaterDepth;
float WaterHeight;
float AdvectionVelocityMult;
float Age;
int CurrentTimeStep;
int NumEmitters;
int NumEmittersAlive;
int NumParticles;
int NumTimeSteps;
int PaddingInt32_0;
int PaddingInt32_1;
int RandomSeed;
int SignificanceIndex;
int TickCount;
float TimeStepFraction;
int ExecutionState;
float LODDistance;
float LODDistanceFraction;
float4 LWCTile;
int PaddingInt32_2;
int PaddingInt32_3;
int PaddingInt32_4;
int PaddingInt32_5;
float3 Position;
float4 Rotation;
float3 Scale;
float4x4 SystemLocalToWorld;
float4x4 SystemLocalToWorldNoScale;
float4x4 SystemLocalToWorldTransposed;
float4x4 SystemWorldToLocal;
float4x4 SystemWorldToLocalNoScale;
float4x4 SystemWorldToLocalTransposed;
float3 SystemXAxis;
float3 SystemYAxis;
float3 SystemZAxis;
float TimeSinceRendered;
float3 Velocity;
NiagaraEmitterID ID;
int InstanceSeed;
float SpawnCountScale;
int TotalSpawnedParticles;
float DeltaTime;
FParamMap0_Engine_Emitter Emitter;
int ExecIndex;
float InverseDeltaTime;
FParamMap0_Engine_Owner Owner;
int QualityLevel;
float RealTime;
FParamMap0_Engine_System System;
float Time;
float WorldDeltaTime;
float DtOverDx;
float dx;
float WorldScale;
FParamMap0_Emitter Emitter;
FParamMap0_Engine Engine;
FParamMap0_Module Module;
FParamMap0_StackContext StackContext;
FParamMap0 Map;
static float HackSpawnInterp = 1.0;
void ExecutionIndexToGridIndex_Emitter_GridCollection(int In_InstanceData, out int Out_IndexX, out int Out_IndexY);
void GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, out float2 Out_Value);
void GetPreviousFloatValue_Emitter_GridCollection_AttributeIsCollider(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void GetPreviousFloatValue_Emitter_GridCollection_AttributeBottomContour(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void IndexToUnit_Emitter_GridCollection(int In_InstanceData, float In_IndexX, float In_IndexY, out float3 Out_Unit);
void CubicSamplePreviousGridVector2DValue_Emitter_VelocityGrid_AttributeVelocity(int In_InstanceData, float2 In_Unit, out float2 Out_Value);
void SamplePreviousGridVector2DValue_Emitter_VelocityGrid_AttributeVelocity(int In_InstanceData, float2 In_Unit, out float2 Out_Value);
void CubicSamplePreviousGridFloatValue_Emitter_WaterGrid_AttributeWaterDepth(int In_InstanceData, float2 In_Unit, out float Out_Value);
void SamplePreviousGridFloatValue_Emitter_WaterGrid_AttributeWaterDepth(int In_InstanceData, float2 In_Unit, out float Out_Value);
void CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_(int In_IndexX, int In_IndexY, float In_dx, float In_AdvectionVelocityMult, float In_WorldScale, float In_DtOverDx, float2 In_Input_Velocity, float In_Input_WaterDepth, float In_Input_WaterHeight, float In_Input_IsCollider, float In_Input_BottomContour, bool In_CubicInterpolation, out float Out_VelocityX, out float Out_VelocityY, out float Out_WaterDepth, out float Out_WaterHeight);
void SetVector2DValue_Emitter_VelocityGrid_UEImpureCall_AttributeVelocity(int In_InstanceData, int In_IndexX, int In_IndexY, float2 In_Value);
float GetSpawnInterpolation();
Out_VelocityX = In_Input_Velocity.x;
Out_VelocityY = In_Input_Velocity.y;
Out_WaterDepth = In_Input_WaterDepth;
float Scale = In_DtOverDx * In_AdvectionVelocityMult;
float2 Index = float2(In_IndexX, In_IndexY);
      Velocity = In_Input_Velocity;
      GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, In_IndexX, In_IndexY+1, TmpVector);
      GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, In_IndexX-1, In_IndexY+1, TmpVector);
      GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, In_IndexX-1, In_IndexY, TmpVector);
      Velocity.y = .25 * (TmpA + TmpB + TmpC + In_Input_Velocity.y);
      IndexToUnit_Emitter_GridCollection(0, SampleIndex.x, SampleIndex.y, SampleUnit);
      if (In_CubicInterpolation)
        CubicSamplePreviousGridVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, SampleUnit, TmpVector);
        SamplePreviousGridVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, SampleUnit, TmpVector);
      Out_VelocityX = TmpVector.x;
      GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, In_IndexX+1, In_IndexY, TmpVector);
      GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, In_IndexX+1, In_IndexY-1, TmpVector);
      GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, In_IndexX, In_IndexY-1, TmpVector);
      Velocity.x = .25 * (TmpA + TmpB + TmpC + In_Input_Velocity.x);
      Out_VelocityY = TmpVector.y;
      Velocity.x = .5 * (TmpVector.x + In_Input_Velocity.x);
      Velocity.y = .5 * (TmpVector.y + In_Input_Velocity.y);
         CubicSamplePreviousGridFloatValue_Emitter_WaterGrid_AttributeWaterDepth(2, SampleUnit, TmpVal);
         SamplePreviousGridFloatValue_Emitter_WaterGrid_AttributeWaterDepth(2, SampleUnit, TmpVal);
      Out_WaterDepth = TmpVal;
Out_WaterHeight = In_Input_BottomContour + Out_WaterDepth;
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
EnterStatScope(0 /**Grid2D_SW_Advect*/);
//Begin Initialize Parameter Map Defaults
//End Initialize Parameter Map Defaults
//SetConstantByStaticVariable "/Map Get/Map Get->Module.Cubic Interpolation"
int Constant = 0;
int ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_GridCollection(0, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexX, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexY);
float2 GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocityOutput_Value;
GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocity(1, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexX, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexY, GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocityOutput_Value);
float Constant1 = 0;
Context.Map.StackContext.WaterDepth = Constant1;
float Constant2 = 0;
Context.Map.StackContext.WaterHeight = Constant2;
float GetPreviousFloatValue_Emitter_GridCollection_AttributeIsColliderOutput_Value;
GetPreviousFloatValue_Emitter_GridCollection_AttributeIsCollider(0, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexX, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexY, GetPreviousFloatValue_Emitter_GridCollection_AttributeIsColliderOutput_Value);
float GetPreviousFloatValue_Emitter_GridCollection_AttributeBottomContourOutput_Value;
GetPreviousFloatValue_Emitter_GridCollection_AttributeBottomContour(0, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexX, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexY, GetPreviousFloatValue_Emitter_GridCollection_AttributeBottomContourOutput_Value);
float CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_VelocityX;
float CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_VelocityY;
float CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_WaterDepth;
float CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_WaterHeight;
CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_(ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexX, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexY, Context.Map.Emitter.dx, Context.Map.Module.AdvectionVelocityMult, Context.Map.Emitter.WorldScale, Context.Map.Emitter.DtOverDx, GetPreviousVector2DValue_Emitter_VelocityGrid_AttributeVelocityOutput_Value, Context.Map.StackContext.WaterDepth, Context.Map.StackContext.WaterHeight, GetPreviousFloatValue_Emitter_GridCollection_AttributeIsColliderOutput_Value, GetPreviousFloatValue_Emitter_GridCollection_AttributeBottomContourOutput_Value, Constant, CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_VelocityX, CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_VelocityY, CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_WaterDepth, CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_WaterHeight);
float2 Output1;
Output1.x = CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_VelocityX;
Output1.y = CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_VelocityY;
SetVector2DValue_Emitter_VelocityGrid_UEImpureCall_AttributeVelocity(1, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexX, ExecutionIndexToGridIndex_Emitter_GridCollectionOutput_IndexY, Output1);
Context.Map.StackContext.WaterDepth = CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_WaterDepth;
Context.Map.StackContext.WaterHeight = CustomHlsl9F0555134004B1ED78FD65B4E890FA5EEmitter_GridCollectionEmitter_VelocityGridEmitter_WaterGrid_Func_Output_WaterHeight;
ExitStatScope(/**Grid2D_SW_Advect*/);
EnterStatScope(1 /**Grid2D_SW_Advect_Main*/);
FSimulationContext Context = (FSimulationContext)0;
Context.Map.Emitter.WorldScale = Emitter_WorldScale;
Context.Map.Emitter.DtOverDx = Emitter_DtOverDx;
Context.Map.Emitter.dx = Emitter_dx;
Context.Map.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.Map.Emitter.RandomSeed = Emitter_RandomSeed;
Context.Map.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.Map.Engine.System.RandomSeed = Engine_System_RandomSeed;
ReadDataSets(Context);
Context.Map.Engine.ExecIndex = ExecIndex();
Context.Map.Engine.Emitter.ID.ID = -1;
EnterStatScope(2 /**Grid2D_SW_Advect_MapMain*/);
Simulate(Context);
ExitStatScope(/**Grid2D_SW_Advect_MapMain*/);
WriteDataSets(Context);
int TmpWriteIndex = OutputIndex(0, false, true);
OutputDataFloat(0, 0, TmpWriteIndex, Context.Map.Module.AdvectionVelocityMult);
ExitStatScope(/**Grid2D_SW_Advect_Main*/);

