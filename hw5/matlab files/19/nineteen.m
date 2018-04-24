a =1;
v=1;

delx = 1;
x = 0:delx:1;
y = x/a - v*exp(x/v);
plot(x,y,'-s')
hold on

yderviest = (y(1:end) - y(1:end-1))./delx;
plot(x(1:end-1),yderviest,'r-')