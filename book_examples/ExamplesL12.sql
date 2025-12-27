-- Ex1: EQUIJOIN (USING 'WHERE' CLAUSULE)
SELECT
    vend_name,
    prod_name,
    prod_price
FROM -- MORE THAN 2 TABLES IN 'FROM' CLAUSULE
    Vendors,
    Products
WHERE
    Products.vend_id = Vendors.vend_id; -- EQUALITY BETWEEN TABLES SEMANTICKEYPHRASETABLE
    
-- Ex2: CROSSJOIN (MISSES 'WHERE' CLAUSULE)
SELECT -- RETURN: TLn1 * TLn2
    vend_name,
    prod_name,
    prod_price
FROM
    Vendors,
    Products;
    
-- Ex3: INNERJOIN (RELEASES 'WHERE' CLAUSULE)
SELECT
    vend_name,
    prod_name,
    prod_price
FROM
    Vendors
INNER JOIN 
    Products ON Vendors.vend_id = Products.vend_id;

-- Ex4: MULTIJOINS W/ EQUIJOIN
SELECT
    prod_name,
    order_item,
    quantity,
    vend_name
FROM 
    OrderItems,
    Products,
    Vendors
WHERE
    OrderItems.prod_id = Products.prod_id
    AND Vendors.vend_id = Products.vend_id
    AND order_num = 20007;

-- Ex4: MULTIJOINS W/ INNERJOIN
SELECT
    prod_name,
    order_item,
    quantity,
    vend_name
FROM 
    OrderItems
    INNER JOIN
        Products ON Products.prod_id = OrderItems.prod_id
    INNER JOIN
        Vendors ON Vendors.vend_id = Products.vend_id
WHERE
    order_num = 20007;