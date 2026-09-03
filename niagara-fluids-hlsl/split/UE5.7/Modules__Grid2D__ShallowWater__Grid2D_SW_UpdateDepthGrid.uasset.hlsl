IÜe”§ØÃÈπ“;HÇ/•N∑^∑“’9¿è
ÙD;”@±f
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
float IntegrationDepthLeft = Depth;
float IntegrationDepthRight = Depth;
float IntegrationDepthDown = Depth;
float IntegrationDepthUp = Depth;
float DepthLeft = Depth;
float DepthRight = Depth;
float DepthDown = Depth;
float DepthUp = Depth;
    WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX-1, IndexY, DepthLeft);
    WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX+1, IndexY, DepthRight);
    WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY-1, DepthDown);
    WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY+1, DepthUp);
    if (v_x_right <= 0)
        IntegrationDepthRight = DepthRight;
    if (v_x > 0)
        IntegrationDepthLeft = DepthLeft;
    if (v_y_up <= 0)
        IntegrationDepthUp = DepthUp;
    if (v_y > 0)
        IntegrationDepthDown = DepthDown;
    float AvgDepth = 0;
    float TotalWeight = 0;
    // only average with wet cells to not bias averaged depth with dry cells
    TotalWeight += DepthLeft > 1e-8 ? 1 : 0;
    TotalWeight += DepthRight > 1e-8 ? 1 : 0;
    TotalWeight += DepthDown > 1e-8 ? 1 : 0;
    TotalWeight += DepthUp > 1e-8 ? 1 : 0;
    AvgDepth = (DepthLeft + DepthRight + DepthDown + DepthUp) / TotalWeight;
    float MinIntegrationDepth = IntegrationDepthMax * dx / (Gravity * dt);
    float DepthAdjustment = max(0.f, AvgDepth - MinIntegrationDepth);
    IntegrationDepthLeft -= DepthAdjustment;
    IntegrationDepthRight -= DepthAdjustment;
    IntegrationDepthDown -= DepthAdjustment;
    IntegrationDepthUp -= DepthAdjustment;
                           (IntegrationDepthUp * v_y_up - IntegrationDepthDown * v_y));
// dissipate very thin areas of water as a fraction of dx
Depth -= dt * FadeOutShallowSpeed * (1. - smoothstep(0,dx * FadeOutShallowStart, Depth));
ÑA#@°k≥ØΩ;–e£
Uˆ[B£¶z;s£ù
‡;GèUß®
HdÓï;ÑÏÅz™z±
)‰UJÅ˜Ë;Ró›8Æ
√I;öG¢
ÛJ©P;~
¡É*ûóˆ•Ä.;ƒ—

