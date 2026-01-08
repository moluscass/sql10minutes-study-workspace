-- EX1: CRIANDO UMA VIEW
CREATE VIEW ProductsCustomers AS
	SELECT
		cust_name,
        cust_contact,
        prod_id
	FROM
		Customers AS C
	INNER JOIN
		Orders AS O ON(C.cust_id=O.cust_id)
	INNER JOIN
		OrderItems AS OI ON(OI.order_num=O.order_num);

-- EX2: CONSULTANDO AS VIEWS
SELECT 
	cust_name,
    cust_contact
FROM 
	ProductsCustomers
WHERE -- PERMITE CONDICIONAIS
	prod_id = 'rgan01';
    
-- EX3: UTILIZANDO CAMPOS CALCULADOS
CREATE VIEW VendorLocations AS 
	SELECT
		CONCAT(vend_name,' (',vend_country,')') AS vend_locat
	FROM
		Vendors;

-- EXIBINDO A VIEW ANTERIOR
SELECT *
FROM VendorLocations;

-- EX4: EVITANDO VALORES INDESEJADOS
CREATE VIEW CustomerEmailList AS
	SELECT
		cust_id,
        cust_name,
        cust_email
	FROM
		Customers
	WHERE
		cust_email IS NOT NULL;

-- EXIBINDO A VIEW ANTERIOR
SELECT *
FROM CustomerEmailList;

-- EX5: USANDO CAMPOS CALCULADOS
CREATE VIEW OrderExpandedPrice AS
	SELECT
		order_num,
		prod_id,
        quantity,
        item_price,
        (quantity*item_price) AS expanded_price
	FROM
		OrderItems;
        
SELECT 
	*
FROM 
	OrderExpandedPrice
WHERE
	order_num = '20008';