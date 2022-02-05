object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1047#1084#1110#1085#1072' '#1047#1055
  ClientHeight = 127
  ClientWidth = 427
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
    Left = 54
    Top = 14
    Width = 123
    Height = 28
    Caption = #1055#1086#1090#1086#1095#1085#1072' '#1047#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 246
    Top = 14
    Width = 87
    Height = 28
    Caption = #1053#1086#1074#1072' '#1047#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 54
    Top = 48
    Width = 123
    Height = 24
    DataField = 'Pe_Wage'
    DataSource = DataSource1
    TabOrder = 0
  end
  object Button1: TButton
    Left = 128
    Top = 78
    Width = 153
    Height = 41
    Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 232
    Top = 48
    Width = 121
    Height = 24
    TabOrder = 2
    Text = 'Edit1'
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 360
    Top = 16
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
      'select Pe_Wage from Person where Pe_Id = :ID')
    Left = 360
    Top = 72
  end
end
