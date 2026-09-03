float Scale = dt/dx * AdvectionVelocityMult;
float2 Velocity;
VelocityGrid.GetGridValue(IndexX, IndexY, VelocityIndex, Velocity.x);
VelocityGrid.GetGridValue(IndexX, IndexY, VelocityIndex + 1, Velocity.y);
float2 Index = float2(IndexX, IndexY);
float2 SampleIndex = Index - Scale * Velocity;
float3 SampleUnit;
VelocityGrid.IndexToUnit(SampleIndex.x, SampleIndex.y, SampleUnit);
VelocityGrid.SamplePreviousGridAtIndex(SampleUnit.x, SampleUnit.y, AttributeIndex, AdvectedVector4.x);
VelocityGrid.SamplePreviousGridAtIndex(SampleUnit.x, SampleUnit.y, AttributeIndex+1, AdvectedVector4.y);
VelocityGrid.SamplePreviousGridAtIndex(SampleUnit.x, SampleUnit.y, AttributeIndex+2, AdvectedVector4.z);
VelocityGrid.SamplePreviousGridAtIndex(SampleUnit.x, SampleUnit.y, AttributeIndex+3, AdvectedVector4.w);

