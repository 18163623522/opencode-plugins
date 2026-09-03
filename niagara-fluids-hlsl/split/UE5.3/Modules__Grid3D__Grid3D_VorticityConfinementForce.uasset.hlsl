VC_Force = float3(0,0,0);
float GradCurlLength = length(GradCurl);
  VC_Force = VorticityMult * dx * cross(GradCurl / GradCurlLength, Curl);
ret = smoothstep(0,Gain,Length);
 Ja0's(
 Ja0's((

