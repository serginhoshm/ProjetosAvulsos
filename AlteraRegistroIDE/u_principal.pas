unit u_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Registry, Vcl.StdCtrls, Vcl.ExtCtrls, DBClient, DB;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RdgSistema: TRadioGroup;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LimparKnownPackages;
    procedure RegistrarKnownPackages_Basicos;
  public
    { Public declarations }
  end;

  TRegistrarItens = class
  private
    FDadosValores: TClientDataSet;
    FRegistro: TRegistry;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ConfigurarRoot(ARoot: HKEY);
    procedure ConfigurarCaminho(ACaminho: string);
    procedure IncluirValor(Chave, Valor: string);
    function RegistrarValores: integer;
  end;


var
  Form1: TForm1;
const
  CaminhoPacotes = 'Software\Embarcadero\BDS\10.0\Known Packages';
  RaizUsuario = HKEY_CURRENT_USER;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Itens: TRegistrarItens;
begin
  LimparKnownPackages;
  RegistrarKnownPackages_Basicos;
  Itens := TRegistrarItens.Create;
  try
    Itens.ConfigurarRoot(RaizUsuario);
    Itens.ConfigurarCaminho(CaminhoPacotes);
    case RdgSistema.ItemIndex of
      0:
      begin
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfs17.bpl', 'FastScript 1.9 Components');
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfrx17.bpl', 'FastReport 4.0 Components');
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfsDB17.bpl', 'FastScript 1.9 DB Components');
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfrxDB17.bpl', 'FastReport 4.0 DB Components');
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfrxe17.bpl', 'FastReport 4.0 Exports');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBrOpenSSL.bpl', 'ACBr Automação Comercial Brasil  ACBrComum   (http://acbr.sf.ne)');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBrComum.bpl', 'ACBr Automação Comercial Brasil  ACBrComum   (http://acbr.sf.ne)');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBrDiversos.bpl', 'ACBr Automação Comercial Brasil - ACBrDiversos (http://acbr.sf.net/)');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBr_Sintegra.bpl', 'ACBr - Sintegra (http://www.projectoacbr.com.br/)');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBr_NFe2.bpl', 'ACBr Automação Comercial Brasil - ACBrNFePCN2 (http://acbr.sourceforge.net/)');
        Itens.IncluirValor('D:\\Benner\\Bin\\Delphi\\dclXE3Simple.bpl', 'Simple Informática Ltda - Custom Components');
        Itens.IncluirValor('D:\\Benner\\Bin\\Delphi\\dclqrtXE3.bpl', 'QuickReport Components');
        Itens.IncluirValor('V:\\LIBS\\BIN\\AdvXE3.bpl', '(untitled)');
        Itens.IncluirValor('V:\\LIBS\\BIN\\DsgnCPortDXE.bpl', 'ComPort Library Delphi XE');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\DCLgtDocEngD17.bpl', 'Gnostice eDocEngine');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\DCLgtQRExpD17.bpl', 'Gnostice QuickReport Export Interface');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\SMCmpntXE3.bpl', 'Scalabium Software: freeware SMComponent library');
      end;
      1:
      begin
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfs17.bpl', 'FastScript 1.9 Components');
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfrx17.bpl', 'FastReport 4.0 Components');
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfsDB17.bpl', 'FastScript 1.9 DB Components');
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfrxDB17.bpl', 'FastReport 4.0 DB Components');
        Itens.IncluirValor('C:\\Program Files (x86)\\FastReports\\LibD17\\dclfrxe17.bpl', 'FastReport 4.0 Exports');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBrOpenSSL.bpl', 'ACBr Automação Comercial Brasil  ACBrComum   (http://acbr.sf.ne)');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBrComum.bpl', 'ACBr Automação Comercial Brasil  ACBrComum   (http://acbr.sf.ne)');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBrDiversos.bpl', 'ACBr Automação Comercial Brasil - ACBrDiversos (http://acbr.sf.net/)');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBr_Sintegra.bpl', 'ACBr - Sintegra (http://www.projectoacbr.com.br/)');
        Itens.IncluirValor('C:\\Users\\Public\\Documents\\RAD Studio\\10.0\\Bpl\\ACBr_NFe2.bpl', 'ACBr Automação Comercial Brasil - ACBrNFePCN2 (http://acbr.sourceforge.net/)');
        Itens.IncluirValor('D:\\Benner\\Bin\\Delphi\\dclben170.bpl', 'Benner VCL - Design time package');
        Itens.IncluirValor('D:\\Benner\\Bin\\Delphi\\dclcube170.bpl', 'Benner Cube - Design time package');
        Itens.IncluirValor('D:\\Benner\\Bin\\Delphi\\dclqrt170.bpl', 'Benner - QuickReport4 Components');
        Itens.IncluirValor('D:\\Benner\\Bin\\Delphi\\dcltec170.bpl', 'Benner Tecnologia - Design time package');
      end;
    end;
    ShowMessage('Concluído. Foram registrados ' + IntToStr(Itens.RegistrarValores) + ' itens');
  finally
    FreeAndNil(Itens);
  end;
end;



procedure TForm1.RegistrarKnownPackages_Basicos;
var
  Itens: TRegistrarItens;
begin
  LimparKnownPackages;
  Itens := TRegistrarItens.Create;
  try
    Itens.ConfigurarRoot(RaizUsuario);
    Itens.ConfigurarCaminho(CaminhoPacotes);

    Itens.IncluirValor('$(BDS)\\bin\\bcbie170.bpl', '__(Untitled)');
    Itens.IncluirValor('$(BDS)\\bin\\dclbcbsmp170.bpl', '__(Untitled)');
    Itens.IncluirValor('$(BDS)\\bin\\dclIntraweb_140_170.bpl', '__(Untitled)');
    Itens.IncluirValor('$(BDS)\\bin\\bcboffice2k170.bpl', '__(Untitled)');
    Itens.IncluirValor('$(BDS)\\bin\\bcbofficexp170.bpl', '__(Untitled)');
    Itens.IncluirValor('C:\\Program Files (x86)\\Raize\\CS5\\Bin\\CodeSiteExpressPkg_Design170.bpl', '__CodeSite Express 5.1.2');
    Itens.IncluirValor('$(BDSBIN)\\dclfmxstd170.bpl', 'Embarcadero FMX Standard Components');
    Itens.IncluirValor('$(BDSBIN)\\dclstd170.bpl', 'Embarcadero Standard Components');
    Itens.IncluirValor('$(BDSBIN)\\dclsmp170.bpl', 'Embarcadero Sample Components');
    Itens.IncluirValor('$(BDSBIN)\\svnide170.bpl', 'Embarcadero Subversion Integration');
    Itens.IncluirValor('$(BDSBIN)\\dclmid170.bpl', 'Embarcadero MyBase DataAccess Components');
    Itens.IncluirValor('$(BDSBIN)\\dcldb170.bpl', 'Embarcadero Database Components');
    Itens.IncluirValor('$(BDSBIN)\\applet170.bpl', 'Embarcadero Control Panel Applet Package');
    Itens.IncluirValor('$(BDSBIN)\\dclbindcomp170.bpl', 'Embarcadero LiveBindings Components');
    Itens.IncluirValor('$(BDSBIN)\\ExpertsUI170.bpl', 'Embarcadero Experts UI Components');
    Itens.IncluirValor('$(BDSBIN)\\dclbindcompfmx170.bpl', 'Embarcadero LiveBindings Components FireMonkey');
    Itens.IncluirValor('$(BDSBIN)\\dclbindcompvcl170.bpl', 'Embarcadero LiveBindings Components VCL');
    Itens.IncluirValor('$(BDSBIN)\\dcl31w170.bpl', 'Delphi 1.0 Compatibility Components');
    Itens.IncluirValor('$(BDSBIN)\\dclact170.bpl', 'Embarcadero ActionBar Components');
    Itens.IncluirValor('$(BDSBIN)\\dclbde170.bpl', 'Embarcadero BDE DB Components');
    Itens.IncluirValor('$(BDSBIN)\\dclemacsedit170.bpl', 'Embarcadero Editor Emacs Enhancements');
    Itens.IncluirValor('$(BDSBIN)\\dclmlwiz170.bpl', 'Embarcadero Markup Language Wizards');
    Itens.IncluirValor('$(BDSBIN)\\dclsmpedit170.bpl', 'Embarcadero Editor Script Enhancements');
    Itens.IncluirValor('$(BDSBIN)\\dclMetropolisUILiveTile170.bpl', 'Embarcadero Metropolis UI Live Tile Standard Components');
    Itens.IncluirValor('$(BDSBIN)\\dcltouch170.bpl', 'Embarcadero Touch Components');
    Itens.IncluirValor('$(BDSBIN)\\samplevisualizers170.bpl', 'Embarcadero Sample Debugger Visualizers');
    Itens.IncluirValor('$(BDSBIN)\\dclib170.bpl', 'Embarcadero InterBase Express Components');
    Itens.IncluirValor('$(BDSBIN)\\dclado170.bpl', 'Embarcadero ADO DB Components');
    Itens.IncluirValor('$(BDSBIN)\\dclie170.bpl', 'Internet Explorer Components');
    Itens.IncluirValor('$(BDSBIN)\\dclwebsnap170.bpl', 'Embarcadero WebSnap Components');
    Itens.IncluirValor('$(BDSBIN)\\dclwbm170.bpl', 'Embarcadero InternetExpress Components');
    Itens.IncluirValor('$(BDSBIN)\\dclnet170.bpl', 'Embarcadero Internet Components');
    Itens.IncluirValor('$(BDSBIN)\\ExpertsCreators170.bpl', 'Embarcadero Experts Creators Components');
    Itens.IncluirValor('$(BDSBIN)\\dclsoap170.bpl', 'Embarcadero SOAP Components');
    Itens.IncluirValor('$(BDSBIN)\\dclribbon170.bpl', 'Embarcadero Ribbon Controls');
    Itens.IncluirValor('$(BDSBIN)\\DataExplorerDBXPluginInt170.bpl', 'DBExpress InterBase Data Explorer Integration');
    Itens.IncluirValor('$(BDSBIN)\\DataExplorerService170.bpl', 'Data Explorer Reusable Services');
    Itens.IncluirValor('$(BDSBIN)\\dclDBXDrivers170.bpl', 'Embarcadero Driver Components');
    Itens.IncluirValor('$(BDSBIN)\\dclDBXDriversInt170.bpl', 'Embarcadero Intro Driver Components');
    Itens.IncluirValor('$(BDSBIN)\\dclIPIndyImpl170.bpl', 'IP Abstraction Indy Implementation Design Time');
    Itens.IncluirValor('$(BDSBIN)\\dclbindcompdbx170.bpl', 'LiveBindings Expression Components DbExpress');
    Itens.IncluirValor('$(BDSBIN)\\dcldbx170.bpl', 'Embarcadero dbExpress Components');
    Itens.IncluirValor('$(BDSBIN)\\dcldbxcds170.bpl', 'Embarcadero SimpleDataset Component (DBX)');
    Itens.IncluirValor('$(BDSBIN)\\DataExplorerDBXPlugin170.bpl', 'DBExpress Data Explorer Integration');
    Itens.IncluirValor('$(BDSBIN)\\dclCloudService170.bpl', 'Embarcadero Cloud management components');
    Itens.IncluirValor('$(BDSBIN)\\dclmcn170.bpl', 'Embarcadero DataSnap Connection Components');
    Itens.IncluirValor('$(BDSBIN)\\DataExplorerDBXPluginEnt170.bpl', 'DBExpress Enterprise Data Explorer Integration');
    Itens.IncluirValor('$(BDSBIN)\\dclDBXDriversEnt170.bpl', 'Embarcadero Enterprise Driver Components');
    Itens.IncluirValor('$(BDSBIN)\\dclDataSnapClient170.bpl', 'Embarcadero DBExpress DataSnap Client Components');
    Itens.IncluirValor('$(BDSBIN)\\dclDataSnapCommon170.bpl', 'Embarcadero DBExpress DataSnap Common Design package');
    Itens.IncluirValor('$(BDSBIN)\\dclDataSnapIndy10ServerTransport170.bpl', 'Embarcadero DBExpress DataSnap Server Transport Components');
    Itens.IncluirValor('$(BDSBIN)\\dclDataSnapProviderClient170.bpl', 'Embarcadero DBExpress DataSnap Provider Client Components');
    Itens.IncluirValor('$(BDSBIN)\\dclDataSnapServer170.bpl', 'Embarcadero DBExpress DataSnap Server Components');
    Itens.IncluirValor('$(BDSBIN)\\dclDataSnapConnectors170.bpl', 'Embarcadero DataSnap Connector Components');
    Itens.IncluirValor('$(BDSBIN)\\dclIndyCore170.bpl', 'Indy 10 Core Design Time');
    Itens.IncluirValor('$(BDSBIN)\\dclIndyProtocols170.bpl', 'Indy 10 Protocols Design Time');
    Itens.IncluirValor('$(BDSBIN)\\dclFMXtee9170.bpl', 'TeeChart Lite FMX Components');
    Itens.IncluirValor('$(BDSBIN)\\dcltee9170.bpl', 'TeeChart Standard VCL Components');
    Itens.RegistrarValores;
  finally
    FreeAndNil(Itens);
  end;
end;

procedure TForm1.LimparKnownPackages;
var
  Reg: TRegistry;
  Values: TStringList;
  AVal: string;
  aux: integer;
begin
  Reg := TRegistry.Create;
  Values := TStringList.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('Software\Embarcadero\BDS\10.0\Known Packages', false) then
    begin
      Reg.GetValueNames(Values);
      if Values.Count > 0 then
      begin
        for aux := 0 to Values.Count -1 do
        begin
          AVal := Values.Strings[aux];
          if Reg.ValueExists(AVal) then
            Reg.DeleteValue(AVal);
        end;
      end;
    end;
  finally
    FreeAndNil(Reg);
    FreeAndNil(Values);
  end;
end;

{ TRegistrarItens }

procedure TRegistrarItens.ConfigurarCaminho(ACaminho: string);
begin
  if not FRegistro.OpenKey(ACaminho, false) then
    raise Exception.Create('Erro ao abrir caminho');
end;

procedure TRegistrarItens.ConfigurarRoot(ARoot: HKEY);
begin
  FRegistro.RootKey := ARoot;
end;

constructor TRegistrarItens.Create;
begin
  inherited;
  FDadosValores := TClientDataSet.Create(nil);
  FDadosValores.FieldDefs.Add('Chave', ftString, 1024);
  FDadosValores.FieldDefs.Add('Valor', ftString, 1024);
  FDadosValores.CreateDataSet;
  FDadosValores.LogChanges := false;

  FRegistro := TRegistry.Create;
end;

destructor TRegistrarItens.Destroy;
begin
  FreeAndNil(FDadosValores);
  FreeAndNil(FRegistro);
end;

procedure TRegistrarItens.IncluirValor(Chave, Valor: string);
begin
  FDadosValores.AppendRecord([Chave, Valor]);
end;

function TRegistrarItens.RegistrarValores: integer;
var
  AChave, AValor: string;
  count: integer;
begin
  count := 0;
  try
    FDadosValores.First;
    while not FDadosValores.Eof do
    begin
      try
        AChave := FDadosValores.FieldByName('Chave').AsString;
        AValor := FDadosValores.FieldByName('Valor').AsString;
        FRegistro.WriteString(AChave, AValor);
        FDadosValores.Next;
        Inc(Count);
      except
        on E:Exception do
        begin
          FDadosValores.Next;
          Continue;
        end;
      end;
    end;
  finally
    Result := count;
  end;
end;

end.
