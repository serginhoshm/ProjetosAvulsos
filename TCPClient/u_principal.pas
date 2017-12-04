unit u_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    EditIP: TEdit;
    Editporta: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function ObterLinhaTCP(Host: string; Porta: Integer; var msgLog: string): string;
    procedure Log(ALinha: string);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Msg: string;
begin
  Log('Início');
  Memo1.Lines.Add(ObterLinhaTCP(EditIP.Text, StrToIntDef(Editporta.Text, 0), Msg));
  if trim(Msg) <> EmptyStr then
    Memo1.Lines.Add('      -> ' + Msg);
  Log('Fim');
end;

procedure TForm2.Log(ALinha: string);
begin
  Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now)  + ' -> ' + ALinha);
  Memo1.Refresh;
  Application.ProcessMessages;
end;

function TForm2.ObterLinhaTCP(Host: string; Porta: Integer; var msgLog: string): string;
var
  Str: TStringList;
  TCPCli: TIdTCPClient;
begin
  msgLog := EmptyStr;
  Str := TStringList.Create;
  TCPCli := TIdTCPClient.Create(nil);
  try
    TCPCli.Host := Host;
    TCPCli.Port := Porta;
    try
      Log('Configura: TCPCli.ConnectTimeout');
      TCPCli.ConnectTimeout := 2000;
      Log('TCPCli.Connect');
      TCPCli.Connect;
      //Log('TCPCli.Socket.ReadStrings');
      //TCPCli.Socket.ReadStrings(Str, 1);
      //Result := TCPCli.Socket.ReadLn();
      //Result := TCPCli.Socket.ReadString(MaxInt);
      //Result := TCPCli.Socket.ReadLnWait();
      Result := TCPCli.Socket.ReadString(17);


      //Result := TCPCli.Socket.ReadString(32); - funciona
    except
      on E:Exception do
      begin
        msgLog := E.Message;
        Result := EmptyStr;
        TCPCli.Disconnect;
      end;
    end;
  finally
    TCPCli.Disconnect;
    FreeAndNil(Str);
  end;
end;

end.
