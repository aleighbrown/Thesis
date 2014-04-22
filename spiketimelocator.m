%script to find the times that spikes occur


v=y_plot; %y_plot is the vector containing all of the voltage data
delta=50; %a spike is defined as occuring when the voltage goes from -~48-+50, which delta can be pretty much any large enough number here

[maxtab, mintab]=peakdet(v, delta); %PEAKDET(V, DELTA) finds the local  maxima and minima ("peaks") in the vector V. MAXTAB and MINTAB consists of two columns. Column 1
                                    %contains indices in V, and column 2 the found values.
                                    
                                  
spiketime=x_plot(maxtab(:,1)); 
