int2 sz;
Texture.GetDimensions(sz.x, sz.y);
float2 V = UnitPos * sz - .5;
int2 V_int = round(V);
return Texture.Load(int3(V_int.x, V_int.y, 0));

