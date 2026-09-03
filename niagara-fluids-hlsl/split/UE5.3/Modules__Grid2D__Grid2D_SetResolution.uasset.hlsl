float CellSize = max(WorldGridExtents.x, WorldGridExtents.y) / NumCellsMaxAxis;
NumCellsX = floor(WorldGridExtents.x / CellSize);
NumCellsY = floor(WorldGridExtents.y / CellSize);
    NumCellsY++;
    NumCellsX++;
Out_WorldGridExtents = float2(NumCellsX, NumCellsY) * CellSize;
float CellSize = WorldCellSize;
 g}#9,

