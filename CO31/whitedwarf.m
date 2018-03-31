%Determining the structure of white dwarf stars by numerically solving
%hydrostatic equilibrium equations, balancing gravitational forces with
%electron degeneracy pressure.
%Tom Galligan
%MT16
%University of Oxford

h=6.63e-34; %enter planck constant
m_e = 9.11e-31; %enter rest mass of electron
m_p = 6.27e-27; %enter rest mass of proton
G = 6.67e-11; %enter Universal Gravitational Constant
dr = input('Enter dr: '); %ask user to input a value for dr
rho_c = 10^5.9; %enter start centre mass (*10^-0.1 for coding purposes - keeps the 'for' loop simple)
 %enter the starting mass using rhoc
r=dr; %initial value of radius is dr
%initial conditions
 %find RHS of system of equations as a vector (using initial conditions)
fconst = -((1/48)*((h^2)/(2*m_e))*((2^(1/3))/(m_p)^(5/3))*(3/pi)^(2/3))^(-1)*G %reduce computing time by only calculating the constant once. 

for i=1:81 
    rho_c = (10^0.1)*rho_c;
    rho_0 = rho_c;
    m_0 = ((4/3)*pi*(dr)^3)*rho_0;
    x_0 = [rho_0, m_0];
    r=dr;
    f_0 = [fconst*x_0(1)^(1/3)*x_0(2)*r^(-2), 4*pi*r^2*x_0(1)];
    %this lets us find the radius and mass using central densities ranging from 10e6 to 10e14
        while x_0(1)>=0.01*rho_c %run the algorithm in a while loop to terminate once the density is sufficiently smaller than rho_c        
              x_1 = x_0 + 0.5*f_0*dr;
              f_1 = [fconst*x_1(1)^(1/3)*x_1(2)*r^(-2), 4*pi*r^2*x_1(1)];
              x_2 = x_1 + 0.5*f_1*dr;
              f_2 = [fconst*x_2(1)^(1/3)*x_2(2)*r^(-2), 4*pi*r^2*x_2(1)];
              x_3 = x_2 + f_2*dr;
              f_3 = [fconst*x_3(1)^(1/3)*x_3(2)*r^(-2), 4*pi*r^2*x_3(1)];
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

            

