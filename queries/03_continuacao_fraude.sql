USE fraude_cartao;

-- Quantas transações são de alto valor vs baixo valor?
/*
Define:

alto_valor → amt >= 1000
baixo_valor → amt < 1000
*/
CREATE VIEW t_altovalor_baixovalor AS
SELECT 
	CASE 
    WHEN amt >= 1000 THEN 'Alto Valor'
	ELSE 'Baixo Valor'
END AS valores_transacoes,

	COUNT(*) AS valor_total
FROM transacoes 
GROUP BY valores_transacoes
ORDER BY valor_total ASC;

-- Pergunta 2: Quais categorias têm taxa de fraude acima da média?

SELECT 
	CASE 
        WHEN is_fraud = 1 THEN 'fraude'
        ELSE 'normal'
    END AS tipo
GROUP BY is_fraud  
FROM transacoes

SELECT 
	ROUND(AVG(is_fraud) * 100, 2) AS media_fraude,
    category
FROM transacoes
GROUP BY category
HAVING AVG(is_fraud) > 
	(SELECT AVG(is_fraud)
    FROM transacoes)
ORDER BY media_fraude DESC;

-- Segunda forma de montar a query acima: 
CREATE VIEW taxa_media_fraude AS
WITH media_global AS (
    SELECT AVG(is_fraud) AS media 
    FROM transacoes
)
SELECT 
	 category,
	AVG(is_fraud) AS media_fraude   
FROM transacoes
GROUP BY category
HAVING AVG(is_fraud) > (SELECT media FROM media_global)
ORDER BY media_fraude DESC;

-- Quais horários concentram mais fraude proporcionalmente?
CREATE VIEW horarios_fraudes AS
SELECT 
	SUM(is_fraud) AS total_fraude,
    CASE 
    WHEN HOUR(trans_date_trans_time) BETWEEN 0 AND 5 THEN 'madrugada'
	WHEN HOUR(trans_date_trans_time) BETWEEN 6 AND 11 THEN 'manha'
	WHEN HOUR(trans_date_trans_time) BETWEEN 12 AND 17 THEN 'tarde'
	ELSE 'noite'
END AS periodo ,
    
    AVG(is_fraud) AS taxa
FROM transacoes
GROUP BY periodo
ORDER BY taxa DESC;

-- “Quantas transações são fraude vs normais?”
-- 1. Opção 1:
SELECT 
	COUNT(trans_num)
FROM transacoes
WHERE is_fraud = '0'
	AND is_fraud = '1';
/*    
SELECT 
	COUNT(trans_num)
FROM transacoes;
*/
-- 1. Opção 2:
SELECT 
	COUNT(trans_num) total_transacoes,
	is_fraud 
FROM transacoes 
where is_fraud IN (0, 1)
GROUP BY is_fraud;

-- 1. Opção 3:
CREATE VIEW transacoes_fraudes_normais AS
SELECT 
    CASE 
        WHEN is_fraud = 1 THEN 'fraude'
        ELSE 'normal'
    END AS tipo,
    COUNT(*) AS total
FROM transacoes
GROUP BY 
    is_fraud
ORDER BY 
	is_fraud ASC;
-- 1. Opção 4:
CREATE VIEW transacoes_fraudes_normais AS
SELECT 
	CASE 
    WHEN is_fraud = 1 THEN 'fraude'
    ELSE 'normal'
END AS tipo,
COUNT(*) AS TOTAL 
FROM transacoes 
GROUP BY is_fraud
ORDER BY is_fraud ASC;

-- Quais categorias têm taxa de fraude acima da média?
CREATE VIEW categoria_fraude AS
SELECT 
	avg(is_fraud)
    FROM transacoes
    group by is_fraud;

select category
from transacoes;


