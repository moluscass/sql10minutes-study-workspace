USE sql10minutes;

-- EX1: CONSULTAS COMBINADAS - UNION
SELECT  -- CONSULTA 1
	c.cust_name,
    c.cust_contact,
    c.cust_email
FROM
	Customers AS c
WHERE
	c.cust_state IN('IL','IN','MI')
UNION -- CLAUSULA DE UNIÃO // FUNCIONA AO POSSUIR OS MESMOS CAMPOS NAS CONSULTAS
SELECT -- CONSULTA 2
	c.cust_name,
    c.cust_contact,
    c.cust_email
FROM
	Customers AS c
WHERE
	c.cust_name = 'Fun4All'
ORDER BY
	cust_contact;
    
-- EX2: CONSULTAS COMBINADAS - WHERE
SELECT  -- CONSULTA 1
	c.cust_name,
    c.cust_contact,
    c.cust_email
FROM
	Customers AS c
WHERE
	c.cust_state IN('IL','IN','MI')
    OR c.cust_name = 'Fun4All'; -- ATUA COMO A SEGUNDA CONSULTA (POSSUEM OS MESMOS CAMPOS DE RETORNO)
    
-- EX4: CONSULTAS COMBINADAS - UNION ALL (RETORNA OCORRÊNCIAS REPETIDAS)
SELECT
	c.cust_name,
    c.cust_contact,
    c.cust_email
FROM
	Customers AS c
WHERE
	c.cust_state IN('IL','IN','MI')
UNION ALL -- INCLUI OCORRÊNCIAS REPETIDAS
SELECT
	c.cust_name,
    c.cust_contact,
    c.cust_email
FROM
	Customers AS c
WHERE
	c.cust_name = 'Fun4All'
ORDER BY -- UM ORDER BY POR UNIÃO COMPLETA
	cust_contact;

