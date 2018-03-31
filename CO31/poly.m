function [ I ] = poly( x )
%This function represents the polynomial to be used in the calculation of
%the pressure-density gradient of a relativistic Fermi free electron gas.

I = (3/(2*x^4))*(x*sqrt(1+x^2)*((2/3)*x^2-1)+log(x+sqrt(x^2+1)));


end

