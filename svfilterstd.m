function b = svfilterstd(y, F)
% Silence - Voiced filter: Returns vector of boundaries using standard distribution normalization
%Inputs:    y: Audio signal to find boundaries
%           F: Sampling frequency

flen = 10;  % frame length in ms
cond = 20;  % minimum length (frames) for a span to be silence span
E0 = 0.4;   % threshold for standard distribution normalization

senergy = seframes(y,F,flen);       % find short-time energy of input signal
nsenergy = stdnormalize(senergy);   % normalize short-time energy using standard distribution
vb = svboundaries(nsenergy, E0);    % find silence - voiced boundaries
b = vbfilter(vb, cond);             % filter out virtual boundaries
end