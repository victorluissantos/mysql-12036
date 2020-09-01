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