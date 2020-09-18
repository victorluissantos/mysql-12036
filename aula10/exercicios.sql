-- 1 CRIAR UMA TRIGGER EM empresas, onde ao isnerir telefone, seja limpo de caracter, ou seja:
-- EXemplo: entrada: (41) 99850-0111 , Saida: 41998500111
CREATE TRIGGER `tratofeito`.`empresas_BEFORE_INSERT` BEFORE INSERT ON `empresas` FOR EACH ROW
BEGIN
	SET NEW.telefone = REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(NEW.telefone, '(', '')
                            , ')', '')
					,'-','')
				, ' ','');
END


-- 2 Ao tentar inserir uma nova vaga, validar que a mesma ja nao esta cadastrada nesta empresa, ou seja, cada empresa so podera cadastrar a vaga uma unica vez, a validacao se da pelo: titulo e descritivo
CREATE DEFINER=`root`@`%` TRIGGER `tratofeito`.`vagas_BEFORE_INSERT` BEFORE INSERT ON `vagas` FOR EACH ROW
BEGIN

	DECLARE vaga_id INTEGER;
    SET vaga_id = null;
    SET vaga_id = (SELECT 
						v.id 
					FROM 
						vagas v
					WHERE
						v.empresas_id = NEW.empresas_id
							AND
						UPPER(v.titulo) = UPPER(NEW.titulo)
							AND
						UPPER(v.descritivo) = UPPER(NEW.descritivo)
					);
	
    IF vaga_id is not null then
		SET NEW.situacao = 'Excluido';
    END IF;
END

-- 3 CRIAR UMA TRIGGER EM colaboradores, onde ao isnerir telefone, seja limpo de caracter, ou seja:
-- EXemplo: entrada: (41) 99850-0111 , Saida: 41998500111
CREATE DEFINER=`root`@`%` TRIGGER `tratofeito`.`colaboradores_BEFORE_INSERT` 
BEFORE INSERT ON `colaboradores` 
FOR EACH ROW
BEGIN
	SET NEW.email = UPPER(NEW.email);

	SET NEW.telefone = REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(NEW.telefone, '(', '')
                            , ')', '')
					,'-','')
				, ' ','');
    
END

-- 4 Ao tentar inserir em vagas_has_colboradores, validar se o mesmo ja nao esta associado a vaga, caso esteja, somente realizar o update, ou seja, nao deixar realizar dois inserts do mesmo usuario na mesma vaga
USE `tratofeito`;

DELIMITER $$

DROP TRIGGER IF EXISTS tratofeito.vagas_has_colaboradores_BEFORE_INSERT$$
USE `tratofeito`$$
CREATE DEFINER = CURRENT_USER TRIGGER `tratofeito`.`vagas_has_colaboradores_BEFORE_INSERT` BEFORE INSERT ON `vagas_has_colaboradores` FOR EACH ROW
BEGIN
	DECLARE vagahascolborador INTEGER;
    SET vagahascolborador = (
			SELECT 
				id 
			FROM 
				vagas_has_colaboradores
			WHERE
				vagas_id = NEW.vagas_id
                AND
                colaboradores_id = NEW.colaboradores_id
        );
	IF vagahascolborador IS NOT NULL THEN
		SET NEW.situacao = 'Excluido';
    END IF;
END$$
DELIMITER ;


-- 5 Ao tentar cadastrar um email que esteja na lista de ENUM('live', 'hotmail', 'gmail', 'yahoo') a trigger ira substituir o hot pelo primeiro nome fantazia da empresa, exemplo:
-- Entrada: augusto@live.com, Saida: augusto@embalagens.com, onde o nome fantasia = Embalagens industrial LTDA
-- OBS: isso so vai ocorrer se o nome fantasia for diferente de null
CREATE DEFINER=`root`@`%` TRIGGER `tratofeito`.`empresas_BEFORE_INSERT` BEFORE INSERT ON `empresas` FOR EACH ROW
BEGIN
	DECLARE hostname VARCHAR(25);

	SET NEW.telefone = REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(NEW.telefone, '(', '')
                            , ')', '')
					,'-','')
				, ' ','');
    
    SET hostname = (substring_index(
							substring_index(NEW.email, '@', -1), '.', 1)
						);
                        
	IF hostname in ('live', 'hotmail', 'gmail', 'yahoo') THEN
		IF NEW.nome_fantasia IS NOT NULL THEN
			SET NEW.email = (lower(substring_index(NEW.nome_fantasia, ' ', 1)));
		END IF;
    END IF;
END