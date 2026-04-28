-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE APAGAR (DDL)
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
-- 
-- Ultimas Alteracoes
--   04/04/2024 => Muda o nome da base de dados
--   15/04/2024 => Altera o nome da base de dados para aula1exer2evolucao5      
--   21/04/2024 => Apaga usuarios caso criados
-- ---------------------------------------------------------

USE aula1exer2evolucao5;

DROP TABLE IF EXISTS CONTEM;
DROP TABLE IF EXISTS TELEFONE;
DROP TABLE IF EXISTS VENDA;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS AREA;
DROP TABLE IF EXISTS EMPREGADO;
DROP TABLE IF EXISTS GERENTE;
DROP TABLE IF EXISTS PESSOA;

DROP USER IF EXISTS 'admins';
DROP USER IF EXISTS 'anamaria';
DROP USER IF EXISTS 'ruicarlos';
DROP USER IF EXISTS 'maria';
DROP USER IF EXISTS 'paulo';
DROP USER IF EXISTS 'jose';
DROP USER IF EXISTS 'giovana';
DROP USER IF EXISTS 'pedro';

DROP ROLE IF EXISTS empregado;
DROP ROLE IF EXISTS gerente;
DROP ROLE IF EXISTS superior;