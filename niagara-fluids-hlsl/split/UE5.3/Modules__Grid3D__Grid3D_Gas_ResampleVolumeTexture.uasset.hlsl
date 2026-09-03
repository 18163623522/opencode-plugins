Density = 0;
Temperature = 0;
// Apply alpha to both density and temperature
Density = VolumeSample.a;
Temperature = VolumeSample.a;
else if ( AlphaMode == 2 ) // Unpack separate dentiry and temperature from alpha
Density = floor(VolumeSample.a * PackPrecision);
Temperature = VolumeSample.a - (Density / PackPrecision);
Density *= PackPrecision;
Temperature *= PackPrecision;
else // Default apply alpha to density only.
Velocity = VolumeSample.xyz;

