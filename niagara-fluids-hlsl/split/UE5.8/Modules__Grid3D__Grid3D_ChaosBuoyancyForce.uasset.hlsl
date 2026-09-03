C;Ní®ã|« !¿
ÄÇ~—N;Â
ÄÇ~—N;Ã
ÄÇ~—N;
ÄÇ~—N;|
float FaceArea = dx*dx;
BuoyancyForce = float3(0,0,0);
RotationalForce = float3(0,0,0);
const int3 CurrIntIndex = int3(IndexX, IndexY, IndexZ);
        float4 SolidVelocity_Boundary;
            BoundaryGrid.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, SolidVelocity_Boundary);
        float Boundary = SolidVelocity_Boundary.w;        
        // if we have a fluid cell
        if (round(Boundary) == 0)
            // get pressure
            float Pressure;
            // get face fractions for current cell
            float3 TmpFraction;
            float F_right;
            float F_up;
            float F_front;
            float F_left;
            float F_down;
            float F_back;
                PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                F_right = TmpFraction.x;
                F_up = TmpFraction.y;
                F_front = TmpFraction.z;
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                F_left = TmpFraction.x;
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
                F_down = TmpFraction.y;
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
                F_back = TmpFraction.z;
            // integrate and sum
            float3 FractionIntegral = 
                F_right * float3(1,0,0) + F_left * float3(-1,0,0) +
                F_up * float3(0,1,0) + F_down * float3(0,-1,0) + 
                F_front * float3(0,0,1) + F_back * float3(0,0,-1);
            BuoyancyForce += Pressure * FractionIntegral * FaceArea;
            // compute torque
            // world space of current cell
            float3 ForceDir = CurrWorldPos - WorldParticleCenter;
            float3 TmpForce = cross(ForceDir, Pressure * FractionIntegral * FaceArea);
            RotationalForce += TmpForce;
ÍSÇ~à$EÖËl±;2∞Ò∑
"hµNüåÓ©;´nO
float3 IndexF = Unit * float3(NumCellsX, NumCellsY, NumCellsZ) - .5;
const int IntParticleRadius = ceil(ParticleIndexRadius)+2;
for (int xx = -IntParticleRadius; xx <= IntParticleRadius; ++xx) {
for (int yy = -IntParticleRadius; yy <= IntParticleRadius; ++yy) {
for (int zz = -IntParticleRadius; zz <= IntParticleRadius; ++zz) {
    const int3 Offset = int3(xx,yy,zz);
    const int3 CurrIntIndex = IndexF + Offset;
    if (length(Offset) <= IntParticleRadius && 
        CurrIntIndex.x >= 0 && CurrIntIndex.x < NumCellsX && 
        CurrIntIndex.y >= 0 && CurrIntIndex.y < NumCellsY &&
        CurrIntIndex.z >= 0 && CurrIntIndex.z < NumCellsZ) 
        if (UseReader)
            BoundaryReader.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, SolidVelocity_Boundary);
        else
            if (UseReader)
                PressureReader.GetPreviousFloatValue<Attribute="Pressure">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
            else
            float3 CurrUnitPos = (.5 + CurrIntIndex) / float3(NumCellsX, NumCellsY, NumCellsZ);
            float3 CurrWorldPos = mul(float4(CurrUnitPos, 1), UnitToWorld);
            float3 TmpForce = -cross(ForceDir, Pressure * FractionIntegral * FaceArea);
            if (Debug && CurrIntIndex.x == 32 && CurrIntIndex.z == 32)
                float3 TmpCenter = CurrIntIndex;
                TmpCenter = (.5 + TmpCenter) / float3(NumCellsX, NumCellsY, NumCellsZ);
                FaceReader.IndexToUnit(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpCenter);
                TmpCenter = mul(float4(TmpCenter,1), UnitToWorld);
                DebugDraw.DrawSphere(true, WorldParticleCenter, 1.0, 4, float4(1,0,0,1));
                DebugDraw.DrawLine(true, CurrWorldPos, CurrWorldPos+normalize(FractionIntegral)*-50, float4(1,0,0,1));
                DebugDraw.DrawLine(true, CurrWorldPos, CurrWorldPos+normalize(cross(FractionIntegral, ForceDir))*50, float4(1,0,0,1));
//DebugDraw.DrawLine(true, WorldParticleCenter, WorldParticleCenter+RotationalForce, float4(1,0,0,1));
            float ForceLength = length(BuoyancyForce);
            if (ForceLength > 1e-8)
                //BuoyancyForce = min(10000000, ForceLength) * BuoyancyForce / ForceLength;
óU…@Ö(»K£I;óÀSù…
óU…@Ö(»K£I;óÀSù…t
Y.œ;oöCFõ¡ôz∏9át
Y.œ;oöCFõ¡ôz∏9át∑
ˇQË∂‡;∆E±%€
‰ø˚LÄYjsd7¶;≥
«s∆;ƒ6≤KúVÖ©∑w
"hµNüåÓ©;´nOx
Ç;Lór]g«bü
Di¯Á3ì$DΩ/;Ó7E›
C;Ní®ã|« !¿€
 l˛[>ÅEéÈ¨x}#6qL›
 l˛[>ÅEéÈ¨x}#6q
bÔ«Ÿzó…I§T•ï;
¡É*ûóˆ•Ä.;ƒ—

