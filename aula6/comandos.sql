CREATE SCHEMA `eagendas` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

CREATE TABLE `eagendas`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `email` VARCHAR(80) NOT NULL,
  `telefone` VARCHAR(15) NULL,
  `celular` VARCHAR(15) NULL,
  `senha` VARCHAR(250) NOT NULL,
  `status` ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 1000
DELAY_KEY_WRITE = 1;


-- criando a tabela de compromissos
CREATE TABLE `eagendas`.`compromissos` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `usuario_id` INT NOT NULL,
    `anotacao` VARCHAR(320) NULL,
    `data_criacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ocorrencia` ENUM('diaria', 'semanal', 'mensal', 'anual', 'unica') NOT NULL DEFAULT 'unica',
    `alerta` ENUM('mes', 'dia', 'hora', 'minuto') NULL,
    `alerta_valor` INT NULL,
    `data_compromisso` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `idx_ocorrencia` (`ocorrencia` ASC),
    INDEX `idx_alerta` (`alerta` ASC)
);

-- alter na tabela usuario a engine
ALTER TABLE `eagendas`.`usuarios` 
ENGINE = InnoDB ;


-- alter table compromissos
ALTER TABLE `eagendas`.`compromissos` 
ADD INDEX `fk_compromissos_usuario_idx` (`usuario_id` ASC);
ALTER TABLE `eagendas`.`compromissos` 
ADD CONSTRAINT `fk_compromissos_usuario`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `eagendas`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
