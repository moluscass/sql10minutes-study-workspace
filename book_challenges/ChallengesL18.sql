-- 1
CREATE VIEW CustomersWithOrders AS
	SELECT
		C.*
	FROM
		Customers AS C
	INNER JOIN
		Orders AS O ON(C.cust_id=O.cust_id)
	WHERE
		O.cust_id IS NOT NULL;

-- VISUALIZAÇÂO
SELECT
	*
FROM
	CustomersWithOrders;
	
-- CONFIRMAR RESULTADOS
SELECT
	C.*
FROM
	Customers AS C
JOIN
	Orders AS O ON(C.cust_id=O.cust_id);

-- 2: 
CREATE VIEW OrderExpandedPriceCH AS -- SEM ERROS
	SELECT
		order_num,
		prod_id,
        quantity,
        item_price,
        (quantity*item_price) AS expanded_price
	FROM
		OrderItems
	ORDER BY
		order_num;