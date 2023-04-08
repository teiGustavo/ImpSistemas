/*POVOAMENTO DE DADOS LETRA A*/
INSERT INTO departamento(depnome) VALUES
("Financeiro"),
("Assistência"),
("RH"),
("Gestão"),
("Relações Exteriores"),
("SAC");

/*LETRA A*/
SELECT depcodigo AS 'Código do Funcionario', depnome AS 'Nome do Departamento' FROM departamento ORDER BY depnome ASC;

/*POVOAMENTO DE DADOS LETRA B*/
INSERT INTO funcionario(funnome, funNascimento, funsalario) VALUES
("José da Silva", "1967-09-28", 2780.00),
("José Alberto", "1987-01-28", 1780.45),
("Rosane Almeida Cruz", "1980-01-01", 1320.50),
("Almerinda Tavarez", "2000-01-03", 1320.00),
("Luiz Fabiano Márcia", "2003-07-15", 1310.00),
("Gabriel Barbosa Lima", "1967-04-28", 15880.95);

/*LETRA B*/
SELECT funcodigo AS 'Código do Funcionário', funnome AS 'Nome do Funcionário' FROM funcionario WHERE funsalario BETWEEN 1500.00 AND 3000.00;

/*POVOAMENTO DE DADOS LETRA C*/
INSERT INTO dependente(depennome, funcodigo) VALUES
("Pedro da Silva", 1),
("Castro de Alcantra", 2),
("Maria da Silva", 3),
("Maria Antonieta", 3),
("Alekinho Rezende", 3);

/*LETRA C*/
SELECT depencodigo AS 'Código do Dependente' FROM dependente WHERE depennome LIKE 'C%';

/*LETRA D*/
SELECT CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(ROUND((SUM(funsalario) / COUNT(funcodigo)), 2), 2),'.',';'),',','.'),';',',')) AS 'Média Salarial' FROM funcionario;

/*LETRA E*/
SELECT funnome AS 'Nome do Funcionário' FROM funcionario ORDER BY funsalario LIMIT 1;

/*LETRA F*/
SELECT funcodigo AS 'Código do Funcionário' , COUNT(depencodigo) AS 'Quantidade de Dependentes' FROM dependente GROUP BY funcodigo;