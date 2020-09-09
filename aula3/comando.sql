-- Criando a tabela de servicos
CREATE TABLE `barbearia`.`servicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(5,2) NOT NULL,
  `data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

-- inserindo os servicos
INSERT INTO `barbearia`.`servicos` (`nome`, `valor`) VALUES ('Corte Cabelo Masculino', '30');
INSERT INTO `barbearia`.`servicos` (`nome`, `valor`) VALUES ('Corte Cabelo Feminino', '89.99');
INSERT INTO `barbearia`.`servicos` (`nome`, `valor`) VALUES ('Barba', '15');
INSERT INTO `barbearia`.`servicos` (`nome`, `valor`) VALUES ('Bigote', '9.99');
INSERT INTO `barbearia`.`servicos` (`nome`, `valor`) VALUES ('Unha Masculina', '19.90');
INSERT INTO `barbearia`.`servicos` (`nome`, `valor`) VALUES ('Unha Feminina', '30.00');
INSERT INTO `barbearia`.`servicos` (`nome`, `valor`) VALUES ('Progressiva', '190.00');
