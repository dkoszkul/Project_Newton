function [y] = Geem(x1From,x1To,x2From,x2To)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
y = 4*x1.^2-2.1*x1.^4+(1/3)*x1.^6+x1*x2-4*x2.^2+4*x2.^4;

symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
ezcontour(y,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end