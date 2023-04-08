SELECT * FROM TEATRO
WHERE NOME = 'Zacarias' OR
	  NOME = 'SESC';
      
SELECT * FROM PECA;      
      
SELECT * FROM APRESENTACAO;

/*Junção entre tabelas utilizando o modo cartesiano
Lista o nome dos teatros seguido das suas apresentações e peças
*/
SELECT T.CODTEATRO, T.NOME, A.CODAPRESENTACAO,
				A.QUANTIDADEPUBLICO, A.DATA, P.NOME		
				FROM TEATRO AS T, APRESENTACAO AS A, PECA AS P
WHERE T.CODTEATRO = A.CODTEATRO AND P.CODPECA = A.CODPECA;

/*Liste todos os atores que participaram da peça 
“O Doente Imaginário”;*/
SELECT A.NOME "ATOR", P.NOME "PEÇA"  
   FROM ATOR AS A, ATORPECA AS ATP, PECA AS P
WHERE A.CODATOR = ATP.CODATOR  AND     
	  P.CODPECA = ATP.CODPECA  AND
      P.NOME    = "Antígona"
ORDER BY A.NOME;    

/*Listar os atores e ordenar os atores 
pelo nome*/
SELECT * FROM ATOR
ORDER BY NOME




      
	