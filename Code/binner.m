function [r la]=binner(binwidth, new_y, runtime)
% bin width is how many ms how many ms are you looking at


lags=floor(runtime/binwidth);
news=sum(reshape(new_y,binwidth,lags));

[r la]=xcorr((news-mean(news)),'unbiased');
q=fftshift(r); 
figure;
zerospot=ceil(length(la)/2);
plot(la(zerospot:end),q(zerospot:end)); xlabel('Time lags bins of 10 ms');ylabel('ACF');
end

