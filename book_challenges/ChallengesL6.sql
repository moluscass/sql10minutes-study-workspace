-- 1:
SELECT 
    prod_name, 
    prod_desc
FROM 
    Products
WHERE 
    prod_desc LIKE '%toy%'; 
    -- WILDCARD %: (n) QTD DE CARACTERES ANTES, DEPOIS OU ENTRE O DADO
    -- DEPENDE DA POSIÇÃO QUE É INSERIDO

-- 2:
SELECT 
    prod_name, 
    prod_desc
FROM 
    Products
WHERE 
    NOT prod_desc LIKE '%toy%' -- NOT: INVERSÃO DA CONDIÇÃO
ORDER BY 
    prod_name;

--3
SELECT 
    prod_name, 
    prod_desc
FROM 
    Products
WHERE 
    prod_desc LIKE '%toy%' 
        AND prod_desc LIKE '%carrots%';

--4
SELECT 
    prod_name, 
    prod_desc
FROM 
    Products
WHERE 
    prod_desc LIKE '%toy%carrots%';