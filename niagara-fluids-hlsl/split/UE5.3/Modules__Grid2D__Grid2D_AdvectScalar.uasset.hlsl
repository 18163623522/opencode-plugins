float Scale = dt/dx * AdvectionVelocityMult;
float2 Velocity;
VelocityGrid.GetGridValue(IndexX, IndexY, VelocityIndex, Velocity.x);
VelocityGrid.GetGridValue(IndexX, IndexY, VelocityIndex + 1, Velocity.y);
float2 Index = float2(IndexX, IndexY);
float2 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
VelocityGrid.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
AdvectedGrid.SampleGrid(SampleUnit.x, SampleUnit.y, ScalarIndex, AdvectedScalar);
VelocityGrid.GetGridValue(IndexX, IndexY, VelocityIndex+1, Velocity.y);
float2 SampleIndex = Index - .5 * Scale * Velocity;
VelocityGrid.SampleGrid(SampleUnit.x, SampleUnit.y, VelocityIndex, Velocity.x);
VelocityGrid.SampleGrid(SampleUnit.x, SampleUnit.y, VelocityIndex+1, Velocity.y);
SampleIndex = Index - Scale * Velocity;

