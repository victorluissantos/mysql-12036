/**PROCEDURE*/
use `tratofeito`;

ALTER TABLE `tratofeito`.`colaboradores` 
ADD COLUMN `rua` VARCHAR(70) NULL AFTER `telefone`,
ADD COLUMN `numero` VARCHAR(12) NULL AFTER `rua`,
ADD COLUMN `bairro` VARCHAR(40) NULL AFTER `numero`,
ADD COLUMN `cidade` VARCHAR(60) NULL AFTER `bairro`;



USE `tratofeito`;
DROP procedure IF EXISTS `geolocate`;

DELIMITER $$
USE `tratofeito`$$
CREATE PROCEDURE `geolocate` (idp INT, ids INT)
BEGIN
	DECLARE bairrop VARCHAR(60);
    DECLARE bairros VARCHAR(60);
    DECLARE cidadep VARCHAR(60);
    DECLARE cidades VARCHAR(60);
    DECLARE ruap VARCHAR(60);
    DECLARE ruas VARCHAR(60);
    DECLARE parp INT;
    DECLARE pars INT;
    DECLARE distancia INT;
    
    SET bairrop = (SELECT bairro FROM colaboradores WHERE id = idp);
    SET bairros = (SELECT bairro FROM colaboradores WHERE id = ids);

    SET cidadep = (SELECT cidade FROM colaboradores WHERE id = idp);
    SET cidades = (SELECT cidade FROM colaboradores WHERE id = ids);

    SET ruap = (SELECT rua FROM colaboradores WHERE id = idp);
    SET ruas = (SELECT rua FROM colaboradores WHERE id = ids);
    
    IF cidadep = cidades THEN
		IF bairrop = bairros THEN
			IF ruap = ruas THEN
            
				SET parp= (SELECT numero FROM colaboradores WHERE id = idp);
				SET pars= (SELECT numero FROM colaboradores WHERE id = ids);
				IF parp>pars THEN
					SET distancia = (parp-pars)*10;
				ELSE
					SET distancia = (pars-parp)*10;
				END IF;
            
				SET parp= (SELECT MOD(numero,2) FROM colaboradores WHERE id = idp);
                SET pars= (SELECT MOD(numero,2) FROM colaboradores WHERE id = ids);
                
                IF parp<>pars THEN
					SET distancia = distancia+5;
                END IF;
                
                SELECT CONCAT("O coalborador ",idp," mora a aproximadamente ",distancia,"metros do colaborador:",ids);
            ELSE
				SELECT "Colaboradores moram em ruas distintas" as `msg`;
            END IF;
		ELSE
			SELECT "Colaboradores moram em bairros distintos" as `msg`;
        END IF;
	ELSE
		SELECT "Colaboradores moram em cidades distintas" as `msg`;
    END IF;

END$$

DELIMITER ;

