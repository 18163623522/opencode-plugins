AreaFraction = 0;
// sort theta values in current triangle
float3 SortedTheta;
SortedTheta.x = min(min(theta.x, theta.y), theta.z);
SortedTheta.z = max(max(theta.x, theta.y), theta.z);
SortedTheta.y = theta.x+theta.y+theta.z - SortedTheta.x-SortedTheta.z;
    AreaFraction = 0;
    AreaFraction = 1;
    AreaFraction = SortedTheta.z/(SortedTheta.z-SortedTheta.x);
    AreaFraction *= SortedTheta.z/(SortedTheta.z-SortedTheta.y);
    AreaFraction = 1. - AreaFraction;
    AreaFraction = SortedTheta.x/(SortedTheta.x-SortedTheta.y);
    AreaFraction *= SortedTheta.x/(SortedTheta.x-SortedTheta.z);
    AreaFraction = AreaFraction;

