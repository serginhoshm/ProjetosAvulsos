object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Checkbox com DbGrid'
  ClientHeight = 534
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    1012
    534)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridDados: TDBGrid
    Left = 8
    Top = 8
    Width = 996
    Height = 449
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = ds_cdsdados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColExit = DBGridDadosColExit
    OnDrawColumnCell = DBGridDadosDrawColumnCell
    OnKeyPress = DBGridDadosKeyPress
  end
  object Cbxprocessar: TDBCheckBox
    Tag = 1
    Left = 288
    Top = 104
    Width = 14
    Height = 17
    Color = clBtnFace
    Ctl3D = False
    DataField = 'EhAnimal'
    DataSource = ds_cdsdados
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 1
    ValueChecked = ''
    ValueUnchecked = ''
    Visible = False
  end
  object CbxProcessar2: TDBCheckBox
    Tag = 1
    Left = 288
    Top = 127
    Width = 14
    Height = 17
    Color = clBtnFace
    Ctl3D = False
    DataField = 'EhVegetal'
    DataSource = ds_cdsdados
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 2
    Visible = False
  end
  object cbxprocessarint: TDBCheckBox
    Tag = 1
    Left = 288
    Top = 150
    Width = 14
    Height = 17
    Color = clBtnFace
    Ctl3D = False
    DataField = 'EhMineral'
    DataSource = ds_cdsdados
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 3
    ValueChecked = '1'
    ValueUnchecked = '0'
    Visible = False
  end
  object cbxprocessarstr: TDBCheckBox
    Tag = 1
    Left = 288
    Top = 173
    Width = 14
    Height = 17
    Color = clBtnFace
    Ctl3D = False
    DataField = 'EhExtraterrestre'
    DataSource = ds_cdsdados
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 4
    ValueChecked = 'S'
    ValueUnchecked = 'N'
    Visible = False
  end
  object cdsdados: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'EhAnimal'
        DataType = ftBoolean
      end
      item
        Name = 'EhVegetal'
        DataType = ftBoolean
      end
      item
        Name = 'EhMineral'
        DataType = ftBoolean
      end
      item
        Name = 'EhExtraterrestre'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 72
    Data = {
      900000009619E0BD010000001800000006000000000003000000900006636F64
      69676F0400010000000000046E6F6D6501004900000001000557494454480200
      02006400084568416E696D616C02000300000000000945685665676574616C02
      000300000000000945684D696E6572616C020003000000000010456845787472
      6174657272657374726502000300000000000000}
  end
  object ds_cdsdados: TDataSource
    DataSet = cdsdados
    Left = 136
    Top = 72
  end
end
