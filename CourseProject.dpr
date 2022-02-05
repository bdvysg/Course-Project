program CourseProject;

uses
  Vcl.Forms,
  main in 'main.pas' {Form2},
  PersonList in 'Person\PersonList.pas' {Form1},
  PersonEdit in 'Person\PersonEdit.pas' {Form3},
  EditWage in 'Person\EditWage.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
