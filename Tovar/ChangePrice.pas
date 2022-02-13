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
    procedure DBGrid1CellClick(Column: TColumn; Button: TMouseButton);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.DBGrid1CellClick(Column: TColumn; Button: TMouseButton);
begin
    if Button = mbRight then
    begin
        Form7 := TForm7.Create(Self);
        Form7.ViewTOvarEdit(DBGrid1.Fields[0].Value);
    end;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
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
    ComboBox1.Enabled := False;
  if RadioGroup1.ItemIndex = 0 then
    ComboBox1.Enabled := True;

end;

end.
