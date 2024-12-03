-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2022 at 09:26 AM
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
  `Certification Title` varchar(255) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Year` varchar(30) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `certification`
--

INSERT INTO `certification` (`Certification Title`, `Location`, `Year`, `fileName`, `url`) VALUES
('Udemy', 'Online', '2022', '', ''),
('Udemy', 'Online', '2022', '', ''),
('', '', '', '', ''),
('', '', '', '19-UCA-022_UCA5601.pdf', '/data/user/0/com.flutter.loyolite/cache/file_picker/19-UCA-022_UCA5601.pdf');

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
-- Dumping data for table `userfiles`
--

INSERT INTO `userfiles` (`id`, `url`, `name`) VALUES
(8, '/data/user/0/com.example.teachers_diary/cache/file', 'DS - Mock Test. ( 19-UCA-022).pdf'),
(9, '/data/user/0/com.example.teachers_diary/cache/file', 'My Resume.pdf'),
(10, '/data/user/0/com.example.teachers_diary/cache/file', 'My Resume.pdf'),
(11, '/data/user/0/com.example.teachers_diary/cache/file', 'My Resume.pdf'),
(12, '/data/user/0/com.flutter.loyolite/cache/file_picke', 'My Resume.pdf'),
(13, '/data/user/0/com.flutter.loyolite/cache/file_picke', '19-UCA-022_UCA5601.pdf'),
(14, '/data/user/0/com.flutter.loyolite/cache/file_picke', '19-UCA-022_UCA5601.pdf'),
(15, '/data/user/0/com.flutter.loyolite/cache/file_picke', '19-UCA-022_UCA5601.pdf'),
(16, '/data/user/0/com.flutter.loyolite/cache/file_picke', '19-UCA-022_UCA5601.pdf'),
(17, '/data/user/0/com.flutter.loyolite/cache/file_picke', '19-UCA-022_UCA5601.pdf'),
(18, '/data/user/0/com.flutter.loyolite/cache/file_picke', 'My Resume.pdf'),
(19, '/data/user/0/com.flutter.loyolite/cache/file_picke', 'My Resume.pdf');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `userfiles`
--
ALTER TABLE `userfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
