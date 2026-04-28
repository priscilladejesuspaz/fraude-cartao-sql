CREATE DATABASE superstore;
USE superstore;
CREATE TABLE superstore_sales (
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2)
);
LOAD DATA LOCAL INFILE 'C:/Users/Book/Downloads/superstore_sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(row_id, order_id, @od, @sd, ship_mode, customer_id, customer_name,
 segment, country, city, state, postal_code, region,
 product_id, category, sub_category, product_name, sales)
SET order_date = STR_TO_DATE(@od, '%d/%m/%Y'),
    ship_date  = STR_TO_DATE(@sd, '%d/%m/%Y');
    
SET GLOBAL local_infile = 1;
-- Passo 2** — precisa reconectar com a opção habilitada. Vá em:

-- Database → Connect to Database → Advanced → Others`
-- e adicione essa linha:
-- OPT_LOCAL_INFILE=1

-- SELECT COUNT(*)
-- FROM superstore_sales;
-- truncate table superstore_sales ;