spiketrainbinary;
Edges = (1:5000:(length(spiketrain)));
a=zeros(20,5001);
for i=1:length(Edges);
if i<21
    a(i,:)=spiketrain((Edges(i)):(Edges(i+1)));
end    
end;

for n=1:20
    if n<20
[r,p] = corrcoef(a(n,:),a(n+1,:));  % Compute sample correlation and p-values.
arc(n)=r(2);
    end
end