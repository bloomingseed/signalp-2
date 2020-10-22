function [Y] = datanormalize(X)
% Chuan hoa tin hieu X ve [0;1]
xmax = max(X);   
xmin = min(X);
N=length(X);
Y=zeros(1,N);
for i=1:N
    Y(i)=(X(i)-xmin)/(xmax-xmin);
end
end

