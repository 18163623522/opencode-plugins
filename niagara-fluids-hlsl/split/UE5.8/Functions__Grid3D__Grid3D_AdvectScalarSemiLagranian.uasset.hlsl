float Scale = dt/dx * AdvectionVelocityMult;
float3 Index = float3(IndexX, IndexY, IndexZ);
float3 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
AdvectedGrid.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleIndex.z, SampleUnit);
AdvectedGrid.CubicSamplePreviousGridFloatAtIndex(SampleUnit, ScalarIndex, AdvectedScalar);
©v;‹ F¿N±³é
\;POš?GTÒ>
AdvectedGrid.SamplePreviousGridFloatAtIndex(SampleUnit, ScalarIndex, AdvectedScalar);
O·È9RK’Í^;ÙB
ô2Ì;R¿ãM¹§
Hdî•;„ìzªz±Çx
Áƒ*—ö¥€.;ÄÑ

