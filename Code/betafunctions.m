%betafunctions
beta(1)=0.5*exp(-(V-Vt-10)/40);                     %potassium (n)
    beta(2)=(0.28*(V-Vt-40))/(exp((V-Vt-40)/5)-1);      %sodium (m)
    beta(3)=4/(1+exp(-(V-Vt-40)/5));                    %leaking channel (h)
    