SimGrid_Velocity = float3(0.0,0.0,0.0);
float3 offset = Position - Center;
offset *= (1.0/NonUniformScale);
    SimGrid_Velocity = Velocity;
NoiseOut = 1.0;
    NoiseOut *= lerp(1., pow(.5 * (1+FastGradientPerlinNoise3D_TEX(World*NoiseScale + float3(0,0,Time*-NoiseSpeed))), NoiseExponent), NoiseIntensity);
    NoiseOut *= lerp(1., pow(.5 * (1+FastGradientPerlinNoise3D_TEX(World*NoiseScale2 + float3(0,0,Time*-NoiseSpeed2))), NoiseExponent2), NoiseIntensity2);
OutRGBA = float4(RGBA.x, RGBA.y, RGBA.z, 0);
 OutRGBA = RGBA;
Result = (length(A) > length(B)) ? A : B;
SimGrid_Density = 0;
SimGrid_Temperature = 0;
 SimGrid_Density = Density * Noise;
 SimGrid_Temperature = Temperature * Noise;

