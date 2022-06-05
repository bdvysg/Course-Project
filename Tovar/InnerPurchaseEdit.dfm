object InnerPurchaseEditForm: TInnerPurchaseEditForm
  Left = 0
  Top = 0
  ClientHeight = 587
  ClientWidth = 999
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 999
    Height = 115
    Align = alTop
    TabOrder = 0
    object Panel2: TPanel
      Left = 520
      Top = 1
      Width = 478
      Height = 113
      Align = alRight
      TabOrder = 0
      object Label1: TLabel
        Left = 352
        Top = 13
        Width = 82
        Height = 16
        Caption = #1043#1088#1091#1087#1072' '#1090#1086#1074#1072#1088#1110#1074
      end
      object Label2: TLabel
        Left = 160
        Top = 84
        Width = 170
        Height = 24
        Caption = #1044#1086#1089#1090#1091#1087#1085#1110' '#1090#1086#1074#1072#1088#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button1: TButton
        Left = 6
        Top = 83
        Width = 75
        Height = 25
        Caption = #1044#1086#1076#1072#1090#1080
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 328
        Top = 65
        Width = 145
        Height = 25
        Caption = #1047#1072#1088#1077#1108#1089#1090#1088#1091#1074#1072#1090#1080' '#1090#1086#1074#1072#1088
        TabOrder = 1
        OnClick = Button2Click
      end
      object ComboBox1: TComboBox
        Left = 328
        Top = 35
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
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 519
      Height = 113
      Align = alClient
      TabOrder = 1
      object Label3: TLabel
        Left = 168
        Top = 84
        Width = 186
        Height = 24
        Caption = #1058#1086#1074#1072#1088#1080' '#1085#1072#1082#1083#1072#1076#1085#1086#1111
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 88
        Top = 2
        Width = 35
        Height = 16
        Caption = #1057#1082#1083#1072#1076
      end
      object Label5: TLabel
        Left = 360
        Top = 2
        Width = 82
        Height = 16
        Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
      end
      object ComboBox2: TComboBox
        Left = 0
        Top = 24
        Width = 257
        Height = 24
        TabOrder = 0
        OnChange = ComboBox2Change
      end
      object Edit1: TEdit
        Left = 290
        Top = 24
        Width = 223
        Height = 24
        TabOrder = 1
      end
      object Button5: TButton
        Left = 408
        Top = 83
        Width = 105
        Height = 25
        Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
        TabOrder = 2
        OnClick = Button5Click
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 115
    Width = 520
    Height = 472
    Align = alClient
    DataSource = DataSource3
    PopupMenu = PopupMenu1
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
        FieldName = 'PTL_Tovar'
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_Name'
        Title.Caption = #1058#1086#1074#1072#1088
        Width = 237
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PTL_Amount'
        Title.Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_PriceOpt'
        Title.Caption = #1062#1110#1085#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Caption = #1057#1091#1084#1084#1072
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 520
    Top = 115
    Width = 479
    Height = 472
    Align = alRight
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Tov_Id'
        Title.Caption = #1050#1086#1076
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_Name'
        Title.Caption = #1053#1072#1079#1074#1072' '#1090#1086#1074#1072#1088#1091
        Width = 334
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_PriceOpt'
        Title.Caption = #1062#1110#1085#1072' '#1086#1087#1090'.'
        Width = 72
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 655
    Top = 9
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
      'select * from Depart')
    Left = 695
    Top = 9
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=BDVYSG\SQLEXPRES' +
      'S;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=40' +
      '96;Workstation ID=BDVYSG;Use Encryption for Data=False;Tag with ' +
      'column collation when possible=False;'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Tovar')
    Left = 872
    Top = 240
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 728
    Top = 240
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 137
    Top = 33
  end
  object ADOQuery3: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=BDVYSG\SQLEXPRES' +
      'S;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=40' +
      '96;Workstation ID=BDVYSG;Use Encryption for Data=False;Tag with ' +
      'column collation when possible=False;'
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
      'select *, '
      
        'case isnull(Pr_DateConfirm, '#39#39') when '#39#39' then '#39#39' else CONVERT(var' +
        'char, Pr_DateConfirm, 23) end as Pr_DateConfirmStr,'
      'Tov_PriceOpt * PTL_Amount as Summa'
      'from PurchaseTovList'
      'inner join Tovar on Tov_Id = PTL_Tovar'
      'inner join Purchase on Pr_Id = PTL_Doc'
      'where PTL_Doc = :ID')
    Left = 177
    Top = 33
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 328
    object N1: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnClick = N1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 304
    Top = 192
    object N2: TMenuItem
      Caption = #1047#1072#1090#1074#1077#1088#1076#1080#1090#1080
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1056#1086#1079#1076#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072#1082#1083#1072#1076#1085#1091
      OnClick = N3Click
    end
  end
end
