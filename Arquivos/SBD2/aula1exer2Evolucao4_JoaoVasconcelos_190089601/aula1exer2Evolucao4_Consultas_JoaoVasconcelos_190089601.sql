-- -------- < aula1exer2Evolucao4 > --------
--
--                    SCRIPT DE CONSULTAS (DQL)
--
-- Data Criacao ...........: 13/04/2024
-- Autor(es) ..............: Joao Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- Ultimas Alteracoes
--   13/04/2024 => Crição do script           
-- ---------------------------------------------------------




-- A) Consultar todas as vendas feitas por um empregado específico que será definido pelo usuário através da chave primária do empregado nessa pesquisa (usuário definirá um empregado específico na consulta);

/*
Esta consulta retorna detalhes de vendas realizadas por um empregado específico. 
Seleciona o nome do empregado, ID da venda, data, valor total, cidade e estado do empregado.
Junta as tabelas VENDA, EMPREGADO e PESSOA baseado na matrícula do empregado e CPF.
O usuário deve substituir 100001 pela matricula do empregado que deseja consultar.
*/

SELECT 
    P.nome,
    V.idVenda, V.data, V.totalVenda, 
    E.cidade, E.uf
FROM 
    VENDA V
JOIN 
    EMPREGADO E ON V.matriculaEmpregado = E.matricula 
JOIN 
    PESSOA P ON E.cpf = P.cpf
WHERE 
    E.matricula = 100001;

-- B) Relacionar todos os dados de uma venda específica com todas as informações dos produtos comercializados por esta venda e mostrar o preço total por item da venda (usuário definirá uma venda específica na consulta);

/*
Esta consulta retorna detalhes de uma venda específica, incluindo informações dos produtos vendidos e o preço total por item.
O usuário deve substituir 2 pelo ID da venda que deseja consultar.
*/

SELECT 
    V.idVenda, V.data, V.totalVenda, 
    C.quantidadeProduto, 
    P.nomeProduto, P.preco, 
    (C.quantidadeProduto * P.preco) AS totalPorItem
FROM 
    VENDA V
JOIN 
    CONTEM C ON V.idVenda = C.idVenda 
JOIN 
    PRODUTO P ON C.idProduto = P.idProduto
WHERE 
    V.idVenda = 2;

-- C) Mostrar todos os empregados da empresa que NÃO sejam gerentes em ordem alfabética crescente do nome do empregado;

/*
Esta consulta retorna todos os empregados que não são gerentes, ordenados alfabeticamente pelo nome.
*/

SELECT 
    E.matricula, P.nome
FROM 
    EMPREGADO E
JOIN 
    PESSOA P ON E.cpf = P.cpf
WHERE 
    E.cpf NOT IN (SELECT cpf FROM GERENTE)
ORDER BY 
    P.nome ASC;

-- D) Consultar e mostrar a quantidade de CADA produto que foi vendido por esta empresa (lembrar que só o código do produto NÃO identifica qual produto é para vários funcionários ou usuários finais da empresa, então reflita de quais atributos deverão ser apresentados e em qual sequência (ordenação) para atender o interesse do usuário final em suas atividades diárias com melhor qualidade e eficiência). Esta consulta deverá ser implementada como uma VIEW (visão em SQL);

/*
Esta consulta retorna a quantidade vendida de cada produto. 
A consulta será implementada como uma VIEW.
E o select que mostra esse VIEW ordena os produtos pela quantidade vendida de forma decrescente.
*/

CREATE OR REPLACE VIEW quantidade_vendida AS
SELECT 
    P.nomeProduto, 
    P.idProduto AS codigoProduto,
    SUM(C.quantidadeProduto) AS quantidadeVendida
FROM 
    PRODUTO P
JOIN 
    CONTEM C ON P.idProduto = C.idProduto
GROUP BY 
    P.idProduto, P.nomeProduto;

SELECT * FROM quantidade_vendida ORDER BY quantidadeVendida DESC;

-- E) Solicitar ao usuário qualquer parte do nome de um produto e apresentar seu código, nome e quantidade de vendas em ordem alfabética do nome do produto de forma decrescente.

/*
Esta consulta retorna o código, nome e quantidade vendida de produtos cujo nome contém um termo de pesquisa fornecido pelo usuário.
O usuário deve substituir "d" pelo termo de pesquisa.
*/

SELECT 
    P.idProduto, 
    P.nomeProduto, 
    SUM(C.quantidadeProduto) AS quantidadeVendida
FROM 
    PRODUTO P
JOIN 
    CONTEM C ON P.idProduto = C.idProduto
WHERE 
    P.nomeProduto LIKE '%a%'
GROUP BY 
    P.idProduto, P.nomeProduto
ORDER BY 
    P.nomeProduto DESC;