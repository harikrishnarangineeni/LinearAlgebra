% Dr. Paul T. Bauman
%
% Goal: Function implements the Newton method for finding the roots
%       of a nonlinear equation.
%
% Input: func - function handle to nonlinear function
%        deriv - function handle to the derivative of the nonlinear
%        function
%        x0 - double, initial guess
%        tol - double, error tolerance
%        max_iters - integer, maximum number of iterations allowed.
%
% Output: x - double, estimated root of nonlinear equation in func
%         error_est - double, value of the estimated error of our solution
%         num_iters - integer, number of iterations it took to converge

function [ x, error_est, num_iters ] = newton_1d( func, deriv, x0, tol, max_iters )

% Set current solution iterate to the initial guess.
x = x0;

% Loop for the maximum number of iterations.
for i = 1:max_iters

    % Get the function value at the current solution iterate.
    f = func(x);

    error_est(i) = abs(f);

    if( error_est(i) < tol )
       break
    end
    
    % Get the first derivative of the nonlinear function at 
    % the current solution iterate.
    df = deriv(x);
   
    if( df == 0)
        error('Zero derivative detected!')
    end
    
    if( abs(df) < 1.0e-15 )
        error('Numerically zero derivative detected!')
    end

    % x_{i+1} = x_{i} - f( x_{i} )/dfdx( x_{i} )
    x = x - f/df;
    
end

num_iters = i;
