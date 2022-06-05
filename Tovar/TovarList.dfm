object Form6: TForm6
  Left = 0
  Top = 0
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1090#1086#1074#1072#1088#1110#1074
  ClientHeight = 635
  ClientWidth = 1026
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
    Width = 1026
    Height = 635
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
        FieldName = 'Tov_Id'
        Title.Caption = #1050#1086#1076
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_Name'
        Title.Caption = #1053#1072#1079#1074#1072
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ms_Name'
        Title.Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_Price'
        Title.Caption = #1062#1110#1085#1072
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dep_Name'
        Title.Caption = #1043#1088#1091#1087#1072
        Width = 172
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 168
    object N1: TMenuItem
      Caption = #1054#1085#1086#1074#1080#1090#1080
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1043#1088#1091#1087#1072
      object N3: TMenuItem
        Caption = #1051#1072#1082#1086'-'#1092#1072#1088#1073#1080
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1052#1077#1073#1083#1110
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1044#1080#1090#1103#1095#1110' '#1110#1075#1088#1072#1096#1082#1080
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1055#1086#1089#1091#1076
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1041#1080#1090#1086#1074#1072' '#1093#1110#1084#1110#1103
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1057#1091#1074#1077#1085#1110#1088#1080
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1058#1086#1074#1072#1088#1080' '#1076#1083#1103' '#1089#1072#1076#1091
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #1044#1088#1110#1073#1085#1072' '#1077#1083#1077#1082#1090#1088#1086#1085#1110#1082#1072
        OnClick = N11Click
      end
    end
    object N12: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080
      OnClick = N12Click
    end
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=BDVYSG\SQLEXPRES' +
      'S;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=40' +
      '96;Workstation ID=BDVYSG;Use Encryption for Data=False;Tag with ' +
      'column collation when possible=False;'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Tovar'
      'inner join depart on Dep_Id = Tov_Depart'
      'inner join Measuring on Ms_Id = Tov_Measuring')
    Left = 368
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 392
    Top = 304
  end
end
