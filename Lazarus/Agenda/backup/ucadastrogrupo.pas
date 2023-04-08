unit UCadastroGrupo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, DBGrids,
  StdCtrls, UDataModule;

type

  { TFormCadastroGrupo }

  TFormCadastroGrupo = class(TForm)
    EditNome: TDBEdit;
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    DSGrupo: TDataSource;
    LabelNome: TLabel;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FormCadastroGrupo: TFormCadastroGrupo;

implementation

{$R *.lfm}

{ TFormCadastroGrupo }

procedure TFormCadastroGrupo.FormShow(Sender: TObject);
begin
  //Se a tabela não estive ativa
  if not DM.TableGrupo.Active then
     DM.TableGrupo.Open
end;

end.

