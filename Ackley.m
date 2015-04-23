function [y] = Ackley()
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x x1 x2 x3;

    c = 2*pi;
    b = 0.2;
    a = 20;

y =-a.*exp(-b.*sqrt((x1.^2 + x2.^2)./2))-exp((cos(c.*x1) + cos(c.*x2))./2)+a+exp(1);

end