SimGrid_Velocity = float2(0,00);
SimGrid_Density = 0;
SimGrid_Temperature = 0;
float2 idxF = float2(IndexX, IndexY);
float2 cen = float2(50,20);
 SimGrid_Density = DensityScale * Density;
 SimGrid_Temperature = TemperatureScale * Density;
 SimGrid_Velocity = Velocity;
DensityOut = 1.0;
DensityOut = abs(FastGradientPerlinNoise3D_TEX(World*NoiseScale + Time*NoiseSpeed));

