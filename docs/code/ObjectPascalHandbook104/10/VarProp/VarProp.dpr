program VarProp;

uses
  System.StartUpCopy,
  FMX.Forms,
  VarPropForm in 'VarPropForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
