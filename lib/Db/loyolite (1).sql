-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2022 at 09:52 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loyolite`
--

-- --------------------------------------------------------

--
-- Table structure for table `certification`
--

CREATE TABLE `certification` (
  `title` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL,
  `year` varchar(30) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certification`
--

INSERT INTO `certification` (`title`, `location`, `year`, `fileName`, `url`, `email`) VALUES
('', '', '', '19-UCA-022_UCA5601.pdf', '/data/user/0/com.flutter.loyolite/cache/file_picker/19-UCA-022_UCA5601.pdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `ID` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `standard` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`ID`, `title`, `location`, `duration`, `standard`, `description`) VALUES
(3, 'LAHTP', 'Online', '1 Year', 'National', 'LAHTP, by SNA Academy'),
(4, '', 'Chennai', '2020', '', ''),
(5, 'Public Relations Officer', 'Chennai', '2020', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `title` varchar(255) NOT NULL,
  `patentid` varchar(255) NOT NULL,
  `year` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`title`, `patentid`, `year`) VALUES
('The Suble art of not giving a fuck', '', 2018),
('The Suble art of not giving a fuck', '1001', 2018),
('5 AM Club', '1002', 2002);

-- --------------------------------------------------------

--
-- Table structure for table `responsibility`
--

CREATE TABLE `responsibility` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `organization` varchar(255) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `location` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `responsibility`
--

INSERT INTO `responsibility` (`ID`, `name`, `organization`, `duration`, `location`, `role`) VALUES
(3, 'Public Relations Officer', 'Forum of Information Technology', '2020', 'Chennai', 'Inside Loyola');

-- --------------------------------------------------------

--
-- Table structure for table `usercred`
--

CREATE TABLE `usercred` (
  `staffID` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` text NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usercred`
--

INSERT INTO `usercred` (`staffID`, `name`, `email`, `password`) VALUES
(0, '', '19uca022@gmail.com', '1234'),
(1009, 'Jubeen Ferdey', 'jubeenferdey@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `staffID` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `phnum` int(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `shift` int(2) NOT NULL,
  `role` varchar(100) NOT NULL,
  `dept` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `responsibility` varchar(60) NOT NULL,
  `marritalStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`staffID`, `name`, `dob`, `phnum`, `address`, `shift`, `role`, `dept`, `gender`, `responsibility`, `marritalStatus`) VALUES
(1009, 'Jubeen Ferdey', '18/03/2002', 2147483647, 'Tiruppur', 2, 'Staff', 'Computer Science', 'Male', 'Public Relations Officer', 'UnMarried');

-- --------------------------------------------------------

--
-- Table structure for table `userfiles`
--

CREATE TABLE `userfiles` (
  `id` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certification`
--
ALTER TABLE `certification`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `responsibility`
--
ALTER TABLE `responsibility`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `userfiles`
--
ALTER TABLE `userfiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `responsibility`
--
ALTER TABLE `responsibility`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userfiles`
--
ALTER TABLE `userfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
