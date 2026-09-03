OutPosition = Position;
OutVelocity = Velocity;
float3 PlanePosition = {0,0,0};
float3 PlaneNormal = {0,0,1};
float CollisionDepth = dot(Position - PlanePosition, PlaneNormal) - ParticleDiameter * .5;
    const float AbsCollisionDepth = abs(CollisionDepth);
    float3 RelativeVelocity = (Position - PreviousPosition);
    float3 PerpRelativeVelocity = RelativeVelocity - dot(RelativeVelocity, PlaneNormal) * PlaneNormal;
    float PerpRelativeVelocityMag = length(PerpRelativeVelocity);
    if (PerpRelativeVelocityMag <  StaticFrictionCoeff * AbsCollisionDepth)
       OutPosition -= PerpRelativeVelocity;
    else
        OutPosition -= PerpRelativeVelocity * min((KineticFrictionCoeff * AbsCollisionDepth) / PerpRelativeVelocityMag, 1.0);
    OutPosition += -CollisionDepth * PlaneNormal;
    OutVelocity = (OutPosition - PreviousPosition) * InvDt;  

