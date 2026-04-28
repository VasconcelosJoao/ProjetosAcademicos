-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE CONSULTAS (DML)
--
-- Data Criacao ...........: 15/04/2024
-- Autor(es) ..............: Lucas Pimentel Quintão  
--                           Joao Vasconcelos                        
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2evolucao5
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 05 Consultas
--         => 01 View
-- 
-- Ultimas Alteracoes
-- 		15/04/2024 => Adiciona 5 consultas   
--    21/04/2024 => Correção de erros nas consultas
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula1exer2evolucao5;


-- BASE DE DADOS
USE aula1exer2evolucao5;


-- CONSULTAS
-- A) Consultar todas as vendas feitas por um empregado específico
--    que será definido pelo usuário através da chave primária do 
--    empregado nessa pesquisa (usuário definirá um empregado
--    específico na consulta);
SELECT * 
  FROM VENDA 
  WHERE matriculaEmpregado = ?; -- substitua ? pela matrícula específica

-----------------------------------------------------------

-- B) Relacionar todos os dados de uma venda específica com todas
--    as informações dos produtos comercializados por esta venda e
--    mostrar o preço total por item da venda (usuário definirá uma
--    venda específica na consulta);
SELECT
    V.idVenda, V.data, V.matriculaEmpregado, P.nomeProduto,
    P.preco AS precoUnitario, C.quantidadeProduto, 
    (P.preco * C.quantidadeProduto) AS precoTotalPorItem
  FROM VENDA V
       JOIN CONTEM C ON V.idVenda = C.idVenda
       JOIN PRODUTO P ON C.idProduto = P.idProduto
  WHERE V.idVenda = ?; -- substitua ? pelo id da venda específica
    
-----------------------------------------------------------

-- C) Mostrar todos os empregados da empresa que NÃO sejam gerentes
--    em ordem alfabética crescente do nome do empregado;
SELECT P.nome
 FROM EMPREGADO E
      JOIN PESSOA P ON E.cpf = P.cpf
      LEFT JOIN GERENTE G ON E.cpf = G.cpf
 WHERE G.cpf IS NULL
 ORDER BY P.nome ASC;

-----------------------------------------------------------

-- D) Consultar e mostrar a quantidade de CADA produto que foi
--    vendido por esta empresa. Esta consulta deverá ser
--    implementada como uma VIEW (visão em SQL);
CREATE VIEW VendasPorProduto AS
 SELECT P.nomeProduto, P.idProduto,
        SUM(C.quantidadeProduto) AS TotalUnidadesVendidas,
        AVG(P.preco) AS PrecoMedio,
        COUNT(DISTINCT V.idVenda) AS NumeroDeVendas
  FROM PRODUTO P
       JOIN CONTEM C ON P.idProduto = C.idProduto
       JOIN VENDA V ON C.idVenda = V.idVenda
  GROUP BY P.idProduto, P.nomeProduto
  ORDER BY TotalUnidadesVendidas DESC;
    
-- Acionando a VIEW
SELECT *
  FROM VendasPorProduto;

-----------------------------------------------------------

-- E) Solicitar ao usuário qualquer parte do nome de um produto
--    e apresentar seu código, nome e quantidade de vendas em 
--    ordem alfabética do nome do produto de forma decrescente.
SELECT P.idProduto, P.nomeProduto,
    SUM(C.quantidadeProduto) AS QuantidadeVendida
 FROM PRODUTO P
     JOIN CONTEM C ON P.idProduto = C.idProduto
 WHERE P.nomeProduto LIKE CONCAT('%', '?', '%') -- substitua ? pela parte do nome
GROUP BY P.idProduto, P.nomeProduto
ORDER BY P.nomeProduto DESC;

-----------------------------------------------------------