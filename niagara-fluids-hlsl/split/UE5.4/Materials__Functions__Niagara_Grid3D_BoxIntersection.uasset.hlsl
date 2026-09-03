float maxaxis = max(WorldGridExtents.x, max(WorldGridExtents.y, WorldGridExtents.z));
float camthetacos = abs(dot(normalize(RayDir), normalize(CameraDirectionVector)));
//derive step count from extents and voxelsize
float MaxAxisRes = maxaxis / VoxelSize;
//adjust step count for stepsize multiplier
MaxAxisRes /= StepSizeMultiplier;
//Derive the number of Steps needed to trace a full axis
float stepsize = (1.0 / MaxAxisRes);
float WorldDepth = SceneDepth / camthetacos;
//convert depth into Unit space of the grid
float3 depthpos = (Parameters.CameraVector * SceneDepth) / camthetacos;
depthpos = mul(float4(depthpos,0),  WorldToLocal).xyz;
depthpos /= WorldGridExtents;
//Get the total ray length to depth in unit space
float unitscenedepth = length(depthpos);
RayStart = mul(float4(RayStart,1), WorldToLocal).xyz;
RayDir = normalize(mul(float4(RayDir,0), WorldToLocal).xyz);
//Calculate the local scale of a voxel in unit space
float VoxelLocalToUnitScale = length(RayDir / (WorldGridExtents/maxaxis));
RayStart = (RayStart / WorldGridExtents) + 0.5;
RayDir = normalize(RayDir / WorldGridExtents);
float planecos = abs(dot(normalize(RayStart - 0.5), RayDir));
//Disabling the Uniform Depth option for now due to issues finding and ideal plane orientation for all cases
//if(TraceUniformDepth > 0)
//stepsize /= camthetacos;
//Adjust the step size to be in unit space
stepsize *= VoxelLocalToUnitScale;
//  Ray aabbox intersection
float3 invraydir = 1.0f / RayDir;
float3 firstintersections = (0 - RayStart) * invraydir;
float3 secondintersections = (1 - RayStart) * invraydir;
float3 closest = min(firstintersections, secondintersections);
float3 furthest = max(firstintersections, secondintersections);
float tmin = max(closest.x, max(closest.y, closest.z));
float tmax = min(furthest.x, min(furthest.y, furthest.z));
tmin = max(0, tmin);
float dist_to_plane_center = length(RayStart - 0.5) / 1;
float dist_box_to_plane = dist_to_plane_center - tmin;
float steps_to_plane = dist_box_to_plane / stepsize;
float snap_dist = frac(steps_to_plane);
tmin += snap_dist * stepsize;
//Limit distance by user specified trace distance
//TraceDistance /= max(abs(RayDir.x), abs(RayDir.y));
//tmax = min(TraceDistance, tmax - tmin) + tmin;
tmax = min(tmax, unitscenedepth);
float thickness = max(0, tmax - tmin);
CalculatedSteps = min((thickness/stepsize), MAX_SAFE_STEPS);
RayOrigin = RayStart + (RayDir * tmin);
RayDirection = RayDir;
UnitStepSize = stepsize;
LocalStepSize = VoxelSize * StepSizeMultiplier;
return 0;
return RayStart + RayDir * UnitStepSize * RandStartOffset *PseudoRandom(PixelPos.xy);

