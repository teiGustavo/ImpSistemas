unit UCadastroAluno;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBCtrls, DBGrids,
  StdCtrls, UDataModule;

type

  { TFormCadastroAluno }

  TFormCadastroAluno = class(TForm)
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
  private

  public

  end;

var
  FormCadastroAluno: TFormCadastroAluno;

implementation

{$R *.lfm}

{ TFormCadastroAluno }

procedure TFormCadastroAluno.Label1Click(Sender: TObject);
begin

end;

procedure TFormCadastroAluno.FormShow(Sender: TObject);
begin
  //Verifica se a tabela não está aberta
  if DM.TabelaAluno.Active <> True then
  begin
    //Abre a tabela
    DM.TabelaAluno.Active := True;
  end;
end;

procedure TFormCadastroAluno.Label2Click(Sender: TObject);
begin

end;

procedure TFormCadastroAluno.ZConnection1AfterConnect(Sender: TObject);
begin

end;

end.

