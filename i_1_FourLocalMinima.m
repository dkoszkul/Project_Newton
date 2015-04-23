function [y] = i_1_FourLocalMinima()
%I_1_FOURLOCALMINIMA Summary of this function goes here
%   Detailed explanation goes here

syms x x1 x2 x3;
y= x1.^4+x2.^4-0.62*x1.^2-0.62*x2.^2;

end

