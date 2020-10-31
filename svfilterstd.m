function b = svfilterstd(senergy, cond)
% Tr? v? vector các ???ng biên ti?ng nói - kho?ng l?ng, trong ?ó
%   senergy:    vector n?ng l??ng ng?n h?n trong m?i frame tín hi?u ??u vào, chu?n hóa
%               thành phân ph?i chu?n t?c
%   felms:      ?i?u ki?n l?c biên ?o, ??n v?: frame

threshold = 0.8;    % ng??ng n?ng l??ng làm m?c
L = length(senergy);% chi?u dài c?a vector n?ng l??ng ng?n h?n

vb=[];  % l?u biên ?o và biên th?t
vb=[vb,1];   % ?ánh d?u ?i?m ??u
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
vb=[vb,L+1];  % ?ánh d?u ?i?m cu?i

b = [];
for i=1:2:length(vb)-1
   if(vb(i+1)-vb(i)>cond)
       b=[b,vb(i),vb(i+1)];
   end
end
end

