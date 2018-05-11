function varargout = TicTacToe(varargin)
% TICTACTOE MATLAB code for TicTacToe.fig
%      TICTACTOE, by itself, creates a new TICTACTOE or raises the existing
%      singleton*.
%
%      H = TICTACTOE returns the handle to a new TICTACTOE or the handle to
%      the existing singleton*.
%
%      TICTACTOE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TICTACTOE.M with the given input arguments.
%
%      TICTACTOE('Property','Value',...) creates a new TICTACTOE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TicTacToe_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TicTacToe_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TicTacToe

% Last Modified by GUIDE v2.5 10-Apr-2018 01:17:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TicTacToe_OpeningFcn, ...
                   'gui_OutputFcn',  @TicTacToe_OutputFcn, ...
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

function initWon()
global won
won = false;

function ifwon = checkWon()
global won
ifwon = won;

function hasWon()
global won
won = true;

function setText() 
global turnHelp
turnHelp = 'Turn of Player';

function text = getText()
global turnHelp
text = turnHelp;

function initTurn()
global turn
turn = 'O';

function setTurn()
global turn
if(turn == 'X')
    turn = 'O';
else 
    turn = 'X';
end
    
function cur = getTurn() 
global turn
cur = turn;

function initDraw()
global ifDraw
ifDraw = 0;

function incDraw()
global ifDraw
ifDraw = ifDraw +1;

function draw = getDraw()
global ifDraw 
draw = ifDraw;



% --- Executes just before TicTacToe is made visible.
function TicTacToe_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TicTacToe (see VARARGIN)

% Choose default command line output for TicTacToe
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TicTacToe wait for user response (see UIRESUME)
% uiwait(handles.figure1);
initTurn();
setText();
initWon();
initDraw();


% --- Outputs from this function are returned to the command line.
function varargout = TicTacToe_OutputFcn(hObject, eventdata, handles) 
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
str = get(handles.pushbutton1, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon())
    %alert
else
    set(handles.pushbutton1, 'String', getTurn());
    checkWinP1(handles);
end

function checkWinP1(handles) 
if((strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton2,'String'))...
    && strcmp(get(handles.pushbutton2,'String'),get(handles.pushbutton3,'String')))...
    || (strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton4,'String'))... 
    && strcmp(get(handles.pushbutton4,'String'),get(handles.pushbutton7,'String')))...
    || (strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton9,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.pushbutton2, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon() )
    %alert
else
    set(handles.pushbutton2, 'String', getTurn());
    checkWinP2(handles);
end

function checkWinP2(handles) 
if((strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton2,'String'))...
    && strcmp(get(handles.pushbutton2,'String'),get(handles.pushbutton3,'String')))...
    || (strcmp(get(handles.pushbutton2,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton8,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.pushbutton3, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon() )
    %alert
else
    set(handles.pushbutton3, 'String', getTurn());
    checkWinP3(handles);
end

function checkWinP3(handles) 
if((strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton2,'String'))...
    && strcmp(get(handles.pushbutton2,'String'),get(handles.pushbutton3,'String')))...
    || (strcmp(get(handles.pushbutton7,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton3,'String')))...
    || (strcmp(get(handles.pushbutton3,'String'),get(handles.pushbutton6,'String'))... 
    && strcmp(get(handles.pushbutton6,'String'),get(handles.pushbutton9,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.pushbutton4, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon() )
    %alert
else
    set(handles.pushbutton4, 'String', getTurn());
    checkWinP4(handles);
end

function checkWinP4(handles) 
if((strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton4,'String'))...
    && strcmp(get(handles.pushbutton4,'String'),get(handles.pushbutton7,'String')))...
    || (strcmp(get(handles.pushbutton4,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton6,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end


% --- Executes on button press in pushbutton4.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.pushbutton5, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon() )
    %alert
else
    set(handles.pushbutton5, 'String', getTurn());
    checkWinP5(handles);
end

function checkWinP5(handles) 
if((strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton5,'String'))...
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton9,'String')))...
    || (strcmp(get(handles.pushbutton3,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton7,'String')))...
    || (strcmp(get(handles.pushbutton2,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton8,'String')))...
    || (strcmp(get(handles.pushbutton4,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton6,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.pushbutton6, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon() )
    %alert
else
    set(handles.pushbutton6, 'String', getTurn());
    checkWinP6(handles);
end

function checkWinP6(handles) 
if((strcmp(get(handles.pushbutton6,'String'),get(handles.pushbutton9,'String'))...
    && strcmp(get(handles.pushbutton9,'String'),get(handles.pushbutton3,'String')))...
    || (strcmp(get(handles.pushbutton4,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton6,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.pushbutton7, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon() )
    %alert
else
    set(handles.pushbutton7, 'String', getTurn());
    checkWinP7(handles);
end

function checkWinP7(handles) 
if((strcmp(get(handles.pushbutton7,'String'),get(handles.pushbutton5,'String'))...
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton3,'String')))...
    || (strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton4,'String'))... 
    && strcmp(get(handles.pushbutton4,'String'),get(handles.pushbutton7,'String')))...
    || (strcmp(get(handles.pushbutton7,'String'),get(handles.pushbutton8,'String'))... 
    && strcmp(get(handles.pushbutton8,'String'),get(handles.pushbutton9,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end


% --- Executes on button press in pushbutton6.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.pushbutton8, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon() )
    %alert
else
    set(handles.pushbutton8, 'String', getTurn());
    checkWinP8(handles);
end

function checkWinP8(handles) 
if((strcmp(get(handles.pushbutton7,'String'),get(handles.pushbutton8,'String'))...
    && strcmp(get(handles.pushbutton8,'String'),get(handles.pushbutton9,'String')))...
    || (strcmp(get(handles.pushbutton2,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton8,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.pushbutton9, 'String');
if(strcmp(str, 'X') || strcmp(str, 'O') || checkWon() )
    %alert
else 
    set(handles.pushbutton9, 'String', getTurn());
    checkWinP9(handles);
end

function checkWinP9(handles) 
if((strcmp(get(handles.pushbutton3,'String'),get(handles.pushbutton6,'String'))...
    && strcmp(get(handles.pushbutton6,'String'),get(handles.pushbutton9,'String')))...
    || (strcmp(get(handles.pushbutton7,'String'),get(handles.pushbutton8,'String'))... 
    && strcmp(get(handles.pushbutton8,'String'),get(handles.pushbutton9,'String')))...
    || (strcmp(get(handles.pushbutton1,'String'),get(handles.pushbutton5,'String'))... 
    && strcmp(get(handles.pushbutton5,'String'),get(handles.pushbutton9,'String'))))
    set(handles.helpbox, 'String', strcat(getTurn(),{' '},'Wins'));
    hasWon();
else
    incDraw();
    setTurn();
    set(handles.helpbox, 'String', strcat(getText(),{' '}, getTurn()));
    checkIfDraw(handles);
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton1, 'String', '');
set(handles.pushbutton2, 'String', '');
set(handles.pushbutton3, 'String', '');
set(handles.pushbutton4, 'String', '');
set(handles.pushbutton5, 'String', '');
set(handles.pushbutton6, 'String', '');
set(handles.pushbutton7, 'String', '');
set(handles.pushbutton8, 'String', '');
set(handles.pushbutton9, 'String', '');
set(handles.helpbox, 'String', strcat(getText(),{' '}, 'O'));
initTurn();
initWon();
initDraw();

function checkIfDraw(handles)
if(getDraw() >= 9)
    set(handles.helpbox, 'String', 'Draw');
end