object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 338
  Width = 349
  object CDS_UF: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CdUF'
        DataType = ftInteger
      end
      item
        Name = 'DsUF'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 24
    Data = {
      400000009619E0BD010000001800000002000000000003000000400004436455
      4604000100000000000444735546010049000000010005574944544802000200
      3C000000}
  end
  object DS_CDS_UF: TDataSource
    DataSet = CDS_UF
    Left = 128
    Top = 24
  end
  object CDS_TipoEmiss: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CdTipoEmissao'
        DataType = ftInteger
      end
      item
        Name = 'DsTipoEmissao'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 80
    Data = {
      520000009619E0BD01000000180000000200000000000300000052000D436454
      69706F456D697373616F04000100000000000D44735469706F456D697373616F
      0100490000000100055749445448020002003C000000}
  end
  object DS_CDS_TipoEmiss: TDataSource
    DataSet = CDS_TipoEmiss
    Left = 128
    Top = 80
  end
end
