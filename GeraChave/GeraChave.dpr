program GeraChave;

uses
  Forms,
  u_principal in 'u_principal.pas' {Form1},
  u_dm in 'u_dm.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
