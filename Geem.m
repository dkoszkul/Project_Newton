function [handles] = Geem(handles)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x y x1 x2 x3;
handles.results = 4*x1.^2-2.1*x1.^4+(1/3)*x1.^6+x1*x2-4*x2.^2+4*x2.^4;

X=[0.2 0.9];

set(handles.x1_edit,'String',num2str(X(1),3));
handles.start_x1 = X(1);
set(handles.x2_edit,'String',num2str(X(2),3));
handles.start_x2 = X(2);

set(handles.functionEquation,'String','4*x1^2-2.1*x1^4+(1/3)*x1^6+x1*x2-4*x2^2+4*x2^4');

end