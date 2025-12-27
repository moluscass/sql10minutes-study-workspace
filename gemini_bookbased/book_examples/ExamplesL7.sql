--EX1
SELECT 
    CONCAT 
        (vend_name,' (', vend_country, ')')
FROM 
    Vendors
ORDER BY 
    vend_name;

--EX2
SELECT 
    CONCAT (
        (vend_name), 
        ' (', vend_country, ')'
    ) AS vend_name
FROM 
    Vendors
ORDER BY 
    vend_name;

--EX3
SELECT 
    prod_id, 
    quantity, 
    item_price
FROM 
    OrderItems
WHERE 
    order_num = 20008;

--EX4
SELECT 
    prod_id, 
    quantity, 
    item_price, 
    quantity*item_price as expanded_price
FROM 
    OrderItems
WHERE 
    order_num = 20008;