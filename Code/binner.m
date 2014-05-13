
binwidth=500; %how many ms are you looking at

bb=runtime/binwidth;
a=length(binplot)/bb
z=zeros(1,bb);
for k=0:(bb-1);
    if k==0
    z(k+1)=sum(binplot(1:a));
    else
        z(k+1)=sum(binplot(k*a:(k+1)*a));
    end
end

