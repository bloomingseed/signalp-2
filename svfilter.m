function b = svfilter(senergy, cond, threshold)
% Silence - Voiced filter
% Returns vector of boundaries
%   senergy: short-time energy vector
%   cond: minimum length (frames) for a span to be silence span
%   threshold: threshold to voiced-silence separation

L = length(senergy);

vb=[]; 
vb=[vb,1];   
t=1;
if(senergy(1)>=threshold)
    t=-1;
end

for i=2:L
    if(t*senergy(i)>=t*threshold)
        vb=[vb,i];
        t=-t;
    end
end
vb=[vb,L+1];  

b = [];
for i=1:2:length(vb)-1
   if(vb(i+1)-vb(i)>cond)
       b=[b,vb(i),vb(i+1)];
   end
end
end

