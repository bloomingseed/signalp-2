function [ ek ] = seframes(y, F, flen)
% Short-time Energy frames from y and F, where
%   y: input signal
%   F: sampling rate
%   flen: frame length
%   ek: vector of energy in each frame

N=length(y);             % length of y (samples)
alen = N*1000/F;         % audio length (milliseconds)

frames = ceil(alen/flen);   % number of frames
elms = flen*F/1000;         % number of samples in each frame

ek=zeros(frames,1);         % initializing ek

for k=1:frames
    rightB = k*elms;
    leftB = rightB-elms+1;
    if(rightB>N)
        rightB=N;
    end
    ek(k) = log(sum(y(leftB:rightB).^2))/log(10);    % tinh nang luong cua frame[k] theo CT
end

