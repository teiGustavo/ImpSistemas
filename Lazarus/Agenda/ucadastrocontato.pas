unit UCadastroContato;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, DBGrids,
  StdCtrls, UDataModule;

type

  { TFormCadastroContato }

  TFormCadastroContato = class(TForm)
    DsGrupo: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    EditNome: TDBEdit;
    EditTelefone: TDBEdit;
    EditCelular: TDBEdit;
    DsContato: TDataSource;
    DBGrid: TDBGrid;
    DBNavigator: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FormCadastroContato: TFormCadastroContato;

implementation

{$R *.lfm}

{ TFormCadastroContato }

procedure TFormCadastroContato.FormShow(Sender: TObject);
begin
  //Se a tabela não estive ativa
  if not DM.TableContato.Active then
     DM.TableContato.Open;

  if not DM.TableGrupo.Active then
     DM.TableGrupo.Open


end;

end.

