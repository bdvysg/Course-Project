unit PersonList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids, PersonEdit;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    some1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  Form3 := TForm3.Create(Self);
  Form3.ViewPersonEdit(DBGrid1.Fields[0].Value);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADOQuery1.Open;
end;

end.
