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
$\!E\;y

