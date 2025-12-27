--1
SELECT -- REGRA AS (SEM ESPAÇOS): SEM ASPAS SIMPLES
    vend_id,
    vend_name AS vname,
    vend_adress AS vadress,
    vend_city AS vcity
FROM 
    Vendors
ORDER BY
    vname;

--2
SELECT -- REGRA AS (COM ESPAÇOS): COM ASPAS SIMPLES
    prod_id AS 'product code',
    prod_price AS 'sale price',
    (prod_price*0.9) AS 'off value'
FROM 
    Products;