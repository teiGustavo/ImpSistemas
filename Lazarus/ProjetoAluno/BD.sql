DROP SCHEMA IF EXISTS escola;

CREATE DATABASE IF NOT EXISTS escola;

USE escola;

CREATE TABLE IF NOT EXISTS aluno(
	cod_aluno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(500) NOT NULL DEFAULT ''
);