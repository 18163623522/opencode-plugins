float CellSize = max(WorldGridExtents.z, max(WorldGridExtents.x, WorldGridExtents.y)) / NumCellsMaxAxis;
NumCellsX = floor(WorldGridExtents.x / CellSize);
NumCellsY = floor(WorldGridExtents.y / CellSize);
NumCellsZ = floor(WorldGridExtents.z / CellSize);
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
r=5İm¨şL³Llyb_I;
r=5İm¨şL³Llyb_I;³
—A­ØD«y;sµ·=¹t
›[ˆ5;sB» 
ô2Ì;R¿ãM¹§
Áƒ*—ö¥€.;ÄÑ

