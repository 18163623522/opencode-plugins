float Scale = dt/dx * AdvectionVelocityMult;
float3 Index = float3(IndexX, IndexY, IndexZ);
float3 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
AdvectedGrid.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleIndex.z, SampleUnit);
AdvectedGrid.CubicSamplePreviousGridVector4AtIndex(SampleUnit, Vector4Index, AdvectedVector4);
©v;‹ F¿N±³é
AdvectedGrid.SamplePreviousGridVector4AtIndex(SampleUnit, Vector4Index, AdvectedVector4);
O·È9RK’Í^;ÙB
ô2Ì;R¿ãM¹§
Hdî•;„ìzªz±Çu
Áƒ*—ö¥€.;ÄÑ

