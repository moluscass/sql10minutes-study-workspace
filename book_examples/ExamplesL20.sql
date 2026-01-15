USE sql10minutes;

-- EX1: REVERTENDO EXCLUSÕES (ADAPTADO)
BEGIN; -- INICIA UMA TRANSAÇÃO
	DELETE FROM 
		OrdersBackup;
ROLLBACK; -- DESFAZ UMA TRANSAÇÃO

-- EX2: PROCESSANDO EXCLUSÕES (ADAPTADO)
BEGIN;
	DELETE FROM
		Orders
	WHERE
		order_num = 20010;

	DELETE FROM
		Orders
	WHERE
		order_num = 20011;
COMMIT; -- PROCESSA AS TRANSAÇÕES

-- EX3: PONTOS DE SALVAMENTO (ADAPTADO)
BEGIN;
	INSERT INTO Customers (
		cust_id,
        cust_name
    ) VALUES (
		'1000000010',
        'Toys Emporium'
    );
    
    SAVEPOINT StartOrder; -- ADICIONA UM PONTO DE SALVAMENTO
    
    INSERT INTO Orders (
		order_num,
        order_date,
        cust_id
    ) VALUES (
		'20010',
        CURDATE(),
        '1000000010'
    );
    
    ROLLBACK TO StartOrder; -- RETORNA AO PONTO DE SALVAMENTO INDICADO
COMMIT; -- CONFIRMA E FECHA UMA TRANSAÇÃO