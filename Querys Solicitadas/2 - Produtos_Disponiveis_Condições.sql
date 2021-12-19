use Teste_Analista_N2
--Seleciona as colunas que irão compor o resultado da consulta
SELECT
NOME_PRODUTO,
NOME_CAMPANHA,
SEGMENTO_CLIENTE,
NOME_LOJA,
STATUS_PRODUTO,
c.FATOR_CONVERSAO,
p.PREÇO_POR,
p.PREÇO_POR * C.FATOR_CONVERSAO AS PREÇO_MILHAS

--Realiza a junção da tabela TB_PRODUTO com a tabela TB_LOJAS e TB_CAMPANHA, referenciando cada primary key de uma tabela com sua respectiva foreign key de outra tabela
FROM TB_PRODUTO p
INNER JOIN TB_LOJA l ON p.ID_PARCEIRO = l.ID_PARCEIRO
INNER JOIN TB_CAMPANHA c ON l.ID_CAMPANHA = c.ID_CAMPANHA

--Define as condições em que se deve retornar os dados solicitados.
WHERE c.SEGMENTO_CLIENTE IN ('CONSTRUÇÃO', 'BELEZA', 'VARIEDADES') --Segmento da campanha deve ser contrução, beleza ou variedades.
AND ((p.PREÇO_POR * c.FATOR_CONVERSAO) BETWEEN 100 AND 10000) --O preço em milhas do produto deve estar entre 100 e 10000 milhas.
AND STATUS_PRODUTO = 'ATIVO' --Todos os produtos *disponíveis*, portanto com status ativo.
AND l.VIVISEL = 1

--Ordena os resultados de acordo com o preço do produto em milhas, em ordem decrescente.
ORDER BY PREÇO_MILHAS DESC

