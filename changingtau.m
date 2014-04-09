clear;
taumax=608;

for i=1:4
workingmodel;
yoverplot(i,:)=y_plot;
overplot(i,:)=Im_plot;
taumax=taumax+500;
end
