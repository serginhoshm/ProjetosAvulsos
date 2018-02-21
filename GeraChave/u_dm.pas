unit u_dm;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TDM = class(TDataModule)
    CDS_UF: TClientDataSet;
    DS_CDS_UF: TDataSource;
    CDS_TipoEmiss: TClientDataSet;
    DS_CDS_TipoEmiss: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
