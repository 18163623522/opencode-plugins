float Val = IsInside;
Val *= lerp(1., pow(.5*(FastGradientPerlinNoise3D_TEX(NoiseFrequency*Pos + float3(0,0,Time)*-NoiseSpeed)+1.), NoiseExponent), NoiseScale);
DensityEmission = DensityMult * Val;
TemperatureEmission = TemperatureMult * Val;
IsInside = length(V) < 1 ? 1 : 0;
u@t:;h

