//****************************************************************//
//****** Author - Kucher Alexander <a7exander@gmail.com> *********//
//************************* (�) 2017 *****************************//
//****************************************************************//
unit A7Rep;

interface

uses
  SysUtils, Classes, Variants, ComObj, StdCtrls, Forms;

const
  // --------------- Excel constants ----------------------------
  xlFormulas = $FFFFEFE5;
  xlComments = $FFFFEFD0;
  xlValues = $FFFFEFBD;

type
  // progress-form
  TA7Progress = class
  private
    F: TForm;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
  protected
  public
    procedure Line(p: integer);
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  end;

  TA7Rep = class(TComponent)
  private
    Progress: TA7Progress;

  protected
  public
    CurrentLine: integer;
    Excel, TemplateSheet: Variant;
    MaxBandColumns : integer ; // Max band width in excel-columns
    isVisible : boolean;
    FirstBandLine, LastBandLine : Integer;
    procedure OpenTemplate(FileName: string); overload;
    procedure OpenTemplate(FileName: string; Visible : boolean); overload;
    procedure OpenWorkSheet(Name: string);
    procedure PasteBand(BandName: string);
    procedure SetValue(VarName: string; Value: Variant); overload;
    procedure SetValue(X,Y: Integer; Value: Variant); overload;
    procedure SetValueF(VarName: string; Value: Variant);
    procedure SetSumFormula(VarName: string; FirstLine, LastLine: Integer); overload;
    procedure SetSumFormula(VarName: string; BandName: string); overload;
    procedure SetValueAsText(varName: string; Value: string); overload;
    procedure SetValueAsText(X,Y: Integer; Value: string); overload;    
    procedure SetComment(VarName: string; Value: Variant);
    function GetComment(VarName: string): string;
    function GetAndClearComment(VarName: string): string; overload;
    function GetAndClearComment(X,Y: Integer): string; overload;
    function GetCellName(aCol, aRow : Integer): string;
    procedure ExcelFind(const Value: string; var aCol, aRow : Integer; Where:Integer);
    procedure Show;
    destructor Destroy; override;
  published
  end;

procedure Register;

implementation

const
  MaxBandLines = 300; // max template lines count

procedure Register;
begin
  RegisterComponents('A7rexcel', [TA7Rep]);
end;

{ TWcReport }

destructor TA7Rep.Destroy;
begin

  inherited;
end;

function TA7Rep.GetCellName(aCol, aRow : Integer): string;
var
  c1, c2 : Integer;
begin
  if aCol<27 then begin
    Result := chr(64 + aCol)+IntToStr(aRow);
  end else begin
    c1 := (aCol-1) div 26;
    c2 := aCol - c1*26;
    Result := chr(64 + c1)+chr(64 + c2)+IntToStr(aRow);
  end;
end;

procedure TA7Rep.ExcelFind(const Value: string; var aCol, aRow : Integer; Where:Integer);
// Where: the search type (xlFormulas, xlComments, xlValues)
var
  R: Variant;
begin
   R := TemplateSheet.Rows[IntToStr(FirstBandLine) + ':' + IntToStr(LastBandLine)];
   R:=R.Find(What:=Value,LookIn:=Where);
   if VarIsClear(R) then begin
     aCol := -1;
     aRow := -1;
   end else begin
     aCol:=R.Column;
     aRow:=R.Row;
   end;
end;

function TA7Rep.GetAndClearComment(VarName: string): string;
var
  v : Variant;
  x , y : Integer;
begin
  Result := '';
  ExcelFind(VarName, x, y, xlValues);
  if x<0 then Exit;
  v := Variant(TemplateSheet.Cells[y, x].Value);
  if ((varType(v) = varOleStr)) then
     if Pos(VarName,v)>0 then begin
        Result := TemplateSheet.Cells[y, x].Comment.Text;
        TemplateSheet.Cells[y, x].ClearComments;
     end;
end;

function TA7Rep.GetAndClearComment(X, Y: Integer): string;
var
  v : Variant;
begin
  Result := '';
  if x<0 then Exit;
  v := Variant(TemplateSheet.Cells[y, x].Value);
  if ((varType(v) = varOleStr)) then begin
    Result := TemplateSheet.Cells[y, x].Comment.Text;
    TemplateSheet.Cells[y, x].ClearComments;
  end;
end;

function TA7Rep.GetComment(VarName: string): string;
var
  v : Variant;
  x , y : Integer;
begin
  Result := '';
  ExcelFind(VarName, x, y, xlValues);
  if x<0 then Exit;
  v := Variant(TemplateSheet.Cells[y, x].Value);
  if ((varType(v) = varOleStr)) then
     if Pos(VarName,v)>0 then begin
        Result := TemplateSheet.Cells[y, x].Comment.Text;
     end;
end;

procedure TA7Rep.OpenTemplate(FileName: string);
begin // �� ��������� �� ���������� Excel
  OpenTemplate(FileName, false);
end;

procedure TA7Rep.OpenTemplate(FileName: string; Visible: boolean);
begin
  Excel := CreateOleObject('Excel.Application');
  //Excel.Workbooks.Open(FileName, True, True);
  Excel.Workbooks.Open(FileName);
  Excel.DisplayAlerts := False; // for prevent error in SetValue procedure, where VarName not fount for replace

  Excel.Visible := Visible;
  isVisible := Visible;
  if isVisible=False then
    Progress := TA7Progress.Create(Self); // show progress-window
  Application.ProcessMessages;
  TemplateSheet := Excel.Workbooks[1].Sheets[1];
  CurrentLine := 1;
  MaxBandColumns := TemplateSheet.UsedRange.Columns.Count;

  //if Assigned(Progress) then Progress.L3.Caption := 'Sheet: 1';
end;

procedure TA7Rep.PasteBand(BandName: string);
var
  i: integer;
  v, Range: Variant;
begin

  // find band in template
  FirstBandLine := 0; LastBandLine := 0;
  i := CurrentLine;
  while ((LastBandLine = 0) and (i < CurrentLine + MaxBandLines)) do begin
    v := Variant(TemplateSheet.Cells[i, 1].Value);
    if (varType(v) = varOleStr) and (FirstBandLine = 0) then begin
      if v = BandName then begin // the start of band
        FirstBandLine := i;
      end;
    end;
    if (FirstBandLine <> 0) then begin
      if not ((varType(v) = varOleStr) and (v = BandName)) then LastBandLine := i - 1;
    end;
    inc(i);
  end;

  if LastBandLine>0 then begin // if BandName found
    Range := TemplateSheet.Rows[IntToStr(FirstBandLine) + ':' + IntToStr(LastBandLine)];
    Range.Copy;
    Range := TemplateSheet.Rows[IntToStr(CurrentLine) + ':' + IntToStr(CurrentLine)];
    Range.Insert;

{    // delete band name from result lines
    for i := CurrentLine to CurrentLine + (LastBandLine - FirstBandLine) do begin
      TemplateSheet.Cells[i, 1].Value := '';
    end;}
    CurrentLine := CurrentLine + (LastBandLine - FirstBandLine) + 1;
    // new band position in report
    FirstBandLine := CurrentLine - (LastBandLine - FirstBandLine) - 1;
    LastBandLine := CurrentLine - 1;
    if isVisible=false then
      Progress.Line(CurrentLine);
  end;
end;

procedure TA7Rep.SetComment(VarName: string; Value: Variant);
// VarName - tag in cell, for setting comment
var
  x, y : Integer;
begin
  ExcelFind(VarName, x, y, xlValues);
  if x>0 then begin
    TemplateSheet.Cells[y, x].AddComment(Value);
  end;
end;

procedure TA7Rep.SetValue(VarName: string; Value: Variant);
var Range: Variant;
begin
  Range := TemplateSheet.Rows[IntToStr(FirstBandLine) + ':' + IntToStr(LastBandLine)];
  if Value=null then
    Range.Replace(VarName, '')
  else
    Range.Replace(VarName, VarToStr(Value));
end;

procedure TA7Rep.SetValue(X, Y: Integer; Value: Variant);
begin
  if Value=null then
    TemplateSheet.Cells[y, x].Value := ''
  else
    TemplateSheet.Cells[y, x].Value := Value;
end;

// Edited by cyrax1000, 2017-08-11
// Set value to cell with formatted string
procedure TA7Rep.SetValueF(VarName: string; Value: Variant);
var
  x, y, p: Integer;
begin
  x:= 0;
  while x >= 0 do
  begin
    ExcelFind(VarName, x, y, xlValues);
    if x > 0 then
    begin
      TemplateSheet.Cells[y, x].Select;
      p:= Pos(VarName, TemplateSheet.Cells[y, x]);
      if p > 0 then
        if Value = Null then
          Excel.ActiveCell.Characters[Start:= p, Length:= Length('')].Insert(Value)
        else
          Excel.ActiveCell.Characters[Start:= p, Length:= Length(VarName)].Insert(Value);
    end;
  end;
end;

procedure TA7Rep.SetValueAsText(varName, Value: string);
var y, x: integer;
  v: Variant;
begin
  for y := FirstBandLine to LastBandLine do begin
    for x := 2 to MaxBandColumns do begin
      v := Variant(TemplateSheet.Cells[y, x].Value);
      if ((varType(v) = varOleStr)) then
        if v = VarName then begin
          TemplateSheet.Cells[y, x].NumberFormat:= '@';
          TemplateSheet.Cells[y, x].Value := Value;
        end;
    end;
  end;
end;

procedure TA7Rep.SetValueAsText(X, Y: Integer; Value: string);
begin
  TemplateSheet.Cells[y, x].NumberFormat:= '@';
  TemplateSheet.Cells[y, x].Value := Value;
end;

procedure TA7Rep.Show;
var
  Range: Variant;
begin
  // delete the template from result report
  Range := TemplateSheet.Rows[IntToStr(CurrentLine) + ':' + IntToStr(CurrentLine + MaxBandLines)];
  Range.Delete;
  TemplateSheet.Columns[1].Delete;

  Excel.Visible := true;
  if isVisible=false then
    Progress.Free;

  Range := Unassigned;
  TemplateSheet := Unassigned;
  Excel := Unassigned;
end;

{ TA7ProgressForm }

constructor TA7Progress.Create(AOwner: TComponent);
begin
  F := TForm.Create(nil);
  F.Width := 150;
  F.Height := 90;
  F.Position := poScreenCenter;
  F.BorderStyle := bsNone;
  F.FormStyle := fsStayOnTop;
  F.Color := $FFFFFF;
  L1 := TLabel.Create(F);
  L1.Parent := F;
  L1.Left := 15;
  L1.Width := 100;
  L1.Alignment := taCenter;
  L1.Top := 20;
  L1.Caption := 'Building report';

  // Line
  L2 := TLabel.Create(F);
  L2.Parent := F;
  L2.Left := 30;
  L2.Width := 100;
  L2.Alignment := taCenter;
  L2.Top := 40;

  // Sheet
  L3 := TLabel.Create(F);
  L3.Parent := F;
  L3.Left := 30;
  L3.Width := 100;
  L3.Alignment := taCenter;
  L3.Top := 60;

  F.Show;
end;

destructor TA7Progress.Destroy;
begin
  L1.Free;
  L2.Free;
  F.Free;
end;

procedure TA7Progress.Line(p: integer);
begin
  L2.Caption := 'Line: ' + IntToStr(p);
  Application.ProcessMessages;
end;

// for using multi-sheet reports
// if Name='' then open first worksheet
procedure TA7Rep.OpenWorkSheet(Name: string);
var
  Range: Variant;
begin
  // delete band templates
  Range := TemplateSheet.Rows[IntToStr(CurrentLine) + ':' + IntToStr(CurrentLine + MaxBandLines)];
  Range.Delete;

  if Name='' then
    TemplateSheet := Excel.Workbooks[1].Sheets[1]
  else
    TemplateSheet := Excel.Workbooks[1].Sheets[Name];
  CurrentLine := 1;
  MaxBandColumns := TemplateSheet.UsedRange.Columns.Count;

  if Assigned(Progress) then Progress.L3.Caption := 'Sheet: '+Name;
end;

procedure TA7Rep.SetSumFormula(VarName: string; FirstLine, LastLine: Integer);
var
  x, y : Integer;
begin
  ExcelFind(VarName, x, y, xlValues);
  if x>0 then begin
    if LastLine<>CurrentLine then
      TemplateSheet.Cells[y, x].Value := '=SUM('+GetCellName(x,FirstLine)+':'+GetCellName(x,LastLine)+')'
    else
      TemplateSheet.Cells[y, x].Value := '';
  end;
end;

procedure TA7Rep.SetSumFormula(VarName, BandName: string);
var
  x, y, i : Integer;
  c, s : string;
begin
  ExcelFind(VarName, x, y, xlValues);
  s := '';
  if x>0 then begin
    for i := 1 to CurrentLine-1 do begin
      c := TemplateSheet.Cells[i, 1].Value;
      if c=BandName then begin
        if s<>'' then s := s + '+';
        s := s + GetCellName(x,i);
      end;
    end;
    if s<>'' then begin
      TemplateSheet.Cells[y, x].Value := '='+s+'';
    end else begin
      TemplateSheet.Cells[y, x].Value := '';
    end;
  end;
end;

end.

