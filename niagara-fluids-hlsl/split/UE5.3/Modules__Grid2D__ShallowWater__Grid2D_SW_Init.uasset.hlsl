float CollisionRet = 0;
float2 px = float2(IndexX, IndexY);
float2 cen = float2(CenterX, CenterY);
float dist = length(px-cen);
float Height = Input_BottomContour;
  Height = WaterHeight;
Height = max(Input_BottomContour, Height);
    Height = InitialWaterDropHeight;
float Depth = max(0.0, Height - Input_BottomContour);
// #todo(dmp): recalc height here or get rid of that max call?
int TextureMaxX = NumCellsX-1;
int TextureMaxY = NumCellsY-1;
    CollisionRet = 1;
VelocityX = velocity.x;
VelocityY = velocity.y;
WaterDepth = Depth;
Out_WaterHeight = Height;
IsCollider =                 CollisionRet;
BottomContour = Input_BottomContour;
VelocityX = 0;
VelocityY = 0;
WaterDepth = 0;
Out_WaterHeight = 0;
IsCollider = 0;
BottomContour = 0;
OutVelocity = Velocity;

