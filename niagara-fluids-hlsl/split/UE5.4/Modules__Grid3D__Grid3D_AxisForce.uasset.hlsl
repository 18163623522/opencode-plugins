float3 TestVec = (World - Center);
float3 ProjectionPoint = Center + dot(TestVec, Axis) * Axis;
float3 AwayFromAxisVec = World - ProjectionPoint;
float Distance = length(AwayFromAxisVec);
float3 ForceAway = AwayFromAxis * AwayFromAxisVec / Distance;
ForceAway *= pow(1. - smoothstep(0, Radius, Distance), Falloff);
Force = ForceAway;
Force *= Density > 1e-5;

