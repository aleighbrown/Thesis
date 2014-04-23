%autocorrelation 


A1=y_plot;
A2=A1;

for i=1:length(A2);
A2=[A2(2:end) 0];

[r p]=corrcoef(A1,A2);

autocr(i)=r(2);
end 

