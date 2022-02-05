unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, PersonList;

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
    procedure MainBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EmployeeBtnClick(Sender: TObject);
    procedure TovarsBtnClick(Sender: TObject);
    procedure MagazBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TForm2.TovarsBtnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 2;
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
  PageControl1.ActivePageIndex := 0;
end;

end.
