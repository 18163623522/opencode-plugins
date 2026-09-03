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
]R†jì;ÊH„Ê?oX;
r=5Ým¨þL³Llyb_I;
r=5Ým¨þL³Llyb_I;ñ
const float CellSize = WorldCellSize;
`ÓS M´šé*;v‰T“
#¦PÇA<ÒF°;„XÇÊl
#¦PÇA<ÒF°;„XÇÊlð
›[ˆ5;sB» 
K)òÔ;#›KµM
¢Fƒ’ö;î¾f1
¢Fƒ’ö;î¾f1t
 g}#9,—×7
;9FbßJÁ®æL
 g}#9,
Hdî•;„ìzªz±
xªM‡4i=;
Áƒ*ž—ö¥€.;ÄÑ

