% x is your signal
% numLags is the number of lags you want, e.g. 50
x = y_plot;
numLags = length(x);
x = detrend(x,0);
xmagDFT = abs(fft(x)).^2;
autocorr = ifft(xmagDFT,'symmetric');
autocorr= autocorr(1:numLags);
% normalize the autocorrelation
autocorr = autocorr./autocorr(1);
figure;
stem(autocorr);
