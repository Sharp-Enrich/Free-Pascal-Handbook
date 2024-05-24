unit DatesForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Memo.Types;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show(const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
 DateUtils;

type
  TDate = class
  private
    FDate: TDateTime;
  public
    procedure SetValue(M, D, Y: Integer);
    function LeapYear: Boolean;
    function GetText: string;
    procedure Increase;
  end;

procedure TDate.SetValue(M, D, Y: Integer);
begin
  FDate := EncodeDate(Y, M, D);
end;

function TDate.GetText: string;
begin
  Result := DateToStr(FDate);
end;

procedure TDate.Increase;
begin
  FDate := FDate + 1;
end;

function TDate.LeapYear: Boolean;
begin
  // Call IsLeapYear in SysUtils and YearOf in DateUtils
  Result := IsLeapYear(YearOf(FDate));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ADay: TDate;
begin
  // Create
  ADay := TDate.Create;

  // Use
  ADay.SetValue(1, 1, 2021);
  ADay.Increase;

  if ADay.LeapYear then
    Show('Leap year: ' + ADay.GetText);

  // Free the memory (for non ARC platforms)
  ADay.Free;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
