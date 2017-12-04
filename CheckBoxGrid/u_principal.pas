unit u_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Contnrs, WebAdapt;

type
  TFormPrincipal = class(TForm)
    DBGridDados: TDBGrid;
    cdsdados: TClientDataSet;
    ds_cdsdados: TDataSource;
    Cbxprocessar: TDBCheckBox;
    CbxProcessar2: TDBCheckBox;
    cbxprocessarint: TDBCheckBox;
    cbxprocessarstr: TDBCheckBox;
    procedure DBGridDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridDadosColExit(Sender: TObject);
    procedure DBGridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FListaCheckBox: TObjectList;
    function ArquivoXML: string;
    function ListaCheckBoxes: TObjectList;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

function TFormPrincipal.ArquivoXML: string;
begin
  Result := ExtractFilePath(Application.ExeName) + ChangeFileExt(ExtractFileName(Application.ExeName), '') + '_dados.xml';
end;

procedure TFormPrincipal.DBGridDadosColExit(Sender: TObject);
var
  aux: Integer;
  ThisCbx: TDBCheckBox;
begin
  for aux := 0 to FListaCheckBox.Count -1 do
  begin
    ThisCbx := (FListaCheckBox.Items[aux] as TDBCheckBox);
    if DBGridDados.SelectedField.FieldName = ThisCbx.DataField then
      ThisCbx.Visible := False
  end;
end;

procedure TFormPrincipal.DBGridDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
  IsChecked: array [Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState,
  aux: Integer;
  DrawRect: TRect;
  ThisCbx: TDBCheckBox;
begin
  for aux := 0 to FListaCheckBox.Count -1 do
  begin
    ThisCbx := (FListaCheckBox.Items[aux] as TDBCheckBox);
    if (gdFocused in State) then
    begin
      if (Column.Field.FieldName = ThisCbx.DataField) then
      begin
        ThisCbx.Left := Rect.Left + DBGridDados.Left + 2;
        ThisCbx.Top := Rect.Top + DBGridDados.Top + 2;
        ThisCbx.Width := Rect.Right - Rect.Left;
        ThisCbx.Height := Rect.Bottom - Rect.Top;
        ThisCbx.Visible := True;
      end
    end
    else
    begin
      if (Column.Field.FieldName = ThisCbx.DataField) then
      begin
        DrawRect := Rect;
        InflateRect(DrawRect, -1, -1);

        DrawState := IsChecked[Column.Field.AsBoolean];

        DBGridDados.Canvas.FillRect(Rect);
        DrawFrameControl(DBGridDados.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
      end;
    end;
  end;
end;

procedure TFormPrincipal.DBGridDadosKeyPress(Sender: TObject; var Key: Char);
var
  aux: Integer;
  ThisCbx: TDBCheckBox;
begin
  if (key = Chr(9)) then
    Exit;

  for aux := 0 to FListaCheckBox.Count -1 do
  begin
    ThisCbx := (FListaCheckBox.Items[aux] as TDBCheckBox);

    if (DBGridDados.SelectedField.FieldName = ThisCbx.DataField) then
    begin
      if ThisCbx.CanFocus then
        ThisCbx.SetFocus;
      SendMessage(ThisCbx.Handle, WM_Char, word(Key), 0);
    end;
  end;
end;


procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsdados.MergeChangeLog;
  cdsdados.SaveToFile(ArquivoXML);
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  if FileExists(ArquivoXML) then
  begin
    cdsdados.LoadFromFile(ArquivoXML);
    cdsdados.LogChanges := false;
  end
  else
  begin
    cdsdados.Close;
    cdsdados.CreateDataSet;
  end;
  FListaCheckBox := ListaCheckBoxes;
end;

procedure TFormPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListaCheckBox);
end;

function TFormPrincipal.ListaCheckBoxes: TObjectList;
var
  cmp: Integer;
begin
  Result := TObjectList.Create;
  try
    for cmp := 0 to ComponentCount -1  do
    begin
      if Components[cmp] is TDBCheckBox then
      begin
        Result.Add(Components[cmp]);
      end;
    end;
  except
    Result.Clear;
  end;
end;

end.























































  List := TObjectList.Create;
  try
    for cmp := 0 to ComponentCount -1  do
    begin
      if Components[cmp] is TDBCheckBox then
      begin
        List.Add(Components[cmp]);
      end;
    end;

    for cmp := 0 to List.Count-1 do
    begin
      ThisDBChkBox := (List.Items[cmp] as TDBCheckBox);

      if (gdFocused in State) then
      begin
        if (Column.Field.FieldName = ThisDBChkBox.DataField) then
        begin
          ThisDBChkBox.Left := Rect.Left + DBGrid1.Left + 2;
          ThisDBChkBox.Top := Rect.Top + DBGrid1.Top + 2;
          ThisDBChkBox.Width := Rect.Right - Rect.Left;
          ThisDBChkBox.Height := Rect.Bottom - Rect.Top;
          ThisDBChkBox.Visible := True;
        end
      end
      else
      begin
        if (Column.Field.FieldName = ThisDBChkBox.DataField) then
        begin
          DrawRect := Rect;
          InflateRect(DrawRect, -1, -1);

          DrawState := IsChecked[Column.Field.AsBoolean];

          DBGrid1.Canvas.FillRect(Rect);
          DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
        end;
      end;
    end;

  finally
    FreeAndNil(List);
  end;




procedure TFrm_Ficha_Tecnica.DBGrid1CellClick(Column: TColumn);
begin
if (Column.Index in [7,11])
and (DM.Ficha_Tecnica.State in [dsInsert, dsEdit])
then begin
if not (DM.Ficha_Tec_Compos.State in [dsEdit, dsInsert])
then DM.Ficha_Tec_Compos.Edit;
Column.Field.AsString:=IfThen((Column.Field.AsString='S'), 'N', 'S');
end;
end;
