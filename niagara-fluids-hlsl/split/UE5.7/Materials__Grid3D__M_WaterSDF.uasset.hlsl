?;†)6š
;põ£põ¨éh
N”êh;x4n
êkt£p£;¸
float4 ret = {0,0,0,0};
float WorldDepth = SceneDepth / dot(LocalRayDir, CameraDirectionVector);
//  Ray aabbox intersection
float3 dirfrac = 1.0f / LocalRayDir;
float t = 0;
float3 MinBounds = -1.* WorldGridExtents * .5;
float3 MaxBounds = WorldGridExtents * .5;
float t1 = (MinBounds.x - LocalRayStart.x)*dirfrac.x;
float t2 = (MaxBounds.x - LocalRayStart.x)*dirfrac.x;
float t3 = (MinBounds.y - LocalRayStart.y)*dirfrac.y;
float t4 = (MaxBounds.y - LocalRayStart.y)*dirfrac.y;
float t5 = (MinBounds.z - LocalRayStart.z)*dirfrac.z;
float t6 = (MaxBounds.z - LocalRayStart.z)*dirfrac.z;
float tmin = max(max(min(t1, t2), min(t3, t4)), min(t5, t6));
float tmax = min(min(max(t1, t2), max(t3, t4)), max(t5, t6));
// if tmax < 0, ray (line) is intersecting AABB, but the whole AABB is behind us
    t = tmax;
    return ret;
// if tmin > tmax, ray doesn't intersect AABB
t = max(0, tmin);
float3 CurrLocalPos = LocalRayStart + LocalRayDir * t;
  float4 rettmp = {1,1,1,DebugBBox};
  int3 VoxelCount = floor(CurrLocalPos / VoxelSize);
  int SliceParity = (VoxelCount.x) % 2;
  int RowParity = (VoxelCount.y + SliceParity+1) % 2;
  int CellParity = (VoxelCount.z + RowParity ) % 2;
  if (CellParity == 0)
    rettmp.y = 0;
  return rettmp;
float SignedDistance = -10000;
float3 FinalPos = float3(0,0,0);
float4 RetVal = float4(0,0,0,0);
Whitewater = 0;
for (int i = 0; i < NumSteps; ++i)
    float3 Position = CurrLocalPos / WorldGridExtents + .5;
    float4 VolumeSample = VolumeTexture.SampleLevel(VolumeTextureSampler, Position, 0);
    SignedDistance = VolumeSample.r;
    if (abs(SignedDistance) < VoxelSize * Tolerance && Position.x >= 0 && Position.x <= 1 && Position.y >= 0 && Position.y <= 1 && Position.z >= 0 && Position.z <= 1)
        FinalPos = Position;
        RetVal = float4(normalize(VolumeSample.gba), 1);
        Whitewater = VolumeSample.g;
        Depth = t*dot(WorldRayDir, CameraDirectionVector);
        break;
    t += SignedDistance;
    CurrLocalPos = LocalRayStart + LocalRayDir * t;
RetVal.a = 0;
uint sx,sy,sz,l;
VolumeTexture.GetDimensions(0, sx, sy, sz, l);
float3 UnitDx = 1./float3(sx,sy,sz);
float S_right = VolumeTexture.SampleLevel(VolumeTextureSampler, FinalPos + float3(1,0,0) * UnitDx, 0).r;
float3(1,0,0) * UnitDx, 0).r;
float3(0,1,0) * UnitDx, 0).r;
float S_down = VolumeTexture.SampleLevel(VolumeTextureSampler, FinalPos - float3(0,1,0) * UnitDx, 0).r;
float S_front = VolumeTexture.SampleLevel(VolumeTextureSampler, FinalPos + float3(0,0,1) * UnitDx, 0).r;
float S_back = VolumeTexture.SampleLevel(VolumeTextureSampler, FinalPos - float3(0,0,1) * UnitDx, 0).r;
RetVal.rgb = normalize(float3(S_right - S_left, S_up - S_down, S_front - S_back));
return RetVal;
LocalRayStart = mul(float4(WorldRayStart,1), WorldToLocal).xyz;
LocalRayDir = mul(float4(WorldRayDir,0), WorldToLocal).xyz;
return 0;
Áƒ*ž—ö¥€.;ÄÑ

