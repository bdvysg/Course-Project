unit PersonEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB, Data.DB;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ViewPersonEdit(id: integer);
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.ViewPersonEdit(id: integer);
begin
  Form3.ADOQuery1.Parameters.ParamByName('Id').Value := id;
  Form3.ADOQuery1.Open;
  Form3.Label1.Caption := Form3.ADOQuery1.FieldByName('Pe_Id').Value;
  Form3.Label2.Caption := Form3.ADOQuery1.FieldByName('Pe_Name').Value;
  Form3.Label3.Caption := Form3.ADOQuery1.FieldByName('Pe_SurName').Value;
  Form3.Label4.Caption := Form3.ADOQuery1.FieldByName('Pe_DateOfBirth').Value;
  Form3.Show;
end;

end.
