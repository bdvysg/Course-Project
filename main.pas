unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, PersonList, ChangePlace, PersonEdit, TovarList, ChangePrice,
  Vcl.Imaging.jpeg, InnerPurchaseList, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdTelnet, IdRawBase, IdRawClient,
  IdIcmpClient;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    MainBtn: TButton;
    EmployeeBtn: TButton;
    TovarsBtn: TButton;
    MagazBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    tovars: TButton;
    Button5: TButton;
    Label5: TLabel;
    Button6: TButton;
    TabSheet5: TTabSheet;
    Button7: TButton;
    Label6: TLabel;
    Image2: TImage;
    Label7: TLabel;
    Image3: TImage;
    Image4: TImage;
    Label8: TLabel;
    Image5: TImage;
    Label9: TLabel;
    Image6: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Image7: TImage;
    Timer1: TTimer;
    IdIcmpClient1: TIdIcmpClient;
    procedure MainBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EmployeeBtnClick(Sender: TObject);
    procedure TovarsBtnClick(Sender: TObject);
    procedure MagazBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure tovarsClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.MagazBtnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 3;
end;

procedure TForm2.MainBtnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 0;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  IdIcmpClient1.ping;
  label3.caption := 'Время до хоста: '+ inttostr(IdIcmpClient1.ReplyStatus.MsRoundTripTime) + 'ms';

end;

procedure TForm2.TovarsBtnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 2;
end;

procedure TForm2.tovarsClick(Sender: TObject);
begin
  Form6 := TForm6.Create(Application.MainForm);
  Form6.Show;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form1 := TForm1.Create(Self);
  Form1.Show;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Form5 := TForm5.Create(Application.MainForm);
  Form5.Show;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Form3 := Tform3.Create(Application.MainForm);
  Form3.AddPerson;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  Form8 := TForm8.Create(Application.MainForm);
  Form8.Show;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  InnerPurchaseListForm := TInnerPurchaseListForm.Create(Self);
  InnerPurchaseListForm.Show;
end;

procedure TForm2.EmployeeBtnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 1;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
  PageControl1.ActivePageIndex := 0;
  Application.Icon.LoadFromFile('C:\Users\bdvys\Desktop\CourseProject\shop48.ico');
end;

end.
