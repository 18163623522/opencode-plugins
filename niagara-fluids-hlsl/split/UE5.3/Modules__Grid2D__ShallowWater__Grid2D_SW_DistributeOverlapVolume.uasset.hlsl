float NewDepth = Input_WaterDepth;
// if we have a boundary cell, then gather value from closest neighbor cell
    const int Width = DistributeOverlapHalfWidth;
    int NumCells = (2*Width + 1);
    NumCells *= NumCells;
    float DepthAdd = 0;
    for (int xx = -Width; xx <= Width; ++xx)  {
    for (int yy = -Width; yy <= Width; ++yy)  {
        int TmpIndexX = IndexX + xx;
        int TmpIndexY = IndexY + yy;
        float TmpValCollision;
        GridCollection.GetPreviousFloatValue<Attribute = "OverlapVolume">(TmpIndexX, TmpIndexY, TmpValCollision);
        DepthAdd +=TmpValCollision;
    // @todo(dmp): normalize according to overlap volume?
    NewDepth += (DepthAdd / NumCells * OverlapVolumeMult);
WaterDepth = NewDepth;
WaterHeight = Input_BottomContour + WaterDepth;
WaterDepth = 0;
WaterHeight = 0;
    // scale by dt for when we are using fixed dt (note mult by 30 is for a bit of backwards compat)
    NewDepth += (DepthAdd / NumCells * OverlapVolumeMult) * SimDt*30;
0;lzG\A
;w*y)&

