¶J$;lœ7F¯ö…
float Scale = dt/dx * AdvectionVelocityMult;
float2 Velocity;
VelocityGrid.GetGridValue(IndexX, IndexY, VelocityIndex, Velocity.x);
VelocityGrid.GetGridValue(IndexX, IndexY, VelocityIndex + 1, Velocity.y);
float2 Index = float2(IndexX, IndexY);
float2 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
VelocityGrid.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
AdvectedGrid.SampleGrid(SampleUnit.x, SampleUnit.y, ScalarIndex, AdvectedScalar);
L¨Øç<µ;âv
L¨Øç<µ;âv¹
\;POš?GTÒ>
VelocityGrid.GetGridValue(IndexX, IndexY, VelocityIndex+1, Velocity.y);
float2 SampleIndex = Index - .5 * Scale * Velocity;
VelocityGrid.SampleGrid(SampleUnit.x, SampleUnit.y, VelocityIndex, Velocity.x);
VelocityGrid.SampleGrid(SampleUnit.x, SampleUnit.y, VelocityIndex+1, Velocity.y);
SampleIndex = Index - Scale * Velocity;
    AdvectedGrid.CubicSamplePreviousGridAtIndex(SampleUnit.x, SampleUnit.y, ScalarIndex, AdvectedScalar);
    AdvectedGrid.SamplePreviousGridAtIndex(SampleUnit.x, SampleUnit.y, ScalarIndex, AdvectedScalar);
;™©<2V
³;ÿ’5L;
Ÿ;±õ£J¬$9Ñ]»ìí
±c;TÖ-sHÚ(Øè±sðYa
ÚzL;Úyþw|kèñ‚*Ž½9M…O“²
ÚzL;Úyþw|k
±c;TÖ-sHÚ(Øè±sð
EÜK‰\¶D™;
Áƒ*ž—ö¥€.;ÄÑ

