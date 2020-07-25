program torr_man;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  u_lib in 'u_lib.pas';

var
  Lista: TStringList;
  i: integer;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  Writeln('Teste');
  Lista := TStringList.Create;
  try
    ListDir('C:\Windows', Lista);
    for i:= 0 to Lista.Count -1 do
    begin
      Writeln(Lista.Strings[i]);
    end;
  finally
    FreeAndNil(Lista);
  end;

  //ListDir('dddd');
  Readln;
end.
