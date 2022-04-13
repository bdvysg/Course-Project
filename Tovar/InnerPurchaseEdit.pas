unit InnerPurchaseEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, TovarEdit, Vcl.Menus, ComObj,
  A7Rep;

type
  TInnerPurchaseEditForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ComboBox1: TComboBox;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    ComboBox2: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Edit1: TEdit;
    Button5: TButton;
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  procedure InnerPurchaseEditFormView(id_ : integer);
  end;

var
  InnerPurchaseEditForm: TInnerPurchaseEditForm;
  id: integer;

implementation

{$R *.dfm}

procedure TInnerPurchaseEditForm.InnerPurchaseEditFormView(id_ : integer);
begin
  id := id_;
  n2.Caption := 'Підтвердити';
  if id = 0 then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('insert into Purchase(Pr_Storage) values (1)');
    ADOQuery1.ExecSQL;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select top 1 * from Purchase order by Pr_Id desc');
    ADOQuery1.Open;
    InnerPurchaseEditFormView(ADOQuery1.FieldByName('Pr_Id').Value);
  end
  else
  begin
    InnerPurchaseEditForm.Caption := 'Документ закупки - ' + IntToStr(id);
    ADOQuery3.Parameters.ParamByName('ID').Value := id;
    ADOQuery3.Open;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from Purchase where Pr_Id = ' + IntToStr(id));
    ADOQuery1.Open;
    ComboBox2.ItemIndex := ADOQuery1.FieldByName('Pr_Storage').Value - 1;
    if ADOQuery3.FieldByName('Pr_Seller').AsString <> '' then
      Button5.Caption := 'Редагувати';
    Edit1.Text := ADOQuery3.FieldByName('Pr_Seller').AsString;
    TNumericField(ADOQuery3.FieldByName('Summa')).DisplayFormat := '0 грн.';
    TNumericField(ADOQuery3.FieldByName('Tov_PriceOpt')).DisplayFormat := '0 грн.';
    TNumericField(ADOQuery2.FieldByName('Tov_PriceOpt')).DisplayFormat := '0 грн.';
    if ADOQuery1.FieldByName('Pr_IsConifrm').Value = True then
    begin
      InnerPurchaseEditForm.Caption := 'Документ закупки - ' + IntToStr(id) + '  ЗАТВЕРДЖЕНО ✅';
      N2.Caption := 'Відмінити';
      N2.Enabled := False;
      Button2.Enabled := False;
      Button1.Enabled := False;
      Button5.Enabled := False;
      Edit1.Enabled := False;
      ComboBox2.Enabled := False;
      ComboBox1.Enabled := False;
      DBGrid1.ReadOnly := True;
    end;
  end;

  InnerPurchaseEditForm.Show;
end;

procedure TInnerPurchaseEditForm.N1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('delete from PurchaseTovList where PTL_Doc = ' + IntToStr(id) + 'and PTL_Tovar = ' + VarToStr(DBGrid1.Fields[0].Value));
  ADOQuery1.ExecSQL;
  ADOQuery3.Close;
  ADOQuery3.Parameters.ParamByName('ID').Value := id;
  ADOQuery3.Open;
end;

procedure TInnerPurchaseEditForm.N2Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Sql.Clear;
  ADOQuery1.Sql.Add('update Purchase set Pr_IsConifrm = iif(Pr_IsConifrm = 1, 0, 1) where Pr_Id = ' + IntToStr(id));
  ADOQuery1.ExecSQL;
  InnerPurchaseEditFormView(id);
end;

procedure TInnerPurchaseEditForm.N3Click(Sender: TObject);
var
  i : Integer;
  s, sum : Double;
  Rep: TA7Rep;
begin
  Rep := TA7Rep.Create(nil);
  Rep.OpenTemplate('C:\Users\bdvys\Desktop\CourseProject\Excel\Товарна накладна.xls');
  Rep.PasteBand('Title');
  Rep.SetValue('#VENDOR#',ADOQuery3.FieldByName('Pr_Seller').AsString);
  Rep.SetValue('#BUY#','ООО Товари для дому');
  Rep.SetValueF('#D#', ADOQuery3.FieldByName('Pr_DateConfirmStr').AsString);
  Rep.SetValue('#NOTE#','-');
  //Rep.SetComment('#ID#','Здесь мы комментируем если нужно'); // Обязательно делаем комментарий ПЕРЕД тем как вставим значение в ячейку, иначе значение затрет метку и SetComment не найдет куда писать коммент
  Rep.SetValue('#ID#', ADOQuery3.FieldByName('Pr_Id').AsString);
  ADOQuery3.First;
  for i := 1 to ADOQuery3.recordcount do
  begin
    Rep.PasteBand('Line');
    Rep.SetValue('#N#', i);
    Rep.SetValue('#NAME#', ADOQuery3.FieldByName('Tov_Name').AsString);
    Rep.SetValue('#UNIT#', 'шт.');
    Rep.SetValue('#QUANT#', ADOQuery3.FieldByName('PTL_Amount').AsString);
    s := ADOQuery3.FieldByName('Tov_PriceOpt').AsFloat * ADOQuery3.FieldByName('PTL_Amount').AsFloat;
    Rep.SetValue('#PRICE#', ADOQuery3.FieldByName('Tov_PriceOpt').AsFloat);
    sum := sum + s;
    ADOQuery3.Next;
  end;
  Rep.PasteBand('Foot');
  Rep.SetValue('#SUMMA#', sum);
  Rep.SetValue('#CURRENT_DATE#', DateToStr(now));
  Rep.Show;
end;

procedure TInnerPurchaseEditForm.Button1Click(Sender: TObject);
var sql: string;
    i: integer;
begin
    sql := 'insert into PurchaseTovList(PTL_Doc, PTL_Tovar) select ' + IntToStr(id) + ', Tov_Id from tovar where Tov_Id in (';
    for i := 0 to (DBGrid2.SelectedRows.Count - 1) do
    begin
      DBGrid2.DataSource.DataSet.Bookmark := DBGrid2.SelectedRows[i];
      sql := sql + DBGrid2.Fields[0].AsString;
      if i < DBGrid2.SelectedRows.Count - 1 then
        sql := sql + ', '
      else
        sql := sql + ')'
    end;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add(sql);
    ADOQuery1.ExecSQL;
    ADOQuery3.Close;
    ADOQuery3.Parameters.ParamByName('ID').Value := id;
    ADOQuery3.Open;
end;

procedure TInnerPurchaseEditForm.Button2Click(Sender: TObject);
begin
  Form7 := TForm7.Create(Self);
  Form7.ViewTovarEdit(0);
end;

procedure TInnerPurchaseEditForm.Button5Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('update Purchase set Pr_Seller = ''' + edit1.Text + ''' where Pr_Id = ' + IntToStr(id));
  ADOQuery1.ExecSQL;
end;

procedure TInnerPurchaseEditForm.ComboBox1Change(Sender: TObject);
begin
    ADOQuery2.Close;
    ADOQuery2.Sql.Clear;
    ADOQuery2.Sql.Add('select * from Tovar inner join Depart on Dep_Id = Tov_Depart');
    if ComboBox1.ItemIndex > 0 then
      ADOQuery2.Sql.Add(' where Dep_Id = ' + IntToStr(ComboBox1.ItemIndex));
    ADOQuery2.Open;
    TNumericField(ADOQuery2.FieldByName('Tov_Price')).DisplayFormat := '0 грн.';
end;

procedure TInnerPurchaseEditForm.ComboBox2Change(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Sql.Clear;
  ADOQuery1.Sql.Add('update Purchase set Pr_Storage = ' + IntToStr(ComboBox2.ItemIndex + 1) + 'where Pr_Id = ' + IntToStr(id));
  ADOQuery1.ExecSQL;
end;

procedure TInnerPurchaseEditForm.DBGrid1CellClick(Column: TColumn);
begin
  if Column.Index = 0 then
  begin
    Form7 := TForm7.Create(Self);
    Form7.ViewTOvarEdit(DBGrid1.Fields[0].Value);
  end;
end;

procedure TInnerPurchaseEditForm.DBGrid2CellClick(Column: TColumn);
begin
  if Column.Index = 0 then
  begin
    Form7 := TForm7.Create(Self);
    Form7.ViewTOvarEdit(DBGrid2.Fields[0].Value);
  end;
end;

procedure TInnerPurchaseEditForm.FormCreate(Sender: TObject);
begin
  ADOQuery1.Open;
  ADOQuery2.Open;
  TNumericField(ADOQuery2.FieldByName('Tov_Price')).DisplayFormat := '0 грн.';
  ADOQuery1.First;
  while not ADOQuery1.Eof do
  begin
    ComboBox1.Items.Add(ADOQuery1.FieldByName('Dep_Name').AsString);
    ADOQuery1.Next;
  end;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from Storage');
  ADOQuery1.Open;
  ADOQuery1.First;
  while not ADOQuery1.Eof do
  begin
    ComboBox2.Items.Add(ADOQuery1.FieldByName('St_Name').AsString);
    ADOQuery1.Next;
  end;
end;

end.
