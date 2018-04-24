% Dr. Paul T. Bauman
%
% Goal: Function that uses the composite trapezoidal rule to approximate
%       the integral of a function given by func, between x_start and
%       x_end using (num_points-1) intervals.
%
% Input: func       - function pointer to integrand function
%        x_start    - double, start of integration interval
%        x_end      - double, end of integration interval
%        num_points - number of points to include in integration rule,
%                     *including* the beginning and end points.
%
% Output: integral_value - double, approximate value of integral

function integral_value = composite_trapezoidal_rule( func, x_start, x_end, num_points )

n = num_points;

% Get spacing between the points.
h = ( x_end - x_start )/( n - 1 );

% Construct array of points to evaluate the function at.
x = [ x_start : h : x_end ];

% Intialize sum variable to zero
integral_value = 0;

% Composite trapezoidal rule:
% h/2*( f(x_0) + 2*( sum_{i=1}^{n-1} f(x_i) ) + f(x_n) )

%First compute interior part. We multiply by 2 at the end so 
% we only do it once instead of num_points-2 times.

for i = 2:n-1

    integral_value = integral_value + func( x(i) );

end

integral_value = 2*integral_value;

% Now add on the end points.
integral_value = integral_value + func( x(1) );
integral_value = integral_value + func( x(n) );

% Now scale by the spacing.
integral_value = integral_value * h/2;

