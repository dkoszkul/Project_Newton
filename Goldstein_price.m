function [y] = Goldstein_price()
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x x1 x2 x3;

y = (1 + ((x1 + x2 + 1).^2).*(19 - 14.*x1 + 3.*(x1.^2) - 14.*x2 + 6.*x1.*x2 + 3.*(x2.^2))).*(30 + ((2.*x1 - 3.*x2).^2).*(18 - 32.*x1 + 12.*(x1.^2) + 48.*x2 - 36.*x1.*x2 + 27.*(x2.^2)));
symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
ezmesh(y); %rysuje funkcje symboliczne
title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end