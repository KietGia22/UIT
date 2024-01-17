create database maybay;
use maybay;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2024 at 04:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thamkhao`
--

-- --------------------------------------------------------

--
-- Table structure for table `chuyenbay`
--

CREATE TABLE `chuyenbay` (
  `MACH` varchar(10) NOT NULL,
  `CHUYEN` varchar(50) DEFAULT NULL,
  `DDI` varchar(50) DEFAULT NULL,
  `DDEN` varchar(50) DEFAULT NULL,
  `NGAY` varchar(20) DEFAULT NULL,
  `GBAY` varchar(20) DEFAULT NULL,
  `GDEN` varchar(20) DEFAULT NULL,
  `THUONG` int(11) DEFAULT NULL,
  `VIP` int(11) DEFAULT NULL,
  `MAMB` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chuyenbay`
--

INSERT INTO `chuyenbay` (`MACH`, `CHUYEN`, `DDI`, `DDEN`, `NGAY`, `GBAY`, `GDEN`, `THUONG`, `VIP`, `MAMB`) VALUES
('CB001', 'SG_HN', 'SG', 'HN', '2024-01-15', '10:00 AM', '12:00 PM', 100, 20, 'MB001');

-- --------------------------------------------------------

--
-- Table structure for table `ct_cb`
--

CREATE TABLE `ct_cb` (
  `MACH` varchar(10) NOT NULL,
  `MAHK` varchar(10) NOT NULL,
  `SOGHE` varchar(5) DEFAULT NULL,
  `LOAIGHE` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ct_cb`
--

INSERT INTO `ct_cb` (`MACH`, `MAHK`, `SOGHE`, `LOAIGHE`) VALUES
('CB001', 'HK001', 'sss', 0),
('CB001', 'HK002', '27C', 1),
('CB001', 'newkh', 'aaa1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hanhkhach`
--

CREATE TABLE `hanhkhach` (
  `MAHK` varchar(10) NOT NULL,
  `HOTEN` varchar(50) DEFAULT NULL,
  `DIACHI` varchar(100) DEFAULT NULL,
  `DIENTHOAI` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hanhkhach`
--

INSERT INTO `hanhkhach` (`MAHK`, `HOTEN`, `DIACHI`, `DIENTHOAI`) VALUES
('dsdas', 'dsadsadsa', 'dsadsadsads', 'dsadas'),
('HK001', 'Nguyen Van A', '123 Main St', '0123456789'),
('HK002', 'Tran Thi B', '456 Oak St', '0987654321'),
('newkh', 'tao đây', '123 adc', '1233233');

-- --------------------------------------------------------

--
-- Table structure for table `maybay`
--

CREATE TABLE `maybay` (
  `MAMB` varchar(10) NOT NULL,
  `HANGMB` varchar(50) DEFAULT NULL,
  `SOCHO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maybay`
--

INSERT INTO `maybay` (`MAMB`, `HANGMB`, `SOCHO`) VALUES
('MB001', 'Vietnam Airlines', 150);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chuyenbay`
--
ALTER TABLE `chuyenbay`
  ADD PRIMARY KEY (`MACH`),
  ADD KEY `MAMB` (`MAMB`);

--
-- Indexes for table `ct_cb`
--
ALTER TABLE `ct_cb`
  ADD PRIMARY KEY (`MACH`,`MAHK`),
  ADD KEY `MAHK` (`MAHK`);

--
-- Indexes for table `hanhkhach`
--
ALTER TABLE `hanhkhach`
  ADD PRIMARY KEY (`MAHK`);

--
-- Indexes for table `maybay`
--
ALTER TABLE `maybay`
  ADD PRIMARY KEY (`MAMB`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chuyenbay`
--
ALTER TABLE `chuyenbay`
  ADD CONSTRAINT `chuyenbay_ibfk_1` FOREIGN KEY (`MAMB`) REFERENCES `maybay` (`MAMB`);

--
-- Constraints for table `ct_cb`
--
ALTER TABLE `ct_cb`
  ADD CONSTRAINT `ct_cb_ibfk_1` FOREIGN KEY (`MACH`) REFERENCES `chuyenbay` (`MACH`),
  ADD CONSTRAINT `ct_cb_ibfk_2` FOREIGN KEY (`MAHK`) REFERENCES `hanhkhach` (`MAHK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
