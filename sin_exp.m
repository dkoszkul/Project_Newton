function [handles] = sin_exp(handles)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
handles.results = sin(x1)*sin(x2)*exp(-(x1.^2+x2.^2));
X=[2 2];

set(handles.x1_edit,'String',num2str(X(1),3));
handles.start_x1 = X(1);
set(handles.x2_edit,'String',num2str(X(2),3));
handles.start_x2 = X(2);
set(handles.functionEquation,'String','sin(x1)*sin(x2)*exp(-(x1^2+x2^2))');

end