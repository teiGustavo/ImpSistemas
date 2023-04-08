unit UDataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    TableContatoCELULAR: TStringField;
    TableContatoCODCONTATO: TLongintField;
    TableContatoCODGRUPO: TLongintField;
    TableContatoNOME: TStringField;
    TableContatoTELEFONE: TStringField;
    TableGrupoCODGRUPO: TLongintField;
    TableGrupoNOME: TStringField;
    ZConnection: TZConnection;
    TableGrupo: TZTable;
    TableContato: TZTable;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  //Se a conexão não estiver ativa
  if not ZConnection.Connected then
     //Ativa a conexão com o banco de dados
     ZConnection.Connect;
end;

end.

