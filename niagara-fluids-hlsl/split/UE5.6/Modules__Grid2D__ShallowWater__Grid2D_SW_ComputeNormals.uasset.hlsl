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
D)t ;Q)OõßÑ¥gìy
l”˚È€$»J§◊;
Normal = float3(0,0,1);
//    float d_right;
//    float d_up;    
    float h_right;
    float h_up;
//    GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX + 1, IndexY, d_right);
//    GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY + 1, d_up);
    GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX + 1, IndexY, h_right);
    GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX, IndexY + 1, h_up);
//    if (d_right < 1e-5)
//    {
//        tmp = 1;
//        h_right = h;
//    }
//    if (d_up < 1e-5)
//        h_up = h;
    float3 WorldPos  = SimPos;
    WorldPos.z += h;
    float3 WorldPosRight = SimPos;
    WorldPosRight.x += dx;
    WorldPosRight.z += h_right;
    float3 WorldPosUp = SimPos;
    WorldPosUp.y += dx;
    WorldPosUp.z += h_up;
    float3 CrossProd = cross(WorldPosRight - WorldPos, WorldPosUp - WorldPos);
    float CrossProdLength = length(CrossProd);
    // default to upward facing normal
    if (CrossProdLength < 1e-5)
        Normal = float3(0,0,1);
    else
        Normal = CrossProd / CrossProdLength;
ùt¢'H£î˘;
    float3 WorldPos = float3(0,0,0);
    WorldPos.z = h;
    float3 WorldPosRight = float3(0,0,0);
    WorldPosRight.x = dx;
    WorldPosRight.z = h_right;
    float3 WorldPosUp = float3(0,0,0);
    WorldPosUp.y = dx;
    WorldPosUp.z = h_up;
;¢I≠ì3ˆ‡VÙìá
õEé*]ºÄπ\;á
∂˘ì‹K!ˆ+;cWé@´◊;u˝˘Ëg3
ˆ+;cWé@´◊;u˝˘Ëg
HdÓï;ÑÏÅz™z±
¶º«ƒ ;cEúŒ˛ÊCÍ˝zä
`=>`¨∂,FêOª•;∑b{ä
˜—„ÿ;„ËBù≠ËØÿÚè
¡É*ûóˆ•Ä.;ƒ—

