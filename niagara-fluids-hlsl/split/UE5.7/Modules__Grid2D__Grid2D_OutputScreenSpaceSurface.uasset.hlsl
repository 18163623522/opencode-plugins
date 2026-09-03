9[;X(ä#Cƒ¼§è$˜xYC
9[;X(ä#Cƒ¼§è$˜xYÃ
9[;X(ä#Cƒ¼§è$˜xY
9[;X(ä#Cƒ¼§è$˜xYý
float h_right;
float h_up;
float h;
GridCollection.GetPreviousValueAtIndex(IndexX, IndexY, DepthIndex, h);
GridCollection.GetPreviousValueAtIndex(IndexX + 1, IndexY, DepthIndex, h_right);
GridCollection.GetPreviousValueAtIndex(IndexX, IndexY + 1, DepthIndex, h_up);
float3 TmpUnit;
GridCollection.IndexToUnit(IndexX, IndexY, TmpUnit);
float3 WorldPos = mul(float4(TmpUnit, 1.0), UnitToWorld).xyz;
float3 WorldCellPosToCamera = CameraPos - WorldPos;
float WorldCellPosToCameraDist = length(WorldCellPosToCamera);
float CellDepth = WorldCellPosToCameraDist - h;
    WorldPos += WorldCellPosToCamera * CellDepth / WorldCellPosToCameraDist;
GridCollection.IndexToUnit(IndexX+1, IndexY, TmpUnit);
float3 WorldPosRight = mul(float4(TmpUnit, 1.0), UnitToWorld).xyz;
WorldCellPosToCamera = CameraPos - WorldPosRight;
WorldCellPosToCameraDist = length(WorldCellPosToCamera);
CellDepth = WorldCellPosToCameraDist - h_right;
    WorldPosRight += WorldCellPosToCamera * CellDepth / WorldCellPosToCameraDist;
GridCollection.IndexToUnit(IndexX, IndexY+1, TmpUnit);
float3 WorldPosUp = mul(float4(TmpUnit, 1.0), UnitToWorld).xyz;
WorldCellPosToCamera = CameraPos - WorldPosUp;
CellDepth = WorldCellPosToCameraDist - h_up;
    WorldPosUp += WorldCellPosToCamera * CellDepth / WorldCellPosToCameraDist;
float3 CrossProd = cross(WorldPosRight - WorldPos, WorldPosUp - WorldPos);
float CrossProdLength = length(CrossProd);
// default to upward facing normal
    Normal = float3(0,0,1);
    Normal = CrossProd / CrossProdLength;
¢ðM§ZÀ„õ;
lÓûéÛ$ÈJ¤×;
òÜêŠa;{BŠ
;¿?ÐH¾€©9ÿ˜
=S;:G½Eƒ²
½€ØNÊ;IIœ
9G«ië4–;Æz¬
CºD õ;
THš%*ó4;J]
$\!E\;y
}Nç3øï>Jµ//åöHö$
}Nç3øï>Jµ//åöHö
kX¨V5ŒeB°Pªs;Ÿ]#µ
kX¨V5ŒeB°Pªs;Ÿ]#
ª;N3{K±;ª>;Átƒ'
ª;N3{K±;ª>;Átƒ
Áƒ*ž—ö¥€.;ÄÑ

