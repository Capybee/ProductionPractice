-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cartridges_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cartridges_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cartridges_db` DEFAULT CHARACTER SET utf8 ;
USE `cartridges_db` ;

-- -----------------------------------------------------
-- Table `cartridges_db`.`cartridge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartridges_db`.`cartridge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(20) NOT NULL,
  `count` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `model_UNIQUE` (`model` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cartridges_db`.`printer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartridges_db`.`printer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `model_UNIQUE` (`model` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cartridges_db`.`cartridge_has_printer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartridges_db`.`cartridge_has_printer` (
  `cartridge_id` INT NOT NULL,
  `printer_id` INT NOT NULL,
  PRIMARY KEY (`cartridge_id`, `printer_id`),
  INDEX `fk_cartridge_has_printer_printer1_idx` (`printer_id` ASC) VISIBLE,
  INDEX `fk_cartridge_has_printer_cartridge_idx` (`cartridge_id` ASC) VISIBLE,
  CONSTRAINT `fk_cartridge_has_printer_cartridge`
    FOREIGN KEY (`cartridge_id`)
    REFERENCES `cartridges_db`.`cartridge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartridge_has_printer_printer1`
    FOREIGN KEY (`printer_id`)
    REFERENCES `cartridges_db`.`printer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cartridges_db`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartridges_db`.`department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cartridges_db`.`subordinate_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartridges_db`.`subordinate_employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `FIO` VARCHAR(50) NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`id`, `department_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_subordinate_employees_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_subordinate_employees_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `cartridges_db`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cartridges_db`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartridges_db`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `FIO` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cartridges_db`.`issuing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartridges_db`.`issuing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `employees_id` INT NOT NULL,
  `subordinate_employees_id` INT NOT NULL,
  `subordinate_employees_department_id` INT NOT NULL,
  `cartridge_id` INT NOT NULL,
  PRIMARY KEY (`id`, `employees_id`, `subordinate_employees_id`, `subordinate_employees_department_id`, `cartridge_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_issuing_employees1_idx` (`employees_id` ASC) VISIBLE,
  INDEX `fk_issuing_subordinate_employees1_idx` (`subordinate_employees_id` ASC, `subordinate_employees_department_id` ASC) VISIBLE,
  INDEX `fk_issuing_cartridge1_idx` (`cartridge_id` ASC) VISIBLE,
  CONSTRAINT `fk_issuing_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `cartridges_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_issuing_subordinate_employees1`
    FOREIGN KEY (`subordinate_employees_id` , `subordinate_employees_department_id`)
    REFERENCES `cartridges_db`.`subordinate_employees` (`id` , `department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_issuing_cartridge1`
    FOREIGN KEY (`cartridge_id`)
    REFERENCES `cartridges_db`.`cartridge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cartridges_db`.`supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cartridges_db`.`supply` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `count` INT NOT NULL,
  `cartridge_id` INT NOT NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`, `cartridge_id`, `employees_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_supply_cartridge1_idx` (`cartridge_id` ASC) VISIBLE,
  INDEX `fk_supply_employees1_idx` (`employees_id` ASC) VISIBLE,
  CONSTRAINT `fk_supply_cartridge1`
    FOREIGN KEY (`cartridge_id`)
    REFERENCES `cartridges_db`.`cartridge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supply_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `cartridges_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
