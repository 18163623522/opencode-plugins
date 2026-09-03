float Scale = dt/dx * AdvectionVelocityMult;
float3 Index = float3(IndexX, IndexY, IndexZ);
float3 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
AdvectedGrid.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleIndex.z, SampleUnit);
AdvectedGrid.CubicSamplePreviousGridVector3AtIndex(SampleUnit, VectorIndex, AdvectedVector);
©v;‹ F¿N±³é
AdvectedGrid.SamplePreviousGridVector3AtIndex(SampleUnit, VectorIndex, AdvectedVector);
O·È9RK’Í^;ÙB
ô2Ì;R¿ãM¹§
Hdî•;„ìzªz±Çu
Áƒ*—ö¥€.;ÄÑ

