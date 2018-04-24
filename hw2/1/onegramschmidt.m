clear;
close all;

A=[1 2 3; 4 5 6; 7 8 7; 4 2 3; 4 2 2]
[Q1,R1]=classicalgramschmidt(A)

function [Q,R] = classicalgramschmidt(X)
    [m,n] = size(X);
    Q = zeros(m,n);
    R = zeros(n,n);
    for k = 1:n
        Q(:,k) = X(:,k);
        if k ~= 1
            R(1:k-1,k) = Q(:,k-1)'*Q(:,k);
            Q(:,k) = Q(:,k) - Q(:,1:k-1)*R(1:k-1,k);
        end
        R(k,k) = norm(Q(:,k));
        Q(:,k) = Q(:,k)/R(k,k);
     end
end