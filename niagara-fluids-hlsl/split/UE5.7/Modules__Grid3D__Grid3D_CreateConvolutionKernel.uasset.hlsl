(s±;”`ìCš6ÚV`6X3_
(s±;”`ìCš6ÚV`6X3^
ÑÑ6ü'É;`
    KernelArray.SetArrayElem(false, 0, 1);
    float Total = 0;
    for (int i = 0; i <= Radius; ++i)
        float Val = 1. - 1. * i/(Radius+1);
        Total += Val;
        // add negative side to total
        if (i > 0)
            Total += Val;
        KernelArray.SetArrayElem(false, i, Val / Total);
ïF«øt);0
    float Sigma = Radius;
    float TwoSigmaSquared = 2. * Sigma * Sigma;
    float Coeff = 1./sqrt(3.141569 * TwoSigmaSquared);
    float Total = 0.0;
        float Val = Coeff * exp(-1. * pow(i,2) / (TwoSigmaSquared));
        Total +=  Val;
        float Val = Coeff * exp(-1. * pow(i,2) / (TwoSigmaSquared)); 
        KernelArray.SetArrayElem(false, i, Val/Total);
    float BoxVal = 1./(2.0 * Radius + 1.0);
        KernelArray.SetArrayElem(false, i, BoxVal);
   KernelGrid.SetFloatValue<Attribute="k">(0,0,1);
    int i;
    for (i = 0; i <= Radius; ++i)
        KernelGrid.SetFloatValue<Attribute="k">(i, 0, Val/Total);
ÛN]Vùg‚Eˆ7ç×;
    KernelGrid.SetFloatValue<Attribute="k">(0,0,1);
è—1YÂ*;×÷´T
Áƒ*—ö¥€.;ÄÑ

