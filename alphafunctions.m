%alpha functions
%alpha functions used by hodgkin and huxley (activation)
    alpha(1)=((-0.032)*(V-Vt-15))/(exp(-(V-Vt-15)/5)-1);  %potassium channel
    alpha(2)=((-0.32)*(V-Vt-13))/(exp((-(V-Vt-13)/4))-1);  %sodium channel m
    alpha(3)=(0.128)*(exp(-(V-Vt-17)/18));