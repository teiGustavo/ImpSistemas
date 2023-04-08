USE convenio;

INSERT INTO cidade(nomecidade, estadocidade, paiscidade) VALUES
('Muriaé','Minas Gerais','Brasil'),
('Juiz de Fora','Minas Gerais','Brasil'),
('São Paulo','São Paulo','Brasil');

INSERT INTO medico(nomemedico, enderecomedico, telefonemedico, cpf_medico, crm_medico, codcidade) VALUES
('Everaldo Neves de Batista Lopes','Rua Quinta das Flores, N° 503, Bairro Limoeiro','(32) 9 8491-5861','123.456.789-10','123456789-9/BR', 2),
('Andreas Vesalius','Rua Nilson de Melo Pena, N° 200, Bairro Cardoso de Melo','(32) 9 9977-6905','012.255.336-63','98765432-1/BR', 1),
('João Nogueira','Rua Amilton Luiz, N° 5003, Bairro Ferroviária','(11) 9 9899-5403','789.665.213-15','23665478-7/BR', 3),
('Lucia de Oliveira','Rua Luiz de Castro, N° 30, Bairro São Cristóvão','(32) 9 9981-5513','653.435.726-77','569875231-7/BR', 1),
('Izabel Duarte','Rua Carolina Gusmã, N° 2, Bairro São Cristóvão','(32) 9 6831-2449','076.304.016-98','223145698-3/BR', 1),
('Marcio Quintão','Rua Clara de Castro, N° 660, Bairro Porto','(32) 9 9030-4860','070.336.987-88','566321478-0/BR', 3),
('Alfredo Roberto','Rua Castor de Melo, N° 540, Bairro Porto','(32) 9 9080-8080','030.226.132-48','516121379-3/BR', 3),
('Maria Antunieta','Rua Amaranto Alves, N° 42, Bairro São Cristóvão','(32) 9 9699-5020','653.225.777-20','162879234-7/BR', 3),
('Gustavo Alberto','Rua Amaranto Alves, N° 44, Bairro São Cristóvão','(32) 9 9699-5020','653.225.777-20','162879234-7/BR', 3),
('Heitor Otávio','Rua Amaranto Alves, N° 46, Bairro São Cristóvão','(32) 9 9699-5020','653.225.777-20','162879234-7/BR', 3),
('Bento Alves','Rua Amaranto Alves, N° 46, Bairro São Cristóvão','(32) 9 9699-5020','653.225.777-20','162879234-7/BR', 1);

INSERT INTO convenio(nomeconvenio, siglaconvenio) VALUES
('Confederação Nacional das Cooperativas Médicas','Unimed'),
('Bradesco Saúde', 'BS'),
('Golden Cross', 'GC');

INSERT INTO rel_medico_convenio(codmedico, codconvenio) VALUES
(1, 2),
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(6, 3),
(7, 1),
(8, 1),
(9, 2),
(10, 3),
(11, 1);

INSERT INTO paciente(nomepaciente, enderecopaciente, telefonepaciente, cpf_paciente, codcidade) VALUES
('João José da Silva', 'Rua Feliciano Rodrigues, N° 212, Bairro Centro', '(32) 9 9869-5400', '599.385.626-20', 1),
('André Souza Carvalho', 'Rua Agusto De Freitas, N° 511, Bairro Epicentro', '(11) 9 9968-8760', '606.988,325-58', 3),
('Gabriel Augusto Lima', 'Rua Armando Neves, N° 414, Bairro Nevasca', '(31) 9 9652-6025', '187.693.756-40', 2),
('Gustavo Roberto', 'Rua Velasco de Lima, N° 302, Bairro Centro', '(32) 9 9969-2580', '939.533.636-62', 1),
('Bianca de Andrade', 'Rua Newton Resende, N° 333, Bairro Pontão', '(33) 9 9679-2030', '232.237.636-19', 1),
('Maria das Flores', 'Rua Coronel Domiciano, N° 453, Bairro Serra', '(11) 9 8347-3399', '585.122.586-67', 3),
('Mariana das Dores', 'Rua Coronel Domiciano, N° 478, Bairro Serra', '(11) 9 8445-9090', '149.665.406-40', 3),
('Carolina Gobbo', 'Rua Bento Alves Costa, N° 111, Bairro Primavera', '(32) 9 7211-1064', '585.122.586-67', 2),
('Sophia Triângulo', 'Rua Bento Alves Costa, N° 132, Bairro Primavera', '(11) 9 9221-1030', '148.672.920-79', 3),
('Caio Castro', 'Rua Alexandre do Prado, N° 272, Bairro Liberdade', '(16) 9 9870-3030', '017.699.220-08', 3),
('Alex Rezende', 'Rua Alexandre do Prado, N° 280, Bairro Liberdade', '(16) 9 9788-7364', '921.436.790-68', 3);

INSERT INTO consulta(dataconsulta, valorconsulta, codconvenio, codpaciente, codmedico) VALUES
('2022-05-22', 512.50, 2, 1, 2),
('2021-04-15', 320.68, 1, 2, 3),
('2021-04-22', 580.77, 2, 3, 1),
('2021-04-03', 880.99, 1, 4, 3),
('2021-04-10', 600.50, 1, 5, 1),
('2022-09-05', 200, 2, 6, 4),
('2022-08-22', 97.95, 2, 6, 4),
('2022-01-01', 445.95, 3, 7, 5),
('2022-12-10', 980.80, 3, 8, 5),
('2021-12-03', 280, 3, 9, 6),
('2022-02-27', 1200.05, 3, 10, 6),
('2020-10-28', 1000.15, 3, 11, 6),
('2022-12-10', 1200.99, 1, 11, 7),
('2020-11-22', 980.00, 1, 10, 8),
('2022-11-22', 300.00, 1, 8, 9),
('2022-11-22', 2000.00, 1, 7, 10),
('2022-03-22', 137.00, 1, 2, 4),
('2022-05-01', 200.00, 1, 1, 4),
('2021-05-01', 510.00, 1, 1, 11);

INSERT INTO insumo(nomeinsumo, quantidade_estoque, valorinsumo) VALUES
('Seringa', 100, 5.50),
('Algodão', 500, 0.50);

INSERT INTO rel_consulta_insumo(codconsulta, codinsumo) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 1),
(10, 1),
(11, 2),
(12, 2),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 2),
(19, 2);

INSERT INTO procedimento(nomeprocedimento, valorprocedimento) VALUES
('Endoscopia Digestiva Alta', 300),
('Raio X', 70),
('Ultrassom', 110),
('Eletroneuromiografia', 400);

INSERT INTO rel_consulta_procedimento(codconsulta, codprocedimento) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 4),
(6, 1),
(7, 2),
(8, 2),
(9, 4),
(10, 4),
(11, 1),
(12, 3),
(13, 2),
(14, 3),
(15, 3),
(16, 4),
(17, 1),
(18, 4),
(19, 4);