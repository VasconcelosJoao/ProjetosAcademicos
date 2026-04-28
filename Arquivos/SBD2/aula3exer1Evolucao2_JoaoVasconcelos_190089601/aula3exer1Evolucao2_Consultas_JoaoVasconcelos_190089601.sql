-- ------------------- < aula3exer1Evolucao2 > -----------------------
--
--                    SCRIPT DE CONSULTAS (DQL)
--
-- Data Criacao ...........: 19/05/2024
-- Autor(es) ..............: Pablo Christianno Silva Guedes
--                           João Vasconcelos
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula3exer1Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- 		   => 03 Perfis
-- 		   => 05 Usuários
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula3exer1Evolucao2;


--   1)  Indicar todos os plantonistas por um setor específico fornecido pelo usuário da consulta, que será apresentada em ordem decrescente de horário;
SELECT p.nome, p.sexo, s.dsSetor, pertence.hora
FROM PLANTONISTA AS p
JOIN pertence ON p.matricula = pertence.matricula
JOIN SETOR AS s ON pertence.idSetor = s.idSetor
WHERE s.idSetor = 'Setor Escolhido'
ORDER BY pertence.hora DESC;


--   2)  Mostrar todos os plantonistas em uma data fornecida pelo usuário em ordem crescente de data (consulta no padrão DE__  ATÉ__  para datas), em que o intervalo DE e o ATÉ serão fornecidos pelo usuário;
SELECT p.nome, p.sexo, pertence.hora, s.dsSetor
FROM PLANTONISTA AS p
JOIN pertence ON p.matricula = pertence.matricula
JOIN SETOR AS s ON pertence.idSetor = s.idSetor
WHERE pertence.hora BETWEEN 'Data Inicial' AND 'Data Final' 
ORDER BY pertence.hora ASC;


--   3)  Consultar os plantonistas por parte do nome e mostrar todos os seus dados pessoais cadastrados e em qual setor (ou setores) ele realiza atividades, mostrando somente o nome do setor e os dados pessoais;
SELECT p.matricula, p.nome, p.sexo, s.dsSetor
FROM PLANTONISTA AS p
JOIN pertence ON p.matricula = pertence.matricula
JOIN SETOR AS s ON pertence.idSetor = s.idSetor
WHERE p.nome LIKE '%nome do plantonista%'; 
GROUP BY p.matricula, p.nome, p.sexo;


--   4)  Apresentar todas as especialidades e quantos plantonistas têm para cada uma destas especialidades cadastradas no banco de dados, inclusive as que NÃO tiverem plantonista no momento (zero plantonista na especialidade, mas apresentar para usuário saber qual área está sem plantonista);
SELECT e.nomeEspecialidade, COUNT(p.matricula) AS qtdePlantonistas
FROM ESPECIALIDADE AS e
LEFT JOIN possui ON e.idEspecialidade = possui.idEspecialidade
GROUP BY e.nomeEspecialidade;


--   5)  Mostrar todos os plantonistas por nome e sexo por extenso por especialidades;
SELECT p.nome, p.sexo, e.nomeEspecialidade
FROM PLANTONISTA AS p
JOIN possui ON p.matricula = possui.matricula
JOIN ESPECIALIDADE AS e ON possui.idEspecialidade = e.idEspecialidade
ORDER BY p.nome, p.sexo, e.nomeEspecialidade;


--   6)  Apresentar todos os plantonistas em uma data específica, mas em um intervalo de horário de tal data desejada pelo usuário (consulta no padrão DE__  ATÉ__  para horários), sendo o intervalo DE e o ATÉ também fornecido pelo usuário.
SELECT p.nome, p.sexo, s.dsSetor, pertence.hora
FROM PLANTONISTA AS p
JOIN pertence ON p.matricula = pertence.matricula
JOIN SETOR AS s ON pertence.idSetor = s.idSetor
WHERE pertence.hora BETWEEN 'Data Inicial' AND 'Data Final'  
AND DATE(pertence.hora) = 'Data Escolhida'
ORDER BY pertence.hora ASC;
