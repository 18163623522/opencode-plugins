TurbulenceOut = float3(0, 0, 0);
  float scale = NoiseScale;
  float3 pos = World;
  float x = FastGradientPerlinNoise3D_TEX(pos*scale + Time*NoiseSpeed);
  pos += float3(123.45, 234.56, 345.67);
  float y = FastGradientPerlinNoise3D_TEX(pos*scale + Time*NoiseSpeed);
  pos += float3(-987.65, -876.54, -765.43);
  float z = FastGradientPerlinNoise3D_TEX(pos*scale + Time*NoiseSpeed);
  TurbulenceOut = (float3(x, y, z) + Bias) * Gain;
Gain = 0.0;
UseBand = false;
// Don't use the band if the min/max are the same.
     UseBand = true;
    if( Density >= DensityBand.x && Density <= DensityBand.y ) 
        Gain = DensityGain;      
    if( Temperature >= TemperatureBand.x && Temperature <= TemperatureBand.y ) 
        Gain = TemperatureGain;      
    if( Mode > 0 ) // Ramp
        Gain = saturate((GridValue-ValueRange.x) / (ValueRange.y-ValueRange.x));  
    else if( GridValue >= ValueRange.x && GridValue <= ValueRange.y ) // Band
        Gain = 1.0;  
U-a1\;

