float DensityMult;
float TemperatureMult;
float3 LightColor;
Texture3D VolumeTexture;
SamplerState VolumeTextureSampler;
float Albedo;
// Computes volume extinction coefficient and luminance for a given point in the volume
float4 VolumeSample = VolumeTexture.SampleLevel(VolumeTextureSampler, Position, 0);
OutExtinction = VolumeSample.r * DensityMult;
OutScattering = OutExtinction * Albedo;
OutLuminance = LightColor * VolumeSample.g;
FireRenderVolume Volume;
Volume.DensityMult = DensityMult;
Volume.TemperatureMult = TemperatureMult;
Volume.LightColor = LightColor;
Volume.VolumeTexture = VolumeTexture;
Volume.VolumeTextureSampler = VolumeTextureSampler;
Volume.Albedo = Albedo;
float4 ret;
MARCH_SINGLE_RAY(RayStart, RayDir, UnitStepSize, LocalStepSize, NumSteps, Volume, ret);
return ret;

