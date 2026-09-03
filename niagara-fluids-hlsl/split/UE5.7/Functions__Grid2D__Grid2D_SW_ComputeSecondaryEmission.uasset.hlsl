EmitAmount = 0;
int NumCellsX;
int NumCellsY;
WaterReader.GetNumCells(NumCellsX, NumCellsY);
float2 UnitDX = float2(1. / NumCellsX, 1. / NumCellsY);
float WaterDepth;
WaterReader.SamplePreviousGridFloatValue<Attribute="WaterDepth">(CurrUnit, WaterDepth);
    // emit from vorticity
    float vx_1;
    float vx_m1;
    float vy_1;
    float vy_m1;
    float2 TmpVector;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit + float2(0,1) * UnitDX, TmpVector);
    vx_1 = TmpVector.x;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit + float2(0,-1) * UnitDX, TmpVector);
    vx_m1 = TmpVector.x;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit + float2(1,0) * UnitDX, TmpVector);    
    vy_1 = TmpVector.y;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit + float2(-1,0) * UnitDX, TmpVector);        
    vy_m1 = TmpVector.y;
    float curl = abs(((vx_1-vx_m1) - (vy_1-vy_m1)) / (2. * SimDx));
    // Emit
    EmitAmount += smoothstep(MinEmitVorticity, MaxEmitVorticity, curl);
    EmitAmount *= EmissionMult;
ö≤&$;Aìù€ËGAYà
;K^ÀFOìñ
    // emit from vorticity -----------------------------------------------------------------
    EmitAmount += VorticityEmissionMult * smoothstep(VorticityEmissionRange[0], VorticityEmissionRange[1], curl);
    // emit from velocity -----------------------------------------------------------------
    float2 Velocity = float2(.5 * (vx_1 + vx_m1), .5 * (vy_1 + vy_m1));
    EmitAmount += VelocityEmissionMult * smoothstep(VelocityEmissionRange[0], VelocityEmissionRange[1], length(Velocity));
    // emit from acceleration -----------------------------------------------------------------
    float2 Acceleration;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Acceleration">(CurrUnit, Acceleration);
    EmitAmount += AccelerationEmissionMult * smoothstep(AccelerationEmissionRange[0], AccelerationEmissionRange[1], length(Acceleration));
    // emit from curvature -----------------------------------------------------------------
    float3 Normal;
    NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(CurrUnit + float2(0,0) * UnitDX, Normal);
    float3 Normal_right;
    NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(CurrUnit + float2(1,0) * UnitDX, Normal_right);
    float3 Normal_up;
    NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(CurrUnit + float2(0,1) * UnitDX, Normal_up);
    float Curvature_x = 1. - dot(Normal, Normal_right);
    float Curvature_y = 1. - dot(Normal, Normal_up);
    float Curvature = abs((Curvature_x + Curvature_y) * .5);
    EmitAmount += CurvatureEmissionMult * smoothstep(CurvatureEmissionRange[0], CurvatureEmissionRange[1], Curvature);
    // final scale -----------------------------------------------------------------
@;E∞‘'_a®
AccelEmitAmount = 0;
VorticityEmitAmount = 0;
CurvatureEmitAmount = 0;
VelocityEmitAmount = 0;
DepthDifferenceEmitAmount = 0;
NormalReader.GetNumCells(NumCellsX, NumCellsY);
float2 UnitXY = CurrUnit.xy;
    WaterReader.SamplePreviousGridFloatValue<Attribute="WaterDepth">(UnitXY, WaterDepth);
    float4 BakedSimSample;
    BakedSimGrid.SampleTexture2D(UnitXY, 0, BakedSimSample);
    WaterDepth = BakedSimSample.y;
    if (SampleFromGrid)
        float2 TmpVector;
        VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(UnitXY + float2(0,1) * UnitDX, TmpVector);
        vx_1 = TmpVector.x;
        VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(UnitXY + float2(0,-1) * UnitDX, TmpVector);
        vx_m1 = TmpVector.x;
        VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(UnitXY + float2(1,0) * UnitDX, TmpVector);    
        vy_1 = TmpVector.y;
        VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(UnitXY + float2(-1,0) * UnitDX, TmpVector);        
        vy_m1 = TmpVector.y;
    else
        float4 BakedSimSample;
        BakedSimGrid.SampleTexture2D(UnitXY + float2(0,1) * UnitDX, 0, BakedSimSample);
        vx_1 = BakedSimSample.z;
        BakedSimGrid.SampleTexture2D(UnitXY + float2(0,-1) * UnitDX, 0, BakedSimSample);
        vx_m1 = BakedSimSample.z;
        BakedSimGrid.SampleTexture2D(UnitXY + float2(1,0) * UnitDX, 0, BakedSimSample);
        vy_1 = BakedSimSample.w;
        BakedSimGrid.SampleTexture2D(UnitXY + float2(-1,0) * UnitDX, 0, BakedSimSample);
        vy_m1 = BakedSimSample.w;
    VorticityEmitAmount = VorticityEmissionMult * smoothstep(VorticityEmissionRange[0], VorticityEmissionRange[1], curl);
    EmitAmount = max(EmitAmount, VorticityEmitAmount);
    VelocityEmitAmount = VelocityEmissionMult * smoothstep(VelocityEmissionRange[0], VelocityEmissionRange[1], length(Velocity));
    EmitAmount = max(EmitAmount, VelocityEmitAmount);
    // float2 Acceleration;
    // VelocityReader.SamplePreviousGridVector2DValue<Attribute="Acceleration">(UnitXY, Acceleration);
    // AccelEmitAmount = AccelerationEmissionMult * smoothstep(AccelerationEmissionRange[0], AccelerationEmissionRange[1], length(Acceleration));
    // EmitAmount += AccelEmitAmount;
    NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(UnitXY + float2(0,0) * UnitDX, Normal);
    NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(UnitXY + float2(1,0) * UnitDX, Normal_right);
    NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(UnitXY + float2(0,1) * UnitDX, Normal_up);
    CurvatureEmitAmount = CurvatureEmissionMult * smoothstep(CurvatureEmissionRange[0], CurvatureEmissionRange[1], Curvature);
    EmitAmount = max(EmitAmount, CurvatureEmitAmount);
    // emit from depth difference -----------------------------------------------------------------
int IndexX;
    int IndexY;
    NormalReader.ExecutionIndexToGridIndex(IndexX, IndexY);
    float2 SampleIndex = float2(IndexX, IndexY) + Velocity * (SimDt / SimDx) ;   
    float3 SampleUnit;
    NormalReader.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
    float NextWaterDepth; 
        WaterReader.SamplePreviousGridFloatValue<Attribute="WaterDepth">(SampleUnit.xy, NextWaterDepth);
        BakedSimGrid.SampleTexture2D(SampleUnit.xy, 0, BakedSimSample);
        NextWaterDepth = BakedSimSample.y;
float DepthDifference = max(NextWaterDepth - WaterDepth,0.0);
    DepthDifferenceEmitAmount = DepthDifferenceEmissionMult * smoothstep(DepthDifferenceEmissionRange[0],DepthDifferenceEmissionRange[1], DepthDifference);
    EmitAmount += DepthDifferenceEmitAmount;
    // Restrict
    float Speed = length(Velocity);
    // typically the top speed is very high, so we have a hard transition to not smooth out values way less than the max
    float RestrictEmissionDepthMult = 
        smoothstep(RestrictEmissionDepthRange.x, 
        RestrictEmissionDepthRange.y, 
        WaterDepth);
    float RestrictEmissionSpeedMult = 
        smoothstep(RestrictEmissionSpeedRange.x, 
        RestrictEmissionSpeedRange.y, 
        Speed);    
    EmitAmount *= RestrictEmissionSpeedMult * RestrictEmissionDepthMult;
    AccelEmitAmount *= RestrictEmissionSpeedMult * RestrictEmissionDepthMult;
    VorticityEmitAmount *= RestrictEmissionSpeedMult * RestrictEmissionDepthMult;
    CurvatureEmitAmount *= RestrictEmissionSpeedMult * RestrictEmissionDepthMult;
    VelocityEmitAmount *= RestrictEmissionSpeedMult * RestrictEmissionDepthMult;
    DepthDifferenceEmitAmount *= RestrictEmissionSpeedMult * RestrictEmissionDepthMult;
    EmitAmount = clamp(EmitAmount, 0, MaxEmitAmount);
    AccelEmitAmount = clamp(AccelEmitAmount, 0, MaxEmitAmount);
    VorticityEmitAmount = clamp(VorticityEmitAmount, 0, MaxEmitAmount);
    CurvatureEmitAmount = clamp(CurvatureEmitAmount, 0, MaxEmitAmount);
    VelocityEmitAmount = clamp(VelocityEmitAmount, 0, MaxEmitAmount);
    DepthDifferenceEmitAmount = clamp(VelocityEmitAmount, 0, MaxEmitAmount);
øÅ…Hµ˚;w
&Mú=ò•;IêH
2O§ˇh;ë
h°úé&;
ö≤&$;Aìù€ËGAYàW
Gû¬Ï^ª;Ê
vØ®”ÎpîN†k«Q;~+˚ 
vØ®”ÎpîN†k«Q;~+˚4
ö≤&$;Aìù€ËGAYà*
ï &„ﬂ;˛KúŸ/
qÙM·ıµ;
ö≤&$;Aìù€ËGAYà>
h°úé&;C
h°úé&;9
Ù2Ã;Rø„Mπß
Ä¢V‡;´Â-∑Ÿ
¡É*ûóˆ•Ä.;ƒ—

