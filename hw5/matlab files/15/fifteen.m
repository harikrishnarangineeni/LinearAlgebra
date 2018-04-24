[t,y] = ode45('pendulum',[0 25], [5 0]);%% change for [t,y] = ode45('pendulum',[0 25], [45 0]) for b%%
plot(t,y(:,1),'-');
xlabel('time');
ylabel('y_{1}(t)');
title('\theta (t)');
figure;
plot(t,y(:,2),'-');
xlabel('time');
ylabel('y_{2}(t)');
title('d \theta / dt (t)');
figure;
plot(y(:,1),y(:,2),'-');
xlabel('\theta (t)');
ylabel('d \theta / dt (t)');
title('Phase Plane');