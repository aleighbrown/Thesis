%r-type calcium channels
mAlpha = 2.6/(1+exp((V+7)/-8)); 
mBeta = 0.18/(1+exp((V+26)/4));

hAlpha = 0.0025/(1+exp((V+32)/8)); 
hBeta = 0.19/(1+exp((V+42)/-10));