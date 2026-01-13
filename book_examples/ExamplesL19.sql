-- EX1: CRIANDO A PROCEDURE COM RETORNO

DELIMITER $$ -- TROCA O DELIMITADOR DE ESCOPO
CREATE PROCEDURE MailingListCount ( -- DECLARAÇÃO DA PROCEDURE
--  RETORNO  NOME    	TIPO
	OUT 	 ListCount  INT -- PARÂMETRO DA PROCEDURE
) 
BEGIN
	DECLARE 
		count_cmail INT; -- VARIÁVEL LOCAL
    SELECT 
		COUNT(*) INTO count_cmail -- INSERÇÂO DA CONSULTA NA VARIÁVEL LOCAL
	FROM
		Customers
	WHERE
		cust_email IS NOT NULL;
    SET
		ListCount = count_cmail; -- PARÂMETRO == VARIÁVEL LOCAL
END $$
DELIMITER ;

-- EX2: INVOCANDO A PROCEDURE
-- 					  VARIÁVEL DE USUÁRIO (CONTÉM O RETORNO)
CALL MailingListCount(@countm); -- INVOCAÇÂO DA PROCEDURE
SELECT @countm; -- CONSULTA DO VALOR CONTIDO NO RETORNO

-- EX3:
DELIMITER $$
CREATE PROCEDURE NewOrder (
	IN 		c_id 	CHAR(10),
    OUT 	o_num 	INT
)
BEGIN
	DECLARE num_order INT;
    
    SET num_order = (SELECT -- ADICIONANDO À VARIÁVEL O ÚLTIMO VALOR REGISTRADO 
						MAX(order_num)
					FROM
						Orders);
	
	SET num_order = num_order+1; -- INCREMENTANDO VALOR PARA FAZER NOVA ENTRADA ÚNICA
    
    INSERT INTO Orders (
        order_num,
        order_date,
        cust_id
	) VALUES (
		num_order,
        CURDATE(),
        c_id
    );
    
    SET o_num = num_order;
END$$
DELIMITER ;

CALL NewOrder(1000000001, @n_ordernum);
SELECT @n_ordernum;