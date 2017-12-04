object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 39
    Width = 402
    Height = 226
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object EditIP: TEdit
    Left = 89
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '127.0.0.1'
  end
  object Editporta: TEdit
    Left = 216
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '8881'
  end
end
