2tûäg?;
int d = 0;
OutGridVal = GridSample;
float Scale = SimDt / FoamDx * AdvectionVelocityMult;
float2 Index = float2(IndexX, IndexY);
float TmpVal;
// sample velocity grid at current grid cell in unit space
float2 Velocity;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, VelocityIndex, TmpVal);
Velocity.x = TmpVal;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, VelocityIndex+1, TmpVal);
Velocity.y = TmpVal;
float2 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
FoamGridCollection.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
FoamGridCollection.SampleGrid(SampleUnit.x, SampleUnit.y, 0, OutGridVal);
GridCollection.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit.xy, Velocity);
Velocity += NoiseOffset;
float Scale = AdvectionVelocityMult * SimDt / FoamDx;
FoamGridCollection.SamplePreviousGridFloatValue<Attribute="Foam">(SampleUnit.xy, OutGridVal);
ZG‰38‘¹ßÎ;¦ê{\ê¾òHª—;éHù
ZG‰38‘¹ßÎ;
¦ê{\ê¾òHª—;éHù
;Œ‹™M¢
¾ã1¬vùÐD ÷}‹;
Áƒ*ž—ö¥€.;ÄÑ

