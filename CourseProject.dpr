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
  InnerPurchaseEdit in 'InnerPurchaseEdit.pas' {InnerPurchaseEditFrom};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TInnerPurchaseListForm, InnerPurchaseListForm);
  Application.CreateForm(TInnerPurchaseEditFrom, InnerPurchaseEditFrom);
  Application.Run;
end.
