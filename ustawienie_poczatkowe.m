function [ handles ] = ustawienie_poczatkowe(hObject, handles )

handles.current_data = '';
set(handles.pushbutton2,'Enable','off')
set(handles.iteracje_Edit,'String',sprintf('%s:\n','Iterations'))
set(handles.x1From,'String',-6)
set(handles.x1To,'String',6)
set(handles.x2From,'String',-6)
set(handles.x2To,'String',6)
handles.output = hObject;

set(handles.pushbutton2,'Enable','off'); % wylaczenie przycisku "compute"

%wylaczenie x3 x4 x5 x6
set(handles.x3_edit,'Enable','off');
set(handles.x4_edit,'Enable','off');
set(handles.x5_edit,'Enable','off');
set(handles.x6_edit,'Enable','off');

%wylaczenie rysowania
set(handles.plotInDDD,'Enable','off');
set(handles.contour,'Enable','off');

handles.results = '';
handles.start_x1 = 'x1';
handles.start_x2 = 'x2';
handles.result_plot_line = 'nic';
end

