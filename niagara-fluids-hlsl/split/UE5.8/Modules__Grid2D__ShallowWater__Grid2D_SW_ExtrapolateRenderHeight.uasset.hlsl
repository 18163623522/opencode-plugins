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
;áÊX?âLû÷!l?-‡b
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
float IsCollider;
GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(IndexX, IndexY, IsCollider);
// we extrapolate into cells that are a collider or has zero water depth
bool IsExtrapCell = IsCollider > 1-1e-5 || Input_WaterDepth < 1e-5;
    WaterHeight = 0;
    TotalWeight = 0;
    if (xx != 0 && yy != 0)
   const int TmpIndexX = IndexX + xx;
   const int TmpIndexY = IndexY + yy;
   const float dist = length(float2(TmpIndexX, TmpIndexY) - float2(IndexX, IndexY));
   float TmpHeightVal;
   WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(TmpIndexX, TmpIndexY, TmpHeightVal);
       float TmpValCollision;
   GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(TmpIndexX, TmpIndexY, TmpValCollision);
       float TmpDepthVal;
       WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(TmpIndexX, TmpIndexY, TmpDepthVal);
      // only consider extrapolationa and smoothing with non collision and wet cells
      if (TmpValCollision < 1-1e-5 && TmpDepthVal > 1e-5)
        float Weight = 0;
        if (IsExtrapCell)
             Weight = dist;
     else if (UseSmoothing)
          // apply smoothing to valid depths, weighted by distance and relative height
          Weight = 1. - smoothstep(0.0, ExtrapolationHalfWidth, dist);
          Weight *= 1. - smoothstep(0, SmoothingHeightCutoff, abs(TmpHeightVal - Input_WaterHeight));
        WaterHeight += TmpHeightVal * Weight;
    // if we have an extrapolation cell, but nothing extrapolated into it, default to old value
    WaterHeight = Input_WaterHeight;
float TotalWeightHeight = 1;
float TotalWeightDepth = 1;
int TextureMaxX = NumCellsX-1;
int TextureMaxY = NumCellsY-1;
bool IsBorder = (IndexX < BorderWidth || IndexY < BorderWidth || IndexX > TextureMaxX - BorderWidth || IndexY > TextureMaxY - BorderWidth);
bool IsExtrapCell = !IsBorder && (IsCollider > 1-1e-5 || Input_WaterDepth < 1e-5);
    WaterDepth = 0;
    TotalWeightHeight = 0;
    TotalWeightDepth = 0;
// we use a smaller extrapolation width for depth so we don't get stretching at the boundary
// parts of the mesh
int ExtrapolationHalfWidthForDepth = max(ExtrapolationHalfWidth - 2, 1);
// if we have a smoothing cutoff of 0, do uniform smoothing
    SmoothingMethod = 3;
   int TmpIndexX = IndexX + xx;
   int TmpIndexY = IndexY + yy;
       TmpIndexX = clamp(TmpIndexX, 0, TextureMaxX);
       TmpIndexY = clamp(TmpIndexY, 0, TextureMaxY);
     else if (SmoothingMethod != 0)
          if (SmoothingMethod == 1)
                Weight *= 1. - smoothstep(0, SmoothingHeightCutoff, abs(TmpHeightVal - Input_WaterHeight));
          else if (SmoothingMethod == 2)
                Weight *= smoothstep(0, SmoothingHeightCutoff, abs(TmpHeightVal - Input_WaterHeight));
          else if (SmoothingMethod == 3)
                Weight *= 1.;
        TotalWeightHeight += Weight;
        if (abs(xx) <= ExtrapolationHalfWidthForDepth && abs(yy) <= ExtrapolationHalfWidthForDepth)
            WaterDepth += TmpDepthVal * Weight;
            TotalWeightDepth += Weight;
    WaterHeight /= TotalWeightHeight;
    WaterDepth /= TotalWeightDepth;
    WaterDepth = Input_WaterDepth;
// make sure we don't render border cells
  WaterDepth = 0;
8^›t›0+;ò
ÑA#@°k≥ØΩ;–e£
Uˆ[B£¶z;s£ù
;áÊX?âLû÷!l?-‡b#
;áÊX?âLû÷!l?-‡b±
»t;<‘◊@˘A©>U
t;<‘◊@˘A©>U
è#;ãÆ»%Oâ
HdÓï;ÑÏÅz™z±
¡É*ûóˆ•Ä.;ƒ—

