-- Traz a id da transa��o da tabela TB_LOTE_CREDITO_TRANSA��O
SELECT C.ID_TRANSACAO 

----Realiza a jun��o da tabela TB_LOTE_CREDITO com a tabela TB_LOTE_CREDITO_ITEM e TB_LOTE_CREDITO_TRANSACAO, referenciando cada primary key de uma tabela com sua respectiva foreign key de outra tabela
 FROM TB_LOTE_CREDITO A WITH(NOLOCK) 
 INNER JOIN TB_LOTE_CREDITO_ITEM B WITH(NOLOCK) ON
A.ID_LOTE_CREDITO = B.ID_LOTE_CREDITO
 INNER JOIN TB_LOTE_CREDITO_TRANSACAO C WITH(NOLOCK) ON
B.ID_LOTE_CREDITO_ITEM = C.ID_LOTE_CREDITO_ITEM

--Define as condi��es em que se deve retornar os dados solicitados. 
 WHERE B.TIPO_TRANSACAO = 'DEBITO' --Transa��es realizadas no d�bito.
 AND A.LOTE_CREDITO_STATUS = 'PROCESSADO' --Status 'processado'
 AND A.PONTOS > 0 --Aonde pontos for maior que 0.
 AND CONVERT(DATE,A.FIM_PROCESSAMENTO,103) BETWEEN GETDATE() - 2 AND
GETDATE() - 1 --Converte o formato de data da tabela TB_LOTE_CREDITO para o formato dd/mm/aaaa e seleciona apenas as transa��es aonde o processamento foi finalizado nos ultimos dois dias anteriores � consulta.

--Retorna todas as IDs de transa��es no d�bito, j� processadas e com acumulo de pontos maior que zero nos dois dias anteriores � consulta.
--Nolock indica que n�o ser� necess�rio bloquear a tabela durante a leitura dos dados.
