float Scale = dt/dx * AdvectionVelocityMult;
float3 Index = float3(IndexX, IndexY, IndexZ);
float3 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
AdvectedGrid.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleIndex.z, SampleUnit);
AdvectedGrid.CubicSamplePreviousGridVector2AtIndex(SampleUnit, ScalarIndex, AdvectedVector2D);
úX9_D`}NìÌv©≈tµÑ;
©v;ã†FøN±≥È
DãöKƒe;¯C
float3 SampleIndex = Index;
float3 k1 = Velocity;
SampleIndex = Index - .5 * Scale * k1;
float3 k2;
VelocityGrid.SamplePreviousGridVector3AtIndex(SampleUnit, VelocityIndex, k2);
SampleIndex = Index - .75 * Scale * k2;
float3 k3;
VelocityGrid.SamplePreviousGridVector3AtIndex(SampleUnit, VelocityIndex, k3);
SampleIndex = Index - 2./9 * Scale * k1 - 3./9 * Scale * k2 - 4./9 * Scale * k3;
AdvectedGrid.SamplePreviousGridVector2AtIndex(SampleUnit, ScalarIndex, AdvectedVector2D);
ìÔuô[û%AßW]≠Õ‡v0;
float3 SampleIndex = Index - .5 * Scale * Velocity;
VelocityGrid.SamplePreviousGridVector3AtIndex(SampleUnit, VelocityIndex, Velocity);
SampleIndex = Index - Scale * Velocity;
.@ï;ÅçYDô
Ä5I;}ÍRC≤€j
3X7¡∫MÇJ!;Ï§¸Á
3X7¡∫MÇJ!;Ï§¸Á<
;¨Ytâ¸JEâñS¶6uy+
ü;±ı£J¨$9—]ªÏÌ
±c;T÷-sHê⁄(ÿË±sYa
⁄zLù;⁄y˛w|kËÒÇ*éΩ9MÖOì≤
±c;T÷-sHê⁄(ÿË±s
⁄zLù;⁄y˛w|k
;¨Ytâ¸JEâñS¶6uy+ª
√7JF∫;Ês˙
åx;™HŸJ≠¡
DãöKƒe;¯C(
DãöKƒe;¯Cü
ZôÒVøïµNÅUÏ¶Ÿz¬;î
DãöKƒe;¯C.
HdÓï;ÑÏÅz™z±
MNµ¬[;<Å•=ò
¡É*ûóˆ•Ä.;ƒ—

