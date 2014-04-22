% init params
nLags = 20; % number of lags
% estimate autocorrelation function
autoCorrCoeff = zeros(1,nLags);
for ii=1:nLags % get correlation between days of distance ii
 autoCorrCoeff(ii) = corr(y_plot(1:end-ii),y_plot(ii+1:end));
end
% plot estimated autocorrelation function
close
figure('position',[50 50 1200 600])
subplot(1,2,1)
stem(1:nLags,autoCorrCoeff,'r.','MarkerSize',12)
set(gca,'yLim',[-0.2 1]);
set(gca,'xGrid','on','yGrid','on')
% plot autocorrelation using existing MATLAB function
subplot(1,2,2)
autocorr(DAX.logRet)