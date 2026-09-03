OutPosition = Position;
OutVelocity = Velocity;
bool Valid;
float3 UnitPos;
NeighborGrid.SimulationToUnit(Position, SimulationToUnit, UnitPos);
int3 Index;
NeighborGrid.UnitToIndex(UnitPos, Index.x,Index.y,Index.z);
float3 TotalDelta = {0,0,0};
uint ConstraintCount = 0;
int3 NumCells;
NeighborGrid.GetNumCells(NumCells.x, NumCells.y, NumCells.z);
int MaxNeighborsPerCell;
NeighborGrid.MaxNeighborsPerCell(MaxNeighborsPerCell);
// loop over all neighboring grid cells and find potential colliding particles
for (int xxx = 0; xxx < 27; ++xxx) {
for (int i = 0; i < MaxNeighborsPerCell; ++i)
    const int3 IndexToUse =Index + IndexOffsets[xxx];
    // old indexing method used nested for loops...not sure which is best as they profile similarly
    // #todo(dmp): investigate tradeoff more
// const int3 IndexToUse = int3(xx,yy,zz) + Index;  
int NeighborLinearIndex;
NeighborGrid.NeighborGridIndexToLinear(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, NeighborLinearIndex);
int CurrNeighborIdx;
NeighborGrid.GetParticleNeighbor(NeighborLinearIndex, CurrNeighborIdx);
float3 OtherPos;
    AttributeReader.GetVectorByIndex<Attribute="Position">(CurrNeighborIdx, Valid, OtherPos);
const float3 delta = Position - OtherPos;
const float dist = length(delta);
         float OtherInvMass = 0;
         AttributeReader.GetFloatByIndex<Attribute="InvMass">(CurrNeighborIdx, Valid, OtherInvMass);
         const float Weight = InvMass / (InvMass + OtherInvMass); 
TotalDelta -= Weight * (dist - ParticleDiameter) * delta / dist;
         // friction
float3 OtherPreviousPos;
         AttributeReader.GetVectorByIndex<Attribute="PreviousPosition">(CurrNeighborIdx, Valid, OtherPreviousPos);
const float3 RelativeVelocity = (Position - PreviousPosition) - (OtherPos - OtherPreviousPos);
const float3 CollisionNormal = delta / dist;
const float3 PerpRelativeVelocity = RelativeVelocity - dot(RelativeVelocity, CollisionNormal) * CollisionNormal;
const float PerpRelativeVelocityMag = length(PerpRelativeVelocity);
const float PenetrationDepth = dist * .5;
    TotalDelta -= Weight * PerpRelativeVelocity;
    TotalDelta -= Weight * PerpRelativeVelocity * min((KineticFrictionCoeff * PenetrationDepth) / PerpRelativeVelocityMag, 1.0);
 ConstraintCount += 2;
    // #todo(dmp): expose over relaxation?
    OutPosition += 1.*TotalDelta / ConstraintCount;
    //OutVelocity += 1.*TotalDelta * InvDt / ConstraintCount;
    OutVelocity = (OutPosition - PreviousPosition) * InvDt;
ê¿;Ó®WﬁO±√4,·ñÿJ
N€@J≥ΩÑ!a≈Á;
N€@J≥ΩÑ!a≈Á;è
    OutPosition = Position;
FoundNeighbor = false;
NQ.GetNumCells(NumCells.x, NumCells.y, NumCells.z);
float3 UnitPos = mul(float4(Position, 1.0), WorldToUnit).xyz;
float3 FloatIndex;
NQ.UnitToCellCornerFloatIndex(UnitPos, FloatIndex);
int3 Index = floor(FloatIndex);
const int3 IndexToUse = Index + IndexOffsets[xxx];
int NumNeighbors;
NQ.GetParticleNeighborCount(IndexToUse.x, IndexToUse.y, IndexToUse.z, NumNeighbors);
NumNeighbors = min(MaxNeighborsPerCell, NumNeighbors);
for (int i = 0; i < NumNeighbors; ++i)
    NiagaraID CurrID;
    int CurrNeighborIdx;
    NQ.GetParticleNeighbor(IndexToUse.x, IndexToUse.y, IndexToUse.z, i, CurrID.Index, CurrID.AcquireTag);
    if (UsePersistentIDs)
        AttributeReader.GetParticleIndex(CurrID, CurrNeighborIdx);
    else
        CurrNeighborIdx = CurrID.Index;
    float3 OtherPos;
    if (Valid && CurrNeighborIdx != InstanceIdx && CurrNeighborIdx != 0xFFFFFFFF && dist > 1e-5 && dist < ParticleDiameter)
        float OtherInvMass = 0;
        // friction
        float3 OtherPreviousPos = {0,0,0};
        AttributeReader.GetFloatByIndex<Attribute="InvMass">(CurrNeighborIdx, Valid, OtherInvMass);
        AttributeReader.GetVectorByIndex<Attribute="PreviousPosition">(CurrNeighborIdx, Valid, OtherPreviousPos);
        if (!Valid)
            continue;
        FoundNeighbor = true;
        const float Weight = InvMass / (InvMass + OtherInvMass); 
        TotalDelta -= Weight * (dist - ParticleDiameter) * delta / dist;
        const float3 RelativeVelocity = (Position - PreviousPosition) - (OtherPos - OtherPreviousPos);
ConstraintCount += 2;
    OutPosition += 1. * TotalDelta / ConstraintCount;
và ⁄(^=@ºpg«˘ê;
;åí∂J£˘˘‚
ê¿;Ó®WﬁO±√4,·ñÿJÍ
€ﬂÚh;5
À;\îbÚëF∞
î~Å<;®
O;E∂o9˛?±n©
O;E∂o9˛?±n©À
bÔ«Ÿzó…I§T•ï;
7qà!´;À
¡É*ûóˆ•Ä.;ƒ—

