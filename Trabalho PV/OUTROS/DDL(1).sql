DROP SCHEMA IF EXISTS TEATRO;

CREATE SCHEMA IF NOT EXISTS TEATRO;

USE TEATRO;

CREATE TABLE IF NOT EXISTS ATOR(
	CODATOR INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(300)
);
CREATE TABLE IF NOT EXISTS PECA(
	CODPECA INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(300)
);
CREATE TABLE IF NOT EXISTS ATORPECA(
	CODPECA INT NOT NULL,
    CODATOR INT NOT NULL,    
	CONSTRAINT FK_ATOR_ATORPECA FOREIGN KEY(CODATOR)
		REFERENCES ATOR(CODATOR),
	CONSTRAINT FK_PECA_ATORPECA FOREIGN KEY(CODPECA)
		REFERENCES PECA(CODPECA),
	PRIMARY KEY(CODPECA, CODATOR)
);

CREATE TABLE IF NOT EXISTS TEATRO(
	CODTEATRO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(300) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS APRESENTACAO(
	CODAPRESENTACAO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,    
    CODTEATRO INT NOT NULL,
    CODPECA INT NOT NULL,
    QUANTIDADEPUBLICO INT NOT NULL DEFAULT 0,
    DATA DATE NOT NULL DEFAULT '0000-00-00',
    CONSTRAINT FK_TEATRO_AP FOREIGN KEY(CODTEATRO)
						REFERENCES TEATRO(CODTEATRO),
    CONSTRAINT FK_PECA_AP FOREIGN KEY(CODPECA) 									
					    REFERENCES PECA(CODPECA)
);

CREATE TABLE IF NOT EXISTS INGRESSO(
	CODINGRESSO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,    
    CODAPRESENTACAO INT NOT NULL,    
    TIPOCADEIRA VARCHAR(1) NOT NULL DEFAULT 'S',
    DATA DATE NOT NULL DEFAULT '0000-00-00',
    PRECO DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    CONSTRAINT FK_AP_INGRESSO FOREIGN KEY(CODAPRESENTACAO)
						REFERENCES APRESENTACAO(CODAPRESENTACAO)
);








