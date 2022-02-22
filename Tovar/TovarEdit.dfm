object Form7: TForm7
  Left = 0
  Top = 0
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1090#1086#1074#1072#1088#1091
  ClientHeight = 270
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 47
    Height = 28
    Caption = #1050#1086#1076':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 42
    Width = 71
    Height = 28
    Caption = #1053#1072#1079#1074#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 76
    Width = 54
    Height = 28
    Caption = #1062#1110#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 108
    Width = 69
    Height = 28
    Caption = #1043#1088#1091#1087#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 142
    Width = 120
    Height = 28
    Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 176
    Width = 154
    Height = 28
    Caption = #1050#1088#1072#1111#1085#1072' '#1074#1080#1088#1086#1073'.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 400
    Top = 8
    Width = 313
    Height = 241
    AutoSize = True
  end
  object DBEdit1: TDBEdit
    Left = 180
    Top = 8
    Width = 153
    Height = 24
    DataField = 'Tov_Id'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 180
    Top = 42
    Width = 153
    Height = 24
    DataField = 'Tov_Name'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 180
    Top = 76
    Width = 153
    Height = 24
    DataField = 'Tov_Price'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 180
    Top = 110
    Width = 153
    Height = 24
    DataField = 'Dep_Name'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 180
    Top = 142
    Width = 153
    Height = 24
    DataField = 'Ms_Name'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 180
    Top = 176
    Width = 153
    Height = 24
    DataField = 'Tov_CountryMade'
    DataSource = DataSource1
    TabOrder = 5
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=DESKTOP-091F74U\' +
      'SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packe' +
      't Size=4096;Workstation ID=DESKTOP-091F74U;Use Encryption for Da' +
      'ta=False;Tag with column collation when possible=False;'
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select * from Tovar'
      'inner join depart on Dep_Id = Tov_Depart'
      'inner join Measuring on Ms_Id = Tov_Measuring'
      'where Tov_Id = :ID')
    Left = 312
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 368
    Top = 184
  end
  object NetHTTPClient1: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 312
    Top = 240
  end
end
