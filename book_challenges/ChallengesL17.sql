-- 1:
ALTER TABLE
	Vendors
ADD COLUMN
	vend_web VARCHAR(255) NULL;
    
-- 2:
UPDATE
	Vendors
SET
	vend_web = 'https://www.bearemporium.us'
WHERE
	vend_id = 'BRE02';