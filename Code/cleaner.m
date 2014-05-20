%to remove the issue of one spike getting 2 positions in the y_plot, makes
%this smaller
function [new_y]=cleaner(y_plot,runtime)
binwidth=1; %how many ms are you looking at

bb=runtime/binwidth;
a=floor(length(y_plot)/bb);
new_y=zeros(1,bb);
for k=0:(bb-1);
    if k==0
    new_y(k+1)=sum(y_plot(1:a));
    else
        new_y(k+1)=sum(y_plot((k*a):((k+1)*a)));
    end
end
new_y(new_y==2)=1;
end