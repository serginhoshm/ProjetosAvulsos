program TCPClienteTeste;

uses
  Vcl.Forms,
  u_principal in 'u_principal.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
