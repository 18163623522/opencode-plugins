WaterDepth = Input_WaterDepth;
WaterHeight = Input_WaterHeight;
// if we have a boundary cell, then gather value from closest neighbor cell
    const int HalfWidth = ExtrapolationHalfWidth;
    // max float for 16 bit float
    float MinDist = 65500;
    for (int xx = -HalfWidth; xx <= HalfWidth; ++xx)  {
    for (int yy = -HalfWidth; yy <= HalfWidth; ++yy)  {
        const int TmpIndexX = IndexX + xx;
        const int TmpIndexY = IndexY + yy;
        const float dist = length(float2(TmpIndexX, TmpIndexY) - float2(IndexX, IndexY));
        float TmpDepthVal;
        GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(TmpIndexX, TmpIndexY, TmpDepthVal);
        float TmpHeightVal;
        GridCollection.GetPreviousFloatValue<Attribute = "WaterHeight">(TmpIndexX, TmpIndexY, TmpHeightVal);
        float TmpValCollision;
        GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(TmpIndexX, TmpIndexY, TmpValCollision);
        // if a neighboring cell is not a boundary,  
        if (dist < MinDist && TmpValCollision < 1-1e-5 && TmpDepthVal > 1e-5)
            WaterHeight = TmpHeightVal;
            MinDist = dist;
    WaterDepth = WaterHeight - Input_BottomContour;
WaterDepth = 0;
WaterHeight = 0;
        WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(TmpIndexX, TmpIndexY, TmpDepthVal);
        WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(TmpIndexX, TmpIndexY, TmpHeightVal);

