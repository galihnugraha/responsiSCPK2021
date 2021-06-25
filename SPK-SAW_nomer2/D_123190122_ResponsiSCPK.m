function varargout = D_123190122_ResponsiSCPK(varargin)
% D_123190122_RESPONSISCPK MATLAB code for D_123190122_ResponsiSCPK.fig
%      D_123190122_RESPONSISCPK, by itself, creates a new D_123190122_RESPONSISCPK or raises the existing
%      singleton*.
%
%      H = D_123190122_RESPONSISCPK returns the handle to a new D_123190122_RESPONSISCPK or the handle to
%      the existing singleton*.
%
%      D_123190122_RESPONSISCPK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in D_123190122_RESPONSISCPK.M with the given input arguments.
%
%      D_123190122_RESPONSISCPK('Property','Value',...) creates a new D_123190122_RESPONSISCPK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before D_123190122_ResponsiSCPK_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to D_123190122_ResponsiSCPK_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help D_123190122_ResponsiSCPK

% Last Modified by GUIDE v2.5 25-Jun-2021 18:10:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @D_123190122_ResponsiSCPK_OpeningFcn, ...
                   'gui_OutputFcn',  @D_123190122_ResponsiSCPK_OutputFcn, ...
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


% --- Executes just before D_123190122_ResponsiSCPK is made visible.
function D_123190122_ResponsiSCPK_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to D_123190122_ResponsiSCPK (see VARARGIN)

% Choose default command line output for D_123190122_ResponsiSCPK
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes D_123190122_ResponsiSCPK wait for user response (see UIRESUME)
% uiwait(handles.figure1);

tabel = readmatrix('DATA RUMAH.xlsx');
nomorRumah = tabel(:,1);
data2 = tabel(:,3:8);
data = [nomorRumah data2];
set(handles.uitable1,'data',data);



% --- Outputs from this function are returned to the command line.
function varargout = D_123190122_ResponsiSCPK_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%ambil data dari dataset dan soal
tabel = readmatrix('DATA RUMAH.xlsx');
nomorRumah = tabel(:,1);
x = tabel(:,3:8);
k = [0,1,1,1,1,1];
w = [0.30,0.20,0.23,0.10,0.07,0.10];

%tahapan 1. normalisasi matriks
[m, n] = size (x); %matriks m x n dengan ukuran sebanyak variabel x (input)
R = zeros (m,n); %membuat matriks R, yang merupakan matriks kosong
Y = zeros (m,n); %membuat matriks Y, yang merupakan titik kosong
for j = 1:n
 if k(j) == 1 %statement untuk kriteria dengan atribut keuntungan
  R(:,j) = x(:,j)./max(x(:,j));
 else
  R(:,j) = min(x(:,j)) ./ x(:,j);
 end
end

%tahapan kedua, proses perangkingan
for i=1:m
    V(i,:)= sum(w.*R(i,:));
end
V=[nomorRumah V];

hasil = sortrows(V, 2,'descend');
hasil = hasil(1:20,:);

set(handles.uitable2,'data',hasil);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable2,'data','');
