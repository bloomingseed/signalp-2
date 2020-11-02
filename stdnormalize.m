function [Y] = stdnormalize(X)
% Normalize X to standard distribution
xtb = mean(X); 
devi = std(X);  % standard deviation
Y=(X-xtb)/devi;

end

