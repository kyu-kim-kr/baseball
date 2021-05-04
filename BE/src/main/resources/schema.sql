-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema baseball
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema baseball
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `baseball` DEFAULT CHARACTER SET utf8 ;
USE `baseball` ;

-- -----------------------------------------------------
-- Table `baseball`.`team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baseball`.`team` ;

CREATE TABLE IF NOT EXISTS `baseball`.`team` (
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`name`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseball`.`player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baseball`.`player` ;

CREATE TABLE IF NOT EXISTS `baseball`.`player` (
    `name` VARCHAR(45) NOT NULL,
    `position` VARCHAR(45) NULL,
    `at_bat` VARCHAR(45) NULL,
    `hits` INT NULL,
    `out` INT NULL,
    `batting_average` DOUBLE NULL,
    `number_of_pitches` VARCHAR(45) NULL,
    `team_name` VARCHAR(45) NOT NULL,
    `bat_order` INT NULL,
    PRIMARY KEY (`name`),
    INDEX `fk_player_team_idx` (`team_name` ASC) VISIBLE,
    CONSTRAINT `fk_player_team`
    FOREIGN KEY (`team_name`)
    REFERENCES `baseball`.`team` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseball`.`score`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baseball`.`score` ;

CREATE TABLE IF NOT EXISTS `baseball`.`score` (
    `created_at` DATETIME NOT NULL,
    `home` INT NOT NULL,
    `away` INT NOT NULL,
    `home_team` VARCHAR(45) NOT NULL,
    `away_team` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`created_at`),
    INDEX `fk_score_team1_idx` (`home_team` ASC) VISIBLE,
    INDEX `fk_score_team2_idx` (`away_team` ASC) VISIBLE,
    CONSTRAINT `fk_score_team1`
    FOREIGN KEY (`home_team`)
    REFERENCES `baseball`.`team` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_score_team2`
    FOREIGN KEY (`away_team`)
    REFERENCES `baseball`.`team` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `baseball`.`status_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `baseball`.`status_game` ;

CREATE TABLE IF NOT EXISTS `baseball`.`status_game` (
    `home` VARCHAR(45) NOT NULL,
    `away` VARCHAR(45) NOT NULL,
    `home_score` INT NULL,
    `away_score` INT NULL,
    `inning` INT NULL,
    `status` VARCHAR(45) NULL,
    `ball_count` VARCHAR(45) NULL)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
