use Teste_Analista_N2
--Seleciona as colunas que irão compor o resultado da consulta
SELECT
ID_PRODUTO,
ID_PARCEIRO,
STATUS_PRODUTO,
PREÇO_DE,
PREÇO_POR,
NOME_PRODUTO,
(p.PREÇO_POR - p.PREÇO_DE) AS DIFERENÇA_PREÇOS

--Define a tabela aonde a consulta deverá ser feita
FROM TB_PRODUTO p

--Define as condições em que se deve retornar os dados solicitados. (Todos os produtos que tiveram queda nos preços)
WHERE (p.PREÇO_POR - p.PREÇO_DE) < 0

--Ordena de forma decrescente pela diferença dos preços (ASC pois a diferença é negativa)
ORDER BY DIFERENÇA_PREÇOS ASC

