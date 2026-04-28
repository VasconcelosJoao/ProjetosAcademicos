-- -------- < aula1exer2Evolucao2 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: João Lucas Pintasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas

-- 
-- Ultimas Alteracoes
--   24/03/2024 => Criação das tabelas
--   31/03/2024 => Atualização do script     
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao2;
USE aula1exer2Evolucao2;

CREATE TABLE GERENTE (
    cpf BIGINT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(8) NOT NULL,
    email VARCHAR(100) NOT NULL,
    formacao ENUM('Graduação', 'Mestrado', 'Doutorado')
);

CREATE TABLE EMPREGADO (
    cpf BIGINT UNIQUE,
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(8) NOT NULL,
    matricula INT PRIMARY KEY,
    cep INT NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(50)
);

CREATE TABLE PRODUTO (
    codigoProduto INT PRIMARY KEY,
    dsProduto VARCHAR(50) NOT NULL,
    preco FLOAT NOT NULL,
    area INT NOT NULL
);

CREATE TABLE AREA (
    idArea INT NOT NULL,
    dsArea VARCHAR(20) NOT NULL,
    idGerente BIGINT NOT NULL,
    FOREIGN KEY (idGerente) REFERENCES GERENTE(cpf),
    PRIMARY KEY (idArea, idGerente)
);

CREATE TABLE VENDA (
    idVenda INT PRIMARY KEY,
    data DATE NOT NULL,
    matricula INT NOT NULL,
    FOREIGN KEY (matricula) REFERENCES EMPREGADO(matricula)
);

CREATE TABLE telefone (
    matricula INT NOT NULL,
    telefone BIGINT NOT NULL,
    FOREIGN KEY (matricula) REFERENCES EMPREGADO(matricula),
    PRIMARY KEY (telefone, matricula)
);

CREATE TABLE habilitado (
    empregado INT NOT NULL,
    idArea INT NOT NULL,
    PRIMARY KEY (empregado, idArea),
    FOREIGN KEY (empregado) REFERENCES EMPREGADO(matricula),
    FOREIGN KEY (idArea) REFERENCES AREA(idArea)
);

CREATE TABLE contem (
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (idVenda) REFERENCES VENDA(idVenda) ON DELETE RESTRICT,
    FOREIGN KEY (idProduto) REFERENCES PRODUTO(codigoProduto) ON DELETE RESTRICT
);