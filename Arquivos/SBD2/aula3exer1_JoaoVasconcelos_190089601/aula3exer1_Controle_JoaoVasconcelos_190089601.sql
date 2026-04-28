-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE CONTROLE
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
--          20/05/2024 => Criação do script de controle
-- ---------------------------------------------------------

USE aula3exer1;

-- Criação dos usuários
CREATE USER 'saudedba' IDENTIFIED BY 'dbasaude';
CREATE USER 'maria' IDENTIFIED BY 'airam';
CREATE USER 'jose' IDENTIFIED BY 'esoj';
CREATE USER 'clara' IDENTIFIED BY 'c1234';
CREATE USER 'joaquim' IDENTIFIED BY 'j4321';

-- Criação dos perfis
CREATE ROLE administrador;
CREATE ROLE usuario;
CREATE ROLE gestor;

-- Concessão de privilégios para o perfil administrador
GRANT ALL PRIVILEGES ON aula3exer1.* TO 'administrador';

-- Concessão de privilégios para o perfil usuario
GRANT SELECT ON aula3exer1.* TO 'usuario';

-- Concessão de privilégios para o perfil gestor
GRANT SELECT, INSERT, UPDATE ON aula3exer1.funcionario TO 'gestor';
GRANT SELECT, INSERT, UPDATE ON aula3exer1.setor TO 'gestor';

-- Atribuição dos perfis aos usuários
GRANT 'administrador' TO 'saudedba';
GRANT 'usuario' TO 'maria', 'jose';
GRANT 'gestor' TO 'clara', 'joaquim';

-- Ativação dos perfis
SET DEFAULT ROLE administrador TO 'saudedba';
SET DEFAULT ROLE usuario TO 'maria', 'jose';
SET DEFAULT ROLE gestor TO 'clara', 'joaquim';


