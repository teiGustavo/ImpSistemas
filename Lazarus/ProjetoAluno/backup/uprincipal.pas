unit UPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, UCadastroAluno;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    MainMenuPrincipal: TMainMenu;
    MenuItemCadastros: TMenuItem;
    MenuItemAluno: TMenuItem;
    procedure MenuItemAlunoClick(Sender: TObject);
    procedure MenuItemCadastrosClick(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.MenuItemCadastrosClick(Sender: TObject);
begin

end;

procedure TFormPrincipal.MenuItemAlunoClick(Sender: TObject);
begin
     FormCadastroAluno.Show;
end;

end.

