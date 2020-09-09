SELECT 
    *
FROM
    clientes;

INSERT INTO 
	`barbearia`.`clientes` 
	(`nome`, `email`, `uf`, `cidade`) 
VALUES 
	('Caroline Rosi', 'rosi.carol@reciclagemead.com.br', 'PR', 'Cambe');

UPDATE 
	`barbearia`.`clientes` 
SET 
	`nome`='Joao Pessoa' 
WHERE 
	`id`='13';


DELETE FROM 
	`barbearia`.`clientes` 
WHERE 
	`id`='90';


-- Criando a Tabela Comprovantes
CREATE TABLE `barbearia`.`comprovantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `data_transacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forma` ENUM('Cartao', 'Dinheiro') NOT NULL DEFAULT 'Dinheiro',
  `valor` DECIMAL(5,2) NOT NULL,
  `data_captura` DATETIME NULL,
  `aprovado` ENUM('Sim', 'Nao') NOT NULL DEFAULT 'Sim',
  PRIMARY KEY (`id`),
  INDEX `fk_comprovantes_cliente_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_comprovantes_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `barbearia`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- INNER JOIN entre as tabels clientes e comprovantes
SELECT 
	cl.nome,
    co.forma,
    co.valor,
    co.data_transacao
FROM
    comprovantes co
    INNER JOIN
    clientes cl ON co.cliente_id = cl.id