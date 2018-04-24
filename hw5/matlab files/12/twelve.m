clc
clear all;


a=newt(14,0.00001);
fprintf('the value of a is %f\n',a);
x=-45:0.1:45;
y=a.*cosh(x./a);
plot(x,y);
xlabel('x');
ylabel('y');
title('catenary curve');

function z = newt(ini,tol )

x=ini;
error = 2*tol;
while error > tol
F = func(x);
G = df(x);
dx = (-F)/G;
x = x+dx;
F = func(x);
error = (abs(F));
end

z=x;
end

function z = func( x)
z=2*x*sinh(45/x)-105;


end


function z= df( x )
z=2*sinh(45/x)-90*(cosh(45/x))/x;

end