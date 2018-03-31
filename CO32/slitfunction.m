function [ s ] = slitfunction(x)
%use of heaviside step functions to construct a slit of width 10 about 0

s = heaviside(x+5)-heaviside(x-5);


end

