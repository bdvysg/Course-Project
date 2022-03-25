unit TovarEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, JPEG;

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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Image1: TImage;
    NetHTTPClient1: TNetHTTPClient;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

procedure TForm7.Button1Click(Sender: TObject);
var new_id: integer;
begin
  ADOQuery1.Post;
  ADOQuery2.Open;
  new_id := ADOQuery2.FieldByName('Tov_Id').Value;
  ViewTovarEdit(new_id);
end;

procedure TForm7.ViewTovarEdit(id: integer);
var Stream: TMemoryStream;
    Jpeg: TJPEGImage;
begin
  if id > 0 then
  begin
    try
      ADOQuery1.Parameters.ParamByName('Id').Value := id;
      ADOQuery1.Open;
      Button1.Visible := false;
      Label7.Visible := true;
      DBEdit7.Visible := true;
      Form7.Caption := 'Карточка товару' + ' - ' + IntToStr(ADOQuery1.FieldByName('Tov_Id').Value);
      Stream := TMemoryStream.Create();
      Jpeg := TJPEGImage.Create();
      Try
        NetHTTPClient1.Get(ADOQuery1.FieldByName('Tov_Photo').Value, Stream);
        Stream.Position := 0;
        if pos('.jpg',ADOQuery1.FieldByName('Tov_Photo').Value) <> 0 then
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
      Form7.ClientWidth := 510 + Image1.Width;
      Form7.ClientHeight := 18 + Image1.Height;
      if Form7.ClientHeight < 270 then
        Form7.ClientHeight := 270;

    End;
    except

    end;
  end
  else
  begin
    Form7.Caption := 'Додати новий товар';
    Label7.Visible := true;
    DBEdit7.Visible := true;
    Button1.Visible := true;
    ADOQuery1.Active := true;
    DBEdit4.DataField := 'Tov_Depart';
    DBEdit5.DataField := 'Tov_Measuring';
    Image1.Picture.LoadFromFile('C:\Users\bdvys\Desktop\CourseProject\assets\help_pic.png');
    Form7.ClientWidth := 510 + Image1.Width;
    Form7.ClientHeight := 18 + Image1.Height;
    if Form7.ClientHeight < 270 then
      Form7.ClientHeight := 270;
  end;
  Form7.Show;

end;

end.
