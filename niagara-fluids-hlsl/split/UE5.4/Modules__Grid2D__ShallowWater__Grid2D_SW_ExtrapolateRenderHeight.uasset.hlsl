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
    // dont set depth since we only want the height for rendering
    // #todo(dmp): need a better way of getting this to render than using the sim buffers
    //WaterDepth = WaterHeight - Input_BottomContour;
WaterDepth = 0;
WaterHeight = 0;
float TotalWeight = 1;
// max float for 16 bit float
float MinDist = 65500;
for (int xx = -ExtrapolationHalfWidth; xx <= ExtrapolationHalfWidth; ++xx)  {
for (int yy = -ExtrapolationHalfWidth; yy <= ExtrapolationHalfWidth; ++yy)  {
    if (xx == 0 && yy == 0)
        continue;
const int TmpIndexX = IndexX + xx;
const int TmpIndexY = IndexY + yy;
const float dist = length(float2(TmpIndexX, TmpIndexY) - float2(IndexX, IndexY));
float TmpDepthVal;
WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(TmpIndexX, TmpIndexY, TmpDepthVal);
float TmpHeightVal;
WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(TmpIndexX, TmpIndexY, TmpHeightVal);
float TmpValCollision;
GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(TmpIndexX, TmpIndexY, TmpValCollision);
// if a neighboring cell is not a boundary,  
   if (Input_IsCollider > 1-1e-5)
    if (Input_WaterDepth < 1e-5 && dist < MinDist && TmpValCollision < 1-1e-5 && TmpDepthVal > 1e-5)
    WaterHeight = TmpHeightVal;
    MinDist = dist;
        float Weight = 1. - smoothstep(0.0, ExtrapolationHalfWidth, dist);
        // apply smoothing to valid depths
 WaterHeight += TmpHeightVal * Weight;
        TotalWeight += Weight;
// normalize smoothing
    WaterHeight /= TotalWeight;
// #note: we do not update depth here since we are only doing this for rendering and normal generation
float ExtrapWeight = 0;
float IsCollider;
GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(IndexX, IndexY, IsCollider);
    WaterHeight = 0;
    float TmpValCollision;
    if (IsCollider > 1-1e-5 && xx != 0 && yy != 0)
    WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(TmpIndexX, TmpIndexY, TmpDepthVal);
    if (Input_WaterDepth < 1e-5 && TmpValCollision < 1-1e-5 && TmpDepthVal > 1e-5)
    WaterHeight += TmpHeightVal * dist;
            ExtrapWeight += dist;
        Weight *= 1. - smoothstep(0, SmoothingHeightCutoff, abs(TmpHeightVal - Input_WaterHeight));
WaterHeight += TmpHeightVal * Weight;
    WaterHeight /= ExtrapWeight;

