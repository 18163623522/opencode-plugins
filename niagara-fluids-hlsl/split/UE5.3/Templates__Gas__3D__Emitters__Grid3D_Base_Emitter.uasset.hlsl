:na^;Z
float BoundingSphereRadius = length(.5 * Scale);
SpriteWidth = 2. * BoundingSphereRadius;
float3 CameraToGridCenter = GridCenterPos - CameraPos;
float DistToGridCenter = length(CameraToGridCenter);
    SpritePos = GridCenterPos;
    float3 RayDir = CameraToGridCenter / DistToGridCenter;
    //SpritePos = GridCenterPos - BoundingSphereRadius * RayDir;
#Nf;uN
K;^ZN(<M
bQ$gF;

