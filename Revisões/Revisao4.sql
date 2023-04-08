/*REVISÂO GABI E GUGU*/

/*LETRA A*/
INSERT INTO departamento() VALUES(10, "Financeiro");

/*LETRA B*/
INSERT INTO funcionario() VALUES(1386, "José da Silva", "1967-09-28", 2780.00);

/*LETRA C*/
INSERT INTO depto_funcionario() VALUES(10, 1386);

/*LETRA D*/
INSERT INTO dependente() VALUES
(174, "Pedro da Silva", 1386),
(175, "Maria da Silva", 1386);

/*LETRA E*/
UPDATE funcionario SET funsalario = 3100.00 WHERE funcodigo = 1386;

/*LETRA F*/
UPDATE funcionario SET funsalario = funsalario + (funsalario * 0.1) WHERE YEAR(funNascimento) < 1990;

/*LETRA G*/
DELETE FROM dependente WHERE depencodigo = 174;