object Form8: TForm8
  Left = 0
  Top = 0
  Caption = #1055#1077#1088#1077#1086#1094#1110#1085#1082#1072
  ClientHeight = 466
  ClientWidth = 644
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
    Left = 459
    Top = 0
    Width = 185
    Height = 466
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 108
      Top = 440
      Width = 57
      Height = 16
      Caption = #1054#1073#1088#1072#1085#1086' - '
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 8
      Width = 153
      Height = 105
      Caption = #1058#1080#1087' '#1087#1077#1088#1077#1086#1094#1110#1085#1082#1080
      Items.Strings = (
        #1043#1088#1091#1087#1072' '#1090#1086#1074#1072#1088#1110#1074
        #1058#1086#1074#1072#1088)
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object Button3: TButton
      Left = 56
      Top = 392
      Width = 97
      Height = 25
      Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 24
      Top = 264
      Width = 145
      Height = 24
      ItemIndex = 0
      TabOrder = 2
      Text = #1042#1089#1110
      OnChange = ComboBox1Change
      Items.Strings = (
        #1042#1089#1110)
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 459
    Height = 466
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
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
        FieldName = 'Tov_Id'
        Title.Caption = #1050#1086#1076
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_Name'
        Title.Caption = #1053#1072#1079#1074#1072
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ms_Name'
        Title.Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_Price'
        Title.Caption = #1062#1110#1085#1072
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dep_Name'
        Title.Caption = #1043#1088#1091#1087#1072' '#1090#1086#1074#1072#1088#1110#1074
        Width = 176
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 208
    Top = 152
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=DESKTOP-091F74U\' +
      'SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packe' +
      't Size=4096;Workstation ID=DESKTOP-091F74U;Use Encryption for Da' +
      'ta=False;Tag with column collation when possible=False;'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Tovar'
      'inner join depart on Dep_Id = Tov_Depart'
      'inner join Measuring on Ms_Id = Tov_Measuring')
    Left = 192
    Top = 280
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 515
    Top = 120
  end
  object ADOQuery2: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=DESKTOP-091F74U\' +
      'SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packe' +
      't Size=4096;Workstation ID=DESKTOP-091F74U;Use Encryption for Da' +
      'ta=False;Tag with column collation when possible=False;'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Depart')
    Left = 579
    Top = 120
  end
end
