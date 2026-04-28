-- -------- < aula1exer2Evolucao4 > --------
--
--                    SCRIPT DE APAGAR (DDL)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Izabella Alves Pereira
--                           Vinicius Roriz Meireles Silva
--                           Joao Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- Ultimas Alteracoes
--   29/03/2024 => Evolução           
--   04/04/2024 => Muda o nome da base de dados
--   13/04/2024 => Adição de remoção dos usuarios e roles  
-- ---------------------------------------------------------

USE aula1exer2Evolucao4;

DROP TABLE contem;
DROP TABLE telefone;
DROP TABLE VENDA;
DROP TABLE PRODUTO;
DROP TABLE AREA;
DROP TABLE EMPREGADO;
DROP TABLE GERENTE;
DROP TABLE PESSOA;

DROP USER 'admins';
DROP USER 'anamaria';
DROP USER 'ruicarlos';
DROP USER 'maria';
DROP USER 'paulo';
DROP USER 'jose';
DROP USER 'giovana';
DROP USER 'pedro';

DROP ROLE empregado;
DROP ROLE gerente;
DROP ROLE superior;