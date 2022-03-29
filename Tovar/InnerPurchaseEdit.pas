unit InnerPurchaseEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, TovarEdit;

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
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

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
  end;

  InnerPurchaseEditForm.Show;
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

procedure TInnerPurchaseEditForm.ComboBox1Change(Sender: TObject);
begin
    ADOQuery2.Close;
    ADOQuery2.Sql.Clear;
    ADOQuery2.Sql.Add('select * from Tovar inner join Depart on Dep_Id = Tov_Depart');
    if ComboBox1.ItemIndex > 0 then
      ADOQuery2.Sql.Add(' where Dep_Id = ' + IntToStr(ComboBox1.ItemIndex));
    ADOQuery2.Open;
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
  ComboBox2.ItemIndex := 0;
end;

end.
