unit UPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  UCliente, UFornecedor, UProdutos;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MenuPrincipal: TMainMenu;
    MenuItemCliente: TMenuItem;
    MenuItemFornecedor: TMenuItem;
    MenuItemProduto: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure MenuItemClienteClick(Sender: TObject);
    procedure MenuItemFornecedorClick(Sender: TObject);
    procedure MenuItemProdutoClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItemClienteClick(Sender: TObject);
begin
  FormCadCliente.show;
end;

procedure TForm1.MenuItemFornecedorClick(Sender: TObject);
begin
     FormCadFornecedor.show;
end;

procedure TForm1.MenuItemProdutoClick(Sender: TObject);
begin
  FormCadProdutos.show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

