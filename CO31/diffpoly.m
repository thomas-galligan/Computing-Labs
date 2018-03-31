function [ I1 ] = diffpoly( x )
%The first derivative of the polynomial I wrt x

I1 = (4*x^2 + 6)/(2*(x^4)*sqrt(1+x^2)) - (6*log(x+sqrt(1+x^2)))/(x^5);


end

