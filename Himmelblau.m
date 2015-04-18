function [y] = Himmelblau(x1From,x1To,x2From,x2To)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
y = (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;

symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
ezcontour(y,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end