use Teste_Analista_N2
--Insere a sele��o feita abaixo na tabela TB_LOJA
INSERT INTO TB_LOJA

--Seleciona as colunas que ir�o compor o resultado da consulta
SELECT 
ID_PARCEIRO, 
ID_CAMPANHA, 
NOME_PARCEIRO AS NOME_LOJA, 
CASE WHEN SEGMENTO = 'BEBIDAS' THEN 0 ELSE 1 END AS VISIVEL, --Quando o segmento da loja for bebidas, torna a loja 'n�o visivel'.
'ATIVO' AS STATUS_LOJA --Define todas as lojas como status 'ativo'

--Retorna o produto cartesiano das linhas das tabelas abaixo que atendam as condi��es definidas posteriormente.
FROM TB_PARCEIRO p
CROSS JOIN TB_CAMPANHA c

--Define as condi��es aonde deve-se retornar o produto cartesiano das linhas das tabelas acima definidas.
WHERE c.STATUS = 'ATIVO' --Todas as campanhas ativas
AND(SEGMENTO_CLIENTE <> SEGMENTO OR (SEGMENTO_CLIENTE = SEGMENTO AND NOME_CAMPANHA LIKE '%' + NOME_PARCEIRO + '%')) --Segmento do cliente diferente do segmento do parceiro, por�m concorrentes.
AND (SEGMENTO_CLIENTE <> 'CONSTRU��O' OR (SEGMENTO_CLIENTE = 'CONSTRU��O' AND SEGMENTO NOT IN ('ALIMENTOS', 'BEBIDAS'))) -- Campanhas do segmento de constru��o, n�o podem vincular parceiros dos segmentos de Alimentos e nem Bebidas.

