--Ex1
SELECT 
    vend_name,
    UPPER(vend_name) AS "UPPER",
    LOWER(vend_name) AS "LOWER",
    LENGTH (vend_name) AS "LENGTH"
FROM 
    Vendors
WHERE 
    vend_name LIKE 'Bear%';

--Ex2
SELECT
    vend_name,
    SUBSTR(vend_name, 5) AS "SUBSTR(5)",
    LEFT(vend_name, 5) AS "LEFT(5)",
    RIGHT(vend_name, 5) AS "RIGHT(5)"
FROM 
    Vendors
WHERE 
    vend_name LIKE 'Bear%';

--Ex3
SELECT
    cust_name,
    cust_contact
FROM 
    Customers
WHERE 
    SOUNDEX(cust_contact) = SOUNDEX ('Micael Green');

--Ex4
SELECT
    order_num, 
    order_date
FROM
    Orders
WHERE
    YEAR (order_date) = 2020;