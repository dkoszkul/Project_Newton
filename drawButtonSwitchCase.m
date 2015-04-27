function [ handles ] = drawButtonSwitchCase( handles )

switch handles.current_data
    case 'Function with four local minima'
        [handles.results]=i_1_FourLocalMinima();
        set(handles.functionEquation,'String','x1^4+x2^4-0.62*x1^2-0.62*x2^2')
    case 'Rosenbrock function'
        [handles.results]=Function_RosenBrock();
        set(handles.functionEquation,'String','100*(x2-x1^2)^2+(1-x1)^2');
    case 'Zangwill function'
        [handles.results]=Zangwill();
        set(handles.functionEquation,'String','(x1-x2+x3)^2+(-x1+x2+x3)^2+(x1+x2-x3)^2');
    case 'Goldsteina-Price function with four local minima'
        [handles.results]=Goldstein_price();
        set(handles.functionEquation,'String','(30+(1+(x1 + x2 + 1)^2)*19 - 14*x1 + 3*x1^2 - 14*x2 + 6*x1*x2 + 3*x2^2...');
    case 'Himmelblau modified function'
        [handles.results]=Himmelblau();
        set(handles.functionEquation,'String','(x1^2 + x2 - 11)^2 + (x1 + x2^2 - 7)^2');
    case 'Ackley function'
        [handles.results]=Ackley();
        set(handles.functionEquation,'String','-a*e(-b*sqrt((x1^2 + x2^2)/2)-e((cos(c*x1) + cos(c*x2))/2)+a+e');
    case 'Rastrigin function'
        [handles.results]=Rastrigin();
        set(handles.functionEquation,'String','x1^2 + x2^2 - 10*cos(2*pi*x1) - 10*cos(2*pi*x2) + 20');
    case 'Geem test function'
        [handles.results]=Geem();
        set(handles.functionEquation,'String','4*x1^2-2.1*x1^4+(1/3)*x1^6+x1*x2-4*x2^2+4*x2^4');
    case 'Sin-Cos-Exp function'
        [handles.results]=sin_exp();
        set(handles.functionEquation,'String','sin(x1)*sin(x2)*exp(-(x1^2+x2^2))');
end
end

