-- 1:
SELECT
	oi.prod_id,
    oi.quantity
FROM
	OrderItems AS oi
WHERE
	oi.prod_id = 'BNBG'
UNION
SELECT
	oi.prod_id,
    oi.quantity
FROM
	OrderItems AS oi
WHERE
	oi.quantity = 100;

-- 2:
SELECT
	oi.prod_id,
    oi.quantity
FROM
	OrderItems AS oi
WHERE
	oi.prod_id = 'BNBG'
    OR oi.quantity = 100;