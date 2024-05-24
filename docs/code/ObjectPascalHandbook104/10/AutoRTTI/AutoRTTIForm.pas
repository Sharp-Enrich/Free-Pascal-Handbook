unit AutoRTTIForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Memo.Types, FMX.Controls.Presentation,
  FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    BtnTest: TButton;
    procedure BtnTestClick(Sender: TObject);
  private
  public
    procedure Show(const msg: string);
  end;

var
  Form1: TForm1;

{$M+}
type
  TMyTestClass = class
  private
    FValue: Integer;
    procedure SetValue(const Value: Integer);
  published
    property Value: Integer read FValue write SetValue;
  end;

implementation

{$R *.fmx}

uses
  TypInfo;

procedure TForm1.BtnTestClick(Sender: TObject);
var
  Test1: TMyTestClass;
begin
  Test1 := TMyTestClass.Create;
  try
    Test1.Value := 22;
    Memo1.Lines.Add(GetPropValue(Test1, 'Value'));
  finally
    Test1.Free;
  end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

{ TMyTestClass }

procedure TMyTestClass.SetValue(const Value: Integer);
begin
  FValue := Value;
end;

end.
