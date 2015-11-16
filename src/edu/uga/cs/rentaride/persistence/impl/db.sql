
DROP DATABASE IF EXISTS `team9`;

CREATE DATABASE IF NOT EXISTS team9;

USE team9;

DROP TABLE IF EXISTS `HourlyPrice`;
DROP TABLE IF EXISTS `Rental`;
DROP TABLE IF EXISTS `RentalLocations`;
DROP TABLE IF EXISTS `RentARideConfig`;
DROP TABLE IF EXISTS `Reservations`;
DROP TABLE IF EXISTS `Users`;
DROP TABLE IF EXISTS `Vehicle`;
DROP TABLE IF EXISTS `VehicleType`;

--
-- Database: `RentARideDatabase`
--

-- disable foreign key checks to create tables in any order
SET foreign_key_checks = 0;

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `commentDate` datetime NOT NULL,
  `rental` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  
  PRIMARY KEY(commentID),
	
  INDEX(rental),

  FOREIGN KEY(rental)
  	  REFERENCES Rental(rentalNo)

  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HourlyPrice`
--

CREATE TABLE `HourlyPrice` (
  `maxHours` int(11) NOT NULL,
  `mineHours` int(11) NOT NULL,
  `price` int(11) NOT NULL


) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Rental`
--

CREATE TABLE `Rental` (
  `rentalNo` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) NOT NULL,
  `pickupTime` datetime NOT NULL,
  `returnTime` datetime NOT NULL,
  `condition` ENUM('good','cleaningNeeded','maintenanceNeeded') NOT NULL,
  PRIMARY KEY(rentalNo),

  INDEX(customer),
  FOREIGN KEY(customer)
  	  REFERENCES Users(userName)

  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RentalLocations`
--

CREATE TABLE `RentalLocations` (
  `address` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `locationName` varchar(255) NOT NULL,

  PRIMARY KEY(locationName)


) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RentARideConfig`
--

CREATE TABLE `RentARideConfig` (
  `membershipPrice` int(11) NOT NULL,
  `overtimePenalty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Reservations`
--

CREATE TABLE `Reservations` (

  `customer` varchar(255) NOT NULL,
  `pickupTime` datetime NOT NULL,
  `rental` int(11) NOT NULL,
  `rentalDuration` int(11) NOT NULL,
  `rentalLocation` varchar(255) NOT NULL,
  `vehicleType` varchar(255) NOT NULL,
  `reservationID` int(11)NOT NULL AUTO_INCREMENT,

  PRIMARY KEY(reservationID),

  INDEX(rental),
  FOREIGN KEY(rental)
  	  REFERENCES Rentals(rentalNo)


) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdDate` datetime NOT NULL,
  `userStatus` ENUM('active','removed','terminated') NOT NULL,
  `userType` ENUM('admin','customer') NOT NULL, 

  PRIMARY KEY(userName)


) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

CREATE TABLE `Vehicle` (
  `registrationTag` varchar(255) NOT NULL,
  `lastService` datetime NOT NULL,
  `make` varchar(255) NOT NULL,
  `mileage` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `rentalLocation` varchar(255) NOT NULL,
  `status` ENUM('inLocation','inRental') NOT NULL,
  `vehicleType` varchar(255) NOT NULL,
  `vehicleYear` int(11) NOT NULL,
  `vehicleCondition` ENUM('good', 'cleaningNeeded','maintenanceNeeded') NOT NULL,
  `vehicleID` int(11) NOT NULL AUTO_INCREMENT,

  PRIMARY KEY(vehicleID),

  INDEX(rentalLocation),
  FOREIGN KEY(rentalLocation)
  	  REFERENCES RentalLocations(locationName)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


CREATE TABLE `VehicleType` (

  `typeName` varchar(255) NOT NULL,
  `vehicleTypeId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(vehicleTypeId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



SET foreign_key_checks = 1;
