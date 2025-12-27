USE futebolscouting;

-- 1: Calcule o IMC (Peso / Altura²) de cada jogador, liste o nome, a posição e o IMC. Filtre apenas os atletas com IMC acima de 25 para revisão da dieta.
SELECT
	j.nome,
    j.posicao,
    TRUNCATE(j.peso_kg/(j.altura_m*2),2) AS imc
FROM
	jogadores AS j
WHERE
	j.peso_kg/(j.altura_m*2) BETWEEN 18.5 AND 25
 ORDER BY
	j.nome;
    
-- 2: Calcule a média de idade dos jogadores agrupada pela posição que ocupam em campo.
SELECT
	j.posicao,
    AVG(j.idade) AS media_idade
FROM
	jogadores AS j
GROUP BY
	j.posicao;
    
-- 3: Liste o nome do jogador, o nome do clube e o salário mensal, mas apenas para jogadores que atuam em clubes da 'Premier League'.
SELECT
	j.nome,
    cb.nome_clube,
    co.salario_mensal_euros
FROM
	contratos AS co
INNER JOIN
	jogadores AS j ON j.id_jogador = co.id_jogador
INNER JOIN
	clubes AS cb ON cb.id_clube = co.id_clube
WHERE
	cb.liga IN('Premier League')
ORDER BY
    cb.nome_clube,
    co.salario_mensal_euros;
    
-- 4: Identifique o nome dos jogadores que marcaram mais golos do que a média de golos de todos os jogadores da base de dados.
SELECT
	j.nome,
    j.posicao,
    d.golos
FROM
	jogadores AS j
INNER JOIN
	desempenho as d ON d.id_jogador = j.id_jogador
WHERE
	d.golos > (SELECT
					AVG(golos)
				FROM
					desempenho)
ORDER BY
	d.golos;
    
-- 5: Gere um relatório que mostre o Nome do Jogador, o Nome do Clube em que joga e a Marca que o patrocina (Nike, Adidas, etc.).
SELECT
	j.nome AS nome_jogador,
	cb.nome_clube,
    p.marca
FROM
	jogadores AS j
INNER JOIN
	contratos AS co ON(co.id_jogador=j.id_jogador)
INNER JOIN
	clubes AS cb ON(co.id_clube=cb.id_clube)
INNER JOIN
	patrocinios AS p ON(p.id_jogador=j.id_jogador)
ORDER BY
	cb.nome_clube,
	p.marca;

-- 6: Identifique os jogadores cujos contratos terminam até o final de Junho de 2024 (Data limite: 2024-06-30). Útil para negociações a custo zero.
SELECT
	j.nome,
    co.data_fim_contrato
FROM
	jogadores AS j,
    contratos AS co
WHERE
	j.id_jogador=co.id_jogador
		AND co.data_fim_contrato = '24-06-30';
        
-- 7: Liste os nomes dos clubes que possuem jogadores que, somados, acumulam mais de 10 cartões amarelos nesta época.
SELECT
	cb.nome_clube,
    SUM(ds.cartoes_amarelos) AS total_cartoes_amarelos
FROM
	clubes AS cb
INNER JOIN
	contratos AS co ON(cb.id_clube=co.id_clube)
INNER JOIN
	jogadores AS j ON(j.id_jogador=co.id_jogador)
INNER JOIN
	desempenho AS ds ON(ds.id_jogador=j.id_jogador)
GROUP BY
	cb.nome_clube
HAVING
	SUM(ds.cartoes_amarelos) > 10
ORDER BY
	total_cartoes_amarelos;
    
-- 8: Calcule a métrica de "Minutos por Golo" (Minutos Jogados / Golos) para todos os atacantes. Nomeie a coluna como 'eficiencia_minutos'.
SELECT
	j.nome,
    d.golos,
    TRUNCATE(d.minutos_jogados/d.golos,2) AS eficiencia_minutos
FROM
	jogadores AS j,
    desempenho AS d
WHERE
	j.id_jogador=d.id_jogador
		AND j.posicao != 'Goleiro';
        
-- 9: Liste todos os jogadores que NÃO são patrocinados por marcas que comecem com a letra 'N' (ex: Nike).
SELECT
	j.nome,
    p.marca
FROM
	jogadores AS j,
    patrocinios AS p
WHERE
	p.id_jogador=j.id_jogador
		AND p.marca NOT LIKE 'N%'
ORDER BY
	p.marca;
    
-- 10: Encontre os jogadores que possuem um peso superior à média de peso de todos os jogadores da sua mesma nacionalidade.
SELECT
	j.nome,
    j.nacionalidade,
    j.peso_kg
FROM
	jogadores AS j
WHERE
	j.peso_kg > (SELECT
					AVG(peso_kg)
				 FROM
					jogadores
			     WHERE
					j.nacionalidade=nacionalidade)
ORDER BY
	j.nacionalidade;
    
-- 11: Liste todos os jogadores que nunca tiveram um registo na tabela de departamento médico.
SELECT
	j.nome
FROM
	jogadores AS j
LEFT OUTER JOIN
    departamento_medico AS dm ON(j.id_jogador = dm.id_jogador);

-- 12: Para cada clube, mostre o nome e que percentagem do seu orçamento de transferência seria gasta se comprassem um jogador pela sua cláusula de rescisão (clausula / orcamento * 100).
SELECT
	cb.nome_clube,
    CONCAT(
		TRUNCATE(
			(co.clausula_rescisao_milhoes/cb.orcamento_transferencia_milhoes)*100,2),'%') AS orcamento_j_recisao
FROM
	clubes AS cb,
    contratos AS co
-- INNER JOIN contratos AS co ON(co.id_clube=cb.id_clube): EXIBE APENAS OS CLUBES DETENTORES DOS JOGADORES
INNER JOIN
    jogadores AS j ON(j.id_jogador=co.id_jogador)
WHERE
	j.nome LIKE('%Haaland%')
		AND (co.clausula_rescisao_milhoes/cb.orcamento_transferencia_milhoes)*100 < 70
ORDER BY
	orcamento_j_recisao;

-- 13: Procure jogadores que sejam do 'Ataque', com 'Pé Dominante' Esquerdo (E) e que tenham uma 'Altura' superior a 1.80m.
SELECT
	j.nome,
    j.altura_m
FROM
	jogadores AS j
WHERE
	j.altura_m > 1.80
		AND j.pe_dominante = 'E'
        AND j.posicao = 'Ataque';
        
-- 14: Apresente uma lista única e por ordem alfabética de todas as nacionalidades presentes nos clubes da 'La Liga'.
SELECT
	DISTINCT nacionalidade
FROM
	jogadores
ORDER BY
	nacionalidade;
    
-- 15: Conte quantos jogadores cada marca de material desportivo (Nike, Adidas, etc.) patrocina. Ordene da marca com mais atletas para a que tem menos.
SELECT
	marca,
	COUNT(*) AS total_patrocinio
FROM
	patrocinios
GROUP BY
	marca
ORDER BY
	total_patrocinio DESC;
    
-- 16: Liste o nome dos jogadores e o número de assistências para todos aqueles que fizeram mais de 10 assistências e jogam no 'Meio'.
SELECT
	j.nome,
    d.assistencias
FROM
	jogadores AS j
INNER JOIN
	desempenho AS d ON(j.id_jogador=d.id_jogador)
WHERE
	j.posicao = 'Meio'
		AND d.assistencias > 10;
        
-- 17: Selecione os atletas que têm idade entre 25 e 28 anos e que já jogaram mais de 25 partidas nesta época.
SELECT
	j.nome,
    j.idade,
    d.partidas_jogadas
FROM
	jogadores AS j
INNER JOIN
	desempenho AS d ON(j.id_jogador=d.id_jogador)
WHERE
	j.idade BETWEEN 25 AND 28
		AND d.partidas_jogadas > 25
ORDER BY
	j.idade;
    
-- 18: Identifique os clubes que possuem pelo menos um jogador do 'Meio' que tenha marcado mais de 5 golos.
SELECT
	j.nome,
    d.golos
FROM
	jogadores AS j
INNER JOIN
	desempenho AS d ON(j.id_jogador=d.id_jogador)
WHERE
	j.posicao = 'Meio'
		AND d.golos > 5
ORDER BY
	d.golos;
    
-- 19: Liste os nomes e salários dos jogadores que atuam no 'Benfica', 'Sporting CP' ou 'FC Porto'.
SELECT
	j.nome,
    co.salario_mensal_euros
FROM
	jogadores AS j
INNER JOIN
	contratos AS co ON(co.id_jogador=j.id_jogador)
INNER JOIN
	clubes AS cb ON(co.id_clube=cb.id_clube)
WHERE
	cb.nome_clube IN('Benfica','Sporting CP','FC Porto')
ORDER BY
	co.salario_mensal_euros;
    
-- 20: Calcule o valor total de patrocínios anuais agrupado pela 'Liga' em que o jogador atua
SELECT
	cb.liga,
	SUM(valor_anual_euros) AS total_patrocinio
FROM
	patrocinios AS p
INNER JOIN
	jogadores AS j ON(p.id_jogador=j.id_jogador)
INNER JOIN
	contratos AS c ON(c.id_jogador=j.id_jogador)
INNER JOIN
	clubes AS cb ON(cb.id_clube=c.id_clube)
GROUP BY
	cb.liga;
    
-- 21: Calcule a média de dias que os jogadores levam para recuperar das lesões (data_retorno - data_inicio) agrupado pelo 'Tipo de Lesão'
SELECT
	dm.tipo_lesao,
    COUNT(dm.tipo_lesao) AS recorrencias,
    AVG(
		DATEDIFF(dm.data_retorno_prevista,dm.data_inicio)) AS media_recuperacao_dias
FROM
	jogadores AS j,
    departamento_medico AS dm
WHERE
	j.id_jogador=dm.id_jogador
		AND j.nome LIKE '%%'
GROUP BY
	dm.tipo_lesao;

-- 22: Descubra qual a média de salário mensal para cada 'Posição' dentro de cada 'Liga' (ex: Atacantes na Premier League vs Atacantes na La Liga)
SELECT
	cb.liga,
	AVG(co.salario_mensal_euros)
FROM
	contratos AS co,
    clubes AS cb,
    jogadores AS J
WHERE
	cb.id_clube=co.id_clube
    
		AND j.posicao = 'Meio'
GROUP BY
	cb.liga;
;USE futebolscouting;

-- 1: Calcule o IMC (Peso / Altura²) de cada jogador, liste o nome, a posição e o IMC. Filtre apenas os atletas com IMC acima de 25 para revisão da dieta.
SELECT
	j.nome,
    j.posicao,
    TRUNCATE(j.peso_kg/(j.altura_m*2),2) AS imc
FROM
	jogadores AS j
WHERE
	j.peso_kg/(j.altura_m*2) BETWEEN 18.5 AND 25
 ORDER BY
	j.nome;
    
-- 2: Calcule a média de idade dos jogadores agrupada pela posição que ocupam em campo.
SELECT
	j.posicao,
    AVG(j.idade) AS media_idade
FROM
	jogadores AS j
GROUP BY
	j.posicao;
    
-- 3: Liste o nome do jogador, o nome do clube e o salário mensal, mas apenas para jogadores que atuam em clubes da 'Premier League'.
SELECT
	j.nome,
    cb.nome_clube,
    co.salario_mensal_euros
FROM
	contratos AS co
INNER JOIN
	jogadores AS j ON j.id_jogador = co.id_jogador
INNER JOIN
	clubes AS cb ON cb.id_clube = co.id_clube
WHERE
	cb.liga IN('Premier League')
ORDER BY
    cb.nome_clube,
    co.salario_mensal_euros;
    
-- 4: Identifique o nome dos jogadores que marcaram mais golos do que a média de golos de todos os jogadores da base de dados.
SELECT
	j.nome,
    j.posicao,
    d.golos
FROM
	jogadores AS j
INNER JOIN
	desempenho as d ON d.id_jogador = j.id_jogador
WHERE
	d.golos > (SELECT
					AVG(golos)
				FROM
					desempenho)
ORDER BY
	d.golos;
    
-- 5: Gere um relatório que mostre o Nome do Jogador, o Nome do Clube em que joga e a Marca que o patrocina (Nike, Adidas, etc.).
SELECT
	j.nome AS nome_jogador,
	cb.nome_clube,
    p.marca
FROM
	jogadores AS j
INNER JOIN
	contratos AS co ON(co.id_jogador=j.id_jogador)
INNER JOIN
	clubes AS cb ON(co.id_clube=cb.id_clube)
INNER JOIN
	patrocinios AS p ON(p.id_jogador=j.id_jogador)
ORDER BY
	cb.nome_clube,
	p.marca;

-- 6: Identifique os jogadores cujos contratos terminam até o final de Junho de 2024 (Data limite: 2024-06-30). Útil para negociações a custo zero.
SELECT
	j.nome,
    co.data_fim_contrato
FROM
	jogadores AS j,
    contratos AS co
WHERE
	j.id_jogador=co.id_jogador
		AND co.data_fim_contrato = '24-06-30';
        
-- 7: Liste os nomes dos clubes que possuem jogadores que, somados, acumulam mais de 10 cartões amarelos nesta época.
SELECT
	cb.nome_clube,
    SUM(ds.cartoes_amarelos) AS total_cartoes_amarelos
FROM
	clubes AS cb
INNER JOIN
	contratos AS co ON(cb.id_clube=co.id_clube)
INNER JOIN
	jogadores AS j ON(j.id_jogador=co.id_jogador)
INNER JOIN
	desempenho AS ds ON(ds.id_jogador=j.id_jogador)
GROUP BY
	cb.nome_clube
HAVING
	SUM(ds.cartoes_amarelos) > 10
ORDER BY
	total_cartoes_amarelos;
    
-- 8: Calcule a métrica de "Minutos por Golo" (Minutos Jogados / Golos) para todos os atacantes. Nomeie a coluna como 'eficiencia_minutos'.
SELECT
	j.nome,
    d.golos,
    TRUNCATE(d.minutos_jogados/d.golos,2) AS eficiencia_minutos
FROM
	jogadores AS j,
    desempenho AS d
WHERE
	j.id_jogador=d.id_jogador
		AND j.posicao != 'Goleiro';
        
-- 9: Liste todos os jogadores que NÃO são patrocinados por marcas que comecem com a letra 'N' (ex: Nike).
SELECT
	j.nome,
    p.marca
FROM
	jogadores AS j,
    patrocinios AS p
WHERE
	p.id_jogador=j.id_jogador
		AND p.marca NOT LIKE 'N%'
ORDER BY
	p.marca;
    
-- 10: Encontre os jogadores que possuem um peso superior à média de peso de todos os jogadores da sua mesma nacionalidade.
SELECT
	j.nome,
    j.nacionalidade,
    j.peso_kg
FROM
	jogadores AS j
WHERE
	j.peso_kg > (SELECT
					AVG(peso_kg)
				 FROM
					jogadores
			     WHERE
					j.nacionalidade=nacionalidade)
ORDER BY
	j.nacionalidade;
    
-- 11: Liste todos os jogadores que nunca tiveram um registo na tabela de departamento médico.
SELECT
	j.nome
FROM
	jogadores AS j
LEFT OUTER JOIN
    departamento_medico AS dm ON(j.id_jogador = dm.id_jogador);

-- 12: Para cada clube, mostre o nome e que percentagem do seu orçamento de transferência seria gasta se comprassem um jogador pela sua cláusula de rescisão (clausula / orcamento * 100).
SELECT
	cb.nome_clube,
    CONCAT(
		TRUNCATE(
			(co.clausula_rescisao_milhoes/cb.orcamento_transferencia_milhoes)*100,2),'%') AS orcamento_j_recisao
FROM
	clubes AS cb,
    contratos AS co
-- INNER JOIN contratos AS co ON(co.id_clube=cb.id_clube): EXIBE APENAS OS CLUBES DETENTORES DOS JOGADORES
INNER JOIN
    jogadores AS j ON(j.id_jogador=co.id_jogador)
WHERE
	j.nome LIKE('%Haaland%')
		AND (co.clausula_rescisao_milhoes/cb.orcamento_transferencia_milhoes)*100 < 70
ORDER BY
	orcamento_j_recisao;

-- 13: Procure jogadores que sejam do 'Ataque', com 'Pé Dominante' Esquerdo (E) e que tenham uma 'Altura' superior a 1.80m.
SELECT
	j.nome,
    j.altura_m
FROM
	jogadores AS j
WHERE
	j.altura_m > 1.80
		AND j.pe_dominante = 'E'
        AND j.posicao = 'Ataque';
        
-- 14: Apresente uma lista única e por ordem alfabética de todas as nacionalidades presentes nos clubes da 'La Liga'.
SELECT
	DISTINCT nacionalidade
FROM
	jogadores
ORDER BY
	nacionalidade;
    
-- 15: Conte quantos jogadores cada marca de material desportivo (Nike, Adidas, etc.) patrocina. Ordene da marca com mais atletas para a que tem menos.
SELECT
	marca,
	COUNT(*) AS total_patrocinio
FROM
	patrocinios
GROUP BY
	marca
ORDER BY
	total_patrocinio DESC;
    
-- 16: Liste o nome dos jogadores e o número de assistências para todos aqueles que fizeram mais de 10 assistências e jogam no 'Meio'.
SELECT
	j.nome,
    d.assistencias
FROM
	jogadores AS j
INNER JOIN
	desempenho AS d ON(j.id_jogador=d.id_jogador)
WHERE
	j.posicao = 'Meio'
		AND d.assistencias > 10;
        
-- 17: Selecione os atletas que têm idade entre 25 e 28 anos e que já jogaram mais de 25 partidas nesta época.
SELECT
	j.nome,
    j.idade,
    d.partidas_jogadas
FROM
	jogadores AS j
INNER JOIN
	desempenho AS d ON(j.id_jogador=d.id_jogador)
WHERE
	j.idade BETWEEN 25 AND 28
		AND d.partidas_jogadas > 25
ORDER BY
	j.idade;
    
-- 18: Identifique os clubes que possuem pelo menos um jogador do 'Meio' que tenha marcado mais de 5 golos.
SELECT
	j.nome,
    d.golos
FROM
	jogadores AS j
INNER JOIN
	desempenho AS d ON(j.id_jogador=d.id_jogador)
WHERE
	j.posicao = 'Meio'
		AND d.golos > 5
ORDER BY
	d.golos;
    
-- 19: Liste os nomes e salários dos jogadores que atuam no 'Benfica', 'Sporting CP' ou 'FC Porto'.
SELECT
	j.nome,
    co.salario_mensal_euros
FROM
	jogadores AS j
INNER JOIN
	contratos AS co ON(co.id_jogador=j.id_jogador)
INNER JOIN
	clubes AS cb ON(co.id_clube=cb.id_clube)
WHERE
	cb.nome_clube IN('Benfica','Sporting CP','FC Porto')
ORDER BY
	co.salario_mensal_euros;
    
-- 20: Calcule o valor total de patrocínios anuais agrupado pela 'Liga' em que o jogador atua
SELECT
	cb.liga,
	SUM(valor_anual_euros) AS total_patrocinio
FROM
	patrocinios AS p
INNER JOIN
	jogadores AS j ON(p.id_jogador=j.id_jogador)
INNER JOIN
	contratos AS c ON(c.id_jogador=j.id_jogador)
INNER JOIN
	clubes AS cb ON(cb.id_clube=c.id_clube)
GROUP BY
	cb.liga;
    
-- 21: Calcule a média de dias que os jogadores levam para recuperar das lesões (data_retorno - data_inicio) agrupado pelo 'Tipo de Lesão'
SELECT
	dm.tipo_lesao,
    COUNT(dm.tipo_lesao) AS recorrencias,
    AVG(
		DATEDIFF(dm.data_retorno_prevista,dm.data_inicio)) AS media_recuperacao_dias
FROM
	jogadores AS j,
    departamento_medico AS dm
WHERE
	j.id_jogador=dm.id_jogador
		AND j.nome LIKE '%%'
GROUP BY
	dm.tipo_lesao;

-- 22: Descubra qual a média de salário mensal para cada 'Posição' dentro de cada 'Liga' (ex: Atacantes na Premier League vs Atacantes na La Liga)
SELECT
	cb.liga,
    j.posicao,
    CONCAT('£',
		TRUNCATE(
			AVG(co.salario_mensal_euros),2)) media_salarial_posicao
FROM
	contratos AS co,
    clubes AS cb,
    jogadores AS J
WHERE
	cb.id_clube=co.id_clube
		AND co.id_jogador=j.id_jogador
GROUP BY
	cb.liga, 
    j.posicao
ORDER BY
	liga,
    media_salarial_posicao DESC;
    
-- 23: Crie uma coluna chamada 'categoria_mercado' onde: cláusulas > 500M são 'Inalcançável', entre 100M e 500M são 'Elite' e < 100M 'Acessível'.
SELECT
	j.nome,
    co.clausula_rescisao_milhoes,
    CASE
		WHEN co.clausula_rescisao_milhoes < 100 THEN 'ACESSÍVEL'
        WHEN co.clausula_rescisao_milhoes > 500 THEN 'INALCANÇÁVEL'
        WHEN co.clausula_rescisao_milhoes BETWEEN 100 AND 500 THEN 'ELITE'
	END AS categoria_clausula
FROM
	jogadores AS j,
    contratos AS co
WHERE
	co.id_jogador=j.id_jogador
ORDER BY
	clausula_rescisao_milhoes DESC;

-- 24: Mostre o nome do jogador e o salário do atleta que recebe o maior salário dentro do 'Real Madrid'.
SELECT
	j.nome,
    co.salario_mensal_euros
FROM
	jogadores AS j
INNER JOIN
	contratos AS co ON(j.id_jogador=co.id_jogador)
WHERE
	co.salario_mensal_euros = (SELECT
								    MAX(co.salario_mensal_euros)
							   FROM
									contratos AS co
							   INNER JOIN
									clubes AS cb ON(cb.id_clube=co.id_clube)
							   WHERE
									cb.nome_clube LIKE '%Madrid%');

-- 25: Una numa única lista os nomes dos jogadores e os nomes dos clubes para uma pesquisa global no sistema
SELECT	
	j.nome
FROM 
	jogadores AS j
UNION
SELECT 
	cb.nome_clube
FROM
	clubes AS cb;
    
-- 26: Liste o nome dos jogadores que tiveram 'Lesão Muscular' e quantos minutos jogaram no total nesta época
SELECT
	j.nome,
    dm.tipo_lesao,
	de.minutos_jogados
FROM
	jogadores AS j
INNER JOIN
	desempenho AS de ON(de.id_jogador=j.id_jogador)
INNER JOIN
	departamento_medico AS dm ON(dm.id_jogador=j.id_jogador)
ORDER BY
	minutos_jogados;
    
-- 27: Identifique se existe algum 'Goleiro' que tenha feito pelo menos uma assistência nesta época. Exiba nome e clube
SELECT
	j.nome,
    cb.nome_clube
FROM
	jogadores AS j
INNER JOIN
	desempenho AS de ON(j.id_jogador=de.id_jogador)
INNER JOIN
	contratos AS co ON(co.id_jogador=j.id_jogador)
INNER JOIN
	clubes AS cb ON(co.id_clube=cb.id_clube)
WHERE
	assistencias > 1
    AND posicao = 'Goleiro';
    
-- 28: Encontre os clubes que não possuem nenhum jogador com contrato de patrocínio registado na tabela de patrocínios
SELECT
	cb.nome_clube
FROM
	clubes AS cb
INNER JOIN
	contratos AS co ON(cb.id_clube=co.id_clube)
INNER JOIN
	jogadores AS j ON(co.id_jogador=j.id_jogador)
WHERE
	j.id_jogador NOT IN(SELECT
					        id_jogador
						FROM
							patrocinios);
                            
-- 29: Liste todos os jogadores portugueses, ordenando-os pela idade (do mais velho para o mais novo)
SELECT
	j.nome
FROM
	jogadores AS j
WHERE
	j.nacionalidade IN('Portugal')
ORDER BY
	j.idade DESC;
    
-- 30: Gere uma ficha que contenha: Nome do Jogador, Clube, Golos, Salário Mensal e Marca do Patrocínio para todos os jogadores que marcaram mais de 20 golos.
SELECT
	j.nome,
    cb.nome_clube,
    de.golos,
    co.salario_mensal_euros,
    p.marca
FROM
	jogadores AS j
INNER JOIN
	desempenho AS de ON(de.id_jogador=j.id_jogador)
INNER JOIN
	contratos AS co ON(co.id_jogador=j.id_jogador)
INNER JOIN
	patrocinios AS p ON(p.id_jogador=j.id_jogador)
INNER JOIN
	clubes AS cb ON(cb.id_clube=co.id_clube)
WHERE
	de.golos > 20;
    
-- FIM