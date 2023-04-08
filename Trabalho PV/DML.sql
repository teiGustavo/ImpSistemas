USE convenio;

SET foreign_key_checks = 0;

/*DEFINIR IDIOMA DAS CONSULTAS QUE UTILIZAM "TEMPO DECORRIDO / DATAS" COMO PORTUGUÊS*/
SET lc_time_names=pt_BR;

/* CONSULTA 1 - Liste em ordem alfabética todos os médicos que estejam registrados no convênio UNIMED*/    
SELECT M.nomemedico as 'Médicos registrados no convênio UNIMED' FROM medico as M, convenio as C, rel_medico_convenio as MC 
WHERE C.siglaconvenio = 'Unimed' AND M.codmedico = MC.codmedico AND C.codconvenio = MC.codconvenio 
ORDER BY M.nomemedico ASC;	

/* CONSULTA 2 - Liste em ordem alfabética todos os pacientes que consultaram com o médico “Andreas Vesalius” da cidade de “Muriaé” no mês de maio de 2022*/    
SELECT P.nomepaciente as 'Pacientes que consultaram com o médico Andreas Vesalius em maio de 2022' FROM paciente as P, medico as M, cidade as CD, consulta as C 
WHERE M.nomemedico = 'Andreas Vesalius' AND CD.nomecidade = 'Muriaé' AND DATE_FORMAT(C.dataconsulta, '%M de %Y') = 'maio de 2022' AND P.codpaciente = C.codpaciente AND M.codcidade = CD.codcidade AND M.codmedico = C.codmedico
ORDER BY P.nomepaciente ASC;

/* CONSULTA 3 - Liste todos os médicos que não realizaram consultas durante os 2 (dois) primeiros meses de 2022*/   
SELECT M.nomemedico as 'Médicos que não realizaram consultas nos dois primeiros meses de 2022' FROM medico as M, consulta as C
WHERE M.codmedico NOT IN (SELECT M.codmedico FROM medico as M, consulta as C WHERE (DATE_FORMAT(C.dataconsulta, 'Mês %c de %Y') = 'Mês 1 de 2022' or DATE_FORMAT(C.dataconsulta, 'Mês %c de %Y') = 'Mês 2 de 2022') AND M.codmedico = C.codmedico)
GROUP BY M.nomemedico ORDER BY M.nomemedico ASC;

/* CONSULTA 4 - Retorne o somatório total das consultas realizadas pelo médico “João Nogueira” registrado no convênio “UNIMED” no mês de abril do ano de 2021*/ 
SELECT COUNT(C.codconsulta) as 'Quantidade de consultas realizadas pelo Médico João Nogueira',  CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(SUM(C.valorconsulta), 2),'.',';'),',','.'),';',',')) as 'Valor total das consultas realizadas pelo Médico João Nogueira' FROM consulta as C, convenio as CM, medico as M 
WHERE M.nomemedico = 'João Nogueira' AND CM.siglaconvenio = 'UNIMED' AND DATE_FORMAT(C.dataconsulta, '%M de %Y') = 'abril de 2021' AND CM.codconvenio = C.codconvenio AND M.codmedico = C.codmedico;

/* CONSULTA 5 - Liste todos os procedimentos e insumos realizados e utilizados pela da paciente “Maria das Flores” em ordem alfabética*/
SELECT PC.nomeprocedimento as 'Procedimentos realizados na paciente Maria das Flores', I.nomeinsumo as 'Insumos utilizados na paciente Maria das Flores', DATE_FORMAT(C.dataconsulta, '%d de %M de %Y') as 'Data da consulta' FROM procedimento as PC, insumo as I, paciente as P, consulta as C, rel_consulta_insumo as CI, rel_consulta_procedimento as CP
WHERE P.nomepaciente = 'Maria das Flores' AND P.codpaciente = C.codpaciente AND C.codconsulta = CI.codconsulta AND C.codconsulta = CP.codconsulta AND I.codinsumo = CI.codinsumo AND PC.codprocedimento = CP.codprocedimento;

/* CONSULTA 6 - Liste todas as consultas realizadas pela médica “Lucia de Oliveira” cujo valor seja maior que R$ 100,00 reais*/
SELECT P.nomepaciente as 'Nome do paciente', M.nomemedico as 'Médico que realizou a consulta', CM.nomeconvenio as 'Convênio utilizado', PC.nomeprocedimento as 'Procedimentos realizados', I.nomeinsumo as 'Insumos utilizados', CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(C.valorconsulta, 2),'.',';'),',','.'),';',',')) as 'Valor da consulta', DATE_FORMAT(C.dataconsulta, '%d de %M de %Y') as 'Data da consulta' FROM consulta as C, medico as M, paciente as P, procedimento as PC, insumo as I, convenio as CM, rel_consulta_insumo as CI, rel_consulta_procedimento as CP, rel_medico_convenio as MC
WHERE M.nomemedico = 'Lucia de Oliveira' AND C.valorconsulta > 100 AND C.codmedico = M.codmedico AND P.codpaciente = C.codpaciente AND C.codconsulta = CI.codconsulta AND C.codconsulta = CP.codconsulta AND I.codinsumo = CI.codinsumo AND PC.codprocedimento = CP.codprocedimento AND CM.codconvenio = MC.codconvenio AND M.codmedico = MC.codmedico; 

/* CONSULTA 7 - Atualize o valor dos procedimentos em 10%. Observação: Liste os procedimentos antes de atualizar os valores*/
SELECT PC.codprocedimento as 'Código do procedimento', PC.nomeprocedimento as 'Nome do Procedimento', CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(PC.valorprocedimento, 2),'.',';'),',','.'),';',',')) as 'Valor original do procedimento' FROM procedimento as PC;
UPDATE procedimento SET valorprocedimento = (valorprocedimento / 100 * 10 + valorprocedimento);
SELECT PC.codprocedimento as 'Código do procedimento', PC.nomeprocedimento as 'Nome do Procedimento', CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(PC.valorprocedimento, 2),'.',';'),',','.'),';',',')) as 'Valor do procedimento atualizado em 10%' FROM procedimento as PC;

/* CONSULTA 8 - Elabore uma consulta onde conste o nome do convênio, nome do médico, seguido do valor total das consultas realizadas*/
SELECT M.nomemedico as 'Nome do médico', CM.nomeconvenio as 'Nome do convênio', CM.siglaconvenio as 'Sigla do convênio', CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(SUM(C.valorconsulta), 2),'.',';'),',','.'),';',',')) as 'Valor total das consultas', COUNT(C.codconsulta) as 'Quantidade de consultas realizadas' FROM convenio as CM, medico as M, consulta as C 
WHERE CM.codconvenio = C.codconvenio AND M.codmedico = C.codmedico
GROUP BY M.nomemedico ORDER BY M.nomemedico, CM.nomeconvenio ASC;

/* CONSULTA 9 - Elabore uma consulta onde conste o valor total das consultas realizadas pelos médicos “João Nogueira” e “Izabel Duarte” seguidos do valor total das consultas dos convênios “UNIMED” e “GOLDENCROSS”*/
SELECT CM.nomeconvenio as 'Nome do convênio', CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(SUM(C.valorconsulta), 2),'.',';'),',','.'),';',',')) as 'Faturamento dos convênios', M.nomemedico as 'Nome do médico',(SELECT CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(SUM(C.valorconsulta), 2),'.',';'),',','.'),';',',')) FROM consulta as C, medico as M WHERE (M.nomemedico = 'João Nogueira' OR M.nomemedico = 'Izabel Duarte') AND CM.codconvenio = C.codconvenio AND M.codmedico = C.codmedico) as 'Faturamento dos médicos' FROM convenio as CM, consulta as C, medico as M
WHERE (CM.nomeconvenio = 'Golden Cross' OR CM.siglaconvenio = 'Unimed') AND CM.codconvenio = C.codconvenio AND M.codmedico = C.codmedico
GROUP BY CM.nomeconvenio ORDER BY CM.nomeconvenio ASC;

/* CONSULTA 10 - Elabore uma consulta que conste o nome do convênio seguido do somatório total do faturamento de cada convênio*/
SELECT CM.nomeconvenio as 'Nome do convênio', CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(SUM(C.valorconsulta), 2),'.',';'),',','.'),';',',')) as 'Faturamento total' FROM convenio as CM, consulta as C
WHERE CM.codconvenio = C.codconvenio
GROUP BY CM.nomeconvenio ORDER BY CM.nomeconvenio ASC;

/* CONSULTA 11 - Liste todos os pacientes que realizaram consultas com o médico “Marcio Quintão” durante o ano de 2021 e 2022*/
SELECT P.nomepaciente as 'Pacientes que se consultaram com o médico Márcio Quintão entre 2021 e 2022' FROM paciente as P, medico as M, consulta as C
WHERE M.nomemedico = 'Marcio Quintão' AND DATE_FORMAT(C.dataconsulta, '%Y') BETWEEN '2021' and '2022' AND P.codpaciente = C.codpaciente AND M.codmedico = C.codmedico;

/* CONSULTA 12 - Liste todos os pacientes cujo nomes comecem com as letras “M”, “S” ou “T”, seguido dos médicos cujo nomes comecem com as letras “A” e “B”*/
SELECT P.nomepaciente as 'Nome dos pacientes que começam com M, S ou T e Nome dos médicos que começam com A ou B', 'PACIENTE' as TIPO FROM paciente as P, medico as M
WHERE (P.nomepaciente LIKE 'M%' OR P.nomepaciente LIKE 'S%' OR P.nomepaciente LIKE 'T%') AND (M.nomemedico LIKE 'A%' OR M.nomemedico LIKE 'B%')
	UNION
SELECT M.nomemedico as 'Nome dos médicos que começam com A ou B', 'MÉDICO' as TIPO FROM paciente as P, medico as M
WHERE (P.nomepaciente LIKE 'M%' OR P.nomepaciente LIKE 'S%' OR P.nomepaciente LIKE 'T%') AND (M.nomemedico LIKE 'A%' OR M.nomemedico LIKE 'B%')
ORDER BY TIPO ASC;

/* CONSULTA 13 - Liste todos os médicos do estado de “Minas de Gerais” das cidades de “Muriaé “ e “Juiz de Fora” que são conveniados com a “UNIMED”*/
SELECT M.nomemedico as 'Médicos de Muriaé-MG que sao associados ao UNIMED' FROM medico as M, cidade as CD, convenio as CM, rel_medico_convenio as MC
WHERE CD.estadocidade = 'Minas Gerais' AND (CD.nomecidade = 'Muriaé' OR CD.nomecidade = 'Juiz de Fora') AND CM.siglaconvenio = 'Unimed' AND M.codmedico = MC.codmedico AND CM.codconvenio = MC.codconvenio AND M.codcidade = CD.codcidade;

/* CONSULTA 14 - Liste os 5 (cinco) médicos do estado de “São Paulo” que possuem as consultas de maior valor*/
SELECT M.nomemedico as 'Os cinco médicos com as consultas de maior valor no estado de São Paulo', CONCAT('R$ ', REPLACE(REPLACE(REPLACE(FORMAT(C.valorconsulta, 2),'.',';'),',','.'),';',',')) as 'Valor das consultas' FROM medico as M, cidade as CD, consulta as C
WHERE CD.estadocidade = 'São Paulo' AND M.codcidade = CD.codcidade AND M.codmedico = C.codmedico
GROUP BY M.nomemedico ORDER BY C.valorconsulta DESC LIMIT 5;

/* COLSULTA 15 - Excluir o médico que possui a menor soma dos valores das consultas no estado de SP */
DROP TABLE IF EXISTS tmp;
CREATE TEMPORARY TABLE tmp SELECT M.codmedico FROM Medico as M, cidade as CD, consulta as C
WHERE CD.estadocidade = 'São Paulo' AND M.codcidade = CD.codcidade AND M.codmedico = C.codmedico
GROUP BY M.nomemedico ORDER BY C.valorconsulta LIMIT 1;
DELETE FROM medico as M WHERE M.codmedico = (SELECT * FROM tmp);