clear;
taumax=608;

for i=1:4
workingmodel;
yoverplot(i,:)=y_plot;
overplot(i,:)=Im_plot;
taumax=taumax+500;
end

vec=[];
for n=1:4
    spiketime=spiketimelocator(yoverplot(n,:),x_plot);
    instanfire=1000*(1./diff(spiketime));
    vec(:,n)=instanfire;
end