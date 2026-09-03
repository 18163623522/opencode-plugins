 bæCDòÌÑ<¢∆Ì
¶;ÑAçX]§éùı
ÿ>ëk*I¨;ç¨}Ü
\é`);|„Hê
;ÊLìô+:¬bœjD
;ÊLìô+:¬bœj
C;Ní®ã|« !¿
float3 IndexF = Unit * float3(NumCellsX, NumCellsY, NumCellsZ) - .5;
const int IntParticleRadius = ceil(ParticleIndexRadius)+2;
float FaceArea = dx*dx;
BuoyancyForce = float3(0,0,0);
RotationalForce = float3(0,0,0);
for (int xx = -IntParticleRadius; xx <= IntParticleRadius; ++xx) {
for (int yy = -IntParticleRadius; yy <= IntParticleRadius; ++yy) {
for (int zz = -IntParticleRadius; zz <= IntParticleRadius; ++zz) {
    const int3 Offset = int3(xx,yy,zz);
    const int3 CurrIntIndex = IndexF + Offset;
    if (length(Offset) <= IntParticleRadius && 
        CurrIntIndex.x >= 0 && CurrIntIndex.x < NumCellsX && 
        CurrIntIndex.y >= 0 && CurrIntIndex.y < NumCellsY &&
        CurrIntIndex.z >= 0 && CurrIntIndex.z < NumCellsZ) 
        float4 SolidVelocity_Boundary;
        if (UseReader)
            BoundaryReader.GetPreviousVector4Value<Attribute="SolidVelocity_Boundary">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, SolidVelocity_Boundary);
        else
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
            if (UseReader)
                PressureReader.GetPreviousFloatValue<Attribute="Pressure">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                F_right = TmpFraction.x;
                F_up = TmpFraction.y;
                F_front = TmpFraction.z;
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                F_left = TmpFraction.x;
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
                F_down = TmpFraction.y;
                FaceReader.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
                F_back = TmpFraction.z;
            else
                PressureGrid.GetPreviousFloatValue<Attribute="Pressure">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, Pressure);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x-1, CurrIntIndex.y, CurrIntIndex.z, TmpFraction);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y-1, CurrIntIndex.z, TmpFraction);
                FaceGrid.GetPreviousVectorValue<Attribute="FaceFraction">(CurrIntIndex.x, CurrIntIndex.y, CurrIntIndex.z - 1, TmpFraction);
            // integrate and sum
            float3 FractionIntegral = 
                F_right * float3(1,0,0) + F_left * float3(-1,0,0) +
                F_up * float3(0,1,0) + F_down * float3(0,-1,0) + 
                F_front * float3(0,0,1) + F_back * float3(0,0,-1);
            BuoyancyForce += Pressure * FractionIntegral * FaceArea;
            // compute torque
            // world space of current cell
            float3 CurrUnitPos = (.5 + CurrIntIndex) / float3(NumCellsX, NumCellsY, NumCellsZ);
            float3 CurrWorldPos = mul(float4(CurrUnitPos, 1), UnitToWorld);
            float3 ForceDir = CurrWorldPos - WorldParticleCenter;
            float3 TmpForce = -cross(ForceDir, Pressure * FractionIntegral * FaceArea);
            RotationalForce += TmpForce;
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
ÍSÇ~à$EÖËl±;2∞Ò´
Vol = 4./3 * 3.1415926 * Rad.x * Rad.y * Rad.z;
Ëí˜@ÒK;D∏ ø]jY›…M
Ëí˜@ÒK;D∏ ø]jY›…
//  https://math.stackexchange.com/questions/1778627/ellipsoid-moment-of-inertia-matrix
MomentOfInertia.x = r.y * r.y + r.z * r.z;
MomentOfInertia.y = r.z * r.z + r.x * r.x;
MomentOfInertia.z = r.y * r.y + r.x * r.x;
MomentOfInertia *= m / 5.;
SpriteSize = 2.0 * max(max(Radius.x, Radius.y), Radius.z);
øJ;ÜPLÇk°
îMæ[JéÊœ;cß
`Gß‰;úé
‚=;ıEJ±
wr»;z,mEãfˆ
¸¥gq‘ÚôOí;
)—Kï;˘â`O
FØà^&∏;+
˚;YPaGî
FIÄ~–//
;óKàri‰59vì~
;óKàri‰59vì
C;Ní®ã|« !¿Å
…r+;ñ±
ä,ªf;¥CH•–2ÈÓπ
)Ç-=ûéMí'i«9ﬂ;ñ´
;aªã3œŸKΩ9
N[áÆ;|]HøsìΩﬂ]¨Ø®
INí^;©ı”ﬁﬂKÁˆ
INí^;©ı”ﬁﬂ
@;TÈ∞M∞I®TLô≥ß¥ﬁ
U™yE≤3a;§“œk
∞)‡XCnEOü ;
 MÚÆÉ~Oë‘
`Wúπû75O∞ØD;˘ùA‰õ
`Wúπû75O∞ØD;˘ùA‰´
jDÖa#˘;˚|?ß
˙∆FÄe;mUwË>û
˙∆FÄe;mUwË>´
 l˛[>ÅEéÈ¨x}#6qL›
 l˛[>ÅEéÈ¨x}#6q
≤◊,‡ƒ;}¿ÛZ[´DØMV±
;}¿ÛZ[´DØMV±
hÖM©ªÈˆHàC;¥
sñ'Áª7;F´
$xø)˙k;M§nΩ\
°±5/∏èÍL∏˙ÔNˇ;%n´
C>7™Jª}*eÛ;ﬁˆ}F
C>7™Jª}*eÛ;ﬁˆ
Ö√Ú";ú»AΩπ
u≠;ÂÔ™3Et€@¢Sµ≥r%˘˜Q
+lÿ-;’ÒBûòæˇîû
Bä&˚Z;
 rœ¯•≤
iKê; C
?Â;®q@L∑p<XıÍoÛ
GœVkNHÓ@®‡sÊˆ;qq¡
GœVkNHÓ@®‡sÊˆ;qq
;ON≥=Úqv⁄ƒ
:.>âDµË˛1[è…; 
:.>âDµË˛1[è…;
JΩR⁄^;
Ôõ>÷;±´
ß≤≠˚KΩ{∏Or<;]v
ß≤≠˚KΩ{∏Or<;]0
bÔ«Ÿzó…I§T•ï;
‰§C∆;ºªHáU·Ñ‹‹
¡É*ûóˆ•Ä.;ƒ—

