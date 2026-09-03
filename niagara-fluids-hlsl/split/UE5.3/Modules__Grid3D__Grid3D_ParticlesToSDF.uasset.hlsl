RetDist = 100;
Grad = float3(0,0,0);
if( ! Enable ) return;
bool Valid;
int MaxNeighborsPerCell;
NeighborGrid.MaxNeighborsPerCell(MaxNeighborsPerCell);
int3 IndexToUse;
int NeighborLinearIndex;
int CurrIdx;
int Num = 0;
for (int i = 0; i < MaxNeighborsPerCell; ++i)
    NeighborGrid.UnitToIndex(UnitPos, IndexToUse.x, IndexToUse.y, IndexToUse.z);
NeighborGrid.NeighborGridIndexToLinear(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, NeighborLinearIndex);
NeighborGrid.GetParticleNeighbor(NeighborLinearIndex, CurrIdx);
    float3 ParticlePos = float3(0, 0, 0);
ParticleReader.GetVectorByIndex<Attribute = "Position">(CurrIdx, Valid, ParticlePos);
ParticlePos = mul(float4(ParticlePos, 1.), SimulationToLocal).xyz;
    float2 ParticleSpriteSize = float2(0, 0);
ParticleReader.GetVector2DByIndex<Attribute = "SpriteSize">(CurrIdx, Valid, ParticleSpriteSize);
float ParticleRadius = ParticleSpriteSize.x * RadiusScale;
float Dist = length(CellPos - ParticlePos) - ParticleRadius;
        RetDist = Dist;
Grad = normalize(CellPos - ParticlePos);        
    if (Dist < 0)
   // RetDist = Dist;    
//Grad /= Num;
#endif //GPU_SIMULATION
 EdG{_

