function [handles] = Zangwill(handles)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
handles.results = (x1-x2+x3).^2+(-x1+x2+x3).^2+(x1+x2-x3).^2;
X=[100 -1 2.5];

set(handles.x1_edit,'String',num2str(X(1),3));
handles.start_x1 = X(1);
set(handles.x2_edit,'String',num2str(X(2),3));
handles.start_x2 = X(2);
set(handles.x3_edit,'String',num2str(X(3),3));
handles.start_x3 = X(3);
set(handles.functionEquation,'String','(x1-x2+x3)^2+(-x1+x2+x3)^2+(x1+x2-x3)^2');
%symvar(y); %wykrywa symbole zdefiniowane w funkcji zadanej
%ezcontour(y,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
%title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end