-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 18, 2024 at 02:01 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `efficiencyxcel`
--

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE IF NOT EXISTS `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(200) NOT NULL,
  `blacklisted_on` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blacklist`
--

INSERT INTO `blacklist` (`id`, `token`, `blacklisted_on`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0ZXN0MSIsImV4cCI6MTcxMDUyODQwMH0.ac-S0d-UhLpJq2IZ989fjQCa-iei3sQolZIdbgaecfs', '2024-03-14 12:49:48'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0ZXN0MyIsImV4cCI6MTcxMDU0NTg4Mn0.phT_uV5WJRq5KxS5SEl467PUDdbAuuNckDDTLmssWIQ', '2024-03-14 17:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `clearance_requests`
--

DROP TABLE IF EXISTS `clearance_requests`;
CREATE TABLE IF NOT EXISTS `clearance_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `division` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `state` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL,
  `c_email` varchar(30) DEFAULT NULL,
  `officer_id` int(11) DEFAULT NULL,
  `details` varchar(500) DEFAULT NULL,
  `approved_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clearance_requests`
--

INSERT INTO `clearance_requests` (`id`, `name`, `division`, `district`, `description`, `state`, `timestamp`, `c_email`, `officer_id`, `details`, `approved_timestamp`) VALUES
(1, 'Peris', 'Alawatugoda', 'Dambulla', 'I need security clearance report for a job interview', 'pending', '2024-03-14 12:59:38', NULL, NULL, NULL, NULL),
(2, 'Peris', 'Alawatugoda', 'Dambulla', 'I need security clearance report for a job interview', 'approved', '2024-03-14 13:00:40', NULL, 0, 'no offence reports were in database for the civilian', '2024-03-14 17:52:07'),
(3, 'Peris', 'Alawatugoda', 'Dambulla', 'I need security clearance report for a job interview', 'approved', '2024-03-14 13:10:45', 'test2@abc.com', NULL, 'no offence reports were in database for the civilian', '2024-03-14 13:29:21'),
(4, 'Sanduni', 'Gampola', 'Dambulla', 'I need security clearance report for a job interview', 'disapproved', '2024-03-14 17:41:23', 'test3@abc.com', 0, 'I just disapprove civilian requests for fun', '2024-03-14 17:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
CREATE TABLE IF NOT EXISTS `complaints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `division` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `complaint` varchar(500) NOT NULL,
  `state` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `name`, `division`, `district`, `complaint`, `state`, `timestamp`) VALUES
(1, 'Dilshan', 'Nawalapitiya', 'Kandy', 'Hello World', 'pending', '2024-03-14 12:53:46'),
(2, 'Dilshan', 'Nawalapitiya', 'Kandy', 'Hello World', 'pending', '2024-03-14 12:54:49'),
(3, 'John', 'Trinco', 'Trinco', 'sdasdfafsd', 'pending', '2024-03-14 17:39:29');

-- --------------------------------------------------------

--
-- Table structure for table `criminals`
--

DROP TABLE IF EXISTS `criminals`;
CREATE TABLE IF NOT EXISTS `criminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `division` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criminals`
--

INSERT INTO `criminals` (`id`, `name`, `age`, `description`, `division`, `district`) VALUES
(1, 'me', 24, 'Breaks things', 'Nilaveli', 'Trincomalee'),
(2, 'Pasindu', 24, 'Breaks things', 'Nilaveli', 'Trincomalee');

-- --------------------------------------------------------

--
-- Table structure for table `feeddata`
--

DROP TABLE IF EXISTS `feeddata`;
CREATE TABLE IF NOT EXISTS `feeddata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL,
  `misc` varchar(100) DEFAULT NULL,
  `img` longblob,
  `alerts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feeddata`
--

INSERT INTO `feeddata` (`id`, `label`, `location`, `timestamp`, `misc`, `img`, `alerts`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `lost_item_reports`
--

DROP TABLE IF EXISTS `lost_item_reports`;
CREATE TABLE IF NOT EXISTS `lost_item_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `division` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `item` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `state` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lost_item_reports`
--

INSERT INTO `lost_item_reports` (`id`, `name`, `division`, `district`, `item`, `description`, `state`, `timestamp`) VALUES
(1, 'Kavindu', 'Kotmale', 'Nuwara Eliya', 'iPhone 13', 'lost it during shopping on 13 th feb, 2024 evening 2 PM', 'pending', '2024-03-14 12:56:43'),
(2, 'Kavindu', 'Kotmale', 'Nuwara Eliya', 'iPhone 13', 'lost it during shopping on 13 th feb, 2024 evening 2 PM', 'pending', '2024-03-14 12:57:41'),
(3, 'Perera', 'Kegalla', 'Kalutara', 'Mobile phone', 'blah blah blah lost it during shopping on 13 th feb, 2024 evening 2 PM', 'pending', '2024-03-14 17:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
CREATE TABLE IF NOT EXISTS `officer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `division` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `rank` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `officer`
--

INSERT INTO `officer` (`id`, `officer_id`, `user_id`, `division`, `district`, `rank`) VALUES
(1, 0, 1, 'Nawalapitiya', 'Kandy', 'OIC');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `hashed_password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `role`, `hashed_password`) VALUES
(1, 'test1', 'test1@abc.com', 'officer', '$2b$12$AplnRTZselfyfv7sphnCT.B9t/Ou4ymliAwXG5MpiO/kbAK3xVgom'),
(2, 'test2', 'test2@abc.com', 'civilian', '$2b$12$KIys.A2FEwOrYGOIb3OEbu9BRaMPU/3650EvZEIXlM4cB.I4/8Jvm'),
(3, 'test3', 'test3@abc.com', 'civilian', '$2b$12$QCcqTvnaoQ30lquYHYLNI.dVwbluJ6ZF6iTPHagIoYQl5Q3103DIi');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;