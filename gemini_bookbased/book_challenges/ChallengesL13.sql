USE sql10minutes;

-- Desafio 1:
SELECT
	C.cust_name,
    O.order_num
FROM
	Customers AS C
INNER JOIN
	Orders AS O ON C.cust_id=O.cust_id;
    
-- Desafio2
SELECT
	C.cust_name,
    O.order_num
FROM
	Customers AS C
LEFT OUTER JOIN
	Orders AS O ON C.cust_id=O.cust_id;
    
-- Desafios3
SELECT
	P.prod_name,
    OI.order_num
FROM
	Products AS P
RIGHT OUTER JOIN
	OrderItems AS OI ON P.prod_id=OI.prod_id
ORDER BY
		P.prod_name;

-- Desafio 4
SELECT
	P.prod_name,
	COUNT(OI.quantity) AS total_order
FROM
	Products AS P
RIGHT OUTER JOIN
	OrderItems AS OI ON P.prod_id=OI.prod_id
GROUP BY
	P.prod_name
ORDER BY
	total_order;
    
-- Desafio 5
SELECT
	V.vend_name,
    COUNT(P.prod_id) AS reg_prod
FROM
	Vendors AS V
LEFT OUTER JOIN
	Products AS P ON V.vend_id=P.vend_id
GROUP BY
	V.vend_id; 