CREATE TABLE `Producers` (
	`Name` TEXT(40) NOT NULL AUTO_INCREMENT,
	`BankAccount` TEXT(10) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`Name`)
);

CREATE TABLE `Games` (
	`Id` INT NOT NULL AUTO_INCREMENT,
	`Name` TEXT(20) NOT NULL,
	`Genre` TEXT(10) NOT NULL,
	`Price` DECIMAL(10) NOT NULL,
	`ReleaseDate` DATE NOT NULL,
	`DevName` TEXT NOT NULL,
	`SalePrice` DECIMAL,
	PRIMARY KEY (`Id`)
);

CREATE TABLE `Customers` (
	`Email` TEXT(40) NOT NULL,
	`BankAccount` TEXT(10) NOT NULL,
	`SID` INT NOT NULL UNIQUE,
	PRIMARY KEY (`Email`)
);

CREATE TABLE `Members` (
	`MID` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`Username` TEXT(10) NOT NULL,
	`Password` TIME(20) NOT NULL,
	`WID` INT(20) NOT NULL UNIQUE,
	PRIMARY KEY (`MID`)
);

CREATE TABLE `WIshlists` (
	`WID` INT NOT NULL,
	`MID` INT NOT NULL,
	PRIMARY KEY (`WID`)
);

CREATE TABLE `OnSaleLists` (
	`GID` INT NOT NULL,
	`EventIndex` INT NOT NULL AUTO_INCREMENT,
	`SalePrice` DECIMAL NOT NULL,
	`StartDate` DATE NOT NULL,
	`EndDate` DATE NOT NULL,
	PRIMARY KEY (`EventIndex`)
);

CREATE TABLE `ShoppingCarts` (
	`SID` INT NOT NULL AUTO_INCREMENT,
	`Email` TEXT(40) NOT NULL,
	PRIMARY KEY (`SID`)
);

CREATE TABLE `AddRemoveFromCart` (
	`GID` INT NOT NULL,
	`SID` INT NOT NULL,
	PRIMARY KEY (`SID`)
);

CREATE TABLE `AddRemoveFromWIshlist` (
	`GID` INT NOT NULL,
	`WID` INT NOT NULL,
	PRIMARY KEY (`GID`)
);

CREATE TABLE `Purchases` (
	`Email` TEXT(40) NOT NULL,
	`GID` INT NOT NULL,
	PRIMARY KEY (`Email`)
);

CREATE TABLE `Friends` (
	`MyMID` INT NOT NULL,
	`FriendMID` INT NOT NULL,
	PRIMARY KEY (`MyMID`,`FriendMID`)
);

ALTER TABLE `Games` ADD CONSTRAINT `Games_fk0` FOREIGN KEY (`DevName`) REFERENCES `Producers`(`Name`);

ALTER TABLE `Games` ADD CONSTRAINT `Games_fk1` FOREIGN KEY (`SalePrice`) REFERENCES `OnSaleLists`(`SalePrice`);

ALTER TABLE `Customers` ADD CONSTRAINT `Customers_fk0` FOREIGN KEY (`SID`) REFERENCES `ShoppingCarts`(`SID`);

ALTER TABLE `Members` ADD CONSTRAINT `Members_fk0` FOREIGN KEY (`WID`) REFERENCES `WIshlists`(`WID`);

ALTER TABLE `WIshlists` ADD CONSTRAINT `WIshlists_fk0` FOREIGN KEY (`MID`) REFERENCES `Members`(`MID`);

ALTER TABLE `OnSaleLists` ADD CONSTRAINT `OnSaleLists_fk0` FOREIGN KEY (`GID`) REFERENCES `Games`(`Id`);

ALTER TABLE `ShoppingCarts` ADD CONSTRAINT `ShoppingCarts_fk0` FOREIGN KEY (`Email`) REFERENCES `Customers`(`Email`);

ALTER TABLE `AddRemoveFromCart` ADD CONSTRAINT `AddRemoveFromCart_fk0` FOREIGN KEY (`GID`) REFERENCES `Games`(`Id`);

ALTER TABLE `AddRemoveFromCart` ADD CONSTRAINT `AddRemoveFromCart_fk1` FOREIGN KEY (`SID`) REFERENCES `ShoppingCarts`(`SID`);

ALTER TABLE `AddRemoveFromWIshlist` ADD CONSTRAINT `AddRemoveFromWIshlist_fk0` FOREIGN KEY (`GID`) REFERENCES `Games`(`Id`);

ALTER TABLE `AddRemoveFromWIshlist` ADD CONSTRAINT `AddRemoveFromWIshlist_fk1` FOREIGN KEY (`WID`) REFERENCES `WIshlists`(`WID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `Purchases_fk0` FOREIGN KEY (`Email`) REFERENCES `Customers`(`Email`);

ALTER TABLE `Purchases` ADD CONSTRAINT `Purchases_fk1` FOREIGN KEY (`GID`) REFERENCES `Games`(`Id`);

ALTER TABLE `Friends` ADD CONSTRAINT `Friends_fk0` FOREIGN KEY (`MyMID`) REFERENCES `Members`(`MID`);

ALTER TABLE `Friends` ADD CONSTRAINT `Friends_fk1` FOREIGN KEY (`FriendMID`) REFERENCES `Members`(`MID`);

