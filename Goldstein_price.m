function [y] = Goldstein_price(x1From,x1To,x2From,x2To)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x x1 x2 x3;

y = (1 + ((x1 + x2 + 1).^2).*(19 - 14.*x1 + 3.*(x1.^2) - 14.*x2 + 6.*x1.*x2 + 3.*(x2.^2))).*(30 + ((2.*x1 - 3.*x2).^2).*(18 - 32.*x1 + 12.*(x1.^2) + 48.*x2 - 36.*x1.*x2 + 27.*(x2.^2)));
symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
ezcontour(y,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
title([]); %usuwa tytu� dla ezmesh. jakis lipny strasznie si� pojawia
end