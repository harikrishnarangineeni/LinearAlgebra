clear;
close all;
compute1 = [];
compute2 = [];
compute3 = [];
compute4 = [];

for i = 2:10
    disp(i)
    X = hilb(i);
    
    [Q,R] = qr(X);
    compute1 = [compute1 getres(Q)];
    
    [Q,R] =  classicalgramschmidt(X);
    compute2 = [compute2 getres(Q)];
    
    
    [Q,R] =  modifiedgramschmidt(X);
    compute3 = [compute3 getres(Q)];
    
    
    [Q,R] =  householder(X);
    compute4 = [compute4 getres(Q)];

end
compute1
compute2
compute3
compute4

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

function result = getres(X)
    t = transpose(X) * X;
    t = t - eye(length(t));
    result = norm(t);
end