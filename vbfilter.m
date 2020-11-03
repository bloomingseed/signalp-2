function b = vbfilter(vb,cond)
%vbfilter: returns vector of silence - voiced boundaries with virtual
%boundaries filtered.
%Inputs:    vb: vector of boundaries including virtual boundaries
%           cond: minimum length in frames of a silence span            

b = [];
for i=1:2:length(vb)-1
   if(vb(i+1)-vb(i)>cond)
       b=[b,vb(i),vb(i+1)];
   end
end

end

