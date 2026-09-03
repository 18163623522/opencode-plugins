VelocityX = Input_VelocityX;
VelocityY = Input_VelocityY;
const int HalfWidth = ExtrapolationHalfWidth;
// if we have a boundary cell, then gather value from closest neighbor cell
    // max float for 16 bit float
    float MinDist = 65500;
    for (int xx = -HalfWidth; xx <= HalfWidth; ++xx)  {
    for (int yy = -HalfWidth; yy <= HalfWidth; ++yy)  {        
        const int TmpIndexX = IndexX + xx;
        const int TmpIndexY = IndexY + yy;
        const float dist = length(float2(TmpIndexX, TmpIndexY) - float2(IndexX, IndexY));
        float2 TmpVelocity;
        GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(TmpIndexX, TmpIndexY, TmpVelocity);
        float TmpWaterDepth;
        GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(TmpIndexX, TmpIndexY, TmpWaterDepth);
        float TmpWaterHeight;
        GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(TmpIndexX, TmpIndexY, TmpWaterHeight);
        float TmpValCollision;
        GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(TmpIndexX, TmpIndexY, TmpValCollision);
        // if a neighboring cell is the closest cell that is 
        // full of water and has a depth higher than the cell
        // we are extrapolating into
        if (dist < MinDist && TmpWaterDepth > 1e-5 && TmpWaterHeight > Input_WaterHeight && (TmpVelocity.x > 1e-5 || TmpVelocity.y > 1e-5))
            VelocityX = TmpVelocity.x;
            VelocityY = TmpVelocity.y;
            MinDist = dist;
VelocityX = 0;
VelocityY = 0;
Velocity = Input_Velocity;
        VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(TmpIndexX, TmpIndexY, TmpVelocity);
        WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(TmpIndexX, TmpIndexY, TmpWaterDepth);
        WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(TmpIndexX, TmpIndexY, TmpWaterHeight);
            Velocity = TmpVelocity;

