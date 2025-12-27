--GROUP BY: BREAK THE AGGREGATION IN CORRELATED PARTS
SELECT
    vend_id,
    COUNT(*) AS num_prods
FROM
    Products
GROUP BY
    vend_id;
    
--HAVING: FILTERS ON THE FUNCTION RESULT
SELECT
    cust_id,
    COUNT(*) AS orders
FROM
    Orders
GROUP BY
    cust_id
HAVING
    COUNT(*) >= 2;
    
--HAVING (my example)
SELECT
    order_num,
    SUM(item_price) AS total_price
FROM
    OrderItems 
GROUP BY 
    order_num
HAVING 
    SUM(item_price) BETWEEN 20 AND 27;
    
--WHERE + HAVING
SELECT
    vend_id,
    COUNT(prod_name) AS num_prods
FROM
    Products
WHERE
    prod_price >= 4
GROUP BY
    vend_id
HAVING 
    COUNT(prod_name) >= 2
ORDER BY
    num_prods;