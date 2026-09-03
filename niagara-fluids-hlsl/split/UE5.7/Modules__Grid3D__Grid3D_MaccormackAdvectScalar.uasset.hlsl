0ï"V¼dcù;móí+)
Scalar = theta_n_1_hat + (theta_n - theta_n_hat) / 2.;
float Scale = dt/dx;
float3 Index = float3(IndexX, IndexY, IndexZ);
int3 SampleIndex = floor(Index - Scale * Velocity);
float MinScalar = 2147483647;
float MaxScalar = -2147483648;
for (int x = 0; x <= 1; ++x) {
for (int y = 0; y <= 1; ++y) {
for (int z = 0; z <= 1; ++z) {
    float TmpScalar;
    Grid.GetGridValue(SampleIndex.x+x, SampleIndex.y+y, SampleIndex.z+z, ScalarIndex, TmpScalar);
    MinScalar = min(TmpScalar, MinScalar);
    MaxScalar = max(TmpScalar, MaxScalar);
    Scalar = theta_n_1_hat;
// @todo(dmp): not exposed clamping - only use revert to semi lagrangian
//Scalar = clamp(Scalar, MinScalar, MaxScalar);
Í@ü£NJøK„;yO¤´>€œO<G
Í@ü£NJøK„;yO¤´>€
Áƒ*ž—ö¥€.;ÄÑ

