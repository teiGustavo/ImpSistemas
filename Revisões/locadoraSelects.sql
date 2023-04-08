/*LETRA A*/
SELECT C.nome AS 'Nome do Filme' 
FROM categoria AS C JOIN filme_categoria as FC ON C.categoria_id = FC.categoria_id
WHERE FC.filme_id = 555;

/*LETRA B*/
SELECT A.primeiro_nome AS 'Primeiro Nome do Ator', A.ultimo_nome AS 'Último Nome do Ator' 
FROM ator AS A JOIN filme_ator as FA ON A.ator_id = FA.ator_id 
WHERE FA.filme_id = 397;

/*LETRA C*/
SELECT C.primeiro_nome AS 'Primeiro Nome do Cliente', E.bairro AS 'Nome do Bairro'
FROM cliente AS C JOIN endereco as E ON C.endereco_id = E.endereco_id
WHERE C.cliente_id = 300;

/*LETRA D*/
SELECT F.titulo AS 'Título do Filme', I.nome AS 'Nome do Idioma'
FROM filme as F JOIN idioma AS I ON F.idioma_id = I.idioma_id
WHERE F.filme_id = 750;

/*LETRA E*/
SELECT E.endereco AS 'Endereço da Loja'
FROM funcionario as F JOIN loja as L ON F.loja_id = L.loja_id JOIN endereco as E ON L.endereco_id = E.endereco_id
WHERE F.funcionario_id = 1;

/*LETRA F*/
SELECT I.nome AS 'Nome do Idioma', COUNT(F.filme_id) AS 'Quantidade de Filmes'
FROM filme as F RIGHT JOIN idioma as I ON F.idioma_id = I.idioma_id 
GROUP BY I.nome;