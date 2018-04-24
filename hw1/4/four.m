clear
close all
clc

h = logspace(-16,-1);

diff= (sin((pi/3)+h)-(sin(pi/3)))./h;
Error_forward = abs((1/2) - diff);


loglog(h,Error_forward),xlabel('Step Size'),ylabel('Error')