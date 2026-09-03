ŸÅ;î@š
float Scale = dt/dx * AdvectionVelocityMult;
float3 Index = float3(IndexX, IndexY, IndexZ);
float3 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
AdvectedGrid.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleIndex.z, SampleUnit);
AdvectedGrid.CubicSamplePreviousGridFloatAtIndex(SampleUnit, ScalarIndex, AdvectedScalar);
©v;‹ F¿N±³é
D‹šKÄe;øC
\;POš?GTÒ>
float3 SampleIndex = Index;
float3 k1 = Velocity;
SampleIndex = Index - .5 * Scale * k1;
float3 k2;
VelocityGrid.SamplePreviousGridVector3AtIndex(SampleUnit, VelocityIndex, k2);
SampleIndex = Index - .75 * Scale * k2;
float3 k3;
VelocityGrid.SamplePreviousGridVector3AtIndex(SampleUnit, VelocityIndex, k3);
SampleIndex = Index - 2./9 * Scale * k1 - 3./9 * Scale * k2 - 4./9 * Scale * k3;
AdvectedGrid.SamplePreviousGridFloatAtIndex(SampleUnit, ScalarIndex, AdvectedScalar);
float3 SampleIndex = Index - .5 * Scale * Velocity;
VelocityGrid.SamplePreviousGridVector3AtIndex(SampleUnit, VelocityIndex, Velocity);
SampleIndex = Index - Scale * Velocity;
+D¶ádÀ¼ål;
+D¶ádÀ¼ål;Õ
;¬Yt‰üJE‰–S¦6uy+
Ÿ;±õ£J¬$9Ñ]»ìí
±c;TÖ-sHÚ(Øè±sğYa
ÚzL;Úyşw|kèñ‚*½9M…O“²
±c;TÖ-sHÚ(Øè±sğ
ÚzL;Úyşw|k
;¬Yt‰üJE‰–S¦6uy+½
EÜK‰\¶D™;
Ã7JFº;æsú
Œx;ªHÙJ­Á
D‹šKÄe;øC&
D‹šKÄe;øC 
D‹šKÄe;øC'
Hdî•;„ìzªz±
Áƒ*—ö¥€.;ÄÑ

