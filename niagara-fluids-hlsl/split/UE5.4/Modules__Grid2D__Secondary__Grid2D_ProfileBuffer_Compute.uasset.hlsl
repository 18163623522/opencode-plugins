int d = 0;
Height = 0;
float p = (Unit.x - .5) * TileWidth - t * Velocity;
const float PI = 3.1415;
float dx = TileWidth / NumCellsX;
float MaxLambda = (TileWidth - dx) * MaxWavelengthMult;
// min wavelength roughly at the very smallest is 3 cells
float MinLambda = dx * MinWavelengthMult;
float MaxK = 2. * PI / MaxLambda;
float MinK = 2. * PI / MinLambda;
float DL = (MaxLambda - MinLambda) / NumWavelengthSamples;
float DK = (MaxK - MinK) / NumWavelengthSamples;
float Lambda = MinLambda + .5 * DL;
for (int j = 1; j <= NumWavelengthSamples; ++j) {
Lambda = (TileWidth - dx)/j;
  continue;
float k = 2. * PI / Lambda;
float freq = sqrt(g * k);
float a = .0081;
float b = .74;
float U = 200;
float w_0 = g / (1.026 * U);
//float A = a*g*g/(pow(freq,5)) * exp(-b * pow(w_0/freq,4));
//float A = (.001*a * 2 * PI * g*g) / pow(freq, 5);
float A = 1./k;
//float A = 1;//5./pow(freq,2);
float eps = rand(TileWidth, k, 0, 0);
float epsR = rand(TileWidth, k+123, 1230, 05);
// integral solution but looks bad...
// Height += AmplitudeMult * A * cos(k*(p+eps) - freq * t) * k * DK;
Height += AmplitudeMult * A * cos(k*(p+eps) - freq * t);
// #todo(dmp): add in a wave in the opposite direction?
Height += AmplitudeMult * A * cos(k*(p+epsR) + freq * t) * Slosh;
//Lambda += DL;
ProfileBuffer.SetGridValue(IndexX, IndexY, 0, Height, d);

