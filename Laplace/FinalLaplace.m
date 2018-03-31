n = 7; %number of grid spacings
a = 2.1; %over-relaxation parameter (alpha)
psi=zeros(n,n); %initial 7x7 matrix of zeros, includes boundary conditions at x,y=0
x= [0:1/(n-1):1];
y = [0:1/(n-1):1];

for i=2:n       %boundary conditions along y=1 and x=1
    psi(1,i) = sin(x(i))*sinh(1);
    psi(2:(n-1),n) = sin(1)*sinh(y((n-1):-1:2));
end

R=zeros(n); %initialize the value of the residual
iter=1;     %initial iteration number
iterMAX=30; %max iterations
errorMAX=0.001; %condition for convergence
sample1 = zeros(1,iterMAX); %initialise vectors for sample convergence
sample2 = zeros(1,iterMAX);
sample3 = zeros(1,iterMAX);
%initialise vectors for sample convergence
while iter<iterMAX %main calculation with strict condition for stopping (max no. of iterations)
    for i=(n-1):-1:2 %sweeping right to left
       for j=2:(n-1) %sweeping up
                R(i,j) = psi(i,j+1) +psi(i,j-1) + psi(i+1,j) +psi(i-1,j)- 4*psi(i,j); %calculate residual
                psi(i,j) = psi(i,j) +a*R(i,j)/4; %perform iteration
       end
        sample1(iter)=psi(5,5); %allocate sample values to see the convergence
        sample2(iter)=psi(5,4);
        sample3(iter)=psi(5,3);
       
    end
    iter = iter+1; %update iteration number
    if abs(max(max(R))) < errorMAX %test for convergence condition. If satisfied then proceed to plotting.
        for i = 1:7 %aligns the matrix entries with their correct positions for the contour function (line 41)
            A(i,:) = psi(8-i,:); 
        end
        for i=1:7 %produce analytic result
            for j=1:7
                Z(i,j)=sin(x(i))*sinh(y(j));
            end
        end
        A=transpose(A); %make sure plots are in same orientation.
        sample1 = sample1(1:iter-1) %crop sample vectors
        sample2 = sample2(1:iter-1)
        sample3 = sample3(1:iter-1)
%         plot(sample1) %plot samples to see convergence
%         hold on
%         plot(sample2)
%         hold on
%         plot(sample3)
%         title('\textbf Sample Values ($\alpha = 2.1$)','Interpreter','latex','fontsize',20)
%         xlabel('Iteration number ($m$)','Interpreter','latex','fontsize',20)
%         ylabel('$\psi^m$','Interpreter','latex','fontsize',20)
%         hold off
        [X,Y] = meshgrid(x,y); %plot both the computed and the analytic solutions if convergence occurs. 
        %This happens if convergence condition satisfied, or max no. of steps reached
        figure
        subplot(1,2,1); contour(X,Y,A,60); xlabel('$x$','Interpreter','latex','fontsize',20);ylabel('$y$','Interpreter','latex','fontsize',20);title('\textbf Numerical Solution ($\alpha = 2.1$)','Interpreter','latex','fontsize',20);
        subplot(1,2,2); plot(sample1) %plot samples to see convergence
        hold on
        plot(sample2)
        hold on
        plot(sample3)
        title('\textbf Sample Values ($\alpha = 2.1$)','Interpreter','latex','fontsize',20)
        xlabel('Iteration number ($m$)','Interpreter','latex','fontsize',20)
        ylabel('$\psi^m$','Interpreter','latex','fontsize',20)
        hold off
        solution=A              %display the calculated solution 
        analytic_solution=Z     %display the analytic solution
        sprintf('Total number of iterations is %d', iter-1)%display the convergence iteration
        
        break %end iteration loop
        
    end
    
end