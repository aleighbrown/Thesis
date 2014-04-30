clear;

gmax=(linspace(0.025,0.075,4));

for i=1:length(gmax)
    g(4)=gmax(i);
workingmodel;
yoverplot(i,:)=y_plot;
overplot(i,:)=Im_plot;

end
