use fraude_cartao;

-- Table: transacoes
-- Columns:
CREATE TABLE transacoes (
trans_date_trans_time datetime, 
cc_num varchar(20),
merchant varchar(100), 
category varchar(50), 
amt decimal(10,2), 
first varchar(50), 
last varchar(50), 
gender char(1), 
street varchar(150), 
city varchar(50), 
state varchar(2), 
zip varchar(10), 
lat decimal(15,6), 
lng decimal(15,6), 
city_pop int, 
job varchar(100), 
dob date, 
trans_num varchar(50), 
unix_time int, 
merch_lat decimal(15,6), 
merch_long decimal(15,6), 
is_fraud tinyint(1)
);

select * from transacoes;
LOAD DATA LOCAL INFILE 'C:/Users/Book/Downloads/test.csv'
INTO TABLE transacoes
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
(row_id, order_id, @od, @sd, ship_mode, customer_id, customer_name,
 segment, country, city, state, postal_code, region,
 product_id, category, sub_category, product_name, sales)
SET order_date = STR_TO_DATE(@od, '%d/%m/%Y'),
    ship_date  = STR_TO_DATE(@sd, '%d/%m/%Y');
    
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';