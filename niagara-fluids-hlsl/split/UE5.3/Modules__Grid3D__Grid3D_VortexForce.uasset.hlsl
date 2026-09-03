VortexForce= float3(0.0,0.0, 0.0);
    float3 toVortex = Vlocation - CellPos;
    float3 toVortexDirection = normalize(toVortex);
    float vortexDistance = length(toVortex);
    float attenuation = 1.0-pow(saturate(vortexDistance/MaxDistance),.001+MaxDistanceFalloff);    
    float vortexDistanceSquared = (vortexDistance)*(vortexDistance);
    float3 vortexDirection = cross(toVortexDirection,Vaxis);
    VortexForce = 400000*vortexDirection  * VorbitStrength / clamp(vortexDistanceSquared,.01,1000); 
    VortexForce += toVortexDirection * VpullStrength *  clamp(vortexDistanceSquared,.01,1000) * .25;
    VortexForce *= dx * attenuation.xxx;

