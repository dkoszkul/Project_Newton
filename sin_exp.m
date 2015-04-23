function [y] = sin_exp()
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
y = sin(x1)*sin(x2)*exp(-(x1.^2+x2.^2));

end