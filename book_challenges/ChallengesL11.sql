-- 1: SUBCONSULTAS (CONSULTAS COMO CONDIÇÕES)
SELECT -- PASSO 1
    order_num
FROM
    OrderItems
WHERE
    item_price >= 10;
    
SELECT -- PASSO 2
    cust_id
FROM
    Orders 
WHERE
    order_num IN(SELECT
                    order_num
                 FROM
                    OrderItems
                 WHERE
                    item_price >= 10);
                    
SELECT -- CONSULTA 3
    cust_name
FROM 
    Customers
WHERE
    cust_id IN(SELECT -- CONSULTA 2
                    cust_id
                FROM
                    Orders 
                WHERE
                    order_num IN(SELECT -- CONSULTA 1
                                    order_num
                                 FROM
                                    OrderItems
                                 WHERE
                                    item_price >= 10));
ORDER BY
    cust_name;
    
-- 2:
SELECT -- PASSO 1
    order_num
FROM
    OrderItems
WHERE
    prod_id = 'BR01';
    
SELECT -- CONSULTA 2
    order_date
FROM
    Orders
WHERE 
    order_num IN(SELECT -- CONSULTA 1
                    order_num
                 FROM
                    OrderItems
                 WHERE
                    prod_id = 'BR01');
    
-- 3:
SELECT -- PASSO 1
    order_num
FROM
    OrderItems
WHERE
    prod_id = 'BR01'
    
SELECT -- PASSO 2
    cust_id
FROM
    Orders 
WHERE
    order_num IN(STEP1)
    
SELECT -- PASSO 3
    cust_email
FROM
    Customers
WHERE
    cust_id IN(STEP2)
    
-- SUBCONSULTA INTEIRA:
SELECT -- CONSULTA 3
    cust_email
FROM
    Customers
WHERE
    cust_id IN(SELECT -- CONSULTA 2
                    cust_id
                FROM
                    Orders 
                WHERE
                    order_num IN(SELECT -- CONSULTA 1
                                    order_num
                                 FROM
                                    OrderItems
                                 WHERE
                                    prod_id = 'BR01'))
ORDER BY
    cust_email;
    
-- 4:
SELECT -- STEP1
    SUM(quantity*item_price)
FROM
    OrderItems
GROUP BY
    order_num;
    
SELECT -- STEP2
    cust_id,
    (SELECT
        SUM(quantity*item_price)
    FROM
        OrderItems
    WHERE
        OrderItems.order_num = Orders.order_num) AS total_price
FROM
    Orders 
ORDER BY
    total_price DESC;
    
--5:
SELECT
    prod_name,
    prod_id,
    (SELECT
        SUM(quantity)
    FROM
        OrderItems
    WHERE
        OrderItems.prod_id = Products.prod_id) AS quant_sold
FROM
    Products
ORDER BY
    quant_sold;