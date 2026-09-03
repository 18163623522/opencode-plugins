float3 WorldPosition = mul(float4(ScreenPosition * SceneDepth, SceneDepth, 1), ScreenToWorld).xyz;
float4 ret = {0,0,0,0};
OutDepth = -1.f;
//float WorldDepth = SceneDepth / dot(RayDir, CameraDirectionVector);
const float3 OriginalRayDir = RayDir;
RayStart = mul(float4(RayStart,1), WorldToLocal).xyz;
RayDir = mul(float4(RayDir,0), WorldToLocal).xyz;
//  Ray aabbox intersection
float3 dirfrac = 1.0f / RayDir;
float t = 0;
float3 MinBounds = -1.* WorldGridExtents * .5;
float3 MaxBounds = WorldGridExtents * .5;
float t1 = (MinBounds.x - RayStart.x)*dirfrac.x;
float t2 = (MaxBounds.x - RayStart.x)*dirfrac.x;
float t3 = (MinBounds.y - RayStart.y)*dirfrac.y;
float t4 = (MaxBounds.y - RayStart.y)*dirfrac.y;
float t5 = (MinBounds.z - RayStart.z)*dirfrac.z;
float t6 = (MaxBounds.z - RayStart.z)*dirfrac.z;
float tmin = max(max(min(t1, t2), min(t3, t4)), min(t5, t6));
float tmax = min(min(max(t1, t2), max(t3, t4)), max(t5, t6));
// if tmax < 0, ray (line) is intersecting AABB, but the whole AABB is behind us
    t = tmax;
    return;
// if tmin > tmax, ray doesn't intersect AABB
t = max(0, tmin);
// Penetrate the bound because Grid.UnitToIndex doesn't like 1.0 input
t += 0.1f;
float3 CurrLocalPos = RayStart + RayDir * t;  
  float4 rettmp = {1,1,1,DebugBBox};
  int3 VoxelCount = floor(CurrLocalPos / VoxelSize);
  int SliceParity = (VoxelCount.x) % 2;
  int RowParity = (VoxelCount.y + SliceParity+1) % 2;
  int CellParity = (VoxelCount.z + RowParity ) % 2;
  if (CellParity == 0)
    rettmp.y = 0;
  return rettmp;
float3 FinalPos = float3(0,0,0);
//float4 RetVal = float4(0,0,0,0);
//Whitewater = 0;
float3 Position;
bool IsAHit = false;
for (int i = 0; i < NumSteps; ++i)
    Position = CurrLocalPos / WorldGridExtents + .5;
    int3 CurrIndex;
    //SDFGrid.UnitToIndex(Position, CurrIndex.x, CurrIndex.y, CurrIndex.z);
    //float4 VolumeSample = VolumeTexture.SampleLevel(VolumeTextureSampler, Position, 0);
    float SampledValue;
    //SDFGrid.GetPreviousFloatValue<Attribute="SDF">(CurrIndex.x, CurrIndex.y, CurrIndex.z, SampledValue);
    SDFGrid.SamplePreviousGridFloatValue<Attribute="SDF">(Position, SampledValue);
//    if (abs(SampledValue) < VoxelSize * Tolerance && Position.x >= 0 && Position.x <= 1 && Position.y >= 0 && Position.y <= 1 && Position.z >= 0 && Position.z <= 1)
    bool IsInsideBounds = Position.x >= 0 && Position.x <= 1 && Position.y >= 0 && Position.y <= 1 && Position.z >= 0 && Position.z <= 1;
    if (SampledValue < VoxelSize * Tolerance  && IsInsideBounds || !IsInsideBounds)
        IsAHit = IsInsideBounds;
        break;
    t += SampledValue;
    CurrLocalPos = RayStart + RayDir * t;
FinalPos = Position;
OutDepth = IsAHit ? t*dot(OriginalRayDir, CameraDirectionVector) : VOID_DEPTH;
// Normal
int NumCellsX, NumCellsY, NumCellsZ;
SDFGrid.GetNumCells(NumCellsX, NumCellsY, NumCellsZ);
float3 UnitDx = 1./float3(NumCellsX, NumCellsY, NumCellsZ);
float s0, s1, s2, s3, s4, s5;
SDFGrid.SamplePreviousGridFloatValue<Attribute="SDF">(FinalPos + float3(1,0,0) * UnitDx, s0);
SDFGrid.SamplePreviousGridFloatValue<Attribute="SDF">(FinalPos - float3(1,0,0) * UnitDx, s1);
SDFGrid.SamplePreviousGridFloatValue<Attribute="SDF">(FinalPos + float3(0,1,0) * UnitDx, s2);
SDFGrid.SamplePreviousGridFloatValue<Attribute="SDF">(FinalPos - float3(0,1,0) * UnitDx, s3);
SDFGrid.SamplePreviousGridFloatValue<Attribute="SDF">(FinalPos + float3(0,0,1) * UnitDx, s4);
SDFGrid.SamplePreviousGridFloatValue<Attribute="SDF">(FinalPos - float3(0,0,1) * UnitDx, s5);
float temp = s4 - s5;
temp = sign(temp) * max(0.001f, abs(temp));
OutNormal = normalize(float3(s0 - s1, s2 - s3, 1.f));
float SceneDepth = 1.23456f;
//float2 UV = (ScreenPosition * float2(2.0f, 2.0f) + float2(-1.0f, -1.0f)) * View.ScreenPositionScaleBias.xy + View.ScreenPositionScaleBias.wz;
float2 UV = (ScreenPosition * float2(2.0f, -2.0f) + float2(-1.0f, 1.0f));// - View.ScreenPositionScaleBias.wz) / View.ScreenPositionScaleBias.xy;
float3 WorldPosition = mul(float4(UV * SceneDepth, SceneDepth, 1), ScreenToWorld).xyz;
RD = normalize(WorldPosition - CameraPositionWS);

