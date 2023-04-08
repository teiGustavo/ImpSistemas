unit UPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, UCadastroGrupo,
  UCadastroContato;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MenuItemCadastros: TMenuItem;
    MenuItemGrupo: TMenuItem;
    MenuItemContato: TMenuItem;
    MenuItemPrincipal: TMenuItem;
    MenuItemSair: TMenuItem;
    procedure MenuItemContatoClick(Sender: TObject);
    procedure MenuItemGrupoClick(Sender: TObject);
    procedure MenuItemSairClick(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.MenuItemSairClick(Sender: TObject);
begin

end;

procedure TFormPrincipal.MenuItemGrupoClick(Sender: TObject);
begin
  FormCadastroGrupo.Show()
end;

procedure TFormPrincipal.MenuItemContatoClick(Sender: TObject);
begin
  FormCadastroContato.Show()
end;

end.

