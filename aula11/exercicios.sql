/*
  `senha` VARCHAR(150) NOT NULL,
  `nome` VARCHAR(42) NULL,
  `email` VARCHAR(60) NULL,
  `celular` VARCHAR(14) NULL,
  `telefone` VARCHAR(14) NULL,
  `cidade` VARCHAR(65) NULL,
*/

-- 1. criar uma funcao capaz de abreviar nomes, por exemplo, entrada: Victor Luis Santos, Retorno Victor L. Santos
DELIMITER $$
CREATE FUNCTION `create_nick_name`(nome VARCHAR(250)) 
RETURNS varchar(42)
BEGIN
	DECLARE nickname VARCHAR(42);
    DECLARE primeiro_letra VARCHAR(1);
    DECLARE primeiro_restante VARCHAR(29);
    DECLARE primeiro_nome VARCHAR(30);
    DECLARE fatia_meio VARCHAR(220);
    DECLARE letra_meio VARCHAR(2);
	DECLARE ultimo_letra VARCHAR(1);
    DECLARE ultimo_restante VARCHAR(29);
    DECLARE ultimo_nome VARCHAR(30);
    
    SET primeiro_letra = (SELECT UPPER(SUBSTR(TRIM(nome), 1, 1)));
    
    SET primeiro_restante = (SELECT 
								LOWER(
									SUBSTR(TRIM(nome),
											2,
										LENGTH(
											SUBSTRING_INDEX(TRIM(nome), 
                                            ' ', 
                                            1)
										)
									)
								)
							);
    
    SET primeiro_nome = (SELECT CONCAT(primeiro_letra,primeiro_restante));
    
    SET ultimo_letra = (SELECT UPPER(SUBSTR(SUBSTRING_INDEX(TRIM(nome), ' ', -1), 1,1)));
    
    SET ultimo_restante = (SELECT 
								LOWER(
									SUBSTR(
										SUBSTRING_INDEX(
											TRIM(nome), 
                                            ' ', -1)
									, 2,
                                    LENGTH(
											SUBSTRING_INDEX(TRIM(nome), 
                                            ' ', 
                                            -1)
										)
                                    )));
    
    SET ultimo_nome = (SELECT CONCAT(ultimo_letra, ultimo_restante));
    
    SET fatia_meio = (SELECT SUBSTR(nome, 
								LENGTH(primeiro_nome)+1,
                                (LENGTH(primeiro_nome)+LENGTH(ultimo_nome))
                                )
    
						);
    
    SET letra_meio = (SELECT CONCAT(UPPER(SUBSTR(fatia_meio, 1,1)),'.'));
    
	SET nickname = (SELECT CONCAT(primeiro_nome,' ',letra_meio,' ', ultimo_nome));

	RETURN nickname;
END$$
DELIMITER ;


-- 2. Ao inserir um nome na tabela usuarios, se o nome for maior que os 42 estipulados, ele aplicara a funcao a cima
CREATE TRIGGER `cartao_azul`.`usuarios_BEFORE_INSERT` BEFORE INSERT ON `usuarios` FOR EACH ROW
BEGIN
	IF LENGTH(NEW.identificador) > 11 THEN
		SET NEW.tipo = 'CNPJ';
	ELSE
		SET NEW.tipo = 'CPF';
	END IF;
    
    IF LENGTH(NEW.nome) = 42 THEN
		SET NEW.nome = CREATE_NICK_NAME(NEw.nome);
    END IF;
END

-- 3. A mesma validacao a cima deve ser aplicada nos casos de update a tabela usuarios
CREATE TRIGGER `cartao_azul`.`usuarios_BEFORE_UPDATE` BEFORE UPDATE ON `usuarios` FOR EACH ROW
BEGIN
    IF LENGTH(NEW.nome) = 42 THEN
		SET NEW.nome = CREATE_NICK_NAME(NEw.nome);
    END IF;
END

-- 4. implementar funcao capaz de determinar a primeira letra de de uma string como maiusculo, exmeplo: saO pAuLo, retorno Sao Paulo
delimiter $$

CREATE DEFINER=`root`@`%` FUNCTION `upFirst`(palavra VARCHAR(40)) RETURNS varchar(40) CHARSET utf8 COLLATE utf8_bin
BEGIN
    DECLARE primeira_letra VARCHAR(1);
    DECLARE restante_palavra VARCHAR(39);
    
    SET primeira_letra = (SELECT UPPER(SUBSTR(palavra, 1,1)));
    SET restante_palavra = (SELECT LOWER(SUBSTR(palavra, 2, LENGTH(palavra))));
    
RETURN CONCAT(primeira_letra,restante_palavra);
END$$


USE `cartao_azul`;
DROP function IF EXISTS `checknoriz`;

DELIMITER $$
USE `cartao_azul`$$
CREATE FUNCTION `checknoriz`(nome VARCHAR(42)) RETURNS varchar(42)
BEGIN
    DECLARE qtd_palavras INT;
    DECLARE palavra VARCHAR(25);
    DECLARE frase VARCHAR(42) DEFAULT '';
    DECLARE ind INT DEFAULT 1;
    
    SET qtd_palavras = (
                            SELECT 
                                LENGTH(nome) 
                                    - LENGTH(REPLACE(nome, ' ', ''))+1
                                    );

    WHILE ind <= qtd_palavras DO
        IF ind = 1 THEN
            SET palavra = (SELECT SUBSTRING_INDEX(nome, ' ', 1));
            SET frase = upFirst(palavra);
        ELSE
            SET palavra = (SELECT substr(nome,
                                    length(SUBSTRING_INDEX(nome, 
                                    ' ', 
                                    ind-1))+2,
                                    length(SUBSTRING_INDEX(nome, 
                                    ' ', 
                                    ind))-(length(SUBSTRING_INDEX(nome, 
                                    ' ', ind-1))+1)
                            ));
            SET frase = CONCAT(frase,' ',upFirst(palavra));
        END IF;
        
        SET ind = ind + 1;
    END WHILE;

    RETURN frase;
END$$

DELIMITER ;

-- 5. ao inserir nome de cidade, setar como maiuscula a primeira letra de cada parte do nome e cortar caso seja maior que os 65 estipulados
CREATE DEFINER=`root`@`%` TRIGGER `cartao_azul`.`usuarios_BEFORE_INSERT` BEFORE INSERT ON `usuarios` FOR EACH ROW
BEGIN
    IF LENGTH(NEW.identificador) > 11 THEN
        SET NEW.tipo = 'CNPJ';
    ELSE
        SET NEW.tipo = 'CPF';
    END IF;
    
    IF LENGTH(NEW.nome) = 42 THEN
        SET NEW.nome = CREATE_NICK_NAME(NEw.nome);
    END IF;
    
    SET NEW.cidade = checknoriz(NEW.cidade);
    
    SET NEW.uf = UPPER(NEW.uf);
    
END

-- 6. A mesma validacao a cima deve ser aplicada nos casos de update a tabela usuarios
CREATE DEFINER=`root`@`%` TRIGGER `cartao_azul`.`usuarios_BEFORE_UPDATE` BEFORE UPDATE ON `usuarios` FOR EACH ROW
BEGIN
    IF LENGTH(NEW.nome) = 42 THEN
        SET NEW.nome = CREATE_NICK_NAME(NEw.nome);
    END IF;
    
    SET NEW.cidade = checknoriz(NEW.cidade);
    
    SET NEW.uf = UPPER(NEW.uf);
END

-- 7. funcao capaz de limpar numero de telefone, cpf e cnpj
CREATE FUNCTION `STR_REPLACE` (lstring VARCHAR(250), lplace VARCHAR(250), lsub VARCHAR(250))
RETURNS VARCHAR(250)
BEGIN

    DECLARE qtd_caracteres INT;
    DECLARE i INT DEFAULT 1;
    DECLARE retorno VARCHAR(250) DEFAULT lstring;
    DECLARE item VARCHAR(1);
    
    SET qtd_caracteres = (SELECT LENGTH(lplace));
    
    WHILE i <= qtd_caracteres DO
        SET item = (SELECT substr(lplace, i, 1));
        SET retorno = (SELECT REPLACE(retorno, item, lsub));
        SET i = i+1;
    END WHILE;

    RETURN retorno;
END
-- 8. aplicar a funcao a cima toda vez que um identificado, telefone e ou celular for ser inserido
-- 9. aplicar a funcao a cima toda vez que um identificado, telefone e ou celular for ser atualizado