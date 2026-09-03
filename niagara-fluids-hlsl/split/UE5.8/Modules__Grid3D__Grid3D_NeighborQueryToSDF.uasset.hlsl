SDFVal = 0;
static const int OffsetIndexEndForRadius[6] = { 1, 27, 179, 615, 1143, 1331 };
static const int MaxRadius = 5;
// set SDFVal to the fill value
SDFVal = SDFFillValue;
// Index of current SDF cell
int3 Index;
SDF.ExecutionIndexToGridIndex(Index.x, Index.y, Index.z);
// unit space for current sdf cell
float3 Unit;
SDF.IndexToUnit(Index.x, Index.y, Index.z, Unit);
// check coarse NQ for any neighbors
float3 CoarseNQIndex;
CoarseNQ.UnitToFloatIndex(Unit, CoarseNQIndex);
int CoarseNQCount;
CoarseNQ.GetParticleNeighborCount(CoarseNQIndex.x, CoarseNQIndex.y, CoarseNQIndex.z, CoarseNQCount);
float3 World = mul(float4(Unit, 1.0), UnitToWorld).xyz;
// Index for current particle neighbor query cell
float3 NQIndex;
NQ.UnitToFloatIndex(Unit, NQIndex);
int3 IntNQIndex = NQIndex;
int3 NumNQCells;
NQ.GetNumCells(NumNQCells.x, NumNQCells.y, NumNQCells.z);
// this is based off of the search radius
const int MaxOffsetIndex = OffsetIndexEndForRadius[SearchRadius];
// loop over all offsets
bool Done = false;
for (int CurrOffset = 0; CurrOffset < MaxOffsetIndex && !Done; CurrOffset++)
    // find the proper offset
    const int3 Offset = SortedOffsets[CurrOffset];
    const float EuclideanDist = length(float3(Offset)) * SimDx;
    if (EuclideanDist > SDFVal + ParticleRadius + BreakMargin)
        break;
    const int3 IndexToUse = IntNQIndex + Offset;
    // min distance for a particle stored in the neighbor cell
    const float3 PerAxisDist = max(0.0, (abs(float3(Offset)) - 1.0) * SimDx + 0.5 * SDFDx);
    const float MinCellDist = length(PerAxisDist);
    // only consider valid indices and cells that can contributre given the current sdf value
    if (SDFVal > MinCellDist - ParticleRadius &&
        all(IndexToUse >= 0) && all(IndexToUse < NumNQCells))
        // get number of particle neighbors for current cell
        int NeighborCount;
        NQ.GetParticleNeighborCount(IndexToUse.x, IndexToUse.y, IndexToUse.z, NeighborCount);
        // clamp neighbors for perf
        const int NeighborCountToUse = min(MaxNeighborsPerCell, NeighborCount);
        // loop over all neighbors found for the current cell  
        for (int i = 0; i < NeighborCountToUse; ++i)
            // get particle neighbor index
            int CurrNeighborIdx;
            int CurrNeighborAcquireIdx;
            NQ.GetParticleNeighbor(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, CurrNeighborIdx, CurrNeighborAcquireIdx);
            // get position for particle 
            // #todo(dmp): handle local space
            float3 CurrParticlePosition;
            bool IsValid;
            if (UsePersistentIDs)
                NiagaraID CurrID;
                CurrID.Index = CurrNeighborIdx;
                CurrID.AcquireTag = CurrNeighborAcquireIdx;
                Reader.GetPositionByID<Attribute="Position">(CurrID, IsValid, CurrParticlePosition);
            else
                Reader.GetPositionByIndex<Attribute="Position">(CurrNeighborIdx, IsValid, CurrParticlePosition);
            const float Dist = length(CurrParticlePosition - World) - ParticleRadius;
            if (Dist <= SDFMaxDistance)
                SDFVal = min(SDFVal, Dist);
                if (SDFVal < -SimDx * CullNegative)
                    Done = true;
                    break;
²˜Ô÷D«C»a|å#¡;
L—(þ-jÊE¯foŽm;¥¤
L—(þ-jÊE¯foŽm;¥¤Ç
i/;ôšH³@«÷WÑHY£W
i/;ôšH³@«÷WÑHY£WÇ
wt¬*Gíµl@³;ç´ýn5«0Uð]
V'RòV;Nªd¬^Ã
t¬*Gíµl@³;ç´ýn5«
§Á;®Œ'â?.PÍ@§· 
Àê;´@ ÙU4™¦=Z
÷Bª;t
Áƒ*ž—ö¥€.;ÄÑ

