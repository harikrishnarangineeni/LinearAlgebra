function dy = pendulum(t,y)
dy = zeros(2,1);
omega = sqrt(9.81);
dy(1) = y(2);
dy(2) = -omega*omega*sin(y(1));