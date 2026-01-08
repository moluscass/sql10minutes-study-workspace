USE sql10minutes;

-- 1: CRIANDO TABELA
-- CLAUSULA		NOME_TABELA
CREATE TABLE ProductsBackup (
--  NOME        TIPO_DADO       RESTRIÇÃO
	prod_id		CHAR(10)		NOT NULL,
    vend_id		CHAR(10)		NOT NULL,
    prod_name	CHAR(254)		NOT NULL,
    prod_price	DECIMAL(8,2)	NOT NULL,
	prod_desc	VARCHAR(254)	NULL
);
    
-- 2: VALORES NÂO NULOS
CREATE TABLE OrdersCopy (
	order_num	INTEGER 	NOT NULL,
    order_date	DATETIME	NOT NULL,
    cust_id		CHAR(10)	NOT NULL
);

-- 3: NULOS E NÂO NULOS    
CREATE TABLE VendorsCopy (
	vend_id			CHAR(10) 	NOT NULL,
    vend_name		CHAR(50) 	NOT NULL,
    vend_address	CHAR(50)	,
    vend_city		CHAR(50)	,
    vend_state		CHAR(5)		,
    vend_zip		CHAR(10)	,
    vend_country	CHAR(50)
);

-- 4: VALORES PADRÂO
CREATE TABLE OrderItemsCopy (
	order_num 		INT 		NOT NULL,
	order_item		INT			NOT NULL,
	prod_id			CHAR(10)	NOT NULL,
	quantity		INT 		DEFAULT 1, -- VALOR PADRÂO QUANDO DEIXADO EM BRANCO
	item_price		DEC(8,2)	NOT NULL
);

-- 5: ATUALIZAR TABELAS (ADICIONAR COLUNA)
ALTER TABLE
	Vendors
ADD COLUMN 
	vend_phones CHAR(10);

-- EXTRA: MODIFICAR COLUNA (EXCETO RESTRIÇÔES)
ALTER TABLE
	Vendors
MODIFY COLUMN
	vend_phone CHAR(10);
    
-- EXTRA: RENOMEAR COLUNA
ALTER TABLE
	Vendors
RENAME COLUMN
	vend_phones TO vend_phone;

-- 6: APAGAR COLUNA
ALTER TABLE
	Vendors
DROP COLUMN
	vend_phone;
    
-- EXTRA: RENOMEAR TABELA
RENAME TABLE
	VendorsCopy TO VendorsBackup;
    
-- 7: APAGANDO TABELAS
DROP TABLE
	OrdersCopy,
    ProductsBackup,
    VendorsBackup;