-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exercise9
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise9
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise9` DEFAULT CHARACTER SET utf8 ;
USE `exercise9` ;

-- -----------------------------------------------------
-- Table `exercise9`.`Gen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`Gen` (
  `Gen_ID` INT NOT NULL,
  `Naam` VARCHAR(45) NULL,
  `Locatie` VARCHAR(45) NULL,
  `beschrijving` VARCHAR(255) NULL,
  PRIMARY KEY (`Gen_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise9`.`Mutatie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`Mutatie` (
  `Mutatie_ID` INT NOT NULL,
  `Chromosomale_locatie` VARCHAR(45) NULL,
  `Gen_ID` INT NULL,
  PRIMARY KEY (`Mutatie_ID`),
  INDEX `fk_Mutatie_gen_idx` (`Gen_ID` ASC),
  CONSTRAINT `fk_Mutatie_gen`
    FOREIGN KEY (`Gen_ID`)
    REFERENCES `exercise9`.`Gen` (`Gen_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise9`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`Patient` (
  `Patient_ID` INT NOT NULL,
  `Naam` VARCHAR(45) NULL,
  `Geslacht` ENUM('M', 'V') NULL,
  `Leeftijd` INT NULL,
  `Diagnose` INT NULL,
  `Mutatie_ID` INT NULL,
  PRIMARY KEY (`Patient_ID`),
  INDEX `fk_Patient_Mutatue_idx` (`Mutatie_ID` ASC),
  CONSTRAINT `fk_Patient_Mutatue`
    FOREIGN KEY (`Mutatie_ID`)
    REFERENCES `exercise9`.`Mutatie` (`Mutatie_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
