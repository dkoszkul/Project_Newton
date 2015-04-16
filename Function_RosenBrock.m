function [y] = Function_RosenBrock()
%FUNCTION_ROSENBROCK Summary of this function goes here
%   Detailed explanation goes here

syms x x1 x2 x3;
y= 100*(x2-x1^2)^2+(1-x1)^2;
symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
ezmesh(y); %rysuje funkcje symboliczne
title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia

end

