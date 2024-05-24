unit mainform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, AdapterIntf, IProgressBar, IEdit, ILabel;

type
  TFormAdapter = class(TForm)
    Button1: TButton;
    ILabel1: TLabel;
    IEdit1: TEdit;
    IProgressBar1: TProgressBar;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAdapter: TFormAdapter;

implementation

{$R *.DFM}

procedure TFormAdapter.Button1Click(Sender: TObject);
var
  Intf: ITextAndValue;
  I: integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Supports(Components [I], ITextAndValue, Intf) then
      Intf.Value := 50;
end;

procedure TFormAdapter.Button2Click(Sender: TObject);
begin
  ShowMessage(Label1.ClassName);
  ShowMessage(Label1.ClassParent.ClassName);
end;

procedure TFormAdapter.Button3Click(Sender: TObject);
var
  Intf: ITextAndValue;
begin
  Intf := IEdit1;
  Intf.Value := 20;
end;

end.
