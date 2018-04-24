clc;
clear all;

[x,err,func] = guess([1,0],10.^-6,1)
[x,err,func] = guess([sqrt(1/3),1],10.^-6,1)

function [x,err,f] = guess(x0,tol,iprint)

maxit = 1000;
n = max(size(x0));
Residual = zeros(n,1);
Jacobian = zeros(n,n);
InvJ = zeros(n,n);
dx = zeros(n,1);
x = zeros(n,1);
xold = zeros(n,1);
xeval = zeros(n,1);
xp = zeros(2);
fp = zeros(n,n,2);
dxcon = zeros(n,1);
dxcon(1:n) = 0.01;
x = x0;
err = 100.0;
iter = 0;
while ( err > tol )
for j = 1:1:n
dx(j) = min(dxcon(j)*x(j),dxcon(j));
      i2dx(j) = 1.0/(2.0*dx(j));
end
   Residual = initial(x);
   for j = 1:1:n
      for i = 1:1:n
         xeval(i) = x(i);
end
      xp(1) = x(j) - dx(j);
      xp(2) = x(j) + dx(j);
      for k = 1:1:2
         xeval(j) = xp(k);
         fp(:,j,k) = initial(xeval);
      end
   end
   for i = 1:1:n
      for j = 1:1:n
         Jacobian(i,j) = i2dx(j)*( fp(i,j,2) - fp(i,j,1) );
      end
   end
   xold = x;
   invJ = inv(Jacobian);
   deltax = -invJ*Residual;
   for j = 1:1:n
      x(j) = xold(j) + deltax(j);
end
   iter = iter +1;
   err = sqrt( sum(deltax.^2) /n  ) ;
   f = sqrt(sum(Residual.*Residual)/n);
   if (iprint == 1)
      fprintf (1,'iter = %4i, err = %9.2e f = %9.2e \n ', iter, err, f);
   end
   if ( iter > maxit)
      Residual
      error ('maximum number of iterations exceeded');
   end
end
end

function f = initial(x)
n = max(size(x));
f = zeros(n,1);
f(1) = x(1).^3 + x(2) - 1;
f(2) = x(1) - x(2) + 1;
end

