CollisionVelocity = Input_CollisionVelocity;
IsCollider = Input_IsCollider;
OverlapVolume = Input_OverlapVolume;
Velocity = Input_Velocity;
float CollisionVelocityMagnitude = length(Input_CollisionVelocity);
    CollisionVelocity = float2(0,0);
    IsCollider = 0;
    OverlapVolume = 0;
    float2 Force = (Input_CollisionVelocity - Input_Velocity) / dt;
    Force = lerp(Input_CollisionVelocity, Force, MatchCollisionVelocity);
    Velocity += Force * ForceScale * dt;

