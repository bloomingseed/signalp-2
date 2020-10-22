function [ ek ] = seframes( powy, F)
% powy: vecto nang luong cua tin hieu
% F: tan so lay mau cua tin hieu
% ek: vecto nang luong moi frame

N=length(powy);             % so mau cua powy
alen = N*1000/F;   % chieu dai (milli giay) cua tin hieu giong noi
flen = 10;                  % frame duration of 10 ms
frames = ceil(alen/flen);   % so frame
elms = flen*F/1000;         % so phan tu trong 1 frame

ek=zeros(frames,1); % vecto `frames` so 0

for k=1:frames
    rightB = k*elms;
    leftB = rightB-elms+1;
    if(rightB>N)
        rightB=N;
    end
    ek(k) = log(sum(powy(leftB:rightB).^2));    % tinh nang luong cua frame[k] theo CT
end

