unit ExceptionForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Memo.Types, FMX.Controls.Presentation,
  FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    BtnWrong: TButton;
    BtnFinally: TButton;
    BtnTryTry: TButton;
    procedure BtnWrongClick(Sender: TObject);
    procedure BtnFinallyClick(Sender: TObject);
    procedure BtnTryTryClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show(const Msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

type
  EArrayFull = class(Exception);

procedure AddToArray(I: Integer);
begin
  if I > 10 then // Not that this makes much sense...
    raise EArrayFull.Create('Array full');
end;

procedure TForm1.BtnWrongClick(Sender: TObject);
var
  I, J: Integer;
begin
  Caption := 'Calculating';

  J := 0;
  // Long (and wrong) computation...
  for I := 1000 downto 0 do
    J := J + J div I;

  Caption := 'Finished';
  Show('Total: ' + J.ToString);
end;

procedure TForm1.BtnTryTryClick(Sender: TObject);
var
  I, J: Integer;
begin
  Caption := 'Calculating';
  J := 0;
  try try
    // Long (and wrong) computation...
    for I := 1000 downto 0 do
      J := J + J div I;
    Show('Total: ' + J.ToString);
  except
    on E: EDivByZero do
    begin
      // Re-raise the exception with a new message
      raise Exception.Create('Error in Algorithm');
    end;
  end;
  finally
    Caption := 'Finished';
  end;
end;

procedure TForm1.BtnFinallyClick(Sender: TObject);
var
  I, J: Integer;
begin
  Caption := 'Calculating';
  J := 0;
  try
    // Long (and wrong) computation...
    for I := 1000 downto 0 do
      J := J + J div I;
    Show('Total: ' + J.ToString);
  finally
    Caption := 'Finished';
  end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
