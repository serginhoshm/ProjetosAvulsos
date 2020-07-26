unit u_lib;

interface

uses
  Windows,
  SysUtils,
  Classes,
  IniFiles,
  SvcMgr;

type
  TIniEntry = record
    InputDir: string;
    OutputDir: string;
    MinFileSize: Int64;
    DeleteFilesBelowMin: integer;
    DeleteEmptyDirs: Integer;
  end;

  procedure ListDir(Dir: string; var List: TStringList);
  function GetFileSize(fileName : wideString) : Int64;
  procedure ReadIniConfig(sectionName: string; var IniConf: TIniEntry);
  procedure DelEmptyFolders(dir: string);
  procedure LogMessage(var Msg: TStringList);
  

implementation


procedure ListDir(Dir: string; var List: TStringList);
var
  SR: TSearchRec;
begin

  if List <> nil then
  begin
    if FindFirst(IncludeTrailingBackslash(Dir) + '*.*', faAnyFile or faDirectory, SR) = 0 then
      try
        repeat
          if (SR.Attr and faDirectory) = 0 then
            List.Add(IncludeTrailingBackslash(Dir) + SR.Name)
          else if (SR.Name <> '.') and (SR.Name <> '..') then
            ListDir(IncludeTrailingBackslash(Dir) + SR.Name, List);  // recursive call!
        until FindNext(Sr) <> 0;
      finally
        FindClose(SR);
      end;
  end;
end;

function GetFileSize(fileName : wideString) : Int64;
var
  sr : TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr ) = 0 then
    result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
    result := -1;
  FindClose(sr);
end;

procedure ReadIniConfig(sectionName: string; var IniConf: TIniEntry);
var
  aIniFilename: string;
  aIni: TIniFile;
begin
  aIniFilename := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'config.ini';

  Writeln(aIniFileName);
  if not FileExists(aIniFilename) then
    raise Exception.Create('File not found: config.ini');

  try
    aIni := TIniFile.Create(aIniFilename);
    if Trim(sectionName) = EmptyStr then
      raise Exception.Create('Section name must be provided as parameter');

    if not aIni.SectionExists(sectionName)then
      raise Exception.Create('Section not found on INI file: ' + sectionName);

    IniConf.InputDir := aIni.ReadString(sectionName, 'InputDir', '');
    IniConf.OutputDir := aIni.ReadString(sectionName, 'OutputDir', '');
    IniConf.MinFileSize := aIni.ReadInteger(sectionName, 'MinFileSize', 100);
    IniConf.DeleteFilesBelowMin := aIni.ReadInteger(sectionName, 'DeleteFilesBelowMin', 0);
    IniConf.DeleteEmptyDirs := aIni.ReadInteger(sectionName, 'DeleteEmptyDirs', 0);
  finally
    FreeAndNil(aIni);
  end;

end;

procedure DelEmptyFolders(dir: string);
var
 Search : TSearchRec;
 ok: integer;
begin
 ok := FindFirst(dir + '\*.*',faDirectory,Search);
 while ok = 0 do
 begin
   if ((Search.Name <> '.' ) and (Search.Name <> '..')) then
   begin
      DelEmptyFolders(dir + '\' + Search.Name);
   end;
   ok := FindNext(Search);
 end;

 FindClose(Search);
 try
   RmDir(dir);
 except
   // do nothing - dir is not empty
 end;
end;

procedure LogMessage(var Msg: TStringList);
var
  WMsg: TEventLogger;
  i: Integer;
  FinalLog: string;
begin
  WMsg :=TEventLogger.Create('torr_man');
  try
    for i := 0 to Msg.Count -1 do
      FinalLog := FinalLog + Msg.Strings[i] + #13#10;

    WMsg.LogMessage(FinalLog, EVENTLOG_INFORMATION_TYPE);
  finally
    FreeAndNil(WMsg);
  end;
end;

end.

