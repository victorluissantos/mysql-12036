/* Deixa todos os caracteres a serem inseridos em email em caixa alta */
CREATE DEFINER=`root`@`%` TRIGGER `tratofeito`.`colaboradores_BEFORE_INSERT` 
BEFORE INSERT ON `colaboradores` 
FOR EACH ROW
BEGIN
	SET NEW.email = UPPER(NEW.email);
END

/* concatena o email a ser inserido com os ja existentes */
CREATE DEFINER=`root`@`%` TRIGGER `tratofeito`.`colaboradores_BEFORE_UPDATE` BEFORE UPDATE ON `colaboradores` FOR EACH ROW
BEGIN
	IF NEW.email <> OLD.email THEN
		SET NEW.email = CONCAT(NEW.email, ', ', OLD.email);
    END IF;
END

/*
1. deixar os emails em letra maiuscula
2. realizar a operacao de concat tambem nos updates dos telefones
*/

CREATE DEFINER=`root`@`%` TRIGGER `tratofeito`.`colaboradores_BEFORE_UPDATE` BEFORE UPDATE ON `colaboradores` FOR EACH ROW
BEGIN
	IF NEW.email <> OLD.email THEN
		SET NEW.email = UPPER(CONCAT(NEW.email, ', ', OLD.email));
    END IF;
    
    IF NEW.telefone <> OLD.telefone THEN
		SET NEW.telefone = CONCAT(NEW.telefone, ', ', OLD.telefone);
    END IF;
END


-- controlando situacao da associacao entre vagas e empresas
ALTER TABLE `tratofeito`.`vagas_has_colaboradores` 
ADD COLUMN `situacao` ENUM('Ativo', 'Inativo', 'Excluido') NOT NULL DEFAULT 'Ativo' AFTER `colaboradores_id`;


ALTER TABLE `tratofeito`.`vagas_has_colaboradores` 
ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`, `vagas_id`, `colaboradores_id`);
