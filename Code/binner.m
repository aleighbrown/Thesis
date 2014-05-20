function [r la,news]=binner(binwidth, new_y, runtime)
% bin width is how many ms how many ms are you looking at


lags=floor(runtime/binwidth);
news=sum(reshape(new_y,binwidth,lags));

[r la]=xcorr((news-mean(news)),'unbiased');
r=fftshift(r); 
figure;
plot(la,r); xlabel('Time lags bins of 50 ms');ylabel('ACF');
end

