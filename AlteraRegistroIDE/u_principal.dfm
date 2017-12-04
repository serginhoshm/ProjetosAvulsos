object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Config'
  ClientHeight = 163
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 119
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RdgSistema: TRadioGroup
    Left = 8
    Top = 8
    Width = 229
    Height = 105
    Caption = 'Configurar'
    ItemIndex = 0
    Items.Strings = (
      'WMS'
      'Corp')
    TabOrder = 1
  end
end
