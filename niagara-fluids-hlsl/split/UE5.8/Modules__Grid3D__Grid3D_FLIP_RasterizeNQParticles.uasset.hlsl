Velocity = float3(0,0,0);
Boundary = 0;
float TotalWeight = 0.0;
int NumCellsX;
int NumCellsY;
int NumCellsZ;
VelocityGrid.GetNumCells(NumCellsX, NumCellsY, NumCellsZ);
int IndexX;
int IndexY;
int IndexZ;
VelocityGrid.ExecutionIndexToGridIndex(IndexX, IndexY, IndexZ);
float3 World;
    float3 Unit;
    VelocityGrid.IndexToUnit(IndexX, IndexY, IndexZ, Unit);
    World = mul(float4(Unit, 1.0), UnitToWorld).xyz;
int3 NumNQCells;
NQ.GetNumCells(NumNQCells.x, NumNQCells.y, NumNQCells.z);
    int CurrNQCount;
    NQ.GetParticleNeighborCount(IndexX, IndexY, IndexZ, CurrNQCount);
    CurrNQCount = min(MaxParticlesPerCell, CurrNQCount);
    for (int i = 0; i < CurrNQCount; ++i)
        NiagaraID CurrNeighborID;
        NQ.GetParticleNeighbor(IndexX, IndexY, IndexZ, i, CurrNeighborID.Index, CurrNeighborID.AcquireTag);
        bool bPositionValid = true;
        bool bVelocityValid = true;
        float3 CurrParticlePosition;
        float3 CurrParticleVelocity;
        int ParticleIndex = CurrNeighborID.Index;
        if (UsePersistentIDs)
            ParticleReader.GetParticleIndex(CurrNeighborID, ParticleIndex);
        if (UseComplexWeight)
            ParticleReader.GetPositionByIndex<Attribute="Position">(ParticleIndex, bPositionValid, CurrParticlePosition);
        ParticleReader.GetVectorByIndex<Attribute="Velocity">(ParticleIndex, bVelocityValid, CurrParticleVelocity);
        if (bVelocityValid && bPositionValid)
            float Weight;
            if (UseComplexWeight)
                float3 IndexDifference = (CurrParticlePosition - World) / dx;
                float3 W = saturate(1.0 - abs(IndexDifference));
                Weight = W.x * W.y * W.z;
            else
                Weight = 1.;
            Velocity += CurrParticleVelocity * Weight;
            TotalWeight += Weight;    
    Velocity /= TotalWeight;
    Boundary = 3.0;
int IGNORE;
BoundaryGrid.SetGridValue(IndexX, IndexY, IndexZ, BoundaryIndex, Boundary, IGNORE);
VelocityGrid.SetVectorValue<Attribute="Velocity">(IndexX, IndexY, IndexZ, Velocity);
for (int x = -1; x <= 0; ++x) {
for (int y = -1; y <= 0; ++y) {
for (int z = -1; z <= 0; ++z) {
    int CurrNQIndexX = IndexX + x;
    int CurrNQIndexY = IndexY + y;
    int CurrNQIndexZ = IndexZ + z;
    if (CurrNQIndexX < 0 || CurrNQIndexX >= NumNQCells.x ||
        CurrNQIndexY < 0 || CurrNQIndexY >= NumNQCells.y ||
        CurrNQIndexZ < 0 || CurrNQIndexZ >= NumNQCells.z)
        continue;
    NQ.GetParticleNeighborCount(CurrNQIndexX, CurrNQIndexY, CurrNQIndexZ, CurrNQCount);
        NQ.GetParticleNeighbor(CurrNQIndexX, CurrNQIndexY, CurrNQIndexZ, i, CurrNeighborID.Index, CurrNeighborID.AcquireTag);
            TotalWeight += Weight;
 k|Næ¢sgm
X;ôÏ!EÇZï†ˆ∞¨PØ/Í$∂¯MÜ0
X;ôÏ!EÇZï†ˆ∞¨P
◊;…ÈWL†Aª‹
Iìç;Àˇ˝DçÖ4\é
àq;µD?=@ΩÕ]àË]ÔKÕ
¡É*ûóˆ•Ä.;ƒ—

