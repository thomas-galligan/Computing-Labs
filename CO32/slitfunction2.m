function [ s2 ] = slitfunction2( x )
%wider slit (twice the width of original)
s2 = heaviside(x+10)-heaviside(x-10);

end

