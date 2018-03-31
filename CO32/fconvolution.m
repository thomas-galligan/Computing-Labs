%Convolution of a slit of width 20 and height 1 with itself
%Tom Galligan
%University of Oxford 
%HT2017



N = input('Enter N: ');
A = zeros(1,2*N);
A(N-9:N+10) = 1;

%convolution algorithm (general)
h = A; %here we define the second function to be equal to the first (as we are convolving the slit with itself)
m = length(A);
n = length(h);
X = [A,zeros(1,n)];
H = [h,zeros(1,m)];
for i = 1:n+m
    Y(i) = 0;
    for j=1:m
        if(i-j+1>0)
            Y(i) = Y(i)+X(j)*H(i-j+1); %perform the discrete convolution
        else
        end
    end
end

%Y = conv(x,x); %%this was used to check that the convolution algorithm
%works (it does)
Y = Y(N:3*N-1);%take only the middle section (convolution doubles the number of elements in the vector)
plot(Y)
ylabel('$I(\beta)$', 'Interpreter','latex','fontsize',20);
xlabel('$x$', 'Interpreter','latex','fontsize',20);
title('Convolution of a slit with itself', 'Interpreter','latex','fontsize',20);



dftconv = DFT(Y); %take only the middle section (convolution doubles the number of elements in the vector)
modconv = abs(dftconv);
reconv = real(dftconv);



dftslitsq = DFT(A).^2;
modslitsq = abs(dftslitsq);
reslitsq = real(dftslitsq);

%plot the graphs
t = -N:N-1; %define an x axis
figure
subplot(2,2,1)
plot(t,modconv) %%take only the middle section (convolution doubles the number of elements in the vector)
title('Modulus of the DFT of the convolution', 'Interpreter','latex','fontsize',20);
xlabel('$\beta$', 'Interpreter','latex', 'fontsize',20)
ylabel('Modulus of the convolution', 'Interpreter','latex', 'fontsize',20)

subplot(2,2,2)
plot(t,reconv) %%%%take only the middle section (convolution doubles the number of elements in the vector)
title('Real part of the DFT of the convolution', 'Interpreter','latex','fontsize',20);
xlabel('$\beta$', 'Interpreter','latex', 'fontsize',20)
ylabel('Real part of the convolution', 'Interpreter','latex', 'fontsize',20)

subplot(2,2,3)
plot(t,modslitsq)
title('Modulus of the DFT squared of the slit', 'Interpreter','latex','fontsize',20);
xlabel('$\beta$', 'Interpreter','latex', 'fontsize',20)
ylabel('Modulus of DFT(slit)$^2$', 'Interpreter','latex', 'fontsize',20)

subplot(2,2,4)
plot(t,reslitsq)
title('Real part of the DFT squared of the slit', 'Interpreter','latex','fontsize',20);
xlabel('$\beta$', 'Interpreter','latex', 'fontsize',20)
ylabel('Real part of the DFT(slit)$^2$', 'Interpreter','latex', 'fontsize',20)
