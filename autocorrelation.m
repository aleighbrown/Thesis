function autocorrelation(t,x);

%%% Compute auto-correlation function
%%% Didier Gonze
%%% Created 8/7/2007
%%% Modified 30/1/2008

clc;


% ========================================
% Read data
% ========================================

maxshift=100;      % shift max (xsc in correlation)

nmax=length(t);             % total number of points
pas=t(end)/length(t);       % time step (usually: dt=tech=0.1)
npas=round(maxshift/pas);   % number of time step (for auto-correlation)

%fprintf('   maxshift=%g \n',maxshift);
%fprintf('   nmax=%g \n',nmax);
%fprintf('   pas=%g \n',pas);
%fprintf('   npas=%g \n\n',npas);


% =================================================
% Compute and plot the auto-correlation function
% =================================================

correl=[];

a(1:npas)=0;
b(1:npas)=0;

xm=mean(x);

for i=1:nmax;
  for j=1:npas;
    if (i+j) < nmax
            a(j)=a(j)+(x(i+j)-xm)*(x(i)-xm);
            b(j)=b(j)+(x(i)-xm)*(x(i)-xm);
    end
  end
end

tt=[pas:pas:npas*pas];
cc(1:npas)=a(1:npas)./b(1:npas);


figure(1);
clf;
plot(tt,cc);
xlim([0 maxshift]);
ylim([-1 1]);
xlabel('Time shift','fontsize',16);
ylabel('Auto-correlation','fontsize',16);


% ============================================
% Compute half-life of the auto-correlation
% ============================================

nfmax=6;  % half-life estimated using the nfmax first max of the auto-correlation

ccm=[cc([2:npas]) 0];
ccp=[0 cc([1:npas-1])];

k=find(cc>ccm & cc>ccp & cc>0);
maxcc=cc(k);
maxtt=tt(k);

maxcc=[1 maxcc([2:nfmax])];
maxtt=[0 maxtt([2:nfmax])];

hold on;
plot(maxtt,maxcc,'r.')

alpha=-mean(log(maxcc(2:end))./(maxtt(2:end)));  % speed of the exp decrease of the auto-correlation

tau=log(2)/alpha;   % half-life of the auto-correlation

hold on;
xfit=[0:maxshift];
yfit=exp(-alpha*xfit);
plot(xfit,yfit,'r--')
text(maxshift-(maxshift/3),0.7,sprintf('half-life=%g \n\n',tau),'fontsize',14);

end




