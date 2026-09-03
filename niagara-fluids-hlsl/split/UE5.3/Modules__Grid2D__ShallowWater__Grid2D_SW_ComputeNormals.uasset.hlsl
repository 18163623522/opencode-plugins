float h_right;
float h_up;
GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX + 1, IndexY, h_right);
GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX, IndexY + 1, h_up);
float3 WorldPos  = SimPos;
WorldPos.z += h;
float3 WorldPosRight = SimPos;
WorldPosRight.x += dx;
WorldPosRight.z += h_right;
float3 WorldPosUp = SimPos;
WorldPosUp.y += dx;
WorldPosUp.z += h_up;
Normal = normalize(cross(WorldPosRight - WorldPos, WorldPosUp - WorldPos));
Normal = float3(0,0,0);
float3 CrossProd = cross(WorldPosRight - WorldPos, WorldPosUp - WorldPos);
float CrossProdLength = length(CrossProd);
// default to upward facing normal
    Normal = float3(0,0,1);
    Normal = CrossProd / CrossProdLength;

