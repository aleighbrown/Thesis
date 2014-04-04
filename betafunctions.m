%betafunctions
%leaking channel
    %beta functions used by hodgkin and huxley (inactivation)
    beta(1)=0.5*(exp(-(V-Vt-10)/4));
    beta(2)=(0.28)*(V-Vt-40)/(exp((V-Vt-40)/5)-1);
    beta(3)=(4)/(1+exp(-(V-Vt-40)/5));