Curl = 0;
Velocity = 0.0;
Curvature = 0.0;
DepthDifference = 0.0;
WaterDepth = 0.0;
WaterHeight = 0.0;
HeightDifference = 0.0;
WaterNormal = float3(0,0,0);
int NumCellsX;
int NumCellsY;
    NormalReader.GetNumCells(NumCellsX, NumCellsY);
    int2 NumCells;
    BakedNormalGrid.GetTextureDimensions(0, NumCells);
    NumCellsX = NumCells.x;
    NumCellsY = NumCells.y;
float2 UnitDX = float2(1. / NumCellsX, 1. / NumCellsY);
float2 UnitXY = CurrUnit.xy;
UnitXY = clamp(UnitXY, UnitDX, 1.-UnitDX);
    WaterReader.SamplePreviousGridFloatValue<Attribute="WaterDepth">(UnitXY, WaterDepth);
    WaterReader.SamplePreviousGridFloatValue<Attribute="WaterHeight">(UnitXY, WaterHeight);
    float4 BakedSimSample;
    BakedSimGrid.SampleTexture2D(UnitXY, 0, BakedSimSample);
    WaterDepth = BakedSimSample.y;
    WaterHeight = BakedSimSample.x;
    // calculate vorticity -----------------------------------------------------------------
    float vx_1;
    float vx_m1;
    float vy_1;
    float vy_m1;
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
    Curl = abs(((vx_1-vx_m1) - (vy_1-vy_m1)) / (2. * SimDx));
    // calculate velocity -----------------------------------------------------------------
    Velocity = float2(.5 * (vx_1 + vx_m1), .5 * (vy_1 + vy_m1));
    // calculate curvature -----------------------------------------------------------------
    float3 Normal;
    float3 Normal_right;
    float3 Normal_up;
        NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(UnitXY + float2(0,0) * UnitDX, Normal);
        NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(UnitXY + float2(1,0) * UnitDX, Normal_right);
        NormalReader.SamplePreviousGridVector3Value<Attribute = "Normal">(UnitXY + float2(0,1) * UnitDX, Normal_up);
        float4 TmpNormalSample;
         BakedNormalGrid.SampleTexture2D(UnitXY + float2(0,0) * UnitDX, 0, TmpNormalSample);
         Normal = TmpNormalSample.xyz;
         BakedNormalGrid.SampleTexture2D(UnitXY + float2(1,0) * UnitDX, 0, TmpNormalSample);
         Normal_right = TmpNormalSample.xyz;
         BakedNormalGrid.SampleTexture2D(UnitXY + float2(0,1) * UnitDX, 0, TmpNormalSample);
         Normal_up = TmpNormalSample.xyz;
    WaterNormal = Normal;
    float Curvature_x = 1. - dot(Normal, Normal_right);
    float Curvature_y = 1. - dot(Normal, Normal_up);
    Curvature = abs((Curvature_x + Curvature_y) * .5);
    // calculate depth difference and height difference-----------------------------------------------------------------
    float2 SampleUnit = CurrUnit.xy + Velocity * SimDt * UnitDX / SimDx;
    float NextWaterDepth;
    float NextWaterHeight;  
        WaterReader.SamplePreviousGridFloatValue<Attribute="WaterDepth">(SampleUnit.xy, NextWaterDepth);
        WaterReader.SamplePreviousGridFloatValue<Attribute="WaterHeight">(SampleUnit.xy, NextWaterHeight);
        BakedSimGrid.SampleTexture2D(SampleUnit.xy, 0, BakedSimSample);
        NextWaterDepth = BakedSimSample.y;
        NextWaterHeight = BakedSimSample.x;
    DepthDifference = NextWaterDepth - WaterDepth;
    HeightDifference = NextWaterHeight - WaterHeight;
ö≤&$;Aìù€ËGAYà
;K^ÀFOìñ
@;E∞‘'_a®
2O§ˇh;ë
ö≤&$;Aìù€ËGAYàP
Ù2Ã;Rø„Mπß
¡É*ûóˆ•Ä.;ƒ—

