-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 04:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mesima3`
--
CREATE DATABASE IF NOT EXISTS `mesima3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mesima3`;

-- --------------------------------------------------------

--
-- Table structure for table `allservers`
--

CREATE TABLE `allservers` (
  `serverId` int(11) NOT NULL,
  `serverName` varchar(30) NOT NULL,
  `serverIp` varchar(20) NOT NULL,
  `serverHostId` int(11) NOT NULL,
  `serverStatus` tinyint(1) NOT NULL,
  `serverCreatedOn` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allservers`
--

INSERT INTO `allservers` (`serverId`, `serverName`, `serverIp`, `serverHostId`, `serverStatus`, `serverCreatedOn`) VALUES
(2, 'Seshimmer', '83.136.214.38', 1, 1, '2023-05-02'),
(3, 'Serlaf', '84.140.128.27', 2, 1, '2023-05-07'),
(4, 'Lollirver', '224.31.190.55', 3, 0, '2023-05-01'),
(5, 'Dumbleserver', '88.74.210.139', 4, 0, '2023-05-03'),
(6, 'Serverett', '15.182.248.94', 1, 1, '2023-05-04'),
(7, 'Rusalrver', '173.173.28.52', 2, 0, '2023-05-05'),
(8, 'Sererion', '135.147.109.72', 3, 0, '2023-05-06'),
(9, 'Kramrver', '186.102.161.149', 4, 0, '2023-05-08'),
(10, 'Serverilbo', '34.119.225.163', 1, 1, '2023-05-09'),
(11, 'Forestserver', '92.234.141.231', 2, 1, '2023-05-10'),
(12, 'Serverelf', '134.240.153.92', 3, 0, '2023-05-11'),
(13, 'Serverolas', '218.29.106.182', 4, 0, '2023-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `serverhost`
--

CREATE TABLE `serverhost` (
  `serverHostId` int(11) NOT NULL,
  `serverHostName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serverhost`
--

INSERT INTO `serverhost` (`serverHostId`, `serverHostName`) VALUES
(1, 'Microsoft'),
(2, 'IBM'),
(3, 'GoDaddy'),
(4, 'DigitalO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allservers`
--
ALTER TABLE `allservers`
  ADD PRIMARY KEY (`serverId`),
  ADD KEY `serverHostId` (`serverHostId`);

--
-- Indexes for table `serverhost`
--
ALTER TABLE `serverhost`
  ADD PRIMARY KEY (`serverHostId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allservers`
--
ALTER TABLE `allservers`
  MODIFY `serverId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `serverhost`
--
ALTER TABLE `serverhost`
  MODIFY `serverHostId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allservers`
--
ALTER TABLE `allservers`
  ADD CONSTRAINT `allservers_ibfk_1` FOREIGN KEY (`serverHostId`) REFERENCES `serverhost` (`serverHostId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
