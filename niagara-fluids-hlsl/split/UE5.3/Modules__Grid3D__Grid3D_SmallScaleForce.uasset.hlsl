 better results at a small scale.
VC_Force = float3(0,0,0);
float GradCurlLength = length(GradCurl);
  VC_Force = VorticityMult * dx * cross(GradCurl / GradCurlLength, Curl);
Mult = 1. - smoothstep(0, ControlScalarMax, ControlScalar);
ret = smoothstep(0,Gain,Length);

