-- -------- < aula1exer2Evolucao6_Oracle > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Izabella Alves Pereira
--                           Vinicius Roriz Meireles Silva
-- 							 Lucas Pimentel					
--  						 Alex Gabriel Alves Faustino
--                           João Lucas Pinto Vasconcelos
-- Banco de Dados .........: Oracle
-- Base de Dados (nome) ...: aula1exer2Evolucao6_Oracle
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 08 Usuarios
--         => 03 Perfis 
--         => 01 View 
-- 
-- Ultimas Alteracoes       
--   04/04/2024 => Remove IF NOT EXISTS, adiciona ENGINE = InnoDB, remove underline dos nomes de atributo, inclui constraints
--   15/04/2024 => Adiciona constraints on delete e on update nas chaves estrangeiras
--   22/04/2024 => Remoção dos atributos totalVenda de VENDA e subtotal de contem.
--              => Alteração do atributo idProduto para codigoProduto para seguir a documentação. tabelas (Produto e Contem) 
-- 				=> Alteração de matriculaEmpregado para matricula_empregado para seguir a documentação. tabelas (telefone, Venda) 
--   08/05/2024 => Alteração para o modelo do oracle
-- ---------------------------------------------------------

CREATE TABLE JLPV_PESSOA (
    cpf VARCHAR2(12) NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    senha NUMBER NOT NULL,
    CONSTRAINT JLPV_PESSOA_PK PRIMARY KEY (cpf)
);

CREATE TABLE JLPV_GERENTE (
    cpf VARCHAR2(11) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    formacao VARCHAR2(20) CHECK (formacao IN ('analfabeto', 'primario', 'medio', 'superior', 'mestrado', 'doutorado')) NOT NULL,
    CONSTRAINT JLPV_GERENTE_PK PRIMARY KEY (cpf),
    CONSTRAINT JLPV_GERENTE_PESSOA_FK FOREIGN KEY (cpf) 
        REFERENCES JLPV_PESSOA (cpf)
) ;

CREATE TABLE JLPV_EMPREGADO (
    cpf VARCHAR2(11) NOT NULL,
    matricula NUMBER(10,0) NOT NULL,
    cep NUMBER(8,0) NOT NULL,
    cidade VARCHAR2(30) NOT NULL,
    uf VARCHAR2(4) NOT NULL,
    numero NUMBER NOT NULL,
    complemento VARCHAR2(50),
    CONSTRAINT JLPV_EMPREGADO_PK PRIMARY KEY (matricula),
    CONSTRAINT JLPV_cpf_UK UNIQUE (cpf),
    CONSTRAINT JLPV_EMPREGADO_PESSOA_FK FOREIGN KEY (cpf) 
        REFERENCES JLPV_PESSOA (cpf)
) ;

CREATE TABLE JLPV_TELEFONE (
    telefone NUMBER NOT NULL,
    matricula_empregado NUMBER(10,0) NOT NULL,
    CONSTRAINT JLPV_TELEFONE_PK PRIMARY KEY (matricula_empregado, telefone),
    CONSTRAINT JLPV_TELEFONE_EMPREGADO_FK FOREIGN KEY (matricula_empregado) 
        REFERENCES JLPV_EMPREGADO(matricula)
) ;

CREATE TABLE JLPV_AREA (
    idArea NUMBER NOT NULL,
    nomeArea VARCHAR2(20) NOT NULL,
    cpfGerente VARCHAR2(11) NOT NULL,
    CONSTRAINT JLPV_AREA_PK PRIMARY KEY (idArea),
    CONSTRAINT JLPV_AREA_GERENTE_FK FOREIGN KEY (cpfGerente)
        REFERENCES JLPV_GERENTE (cpf)
) ;

CREATE TABLE JLPV_PRODUTO (
    codigoProduto NUMBER NOT NULL,
    nomeProduto VARCHAR2(15) NOT NULL,
    preco NUMBER(10,2) NOT NULL,
    idArea NUMBER NOT NULL,
    CONSTRAINT JLPV_PRODUTO_PK PRIMARY KEY (codigoProduto),
    CONSTRAINT JLPV_PRODUTO_AREA_FK FOREIGN KEY (idArea)
        REFERENCES JLPV_AREA (idArea)
) ;

CREATE TABLE JLPV_VENDA (
    idVenda NUMBER NOT NULL,
    data DATE NOT NULL,
    matricula_empregado NUMBER(10,0) NOT NULL,
    CONSTRAINT JLPV_VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT JLPV_VENDA_EMPREGADO_FK FOREIGN KEY (matricula_empregado) 
        REFERENCES JLPV_EMPREGADO(matricula)
) ;

CREATE TABLE JLPV_CONTEM (
    quantidadeProduto NUMBER NOT NULL,
    idVenda  NUMBER NOT NULL,
    codigoProduto NUMBER NOT NULL,
    CONSTRAINT JLPV_CONTEM_PK PRIMARY KEY (idVenda , codigoProduto),
    CONSTRAINT JLPV_CONTEM_VENDA_FK FOREIGN KEY (idVenda) 
        REFERENCES JLPV_VENDA(idVenda),
    CONSTRAINT JLPV_CONTEM_PRODUTO_FK FOREIGN KEY (codigoProduto) 
        REFERENCES JLPV_PRODUTO(codigoProduto)
);