-- -------- < aula9exer1 > --------
--
--                    SCRIPT DE BUSCA (DQL)
--
-- Data Criacao ...........: 06/05/2024
-- Autor(es) ..............: João Lucas Pinto Vasconcelos
--                           
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: MetaGame
--
-- PROJETO => 01 Base de Dados
--         => 03 Tabelas

-- 
-- Ultimas Alteracoes
--   06/05/2024 => Criação do arquivo de script
-- ---------------------------------------------------------

USE MetaGame;

-- Consulta para selecionar todos os jogos de um determinado publisher
-- A consulta junta as tabelas GAME e PUBLISHER baseado no id_publisher
-- e filtra os resultados pelo nome do publisher
SELECT g.name 
FROM GAME g
INNER JOIN PUBLISHER p ON g.id_publisher = p.id_publisher
WHERE p.publisher_name = 'Nome_do_Publisher';

-- Consulta para selecionar todos os jogos de um determinado gênero
-- A consulta junta as tabelas GAME e GENRE baseado no id_genre
-- e filtra os resultados pela descrição do gênero
SELECT g.name 
FROM GAME g
INNER JOIN GENRE ge ON g.id_genre = ge.id_genre
WHERE ge.description = 'Nome_do_Genero';

-- -----------------------------------------------------
-- Table GENRE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS GENRE (
  id_genre INT NOT NULL AUTO_INCREMENT,
  description VARCHAR(12) NOT NULL,
  PRIMARY KEY (id_genre)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table PUBLISHER
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PUBLISHER (
  id_publisher INT NOT NULL AUTO_INCREMENT,
  publisher_name VARCHAR(80) NOT NULL,
  PRIMARY KEY (id_publisher)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table GAME
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS GAME (
  id_game INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(132) NOT NULL,
  id_genre INT NULL DEFAULT NULL,
  id_publisher INT NOT NULL,
  year_of_release VARCHAR(4) NOT NULL,
  developer VARCHAR(80) NULL DEFAULT NULL,
  platform VARCHAR(4) NOT NULL,
  na_sales DECIMAL(5,2) NOT NULL,
  eu_Sales DECIMAL(5,2) NOT NULL,
  jp_sales DECIMAL(5,2) NOT NULL,
  other_sales DECIMAL(5,2) NOT NULL,
  critic_score INT NULL DEFAULT NULL,
  critic_count INT NULL DEFAULT NULL,
  user_score VARCHAR(3) NULL DEFAULT NULL,
  user_count INT NULL DEFAULT NULL,
  rating VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (id_game),
  INDEX GAME_PUBLISHER_FK (id_publisher ASC) VISIBLE,
  INDEX GAME_GENRE_FK (id_genre ASC) VISIBLE,
  CONSTRAINT GAME_GENRE_FK
    FOREIGN KEY (id_genre)
    REFERENCES GENRE (id_genre),
  CONSTRAINT GAME_PUBLISHER_FK
    FOREIGN KEY (id_publisher)
    REFERENCES PUBLISHER (id_publisher)
)ENGINE = InnoDB;
