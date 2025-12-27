CREATE DATABASE futebolscouting;

USE futebolscouting;

-- 1. TABELA DE JOGADORES
CREATE TABLE jogadores (
id_jogador INT PRIMARY KEY,
nome VARCHAR(100),
idade INT,
posicao VARCHAR(20), -- Goleiro, Defesa, Meio, Ataque
nacionalidade VARCHAR(50),
peso_kg DECIMAL(5,2),
altura_m DECIMAL(3,2),
pe_dominante CHAR(1) -- D ou E
);
​INSERT INTO jogadores VALUES
(1,'Alisson Becker',31,'Goleiro','Brasil',91.0,1.93,'D'),(2,'Virgil van Dijk',32,'Defesa','Holanda',92.0,1.93,'D'),(3,'Kevin De Bruyne',32,'Meio','Bélgica',75.0,1.81,'D'),(4,'Erling Haaland',23,'Ataque','Noruega',88.0,1.94,'D'),(5,'Mohamed Salah',31,'Ataque','Egito',71.0,1.75,'E'),(6,'Vinícius Jr',23,'Ataque','Brasil',73.0,1.76,'D'),(7,'Jude Bellingham',20,'Meio','Inglaterra',75.0,1.86,'D'),(8,'Rodri',27,'Meio','Espanha',82.0,1.91,'D'),(9,'Kylian Mbappé',25,'Ataque','França',75.0,1.78,'D'),(10,'Bernardo Silva',29,'Meio','Portugal',64.0,1.73,'E'),(11,'Rúben Dias',26,'Defesa','Portugal',82.0,1.87,'D'),(12,'Bruno Fernandes',29,'Meio','Portugal',69.0,1.79,'D'),(13,'Luka Modric',38,'Meio','Croácia',66.0,1.72,'D'),(14,'Harry Kane',30,'Ataque','Inglaterra',86.0,1.88,'D'),(15,'Antoine Griezmann',32,'Ataque','França',73.0,1.76,'E'),(16,'Jan Oblak',31,'Goleiro','Eslovénia',87.0,1.88,'D'),(17,'Federico Valverde',25,'Meio','Uruguai',78.0,1.82,'D'),(18,'Bukayo Saka',22,'Ataque','Inglaterra',65.0,1.78,'E'),(19,'Pedri',21,'Meio','Espanha',60.0,1.74,'D'),(20,'Jamal Musiala',21,'Meio','Alemanha',70.0,1.84,'D'),(21,'Lautaro Martínez',26,'Ataque','Argentina',72.0,1.74,'D'),(22,'Declan Rice',25,'Meio','Inglaterra',80.0,1.85,'D'),(23,'Rafael Leão',24,'Ataque','Portugal',81.0,1.88,'D'),(24,'Thibaut Courtois',31,'Goleiro','Bélgica',96.0,2.00,'E'),(25,'Achraf Hakimi',25,'Defesa','Marrocos',73.0,1.81,'D'),(26,'Nicolò Barella',27,'Meio','Itália',68.0,1.72,'D'),(27,'William Saliba',22,'Defesa','França',92.0,1.92,'D'),(28,'Heung-min Son',31,'Ataque','Coreia do Sul',77.0,1.84,'D'),(29,'Martin Ødegaard',25,'Meio','Noruega',68.0,1.78,'E'),(30,'Ederson',30,'Goleiro','Brasil',86.0,1.88,'E');
​-- 2. TABELA DE CLUBES
CREATE TABLE clubes (
id_clube INT PRIMARY KEY,
nome_clube VARCHAR(100),
liga VARCHAR(50),
orcamento_transferencia_milhoes DECIMAL(10,2)
);
​INSERT INTO clubes VALUES
(1,'Real Madrid','La Liga',550.0),(2,'Manchester City','Premier League',600.0),(3,'Liverpool','Premier League',400.0),(4,'Bayern Munique','Bundesliga',450.0),(5,'Arsenal','Premier League',350.0),(6,'PSG','Ligue 1',700.0),(7,'Inter Milão','Serie A',300.0),(8,'Barcelona','La Liga',250.0),(9,'Bayer Leverkusen','Bundesliga',180.0),(10,'Benfica','Liga Portugal',120.0),(11,'Sporting CP','Liga Portugal',110.0),(12,'FC Porto','Liga Portugal',100.0),(13,'Borussia Dortmund','Bundesliga',280.0),(14,'AC Milan','Serie A',220.0),(15,'Napoli','Serie A',210.0),(16,'Juventus','Serie A',240.0),(17,'Atlético Madrid','La Liga',260.0),(18,'Newcastle','Premier League',320.0),(19,'Tottenham','Premier League',290.0),(20,'Aston Villa','Premier League',200.0),(21,'Chelsea','Premier League',580.0),(22,'RB Leipzig','Bundesliga',170.0),(23,'Real Sociedad','La Liga',140.0),(24,'Lazio','Serie A',130.0),(25,'Roma','Serie A',160.0),(26,'Girona','La Liga',90.0),(27,'Nice','Ligue 1',110.0),(28,'Lille','Ligue 1',105.0),(29,'West Ham','Premier League',195.0),(30,'Feyenoord','Eredivisie',95.0);
​-- 3. TABELA DE CONTRATOS (VINCULA JOGADOR AO CLUBE)
CREATE TABLE contratos (
id_jogador INT,
id_clube INT,
salario_mensal_euros DECIMAL(10,2),
data_fim_contrato DATE,
clausula_rescisao_milhoes INT,
PRIMARY KEY (id_jogador, id_clube)
);
​INSERT INTO contratos VALUES
(1,3,250000,'2027-06-30',150),(2,3,280000,'2025-06-30',120),(3,2,400000,'2025-06-30',200),(4,2,450000,'2027-06-30',300),(5,3,350000,'2025-06-30',180),(6,1,300000,'2027-06-30',1000),(7,1,280000,'2029-06-30',1000),(8,2,320000,'2027-06-30',250),(9,6,600000,'2024-06-30',400),(10,2,250000,'2026-06-30',150),(11,2,240000,'2027-06-30',180),(12,21,300000,'2026-06-30',120),(13,1,180000,'2024-06-30',80),(14,4,420000,'2027-06-30',150),(15,17,260000,'2026-06-30',100),(16,17,230000,'2028-06-30',120),(17,1,240000,'2027-06-30',1000),(18,5,220000,'2027-06-30',200),(19,8,120000,'2026-06-30',1000),(20,4,190000,'2026-06-30',150),(21,7,210000,'2026-06-30',110),(22,5,280000,'2028-06-30',150),(23,14,150000,'2028-06-30',175),(24,1,310000,'2026-06-30',1000),(25,6,240000,'2026-06-30',100),(26,7,180000,'2026-06-30',90),(27,5,190000,'2027-06-30',180),(28,19,250000,'2025-06-30',100),(29,5,240000,'2028-06-30',180),(30,2,230000,'2026-06-30',150);
​-- 4. TABELA DE DESEMPENHO (STATS DA ÉPOCA)
CREATE TABLE desempenho (
id_jogador INT PRIMARY KEY,
partidas_jogadas INT,
golos INT,
assistencias INT,
cartoes_amarelos INT,
minutos_jogados INT
);
​INSERT INTO desempenho VALUES
(1,28,0,0,1,2520),(2,30,2,1,3,2700),(3,18,4,12,2,1420),(4,29,31,5,4,2480),(5,31,19,9,1,2650),(6,26,15,8,3,2100),(7,27,16,4,5,2310),(8,32,7,6,7,2850),(9,28,24,7,2,2380),(10,31,6,11,1,2450),(11,29,1,1,2,2610),(12,32,10,8,8,2800),(13,25,2,4,2,1580),(14,30,32,7,1,2680),(15,31,13,6,4,2590),(16,32,0,0,2,2880),(17,32,3,7,4,2720),(18,30,14,8,2,2450),(19,22,2,3,1,1650),(20,28,10,6,2,2210),(21,31,23,2,5,2600),(22,32,4,4,3,2860),(23,28,12,9,6,2150),(24,5,0,0,0,450),(25,24,2,4,4,1980),(26,30,2,5,6,2410),(27,31,2,1,4,2790),(28,30,15,9,2,2540),(29,32,8,10,3,2750),(30,29,0,1,1,2610);
​-- 5. TABELA MÉDICA (LESÕES)
CREATE TABLE departamento_medico (
id_lesao INT PRIMARY KEY,
id_jogador INT,
tipo_lesao VARCHAR(100),
data_inicio DATE,
data_retorno_prevista DATE
);
​INSERT INTO departamento_medico VALUES
(1,24,'Rotura Ligamentos','2023-08-10','2024-04-15'),(2,3,'Lesão Muscular Hamstring','2023-08-15','2024-01-20'),(3,19,'Lesão Tendão Tibial','2023-11-20','2024-05-15'),(4,16,'Entorse Tornozelo','2023-05-01','2023-05-20'),(5,13,'Fadiga Muscular','2024-03-01','2024-03-10'),(6,4,'Contusão Pé','2023-12-10','2024-01-05'),(7,6,'Lesão Muscular Coxa','2023-09-01','2023-10-15'),(8,11,'Dores Lombares','2024-02-15','2024-02-28'),(9,30,'Lesão Dedo','2023-10-01','2023-10-25'),(10,2,'Pancada Joelho','2024-01-15','2024-01-20'),(11,5,'Cansaço','2024-04-01','2024-04-05'),(12,25,'Estiramento','2023-11-05','2023-11-25'),(13,27,'Gripe','2024-01-02','2024-01-08'),(14,29,'Entorse','2023-08-20','2023-08-30'),(15,8,'Pancada Tibia','2023-12-28','2024-01-05'),(16,10,'Lesão Muscular','2023-09-15','2023-10-01'),(17,14,'Cãibras','2024-03-20','2024-03-25'),(18,22,'Contusão','2023-07-10','2023-07-15'),(19,23,'Dores Musculares','2024-02-05','2024-02-12'),(20,26,'Entorse Tornozelo','2023-06-15','2023-07-01'),(21,12,'Lesão Muscular','2023-12-01','2023-12-15'),(22,17,'Fadiga','2024-01-10','2024-01-15'),(23,18,'Pancada','2023-10-15','2023-10-20'),(24,20,'Lesão Leve','2024-02-20','2024-02-25'),(25,21,'Cansaço','2023-11-30','2023-12-05'),(26,28,'Lesão Muscular','2024-01-05','2024-01-20'),(27,15,'Dores','2023-09-25','2023-10-01'),(28,1,'Lesão Leve','2024-03-10','2024-03-15'),(29,9,'Entorse','2023-08-01','2023-08-15'),(30,7,'Pancada','2024-04-05','2024-04-10');
​-- 6. TABELA DE PATROCÍNIOS (MARKETING)
CREATE TABLE patrocinios (
id_patrocinio INT PRIMARY KEY,
id_jogador INT,
marca VARCHAR(50),
valor_anual_euros INT
);
​INSERT INTO patrocinios VALUES
(1,1,'Nike',2000000),(2,2,'Nike',2500000),(3,3,'Puma',4000000),(4,4,'Nike',15000000),(5,5,'Adidas',10000000),(6,6,'Nike',7000000),(7,7,'Adidas',6000000),(8,8,'Puma',3000000),(9,9,'Nike',20000000),(10,10,'Adidas',2500000),(11,11,'Puma',2000000),(12,12,'Nike',3500000),(13,13,'Adidas',2000000),(14,14,'Skechers',5000000),(15,15,'Puma',4000000),(16,16,'Puma',1500000),(17,17,'Nike',2500000),(18,18,'New Balance',3000000),(19,19,'Nike',2000000),(20,20,'Adidas',3500000),(21,21,'Nike',4000000),(22,22,'Adidas',3000000),(23,23,'Adidas',2500000),(24,24,'Nike',2000000),(25,25,'Adidas',2000000),(26,26,'Nike',1500000),(27,27,'Puma',2000000),(28,28,'Adidas',3000000),(29,29,'Nike',2500000),(30,30,'Puma',2000000);