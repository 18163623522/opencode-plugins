Vector = float3(0,0,0);
int ID2 = ID;
float xx = fmod(ID2, sx);
ID2 /= sx;
float yy = fmod(ID2, sy);
ID2 /= sy;
float zz = ID2;
Vector = float3(xx,yy,zz) * dia * (1+1e-4 + Spacing);
Vector.z += dia*.5;

