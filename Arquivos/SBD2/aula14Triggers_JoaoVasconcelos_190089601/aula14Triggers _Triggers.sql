-- -------------   << aula14Triggers >>   ---------------
--
--                SCRIPT DE Trigger 
--
-- Data de Criacao ........: 24/06/2024
-- Autor(es) ..............: João Lucas Pinto Vasconcelos
-- Banco de Dados .........: MySql 8.0
-- Base de Dados (nome) ...: aula14Triggers
--
-- Alteracoes no Script
--   06/06/2020 - ajustes na organizacao do script
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Triggers (serao implementadas por VOCE)
--
-- -------------------------------------------------------

-- Quando a quantidade de caracteres do nome do cliente for menor ou igual a 4, o nome do cliente será nulo para interromper a inserção.
DELIMITER //
CREATE TRIGGER trg_1 BEFORE INSERT ON tbl_cliente
FOR EACH ROW
BEGIN
    IF (CHAR_LENGTH(NEW.cliente_nome)<=4) THEN
        SET NEW.cliente_nome = NULL;
    END IF;
END//
DELIMITER ;

-- Quando o cliente_id ou produto_id não existir na tabela, o cliente_id e produto_id serão nulos para interromper a inserção.
DELIMITER //
CREATE TRIGGER trg_2 BEFORE INSERT ON tbl_compra
FOR EACH ROW
BEGIN
    DECLARE cliente_exists INT;
    DECLARE produto_exists INT;

    SELECT COUNT(cliente_id) INTO cliente_exists FROM tbl_cliente WHERE cliente_id = NEW.cliente_id;
    SELECT COUNT(produto_id) INTO produto_exists FROM tbl_produto WHERE produto_id = NEW.produto_id;

    IF (cliente_exists = 0 OR produto_exists = 0) THEN
        SET NEW.cliente_id = NULL;
        SET NEW.produto_id = NULL;
    END IF;
END//
DELIMITER ;


-- Quando o email do cliente for diferente de nulo, o email do cliente será inserido na tabela newsletter.
DELIMITER //
CREATE TRIGGER trg_3 BEFORE INSERT ON tbl_cliente
FOR EACH ROW
BEGIN
    IF(NEW.cliente_email IS NOT NULL) THEN
        INSERT INTO tbl_newsletter SET news_email = NEW.cliente_email;
    END IF;
END//
DELIMITER ;