function [y] = Function_RosenBrock(x1From,x1To,x2From,x2To)
%FUNCTION_ROSENBROCK Summary of this function goes here
%   Detailed explanation goes here

syms x x1 x2 x3;
y= 100*(x2-x1^2)^2+(1-x1)^2;
symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
ezcontour(y,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia

end

