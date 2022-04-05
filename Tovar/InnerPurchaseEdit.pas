unit InnerPurchaseEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, TovarEdit, Vcl.Menus, ComObj;

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
    Button3: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

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
  Button3.Caption := 'Підтвердити';
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
    if ADOQuery1.FieldByName('Pr_IsConifrm').Value = True then
    begin
      InnerPurchaseEditForm.Caption := 'Документ закупки - ' + IntToStr(id) + '  ЗАТВЕРДЖЕНО ✅';
      Button3.Caption := 'Відмінити';
      Button3.Enabled := False;
      Button2.Enabled := False;
      Button1.Enabled := False;
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

procedure TInnerPurchaseEditForm.Button3Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Sql.Clear;
  ADOQuery1.Sql.Add('update Purchase set Pr_IsConifrm = iif(Pr_IsConifrm = 1, 0, 1) where Pr_Id = ' + IntToStr(id));
  ADOQuery1.ExecSQL;
  InnerPurchaseEditFormView(id);
end;

procedure TInnerPurchaseEditForm.Button4Click(Sender: TObject);
var MyExcel: OleVariant;
    Sheet: OLEVariant;
begin
  const ExcelApp = 'Excel.Application';
  MyExcel:=CreateOleObject(ExcelApp);
  MyExcel.WorkBooks.Add;
  Sheet:=MyExcel.ActiveWorkbook.ActiveSheet;
  Sheet.Range['A1:F1'].Merge;
  Sheet.Cells[1, 1] := 'К-во';
  MyExcel.Visible := true;
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
