unit ChangePrice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, TovarEdit;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.Button3Click(Sender: TObject);
var Filter : string;
    i : integer;
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    Filter := 'where Dep_Id = ' + IntToStr(ComboBox1.ItemIndex)
  end;
  if RadioGroup1.ItemIndex = 1 then
  begin
    Filter := 'where Tov_Id in (';
    for i := 0 to DBGrid1.SelectedRows.Count - 1 do
    begin
      DBGrid1.DataSource.DataSet.Bookmark := DBGrid1.SelectedRows[i];
      Filter := Filter + DBGrid1.Fields[0].AsString;
      if i < DBGrid1.SelectedRows.Count - 1 then
        Filter := Filter + ', '
      else
        Filter := Filter + ')'
    end;
  end;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Add('update tovar set Tov_Price = Tov_Price + Tov_Price*(:Percent / 100) from tovar inner join Depart on Dep_Id = Tov_Depart');
  ADOQuery3.Sql.Add(Filter);
  ADOQuery3.Parameters.ParamByName('Percent').Value := strtoint(Edit1.Text);
  ADOQuery3.ExecSQL();
  ShowMessage('Оновленно - ' + inttostr(DBGrid1.SelectedRows.Count) + ' товарів');
  ADOQuery1.Refresh;
end;

procedure TForm8.ComboBox1Change(Sender: TObject);
var sql : string;
begin
    ADOQuery1.Close;
    ADOQuery1.Sql.Clear;
    ADOQuery1.Sql.Add('select * from Tovar inner join depart on Dep_Id = Tov_Depart inner join Measuring on Ms_Id = Tov_Measuring');
    if ComboBox1.ItemIndex > 0 then
      ADOQuery1.Sql.Add(' where Dep_Id = ' + IntToStr(ComboBox1.ItemIndex));
    ADOQuery1.Open;
    TNumericField(ADOQuery1.FieldByName('Tov_Price')).DisplayFormat := '0 грн.';
    Label1.Caption := 'Обрано - ' + IntToStr(ADOQuery1.RecordCount);
end;

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
    if Column.Index = 0 then
    begin
        Form7 := TForm7.Create(Self);
        Form7.ViewTOvarEdit(DBGrid1.Fields[0].Value);
    end;
    Label1.Caption := 'Обрано - ' + IntToStr(DBGrid1.SelectedRows.Count);
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  ADOQuery1.Open;
  TNumericField(ADOQuery1.FieldByName('Tov_Price')).DisplayFormat := '0 грн.';
  ADOQuery2.Open;
  ADOQuery2.First;
  while not ADOQuery2.Eof do
  begin
    ComboBox1.Items.Add(ADOQuery2.FieldByName('Dep_Name').AsString);
    ADOQuery2.Next;
  end;
end;

procedure TForm8.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
  begin
    ComboBox1.Enabled := False;
    DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect,dgTitleClick,dgTitleHotTrack];
  end;
  if RadioGroup1.ItemIndex = 0 then
  begin
    ComboBox1.Enabled := True;
    DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
  end;
end;

end.
