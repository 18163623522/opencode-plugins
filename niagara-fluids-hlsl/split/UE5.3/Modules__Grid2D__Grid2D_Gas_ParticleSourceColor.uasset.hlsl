DensityOut = Density;
VelocityOut = Velocity;
TemperatureOut = Temperature;
ColorOut = Color;
bool Valid;
for (int CurrIdx = 0; CurrIdx < NumParticles; ++CurrIdx)
float3 ParticlePos = float3(0, 0, 0);
ParticleReader.GetVectorByIndex<Attribute = "Position">(CurrIdx, Valid, ParticlePos);
ParticlePos = mul(float4(ParticlePos, 1.), SimulationToLocal).xyz;
float VelocityScalePP = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_velocityScale">(CurrIdx, Valid, VelocityScalePP);
float Radius = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_radius">(CurrIdx, Valid, Radius);
float noiseScalePP = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_noiseScale">(CurrIdx, Valid, noiseScalePP);
float noiseIntensityPP = 0.0;
ParticleReader.GetFloatByIndex<Attribute = "fluids_source_noiseIntensity">(CurrIdx, Valid, noiseIntensityPP);
float noiseScale = .05 * noiseScalePP;
float noiseIntensity = .2 * Radius * noiseIntensityPP;
float noise = FastGradientPerlinNoise3D_TEX(float3(CellPos.xy + ParticlePos.xy, 1.0) * noiseScale) * noiseIntensity;
float Dist = length(CellPos - ParticlePos.xy) + noise;
float ParticleRadius = Radius * RadiusScale;
float FalloffMult = 1. - pow(smoothstep(ParticleRadius * Core, ParticleRadius, Dist), Falloff);
       float4 ParticleColor;
   ParticleReader.GetColorByIndex<Attribute = "Color">(CurrIdx, Valid, ParticleColor);
ParticleColor *= DensityMult * FalloffMult;
float3 ParticleVel = float3(0, 0, 0);
ParticleReader.GetVectorByIndex<Attribute = "fluids_source_velocity">(CurrIdx, Valid, ParticleVel);
ParticleVel = mul(float4(ParticleVel, 0.), SimulationToLocal).xyz;
ParticleVel *= VelocityMult * VelocityScalePP * FalloffMult;
          ColorOut += ParticleColor;
VelocityOut += ParticleVel;
if (dot(ParticleVel, ParticleVel) > dot(VelocityOut, VelocityOut)) VelocityOut = ParticleVel;
          if (dot(ParticleColor, ParticleColor) > dot(ColorOut, ColorOut)) ColorOut  = ParticleColor;
#endif //GPU_SIMULATION
   ParticleReader.GetLinearColorByIndex<Attribute = "Color">(CurrIdx, Valid, ParticleColor);
C = mul(A,B);
 EdG{_

