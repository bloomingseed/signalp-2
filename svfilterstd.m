function b = svfilterstd(y, F, threshold)
% Silence - Voiced filter
% Returns vector of boundaries using standard distribution normalization
% TODO: modify this to take in only [y, F]
%   senergy: short-time energy vector
%   threshold: threshold to voiced-silence separation

flen = 10;  % frame length in ms
cond = 20;  % minimum length (frames) for a span to be silence span

senergy = seframes(y,F,flen);       % find short-time energy of input signal
nsenergy = stdnormalize(senergy);   % normalize short-time energy using standard distribution
vb = svboundaries(nsenergy, threshold); % find silence - voiced boundaries
b = vbfilter(vb, cond);             % filter out virtual boundaries
end

