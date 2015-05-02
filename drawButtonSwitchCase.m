function [ handles ] = drawButtonSwitchCase( handles )

switch handles.current_data
    case 'Function with four local minima'
        [handles]=i_1_FourLocalMinima(handles);
    case 'Rosenbrock function'
        [handles]=Function_RosenBrock(handles);
    case 'Zangwill function'
        [handles]=Zangwill(handles);
    case 'Goldsteina-Price function with four local minima'
        [handles]=Goldstein_price(handles);
    case 'Himmelblau modified function'
        [handles]=Himmelblau(handles);
    case 'Geem test function'
        [handles]=Geem(handles);
    case 'Sin-Cos-Exp function'
        [handles]=sin_exp(handles);
end
end

