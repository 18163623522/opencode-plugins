;¹µ{8‹±:ã
OutVelocity = Velocity;
const  int FLUID_CELL = 0;
const  int SOLID_CELL = 1;
const  int EMPTY_CELL = 2;
int CellType = round(Boundary);
const int HalfWidth = ExtrapolationHalfWidth;
float TotalWeight = 0;
// if we have a boundary cell, then gather value from closest neighbor cell
    OutVelocity = float2(0.0f, 0.0f);
    // max float for 16 bit float
    float MinDist = 65500;
    for (int xx = -HalfWidth; xx <= HalfWidth; ++xx)  {
    for (int yy = -HalfWidth; yy <= HalfWidth; ++yy)  {        
        const int TmpIndexX = IndexX + xx;
        const int TmpIndexY = IndexY + yy;
        const float dist = length2(float2(TmpIndexX, TmpIndexY) - float2(IndexX, IndexY));
        float2 TmpVelocity;
        Grid.GetVector2Value<Attribute="Velocity">(TmpIndexX, TmpIndexY, TmpVelocity);
        float TmpBoundary;
        Grid.GetFloatValue<Attribute="Boundary">(TmpIndexX, TmpIndexY, TmpBoundary);
        int TmpCellType = round(TmpBoundary);
        // only extrapolate from fluid cells
        // don't extrapolate from the boundary of the domain to allow particles to pass through as ballistic when they leave
        if (TmpCellType == FLUID_CELL && TmpIndexX >= BorderWidth && TmpIndexY >= BorderWidth && TmpIndexX <= NumCellsX - BorderWidth && TmpIndexY <= NumCellsY - BorderWidth)
            float Weight = 1./dist;
            OutVelocity += TmpVelocity * Weight;
            TotalWeight  += Weight;
    if (TotalWeight > 1e-5)
        OutVelocity /= TotalWeight;
‹;ËOê”iGDÅY:+ºÂ
‹;ËOê”iGDÅY:+º
Áƒ*—ö¥€.;ÄÑ

