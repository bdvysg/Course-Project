object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1110#1074
  ClientHeight = 410
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 812
    Height = 410
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Pe_Id'
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pe_Name'
        Title.Caption = #1030#1084#39#1103
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pe_SurName'
        Title.Caption = #1055#1088#1110#1079#1074#1080#1097#1077
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pe_DateOfBirth'
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
        Width = 114
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 248
    Top = 248
    object some1: TMenuItem
      Caption = #1054#1085#1086#1074#1080#1090#1080
      OnClick = some1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 392
    Top = 120
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=BDVYSG\SQLEXPRES' +
      'S;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=40' +
      '96;Workstation ID=BDVYSG;Use Encryption for Data=False;Tag with ' +
      'column collation when possible=False;'
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from person')
    Left = 440
    Top = 256
  end
end
