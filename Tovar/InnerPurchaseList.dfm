object InnerPurchaseListForm: TInnerPurchaseListForm
  Left = 0
  Top = 0
  Caption = #1050#1072#1083#1086#1075' '#1079#1072#1082#1091#1087#1086#1082
  ClientHeight = 402
  ClientWidth = 706
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
    Width = 706
    Height = 402
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'Pr_Id'
        Title.Caption = #1050#1086#1076
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pr_DateIntput'
        Title.Caption = #1044#1072#1090#1072' '#1089#1090#1074#1086#1088#1077#1085#1085#1103
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pr_Storage'
        Title.Caption = #1057#1082#1083#1072#1076
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pr_IsConifrm'
        Title.Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1086
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pr_DateConfirm'
        Title.Caption = #1044#1072#1090#1072' '#1087#1110#1076#1074#1077#1088#1076#1078#1077#1085#1085#1103
        Width = 143
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 104
    object makenew: TMenuItem
      Caption = #1057#1090#1074#1086#1088#1080#1090#1080' '#1085#1086#1074#1091
      OnClick = makenewClick
    end
    object N1: TMenuItem
      Caption = #1054#1085#1086#1074#1080#1090#1080
      OnClick = N1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 240
    Top = 56
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
      
        'select Pr_Id, Pr_DateIntput, St_Name as Pr_Storage, case Pr_IsCo' +
        'nifrm when 1 then '#39#1090#1072#1082#39' else '#39#1085#1110#39' end as Pr_IsConifrm, Pr_DateCo' +
        'nfirm'
      'from Purchase'
      'inner join Storage on Pr_Storage = St_Id')
    Left = 304
    Top = 56
  end
end
