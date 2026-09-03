float InitialV;
Grid.GetFloatGridValue(IndexX, IndexY, 0, 0, InitialV);
FinalV = 0;
float count = 0;
    FinalV = InitialV;
    if (InitialV > 1e-5)
        int MinX = max(IndexX - Width, 0);
        int MinY = max(IndexY - Width, 0);
        int MaxX = min(IndexX + Width, NumCellsX-1);
        int MaxY = min(IndexY + Width, NumCellsY-1);
        for (int x = MinX; x <= MaxX; ++x) {
        for (int y = MinY; y <= MaxY; ++y) {
            float v;
            Grid.GetFloatGridValue(x, y, 0, 0, v);
            if (abs(InitialV - v) < dx*DepthBlurMult)
                int xOffset = x - IndexX;
                int yOffset = y - IndexY;
                float weight = (1-abs(xOffset/Width) + 1-abs(yOffset/Width)); 
                FinalV += v * weight;
                count += weight;
    if (count > 1e-5)
        FinalV /= count;
;ı.HÎ
Úo;$X5”G¡ùS»
1D›Şä;
Áƒ*—ö¥€.;ÄÑ

