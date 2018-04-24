clear all
close all

func_t_nonzero = @(t,y) y*(-2*t+t^-1)

t = linspace(0.01,3,300);
y0 = 0.01;                    
[t_store, y_store] = ode45(func_t_nonzero, t, y0);
length(t_store)
for i=1:length(t_store)
    if(floor(t_store(i)) == 1)
        y_store(i)
        break
    end
end
figure
plot(t_store, y_store,'color','r' )
grid on


%%% for t = 0 %%%

func_t_zero = @(t1,y1) 1
t1 = [0,1];                     
y0 = 1;
[t_store_1, y_store_1] = ode45(func_t_zero, t1, y0);
figure
plot(t_store_1(1), y_store_1(1),'rx' )
grid on