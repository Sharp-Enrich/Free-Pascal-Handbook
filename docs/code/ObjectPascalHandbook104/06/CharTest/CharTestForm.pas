unit CharTestForm;

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
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show(const Msg: string);
    procedure ShowBool(Value: Boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{$HIGHCHARUNICODE ON}

uses
  Character;


procedure TForm1.Button1Click(Sender: TObject);
var
  Ch1: Char;
begin
  Ch1 := '�';
  Show('UpCase �: ' + UpCase(Ch1));
  Show('ToUpper �: ' + Ch1.ToUpper);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Str1: string;
begin
  Str1 := '1.' + #9 + Char.ConvertFromUtf32(128) +
    Char.ConvertFromUtf32($1D11E);
  ShowBool(Str1.Chars[0].IsNumber);
  ShowBool(Str1.Chars[1].IsPunctuation);
  ShowBool(Str1.Chars[2].IsWhiteSpace);
  ShowBool(Str1.Chars[3].IsControl);
  ShowBool(Str1.Chars[4].IsSurrogate);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Str1: string;
begin
  Str1 := #$80;
  Show(Str1 + ' - ' + IntToStr(Ord(Str1.Chars[0])));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Str1: string;
begin
  Str1 := #$3042#$3044;
  Show(Str1 + ' - ' + IntToStr(Ord(Str1.Chars[0])) +
    ' - ' + IntToStr(Ord(Str1.Chars[1])));
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

procedure TForm1.ShowBool(Value: Boolean);
begin
  Show(BoolToStr(Value, True));
end;

end.
