unit ChangePlace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    btn: TButton;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  id: integer;

implementation

{$R *.dfm}
procedure TForm5.btnClick(Sender: TObject);
var sql: string;
begin
  sql := ADOQuery1.SQL.Text;
  ADOQuery1.SQL.Clear;
  //ADOQuery1.SQL.Add(sql);
  ADOQuery1.SQL.Add('update Person set Pe_PlaceOfWork = ');
  ADOQuery1.SQL.Add(IntToStr(ComboBox1.ItemIndex + 3));
  ADOQuery1.SQL.Add(', Pe_Posistion = ''');
  ADOQuery1.SQL.Add(Edit4.Text);
  ADOQuery1.SQL.Add(''' where Pe_Id = ');
  ADOQuery1.SQL.Add(IntToStr(id));
  ADOQuery1.ExecSQL;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(sql);
  ADOQuery1.Open;
end;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
var name : string;
begin
  name := VarToStr(DBGrid1.Fields[1].Value) + ' ' + VarToStr(DBGrid1.Fields[2].Value);
  id := DBGrid1.Fields[0].Value;
  Combobox1.ItemIndex := 0;
  Edit1.Text := name;
  Edit2.Text := DBGrid1.Fields[4].Value;
  Edit4.Text := ADOQuery1.FieldByName('Pe_Posistion').Value;
end;


procedure TForm5.FormCreate(Sender: TObject);
begin
  ADOQuery1.Open;
end;

end.
