WaterDepth = Depth;
int IndexX;
int IndexY;
WaterGrid.ExecutionIndexToGridIndex(IndexX, IndexY);
float LeftDepth;
float LeftHeight;
float RightDepth;
float RightHeight;
WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX - 1, IndexY, LeftDepth);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX - 1, IndexY, LeftHeight);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX + 1, IndexY, RightDepth);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX + 1, IndexY, RightHeight);
    WaterDepth += OvershootFilterFactor * (max(0, .5f * (WaterDepth + RightDepth)) - WaterDepth);
    WaterDepth += OvershootFilterFactor * (max(0, .5f * (WaterDepth + LeftDepth)) - WaterDepth);
float DownDepth;
float DownHeight;
float UpDepth;
float UpHeight;
WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY - 1, DownDepth);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX, IndexY - 1, DownHeight);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY + 1, UpDepth);
WaterGrid.GetPreviousFloatValue<Attribute = "WaterHeight">(IndexX, IndexY + 1, UpHeight);
    WaterDepth += OvershootFilterFactor * (max(0, .5f * (WaterDepth + UpDepth)) - WaterDepth);
    WaterDepth += OvershootFilterFactor * (max(0, .5f * (WaterDepth + DownDepth)) - WaterDepth);
WaterHeight = BottomContour + WaterDepth;
<;loò—ÐGŽú
hUÁÔC“ƒ;
;ô§ÿFƒJ|¢ä¿B„v
Áƒ*ž—ö¥€.;ÄÑ

