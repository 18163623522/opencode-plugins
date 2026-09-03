float t1 = fmod(t, TimeLoop);
float t2 = fmod(t + .5 * TimeLoop, TimeLoop);
float nt = t1 / TimeLoop;
float Alpha = 2.*abs(nt - .5);
return float3(t1, t2,  Alpha);

