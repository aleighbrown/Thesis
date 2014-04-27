% x is your signal
% numLags is the number of lags you want, e.g. 50
x = (instanfire);
numLags = length(x)/2;
x = detrend(x,0);
xmagDFT = abs(fft(x)).^2;
autocorr = ifft(xmagDFT,'symmetric');
autocorr= autocorr(1:numLags);
% normalize the autocorrelation
autocorr = autocorr./autocorr(1);
figure;
stem(autocorr);

acf=xcorr(instanfire, 'Coef');
%# Keep only the positive lags
acf = acf( length(x)+1 : end );

%# Plot your result
stem(acf);


plot(autocorr)
