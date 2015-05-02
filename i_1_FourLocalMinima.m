function [handles] = i_1_FourLocalMinima(handles)
%I_1_FOURLOCALMINIMA Summary of this function goes here
%   Detailed explanation goes here

syms x x1 x2 x3;
handles.results= x1.^4+x2.^4-0.62*x1.^2-0.62*x2.^2;
X=[1 1];

set(handles.x1_edit,'String',num2str(X(1),3));
handles.start_x1 = X(1);
set(handles.x2_edit,'String',num2str(X(2),3));
handles.start_x2 = X(2);
set(handles.functionEquation,'String','x1^4+x2^4-0.62*x1^2-0.62*x2^2')
end

