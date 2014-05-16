
binwidth=1; %how many ms are you looking at

bb=runtime/binwidth;
a=length(y_plot)/bb
z=zeros(1,bb);
for k=0:(bb-1);
    if k==0
    z(k+1)=sum(y_plot(1:a));
    else
        z(k+1)=sum(y_plot((k*a):((k+1)*a)));
    end
end
z(z==2)=1;



binwidth=12; %how many ms are you looking at

bb=runtime/binwidth;
a=length(z)/bb
w=zeros(1,bb);
for k=0:(bb-1);
    if k==0
    w(k+1)=sum(z(1:a));
    else
        w(k+1)=sum(z((k*a):((k+1)*a)));
    end
end

[r lags]=xcorr((w-mean(w)),'unbiased');
r=fftshift(r); 
plot(lags((ceil(length(lags)/2)):end),r((ceil(length(lags)/2)):end));

