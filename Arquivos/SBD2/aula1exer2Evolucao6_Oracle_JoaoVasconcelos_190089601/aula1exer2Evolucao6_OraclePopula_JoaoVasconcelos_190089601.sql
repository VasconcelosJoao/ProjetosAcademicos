-- -------- < aula1exer2Evolucao6_Oracle > --------
--
--                    SCRIPT DE POPULAR (DML)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Izabella Alves Pereira
--                           Vinicius Roriz Meireles Silva
--  						 Lucas Pimentel Quintão
-- 						     Alex Gabriel Alves Faustino
--                           João Lucas Pinto Vasconcelos
--
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
--   29/03/2024 => Evolução          
--   04/04/2024 => Insere mais tuplas em todas as tabelas
-- 	 22/04/2024	=> Remoção das inserções em totalVenda de VENDA e subtotal de contem.
--    
-- ---------------------------------------------------------

INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('67123458901', 'João Silva', 456789);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('98765432109', 'Maria Souza', 236457);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('11122233344', 'Carlos Oliveira', 987654);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('55566677788', 'Ana Pereira', 765432);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('99988877766', 'Pedro Santos', 543210);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('44433322211', 'Juliana Costa', 321098);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('22211144433', 'Fernanda Martins', 876543);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('77788899911', 'Rafaela Oliveira', 654321);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('66655544433', 'Lucas Pereira', 432109);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('33322211144', 'Mariana Silva', 210987);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('88899911122', 'Eduardo Souza', 012789);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('12345678901', 'Ana Silva', 234567);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('54329876109', 'João Santos', 345678);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('45612378901', 'Maria Oliveira', 745689);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('98743210965', 'Pedro Costa', 856790);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('23456789012', 'Carla Ferreira', 678901);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('56789012345', 'Marcos Lima', 789012);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('45378961201', 'Luana Rodrigues', 812903);
INSERT INTO JLPV_PESSOA (cpf, nome, senha) VALUES  ('77766655544', 'Camila Santos', 567890);


INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('67123458901', 'joaos@gmail.com', 'medio');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('98765432109', 'marias@gmail.com','mestrado');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('11122233344', 'carloso@gmail.com', 'superior');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('55566677788', 'anap@gmail.com', 'mestrado');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('99988877766', 'pedros@gmail.com', 'superior');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('12345678901', 'anas@gmail.com', 'superior');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('54329876109', 'joaosa@gmail.com', 'superior');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('45612378901', 'mariao@gmail.com', 'superior');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('98743210965', 'pedroc@gmail.com', 'superior');
INSERT INTO JLPV_GERENTE (cpf, email, formacao) VALUES ('44433322211', 'julianac@gmail.com', 'doutorado');


INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('22211144433', 100000, 04571020, 'São Paulo', 'SP', 123, 'apto 101');
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('77788899911', 100001, 22071010, 'Rio de Janeiro', 'RJ', 456, 'apto 202');
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('66655544433', 100002, 30190000, 'Belo Horizonte', 'MG', 789, 'casa 1');
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('33322211144', 100003, 80240000, 'Curitiba', 'PR', 654, 'casa 2');
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('88899911122', 100004, 40140090, 'Salvador', 'BA', 321, 'apto 303');
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('23456789012', 100005, 1234567, 'São Paulo', 'SP', 123, NULL);
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('56789012345', 100006, 0123456, 'Anápolis', 'GO', 938, NULL);
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('45378961201', 100007, 9203810, 'Belo Horizonte', 'MG', 625, NULL);
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('98743210965', 100008, 2345678, 'Guarulhos', 'SP', 519, 'apto 333');
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('77766655544', 100009, 50060000, 'Recife', 'PE', 987, 'casa 3');
INSERT INTO JLPV_EMPREGADO (cpf, matricula, cep, cidade, uf, numero, complemento) VALUES ('44433322211', 100010, 23123445, 'Guarulhos', 'PE', 123, NULL);


INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5576943210022, 100000);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5565932109822, 100001);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5554921098722, 100002);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5543819000022, 100003);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5532714009022, 100004);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5532097140022, 100005);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5540090232712, 100006);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5532702214009, 100007);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5530027149022, 100008);
INSERT INTO JLPV_TELEFONE (telefone, matricula_empregado) VALUES (5521615000022, 100009);


INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (1, 'Saúde', '44433322211');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (2, 'Eletrônicos', '44433322211');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (3, 'Móveis', '98765432109');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (4, 'Alimentos', '11122233344');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (5, 'Vestuário', '55566677788');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (6, 'Limpeza', '99988877766');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (7, 'Automotivo', '54329876109');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (8, 'Esportes', '12345678901');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (9, 'Livros', '45612378901');
INSERT INTO JLPV_AREA (idArea, nomeArea, cpfGerente) VALUES (10, 'Papelaria', '98743210965');


INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (1, 'Termômetro', 50.00, 1);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (2, 'Celular', 1500.00, 2);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (3, 'Sofá', 1000.00, 3);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (4, 'Arroz', 20.00, 4);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (5, 'Camiseta', 30.00, 5);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (6, 'Detergente', 5.00, 6);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (7, 'Pneu', 300.00, 7);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (8, 'Bola', 50.00, 8);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (9, 'Livro', 60.00, 9);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (10, 'Borracha', 10.00, 10);
INSERT INTO JLPV_PRODUTO (codigoProduto, nomeProduto, preco, idArea) VALUES (11, 'Caderno', 25.00, 10);


INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (1, TO_DATE('2024-03-29', 'YYYY-MM-DD'),  100000);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (2, TO_DATE('2024-03-29', 'YYYY-MM-DD'),  100001);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (3, TO_DATE('2024-03-29', 'YYYY-MM-DD'),  100002);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (4, TO_DATE('2024-03-29', 'YYYY-MM-DD'),  100003);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (5, TO_DATE('2024-03-29', 'YYYY-MM-DD'),  100004);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (6, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 100005);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (7, TO_DATE('2024-04-04', 'YYYY-MM-DD'), 100006);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (8, TO_DATE('2024-04-04', 'YYYY-MM-DD'),  100007);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (9, TO_DATE('2024-04-04', 'YYYY-MM-DD'),  100008);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (10, TO_DATE('2024-04-04', 'YYYY-MM-DD'),  100009);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (11, TO_DATE('2024-04-12', 'YYYY-MM-DD'),  100000);
INSERT INTO JLPV_VENDA (idVenda, data, matricula_empregado) VALUES (12, TO_DATE('2024-04-12', 'YYYY-MM-DD'),  100000);


INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (1, 1,  2);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (2, 2,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (3, 3,  2);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (4, 4,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (4, 7,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (5, 5,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (5, 8,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (6, 6,  2);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (7, 10,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (7, 11,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (8, 9,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (9, 6,  2);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (10, 6,  6);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (11, 9,  1);
INSERT INTO JLPV_CONTEM (idVenda, codigoProduto, quantidadeProduto) VALUES (11, 6,  2);