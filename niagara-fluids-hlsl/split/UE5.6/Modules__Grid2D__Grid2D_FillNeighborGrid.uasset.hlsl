int3 NumCells;
NeighborGrid.GetNumCells(NumCells.x, NumCells.y, NumCells.z);
float3 UnitPos;
Grid.SimulationToUnit(Position, SimulationToUnit, UnitPos);
float3 FloatIndex = UnitPos * float3(NumCells)  - .5;
int3 BaseIndex = floor(FloatIndex);
BaseIndex.z = 0;
int MaxNeighborsPerCell;
NeighborGrid.MaxNeighborsPerCell(MaxNeighborsPerCell);
for (int x = 0; x <= 1; ++x) {
for (int y = 0; y <= 1; ++y) {
int3 Index = BaseIndex + int3(x,y,0);
    Index.y >= 0 && Index.y < NumCells.y && 
    int LinearIndex;
    NeighborGrid.IndexToLinear(Index.x, Index.y, Index.z, LinearIndex);
    int PreviousNeighborCount;
    NeighborGrid.SetParticleNeighborCount(LinearIndex, 1, PreviousNeighborCount);
    if (PreviousNeighborCount < MaxNeighborsPerCell)
        int NeighborGridLinear;
        NeighborGrid.NeighborGridIndexToLinear(Index.x, Index.y, Index.z, PreviousNeighborCount, NeighborGridLinear);
        int IGNORE;
        NeighborGrid.SetParticleNeighbor(NeighborGridLinear, InstanceIdx, IGNORE);
Áƒ*ž—ö¥€.;ÄÑ

