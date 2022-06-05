unit PersonEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, EditWage, Vcl.Menus,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent, JPEG,
  Vcl.ComCtrls;

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
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Button2: TButton;
    Image1: TImage;
    NetHTTPClient1: TNetHTTPClient;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label12: TLabel;
    DBEdit11: TDBEdit;
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
  DBEdit6.Text := datetostr(datetimepicker1.date);
  DBEdit10.Text := datetostr(datetimepicker2.date);
  ADOQuery1.Post;
end;

procedure TForm3.N1Click(Sender: TObject);
begin
  ADOQuery1.Refresh;
end;

procedure TForm3.ViewPersonEdit(id: integer);
var Stream: TMemoryStream;
    Jpeg: TJPEGImage;
begin
  try
    Stream := TMemoryStream.Create();
    Jpeg := TJPEGImage.Create();
    ADOQuery1.Parameters.ParamByName('Id').Value := id;
    ADOQuery1.Open;
    datetimepicker1.date := ADOQuery1.FieldByName('Pe_DateOfBirth').Value;
    datetimepicker2.date := ADOQuery1.FieldByName('Pe_DateOnWork').Value;
    Form3.Caption := Form3.Caption + IntToStr(ADOQuery1.FieldByName('Pe_Id').Value);
    Form3.Show;
    NetHTTPClient1.Get(ADOQuery1.FieldByName('Pe_Photo').Value, Stream);
    Stream.Position := 0;
    if pos('.jpg',ADOQuery1.FieldByName('Pe_Photo').Value) <> 0 then
    begin
      jpeg.LoadFromStream(Stream);
      Image1.Picture.Assign(jpeg);
    end
    else
    begin
      Image1.Picture.LoadFromStream(Stream)
    end;
    Finally
      FreeAndNil(Stream);
  end;
end;

procedure TForm3.AddPerson;
begin
  try
    Form3.Caption := 'Реєстрація нового працівника';
    Button2.Visible := True;
    Button1.Visible := False;
    DBEdit11.Visible := True;
    Label12.Visible := True;
    ADOQuery1.Active := True;
    Form3.Show;
  except

  end;
end;

end.
