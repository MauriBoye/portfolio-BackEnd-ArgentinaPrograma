-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `job` VARCHAR(40) NOT NULL,
  `ubication` VARCHAR(40) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`about`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`about` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TINYTEXT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_about_person_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_about_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`experience` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `company` VARCHAR(50) NOT NULL,
  `period` CHAR(40) NOT NULL,
  `description` TINYTEXT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experience_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_experience_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `institute` VARCHAR(50) NOT NULL,
  `career` VARCHAR(50) NOT NULL,
  `period` CHAR(40) NOT NULL,
  `description` TINYTEXT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_education_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_education_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` CHAR(30) NOT NULL,
  `name` VARCHAR(40) NOT NULL,
  `percentage` TINYINT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_skills_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_skills_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`languages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` CHAR(30) NOT NULL,
  `description` TINYTEXT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_languages_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_languages_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `date` DATETIME NOT NULL,
  `description` TINYTEXT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_projects_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_projects_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `portfolio`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` CHAR(50) NOT NULL,
  `password` CHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

USE `portfolio` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
