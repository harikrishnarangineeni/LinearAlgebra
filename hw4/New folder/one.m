clear all;
close all;
clc;

x = [1.02; 0.95; 0.87; 0.77; 0.67; 0.56; 0.44; 0.30; 0.16; 0.01];
y = [0.39; 0.32; 0.27; 0.22; 0.18; 0.15; 0.13; 0.12; 0.13; 0.15];

%%% Formulate a linear regression & computing coefficients%%%

A = [y.^2 x.*y x y ones(size(x))];
B = x.^2;
disp('(a)');
figure(1); 
hold on;

coeff = A\B;

coeff

%%% plot %%%
[xlimit, ylimit] = meshgrid(-1:0.1:2, -1:0.1:2);
contour(-1:0.1:2, -1:0.1:2 , coeff(1)*ylimit.^2+coeff(2)*xlimit.*ylimit+coeff(3)*xlimit+coeff(4)*ylimit+coeff(5)-xlimit.^2, [0, 0], 'b-');
plot(x, y, 'rx');
title('Plotting data points and curve fitting')
xlabel('X-axis')
ylabel('Y-axis')
legend('planets orbit','given data points (x,y)')

