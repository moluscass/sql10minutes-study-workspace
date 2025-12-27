-- 1:
SELECT
    cust_name
FROM 
    Customers
ORDER BY -- CLÁUSULA DE ORDENAÇÃO
    cust_name DESC; -- ORDENA OS RESULTADOS EM DECRESCENTE

-- 2:
SELECT
    cust_id, 
    order_num
FROM 
    Orders
ORDER BY -- DUAS COLUNAS OU MAIS: ORDENA EM SEQUÊNCIA DE DECLARAÇÃO
    cust_id,
    order_num DESC;

-- 3:
SELECT 
    quantity, 
    item_price 
FROM 
    OrderItems 
ORDER BY
    quantity DESC, 
    item_price DESC; 

-- 4:
SELECT 
    vend_name 
FROM 
    Vendors 
ORDER BY 
    vend_name DESC;