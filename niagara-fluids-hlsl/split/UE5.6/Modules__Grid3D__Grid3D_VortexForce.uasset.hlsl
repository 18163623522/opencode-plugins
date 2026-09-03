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
àşFEŒ;²†p·–ú
àşFEŒ;²†p·–ú¾
ìO¿–5;j“4%
;³¿jB…ørU\¸‡Û
ú½²N­;ÈÔüL¯”z
Nal–;s‹mI×ÇxL‚æØ
óO¤;‰
;³¿jB…ørU\¸‡Ûr
2&,H¿÷å;
Áƒ*—ö¥€.;ÄÑ

