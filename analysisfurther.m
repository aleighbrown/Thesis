%order of analysis
hold on
for i=1:4
v=yoverplot(i,:);
spiketimelocator;




%then instaneous firing rate
instanfire=1000*(1./diff(spiketime));
time=spiketime(2:end);
ins{i}=instanfire;
times{i}=time;

end


%then ACF
[r lags]=xcorr(y_plot,'coeff');
figure;
plot(lags((find(lags==0)):end),r(((find(lags==0)):end)),'LineWidth', 2);
title('ACF Correlogram');
xlabel('Lags');
ylabel('ACF');
