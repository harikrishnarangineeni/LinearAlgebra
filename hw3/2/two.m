L1 = 0.5;
L2 = 0.75;
m = 10;
h = 0;

input = load('theta1.dat', '-mat')
inp = input.t_theta

angle1 = inp(2,:)
t = inp(1,:)
v_angle2 =[]
plot(t,angle1)
hold on

for i = 1:20
syms f(angle2)
angle1 = inp(2,i);
x0 = 1;
f(angle2) = pi/4 + asin((L1/(sqrt(2)*L2))*(cos(angle1)-sin(angle1))+((x-h)/(sqrt(2)*L2)));
diff = inline(diff((f(angle2)),angle2));
[angle2 iterations_num] = newton_1d(inline(f),diff,x0,1.0e-6,1000);
v_angle2 = [v_angle2,angle2];
end
plot(t,v_angle2)

hold on

x_vec = []
for i = 1:20
syms f(x)
angle1 = inp(2,i);

x0 = 1;
f(x) = L1*(sin(angle1)-cos(angle1))+L2*(sin(angle2)-cos(angle2))+h;
diff = inline(diff((f(x)),x));
[x err_est iterations_num] = newton_1d(inline(f),diff,x0,1.0e-6,1000);
x_vec = [x_vec,x];
end

plot(t,x_vec)

figure()
%%
%Plot for velocity
p = polyfit(inp(1,:),x_vec,3);

Fun = @(x) p(4) + p(3)*x + p(2)*x.^2 + p(1)*x.^3;
dFun = @(x) p(3) + 2*p(2)*x + 3*p(1)*x.^2;
aFun = @(x) 2*p(2) + 6*p(1)*x;
x=linspace(0,1,101);
F=Fun(x);
h=x(2)-x(1);
xCentral=x(2:end-1);
dFCentral=(F(3:end)-F(1:end-2))/(2*h);
xForward=x(1:end-1);
dFForward=(F(2:end)-F(1:end-1))/h;
xBackward=x(2:end);
dFBackward=(F(2:end)-F(1:end-1))/h;

x=linspace(0,1,101);
plot(x,dFun(x));
hold on
plot(xCentral,dFCentral,'r')
plot(xForward,dFForward,'k')
plot(xBackward,dFBackward,'g')
legend('Analytic','Central','Forward','Backward')
title("Distance Vs Velocity ")
%%
%Plot for acceleration
F = dFun(x);
h=x(2)-x(1);
xCentral_2=x(2:end-1);
dFCentral_2=(F(3:end)-F(1:end-2))/(2*h);
xForward_2=x(1:end-1);
dFForward_2=(F(2:end)-F(1:end-1))/h;
xBackward_2=x(2:end);
dFBackward_2=(F(2:end)-F(1:end-1))/h;
figure()
plot(x,aFun(x));
hold on
plot(xCentral_2,dFCentral_2,'r')
plot(xForward_2,dFForward_2,'k')
plot(xBackward_2,dFBackward_2,'g')
legend('Analytic','Central','Forward','Backward')
title("Distance Vs Acceleration ")

%%
%Piston Force plot
ti = inp(1,:)
force = m.*aFun(ti);
figure()
plot(x_vec,force)
title("Distance Vs Force")
%%
%Work done
I = trapz(x_vec,force)
