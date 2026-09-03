 l”ÌÎ~êFŠ$S
// only process collisions in cells where there is water OR you have a swimming pool (ie: constant bottom depth
bool Valid;
for (int CurrIdx = 0; CurrIdx < NumParticles; ++CurrIdx)
float3 WorldSpherePos = float3(0,0,0);
AttributeReader.GetVectorByIndex<Attribute="Position">(CurrIdx, Valid, WorldSpherePos);
float3 SphereVel = float3(0,0,0);
AttributeReader.GetVectorByIndex<Attribute="Velocity">(CurrIdx, Valid, SphereVel);
SphereVel *= CollisionVelocityMul;
float WorldSphereRadius = 0;
AttributeReader.GetFloatByIndex<Attribute="Radius">(CurrIdx, Valid, WorldSphereRadius);
WorldSphereRadius *= CollisionRadiusMult;
float WorldSphereRadiusSquared = WorldSphereRadius * WorldSphereRadius;
WorldCellPos.z = CollisionZ;
float3 SpherePosToCellPos = WorldCellPos - WorldSpherePos;
float Dist = length(SpherePosToCellPos);//sqrt(DistSq);
float HalfDx = .5*dx;
// cell overlap is defined as the overlap of a sphere centered at the cell and the collision sphere
// pad it out by half dx to make results smoother
float CellOverlap = smoothstep(WorldSphereRadius + HalfDx, WorldSphereRadius * SoftCollisionFalloff, Dist);
// if Radius mult is zero, CellOverlap should be zero
CellOverlap *= WorldSphereRadius > 1e-5;
// computer overlap volume if the sphere and cell overlap
// #todo(dmp): precompute min vel squared to avoid sqrt
WorldSpherePos.z += 2.*(WorldCellPos.z - WorldSpherePos.z);
float TotalOverlapVolume = 0;
// compute penetration depth of sphere below water level for each corner of cell
for (int x = 0; x <= 3; x++)
float TmpOverlapVolume = 0;
float3 TmpWorldCellPos = WorldCellPos + HalfDx * Offset[x];
float3 Above;
Above.xy = TmpWorldCellPos.xy;
Above.z = WorldSpherePos.z;
float3 Diff = WorldSpherePos - Above;
float A = dot(Diff, Diff);
float OverlapVolume = 0;
float B = sqrt(WorldSphereRadiusSquared - A);
TmpOverlapVolume = B - (WorldSpherePos.z - TmpWorldCellPos.z);
TotalOverlapVolume += TmpOverlapVolume < 1e-5 ? 0 : TmpOverlapVolume;
// overlap volume below cell is average of corners
TotalOverlapVolume *= .25;
// increment the overlap volume if it is greater than the value from previous particles.
CollisionVelocityX = SphereVel.x;
CollisionVelocityY = SphereVel.y;
IsCollider = CellOverlap;
//float2 CollisionNormal = normalize(SpherePosToCellPos.xy);
//CollisionRet.xy *= abs(dot(CollisionNormal, normalize(SphereVel.xy))) * pow(CellOverlap,10)*.1;
// overlap volume
// only compute collision overlap volume if the cell was not a collider on the previous frame
// or the overlap volume is bigger than the previous frame at the same cell
if (abs(IsCollider - Input_IsCollider) > 1e-5)// || abs(OverlapVolume - Input_OverlapVolume) > 1e-5)
// @todo(dmp): should overlap volume be multiplied by the cell overlap fraction?
OverlapVolume = TotalOverlapVolume;
int TextureMaxX = NumCellsX-1;
int TextureMaxY = NumCellsY-1;
CollisionVelocityX = 0;    
CollisionVelocityY = 0;    
IsCollider = 1;
OverlapVolume = 0;    
CollisionVelocityX = 0;
CollisionVelocityY = 0;
IsCollider = 0;
OverlapVolume = 0;
m—¶;R"I†
CollisionVelocity = float2(0,0);
d=I‹.œàQ;ÎMM
d=I‹.œàQ;ÎM
int ClosestElement;
RigidMeshColliders.GetClosestElement(WorldPos, TimeStepFraction, ClosestElement);
float3 Tmp0;
float3 Tmp1;
float Theta_0;
float Theta_1;
float Theta_2;
float Theta_3;
float Theta_C;
VelocityCenter = float3(0,0,0);
float3 WorldTmp;
// Theta_0 = -1,-1
GridCollection.IndexToUnit(IndexX - .5, IndexY - .5, WorldTmp);
WorldTmp = mul(float4(WorldTmp, 1), UnitToWorld);
RigidMeshColliders.GetElementPointMeshDistanceFieldNoNormal(WorldTmp, dt, TimeStepFraction, 1e-5, ClosestElement, Theta_0, Tmp0);
Theta_0 += CollisionOffset;
VelocityCenter += Tmp0;
// Theta_1 = +1,-1
GridCollection.IndexToUnit(IndexX + .5, IndexY - .5, WorldTmp);
RigidMeshColliders.GetElementPointMeshDistanceFieldNoNormal(WorldTmp, dt, TimeStepFraction, 1e-5, ClosestElement, Theta_1, Tmp0);
Theta_1 += CollisionOffset;
// Theta_2 = +1,+1
GridCollection.IndexToUnit(IndexX + .5, IndexY + .5, WorldTmp);
RigidMeshColliders.GetElementPointMeshDistanceFieldNoNormal(WorldTmp, dt, TimeStepFraction, 1e-5, ClosestElement, Theta_2, Tmp0);
Theta_2 += CollisionOffset;
// Theta_3 = -1,+1
GridCollection.IndexToUnit(IndexX - .5, IndexY + .5, WorldTmp);
RigidMeshColliders.GetElementPointMeshDistanceFieldNoNormal(WorldTmp, dt, TimeStepFraction, 1e-5, ClosestElement, Theta_3, Tmp0);
Theta_3 += CollisionOffset;
// Theta_C = 0,0
Theta_C = .25 * (Theta_0+Theta_1+Theta_2+Theta_3);
CenterDistance = Theta_C;
VelocityCenter *= .25;
// Construct the 4 triangles for the current cell
Theta_01C = float3(Theta_0, Theta_1, Theta_C);
Theta_12C = float3(Theta_1, Theta_2, Theta_C);
Theta_23C = float3(Theta_2, Theta_3, Theta_C);
Theta_30C = float3(Theta_3, Theta_0, Theta_C);
¡ê:ôsþ®@‚YËáu;Wt
Œ•¬ËñO»[‡ìl;…Ý
CollisionVelocity = CurrCollisionVelocity;
IsCollider = CurrIsCollider;
OverlapVolume = CurrOverlapVolume;
WorldSpherePos = mul(float4(WorldSpherePos, 1.), SimulationToLocal).xyz;
LocalCellPos.z = CollisionZ;
float3 SpherePosToCellPos = LocalCellPos - WorldSpherePos;
WorldSpherePos.z += 2.*(LocalCellPos.z - WorldSpherePos.z);
float3 TmpLocalCellPos = LocalCellPos + HalfDx * Offset[x];
Above.xy = TmpLocalCellPos.xy;
TmpOverlapVolume = B - (WorldSpherePos.z - TmpLocalCellPos.z);
SphereVel = mul(float4(SphereVel, 0.), SimulationToLocal).xyz;
CollisionVelocity = SphereVel.xy;
//if (abs(IsCollider - Input_IsCollider) > 1e-5)// || abs(OverlapVolume - Input_OverlapVolume) > 1e-5)
C = mul(A,B);
Dist = 9999999;
Velocity = float3(0,0,0);
    int ClosestElement;
    RigidMeshColliders.GetClosestElement(WorldPos, CurrFracTimestep, ClosestElement);
    for (int i = 1; i <= NumSamples; ++i)
        float CurrFrac = 1.0 * i / NumSamples;
        float TmpDist;
        float3 TmpVelocity;
        if (UseSimple)
            RigidMeshColliders.GetClosestPointSimple(WorldPos, dt, TmpDist, TmpVelocity);         
        else
            RigidMeshColliders.GetElementPointMeshDistanceFieldNoNormal(WorldPos, dt, CurrFrac, 1e-5, ClosestElement, TmpDist, TmpVelocity);
        if (TmpDist < Dist)
            Dist = TmpDist;
            Velocity = TmpVelocity;
    if (UseSimple)
        RigidMeshColliders.GetClosestPointSimple(WorldPos, dt, Dist, Velocity);         
    else
        float3 TmpPos;
        RigidMeshColliders.GetClosestPointMeshDistanceFieldNoNormal(WorldPos, dt, CurrFracTimestep, 1e-5, Dist, TmpPos, Velocity);
Dist += CollisionOffset;
AreaFraction = saturate((1. - smoothstep(-abs(SDFSoftCollisionFalloff), 0, Dist)));
IsCollider = AreaFraction > 0.000001;
gœO;ñN¯ý/
q.;bï'³Fª›Æ-5t[ïQ
q.;bï'³Fª›Æ-5t[ïh
Ž)U[;N°
OverlapVolume = abs(UseWaterHeightForCollision && (Depth < 1e-5) ? 0 : CenterDistance);
d=I‹.œàQ;ÎMS
q.;bï'³Fª›Æ-5t[ïW
¯·oŠ5;
F°ò;!^á“
{~y;iÂ[
{~y;iÂn
{~y;iÂf
{~y;iÂr
…íú;™w
…íú;™K
Ã;U³ßE–ä
…íú;™y
…íú;™{
ÎxÁ;í0K¸„T~íy
•; ŒHÈz“cñ
;<ÐOéíÑ
{~y;iÂ
UÅ;ÏcE›frhT9<G
ð2O¬à•zq;ì(
»ÎXJ‹€ì+;stà
°uFn Y@DŽN;8è¾5ˆ‘
°uFn Y@DŽN;8è¾5ˆ
°uFn Y@DŽN;8è¾5ˆ¢
D´…L¯ñ;£xY8Ï"ñùFŒú
WJ0ÀMmEŸ.;u!
“ ¸;ïâóJ¾
q.;bï'³Fª›Æ-5t[ï
ˆ;Mš7Y1@š—
LxÔå@;
G­C“;CÕÓ
ý;Î(…O{
¦S·ã=lè1UB…;÷Î
·ã=lè1UB…;÷Î
Œ•¬ËñO»[‡ìl;…Ýé
Œ•¬ËñO»[‡ìl;…Ý!
¡ê:ôsþ®@‚YËáu;Wtê
¡ê:ôsþ®@‚YËáu;Wt!
LxÔå@;ï
LxÔå@;°
{=wD©;
Œ•¬ËñO»[‡ìl;…Ýý
¡ê:ôsþ®@‚YËáu;Wtþ
.;]ßÂ0
»ÎXJ‹€ì+;stà}
;Þ2å6·
.?;„AP±å3ð:ÑÙúD
{½NÍB“úÍäb3B;
ÈgZPOªýå;¥¼ºÕ
Áƒ*ž—ö¥€.;ÄÑ

