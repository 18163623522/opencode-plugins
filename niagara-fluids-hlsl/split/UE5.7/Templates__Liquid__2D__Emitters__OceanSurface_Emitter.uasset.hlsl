¸|MæãÙ;&
;ùaEä1<ãÆŒ
;§Ê˚C˝6GúâÈneY
;—$iπpæ:
Iaxô;]
}øsÓ ﬁÓ;
ÆAˆ.¯ïÇ;
;{^`\¿]
Ω”BÄ‚∏˝;8¢<]
,Ä6;k+ˆIæPzÑ&|N@]
$Ê@vQ¯EF°;ﬂ_µ˙≠
Ïπ^Ú;F
;è!E†Ü
 gÍ„âpIí±ˇ
híFúà;ı
£CØdw1°Ï;5]
x°;Rë˘
I@tï;≤.Cèˇ¬
ãùwﬁBødë3u;ú
;·qº—TJ§≈tTŸJÎ
PB≥È3;
// Insert the body of the function here and add any inputs
// and outputs by name using the add pins above.
// Currently, complicated branches, for loops, switches, etc are not advised.
Result = Scale * DDx;
    Result = 0;
Result = scale * DDy;
e‚;%JÑ,9Y®ò≠
// Indices for which thread group a compute shader is executing in
// -- GGroupId
GroupID = GGroupId.x;
// ID of this thread in the group.  
// Assumes Dispatch is linear i.e. Dispatch( NumGroups, 1, 1);
GroupThreadID = GGroupThreadId.x;
// This module does two things.  It sets up the waves in spectral space and does the first directional transform
// Explicitly it  
// First:  Computes complex coefficents for each wave.
//         these coefficients determine the amplitude and time-dependent phase of each wave.
// Second: Performs FFT in X
//  The complex coefficies A_{k1, k2} need to satisfy certains conjugate relations
//  A_{-k1, -k2} = ComplexConjugate( A_{k1, k2} )
//  due to FFT layout and periodicity the negative wave numbers are alliased to positive ones..
//    if k1 >= N/2 then k1 = -(N-k1)
//       k2 >= M/2 then k2 = -(M-k2)
//                                                where N = num cells in X, M = num cells in y
// for traveling waves and k1, k2 < [N/2, M/2]
// A(k1, k2) = exp(i w(k) t) Sqrt( S(|k|) ) k.dot.windir  with w(|k|) = sqrt(2 pi g / L) sqrt(|k|) 
int Nx =  NumCellsInScanline;
int NumCols = Nx / RADIX; // requires a dispatch such that NumCols = THREADGROUP_SIZE
int Ny = NumScanlines;
// note: both Nx and Ny are powers of 2.
int NxOn2 = Nx / 2;
int NyOn2 = Ny / 2;
// constants.
float Pi = 3.14159265358979323846;
float TwoPi = 2.0 * Pi;
float Lcm = OceanScale; // domain size in cm.
float TwoPiOnL = TwoPi / Lcm;
float speedScale = sqrt( TwoPiOnL * gravity);
float scaledTime = TimeScale * Time;
// --Phillips Spectrum const
float windAngleDegrees = windAngle % 360;
    windAngleDegrees += 360;
float windAngleRadians = - (Pi / 180.) * windAngleDegrees; // the minus sign is a hack because in a 2d buffer the origin is at top left corner (y measues down)
float2 windDir;
sincos(windAngleRadians, windDir.y, windDir.x);
float principalWaveL = 1.f;     // length of wave traveling at the wind speed. 
    principalWaveL = windSpeed * windSpeed * TwoPi / gravity;
int alignmentPow = min(max(windAlignment,1), 20);
// phase offset so the waves don't all start in sync on the first frame. 
float2 noiseSamples = frac(20* float2(length(noisePt1), length(noisePt2))); // random phase two waves 
float2 noiseSamples2 = frac(20* float2(length(noisePt1_back), length(noisePt2_back))); // random phase two waves 
// local scratch of complex numbers. ( V.x+ I V.y is a complex number)
float2 V[RADIX];
// create the waves in fourier space by computing the complex amplitudes.
// this are computed for each point in 2d wave number space [0, Nx] x [0, Ny]
// each thread actually computes points on the same scaneline
//    (threadIdx, Scanline) and (threadIdx + NumCols, scanline) 
// and stores the results in the local scratch. This is used to kick off the fft.
    float sgn = 1; // used to account for complex conjugates that keep the output real
    if (windAngle >= 180)
        sgn *= -1;
    if (windSpeed < 0 )
    float mask = 1; // zero at k = N/2 ( Nyquest freq) - simplifies make real result 
    int k2 = ScanlineIdx;
    if (k2 == NyOn2)
        mask = 0;
    else if (k2 > NyOn2)
        k2 = -(Ny - k2);
    UNROLL for (int r = 0, j = ThreadIdx ; r < RADIX; ++r, j+= NxOn2)
        int k1 =  j;
        if ( k1 == NxOn2)
            mask = 0;
        if(k1 > NxOn2)
            k1 =  -(Nx - k1);
            if (k2 == 0)
                sgn *= -1;
        int2 kIndex2 = int2(k1, k2);
        float2 kVec = float2(k1 * TwoPiOnL, k2 * TwoPiOnL);
        float kMag = length(kVec);
        // wave amplitude by computing phillips spectra evaluation for this wave-number kMag       
        float waveAmp = 0.f; 
        if (!(k1 ==0 && k2 ==0) )
            float kMagL = kMag * principalWaveL;
                float2 kDir = kVec / kMag;
                float  windCos = dot(kDir, windDir);
                float  windCosPow = pow(windCos * windCos, alignmentPow);
                // scale the amplitude so that it is indep of domain size
                float ksqr = k1 * k1 + k2 * k2;
                float kTo4 = ksqr * ksqr;
                float phillipsSpectra = abs(PhillipsAmplitude) * (windCosPow) / ( exp(1./( kMagL * kMagL))  * kTo4);
                waveAmp = sqrt(phillipsSpectra);
        // update the phase of each wave using the dispersion relation. 
        // independant of whatever model produced the wave amplitues. 
        float dispersion = sgn * speedScale * sqrt(kMag) * scaledTime + TwoPi*noiseSamples[r];
        float2 cs;
        sincos(dispersion, cs.y, cs.x); 
        // opposite direction wave
        float WaveAmp2 = waveAmp;   
        float dispersion2 = sgn * speedScale * sqrt(kMag) * scaledTime + TwoPi*noiseSamples2[r];
        float2 cs2;
        sincos(dispersion2, cs2.y, cs2.x); 
        WaveAmp2 *= Slosh;
        cs2.y *= -1.f;
        V[r] = mask * (WaveAmp2 * cs2 + waveAmp * cs);
// do FFT in X, writing the result in the grid
// compute FFT
// This is a sequence of Radix-2 FFTs and data exchanges.
    float FFTsgn = 1.f;
    int IdxS = ThreadIdx;
    for (int Ns = 1 ; Ns < NumCols; Ns *= RADIX)
        //IdxD = Expand(ThreadIdx, Ns, RADIX);
        int IdxD = (ThreadIdx / Ns) * Ns * RADIX + (ThreadIdx % Ns);
        // Apply the Twiddle
        float Theta = FFTsgn * TwoPi * float( ThreadIdx % Ns) / float(Ns * RADIX);
            float2 Twiddle;
            sincos(Theta, Twiddle.y, Twiddle.x); 
            float RealPart = V[1].x * Twiddle.x - V[1].y * Twiddle.y;
            float ImagPart = V[1].x * Twiddle.y + V[1].y * Twiddle.x;
            V[1] = float2(RealPart, ImagPart);
        // Radix(2) FFT
            float2 Vo = V[0];
            V[0] = Vo + V[1];
            V[1] = Vo - V[1];
        // Exchange data with other threads
            GroupMemoryBarrierWithGroupSync();
            // write to group shared
            for (int r = 0, j = IdxD; r < RADIX; ++r, j += Ns)
                FFTGroupShared[j] = V[r];
           GroupMemoryBarrierWithGroupSync();
            // read from group shared
            for (int r = 0, j = IdxS; r < RADIX; ++r, j += NumCols)
                  V[r] = FFTGroupShared[j];            
    } // end loop
    // last interation.  would be the same as NS = NumCols in the above loop,
    // but this skips a non-op data exchange.
         // Apply the Twiddle
        float Theta = FFTsgn * TwoPi * float( ThreadIdx % NumCols) / float(Nx);
} // end FFT
// Copy the results to the output buffer
UNROLL for (int r = 0, j = ThreadIdx; r < RADIX; ++r, j += NumCols)
    int2 GridIdx = int2(j, ScanlineIdx);
    Grid.SetFloatValue<Attribute="RealPart">(GridIdx.x, GridIdx.y,      V[r].x);
    Grid.SetFloatValue<Attribute="ImaginaryPart">(GridIdx.x, GridIdx.y, V[r].y);
// Need two points where the noise will be evaluated 
int2 waveNumberPnt1 = int2(kx, ky);
int2 waveNumberPnt2 = waveNumberPnt1 + int2(NumCellsX / 2, 0);
int kxp = kx;
    waveNumberPnt1.x = (NumCellsX - waveNumberPnt1.x);
    waveNumberPnt1.y = (NumCellsY - waveNumberPnt1.y);
    waveNumberPnt2.x = (NumCellsX - waveNumberPnt2.x);
    waveNumberPnt2.y = (NumCellsY - waveNumberPnt2.y);
UVpnt1 = float2(waveNumberPnt1.x / float(NumCellsX/2), waveNumberPnt1.y / float(NumCellsY/2) );
UVpnt2 = float2(waveNumberPnt2.x / float(NumCellsX/2), waveNumberPnt2.y / float(NumCellsY/2) );
UVpnt1_back = float2(waveNumberPnt1.x / float(NumCellsX/2), waveNumberPnt1.y / float(NumCellsY/2) ) + .25;
UVpnt2_back = float2(waveNumberPnt2.x / float(NumCellsX/2), waveNumberPnt2.y / float(NumCellsY/2) ) + .25;
:D∫ªv„;
5o?â•N¥DS:;Z¶¸ü
5o?â•N¥DS:;Z¶¸æ
WorldGridExtents = MaxAxisWorldExtents;
    WorldGridExtents.x = MaxAxisWorldExtents;
    WorldGridExtents.y = MaxAxisWorldExtents * float(1. * ResY / ResX);
    WorldGridExtents.y = MaxAxisWorldExtents;
    WorldGridExtents.x = MaxAxisWorldExtents * float(1. * ResX / ResY);
int Ny =  NumCellsY;
int NumCols = Ny / RADIX; // requires a dispatch such that NumCols = THREADGROUP_SIZE
float Sgn = -1.;
// load Real and Imaginary parts of the scanline into scratch
    // read data from Grid
    UNROLL for (int r = 0, j = ThreadIdx ; r < RADIX; ++r, j+= NumCols)
        int2 GridIdx = int2(ScanlineIdx, j);
        // get real and imaginary parts from grid
        Grid.GetFloatValue<Attribute="RealPart">(GridIdx.x, GridIdx.y,      V[r].x);
        Grid.GetFloatValue<Attribute="ImaginaryPart">(GridIdx.x, GridIdx.y, V[r].y);
// do FFT 
    float FFTsgn = 1.;
        float Theta = FFTsgn * TwoPi * float( ThreadIdx % NumCols) / float(Ny);
// write result back to grid
    int2 GridIdx = int2(ScanlineIdx, j);
°Z;ÈJÍEèöv{ÜÒ∏˙¢
°Z;ÈJÍEèöv{ÜÒ∏˙d
LinearIndex = IndexX + IndexY * NumCellsX;
IndexX = GDispatchThreadId.x;
IndexY = GDispatchThreadId.y;
LinearIndex = GLinearThreadId;
    float h_right;
    float h_up;   
    int XQuery = IndexX + 1;
    int YQuery = IndexY + 1;
    if (IndexX == NumCellsX - 1)
        XQuery = 0;
    if (IndexY == NumCellsY - 1)
        YQuery = 0;
    OceanGrid.GetPreviousFloatValue<Attribute = "RealPart">(XQuery, IndexY, h_right);
    OceanGrid.GetPreviousFloatValue<Attribute = "RealPart">(IndexX, YQuery, h_up);
    float3 WorldPos  = SimPos;
    WorldPos.z = h;
    float3 WorldPosRight = SimPos;
    WorldPosRight.x = dx;
    WorldPosRight.z = h_right;
    float3 WorldPosUp = SimPos;
    WorldPosUp.y = dx;
    WorldPosUp.z = h_up;
    float3 CrossProd = cross(WorldPosRight - WorldPos, WorldPosUp - WorldPos);
    float CrossProdLength = length(CrossProd);
    // default to upward facing normal
    if (CrossProdLength < 1e-10)
        Normal = float3(0,0,1);
    else
        Normal = CrossProd / CrossProdLength;
l”˚È€$»J§◊;
ì∑PäNióOìA%;‰r≠P
SL£:M©ËJ¢Áz√"õ;N
Ú◊ˇÍI®E‚∑ﬁ»;è
p°;v[T
5o?â•N¥DS:;Z¶¸
íUÿx//°OÅ‘K7ü“
K@£∂îà3;
Gßâ;ò»MW‰]
°Z;ÈJÍEèöv{ÜÒ∏˙
›‘LéOΩå†;1≥]
SL£:M©ËJ¢Áz√"õ;N¬
SL£:M©ËJ¢Áz√"õ;Nd
åe˚M{P;Dï
ø’¿;ãKÀI¶Lé
,Ä6;k+ˆIæPzÑ&|N@
JoƒPÀ7hLº;Ÿ9P;3
¸¥gq‘ÚôOí;
"¿ÈGﬂCé2uÜ;∂\<
1'ìJìL;⁄Í"z
'¥Í[¢ÏDNªµ™;0[ØñT
∂ÙµO≥;3Yx‘(ÇT
œﬁ;¬Ì‘–Eà(
;í⁄¿vã
EäI≠öˇ{;‹*-R
ËˆiB‰CΩ2ò;ú^E;Á
ËˆiB‰CΩ2ò;ú^E;ù
;°Ñºbg¥Lô¡‰H÷c–QR
⁄Ù˝ƒ˜;MDñÖ!Ìﬁ⁄.«R
« ;Pçá2EÖ
¬Aé;OÃ
«;ö‚≥˛é@ÉüX˚ΩöC∂]
›'lO≈~®F≤iπ¬ƒ1/;]
mNΩ§1;
˝/µ;ı’
jK´É˚VL;’⁄
0pùIûÓOÖ∞¢Î˝~ ;T
ÂŒTì∂{iAõ+;}Ü‹*
Ì<;EjÂbHÉ3û0[%zB
ì∑PäNióOìA%;‰r≠P.
ì∑PäNióOìA%;‰r≠P˜
KªΩ◊0Ã=;j
áNàb;n
;Ï£nQE=Nìh·¢
êq»¿@ó1nÔ‚ç√;[
êq»¿@ó1nÔ‚ç√;]
ıô3º;>HíDA
;í⁄¿vã`
;í⁄¿vãw
ËˆiB‰CΩ2ò;ú^E;
àÕ@ΩvOÓ;hJµégãÜB7FNîo&A
àÕ@ΩvOÓ;hJµ
;˘A¨≈\7ñ◊r®
ˆ¬˘FeŒ7O®–;Ì@ì
b¿0z.^èÎ;
†¬Yò5Nõ;
z.^èÎ;
˙R;0L≤PÒõZ j
=±H∏¿,Q;rè°à
=±H∏¿,Q;rè°
;CV˛øà
;CV˛ø]
D•/çs∆=;¸
„∏;AßJ∂
d; l0©
;Î°@Ñ¬yò\—:Mú
;Î°@Ñ¬yò\—:M]
wNY#«F∑;8w•´z`
<˜;Aáä)C#Ä`›
 GãTlyc
Ì<;EjÂbHÉ3û0[%zBÆ
 K±~ëÉú^x⁄
KªΩ◊0Ã=;j¥
KªΩ◊0Ã=;jµ
ãé;Ã¿íˆN∫9U:
_,hﬁ;‚ÌE°ﬂ˚¸jÅRDR
pçıÆE≥[3–;
_ œ;÷h1F™[ﬂq†Ò
8îãµ>;5Oñ‰ÎìWﬁ
"¿ÈGﬂCé2uÜ;∂\<…
"¿ÈGﬂCé2uÜ;∂\<w
¨üt#j›]HÑ?¢ÂˆjR';
ìJ1;)bOH∂
-– ]êx;Bô
x°;Rë˘Œ
x°;Rë˘w
<˜;Aáä)C#Ä`›Œ
<˜;Aáä)C#Ä`
!≥U=;XÔCã
ß≤≠˚KΩ{∏Or<;] 
ß≤≠˚KΩ{∏Or<;]7
Bà;r‚=µç¶{
ä¸;ì!†·ÀÎrôÑOq
ƒ;d∞ŸÌ
œ@5#\cI;Í)chÓÜ 
œ@5#\cI;Í)chÓÜ7
// Shader generated by Niagara HLSL Translator
// Compile Data> Static Variables Input: 
// Compile Data> PinToConstantValues Input: 
int ID;
int Index;
int AcquireTag;
float Engine_WorldDeltaTime;
float Engine_DeltaTime;
float Engine_InverseDeltaTime;
float Engine_Time;
float Engine_RealTime;
int Engine_QualityLevel;
int Engine_PaddingInt32_0;
int Engine_PaddingInt32_1;
float Engine_Owner_TimeSinceRendered;
float Engine_Owner_LODDistance;
float Engine_Owner_LODDistanceFraction;
float Engine_System_Age;
int Engine_Owner_ExecutionState;
int Engine_System_TickCount;
int Engine_System_NumEmitters;
int Engine_System_NumEmittersAlive;
int Engine_System_SignificanceIndex;
int Engine_System_RandomSeed;
int Engine_System_CurrentTimeStep;
int Engine_System_NumTimeSteps;
float Engine_System_TimeStepFraction;
int Engine_System_NumParticles;
int Engine_System_PaddingInt32_0;
int Engine_System_PaddingInt32_1;
float4x4 Engine_Owner_SystemLocalToWorld;
float4x4 Engine_Owner_SystemWorldToLocal;
float4x4 Engine_Owner_SystemLocalToWorldTransposed;
float4x4 Engine_Owner_SystemWorldToLocalTransposed;
float4x4 Engine_Owner_SystemLocalToWorldNoScale;
float4x4 Engine_Owner_SystemWorldToLocalNoScale;
float4 Engine_Owner_Rotation;
float3 Engine_Owner_Position;
int Engine_Owner_PaddingInt32_0;
float3 Engine_Owner_Velocity;
int Engine_Owner_PaddingInt32_1;
float3 Engine_Owner_SystemXAxis;
int Engine_Owner_PaddingInt32_2;
float3 Engine_Owner_SystemYAxis;
int Engine_Owner_PaddingInt32_3;
float3 Engine_Owner_SystemZAxis;
int Engine_Owner_PaddingInt32_4;
float3 Engine_Owner_Scale;
int Engine_Owner_PaddingInt32_5;
float4 Engine_Owner_LWCTile;
int Engine_Emitter_NumParticles;
int Engine_Emitter_TotalSpawnedParticles;
float Engine_Emitter_SpawnCountScale;
float Emitter_Age;
int Emitter_RandomSeed;
int Engine_Emitter_InstanceSeed;
int Engine_Emitter_PaddingInt32_0;
int Engine_Emitter_PaddingInt32_1;
float Emitter_gravity;
float Emitter_PhillipsAmplitude;
float Emitter_TimeScale;
float Emitter_OceanLengthScale;
float Emitter_windAngle;
float Emitter_windSpeed;
int Emitter_windAlignement;
float Emitter_Slosh;
float gravity;
float OceanScale;
float PhillipsAmplitude;
float Slosh;
float TimeScale;
int windAlignment;
float windAngle;
float windSpeed;
int UniqueID;
float Age;
int CurrentTimeStep;
int NumEmitters;
int NumEmittersAlive;
int NumParticles;
int NumTimeSteps;
int PaddingInt32_0;
int PaddingInt32_1;
int RandomSeed;
int SignificanceIndex;
int TickCount;
float TimeStepFraction;
int ExecutionState;
float LODDistance;
float LODDistanceFraction;
float4 LWCTile;
int PaddingInt32_2;
int PaddingInt32_3;
int PaddingInt32_4;
int PaddingInt32_5;
float3 Position;
float4 Rotation;
float3 Scale;
float4x4 SystemLocalToWorld;
float4x4 SystemLocalToWorldNoScale;
float4x4 SystemLocalToWorldTransposed;
float4x4 SystemWorldToLocal;
float4x4 SystemWorldToLocalNoScale;
float4x4 SystemWorldToLocalTransposed;
float3 SystemXAxis;
float3 SystemYAxis;
float3 SystemZAxis;
float TimeSinceRendered;
float3 Velocity;
NiagaraEmitterID ID;
int InstanceSeed;
float SpawnCountScale;
int TotalSpawnedParticles;
float DeltaTime;
FParamMap0_Engine_Emitter Emitter;
int ExecIndex;
float InverseDeltaTime;
FParamMap0_Engine_Owner Owner;
int QualityLevel;
float RealTime;
FParamMap0_Engine_System System;
float Time;
float WorldDeltaTime;
float OceanLengthScale;
int windAlignement;
FParamMap0_Array Array;
FParamMap0_Emitter Emitter;
FParamMap0_Engine Engine;
FParamMap0_Particles Particles;
FParamMap0_ScratchModule_09 ScratchModule_09;
FParamMap0 Map;
static float HackSpawnInterp = 1.0;
void ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_(out int Out_GroupID, out int Out_GroupThreadID);
void GetNumCells_Emitter_Grid2D(int In_InstanceData, out int Out_NumCellsX, out int Out_NumCellsY);
void CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_(int In_NumCellsX, int In_NumCellsY, int In_kx, int In_ky, out float2 Out_UVpnt1, out float2 Out_UVpnt2, out float2 Out_UVpnt1_back, out float2 Out_UVpnt2_back);
void SampleTexture2D_Emitter_ScratchModule_NoiseTexture(int In_InstanceData, float2 In_UV, float In_MipLevel, out float4 Out_Value);
void SetFloatValue_Emitter_Grid2D_UEImpureCall_AttributeRealPart(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
void SetFloatValue_Emitter_Grid2D_UEImpureCall_AttributeImaginaryPart(int In_InstanceData, int In_IndexX, int In_IndexY, float In_Value);
void WavesInSpectralSpaceAndFFTInXDF9882794396729F2167B26E51EF06C9ADA2324AEmitter_Grid2D_Func_(int In_ScanlineIdx, int In_ThreadIdx, int In_NumCellsInScanline, int In_NumScanlines, float In_Time, float In_gravity, float In_PhillipsAmplitude, float In_TimeScale, float In_OceanScale, float4 In_noisePt1, float4 In_noisePt2, float In_windSpeed, float In_windAngle, int In_windAlignment, float In_Slosh, float4 In_noisePt1_back, float4 In_noisePt2_back, inout FSimulationContext Context);
void ScratchModule_09_Emitter_Func_(inout FSimulationContext Context);
float GetSpawnInterpolation();
Out_GroupID = GGroupId.x;
Out_GroupThreadID = GGroupThreadId.x;
int2 waveNumberPnt1 = int2(In_kx, In_ky);
int2 waveNumberPnt2 = waveNumberPnt1 + int2(In_NumCellsX / 2, 0);
int kxp = In_kx;
    waveNumberPnt1.x = (In_NumCellsX - waveNumberPnt1.x);
    waveNumberPnt1.y = (In_NumCellsY - waveNumberPnt1.y);
    waveNumberPnt2.x = (In_NumCellsX - waveNumberPnt2.x);
    waveNumberPnt2.y = (In_NumCellsY - waveNumberPnt2.y);
Out_UVpnt1 = float2(waveNumberPnt1.x / float(In_NumCellsX/2), waveNumberPnt1.y / float(In_NumCellsY/2) );
Out_UVpnt2 = float2(waveNumberPnt2.x / float(In_NumCellsX/2), waveNumberPnt2.y / float(In_NumCellsY/2) );
Out_UVpnt1_back = float2(waveNumberPnt1.x / float(In_NumCellsX/2), waveNumberPnt1.y / float(In_NumCellsY/2) ) + .25;
Out_UVpnt2_back = float2(waveNumberPnt2.x / float(In_NumCellsX/2), waveNumberPnt2.y / float(In_NumCellsY/2) ) + .25;
int Nx =  In_NumCellsInScanline;
int Ny = In_NumScanlines;
float Lcm = In_OceanScale; // domain size in cm.
float speedScale = sqrt( TwoPiOnL * In_gravity);
float scaledTime = In_TimeScale * In_Time;
float windAngleDegrees = In_windAngle % 360;
    principalWaveL = In_windSpeed * In_windSpeed * TwoPi / In_gravity;
int alignmentPow = min(max(In_windAlignment,1), 20);
float2 noiseSamples = frac(20* float2(length(In_noisePt1), length(In_noisePt2))); // random phase two waves 
float2 noiseSamples2 = frac(20* float2(length(In_noisePt1_back), length(In_noisePt2_back))); // random phase two waves 
    if (In_windAngle >= 180)
    if (In_windSpeed < 0 )
    int k2 = In_ScanlineIdx;
    UNROLL for (int r = 0, j = In_ThreadIdx ; r < RADIX; ++r, j+= NxOn2)
                float phillipsSpectra = abs(In_PhillipsAmplitude) * (windCosPow) / ( exp(1./( kMagL * kMagL))  * kTo4);
        WaveAmp2 *= In_Slosh;
    int IdxS = In_ThreadIdx;
        int IdxD = (In_ThreadIdx / Ns) * Ns * RADIX + (In_ThreadIdx % Ns);
        float Theta = FFTsgn * TwoPi * float( In_ThreadIdx % Ns) / float(Ns * RADIX);
        float Theta = FFTsgn * TwoPi * float( In_ThreadIdx % NumCols) / float(Nx);
UNROLL for (int r = 0, j = In_ThreadIdx; r < RADIX; ++r, j += NumCols)
    int2 GridIdx = int2(j, In_ScanlineIdx);
    SetFloatValue_Emitter_Grid2D_UEImpureCall_AttributeRealPart(0, GridIdx.x, GridIdx.y,      V[r].x);
    SetFloatValue_Emitter_Grid2D_UEImpureCall_AttributeImaginaryPart(0, GridIdx.x, GridIdx.y, V[r].y);
int ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_Output_GroupID;
int ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_Output_GroupThreadID;
ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_(ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_Output_GroupID, ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_Output_GroupThreadID);
int GetNumCells_Emitter_Grid2DOutput_NumCellsX;
int GetNumCells_Emitter_Grid2DOutput_NumCellsY;
GetNumCells_Emitter_Grid2D(0, GetNumCells_Emitter_Grid2DOutput_NumCellsX, GetNumCells_Emitter_Grid2DOutput_NumCellsY);
float2 CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt1;
float2 CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt2;
float2 CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt1_back;
float2 CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt2_back;
CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_(GetNumCells_Emitter_Grid2DOutput_NumCellsX, GetNumCells_Emitter_Grid2DOutput_NumCellsY, ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_Output_GroupID, ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_Output_GroupThreadID, CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt1, CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt2, CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt1_back, CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt2_back);
float Constant = 0;
float4 SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value;
SampleTexture2D_Emitter_ScratchModule_NoiseTexture(1, CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt1, Constant, SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value);
float Constant1 = 0;
float4 SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value1;
SampleTexture2D_Emitter_ScratchModule_NoiseTexture(1, CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt2, Constant1, SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value1);
float Constant2 = 0;
float4 SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value2;
SampleTexture2D_Emitter_ScratchModule_NoiseTexture(1, CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt1_back, Constant2, SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value2);
float Constant3 = 0;
float4 SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value3;
SampleTexture2D_Emitter_ScratchModule_NoiseTexture(1, CustomHlsl1D267A1018E9B16D9D0DEDA6FB239A6BB4CD6D7E_Func_Output_UVpnt2_back, Constant3, SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value3);
WavesInSpectralSpaceAndFFTInXDF9882794396729F2167B26E51EF06C9ADA2324AEmitter_Grid2D_Func_(ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_Output_GroupID, ThreadGroupInfo00EDF59E15DED730B7F0C6DA7513B670DB146071_Func_Output_GroupThreadID, GetNumCells_Emitter_Grid2DOutput_NumCellsX, GetNumCells_Emitter_Grid2DOutput_NumCellsY, Context.Map.Engine.System.Age, Context.Map.ScratchModule_09.gravity, Context.Map.ScratchModule_09.PhillipsAmplitude, Context.Map.ScratchModule_09.TimeScale, Context.Map.ScratchModule_09.OceanScale, SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value, SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value1, Context.Map.ScratchModule_09.windSpeed, Context.Map.ScratchModule_09.windAngle, Context.Map.ScratchModule_09.windAlignment, Context.Map.ScratchModule_09.Slosh, SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value2, SampleTexture2D_Emitter_ScratchModule_NoiseTextureOutput_Value3, Context);
return 1.0f;}
#if (SimulationStageIndex == 0) // MapSpawn
EnterStatScope(0 /**SimulationStage_0*/);
//Begin Initialize Parameter Map Defaults
//End Initialize Parameter Map Defaults
Context.Map.ScratchModule_09.gravity = Context.Map.Emitter.gravity;
Context.Map.ScratchModule_09.PhillipsAmplitude = Context.Map.Emitter.PhillipsAmplitude;
Context.Map.ScratchModule_09.TimeScale = Context.Map.Emitter.TimeScale;
Context.Map.ScratchModule_09.OceanScale = Context.Map.Emitter.OceanLengthScale;
Context.Map.ScratchModule_09.windAngle = Context.Map.Emitter.windAngle;
Context.Map.ScratchModule_09.windSpeed = Context.Map.Emitter.windSpeed;
Context.Map.ScratchModule_09.windAlignment = Context.Map.Emitter.windAlignement;
Context.Map.ScratchModule_09.Slosh = Context.Map.Emitter.Slosh;
EnterStatScope(1 /**ScratchModule_09_Emitter_Func_*/);
ScratchModule_09_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule_09_Emitter_Func_*/);
ExitStatScope(/**SimulationStage_0*/);
EnterStatScope(2 /**SimulationStage_0_Main*/);
FSimulationContext Context = (FSimulationContext)0;
Context.Map.Emitter.gravity = Emitter_gravity;
Context.Map.Emitter.PhillipsAmplitude = Emitter_PhillipsAmplitude;
Context.Map.Emitter.TimeScale = Emitter_TimeScale;
Context.Map.Emitter.OceanLengthScale = Emitter_OceanLengthScale;
Context.Map.Emitter.windAngle = Emitter_windAngle;
Context.Map.Emitter.windSpeed = Emitter_windSpeed;
Context.Map.Emitter.windAlignement = Emitter_windAlignement;
Context.Map.Emitter.Slosh = Emitter_Slosh;
Context.Map.Engine.System.Age = Engine_System_Age;
Context.Map.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.Map.Emitter.RandomSeed = Emitter_RandomSeed;
Context.Map.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.Map.Engine.System.RandomSeed = Engine_System_RandomSeed;
ReadDataSets(Context);
Context.Map.Engine.ExecIndex = ExecIndex();
Context.Map.Engine.Emitter.ID.ID = 0;
EnterStatScope(3 /**SimulationStage_0_MapMain*/);
Simulate(Context);
ExitStatScope(/**SimulationStage_0_MapMain*/);
WriteDataSets(Context);
int TmpWriteIndex = OutputIndex(0, false, true);
OutputDataInt(0, 0, TmpWriteIndex, Context.Map.Particles.UniqueID);
ExitStatScope(/**SimulationStage_0_Main*/);
float ImaginaryPart;
float RealPart;
FParamMap0_Emitter_Grid2D Grid2D;
void SetVariables_36CBA66540F8A3D1E7A7DC9BBE8AD2EE_Emitter_Func_(inout FSimulationContext Context);
Context.Map.Emitter.Grid2D.RealPart = Constant2;
Context.Map.Emitter.Grid2D.ImaginaryPart = Constant3;
EnterStatScope(1 /**SetVariables_36CBA66540F8A3D1E7A7DC9BBE8AD2EE_Emitter_Func_*/);
SetVariables_36CBA66540F8A3D1E7A7DC9BBE8AD2EE_Emitter_Func_(Context);
ExitStatScope(/**SetVariables_36CBA66540F8A3D1E7A7DC9BBE8AD2EE_Emitter_Func_*/);
x…@1A±;N-R≤B“]
void ExecutionIndexToGridIndex_Emitter_Grid2D(int In_InstanceData, out int Out_IndexX, out int Out_IndexY);
void GetPreviousFloatValue_Emitter_Grid2D_AttributeRealPart(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void CustomHlslE723F111C9AA7E157742C68821DB6C1E133FE8E4Emitter_Grid2D_Func_(float In_h, int In_IndexX, int In_IndexY, float3 In_SimPos, float In_dx, int In_NumCellsX, int In_NumCellsY, out float3 Out_Normal);
void SetRenderTargetValue_Emitter_NormalRT_UEImpureCall(int In_InstanceData, bool In_Enabled, int In_IndexX, int In_IndexY, float4 In_Value);
void ScratchModule005_Emitter_Func_(inout FSimulationContext Context);
    int XQuery = In_IndexX + 1;
    int YQuery = In_IndexY + 1;
    if (In_IndexX == In_NumCellsX - 1)
    if (In_IndexY == In_NumCellsY - 1)
    GetPreviousFloatValue_Emitter_Grid2D_AttributeRealPart(0, XQuery, In_IndexY, h_right);
    GetPreviousFloatValue_Emitter_Grid2D_AttributeRealPart(0, In_IndexX, YQuery, h_up);
    float3 WorldPos  = In_SimPos;
    WorldPos.z = In_h;
    float3 WorldPosRight = In_SimPos;
    WorldPosRight.x = In_dx;
    float3 WorldPosUp = In_SimPos;
    WorldPosUp.y = In_dx;
        Out_Normal = float3(0,0,1);
        Out_Normal = CrossProd / CrossProdLength;
float Constant1 = 150;
bool Constant2 = true;
int ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexX;
int ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexY;
ExecutionIndexToGridIndex_Emitter_Grid2D(0, ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexX, ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexY);
float GetPreviousFloatValue_Emitter_Grid2D_AttributeRealPartOutput_Value;
GetPreviousFloatValue_Emitter_Grid2D_AttributeRealPart(0, ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexX, ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexY, GetPreviousFloatValue_Emitter_Grid2D_AttributeRealPartOutput_Value);
float3 Constant3 = float3(0,0,0);
float Result = Constant1 / GetNumCells_Emitter_Grid2DOutput_NumCellsX;
float3 CustomHlslE723F111C9AA7E157742C68821DB6C1E133FE8E4Emitter_Grid2D_Func_Output_Normal;
CustomHlslE723F111C9AA7E157742C68821DB6C1E133FE8E4Emitter_Grid2D_Func_(GetPreviousFloatValue_Emitter_Grid2D_AttributeRealPartOutput_Value, ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexX, ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexY, Constant3, Result, GetNumCells_Emitter_Grid2DOutput_NumCellsX, GetNumCells_Emitter_Grid2DOutput_NumCellsY, CustomHlslE723F111C9AA7E157742C68821DB6C1E133FE8E4Emitter_Grid2D_Func_Output_Normal);
float4 Output1;
Output1.r = CustomHlslE723F111C9AA7E157742C68821DB6C1E133FE8E4Emitter_Grid2D_Func_Output_Normal.x;
Output1.g = CustomHlslE723F111C9AA7E157742C68821DB6C1E133FE8E4Emitter_Grid2D_Func_Output_Normal.y;
Output1.b = CustomHlslE723F111C9AA7E157742C68821DB6C1E133FE8E4Emitter_Grid2D_Func_Output_Normal.z;
Output1.a = GetPreviousFloatValue_Emitter_Grid2D_AttributeRealPartOutput_Value;
SetRenderTargetValue_Emitter_NormalRT_UEImpureCall(1, Constant2, ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexX, ExecutionIndexToGridIndex_Emitter_Grid2DOutput_IndexY, Output1);
float Constant = 150;
EnterStatScope(1 /**ScratchModule005_Emitter_Func_*/);
ScratchModule005_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule005_Emitter_Func_*/);
void ThreadGroupInfoBD2F6592D66A1EF3104FB4CEF0849B7FB804F983_Func_(out int Out_GroupID, out int Out_GroupThreadID);
void GetFloatValue_Emitter_Grid2D_AttributeRealPart(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void GetFloatValue_Emitter_Grid2D_AttributeImaginaryPart(int In_InstanceData, int In_IndexX, int In_IndexY, out float Out_Value);
void YASC45FFTCAF4FFA7530A4BF228D34EEC148181FEF2FF7C00Emitter_Grid2D_Func_(int In_ScanlineIdx, int In_ThreadIdx, int In_NumCellsX, int In_NumCellsY, inout FSimulationContext Context);
void ScratchModule001_Emitter_Func_(inout FSimulationContext Context);
int Ny =  In_NumCellsY;
    UNROLL for (int r = 0, j = In_ThreadIdx ; r < RADIX; ++r, j+= NumCols)
        int2 GridIdx = int2(In_ScanlineIdx, j);
        GetFloatValue_Emitter_Grid2D_AttributeRealPart(0, GridIdx.x, GridIdx.y,      V[r].x);
        GetFloatValue_Emitter_Grid2D_AttributeImaginaryPart(0, GridIdx.x, GridIdx.y, V[r].y);
        float Theta = FFTsgn * TwoPi * float( In_ThreadIdx % NumCols) / float(Ny);
    int2 GridIdx = int2(In_ScanlineIdx, j);
int ThreadGroupInfoBD2F6592D66A1EF3104FB4CEF0849B7FB804F983_Func_Output_GroupID;
int ThreadGroupInfoBD2F6592D66A1EF3104FB4CEF0849B7FB804F983_Func_Output_GroupThreadID;
ThreadGroupInfoBD2F6592D66A1EF3104FB4CEF0849B7FB804F983_Func_(ThreadGroupInfoBD2F6592D66A1EF3104FB4CEF0849B7FB804F983_Func_Output_GroupID, ThreadGroupInfoBD2F6592D66A1EF3104FB4CEF0849B7FB804F983_Func_Output_GroupThreadID);
YASC45FFTCAF4FFA7530A4BF228D34EEC148181FEF2FF7C00Emitter_Grid2D_Func_(ThreadGroupInfoBD2F6592D66A1EF3104FB4CEF0849B7FB804F983_Func_Output_GroupID, ThreadGroupInfoBD2F6592D66A1EF3104FB4CEF0849B7FB804F983_Func_Output_GroupThreadID, GetNumCells_Emitter_Grid2DOutput_NumCellsX, GetNumCells_Emitter_Grid2DOutput_NumCellsY, Context);
EnterStatScope(1 /**ScratchModule001_Emitter_Func_*/);
ScratchModule001_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule001_Emitter_Func_*/);
float Emitter_TilingAmount;
float2 Emitter_Grid2D_SetResolution_WorldGridExtents;
int Emitter_NumGridCellsX;
int Emitter_NumGridCellsY;
float Value;
int NumCellsX;
int NumCellsY;
float2 WorldGridSize;
float2 A;
float2 B;
float2 WorldGridExtents;
FParamMap0_Emitter_Grid2D_SetResolution Grid2D_SetResolution;
int NumGridCellsX;
int NumGridCellsY;
float TilingAmount;
FParamMap0_Multiply_Vector2D Multiply_Vector2D;
FParamMap0_ScratchModule003 ScratchModule003;
FParamMap0_Vector2DFromFloat Vector2DFromFloat;
void Vector2DFromFloat_Emitter_Func_(out float2 Out_Vec2, inout FSimulationContext Context);
void Multiply_Vector2D_Emitter_Func_(out float2 Out_Result, inout FSimulationContext Context);
void CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_(out int Out_IndexX, out int Out_IndexY, out int Out_LinearIndex);
void SetVertexData_Emitter_GridMesh_UEImpureCall(int In_InstanceData, bool In_Execute, int In_VertexIndex, float3 In_Position, float3 In_TangentX, float3 In_TangentY, float3 In_TangentZ, float2 In_TexCoord, float4 In_Color);
void ScratchModule003_Emitter_Func_(inout FSimulationContext Context);
float2 Output1;
Output1.x = Context.Map.Vector2DFromFloat.Value;
Output1.y = Context.Map.Vector2DFromFloat.Value;
Out_Vec2 = Output1;
float2 Result = Context.Map.Multiply_Vector2D.A * Context.Map.Multiply_Vector2D.B;
Out_Result = Result;
Out_IndexX = GDispatchThreadId.x;
Out_IndexY = GDispatchThreadId.y;
Out_LinearIndex = GLinearThreadId;
bool Constant = true;
int CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_IndexX;
int CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_IndexY;
int CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_LinearIndex;
CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_(CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_IndexX, CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_IndexY, CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_LinearIndex);
float Result1 = ((float)CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_IndexX) / ((float)Context.Map.ScratchModule003.NumCellsX);
float Constant1 = 0.5;
float Result2 = Result1 - Constant1;
float Result3 = ((float)CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_IndexY) / ((float)Context.Map.ScratchModule003.NumCellsY);
float Constant2 = 0.5;
float Result4 = Result3 - Constant2;
float2 Output11;
Output11.x = Result2;
Output11.y = Result4;
float2 Result5 = Output11 * Context.Map.ScratchModule003.WorldGridSize;
float3 Output12;
Output12.x = Result5.x;
Output12.y = Result5.y;
Output12.z = Constant3;
float3 Constant4 = float3(1,0,0);
float3 Constant5 = float3(0,1,0);
float3 Constant6 = float3(0,0,1);
float2 Output13;
Output13.x = Result1;
Output13.y = Result3;
float4 Constant7 = float4(1,1,1,1);
SetVertexData_Emitter_GridMesh_UEImpureCall(0, Constant, CustomHlslD63F82B4177B7C888E110A312273247A042EA8FF_Func_Output_LinearIndex, Output12, Constant4, Constant5, Constant6, Output13, Constant7);
Context.Map.Vector2DFromFloat.Value = Context.Map.Emitter.TilingAmount;
float2 Vector2DFromFloat_Emitter_Func_Output_Vec2;
Vector2DFromFloat_Emitter_Func_(Vector2DFromFloat_Emitter_Func_Output_Vec2, Context);
Context.Map.Multiply_Vector2D.A = Context.Map.Emitter.Grid2D_SetResolution.WorldGridExtents;
Context.Map.Multiply_Vector2D.B = Vector2DFromFloat_Emitter_Func_Output_Vec2;
float2 Multiply_Vector2D_Emitter_Func_Output_Result;
Multiply_Vector2D_Emitter_Func_(Multiply_Vector2D_Emitter_Func_Output_Result, Context);
Context.Map.ScratchModule003.NumCellsX = Context.Map.Emitter.NumGridCellsX;
Context.Map.ScratchModule003.NumCellsY = Context.Map.Emitter.NumGridCellsY;
Context.Map.ScratchModule003.WorldGridSize = Multiply_Vector2D_Emitter_Func_Output_Result;
EnterStatScope(1 /**ScratchModule003_Emitter_Func_*/);
ScratchModule003_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule003_Emitter_Func_*/);
Context.Map.Emitter.TilingAmount = Emitter_TilingAmount;
Context.Map.Emitter.Grid2D_SetResolution.WorldGridExtents = Emitter_Grid2D_SetResolution_WorldGridExtents;
Context.Map.Emitter.NumGridCellsX = Emitter_NumGridCellsX;
Context.Map.Emitter.NumGridCellsY = Emitter_NumGridCellsY;
int Emitter_NumVerticesX;
int NumVerticesX;
FParamMap0_ScratchModule002 ScratchModule002;
void CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_(out int Out_IndexX, out int Out_IndexY, out int Out_LinearIndex);
void CustomHlsl00189A1996DC532811D02D331EAE818619FFCB84CB0_Func_(int In_IndexX, int In_IndexY, int In_NumCellsX, out int Out_LinearIndex);
void CustomHlsl00147206927D535FEEB64EE9FBEE8C983448F5D9F2A_Func_(int In_IndexX, int In_IndexY, int In_NumCellsX, out int Out_LinearIndex);
void CustomHlsl001553F8BB25790B7A2BD5401127C0E7B7ED650B4CA_Func_(int In_IndexX, int In_IndexY, int In_NumCellsX, out int Out_LinearIndex);
void SetTriangleVertices_Emitter_GridMesh_UEImpureCall(int In_InstanceData, bool In_Execute, int In_TriangleIndex, int In_Index0, int In_Index1, int In_Index2);
void CustomHlsl0016BDA0D5E6DAB8F976F1530593DBAE6D24B87EAE0_Func_(int In_IndexX, int In_IndexY, int In_NumCellsX, out int Out_LinearIndex);
void ScratchModule002_Emitter_Func_(inout FSimulationContext Context);
Out_LinearIndex = In_IndexX + In_IndexY * In_NumCellsX;
int Constant = 0;
bool Constant1 = true;
int Result = ExecIndex();
int Constant2 = 2;
int Result1 = Result * Constant2;
int CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexX;
int CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexY;
int CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_LinearIndex;
CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_(CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexX, CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexY, CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_LinearIndex);
int Constant3 = 1;
int Result2 = CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexX + Constant3;
int Constant4 = 1;
int Result3 = CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexY + Constant4;
int CustomHlsl00189A1996DC532811D02D331EAE818619FFCB84CB0_Func_Output_LinearIndex;
CustomHlsl00189A1996DC532811D02D331EAE818619FFCB84CB0_Func_(Result2, Result3, Context.Map.ScratchModule002.NumVerticesX, CustomHlsl00189A1996DC532811D02D331EAE818619FFCB84CB0_Func_Output_LinearIndex);
int CustomHlsl00147206927D535FEEB64EE9FBEE8C983448F5D9F2A_Func_Output_LinearIndex;
CustomHlsl00147206927D535FEEB64EE9FBEE8C983448F5D9F2A_Func_(Result2, CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexY, Context.Map.ScratchModule002.NumVerticesX, CustomHlsl00147206927D535FEEB64EE9FBEE8C983448F5D9F2A_Func_Output_LinearIndex);
int CustomHlsl001553F8BB25790B7A2BD5401127C0E7B7ED650B4CA_Func_Output_LinearIndex;
CustomHlsl001553F8BB25790B7A2BD5401127C0E7B7ED650B4CA_Func_(CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexX, CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexY, Context.Map.ScratchModule002.NumVerticesX, CustomHlsl001553F8BB25790B7A2BD5401127C0E7B7ED650B4CA_Func_Output_LinearIndex);
SetTriangleVertices_Emitter_GridMesh_UEImpureCall(0, Constant1, Result1, CustomHlsl00189A1996DC532811D02D331EAE818619FFCB84CB0_Func_Output_LinearIndex, CustomHlsl00147206927D535FEEB64EE9FBEE8C983448F5D9F2A_Func_Output_LinearIndex, CustomHlsl001553F8BB25790B7A2BD5401127C0E7B7ED650B4CA_Func_Output_LinearIndex);
bool Constant5 = true;
int Constant6 = 1;
int Result4 = Result1 + Constant6;
int CustomHlsl0016BDA0D5E6DAB8F976F1530593DBAE6D24B87EAE0_Func_Output_LinearIndex;
CustomHlsl0016BDA0D5E6DAB8F976F1530593DBAE6D24B87EAE0_Func_(CustomHlsl20CCA8216FE0967F3C292E92711643E32C670466_Func_Output_IndexX, Result3, Context.Map.ScratchModule002.NumVerticesX, CustomHlsl0016BDA0D5E6DAB8F976F1530593DBAE6D24B87EAE0_Func_Output_LinearIndex);
SetTriangleVertices_Emitter_GridMesh_UEImpureCall(0, Constant5, Result4, CustomHlsl001553F8BB25790B7A2BD5401127C0E7B7ED650B4CA_Func_Output_LinearIndex, CustomHlsl0016BDA0D5E6DAB8F976F1530593DBAE6D24B87EAE0_Func_Output_LinearIndex, CustomHlsl00189A1996DC532811D02D331EAE818619FFCB84CB0_Func_Output_LinearIndex);
Context.Map.ScratchModule002.NumVerticesX = Context.Map.Emitter.NumVerticesX;
EnterStatScope(1 /**ScratchModule002_Emitter_Func_*/);
ScratchModule002_Emitter_Func_(Context);
ExitStatScope(/**ScratchModule002_Emitter_Func_*/);
Context.Map.Emitter.NumVerticesX = Emitter_NumVerticesX;
int Engine_ExecutionCount;
float Emitter_SpawnRate;
float Emitter_SpawnInterval;
float Emitter_InterpSpawnStartDt;
int Emitter_SpawnGroup;
float PREV_Engine_WorldDeltaTime;
float PREV_Engine_DeltaTime;
float PREV_Engine_InverseDeltaTime;
float PREV_Engine_Time;
float PREV_Engine_RealTime;
int PREV_Engine_QualityLevel;
int PREV_Engine_PaddingInt32_0;
int PREV_Engine_PaddingInt32_1;
float PREV_Engine_Owner_TimeSinceRendered;
float PREV_Engine_Owner_LODDistance;
float PREV_Engine_Owner_LODDistanceFraction;
float PREV_Engine_System_Age;
int PREV_Engine_Owner_ExecutionState;
int PREV_Engine_System_TickCount;
int PREV_Engine_System_NumEmitters;
int PREV_Engine_System_NumEmittersAlive;
int PREV_Engine_System_SignificanceIndex;
int PREV_Engine_System_RandomSeed;
int PREV_Engine_System_CurrentTimeStep;
int PREV_Engine_System_NumTimeSteps;
float PREV_Engine_System_TimeStepFraction;
int PREV_Engine_System_NumParticles;
int PREV_Engine_System_PaddingInt32_0;
int PREV_Engine_System_PaddingInt32_1;
float4x4 PREV_Engine_Owner_SystemLocalToWorld;
float4x4 PREV_Engine_Owner_SystemWorldToLocal;
float4x4 PREV_Engine_Owner_SystemLocalToWorldTransposed;
float4x4 PREV_Engine_Owner_SystemWorldToLocalTransposed;
float4x4 PREV_Engine_Owner_SystemLocalToWorldNoScale;
float4x4 PREV_Engine_Owner_SystemWorldToLocalNoScale;
float4 PREV_Engine_Owner_Rotation;
float3 PREV_Engine_Owner_Position;
int PREV_Engine_Owner_PaddingInt32_0;
float3 PREV_Engine_Owner_Velocity;
int PREV_Engine_Owner_PaddingInt32_1;
float3 PREV_Engine_Owner_SystemXAxis;
int PREV_Engine_Owner_PaddingInt32_2;
float3 PREV_Engine_Owner_SystemYAxis;
int PREV_Engine_Owner_PaddingInt32_3;
float3 PREV_Engine_Owner_SystemZAxis;
int PREV_Engine_Owner_PaddingInt32_4;
float3 PREV_Engine_Owner_Scale;
int PREV_Engine_Owner_PaddingInt32_5;
float4 PREV_Engine_Owner_LWCTile;
int PREV_Engine_Emitter_NumParticles;
int PREV_Engine_Emitter_TotalSpawnedParticles;
float PREV_Engine_Emitter_SpawnCountScale;
float PREV_Emitter_Age;
int PREV_Emitter_RandomSeed;
int PREV_Engine_Emitter_InstanceSeed;
int PREV_Engine_Emitter_PaddingInt32_0;
int PREV_Engine_Emitter_PaddingInt32_1;
int PREV_Engine_ExecutionCount;
float PREV_Emitter_SpawnRate;
float PREV_Emitter_SpawnInterval;
float PREV_Emitter_InterpSpawnStartDt;
int PREV_Emitter_SpawnGroup;
int InterpSpawn_Index;
float InterpSpawn_InvSpawnTime;
float InterpSpawn_InvUpdateTime;
float InterpSpawn_SpawnTime;
float InterpSpawn_UpdateTime;
float SpawnInterp;
int ExecutionCount;
float InterpSpawnStartDt;
int SpawnGroup;
float SpawnInterval;
float SpawnRate;
FParamMap0_Interpolation Interpolation;
FParamMap0 MapSpawn;
FParamMap0 MapUpdate;
return HackSpawnInterp;
int InterpSpawn_Index = ExecIndex();
float InterpSpawn_SpawnTime = Emitter_InterpSpawnStartDt + (Emitter_SpawnInterval * InterpSpawn_Index);
float InterpSpawn_UpdateTime = Engine_DeltaTime - InterpSpawn_SpawnTime;
float InterpSpawn_InvSpawnTime = 1.0 / InterpSpawn_SpawnTime;
float InterpSpawn_InvUpdateTime = 1.0 / InterpSpawn_UpdateTime;
float SpawnInterp = InterpSpawn_SpawnTime * Engine_InverseDeltaTime ;
HackSpawnInterp = SpawnInterp;
Context.MapSpawn.Interpolation.InterpSpawn_Index = InterpSpawn_Index;
Context.MapSpawn.Interpolation.InterpSpawn_SpawnTime = InterpSpawn_SpawnTime;
Context.MapSpawn.Interpolation.InterpSpawn_UpdateTime = InterpSpawn_UpdateTime;
Context.MapSpawn.Interpolation.InterpSpawn_InvSpawnTime = InterpSpawn_InvSpawnTime;
Context.MapSpawn.Interpolation.InterpSpawn_InvUpdateTime = InterpSpawn_InvUpdateTime;
Context.MapSpawn.Interpolation.SpawnInterp = SpawnInterp;
Context.MapSpawn.Interpolation.Emitter_SpawnInterval = Emitter_SpawnInterval;
Context.MapSpawn.Interpolation.Emitter_InterpSpawnStartDt = Emitter_InterpSpawnStartDt;
Context.MapSpawn.Interpolation.Emitter_SpawnGroup = Emitter_SpawnGroup;
Context.MapSpawn.Engine.Time = lerp(PREV_Engine_Time, Engine_Time, SpawnInterp);
Context.MapSpawn.Engine.RealTime = lerp(PREV_Engine_RealTime, Engine_RealTime, SpawnInterp);
Context.MapSpawn.Engine.Owner.TimeSinceRendered = lerp(PREV_Engine_Owner_TimeSinceRendered, Engine_Owner_TimeSinceRendered, SpawnInterp);
Context.MapSpawn.Engine.Owner.LODDistance = lerp(PREV_Engine_Owner_LODDistance, Engine_Owner_LODDistance, SpawnInterp);
Context.MapSpawn.Engine.Owner.LODDistanceFraction = lerp(PREV_Engine_Owner_LODDistanceFraction, Engine_Owner_LODDistanceFraction, SpawnInterp);
Context.MapSpawn.Engine.System.Age = lerp(PREV_Engine_System_Age, Engine_System_Age, SpawnInterp);
Context.MapSpawn.Engine.Owner.Rotation = NiagaraQuatSLerp(PREV_Engine_Owner_Rotation, Engine_Owner_Rotation, SpawnInterp);
Context.MapSpawn.Engine.Owner.Position = lerp(PREV_Engine_Owner_Position, Engine_Owner_Position, SpawnInterp);
Context.MapSpawn.Engine.Owner.Velocity = lerp(PREV_Engine_Owner_Velocity, Engine_Owner_Velocity, SpawnInterp);
Context.MapSpawn.Engine.Owner.SystemXAxis = lerp(PREV_Engine_Owner_SystemXAxis, Engine_Owner_SystemXAxis, SpawnInterp);
Context.MapSpawn.Engine.Owner.SystemYAxis = lerp(PREV_Engine_Owner_SystemYAxis, Engine_Owner_SystemYAxis, SpawnInterp);
Context.MapSpawn.Engine.Owner.SystemZAxis = lerp(PREV_Engine_Owner_SystemZAxis, Engine_Owner_SystemZAxis, SpawnInterp);
Context.MapSpawn.Engine.Owner.Scale = lerp(PREV_Engine_Owner_Scale, Engine_Owner_Scale, SpawnInterp);
Context.MapSpawn.Engine.Owner.LWCTile = lerp(PREV_Engine_Owner_LWCTile, Engine_Owner_LWCTile, SpawnInterp);
Context.MapSpawn.Emitter.Age = lerp(PREV_Emitter_Age, Emitter_Age, SpawnInterp);
Context.MapUpdate.Engine.DeltaTime = InterpSpawn_UpdateTime;
Context.MapUpdate.Engine.InverseDeltaTime = InterpSpawn_InvUpdateTime;
//Begin Interpolated Spawn Script!
//End Spawn Script!
//Handle resetting previous values at the end of spawn so that they match outputs! (Needed for motion blur/etc)
HandlePreviousValuesForSpawn(Context);
// Begin HandleMissingDefaultValues
// End HandleMissingDefaultValues
//Begin Update Script!
RandomCounterDeterministic = 0;
//End Update Script!
EnterStatScope(1 /**SpawnScript_Main*/);
Context.MapSpawn.Particles.UniqueID = 0;
Context.MapSpawn.Particles.UniqueID = Engine_Emitter_TotalSpawnedParticles + ExecIndex();
Context.MapUpdate.Engine.Time = Engine_Time;
Context.MapUpdate.Engine.WorldDeltaTime = Engine_WorldDeltaTime;
Context.MapUpdate.Engine.DeltaTime = Engine_DeltaTime;
Context.MapUpdate.Engine.InverseDeltaTime = Engine_InverseDeltaTime;
Context.MapUpdate.Engine.ExecutionCount = Engine_ExecutionCount;
Context.MapUpdate.Emitter.SpawnRate = Emitter_SpawnRate;
Context.MapUpdate.Emitter.SpawnInterval = Emitter_SpawnInterval;
Context.MapUpdate.Emitter.InterpSpawnStartDt = Emitter_InterpSpawnStartDt;
Context.MapUpdate.Emitter.SpawnGroup = Emitter_SpawnGroup;
Context.MapUpdate.Engine.Emitter.TotalSpawnedParticles = Engine_Emitter_TotalSpawnedParticles;
Context.MapUpdate.Emitter.RandomSeed = Emitter_RandomSeed;
Context.MapUpdate.Engine.Emitter.InstanceSeed = Engine_Emitter_InstanceSeed;
Context.MapUpdate.Engine.System.RandomSeed = Engine_System_RandomSeed;
InterpolateParameters(Context);
Context.MapSpawn.Engine.ExecIndex = ExecIndex();
Context.MapSpawn.Engine.Emitter.ID.ID = 0;
EnterStatScope(2 /**SpawnScript_MapSpawnMain*/);
SimulateMapSpawn(Context);
ExitStatScope(/**SpawnScript_MapSpawnMain*/);
//Begin Transfer of Attributes!
Context.MapUpdate.Particles = Context.MapSpawn.Particles;
//End Transfer of Attributes!
Context.MapUpdate.Engine.ExecIndex = ExecIndex();
Context.MapUpdate.Engine.Emitter.ID.ID = 0;
EnterStatScope(3 /**SpawnScript_MapUpdateMain*/);
SimulateMapUpdate(Context);
ExitStatScope(/**SpawnScript_MapUpdateMain*/);
OutputDataInt(0, 0, TmpWriteIndex, Context.MapUpdate.Particles.UniqueID);
ExitStatScope(/**SpawnScript_Main*/);
EnterStatScope(0 /**UpdateScript*/);
ExitStatScope(/**UpdateScript*/);
EnterStatScope(1 /**UpdateScript_Main*/);
Context.Map.Particles.UniqueID = InputDataInt(0, 0);
Context.Map.Array.UniqueID = 0;
EnterStatScope(2 /**UpdateScript_MapMain*/);
ExitStatScope(/**UpdateScript_MapMain*/);
ExitStatScope(/**UpdateScript_Main*/);
Í‰;zIµÀ#gÇ|
hf˝@?O;B¶V˙
cˇã;J¡F•f
ıHyßMí;(Ï•F›ﬂ]
¡É*ûóˆ•Ä.;ƒ—

