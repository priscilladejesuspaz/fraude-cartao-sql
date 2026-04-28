USE fraude_cartao;

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
SELECT 
	CASE 
    WHEN is_fraud = 1 THEN 'fraude'
    ELSE 'normal'
END AS tipo,
COUNT(*) AS TOTAL 
FROM transacoes 
GROUP BY is_fraud
ORDER BY is_fraud ASC

