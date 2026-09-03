return 0;
    if(x < 0.5)
        return float3(1.f, 2.f * x, 0.0); 
    else
        return float3(2.f - 2.f * x, 1.f, 0.0);
        return float3(0.0, 1.f, 2.f * x); 
        return float3(0.0, 2.f - 2.f * x, 1.f);
    float InvertedX = x;
    if(InvertedX < 0.5)
        float RemappedFirstHalf = 1.f - 2.f * InvertedX;
        return G2B(RemappedFirstHalf);
float RemappedSecondHalf = 2.f - 2.f * InvertedX; 
        return R2G(RemappedSecondHalf);
return float3(0,0,0);
return float3(heatmap(X));

