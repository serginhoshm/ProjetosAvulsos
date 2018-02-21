object Form1: TForm1
  Left = 183
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gera chave NF-e'
  ClientHeight = 199
  ClientWidth = 428
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 13
    Caption = 'UF (2)'
  end
  object Label2: TLabel
    Left = 198
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Ano/m'#234's (4)'
  end
  object LECNPJ: TLabeledEdit
    Left = 262
    Top = 24
    Width = 121
    Height = 24
    EditLabel.Width = 71
    EditLabel.Height = 13
    EditLabel.Caption = 'CNPJ Emit (14)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MaxLength = 14
    ParentFont = False
    TabOrder = 2
  end
  object LEModelo: TLabeledEdit
    Left = 8
    Top = 72
    Width = 49
    Height = 24
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'Modelo (2)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 3
  end
  object LESerie: TLabeledEdit
    Left = 64
    Top = 72
    Width = 43
    Height = 24
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = 'S'#233'rie (3)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 4
  end
  object DBLookupComboBoxUF: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 185
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    KeyField = 'CdUF'
    ListField = 'DsUF'
    ListSource = DM.DS_CDS_UF
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 7
    OnClick = Button1Click
  end
  object LENumNF: TLabeledEdit
    Left = 113
    Top = 72
    Width = 80
    Height = 24
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero NF (9)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MaxLength = 9
    ParentFont = False
    TabOrder = 5
  end
  object LEAnoMes: TMaskEdit
    Left = 198
    Top = 24
    Width = 57
    Height = 24
    EditMask = '!99/99;1;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 1
    Text = '  /  '
  end
  object LECodNum: TLabeledEdit
    Left = 201
    Top = 71
    Width = 96
    Height = 24
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd. num. (8)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    TabOrder = 6
  end
  object LabeledEdit3: TLabeledEdit
    Left = 8
    Top = 128
    Width = 369
    Height = 24
    EditLabel.Width = 91
    EditLabel.Height = 13
    EditLabel.Caption = 'Chave gerada (44)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MaxLength = 44
    ParentFont = False
    TabOrder = 8
  end
end
