       float4(0.0f, 0.0f, 0.0f, 1.0f));
T, 1.0f);
ret = mul(T, R);
ret = mul(ret, RLocal);
ret = mul(ret, S);
ret = mul(ret, TLocal);
ret = mul(mul(mul(mul(TLocal, S), RLocal), R), T);
float4(0.0f, 0.0f, 0.0f, 1.0f));
-T, 1.0f);
    float3 xaxis = normalize(Right);
    float3 yaxis = normalize(-Up);
    float3 zaxis = normalize(cross(xaxis, yaxis));
float3(0,0,0), 1.0f);
ret = mul(T, R); 
ret = mul(R, T); 
ret = mul(RLocal, ret);

