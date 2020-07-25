unit u_lib;

interface

uses
  SysUtils,
  Classes;

  procedure ListDir(Dir: string; var List: TStringList);

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

end.





procedure TForm1.AddAllFilesInDir(const Dir: string);
var
  SR: TSearchRec;
begin
  if FindFirst(IncludeTrailingBackslash(Dir) + '*.*', faAnyFile or faDirectory, SR) = 0 then
    try
      repeat
        if (SR.Attr and faDirectory) = 0 then
          ListBox1.Items.Add(SR.Name)
        else if (SR.Name <> '.') and (SR.Name <> '..') then
          AddAllFilesInDir(IncludeTrailingBackslash(Dir) + SR.Name);  // recursive call!
      until FindNext(Sr) <> 0;
    finally
      FindClose(SR);
    end;
end;