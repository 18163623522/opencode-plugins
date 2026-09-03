float Scale = dt/dx * AdvectionMult;
float3 Index = float3(IndexX, IndexY, IndexZ);
float3 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
ScalarCache.IndexToUnit(SampleIndex, SampleUnit);
ScalarCache.SampleCurrentFrameValue(SampleUnit, 0, Value);
C;L€0¶7Â
fø/‡;Ö
»Œ;r3®ZG‚5þÔm|Ls
»Œ;r3®ZG‚5þÔm|Lsˆ
Áƒ*ž—ö¥€.;ÄÑ

