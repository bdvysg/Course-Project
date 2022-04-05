unit TovarList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Data.Win.ADODB, TovarEdit;

type
  TForm6 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DBGrid1: TDBGrid;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    N12: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure QRefresh(Depart: integer);
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
  Form7 := TForm7.Create(Self);
  Form7.ViewTovarEdit(DBGrid1.Fields[0].Value);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  ADOQuery1.Open;
  TNumericField(ADOQuery1.FieldByName('Tov_Price')).DisplayFormat := '0 грн.';
end;

procedure TForm6.N10Click(Sender: TObject);
begin
  QRefresh(8);
end;

procedure TForm6.N11Click(Sender: TObject);
begin
  QRefresh(9);
end;

procedure TForm6.N12Click(Sender: TObject);
begin
  Form7 := TForm7.Create(Self);
  Form7.ViewTovarEdit(0);
end;

procedure TForm6.N1Click(Sender: TObject);
begin
  if not ADOQuery1.IsEmpty then
    ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TForm6.N3Click(Sender: TObject);
begin
  QRefresh(1);
end;

procedure TForm6.N4Click(Sender: TObject);
begin
  QRefresh(2);
end;

procedure TForm6.N5Click(Sender: TObject);
begin
  QRefresh(3);
end;

procedure TForm6.N6Click(Sender: TObject);
begin
  QRefresh(4);
end;

procedure TForm6.N7Click(Sender: TObject);
begin
  QRefresh(5);
end;

procedure TForm6.N8Click(Sender: TObject);
begin
  QRefresh(6);
end;

procedure TForm6.N9Click(Sender: TObject);
begin
  QRefresh(7);
end;

procedure TForm6.QRefresh(Depart: integer);
begin
  ADOQuery1.Close;
  ADOQuery1.Sql.Clear;
  ADOQuery1.SQL.Text := 'select * from Tovar inner join depart on Dep_Id = Tov_Depart inner join Measuring on Ms_Id = Tov_Measuring';
  ADOQuery1.Sql.Add('');
  if Depart = 0 then
    ADOQuery1.Sql.Add('')
  else
    ADOQuery1.Sql.Add('where Dep_Id = ' + IntToStr(Depart));
  ADOQuery1.Open;
end;


end.
