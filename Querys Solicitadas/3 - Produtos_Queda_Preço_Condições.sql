use Teste_Analista_N2
--Seleciona as colunas que ir�o compor o resultado da consulta
SELECT
ID_PRODUTO,
ID_PARCEIRO,
STATUS_PRODUTO,
PRE�O_DE,
PRE�O_POR,
NOME_PRODUTO,
(p.PRE�O_POR - p.PRE�O_DE) AS DIFEREN�A_PRE�OS

--Define a tabela aonde a consulta dever� ser feita
FROM TB_PRODUTO p

--Define as condi��es em que se deve retornar os dados solicitados. (Todos os produtos que tiveram queda nos pre�os)
WHERE (p.PRE�O_POR - p.PRE�O_DE) < 0

--Ordena de forma decrescente pela diferen�a dos pre�os (ASC pois a diferen�a � negativa)
ORDER BY DIFEREN�A_PRE�OS ASC

