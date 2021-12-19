SELECT COUNT(DISTINCT A.ID_PRODUTO), --tr�s a quantidade de linhas resultantes das condi��es expostas abaixo, de acordo com cada parceiro.
A.ID_PARCEIRO
 FROM TB_PRODUTO A WITH(NOLOCK) --realiza a jun��o da tabela produtos com a tabela de parceiros e um 'left join' com a tb_categoria_produto
INNER JOIN TB_PARCEIRO B WITH(NOLOCK) ON A.ID_PARCEIRO =
B.ID_PARCEIRO
 LEFT JOIN TB_CATEGORIA_PRODUTO C WITH(NOLOCK) ON A.ID_PRODUTO =
C.ID_PRODUTO
WHERE A.STATUS_PRODUTO = 'ATIVO' --Define as condi��es da consulta, aonde status do produto for ativo, pre�o diferente de 0 e categoria 'null'
 AND A.PRECO_DE <> 0
 AND C.ID_CATEGORIA_PRODUTO is null
GROUP BY A.ID_PRODUTO --Agrupa o resultado por ID_PRODUTO

--Retorna a quantidade de produtos distintos por parceiro aonde o status do produto for 'ativo', pre�o anterior diferente de 0 e possuir categoria de produto com valor nulo, indefinido.