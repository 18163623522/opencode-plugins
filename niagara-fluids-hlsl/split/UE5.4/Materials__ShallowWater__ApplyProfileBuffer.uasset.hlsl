R;1jcq
a7~y+;14.
;RF3Hc:
'o;v3Ay2
m5;I& 2
pfsJ:;
$N5vX*;
3"Z*;-z
;V-j|pv@!
;'?m"u
;A/Zp G
  float2 NiagaraGrid2DUnitToUV(float2 In_Unit, int AttributeIndex, int NumTilesX, int NumTilesY)
int TileIndexX = AttributeIndex % NumTilesX;
int TileIndexY = AttributeIndex / NumTilesX;
return float2(In_Unit.x / NumTilesX + 1.0*TileIndexX/NumTilesX, In_Unit.y / NumTilesY + 1.0*TileIndexY/NumTilesY);
Functions f;
float Height = 0;
float3 Normal = float3(0,0,0);
//t  = fmod(t, TimeLoop);
for (int i = 0; i < NumDirectionSamples; ++i)
    float theta = i * 2. * 3.1415 / NumDirectionSamples;
    float2 kvector = normalize(float2(cos(theta), sin(theta)));
    float AngleDot = smoothstep(.5, 1, dot(normalize(Velocity), kvector));
//clamp(dot(normalize(Velocity), kvector), 0, 1);
    AngleDot = lerp(1, AngleDot, clamp(length(Velocity), 0, 1));
    theta = acos(dot(kvector, float2(1,0)));
    float p = dot(Simulation - Velocity * t * AdvectionMult/ProfileBufferVelocity, kvector);
    float eps = InterleavedGradientNoise(kvector,1);
//    float OffsetMag = 0;//length(Velocity);
    float p_unit = frac((p -  t * ConstVelocityMult) / TileWidth + .5 + eps);
    float2 tmpUV = f.NiagaraGrid2DUnitToUV(float2(p_unit, .5), 0, 1, 1);
    float TmpH = Texture2DSample(ProfileBufferTex,     
    ProfileBufferTexSampler, tmpUV).x;
    Height += TmpH * AngleDot;
float dx = TileWidth / NumCells;
float3 WorldPos;
WorldPos.x = (p_unit - .5) * TileWidth;;
WorldPos.y = 0;
WorldPos.z = TmpH;
float3 WorldPosRight = WorldPos;
WorldPosRight.x += dx;
float p_unit_right = frac(p_unit + 1./NumCells);
tmpUV = f.NiagaraGrid2DUnitToUV(float2(p_unit_right, .5), 0, 1, 1);
float h_right = Texture2DSample(ProfileBufferTex,  ProfileBufferTexSampler, tmpUV).x;
WorldPosRight.z = h_right;
float3 N = normalize(cross(WorldPosRight - WorldPos,  float3(0,1,0)));
//  float3 N = float3(0,0,0);
//   tmpUV = f.NiagaraGrid2DUnitToUV(float2(p_unit, .5), 1, 4, 1);
//    N.x = Texture2DSample(ProfileBufferTex, ProfileBufferTexSampler, tmpUV).x;
//    tmpUV = f.NiagaraGrid2DUnitToUV(float2(p_unit, .5), 2, 4, 1);
//    N.y = Texture2DSample(ProfileBufferTex, ProfileBufferTexSampler, tmpUV).x;
//    tmpUV = f.NiagaraGrid2DUnitToUV(float2(p_unit, .5), 3, 4, 1);
//    N.z = Texture2DSample(ProfileBufferTex, ProfileBufferTexSampler, tmpUV).x;
  // rotate normal
   Normal += float3(N.x * cos(theta) - N.y*sin(theta), N.x * sin(theta) + N.y * cos(theta), N.z) * AngleDot;
return float4(Height, Normal) * 2. * 3.1415 / NumDirectionSamples;///NumDirectionSamples;

