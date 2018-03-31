%Fourier Optics - CO32
%Tom Galligan
%Brasenose College
%University of Oxford
%MT16
N=input('Enter N: '); %enter value of N
A = zeros(1,2*N); %construct array
A(N-14:N-5)=1; %construct slit centred at -10 of width 10 


dft = DFT(A); %perform the Discrete Fourier Transform of A

mod = abs(dft); %find the modulus of the DFT (complex modulus of each component)
re = real(dft); %find the real part of the DFT

%plot the graphs
t = [-249:250]; %define an 'x' axis
figure
subplot(1,2,1)
plot(t,mod.^2)
title('Modulus squared of the Discrete Fourier Transform','Interpreter','latex', 'fontsize',20)
xlabel('$\beta$', 'Interpreter','latex', 'fontsize',20)
ylabel('Modulus-squared of the DFT', 'Interpreter','latex', 'fontsize',20)
subplot(1,2,2)
plot(t,re)
title('Real part of the Discrete Fourier Transform','Interpreter','latex', 'fontsize',20)
xlabel('$\beta$', 'Interpreter','latex', 'fontsize',20)
ylabel('Real part of the DFT', 'Interpreter','latex', 'fontsize',20)