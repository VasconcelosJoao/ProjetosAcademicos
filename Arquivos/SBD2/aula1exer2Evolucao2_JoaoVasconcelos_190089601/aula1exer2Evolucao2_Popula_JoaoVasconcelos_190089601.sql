-- -------- < aula1exer2Evolucao2 > --------
--
--                    SCRIPT DE POPULAR (DML)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: João Lucas Pinto Vasconcelos
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

USE aula1exer2Evolucao2;

-- Inserções para a tabela GERENTE
INSERT INTO GERENTE (cpf, nome, senha, email, formacao) 
VALUES 
(12345678900, 'João Silva', 'senha123', 'joao@email.com', 'Graduação'),
(23456789012, 'Maria Oliveira', 'senha456', 'maria@email.com', 'Mestrado'),
(34567890123, 'Julia Costa', 'senha789', 'julia@email.com', 'Graduação'),
(45678901234, 'Lucas Pereira', 'senha321', 'lucas@email.com', 'Doutorado'),
(56789012345, 'Carla Santos', 'senha654', 'carla@email.com', 'Graduação'),
(67890123456, 'Roberto Alves', 'senha987', 'roberto@email.com', 'Mestrado');

-- Inserções para a tabela AREA
INSERT INTO AREA (idArea, dsArea, idGerente) 
VALUES 
(1, 'Saúde', 34567890123),
(2, 'Eletrônicos', 12345678900),
(3, 'Móveis', 23456789012),
(4, 'Alimentos', 45678901234),
(5, 'Vestuário', 56789012345),
(6, 'Esportes', 67890123456);

-- Inserções para a tabela EMPREGADO
INSERT INTO EMPREGADO (cpf, nome, senha, matricula, cep, uf, cidade, numero, complemento) 
VALUES 
(98765432100, 'Ana Santos', 'senha111', 1, 1234567, 'SP', 'São Paulo', 123, NULL),
(87654321098, 'Carlos Ferreira', 'senha222', 2, 2345678, 'RJ', 'Rio de Janeiro', 456, 'Ap 101'),
(76543210987, 'Pedro', 'senha333', 3, 3456789, 'MG', 'Belo Horizonte', 789, 'Casa 2'),
(65432109876, 'Lucas', 'senha444', 4, 4567890, 'RS', 'Porto Alegre', 321, 'Ap 202'),
(54321098765, 'Julia', 'senha555', 5, 5678901, 'SC', 'Florianópolis', 654, NULL),
(43210987654, 'Roberto', 'senha666', 6, 6789012, 'PR', 'Curitiba', 987, 'Casa 3');

-- Inserções para a tabela PRODUTO
INSERT INTO PRODUTO (codigoProduto, dsProduto, preco, area) 
VALUES 
(1, 'Monitor', 1400.00, 2),
(2, 'Cadeira Gamer', 700.90, 3),
(3, 'Suplemento x', 20.00, 1),
(4, 'Notebook', 3000.00, 2),
(5, 'Mesa', 500.00, 3),
(6, 'Vitamina C', 30.00, 1);

-- Inserções para a tabela VENDA
INSERT INTO VENDA (idVenda, data, matricula) 
VALUES 
(1, '2024-03-24', 1),
(2, '2024-03-25', 2),
(3, '2024-03-26', 3),
(4, '2024-03-27', 4),
(5, '2024-03-28', 5),
(6, '2024-03-29', 6);

-- Inserções para a tabela telefone
INSERT INTO telefone (matricula, telefone) 
VALUES 
(1, 5576943210022),
(2, 5565932109822),
(3, 5554921098722),
(4, 5543910987622),
(5, 5532909876522),
(6, 5521898765422);

-- Inserções para a tabela contem
INSERT INTO contem (idVenda, idProduto, quantidade) 
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1),
(6, 6, 3);

-- Inserções para a tabela habilitado
INSERT INTO habilitado (empregado, idArea) 
VALUES 
(1, 1),
(2, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6);