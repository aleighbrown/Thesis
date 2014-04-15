%script to find the times that spikes occur
hold on
for i=1:4
v=yoverplot(i,:); %y_plot is the vector containing all of the voltage data
delta=50; %a spike is defined as occuring when the voltage goes from -~48-+50, which delta can be pretty much any large enough number here

[maxtab, mintab]=peakdet(v, delta); %PEAKDET(V, DELTA) finds the local  maxima and minima ("peaks") in the vector V. MAXTAB and MINTAB consists of two columns. Column 1
                                    %contains indices in V, and column 2 the found values.
                                    
                                  
spiketime=x_plot(maxtab(:,1)); 
%finding the instaneous firing rate and putting it into a vector for time
%instanfire=1000*(1./diff(spiketime)); %instantaneous firing rate is defined as the ISI *1000 for to Hz


plot(time,instanfire);
title('Instantaneous Firing Rate over Time');
xlabel('mS');
ylabel('Firing Rate in Hz');
end
