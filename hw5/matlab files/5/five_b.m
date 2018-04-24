
clc;
clear all;
syms x n f s;

T = pi;
B = -pi;
f = (x + pi);
A0 = (1/T) * (int(f,x,B,T+B));
An = (2/T) * int((f*cos(2*pi*n*x/T)),x,B,T+B);
Bn = (2/T) * int((f*sin(2*pi*n*x/T)),x,B,T+B);
As = An * cos (2*pi*n*x/T);
Bs = Bn * sin(2*pi*n*x/T);
max = 5;

s = A0
for N = 1:100
    s = s + subs(As,N,n) + subs(Bs,N,n);
end
ezplot(s,[B,4*T+B])
hold on
H = ezplot(f,[B,T+B])
set(H,'color','b');

syms x1 n1 f1 s1
T1 = pi;
B1 = 0;
f1 = (x1);
A01 = (1/T1) * (int(f1,x1,B1,T1+B1));
An1 = (2/T1) * int((f1*cos(2*pi*n1*x1/T1)),x1,B1,T1+B1);
Bn1 = (2/T1) * int((f1*sin(2*pi*n1*x1/T1)),x1,B1,T1+B1);
As1 = An1 * cos (2*pi*n1*x1/T1);
Bs1 = Bn1 * sin(2*pi*n1*x1/T1);
max = 5;
s1 = A01;
for N = 1:100
    s1 = s1 + subs(As1,N,n1) + subs(Bs1,N,n1);
end

ezplot(s1,[B1,4*T+B1]);
hold on
H1 = ezplot(f1,[B1,4*T1+B1]);
set(H1,'color','r');