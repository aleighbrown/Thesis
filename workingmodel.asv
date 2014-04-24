%
%Integration of Hodgkin-Huxley equations with Euler method
%

clear; %when you run this through changingtau/max remove it from here
initialvals;
taumax=608;
%g(4)=0.035;
g(4)=0.075;
%g(4)=(8.4*10^-5);


for t=-30:dt:3000
    if t==20;I_ext=1; end%do something here 1 to 7 Hz
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
    %alpha and beta functions for the r-type current from Cav2_3
    rtypefunctions;
    
    %Tau_x and x_0 are defined with alpha and beta for Na and K
    tau=1./(alpha+beta);   %time constant
    x_0=alpha.*tau;    %steady-state equation
    %defining Tau and steady-state activation for r-type
    mrTau=1/(mAlpha+mBeta);
    mrInf=mAlpha*mrTau;
    hrTau=1/(hAlpha +hBeta);
    hrInf=hAlpha*hrTau;
    
   
    %leaky integration with Euler method
    x=(1-dt./tau).*x+dt./tau.*x_0;
    %integration for m-current
    m=(1-dt./taup).*m+dt./taup.*p;
    %integration for the fast-t-type current
    mt=(1-dt./mTau).*mt+dt./mTau.*mInf;
    ht=(1-dt./hTau).*ht+dt./hTau.*hInf;
    %integration for r-type current
    mr=(1-dt./mrTau).*mr+dt./mrTau.*mrInf;
    hr=(1-dt./hrTau).*hr+dt./hrTau.*hrInf;
    
    
    
    %calculate actual conductance using probability of opening times
    %maximum conductance
    gnmh(1)=g(1)*x(1)^4;          %potassium channels
    gnmh(2)=g(2)*x(2)^3*x(3);     %sodium channels
    gnmh(3)=g(3);               %leak
    
    Mcur=g(4)*m;  %conductance max of M-channels times probability ala Yamada
    Tcur = gCav3_3bar*mt*ht;%this is for the fast-t-type
    %r current regulated by CaV2.3 calcium channel
    Rcur=gCav2_3*mr*hr;
   
    %leaking channels
    %Ohm's law
    I=(gnmh.*(E-V));
    Im=(Mcur*(-90-V));%E of K -90
    It=(Tcur*(30-V));%ECa for this is 30 mV
    Ir=Rcur*(135-V);%reversal is 135 mV
    %update voltage of membrane
    V=V+dt*(I_ext+(sum(I)+Im+Ir));
    %record some variables for plotting after equilibration
    if t>=0;
        t_rec=t_rec+1;
        x_plot(t_rec)=t;
        y_plot(t_rec)=V;
        I_plot(t_rec,:)=I;
        Im_plot(t_rec)=Im;
        It_plot(t_rec)=It;
        Ir_plot(t_rec)=Ir;
        Iextplot(t_rec)=I_ext;
    end
    end %time loop




hold on
plot(x_plot,y_plot); xlabel('Time (mSec)');ylabel('Voltage(mV)');
instantfireplot;
