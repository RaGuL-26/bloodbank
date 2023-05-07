-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2021 at 04:48 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bloodbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodinfo`
--

CREATE TABLE `bloodinfo` (
  `bid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `bg` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodinfo`
--

INSERT INTO `bloodinfo` (`bid`, `hid`, `bg`) VALUES
(1, 1, 'B+'),
(2, 2, 'A+'),
(3, 3, 'O+'),
(4, 3, 'B+'),
(5, 3, 'AB-'),
(6, 4, 'B-'),
(7, 4, 'AB+'),
(8, 5, 'O-'),
(9, 5, 'B+'),
(10, 6, 'A-'),
(11, 6, 'B-');

-- --------------------------------------------------------

--
-- Table structure for table `bloodrequest`
--

CREATE TABLE `bloodrequest` (
  `reqid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `bg` varchar(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodrequest`
--

INSERT INTO `bloodrequest` (`reqid`, `hid`, `rid`, `bg`, `status`) VALUES
(1, 1, 1, 'B+', 'Pending'),
(2, 3, 3, 'AB-', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `hname` varchar(100) NOT NULL,
  `hemail` varchar(100) NOT NULL,
  `hpassword` varchar(100) NOT NULL,
  `hphone` varchar(100) NOT NULL,
  `hcity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `hname`, `hemail`, `hpassword`, `hphone`, `hcity`) VALUES
(1, 'Fortis Mallar Hospital', 'healthcare@fortismalarhospital.com', 'Fortismalar@123', '914442892222', 'Chennai'),
(2, 'SRM Hospital', 'healthmatters@srmhospital.com', 'Srm@123', '914427452270', 'Kancheepuram'),
(3, 'Apollo Multi Speciality Hospital', 'Apollocares@apollohospitals.com', 'Apollo@123', '914428290200', 'Chennai'),
(4, 'MIOT Hospital', 'miotcares@miothospital.com', 'Miot@123', '9122492288', 'Chennai'),
(5, 'CSI Kalyani Hospital', 'healthpioneer@csikalyanihospital.com', 'Csikalyani@123', '914428476433', 'Chennai'),
(6, 'Kauvery Hospital', 'lifecare@kauveryhospital.com', 'Kauvery@123', '914462855324', 'Salem');

-- --------------------------------------------------------

--
-- Table structure for table `receivers`
--

CREATE TABLE `receivers` (
  `id` int(11) NOT NULL,
  `rname` varchar(100) NOT NULL,
  `remail` varchar(100) NOT NULL,
  `rpassword` varchar(100) NOT NULL,
  `rphone` varchar(100) NOT NULL,
  `rbg` varchar(10) NOT NULL,
  `rcity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receivers`
--

INSERT INTO `receivers` (`id`, `rname`, `remail`, `rpassword`, `rphone`, `rbg`, `rcity`) VALUES
(1, 'Vinoth', 'vinoth@gmail.com', 'vinoth@123', '9178234217', 'A-', 'Trichy'),
(2, 'Joshua', 'joshua@gmail.com', 'joshua@123', '7256300185', 'O-', 'Thiruvallur'),
(3, 'Hari', 'hari@gmail.com', 'hari@123', '9174568052', 'B+', 'Madurai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodinfo`
--
ALTER TABLE `bloodinfo`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `hid` (`hid`);

--
-- Indexes for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  ADD PRIMARY KEY (`reqid`),
  ADD KEY `hid` (`hid`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hemail` (`hemail`);

--
-- Indexes for table `receivers`
--
ALTER TABLE `receivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remail` (`remail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloodinfo`
--
ALTER TABLE `bloodinfo`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bloodrequest`
--
ALTER TABLE `bloodrequest`
  MODIFY `reqid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `receivers`
--
ALTER TABLE `receivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloodinfo`
--
ALTER TABLE `bloodinfo`
  ADD CONSTRAINT `bloodinfo_ibfk_1` FOREIGN KEY (`hid`) REFERENCES `hospitals` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
