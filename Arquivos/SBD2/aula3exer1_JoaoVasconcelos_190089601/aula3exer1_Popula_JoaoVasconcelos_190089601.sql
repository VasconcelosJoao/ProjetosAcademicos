-- -------- < aula3exer1 > --------
--
--                    SCRIPT DE POPULAR (DML)
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
--          20/05/2024 => Criação do script de popular
-- ---------------------------------------------------------

USE aula3exer1;

-- Inserir dados na tabela Setor
INSERT INTO setor (nome_setor) VALUES
('Cardiologia'),
('Pediatria'),
('Ortopedia'),
('Clínica Geral');

-- Inserir dados na tabela Funcionario
INSERT INTO funcionario (matricula, nome_funcionario, sexo, id_setor) VALUES
('123456789', 'João Silva', 'M', 1),
('987654321', 'Maria Oliveira', 'F', 2),
('234567890', 'Pedro Souza', 'M', 3),
('876543210', 'Ana Costa', 'F', 4);

-- Inserir dados na tabela Especialidade
INSERT INTO especialidade (nome_especialidade) VALUES
('Cardiologista'),
('Pediatra'),
('Ortopedista'),
('Clínico Geral');

-- Inserir dados na tabela Gerente
INSERT INTO Gerente (matricula, email, formacao) VALUES
('123456789', 'joao.silva@email.com', 'superior'),
('987654321', 'maria.oliveira@email.com', 'mestrado'),
('234567890', 'pedro.souza@email.com', 'medio'),
('876543210', 'ana.costa@email.com', 'doutorado');

-- Inserir dados na tabela Plantao
INSERT INTO plantao (data_hora_inicio, data_hora_fim, matricula) VALUES
('2024-05-20 08:00:00', '2024-05-20 16:00:00', '123456789'),
('2024-05-20 16:00:00', '2024-05-21 00:00:00', '987654321'),
('2024-05-21 08:00:00', '2024-05-21 16:00:00', '234567890'),
('2024-05-21 16:00:00', '2024-05-22 00:00:00', '876543210');

-- Inserir dados na tabela PlantaoFuncionario
INSERT INTO plantao_funcionario (id_plantao, matricula) VALUES
(1, '123456789'),
(2, '987654321'),
(3, '234567890'),
(4, '876543210');
