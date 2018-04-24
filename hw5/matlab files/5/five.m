clc;
clear all;
syms x n f s;

T = 2*pi;
B = -pi;
f = ((sin(x)).^2);
A0 = (1/T) * (int(f,x,B,T+B));
An = (2/T) * int((f*cos(2*pi*n*x/T)),x,B,T+B);
Bn = (2/T) * int((f*sin(2*pi*n*x/T)),x,B,T+B);
As = An * cos (2*pi*n*x/T);
Bs = Bn * sin(2*pi*n*x/T);
max = 5;
s = A0;
for N = 1:100
    s = s + subs(As,N,n) + subs(Bs,N,n);
end
figure
ezplot(s,[B,4*T+B]);
hold on
H = ezplot(f,[B,4*T+B]);
set(H,'color','r');

