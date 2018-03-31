function [ X ] = DFT( x )
%takes an input array x and outputs the DFT if the array, given by X.
%Tom Galligan
M=length(x);
for k=-M/2:(M/2)-1
    X(k+(M/2)+1)=0;
    for n=0:M-1
        X(k+(M/2)+1)=X(k+(M/2)+1)+x(n+1).*exp(-1i.*2.*pi.*(n-1).*(k-1)./M);
    end
end


end

