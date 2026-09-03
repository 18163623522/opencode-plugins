ScreenUV = float2(0,0);
float4 SamplePosition = float4(In_SamplePos + View.PreViewTranslation, 1);
float4 ClipPosition = mul(SamplePosition, View.TranslatedWorldToClip);
float2 ScreenPosition = ClipPosition.xy / ClipPosition.w;
// Check if the sample is inside the view.
// Sample the depth buffer to get a world position near the sample position.
    ScreenUV = ScreenPosition * View.ScreenPositionScaleBias.xy + View.ScreenPositionScaleBias.wz;
Noise = 0.0;
float3 samplePosition = In_SamplePos*.2;
float noiseTime = time; 
float noise = FastGradientPerlinNoise3D_TEX(float3(samplePosition.xy,noiseTime)*noiseScale) *noiseIntensity;
Noise = saturate(lerp(1.0,noise,noiseIntensity));
NoiseVector2D = 0.0.xxx;
float2 noiseVector;
noiseVector.x = noise;
noiseVector.y = FastGradientPerlinNoise3D_TEX( (float3(samplePosition.xy,noiseTime+32.11) + 12.23)*noiseScale) *noiseIntensity;
NoiseVector2D = noiseVector*1000;
NoiseVector = 0.0.xxx;
float3 noiseVector;
noiseVector.z = FastGradientPerlinNoise3D_TEX( (float3(samplePosition.xy,noiseTime+112.9) + 32.91)*noiseScale) *noiseIntensity;
Noise = noise;
NoiseVector = NoiseVector*NoiseVector*NoiseVector*NoiseVector*NoiseVector;
NoiseVector = noiseVector*100;
 EdG{_

