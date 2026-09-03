;58Vak
float Scale = dt/dx * AdvectionMult;
float3 Index = float3(IndexX, IndexY, IndexZ);
float3 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
ScalarCache.IndexToUnit(SampleIndex, SampleUnit);
ScalarCache.SampleCurrentFrameValue(SampleUnit, 0, Value);
Or<;]+

