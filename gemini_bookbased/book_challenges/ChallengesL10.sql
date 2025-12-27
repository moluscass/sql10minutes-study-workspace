-- 1:
SELECT 
    order_num,
    COUNT(*) AS order_lines -- AGRUPA TOTALMENTE AS COLUNAS EM CONTAGEM (INCLUINDO NULOS)
FROM 
    OrderItems 
GROUP BY -- SEPARA O AGRUPAMENTO EM PEQUENOS GRUPOS COM BASE EM UMA CONDIÇÃO (COLUNA)
    order_num
ORDER BY 
    order_lines;
    
-- 2:
SELECT 
    vend_id,
    MIN(prod_price) AS cheapest_item -- RETORNA O MINIMO VALOR DE TODA A COLUNA
FROM 
    Products
GROUP BY
    vend_id
ORDER BY
    cheapest_item;
    
-- 3:
SELECT
    order_num,
    SUM(quantity) AS quantity -- SOMA TODOS OS VALORES NÚMERICOS DE UMA COLUNA
FROM 
    OrderItems
GROUP BY -- SEPARA O RETORNO PARA CADA GRUPO DE DADOS
    order_num
HAVING -- FILTRA OS GRUPOS COM BASE EM UMA CONDIÇÃO
    SUM(quantity) >= 100;

-- 4:
SELECT
    order_num,
    SUM(quantity*item_price)
FROM 
    OrderItems
GROUP BY 
    order_num
HAVING 
    SUM(quantity*item_price) >= 1000
ORDER BY
    order_num;
    
-- 5:
SELECT 
    order_num,
    COUNT(*) AS items
FROM 
    OrderItems
GROUP BY
    order_num -- != items
HAVING
    COUNT(*) >= 3 
ORDER BY
    items,
    order_num;
    
-- HAVING REGRA: NÃO UTILIZA NOMES DE COLUNAS, MAS A FUNÇÃO DE AGREGAÇÃO