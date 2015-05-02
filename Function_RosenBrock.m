function [handles] = Function_RosenBrock(handles)
%FUNCTION_ROSENBROCK Summary of this function goes here
%   Detailed explanation goes here

syms x x1 x2 x3;
handles.results= 100*(x2-x1^2)^2+(1-x1)^2;
X=[-1.2 1];

set(handles.x1_edit,'String',num2str(X(1),3));
handles.start_x1 = X(1);
set(handles.x2_edit,'String',num2str(X(2),3));
handles.start_x2 = X(2);
set(handles.pushbutton2,'Enable','on')
set(handles.functionEquation,'String','100*(x2-x1^2)^2+(1-x1)^2');
end

