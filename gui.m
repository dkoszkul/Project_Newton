function varargout = gui(varargin)
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

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)

[handles]=ustawienie_poczatkowe(hObject,handles); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Update handles structure
guidata(hObject, handles);

function varargout = gui_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- Executes on selection change in functionList.
function functionList_Callback(hObject, eventdata, handles)

contents = get(hObject,'Value');
str = get(hObject,'String');
handles.current_data = str{contents};
guidata(hObject, handles); %Jezeli zapisujemy jakas zmienna to trzeba uzyc
%tej funkcji, zeby byla ona widoczna w innych miejscach

function functionList_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in drawButton.
function drawButton_Callback(hObject, eventdata, handles)
cla; %clear plota
hold off; %reset plota

set(handles.x3_edit,'Enable','off');
set(handles.x4_edit,'Enable','off');
set(handles.x5_edit,'Enable','off');
set(handles.x6_edit,'Enable','off');
set(handles.plotInDDD,'Enable','off');
set(handles.contour,'Enable','off');
set(handles.plotInDDD,'Value',0);
set(handles.contour,'Value',0);

[handles]=drawButtonSwitchCase(handles);
guidata(hObject,handles); %update "handles'ow"

syms x x1 x2 x3 x4 x5 x6
handles.variables = symvar(handles.results); %wykrywa symbole zdefiniowane w funkcji zadanej
if(find(ismember(handles.variables,x3)))
    set(handles.x3_edit,'Enable','on');
end
if(find(ismember(handles.variables,x4)))
    set(handles.x4_edit,'Enable','on');
end
if(find(ismember(handles.variables,x5)))
    set(handles.x5_edit,'Enable','on');
end
if(find(ismember(handles.variables,x6)))
    set(handles.x6_edit,'Enable','on');
end

% wlaczenie mozliwosci rysownaia kiedy dwie zmienne
if(length(handles.variables)==2)
    set(handles.plotInDDD,'Enable','on');
    set(handles.contour,'Enable','on');
end

guidata(hObject,handles); %update "handles'ow"
if (isempty(handles.results) | strcmp(handles.start_x1,'x1') | strcmp(handles.start_x2,'x2'))  %sprawdzanie czy mamy jakies dane zapisane, zeby je przeliczyc
    set(handles.pushbutton2,'Enable','off') %brak danych - przycisk calculate wylaczony
else
    set(handles.pushbutton2,'Enable','on') %dane zeskladowane - mozna liczyc :)
end

function OwnFunction_Callback(hObject, eventdata, handles)
hold off; %reset plota

syms x y x1 x2 x3 x4 x5 x6
f = get(hObject,'String');
handles.variables = symvar(f); %wykrywa symbole zdefiniowane w funkcji zadanej

handles.results = sym(f);
guidata(hObject,handles); %update "handles'ow"
set(handles.functionEquation,'String',f);
if (isempty(handles.results) | handles.start_x1 == 'x1' | handles.start_x2 == 'x2')  %sprawdzanie czy mamy jakies dane zapiane, zeby je przeliczyc
    set(handles.pushbutton2,'Enable','off') %brak danych - przucisk calculate wylaczony
else
    set(handles.pushbutton2,'Enable','on') %dane zeskladowane - mozna liczyc :)
end

function OwnFunction_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_edit_Callback(hObject, eventdata, handles)
x2 = str2double(get(hObject,'String'));
handles.start_x2 = x2; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"
if (isempty(handles.results) | handles.start_x1 == 'x1' | handles.start_x2 == 'x2')  %sprawdzanie czy mamy jakies dane zapiane, zeby je przeliczyc
    set(handles.pushbutton2,'Enable','off') %brak danych - przucisk calculate wylaczony
else
    set(handles.pushbutton2,'Enable','on') %dane zeskladowane - mozna liczyc :)
end

% --- Executes during object creation, after setting all properties.
function x2_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_edit_Callback(hObject, eventdata, handles)
x1 = str2double(get(hObject,'String'));
handles.start_x1 = x1; %zachowywanie punktu startowego x1
guidata(hObject,handles); %update "handles'ow"
if (isempty(handles.results) | handles.start_x1 == 'x1' | handles.start_x2 == 'x2')  %sprawdzanie czy mamy jakies dane zapiane, zeby je przeliczyc
    set(handles.pushbutton2,'Enable','off') %brak danych - przucisk calculate wylaczony
else
    set(handles.pushbutton2,'Enable','on') %dane zeskladowane - mozna liczyc :)
end

function x1_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton2_Callback(hObject, eventdata, handles)
y=handles.results;
syms x x1 x2 x3 x4 x5 x6 C;
G=gradient(y);         %liczy gradient symbolicznie
H=hessian(y, [x1 x2 x3 x4 x5]); %liczy hessian symbolicznie
H=C.*H;
H( all( isAlways(H==0) ,2) ,:) = [];
H( : ,all( isAlways(H==0) ,1)) = [];
%obliczanie kierunku z metody newtona - d
d = -inv(H)*G;

X_temp = [handles.start_x1; handles.start_x2];
ilosc_zmiennych = 2;
if(find(ismember(handles.variables,x3)))
    X_temp = [X_temp; handles.start_x3];
    ilosc_zmiennych=3;
end
if(find(ismember(handles.variables,x4)))
    X_temp = [X_temp; handles.start_x4];
    ilosc_zmiennych=4;
end
if(find(ismember(handles.variables,x5)))
    X_temp = [X_temp; handles.start_x5];
    ilosc_zmiennych=5;
end
if(find(ismember(handles.variables,x6)))
    X_temp = [X_temp; handles.start_x6];
    ilosc_zmiennych=6;
end

%parametry metody newtona
epsilon = str2double(get(handles.newtonEpsilon,'String'));       %warunek stopu (1)
epsilon2 = str2double(get(handles.newtonEpsilon2,'String'));     %warunek stopu (2) - roznica kolejnego punktu od poprzedniego
epsilon3 = str2double(get(handles.newtonEpsilon3,'String'));     %warunek soptu (3) - roznica wartosci funkcji w kolejnych punktach
licznik_iteracji = 0;   %warunek stopu (3)
max_iteracji = str2double(get(handles.loopsQuantity,'String'));
tekst=cell(2*max_iteracji,1);
%%%%%%%%%%%%%%%%%%%%%%%%%
%parametry metody Goldstein'a
t_l=str2double(get(handles.tl,'String')); %wspolczynniki kroku
t_r=str2double(get(handles.tr,'String'));
beta = str2double(get(handles.beta,'String')); %wspolczynnik testu
max_iteracji_goldstein = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t=4.5;
%%%%%% tutaj powinna byc petla calego algorytmu %%%%%%%%%%
X= X_temp;
X_previous=X*2;
i=1;
while 1
    hold on;
    %zachowamy sobie w pamieci d jako rownania symboliczne, a podstawiac
    %bedziemy konkretne punkty do zmiennej d_val
    d_val = evaluated_fx(d, X); %liczy wartosc kieruneku w punktach x1, x2
    if(d_val'*d_val <= epsilon || licznik_iteracji>=max_iteracji || norm(X_previous-X) <= epsilon2 || norm(evaluated_fx(y, X_previous)-evaluated_fx(y, X)) <= epsilon3 ) %  gradient jest wystarczajaco blisko zera
        %(tzn. zerowy spadek w kazdym kierunku a wiec minimum)
        break
    end
    %%%%%%%%%% %metoda minimum w kierunku %%%%%%%%%%%%%%
    % krok 1 - oblicz pochodna w kierunku
    [ t,t_r,t_l ] = GoldsteinTest( t,t_r,t_l,X,G, beta,d_val,y,max_iteracji_goldstein);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    alfa = t;
    %%%%%%%%%% %metoda minimum w kierunku %%%%%%%%%%%%%%
    X_previous =X;
    X = X+alfa*d_val;
    wartosc_previous = evaluated_fx(y, X_previous);
    wartosc = evaluated_fx(y, X);
    if(ilosc_zmiennych<=2)
        handles.result_plot_line = plot3([X_previous(1),X(1)],[X_previous(2),X(2)], [wartosc_previous, wartosc], 'r','LineWidth',2);
        handles.result_plot_dot = plot3(X(1),X(2),wartosc,'*');
    end

   % guidata(hObject,handles); %update "handles'ow"

    licznik_iteracji=licznik_iteracji+1;
    %sprintf('%d:   %d ',licznik_iteracji,X)
    punkty = sprintf('%d;  ',X);
    tekst(i) =cellstr(sprintf('%d. %s f(x)=%d, K:%d',licznik_iteracji,punkty,wartosc, d_val'*d_val));
    i=i+1;
    
end
ekstremum_type=checkSubmatrices(evaluated_fx(H,X));
text_to_check = 'local minimum or maximum not achieved';
if(strcmp(ekstremum_type,text_to_check))
    set(handles.iteracje_Edit,'String',text_to_check);
    set(handles.pointType,'String',text_to_check);
    set(handles.result_Edit,'String',text_to_check);
else
    set(handles.iteracje_Edit,'String',tekst);
    wartosc_koncowa = evaluated_fx(y, X);
    punkty = sprintf('%d;  ',X);
    set(handles.pointType,'String',checkSubmatrices(evaluated_fx(H,X)));
    pole_wyniku = cellstr(sprintf('x=[  %s]; \n f(x)=%d \n K:%d', punkty, wartosc_koncowa, d_val'*d_val));
    set(handles.result_Edit,'String',pole_wyniku);
end

%%%%%% tutaj powinna byc petla calego algorytmu %%%%%%%%%%



function x3_edit_Callback(hObject, eventdata, handles)
x3 = str2double(get(hObject,'String'));
handles.start_x3 = x3; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"

% --- Executes during object creation, after setting all properties.
function x3_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function x4_edit_Callback(hObject, eventdata, handles)
x4 = str2double(get(hObject,'String'));
handles.start_x4 = x4; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"

% --- Executes during object creation, after setting all properties.
function x4_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function x5_edit_Callback(hObject, eventdata, handles)
x5 = str2double(get(hObject,'String'));
handles.start_x5 = x5; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"

% --- Executes during object creation, after setting all properties.
function x5_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function x6_edit_Callback(hObject, eventdata, handles)
x6 = str2double(get(hObject,'String'));
handles.start_x6 = x6; %zachowywanie punktu startowego x2
guidata(hObject,handles); %update "handles'ow"

% --- Executes during object creation, after setting all properties.
function x6_edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in contour.
function contour_Callback(hObject, eventdata, handles)
state = get(hObject,'Value');
set(handles.plotInDDD,'Value',0);
if(state == 0)
    cla; %clear plota
else
    %---------------pobranie zakresów dla plota------%
    x1From = str2double(get(handles.x1From,'String'));
    x1To = str2double(get(handles.x1To,'String'));
    x2From = str2double(get(handles.x2From,'String'));
    x2To = str2double(get(handles.x2To,'String'));
    
    y=handles.results;
    syms x x1 x2 x3 x4 x5 x6 C;
    symvar(y);
    ezcontour(y,[x1From,x1To,x2From,x2To]); %rysuje funkcje symboliczne
    hold on;
    grid on;
    title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end


% --- Executes on button press in plotInDDD.
function plotInDDD_Callback(hObject, eventdata, handles)
state = get(hObject,'Value');
set(handles.contour,'Value',0);
if(state == 0)
    cla; %clear plota
else
    %---------------pobranie zakresów dla plota------%
    x1From = str2double(get(handles.x1From,'String'));
    x1To = str2double(get(handles.x1To,'String'));
    x2From = str2double(get(handles.x2From,'String'));
    x2To = str2double(get(handles.x2To,'String'));
    
    y=handles.results;
    syms x x1 x2 x3 x4 x5 x6 C;
    symvar(y);
    ezmesh(y,[x1From,x1To,x2From,x2To]);
    hold on;
    title([]); %usuwa tytu³ dla ezmesh. jakis lipny strasznie siê pojawia
end


function functionEquation_Callback(hObject, eventdata, handles)
function functionEquation_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function newtonEpsilon2_Callback(hObject, eventdata, handles)
function newtonEpsilon2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function newtonEpsilon3_Callback(hObject, eventdata, handles)
function newtonEpsilon3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function parametersEdit_Callback(hObject, eventdata, handles)
function parametersEdit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function tr_Callback(hObject, eventdata, handles)
function tr_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function beta_Callback(hObject, eventdata, handles)
function beta_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function loopsQuantity_Callback(hObject, eventdata, handles)
function loopsQuantity_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function newtonEpsilon_Callback(hObject, eventdata, handles)
function newtonEpsilon_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function tl_Callback(hObject, eventdata, handles)
function tl_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function iteracje_Edit_Callback(hObject, eventdata, handles)
function iteracje_Edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function result_Edit_Callback(hObject, eventdata, handles)
function result_Edit_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function x1From_Callback(hObject, eventdata, handles)
function x1From_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function x1To_Callback(hObject, eventdata, handles)
function x1To_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function x2From_Callback(hObject, eventdata, handles)
function x2From_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function x2To_Callback(hObject, eventdata, handles)
function x2To_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pointType_Callback(hObject, eventdata, handles)
% hObject    handle to pointType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointType as text
%        str2double(get(hObject,'String')) returns contents of pointType as a double


% --- Executes during object creation, after setting all properties.
function pointType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
