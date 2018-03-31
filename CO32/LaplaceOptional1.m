n = 7;
a = 1.35;
psi=zeros(n,n); %initial 7x7 matrix of zeros, includes boundary conditions at x,y=0
psi(:,1) = 0;
psi(n,:) = 0;
x= [0:1/(n-1):1];
y = [0:1/(n-1):1];

R=zeros(n);
iter=1;
iterMAX=30;
errorMAX=0.001;

while iter<iterMAX
    for i=2:(n-1)
        if (-1)^i == -1
            for j=2:(n-1)
                R(i,j) = psi(i,j+1) +psi(i,j-1) + psi(i+1,j) +psi(i-1,j)- 4*psi(i,j);
                psi(i,j) = psi(i,j) +a*R(i,j)/4; 
            end
        else          
            for k = 1:(n-2)
                j=n-k;
                R(i,j) = psi(i,j+1) +psi(i,j-1) + psi(i+1,j) +psi(i-1,j)- 4*psi(i,j);
                psi(i,j) = psi(i,j) +a*R(i,j)/4;
            end
        end
    v1=psi(i,j+1);
    v2=psi(i,j);
    v3=psi(i,j-1);
    v=[v1,v2,v3];
    end
    iter = iter+1;
    if abs(max(max(R))) < errorMAX
        for i = 1:7
            A(i,:) = psi(8-i,:);
        end
        [X,Y] = meshgrid(x,y);
        figure(1);contour(X,Y,A,60);xlabel('x');ylabel('y');title('plot');
        break
    end
end