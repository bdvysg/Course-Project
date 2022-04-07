program CourseProject;

uses
  Vcl.Forms,
  main in 'main.pas' {Form2},
  PersonList in 'Person\PersonList.pas' {Form1},
  PersonEdit in 'Person\PersonEdit.pas' {Form3},
  EditWage in 'Person\EditWage.pas' {Form4},
  ChangePlace in 'Person\ChangePlace.pas' {Form5},
  TovarList in 'Tovar\TovarList.pas' {Form6},
  TovarEdit in 'Tovar\TovarEdit.pas' {Form7},
  ChangePrice in 'Tovar\ChangePrice.pas' {Form8},
  InnerPurchaseList in 'Tovar\InnerPurchaseList.pas' {InnerPurchaseListForm},
  InnerPurchaseEdit in 'Tovar\InnerPurchaseEdit.pas' {InnerPurchaseEditForm},
  PresenceList in 'Place\PresenceList.pas' {PresenceListForm},
  A7Rep in 'Excel\A7Rep.pas',
  Saleslist in 'Place\Saleslist.pas' {SalesListForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Shop';
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TPresenceListForm, PresenceListForm);
  Application.CreateForm(TSalesListForm, SalesListForm);
  Application.Run;
end.
