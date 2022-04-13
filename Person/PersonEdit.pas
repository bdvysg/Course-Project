unit PersonEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, EditWage, Vcl.Menus;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBImage1: TDBImage;
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ViewPersonEdit(id: integer);
  procedure AddPerson;
  end;

var
  Form3: TForm3;

implementation


{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form4 := TForm4.Create(Self);
  Form4.EditWageView(StrToInt(VarToStr(ADOQuery1.Parameters.ParamByName('Id').Value)));

end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 ADOQuery1.Post;
end;

procedure TForm3.N1Click(Sender: TObject);
begin
  ADOQuery1.Refresh;
end;

procedure TForm3.ViewPersonEdit(id: integer);
begin
  try
    ADOQuery1.Parameters.ParamByName('Id').Value := id;
    ADOQuery1.Open;
    Form3.Caption := Form3.Caption + IntToStr(ADOQuery1.FieldByName('Pe_Id').Value);
    Form3.Show;
  except

  end;
end;

procedure TForm3.AddPerson;
begin
  try
    Form3.Caption := 'Реєстрація нового працівника';
    Button2.Visible := True;
    Button1.Visible := False;
    ADOQuery1.Active := True;
    Form3.Show;
  except

  end;
end;

end.
