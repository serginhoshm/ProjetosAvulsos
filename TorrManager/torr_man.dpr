program torr_man;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  IniFiles,
  Windows,
  u_lib in 'u_lib.pas';

var
  Lista: TStringList;
  i: integer;
  afilesize: int64;
  afile,
  anewfilename: string;
  config:TIniEntry;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  try

    Writeln('Teste');
    Lista := TStringList.Create;
    try
      ReadIniConfig('MoverFilmesConcluidos', config);
      Writeln('InputDir = ' + config.InputDir);
      Writeln('OutputDir = ' + config.OutputDir);
      Writeln('MinFileSize = ' + IntToStr(config.MinFileSize));
      Writeln('DeleteFilesBelowMin = ' + IntToStr(config.DeleteFilesBelowMin));
      Writeln('DeleteEmptyDirs = ' + IntToStr(config.DeleteEmptyDirs));

      //ListDir('L:\filmes', Lista);
      ListDir(config.InputDir, Lista);
      for i:= 0 to Lista.Count -1 do
      begin
        afile := Lista.Strings[i];
        afilesize := GetFileSize(afile);

        if afilesize >= config.MinFileSize then
        begin
          Writeln('Keep file ' + afile);
          anewfilename := IncludeTrailingPathDelimiter(config.OutputDir) + ExtractFileName(afile);
          MoveFile(PChar(afile),PChar(anewfilename));
        end
        else
        begin
         // Writeln('Delete File ' + afile);
         if ExtractFileName(afile) <> '.config' then
          DeleteFile(PChar(afile));
        end;
      end;
      if config.DeleteEmptyDirs >=1 then
        DelEmptyFolders(IncludeTrailingPathDelimiter(config.InputDir));

    finally
      FreeAndNil(Lista);
    end;
  except
    On E:Exception do
    begin
      Writeln(E.message);
    end;
  end;
  Readln;
end.
