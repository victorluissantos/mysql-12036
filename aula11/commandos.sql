CREATE SCHEMA `cartao_azul` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

CREATE TABLE `cartao_azul`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `identificador` VARCHAR(14) NOT NULL,
  `senha` VARCHAR(150) NOT NULL,
  `nome` VARCHAR(42) NULL,
  `email` VARCHAR(60) NULL,
  `celular` VARCHAR(14) NULL,
  `telefone` VARCHAR(14) NULL,
  `uf` ENUM('PR', 'SP', 'SC', 'RS', 'SE') NOT NULL DEFAULT 'PR',
  `cidade` VARCHAR(65) NULL,
  `tipo` ENUM('CPF', 'CNPJ') NOT NULL DEFAULT 'CPF',
  `situacao` ENUM('Ativo', 'Inativo', 'Bloqueado', 'Suspenso', 'Excluído') NULL DEFAULT 'Ativo',
  PRIMARY KEY (`id`));


USE `cartao_azul`;

DELIMITER $$

DROP TRIGGER IF EXISTS cartao_azul.usuarios_BEFORE_INSERT$$
USE `cartao_azul`$$
CREATE DEFINER = CURRENT_USER TRIGGER `cartao_azul`.`usuarios_BEFORE_INSERT` BEFORE INSERT ON `usuarios` FOR EACH ROW
BEGIN
  IF LENGTH(NEW.identificador) > 11 THEN
    SET NEW.tipo = 'CNPJ';
  ELSE
    SET NEW.tipo = 'CPF';
  END IF;
END$$
DELIMITER ;


SELECT 
    CONCAT(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1),
            ' ',
            CONCAT(SUBSTRING(SUBSTRING('victor LuiS Santos',
                            LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) + 2,
                            LENGTH('victor LuiS Santos') - (LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) + LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', - 1)) + 2)),
                        1,
                        1),
                    '.'),
            ' ',
            SUBSTRING_INDEX('victor LuiS Santos', ' ', - 1)) AS `nome`;

SELECT 
    SUBSTRING_INDEX('victor LuiS Santos', ' ', 1) AS `primeiro`,
    SUBSTRING_INDEX('victor LuiS Santos', ' ', - 1) AS `segundo`,
    LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) AS `total_p`,
    LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', - 1)) AS `total_s`,
    SUBSTRING('victor LuiS Santos',
        LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) + 2,
        LENGTH('victor LuiS Santos') - (LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) + LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', - 1)) + 2)),
    SUBSTRING(SUBSTRING('victor LuiS Santos',
            LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) + 2,
            LENGTH('victor LuiS Santos') - (LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) + LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', - 1)) + 2)),
        1,
        1) AS `PRIMEIRA`,
  CONCAT(SUBSTRING(SUBSTRING('victor LuiS Santos',
            LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) + 2,
            LENGTH('victor LuiS Santos') - (LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', 1)) + LENGTH(SUBSTRING_INDEX('victor LuiS Santos', ' ', - 1)) + 2)),
        1,
        1), '.') AS `Sigla`;