clc;
clear all;
f = @(t,u) [-(rho*A*c*sqrt((u(1))^2+(u(2))^2)*u(1))/(2*m);-rho*A*c*sqrt((u(1))^2+(u(2))^2)*u(2)/(2*m)-g];

[t,ua] = ode45(f,[0 200],[70 58]);


plot(t,ua(:,2))
title('u_y(t)')
xlabel('t'), ylabel('u_y')
plot(t,ua(:,1))
title('u_x(t)')
xlabel('t'), ylabel('u_x')