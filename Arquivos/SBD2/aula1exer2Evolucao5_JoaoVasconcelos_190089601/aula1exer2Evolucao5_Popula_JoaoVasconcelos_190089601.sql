-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE POPULAR (DML)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Vinicius Roriz Meireles Silva
--                           Lucas Pimentel Quintão
--                           Joao Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2evolucao5
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- Ultimas Alteracoes
--   04/04/2024 => Insere mais tuplas em todas as tabelas
--   15/04/2024 => Altera o nome da base de dados para aula1exer2evolucao5  
-- ---------------------------------------------------------

USE aula1exer2evolucao5;

INSERT INTO PESSOA (cpf, nome, senha) VALUES
('67123458901', 'João Silva', '456789'),
('98765432109', 'Maria Souza', '236457'),
('11122233344', 'Carlos Oliveira', '987654'),
('55566677788', 'Ana Pereira', '765432'),
('99988877766', 'Pedro Santos', '543210'),
('44433322211', 'Juliana Costa', '321098'),
('22211144433', 'Fernanda Martins', '876543'),
('77788899911', 'Rafaela Oliveira', '654321'),
('66655544433', 'Lucas Pereira', '432109'),
('33322211144', 'Mariana Silva', '210987'),
('88899911122', 'Eduardo Souza', '012789'),
('12345678901', 'Ana Silva', '234567'),
('54329876109', 'João Santos', '345678'),
('45612378901', 'Maria Oliveira', '745689'),
('98743210965', 'Pedro Costa', '856790'),
('23456789012', 'Carla Ferreira', '678901'),
('56789012345', 'Marcos Lima', '789012'),
('45378961201', 'Luana Rodrigues', '812903'),
('77766655544', 'Camila Santos', '567890'),
('34578124920', 'Jiuliano Santos', '0243152'),
('52109215063', 'Matos da silva', '2050345');

INSERT INTO GERENTE (cpf, email, formacao) VALUES
('67123458901', 'joaos@gmail.com', 'medio'),
('98765432109', 'marias@gmail.com','mestrado'),
('11122233344', 'carloso@gmail.com', 'superior'),
('55566677788', 'anap@gmail.com', 'mestrado'),
('99988877766', 'pedros@gmail.com', 'superior'),
('12345678901', 'anas@gmail.com', 'superior'),
('54329876109', 'joaosa@gmail.com', 'superior'),
('45612378901', 'mariao@gmail.com', 'superior'),
('98743210965', 'pedroc@gmail.com', 'superior'),
('44433322211', 'julianac@gmail.com', 'doutorado'),
('34578124920', 'jiusantos@gmail.com', 'superior'),
('52109215063', 'smatos@gmail.com', 'superior');

INSERT INTO EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) 
VALUES
('22211144433', 100000, 04571020, 'São Paulo', 'SP', 123, 'apto 101'), 
('77788899911', 100001, 22071010, 'Rio de Janeiro', 'RJ', 456, 'apto 202'), 
('66655544433', 100002, 30190000, 'Belo Horizonte', 'MG', 789, 'casa 1'), 
('33322211144', 100003, 80240000, 'Curitiba', 'PR', 654, 'casa 2'), 
('88899911122', 100004, 40140090, 'Salvador', 'BA', 321, 'apto 303'), 
('23456789012', 100005, 1234567, 'São Paulo', 'SP', 123, NULL),
('56789012345', 100006, 0123456, 'Anápolis', 'GO', 938, NULL),
('45378961201', 100007, 9203810, 'Belo Horizonte', 'MG', 625, NULL),
('98743210965', 100008, 2345678, 'Guarulhos', 'SP', 519, 'apto 333'),
('77766655544', 100009, 50060000, 'Recife', 'PE', 987, 'casa 3'), 
('34578124920', 100010, 04571020, 'São Paulo', 'SP', 123, 'apto 101');

INSERT INTO TELEFONE (telefone, matriculaEmpregado)
VALUES
(5576943210022, 100000),
(5565932109822, 100001),
(5554921098722, 100002),
(5543819000022, 100003),
(5532714009022, 100004),
(5532097140022, 100005),
(5540090232712, 100006),
(5532702214009, 100007),
(5530027149022, 100008),
(5521615000022, 100009);

INSERT INTO AREA (nomeArea, cpfGerente)
VALUES
('Saúde', '44433322211'),
('Eletrônicos', '67123458901'),
('Móveis', '98765432109'),
('Alimentos', '11122233344'),
('Vestuário', '55566677788'),
('Limpeza', '99988877766'),
('Automotivo', '54329876109'),
('Esportes', '12345678901'),
('Livros', '45612378901'),
('Papelaria', '98743210965'),
('Brinquedos', '52109215063'),
('Jogos', '52109215063');

INSERT INTO PRODUTO (nomeProduto, preco, idArea)
VALUES
('Termômetro', 50.00, 1),
('Celular', 1500.00, 2),
('Sofá', 1000.00, 3),
('Arroz', 20.00, 4),
('Camiseta', 30.00, 5),
('Detergente', 5.00, 6),
('Pneu', 300.00, 7),
('Bola', 50.00, 8),
('Livro', 60.00, 9),
('Borracha', 10.00, 10),
('Caderno', 25.00, 10);

INSERT INTO VENDA (data, totalVenda, matriculaEmpregado)
VALUES
('2024-03-29', 100.00, 100000),
('2024-03-29', 1500.00, 100001),
('2024-03-29', 2000.00, 100002),
('2024-03-29', 40.00, 100003),
('2024-03-29', 80.00, 100004),
('2024-03-29', 10.00, 100005),
('2024-04-04', 35.00, 100006),
('2024-04-04', 50.00, 100007),
('2024-04-04', 100.00, 100008),
('2024-04-04', 30.00, 100009);

INSERT INTO CONTEM (idVenda, idProduto, subtotal, quantidadeProduto)
VALUES
(1, 1, 50.00, 2),
(2, 2, 1500.00, 1),
(3, 3, 1000.00, 2),
(4, 4, 20.00, 1),
(4, 7, 20.00, 1),
(5, 5, 30.00, 1),
(5, 8, 50.00, 1),
(6, 6, 5.00, 2),
(7, 10, 10.00, 1),
(7, 11, 25.00, 1),
(8, 9, 50.00, 1),
(9, 6, 50.00, 2),
(10, 6, 5.00, 6);