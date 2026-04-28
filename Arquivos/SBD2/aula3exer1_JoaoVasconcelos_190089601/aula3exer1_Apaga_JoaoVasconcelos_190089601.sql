-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE APAGAR (DDL)
--
-- Data Criacao ...........: 20/05/2024
-- Autor(es) ..............: João Lucas Pinto Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula3exer1
--
-- PROJETO => 01 Base de Dados
--         => 06 Tabelas

-- 
-- Ultimas Alteracoes
--          20/05/2024 => Criação do script de deleção
-- ---------------------------------------------------------

USE aula3exer1;

DROP TABLE IF EXISTS plantao_funcionario;
DROP TABLE IF EXISTS plantao;
DROP TABLE IF EXISTS gerente;
DROP TABLE IF EXISTS especialidade;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS setor;

-- Remoção dos perfis dos usuários
REVOKE 'administrador' FROM 'saudedba';
REVOKE 'usuario' FROM 'maria', 'jose';
REVOKE 'gestor' FROM 'clara', 'joaquim';

-- Remoção dos usuários
DROP USER 'saudedba';
DROP USER 'maria';
DROP USER 'jose';
DROP USER 'clara';
DROP USER 'joaquim';

-- Remoção dos perfis
DROP ROLE administrador;
DROP ROLE usuario;
DROP ROLE gestor;