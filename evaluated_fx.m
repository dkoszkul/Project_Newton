function [y] = evaluated_fx(f, X)
%EVALUATED_FX Summary of this function goes here
%   Funkcja do obliczania wartosci funkcji zapisanej symbolicznie,
%   argumenty:
%       f - symboliczna postac obliczanej funkcji (moze to byc np wektor
%       lub macierz
%       X - wektor zawierajacy wartosci punktow w ktorych ma byc wyliczona
%       wartosc funkcji

syms x x1 x2 x3 x4 x5 x6 C;
C=1;
x1=X(1);
x2=X(2);
if(length(X) >= 3)
    x3=X(3);
end
if(length(X) >= 4)
    x4=X(4);
end
if(length(X) >= 5)
    x5=X(5);
end
if(length(X) >= 6)
    x6=X(6);
end

y=eval(f);
end

