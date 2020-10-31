function b = svfilterstd(senergy, cond)
% Tr? v? vector c�c ???ng bi�n ti?ng n�i - kho?ng l?ng, trong ?�
%   senergy:    vector n?ng l??ng ng?n h?n trong m?i frame t�n hi?u ??u v�o, chu?n h�a
%               th�nh ph�n ph?i chu?n t?c
%   felms:      ?i?u ki?n l?c bi�n ?o, ??n v?: frame

threshold = 0.8;    % ng??ng n?ng l??ng l�m m?c
L = length(senergy);% chi?u d�i c?a vector n?ng l??ng ng?n h?n

vb=[];  % l?u bi�n ?o v� bi�n th?t
vb=[vb,1];   % ?�nh d?u ?i?m ??u
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
vb=[vb,L+1];  % ?�nh d?u ?i?m cu?i

b = [];
for i=1:2:length(vb)-1
   if(vb(i+1)-vb(i)>cond)
       b=[b,vb(i),vb(i+1)];
   end
end
end

