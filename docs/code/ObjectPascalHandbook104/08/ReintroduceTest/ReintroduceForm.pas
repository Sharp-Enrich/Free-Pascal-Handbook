unit ReintroduceForm;

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
    procedure Show(const Msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


procedure Show(const Msg: string);
begin
  Form1.Show(Msg);
end;

type
  TMyClass = class
    procedure One; overload; virtual;
    procedure One(I: Integer); overload;
  end;

  TMySubClass = class(TMyClass)
    procedure One; overload; override;
    procedure One(S: string); reintroduce; overload;
  end;

{ MyClass }

procedure TMyClass.One;
begin
  Show('MyClass.One');
end;

procedure TMyClass.One(I: Integer);
begin
  Show('Integer: ' + I.ToString);
end;

{ MySubClass }

procedure TMySubClass.One;
begin
  Show('MySubClass.One');
end;

procedure TMySubClass.One(S: string);
begin
  Show('String: ' + S);
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  Obj: TMySubClass;
begin
  Obj := TMySubClass.Create;
  Obj.One;
  Obj.One(10);
  Obj.One('Hello');
  Obj.Free;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
