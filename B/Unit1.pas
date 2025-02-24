unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  SHARED_MEM_NAME = 'SharedMemoryTest';
  SHARED_MEM_SIZE = 1024;

var
  Form1: TForm1;
  FMappingHandle: THandle;
  FSharedMemPtr: Pointer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  pData: PChar;
  s: string;
begin
  pData:= PChar(FSharedMemPtr);
  s:= string(pData);
  Label1.Caption:= 'Read: ' + s;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  pData: PChar;
  s: string;
begin
  pData:= PChar(FSharedMemPtr);
  s:= TimeToStr(Now);
  StrPCopy(pData, s);
  Label1.Caption:= 'Write: ' + s;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if FSharedMemPtr <> nil then
    UnmapViewOfFile(FSharedMemPtr);
  if FMappingHandle <> 0 then
    CloseHandle(FMappingHandle);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FMappingHandle:= OpenFileMapping(FILE_MAP_ALL_ACCESS, False, SHARED_MEM_NAME);
  if FMappingHandle = 0 then
    raise Exception.CreateFmt('OpenFileMapping 실패: %d', [GetLastError]);

  FSharedMemPtr:= MapViewOfFile(FMappingHandle, FILE_MAP_ALL_ACCESS, 0, 0, SHARED_MEM_SIZE);
  if FSharedMemPtr = nil then
  begin
    CloseHandle(FMappingHandle);
    raise Exception.CreateFmt('MapViewOfFile 실패: %d', [GetLastError]);
  end;
end;

end.
