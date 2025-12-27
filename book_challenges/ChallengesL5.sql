-- 1:
SELECT 
    vend_name
FROM 
    Vendors
WHERE 
    vend_country = 'USA' -- CONDIÇÃO: STRING
        AND vend_state = 'CA';
        
-- 2:
SELECT  
    order_num, 
    prod_id, 
    quantity
FROM 
    OrderItems
WHERE 
    prod_id IN('BR01','BR02','BR03') -- ATENDE A MÚLTIPLAS CONDIÇÕES SEPARADAS POR VÍRGULAS
        AND quantity >= 100;
    
--3
SELECT 
    prod_name, 
    prod_price
FROM 
    Products
WHERE 
    prod_price >= 3 
        AND prod_price <= 6 -- ou: BETWEEN 3 AND 6
ORDER BY 
    prod_price, 
    prod_name;

--4 (ORDER  BY antes do WHERE)
SELECT 
    vend_name
FROM 
    Vendors
WHERE
    vend_country = 'USA'
        AND vend_state = 'CA'
ORDER BY 
    vend_name;
