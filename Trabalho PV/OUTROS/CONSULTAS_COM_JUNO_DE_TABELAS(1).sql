SELECT * FROM TEATRO
WHERE NOME = 'Zacarias' OR
	  NOME = 'SESC';
      
SELECT * FROM APRESENTACAO;

/*Junção entre tabelas utilizando o modo cartesiano
Lista o nome dos teatros seguido das suas apresentações e peças
*/
SELECT T.CODTEATRO, T.NOME, A.CODAPRESENTACAO,
				A.QUANTIDADEPUBLICO, A.DATA, P.NOME		
				FROM TEATRO AS T, APRESENTACAO AS A, PECA AS P
WHERE T.CODTEATRO = A.CODTEATRO AND P.CODPECA = A.CODPECA;







      
	