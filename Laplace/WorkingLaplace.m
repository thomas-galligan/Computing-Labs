n = 7;
a = 1.35;
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

while iter<iterMAX %main calculation
    for i=(n-1):-1:2
       for j=2:(n-1)
                R(i,j) = psi(i,j+1) +psi(i,j-1) + psi(i+1,j) +psi(i-1,j)- 4*psi(i,j);
                psi(i,j) = psi(i,j) +a*R(i,j)/4; 
       end
        v1=psi(5,5); %print out sample values to see the convergence
        v2=psi(5,4);
        v3=psi(5,3);
        v=[v1,v2,v3]
    end
    iter = iter+1;
    if abs(max(max(R))) < errorMAX %test for convergence condition
        for i = 1:7 %aligns the matrix entries with their correct positions for the contour function (line 41)
            A(i,:) = psi(8-i,:);
        end
        for i=1:7
            for j=1:7
                Z(i,j)=sin(x(i))*sinh(y(j));
            end
        end
        A=transpose(A);
        [X,Y] = meshgrid(x,y); %plot both the computed and the analytic solutions if convergence occurs
        figure
        subplot(1,2,1); contour(X,Y,A,60); xlabel('x');ylabel('y');title('solution');
        subplot(1,2,2); contour(X,Y,Z,100); xlabel('x');ylabel('y');title('analytic solution for comparison');
        solution=A              %display the calculated solution 
        analytic_solution=Z     %display the analytic solution
        iter-1                    %display the convergence iteration
        break
        
    end
end
