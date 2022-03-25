unit InnerPurchaseList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus;

type
  TInnerPurchaseListForm = class(TForm)
    MainMenu1: TMainMenu;
    makenew: TMenuItem;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InnerPurchaseListForm: TInnerPurchaseListForm;

implementation

{$R *.dfm}

end.
