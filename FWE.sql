-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema global_super_store_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema global_super_store_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `global_super_store_db` DEFAULT CHARACTER SET utf8 ;
USE `global_super_store_db` ;

-- -----------------------------------------------------
-- Table `global_super_store_db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store_db`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store_db`.`DeliveryAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store_db`.`DeliveryAddress` (
  `AddressID` INT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal Code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store_db`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store_db`.`Shipping` (
  `ShipID` INT NOT NULL,
  `ShipDate` DATE NOT NULL,
  `ShipMode` VARCHAR(45) NOT NULL,
  `ShipCost` DECIMAL NOT NULL,
  `Shippingcol` VARCHAR(45) NOT NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`ShipID`),
  INDEX `address_id_fk_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `address_id_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `global_super_store_db`.`DeliveryAddress` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store_db`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store_db`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(255) NOT NULL,
  `ProductPrice` DECIMAL NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `Sub-Category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store_db`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `Quantity` INT NOT NULL,
  `Discount` DECIMAL NOT NULL,
  `Order Priority` VARCHAR(45) NOT NULL,
  `CustomerID` INT NOT NULL,
  `ShipID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `ship_id_fk_idx` (`ShipID` ASC) VISIBLE,
  INDEX `product_id_fk_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `global_super_store_db`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ship_id_fk`
    FOREIGN KEY (`ShipID`)
    REFERENCES `global_super_store_db`.`Shipping` (`ShipID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_id_fk`
    FOREIGN KEY (`ProductID`)
    REFERENCES `global_super_store_db`.`Products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
