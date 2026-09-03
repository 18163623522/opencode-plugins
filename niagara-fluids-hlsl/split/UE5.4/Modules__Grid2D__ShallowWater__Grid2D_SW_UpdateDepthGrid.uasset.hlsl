WaterDepth = 0;
WaterHeight = 0;
// disperse waves near boundary
float2 FalloffUV = smoothstep(UnitSpaceFalloffStart, 1., 2.*abs(Unit.xy - .5));
float FalloffInterp = max(FalloffUV.x, FalloffUV.y);
WaterDepth = lerp(Input_WaterDepth, -1.*Input_BottomContour, FalloffInterp);
WaterHeight = Input_BottomContour + WaterDepth;
float Depth = Input_WaterDepth;
float TmpValue;
float2 TmpVelocity;
GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY, TmpVelocity);
float v_x_right = TmpVelocity.x;
float v_x = Input_VelocityX;
GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY+1, TmpVelocity);
float v_y_up = TmpVelocity.y;
float v_y = Input_VelocityY;
// find average depth around current sample
float AvgDepth = 0;
GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY+1, TmpValue);
AvgDepth += TmpValue;
GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY-1, TmpValue);
GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX+1, IndexY, TmpValue);
GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX-1, IndexY, TmpValue);
float AvgDepthMax = IntegrationDepthMax * dx / (980.0 * dt);
//#todo(dmp): use average depth to increase stability?
float DepthToUse = Depth;//min(Depth, AvgDepthMax);// - max(0, AvgDepth*.25 - AvgDepthMax);
Depth -= DtOverDx * DepthToUse * ((v_x_right - v_x) + (v_y_up- v_y));
WaterDepth = lerp(Depth,  BaseWaterHeight-Input_BottomContour - Input_OverlapVolume, Input_IsCollider);
WaterDepth = min(max(WaterDepth, 0.0), MaxDepth);
float FalloffInterp = smoothstep(UnitSpaceFalloffStart, 1., 2.*length(Unit.xy - .5));
VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX+1, IndexY, TmpVelocity);
float v_x = Input_Velocity.x;
VelocityGrid.GetPreviousVector2DValue<Attribute = "Velocity">(IndexX, IndexY+1, TmpVelocity);
float v_y = Input_Velocity.y;
// float TmpValue;
// float AvgDepth = 0;
// WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY+1, TmpValue);
// AvgDepth += TmpValue;
// WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY-1, TmpValue);
// WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX+1, IndexY, TmpValue);
// WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX-1, IndexY, TmpValue);
// float AvgDepthMax = IntegrationDepthMax * dx / (980.0 * dt);
// #todo(dmp): use average depth to increase stability?
// Depth = min(Depth, AvgDepthMax);
Depth -= DtOverDx * Depth * ((v_x_right - v_x) + (v_y_up- v_y));
float WaterDepthInsideCollider;
    WaterDepthInsideCollider = Input_WaterDepth;
    WaterDepthInsideCollider = BaseWaterHeight-Input_BottomContour - Input_OverlapVolume;
WaterDepth = lerp(Depth,  WaterDepthInsideCollider, Input_IsCollider);

