-- 1:
SELECT 
    prod_id, 
    prod_name
FROM 
    Products
WHERE -- CLÁUSULA DE FILTRO: [COLUNA; OPERADOR; CONDIÇÃO]
    prod_price = 9.49; -- IGUALDADE À CONDIÇÃO NUMÉRICA

-- 2:
SELECT
    prod_id, 
    prod_name
FROM
    Products
WHERE
    prod_price >= 9; -- IGUAL OU SUPERIOR À CONDIÇÃO PREDEFINIDA

-- 3:
SELECT DISTINCT  
    order_num, 
    quantity
FROM 
    OrderItems
WHERE 
    quantity >= 100;

-- 4:
SELECT 
    prod_name, 
    prod_price
FROM 
    Products
WHERE 
    prod_price >= 3 
        AND -- CONJUNÇÃO ENTRE MÚLTIPLAS CONDIÇÕES
        prod_price <= 6 -- IGUAL OU INFERIOR À CONDIÇÃ9LO
    -- ou: BETWEEN  3 AND 6
ORDER BY 
    prod_price;

-- 4: USANDO OR
SELECT 
    prod_name, 
    prod_price
FROM 
    Products
WHERE 
    prod_price >= 3 
        OR -- DISJUNÇÃO ENTRE MÚLTIPLAS CONDIÇÕES
        prod_price <= 6 -- IGUAL OU INFERIOR À CONDIÇÃ9LO
    -- ou: BETWEEN  3 AND 6
ORDER BY 
    prod_price;
