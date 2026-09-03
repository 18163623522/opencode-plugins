float CellSize = max(WorldGridExtents.z, max(WorldGridExtents.x, WorldGridExtents.y)) / NumCellsMaxAxis;
NumCellsX = round(WorldGridExtents.x / CellSize);
NumCellsY = round(WorldGridExtents.y / CellSize);
NumCellsZ = round(WorldGridExtents.z / CellSize);
     abs(CellSize * NumCellsY - WorldGridExtents.y) > 1e-8)
    NumCellsY += 1;
     abs(CellSize * NumCellsZ - WorldGridExtents.z) > 1e-8)
    NumCellsZ += 1;
    abs(CellSize * NumCellsX - WorldGridExtents.x) > 1e-8)
    NumCellsX +=1;
    abs(CellSize * NumCellsZ - WorldGridExtents.z) > 1e-8)
    NumCellsZ +=1;
NumCellsX +=1;
    abs(CellSize * NumCellsY - WorldGridExtents.y) > 1e-8)
NumCellsY +=1;
Out_WorldGridExtents = float3(NumCellsX, NumCellsY, NumCellsZ) * CellSize;
Llyb_I;

