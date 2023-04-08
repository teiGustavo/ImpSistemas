DROP SCHEMA IF EXISTS revisao4;
CREATE SCHEMA IF NOT EXISTS revisao4;
USE revisao4;

CREATE TABLE departamento(
	depcodigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    depnome VARCHAR(50) NOT NULL
);


CREATE TABLE funcionario(
	funcodigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    funnome VARCHAR(100) NOT NULL,
    funNascimento DATE NOT NULL,
    funsalario NUMERIC(10, 2) NOT NULL
);

CREATE TABLE depto_funcionario(
	depcodigo INT NOT NULL,
    funcodigo INT NOT NULL,
    
    CONSTRAINT FK_DEPARTAMENTO_DPTOFUN
		FOREIGN KEY(depcodigo)
        REFERENCES departamento(depcodigo),
        
	CONSTRAINT FK_FUNCIONARIO_DPTOFUN
		FOREIGN KEY(funcodigo)
        REFERENCES funcionario(funcodigo),
        
    PRIMARY KEY(depcodigo, funcodigo)
);

CREATE TABLE dependente(
	depencodigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    depennome VARCHAR(100) NOT NULL,
    
    funcodigo INT NOT NULL,
    CONSTRAINT FK_FUNCIONARIO_DEPENDENTE
		FOREIGN KEY(funcodigo)
        REFERENCES funcionario(funcodigo)
);