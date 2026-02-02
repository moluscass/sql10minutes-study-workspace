DELIMITER $$
CREATE PROCEDURE pc_cursor()
BEGIN
	DECLARE c_id CHAR(10);
    DECLARE c_name CHAR(50);
    DECLARE c_ended INT DEFAULT 0;
    
	DECLARE 
		CustCursor CURSOR FOR
	SELECT
		cust_id,
        cust_name
	FROM
		Customers
	WHERE
		cust_email IS NOT NULL;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET c_ended = 1;
        
	OPEN CustCursor;
    
    read_loop: LOOP
    
		FETCH 
			CustCursor 
		INTO 
			c_id,
			c_name;
		IF c_ended = 1 THEN
			LEAVE read_loop;
		END IF;
        
		SELECT
        CONCAT('id cliente: ',c_id,' ' ,'nome cliente: ',c_name) AS result;
        
	END LOOP read_loop;
    
    CLOSE CustCursor;
END$$
DELIMITER ;

CALL pc_cursor();
