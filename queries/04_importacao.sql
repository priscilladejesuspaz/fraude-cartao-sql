USE fraude_cartao;
-- Importando DATASET, pois pelo Wizard deu erro, devido o tamanho do mesmo.
LOAD DATA LOCAL INFILE 'C:\Users\Book\Downloads\archive\test.csv'
INTO TABLE transacoes
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT 
	COUNT(*)
FROM transacoes;
SELECT * FROM transacoes LIMIT 5;

-- Analisando coluna trans_date_trans_zeradas: 
SELECT COUNT(*) 
FROM transacoes
WHERE trans_date_trans_time = '0000-00-00 00:00:00'; 
DROP TABLE transacoes;

SELECT trans_date_trans_time, COUNT(*) 
FROM transacoes 
GROUP BY trans_date_trans_time 
LIMIT 10;

SELECT trans_date_trans_time 
FROM transacoes 
WHERE trans_date_trans_time != '0000-00-00 00:00:00'
LIMIT 5;

SELECT trans_date_trans_time 
FROM transacoes 
WHERE trans_date_trans_time IS NOT NULL
LIMIT 5;

SHOW VARIABLES LIKE 'sql_mode';

SELECT 
    COUNT(*) AS total,
    SUM(CASE WHEN trans_date_trans_time IS NULL THEN 1 ELSE 0 END) AS data_nula,
    SUM(CASE WHEN amt IS NULL THEN 1 ELSE 0 END) AS valor_nulo,
    SUM(CASE WHEN is_fraud IS NULL THEN 1 ELSE 0 END) AS fraud_nulo
FROM transacoes;