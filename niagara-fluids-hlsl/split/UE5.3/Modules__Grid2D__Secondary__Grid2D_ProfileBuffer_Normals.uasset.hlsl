float p = (Unit.x - .5) * TileWidth;
float h;
float h_right;
ProfileBuffer.GetGridValue(IndexX , 0, 0, h);
ProfileBuffer.GetGridValue(IndexX + 1, 0, 0, h_right);
float3 WorldPos;
WorldPos.x = p;
WorldPos.y = 0;
WorldPos.z = h;
float3 WorldPosRight = WorldPos;
WorldPosRight.x += dx;
WorldPosRight.z = h_right;
float3 WorldPosUp = float3(0,1,0);
Normal = normalize(cross(WorldPosRight - WorldPos,  float3(0,1,0)));
Normal = float3(0,0,0);

