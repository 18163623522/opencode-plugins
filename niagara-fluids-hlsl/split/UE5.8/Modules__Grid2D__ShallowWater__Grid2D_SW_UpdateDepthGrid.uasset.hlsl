π“;HÇ/•N∑^∑“’9¿è
√I;öG¢
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
    // Fetch two-cell-away neighbors for MUSCL reconstruction 
      float DepthLeftLeft, DepthRightRight, DepthDownDown, DepthUpUp;
      WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX-2, IndexY, DepthLeftLeft);
      WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX+2, IndexY, DepthRightRight);
      WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY-2, DepthDownDown);
      WaterGrid.GetPreviousFloatValue<Attribute = "WaterDepth">(IndexX, IndexY+2, DepthUpUp);
      // ---- Right face (between cell i and cell i+1) ----
      if (v_x_right > 0)
          // Flow going right, upwind cell is (i)
          // Stencil: i-1, i, i+1
          float sL = Depth - DepthLeft;
          float sR = DepthRight - Depth;
          float slope = sign(sL) * max(0.0, min(abs(sL), sign(sL) * sR));
          IntegrationDepthRight = Depth + 0.5 * slope;
      else
          // Flow going left, upwind cell is (i+1)
          // Stencil: i, i+1, i+2
          float sL = DepthRight - Depth;
          float sR = DepthRightRight - DepthRight;
          IntegrationDepthRight = DepthRight - 0.5 * slope;
      // ---- Left face (between cell i-1 and cell i) ----
      if (v_x > 0)
          // Flow going right, upwind cell is (i-1)
          // Stencil: i-2, i-1, i
          float sL = DepthLeft - DepthLeftLeft;
          float sR = Depth - DepthLeft;
          IntegrationDepthLeft = DepthLeft + 0.5 * slope;
          // Flow going left, upwind cell is (i)
          IntegrationDepthLeft = Depth - 0.5 * slope;
      // ---- Top face (between cell j and cell j+1) ----
      if (v_y_up > 0)
          // Flow going up, upwind cell is (j)
          // Stencil: j-1, j, j+1
          float sL = Depth - DepthDown;
          float sR = DepthUp - Depth;
          IntegrationDepthUp = Depth + 0.5 * slope;
          // Flow going down, upwind cell is (j+1)
          // Stencil: j, j+1, j+2
          float sL = DepthUp - Depth;
          float sR = DepthUpUp - DepthUp;
          IntegrationDepthUp = DepthUp - 0.5 * slope;
      // ---- Bottom face (between cell j-1 and cell j) ----
      if (v_y > 0)
          // Flow going up, upwind cell is (j-1)
          // Stencil: j-2, j-1, j
          float sL = DepthDown - DepthDownDown;
          float sR = Depth - DepthDown;
          IntegrationDepthDown = DepthDown + 0.5 * slope;
          // Flow going down, upwind cell is (j)
          IntegrationDepthDown = Depth - 0.5 * slope;
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
 MGEYFπn#7≈EíÙ;
jAnoA´ëÅÛAøÙÉ;
HdÓï;ÑÏÅz™z±«›
)‰UJÅ˜Ë;Ró›8›
ÛJ©P;~
¡É*ûóˆ•Ä.;ƒ—

