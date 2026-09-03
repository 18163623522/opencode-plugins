Position = float3(0,0,0);
float rand = FastGradientPerlinNoise3D_TEX(AnglePos*AngleNoiseFrequency+float3(AngleNoiseRandomFloat,AngleNoiseRandomFloat*114.514,-AngleNoiseRandomFloat*233.3));
float rand2 = sign(rand)*(1-pow(1-abs(rand),AngleNoiseDifference));
CurrHeight +=  rand2*CurrHeight/MaxHeight * AngleNoiseAmplitude;
Position.z = CurrHeight;
HeightFrac = CurrHeight/(MaxHeight+AngleNoiseAmplitude);
float HeightProfile = HeightFrac;
HeightCurve.SampleCurve(HeightFrac, HeightProfile);
+lerp(ConeThicknessBottom,ConeThicknessTop,HeightProfile)*(ThicknessDistributionRandomFloat*2-1);

