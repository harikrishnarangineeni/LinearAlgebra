clear all;
close all;
clc;

%%% exact rank of the matrix %%%

new_A=[1/3 1/3 2/3; 2/3 2/3 4/3; 1/3 2/3 3/3; 2/5 2/5 4/5; 3/5 1/5 4/5];
new_A
Exact_rank = rank(new_A);
Exact_rank

%%% Computing the SVD & assigning the rank %%%

s = svd(new_A);
[U,S,V] = svd(new_A);
tol = max(size(new_A))*eps(max(s));
rank_svd = sum(s > tol);
S
rank_svd



%%
%%% 2000×2000 matrix with singular values = (0.9)^n %%%

n=1:1:2000;
v = 0.9.^n;
D=diag(v);
%rank_assign = rank(D);
%rank_assign
s=svd(D)
tol=max(size(D))*eps(10.^(-16));
r=sum(s>tol)

%%

a=-0.005;
b=0.005;
rand_noise = a + (b-a)*rand(1,10);

x = [1.02; 0.95; 0.87; 0.77; 0.67; 0.56; 0.44; 0.30; 0.16; 0.01];
y = [0.39; 0.32; 0.27; 0.22; 0.18; 0.15; 0.13; 0.12; 0.13; 0.15];
new_x = x+transpose(rand_noise);
new_y = y+transpose(rand_noise);


new_A = [new_y.^2 new_x.*new_y new_x new_y ones(size(new_x))];
new_B = new_x.^2;
disp('(a)');
figure(1); 
hold on;

A = [y.^2 x.*y x y ones(size(x))];
B = x.^2;
coeff = A\B;

new_coeff = new_A\new_B;

compare_coeff=(new_coeff)-(coeff);
compare_coeff

[xlimit, ylimit] = meshgrid(-1:0.1:2, -1:0.1:2);
contour(-1:0.1:2, -1:0.1:2 , new_coeff(1)*ylimit.^2+new_coeff(2)*xlimit.*ylimit+new_coeff(3)*xlimit+new_coeff(4)*ylimit+new_coeff(5)-xlimit.^2, [0, 0], 'g-');
contour(-1:0.1:2, -1:0.1:2 , coeff(1)*ylimit.^2+coeff(2)*xlimit.*ylimit+coeff(3)*xlimit+coeff(4)*ylimit+coeff(5)-xlimit.^2, [0, 0], 'b-');
plot(new_x, new_y, 'rx');
title('effect on the plot of the orbit')
xlabel('X-axis')
ylabel('Y-axis')
legend('new orbit (noisy data)','old orbit (original data)')

%%
clearvars

a=-0.005;
b=0.005;
rand_noise = a + (b-a)*rand(1,10);

x = [1.02; 0.95; 0.87; 0.77; 0.67; 0.56; 0.44; 0.30; 0.16; 0.01];
y = [0.39; 0.32; 0.27; 0.22; 0.18; 0.15; 0.13; 0.12; 0.13; 0.15];
new_x = x+transpose(rand_noise);
new_y = y+transpose(rand_noise);


new_A = [new_y.^2 new_x.*new_y new_x new_y ones(size(new_x))];
new_B = new_x.^2;
disp('(a)');
figure(1); 
hold on;

A = [y.^2 x.*y x y ones(size(x))];
B = x.^2;

%%% SVD for original data %%%

[U,S,V] = svd(A);

for i=1:5
  r(i) = rank(S,10.^(-i));
  D{i} = U(:,1:r(i))*S(1:r(i),1:r(i))*V(:,1:r(i))';
  coeff_svd_orig{i} = D{i}\B;
  coeff_svd_orig{i}
end


%%% SVD for noisy data %%%

[U1,S1,V1] = svd(new_A);

for i=1:5
  r1(i) = rank(S1,10.^(-i));
  D1{i} = U1(:,1:r1(i))*S1(1:r1(i),1:r1(i))*V1(:,1:r1(i))';
  coeff_svd_noise{i} = D1{i}\new_B;
  coeff_svd_noise{i}
end


% [xlimit, ylimit] = meshgrid(-1:0.1:2, -1:0.1:2);
% contour(-1:0.1:2, -1:0.1:2 , coeff_svd_noise{1}(1)*ylimit.^2+coeff_svd_noise{1}(2)*xlimit.*ylimit+coeff_svd_noise{1}(3)*xlimit+coeff_svd_noise{1}(4)*ylimit+coeff_svd_noise{1}(5)-xlimit.^2, [0, 0], 'g-');
% contour(-1:0.1:2, -1:0.1:2 , coeff_svd_orig{1}(1)*ylimit.^2+coeff_svd_orig{1}(2)*xlimit.*ylimit+coeff_svd_orig{1}(3)*xlimit+coeff_svd_orig{1}(4)*ylimit+coeff_svd_orig{1}(5)-xlimit.^2, [0, 0], 'b-');
% plot(new_x, new_y, 'rx');
% title('effect on the plot of the orbit as the tolerance and rank vary')
% xlabel('X-axis')
% ylabel('Y-axis')
% legend('noisy data curve','original data curve')


% [xlimit, ylimit] = meshgrid(-1:0.1:2, -1:0.1:2);
% contour(-1:0.1:2, -1:0.1:2 , coeff_svd_noise{2}(1)*ylimit.^2+coeff_svd_noise{2}(2)*xlimit.*ylimit+coeff_svd_noise{2}(3)*xlimit+coeff_svd_noise{2}(4)*ylimit+coeff_svd_noise{2}(5)-xlimit.^2, [0, 0], 'g-');
% contour(-1:0.1:2, -1:0.1:2 , coeff_svd_orig{2}(1)*ylimit.^2+coeff_svd_orig{2}(2)*xlimit.*ylimit+coeff_svd_orig{2}(3)*xlimit+coeff_svd_orig{2}(4)*ylimit+coeff_svd_orig{2}(5)-xlimit.^2, [0, 0], 'b-');
% plot(new_x, new_y, 'rx');
% title('effect on the plot of the orbit as the tolerance and rank vary')
% xlabel('X-axis')
% ylabel('Y-axis')
% legend('noisy data curve','original data curve')

[xlimit, ylimit] = meshgrid(-1:0.1:2, -1:0.1:2);
contour(-1:0.1:2, -1:0.1:2 , coeff_svd_noise{3}(1)*ylimit.^2+coeff_svd_noise{3}(2)*xlimit.*ylimit+coeff_svd_noise{3}(3)*xlimit+coeff_svd_noise{3}(4)*ylimit+coeff_svd_noise{3}(5)-xlimit.^2, [0, 0], 'g-');
contour(-1:0.1:2, -1:0.1:2 , coeff_svd_orig{3}(1)*ylimit.^2+coeff_svd_orig{3}(2)*xlimit.*ylimit+coeff_svd_orig{3}(3)*xlimit+coeff_svd_orig{3}(4)*ylimit+coeff_svd_orig{3}(5)-xlimit.^2, [0, 0], 'b-');
plot(new_x, new_y, 'rx');
title('effect on the plot of the orbit as the tolerance and rank vary')
xlabel('X-axis')
ylabel('Y-axis')
legend('noisy data curve','original data curve')

% [xlimit, ylimit] = meshgrid(-1:0.1:2, -1:0.1:2);
% contour(-1:0.1:2, -1:0.1:2 , coeff_svd_noise{4}(1)*ylimit.^2+coeff_svd_noise{4}(2)*xlimit.*ylimit+coeff_svd_noise{4}(3)*xlimit+coeff_svd_noise{4}(4)*ylimit+coeff_svd_noise{4}(5)-xlimit.^2, [0, 0], 'g-');
% contour(-1:0.1:2, -1:0.1:2 , coeff_svd_orig{4}(1)*ylimit.^2+coeff_svd_orig{4}(2)*xlimit.*ylimit+coeff_svd_orig{4}(3)*xlimit+coeff_svd_orig{4}(4)*ylimit+coeff_svd_orig{4}(5)-xlimit.^2, [0, 0], 'b-');
% plot(new_x, new_y, 'rx');
% title('effect on the plot of the orbit as the tolerance and rank vary')
% xlabel('X-axis')
% ylabel('Y-axis')
% legend('noisy data curve','original data curve')
 
% [xlimit, ylimit] = meshgrid(-1:0.1:2, -1:0.1:2);
% contour(-1:0.1:2, -1:0.1:2 , coeff_svd_noise{5}(1)*ylimit.^2+coeff_svd_noise{5}(2)*xlimit.*ylimit+coeff_svd_noise{5}(3)*xlimit+coeff_svd_noise{5}(4)*ylimit+coeff_svd_noise{5}(5)-xlimit.^2, [0, 0], 'g-');
% contour(-1:0.1:2, -1:0.1:2 , coeff_svd_orig{5}(1)*ylimit.^2+coeff_svd_orig{5}(2)*xlimit.*ylimit+coeff_svd_orig{5}(3)*xlimit+coeff_svd_orig{5}(4)*ylimit+coeff_svd_orig{5}(5)-xlimit.^2, [0, 0], 'b-');
% plot(new_x, new_y, 'rx');
% title('effect on the plot of the orbit as the tolerance and rank vary')
% xlabel('X-axis')
% ylabel('Y-axis')
% legend('noisy data curve','original data curve')
