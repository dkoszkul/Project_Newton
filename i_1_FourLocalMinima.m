function [y] = i_1_FourLocalMinima(x1From,x1To,x2From,x2To)
%I_1_FOURLOCALMINIMA Summary of this function goes here
%   Detailed explanation goes here

syms x x1 x2 x3;
y= x1.^4+x2.^4-0.62*x1.^2-0.62*x2.^2;
symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
ezcontour(y,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end

