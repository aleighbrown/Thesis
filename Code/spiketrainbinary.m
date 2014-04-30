%creating a binary vector of spikes
spiketrain=zeros(1,length(x_plot));
%putting a one in every bin where  spiketimelocator found a local
%maxima(spike)
spiketrain(1,(maxtab(:,1)))=1;
