unit UDataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    TabelaAlunocod_aluno: TLongintField;
    TabelaAlunonome: TStringField;
    ZConnection: TZConnection;
    TabelaAluno: TZTable;
    procedure DataModuleCreate(Sender: TObject);

  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  //Verificando se há conexão ativa, se nao, abre conexão com o banco
  if ZConnection.Connected <> True then
  begin
    //Abre conexão com o banco de dados
    ZConnection.Connect;
  end;
end;

end.

