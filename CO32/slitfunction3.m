function [ s3 ] = slitfunction3( x )
%New slit function - wider slit as in sf2 but half the height
s3 = 0.5*heaviside(x+10)-0.5*heaviside(x-10);
end

