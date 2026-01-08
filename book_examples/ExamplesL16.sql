USE sql10minutes;

-- EX1: ATUALIZANDO UMA COLUNA DE UM REGISTRO
UPDATE
	Customers
SET
	cust_email = 'kim@thetoystore.com'
WHERE
	cust_id = '1000000005';
    
-- EX2: ATUALIZANDO DUAS COLUNAS DO MESMO REGISTRO
UPDATE
	Customers
SET
	cust_contact = 'Sam Roberts',
    cust_email = 'sam@toyland.com'
WHERE
	cust_id = '1000000006';
    
-- EX2.1 UPDATE USANDO SUB CONSULTAS
    
-- EX3: REMOVENDO VALOR COM NULL
UPDATE
	Customers
SET	
	cust_email = NULL
WHERE
	cust_id = '1000000005';
    
-- EX4: APAGANDO REGISTRO
DELETE FROM
	Customers
WHERE
	cust_id = '1000000007';