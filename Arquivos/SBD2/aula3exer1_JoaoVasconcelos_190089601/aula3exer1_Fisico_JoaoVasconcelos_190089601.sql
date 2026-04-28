-- -------- < aula3exer1 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
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
--          20/05/2024 => Criação do script de criação
-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS aula3exer1;
USE aula3exer1;

CREATE TABLE setor (
    id_setor INT AUTO_INCREMENT PRIMARY KEY,
    nome_setor VARCHAR(50) NOT NULL
) ENGINE = InnoDB COMMENT 'Setor table';

CREATE TABLE funcionario (
    matricula VARCHAR(10) NOT NULL PRIMARY KEY,
    nome_funcionario VARCHAR(50) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL COMMENT 'M for Male, F for Female',
    dataNascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL
) ENGINE = InnoDB COMMENT 'Funcionario table';

CREATE TABLE especialidade (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_especialidade VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL
) ENGINE = InnoDB COMMENT 'Especialidade table';

CREATE TABLE gerente (
    matricula VARCHAR(10) NOT NULL PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    formacao ENUM('analfabeto', 'primario', 'medio', 'superior', 'mestrado', 'doutorado') NOT NULL,
    FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
) ENGINE = InnoDB COMMENT 'Gerente table';

CREATE TABLE plantao (
    id_plantao INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_inicio DATETIME NOT NULL,
    data_hora_fim DATETIME NOT NULL,
    id_setor INT NOT NULL,
    idEspecialidade INT,  -- Referencia a tabela especialidade
    FOREIGN KEY (id_setor) REFERENCES setor(id_setor),
    FOREIGN KEY (idEspecialidade) REFERENCES especialidade(id_especialidade),
    observacoes TEXT NOT NULL
) ENGINE = InnoDB COMMENT 'Plantao table';

CREATE TABLE plantao_funcionario (
    id_plantao INT NOT NULL,
    matricula VARCHAR(10) NOT NULL,
    funcao VARCHAR(20) NOT NULL,  -- Campo para especificar a funcao do funcionario
    PRIMARY KEY (id_plantao, matricula),
    FOREIGN KEY (id_plantao) REFERENCES plantao(id_plantao),
    FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
) ENGINE = InnoDB COMMENT 'PlantaoFuncionario table';
