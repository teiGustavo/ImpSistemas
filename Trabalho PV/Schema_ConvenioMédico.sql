DROP SCHEMA IF EXISTS convenio;
CREATE SCHEMA IF NOT EXISTS convenio;
SET GLOBAL lc_time_names=pt_BR;
USE convenio;

CREATE TABLE IF NOT EXISTS CIDADE(
	CODCIDADE INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NOMECIDADE VARCHAR(58) DEFAULT 'NOME DA CIDADE',
    ESTADOCIDADE VARCHAR(30) DEFAULT 'NOME DO ESTADO',
    PAISCIDADE VARCHAR(25) DEFAULT 'NOME DO PAÍS'
);

CREATE TABLE IF NOT EXISTS MEDICO(
	CODMEDICO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOMEMEDICO VARCHAR(584) DEFAULT 'NOME DO MÉDICO',
    ENDERECOMEDICO VARCHAR(300) DEFAULT 'RUA TESTE, N° 0, BAIRRO TESTE',
    TELEFONEMEDICO VARCHAR(30) DEFAULT '(00) 9 0000-0000',
    CPF_MEDICO VARCHAR(14) DEFAULT '000.000.000-00',
    CRM_MEDICO VARCHAR(15) DEFAULT '000000000-0/BR',
    
    CODCIDADE INT NOT NULL,
    CONSTRAINT FK_CIDADE_MEDICO
		FOREIGN KEY(CODCIDADE)
		REFERENCES CIDADE(CODCIDADE)
);

CREATE TABLE IF NOT EXISTS PACIENTE(
	CODPACIENTE INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOMEPACIENTE VARCHAR(584) DEFAULT 'NOME DO PACIENTE',
    ENDERECOPACIENTE VARCHAR(300) DEFAULT 'RUA TESTE, N° 0, BAIRRO TESTE',
    TELEFONEPACIENTE VARCHAR(30) DEFAULT '(00) 9 0000-0000',
    CPF_PACIENTE VARCHAR(14) DEFAULT '000.000.000-00',
    
    CODCIDADE INT NOT NULL,
    CONSTRAINT FK_CIDADE_PACIENTE
		FOREIGN KEY(CODCIDADE)
		REFERENCES CIDADE(CODCIDADE)
);

CREATE TABLE IF NOT EXISTS CONVENIO(
	CODCONVENIO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOMECONVENIO VARCHAR(300) DEFAULT 'NOME DO CONVÊNIO',
    SIGLACONVENIO VARCHAR(80) DEFAULT 'SIGLA'
);

CREATE TABLE IF NOT EXISTS REL_MEDICO_CONVENIO(
	CODMEDICOCONVENIO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    CODMEDICO INT NOT NULL,
    CONSTRAINT FK_MEDICO_MEDICOCONVENIO
    FOREIGN KEY(CODMEDICO)
    REFERENCES MEDICO(CODMEDICO),
    
    CODCONVENIO INT NOT NULL,
    CONSTRAINT FK_CONVENIO_MEDICOCONVENIO
    FOREIGN KEY(CODCONVENIO)
    REFERENCES CONVENIO(CODCONVENIO)
);

CREATE TABLE IF NOT EXISTS CONSULTA(
	CODCONSULTA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DATACONSULTA DATE NOT NULL DEFAULT '0000-00-00',
    VALORCONSULTA REAL NOT NULL DEFAULT 0.0,
    
    CODCONVENIO INT NOT NULL,
    CONSTRAINT FK_CONVENIO_CONSULTA
    FOREIGN KEY(CODCONVENIO)
    REFERENCES CONVENIO(CODCONVENIO),
    
    CODPACIENTE INT NOT NULL,
    CONSTRAINT FK_PACIENTE_CONSULTA
    FOREIGN KEY(CODPACIENTE)
    REFERENCES PACIENTE(CODPACIENTE),
    
    CODMEDICO INT NOT NULL,
    CONSTRAINT FK_MEDICO_CONSULTA
		FOREIGN KEY(CODMEDICO)
        REFERENCES MEDICO(CODMEDICO)
);

CREATE TABLE IF NOT EXISTS INSUMO(
	CODINSUMO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NOMEINSUMO VARCHAR(300) DEFAULT 'NOME DO INSUMO',
    QUANTIDADE_ESTOQUE INT NOT NULL DEFAULT 0,
    VALORINSUMO REAL NOT NULL DEFAULT 0.0
);

CREATE TABLE IF NOT EXISTS REL_CONSULTA_INSUMO(
	CODCONSULTAINSUMO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    CODCONSULTA INT NOT NULL,
    CONSTRAINT FK_CONSULTA_CONSULTAINSUMO
    FOREIGN KEY(CODCONSULTA)
    REFERENCES CONSULTA(CODCONSULTA),
    
    CODINSUMO INT NOT NULL,
    CONSTRAINT FK_INSUMO_CONSULTAINSUMO
    FOREIGN KEY(CODINSUMO)
    REFERENCES INSUMO(CODINSUMO)
);

CREATE TABLE IF NOT EXISTS PROCEDIMENTO(
	CODPROCEDIMENTO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NOMEPROCEDIMENTO VARCHAR(300) DEFAULT 'NOME DO PROCEDIMENTO',
    VALORPROCEDIMENTO REAL NOT NULL DEFAULT 0.0
);

CREATE TABLE IF NOT EXISTS REL_CONSULTA_PROCEDIMENTO(
	CODCONSULTAPROCEDIMENTO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    
    CODCONSULTA INT NOT NULL,
    CONSTRAINT FK_CONSULTA_CONSULTAPROCEDIMENTO
    FOREIGN KEY(CODCONSULTA)
    REFERENCES CONSULTA(CODCONSULTA),
    
    CODPROCEDIMENTO INT NOT NULL,
    CONSTRAINT FK_PROCEDIMENTO_CONSULTAPROCEDIMENTO
    FOREIGN KEY(CODPROCEDIMENTO)
    REFERENCES PROCEDIMENTO(CODPROCEDIMENTO)
);