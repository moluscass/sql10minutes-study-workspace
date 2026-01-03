-- 1:
UPDATE
    Customers
SET
    cust_country = 'USA'
WHERE
    cust_country = 'usa'
    
UPDATE
    Vendors
SET
    vend_country = 'USA'
WHERE
    vend_country = 'usa';
    
-- 2:
SELECT
    cust_name
FROM
    Customers
WHERE
    cust_id = '1000000006';

DELETE FROM
    Customers
WHERE
    cust_id = '1000000006';