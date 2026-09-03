float InitialV;
Grid.GetFloatGridValue(IndexX, IndexY, 0, 0, InitialV);
FinalV = 0;
float count = 0;
    FinalV = InitialV;
    if (InitialV > 1e-5)
        for (int x = -Width; x <= Width; ++x) {
        for (int y = -Width; y <= Width; ++y) {
            float v;
            Grid.GetFloatGridValue(IndexX+x, IndexY+y, 0, 0, v);
            if (abs(InitialV - v) < dx*DepthBlurMult)
                float weight = (1-abs(x/Width) + 1-abs(y/Width)); 
                FinalV += v * weight;
                count += weight;
    if (count > 1e-5)
        FinalV /= count;

