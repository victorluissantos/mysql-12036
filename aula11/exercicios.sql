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
-- 5. ao inserir nome de cidade, setar como maiuscula a primeira letra de cada parte do nome e cortar caso seja maior que os 65 estipulados
-- 6. A mesma validacao a cima deve ser aplicada nos casos de update a tabela usuarios

-- 7. funcao capaz de limpar numero de telefone, cpf e cnpj
-- 8. aplicar a funcao a cima toda vez que um identificado, telefone e ou celular for ser inserido
-- 9. aplicar a funcao a cima toda vez que um identificado, telefone e ou celular for ser atualizado