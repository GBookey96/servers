-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 04:52 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `allservers`
--

DROP TABLE IF EXISTS `allservers`;
CREATE TABLE `allservers` (
  `serverId` int(11) NOT NULL,
  `serverName` varchar(30) NOT NULL,
  `serverIp` varchar(20) NOT NULL,
  `serverHostId` int(11) NOT NULL,
  `serverStatus` int(11) NOT NULL,
  `serverCreatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allservers`
--

INSERT INTO `allservers` (`serverId`, `serverName`, `serverIp`, `serverHostId`, `serverStatus`, `serverCreatedOn`) VALUES
(2, 'Seshimmer', '83.136.214.38', 1, 1, '2023-05-02 14:50:27'),
(3, 'Serlaf', '84.140.128.27', 2, 0, '2023-05-07 14:50:27'),
(4, 'Lollirver', '224.31.190.55', 3, 1, '2023-05-01 14:50:27'),
(5, 'Dumbleserver', '88.74.210.139', 4, 0, '2023-05-03 14:50:27'),
(6, 'Serverett', '15.182.248.94', 1, 1, '2023-05-04 14:50:27'),
(7, 'Rusalrver', '173.173.28.52', 2, 0, '2023-05-05 14:50:27'),
(8, 'Sererion', '135.147.109.72', 3, 1, '2023-05-06 14:50:27'),
(9, 'Kramrver', '186.102.161.149', 4, 0, '2023-05-08 14:50:27'),
(10, 'Serverilbo', '34.119.225.163', 1, 1, '2023-05-09 14:50:27'),
(11, 'Forestserver', '92.234.141.231', 2, 0, '2023-05-10 14:50:27'),
(12, 'Serverelf', '134.240.153.92', 3, 1, '2023-05-11 14:50:27'),
(13, 'Serverolas', '218.29.106.182', 4, 0, '2023-05-12 14:50:27');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allservers`
--
ALTER TABLE `allservers`
  MODIFY `serverId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
