#EX1 - %: QUALQUER Nº DE CARACTERE
SELECT 
    prod_id as 'id do produto', 
    prod_name as 'nome do produto'
FROM Products
WHERE prod_name LIKE '% bean bag%';

#EX2
SELECT 
    prod_id as 'id do produto', 
    prod_name as 'nome do produto'
FROM Products
WHERE prod_name LIKE 'F%y%';

#EX3 - _: Nº DE CARACTERE ESPECIFICO
SELECT 
    prod_id as 'id do produto', 
    prod_name as 'nome do produto'
FROM Products
WHERE prod_name LIKE '__ inch teddy bear';

#EX4
SELECT 
    prod_id as 'id do produto', 
    prod_name as 'nome do produto'
FROM Products
WHERE prod_name LIKE '% inch teddy bear';

#EX5 - REGEXP: CORRESPONDE A LIKE [ ]
SELECT cust_contact as 'nome do comprador'
FROM Customers
WHERE cust_contact REGEXP '^[JM]'
ORDER BY cust_contact;

#EX6 - REGEXP: LÓGICA INVERSA
SELECT cust_contact as 'nome do comprador'
FROM Customers
WHERE cust_contact NOT REGEXP '^[JM]'
ORDER BY cust_contact;