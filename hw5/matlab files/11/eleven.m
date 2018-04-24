clc;
clear all;

f = inline('4*exp(-0.5*x)-x*exp(-0.5*x)-2') 
fp = inline('(x*exp(-x/2)-6*exp(-x/2))/2')
list = [2 6 8];
[x1,iterations1]=newton(2,f,fp)
[x2,iterations2]=newton(6,f,fp)
[x3,iterations3]=newton(8,f,fp)

function [x,iter]=newton(x0,f,fp)
% newton-raphson algorithm
N = 100; eps = 1.e-10; 
maxval = 10000.0;
xx = x0;
while (N>0)
 xn = xx-f(xx)/fp(xx);
if abs(f(xn))<eps
 x=xn;iter=100-N;
 return;
end
if abs(f(xx))>maxval
 disp(['iterations = ',num2str(iter)]);
 error('Solution diverges');
 break;
end
 N = N - 1;
 xx = xn;
end
error('No convergence'); 
end
% end function