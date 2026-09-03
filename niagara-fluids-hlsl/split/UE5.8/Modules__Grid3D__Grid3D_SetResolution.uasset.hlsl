xªM‡4i=;
float CellSize = max(WorldGridExtents.z, max(WorldGridExtents.x, WorldGridExtents.y)) / NumCellsMaxAxis;
NumCellsX = CellSize > 1e-8 ? floor(WorldGridExtents.x / CellSize) : 1;
NumCellsY = CellSize > 1e-8 ? floor(WorldGridExtents.y / CellSize) : 1;
NumCellsZ = CellSize > 1e-8 ? floor(WorldGridExtents.z / CellSize) : 1;
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
]R†jì;ÊH„Ê?oX;
r=5Ým¨þL³Llyb_I;
r=5Ým¨þL³Llyb_I;8
const float CellSize = WorldCellSize;
#¦PÇA<ÒF°;„XÇÊl
#¦PÇA<ÒF°;„XÇÊl7
›[ˆ5;sB» 
K)òÔ;#›KµM
¢Fƒ’ö;î¾f1
¢Fƒ’ö;î¾f1$
¢Fƒ’ö;î¾f1 
 g}#9,—×7
;9FbßJÁ®æL
 g}#9,
Áƒ*ž—ö¥€.;ÄÑ

