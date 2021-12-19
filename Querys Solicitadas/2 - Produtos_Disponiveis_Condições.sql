use Teste_Analista_N2
--Seleciona as colunas que ir�o compor o resultado da consulta
SELECT
NOME_PRODUTO,
NOME_CAMPANHA,
SEGMENTO_CLIENTE,
NOME_LOJA,
STATUS_PRODUTO,
c.FATOR_CONVERSAO,
p.PRE�O_POR,
p.PRE�O_POR * C.FATOR_CONVERSAO AS PRE�O_MILHAS

--Realiza a jun��o da tabela TB_PRODUTO com a tabela TB_LOJAS e TB_CAMPANHA, referenciando cada primary key de uma tabela com sua respectiva foreign key de outra tabela
FROM TB_PRODUTO p
INNER JOIN TB_LOJA l ON p.ID_PARCEIRO = l.ID_PARCEIRO
INNER JOIN TB_CAMPANHA c ON l.ID_CAMPANHA = c.ID_CAMPANHA

--Define as condi��es em que se deve retornar os dados solicitados.
WHERE c.SEGMENTO_CLIENTE IN ('CONSTRU��O', 'BELEZA', 'VARIEDADES') --Segmento da campanha deve ser contru��o, beleza ou variedades.
AND ((p.PRE�O_POR * c.FATOR_CONVERSAO) BETWEEN 100 AND 10000) --O pre�o em milhas do produto deve estar entre 100 e 10000 milhas.
AND STATUS_PRODUTO = 'ATIVO' --Todos os produtos *dispon�veis*, portanto com status ativo.
AND l.VIVISEL = 1

--Ordena os resultados de acordo com o pre�o do produto em milhas, em ordem decrescente.
ORDER BY PRE�O_MILHAS DESC

