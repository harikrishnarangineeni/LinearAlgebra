clc;
clear all;

%Trapezoidal Rule
x = 1:13; 
y = log(sqrt(1 + ((x/13).^(-2))));
z = trapz(x,y)/13

%z1=simp(x,y)/13;

% 13 intervals were required 