function [Y] = stdnormalize(X)
% Chuan hoa tin hieu X su dung phan phoi chuan tac
xtb = mean(X);  % gia tri trung binh cua X
devi = std(X);
Y=(X-xtb)/devi;

end

