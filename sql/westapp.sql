-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 07, 2024 at 08:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `westapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `Documents`
--

CREATE TABLE `Documents` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pdf_data` longblob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MissingPersons`
--

CREATE TABLE `MissingPersons` (
  `missingPersonID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `reportedDate` date NOT NULL,
  `lastSeenLocation` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photoURL` varchar(255) DEFAULT NULL,
  `contactPerson` varchar(255) DEFAULT NULL,
  `contactPhoneNumber` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `Verify` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MissingPersons`
--

INSERT INTO `MissingPersons` (`missingPersonID`, `userID`, `firstName`, `lastName`, `gender`, `dateOfBirth`, `reportedDate`, `lastSeenLocation`, `description`, `photoURL`, `contactPerson`, `contactPhoneNumber`, `status`, `Verify`) VALUES
(1, 102, 'Jane', 'Smith', 'Female', '1990-08-20', '2024-07-02', 'Montego Bay', 'Last seen at the market', 'http://example.com/photo2.jpg', 'John Smith', '987-654-3210', 'Missing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `StolenItems`
--

CREATE TABLE `StolenItems` (
  `itemID` int(11) NOT NULL,
  `itemType` varchar(50) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateStolen` date NOT NULL,
  `lastKnownLocation` varchar(255) DEFAULT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `ownerContact` varchar(20) DEFAULT NULL,
  `rewardAmount` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `Verify` tinyint(1) NOT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StolenVehicles`
--

CREATE TABLE `StolenVehicles` (
  `vehicleID` int(11) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `licensePlate` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `dateStolen` date NOT NULL,
  `lastKnownLocation` varchar(255) DEFAULT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `ownerContact` varchar(20) DEFAULT NULL,
  `rewardAmount` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `Verify` tinyint(1) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `photoURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `StolenVehicles`
--

INSERT INTO `StolenVehicles` (`vehicleID`, `make`, `model`, `year`, `color`, `licensePlate`, `description`, `dateStolen`, `lastKnownLocation`, `ownerName`, `ownerContact`, `rewardAmount`, `status`, `Verify`, `userID`, `photoURL`) VALUES
(1, 'Toyota', 'Corolla', 2015, 'White', 'ABC1234', 'Small dent on the rear bumper', '2024-06-15', 'Kingston', 'John Doe', '123-456-7890', 500.00, 'Stolen', 1, 101, NULL),
(2, 'Honda', 'Civic', 2018, 'Black', 'XYZ5678', 'Scratch on the left door', '2024-07-01', 'Montego Bay', 'Jane Smith', '987-654-3210', 1000.00, 'Stolen', 1, 102, NULL),
(3, 'Ford', 'Focus', 2012, 'Blue', 'LMN2345', 'Broken taillight', '2024-06-25', 'Negril', 'Michael Johnson', '555-123-4567', 750.00, 'Stolen', 1, 103, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserInformation`
--

CREATE TABLE `UserInformation` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserTable`
--

CREATE TABLE `UserTable` (
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `Verify` tinyint(1) NOT NULL,
  `Userpassword` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WantedPersons`
--

CREATE TABLE `WantedPersons` (
  `wantedPersonID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `crimeDescription` text DEFAULT NULL,
  `photoURL` varchar(255) DEFAULT NULL,
  `rewardAmount` decimal(10,2) DEFAULT NULL,
  `contactPhoneNumber` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `Verify` tinyint(1) NOT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `WantedPersons`
--

INSERT INTO `WantedPersons` (`wantedPersonID`, `firstName`, `lastName`, `gender`, `dateOfBirth`, `crimeDescription`, `photoURL`, `rewardAmount`, `contactPhoneNumber`, `status`, `Verify`, `userID`) VALUES
(1, 'John', 'Doe', 'Male', '1985-05-15', 'Robbery', 'http://example.com/johndoe.jpg', 5000.00, '555-1234', 'Wanted', 1, 1),
(2, 'Jane', 'Smith', 'Female', '1992-08-25', 'Fraud', 'http://example.com/janesmith.jpg', 10000.00, '555-5678', 'Wanted', 1, 2),
(3, 'Jack', 'Black', 'Male', '1980-11-22', 'Assault', 'http://example.com/jackblack.jpg', 7000.00, '555-9012', 'Wanted', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wanted_persons`
--

CREATE TABLE `wanted_persons` (
  `wantedPersonID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `crimeDescription` text DEFAULT NULL,
  `photoURL` varchar(255) DEFAULT NULL,
  `rewardAmount` decimal(10,2) DEFAULT NULL,
  `contactPhoneNumber` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `Verify` tinyint(1) NOT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wanted_persons`
--

INSERT INTO `wanted_persons` (`wantedPersonID`, `firstName`, `lastName`, `alias`, `gender`, `dateOfBirth`, `crimeDescription`, `photoURL`, `rewardAmount`, `contactPhoneNumber`, `status`, `Verify`, `userID`) VALUES
(1, 'John', 'Doe', 'Johnny', 'Male', '1985-05-15', 'Robbery', 'http://example.com/johndoe.jpg', 5000.00, '555-1234', 'Wanted', 1, 1),
(2, 'Jane', 'Smith', 'Janie', 'Female', '1992-08-25', 'Fraud', 'http://example.com/janesmith.jpg', 10000.00, '555-5678', 'Wanted', 1, 2),
(3, 'Jack', 'Black', 'Jackie', 'Male', '1980-11-22', 'Assault', 'http://example.com/jackblack.jpg', 7000.00, '555-9012', 'Wanted', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Documents`
--
ALTER TABLE `Documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MissingPersons`
--
ALTER TABLE `MissingPersons`
  ADD PRIMARY KEY (`missingPersonID`);

--
-- Indexes for table `StolenItems`
--
ALTER TABLE `StolenItems`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `StolenVehicles`
--
ALTER TABLE `StolenVehicles`
  ADD PRIMARY KEY (`vehicleID`);

--
-- Indexes for table `UserInformation`
--
ALTER TABLE `UserInformation`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `UserTable`
--
ALTER TABLE `UserTable`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `WantedPersons`
--
ALTER TABLE `WantedPersons`
  ADD PRIMARY KEY (`wantedPersonID`);

--
-- Indexes for table `wanted_persons`
--
ALTER TABLE `wanted_persons`
  ADD PRIMARY KEY (`wantedPersonID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Documents`
--
ALTER TABLE `Documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `MissingPersons`
--
ALTER TABLE `MissingPersons`
  MODIFY `missingPersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `StolenItems`
--
ALTER TABLE `StolenItems`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `StolenVehicles`
--
ALTER TABLE `StolenVehicles`
  MODIFY `vehicleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `UserInformation`
--
ALTER TABLE `UserInformation`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserTable`
--
ALTER TABLE `UserTable`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WantedPersons`
--
ALTER TABLE `WantedPersons`
  MODIFY `wantedPersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wanted_persons`
--
ALTER TABLE `wanted_persons`
  MODIFY `wantedPersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `UserTable`
--
ALTER TABLE `UserTable`
  ADD CONSTRAINT `UserTable_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `UserInformation` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
