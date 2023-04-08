program ExemploMenus;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, UPrincipal, UCliente, UFornecedor, UProdutos
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormCadCliente, FormCadCliente);
  Application.CreateForm(TFormCadFornecedor, FormCadFornecedor);
  Application.CreateForm(TFormCadProdutos, FormCadProdutos);
  Application.Run;
end.

