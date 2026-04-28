-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 06/04/2024
-- Autor(es) ..............: João Lucas Pinto Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 3 Tipos de Usuários
-- 
-- Ultimas Alteracoes
--   06/04/2024 => Criação dos scripts
--   
--
-- ---------------------------------------------------------

-- Creating users
CREATE USER 'admins'@'localhost' IDENTIFIED BY '1admin';
CREATE USER 'anamaria'@'localhost' IDENTIFIED BY '2anam';
CREATE USER 'ruicarlos'@'localhost' IDENTIFIED BY '3ruic';
CREATE USER 'maria'@'localhost' IDENTIFIED BY '4maria';
CREATE USER 'paulo'@'localhost' IDENTIFIED BY '5paulo';
CREATE USER 'jose'@'localhost' IDENTIFIED BY '6jose';
CREATE USER 'giovana'@'localhost' IDENTIFIED BY '7giovana';
CREATE USER 'pedro'@'localhost' IDENTIFIED BY '8pedro';

-- Granting privileges to users
GRANT SELECT, INSERT ON aula1exer2Evolucao3.VENDA TO maria@localhost, paulo@localhost, jose@localhost, giovana@localhost, pedro@localhost;
GRANT SELECT, INSERT ON aula1exer2Evolucao3.contem TO maria@localhost, paulo@localhost, jose@localhost, giovana@localhost, pedro@localhost;

GRANT SELECT, INSERT, DELETE, UPDATE ON aula1exer2Evolucao3.* TO anamaria@localhost, ruicarlos@localhost;

GRANT ALL PRIVILEGES ON aula1exer2Evolucao3.* TO admins@localhost;

-- Apply the privileges
FLUSH PRIVILEGES;