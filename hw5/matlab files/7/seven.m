clc
clear all;

A = [2 1 0; 1 2 1; 0 1 2];

[lam1, u] = DomEigen(A, [1;1;1], 3);
[lam2, u] = SmallEigen(A, [2;-2;2],0,  3);


ratio = lam1/lam2; %ratio
disp("Ratio of the largest Eigen Value to the smallest Eigen Value is " +ratio)
con = cond(A);
eigen = eigs(A);
eigen(1)
eigen(3)

disp("error % for maximum Eigen value is " +(abs(eigen(3) - lam1)/eigen(3)) * 100)
disp("error % for minimum Eigen value is " +(abs(eigen(1) - lam2)/eigen(1)) * 100)

disp("error % for Condition number is " +(abs(con - ratio)/con) * 100)

function [lam, u] = DomEigen(A, startvector, k)
for i = 1:k
    u = startvector/norm(startvector);
    startvector = A*u;
    lam = u'*startvector;
end
end

% inverse 
function [lam, u] = SmallEigen(A, startvector, s, k)
As =  A- s*eye(size(A));
for i = 1:k
    u = startvector/norm(startvector);
    startvector = As\u;
    lam = u'*startvector;
end
lam = 1/lam + s;
u = startvector/norm(startvector);
end