float4 ret = {0,0,0,0};
float WorldDepth = SceneDepth / dot(RayDir, CameraDirectionVector);
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
    return ret;
// if tmin > tmax, ray doesn't intersect AABB
t = tmin;
float3 CurrLocalPos = RayStart + RayDir * t;
float4 rettmp = {1,1,1,DebugBBox};
int3 VoxelCount = floor(CurrLocalPos / VoxelSize);
int SliceParity = (VoxelCount.x) % 2;
int RowParity = (VoxelCount.y + SliceParity+1) % 2;
int CellParity = (VoxelCount.z + RowParity ) % 2;
rettmp.y = 0;
return rettmp;
int3 sz;
VolumeTexture.GetDimensions(sz.x, sz.y, sz.z);
    Center = (Center + .5) / sz;
    Center = Center * WorldGridExtents + MinBounds;
float denom = dot(RayDir, Normal);
t = dot(Center -RayStart, Normal) / denom;
CurrLocalPos = RayStart + RayDir * t;
float3 UnitPos = (CurrLocalPos - MinBounds) / WorldGridExtents;
float3 V = UnitPos * sz - .5;
int3 V_int = round(V);
         if (InterpolateGrid)
             ret = VolumeTexture.SampleLevel(VolumeTextureSampler,  UnitPos, 0);
         else
    ret = VolumeTexture.Load(int4(V_int.x, V_int.y, V_int.z, 0));
ret.a = 1;
        // if we are using a cardinal axis, then we can draw the grid lines
        if (Normal.x+Normal.y+Normal.z <= 1)
  float3 Remain = abs(V - V_int - .5);
  float2 CenterTmp = dot(abs(V - V_int), 1.-Normal);
           float3 DebugLines = dot(Remain, 1.-Normal);
  if ((Remain.x < DebugThickness  || Remain.y < DebugThickness || Remain.z < DebugThickness) 
              Remain.x > 1 - DebugThickness || Remain.y > 1 - DebugThickness || Remain.z > 1 - DebugThickness)
  ret.rgb = 1;
return ret;
return float4(0,0,0,0);
float3 MinBounds = -1.* WorldGridExtents * .5 + (.5 - LocalPivot)*WorldGridExtents;
float3 MaxBounds = WorldGridExtents * .5 + (.5 - LocalPivot)*WorldGridExtents;
float3 UnitPos = CurrLocalPos / WorldGridExtents + LocalPivot;

