-- -------------   << aula14Triggers >>   ---------------
--
--                  SCRIPT APAGA (DDL)
--
-- Data de Criacao ........: 09/03/2020
-- Autor(es) ..............: Carlos Veloso Rodrigues
--                           João Lucas Pinto Vasconcelos
-- Banco de Dados .........: MySql 8.0
-- Base de Dados (nome) ...: aula14Triggers
--
-- Alteracoes no Script
--   06/06/2020 - ajustes na organizacao do script
--   24/06/2024 - inclusao dos Triggers
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Triggers (serao implementadas por VOCE)
--
-- -------------------------------------------------------

-- BASE DE DADOS
USE aula14Triggers;


-- TABELAS
DROP TABLE tbl_newsletter;
DROP TABLE tbl_compra;
DROP TABLE tbl_produto;
DROP TABLE tbl_cliente;

DROP TRIGGER trg_1;
DROP TRIGGER trg_2;
DROP TRIGGER trg_3;