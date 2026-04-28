-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE POPULAR (DML)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Raquel Temóteo Eucaria Pereira da Costa, Vinicius Roriz Meireles Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas

-- 
-- Ultimas Alteracoes
--   24/03/2024 => Criação dos scripts
--   31/03/2024 => Adição de mais tuplas           
--
-- ---------------------------------------------------------

USE aula1exer2Evolucao3;

INSERT INTO GERENTE (cpf, nome, senha, email, formacao) 
VALUES 
(12345678900, 'João Silva', 'senha123', 'joao@email.com', 'Superior'),
(23456789012, 'Maria Oliveira', 'senha456', 'maria@email.com', 'Médio'),
(34567890123, 'Julia Costa', 'senha789', 'julia@email.com', 'Superior'),
(45678910111, 'Murilo', 'senha111', 'murilo@email.com', 'Superior'),
(56789101112, 'Fernando', 'senha222', 'fernando@email.com', 'Superior'),
(67891011121, 'Geovana', 'senha333', 'geovana@email.com', 'Superior'),
(78910111213, 'Lucas', 'senha444', 'lucas@email.com', 'Superior'),
(89101112131, 'Carla', 'senha555', 'carla@email.com', 'Superior'),
(91011121314, 'Roberto', 'senha666', 'roberto@email.com', 'Superior'),
(10111213141, 'Patricia', 'senha777', 'patricia@email.com', 'Superior'),
(11121314151, 'Ricardo', 'senha888', 'ricardo@email.com', 'Superior');


-- Inserções para a tabela AREA
INSERT INTO AREA (dsArea, gerente) 
VALUES 
('Saúde', 34567890123),
('Eletrônicos', 12345678900),
('Móveis', 23456789012),
('Roupas', 45678910111),
('Alimentos', 56789101112),
('Papelaria', 67891011121),
('Informática', 78910111213),
('Automotivo', 89101112131),
('Brinquedos', 91011121314),
('Livros', 10111213141),
('Esportes', 11121314151);

-- Inserções para a tabela EMPREGADO
INSERT INTO EMPREGADO (cpf, nome, senha, cep, estado, cidade, numero, complemento) 
VALUES 
(98765432100, 'Ana Santos', 'senha111', 1234567, 'SP', 'São Paulo', 123, NULL),
(65432100987, 'Maria', 'senha000', 0123456, 'SP', 'Guarulhos', 956, NULL),
(32100987654, 'Deoclecio', 'senha444', 9203810, 'GO', 'Anápolis', 574, NULL),
(43219876500, 'Wesley', 'senha555', 7583675, 'SC', 'Curitiba', 672, NULL),
(87654321098, 'Carlos Ferreira', 'senha222', 2345678, 'RJ', 'Rio de Janeiro', 456, 'Ap 101'),
(76543210987, 'Pedro', 'senha333', 3456789, 'MG', 'Belo Horizonte', 789, 'Casa 2'),
(78910111213, 'Lucas', 'senha444', 1234567, 'SP', 'São Paulo', 123, NULL), -- Lucas é também um gerente
(89101112131, 'Carla', 'senha555', 0123456, 'SP', 'Guarulhos', 956, NULL), -- Carla é também uma gerente
(91011121314, 'Roberto', 'senha666', 9203810, 'GO', 'Anápolis', 574, NULL), -- Roberto é também um gerente
(10111213141, 'Patricia', 'senha777', 7583675, 'SC', 'Curitiba', 672, NULL), -- Patricia é também uma gerente
(11121314151, 'Ricardo', 'senha888', 2345678, 'RJ', 'Rio de Janeiro', 456, 'Ap 101'); -- Ricardo é também um gerente

-- Inserções para a tabela PRODUTO
INSERT INTO PRODUTO (dsProduto, preco, area) 
VALUES 
('Monitor', 1400.00, 2),
('Cadeira Gamer', 700.90, 3),
('Suplemento x', 20.00, 1),
('Camiseta', 70.00, 4),
('Arroz', 17.99, 5),
('Grampo', 10.90, 6),
('Mouse', 50.00, 7),
('Pneu', 200.00, 8),
('Boneca', 100.00, 9),
('Livro', 30.00, 10),
('Bola', 75.00, 11);

-- Inserções para a tabela VENDA
INSERT INTO VENDA (data, vendedor) 
VALUES 
('2024-03-24 10:00:00', 98765432100),
('2024-03-25 11:00:00', 87654321098),
('2024-03-26 12:00:00', 76543210987),
('2024-03-26 13:00:00', 32100987654),
('2024-03-26 14:00:00', 43219876500),
('2024-03-26 15:00:00', 65432100987),
('2024-03-27 10:00:00', 78910111213),
('2024-03-28 11:00:00', 89101112131),
('2024-03-29 12:00:00', 91011121314),
('2024-03-30 13:00:00', 10111213141),
('2024-03-31 14:00:00', 11121314151);

-- Inserções para a tabela telefone
INSERT INTO telefone (cpfEmpregado, telefone) 
VALUES 
(98765432100, 5576943210022),
(87654321098, 5565932109822),
(32100987654, 5565998223210),
(43219876500, 5569822593210),
(32100987654, 5509822659321),
(76543210987, 5554921098722),
(78910111213, 5578910112213),
(89101112131, 5589101112131),
(91011121314, 5591011121314),
(10111213141, 5510111213141),
(11121314151, 5511121314151);

-- Inserções para a tabela contem
INSERT INTO contem (idVenda, idProduto, quantidade) 
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 2), -- Venda com 2 itens
(8, 8, 1),
(9, 9, 3),
(10, 10, 1),
(11, 11, 1),
(7, 8, 1); -- Venda com 2 itens

-- Inserções para a tabela habilitado
INSERT INTO habilitado (cpfEmpregado, idArea) 
VALUES 
(98765432100, 1),
(87654321098, 2),
(32100987654, 4),
(43219876500, 5),
(65432100987, 6),
(76543210987, 3),
(78910111213, 7),
(89101112131, 8),
(91011121314, 9),
(10111213141, 10),
(11121314151, 11);
