clear;
close all;

A=[1 2 3; 4 5 6; 7 8 7; 4 2 3; 4 2 2]
[Q1,R1]=modifiedgramschmidt(A)

function [Q,R] =  modifiedgramschmidt(X)
    [m,n] = size(X);
    Q = zeros(m,n);
    R = zeros(n,n);
    for k = 1:n
        Q(:,k) = X(:,k);    
        for i = 1:k-1
            R(i,k) = Q(:,i)'*Q(:,k);
            Q(:,k) = Q(:,k) - R(i,k)*Q(:,i);
        end
        R(k,k) = norm(Q(:,k))';
        Q(:,k) = Q(:,k)/R(k,k);
    end
end