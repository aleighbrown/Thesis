%
%Integration of Hodgkin-Huxley equations with Euler method
%

clear; %when you run this through changingtau/max remove it from here
initialvals;
taumax=608;
%g(4)=0.035;
g(4)=0.075;
%g(4)=(8.4*10^-5);
%gmax for the fast Tcurrent (mS/cm2) 
gCav3_3bar = 0.01; 

for t=-30:dt:1000
    if t==20;I_ext=.1; end%do something here 1 to 7 Hz
    %if t==20;I_ext=(randi(30)/10); %do something here 1 to 7 Hz
    
   
    
    %alpha functions used by hodgkin and huxley (activation)
alphafunctions;
    %leaking channel
    %beta functions used by hodgkin and huxley (inactivation)
    betafunctions;
    %functions for the m-current
    Mcurrentfunctions;
    %t-type current
    tfastcurrent;
    
    %Tau_x and x_0 are defined with alpha and beta for Na and K
    tau=1./(alpha+beta);   %time constant
    x_0=alpha.*tau;    %steady-state equation
   
    %leaky integration with Euler method
    x=(1-dt./tau).*x+dt./tau.*x_0;
    m=(1-dt./taup).*m+dt./taup.*p;
    mt=(1-dt./mTau).*mt+dt./mTau.*mInf;
    ht=(1-dt./hTau).*ht+dt./hTau.*hInf;
    
    %calculate actual conductance using probability of opening times
    %maximum conductance
    gnmh(1)=g(1)*x(1)^4;          %potassium channels
    gnmh(2)=g(2)*x(2)^3*x(3);     %sodium channels
    gnmh(3)=g(3);               %leak
    Mcur=g(4)*m;  %conductance max of M-channels times probability ala Yamada
    Tcur = gCav3_3bar*mt*ht;
   
    %leaking channels
    %Ohm's law
    I=(gnmh.*(E-V));
    Im=(Mcur*(-90-V));%E of K -90
    It=(gCav3_3bar*(30-V));%ECa for this is 30 mV
    %update voltage of membrane
    V=V+dt*(I_ext+(sum(I)+It));
    %record some variables for plotting after equilibration
    if t>=0;
        t_rec=t_rec+1;
        x_plot(t_rec)=t;
        y_plot(t_rec)=V;
        I_plot(t_rec,:)=I;
        Im_plot(t_rec)=Im;
        It_plot(t_rec)=It;
        Iextplot(t_rec)=I_ext;
    end
    end %time loop




hold on
plot(x_plot,y_plot); xlabel('Time (mSec)');ylabel('Voltage(mV)');

