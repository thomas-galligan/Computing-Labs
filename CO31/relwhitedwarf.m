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
G = 6.67e-11; %enter Universal Gravitational Constant
dr = input('Enter dr: '); %ask user to input a value for dr
rho_c = 10^5.9; %enter start centre mass (*10^-0.1 for coding purposes - keeps the 'for' loop simple)
 %enter the starting mass using rhoc
r=dr; %initial value of radius is dr
%initial conditions
%x_F = (3/16*pi*m_p)^(1/3) * (h/m_e*c)*x_0(1)^(1/3) %dimensionless Fermi momentum in terms of rho
%dx_F = (1/3)*(3/16*pi*m_p)^(1/3)*(h/m_e*c)*x_0(1)^(-2/3) %derivative of dimensionless Fermi momentum in terms of rho wrt rho

for i=1:81 
    rho_c = (10^0.1)*rho_c;
    rho_0 = rho_c;
    m_0 = ((4/3)*pi*(dr)^3)*rho_0;
    x_0 = [rho_0, m_0];
    r=dr;
    x_F = (3/16*pi*m_p)^(1/3) * (h/m_e*c)*x_0(1)^(1/3); %define adim fermi momentum for initial conditions
    dx_F = (1/3)*(3/16*pi*m_p)^(1/3)*(h/m_e*c)*x_0(1)^(-2/3);%derivative of adim fermi momentum for intial conditions
    f_0 = [-((((2*pi*m_e^4*c^5)/(3*h^3))*(4*x_F^3*poly(x_F) + x_F^4*diffpoly(x_F))*dx_F))^(-1)*(G*x_0(1)*x_0(2))/(r^2),4*pi*r^2*x_0(1)]; %calculate f_0
    
    %this lets us find the radius and mass using central densities ranging from 10e6 to 10e14
    
    while x_0(1)>=0.1*rho_c
   
          x_1 = x_0 + 0.5*f_0*dr;
          x_F = (3/16*pi*m_p)^(1/3) * (h/m_e*c)*x_1(1)^(1/3);
          dx_F = (1/3)*(3/16*pi*m_p)^(1/3)*(h/m_e*c)*x_1(1)^(-2/3); %redefine the fermi momentum for new values of rho
          f_1 = [-((((2*pi*m_e^4*c^5)/(3*h^3))*(4*x_F^3*poly(x_F) + x_F^4*diffpoly(x_F))*dx_F))^(-1)*(G*x_1(1)*x_1(2))/(r^2),4*pi*r^2*x_1(1)];
          x_2 = x_1 + 0.5*f_1*dr;
          x_F = (3/16*pi*m_p)^(1/3) * (h/m_e*c)*x_2(1)^(1/3);
          dx_F = (1/3)*(3/16*pi*m_p)^(1/3)*(h/m_e*c)*x_2(1)^(-2/3);
          f_2 = [-((((2*pi*m_e^4*c^5)/(3*h^3))*(4*x_F^3*poly(x_F) + x_F^4*diffpoly(x_F))*dx_F))^(-1)*(G*x_2(1)*x_2(2))/(r^2),4*pi*r^2*x_2(1)];
          x_3 = x_2 + f_2*dr;
          x_F = (3/16*pi*m_p)^(1/3) * (h/m_e*c)*x_3(1)^(1/3);
          dx_F = (1/3)*(3/16*pi*m_p)^(1/3)*(h/m_e*c)*x_3(1)^(-2/3);
          f_3 = [-((((2*pi*m_e^4*c^5)/(3*h^3))*(4*x_F^3*poly(x_F) + x_F^4*diffpoly(x_F))*dx_F))^(-1)*(G*x_3(1)*x_3(2))/(r^2),4*pi*r^2*x_3(1)];
          x_4 = x_0 + (1/6)*(f_0 + 2*f_1 + 2*f_2 + f_3)*dr;
          
           x_0 = x_4; %restart the for loop by setting the first value of the sequence equal to the last.
             
              r = r + dr; %increase r by dr
              
    end
        
%         plot(rho_c,r,'.', 'Color','k')
%         hold on
          plot(x_4(2),r,'.', 'Color','b')
          hold on
%         plot(rho_c,x_4(2),'.', 'Color','r')
%         hold on
  fprintf('Central density: %i.\n',rho_c)

  fprintf('Stellar radius: %i.\n',r)

  fprintf('Stellar mass: %i.\n',x_4(2))
     disp(' ')
     disp(' ')
end

         
       
        
        
    
    