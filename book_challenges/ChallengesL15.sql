-- 1:
INSERT INTO Customers (
	cust_id,
    cust_name,
    cust_city,
    cust_state,
    cust_country
) VALUES (
	'1000000006',
    'Pimentas Legais',
    'Bélem',
    'PA',
    'Brazil'
);

-- 2:
CREATE TABLE OrdersBackup (
	SELECT *
    FROM Orders
);

CREATE TABLE OrderItemsBackup (
	SELECT *
    FROM OrderItems
);