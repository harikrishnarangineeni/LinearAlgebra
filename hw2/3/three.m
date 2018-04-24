clear;
close all;

m = 50;
n = 12; 

t = linspace(0,1,m);
b = cos(4*t);

A = vander(t); 
A = fliplr(A); 
A = A(:,1:n);


% (a) normal equations
B = A'*A;
M = A'*b';
L = chol(B,'lower');
R = chol(B,'upper');               
W = M\L;
x_normalequation = R\W';

% (b)  modified Gram-Schmidt function
[Q1,R1] = modifiedgramschmidt(A);
Y = Q1'*b';
X_modgs = R1\Y

%(c) householder reflector
[Q2,R2] = householder(A)
Y = Q2'*b';
x_household = R2\Y

%(d) QR Factorization
[Q R] = qr(A);
Y = Q'*b';
x_qr = R\Y

%(e) MATLAB’s A\b 
x_matlab=A\b'

%(f)SVD
[U,S,V] = svd(A,0)
x_svd = V*((U'*b')./diag(S))

%%%%%%%%%%MGS
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

%%%%%%%HOUSEHOLD

function [Q,R] = householder(P)
[m,n] = size(P);
R = zeros(n,n);
Q = eye(m);
R = P;
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