function [y] = sin_exp(x1From,x1To,x2From,x2To)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
y = sin(x1)*sin(x2)*exp(-(x1.^2+x2.^2));

symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
ezcontour(y,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
hold on;
ezmesh(y,[x1From,x1To,x2From,x2To]);
title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end