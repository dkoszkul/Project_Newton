function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 20-Apr-2015 19:17:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @gui_OpeningFcn, ...
    'gui_OutputFcn',  @gui_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)
% Choose default command line output for gui
handles.current_data = '';
set(handles.pushbutton2,'Enable','off')
set(handles.iteracje_Edit,'String',sprintf('%s:\n','Iterations'))
set(handles.x1From,'String',-6)
set(handles.x1To,'String',6)
set(handles.x2From,'String',-6)
set(handles.x2To,'String',6)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.pushbutton2,'Enable','off'); % wylaczenie przycisku "compute"

%wylaczenie x3 x4 x5 x6
set(handles.edit16_x3,'Enable','off');
set(handles.edit17_x4,'Enable','off');
set(handles.edit18_x5,'Enable','off');
set(handles.edit19_x6,'Enable','off');

handles.results = '';
handles.start_x1 = 'x1';
handles.start_x2 = 'x2';
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in functionList.
function functionList_Callback(hObject, eventdata, handles)
% hObject    handle to functionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = get(hObject,'Value');
str = get(hObject,'String');
handles.current_data = str{contents};
guidata(hObject, handles); %Jezeli zapisujemy jakas zmienna to trzeba uzyc
%tej funkcji, zeby byla ona widoczna w innych
%miejscach

% Hints: contents = cellstr(get(hObject,'String')) returns functionList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from functionList


% --- Executes during object creation, after setting all properties.
function functionList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to functionList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in drawButton.
function drawButton_Callback(hObject, eventdata, handles)
hold off; %reset plota
%---------------pobranie zakresów dla plota------%
x1From = str2double(get(handles.x1From,'String'));
x1To = str2double(get(handles.x1To,'String'));
x2From = str2double(get(handles.x2From,'String'));
x2To = str2double(get(handles.x2To,'String'));
set(handles.edit16_x3,'Enable','off');
set(handles.edit17_x4,'Enable','off');
set(handles.edit18_x5,'Enable','off');
set(handles.edit19_x6,'Enable','off');
switch handles.current_data
    case 'Function with four local minima'
        [handles.results]=i_1_FourLocalMinima(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','x1^4+x2^4-0.62*x1^2-0.62*x2^2')
    case 'Rosenbrock function'
        [handles.results]=Function_RosenBrock(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','100*(x2-x1^2)^2+(1-x1)^2');
    case 'Zangwill function'
        [handles.results]=Zangwill(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','(x1-x2+x3)^2+(-x1+x2+x3)^2+(x1+x2-x3)^2');
    case 'Goldsteina-Price function with four local minima'
        [handles.results]=Goldstein_price(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','(30+(1+(x1 + x2 + 1)^2)*19 - 14*x1 + 3*x1^2 - 14*x2 + 6*x1*x2 + 3*x2^2...');
    case 'Himmelblau modified function'
        [handles.results]=Himmelblau(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','(x1^2 + x2 - 11)^2 + (x1 + x2^2 - 7)^2');
    case 'Ackley function'
        [handles.results]=Ackley(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','-a*e(-b*sqrt((x1^2 + x2^2)/2)-e((cos(c*x1) + cos(c*x2))/2)+a+e');
    case 'Rastrigin function'
        [handles.results]=Rastrigin(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','x1^2 + x2^2 - 10*cos(2*pi*x1) - 10*cos(2*pi*x2) + 20');
    case 'Geem test function'
        [handles.results]=Geem(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','4*x1^2-2.1*x1^4+(1/3)*x1^6+x1*x2-4*x2^2+4*x2^4');
    case 'Sin-Cos-Exp function'
        [handles.results]=sin_exp(x1From,x1To,x2From,x2To);
        set(handles.functionEquation,'String','sin(x1)*sin(x2)*exp(-(x1^2+x2^2))');
end

syms x x1 x2 x3 x4 x5 x6
guidata(hObject,handles); %update "handles'ow"
handles.variables = symvar(handles.results); %wykrywa symbole zdefiniowane w funkcji zadanej
if(find(ismember(handles.variables,x3)))
    set(handles.edit16_x3,'Enable','on');
end
if(find(ismember(handles.variables,x4)))
    set(handles.edit17_x4,'Enable','on');
end
if(find(ismember(handles.variables,x5)))
    set(handles.edit18_x5,'Enable','on');
end
if(find(ismember(handles.variables,x6)))
    set(handles.edit19_x6,'Enable','on');
end

guidata(hObject,handles); %update "handles'ow"
if (isempty(handles.results) | handles.start_x1 == 'x1' | handles.start_x2 == 'x2')  %sprawdzanie czy mamy jakies dane zapiane, zeby je przeliczyc
    set(handles.pushbutton2,'Enable','off') %brak danych - przucisk calculate wylaczony
else
    set(handles.pushbutton2,'Enable','on') %dane zeskladowane - mozna liczyc :)
end

function functionEquation_Callback(hObject, eventdata, handles)
% hObject    handle to functionEquation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of functionEquation as text
%        str2double(get(hObject,'String')) returns contents of functionEquation as a double


% --- Executes during object creation, after setting all properties.
function functionEquation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to functionEquation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function parametersEdit_Callback(hObject, eventdata, handles)
% hObject    handle to parametersEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of parametersEdit as text
%        str2double(get(hObject,'String')) returns contents of parametersEdit as a double


% --- Executes during object creation, after setting all properties.
function parametersEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to parametersEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OwnFunction_Callback(hObject, eventdata, handles)
% hObject    handle to OwnFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off; %reset plota
%---------------pobranie zakresów dla plota------%
x1From = str2double(get(handles.x1From,'String'));
x1To = str2double(get(handles.x1To,'String'));
x2From = str2double(get(handles.x2From,'String'));
x2To = str2double(get(handles.x2To,'String'));
syms x y x1 x2 x3 x4 x5 x6
f = get(hObject,'String');
handles.variables = symvar(f); %wykrywa symbole zdefiniowane w funkcji zadanej

if(length(handles.variables) == 2)
    ezcontour(f,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
    hold on;
    %ezmesh(f,[x1From,x1To,x2From,x2To]);
    title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end
handles.results = sym(f);
guidata(hObject,handles); %update "handles'ow"
set(handles.functionEquation,'String',f);
if (isempty(handles.results) | handles.start_x1 == 'x1' | handles.start_x2 == 'x2')  %sprawdzanie czy mamy jakies dane zapiane, zeby je przeliczyc
    set(handles.pushbutton2,'Enable','off') %brak danych - przucisk calculate wylaczony
else
    set(handles.pushbutton2,'Enable','on') %dane zeskladowane - mozna liczyc :)
end


% Hints: get(hObject,'String') returns contents of OwnFunction as text
%        str2double(get(hObject,'String')) returns contents of OwnFunction as a double


% --- Executes during object creation, after setting all properties.
function OwnFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OwnFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
x2 = str2double(get(hObject,'String'));
handles.start_x2 = x2; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"
if (isempty(handles.results) | handles.start_x1 == 'x1' | handles.start_x2 == 'x2')  %sprawdzanie czy mamy jakies dane zapiane, zeby je przeliczyc
    set(handles.pushbutton2,'Enable','off') %brak danych - przucisk calculate wylaczony
else
    set(handles.pushbutton2,'Enable','on') %dane zeskladowane - mozna liczyc :)
end

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
x1 = str2double(get(hObject,'String'));
handles.start_x1 = x1; %zachowywanie punktu startowego x1
guidata(hObject,handles); %update "handles'ow"
if (isempty(handles.results) | handles.start_x1 == 'x1' | handles.start_x2 == 'x2')  %sprawdzanie czy mamy jakies dane zapiane, zeby je przeliczyc
    set(handles.pushbutton2,'Enable','off') %brak danych - przucisk calculate wylaczony
else
    set(handles.pushbutton2,'Enable','on') %dane zeskladowane - mozna liczyc :)
end


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y=handles.results;
syms x x1 x2 x3 x4 x5 x6 C;
G=gradient(y);         %liczy gradient symbolicznie
H=hessian(y, [x1 x2 x3 x4 x5]); %liczy hessian symbolicznie
H=C.*H;
H( all( isAlways(H==0) ,2) ,:) = [];
H( : ,all( isAlways(H==0) ,1)) = [];
%obliczanie kierunku z metody newtona - d
d = -inv(H)*G;

handles.variables
X_temp = [handles.start_x1; handles.start_x2];
if(find(ismember(handles.variables,x3)))
    X_temp = [X_temp; handles.start_x3];
end
if(find(ismember(handles.variables,x4)))
    X_temp = [X_temp; handles.start_x4];
end
if(find(ismember(handles.variables,x5)))
    X_temp = [X_temp; handles.start_x5];
end
if(find(ismember(handles.variables,x6)))
    X_temp = [X_temp; handles.start_x6];
end

%parametry metody newtona
epsilon = 10^-15;        %warunek stopu (1)
licznik_iteracji = 0;   %warunek stopu (2)
max_iteracji = 100;
tekst=cell(2*max_iteracji,1);
%%%%%%%%%%%%%%%%%%%%%%%%%

%parametry metody Goldstein'a
t_l=0; %wspolczynniki kroku
t_r=9;
beta = 0.4; %wspolczynnik testu
licznik_iteracji_goldstein = 0;   %warunek stopu (2)
max_iteracji_goldstein = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t=4.5;
%%%%%% tutaj powinna byc petla calego algorytmu %%%%%%%%%%
X= X_temp;
i=1;
while 1
    hold on;
    
    %zachowamy sobie w pamieci d jako rownania symboliczne, a podstawiac
    %bedziemy konkretne punkty do zmiennej d_val
    d_val = evaluated_fx(d, X); %liczy wartosc kieruneku w punktach x1, x2
    sprintf('X: %d',X)
    X
    sprintf('Wartosc y: %d',evaluated_fx(y, X))
    sprintf('Wartosc d_val*d_val:%d ::: %d',d_val,d_val'*d_val)
    sprintf('\n')
    if(d_val'*d_val <= epsilon || licznik_iteracji>max_iteracji) %  gradient jest wystarczajaco blisko zera
        %(tzn. zerowy spadek w kazdym kierunku a wiec minimum)
        break
    end
    
    %%%%%%%%%% %metoda nimum w kierunku %%%%%%%%%%%%%%
    licznik_iteracji_goldstein = 0; %zerowanie licznika iteracji dla minimum w kierunku
    
    % krok 1 - oblicz pochodna w kierunku
    p=evaluated_fx(G, X)'*d_val;
    while 1
        % krok 2 - obliczanie f(x0) oraz f(x0+ td);
        t=0.5*(t_l+t_r);
        f_x_td=evaluated_fx(y, X + t*d_val);
        f_x = evaluated_fx(y, X);
        % krok 3 - sprawdzanie warunku mniejszosci/wiekszosci
        if(f_x_td < (f_x + (1-beta)*p*t))
            t_l=t;
        end
        % krok 4 - t_r => t
        if(f_x_td > (f_x + beta*p*t))
            t_r=t;
        end
        if((f_x_td >= (f_x + (1-beta)*p*t)) && (f_x_td <= (f_x + beta*p*t)))
            break
        end
        if(licznik_iteracji_goldstein>max_iteracji_goldstein)
            break
        end
        %zwiekszanie licznika iteracji dla petli minimum w kierunku
        licznik_iteracji_goldstein=licznik_iteracji_goldstein+1;
    end
    alfa = t;
    %%%%%%%%%% %metoda nimum w kierunku %%%%%%%%%%%%%%
    X_previous =X;
    X = X+alfa*d_val;
    wartosc_previous = evaluated_fx(y, X_previous);
    wartosc = evaluated_fx(y, X);
    if(rank(X)<=2)
        plot3([X_previous(1),X(1)],[X_previous(2),X(2)], [wartosc_previous, wartosc], 'r','LineWidth',2);
        plot3(X(1),X(2),wartosc,'*');
    end
    licznik_iteracji=licznik_iteracji+1;
    %sprintf('%d:   %d ',licznik_iteracji,X)
    punkty = sprintf('%d;  ',X);
    tekst(i) =cellstr(sprintf('%d. punkty: %s  wynik: %d',licznik_iteracji,punkty,wartosc));
    i=i+1;
    set(handles.iteracje_Edit,'String',tekst);
end
X;
set(handles.result_Edit,'String',num2str(X));
tekst;
%%%%%% tutaj powinna byc petla calego algorytmu %%%%%%%%%%



function iteracje_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to iteracje_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iteracje_Edit as text
%        str2double(get(hObject,'String')) returns contents of iteracje_Edit as a double


% --- Executes during object creation, after setting all properties.
function iteracje_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteracje_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to result_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result_Edit as text
%        str2double(get(hObject,'String')) returns contents of result_Edit as a double


% --- Executes during object creation, after setting all properties.
function result_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1From_Callback(hObject, eventdata, handles)
% hObject    handle to x1From (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1From as text
%        str2double(get(hObject,'String')) returns contents of x1From as a double


% --- Executes during object creation, after setting all properties.
function x1From_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1From (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1To_Callback(hObject, eventdata, handles)
% hObject    handle to x1To (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1To as text
%        str2double(get(hObject,'String')) returns contents of x1To as a double


% --- Executes during object creation, after setting all properties.
function x1To_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1To (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2From_Callback(hObject, eventdata, handles)
% hObject    handle to x2From (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2From as text
%        str2double(get(hObject,'String')) returns contents of x2From as a double


% --- Executes during object creation, after setting all properties.
function x2From_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2From (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2To_Callback(hObject, eventdata, handles)
% hObject    handle to x2To (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2To as text
%        str2double(get(hObject,'String')) returns contents of x2To as a double


% --- Executes during object creation, after setting all properties.
function x2To_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2To (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_x3_Callback(hObject, eventdata, handles)
% hObject    handle to edit16_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16_x3 as text
%        str2double(get(hObject,'String')) returns contents of edit16_x3 as a double
x3 = str2double(get(hObject,'String'));
handles.start_x3 = x3; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"

% --- Executes during object creation, after setting all properties.
function edit16_x3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_x4_Callback(hObject, eventdata, handles)
% hObject    handle to edit17_x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17_x4 as text
%        str2double(get(hObject,'String')) returns contents of edit17_x4 as a double
x4 = str2double(get(hObject,'String'));
handles.start_x4 = x4; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"

% --- Executes during object creation, after setting all properties.
function edit17_x4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17_x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_x5_Callback(hObject, eventdata, handles)
% hObject    handle to edit18_x5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18_x5 as text
%        str2double(get(hObject,'String')) returns contents of edit18_x5 as a double
x5 = str2double(get(hObject,'String'));
handles.start_x5 = x5; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"

% --- Executes during object creation, after setting all properties.
function edit18_x5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18_x5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_x6_Callback(hObject, eventdata, handles)
% hObject    handle to edit19_x6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19_x6 as text
%        str2double(get(hObject,'String')) returns contents of edit19_x6 as a double
x6 = str2double(get(hObject,'String'));
handles.start_x6 = x6; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"

% --- Executes during object creation, after setting all properties.
function edit19_x6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19_x6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
