-- -------- < aula1exer2Evolucao4 > --------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Vinicius Roriz Meireles Silva
--                           Joao Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- Ultimas Alteracoes
--         13/04/2024 => Adição de perimissões e remoção do @'localhost'
-- ---------------------------------------------------------

USE aula1exer2Evolucao4;

CREATE ROLE empregado, gerente, superior;

GRANT SELECT ON aula1exer2Evolucao4.* TO empregado;
GRANT INSERT ON aula1exer2Evolucao4.VENDA TO empregado;
GRANT INSERT ON aula1exer2Evolucao4.CONTEM TO empregado;
GRANT INSERT ON aula1exer2Evolucao4.PRODUTO TO empregado;

GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao4.AREA TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao4.VENDA TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao4.PRODUTO TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao4.CONTEM TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao4.TELEFONE TO gerente;

GRANT SELECT ON aula1exer2Evolucao4.PESSOA TO gerente;
GRANT SELECT ON aula1exer2Evolucao4.EMPREGADO TO gerente;
GRANT SELECT ON aula1exer2Evolucao4.GERENTE TO gerente;

GRANT ALL ON aula1exer2Evolucao4.* TO superior;

CREATE USER 'admins' IDENTIFIED BY '1admin';
CREATE USER 'anamaria' IDENTIFIED BY '2anam';
CREATE USER 'ruicarlos' IDENTIFIED BY '3ruic';
CREATE USER 'maria' IDENTIFIED BY '4maria';
CREATE USER 'paulo' IDENTIFIED BY '5paulo';
CREATE USER 'jose' IDENTIFIED BY '6jose';
CREATE USER 'giovana' IDENTIFIED BY '7giovana';
CREATE USER 'pedro' IDENTIFIED BY '8pedro';

GRANT superior TO 'admins';
GRANT gerente TO 'anamaria', 'ruicarlos';
GRANT empregado TO 'maria', 'paulo', 'jose', 'giovana', 'pedro';
