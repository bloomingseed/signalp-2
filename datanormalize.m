function [Y] = datanormalize(X)
% Normalize X to [0;1] value range
xmax = max(X);   
xmin = min(X);
N=length(X);
Y=zeros(1,N);
for i=1:N
    Y(i)=(X(i)-xmin)/(xmax-xmin);
end
end

