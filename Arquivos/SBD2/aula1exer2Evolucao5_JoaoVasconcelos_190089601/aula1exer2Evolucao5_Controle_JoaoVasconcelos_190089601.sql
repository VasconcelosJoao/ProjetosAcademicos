-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Vinicius Roriz Meireles Silva
--                           Lucas Pimentel Quintão                          
--                           Joao Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2evolucao5
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 03 Perfis
--         ### CADE OS USUARIOS? ###
-- 
-- Ultimas Alteracoes
-- 		15/04/2024 => Altera o nome da base de dados, atribui perfil para os usuários e remove notação @localhost do comando de criação de usuários  
-- ---------------------------------------------------------

USE aula1exer2evolucao5;

CREATE ROLE empregado, gerente, superior;

GRANT SELECT ON aula1exer2evolucao5.* TO empregado;
GRANT INSERT ON aula1exer2evolucao5.VENDA TO empregado;
GRANT INSERT ON aula1exer2evolucao5.CONTEM TO empregado;
GRANT INSERT ON aula1exer2evolucao5.PRODUTO TO empregado;

GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2evolucao5.AREA TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2evolucao5.VENDA TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2evolucao5.PRODUTO TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2evolucao5.CONTEM TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2evolucao5.TELEFONE TO gerente;

GRANT INSERT, UPDATE, DELETE ON aula1exer2evolucao5.PESSOA TO gerente;
GRANT INSERT, UPDATE, DELETE ON aula1exer2evolucao5.EMPREGADO TO gerente;
GRANT INSERT, UPDATE, DELETE ON aula1exer2evolucao5.GERENTE TO gerente;

GRANT ALL ON aula1exer2evolucao5.* TO superior;

CREATE USER 'admins' IDENTIFIED BY '1admin';

CREATE USER 'anamaria' IDENTIFIED BY '2anam';
CREATE USER 'ruicarlos' IDENTIFIED BY '3ruic';

CREATE USER 'maria' IDENTIFIED BY '4maria';
CREATE USER 'paulo' IDENTIFIED BY '5paulo';
CREATE USER 'jose' IDENTIFIED BY '6jose';
CREATE USER 'giovana' IDENTIFIED BY '7giovana';
CREATE USER 'pedro' IDENTIFIED BY '8pedro';

GRANT superior TO 'admins';

GRANT gerente TO 'anamaria';
GRANT gerente TO 'ruicarlos';

GRANT empregado TO 'maria';
GRANT empregado TO 'paulo';
GRANT empregado TO 'jose';
GRANT empregado TO 'giovana';
GRANT empregado TO 'pedro';

