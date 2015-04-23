function [y] = Himmelblau()
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
y = (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;

end