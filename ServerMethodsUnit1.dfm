object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 150
  Width = 215
  object UniConnection1: TUniConnection
    ProviderName = 'DB2'
    Port = 50000
    Database = 'M2MOTOR'
    Username = 'sn'
    Server = '10.0.0.30'
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
    EncryptedPassword = '8CFF91FFBFFFC6FFC6FF'
  end
  object DB2UniProvider1: TDB2UniProvider
    Left = 136
    Top = 16
  end
  object UniQMaster: TUniQuery
    Connection = UniConnection1
    Left = 32
    Top = 80
  end
end
