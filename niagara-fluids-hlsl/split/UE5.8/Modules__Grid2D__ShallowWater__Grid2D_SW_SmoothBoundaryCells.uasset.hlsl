float NewVelocityX = Input_VelocityX;
float NewVelocityY = Input_VelocityY;
float NewDepth = Input_WaterDepth;
// if we have a boundary cell with partial fluid inside
// average all the values with neighboring fluid cells
    NewVelocityX = 0;
    NewVelocityY = 0;
    NewDepth = 0;
    int NeighborBoundaryCells = 0;
    for (int xx = -1; xx <= 1; ++xx)  {
    for (int yy = -1; yy <= 1; ++yy)  {
        int TmpIndexX = IndexX + xx;
        int TmpIndexY = IndexY + yy;
        float TmpIsCollider;
        GridCollection.GetPreviousFloatValue<Attribute = "IsCollider">(TmpIndexX, TmpIndexY, TmpIsCollider);
        if (TmpIsCollider < 1-1e-5)
            NeighborBoundaryCells++;
            float TmpV;
            float2 TmpVec;
            GridCollection.GetPreviousVector2DValue<Attribute = "Velocity">(TmpIndexX, TmpIndexY, TmpVec);
            NewVelocityX +=TmpVec.x;
            NewVelocityY +=TmpVec.y;
            GridCollection.GetPreviousFloatValue<Attribute = "WaterDepth">(TmpIndexX, TmpIndexY, TmpV);
            NewDepth +=TmpV;
    if (NeighborBoundaryCells > 0)
        NewDepth /= NeighborBoundaryCells;
        NewVelocityX /= NeighborBoundaryCells;
        NewVelocityY /= NeighborBoundaryCells;
        NewVelocityX = Input_VelocityX;
        NewVelocityY = Input_VelocityY;
        NewDepth = Input_WaterDepth;        
WaterDepth = NewDepth;
WaterHeight = Input_BottomContour + WaterDepth;
// no dissipation
VelocityX = NewVelocityX;
VelocityY = NewVelocityY;
VelocityX = 0;
VelocityY = 0;
WaterDepth = 0;
WaterHeight = 0;
;áÊX?âLû÷!l?-‡b
ßk˝;Tx
8^›t›0+;ò
ÑA#@°k≥ØΩ;–e£
Uˆ[B£¶z;s£ù
;áÊX?âLû÷!l?-‡b°
ÑA#@°k≥ØΩ;–e
¡É*ûóˆ•Ä.;ƒ—

