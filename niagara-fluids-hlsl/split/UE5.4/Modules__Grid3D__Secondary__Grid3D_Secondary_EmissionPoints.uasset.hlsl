// Emit
float EmitVal = 0;
EmitVal += VorticityEmissionMult * smoothstep(MinEmitVorticity, MaxEmitVorticity, VorticityMagnitude);
EmitVal += VelocityEmissionMult * smoothstep(MinEmitVelocityMagnitude, MaxEmitVelocityMagnitude, VelocityMagnitude);
EmitVal += AccelEmissionMult * smoothstep(MinEmitAccelMagnitude, MaxEmitAccelMagnitude, AccelMagnitude);
EmitVal = clamp(EmitVal * EmissionMult, EmissionClamp.x, EmissionClamp.y);
int NumEmitted = 0;
NumEmitted = floor(EmitVal) + (frac(EmitVal) >= Random0To1 ? 1 : 0);
// increment emission buffer by OutGridVal
int2 NumCells;
EmissionPositions.GetNumCells(NumCells.x, NumCells.y);
  float PrevVal = 0;
  EmissionCounter.SetParticleNeighborCount(0, NumEmitted, PrevVal);
  // initialized to -1, so make sure it is 0 for the first time we add particles
  PrevVal = max(0, PrevVal);  
  for (int i = PrevVal; i < NumEmitted + PrevVal &&  i < MaxSecondaryParticlesPerFrame; ++i)
      int d = 0;
      int xx = i % NumCells.x;
      int yy = i / NumCells.x;
      EmissionPositions.SetGridValue(xx, yy, 0, CurrUnit.x, d);
      EmissionPositions.SetGridValue(xx, yy, 1, CurrUnit.y, d);
      EmissionPositions.SetGridValue(xx, yy, 2, CurrUnit.z, d);
float Vz_up;
Grid.GetGridValue(IndexX, IndexY+1, IndexZ, VectorIndex+2, Vz_up);
float Vz_down;
Grid.GetGridValue(IndexX, IndexY-1, IndexZ, VectorIndex+2, Vz_down);
float Vy_front;
Grid.GetGridValue(IndexX, IndexY, IndexZ+1, VectorIndex+1, Vy_front);
float Vy_back;
Grid.GetGridValue(IndexX, IndexY, IndexZ-1, VectorIndex+1, Vy_back);
float Vx_front;
Grid.GetGridValue(IndexX, IndexY, IndexZ+1, VectorIndex, Vx_front);
float Vx_back;
Grid.GetGridValue(IndexX, IndexY, IndexZ-1, VectorIndex, Vx_back);
float Vz_right;
Grid.GetGridValue(IndexX+1, IndexY, IndexZ, VectorIndex+2, Vz_right);
float Vz_left;
Grid.GetGridValue(IndexX-1, IndexY, IndexZ, VectorIndex+2, Vz_left);
float Vy_right;
Grid.GetGridValue(IndexX+1, IndexY, IndexZ, VectorIndex+1, Vy_right);
float Vy_left;
Grid.GetGridValue(IndexX+1, IndexY, IndexZ, VectorIndex+1, Vy_left);
float Vx_up;
Grid.GetGridValue(IndexX, IndexY+1, IndexZ, VectorIndex, Vx_up);
float Vx_down;
Grid.GetGridValue(IndexX, IndexY-1, IndexZ, VectorIndex, Vx_down);
) / (2. * dx);

