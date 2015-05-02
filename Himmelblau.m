function [handles] = Himmelblau(handles)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
handles.results = (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;
X=[-5 5];

set(handles.x1_edit,'String',num2str(X(1),3));
handles.start_x1 = X(1);
set(handles.x2_edit,'String',num2str(X(2),3));
handles.start_x2 = X(2);

set(handles.functionEquation,'String','(x1^2 + x2 - 11)^2 + (x1 + x2^2 - 7)^2');

end