Curl = 0;
Velocity = 0.0;
Curvature = 0.0;
DepthDifference = 0.0;
WaterDepth = 0.0;
WaterHeight = 0.0;
HeightDifference = 0.0;
WaterNormal = float3(0,0,0);
float2 UnitDX = float2(1. / SimRes.x, 1. / SimRes.y);
float2 UnitXY = CurrUnit.xy;
float ValidRange = 2. * UnitDX;
float2 VTSamplingUVMult = 0;
// scaling factor for UVs since texture is padded for vt
    VTSamplingUVMult = 1.;
    WaterReader.SamplePreviousGridFloatValue<Attribute="WaterDepth">(UnitXY, WaterDepth);
    WaterReader.SamplePreviousGridFloatValue<Attribute="WaterHeight">(UnitXY, WaterHeight);
    float4 BakedSimSample;
    if (SampleFromVT)
        float2 VTUnitXY;
        VTUnitXY = (UnitXY) * VTSamplingUVMult;
        BakedSimGridVT.SampleTexture2D(VTUnitXY, 0, BakedSimSample);
        WaterDepth = BakedSimSample.y;
        WaterHeight = BakedSimSample.x;
    else
        BakedSimGrid.SampleTexture2D(UnitXY, 0, BakedSimSample);
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
        float4 BakedSimSample;
        if (SampleFromVT)
            float2 VTUnitXY;
            VTUnitXY = (UnitXY + float2(0,1) * UnitDX) * VTSamplingUVMult;
            BakedSimGridVT.SampleTexture2D(VTUnitXY, 0, BakedSimSample);
            vx_1 = BakedSimSample.z;
            VTUnitXY = (UnitXY + float2(0,-1) * UnitDX) * VTSamplingUVMult;
            vx_m1 = BakedSimSample.z;
            VTUnitXY = (UnitXY + float2(1,0) * UnitDX) * VTSamplingUVMult;
            vy_1 = BakedSimSample.w;
            VTUnitXY = (UnitXY + float2(-1,0) * UnitDX) * VTSamplingUVMult;
            vy_m1 = BakedSimSample.w;
        else
            BakedSimGrid.SampleTexture2D(UnitXY + float2(0,1) * UnitDX, 0, BakedSimSample);
            BakedSimGrid.SampleTexture2D(UnitXY + float2(0,-1) * UnitDX, 0, BakedSimSample);
            BakedSimGrid.SampleTexture2D(UnitXY + float2(1,0) * UnitDX, 0, BakedSimSample);
            BakedSimGrid.SampleTexture2D(UnitXY + float2(-1,0) * UnitDX, 0, BakedSimSample);
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
            VTUnitXY = (UnitXY + float2(0,0) * UnitDX) * VTSamplingUVMult;
            BakedNormalGridVT.SampleTexture2D(VTUnitXY, 0, TmpNormalSample);
            Normal = TmpNormalSample.xyz;
            Normal_right = TmpNormalSample.xyz;
            Normal_up = TmpNormalSample.xyz;
            BakedNormalGrid.SampleTexture2D(UnitXY + float2(0,0) * UnitDX, 0, TmpNormalSample);
            BakedNormalGrid.SampleTexture2D(UnitXY + float2(1,0) * UnitDX, 0, TmpNormalSample);
            BakedNormalGrid.SampleTexture2D(UnitXY + float2(0,1) * UnitDX, 0, TmpNormalSample);
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
            float2 VTSampleUnit = SampleUnit.xy * VTSamplingUVMult;
            float4 BakedSimSample;
            BakedSimGridVT.SampleTexture2D(VTSampleUnit, 0, BakedSimSample);
            NextWaterDepth = BakedSimSample.y;
            NextWaterHeight = BakedSimSample.x;
            BakedSimGrid.SampleTexture2D(SampleUnit.xy, 0, BakedSimSample);
    DepthDifference = NextWaterDepth - WaterDepth;
    HeightDifference = NextWaterHeight - WaterHeight;
ö≤&$;Aìù€ËGAYà
;K^ÀFOìñ
@;E∞‘'_a®
2O§ˇh;ë
ö≤&$;Aìù€ËGAYàw
Ù2Ã;Rø„Mπß
¡É*ûóˆ•Ä.;ƒ—

