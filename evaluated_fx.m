function [y] = evaluated_fx(f, X)
%EVALUATED_FX Summary of this function goes here
%   Funkcja do obliczania wartosci funkcji zapisanej symbolicznie,
%   argumenty:
%       f - symboliczna postac obliczanej funkcji (moze to byc np wektor
%       lub macierz
%       X - wektor zawierajacy wartosci punktow w ktorych ma byc wyliczona
%       wartosc funkcji

syms x x1 x2 x3;
x1=X(1);
x2=X(2);
y=eval(f);
end

