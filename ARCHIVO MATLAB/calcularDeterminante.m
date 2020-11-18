function varargout = calcularDeterminante(varargin)
% CALCULARDETERMINANTE MATLAB code for calcularDeterminante.fig
%      CALCULARDETERMINANTE, by itself, creates a new CALCULARDETERMINANTE or raises the existing
%      singleton*.
%
%      H = CALCULARDETERMINANTE returns the handle to a new CALCULARDETERMINANTE or the handle to
%      the existing singleton*.
%
%      CALCULARDETERMINANTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULARDETERMINANTE.M with the given input arguments.
%
%      CALCULARDETERMINANTE('Property','Value',...) creates a new CALCULARDETERMINANTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calcularDeterminante_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calcularDeterminante_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help calcularDeterminante

% Last Modified by GUIDE v2.5 17-Nov-2020 20:01:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calcularDeterminante_OpeningFcn, ...
                   'gui_OutputFcn',  @calcularDeterminante_OutputFcn, ...
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


% --- Executes just before calcularDeterminante is made visible.
function calcularDeterminante_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calcularDeterminante (see VARARGIN)

% Choose default command line output for calcularDeterminante
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes calcularDeterminante wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = calcularDeterminante_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function Fila_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fila (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Columna_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Columna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
% hObject    handle to calcular (see GCBO)
 columna = str2double(get(handles.Columna,'String'));
 fila = str2double(get(handles.Fila,'String'));

 if isnan(fila) || isnan(columna) 
    warndlg('Los cuadros para insertar las filas y columnas deben de ser números.');
 else
         A = get(handles.Matriz,'data');
         A = str2double(A);

         respuesta = det(A)
         set(handles.resultado,'String', respuesta);
 end


% --- Executes on button press in InsertarFilasColumnas.
function InsertarFilasColumnas_Callback(hObject, eventdata, handles)
% hObject    handle to InsertarFilasColumnas (see GCBO)
fila=str2double(get(handles.Fila,'String'));
columna=str2double(get(handles.Columna,'String'));

if isnan(fila) || isnan(columna)
    warndlg('Los cuadros deben de tener números.');
else
    if fila ~= columna
        warndlg('La matriz debe de ser cuadrada.');
    else
        tamano=cell(fila,columna);
        tamano(:,:)={''};
        set(handles.Matriz,'Data',tamano);
        set(handles.Matriz,'ColumnEditable',true(1,columna));
    end
end


% --- Executes on button press in limpiar.
function limpiar_Callback(hObject, eventdata, handles)
set(handles.Fila,'String','');
set(handles.Columna,'String','');
set(handles.resultado,'String','');
set(handles.Matriz, 'Data', {})


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when entered data in editable cell(s) in Matriz.
function Matriz_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Matriz (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
