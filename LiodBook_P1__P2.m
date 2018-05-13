clear
clc

Nvec = 2.^(3:12);

for N = Nvec
    h = 2*pi/N; x = -pi + (1:N)'*h;
    u = exp(sin(x)); uprime = cos(x).*u;
    
%     e = ones(N,1);
%     D = sparse(1:N,[2:N 1],2*e/3,N,N)- sparse(1:N,[3:N 1 2],e/12,N,N);
%     D = (D-D')/h;

    
    column = [0 .5*(-1).^(1:N-1).*cot((1:N-1)*h/2)];
    D = toeplitz(column,column([1 N:-1:2]));
    
    error = norm(D*u-uprime,inf);
    loglog(N,error,'.','markersize',15), hold on
  
end

grid on, xlabel N, ylabel error
title('Convergence of 4th-order finite differences')


% semilogy(Nvec,Nvec.^(-4),'--')
% text(105,5e-8,'N^{-4}','fontsize',18)