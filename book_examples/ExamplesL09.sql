--AVG(): pure
    SELECT
        AVG(item_price) AS avg_price
    FROM
        OrderItems;
        
--AVG(): w/ conditions
    SELECT
        AVG(item_price) AS avg_price
    FROM
        OrderItems
    WHERE
        prod_id = 'BR03';
        
--COUNT(): specific column
    SELECT
        COUNT(order_num)
    FROM
        OrderItems;

--COUNT(): all columns
    SELECT
        COUNT(*)
    FROM
        OrderItems;
    
--COUNT(): distinct values
    SELECT
        COUNT(
            DISTINCT(order_num)
        ) AS exclusive_orders
    FROM 
        OrderItems;

--SUM(): pure
    SELECT
        SUM(item_price) AS sum_price
    FROM
        OrderItems;

--SUM(): w/ calc
    SELECT
        SUM(item_price*quantity) AS total_price
    FROM
        OrderItems
    WHERE
        order_num = '20005'

--COUNT(), MAX(), MIN(): pure
    SELECT
        COUNT(prod_id) AS total_prod,
        MAX(prod_price) AS max_price,
        MIN(prod_price) AS min_price
    FROM
        Products
    WHERE
        vend_id = 'BRS01';

--MAX(), MIN(): strings
    SELECT
        MAX(prod_name),
        MIN(prod_name)
    FROM
        Products;