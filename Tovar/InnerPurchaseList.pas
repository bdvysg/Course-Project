unit InnerPurchaseList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, InnerPurchaseEdit, Data.Win.ADODB;

type
  TInnerPurchaseListForm = class(TForm)
    MainMenu1: TMainMenu;
    makenew: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    N1: TMenuItem;
    procedure makenewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InnerPurchaseListForm: TInnerPurchaseListForm;

implementation

{$R *.dfm}

procedure TInnerPurchaseListForm.DBGrid1CellClick(Column: TColumn);
begin
  InnerPurchaseEditForm := TInnerPurchaseEditForm.Create(Self);
  InnerPurchaseEditForm.InnerPurchaseEditFormView(DBGrid1.Fields[0].Value);
end;

procedure TInnerPurchaseListForm.FormCreate(Sender: TObject);
begin
  ADOQuery1.Open;
end;

procedure TInnerPurchaseListForm.makenewClick(Sender: TObject);
begin
  InnerPurchaseEditForm := TInnerPurchaseEditForm.Create(Self);
  InnerPurchaseEditForm.InnerPurchaseEditFormView(0);
end;

procedure TInnerPurchaseListForm.N1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

end.
