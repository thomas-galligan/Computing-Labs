function [ s4 ] = slitfunction4( x )
%slit function with displaced slit

s4 = heaviside(x+15)-heaviside(x+5);

end

