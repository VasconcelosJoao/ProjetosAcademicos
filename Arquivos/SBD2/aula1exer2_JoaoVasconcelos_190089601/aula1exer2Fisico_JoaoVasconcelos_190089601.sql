-- -------- < COLOCAR O NOME DE SEU PROJETO > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Joao Lucas Pinto Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- PROJETO => 01 Base de Dados
--         => 6 Tabelas
-- 
-- Ultimas Alteracoes
--   24/03/2024 => Criação do script
-- ---------------------------------------------------------
DROP DATABASE IF EXISTS aula1exer2;

CREATE DATABASE aula1exer2;

USE aula1exer2;

CREATE TABLE EMPREGADO (
    matricula INT,
    cep INT,
    numero INT,
    complemento VARCHAR(255),  
    nome VARCHAR(255),  
    cpf INT,
    senha VARCHAR(255),  
    PRIMARY KEY (matricula, cpf),
    UNIQUE (matricula, cpf)
);

CREATE TABLE TELEFONE (
    matricula_proprietario INT NOT NULL,
    telefone INT,
    PRIMARY KEY (matricula_proprietario, telefone),
    FOREIGN KEY (matricula_proprietario) REFERENCES EMPREGADO(matricula)
);
 
CREATE TABLE GERENTE (
    formacao VARCHAR(255),  
    e_mail VARCHAR(255),  
    nome VARCHAR(255),  
    cpf INT PRIMARY KEY UNIQUE,
    senha VARCHAR(255)  
);

CREATE TABLE SUPERVISIONA (
    cpf_gerente INT,
    matricula_empregado INT,
    PRIMARY KEY (matricula_empregado, cpf_gerente),
    FOREIGN KEY (cpf_gerente) REFERENCES GERENTE(cpf), 
    FOREIGN KEY (matricula_empregado) REFERENCES EMPREGADO(matricula) 
);

CREATE TABLE PRODUTO (
    area VARCHAR(255),
    preco FLOAT,
    codigo_numerico INT PRIMARY KEY
);

CREATE TABLE VENDA (
    data DATE,
    quantidade INT,
    valor_total FLOAT,
    maticula_vendedor INT,
    codigo_numerico_produto INT,
    PRIMARY KEY (data, maticula_vendedor, codigo_numerico_produto),
    FOREIGN KEY (maticula_vendedor) REFERENCES EMPREGADO(matricula), 
    FOREIGN KEY (codigo_numerico_produto) REFERENCES PRODUTO(codigo_numerico) 
);