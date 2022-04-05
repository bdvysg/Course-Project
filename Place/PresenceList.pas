unit PresenceList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, TovarEdit;

type
  TPresenceListForm = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }

  procedure ViewPresenceList(storage_id: integer);
  end;

var
  PresenceListForm: TPresenceListForm;

implementation

{$R *.dfm}
procedure TPresenceListForm.DBGrid1CellClick(Column: TColumn);
begin
  Form7 := TForm7.Create(Self);
  Form7.ViewTovarEdit(DBGrid1.Fields[0].Value);
end;

procedure TPresenceListForm.ViewPresenceList(storage_id: integer);
var Flags: TReplaceFlags;
begin
  ADOQuery1.Parameters.ParamByName('St_Id').Value := storage_id;
  ADOQuery1.Open;
  TNumericField(ADOQuery1.FieldByName('Tov_Price')).DisplayFormat := '0 грн.';
  Flags := [rfReplaceAll];
  PresenceListForm.Caption := 'Наявність на ' + StringReplace(VarToStr(ADOQuery1.FieldByName('St_Name').Value), 'Склад', 'складі', Flags);
  PresenceListForm.Show;

end;

end.
