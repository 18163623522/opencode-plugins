Boundary = 0;
  Boundary = OpenBoundaryRight ? 2 : 1;
  Boundary = OpenBoundaryLeft ? 2 : 1;
  Boundary = OpenBoundaryDown ? 2 : 1;
  Boundary = OpenBoundaryUp ? 2 : 1;
  Boundary = OpenBoundaryBack ? 2 : 1;
  Boundary = OpenBoundaryFront ? 2 : 1;
BoundaryOut = 0;
VelocityOut = float3(0,0,0);
bool Valid;
for (int CurrIdx = 0; CurrIdx < NumParticles; ++CurrIdx)
float3 ParticlePos  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="Position">(CurrIdx, Valid, ParticlePos);
    ParticlePos = mul(float4(ParticlePos, 1.), WorldToLocal).xyz;
    float2 ParticleSpriteSize = float2(0,0);
ParticleReader.GetVector2DByIndex<Attribute="SpriteSize">(CurrIdx, Valid, ParticleSpriteSize);
    float Dist = length(CellPos - ParticlePos);
    float ParticleRadius = ParticleSpriteSize.x * .5;
    if (Dist <= ParticleRadius)
float3 ParticleVel  = float3(0,0,0);
ParticleReader.GetVectorByIndex<Attribute="Velocity">(CurrIdx, Valid, ParticleVel);
        ParticleVel = mul(float4(ParticleVel, 0.), WorldToLocal).xyz;
        BoundaryOut = 1;
        VelocityOut += ParticleVel * VelocityMult;
OutBoundary = 0;
OutVelocity = float3(0,0,0);
  OutBoundary = 1;
  OutVelocity = ClosestVelocity;
Vector = isnan(WorldVelocity) ? float3(0,0,0) : WorldVelocity;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
const  int RASTERIZED_FLUID_CELL = 3;
RetBoundary = EMPTY_CELL;
  RetBoundary = FLUID_CELL;
  RetBoundary = SolidValue;
ScreenUV = float2(0,0);
float4 SamplePosition = float4(In_SamplePos + View.PreViewTranslation, 1);
float4 ClipPosition = mul(SamplePosition, View.TranslatedWorldToClip);
float2 ScreenPosition = ClipPosition.xy / ClipPosition.w;
// Check if the sample is inside the view.
// Sample the depth buffer to get a world position near the sample position.
    ScreenUV = ScreenPosition * View.ScreenPositionScaleBias.xy + View.ScreenPositionScaleBias.wz;
UnitPos.z >= 0 && UnitPos.z <= 1;
int MaxNeighborsPerCell;
NeighborGrid.MaxNeighborsPerCell(MaxNeighborsPerCell);
for (int i = 0; i < MaxNeighborsPerCell; ++i)
    int3 IndexToUse;
    NeighborGrid.UnitToIndex(Unit, IndexToUse.x, IndexToUse.y, IndexToUse.z);
int NeighborLinearIndex;
NeighborGrid.NeighborGridIndexToLinear(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, NeighborLinearIndex);
int CurrIdx;
NeighborGrid.GetParticleNeighbor(NeighborLinearIndex, CurrIdx);
    if (CurrIdx >=0)
Vector = isnan(WorldVelocity) ? float3(0,0,0) : WorldVelocity/dt;
ret = (a.x >= 1-1e-5) && (a.y >= 1-1e-5) && (a.z >= 1-1e-5);
FLWCVector3 CameraPos = PrimaryView.WorldCameraOrigin;
LWCSetTile(CameraPos, LWCGetTile(CameraPos) - Tile); // convert to simulation space
Out_CameraPosWorld = LWCToFloat(CameraPos);
//FLWCVector3 LwcSamplePos = MakeLWCVector3(Tile, vv);
float4 SamplePosition = float4(LWCToFloat(LWCAdd(LwcSamplePos, PrimaryView.PreViewTranslation)), 1); // TODO[mg]: LWCToFloat here?
ScreenUV = ScreenPosition * View.ScreenPositionScaleBias.xy + View.ScreenPositionScaleBias.wz;
 EdG{_
O"Pi;h
h)a;/ 3'
h)a;/ 3

