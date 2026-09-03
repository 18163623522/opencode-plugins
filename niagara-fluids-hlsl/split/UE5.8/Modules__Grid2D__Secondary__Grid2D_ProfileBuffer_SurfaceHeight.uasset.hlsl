Height = 0;
int NumDirectionSamples = 1;
float2 Simulation = (Unit.xy - .5) * WorldBBoxSize;
for (int i = 0; i < NumDirectionSamples; ++i)
    float theta = i * 2. * 3.1415 / NumDirectionSamples;
    theta = 0;//3.1415/4;
    float2 kvector = normalize(float2(cos(theta), sin(theta)));
    float p = dot(Simulation, kvector);
    float eps = rand(1, kvector.x, kvector.y, 0);
    float OffsetMag = 0;
    float p_unit = frac((p + OffsetMag*t) / TileWidth + .5 + eps);
    float TmpHeight = 0.;
    ProfileBuffer.SampleGrid(p_unit, .5, 0, TmpHeight);
    Height += TmpHeight;
3;ãýB¬ÇLÈ
    float OffsetMag = 1000;
    float p_unit = fmod((p + OffsetMag*t) / TileWidth + .5 + eps, 1);
L€YÍÌÒ;®s
L€YÍÌÒ;®sF
•; ŒHÈz“cñ
D´…L¯ñ;£xY8Ï"ñùFŒú
D´…L¯ñ;£
ÄM";õylO€sXûö=nÎ
þS;fa^ÛB¢ýœ
Áƒ*ž—ö¥€.;ÄÑ

