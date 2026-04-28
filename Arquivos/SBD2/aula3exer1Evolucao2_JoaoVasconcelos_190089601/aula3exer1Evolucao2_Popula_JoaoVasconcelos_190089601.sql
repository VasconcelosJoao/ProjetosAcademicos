-- ------------------- < aula3exer1Evolucao2 > -----------------------
--
--                    SCRIPT POPULA (DML)
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

-- INSERCOES
INSERT INTO PLANTONISTA (nome, sexo) VALUES
('Ana Braga', 'F'),
('João da Silva', 'M'),
('Maria Oliveira', 'F'),
('Pedro Souza', 'M'),
('Carlos Santos', 'M'),
('Roberta Pereira', 'F'),
('Bruno Almeida', 'M'),
('Luisa Costa', 'F');

INSERT INTO SETOR (dsSetor) VALUES
('Administração'),
('Urgência e Emergência'),
('Hotelaria Hospitalar'),
('Apoio Terapêutico'),
('Pronto-Socorro');

INSERT INTO ESPECIALIDADE (nomeEspecialidade) VALUES
('Enfermeiro Geral'),
('Enfemeiro Pediátrico'),
('Enfermeiro Obstreta'),
('Enfermeiro Cirúrgico'),
('Fisioterapeuta'),
('Nutricionista');

INSERT INTO PERTENCE (matricula, idSetor, hora) VALUES
(1, 1, '14:00:00'),
(2, 2, '08:00:00'),
(3, 3, '15:00:00'),
(4, 4, '18:00:00'),
(5, 5, '10:00:00'),
(6, 1, '12:00:00'),
(7, 2, '16:00:00'),
(8, 3, '09:00:00');

INSERT INTO POSSUI (matricula, idEspecialidade) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 5),
(4, 4),
(5, 6),
(6, 1),
(7, 5);

-- Esta inserção irá gerar um erro, pois o plantonista 1 já possui a especialidade 1.
INSERT INTO POSSUI (matricula, idEspecialidade) VALUES
(1, 1);
