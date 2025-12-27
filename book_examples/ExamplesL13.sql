USE sql10minutes;

-- EX1: USANDO ALIAS PARA UMA MELHOR REFERENCIACAO COM TABELAS
SELECT
	C.cust_name,
	C.cust_contact -- REDUZ O NOME DA TABELA NAS REFERENCIAS EM SELECT
FROM
	Customers AS C,
    Orders AS O,
    OrderItems AS OI
WHERE
	C.cust_id=O.cust_id -- REDUZ O NOME DA TABELA NAS REFERENCIAS EM WHERE
    AND OI.order_num=O.order_num
    AND OI.prod_id='RGAN01';

-- EXEMPLO ANTERIOR USANDO INNER JOINS:
SELECT
	C.cust_name,
	C.cust_contact
FROM
	Orders AS O
INNER JOIN
	Customers AS C ON(C.cust_id=O.cust_id)
INNER JOIN
	OrderItems AS OI ON(OI.order_num=O.order_num)
WHERE
	OI.prod_id='RGAN01';
    
-- EX2: AUTOJUNÇAO:
SELECT
	C1.cust_id,
	C1.cust_name, -- ADAPTADO
    C1.cust_contact,
    C1.cust_email
FROM -- ALIAS PERMITE DUAS INSTANCIAS DA MESMA TABELA:
	Customers AS C1,
	Customers AS C2
WHERE
	C1.cust_name=C2.cust_name -- VINCULA O NOME DA EMPRESA DE JIM JONES AOS RESULTADOS DA TABELA C1
	AND C2.cust_contact = 'Jim Jones';

-- EX3: JUNÇÔES NATURAIS:
SELECT
	C.*,
    O.order_num,
    O.order_date,
    OI.prod_id,
    OI.quantity,
    OI.item_price
FROM
	Customers AS C,
    Orders AS O,
    OrderItems AS OI
WHERE
	C.cust_id=O.cust_id
    AND OI.order_num=O.order_num
    AND prod_id = 'RGAN01';

-- EX4: JUNÇÔES EXTERNAS
-- TODAS AS LINHAS DA TABELA A ESQUERDA E NÂO RELACIONADAS A DIREITA:
SELECT
	C.cust_name,
    O.order_num
FROM
	Customers AS C
LEFT OUTER JOIN
	Orders AS O ON(C.cust_id=O.cust_id);
    
-- EX4: JUNÇÔES EXTERNAS
-- TODAS AS LINHAS DA TABELA A DIREITA E NÂO RELACIONADAS A ESQUERDA:
SELECT
	C.cust_name,
    O.order_num
FROM
	Customers AS C
RIGHT OUTER JOIN
	Orders AS O ON(C.cust_id=O.cust_id);

-- EX5: JUNÇÔES INTERNAS + AGREGAÇÔES
SELECT
	C.cust_id,
    COUNT(O.order_num) AS order_quantity
FROM
	Customers AS C
INNER JOIN
	Orders AS O ON C.cust_id=O.cust_id
GROUP BY
	C.cust_id;

-- EX5: JUNÇÔES EXTERNAS + AGREGAÇÔES - ORIGINAL
SELECT
	C.cust_id,
    COUNT(O.order_num) AS order_quantity
FROM
	Customers AS C
LEFT OUTER JOIN
	Orders AS O ON C.cust_id=O.cust_id
GROUP BY
	C.cust_id;
    
-- EX5: JUNÇÔES EXTERNAS + AGREGAÇÔES - ADAPTADO
SELECT
	C.cust_id,
    COUNT(O.order_num) AS order_quantity,
    SUM(OI.quantity*OI.item_price) AS total_order_price
FROM
	Customers AS C
LEFT OUTER JOIN
	Orders AS O ON C.cust_id=O.cust_id
LEFT OUTER JOIN
	OrderItems AS OI ON O.order_num=OI.order_num
GROUP BY
	C.cust_id
HAVING
	SUM(OI.quantity*OI.item_price) > 1500;