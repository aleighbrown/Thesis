%Maximal conductances kd,na,leak,m-current mS/cm^2 
g(1)=6; g(2)=56; g(3)=(0.0205); %g(4)=0.075;
%gmax for the slow Tcurrent (mS/cm2) 
gCav3_3bar = 0.08; 
%gmax for the r-current ms/cm2
gCav2_3= 0.12;
%gmax for the fast Tcurrent (mS/cm2) 
gCav3_1bar = 0.08; 
%reversal potentials K,Na,Leak,M-current(same as K) mV
E(1)=-90; E(2)=50; E(3)=-70.3; 
%Initialization of some variables
I_ext=0; 
V=-65; % 
x=[0.0082,0.0022,0.9996]; 

t_rec=0; 
Vt=-56.2; 

m=0.0474; %probability of open M channels at resting potential of -65
%fast t-type calcium channels
mt=0.0208; % mt=mInf at resting voltage
ht=0.2548; % ht=hInf at resting voltage
%r-type calcium
mr=0.0101; %mr=mrInf at resting voltage
hr=0.1244; %mh=mhInf at -65 mV
%slow t-type calcium channels
mtslow=0.0137;
htslow=0.1508;



%time step
ts=1;


