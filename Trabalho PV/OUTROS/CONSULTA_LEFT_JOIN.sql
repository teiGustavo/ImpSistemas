/*Buscar todos os atores 
que não participam de nenhuma peça*/
SELECT * FROM ATOR A 
              LEFT JOIN ATORPECA AP
              ON A.CODATOR = AP.CODATOR
WHERE AP.CODATOR IS NULL              