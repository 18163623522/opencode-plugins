VelocityX = Input_VelocityX;
VelocityY = Input_VelocityY;
WaterDepth = Input_WaterDepth;
WaterHeight = Input_WaterHeight;
    WaterHeight = WorldEmitMin.z;
    WaterDepth = WaterHeight - Input_BottomContour;
    VelocityX = 0;
    VelocityY = 0;
    float NoiseVal = WorldEmitBoundsNoiseMult * FastGradientPerlinNoise3D_TEX(World*WorldEmitBoundsNoiseScale +Time * WorldEmitBoundsNoiseSpeed);
    WaterHeight = WorldEmitMax.z + NoiseVal;
    VelocityX = Velocity.x;
    VelocityY = Velocity.y;

