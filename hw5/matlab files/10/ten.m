clc;
clear all;
close all;

% Bi-Section Method

x1=0.5;
x2=1;

y1=sin(x1)-(x1*x1*x1);

if(y1<0)
  x1=x1;
  x2=x2;

else
  x=x2;
  x2=x1;
  x1=x;
end

n=1000;
i=1;

while(n>0)
   y1=sin(x1)-(x1*x1*x1);                                       
   y2=sin(x2)-(x2*x2*x2);
    y=y1*y2;
     if (y<0)
        x=(x1+x2)/2;
        y=sin(x)-(x*x*x);

     if(y<0)
       x1=x;
     else
       x2=x;
     end
     end
      tol(i)=abs(y);
      if(tol(i)<(10^-6))
          n=-1;
      end

   i=i+1;

   n=n-1;

end

fprintf('Rooots using Bi-Section Method : %d and %d(Iterations)\n',x,i-1);
n=1:i-1;
figure;semilogy(n,tol,'r');
title('Bi-Section Method');
xlabel('Iterations');
ylabel('Error');


% Regular Falsi Method

x1=.5;
x2=1;
y1=sin(x1)-(x1*x1*x1);
if(y1<0)
  x1=x1;
  x2=x2;

else
  x=x2;
  x2=x1;
  x1=x;
end

n=1000;
i=1;

while(n>0)
    y1=sin(x1)-(x1*x1*x1);
    y2=sin(x2)-(x2*x2*x2);
    x=((x1*y2)-(y1*x2))/(y2-y1);
    y=sin(x)-(x*x*x);

if(y<0)
  x1=x;
else
  x2=x;
end

tol1(i)=abs(y);

if(tol1(i)<(10^-6))
    n=-1;

end

  i=i+1;
  n=n-1;

end

fprintf('Rooots using Regular Falsi Method : %d and %d(Iterations)\n',x,i-1);
title('Regular Falsi Method');
xlabel('Iterations');
ylabel('Error');

% Newton Rapson Method

n=1:i-1;
figure;semilogy(n,tol1,'k');
x=1;
n=1000;
i=1;

while(n>0)
    y=sin(x)-(x*x*x);
    y_dash=cos(x)-(3*x*x);
    x=x-(y/y_dash);
    tol2(i)=abs(y);

if(tol2(i)<(10^-6))
    n=-1;

end
    i=i+1;
    n=n-1;

end


n=1:i-1;
fprintf('Rooots using Newton Rapson Method : %d and %d(Iterations)\n',x,i-1);
figure;semilogy(n,tol2,'b');
title('Newton-Rapson Method');
xlabel('Iterations');
ylabel('Error');