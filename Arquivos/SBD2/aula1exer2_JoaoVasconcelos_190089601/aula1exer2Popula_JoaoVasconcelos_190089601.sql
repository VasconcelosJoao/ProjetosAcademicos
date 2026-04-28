-- -------- < COLOCAR O NOME DE SEU PROJETO > --------
--
--                    SCRIPT DE INSERCAO (DML)
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

USE aula1exer2;

-- Insere em EMPREGADO
INSERT INTO EMPREGADO (matricula, cep, numero, complemento, nome, cpf, senha) VALUES (1, 7215716, 1, 'Hamburgueria', 'Maria Antonia', 123, 'Senha1');
INSERT INTO EMPREGADO (matricula, cep, numero, complemento, nome, cpf, senha) VALUES (2, 7212256, 2, 'Em cima do comercio', 'José Pedro', 234, 'Senha2');
INSERT INTO EMPREGADO (matricula, cep, numero, complemento, nome, cpf, senha) VALUES (3, 7219805, 3, 'Salão', 'Marcos Fagundes', 345, 'Senha3');

-- Insere em TELEFONE
INSERT INTO TELEFONE (matricula_proprietario, telefone) VALUES (1, 35971072);
INSERT INTO TELEFONE (matricula_proprietario, telefone) VALUES (1, 999942594);
INSERT INTO TELEFONE (matricula_proprietario, telefone) VALUES (2, 992442594);
INSERT INTO TELEFONE (matricula_proprietario, telefone) VALUES (3, 994642566);

-- Insere em GERENTE
INSERT INTO GERENTE (formacao, e_mail, nome, cpf, senha) VALUES ('médio', 'email1@exemplo.com', 'Luiz Humberto', 675, 'Senha11');
INSERT INTO GERENTE (formacao, e_mail, nome, cpf, senha) VALUES ('superior', 'email2@exemplo.com', 'Ana Claro', 348, 'Senha22');
INSERT INTO GERENTE (formacao, e_mail, nome, cpf, senha) VALUES ('médio', 'email3@exemplo.com', 'Francisco Silva', 591, 'Senha33');

-- Insere em SUPERVISIONA
INSERT INTO SUPERVISIONA (cpf_gerente, matricula_empregado) VALUES (675, 1);
INSERT INTO SUPERVISIONA (cpf_gerente, matricula_empregado) VALUES (348, 1);
INSERT INTO SUPERVISIONA (cpf_gerente, matricula_empregado) VALUES (675, 2);
INSERT INTO SUPERVISIONA (cpf_gerente, matricula_empregado) VALUES (591, 3);

-- Insere em PRODUTO
INSERT INTO PRODUTO (area, preco, codigo_numerico) VALUES ('Area1', 100.0, 1);
INSERT INTO PRODUTO (area, preco, codigo_numerico) VALUES ('Area2', 200.0, 2);
INSERT INTO PRODUTO (area, preco, codigo_numerico) VALUES ('Area3', 300.0, 3);

-- Insere em VENDA
INSERT INTO VENDA (data, quantidade, valor_total, maticula_vendedor, codigo_numerico_produto) VALUES ('2022-01-01', 10, 1000.0, 1, 1);
INSERT INTO VENDA (data, quantidade, valor_total, maticula_vendedor, codigo_numerico_produto) VALUES ('2022-02-01', 10, 2000.0, 2, 2);
INSERT INTO VENDA (data, quantidade, valor_total, maticula_vendedor, codigo_numerico_produto) VALUES ('2022-03-01', 10, 3000.0, 3, 3);