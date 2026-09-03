N²E²`Åë ;÷
9[;X(ä#Cƒ¼§è$˜xY^
9[;X(ä#Cƒ¼§è$˜xY
9[;X(ä#Cƒ¼§è$˜xY%
9[;X(ä#Cƒ¼§è$˜xYh
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
  float h, h_right, h_up;
  GridCollection.GetPreviousValueAtIndex(IndexX,     IndexY,     DepthIndex, h);
  GridCollection.GetPreviousValueAtIndex(IndexX + 1, IndexY,     DepthIndex, h_right);
  GridCollection.GetPreviousValueAtIndex(IndexX,     IndexY + 1, DepthIndex, h_up);
  float2 NumCellsVec = float2(NumCellsX, NumCellsY);
  float3 Unit  = float3((float2(IndexX,     IndexY    ) + 0.5) / NumCellsVec, 0);
  float3 UnitR = float3((float2(IndexX + 1, IndexY    ) + 0.5) / NumCellsVec, 0);
  float3 UnitU = float3((float2(IndexX,     IndexY + 1) + 0.5) / NumCellsVec, 0);
  float3 W  = mul(float4(Unit,  1), UnitToWorld).xyz;
  float3 WR = mul(float4(UnitR, 1), UnitToWorld).xyz;
  float3 WU = mul(float4(UnitU, 1), UnitToWorld).xyz;
  float3 RayC  = normalize(W  - CameraPos);
  float3 RayCR = normalize(WR - CameraPos);
  float3 RayCU = normalize(WU - CameraPos);
  float CosC  = max(dot(RayC,  CameraFwd), 1e-5);
  float CosCR = max(dot(RayCR, CameraFwd), 1e-5);
  float CosCU = max(dot(RayCU, CameraFwd), 1e-5);
  float3 P  = CameraPos + RayC  * (h       / CosC);
  float3 PR = CameraPos + RayCR * (h_right / CosCR);
  float3 PU = CameraPos + RayCU * (h_up    / CosCU);
  float3 N = cross(PR - P, PU - P);
  float NLen = length(N);
  Normal = (NLen > 1e-5) ? N / NLen : float3(0, 0, 1);
  Depth = h;
òÜêŠa;{BŠ
;¿?ÐH¾€©9ÿ˜
=S;:G½Eƒ²
½€ØNÊ;IIœ
ÒMB…x´µ^’N;
Œ4À”½;
–¡ºÊjJrDŒ}â¯Âú;
>áE³!;
1D›Þä;
9G«ië4–;Æz÷
CºD õ;
ÏH;qÙü=E·‡
C¯t-6.m;¢ó
THš%*ó4;J]
$\!E\;y
}Nç3øï>Jµ//åöHöY
}Nç3øï>Jµ//åöHö
J¿üúj’ªl;
G9+îbfG¯GÊØ]+î^;
>=|A¿n¥e'šáö;
^¸ÐNó6þI0Eº;êñ
ÁI°žµÓ4úDïèò§;I4›A›ÈÀ
èò§;I4›A›ÈÀ
Nó6þI0Eº;êñ
}Nç3øï>Jµ//åöHöa
JŒ$¥¶­Ý@¦Û;8¤ÝZ¤
JŒ$¥¶­Ý@¦Û;8¤ÝZ¤c
JŒ$¥¶­Ý@¦Û;8¤ÝZ¤]
Ýo;IR ;O Fé
¾+¶H@»_O¡/l;
JŒ$¥¶­Ý@¦Û;8¤ÝZ¤f
kX¨V5ŒeB°Pªs;Ÿ]#
ª;N3{K±;ª>;Átƒs
ª;N3{K±;ª>;Átƒ
ª;N3{K±;ª>;Átƒu
Áƒ*ž—ö¥€.;ÄÑ

