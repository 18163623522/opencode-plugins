AdvectedVector = theta_n_1_hat + (theta_n - theta_n_hat) / 2.;
float Scale = dt/dx;
float3 Index = float3(IndexX, IndexY, IndexZ);
int3 SampleIndex = floor(Index - Scale * Velocity);
float3 MinVector = float3(2147483647, 2147483647, 2147483647);
float3 MaxVector = float3(-2147483648, -2147483648, -2147483648);
for (int x = 0; x <= 1; ++x) {
for (int y = 0; y <= 1; ++y) {
for (int z = 0; z <= 1; ++z) {
    float3 TmpVector;
    Grid.GetGridValue(SampleIndex.x+x, SampleIndex.y+y, SampleIndex.z+z, VectorIndex, TmpVector.x);
    Grid.GetGridValue(SampleIndex.x+x, SampleIndex.y+y, SampleIndex.z+z, VectorIndex+1, TmpVector.y);
    Grid.GetGridValue(SampleIndex.x+x, SampleIndex.y+y, SampleIndex.z+z, VectorIndex+2, TmpVector.z);
    MinVector = min(TmpVector, MinVector);
    MaxVector = max(TmpVector, MaxVector);
bool3 IsOutOfBounds = AdvectedVector < MinVector || AdvectedVector > MaxVector;
AdvectedVector = IsOutOfBounds * theta_n_1_hat + !IsOutOfBounds*AdvectedVector;
// @todo(dmp): not exposed clamping - only use revert to semi lagrangian
//Scalar = clamp(Scalar, MinScalar, MaxScalar);

