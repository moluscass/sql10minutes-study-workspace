-- 1: EQUIJOIN
SELECT
    cust_name,
    order_num
FROM
    Customers,
    Orders
WHERE
    Customers.cust_id = Orders.cust_id
ORDER BY
    cust_name,
    order_num;

-- 1: INNERJOIN
SELECT
    cust_name,
    order_num
FROM
    Customers
INNER JOIN
    Orders ON Orders.cust_id = Customers.cust_id
ORDER BY
    cust_name,
    order_num;

-- 2:
SELECT
    cust_name,
    order_num,
    CONCAT('U$',
    (SELECT
        SUM(quantity*item_price)
     FROM
        OrderItems
     WHERE
        OrderItems.order_num = Orders.order_num
    )) AS order_total
FROM
    Customers
INNER JOIN
    Orders ON Orders.cust_id = Customers.cust_id
ORDER BY
    cust_name,
    order_num;

-- 3:
SELECT
    prod_id,
    order_date
FROM
    Orders,
    OrderItems
WHERE
    Orders.order_num = OrderItems.order_num
    AND prod_id = 'BR01';
    
-- 3: SELFTEST
SELECT
    prod_id,
    CONCAT(
        DAY(order_date),'-',
        MONTH(order_date),'-',
        YEAR(order_date)
    ) as order_date
FROM
    Orders,
    OrderItems
WHERE
    Orders.order_num = OrderItems.order_num
    AND prod_id = 'BR01';
    
-- 4:
SELECT 
    prod_id,
    order_date
FROM
    Orders
INNER JOIN
    OrderItems ON Orders.order_num = OrderItems.order_num
WHERE
    prod_id = 'BR01';
    
-- 5:
SELECT
    cust_name,
    SUM(item_price*quantity) AS total_price
FROM
    OrderItems
INNER JOIN
    Orders ON Orders.order_num = OrderItems.order_num
INNER JOIN
    Customers ON Customers.cust_id = Orders.cust_id
GROUP BY
    cust_name
HAVING
    SUM(item_price*quantity) >= 1000;