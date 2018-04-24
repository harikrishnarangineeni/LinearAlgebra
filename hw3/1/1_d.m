clear all
close all

func_y = @(x) x*exp(-(x^2))*(-2*x+x^-1)
num_points = 2

%%%Composite trapizoidal rule%%%

f_old = composite_trapezoidal_rule( func_y, 0.0001, 1, num_points );

error_est = 1;
tol = 1.0e-2;

while error_est > tol
    num_points = num_points+1;
    
    f_new = composite_trapezoidal_rule( func_y, 0.0001, 1, num_points );
    
    error_est = (f_new - f_old)/f_new;
    
    f_old = f_new;
    
end

disp("integral value is: " + f_new)
disp("no. of steps: "+ num_points)
