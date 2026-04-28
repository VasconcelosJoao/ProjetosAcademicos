-- ------------------- < aula3exer1Evolucao2 > -----------------------
--
--                    SCRIPT DE CRIACAO (DDL)
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
CREATE DATABASE
  IF NOT EXISTS aula3exer1Evolucao2;

USE aula3exer1Evolucao2;


-- TABELAS
CREATE TABLE PLANTONISTA (
	matricula INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    CONSTRAINT PLANTONISTA_PK PRIMARY KEY(matricula) 
) AUTO_INCREMENT = 1, ENGINE = InnoDB;


CREATE TABLE SETOR (
	idSetor INT NOT NULL AUTO_INCREMENT,
	dsSetor VARCHAR(30) NOT NULL,
    CONSTRAINT SETOR_PK PRIMARY KEY(idSetor),
    CONSTRAINT SETOR_UK UNIQUE KEY(dsSetor)
) AUTO_INCREMENT = 1, ENGINE = InnoDB;


CREATE TABLE ESPECIALIDADE (
	idEspecialidade INT NOT NULL AUTO_INCREMENT,
	nomeEspecialidade VARCHAR(30) NOT NULL,
    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY(idEspecialidade),
    CONSTRAINT ESPECIALIDE_UK UNIQUE KEY(nomeEspecialidade)
) AUTO_INCREMENT = 1, ENGINE = InnoDB;


CREATE TABLE pertence (
	matricula INT NOT NULL,
	idSetor INT NOT NULL,
	hora TIME NOT NULL,
    CONSTRAINT pertence_UK UNIQUE KEY(matricula, hora),
    CONSTRAINT pertence_PLANTONISTA_FK FOREIGN KEY(matricula)
		REFERENCES PLANTONISTA(matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT pertence_SETOR_FK FOREIGN KEY(idSetor)
		REFERENCES SETOR(idSetor)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
)  ENGINE = InnoDB;


CREATE TABLE possui (
	matricula INT NOT NULL,
	idEspecialidade INT NOT NULL DEFAULT 1,
    CONSTRAINT possui_PLANTONISTA_FK FOREIGN KEY(matricula)
		REFERENCES PLANTONISTA(matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY(idEspecialidade)
		REFERENCES ESPECIALIDADE(idEspecialidade)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
)  ENGINE = InnoDB;
