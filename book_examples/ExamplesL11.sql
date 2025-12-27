-- Ex1 SUBQUERY STRUCTURE:
SELECT --STEP 1
    order_num
FROM
    OrderItems
WHERE
    prod_id = 'RGAN01';
    
SELECT --STEP 2
    cust_id
FROM
    Orders
WHERE
    order_num IN (20007,20008)-- RESULT OF STEP 1
    
-- WHOLE SUBQUERY:
SELECT -- STEP 2
    cust_id
FROM
    Orders
WHERE
    order_num IN (SELECT -- STEP 1
                        order_num --FK ON Orders TABLE
                    FROM
                        OrderItems
                    WHERE
                        prod_id = 'RGAN01');
                        
 
-- Ex2 MORE SUBQUERYS:
SELECT -- QUERY 3 (MAIN)
    cust_name,
    cust_contact
FROM
    Customers
WHERE
    cust_id IN (
        SELECT -- QUERY 2
            cust_id -- FK ON Customers TABLE
        FROM
            Orders
        WHERE
            order_num IN (
                SELECT -- QUERY 1
                    order_num -- FK ON Orders TABLE
                FROM
                    OrderItems
                WHERE
                    quantity > 100));

--Ex3 SUBQUERY AS CALC FIELDS:
SELECT
    cust_name,
    cust_state,
    (SELECT
        COUNT(*)
    FROM
        Orders
    WHERE
        Orders.cust_id = Customers.cust_id) AS orders
        -- SUBQUERY AS CALCFIELD HAS PERMISSION FOR 
        -- USE FIELDS OUTSIDE THE SUBQUERY
FROM
    Customers
ORDER BY
    cust_name;

--Ex4: SUBQUERY AS CALCFIELD W/ AMBIGUOUS COMPARATION FIELDS ERROR
SELECT
    cust_name,
    cust_state,
    (SELECT
        COUNT(*)
    FROM
        Orders
    WHERE
        cust_id = cust_id) AS orders
        -- AMBIGUOUS FIELDS FOR COMPARATION
FROM
    Customers
ORDER BY
    cust_name;