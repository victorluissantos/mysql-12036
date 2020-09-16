-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tratofeito
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tratofeito
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tratofeito` DEFAULT CHARACTER SET utf8 ;
USE `tratofeito` ;

-- -----------------------------------------------------
-- Table `tratofeito`.`empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tratofeito`.`empresas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(25) NOT NULL,
  `nome` VARCHAR(60) NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `senha` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tratofeito`.`vagas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tratofeito`.`vagas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(60) NOT NULL,
  `descritivo` VARCHAR(450) NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vagas_empresas1_idx` (`empresa_id` ASC),
  CONSTRAINT `fk_vagas_empresas1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `tratofeito`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tratofeito`.`colaboradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tratofeito`.`colaboradores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NULL,
  `email` VARCHAR(45) NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `senha` VARCHAR(250) NOT NULL,
  `telefone` VARCHAR(14) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tratofeito`.`vagas_has_colaboradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tratofeito`.`vagas_has_colaboradores` (
  `vagas_id` INT NOT NULL,
  `colaboradores_id` INT NOT NULL,
  PRIMARY KEY (`vagas_id`, `colaboradores_id`),
  INDEX `fk_vagas_has_colaboradores_colaboradores1_idx` (`colaboradores_id` ASC),
  INDEX `fk_vagas_has_colaboradores_vagas1_idx` (`vagas_id` ASC),
  CONSTRAINT `fk_vagas_has_colaboradores_vagas1`
    FOREIGN KEY (`vagas_id`)
    REFERENCES `tratofeito`.`vagas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vagas_has_colaboradores_colaboradores1`
    FOREIGN KEY (`colaboradores_id`)
    REFERENCES `tratofeito`.`colaboradores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
