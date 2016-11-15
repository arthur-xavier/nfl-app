-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema nfldb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nfldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nfldb` DEFAULT CHARACTER SET utf8 ;
USE `nfldb` ;

-- -----------------------------------------------------
-- Table `nfldb`.`division`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`division` (
  `div_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID da divisao',
  `div_name` VARCHAR(45) NOT NULL COMMENT 'Nome da divisao',
  `div_conference` VARCHAR(3) NOT NULL COMMENT 'Nome da conferencia (apenas AFC ou NFC)',
  PRIMARY KEY (`div_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`state` (
  `sta_id` INT NOT NULL AUTO_INCREMENT,
  `sta_namd` VARCHAR(100) NULL,
  PRIMARY KEY (`sta_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`city` (
  `cit_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo da cidade',
  `cit_name` VARCHAR(100) NULL COMMENT 'Nome da cidade',
  `cit_staid` INT NULL COMMENT 'Estado onde esta situada',
  PRIMARY KEY (`cit_id`),
  INDEX `fk_state_idx` (`cit_staid` ASC),
  CONSTRAINT `fk_cit_state`
    FOREIGN KEY (`cit_staid`)
    REFERENCES `nfldb`.`state` (`sta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`stadium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`stadium` (
  `std_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo do estadio',
  `std_name` VARCHAR(45) NOT NULL COMMENT 'Nome do estadio',
  `std_capacity` INT NOT NULL COMMENT 'Capacidade',
  `std_citid` INT NULL COMMENT 'Cidade onde esta  situado',
  PRIMARY KEY (`std_id`),
  INDEX `fk_city_idx` (`std_citid` ASC),
  CONSTRAINT `fk_std_city`
    FOREIGN KEY (`std_citid`)
    REFERENCES `nfldb`.`city` (`cit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`team` (
  `tea_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo do time',
  `tea_name` VARCHAR(100) NOT NULL COMMENT 'Nome do time',
  `tea_owner` VARCHAR(100) NOT NULL COMMENT 'Dono',
  `tea_yearfoundation` VARCHAR(4) NOT NULL COMMENT 'Ano de fundacao',
  `tea_stdid` INT NOT NULL COMMENT 'Estadio onde joga',
  `tea_citid` INT NOT NULL COMMENT 'Cidade onde esta situado',
  `tea_divid` INT NOT NULL COMMENT 'Divisao na qual joga',
  PRIMARY KEY (`tea_id`),
  INDEX `fk_stadium_idx` (`tea_stdid` ASC),
  INDEX `fk_city_idx` (`tea_citid` ASC),
  INDEX `fk_division_idx` (`tea_divid` ASC),
  CONSTRAINT `fk_tea_stadium`
    FOREIGN KEY (`tea_stdid`)
    REFERENCES `nfldb`.`stadium` (`std_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tea_city`
    FOREIGN KEY (`tea_citid`)
    REFERENCES `nfldb`.`city` (`cit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tea_division`
    FOREIGN KEY (`tea_divid`)
    REFERENCES `nfldb`.`division` (`div_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`university`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`university` (
  `uni_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo da universidade',
  `uni_name` VARCHAR(45) NOT NULL COMMENT 'Nome da universidade',
  `uni_staid` INT NOT NULL COMMENT 'Estado onde esta localizada',
  PRIMARY KEY (`uni_id`),
  INDEX `fk_state_idx` (`uni_staid` ASC),
  CONSTRAINT `fk_uni_state`
    FOREIGN KEY (`uni_staid`)
    REFERENCES `nfldb`.`state` (`sta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`player` (
  `pla_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo do jogador',
  `pla_name` VARCHAR(100) NOT NULL COMMENT 'Nome do jogador',
  `pla_dob` DATETIME NULL COMMENT 'Data de nascimento',
  `pla_citid` INT NOT NULL COMMENT 'Codigo da cidade onde ele nasceu',
  `pla_uniid` INT NOT NULL COMMENT 'Codigo da faculdade em que ele estudou',
  `pla_position` VARCHAR(45) NOT NULL,
  `pla_height` INT NOT NULL COMMENT 'Altura do jogador. Valor guardado como polegadas (ex: 5\'10\" =  70\")',
  `pla_weight` INT NOT NULL COMMENT 'Peso do jogador. Valor guardado em libras.',
  PRIMARY KEY (`pla_id`),
  INDEX `fk_city_idx` (`pla_citid` ASC),
  INDEX `fk_university_idx` (`pla_uniid` ASC),
  CONSTRAINT `fk_pla_city`
    FOREIGN KEY (`pla_citid`)
    REFERENCES `nfldb`.`city` (`cit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pla_university`
    FOREIGN KEY (`pla_uniid`)
    REFERENCES `nfldb`.`university` (`uni_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`player_team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`player_team` (
  `plt_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo da relacao jogador-time',
  `plt_plaid` INT NOT NULL COMMENT 'Jogador',
  `plt_teaid` INT NOT NULL COMMENT 'Time',
  `plt_jerseynum` INT NOT NULL COMMENT 'Numero da camisa',
  `plt_contractstartdate` VARCHAR(4) NOT NULL COMMENT 'Data de inicio do contrato',
  `plt_contractenddate` VARCHAR(4) NOT NULL COMMENT 'Data de termino do contrato',
  `plt_contractvalue` DECIMAL(10,2) NOT NULL COMMENT 'Valor total do contrato',
  `plt_active` TINYINT(1) NOT NULL COMMENT 'Indica se é a relacao valida para o jogador.',
  PRIMARY KEY (`plt_id`),
  INDEX `fk_player_idx` (`plt_plaid` ASC),
  INDEX `fk_team_idx` (`plt_teaid` ASC),
  CONSTRAINT `fk_plt_player`
    FOREIGN KEY (`plt_plaid`)
    REFERENCES `nfldb`.`player` (`pla_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plt_team`
    FOREIGN KEY (`plt_teaid`)
    REFERENCES `nfldb`.`team` (`tea_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`game` (
  `gam_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo do jogo',
  `gam_season` VARCHAR(45) NOT NULL COMMENT 'Temporada em que occoreu (formato yy/yy - ex: 16/17)',
  `gam_type` VARCHAR(45) NOT NULL COMMENT 'Tipo do jogo \n       Temporada regular - WEEK X\n       Playoff - Wildcard, dvision, championship, superbowl',
  `gam_teaidhome` INT NOT NULL COMMENT 'Time mandante',
  `gam_teaidaway` INT NOT NULL COMMENT 'Time visitante',
  `gam_homescore` INT NOT NULL COMMENT 'Pontuacao do mandante',
  `gam_awayscore` INT NOT NULL COMMENT 'Pontuacao do visitante',
  `gam_stdid` INT NOT NULL COMMENT 'Estadio onde foi jogado',
  `gam_attendance` INT NOT NULL COMMENT 'Public presente',
  `gam_date` DATETIME NOT NULL COMMENT 'Data e horario em que ocorreu o jogo',
  PRIMARY KEY (`gam_id`),
  INDEX `fk_teamhome_idx` (`gam_teaidhome` ASC),
  INDEX `fk_teamaway_idx` (`gam_teaidaway` ASC),
  INDEX `fk_stadium_idx` (`gam_stdid` ASC),
  CONSTRAINT `fk_gam_teamhome`
    FOREIGN KEY (`gam_teaidhome`)
    REFERENCES `nfldb`.`team` (`tea_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gam_teamaway`
    FOREIGN KEY (`gam_teaidaway`)
    REFERENCES `nfldb`.`team` (`tea_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gam_stadium`
    FOREIGN KEY (`gam_stdid`)
    REFERENCES `nfldb`.`stadium` (`std_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`offensive_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`offensive_stats` (
  `ost_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo',
  `ost_pltid` INT NOT NULL COMMENT 'Jogador/Time',
  `ost_gamid` INT NOT NULL COMMENT 'Jogo',
  `ost_passattemp` INT NULL DEFAULT 0 COMMENT 'Passes tentados',
  `ost_passcomplete` INT NULL DEFAULT 0 COMMENT 'Passes completos',
  `ost_passyards` INT NULL DEFAULT 0 COMMENT 'Jardas totais em passe',
  `ost_passtd` INT NULL DEFAULT 0 COMMENT 'TDs em passe',
  `ost_rating` VARCHAR(45) NULL DEFAULT 0 COMMENT 'Nota do jogador (calculado com as estatiscas de passe)',
  `ost_rushattempt` INT NULL DEFAULT 0 COMMENT 'Tentativas de corrida',
  `ost_rushyards` INT NULL DEFAULT 0 COMMENT 'Jardas corridas',
  `ost_rushtd` INT NULL DEFAULT 0 COMMENT 'TDs corridos',
  `ost_interception` INT NULL DEFAULT 0 COMMENT 'Interceptacoes sofridas',
  `ost_sack` INT NULL DEFAULT 0 COMMENT 'Sacks sofridos',
  `ost_fumble` INT NULL DEFAULT 0 COMMENT 'Fumbles sofridos',
  `ost_fumblelost` INT NULL DEFAULT 0 COMMENT 'Fumbles perdidos',
  `ost_passrecv` INT NULL DEFAULT 0 COMMENT 'Passes recebidos',
  `ost_passrecvyard` INT NULL DEFAULT 0 COMMENT 'Jardas recebidas',
  `ost_passrecvtd` INT NULL DEFAULT 0 COMMENT 'TDs recebidos',
  PRIMARY KEY (`ost_id`),
  INDEX `fk_player_idx` (`ost_pltid` ASC),
  INDEX `fk_game_idx` (`ost_gamid` ASC),
  CONSTRAINT `fk_ost_player_team`
    FOREIGN KEY (`ost_pltid`)
    REFERENCES `nfldb`.`player_team` (`plt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ost_game`
    FOREIGN KEY (`ost_gamid`)
    REFERENCES `nfldb`.`game` (`gam_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`defensive_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`defensive_stats` (
  `dst_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo',
  `dst_pltid` INT NOT NULL COMMENT 'Jogador/Time',
  `dst_gamid` INT NOT NULL COMMENT 'Jogo',
  `dst_tackle` INT NULL COMMENT 'Tackles feitos',
  `dst_sack` DECIMAL(10,1) NULL COMMENT 'Sacks feitos',
  `dst_passdef` INT NOT NULL COMMENT 'Passes defendidos/desviados',
  `dst_interception` INT NOT NULL COMMENT 'Interceptacoes feitas',
  `dst_forcedfumble` INT NULL COMMENT 'Fumbles forcados',
  `dst_defensivetd` INT NULL COMMENT 'TDs anotados',
  PRIMARY KEY (`dst_id`),
  INDEX `fk_player_team_idx` (`dst_pltid` ASC),
  INDEX `fk_game_idx` (`dst_gamid` ASC),
  CONSTRAINT `fk_dst_player_team`
    FOREIGN KEY (`dst_pltid`)
    REFERENCES `nfldb`.`player_team` (`plt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dst_game`
    FOREIGN KEY (`dst_gamid`)
    REFERENCES `nfldb`.`game` (`gam_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nfldb`.`specialteams_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nfldb`.`specialteams_stats` (
  `sst_id` INT NOT NULL AUTO_INCREMENT COMMENT 'Codigo',
  `sst_pltid` INT NOT NULL COMMENT 'Jogador/TIme',
  `sst_gamid` INT NOT NULL COMMENT 'Jogo',
  `sst_kickoff` INT NULL DEFAULT 0 COMMENT 'Kickoffs feitos',
  `sst_touchback` INT NULL DEFAULT 0 COMMENT 'touchbacks realizados',
  `sst_fgattempt20` INT NULL DEFAULT 0 COMMENT 'Field goals tentado de menos de 20 jardas',
  `sst_fgmade20` INT NULL DEFAULT 0 COMMENT 'Field goals feitos de menos de 20 jardas',
  `sst_fgattempt30` INT NULL DEFAULT 0 COMMENT 'Field goals tentado de menos de 30 jardas e mais de 20',
  `sst_fgmade30` INT NULL DEFAULT 0 COMMENT 'Field goals feitos de menos de 30 jardas e mais de 20',
  `sst_fgattempt40` INT NULL DEFAULT 0 COMMENT 'Field goals tentados de menos de 40 jardas e mais de 30',
  `sst_fgmade40` INT NULL DEFAULT 0 COMMENT 'Field goals feitos de menos de 40 jardas e mais de 30',
  `sst_fgattempt50` INT NULL DEFAULT 0 COMMENT 'Field goals tentados de menos de 50 jardas e mais de 40',
  `sst_fgmade50` INT NULL DEFAULT 0 COMMENT 'Field goals feitos de menos de 50 jardas e mais de 40',
  `sst_fgattempt50plus` INT NULL DEFAULT 0 COMMENT 'Field goals tentados de mais de 50 jardas',
  `sst_fgmade50plus` INT NULL DEFAULT 0 COMMENT 'Field goals feitos de mais de 50 jardas',
  `sst_fgblocked` INT NULL DEFAULT 0 COMMENT 'Field goals bloqueados',
  `sst_patattempt` INT NULL DEFAULT 0 COMMENT 'extra point tentados',
  `sst_patmade` INT NULL DEFAULT 0 COMMENT 'extra point feitos',
  `sst_fglong` INT NULL DEFAULT 0 COMMENT 'distancia do field goal mais longo feito',
  `sst_punt` INT NULL DEFAULT 0 COMMENT 'Punts realizados',
  `sst_puntlong` INT NULL DEFAULT 0 COMMENT 'Punt mais longo',
  `sst_puntblocked` INT NULL DEFAULT 0 COMMENT 'Punts bloqueados',
  `sst_allowedtd` INT NULL DEFAULT 0 COMMENT 'Tds permitdos em retorno.',
  PRIMARY KEY (`sst_id`),
  INDEX `fk_player_team_idx` (`sst_pltid` ASC),
  INDEX `fk_game_idx` (`sst_gamid` ASC),
  CONSTRAINT `fk_sst_player_team`
    FOREIGN KEY (`sst_pltid`)
    REFERENCES `nfldb`.`player_team` (`plt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sst_game`
    FOREIGN KEY (`sst_gamid`)
    REFERENCES `nfldb`.`game` (`gam_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
