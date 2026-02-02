

-- EX1 - %: QUALQUER Nº DE CARACTERE (APOS, ANTES, AS DUAS RECORRENCIAS OU ESPECIFICAS)
SELECT
    prod_id,
    prod_name
FROM
    Products
WHERE
    prod_name LIKE 'Fish%' -- QUALQUER CARACT APOS A PALAVRA DECLARADA

SELECT 
    prod_id, 
    prod_name
FROM 
    Products
WHERE 
    prod_name LIKE '%bean bag%'; -- ANTES E APOS

-- EX2
SELECT 
    prod_id, 
    prod_name
FROM 
    Products
WHERE 
    prod_name LIKE 'F%y%'; -- QUALQUER ENTRE 'Y' E 'F' E APOS 'Y'

-- EX3 - _: Nº DE CARACTERE ESPECIFICO
SELECT 
    prod_id, 
    prod_name
FROM 
    Products
WHERE 
    prod_name LIKE '__ inch teddy bear'; -- 2 CARACTERES ANTES DA PALAVRA DECLARADA

-- EX4
SELECT 
    prod_id, 
    prod_name
FROM 
    Products
WHERE 
    prod_name LIKE '% inch teddy bear'; -- QUALQUER CARACT ANTES DA PALAVRA DECLARADA

-- EX5 - REGEXP: CORRESPONDE A LIKE [ ]
SELECT 
    cust_contact
FROM 
    Customers
WHERE 
    cust_contact REGEXP '^[JM]' -- QUALQUER RESULTADO INICIADO POR 'J' E 'M'
ORDER BY 
    cust_contact;

-- EX6 - REGEXP: LÓGICA INVERSA
SELECT 
    cust_contact
FROM 
    Customers
WHERE 
    cust_contact NOT REGEXP '^[JM]'
ORDER BY 
    cust_contact;