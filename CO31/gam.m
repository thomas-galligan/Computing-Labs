function [ g ] = gam( x )
% Function for use in relwhitedwarf3
h=6.63e-34; %enter planck constant
m_e = 9.11e-31; %enter rest mass of electron
m_p = 6.27e-27;%enter rest mass of proton
c=2.9979e8;
m_S = 1.988e30;
r_S = 6.957e8;
rho_S = 1.622e5;
mu_c = (10^5.9)/rho_S;
G = 6.67e-11; %enter Universal Gravitational Constant

C_m = 4*pi*r_S^3*rho_S/m_S;
C_p = -G*m_p*m_S/(0.5*m_e*c^2*r_S);
K_F = ((3)/(16*pi*m_p))^(1/3)*h/(c*m_e);


g = (K_F^2*rho_S^(2/3)*x^(2/3))/(3*sqrt(1+K_F^2*rho_S^(2/3)*x^(2/3)));


end

