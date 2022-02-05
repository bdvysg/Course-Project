object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'PersonEditForm'
  ClientHeight = 291
  ClientWidth = 633
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
    Left = 224
    Top = 88
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 224
    Top = 110
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object Label3: TLabel
    Left = 224
    Top = 132
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object Label4: TLabel
    Left = 224
    Top = 154
    Width = 37
    Height = 16
    Caption = 'Label1'
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
      'select * from Person where Pe_Id = :Id')
    Left = 392
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 528
    Top = 128
  end
end
