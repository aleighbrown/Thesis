%finding the instaneous firing rate and putting it into a vector for time
figure;
spiketime=spiketimelocator(y_plot,x_plot);
instanfire=1000*(1./diff(spiketime)); %instantaneous firing rate is defined as the ISI *1000 for to Hz
time=spiketime(2:end);


plot(time,instanfire);
title('Instantaneous Firing Rate over Time');
xlabel('msec');
ylabel('Firing Rate in Hz');
