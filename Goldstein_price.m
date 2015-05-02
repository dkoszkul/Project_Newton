function [handles] = Goldstein_price(handles)
%Goldstein-price Summary of this function goes here
%   Detailed explanation goes here
syms x x1 x2 x3;

handles.results = (1 + ((x1 + x2 + 1).^2).*(19 - 14.*x1 + 3.*(x1.^2) - 14.*x2 + 6.*x1.*x2 + 3.*(x2.^2))).*(30 + ((2.*x1 - 3.*x2).^2).*(18 - 32.*x1 + 12.*(x1.^2) + 48.*x2 - 36.*x1.*x2 + 27.*(x2.^2)));
X=[1 2];

set(handles.x1_edit,'String',num2str(X(1),3));
handles.start_x1 = X(1);
set(handles.x2_edit,'String',num2str(X(2),3));
handles.start_x2 = X(2);

set(handles.functionEquation,'String','(30+(1+(x1 + x2 + 1)^2)*19 - 14*x1 + 3*x1^2 - 14*x2 + 6*x1*x2 + 3*x2^2...');

end