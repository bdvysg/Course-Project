object SalesListForm: TSalesListForm
  Left = 0
  Top = 0
  Caption = #1050#1072#1090#1072#1083#1086#1075' '#1095#1077#1082#1110#1074
  ClientHeight = 615
  ClientWidth = 719
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
    Width = 719
    Height = 615
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
        FieldName = 'SL_Id'
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PM_Name'
        Title.Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1080
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SL_Date'
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1103
        Width = 142
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 336
    Top = 160
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
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select * from Sales'
      'inner join PayMethod on SL_PayMethod = PM_Id'
      'where SL_Place = :ID')
    Left = 448
    Top = 296
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=CourseProj;Data Source=BDVYSG\SQLEXPRES' +
      'S;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=40' +
      '96;Workstation ID=BDVYSG;Use Encryption for Data=False;Tag with ' +
      'column collation when possible=False;'
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
      'select * from Sales'
      'inner join SalesTovList on SL_Id = STL_Doc'
      'inner join Place on SL_Place = Pl_Id'
      'inner join Tovar on STL_Tovar = Tov_Id'
      'where SL_Id = :ID'
      '')
    Left = 352
    Top = 320
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 336
    Top = 440
  end
end
