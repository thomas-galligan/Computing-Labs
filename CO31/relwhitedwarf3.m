%Determining the structure of white dwarf stars by numerically solving
%hydrostatic equilibrium equations, using the model of a relativistic
%free electron Fermi gas.
%Tom Galligan
%MT16
%University of Oxford

h=6.63e-34; %enter planck constant
m_e = 9.11e-31; %enter rest mass of electron
m_p = 6.27e-27;%enter rest mass of proton
c=2.9979e8;
m_S = 1.988e30;
r_S = 6.957e8;
rho_S = 1.622e5;
mu_c = (10^5.9)/rho_S;
G = 6.67e-11; %enter Universal Gravitational Constant
 dxi = input('Enter dxi: '); %ask user to input a value for dr
C_m = 4*pi*r_S^3*rho_S/m_S;
C_p = -G*m_p*m_S/(0.5*m_e*c^2*r_S);
K_F = ((3)/(16*pi*m_p))^(1/3)*h/(c*m_e);

for i=1:81
    mu_c = (10^0.1)*mu_c;
    mu_0 = mu_c;
    zeta_0 = ((4/3)*pi*(dxi)^3)*mu_0;
    x_0 = [mu_0,zeta_0];
    xi = dxi;
    f_0 = [C_m*xi^2*x_0(1),C_p*x_0(2)*x_0(1)/(xi^2*((K_F^2)*rho_S^(2/3)*x_0(1)^(2/3))/(3*sqrt(1+K_F^2*rho_S^(2/3)*x_0(1)^(2/3))))];
        %this lets us find the radius and mass using central densities ranging from 10e6 to 10e14
          while abs(x_0(1) - 0.1*mu_c) > 0.5*dxi
                x_1 = x_0 + 0.5*f_0*dxi;
                f_1 = [C_m*xi^2*x_1(1),C_p*x_1(2)*x_1(1)/(xi^2*((K_F^2)*rho_S^(2/3)*x_1(1)^(2/3))/(3*sqrt(1+K_F^2*rho_S^(2/3)*x_1(1)^(2/3))))];
                x_2 = x_1 + 0.5*f_1*dxi; 
                f_2 = [C_m*xi^2*x_2(1),C_p*x_2(2)*x_2(1)/(xi^2*((K_F^2)*rho_S^(2/3)*x_2(1)^(2/3))/(3*sqrt(1+K_F^2*rho_S^(2/3)*x_2(1)^(2/3))))];
                x_3 = x_2 + f_2*dxi;
                f_3 = [C_m*xi^2*x_3(1),C_p*x_3(2)*x_3(1)/(xi^2*((K_F^2)*rho_S^(2/3)*x_3(1)^(2/3))/(3*sqrt(1+K_F^2*rho_S^(2/3)*x_3(1)^(2/3))))];
                x_4 = x_0 + (1/6)*(f_0 + 2*f_1 + 2*f_2 + f_3)*dxi;
                
                x_0 = x_4;
                xi = xi + dxi;
                
          end
        
%         %plot(mu_c,xi,'.', 'Color','k')
% %         hold on
          plot(x_4(2),xi,'.', 'Color','b')
           hold on
% %         plot(mu_c,x_4(2),'.', 'Color','r')
% %         hold on
   fprintf('Central density: %i.\n',mu_c)
 
  fprintf('Stellar radius: %i.\n',xi)

  fprintf('Stellar mass: %i.\n',x_4(2))
     disp(' ')
     disp(' ')
     
end

            


        