%functions for the slow type t-current
mtsInf = 1 /(1+exp((V-(-42.921064))/-5.163208));
if V < -10
    mtsTau = (-0.855809 + (1.493527 * exp(-V/27.414182)));
elseif V >= -10
        mtsTau = 1.0;
end

htsInf = 1 /(1+exp((V-(-72.907420))/4.575763)) ;
htsTau = 9.987873 + (0.002883 * exp(-V/5.598574));