program RegExpIP;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  RegularExpressions;

var
 ip,
 ipRegExp: String;
begin
  try

    Readln(ip);
    ipRegExp := '\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b';

    if TRegEx.IsMatch(ip, ipRegExp) then
      Writeln('OK')
    else
      Writeln('ERRO');

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.