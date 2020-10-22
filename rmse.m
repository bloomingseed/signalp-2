function val=rmse(x,y)
% Tra ve sai so giua hai tin hieu
N=length(y);
diff=x-y;
val=sqrt(sum(diff.*diff)/N);
end

    
    