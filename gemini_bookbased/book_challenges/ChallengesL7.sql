-- 1:
SELECT -- AS: NOVA NOMECLATURA DA COLUNA (TEMPO DE EXECUÇÃO)
    vend_id AS "ID FORNECEDOR",
    vend_name AS "NOME FORNECEDOR",
    vend_address AS "END FORNECEDOR",
    vend_city AS "CIDADE FORNECEDOR"
FROM 
    Vendors
ORDER BY 
    vend_name;

-- 2:
SELECT 
    prod_id AS "ID PRODUTO",
    prod_name AS "NOME PRODUTO",
    prod_price AS "PREÇO UNITÁRIO",
    prod_price*0.9 AS "PREÇO VENDAS"
FROM 
    Products;