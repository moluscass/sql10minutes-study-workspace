USE sql10minutes;

-- 1: UPDATES (ADAPTADO)
UPDATE
	Customers
SET
	cust_country = 'USA'
WHERE
	cust_country = 'usa';
    
UPDATE
	Vendors
SET
	vend_country = 'USA'
WHERE
	vend_country = 'usa';

-- 2: DELETE
DELETE FROM
	Customers
WHERE
	cust_id = '1000000011';
