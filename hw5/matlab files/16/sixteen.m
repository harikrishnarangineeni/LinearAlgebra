t=[0:.001:.02];
x=5.430615*exp(-700*t)-1.430615*exp(-t);

plot(t,x)
xlabel('t')
ylabel('x')
title('Fast Transient')