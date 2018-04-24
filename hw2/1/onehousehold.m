clear;
close all;

A=[1 2 3; 4 5 6; 7 8 7; 4 2 3; 4 2 2]
[Q1,R1]=householder(A)

function [Q,R] = householder(A)
[m,n] = size(A);
R = zeros(n,n);
Q = eye(m);
R = A;
for k = 1:n
   
    x = R(k:m,k);
    e = zeros(length(x),1);
    e(1) = 1;
    U = sign(x(1))*norm(x)*e + x;
    U = U./norm(U);
    P = eye(m);
    P(k:m,k:m) = P(k:m,k:m) - 2*(U*U');
    R = P*R    
    Q = Q*P
         
end

end
