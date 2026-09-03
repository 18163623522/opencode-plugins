TurbulenceForce = float3(0.0,0.0, 0.0);
    float noiseScale = .05 * NoiseScale;
    float noiseIntensity = 100.0 * NoiseIntensity;
    TurbulenceForce = FastGradientPerlinNoise3D_TEX((CellPos + float3(0.0, 0.0, Time)) * noiseScale) * noiseIntensity;
TurbulenceForce= float2(0.0,0.0);
    float noiseX = FastGradientPerlinNoise3D_TEX(float3(CellPos.xy+ Time.xx,.0)*noiseScale).x *noiseIntensity;
    float noiseY = FastGradientPerlinNoise3D_TEX(float3(CellPos.xy-+ Time.xx+ 842.212,0.0)*noiseScale).x *noiseIntensity;
    TurbulenceForce = float2(noiseX,noiseY);

