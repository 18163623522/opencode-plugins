!yó=;°5Jµ)[>
8Ù;[ÊÁGº<y
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
‡´1åµ[úJ˜È}i;Êà
;½4Ë(Ò
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
¢Po×;´$C°©–>«ùÖA 
;’WkLI@„dÐ=Œ+
ïùc/QVYý;_E²"
Bºðþ¢;Q—‰°Wæ
ÌãDªù=¥T§ë“rHëø´d;Mšk
¼¥Ïùç;LOµn‘Èùþf
¾'!‡Kû¸á$;[E 
 (ê/;(˜˜@´›¯d¹ “?cõ+
/QVYý;_E²"
¼¥Ïùç;LOµn‘ÈùþfÌ
Kû¸á$;[E 
(ê/;(˜˜@´›¯d¹ “
ÏB•ÆàjÞçÎ.;
ÜOã¾K’#ÎÒ;Àµq
;bv‹³Úz
ò=col§ŸØW…;
$Œ;I„m
æ;AW‹ 
C»ÖHH#‘;; 
Áƒ*ž—ö¥€.;ÄÑ

