USE sql10minutes;

-- EX1:
-- VULNERÁVEL A ALTERAÇÕES DE LAYOUT DA TABELA
INSERT INTO Customers VALUES ( 
	1000000006,
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    11111,
    'USA',
    NULL,
    NULL
); -- OBRIGATORIEDADE DE INSERÇÃO: ORDEM DAS COLUNAS NA TABELA

-- EX2:
-- RESISTENTE A ALTERAÇÕES DE LAYOUTS NA TABELA 
-- ESPECIFICA A ORDEM DAS COLUNAS PARA INSERÇÃO SEGUIDO DE OBRIGATORIEDADE:
INSERT INTO Customers (
	cust_id, 
    cust_name, 
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country, 
    cust_contact, 
    cust_email
) VALUES (
	1000000007,
    'Funny Realm',
    '777 Somewhere',
    'Heaven',
    'ST',
    77777,
    'Heaven\'s Domain',
    NULL,
    NULL
);

-- EX3: INSERÇÃO COM ORDEM DAS COLUNAS DECLARADAS DIFERENTE DA ORDEM DE CRIAÇÃO
INSERT INTO Customers (
	cust_id, 
    
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country, 
    cust_name, 
    cust_contact, 
    cust_email
) VALUES (
	1000000008,
    'Somewhere In Time',
    'Future City',
    'QF',
    01001,
    'Earth 5',
    'Time Traveler',
    NULL,
    NULL
);

-- EX4: PARCIALIDADE DE INSERÇÃO (DEPENDE DAS RESTRIÇÕES DE COLUNAS)
INSERT INTO Customers (
	cust_id, 
    cust_name, 
    cust_email
) VALUES (
	1000000009,
    'Instruments4All',
    'b.contact@instruments4all.com'
);

-- EX5: INSERÇÃO POR TABELA EXISTENTE (CRIADO: UMA TABELA E UMA LINHA DE DADOS)
INSERT INTO Customers (
	cust_id, 
    cust_name, 
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country, 
    cust_contact, 
    cust_email
) SELECT
	cust_id, 
    cust_name, 
    cust_address, 
    cust_city, 
    cust_state, 
    cust_zip, 
    cust_country, 
    cust_contact, 
    cust_email
FROM
	CustNew;
    
-- EX6.1:
-- AMBAS AS FORMAS NÃO RECRIAM AS INTEGRIDADES REFERENCIAIS DAS TABELAS COPIADAS
CREATE TABLE CustCopy (
	SELECT *
    FROM Customers
);
-- EX6.2:
CREATE TABLE 
	CustCopy AS SELECT * FROM Customers;