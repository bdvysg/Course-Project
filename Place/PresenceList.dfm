object PresenceListForm: TPresenceListForm
  Left = 0
  Top = 0
  ClientHeight = 551
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 671
    Height = 551
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_Name'
        Title.Caption = #1053#1072#1079#1074#1072
        Width = 364
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tov_Price'
        Title.Caption = #1062#1110#1085#1072
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pr_Amount'
        Title.Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
        Width = 111
        Visible = True
      end>
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=BDVYSG\SQLEXPRES' +
      'S;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=40' +
      '96;Workstation ID=BDVYSG;Use Encryption for Data=False;Tag with ' +
      'column collation when possible=False;'
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'St_Id'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select * from Presence '
      'inner join Storage ON Pr_Storage = St_Id'
      'inner join Tovar ON Pr_Tovar = Tov_id'
      'where Pr_Storage = :St_Id')
    Left = 328
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 608
    Top = 96
  end
end
