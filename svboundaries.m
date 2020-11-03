function b = svboundaries(nsenergy,E0)
%sboudnaries: return vector of silence - voiced boundaries based on the signal
%short-time energy frames
%Inputs:    nsenergy: vector of normalized short-time energy frames
%           E0: E0 used to distinguish silence or voiced

L = length(nsenergy);   % length (samples) of nsenergy vector
b=[];                   % initialize as empty vector
b=[b,1];                
t=1;                    % helper variable
if(nsenergy(1)>=E0)
    t=-1;
end
for i=2:L
    if(t*nsenergy(i)>=t*E0)  % compare each short-time energy with E0
        b=[b,i];
        t=-t;
    end
end
b=[b,L+1];  
end

