-- Criar uma procedure que ao passar o id de um usuario, ele associe a todas as vagas existentes no sistema
USE `tratofeito`;
DROP procedure IF EXISTS `applyAllUser`;

DELIMITER $$
USE `tratofeito`$$
CREATE DEFINER=`root`@`%` PROCEDURE `applyAllUser`(usuario INT)
BEGIN
    DECLARE vaga INT;
    DECLARE qtd_vaga INT;
    DECLARE i INT DEFAULT 0;
    
    SET qtd_vaga = (SELECT count(id) FROM vagas);
    
    WHILE i < qtd_vaga DO
        
        SET vaga = (SELECT id FROm vagas LIMIT i,1);
        
        INSERT INTO `vagas_has_colaboradores` (`vagas_id`, `colaboradores_id`) VALUES (vaga, usuario);
        
        SET i = i+1;
    
    END WHILE;
END$$

DELIMITER ;

-- Criar um procedure que ao passar o id de um empresa, ele set como excluido a coluna situacao para as vagas desta empresa
USE `tratofeito`;
DROP procedure IF EXISTS `disableAllVagas`;

DELIMITER $$
USE `tratofeito`$$
CREATE DEFINER=`root`@`%` PROCEDURE `disableAllVagas`(empresa INT)
BEGIN
    DECLARE qtd_vagas INT;
    DECLARE i INT DEFAULT 0;
    DECLARE vaga int;
    
    SET qtd_vagas = (SELECT count(id) FROM vagas WHERE empresas_id = empresa);
    
    WHILE i < qtd_vagas DO
        
        SET vaga = (SELECT id FROM vagas WHERE empresas_id = empresa LIMIT i,1);
    
        UPDATE `vagas` SET `situacao`='Excluido' WHERE `id`=vaga;
        
        SET i = i + 1;
    END WHILE;
    
END$$

DELIMITER ;


-- Procedure que retorne todos os e nome, emaisl de todas as bases de dados
USE `tratofeito`;
DROP procedure IF EXISTS `allEmailAndNames`;

DELIMITER $$
USE `tratofeito`$$
CREATE DEFINER=`root`@`%` PROCEDURE `allEmailAndNames`(allSchemes VARCHAR(250))
BEGIN 
    DECLARE qtd INT; 
    DECLARE i INT DEFAULT 0;
    
    SET qtd = (SELECT length(allSchemes) - length(REPLACE(allSchemes, ',', ''))); 
    
    WHILE i <= qtd DO 
        IF (SELECT LOCATE("barbearia", AllSchemes)) > 0 then 
            select
                bc.email
            from 
                barbearia.clientes bc 
            UNION 
                SELECT
                tc.email
            FROM 
                tratofeito.colaboradores tc;
        END IF; 
        SET i = i+1;
    end while; 
END$$

DELIMITER ;

