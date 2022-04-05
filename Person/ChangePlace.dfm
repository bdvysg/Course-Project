object Form5: TForm5
  Left = 0
  Top = 0
  Caption = #1047#1084#1110#1085#1072' '#1084#1110#1089#1094#1103' '#1088#1086#1073#1086#1090#1080
  ClientHeight = 291
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 460
    Top = 0
    Width = 201
    Height = 291
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 146
      Width = 132
      Height = 16
      Caption = #1054#1073#1088#1072#1090#1080' '#1087#1086#1089#1072#1076#1091' '#1090#1072' '#1084#1072#1075'.'
    end
    object Edit1: TEdit
      Left = 16
      Top = 48
      Width = 161
      Height = 24
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 16
      Top = 78
      Width = 161
      Height = 24
      TabOrder = 1
    end
    object btn: TButton
      Left = 48
      Top = 240
      Width = 89
      Height = 25
      Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
      TabOrder = 2
      OnClick = btnClick
    end
    object Edit4: TEdit
      Left = 16
      Top = 198
      Width = 161
      Height = 24
      TabOrder = 3
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 168
      Width = 161
      Height = 24
      TabOrder = 4
      Items.Strings = (
        #1043#1086#1083#1086#1074#1085#1080#1081' '#1086#1092#1110#1089
        #1055#1077#1088#1096#1080#1081' '#1084#1072#1075#1072#1079#1080#1085' '#1075#1086#1089#1087#1086#1076#1072#1088#1089#1100#1082#1080#1093' '#1090#1086#1074#1072#1088#1110#1074
        #1058#1086#1074#1072#1088#1080' '#1076#1083#1103' '#1076#1086#1084#1091
        #1052#1091#1088#1072#1096#1082#1072'-'#1084#1072#1088#1082#1077#1090
        #1043#1110#1087#1077#1088#1094#1077#1085#1090#1088
        '22 '#1082#1091#1073#1110#1095#1085#1080#1093' '#1084#1077#1090#1088#1080)
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 460
    Height = 291
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pe_Name'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pe_SurName'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pl_Id'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pl_Name'
        Width = 73
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 616
    Top = 16
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
      'select p.*, pl.*'
      'from Person p'
      'inner join Place pl on pl.Pl_Id = p.Pe_PlaceOfWork')
    Left = 616
    Top = 64
  end
end
