float SignX = sign(p.x);
float SDX = dot(p - float3(SignX * Scale.x, 0, 0), float3(SignX,0,0));
float SignY = sign(p.y);
float SDY = dot(p - float3(0, SignY * Scale.y,0), float3(0,SignY,0));
float SignZ = sign(p.z);
float SDZ = dot(p - float3(0, 0, SignZ * Scale.z), float3(0, 0, SignZ));
SignedDistance = max(max(SDX, SDY), SDZ);
SignedDistance = length(p) - Scale.x;
float3 pS = float3(0, clamp(p.y, -Scale.y * .5, Scale.y * .5), 0);
SignedDistance = length(p - pS) - Scale.x;
SignedDistance = length(p - float3(0, p.y, 0)) - Scale.x;
float SD0 = dot(p - float3(0,SignY *Scale.y, 0), float3(0,SignY,0));
SignedDistance = max(SignedDistance, SD0);
SignedDistance = dot(p, Normal);

