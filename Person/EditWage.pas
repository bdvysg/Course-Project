unit EditWage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TForm4 = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure EditWageView(id: integer);
  end;

var
  Form4: TForm4;
  ID_ : integer;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  ADOQuery1.Sql.Clear;
  ADOQuery1.Sql.Add('Update Person Set Pe_Wage = ' + Edit1.Text + 'Where Pe_Id = ' + IntToStr(ID_));
  ADOQuery1.ExecSQL;
  Form4.Close;
end;

procedure TForm4.EditWageView(ID : integer);
begin
  ADOQuery1.Parameters.ParamByName('ID').Value := ID;
  ADOQuery1.Open;
  ID_ := ID;
  Edit1.Text := '';
  Form4.Show;
end;

end.
