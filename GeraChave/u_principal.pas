unit u_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    LECNPJ: TLabeledEdit;
    LEModelo: TLabeledEdit;
    LESerie: TLabeledEdit;
    DBLookupComboBoxUF: TDBLookupComboBox;
    Button1: TButton;
    LENumNF: TLabeledEdit;
    LEAnoMes: TMaskEdit;
    LECodNum: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function ArquivoDados: string;
    procedure CDSPers_CriaCampos(var ACDS: TClientDataSet);
    procedure PersistirDados;
    procedure CarregarDados;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses u_dm;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  CarregarDados;



end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(StrToIntDef(VarToStrDef(DBLookupComboBoxUF.KeyValue, ''), 0)));
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PersistirDados;
end;

procedure TForm1.PersistirDados;
var
  CDSPers: TClientDataSet;
begin
  CDSPers := TClientDataSet.Create(nil);
  try
    CDSPers_CriaCampos(CDSPers);
    CDSPers.EmptyDataSet;
    CDSPers.LogChanges := false;
    CDSPers.Append;
    CDSPers.FieldByName('CDSPers_UF').AsInteger := StrToIntDef(VarToStrDef(DBLookupComboBoxUF.KeyValue, ''), 0);
    CDSPers.FieldByName('CDSPers_AnoMes').AsString := LEAnoMes.Text;
    CDSPers.FieldByName('CDSPers_CNPJ').AsString := LECNPJ.Text;
    CDSPers.FieldByName('CDSPers_Modelo').AsString := LEModelo.Text;
    CDSPers.FieldByName('CDSPers_Serie').AsString := LESerie.Text;
    CDSPers.FieldByName('CDSPers_NumNF').AsString := LENumNF.Text;
    CDSPers.FieldByName('CDSPers_CodigoNumerico').AsString := LECodNum.Text;
    CDSPers.Post;
    CDSPers.SaveToFile(ExtractFilePath(Application.ExeName) + 'gerachave.dat', dfXMLUTF8);
  finally
    FreeAndNil(CDSPers);
  end;

end;

procedure TForm1.CarregarDados;
var
  CDSPers: TClientDataSet;
begin
  //Alimentar UFs
  if not DM.CDS_UF.Active then
    DM.CDS_UF.CreateDataSet;
  DM.CDS_UF.EmptyDataSet;
  DM.CDS_UF.LogChanges := false;

  DM.CDS_UF.AppendRecord(['11', 'Rondônia/RO']);
  DM.CDS_UF.AppendRecord(['12', 'Acre/AC']);
  DM.CDS_UF.AppendRecord(['13', 'Amazonas/AM']);
  DM.CDS_UF.AppendRecord(['14', 'Roraima/RR']);
  DM.CDS_UF.AppendRecord(['15', 'Pará/PA']);
  DM.CDS_UF.AppendRecord(['16', 'Amapá/AP']);
  DM.CDS_UF.AppendRecord(['17', 'Tocantins/TO']);
  DM.CDS_UF.AppendRecord(['21', 'Maranhão/MA']);
  DM.CDS_UF.AppendRecord(['22', 'Piauí/PI']);
  DM.CDS_UF.AppendRecord(['23', 'Ceará/CE']);
  DM.CDS_UF.AppendRecord(['24', 'Rio Grande do Norte/RN']);
  DM.CDS_UF.AppendRecord(['25', 'Paraíba/PB']);
  DM.CDS_UF.AppendRecord(['26', 'Pernambuco/PE']);
  DM.CDS_UF.AppendRecord(['27', 'Alagoas/AL']);
  DM.CDS_UF.AppendRecord(['28', 'Sergipe/SE']);
  DM.CDS_UF.AppendRecord(['29', 'Bahia/BA']);
  DM.CDS_UF.AppendRecord(['31', 'Minas Gerais/MG']);
  DM.CDS_UF.AppendRecord(['32', 'Espírito Santo/ES']);
  DM.CDS_UF.AppendRecord(['33', 'Rio de Janeiro/RJ']);
  DM.CDS_UF.AppendRecord(['35', 'São Paulo/SP']);
  DM.CDS_UF.AppendRecord(['41', 'Paraná/PR']);
  DM.CDS_UF.AppendRecord(['42', 'Santa Catarina/SC']);
  DM.CDS_UF.AppendRecord(['43', 'Rio Grande do Sul/RS']);
  DM.CDS_UF.AppendRecord(['50', 'Mato Grosso do Sul/MS']);
  DM.CDS_UF.AppendRecord(['51', 'Mato Grosso/MT']);
  DM.CDS_UF.AppendRecord(['52', 'Goiás/GO']);
  DM.CDS_UF.AppendRecord(['53', 'Distrito Federal/DF']);

  if FileExists(ArquivoDados) then
  begin
    CDSPers := TClientDataSet.Create(nil);
    try
      CDSPers_CriaCampos(CDSPers);
      CDSPers.EmptyDataSet;
      CDSPers.LogChanges := false;
      CDSPers.LoadFromFile(ArquivoDados);
      if not CDSPers.IsEmpty then
      begin
        DBLookupComboBoxUF.KeyValue := CDSPers.FieldByName('CDSPers_UF').AsInteger;
        LEAnoMes.Text := CDSPers.FieldByName('CDSPers_AnoMes').AsString;
        LECNPJ.Text := CDSPers.FieldByName('CDSPers_CNPJ').AsString;
        LEModelo.Text := CDSPers.FieldByName('CDSPers_Modelo').AsString;
        LESerie.Text := CDSPers.FieldByName('CDSPers_Serie').AsString;
        LENumNF.Text := CDSPers.FieldByName('CDSPers_NumNF').AsString;
        LECodNum.Text := CDSPers.FieldByName('CDSPers_CodigoNumerico').AsString;
      end;
    finally
      FreeAndNil(CDSPers);
    end;
  end;

end;

procedure TForm1.CDSPers_CriaCampos(var ACDS: TClientDataSet);
begin
  if ACDS <> nil then
  begin
    if ACDS.Active then
      ACDS.EmptyDataSet;
    ACDS.Close;
    ACDS.FieldDefs.Clear;
    ACDS.FieldDefs.Add('CDSPers_UF', ftInteger);
    ACDS.FieldDefs.Add('CDSPers_AnoMes', ftstring, 5);
    ACDS.FieldDefs.Add('CDSPers_CNPJ', ftstring, 14);
    ACDS.FieldDefs.Add('CDSPers_Modelo', ftstring, 2);
    ACDS.FieldDefs.Add('CDSPers_Serie', ftstring, 3);
    ACDS.FieldDefs.Add('CDSPers_NumNF', ftString, 9);
    ACDS.FieldDefs.Add('CDSPers_CodigoNumerico', ftstring, 8);
    ACDS.CreateDataSet;
  end;
end;

function TForm1.ArquivoDados: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'gerachave.dat';
end;

end.
