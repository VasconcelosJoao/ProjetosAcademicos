-- -------------   << aula14Triggers >>   ---------------
--
--                SCRIPT DE CRIACAO (DDL)
--
-- Data de Criacao ........: 09/03/2020
-- Autor(es) ..............: Carlos Veloso Rodrigues
-- Banco de Dados .........: MySql 8.0
-- Base de Dados (nome) ...: aula14Triggers
--
-- Alteracoes no Script
--   06/06/2020 - ajustes na organizacao do script
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Triggers (serao implementadas por VOCE)
--
-- -------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
 IF NOT EXISTS aula14Triggers;

USE aula14Triggers;


-- TABELAS
CREATE TABLE `tbl_cliente` (
   `cliente_id`    INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `cliente_nome`  VARCHAR(80)      NOT NULL,
   `cliente_email` VARCHAR(80)      NOT NULL,
   `dt_cadastro`   TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT tbl_cliente_PK PRIMARY KEY (cliente_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_produto` (
   `produto_id`   INT(10)     UNSIGNED NOT NULL AUTO_INCREMENT,
   `produto_nome` VARCHAR(80)          NOT NULL,
  CONSTRAINT tbl_produto_PK PRIMARY KEY (`produto_id`)
) ENGINE=MyISAM  AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_compra` (
   `dt_cadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `cliente_id`  INT(11) DEFAULT NULL,
   `produto_id`  INT(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_newsletter` (
   `news_id`    INT(11)     NOT NULL AUTO_INCREMENT,
   `news_email` VARCHAR(80) NOT NULL,
  CONSTRAINT tbl_newsletter_PK PRIMARY KEY (`news_id`,`news_email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;









