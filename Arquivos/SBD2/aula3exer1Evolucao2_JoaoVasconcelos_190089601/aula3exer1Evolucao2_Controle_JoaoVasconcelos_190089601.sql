-- ------------------- < aula3exer1Evolucao2 > -----------------------
--
--                    SCRIPT CONTROLE (DLL)
--
-- Data Criacao ...........: 19/05/2024
-- Autor(es) ..............: Pablo Christianno Silva Guedes
--                           João Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula3exer1Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- 		   => 03 Perfis
-- 		   => 05 Usuários
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula3exer1Evolucao2;

CREATE ROLE administrador, usuario, gestor;

GRANT ALL ON aula3exer1Evolucao2.* TO administrador;

GRANT SELECT ON aula3exer1Evolucao2.* TO usuario;

GRANT SELECT, INSERT, UPDATE ON aula3exer1Evolucao2.* TO gestor;

CREATE USER 'saudedba' IDENTIFIED BY 'dbasaude';
CREATE USER 'maria' IDENTIFIED BY 'airam';
CREATE USER 'jose' IDENTIFIED BY 'esoj';
CREATE USER 'clara' IDENTIFIED BY 'c1234';
CREATE USER 'joaquim' IDENTIFIED BY 'j4321';

GRANT administrador TO 'saudedba';
GRANT usuario TO 'maria', 'jose';
GRANT gestor TO 'clara', 'joaquim';

SELECT User, Host FROM mysql.user;