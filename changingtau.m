taumax=608;
hold on
for i=1:5
    taumax=taumax+100;
workingmodel;
yoverplot(i,:)=y_plot;
overplot(i,:)=Im_plot;
end
