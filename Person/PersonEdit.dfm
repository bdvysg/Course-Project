object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072' - '
  ClientHeight = 430
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 50
    Width = 108
    Height = 28
    Caption = #1055#1088#1110#1079#1074#1080#1097#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 38
    Width = 7
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 49
    Height = 28
    Caption = #1030#1084#39#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 118
    Width = 132
    Height = 28
    Caption = #1055#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 12
    Top = 152
    Width = 68
    Height = 28
    Caption = #1057#1090#1072#1090#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 12
    Top = 186
    Width = 196
    Height = 28
    Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 12
    Top = 220
    Width = 84
    Height = 28
    Caption = #1055#1086#1089#1072#1076#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 12
    Top = 254
    Width = 148
    Height = 28
    Caption = #1052#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 12
    Top = 288
    Width = 106
    Height = 28
    Caption = #1047#1072#1088#1087#1083#1072#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 16
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
  object Label11: TLabel
    Left = 8
    Top = 322
    Width = 236
    Height = 28
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080#1081' '#1085#1072' '#1088#1086#1073#1086#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 512
    Top = 38
    Width = 297
    Height = 291
    Stretch = True
  end
  object Label12: TLabel
    Left = 512
    Top = 338
    Width = 61
    Height = 16
    Caption = #1060#1086#1090#1086' URL:'
    Visible = False
  end
  object DBEdit1: TDBEdit
    Left = 256
    Top = 16
    Width = 193
    Height = 24
    DataField = 'Pe_Id'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 256
    Top = 50
    Width = 193
    Height = 24
    DataField = 'Pe_SurName'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 256
    Top = 84
    Width = 193
    Height = 24
    DataField = 'Pe_Name'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 256
    Top = 118
    Width = 193
    Height = 24
    DataField = 'Pe_FatherName'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 256
    Top = 152
    Width = 193
    Height = 24
    DataField = 'Pe_Gender_'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 256
    Top = 186
    Width = 193
    Height = 24
    DataField = 'Pe_DateOfBirth'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 256
    Top = 220
    Width = 193
    Height = 24
    DataField = 'Pe_Posistion'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 256
    Top = 254
    Width = 193
    Height = 24
    DataField = 'Pl_Name'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 256
    Top = 288
    Width = 193
    Height = 24
    DataField = 'Pe_Wage'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit10: TDBEdit
    Left = 256
    Top = 322
    Width = 193
    Height = 24
    DataField = 'Pe_DateOnWork'
    DataSource = DataSource1
    TabOrder = 9
  end
  object Button1: TButton
    Left = 455
    Top = 288
    Width = 26
    Height = 28
    Caption = #1056
    TabOrder = 10
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 608
    Top = 368
    Width = 89
    Height = 25
    Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
    TabOrder = 11
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 256
    Top = 186
    Width = 193
    Height = 28
    Date = 44697.000000000000000000
    Time = 0.521281550929416000
    TabOrder = 12
  end
  object DateTimePicker2: TDateTimePicker
    Left = 256
    Top = 322
    Width = 193
    Height = 24
    Date = 44697.000000000000000000
    Time = 0.522539479163242500
    TabOrder = 13
  end
  object DBEdit11: TDBEdit
    Left = 579
    Top = 335
    Width = 230
    Height = 24
    DataField = 'Pe_Photo'
    DataSource = DataSource1
    TabOrder = 14
    Visible = False
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=BDVYSG\SQLEXPRES' +
      'S;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=40' +
      '96;Workstation ID=BDVYSG;Use Encryption for Data=False;Tag with ' +
      'column collation when possible=False;'
    CursorType = ctStatic
    EnableBCD = False
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
      
        'select *,case Pe_Gender when '#39'F'#39' then '#39#1078#1110#1085#1086#1095#1072#39' when '#39'M'#39' then '#39#1095#1086 +
        #1083#1086#1074#1110#1095#1072#39' end as Pe_Gender_ from Person'
      'inner join Place on Pe_PlaceOfWork = Pl_Id'
      'where Pe_Id = :Id')
    Left = 248
    Top = 352
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 320
    Top = 352
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 368
    object N1: TMenuItem
      Caption = #1054#1085#1086#1074#1080#1090#1080
      OnClick = N1Click
    end
  end
  object NetHTTPClient1: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 480
    Top = 8
  end
end
