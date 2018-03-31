%CO24: Chaos
%Tom Galligan
%University of Oxford - HT17




%enter input values
y1= input('Enter y1(0): ');
y2 = input('Enter y2(0): ');
y3 = input('Enter y3(0): ');
dt = 0.01;
r = input('Enter r: ');
n = input('Enter n: ');
a = 10;
b = 8/3;
y_0 = [y1,y2,y3];%initial conditions
t = zeros(n,1);

f_0 = [a*(y_0(2)-y_0(1)),r*y_0(1)-y_0(2)-y_0(1)*y_0(3),y_0(1)*y_0(2)-b*y_0(3)]; %find RHS of system of equations as a vector (using initial conditions)
Y_1 = zeros(n,1);
Y_2 = zeros(n,1);
Y_3 = zeros(n,1);



 for i=1:n %run algorithm using a for loop
     y_1 = y_0 + 0.5*f_0*dt;
     f_1 = [a*(y_1(2)-y_1(1)),r*y_1(1)-y_1(2)-y_1(1)*y_1(3),y_1(1)*y_1(2)-b*y_1(3)];
     y_2 = y_1 + 0.5*f_1*dt;
     f_2 = [a*(y_2(2)-y_2(1)),r*y_2(1)-y_2(2)-y_2(1)*y_2(3),y_2(1)*y_2(2)-b*y_2(3)];
     y_3 = y_2 + f_2*dt;
     f_3 = [a*(y_3(2)-y_3(1)),r*y_3(1)-y_3(2)-y_3(1)*y_3(3),y_3(1)*y_3(2)-b*y_3(3)];
     y_4 = y_0 + (1/6)*(f_0 + 2*f_1 + 2*f_2 + f_3)*dt;
     
     
     Y_1(i) = y_4(1);
     Y_2(i) = y_4(2);
     Y_3(i) = y_4(3);
     y_0 = y_4; %restart the for loop by setting the first value of the sequence equal to the last.
     t(i+1)= t(i)+dt; %move on the time counter
     
   
 end
t(n+1)=[]; %remove last entry of t


figure %plot the graphs
subplot(1,3,1)
   
    plot3(Y_2,Y_1,Y_3, 'Color','k') %plot the variables against eachother
    grid on %add a grid to the plot for easy visual analysis
    xlabel('$y_1$', 'Interpreter','latex','fontsize',20)
    ylabel('$y_2$','Interpreter','latex','fontsize',20)
    zlabel('$y_3$','Interpreter','latex','fontsize',20)
    title('$y_1$ against $y_2$ and $y_3$','Interpreter','latex','fontsize',20)
subplot(1,3,2)    
    
    plot(Y_2,Y_3,'Color','k')
    grid on %add a grid to the plot for easy visual analysis
    xlabel('$y_2$', 'Interpreter','latex','fontsize',20)
    ylabel('$y_3$','Interpreter','latex','fontsize',20)
    title('$y_2$ against $y_3$','Interpreter','latex','fontsize',20)

subplot(1,3,3)     
    plot(t,Y_1,'Color','k')
    grid on %add a grid to the plot for easy visual analysis
    xlabel('$t$', 'Interpreter','latex','fontsize',20)
    ylabel('$y_1$','Interpreter','latex','fontsize',20)
    title('$y_1$ against $t$','Interpreter','latex','fontsize',20)