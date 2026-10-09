CREATE DATABASE lab6_dw;
SHOW DATABASES;
USE lab6_dw;

CREATE TABLE DIM_Date (
    date_id INT PRIMARY KEY,
    year INT,
    month INT,
    month_name VARCHAR(20)
);

CREATE TABLE DIM_Currency (
    currency_id INT PRIMARY KEY,
    currency_code VARCHAR(10),
    currency_name VARCHAR(50)
);

CREATE TABLE DIM_Commodity (
    commodity_id INT PRIMARY KEY,
    commodity_name VARCHAR(50),
    source_name VARCHAR(100)
);

CREATE TABLE FACT_Economic_Indicators (
    fact_id INT PRIMARY KEY,
    date_id INT,
    currency_id INT,
    commodity_id INT,
    gold_price_usd FLOAT,
    oil_price FLOAT,
    exchange_rate_value FLOAT,
    FOREIGN KEY (date_id) REFERENCES DIM_Date(date_id),
    FOREIGN KEY (currency_id) REFERENCES DIM_Currency(currency_id),
    FOREIGN KEY (commodity_id) REFERENCES DIM_Commodity(commodity_id)
);


SHOW TABLES;


INSERT INTO DIM_Currency (currency_id, currency_code, currency_name)
VALUES (1, 'USD', 'US Dollar');


SELECT * FROM DIM_Currency;


SELECT COUNT(*) AS dim_date_rows
FROM DIM_Date;

SELECT COUNT(*) AS dim_currency_rows
FROM DIM_Currency;

SELECT COUNT(*) AS dim_commodity_rows
FROM DIM_Commodity;

SELECT COUNT(*) AS fact_rows
FROM  FACT_Economic_Indicators;

SELECT
    f.fact_id,
    d.year,
    d.month_name,
    c.currency_code,
    m.commodity_name,
    f.gold_price_usd,
    f.oil_price,
    f.exchange_rate_value
FROM FACT_Economic_Indicators f
JOIN DIM_Date d
    ON f.date_id = d.date_id
JOIN DIM_Currency c
    ON f.currency_id = c.currency_id
JOIN DIM_Commodity m
    ON f.commodity_id = m.commodity_id
LIMIT 10;

SELECT 'DIM_Date' AS table_name, COUNT(*) AS rows_inserted FROM DIM_Date
UNION ALL
SELECT 'DIM_Currency', COUNT(*) FROM DIM_Currency
UNION ALL
SELECT 'DIM_Commodity', COUNT(*) FROM DIM_Commodity
UNION ALL
SELECT 'FACT_Economic_Indicators', COUNT(*) FROM FACT_Economic_Indicators;

SHOW TABLES;

SELECT 
    d.year,
    ROUND(AVG(f.gold_price_usd), 2) AS avg_gold_price_usd
FROM FACT_Economic_Indicators f
JOIN DIM_Date d
    ON f.date_id = d.date_id
GROUP BY d.year
ORDER BY d.year;

SELECT 
    d.year,
    ROUND(AVG(f.oil_price), 2) AS avg_oil_price_usd
FROM FACT_Economic_Indicators f
JOIN DIM_Date d
    ON f.date_id = d.date_id
GROUP BY d.year
ORDER BY d.year;

SELECT 
    d.year,
    ROUND(AVG(f.gold_price_usd), 2) AS avg_gold_price,
    ROUND(AVG(f.exchange_rate_value), 4) AS avg_exchange_rate,
    ROUND(AVG(f.gold_price_usd) / AVG(f.exchange_rate_value), 2) AS gold_per_exchange_unit
FROM FACT_Economic_Indicators f
JOIN DIM_Date d 
    ON f.date_id = d.date_id
JOIN DIM_Currency c 
    ON f.currency_id = c.currency_id
GROUP BY d.year
ORDER BY d.year;

SELECT 
    d.month_name,
    d.month,
    ROUND(AVG(f.oil_price), 2) AS avg_oil_price,
    ROUND(MAX(f.oil_price), 2) AS max_oil_price,
    ROUND(MIN(f.oil_price), 2) AS min_oil_price
FROM FACT_Economic_Indicators f
JOIN DIM_Date d 
    ON f.date_id = d.date_id
GROUP BY d.month, d.month_name
ORDER BY avg_oil_price DESC;