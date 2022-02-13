unit TovarEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TForm7 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBImage1: TDBImage;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ViewTovarEdit(id: integer);
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.ViewTovarEdit(id: integer);
begin
  try
    ADOQuery1.Parameters.ParamByName('Id').Value := id;
    ADOQuery1.Open;
    Form7.Caption := Form7.Caption + IntToStr(ADOQuery1.FieldByName('Tov_Id').Value);
    Form7.Show;
  except

  end;
end;

end.
