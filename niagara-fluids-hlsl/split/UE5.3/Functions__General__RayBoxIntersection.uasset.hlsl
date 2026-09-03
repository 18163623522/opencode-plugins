float3 dirfrac = 1.0f / RayDir;
float t1 = (MinBounds.x - RayStart.x)*dirfrac.x;
float t2 = (MaxBounds.x - RayStart.x)*dirfrac.x;
float t3 = (MinBounds.y - RayStart.y)*dirfrac.y;
float t4 = (MaxBounds.y - RayStart.y)*dirfrac.y;
float t5 = (MinBounds.z - RayStart.z)*dirfrac.z;
float t6 = (MaxBounds.z - RayStart.z)*dirfrac.z;
tmin = max(max(min(t1, t2), min(t3, t4)), min(t5, t6));
tmax = min(min(max(t1, t2), max(t3, t4)), max(t5, t6));
// if tmax < 0, ray (line) is intersecting AABB, but the whole AABB is behind us
    tmin = -1.;
    tmax = -1.;
// if tmin > tmax, ray doesn't intersect AABB

