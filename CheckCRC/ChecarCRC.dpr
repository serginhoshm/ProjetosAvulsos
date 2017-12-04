program ChecarCRC;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  d3_crc32 in 'd3_crc32.pas',
  windows;
var
  CRC: Dword;
  AFileName,
  FileCRC,
  CheckCRC,
  Res: string;
begin
  try
    AFileName := ParamStr(1);
    CheckCRC := trim(UpperCase(ParamStr(2)));
    if FileExists(AFileName) then
    begin
      Writeln('Aguarde, calculando CRC...');
      CalcCRC32(AFileName, crc);
      FileCRC := trim(UpperCase(IntToHex(crc,6)));
      if crc<>0 then
      begin
        if CheckCRC <> EmptyStr then
        begin
          if FileCRC = CheckCRC then
            Res := 'OK'
          else
            Res := 'FALHOU';
          writeln('Arquivo: ' + AFileName);
          writeln('CRC-arquivo: ' + FileCRC);
          writeln('CRC-verific: ' + CheckCRC);
          writeln('Resultado: ' + Res);
        end
        else
        begin
          writeln('Arquivo: ' + AFileName);
          writeln('CRC: ' + IntToHex(crc,6));
        end;
      end
      else
        raise Exception.Create('erro desconhecido ao calcular CRC');
      Readln;
    end
    else
      raise Exception.Create('arquivo "' + AFileName + '" não encontrado');
  except
    on E:Exception do
    begin
      Writeln('O programa foi finalizado com erro: ' + E.Message);
      readln;
    end;
  end;
end.

