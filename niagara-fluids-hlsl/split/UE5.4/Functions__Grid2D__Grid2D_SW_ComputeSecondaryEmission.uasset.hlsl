EmitAmount = 0;
int NumCellsX;
int NumCellsY;
WaterReader.GetNumCells(NumCellsX, NumCellsY);
float2 UnitDX = float2(1. / NumCellsX, 1. / NumCellsY);
float WaterDepth;
WaterReader.SamplePreviousGridFloatValue<Attribute="WaterDepth">(CurrUnit, WaterDepth);
    // vorticity
    float vx_1;
    float vx_m1;
    float vy_1;
    float vy_m1;
    float2 TmpVector;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit + float2(0,1) * UnitDX, TmpVector);
    vx_1 = TmpVector.x;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit + float2(0,-1) * UnitDX, TmpVector);
    vx_m1 = TmpVector.x;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit + float2(1,0) * UnitDX, TmpVector);    
    vy_1 = TmpVector.y;
    VelocityReader.SamplePreviousGridVector2DValue<Attribute="Velocity">(CurrUnit + float2(-1,0) * UnitDX, TmpVector);        
    vy_m1 = TmpVector.y;
    float curl = abs(((vx_1-vx_m1) - (vy_1-vy_m1)) / (2. * SimDx));
    // Emit
    EmitAmount += smoothstep(MinEmitVorticity, MaxEmitVorticity, curl);
    EmitAmount *= EmissionMult;

