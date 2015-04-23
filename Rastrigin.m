 function [y] = Rastrigin()
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here

syms x x1 x2 x3;
y =x1.^2 + x2.^2 - 10.*cos(2.*pi.*x1) - 10.*cos(2.*pi.*x2) + 20;

 end
