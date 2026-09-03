;rÆA6O{÷´¾/
float CellSize = max(WorldGridExtents.x, WorldGridExtents.y) / NumCellsMaxAxis;
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
r=5Ým¨þL³Llyb_I;Û
const float CellSize = WorldCellSize;
#¦PÇA<ÒF°;„XÇÊl
#¦PÇA<ÒF°;„XÇÊlÚ
›[ˆ5;sB» 
K)òÔ;#›KµM
…áÁ@ž‹‚˜/;ŽÕ~
¢Fƒ’ö;î¾f1
¢Fƒ’ö;î¾f1b
 g}#9,—×7
;9FbßJÁ®æL
 g}#9,
¼ºü–M©;fW
£;s0“xO·Ñ
„q;dÏDØJ‘` ˆ]Ë
þAqÿQ@ÐI±›5;
Áƒ*ž—ö¥€.;ÄÑ

