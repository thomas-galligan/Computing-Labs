%Two Dimensional fourier transform of a two square sources (the second
%offset by (4,4) from the first)
%Tom Galligan
%University of Oxford
N = input('Enter N: ');
A = zeros(N,N); %construct array
A(N/2,N/2)=1; %Form first source
A(N/2,N/2+1)=1;
A(N/2+1,N/2)=1;
A(N/2+1,N/2+1)=1;

A(N/2+4,N/2+4)=1; %Form 2nd source
A(N/2+4,N/2+5)=1;
A(N/2+5,N/2+4)=1;
A(N/2+5,N/2+5)=1;


re=zeros(N,N);
mod = zeros(N,N);

Y = fft2(A);
mod = abs(Y);
re = real(Y);



F = zeros(N,N);
            
syms x
syms y
mod = zeros(N,N);
re = zeros(N,N);
Y = zeros(1,2*N);
X = zeros(1,2*N);

%%Perform the fourier transform
for u=1:2*N
    for v=1:2*N
        for x = 1:N
                for y = 1:N
                    Y(y) =  A(x,y)*exp((-pi/N)*1i*((x-N/2)*u+(y-N/2)*v));
                end
         X(x) = sum(Y);
        end
        F(u,v) = sum(X);
        mod(u,v) = abs(F(u,v));
       re(u,v) = real(F(u,v));
    end
    
end

%plot result
figure
subplot(1,3,2)
surf(fftshift(mod).^2)
title('Modulus squared of the DFT','Interpreter','latex', 'fontsize',20)
xlabel('$\beta$','Interpreter','latex', 'fontsize',20)
ylabel('$\gamma$','Interpreter','latex', 'fontsize',20)
zlabel('Modulus Squared of DFT','Interpreter','latex', 'fontsize',20)

subplot(1,3,3)
surf(fftshift(re))
title('Real part of DFT','Interpreter','latex', 'fontsize',20)
xlabel('$\beta$','Interpreter','latex', 'fontsize',20)
ylabel('$\gamma$','Interpreter','latex', 'fontsize',20)
zlabel('Real Part of DFT','Interpreter','latex', 'fontsize',20)


subplot(1,3,1)
surf(A)
title('Slit','Interpreter','latex', 'fontsize',20)
xlabel('$x$','Interpreter','latex', 'fontsize',20)
ylabel('$y$','Interpreter','latex', 'fontsize',20)
