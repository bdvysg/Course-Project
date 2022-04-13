unit Saleslist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, A7Rep;

type
  TSalesListForm = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SalesListView(id: integer);
  end;

var
  SalesListForm: TSalesListForm;

implementation

{$R *.dfm}
procedure TSalesListForm.DBGrid1CellClick(Column: TColumn);
var
  i : Integer;
  s, sum : Double;
  Rep: TA7Rep;
begin
  if not ADOQuery2.IsEmpty then
    ADOQuery2.Close;
  ADOQuery2.Parameters.ParamByName('ID').Value := DBGrid1.Fields[0].Value;
  ADOQuery2.Open;
  Rep := TA7Rep.Create(nil);
  Rep.OpenTemplate('C:\Users\bdvys\Desktop\CourseProject\Excel\Товарний чек.xls');
  Rep.PasteBand('Title');
  Rep.SetValueF('#Date#', ADOQuery2.FieldByName('SL_Date').AsString);
  Rep.SetValue('#ID#', ADOQuery2.FieldByName('SL_Id').AsString);
  ADOQuery2.First;
  for i := 1 to ADOQuery2.recordcount do
  begin
    Rep.PasteBand('Line');
    Rep.SetValue('#N#', i);
    Rep.SetValue('#Title#', ADOQuery2.FieldByName('Tov_Name').AsString);
    Rep.SetValue('#Unit#', 'шт.');
    Rep.SetValue('#Amount#', ADOQuery2.FieldByName('STL_Amount').AsString);
    s := ADOQuery2.FieldByName('Tov_Price').AsFloat * ADOQuery2.FieldByName('STL_Amount').AsFloat;
    Rep.SetValue('#Price#', ADOQuery2.FieldByName('Tov_Price').AsFloat);
    sum := sum + s;
    ADOQuery2.Next;
  end;
  Rep.PasteBand('Foot');
  Rep.SetValue('#Summa#', sum);
  Rep.SetValue('#PL_Name#', ADOQuery2.FieldByName('PL_Name').AsString);
  Rep.Show;
end;

procedure TSalesListForm.SalesListView(id: integer);
begin
  ADOQuery1.Parameters.ParamByName('ID').Value := id;
  ADOQuery1.Open;
  SalesListForm.show;
end;

end.
