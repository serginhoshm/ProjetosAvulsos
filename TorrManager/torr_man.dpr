program torr_man;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  IniFiles,
  Windows,
  SvcMgr,
  u_lib in 'u_lib.pas';

var
  Lista,
  Log: TStringList;
  i: integer;
  afilesize: int64;
  afile,
  anewfilename: string;
  config:TIniEntry;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  Log := TStringList.Create;
  try
    try
      Log.Add('torr_man');
      Lista := TStringList.Create;
      try
        ReadIniConfig(ParamStr(1), config);
        Log.Add('InputDir = ' + config.InputDir);
        Log.Add('OutputDir = ' + config.OutputDir);
        Log.Add('MinFileSize = ' + IntToStr(config.MinFileSize));
        Log.Add('DeleteFilesBelowMin = ' + IntToStr(config.DeleteFilesBelowMin));
        Log.Add('DeleteEmptyDirs = ' + IntToStr(config.DeleteEmptyDirs));

        //ListDir('L:\filmes', Lista);
        ListDir(config.InputDir, Lista);
        for i:= 0 to Lista.Count -1 do
        begin
          afile := Lista.Strings[i];
          afilesize := GetFileSize(afile);

          if afilesize >= config.MinFileSize then
          begin
            Log.Add('Keep file ' + afile);
            anewfilename := IncludeTrailingPathDelimiter(config.OutputDir) + ExtractFileName(afile);
            if MoveFile(PChar(afile),PChar(anewfilename)) then
              DeleteFile(PChar(afile));
          end
          else
          begin
           // Writeln('Delete File ' + afile);
           if ExtractFileName(afile) <> '.config' then
           begin
             Log.Add('Delete file ' + afile);
             DeleteFile(PChar(afile));
           end;
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
        Log.Add(E.message);
      end;
    end;
  finally
    LogMessage(Log);
    FreeAndNil(Log);
  end;
end.
