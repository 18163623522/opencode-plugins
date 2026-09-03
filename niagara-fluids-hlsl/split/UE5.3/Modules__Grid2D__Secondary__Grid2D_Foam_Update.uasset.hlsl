OutGridVal = GridSample;
int d = 0;
float OneOverSimUnitDxX = 1./NumCellsX;
float OneOverSimUnitDxY = 1./NumCellsY;
// Dissipate existing value
OutGridVal -= a * SimDt;
OutGridVal = max(OutGridVal, 0.0);
float2 Velocity;
// vorticity
float vx_1;
float vx_m1;
float vy_1;
float vy_m1;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y+OneOverSimUnitDxY, VelocityIndex, vx_1);
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y-OneOverSimUnitDxY, VelocityIndex, vx_m1);
GridCollection.SampleGrid(CurrUnit.x+OneOverSimUnitDxX, CurrUnit.y, VelocityIndex+1, vy_1);
GridCollection.SampleGrid(CurrUnit.x-OneOverSimUnitDxX, CurrUnit.y, VelocityIndex+1, vy_m1);
float curl = abs(((vx_1-vx_m1) - (vy_1-vy_m1)) / (2. * SimDx));
// velocity
float vx;
float vy;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, VelocityIndex, vx);
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, VelocityIndex+1, vy);
Velocity = float2(vx,vy);
// acceleration
float prev_vx;
float prev_vy;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, PrevVelocityIndex, prev_vx);
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, PrevVelocityIndex+1, prev_vy);
float2 Acceleration = (Velocity - float2(prev_vx, prev_vy)) / SimDt;
float AccelerationMag = length(Acceleration);
// curvature
float Height;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, HeightIndex, Height);
float3 World = SimPos;
World.z += Height;
float3 Normal;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, NormalIndex, Normal.x);
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, NormalIndex+1, Normal.y);
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, NormalIndex+2, Normal.z);
float3 Normal_right;
GridCollection.SampleGrid(CurrUnit.x+OneOverSimUnitDxX, CurrUnit.y, NormalIndex, Normal_right.x);
GridCollection.SampleGrid(CurrUnit.x+OneOverSimUnitDxX, CurrUnit.y, NormalIndex+1, Normal_right.y);
GridCollection.SampleGrid(CurrUnit.x+OneOverSimUnitDxX, CurrUnit.y, NormalIndex+2, Normal_right.z);
float3 World_right = SimPos;
World_right.x += SimDx;
float TmpH;
GridCollection.SampleGrid(CurrUnit.x+OneOverSimUnitDxX, CurrUnit.y, HeightIndex, TmpH);
World_right.z += TmpH;
float3 DiffTmp = World - World_right;
float Curvature_right = dot(Normal - Normal_right, DiffTmp) / dot(DiffTmp, DiffTmp);
float3 Normal_up;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y+OneOverSimUnitDxY, NormalIndex, Normal_up.x);
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y+OneOverSimUnitDxY, NormalIndex+1, Normal_up.y);
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y+OneOverSimUnitDxY, NormalIndex+2, Normal_up.z);
float3 World_up = SimPos;
World_up.y += SimDx;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y+OneOverSimUnitDxY, 3, TmpH);
World_up.z += TmpH;
DiffTmp = World - World_up;
float Curvature_up = dot(Normal - Normal_up, DiffTmp) / dot(DiffTmp, DiffTmp);
float Curvature = abs((Curvature_right + Curvature_up) * .5);
// facing ratio of normal and velocity
float CurvatureMult = 1;//smoothstep(MinCurvatureEmitAngle, 1, dot(normalize(Velocity), Normal));
// Noise
float NoiseVal = (FastGradientPerlinNoise3D_TEX(World*NoiseScale+Time * NoiseSpeed)+1)*.5;
NoiseVal = smoothstep(.5, 1, NoiseVal);
// Emit
float EmitVal = 0;
EmitVal += smoothstep(MinEmitVorticity, MaxEmitVorticity, curl);
EmitVal += smoothstep(MinEmitAcceleration, MaxEmitAcceleration, AccelerationMag);
EmitVal += smoothstep(MinEmitCurvature, MaxEmitCurvature, Curvature) * CurvatureMult;
OutGridVal += EmitVal  * EmissionMult * NoiseVal;
// OutGridVal = VelocityMag;
// OutGridVal = curl;
// OutGridVal = AccelerationMag*.001;
// OutGridVal = Curvature*10;
OutGridVal = saturate(OutGridVal);
// only emit foam where we have water depth
float WaterDepth;
GridCollection.SampleGrid(CurrUnit.x, CurrUnit.y, WaterDepthIndex, WaterDepth);
OutGridVal *= WaterDepth > 1e-5;
//OutGridVal = NoiseVal;

