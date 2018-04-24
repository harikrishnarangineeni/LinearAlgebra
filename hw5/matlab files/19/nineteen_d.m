clc
a = 1;
v=1;
N = 21; 
umax = 1;
umin =0;
x = 0;
xmax = 0.5;
dx = 0.009;


du = (umax-umin)/N;
u = umin - du:du:umax +du;


t0 = u/a - v*exp(u/v);
t = t0;
tnp1 = t0;
tnp2 = t0;

%plot(u,t0,'-s')
hold on
nsteps = xmax/dx;
for n = 1 : nsteps
    
   
    t(1) = t(3);
    t(N + 3) = t(N +1);
    
  
    for i = 3 : N+3
         tnp1(i) = t(i) - v*dx/du * (t(i) - t(i-1));
        %tnp2(i) = t(i) - v*dx/du * (t(i-1) - t(i-2));
    end
    
  
    %o =0
    x = x + dx;
    t = tnp1 ;
    %t1 = tnp2;  
    % plot solution   
    %hold on  
    %plot(u,t1)
    
end
plot(u,t0,'-s')
    hold on
    plot(u,t)
%xlim([0 1]);