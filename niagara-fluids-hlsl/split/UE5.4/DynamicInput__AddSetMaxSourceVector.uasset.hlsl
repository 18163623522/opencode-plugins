float Alen2 = A.x*A.x + A.y*A.y + A.z*A.z;
Result = (sqrt(Alen2) > Threshold) ? A : Fallback;
float Blen2 = B.x*B.x + B.y*B.y + B.z*B.z;
Result = (Alen2 > Blen2) ? A : B;

