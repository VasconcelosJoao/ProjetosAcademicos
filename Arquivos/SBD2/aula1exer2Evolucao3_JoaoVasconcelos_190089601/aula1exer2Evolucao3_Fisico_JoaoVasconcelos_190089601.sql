-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Raquel Temóteo Eucaria Pereira da Costa, Vinicius Roriz Meireles Silva, João Lucas Pinto Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
---
-- 
-- Ultimas Alteracoes
--   24/03/2024 => Criação das tabelas
--   31/03/2024 => Adição da tabela habilitado           
--   06/04/2024 => Atualização do script
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao3;
USE aula1exer2Evolucao3;

CREATE TABLE GERENTE (
	cpf BIGINT(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(8) NOT NULL,
    email VARCHAR(100) NOT NULL,
    formacao VARCHAR(30) NOT NULL,
    CONSTRAINT GERENTE_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;


CREATE TABLE EMPREGADO (
	cpf BIGINT(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(8) NOT NULL,
    matricula INT(7) AUTO_INCREMENT NOT NULL,
    cep INT(7) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    numero INT(5) NOT NULL,
    complemento VARCHAR(50),
    
    CONSTRAINT matricula_UK UNIQUE (matricula),
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;


CREATE TABLE AREA (
    idArea INT(2) AUTO_INCREMENT NOT NULL,
    dsArea VARCHAR(20) NOT NULL,
    gerente BIGINT(11) NOT NULL,
    CONSTRAINT AREA_PK PRIMARY KEY (idArea),
    CONSTRAINT AREA_GERENTE_FK FOREIGN KEY (gerente)
        REFERENCES GERENTE (cpf)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;


CREATE TABLE PRODUTO (
    idProduto INT(8) AUTO_INCREMENT NOT NULL,
    dsProduto VARCHAR(50) NOT NULL,
    preco FLOAT(7,2) NOT NULL,
    area INT(4) NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto),
    CONSTRAINT PRODUTO_AREA_FK FOREIGN KEY (area)
        REFERENCES AREA (idArea)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;


CREATE TABLE VENDA (
    idVenda INT(4) AUTO_INCREMENT NOT NULL,
    data DATETIME NOT NULL,
    vendedor BIGINT(11) NOT NULL,
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY (vendedor)
        REFERENCES EMPREGADO (cpf)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;


CREATE TABLE telefone (
    cpfEmpregado BIGINT(11) NOT NULL,
    telefone BIGINT(13) NOT NULL,
    CONSTRAINT telefone_UK UNIQUE (cpfEmpregado, telefone),
    CONSTRAINT telefone_EMPREGADO_FK FOREIGN KEY (cpfEmpregado)
        REFERENCES EMPREGADO(cpf)
) ENGINE = InnoDB;


CREATE TABLE contem (
    idVenda INT(11) NOT NULL,
    idProduto INT(8) NOT NULL,
    quantidade INT(2) NOT NULL,
    CONSTRAINT contem_VENDA_FK FOREIGN KEY (idVenda)
        REFERENCES VENDA (idVenda),
    CONSTRAINT contem_PRODUTO_FK FOREIGN KEY (idProduto)
        REFERENCES PRODUTO (idProduto)
) ENGINE = InnoDB;


CREATE TABLE habilitado (
    idArea INT(2) NOT NULL,
    cpfEmpregado BIGINT(11) NOT NULL,
    CONSTRAINT habilitado_EMPREGADO_FK FOREIGN KEY (cpfEmpregado)
        REFERENCES EMPREGADO(cpf),
    CONSTRAINT area_PRODUTO_FK FOREIGN KEY (idArea)
        REFERENCES AREA (idArea)
) ENGINE = InnoDB;
