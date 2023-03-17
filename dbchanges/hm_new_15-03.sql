-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2023 at 01:51 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hm_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `ref_no` varchar(255) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `type` enum('static','digital','promospace') DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `owned_by` varchar(250) NOT NULL,
  `asset_photo` varchar(300) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `installation_time` varchar(200) DEFAULT NULL COMMENT 'Time needed to install in microseconds',
  `package_type` varchar(50) NOT NULL DEFAULT 'individual',
  `no_of_assets` int(11) NOT NULL DEFAULT 0,
  `slots` int(11) NOT NULL DEFAULT 1,
  `status` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `department_id`, `ref_no`, `name`, `type`, `location_id`, `owned_by`, `asset_photo`, `description`, `installation_time`, `package_type`, `no_of_assets`, `slots`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 2, 'G11-12SP-C-FM01', '12 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(3, 2, 'G11-12SP-C-FM03', '12 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(4, 2, 'G11-12SP-C-FM04', '12 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(5, 2, 'G11-12SP-P-FM05', '12 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(6, 2, 'G11-12SP-P-FM06', '12 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(7, 2, 'G11-12SP-P-FM10', '12 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(8, 2, 'G11-12SP-P-FM11', '12 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(9, 2, 'G12-12SP-C-FM01', '12 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(10, 2, 'G12-12SP-C-FM03', '12 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(11, 2, 'G12-12SP-P-FM05', '12 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(12, 2, 'G12-12SP-P-FM06', '12 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(13, 2, 'G12-12SP-P-FM07', '12 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(14, 2, 'G12-12SP-P-FM08', '12 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(15, 2, 'G13-12SP-C-FM01', '12 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(16, 2, 'G13-12SP-C-FM03', '12 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(17, 2, 'G13-12SP-C-FM04', '12 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(18, 2, 'G13-12SP-P-FM05', '12 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(19, 2, 'G13-12SP-P-FM06', '12 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(20, 2, 'G13-12SP-P-FM07', '12 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(21, 2, 'G13-12SP-P-FM08', '12 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(22, 2, 'G14-12SP-C-FM01', '12 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(23, 2, 'G14-12SP-C-FM03', '12 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(24, 2, 'G14-12SP-C-FM04', '12 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(25, 2, 'G14-12SP-P-FM05', '12 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(26, 2, 'G14-12SP-P-FM06', '12 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(27, 2, 'G14-12SP-P-FM07', '12 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(28, 2, 'G14-12SP-P-FM08', '12 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(29, 2, 'G15-12SP-C-FM01', '12 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(30, 2, 'G15-12SP-C-FM03', '12 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(31, 2, 'G15-12SP-P-FM05', '12 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(32, 2, 'G15-12SP-P-FM06', '12 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(33, 2, 'G15-12SP-P-FM07', '12 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(34, 2, 'G15-12SP-P-FM08', '12 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(35, 2, 'G16-12SP-C-FM02', '12 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(36, 2, 'G16-12SP-C-FM03', '12 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(37, 2, 'G16-12SP-C-FM04', '12 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(38, 2, 'G16-12SP-P-FM05', '12 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(39, 2, 'G16-12SP-P-FM06', '12 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(40, 2, 'G16-12SP-P-FM07', '12 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(41, 2, 'G16-12SP-P-FM08', '12 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(42, 2, 'G17-12SP-C-FM01', '12 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(43, 2, 'G17-12SP-C-FM03', '12 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(44, 2, 'G17-12SP-C-FM04', '12 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(45, 2, 'G17-12SP-P-FM05', '12 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(46, 2, 'G17-12SP-P-FM06', '12 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(47, 2, 'G17-12SP-P-FM07', '12 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(48, 2, 'G17-12SP-P-FM08', '12 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(49, 2, 'G18-12SP-C-FM04', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(50, 2, 'G18-12SP-P-FM05', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(51, 2, 'G18-12SP-P-FM06', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(52, 2, 'G18-12SP-P-FM07', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(53, 2, 'G18-12SP-P-FM08', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(54, 2, 'G19-12SP-C-FM02', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(55, 2, 'G19-12SP-C-FM04', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(56, 2, 'G19-12SP-P-FM05', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(57, 2, 'G19-12SP-P-FM06', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(58, 2, 'G19-12SP-P-FM07', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(59, 2, 'G19-12SP-P-FM08', '12 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(60, 2, 'G21-12SP-C-FM03', '12 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(61, 2, 'G21-12SP-C-FM04', '12 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(62, 2, 'G21-12SP-P-FM05', '12 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(63, 2, 'G21-12SP-P-FM06', '12 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(64, 2, 'G22-12SP-P-FM06', '12 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(65, 2, 'G22-12SP-P-FM07', '12 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(66, 2, 'G25-12SP-C-FM02', '12 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(67, 2, 'G25-12SP-C-FM04', '12 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(68, 2, 'G27-12SP-C-FM04', '12 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(69, 2, 'G27-12SP-P-FM05', '12 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(70, 2, 'G27-12SP-P-FM06', '12 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(71, 2, 'G27-12SP-P-FM07', '12 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(72, 2, 'G27-12SP-P-FM08', '12 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(73, 2, 'G28-12SP-C-FM02', '12 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(74, 2, 'G28-12SP-C-FM04', '12 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(75, 2, 'G28-12SP-P-FM06', '12 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(76, 2, 'G28-12SP-P-FM07', '12 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(77, 2, 'G28-12SP-P-FM08', '12 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(78, 2, 'G28-12SP-P-FM09', '12 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(79, 2, 'G29-12SP-C-FM04', '12 Sheet', 'static', 15, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(80, 2, 'G29-12SP-C-FM06', '12 Sheet', 'static', 15, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(81, 2, 'G29-12SP-C-FM07', '12 Sheet', 'static', 15, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(82, 2, 'G30-12SP-C-FM02', '12 Sheet', 'static', 16, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(83, 2, 'G30-12SP-C-FM06', '12 Sheet', 'static', 16, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(84, 2, 'G30-12SP-C-FM07', '12 Sheet', 'static', 16, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(85, 2, 'R11-12SP-C-FM02', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(86, 2, 'R11-12SP-P-FM06', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(87, 2, 'R11-12SP-P-FM07', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(88, 2, 'R11-12SP-P-FM08', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(89, 2, 'R11-12SP-P-FM09', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(90, 2, 'R11-12SP-P-FM10', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(91, 2, 'R11-12SP-P-FM11', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(92, 2, 'R11-12SP-P-FM12', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(93, 2, 'R11-12SP-P-FM13', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(94, 2, 'R11-12SP-P-FM14', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(95, 2, 'R11-12SP-P-FM15', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(96, 2, 'R11-12SP-P-FM16', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(97, 2, 'R11-12SP-P-FM17', '12 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(98, 2, 'R12-12SP-C-FM02', '12 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(99, 2, 'R12-12SP-C-FM04', '12 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(100, 2, 'R12-12SP-C-FM05', '12 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(101, 2, 'R12-12SP-P-FM06', '12 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(102, 2, 'R12-12SP-P-FM07', '12 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(103, 2, 'R12-12SP-P-FM08', '12 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(104, 2, 'R12-12SP-P-FM09', '12 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(105, 2, 'R13-12SP-C-FM01', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(106, 2, 'R13-12SP-C-FM03', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(107, 2, 'R13-12SP-C-FM06', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(108, 2, 'R13-12SP-C-FM07', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(109, 2, 'R13-12SP-C-FM08', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(110, 2, 'R13-12SP-P-FM09', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(111, 2, 'R13-12SP-P-FM10', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(112, 2, 'R13-12SP-P-FM11', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(113, 2, 'R13-12SP-P-FM12', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(114, 2, 'R13-12SP-P-FM13', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(115, 2, 'R13-12SP-P-FM14', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(116, 2, 'R13-12SP-P-FM15', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(117, 2, 'R13-12SP-P-FM16', '12 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(118, 2, 'R14-12SP-C-FM05', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(119, 2, 'R14-12SP-C-FM08', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(120, 2, 'R14-12SP-EG-FM02', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(121, 2, 'R14-12SP-FB-FM03', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(122, 2, 'R14-12SP-FB-FM04', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(123, 2, 'R14-12SP-P-FM09', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(124, 2, 'R14-12SP-P-FM10', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(125, 2, 'R14-12SP-P-FM11', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(126, 2, 'R14-12SP-P-FM12', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(127, 2, 'R14-12SP-P-FM13', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(128, 2, 'R14-12SP-P-FM14', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(129, 2, 'R14-12SP-P-FM15', '12 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(130, 2, 'R15-12SP-C-FM01', '12 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(131, 2, 'R15-12SP-C-FM03', '12 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(132, 2, 'R15-12SP-C-FM04', '12 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(133, 2, 'R15-12SP-P-FM05', '12 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(134, 2, 'R15-12SP-P-FM06', '12 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(135, 2, 'R15-12SP-P-FM07', '12 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(136, 2, 'R15-12SP-P-FM08', '12 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(137, 2, 'R16-12SP-EG-FM01', '12 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(138, 2, 'R16-12SP-P-FM15', '12 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(139, 2, 'R16-12SP-P-FM18', '12 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(140, 2, 'R16-12SP-P-FM21', '12 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(141, 2, 'R17-12SP-C-FM03', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(142, 2, 'R17-12SP-C-FM06', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(143, 2, 'R17-12SP-P-FM07', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(144, 2, 'R17-12SP-P-FM08', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(145, 2, 'R17-12SP-P-FM09', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(146, 2, 'R17-12SP-P-FM10', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(147, 2, 'R17-12SP-P-FM11', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(148, 2, 'R17-12SP-P-FM12', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(149, 2, 'R17-12SP-P-FM13', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(150, 2, 'R17-12SP-P-FM14', '12 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(151, 2, 'R18-12SP-P-FM03', '12 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(152, 2, 'R18-12SP-P-FM04', '12 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(153, 2, 'R18-12SP-P-FM05', '12 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(154, 2, 'R18-12SP-P-FM07', '12 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(155, 2, 'R20-12SP-C-FM03', '12 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(156, 2, 'R20-12SP-C-FM05', '12 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(157, 2, 'R20-12SP-P-FM07', '12 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(158, 2, 'R20-12SP-P-FM08', '12 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(159, 2, 'R20-12SP-P-FM09', '12 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(160, 2, 'R20-12SP-P-FM10', '12 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(161, 2, 'R21-12SP-C-FM03', '12 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(162, 2, 'R21-12SP-C-FM05', '12 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(163, 2, 'R21-12SP-P-FM07', '12 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(164, 2, 'R21-12SP-P-FM08', '12 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(165, 2, 'R21-12SP-P-FM11', '12 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(166, 2, 'R21-12SP-P-FM12', '12 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(167, 2, 'R22-12SP-C-FM04', '12 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(168, 2, 'R22-12SP-C-FM06', '12 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(169, 2, 'R22-12SP-P-FM07', '12 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(170, 2, 'R22-12SP-P-FM08', '12 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(171, 2, 'R22-12SP-P-FM09', '12 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(172, 2, 'R22-12SP-P-FM10', '12 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(173, 2, 'R23-12SP-C-FM03', '12 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(174, 2, 'R23-12SP-P-FM05', '12 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(175, 2, 'R23-12SP-P-FM06', '12 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(176, 2, 'R23-12SP-P-FM07', '12 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(177, 2, 'R23-12SP-P-FM08', '12 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(178, 2, 'R24-12SP-C-FM05', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(179, 2, 'R24-12SP-EG-FM01', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(180, 2, 'R24-12SP-EG-FM02', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(181, 2, 'R24-12SP-EG-FM03', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(182, 2, 'R24-12SP-I-FM04', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(183, 2, 'R24-12SP-P-FM09', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(184, 2, 'R24-12SP-P-FM10', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(185, 2, 'R24-12SP-P-FM11', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(186, 2, 'R24-12SP-P-FM12', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(187, 2, 'R24-12SP-P-FM13', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(188, 2, 'R24-12SP-P-FM14', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(189, 2, 'R24-12SP-P-FM15', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(190, 2, 'R24-12SP-P-FM16', '12 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(191, 2, 'R25-12SD-P-FM02', '12 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(192, 2, 'R25-12SD-P-FM03', '12 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(193, 2, 'R26-12SP-P-FM06', '12 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(194, 2, 'R26-12SP-P-FM07', '12 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(195, 2, 'R26-12SP-P-FM08', '12 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(196, 2, 'R26-12SP-P-FM09', '12 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(197, 2, 'R29-12SP-C-FM04', '12 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(198, 2, 'R29-12SP-C-FM06', '12 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(199, 2, 'R29-12SP-FB-FM01', '12 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(200, 2, 'R29-12SP-I-FM02', '12 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(201, 2, 'R29-12SP-P-FM07', '12 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(202, 2, 'R29-12SP-P-FM08', '12 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(203, 2, 'R29-12SP-P-FM09', '12 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(204, 2, 'R29-12SP-P-FM10', '12 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(205, 2, 'R31-12SP-P-FM08', '12 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(206, 2, 'R31-12SP-P-FM09', '12 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(207, 2, 'R31-12SP-P-FM10', '12 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(208, 2, 'R31-12SP-P-FM11', '12 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(209, 2, 'R32-12SP-P-FM12', '12 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(210, 2, 'R32-12SP-P-FM13', '12 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(211, 2, 'R32-12SP-P-FM16', '12 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(212, 2, 'R32-12SP-P-FM17', '12 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(213, 2, 'R33-12SP-P-FM06', '12 Sheet', 'static', 35, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(214, 2, 'R33-12SP-P-FM07', '12 Sheet', 'static', 35, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(215, 2, 'R33-12SP-P-FM08', '12 Sheet', 'static', 35, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(216, 2, 'R33-12SP-P-FM09', '12 Sheet', 'static', 35, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(217, 2, 'R34-12SP-C-FM03', '12 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(218, 2, 'R34-12SP-P-FM05', '12 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(219, 2, 'R34-12SP-P-FM06', '12 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(220, 2, 'R34-12SP-P-FM07', '12 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(221, 2, 'R34-12SP-P-FM08', '12 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(222, 2, 'R35-12SP-C-FM04', '12 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(223, 2, 'R35-12SP-C-FM06', '12 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(224, 2, 'R35-12SP-P-FM09', '12 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(225, 2, 'R35-12SP-P-FM10', '12 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(226, 2, 'R35-12SP-P-FM11', '12 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(227, 2, 'R35-12SP-P-FM12', '12 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(228, 2, 'R36-12SP-C-FM05', '12 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(229, 2, 'R36-12SP-C-FM07', '12 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(230, 2, 'R36-12SP-P-FM09', '12 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(231, 2, 'R36-12SP-P-FM10', '12 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(232, 2, 'R36-12SP-P-FM11', '12 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(233, 2, 'R36-12SP-P-FM12', '12 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(234, 2, 'R37-12SP-P-FM08', '12 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(235, 2, 'R37-12SP-P-FM09', '12 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(236, 2, 'R37-12SP-P-FM10', '12 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(237, 2, 'R37-12SP-P-FM11', '12 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(238, 2, 'R38-12SP-C-FM07', '12 Sheet', 'static', 40, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(239, 2, 'R38-12SP-P-FM12', '12 Sheet', 'static', 40, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(240, 2, 'R38-12SP-P-FM15', '12 Sheet', 'static', 40, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(241, 2, 'R38-12SP-P-FM16', '12 Sheet', 'static', 40, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(242, 2, 'R39-12SP-C-FM03', '12 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(243, 2, 'R39-12SP-C-FM05', '12 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(244, 2, 'R39-12SP-FB-FM01', '12 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(245, 2, 'R39-12SP-P-FM06', '12 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(246, 2, 'R39-12SP-P-FM07', '12 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(247, 2, 'R39-12SP-P-FM08', '12 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(248, 2, 'R39-12SP-P-FM09', '12 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(249, 2, 'R40-12SP-C-FM02', '12 Sheet', 'static', 42, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(250, 2, 'R40-12SP-P-FM06', '12 Sheet', 'static', 42, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(251, 2, 'R40-12SP-P-FM09', '12 Sheet', 'static', 42, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(252, 2, 'R41-12SP-C-FM03', '12 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(253, 2, 'R41-12SP-FB-FM13', '12 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(254, 2, 'R41-12SP-I-FM16', '12 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(255, 2, 'R41-12SP-P-FM06', '12 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(256, 2, 'R41-12SP-P-FM08', '12 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(257, 2, 'R41-12SP-P-FM09', '12 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(258, 2, 'R41-12SP-P-FM11', '12 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(259, 2, 'R42-12SP-C-FM01', '12 Sheet', 'static', 44, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(260, 2, 'R42-12SP-P-FM06', '12 Sheet', 'static', 44, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(261, 2, 'R42-12SP-P-FM08', '12 Sheet', 'static', 44, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(262, 2, 'G11-6SP-P-FM31', '6 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(263, 2, 'G11-6SP-P-FM32', '6 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(264, 2, 'G11-6SP-P-FM33', '6 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(265, 2, 'G11-6SP-P-FM34', '6 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(266, 2, 'G11-6SP-P-FM35', '6 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(267, 2, 'G11-6SP-P-FM36', '6 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(268, 2, 'G11-6SP-P-FM37', '6 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(269, 2, 'G11-6SP-P-FM38', '6 Sheet', 'static', 2, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(270, 2, 'G12-6SP-EG-FM01', '6 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(271, 2, 'G12-6SP-EG-FM02', '6 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(272, 2, 'G12-6SP-EG-FM03', '6 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(273, 2, 'G12-6SP-EG-FM04', '6 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(274, 2, 'G12-6SP-P-FM05', '6 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(275, 2, 'G12-6SP-P-FM08', '6 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(276, 2, 'G12-6SP-P-FM09', '6 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(277, 2, 'G12-6SP-P-FM12', '6 Sheet', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(278, 2, 'G13-6SP-EG-FM01', '6 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(279, 2, 'G13-6SP-EG-FM02', '6 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(280, 2, 'G13-6SP-EG-FM05', '6 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(281, 2, 'G13-6SP-EG-FM06', '6 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(282, 2, 'G13-6SP-P-FM07', '6 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(283, 2, 'G13-6SP-P-FM10', '6 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(284, 2, 'G13-6SP-P-FM11', '6 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(285, 2, 'G13-6SP-P-FM14', '6 Sheet', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(286, 2, 'G14-6SP-EG-FM01', '6 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(287, 2, 'G14-6SP-EG-FM02', '6 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(288, 2, 'G14-6SP-EG-FM03', '6 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(289, 2, 'G14-6SP-EG-FM04', '6 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(290, 2, 'G14-6SP-P-FM05', '6 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(291, 2, 'G14-6SP-P-FM08', '6 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(292, 2, 'G14-6SP-P-FM09', '6 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(293, 2, 'G14-6SP-P-FM12', '6 Sheet', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(294, 2, 'G15-6SP-EG-FM01', '6 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(295, 2, 'G15-6SP-EG-FM02', '6 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(296, 2, 'G15-6SP-EG-FM03', '6 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `assets` (`id`, `department_id`, `ref_no`, `name`, `type`, `location_id`, `owned_by`, `asset_photo`, `description`, `installation_time`, `package_type`, `no_of_assets`, `slots`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(297, 2, 'G15-6SP-EG-FM04', '6 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(298, 2, 'G15-6SP-P-FM07', '6 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(299, 2, 'G15-6SP-P-FM10', '6 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(300, 2, 'G15-6SP-P-FM11', '6 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(301, 2, 'G15-6SP-P-FM14', '6 Sheet', 'static', 6, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(302, 2, 'G16-6SP-EG-FM01', '6 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(303, 2, 'G16-6SP-EG-FM02', '6 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(304, 2, 'G16-6SP-P-FM05', '6 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(305, 2, 'G16-6SP-P-FM08', '6 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(306, 2, 'G16-6SP-P-FM09', '6 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(307, 2, 'G16-6SP-P-FM12', '6 Sheet', 'static', 7, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(308, 2, 'G17-6SP-EG-FM01', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(309, 2, 'G17-6SP-EG-FM04', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(310, 2, 'G17-6SP-EG-FM07', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(311, 2, 'G17-6SP-EG-FM08', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(312, 2, 'G17-6SP-FB-FM06', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(313, 2, 'G17-6SP-P-FM10', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(314, 2, 'G17-6SP-P-FM13', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(315, 2, 'G17-6SP-P-FM14', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(316, 2, 'G17-6SP-P-FM17', '6 Sheet', 'static', 8, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(317, 2, 'G18-6SCR-EG-FM01', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(318, 2, 'G18-6SCR-EG-FM03', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(319, 2, 'G18-6SP-EG-FM01', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(320, 2, 'G18-6SP-EG-FM05', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(321, 2, 'G18-6SP-FB-FM03', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(322, 2, 'G18-6SP-FB-FM04', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(323, 2, 'G18-6SP-P-FM07', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(324, 2, 'G18-6SP-P-FM10', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(325, 2, 'G18-6SP-P-FM11', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(326, 2, 'G18-6SP-P-FM14', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(327, 2, 'G19-6SP-EG-FM02', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(328, 2, 'G19-6SP-EG-FM04', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(329, 2, 'G19-6SP-EG-FM05', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(330, 2, 'G19-6SP-EG-FM06', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(331, 2, 'G19-6SP-EG-FM07', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(332, 2, 'G19-6SP-P-FM09', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(333, 2, 'G19-6SP-P-FM10', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(334, 2, 'G19-6SP-P-FM11', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(335, 2, 'G19-6SP-P-FM12', '6 Sheet', 'static', 9, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(336, 2, 'G21-6SP-C-FM02', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(337, 2, 'G21-6SP-C-FM03', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(338, 2, 'G21-6SP-C-FM04', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(339, 2, 'G21-6SP-C-FM05', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(340, 2, 'G21-6SP-C-FM06', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(341, 2, 'G21-6SP-EG-FM01', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(342, 2, 'G21-6SP-P-FM07', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(343, 2, 'G21-6SP-P-FM08', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(344, 2, 'G21-6SP-P-FM09', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(345, 2, 'G21-6SP-P-FM10', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(346, 2, 'G21-6SP-P-FM11', '6 Sheet', 'static', 10, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(347, 2, 'G22-6SCR-C-FM01', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(348, 2, 'G22-6SCR-C-FM02', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(349, 2, 'G22-6SCR-C-FM03', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(350, 2, 'G22-6SCR-P-FM04', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(351, 2, 'G22-6SCR-P-FM05', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(352, 2, 'G22-6SCR-P-FM06', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(353, 2, 'G22-6SCR-P-FM07', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(354, 2, 'G22-6SP-EG-FM03', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(355, 2, 'G22-6SP-EG-FM04', '6 Sheet', 'static', 11, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(356, 2, 'G23-6SP-C-FM06', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(357, 2, 'G23-6SP-C-FM07', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(358, 2, 'G23-6SP-C-FM08', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(359, 2, 'G23-6SP-EG-FM01', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(360, 2, 'G23-6SP-EG-FM02', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(361, 2, 'G23-6SP-EG-FM03', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(362, 2, 'G23-6SP-EG-FM05', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(363, 2, 'G23-6SP-P-FM09', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(364, 2, 'G23-6SP-P-FM10', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(365, 2, 'G23-6SP-P-FM11', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(366, 2, 'G23-6SP-P-FM12', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(367, 2, 'G23-6SP-P-FM13', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(368, 2, 'G23-6SP-P-FM14', '6 Sheet', 'static', 45, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(369, 2, 'G24-6SP-C-FM05', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(370, 2, 'G24-6SP-C-FM06', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(371, 2, 'G24-6SP-C-FM07', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(372, 2, 'G24-6SP-C-FM08', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(373, 2, 'G24-6SP-EG-FM01', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(374, 2, 'G24-6SP-EG-FM02', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(375, 2, 'G24-6SP-EG-FM03', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(376, 2, 'G24-6SP-EG-FM04', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(377, 2, 'G24-6SP-P-FM09', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(378, 2, 'G24-6SP-P-FM10', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(379, 2, 'G24-6SP-P-FM11', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(380, 2, 'G24-6SP-P-FM12', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(381, 2, 'G24-6SP-P-FM13', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(382, 2, 'G24-6SP-P-FM14', '6 Sheet', 'static', 46, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(383, 2, 'G25-6SP-C-FM05', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(384, 2, 'G25-6SP-C-FM06', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(385, 2, 'G25-6SP-C-FM08', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(386, 2, 'G25-6SP-C-FM09', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(387, 2, 'G25-6SP-EG-FM01', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(388, 2, 'G25-6SP-EG-FM02', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(389, 2, 'G25-6SP-EG-FM03', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(390, 2, 'G25-6SP-P-FM10', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(391, 2, 'G25-6SP-P-FM11', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(392, 2, 'G25-6SP-P-FM12', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(393, 2, 'G25-6SP-P-FM13', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(394, 2, 'G25-6SP-P-FM14', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(395, 2, 'G25-6SP-P-FM15', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(396, 2, 'G25-6SP-P-FM16', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(397, 2, 'G25-6SP-P-FM17', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(398, 2, 'G25-6SP-P-FM18', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(399, 2, 'G25-6SP-P-FM19', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(400, 2, 'G25-6SP-P-FM20', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(401, 2, 'G25-6SP-P-FM21', '6 Sheet', 'static', 12, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(402, 2, 'G27-6SCR-EG-FM01', '6 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(403, 2, 'G27-6SP-EG-FM02', '6 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(404, 2, 'G27-6SP-P-FM05', '6 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(405, 2, 'G27-6SP-P-FM08', '6 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(406, 2, 'G27-6SP-P-FM09', '6 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(407, 2, 'G27-6SP-P-FM12', '6 Sheet', 'static', 13, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(408, 2, 'G28-6SP-EG-FM02', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(409, 2, 'G28-6SP-EG-FM03', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(410, 2, 'G28-6SP-EG-FM06', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(411, 2, 'G28-6SP-FB-FM04', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(412, 2, 'G28-6SP-FB-FM07', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(413, 2, 'G28-6SP-P-FM08', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(414, 2, 'G28-6SP-P-FM11', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(415, 2, 'G28-6SP-P-FM12', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(416, 2, 'G28-6SP-P-FM15', '6 Sheet', 'static', 14, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(417, 2, 'G29-6SP-P-FM06', '6 Sheet', 'static', 15, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(418, 2, 'G29-6SP-P-FM11', '6 Sheet', 'static', 15, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(419, 2, 'G30-6SP-P-FM06', '6 Sheet', 'static', 16, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(420, 2, 'G30-6SP-P-FM11', '6 Sheet', 'static', 16, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(421, 2, 'R11-6SP-C-FM06', '6 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(422, 2, 'R11-6SP-C-FM07', '6 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(423, 2, 'R11-6SP-C-FM08', '6 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(424, 2, 'R11-6SP-C-FM09', '6 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(425, 2, 'R11-6SP-EG-FM01', '6 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(426, 2, 'R11-6SP-EG-FM02', '6 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(427, 2, 'R11-6SP-EG-FM03', '6 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(428, 2, 'R11-6SP-FB-FM05', '6 Sheet', 'static', 17, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(429, 2, 'R12-6SP-C-FM09', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(430, 2, 'R12-6SP-C-FM10', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(431, 2, 'R12-6SP-EG-FM01', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(432, 2, 'R12-6SP-EG-FM02', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(433, 2, 'R12-6SP-EG-FM03', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(434, 2, 'R12-6SP-EG-FM06', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(435, 2, 'R12-6SP-EG-FM07', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(436, 2, 'R12-6SP-EG-FM08', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(437, 2, 'R12-6SP-FB-FM04', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(438, 2, 'R12-6SP-FB-FM05', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(439, 2, 'R12-6SP-P-FM12', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(440, 2, 'R12-6SP-P-FM13', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(441, 2, 'R12-6SP-P-FM14', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(442, 2, 'R12-6SP-P-FM15', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(443, 2, 'R12-6SP-P-FM16', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(444, 2, 'R12-6SP-P-FM17', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(445, 2, 'R12-6SP-P-FM18', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(446, 2, 'R12-6SP-P-FM19', '6 Sheet', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(447, 2, 'R13-6SCR-P-FM01', '6 Sheet', 'static', 19, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(448, 2, 'R14-6SP-C-FM02', '6 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(449, 2, 'R14-6SP-FB-FM01', '6 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(450, 2, 'R14-6SP-P-FM03', '6 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(451, 2, 'R14-6SP-P-FM04', '6 Sheet', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(452, 2, 'R15-6SCR-P-FM01', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(453, 2, 'R15-6SCR-P-FM02', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(454, 2, 'R15-6SCR-P-FM03', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(455, 2, 'R15-6SCR-P-FM04', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(456, 2, 'R15-6SP-EG-FM01', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(457, 2, 'R15-6SP-EG-FM02', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(458, 2, 'R15-6SP-EG-FM03', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(459, 2, 'R15-6SP-EG-FM04', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(460, 2, 'R15-6SP-EG-FM05', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(461, 2, 'R15-6SP-EG-FM06', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(462, 2, 'R15-6SP-EG-FM07', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(463, 2, 'R15-6SP-EG-FM08', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(464, 2, 'R15-6SP-P-FM09', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(465, 2, 'R15-6SP-P-FM10', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(466, 2, 'R15-6SP-P-FM11', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(467, 2, 'R15-6SP-P-FM12', '6 Sheet', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(468, 2, 'R16-6SCR-EG-FM01', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(469, 2, 'R16-6SCR-EG-FM02', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(470, 2, 'R16-6SP-C-FM06', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(471, 2, 'R16-6SP-C-FM07', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(472, 2, 'R16-6SP-C-FM08', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(473, 2, 'R16-6SP-EG-FM03', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(474, 2, 'R16-6SP-EG-FM05', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(475, 2, 'R16-6SP-P-FM10', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(476, 2, 'R16-6SP-P-FM11', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(477, 2, 'R16-6SP-P-FM12', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(478, 2, 'R16-6SP-P-FM13', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(479, 2, 'R16-6SP-P-FM17', '6 Sheet', 'static', 22, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(480, 2, 'R17-6SP-EG-FM01', '6 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(481, 2, 'R17-6SP-EG-FM02', '6 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(482, 2, 'R17-6SP-EG-FM03', '6 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(483, 2, 'R17-6SP-P-FM04', '6 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(484, 2, 'R17-6SP-P-FM05', '6 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(485, 2, 'R17-6SP-P-FM06', '6 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(486, 2, 'R17-6SP-P-FM07', '6 Sheet', 'static', 23, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(487, 2, 'R18-6SCR-C-FM01', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(488, 2, 'R18-6SCR-C-FM02', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(489, 2, 'R18-6SP-C-FM04', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(490, 2, 'R18-6SP-C-FM05', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(491, 2, 'R18-6SP-C-FM06', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(492, 2, 'R18-6SP-C-FM07', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(493, 2, 'R18-6SP-C-FM08', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(494, 2, 'R18-6SP-C-FM09', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(495, 2, 'R18-6SP-C-FM10', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(496, 2, 'R18-6SP-EG-FM01', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(497, 2, 'R18-6SP-EG-FM02', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(498, 2, 'R18-6SP-EG-FM03', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(499, 2, 'R18-6SP-P-FM11', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(500, 2, 'R18-6SP-P-FM12', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(501, 2, 'R18-6SP-P-FM13', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(502, 2, 'R18-6SP-P-FM14', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(503, 2, 'R18-6SP-P-FM15', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(504, 2, 'R18-6SP-P-FM16', '6 Sheet', 'static', 24, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(505, 2, 'R19-6SP-C-FM01', '6 Sheet', 'static', 47, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(506, 2, 'R19-6SP-P-FM05', '6 Sheet', 'static', 47, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(507, 2, 'R19-6SP-P-FM06', '6 Sheet', 'static', 47, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(508, 2, 'R19-6SP-P-FM07', '6 Sheet', 'static', 47, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(509, 2, 'R19-6SP-P-FM08', '6 Sheet', 'static', 47, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(510, 2, 'R20-6SP-C-FM10', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(511, 2, 'R20-6SP-C-FM11', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(512, 2, 'R20-6SP-EG-FM01', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(513, 2, 'R20-6SP-EG-FM02', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(514, 2, 'R20-6SP-EG-FM03', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(515, 2, 'R20-6SP-EG-FM04', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(516, 2, 'R20-6SP-EG-FM05', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(517, 2, 'R20-6SP-EG-FM06', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(518, 2, 'R20-6SP-EG-FM07', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(519, 2, 'R20-6SP-FB-FM08', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(520, 2, 'R20-6SP-FB-FM09', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(521, 2, 'R20-6SP-P-FM12', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(522, 2, 'R20-6SP-P-FM13', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(523, 2, 'R20-6SP-P-FM14', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(524, 2, 'R20-6SP-P-FM15', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(525, 2, 'R20-6SP-P-FM16', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(526, 2, 'R20-6SP-P-FM17', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(527, 2, 'R20-6SP-P-FM18', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(528, 2, 'R20-6SP-P-FM19', '6 Sheet', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(529, 2, 'R21-6SP-C-FM05', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(530, 2, 'R21-6SP-C-FM06', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(531, 2, 'R21-6SP-C-FM07', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(532, 2, 'R21-6SP-C-FM08', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(533, 2, 'R21-6SP-C-FM09', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(534, 2, 'R21-6SP-EG-FM01', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(535, 2, 'R21-6SP-EG-FM02', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(536, 2, 'R21-6SP-EG-FM03', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(537, 2, 'R21-6SP-EG-FM04', '6 Sheet', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(538, 2, 'R22-6SCR-EG-FM01', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(539, 2, 'R22-6SCR-EG-FM02', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(540, 2, 'R22-6SP-C-FM03', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(541, 2, 'R22-6SP-C-FM04', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(542, 2, 'R22-6SP-C-FM05', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(543, 2, 'R22-6SP-C-FM06', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(544, 2, 'R22-6SP-C-FM07', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(545, 2, 'R22-6SP-C-FM08', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(546, 2, 'R22-6SP-C-FM09', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(547, 2, 'R22-6SP-EG-FM01', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(548, 2, 'R22-6SP-EG-FM02', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(549, 2, 'R22-6SP-P-FM10', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(550, 2, 'R22-6SP-P-FM11', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(551, 2, 'R22-6SP-P-FM12', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(552, 2, 'R22-6SP-P-FM13', '6 Sheet', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(553, 2, 'R23-6SCR-P-FM01', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(554, 2, 'R23-6SCR-P-FM02', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(555, 2, 'R23-6SCR-P-FM03', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(556, 2, 'R23-6SCR-P-FM04', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(557, 2, 'R23-6SP-EG-FM01', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(558, 2, 'R23-6SP-EG-FM02', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(559, 2, 'R23-6SP-EG-FM03', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(560, 2, 'R23-6SP-EG-FM04', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(561, 2, 'R23-6SP-EG-FM05', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(562, 2, 'R23-6SP-EG-FM06', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(563, 2, 'R23-6SP-EG-FM07', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(564, 2, 'R23-6SP-EG-FM08', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(565, 2, 'R23-6SP-FB-FM09', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(566, 2, 'R23-6SP-FB-FM10', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(567, 2, 'R23-6SP-P-FM11', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(568, 2, 'R23-6SP-P-FM12', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(569, 2, 'R23-6SP-P-FM13', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(570, 2, 'R23-6SP-P-FM14', '6 Sheet', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(571, 2, 'R24-6SCR-EG-FM01', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(572, 2, 'R24-6SCR-EG-FM02', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(573, 2, 'R24-6SCR-EG-FM03', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(574, 2, 'R24-6SCR-EG-FM04', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(575, 2, 'R24-6SCR-P-FM05', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(576, 2, 'R24-6SCR-P-FM06', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(577, 2, 'R24-6SCR-P-FM07', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(578, 2, 'R24-6SCR-P-FM08', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(579, 2, 'R24-6SP-EG-FM01', '6 Sheet', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(580, 2, 'R25-6SCR-P-FM01', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(581, 2, 'R25-6SCR-P-FM02', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(582, 2, 'R25-6SCR-P-FM03', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(583, 2, 'R25-6SCR-P-FM04', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(584, 2, 'R25-6SP-EG-FM01', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(585, 2, 'R25-6SP-EG-FM02', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(586, 2, 'R25-6SP-EG-FM03', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(587, 2, 'R25-6SP-EG-FM04', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(588, 2, 'R25-6SP-EG-FM05', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(589, 2, 'R25-6SP-EG-FM06', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(590, 2, 'R25-6SP-EG-FM07', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(591, 2, 'R25-6SP-EG-FM08', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(592, 2, 'R25-6SP-P-FM09', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(593, 2, 'R25-6SP-P-FM10', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `assets` (`id`, `department_id`, `ref_no`, `name`, `type`, `location_id`, `owned_by`, `asset_photo`, `description`, `installation_time`, `package_type`, `no_of_assets`, `slots`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(594, 2, 'R25-6SP-P-FM11', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(595, 2, 'R25-6SP-P-FM12', '6 Sheet', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(596, 2, 'R26-6SCR-C-FM01', '6 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(597, 2, 'R26-6SP-C-FM10', '6 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(598, 2, 'R26-6SP-EG-FM01', '6 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(599, 2, 'R26-6SP-EG-FM03', '6 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(600, 2, 'R26-6SP-P-FM14', '6 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(601, 2, 'R26-6SP-P-FM15', '6 Sheet', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(602, 2, 'R29-6SP-C-FM05', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(603, 2, 'R29-6SP-C-FM06', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(604, 2, 'R29-6SP-C-FM07', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(605, 2, 'R29-6SP-C-FM08', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(606, 2, 'R29-6SP-C-FM09', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(607, 2, 'R29-6SP-C-FM10', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(608, 2, 'R29-6SP-C-FM11', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(609, 2, 'R29-6SP-C-FM12', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(610, 2, 'R29-6SP-EG-FM01', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(611, 2, 'R29-6SP-EG-FM02', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(612, 2, 'R29-6SP-EG-FM03', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(613, 2, 'R29-6SP-EG-FM04', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(614, 2, 'R29-6SP-P-FM13', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(615, 2, 'R29-6SP-P-FM14', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(616, 2, 'R29-6SP-P-FM15', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(617, 2, 'R29-6SP-P-FM16', '6 Sheet', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(618, 2, 'R31-6SP-C-FM07', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(619, 2, 'R31-6SP-C-FM09', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(620, 2, 'R31-6SP-C-FM10', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(621, 2, 'R31-6SP-EG-FM01', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(622, 2, 'R31-6SP-EG-FM03', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(623, 2, 'R31-6SP-P-FM12', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(624, 2, 'R31-6SP-P-FM13', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(625, 2, 'R31-6SP-P-FM14', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(626, 2, 'R31-6SP-P-FM15', '6 Sheet', 'static', 33, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(627, 2, 'R32-6SCR-EG-FM01', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(628, 2, 'R32-6SCR-EG-FM02', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(629, 2, 'R32-6SCR-P-FM03', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(630, 2, 'R32-6SCR-P-FM04', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(631, 2, 'R32-6SCR-P-FM05', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(632, 2, 'R32-6SCR-P-FM06', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(633, 2, 'R32-6SP-P-FM07', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(634, 2, 'R32-6SP-P-FM08', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(635, 2, 'R32-6SP-P-FM09', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(636, 2, 'R32-6SP-P-FM10', '6 Sheet', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(637, 2, 'R33-6SCR-C-FM01', '6 Sheet', 'static', 35, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(638, 2, 'R33-6SP-C-FM08', '6 Sheet', 'static', 35, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(639, 2, 'R33-6SP-C-FM09', '6 Sheet', 'static', 35, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(640, 2, 'R33-6SP-EG-FM03', '6 Sheet', 'static', 35, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(641, 2, 'R34-6SCR-P-FM02', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(642, 2, 'R34-6SCR-P-FM03', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(643, 2, 'R34-6SCR-P-FM04', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(644, 2, 'R34-6SP-EG-FM01', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(645, 2, 'R34-6SP-EG-FM02', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(646, 2, 'R34-6SP-EG-FM03', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(647, 2, 'R34-6SP-EG-FM04', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(648, 2, 'R34-6SP-EG-FM07', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(649, 2, 'R34-6SP-EG-FM08', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(650, 2, 'R34-6SP-EG-FM09', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(651, 2, 'R34-6SP-EG-FM10', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(652, 2, 'R34-6SP-FB-FM05', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(653, 2, 'R34-6SP-FB-FM06', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(654, 2, 'R34-6SP-P-FM11', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(655, 2, 'R34-6SP-P-FM12', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(656, 2, 'R34-6SP-P-FM13', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(657, 2, 'R34-6SP-P-FM14', '6 Sheet', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(658, 2, 'R35-6SP-C-FM09', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(659, 2, 'R35-6SP-C-FM11', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(660, 2, 'R35-6SP-EG-FM01', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(661, 2, 'R35-6SP-EG-FM02', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(662, 2, 'R35-6SP-EG-FM04', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(663, 2, 'R35-6SP-EG-FM06', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(664, 2, 'R35-6SP-P-FM13', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(665, 2, 'R35-6SP-P-FM14', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(666, 2, 'R35-6SP-P-FM15', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(667, 2, 'R35-6SP-P-FM16', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(668, 2, 'R35-6SP-P-FM17', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(669, 2, 'R35-6SP-P-FM18', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(670, 2, 'R35-6SP-P-FM19', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(671, 2, 'R35-6SP-P-FM20', '6 Sheet', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(672, 2, 'R36-6SCR-P-FM01', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(673, 2, 'R36-6SCR-P-FM02', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(674, 2, 'R36-6SCR-P-FM03', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(675, 2, 'R36-6SCR-P-FM04', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(676, 2, 'R36-6SP-EG-FM01', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(677, 2, 'R36-6SP-EG-FM02', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(678, 2, 'R36-6SP-EG-FM03', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(679, 2, 'R36-6SP-EG-FM04', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(680, 2, 'R36-6SP-EG-FM07', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(681, 2, 'R36-6SP-EG-FM08', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(682, 2, 'R36-6SP-EG-FM09', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(683, 2, 'R36-6SP-EG-FM10', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(684, 2, 'R36-6SP-FB-FM05', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(685, 2, 'R36-6SP-FB-FM06', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(686, 2, 'R36-6SP-P-FM11', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(687, 2, 'R36-6SP-P-FM12', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(688, 2, 'R36-6SP-P-FM13', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(689, 2, 'R36-6SP-P-FM14', '6 Sheet', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(690, 2, 'R37-6SCR-P-FM01', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(691, 2, 'R37-6SCR-P-FM02', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(692, 2, 'R37-6SCR-P-FM03', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(693, 2, 'R37-6SCR-P-FM04', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(694, 2, 'R37-6SP-EG-FM01', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(695, 2, 'R37-6SP-EG-FM03', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(696, 2, 'R37-6SP-EG-FM07', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(697, 2, 'R37-6SP-EG-FM09', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(698, 2, 'R37-6SP-EG-FM13', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(699, 2, 'R37-6SP-EG-FM14', '6 Sheet', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(700, 2, 'R39-6SCR-C-FM01', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(701, 2, 'R39-6SP-C-FM07', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(702, 2, 'R39-6SP-C-FM08', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(703, 2, 'R39-6SP-C-FM09', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(704, 2, 'R39-6SP-EG-FM01', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(705, 2, 'R39-6SP-EG-FM02', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(706, 2, 'R39-6SP-EG-FM03', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(707, 2, 'R39-6SP-EG-FM04', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(708, 2, 'R39-6SP-P-FM10', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(709, 2, 'R39-6SP-P-FM11', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(710, 2, 'R39-6SP-P-FM12', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(711, 2, 'R39-6SP-P-FM13', '6 Sheet', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(712, 2, 'R40-6SP-C-FM013', '6 Sheet', 'static', 42, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(713, 2, 'R40-6SP-C-FM014', '6 Sheet', 'static', 42, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(714, 2, 'R40-6SP-FB-FM05', '6 Sheet', 'static', 42, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(715, 2, 'R40-6SP-P-FM016', '6 Sheet', 'static', 42, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(716, 2, 'R40-6SP-P-FM017', '6 Sheet', 'static', 42, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(717, 2, 'R41-6SP-C-FM09', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(718, 2, 'R41-6SP-C-FM10', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(719, 2, 'R41-6SP-C-FM12', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(720, 2, 'R41-6SP-EG-FM02', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(721, 2, 'R41-6SP-EG-FM04', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(722, 2, 'R41-6SP-P-FM20', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(723, 2, 'R41-6SP-P-FM21', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(724, 2, 'R41-6SP-P-FM22', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(725, 2, 'R41-6SP-P-FM23', '6 Sheet', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(726, 2, 'R42-6SP-EG-FM01', '6 Sheet', 'static', 44, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(727, 2, 'R42-6SP-EG-FM03', '6 Sheet', 'static', 44, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(728, 2, 'R42-6SP-P-FM06', '6 Sheet', 'static', 44, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(729, 2, 'R42-6SP-P-FM09', '6 Sheet', 'static', 44, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(730, 2, 'DIP-EEP-01A', 'EEP', 'static', 48, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(731, 2, 'DIP-EEP-02A', 'EEP', 'static', 48, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(732, 2, 'DIP-EEP-03A', 'EEP', 'static', 48, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(733, 2, 'DIP-EEP-04A', 'EEP', 'static', 48, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(734, 2, 'S14-EEP-02A', 'EEP', 'static', 49, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(735, 2, 'S15-EEP-05A', 'EEP', 'static', 50, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(736, 2, 'S15-EEP-06A', 'EEP', 'static', 51, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(737, 2, 'S18-EEP-8A', 'EEP', 'static', 52, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(738, 2, 'S22-EEP-10A', 'EEP', 'static', 53, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(739, 2, 'S24-EEP-11A', 'EEP', 'static', 54, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(740, 2, 'S25-EEP-12A', 'EEP', 'static', 55, 'Metro Owned', '', '', '864000', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(741, 2, 'G11-ES-01', 'Elevator Shaft', 'static', 2, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(742, 2, 'G12-ES-01', 'Elevator Shaft', 'static', 3, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(743, 2, 'G13-ES-01', 'Elevator Shaft', 'static', 4, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(744, 2, 'G14-ES-01', 'Elevator Shaft', 'static', 5, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(745, 2, 'G15-ES-01', 'Elevator Shaft', 'static', 6, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(746, 2, 'G16-ES-01', 'Elevator Shaft', 'static', 7, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(747, 2, 'G17-ES-01', 'Elevator Shaft', 'static', 8, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(748, 2, 'G18-ES-01', 'Elevator Shaft', 'static', 9, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(749, 2, 'G19-ES-01', 'Elevator Shaft', 'static', 57, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(750, 2, 'G21-ES-01', 'Elevator Shaft', 'static', 10, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(751, 2, 'G22-ES-01', 'Elevator Shaft', 'static', 11, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(752, 2, 'G23-ES-01', 'Elevator Shaft', 'static', 45, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(753, 2, 'G24-ES-01', 'Elevator Shaft', 'static', 46, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(754, 2, 'G25-ES-01', 'Elevator Shaft', 'static', 12, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(755, 2, 'G27-ES-01', 'Elevator Shaft', 'static', 13, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(756, 2, 'G28-ES-01', 'Elevator Shaft', 'static', 14, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(757, 2, 'G29-ES-01', 'Elevator Shaft', 'static', 15, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(758, 2, 'G30-ES-01', 'Elevator Shaft', 'static', 16, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(759, 2, 'R11-ES-01', 'Elevator Shaft', 'static', 17, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(760, 2, 'R12-ES-01', 'Elevator Shaft', 'static', 18, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(761, 2, 'R13-ES-01', 'Elevator Shaft', 'static', 19, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(762, 2, 'R14-ES-01', 'Elevator Shaft', 'static', 20, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(763, 2, 'R15-ES-01', 'Elevator Shaft', 'static', 21, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(764, 2, 'R16-ES-01', 'Elevator Shaft', 'static', 22, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(765, 2, 'R17-ES-01', 'Elevator Shaft', 'static', 23, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(766, 2, 'R18-ES-01', 'Elevator Shaft', 'static', 24, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(767, 2, 'R19-ES-01', 'Elevator Shaft', 'static', 47, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(768, 2, 'R20-ES-01', 'Elevator Shaft', 'static', 25, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(769, 2, 'R21-ES-01', 'Elevator Shaft', 'static', 26, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(770, 2, 'R22-ES-01', 'Elevator Shaft', 'static', 27, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(771, 2, 'R23-ES-01', 'Elevator Shaft', 'static', 28, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(772, 2, 'R24-ES-01', 'Elevator Shaft', 'static', 29, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(773, 2, 'R25-ES-01', 'Elevator Shaft', 'static', 30, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(774, 2, 'R26-ES-01', 'Elevator Shaft', 'static', 31, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(775, 2, 'R29-ES-01', 'Elevator Shaft', 'static', 32, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(776, 2, 'R31-ES-01', 'Elevator Shaft', 'static', 33, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(777, 2, 'R32-ES-01', 'Elevator Shaft', 'static', 34, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(778, 2, 'R33-ES-01', 'Elevator Shaft', 'static', 35, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(779, 2, 'R34-ES-01', 'Elevator Shaft', 'static', 36, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(780, 2, 'R35-ES-01', 'Elevator Shaft', 'static', 37, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(781, 2, 'R36-ES-01', 'Elevator Shaft', 'static', 38, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(782, 2, 'R37-ES-01', 'Elevator Shaft', 'static', 39, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(783, 2, 'R38-ES-01', 'Elevator Shaft', 'static', 40, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(784, 2, 'R39-ES-01', 'Elevator Shaft', 'static', 41, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(785, 2, 'R40-ES-01', 'Elevator Shaft', 'static', 42, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(786, 2, 'R41-ES-01', 'Elevator Shaft', 'static', 43, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(787, 2, 'R42-ES-01', 'Elevator Shaft', 'static', 44, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(788, 2, 'G11-ED-01', 'Entrance Door', 'static', 2, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(789, 2, 'G12-ED-01', 'Entrance Door', 'static', 3, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(790, 2, 'G13-ED-01', 'Entrance Door', 'static', 4, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(791, 2, 'G14-ED-01', 'Entrance Door', 'static', 5, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(792, 2, 'G15-ED-01', 'Entrance Door', 'static', 6, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(793, 2, 'G16-ED-01', 'Entrance Door', 'static', 7, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(794, 2, 'G17-ED-01', 'Entrance Door', 'static', 8, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(795, 2, 'G18-ED-01', 'Entrance Door', 'static', 9, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(796, 2, 'G19-ED-01', 'Entrance Door', 'static', 57, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(797, 2, 'G21-ED-01', 'Entrance Door', 'static', 10, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(798, 2, 'G22-ED-01', 'Entrance Door', 'static', 11, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(799, 2, 'G23-ED-01', 'Entrance Door', 'static', 45, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(800, 2, 'G24-ED-01', 'Entrance Door', 'static', 46, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(801, 2, 'G25-ED-01', 'Entrance Door', 'static', 12, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(802, 2, 'G27-ED-01', 'Entrance Door', 'static', 13, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(803, 2, 'G28-ED-01', 'Entrance Door', 'static', 14, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(804, 2, 'G29-ED-01', 'Entrance Door', 'static', 15, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(805, 2, 'G30-ED-01', 'Entrance Door', 'static', 16, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(806, 2, 'R11-ED-01', 'Entrance Door', 'static', 17, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(807, 2, 'R12-ED-01', 'Entrance Door', 'static', 18, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(808, 2, 'R15-ED-01', 'Entrance Door', 'static', 21, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(809, 2, 'R16-ED-01', 'Entrance Door', 'static', 22, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(810, 2, 'R17-ED-01', 'Entrance Door', 'static', 23, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(811, 2, 'R18-ED-01', 'Entrance Door', 'static', 24, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(812, 2, 'R19-ED-01', 'Entrance Door', 'static', 47, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(813, 2, 'R20-ED-01', 'Entrance Door', 'static', 25, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(814, 2, 'R21-ED-01', 'Entrance Door', 'static', 26, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(815, 2, 'R22-ED-01', 'Entrance Door', 'static', 27, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(816, 2, 'R23-ED-01', 'Entrance Door', 'static', 28, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(817, 2, 'R24-ED-01', 'Entrance Door', 'static', 29, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(818, 2, 'R25-ED-01', 'Entrance Door', 'static', 30, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(819, 2, 'R26-ED-01', 'Entrance Door', 'static', 31, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(820, 2, 'R29-ED-01', 'Entrance Door', 'static', 32, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(821, 2, 'R31-ED-01', 'Entrance Door', 'static', 33, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(822, 2, 'R32-ED-01', 'Entrance Door', 'static', 34, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(823, 2, 'R33-ED-01', 'Entrance Door', 'static', 35, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(824, 2, 'R34-ED-01', 'Entrance Door', 'static', 36, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(825, 2, 'R35-ED-01', 'Entrance Door', 'static', 37, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(826, 2, 'R36-ED-01', 'Entrance Door', 'static', 38, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(827, 2, 'R37-ED-01', 'Entrance Door', 'static', 39, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(828, 2, 'R38-ED-01', 'Entrance Door', 'static', 40, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(829, 2, 'R39-ED-01', 'Entrance Door', 'static', 41, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(830, 2, 'R40-ED-01', 'Entrance Door', 'static', 42, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(831, 2, 'R41-ED-01', 'Entrance Door', 'static', 43, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(832, 2, 'R42-ED-01', 'Entrance Door', 'static', 44, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(833, 2, 'G11-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 2, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(834, 2, 'G12-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 3, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(835, 2, 'G13-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 4, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(836, 2, 'G14-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 5, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(837, 2, 'G15-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 6, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(838, 2, 'G16-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 7, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(839, 2, 'G17-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 8, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(840, 2, 'G18-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 9, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(841, 2, 'G19-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 57, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(842, 2, 'G21-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 10, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(843, 2, 'G22-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 11, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(844, 2, 'G23-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 45, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(845, 2, 'G24-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 46, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(846, 2, 'G25-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 12, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(847, 2, 'G27-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 13, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(848, 2, 'G28-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 14, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(849, 2, 'G29-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 15, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(850, 2, 'G30-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 16, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(851, 2, 'R11-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 17, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(852, 2, 'R12-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 18, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(853, 2, 'R13-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 19, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(854, 2, 'R14-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 20, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(855, 2, 'R15-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 21, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(856, 2, 'R16-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 22, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(857, 2, 'R17-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 23, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(858, 2, 'R18-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 24, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(859, 2, 'R19-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 47, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(860, 2, 'R20-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 25, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(861, 2, 'R21-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 26, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(862, 2, 'R22-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 27, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(863, 2, 'R23-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 28, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(864, 2, 'R24-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 29, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(865, 2, 'R25-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 30, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(866, 2, 'R26-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 31, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(867, 2, 'R29-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 32, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(868, 2, 'R31-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 33, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(869, 2, 'R32-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 34, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(870, 2, 'R33-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 35, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(871, 2, 'R34-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 36, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(872, 2, 'R35-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 37, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(873, 2, 'R36-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 38, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(874, 2, 'R37-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 39, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(875, 2, 'R38-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 40, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(876, 2, 'R39-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 41, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(877, 2, 'R40-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 42, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(878, 2, 'R41-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 43, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(879, 2, 'R42-ESTB-01', 'Escalator Stairs Travelator Balustrade', 'static', 44, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(880, 2, 'EX-DIP-XSB-01', 'Extra Large Banner', 'static', 64, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(881, 2, 'EX-JG-XSB-01', 'Extra Large Banner', 'static', 65, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(882, 2, 'EX-JG-XSB-02', 'Extra Large Banner', 'static', 65, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `assets` (`id`, `department_id`, `ref_no`, `name`, `type`, `location_id`, `owned_by`, `asset_photo`, `description`, `installation_time`, `package_type`, `no_of_assets`, `slots`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(883, 2, 'EX-JG-XSB-03', 'Extra Large Banner', 'static', 65, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(884, 2, 'EX-JG-XSB-04', 'Extra Large Banner', 'static', 65, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(885, 2, 'EX-DG-LSB-01', 'Large Banner', 'static', 66, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(886, 2, 'EX-DG-LSB-02', 'Large Banner', 'static', 66, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(887, 2, 'EX-DG-LSB-03', 'Large Banner', 'static', 66, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(888, 2, 'EX-DG-LSB-04', 'Large Banner', 'static', 66, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(889, 2, 'EX-FUR-LSB-01', 'Large Banner', 'static', 67, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(890, 2, 'EX-FUR-LSB-02', 'Large Banner', 'static', 67, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(891, 2, 'EX-FUR-LSB-03', 'Large Banner', 'static', 67, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(892, 2, 'EX-FUR-LSB-04', 'Large Banner', 'static', 67, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(893, 2, 'EX-GAR-LSB-01', 'Large Banner', 'static', 68, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(894, 2, 'EX-GAR-LSB-02', 'Large Banner', 'static', 68, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(895, 2, 'EX-GAR-LSB-03', 'Large Banner', 'static', 68, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(896, 2, 'EX-GAR-LSB-04', 'Large Banner', 'static', 68, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(897, 2, 'G12-LF-FB-FM01', 'Large Format', 'static', 3, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(898, 2, 'G13-LF-FB-FM01', 'Large Format', 'static', 4, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(899, 2, 'G14-LF-FB-FM01', 'Large Format', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(900, 2, 'G14-LF-FB-FM02', 'Large Format', 'static', 5, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(901, 2, 'R12-LF-FB-FM01', 'Large Format', 'static', 18, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(902, 2, 'R14-LF-C-FM02', 'Large Format', 'static', 20, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(903, 2, 'R15-LF-FB-FM01', 'Large Format', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(904, 2, 'R15-LF-FB-FM02', 'Large Format', 'static', 21, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(905, 2, 'R20-LF-FB-FM01', 'Large Format', 'static', 25, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(906, 2, 'R21-LF-FB-FM01', 'Large Format', 'static', 26, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(907, 2, 'R22-LF-C-FM02', 'Large Format', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(908, 2, 'R22-LF-FB-FM01', 'Large Format', 'static', 27, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(909, 2, 'R23-LF-FB-FM01', 'Large Format', 'static', 28, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(910, 2, 'R24-LF-FB-FM01', 'Large Format', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(911, 2, 'R24-LF-FB-FM02', 'Large Format', 'static', 29, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(912, 2, 'R25-LF-FB-FM01', 'Large Format', 'static', 30, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(913, 2, 'R26-LF-FB-FM01', 'Large Format', 'static', 31, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(914, 2, 'R29-LF-FB-FM01', 'Large Format', 'static', 32, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(915, 2, 'R32-LF-FB-FM03', 'Large Format', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(916, 2, 'R32-LF-FB-FM04', 'Large Format', 'static', 34, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(917, 2, 'R34-LF-FB-FM01', 'Large Format', 'static', 36, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(918, 2, 'R35-LF-FB-FM01', 'Large Format', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(919, 2, 'R35-LF-FB-FM02', 'Large Format', 'static', 37, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(920, 2, 'R36-LF-FB-FM01', 'Large Format', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(921, 2, 'R36-LF-FB-FM02', 'Large Format', 'static', 38, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(922, 2, 'R37-LF-FB-FM01', 'Large Format', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(923, 2, 'R37-LF-FB-FM02', 'Large Format', 'static', 39, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(924, 2, 'R39-LF-FB-FM01', 'Large Format', 'static', 41, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(925, 2, 'R41-LF-FB-FM01', 'Large Format', 'static', 43, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(926, 2, 'G16-FBP-DXB-01', 'Metro Bridges', 'static', 7, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(927, 2, 'R21-FBP-AUH-01', 'Metro Bridges', 'static', 26, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(928, 2, 'R21-FBP-DXB-01', 'Metro Bridges', 'static', 26, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(929, 2, 'R22-FBP-AUH-01', 'Metro Bridges', 'static', 27, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(930, 2, 'R22-FBP-DXB-01', 'Metro Bridges', 'static', 27, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(931, 2, 'R23-FBP-AUH-01', 'Metro Bridges', 'static', 28, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(932, 2, 'R24-FBP-AUH-01', 'Metro Bridges', 'static', 29, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(933, 2, 'R24-FBP-DXB-01', 'Metro Bridges', 'static', 29, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(934, 2, 'R25-FBP-AUH-01', 'Metro Bridges', 'static', 30, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(935, 2, 'R25-FBP-DXB-01', 'Metro Bridges', 'static', 30, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(936, 2, 'R29-FBP-AUH-01', 'Metro Bridges', 'static', 32, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(937, 2, 'R29-FBP-DXB-01', 'Metro Bridges', 'static', 32, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(938, 2, 'R31-FBP-DXB-01', 'Metro Bridges', 'static', 33, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(939, 2, 'R33-FBP-AUH-01', 'Metro Bridges', 'static', 35, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(940, 2, 'R35-FBP-DXB-01', 'Metro Bridges', 'static', 37, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(941, 2, 'R36-FBP-AUH-01', 'Metro Bridges', 'static', 38, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(942, 2, 'R36-FBP-DXB-01', 'Metro Bridges', 'static', 38, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(943, 2, 'R37-FBP-AUH-01', 'Metro Bridges', 'static', 39, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(944, 2, 'R37-FBP-DXB-01', 'Metro Bridges', 'static', 39, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(945, 2, 'R39-FBP-AUH-01', 'Metro Bridges', 'static', 41, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(946, 2, 'R39-FBP-DXB-01', 'Metro Bridges', 'static', 41, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(947, 2, 'R42-FBP-DXB-01', 'Metro Bridges', 'static', 44, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(948, 2, 'Strech 1', 'Pier Light box', 'static', 64, 'Metro Owned', '', '', '5', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(949, 2, 'Strech 2', 'Pier Light box', 'static', 64, 'Metro Owned', '', '', '5', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(950, 2, 'Strech 3', 'Pier Light box', 'static', 67, 'Metro Owned', '', '', '5', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(951, 2, 'Strech 4', 'Pier Light box', 'static', 67, 'Metro Owned', '', '', '5', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(952, 2, 'Strech 5', 'Pier Light box', 'static', 69, 'Metro Owned', '', '', '5', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(953, 2, 'Strech 6', 'Pier Light box', 'static', 68, 'Metro Owned', '', '', '5', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(954, 2, 'Stretch 1', 'Pillar', 'static', 70, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(955, 2, 'Stretch 10', 'Pillar', 'static', 71, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(956, 2, 'Stretch 11', 'Pillar', 'static', 72, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(957, 2, 'Stretch 12', 'Pillar', 'static', 73, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(958, 2, 'Stretch 13', 'Pillar', 'static', 74, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(959, 2, 'Stretch 14', 'Pillar', 'static', 74, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(960, 2, 'Stretch 15', 'Pillar', 'static', 75, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(961, 2, 'Stretch 16', 'Pillar', 'static', 76, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(962, 2, 'Stretch 17', 'Pillar', 'static', 76, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(963, 2, 'Stretch 18', 'Pillar', 'static', 76, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(964, 2, 'Stretch 19', 'Pillar', 'static', 77, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(965, 2, 'Stretch 2', 'Pillar', 'static', 70, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(966, 2, 'Stretch 20', 'Pillar', 'static', 78, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(967, 2, 'Stretch 21', 'Pillar', 'static', 79, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(968, 2, 'Stretch 22', 'Pillar', 'static', 80, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(969, 2, 'Stretch 23', 'Pillar', 'static', 81, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(970, 2, 'Stretch 24', 'Pillar', 'static', 82, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(971, 2, 'Stretch 25', 'Pillar', 'static', 83, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(972, 2, 'Stretch 26', 'Pillar', 'static', 84, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(973, 2, 'Stretch 27', 'Pillar', 'static', 85, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(974, 2, 'Stretch 28', 'Pillar', 'static', 86, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(975, 2, 'Stretch 29', 'Pillar', 'static', 87, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(976, 2, 'Stretch 3', 'Pillar', 'static', 88, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(977, 2, 'Stretch 30', 'Pillar', 'static', 89, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(978, 2, 'Stretch 31', 'Pillar', 'static', 89, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(979, 2, 'Stretch 32', 'Pillar', 'static', 90, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(980, 2, 'Stretch 4', 'Pillar', 'static', 91, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(981, 2, 'Stretch 5', 'Pillar', 'static', 92, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(982, 2, 'Stretch 6', 'Pillar', 'static', 93, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(983, 2, 'Stretch 7', 'Pillar', 'static', 94, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(984, 2, 'Stretch 8', 'Pillar', 'static', 95, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(985, 2, 'Stretch 9', 'Pillar', 'static', 96, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(986, 2, 'G11-SW-01', 'Screen Wall', 'static', 2, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(987, 2, 'G12-SW-01', 'Screen Wall', 'static', 3, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(988, 2, 'G13-SW-01', 'Screen Wall', 'static', 4, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(989, 2, 'G14-SW-01', 'Screen Wall', 'static', 5, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(990, 2, 'G15-SW-01', 'Screen Wall', 'static', 6, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(991, 2, 'G16-SW-01', 'Screen Wall', 'static', 7, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(992, 2, 'G17-SW-01', 'Screen Wall', 'static', 8, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(993, 2, 'G18-SW-01', 'Screen Wall', 'static', 9, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(994, 2, 'G19-SW-01', 'Screen Wall', 'static', 57, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(995, 2, 'G20-SW-01', 'Screen Wall', 'static', 97, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(996, 2, 'G21-SW-01', 'Screen Wall', 'static', 10, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(997, 2, 'G22-SW-01', 'Screen Wall', 'static', 11, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(998, 2, 'G23-SW-01', 'Screen Wall', 'static', 45, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(999, 2, 'G24-SW-01', 'Screen Wall', 'static', 46, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1000, 2, 'G25-SW-01', 'Screen Wall', 'static', 12, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1001, 2, 'G27-SW-01', 'Screen Wall', 'static', 13, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1002, 2, 'G28-SW-01', 'Screen Wall', 'static', 14, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1003, 2, 'G29-SW-01', 'Screen Wall', 'static', 15, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1004, 2, 'G30-SW-01', 'Screen Wall', 'static', 16, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1005, 2, 'R11-SW-01', 'Screen Wall', 'static', 17, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1006, 2, 'R12-SW-01', 'Screen Wall', 'static', 18, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1007, 2, 'R13-SW-01', 'Screen Wall', 'static', 19, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1008, 2, 'R14-SW-01', 'Screen Wall', 'static', 20, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1009, 2, 'R15-SW-01', 'Screen Wall', 'static', 21, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1010, 2, 'R16-SW-01', 'Screen Wall', 'static', 22, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1011, 2, 'R17-SW-01', 'Screen Wall', 'static', 23, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1012, 2, 'R18-SW-01', 'Screen Wall', 'static', 24, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1013, 2, 'R19-SW-01', 'Screen Wall', 'static', 47, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1014, 2, 'R19-SW-02', 'Screen Wall', 'static', 47, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1015, 2, 'R20-SW-01', 'Screen Wall', 'static', 25, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1016, 2, 'R21-SW-01', 'Screen Wall', 'static', 26, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1017, 2, 'R22-SW-01', 'Screen Wall', 'static', 27, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1018, 2, 'R23-SW-01', 'Screen Wall', 'static', 28, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1019, 2, 'R24-SW-01', 'Screen Wall', 'static', 29, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1020, 2, 'R25-SW-01', 'Screen Wall', 'static', 30, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1021, 2, 'R26-SW-01', 'Screen Wall', 'static', 31, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1022, 2, 'R29-SW-01', 'Screen Wall', 'static', 32, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1023, 2, 'R31-SW-01', 'Screen Wall', 'static', 33, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1024, 2, 'R32-SW-01', 'Screen Wall', 'static', 34, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1025, 2, 'R33-SW-01', 'Screen Wall', 'static', 35, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1026, 2, 'R34-SW-01', 'Screen Wall', 'static', 36, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1027, 2, 'R35-SW-01', 'Screen Wall', 'static', 37, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1028, 2, 'R36-SW-01', 'Screen Wall', 'static', 38, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1029, 2, 'R37-SW-01', 'Screen Wall', 'static', 39, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1030, 2, 'R38-SW-01', 'Screen Wall', 'static', 40, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1031, 2, 'R39-SW-01', 'Screen Wall', 'static', 41, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1032, 2, 'R40-SW-01', 'Screen Wall', 'static', 42, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1033, 2, 'R41-SW-01', 'Screen Wall', 'static', 43, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1034, 2, 'R42-SW-01', 'Screen Wall', 'static', 44, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1035, 2, 'EX-DG-SS-01', 'Scroller', 'static', 69, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1036, 2, 'EX-DG-SS-02', 'Scroller', 'static', 69, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1037, 2, 'EX-DG-SS-03', 'Scroller', 'static', 69, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1038, 2, 'EX-DG-SS-04', 'Scroller', 'static', 69, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1039, 2, 'EX-DIP-SS-01', 'Scroller', 'static', 64, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1040, 2, 'EX-DIP-SS-02', 'Scroller', 'static', 64, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1041, 2, 'EX-DIP-SS-03', 'Scroller', 'static', 64, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1042, 2, 'EX-DIP-SS-04', 'Scroller', 'static', 64, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1043, 2, 'EX-FUR-SS-01', 'Scroller', 'static', 67, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1044, 2, 'EX-FUR-SS-02', 'Scroller', 'static', 67, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1045, 2, 'EX-FUR-SS-03', 'Scroller', 'static', 67, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1046, 2, 'EX-FUR-SS-04', 'Scroller', 'static', 67, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1047, 2, 'EX-GAR-SS-01', 'Scroller', 'static', 68, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1048, 2, 'EX-GAR-SS-02', 'Scroller', 'static', 68, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1049, 2, 'EX-GAR-SS-03', 'Scroller', 'static', 68, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1050, 2, 'EX-GAR-SS-04', 'Scroller', 'static', 68, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1051, 2, 'EX-JG-SS-01', 'Scroller', 'static', 65, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1052, 2, 'EX-JG-SS-02', 'Scroller', 'static', 65, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1053, 2, 'EX-JG-SS-03', 'Scroller', 'static', 65, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1054, 2, 'EX-JG-SS-04', 'Scroller', 'static', 65, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1055, 2, 'EX-JG-SS-05', 'Scroller', 'static', 65, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1056, 2, 'EX-JG-SS-06', 'Scroller', 'static', 65, 'Metro Owned', '', '', '86400', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1057, 2, 'EX-DG-SSB-01', 'Small Banner', 'static', 69, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1058, 2, 'EX-DG-SSB-02', 'Small Banner', 'static', 69, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1059, 2, 'EX-DG-SSB-03', 'Small Banner', 'static', 69, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1060, 2, 'EX-DG-SSB-04', 'Small Banner', 'static', 69, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1061, 2, 'EX-FUR-SSB-01', 'Small Banner', 'static', 67, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1062, 2, 'EX-FUR-SSB-02', 'Small Banner', 'static', 67, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1063, 2, 'EX-FUR-SSB-03', 'Small Banner', 'static', 67, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1064, 2, 'EX-FUR-SSB-04', 'Small Banner', 'static', 67, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1065, 2, 'EX-GAR-SSB-01', 'Small Banner', 'static', 68, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1066, 2, 'EX-GAR-SSB-02', 'Small Banner', 'static', 68, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1067, 2, 'EX-GAR-SSB-03', 'Small Banner', 'static', 68, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1068, 2, 'EX-GAR-SSB-04', 'Small Banner', 'static', 68, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1069, 2, 'G15-SVW-02', 'Station Wrap', 'static', 6, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1070, 2, 'G16-SVW-02', 'Station Wrap', 'static', 7, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1071, 2, 'R11-SVW-02', 'Station Wrap', 'static', 17, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1072, 2, 'R16-SVW-02', 'Station Wrap', 'static', 22, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1073, 2, 'R19-SVW-02', 'Station Wrap', 'static', 47, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1074, 2, 'R21-SVW-02', 'Station Wrap', 'static', 26, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1075, 2, 'R22-SVW-02', 'Station Wrap', 'static', 27, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1076, 2, 'R23-SVW-02', 'Station Wrap', 'static', 28, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1077, 2, 'R24-SVW-02', 'Station Wrap', 'static', 29, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1078, 2, 'R25-SVW-02', 'Station Wrap', 'static', 30, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1079, 2, 'R26-SVW-02', 'Station Wrap', 'static', 31, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1080, 2, 'R29-SVW-02', 'Station Wrap', 'static', 32, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1081, 2, 'R31-SVW-02', 'Station Wrap', 'static', 100, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1082, 2, 'R32-SVW-02', 'Station Wrap', 'static', 34, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1083, 2, 'R33-SVW-02', 'Station Wrap', 'static', 35, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1084, 2, 'R34-SVW-02', 'Station Wrap', 'static', 36, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1085, 2, 'R37-SVW-02', 'Station Wrap', 'static', 39, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1086, 2, 'R38-SVW-02', 'Station Wrap', 'static', 40, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1087, 2, 'R39-SVW-02', 'Station Wrap', 'static', 41, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1088, 2, 'R40-SVW-02', 'Station Wrap', 'static', 42, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1089, 2, 'R42-SVW-02', 'Station Wrap', 'static', 44, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1090, 2, 'R73-SVW-02', 'Station Wrap', 'static', 65, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1091, 2, 'R74-SVW-02', 'Station Wrap', 'static', 64, 'Metro Owned', '', '', '2073600', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1092, 2, 'G11-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 2, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1093, 2, 'G12-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 3, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1094, 2, 'G13-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 4, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1095, 2, 'G14-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 5, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1096, 2, 'G15-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 6, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1097, 2, 'G16-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 7, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1098, 2, 'G17-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 8, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1099, 2, 'G18-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 9, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1100, 2, 'G19-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 57, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1101, 2, 'G21-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 10, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1102, 2, 'G22-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 11, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1103, 2, 'G23-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 45, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1104, 2, 'G24-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 46, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1105, 2, 'G25-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 12, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1106, 2, 'G27-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 13, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1107, 2, 'G28-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 14, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1108, 2, 'G29-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 15, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1109, 2, 'G30-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 16, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1110, 2, 'R11-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 17, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1111, 2, 'R12-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 18, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1112, 2, 'R13-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 19, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1113, 2, 'R14-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 20, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1114, 2, 'R15-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 21, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1115, 2, 'R16-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 22, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1116, 2, 'R17-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 23, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1117, 2, 'R18-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 24, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1118, 2, 'R19-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 47, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1119, 2, 'R20-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 25, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1120, 2, 'R21-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 26, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1121, 2, 'R22-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 27, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1122, 2, 'R23-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 28, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1123, 2, 'R24-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 29, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1124, 2, 'R25-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 30, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1125, 2, 'R26-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 31, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1126, 2, 'R29-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 32, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1127, 2, 'R31-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 33, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1128, 2, 'R32-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 34, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1129, 2, 'R33-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 35, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1130, 2, 'R34-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 36, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1131, 2, 'R35-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 37, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1132, 2, 'R36-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 38, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1133, 2, 'R37-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 39, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1134, 2, 'R38-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 40, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1135, 2, 'R39-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 41, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1136, 2, 'R40-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 42, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1137, 2, 'R41-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 43, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1138, 2, 'R42-TGFG-01', 'Ticket Gate Floor Graphics', 'static', 44, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1139, 2, 'S14-TPS20A', 'TPS', 'static', 101, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1140, 2, 'S15-TPS22A', 'TPS', 'static', 102, 'Metro Owned', '', '', '1036800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1141, 2, 'R32-WU-01', 'Wall Unit', 'static', 34, 'Metro Owned', '', '', '604800', 'individual', 0, 1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1143, 2, 'G11 - Etisalat', '12-Sheet LED', 'digital', 2, 'Metro Owned', '', '', '86400', 'package', 1, 3, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1144, 2, 'G12 - Al Qusais', '12-Sheet LED', 'digital', 3, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1145, 2, 'G13 - Dubai Airport Freezone', '12-Sheet LED', 'digital', 4, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1146, 2, 'G14 - Al Nahda', '12-Sheet LED', 'digital', 5, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1147, 2, 'G15 - Stadium', '12-Sheet LED', 'digital', 6, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1148, 2, 'G16 - Al Qiyadah', '12-Sheet LED', 'digital', 7, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1149, 2, 'G17 - Abu Hail', '12-Sheet LED', 'digital', 8, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1150, 2, 'G18 - Abu Baker Al Siddique', '12-Sheet LED', 'digital', 9, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1151, 2, 'G19 - Salah Al Din', '12-Sheet LED', 'digital', 57, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1152, 2, 'G21 - Baniyas Square', '12-Sheet LED', 'digital', 10, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1153, 2, 'G22 - Palm Deira', '12-Sheet LED', 'digital', 11, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1154, 2, 'G23 - Al Ras', '12-Sheet LED', 'digital', 45, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1155, 2, 'G24 - Al Ghubaiba', '12-Sheet LED', 'digital', 46, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1156, 2, 'G25 - Sharaf DG', '12-Sheet LED', 'digital', 12, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1157, 2, 'G27 - Oud Metha', '12-Sheet LED', 'digital', 13, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1158, 2, 'G28 - Dubai Healthcare City', '12-Sheet LED', 'digital', 14, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1159, 2, 'G29 - Jadaf', '12-Sheet LED', 'digital', 15, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1160, 2, 'G30 - Creek', '12-Sheet LED', 'digital', 16, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1161, 2, 'R11 - Centerpoint', '12-Sheet LED', 'digital', 17, 'Metro Owned', '', '', '86400', 'package', 4, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1162, 2, 'R12 - Emirates', '12-Sheet LED', 'digital', 18, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1163, 2, 'R13 - Airport T3', '12-Sheet LED', 'digital', 19, 'Metro Owned', '', '', '86400', 'package', 3, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1164, 2, 'R14 - Airport T1', '12-Sheet LED', 'digital', 20, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1165, 2, 'R15 - GGICO', '12-Sheet LED', 'digital', 21, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1166, 2, 'R16 - Deira City Centre', '12-Sheet LED', 'digital', 22, 'Metro Owned', '', '', '86400', 'package', 6, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1167, 2, 'R17 - Al Rigga', '12-Sheet LED', 'digital', 23, 'Metro Owned', '', '', '86400', 'package', 4, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1168, 2, 'R18 - Union Square', '12-Sheet LED', 'digital', 24, 'Metro Owned', '', '', '86400', 'package', 4, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1169, 2, 'R19 - Burjuman', '12-Sheet LED', 'digital', 47, 'Metro Owned', '', '', '86400', 'package', 5, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1170, 2, 'R20 - ADCB', '12-Sheet LED', 'digital', 25, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1171, 2, 'R21 - Max', '12-Sheet LED', 'digital', 26, 'Metro Owned', '', '', '86400', 'package', 3, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1172, 2, 'R22 - Trade Centre', '12-Sheet LED', 'digital', 27, 'Metro Owned', '', '', '86400', 'package', 4, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1173, 2, 'R23 - Emirates Towers', '12-Sheet LED', 'digital', 28, 'Metro Owned', '', '', '86400', 'package', 3, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1174, 2, 'R24 - Financial Centre', '12-Sheet LED', 'digital', 29, 'Metro Owned', '', '', '86400', 'package', 3, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1175, 2, 'R25 - Burj Khalifa Dubai Mall', '12-Sheet LED', 'digital', 30, 'Metro Owned', '', '', '86400', 'package', 6, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `assets` (`id`, `department_id`, `ref_no`, `name`, `type`, `location_id`, `owned_by`, `asset_photo`, `description`, `installation_time`, `package_type`, `no_of_assets`, `slots`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1176, 2, 'R26 - Business Bay', '12-Sheet LED', 'digital', 31, 'Metro Owned', '', '', '86400', 'package', 3, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1177, 2, 'R29 - Al Safa', '12-Sheet LED', 'digital', 32, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1178, 2, 'R31 - Umm Al Sheif', '12-Sheet LED', 'digital', 33, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1179, 2, 'R32 - Mall of Emirates', '12-Sheet LED', 'digital', 34, 'Metro Owned', '', '', '86400', 'package', 6, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1180, 2, 'R33 - Mashreq', '12-Sheet LED', 'digital', 35, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1181, 2, 'R34 - Dubai Internet City', '12-Sheet LED', 'digital', 36, 'Metro Owned', '', '', '86400', 'package', 3, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1182, 2, 'R35 - Al Khail', '12-Sheet LED', 'digital', 37, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1183, 2, 'R36 - Sobha', '12-Sheet LED', 'digital', 38, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1184, 2, 'R37 - DMCC', '12-Sheet LED', 'digital', 39, 'Metro Owned', '', '', '86400', 'package', 4, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1185, 2, 'R38 - Jabel Ali', '12-Sheet LED', 'digital', 40, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1186, 2, 'R39 - Ibn Battuta', '12-Sheet LED', 'digital', 41, 'Metro Owned', '', '', '86400', 'package', 2, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1187, 2, 'R40 - Energy', '12-Sheet LED', 'digital', 42, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1188, 2, 'R41 - Danube', '12-Sheet LED', 'digital', 43, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1189, 2, 'R42 - UAE Exchange', '12-Sheet LED', 'digital', 44, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1190, 2, 'The Massive', 'Digital', 'digital', 103, 'Metro Owned', '', '', '86400', 'package', 1304, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1191, 2, 'The G7 Psdeal', 'Digital', 'digital', 104, 'Metro Owned', '', '', '86400', 'package', 1020, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1192, 2, 'AUH-LED-1', 'LED Bridge', 'digital', 34, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1193, 2, 'DXB-LED-1', 'LED Bridge', 'digital', 34, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1194, 2, 'R26-FBP-AUH-01', 'LED Bridge', 'digital', 31, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1195, 2, 'R26-FBP-DXB-01', 'LED Bridge', 'digital', 31, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1196, 2, 'R31-FBP-AUH-01', 'LED Bridge', 'digital', 100, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1197, 2, 'R34-FBP-AUH-01', 'LED Bridge', 'digital', 36, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1198, 2, 'R34-FBP-DXB-01', 'LED Bridge', 'digital', 36, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1199, 2, 'R35-FBP-AUH-01', 'LED Bridge', 'digital', 37, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1200, 2, 'R38-FBP-AUH-01', 'LED Bridge', 'digital', 40, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1201, 2, 'R38-FBP-DXB-01', 'LED Bridge', 'digital', 40, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1202, 2, 'R40-FBP-DXB-01', 'LED Bridge', 'digital', 42, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1203, 2, 'R41-FBP-DXB-01', 'LED Bridge', 'digital', 43, 'Metro Owned', '', '', '86400', 'package', 1, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1204, 2, 'Da Vinci', 'LED Bridge', 'digital', 105, 'Metro Owned', '', '', '86400', 'package', 12, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1205, 2, 'Van Gohh', 'LED Bridge', 'digital', 106, 'Metro Owned', '', '', '86400', 'package', 4, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1206, 2, 'Monet', 'LED Bridge', 'digital', 107, 'Metro Owned', '', '', '86400', 'package', 4, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(1207, 2, 'Frida', 'LED Bridge', 'digital', 108, 'Metro Owned', '', '', '86400', 'package', 4, 15, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `asset_in_network`
--

CREATE TABLE `asset_in_network` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asset_network`
--

CREATE TABLE `asset_network` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asset_status`
--

CREATE TABLE `asset_status` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asset_status`
--

INSERT INTO `asset_status` (`id`, `asset_id`, `campaign_id`, `from_date`, `to_date`, `comment`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `deleted_by`) VALUES
(1, 2, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'New', 'Deleted', '2023-02-23 06:21:18', 1, '2023-02-23 09:35:40', 1, '2023-02-23 09:35:40', NULL),
(2, 3, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'New', 'Deleted', '2023-02-23 06:21:18', 1, '2023-02-23 09:35:40', 1, '2023-02-23 09:35:40', NULL),
(3, 4, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'New', 'Deleted', '2023-02-23 06:21:18', 1, '2023-02-23 09:35:40', 1, '2023-02-23 09:35:40', NULL),
(4, 2, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:35:40', 1, '2023-02-23 09:37:01', 1, '2023-02-23 09:37:01', NULL),
(5, 3, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:35:40', 1, '2023-02-23 09:37:01', 1, '2023-02-23 09:37:01', NULL),
(6, 4, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:35:40', 1, '2023-02-23 09:37:01', 1, '2023-02-23 09:37:01', NULL),
(7, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:35:40', 1, '2023-02-23 09:37:01', 1, '2023-02-23 09:37:01', NULL),
(8, 2, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:37:01', 1, '2023-02-23 09:45:49', 1, '2023-02-23 09:45:49', NULL),
(9, 3, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:37:01', 1, '2023-02-23 09:45:49', 1, '2023-02-23 09:45:49', NULL),
(10, 4, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:37:01', 1, '2023-02-23 09:45:49', 1, '2023-02-23 09:45:49', NULL),
(11, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:37:01', 1, '2023-02-23 09:45:49', 1, '2023-02-23 09:45:49', NULL),
(12, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:37:01', 1, '2023-02-23 09:45:49', 1, '2023-02-23 09:45:49', NULL),
(13, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:37:01', 1, '2023-02-23 09:45:49', 1, '2023-02-23 09:45:49', NULL),
(14, 888, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:37:01', 1, '2023-02-23 09:45:49', 1, '2023-02-23 09:45:49', NULL),
(15, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:45:49', 1, '2023-02-23 09:55:32', 1, '2023-02-23 09:55:32', NULL),
(16, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:45:49', 1, '2023-02-23 09:55:32', 1, '2023-02-23 09:55:32', NULL),
(17, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:45:49', 1, '2023-02-23 09:55:32', 1, '2023-02-23 09:55:32', NULL),
(18, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:45:49', 1, '2023-02-23 09:55:32', 1, '2023-02-23 09:55:32', NULL),
(19, 888, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:45:49', 1, '2023-02-23 09:55:32', 1, '2023-02-23 09:55:32', NULL),
(20, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:55:32', 1, '2023-02-23 09:58:44', 1, '2023-02-23 09:58:44', NULL),
(21, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:55:32', 1, '2023-02-23 09:58:44', 1, '2023-02-23 09:58:44', NULL),
(22, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:55:32', 1, '2023-02-23 09:58:44', 1, '2023-02-23 09:58:44', NULL),
(23, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:55:32', 1, '2023-02-23 09:58:44', 1, '2023-02-23 09:58:44', NULL),
(24, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:58:44', 1, '2023-02-27 09:34:42', 1, '2023-02-27 09:34:42', NULL),
(25, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:58:44', 1, '2023-02-27 09:34:42', 1, '2023-02-27 09:34:42', NULL),
(26, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:58:44', 1, '2023-02-27 09:34:42', 1, '2023-02-27 09:34:42', NULL),
(27, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-23 09:58:44', 1, '2023-02-27 09:34:42', 1, '2023-02-27 09:34:42', NULL),
(28, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:34:42', 1, '2023-02-27 09:50:29', 1, '2023-02-27 09:50:29', NULL),
(29, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:34:42', 1, '2023-02-27 09:50:29', 1, '2023-02-27 09:50:29', NULL),
(30, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:34:42', 1, '2023-02-27 09:50:29', 1, '2023-02-27 09:50:29', NULL),
(31, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:34:42', 1, '2023-02-27 09:50:29', 1, '2023-02-27 09:50:29', NULL),
(32, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:50:29', 1, '2023-02-27 09:51:15', 1, '2023-02-27 09:51:15', NULL),
(33, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:50:29', 1, '2023-02-27 09:51:15', 1, '2023-02-27 09:51:15', NULL),
(34, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:50:29', 1, '2023-02-27 09:51:15', 1, '2023-02-27 09:51:15', NULL),
(35, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:50:29', 1, '2023-02-27 09:51:15', 1, '2023-02-27 09:51:15', NULL),
(36, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:51:15', 1, '2023-02-27 09:54:33', 1, '2023-02-27 09:54:33', NULL),
(37, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:51:15', 1, '2023-02-27 09:54:33', 1, '2023-02-27 09:54:33', NULL),
(38, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:51:15', 1, '2023-02-27 09:54:33', 1, '2023-02-27 09:54:33', NULL),
(39, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:51:15', 1, '2023-02-27 09:54:33', 1, '2023-02-27 09:54:33', NULL),
(40, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:51:15', 1, '2023-02-27 09:54:33', 1, '2023-02-27 09:54:33', NULL),
(41, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:54:33', 1, '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', NULL),
(42, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:54:33', 1, '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', NULL),
(43, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:54:33', 1, '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', NULL),
(44, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:54:33', 1, '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', NULL),
(45, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:54:33', 1, '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', NULL),
(46, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Deleted', '2023-02-27 09:54:33', 1, '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', NULL),
(47, 974, 23, '2022-08-12 23:59:59', '2023-03-05 00:00:00', 'Update', 'Deleted', '2023-02-28 03:42:53', 1, '2023-02-28 09:48:37', 1, '2023-02-28 09:48:37', NULL),
(48, 974, 23, '2022-08-12 23:59:59', '2023-03-05 00:00:00', 'Update', 'Booked', '2023-02-28 09:48:37', 1, '2023-02-28 09:48:37', 1, NULL, NULL),
(49, 1143, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Booked', '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', 1, NULL, NULL),
(50, 885, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Booked', '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', 1, NULL, NULL),
(51, 886, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Booked', '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', 1, NULL, NULL),
(52, 887, 34, '2022-06-12 23:59:59', '2022-11-12 00:00:00', 'Update', 'Booked', '2023-03-07 02:51:30', 1, '2023-03-07 02:51:30', 1, NULL, NULL),
(53, 627, 35, '2023-04-01 23:59:59', '2023-05-01 00:00:00', 'New', 'Booked', '2023-03-08 08:34:03', 1, '2023-03-08 08:34:03', 1, NULL, NULL),
(54, 628, 35, '2023-04-01 23:59:59', '2023-05-01 00:00:00', 'New', 'Booked', '2023-03-08 08:34:03', 1, '2023-03-08 08:34:03', 1, NULL, NULL),
(55, 658, 35, '2023-04-01 23:59:59', '2023-05-01 00:00:00', 'New', 'Booked', '2023-03-08 08:34:03', 1, '2023-03-08 08:34:03', 1, NULL, NULL),
(56, 659, 35, '2023-04-01 23:59:59', '2023-05-01 00:00:00', 'New', 'Booked', '2023-03-08 08:34:03', 1, '2023-03-08 08:34:03', 1, NULL, NULL),
(57, 660, 35, '2023-04-01 23:59:59', '2023-05-01 00:00:00', 'New', 'Booked', '2023-03-08 08:34:03', 1, '2023-03-08 08:34:03', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
  `id` int(11) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `agency` varchar(250) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `client_name` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `market` varchar(250) DEFAULT NULL,
  `booking_order_file` varchar(500) DEFAULT NULL,
  `contract_name` varchar(250) DEFAULT NULL,
  `contract_number` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `campaign_type` enum('Confirmed','Tentative') DEFAULT NULL,
  `payment_status` varchar(150) DEFAULT NULL,
  `booking_order` varchar(500) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign`
--

INSERT INTO `campaign` (`id`, `name`, `agency`, `type`, `client_name`, `brand`, `department_id`, `market`, `booking_order_file`, `contract_name`, `contract_number`, `description`, `start_date`, `start_time`, `end_date`, `end_time`, `campaign_type`, `payment_status`, `booking_order`, `status`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`, `completed_at`) VALUES
(1, 'Skechersss', 'Apparel Group', 'Select', '1', NULL, 3, 'UAE', NULL, 'Skechers', 'AUH - SO983', NULL, '2022-06-12', '00:00:00', '2022-12-13', '00:00:00', 'Confirmed', 'Pending', NULL, 'Active', '2022-08-22 10:50:33', '2023-01-09 07:18:16', NULL, 1, 1, NULL, NULL),
(2, 'Skechers', 'Apparel Group', 'digital', '1', NULL, 3, 'UAE', NULL, 'Skechers', 'AUH - SO983', NULL, '2022-07-25', '00:00:00', '2022-09-04', '00:00:00', 'Confirmed', 'Pending', NULL, 'Active', '2022-08-22 10:50:39', '2022-08-22 10:50:39', NULL, 1, 1, NULL, NULL),
(3, 'Skechers', 'Apparel Group', 'digital', '1', NULL, 3, 'UAE', NULL, 'Skechers', 'AUH - SO983', NULL, '2022-07-25', '00:00:00', '2022-09-04', '00:00:00', 'Confirmed', 'Pending', NULL, 'Active', '2022-08-22 10:50:40', '2022-08-22 10:50:40', NULL, 1, 1, NULL, NULL),
(4, 'Red Tag', 'Division of BMA International', 'Select', '1', NULL, 3, 'UAE', NULL, 'DAL - SO368', 'DAL - SO368', NULL, '2021-10-18', '00:00:00', '2022-10-17', '00:00:00', 'Confirmed', 'Pending', 'DAL - SO368', 'Active', '2022-08-23 08:48:56', '2022-08-23 08:48:56', NULL, 1, 1, NULL, NULL),
(5, 'Twenty4', 'Division of BMA International', 'Select', '1', NULL, 3, 'UAE', NULL, 'DAL - SO377', 'DAL - SO377', NULL, '2021-10-22', '00:00:00', '2022-10-21', '00:00:00', 'Confirmed', 'Pending', 'DAL - SO377', 'Active', '2022-08-23 08:50:11', '2023-01-09 08:01:25', NULL, 1, 1, NULL, NULL),
(6, 'Skechers Ndw', 'Apparel Group', 'Select', '1', NULL, 3, 'UAE', NULL, 'DAL - SO989', 'DAL - SO989', NULL, '2022-07-25', '00:00:00', '2022-09-04', '00:00:00', 'Confirmed', 'Pending', 'DAL - SO989', 'Completed', '2022-08-23 08:53:24', '2023-01-09 07:44:21', NULL, 1, 1, NULL, NULL),
(7, 'Skechers Test', 'Apparel Group', 'Select', '1', NULL, 4, 'UAE', NULL, 'DEE - SO1026', 'DEE - SO1026', NULL, '2022-04-01', '00:00:00', '2023-03-31', '00:00:00', 'Confirmed', 'Pending', 'DEE - SO1026', 'Not Started', '2022-08-23 08:55:02', '2022-12-05 10:36:33', NULL, 1, 1, NULL, NULL),
(8, 'Homes R Us', 'LALS Group', 'Select', '1', NULL, 3, 'UAE', NULL, 'DEE - SO1325', 'DEE - SO1325', NULL, '2022-07-21', '00:00:00', '2023-07-20', '00:00:00', 'Confirmed', 'Pending', 'DEE - SO1325', 'Active', '2022-08-23 10:19:19', '2022-08-23 10:19:19', NULL, 1, 1, NULL, NULL),
(9, 'Aldar Education', 'Aldar Academies', 'Select', '1', NULL, 3, 'UAE', NULL, 'DEE - SO1364', 'DEE - SO1364', NULL, '2022-09-05', '00:00:00', '2022-10-04', '00:00:00', 'Confirmed', 'Pending', 'DEE - SO1364', 'Active', '2022-08-24 06:02:47', '2023-01-03 06:34:32', NULL, 1, 3, NULL, NULL),
(10, 'Danube Home', 'Danube', 'Select', '1', NULL, 3, 'UAE', NULL, 'JIM - SO493', 'JIM - SO493', NULL, '2022-01-01', '00:00:00', '2022-10-31', '00:00:00', 'Confirmed', 'Pending', 'JIM - SO493', 'Not Started', '2022-08-24 06:07:57', '2022-08-24 06:07:57', NULL, 1, 1, NULL, NULL),
(11, 'L \'Oreal Paris', 'L \'Oreal Middle East', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - 1507', 'MDN - 1507', NULL, '2022-09-15', '00:00:00', '2022-10-12', '00:00:00', 'Confirmed', 'Pending', 'MDN - 1507', 'Not Started', '2022-08-24 06:09:50', '2022-08-24 06:09:50', NULL, 1, 1, NULL, NULL),
(12, 'Brahmastra', 'Empire International', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - 1538', 'MDN - 1538', NULL, '2022-09-03', '00:00:00', '2022-09-12', '00:00:00', 'Confirmed', 'Pending', 'MDN - 1538', 'Not Started', '2022-08-24 06:11:03', '2022-08-24 06:11:03', NULL, 1, 1, NULL, NULL),
(13, 'London Dairy 2022-2023', 'Unipex Dairy Products Co Ltd', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - 629-SO1335', 'MDN - 629-SO1335', NULL, '2022-09-17', '00:00:00', '2022-09-30', '00:00:00', 'Confirmed', 'Pending', 'MDN - 629-SO1335', 'Not Started', '2022-08-24 06:15:27', '2022-08-24 06:15:27', NULL, 1, 1, NULL, NULL),
(14, 'Etisalat Annual', 'Etisalat', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - 896', 'MDN - 896', NULL, '2022-09-17', '00:00:00', '2022-09-30', '00:00:00', 'Confirmed', 'Pending', 'MDN - 896', 'Not Started', '2022-08-24 06:17:19', '2022-08-24 06:17:19', NULL, 1, 1, NULL, NULL),
(15, 'Local Championship Season', 'UAE - Jiu Jitsu Fitness', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - SO1000', 'MDN - SO1000', NULL, '2022-08-25', '00:00:00', '2022-09-07', '00:00:00', 'Confirmed', 'Pending', 'MDN - SO1000', 'Active', '2022-08-24 06:20:36', '2022-08-24 06:20:36', NULL, 1, 1, NULL, NULL),
(16, 'Samsung Yearly Deal MOE', 'Samsung', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - SO1085', 'MDN - SO1085', NULL, '2022-09-01', '00:00:00', '2022-09-30', '00:00:00', 'Confirmed', 'Pending', 'MDN - SO1085', 'Not Started', '2022-08-24 06:23:02', '2022-08-24 06:23:02', NULL, 1, 1, NULL, NULL),
(17, 'Hampton & Double Tree', 'Double Tree by Hilton Resort & Spa Marjan Island', 'Select', '1', NULL, 2, 'UAE', NULL, 'MDN - SO1161', 'MDN - SO1161', NULL, '2022-09-11', '00:00:00', '2022-09-10', '00:00:00', 'Confirmed', 'Pending', 'MDN - SO1161', 'Not Started', '2022-08-24 06:24:16', '2022-12-05 10:32:13', NULL, 1, 1, NULL, NULL),
(18, 'Drops', 'Drops Group Holding', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - SO1245', 'MDN - SO1245', NULL, '2022-07-01', '00:00:00', '2022-09-30', '00:00:00', 'Confirmed', 'Pending', 'MDN - SO1245', 'Completed', '2022-08-24 06:25:32', '2023-01-12 03:30:54', NULL, 1, 1, NULL, NULL),
(19, 'Aldar Education', 'Aldar Academies', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - SO1256', 'MDN - SO1256', NULL, '2022-08-01', '00:00:00', '2022-09-30', '00:00:00', 'Confirmed', 'Pending', 'MDN - SO1256', 'Active', '2022-08-24 06:28:55', '2022-08-24 06:28:55', NULL, 1, 1, NULL, NULL),
(20, 'Amana Launch and Sustain', 'Amana', 'Select', '1', NULL, 1, 'UAE', NULL, 'MDN - SO1340', 'MDN - SO1340', NULL, '2022-07-07', '00:00:00', '2022-08-20', '00:00:00', 'Confirmed', 'Pending', 'MDN - SO1340', 'Not Started', '2022-08-24 06:30:07', '2022-12-05 10:25:05', NULL, 1, 1, NULL, NULL),
(21, 'Dyson', 'Dyson Overseas Distribution Limited', 'Select', '1', NULL, 1, 'UAE', NULL, 'MDN - SO1356', 'CN-001', NULL, '2022-07-07', '00:00:00', '2022-11-12', '00:00:00', 'Confirmed', 'Pending', NULL, 'Not Started', '2022-08-24 06:32:39', '2022-12-05 10:17:55', NULL, 1, 1, NULL, NULL),
(22, 'MAX', 'Landmark Retail', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - SO1363', 'MDN - SO1363', NULL, '2021-10-22', '00:00:00', '2023-03-05', '00:00:00', 'Confirmed', 'Pending', 'MDN - SO1363', 'Active', '2022-08-24 06:33:45', '2022-11-07 10:14:23', NULL, 1, 3, NULL, NULL),
(23, 'Disney She Hulk', 'Disney', 'Select', '1', NULL, 3, 'UAE', NULL, 'MDN - SO1392', 'MDN - SO1392', NULL, '2022-08-12', '00:00:00', '2023-03-05', '00:00:00', 'Confirmed', 'Pending', 'MDN - SO1392', 'Active', '2022-08-24 06:40:09', '2022-11-07 08:55:10', NULL, 1, 3, NULL, NULL),
(29, 'Amarjeet Test', 'Agency1', 'Select', '1', NULL, 1, 'UAE', NULL, 'CN-001', 'CN-001', NULL, '2022-06-12', '00:00:00', '2022-08-20', '00:00:00', 'Confirmed', 'Pending', NULL, 'Cancelled', '2022-10-18 09:48:04', '2022-11-03 07:01:24', NULL, 1, 3, NULL, NULL),
(30, 'Bulgari', 'Apparel Group', 'Select', '1', NULL, 1, 'UAE', NULL, 'DAL - SO989', 'DAL - SO989', NULL, '2022-06-06', '04:00:00', '2022-10-30', '00:00:00', 'Confirmed', 'Pending', NULL, 'Completed', '2022-10-18 12:10:59', '2022-11-03 07:00:56', NULL, 1, 3, NULL, NULL),
(31, 'Carrefour Phase 1', 'MCM', 'digital', '1', NULL, 2, 'UAE', NULL, 'CN-001', 'CN-001', 'Testing', '2022-06-12', '00:00:00', '2022-12-31', '00:00:00', 'Confirmed', 'Pending', 'BK-001', 'Completed', '2022-11-22 03:52:19', '2023-01-09 06:03:37', NULL, 1, 1, NULL, NULL),
(34, 'NewTest1', 'Agency1', 'Static', '1', NULL, 2, 'UAE', NULL, NULL, 'CN-001', NULL, '2022-06-12', '00:00:00', '2022-11-12', '00:00:00', 'Confirmed', 'Pending', 'BO-001', 'Active', '2023-02-23 06:21:18', '2023-02-23 09:58:44', NULL, 1, 1, NULL, NULL),
(35, 'KFC', 'Agency1', 'Static', '1', NULL, 2, 'UAE', NULL, NULL, 'CN-0011123', NULL, '2023-04-01', '00:00:00', '2023-05-01', '00:00:00', 'Confirmed', 'Pending', 'BO-00123', 'Not Started', '2023-03-08 08:34:02', '2023-03-08 08:34:02', NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_assign`
--

CREATE TABLE `campaign_assign` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign_assign`
--

INSERT INTO `campaign_assign` (`id`, `campaign_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`) VALUES
(1, 23, 1, '2022-11-21 02:40:16', '2022-11-21 02:56:01', '2022-11-21 02:56:01', 1, 1),
(2, 23, 2, '2022-11-21 02:56:18', '2022-11-21 02:57:20', '2022-11-21 02:57:20', 1, 1),
(3, 23, 3, '2022-11-21 02:56:18', '2022-11-21 02:56:42', '2022-11-21 02:56:42', 1, 1),
(4, 23, 1, '2022-11-21 02:56:43', '2022-11-21 02:56:43', NULL, 1, 1),
(5, 1, 2, '2022-11-21 04:50:33', '2022-11-21 04:58:43', '2022-11-21 04:58:43', 1, 1),
(6, 1, 4, '2022-11-21 04:51:28', '2022-11-21 04:51:28', NULL, 1, 1),
(7, 1, 1, '2022-11-21 04:58:43', '2022-11-21 04:58:43', NULL, 1, 1),
(8, 34, 1, '2023-02-28 03:46:33', '2023-02-28 03:46:49', '2023-02-28 03:46:49', 1, 1),
(9, 34, 2, '2023-02-28 03:46:49', '2023-02-28 03:46:49', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_buckets`
--

CREATE TABLE `campaign_buckets` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `asset_type` varchar(250) DEFAULT NULL,
  `asset_network` int(11) DEFAULT NULL,
  `asset` varchar(250) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL,
  `installation_time` varchar(255) DEFAULT NULL,
  `proof_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign_buckets`
--

INSERT INTO `campaign_buckets` (`id`, `campaign_id`, `location`, `start_date`, `end_date`, `asset_type`, `asset_network`, `asset`, `quantity`, `availability`, `installation_time`, `proof_status`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 29, 4, '2022-06-12', '2022-08-20', 'static', NULL, '2', NULL, NULL, '1036800', 0, '2022-10-18 09:49:13', '2022-11-03 07:01:24', '2022-11-03 07:01:24', 1, 1, NULL),
(2, 30, 4, '2022-06-06', '2022-06-10', 'static', NULL, '764', NULL, NULL, '1036800', 0, '2022-10-18 12:10:59', '2022-11-03 07:00:56', '2022-11-03 07:00:56', 1, 3, NULL),
(3, 30, 2, '2022-10-18', '2022-10-30', 'static', NULL, '761', NULL, NULL, '1036800', 0, '2022-10-18 12:10:59', '2022-11-03 07:00:56', '2022-11-03 07:00:56', 1, 3, NULL),
(4, 30, 2, '2022-10-18', '2022-10-30', 'static', NULL, '16', NULL, NULL, '1036800', 0, '2022-10-18 12:10:59', '2022-11-03 07:00:56', '2022-11-03 07:00:56', 1, 1, NULL),
(5, 30, 3, '2022-10-18', '2022-10-30', 'static', NULL, '22', NULL, NULL, '1036800', 0, '2022-10-18 12:10:59', '2022-11-02 08:41:43', '2022-11-02 08:41:43', 1, 1, NULL),
(6, 23, 191, '2022-08-12', '2022-12-30', 'static', NULL, '857', NULL, NULL, '1036800', 0, '2022-11-07 08:41:54', '2022-11-07 08:57:20', '2022-11-07 08:57:20', 3, 3, NULL),
(7, 23, 76, '2022-12-12', '2022-12-13', 'static', NULL, '879', NULL, NULL, '1036800', 1, '2022-11-07 08:47:38', '2023-02-28 03:42:14', '2023-02-28 03:42:14', 3, 1, NULL),
(8, 23, 3, '2022-12-11', '2023-03-05', 'static', NULL, '18', NULL, NULL, '1036800', 1, '2022-11-07 08:55:10', '2023-02-28 03:42:14', '2023-02-28 03:42:14', 3, 1, NULL),
(10, 23, 76, '2022-12-12', '2022-12-13', 'static', NULL, '879', NULL, NULL, '1036800', 0, '2022-11-07 08:58:15', '2023-02-28 03:42:14', '2023-02-28 03:42:14', 3, 3, NULL),
(11, 22, 49, '2021-10-22', '2022-11-12', 'static', NULL, '793', NULL, NULL, '604800', 0, '2022-11-07 09:06:04', '2022-11-07 09:39:07', '2022-11-07 09:39:07', 3, 3, NULL),
(12, 22, 76, '2022-06-12', '2022-07-09', 'static', NULL, '850', NULL, NULL, '43200', 1, '2022-11-07 10:12:15', '2023-01-11 07:47:21', NULL, 3, 1, NULL),
(13, 22, 49, '2022-12-11', '2023-03-05', 'static', NULL, '842', NULL, NULL, '207360', 1, '2022-11-07 10:13:26', '2023-01-11 07:47:38', NULL, 3, 1, NULL),
(14, 22, 101, '2022-12-11', '2022-12-11', 'static', NULL, '2029', NULL, NULL, '864000', 0, '2022-11-07 10:13:26', '2022-11-07 10:14:23', NULL, 3, 3, NULL),
(15, 20, 76, '2022-12-14', '2022-12-20', 'static', NULL, '879', NULL, NULL, '1036800', 0, '2022-11-08 04:06:59', '2022-11-08 04:07:22', '2022-11-08 04:07:22', 3, 3, NULL),
(16, 1, 50, '2022-06-12', '2022-11-12', 'static', NULL, '794', NULL, NULL, '604800', 1, '2022-11-22 01:46:47', '2023-01-09 06:53:06', '2023-01-09 06:53:06', 1, 1, NULL),
(17, 1, 50, '2022-12-12', '2022-12-13', 'static', 1, '1362', 1, NULL, '864000', 1, '2022-11-22 02:17:14', '2023-01-09 06:53:06', '2023-01-09 06:53:06', 1, 1, NULL),
(18, 31, 35, '2022-06-12', '2022-08-20', 'static', NULL, '557', NULL, NULL, '1036800', 1, '2022-11-22 03:52:19', '2023-01-09 04:30:42', NULL, 1, 1, NULL),
(19, 31, 35, '2022-06-12', '2022-08-20', 'static', NULL, '558', NULL, NULL, '1036800', 1, '2022-11-22 03:56:25', '2023-01-09 06:03:37', NULL, 1, 1, NULL),
(20, 21, 130, '2022-07-07', '2022-08-12', 'static', NULL, '1366', NULL, NULL, '864000', 0, '2022-12-05 10:05:09', '2022-12-05 10:14:39', '2022-12-05 10:14:39', 1, 1, NULL),
(21, 21, 128, '2022-07-07', '2022-08-12', 'static', NULL, '1362', NULL, NULL, '864000', 0, '2022-12-05 10:11:50', '2022-12-05 10:14:39', '2022-12-05 10:14:39', 1, 1, NULL),
(22, 21, 127, '2022-07-07', '2022-11-12', 'static', NULL, '1377', NULL, NULL, '864000', 0, '2022-12-05 10:17:55', '2022-12-05 10:17:55', NULL, 1, 1, NULL),
(23, 21, 130, '2022-07-07', '2022-11-12', 'digital', NULL, '1367', NULL, NULL, '86400', 0, '2022-12-05 10:17:55', '2022-12-05 10:17:55', NULL, 1, 1, NULL),
(24, 20, 130, '2022-07-07', '2022-08-20', 'digital', NULL, '1367', NULL, NULL, '86400', 0, '2022-12-05 10:25:05', '2022-12-05 10:25:05', NULL, 1, 1, NULL),
(25, 20, 132, '2022-07-07', '2022-08-20', 'digital', NULL, '1372', NULL, NULL, '86400', 0, '2022-12-05 10:25:05', '2022-12-05 10:25:05', NULL, 1, 1, NULL),
(26, 20, 129, '2022-07-07', '2022-08-20', 'static', NULL, '1366', NULL, NULL, '864000', 0, '2022-12-05 10:29:57', '2022-12-05 10:30:49', NULL, 1, 1, NULL),
(27, 17, 51, '2022-09-11', '2022-09-10', 'static', NULL, '797', NULL, NULL, '604800', 0, '2022-12-05 10:32:53', '2022-12-05 10:32:53', NULL, 1, 1, NULL),
(28, 17, 91, '2022-09-11', '2022-09-10', 'digital', NULL, '1266', NULL, NULL, '86400', 0, '2022-12-05 10:35:10', '2022-12-05 10:35:10', NULL, 1, 1, NULL),
(29, 7, 187, '2022-04-01', '2023-03-31', 'static', 1, '1362', 1, NULL, '864000', 0, '2022-12-05 10:36:51', '2022-12-05 10:36:51', NULL, 1, 1, NULL),
(30, 1, 106, '2022-06-12', '2022-12-13', 'static', NULL, '2447', NULL, NULL, '604800', 1, '2023-01-09 06:59:45', '2023-01-09 07:08:12', NULL, 1, 1, NULL),
(31, 1, 102, '2022-06-12', '2022-12-13', 'digital', NULL, '1354', NULL, NULL, '86400', 1, '2023-01-09 07:00:09', '2023-01-09 07:20:57', NULL, 1, 1, NULL),
(32, 1, 107, '2022-06-12', '2022-12-13', 'static', NULL, '2453', NULL, NULL, '604800', 0, '2023-01-09 07:09:29', '2023-01-09 07:09:29', NULL, 1, 1, NULL),
(33, 6, 113, '2022-07-25', '2022-09-04', 'static', NULL, '2836', NULL, NULL, '1209600', 0, '2023-01-09 07:27:25', '2023-01-09 07:45:13', NULL, 1, 1, NULL),
(34, 6, 119, '2022-07-25', '2022-09-04', 'digital', NULL, '3259', NULL, NULL, '86400', 0, '2023-01-09 07:27:57', '2023-01-09 07:45:13', NULL, 1, 1, NULL),
(35, 6, 110, '2022-07-25', '2022-09-04', 'digital', NULL, '2994', NULL, NULL, '86400', 0, '2023-01-09 07:45:13', '2023-01-09 07:52:33', NULL, 1, 1, NULL),
(36, 5, 125, '2021-10-22', '2022-10-21', 'digital', NULL, '3475', NULL, NULL, '86400', 0, '2023-01-09 07:56:09', '2023-01-09 08:01:25', NULL, 1, 1, NULL),
(37, 5, 113, '2021-10-22', '2022-10-21', 'static', NULL, '2834', NULL, NULL, '1209600', 1, '2023-01-09 07:56:43', '2023-01-09 07:58:53', NULL, 1, 1, NULL),
(38, 5, 114, '2021-10-22', '2022-10-21', 'digital', NULL, '2938', NULL, NULL, '86400', 1, '2023-01-09 07:58:09', '2023-01-09 07:58:31', NULL, 1, 1, NULL),
(39, 5, 115, '2021-10-22', '2022-10-21', 'digital', NULL, '3024', NULL, NULL, '86400', 1, '2023-01-09 07:59:15', '2023-01-09 08:01:09', NULL, 1, 1, NULL),
(40, 4, 114, '2021-10-18', '2022-10-17', 'digital', NULL, '2942', NULL, NULL, '86400', 0, '2023-01-09 08:06:25', '2023-01-09 08:34:53', NULL, 1, 1, NULL),
(41, 4, 126, '2021-10-18', '2022-10-17', 'digital', NULL, '1348', NULL, NULL, '86400', 0, '2023-01-09 08:07:28', '2023-01-09 08:34:53', NULL, 1, 1, NULL),
(42, 4, 115, '2021-10-18', '2022-10-17', 'digital', NULL, '3028', NULL, NULL, '86400', 0, '2023-01-09 08:12:12', '2023-01-09 08:34:53', NULL, 1, 1, NULL),
(43, 4, 108, '2021-10-18', '2022-10-17', 'static', NULL, '2454', NULL, NULL, '604800', 0, '2023-01-09 08:13:37', '2023-01-09 08:34:53', NULL, 1, 1, NULL),
(44, 18, 101, '2022-07-01', '2022-09-30', 'static', NULL, '1955', NULL, NULL, '864000', 1, '2023-01-11 09:14:35', '2023-01-11 09:15:44', NULL, 1, 1, NULL),
(45, 18, 101, '2022-07-01', '2022-09-30', 'static', NULL, '2028', NULL, NULL, '864000', 1, '2023-01-11 09:14:35', '2023-01-11 09:22:42', NULL, 1, 1, NULL),
(46, 18, 106, '2022-07-01', '2022-09-30', 'static', NULL, '2448', NULL, NULL, '604800', 1, '2023-01-11 09:14:35', '2023-01-12 03:30:54', NULL, 1, 1, NULL),
(47, 34, 2, '2022-06-12', '2022-11-12', 'digital', NULL, '1143', NULL, NULL, NULL, 0, '2023-02-23 06:21:18', '2023-02-23 09:45:49', NULL, 1, 1, NULL),
(48, 34, 2, '2022-06-12', '2022-11-12', 'digital', NULL, '1143', NULL, NULL, NULL, 0, '2023-02-23 09:35:40', '2023-02-23 09:37:01', '2023-02-23 09:37:01', 1, 1, NULL),
(49, 34, 66, '2022-06-12', '2022-11-12', 'static', NULL, '885, 886, 887', NULL, NULL, NULL, 0, '2023-02-23 09:37:01', '2023-02-23 09:55:32', NULL, 1, 1, NULL),
(52, 34, 2, '2022-06-12', '2022-11-12', 'digital', NULL, '1143', NULL, NULL, NULL, 0, '2023-02-27 09:51:15', '2023-03-07 02:51:30', '2023-03-07 02:51:30', 1, 1, NULL),
(53, 34, 2, '2022-06-12', '2022-11-12', 'digital', NULL, '1143', NULL, NULL, NULL, 0, '2023-02-27 09:54:33', '2023-03-07 02:51:30', '2023-03-07 02:51:30', 1, 1, NULL),
(54, 23, 86, '2022-08-12', '2023-03-05', 'static', NULL, '974', NULL, NULL, NULL, 0, '2023-02-28 03:42:53', '2023-02-28 03:42:53', NULL, 1, 1, NULL),
(55, 35, 34, '2023-04-01', '2023-05-01', 'static', NULL, '627, 628', NULL, NULL, NULL, 0, '2023-03-08 08:34:03', '2023-03-08 08:34:03', NULL, 1, 1, NULL),
(56, 35, 37, '2023-04-01', '2023-05-01', 'static', NULL, '658, 659, 660', NULL, NULL, NULL, 0, '2023-03-08 08:34:03', '2023-03-08 08:34:03', NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_installations`
--

CREATE TABLE `campaign_installations` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_installations_designs`
--

CREATE TABLE `campaign_installations_designs` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `installation_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo_path` varchar(550) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_installation_assign`
--

CREATE TABLE `campaign_installation_assign` (
  `id` int(11) NOT NULL,
  `campaign_installation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_monitoring`
--

CREATE TABLE `campaign_monitoring` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo_path` varchar(550) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign_monitoring`
--

INSERT INTO `campaign_monitoring` (`id`, `campaign_id`, `description`, `photo_path`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 29, 'Monitoring', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/campaign_monitoring/274-2742751_1-mb-image-download.jpg', 'Active', '2022-10-18 10:19:32', '2022-10-18 10:19:32', 2, 2),
(2, 30, NULL, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/campaign_monitoring/1665755933921.jfif', 'Active', '2022-10-18 12:13:22', '2022-10-18 12:13:22', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_permits`
--

CREATE TABLE `campaign_permits` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `permit_file` varchar(1000) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_proof`
--

CREATE TABLE `campaign_proof` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `asset_id` int(11) NOT NULL,
  `bucket_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campaign_proof`
--

INSERT INTO `campaign_proof` (`id`, `campaign_id`, `location_id`, `asset_id`, `bucket_id`, `status`, `comment`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 19, NULL, 0, 0, NULL, NULL, '2022-11-09 11:20:33', '2022-11-09 11:20:33', 2, 2),
(2, 19, 49, 0, 0, NULL, NULL, '2022-11-16 13:20:50', '2022-11-16 13:20:50', 1, 1),
(3, 31, 76, 0, 0, 0, 'Re do again', '2022-11-22 08:01:17', '2022-11-22 08:04:31', 1, 1),
(5, 9, 76, 0, 0, NULL, NULL, '2023-01-03 10:34:29', '2023-01-03 10:34:29', 3, 3),
(6, 9, 101, 0, 0, NULL, NULL, '2023-01-05 12:18:15', '2023-01-05 12:18:15', 3, 3),
(7, 9, 49, 0, 0, 0, 'ReDo', '2023-01-05 12:18:48', '2023-01-05 12:19:04', 3, 3),
(8, 31, NULL, 557, 0, 1, NULL, '2023-01-09 08:11:08', '2023-01-09 08:11:08', 1, 1),
(9, 31, NULL, 557, 0, 1, NULL, '2023-01-09 08:30:00', '2023-01-09 08:30:00', 1, 1),
(10, 31, NULL, 557, 0, 1, NULL, '2023-01-09 08:30:41', '2023-01-09 08:30:41', 1, 1),
(11, 31, NULL, 558, 0, 1, NULL, '2023-01-09 09:59:26', '2023-01-09 09:59:26', 1, 1),
(12, 31, NULL, 558, 0, 1, NULL, '2023-01-09 10:03:37', '2023-01-09 10:03:37', 1, 1),
(13, 23, NULL, 879, 0, 1, NULL, '2023-01-09 10:04:52', '2023-01-09 10:04:52', 1, 1),
(14, 1, NULL, 794, 0, 0, 'Testinhfsdf 3rd', '2023-01-09 10:05:48', '2023-01-09 10:29:56', 1, 1),
(15, 1, NULL, 1362, 0, 0, 'Testsibfgsdfg 2mnd', '2023-01-09 10:06:03', '2023-01-09 10:28:57', 1, 1),
(16, 1, NULL, 1362, 0, 1, NULL, '2023-01-09 10:29:43', '2023-01-09 10:29:43', 1, 1),
(17, 1, NULL, 794, 0, 1, NULL, '2023-01-09 10:52:52', '2023-01-09 10:52:52', 1, 1),
(18, 1, NULL, 2447, 0, 1, NULL, '2023-01-09 11:02:06', '2023-01-09 11:02:06', 1, 1),
(19, 1, NULL, 1354, 0, 1, NULL, '2023-01-09 11:05:11', '2023-01-09 11:05:11', 1, 1),
(20, 1, NULL, 1354, 0, 1, NULL, '2023-01-09 11:05:11', '2023-01-09 11:05:11', 1, 1),
(21, 1, NULL, 2447, 0, 1, NULL, '2023-01-09 11:06:28', '2023-01-09 11:06:28', 1, 1),
(22, 1, NULL, 2447, 0, 1, NULL, '2023-01-09 11:08:12', '2023-01-09 11:08:12', 1, 1),
(23, 1, NULL, 2447, 0, 1, NULL, '2023-01-09 11:09:00', '2023-01-09 11:09:00', 1, 1),
(24, 1, NULL, 1354, 0, 0, 'asdfasdf', '2023-01-09 11:09:11', '2023-01-09 11:18:16', 1, 1),
(25, 1, NULL, 1354, 0, 1, NULL, '2023-01-09 11:20:55', '2023-01-09 11:20:55', 1, 1),
(26, 6, NULL, 3263, 0, 1, NULL, '2023-01-09 11:28:20', '2023-01-09 11:28:20', 1, 1),
(27, 6, NULL, 2836, 0, 0, 'xvzxvzxv', '2023-01-09 11:41:49', '2023-01-09 11:41:56', 1, 1),
(28, 6, NULL, 3260, 0, 1, NULL, '2023-01-09 11:43:14', '2023-01-09 11:43:14', 1, 1),
(29, 6, NULL, 3259, 0, 1, NULL, '2023-01-09 11:44:04', '2023-01-09 11:44:04', 1, 1),
(30, 6, NULL, 2836, 0, 1, NULL, '2023-01-09 11:44:20', '2023-01-09 11:44:20', 1, 1),
(31, 5, NULL, 3475, 0, 0, 'sdfgsdfg', '2023-01-09 11:56:17', '2023-01-09 12:01:25', 1, 1),
(32, 5, NULL, 2938, 0, 1, NULL, '2023-01-09 11:58:30', '2023-01-09 11:58:30', 1, 1),
(33, 5, NULL, 2834, 0, 1, NULL, '2023-01-09 11:58:53', '2023-01-09 11:58:53', 1, 1),
(34, 5, NULL, 3024, 0, 1, NULL, '2023-01-09 12:01:08', '2023-01-09 12:01:08', 1, 1),
(35, 4, NULL, 1346, 0, 1, NULL, '2023-01-09 12:07:36', '2023-01-09 12:07:36', 1, 1),
(36, 4, NULL, 1348, 0, 1, NULL, '2023-01-09 12:11:28', '2023-01-09 12:11:28', 1, 1),
(37, 4, NULL, 1348, 0, 1, NULL, '2023-01-09 12:13:01', '2023-01-09 12:13:01', 1, 1),
(38, 4, NULL, 1348, 0, 1, NULL, '2023-01-09 12:13:03', '2023-01-09 12:13:03', 1, 1),
(39, 4, NULL, 2942, 0, 1, NULL, '2023-01-09 12:34:13', '2023-01-09 12:34:13', 1, 1),
(40, 4, NULL, 3028, 0, 1, NULL, '2023-01-09 12:34:21', '2023-01-09 12:34:21', 1, 1),
(41, 23, NULL, 18, 8, 0, 'Tetuibfdsdgsdg', '2023-01-11 06:35:06', '2023-01-11 06:45:57', 1, 1),
(42, 23, NULL, 18, 8, 1, NULL, '2023-01-11 06:46:14', '2023-01-11 06:46:14', 1, 1),
(43, 22, NULL, 850, 12, 1, NULL, '2023-01-11 11:47:17', '2023-01-11 11:47:17', 1, 1),
(44, 22, NULL, 842, 13, 1, NULL, '2023-01-11 11:47:36', '2023-01-11 11:47:36', 1, 1),
(45, 23, NULL, 3389, 9, 1, NULL, '2023-01-11 13:06:00', '2023-01-11 13:06:00', 1, 1),
(46, 18, NULL, 1955, 44, 1, NULL, '2023-01-11 13:15:40', '2023-01-11 13:15:40', 1, 1),
(47, 18, NULL, 2028, 45, 1, NULL, '2023-01-11 13:22:40', '2023-01-11 13:22:40', 1, 1),
(48, 18, NULL, 2448, 46, 1, NULL, '2023-01-12 07:30:50', '2023-01-12 07:30:50', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_status`
--

CREATE TABLE `campaign_status` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign_status`
--

INSERT INTO `campaign_status` (`id`, `campaign_id`, `status`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'Active', '2022-08-22 10:50:34', '2022-11-22 01:40:42', '2022-11-22 01:40:42', 1, 1),
(2, 2, 'Active', '2022-08-22 10:50:40', '2022-08-22 10:50:40', NULL, 1, 1),
(3, 3, 'Active', '2022-08-22 10:50:40', '2022-08-22 10:50:40', NULL, 1, 1),
(4, 4, 'Active', '2022-08-23 08:48:57', '2023-01-09 08:06:25', '2023-01-09 08:06:25', 1, 1),
(5, 5, 'Not Started', '2022-08-23 08:50:11', '2022-10-18 09:00:02', '2022-10-18 09:00:02', 1, 1),
(6, 6, 'Not Started', '2022-08-23 08:53:25', '2023-01-09 07:27:25', '2023-01-09 07:27:25', 1, 1),
(7, 7, 'Not Started', '2022-08-23 08:55:03', '2022-12-05 10:36:33', '2022-12-05 10:36:33', 1, 1),
(8, 8, 'Active', '2022-08-23 10:19:20', '2022-08-23 10:19:20', NULL, 1, 1),
(9, 9, 'Not Started', '2022-08-24 06:02:48', '2022-08-24 06:02:48', NULL, 1, 1),
(10, 10, 'Not Started', '2022-08-24 06:07:57', '2022-08-24 06:07:57', NULL, 1, 1),
(11, 11, 'Not Started', '2022-08-24 06:09:51', '2022-08-24 06:09:51', NULL, 1, 1),
(12, 12, 'Not Started', '2022-08-24 06:11:04', '2022-08-24 06:11:04', NULL, 1, 1),
(13, 13, 'Not Started', '2022-08-24 06:15:28', '2022-08-24 06:15:28', NULL, 1, 1),
(14, 14, 'Not Started', '2022-08-24 06:17:20', '2022-08-24 06:17:20', NULL, 1, 1),
(15, 15, 'Active', '2022-08-24 06:20:37', '2022-08-24 06:20:37', NULL, 1, 1),
(16, 16, 'Not Started', '2022-08-24 06:23:03', '2022-11-01 07:29:51', '2022-11-01 07:29:51', 1, 1),
(17, 17, 'Not Started', '2022-08-24 06:24:17', '2022-12-05 10:32:13', '2022-12-05 10:32:13', 1, 1),
(18, 18, 'Active', '2022-08-24 06:25:33', '2023-01-11 09:14:35', '2023-01-11 09:14:35', 1, 1),
(19, 19, 'Active', '2022-08-24 06:28:56', '2022-08-24 06:28:56', NULL, 1, 1),
(20, 20, 'Not Started', '2022-08-24 06:30:08', '2022-11-08 04:06:17', '2022-11-08 04:06:17', 1, 1),
(21, 21, 'Not Started', '2022-08-24 06:32:40', '2022-11-08 03:48:08', '2022-11-08 03:48:08', 1, 1),
(22, 22, 'Active', '2022-08-24 06:33:45', '2022-11-07 09:06:04', '2022-11-07 09:06:04', 1, 1),
(23, 23, 'Active', '2022-08-24 06:40:10', '2022-11-07 03:42:09', '2022-11-07 03:42:09', 1, 1),
(24, 24, 'Not Started', '2022-10-18 08:42:52', '2022-10-18 08:42:52', NULL, 1, 1),
(25, 25, 'Not Started', '2022-10-18 08:44:42', '2022-10-18 08:44:42', NULL, 1, 1),
(26, 5, 'Not Started', '2022-10-18 09:00:02', '2022-10-18 09:01:27', '2022-10-18 09:01:27', 1, 1),
(27, 5, 'Not Started', '2022-10-18 09:01:27', '2023-01-09 07:56:09', '2023-01-09 07:56:09', 1, 1),
(28, 26, 'Not Started', '2022-10-18 09:04:52', '2022-10-18 09:04:52', NULL, 1, 1),
(29, 27, 'Not Started', '2022-10-18 09:44:20', '2022-10-18 09:45:53', '2022-10-18 09:45:53', 1, 1),
(30, 27, 'Not Started', '2022-10-18 09:45:53', '2022-10-18 09:45:53', NULL, 1, 1),
(31, 28, 'Not Started', '2022-10-18 09:46:55', '2022-10-18 09:46:55', NULL, 1, 1),
(32, 29, 'Not Started', '2022-10-18 09:48:04', '2022-10-18 09:48:27', '2022-10-18 09:48:27', 1, 1),
(33, 29, 'Not Started', '2022-10-18 09:48:27', '2022-10-18 09:48:49', '2022-10-18 09:48:49', 1, 1),
(34, 29, 'Not Started', '2022-10-18 09:48:49', '2022-10-18 09:49:13', '2022-10-18 09:49:13', 1, 1),
(35, 29, 'Not Started', '2022-10-18 09:49:13', '2022-10-18 10:00:55', '2022-10-18 10:00:55', 1, 1),
(36, 29, 'Active', '2022-10-18 10:00:55', '2022-11-03 07:01:24', '2022-11-03 07:01:24', 1, 1),
(37, 30, 'Not Started', '2022-10-18 12:10:59', '2022-10-18 12:12:40', '2022-10-18 12:12:40', 1, 1),
(38, 30, 'Active', '2022-10-18 12:12:40', '2022-11-01 07:24:37', '2022-11-01 07:24:37', 1, 1),
(39, 30, 'Not Started', '2022-11-01 07:24:37', '2022-11-01 07:24:47', '2022-11-01 07:24:47', 3, 3),
(40, 30, 'Not Started', '2022-11-01 07:24:47', '2022-11-01 07:25:01', '2022-11-01 07:25:01', 3, 3),
(41, 30, 'Not Started', '2022-11-01 07:25:02', '2022-11-02 08:41:43', '2022-11-02 08:41:43', 3, 3),
(42, 16, 'Not Started', '2022-11-01 07:29:51', '2022-11-01 07:30:06', '2022-11-01 07:30:06', 3, 3),
(43, 16, 'Not Started', '2022-11-01 07:30:06', '2022-11-01 07:38:49', '2022-11-01 07:38:49', 3, 3),
(44, 16, 'Not Started', '2022-11-01 07:38:49', '2022-11-01 07:44:22', '2022-11-01 07:44:22', 3, 3),
(45, 16, 'Not Started', '2022-11-01 07:44:22', '2022-11-01 07:44:38', '2022-11-01 07:44:38', 3, 3),
(46, 16, 'Not Started', '2022-11-01 07:44:38', '2022-11-01 07:46:32', '2022-11-01 07:46:32', 3, 3),
(47, 16, 'Not Started', '2022-11-01 07:46:32', '2022-11-01 07:47:14', '2022-11-01 07:47:14', 3, 3),
(48, 16, 'Not Started', '2022-11-01 07:47:14', '2022-11-01 07:47:51', '2022-11-01 07:47:51', 3, 3),
(49, 16, 'Not Started', '2022-11-01 07:47:51', '2022-11-01 07:47:51', NULL, 3, 3),
(50, 30, 'Not Started', '2022-11-02 08:41:43', '2022-11-03 04:10:25', '2022-11-03 04:10:25', 3, 3),
(51, 30, 'Not Started', '2022-11-03 04:10:25', '2022-11-03 04:30:19', '2022-11-03 04:30:19', 3, 3),
(52, 30, 'Not Started', '2022-11-03 04:30:19', '2022-11-03 04:31:36', '2022-11-03 04:31:36', 3, 3),
(53, 30, 'Not Started', '2022-11-03 04:31:36', '2022-11-03 05:14:16', '2022-11-03 05:14:16', 3, 3),
(54, 30, 'Not Started', '2022-11-03 05:14:16', '2022-11-03 05:23:54', '2022-11-03 05:23:54', 3, 3),
(55, 30, 'Not Started', '2022-11-03 05:23:54', '2022-11-03 05:24:17', '2022-11-03 05:24:17', 3, 3),
(56, 30, 'Not Started', '2022-11-03 05:24:17', '2022-11-03 06:27:52', '2022-11-03 06:27:52', 3, 3),
(57, 30, 'Completed', '2022-11-03 06:27:52', '2022-11-03 06:54:55', '2022-11-03 06:54:55', 3, 3),
(58, 30, 'Completed', '2022-11-03 06:54:55', '2022-11-03 07:00:56', '2022-11-03 07:00:56', 3, 3),
(59, 30, 'Completed', '2022-11-03 07:00:56', '2022-11-15 08:42:08', '2022-11-15 08:42:08', 3, 3),
(60, 29, 'Cancelled', '2022-11-03 07:01:24', '2022-11-03 07:01:24', NULL, 3, 3),
(61, 23, 'Active', '2022-11-07 03:42:09', '2022-11-07 08:41:54', '2022-11-07 08:41:54', 3, 3),
(62, 23, 'Active', '2022-11-07 08:41:54', '2022-11-07 08:43:26', '2022-11-07 08:43:26', 3, 3),
(63, 23, 'Active', '2022-11-07 08:43:26', '2022-11-07 08:44:47', '2022-11-07 08:44:47', 3, 3),
(64, 23, 'Active', '2022-11-07 08:44:47', '2022-11-07 08:45:02', '2022-11-07 08:45:02', 3, 3),
(65, 23, 'Active', '2022-11-07 08:45:02', '2022-11-07 08:45:15', '2022-11-07 08:45:15', 3, 3),
(66, 23, 'Active', '2022-11-07 08:45:15', '2022-11-07 08:47:38', '2022-11-07 08:47:38', 3, 3),
(67, 23, 'Active', '2022-11-07 08:47:38', '2022-11-07 08:55:10', '2022-11-07 08:55:10', 3, 3),
(68, 23, 'Active', '2022-11-07 08:55:10', '2022-11-07 08:57:20', '2022-11-07 08:57:20', 3, 3),
(69, 23, 'Active', '2022-11-07 08:57:20', '2022-11-07 08:58:15', '2022-11-07 08:58:15', 3, 3),
(70, 23, 'Active', '2022-11-07 08:58:15', '2022-11-07 08:58:58', '2022-11-07 08:58:58', 3, 3),
(71, 23, 'Active', '2022-11-07 08:58:58', '2022-11-07 09:33:36', '2022-11-07 09:33:36', 3, 3),
(72, 22, 'Active', '2022-11-07 09:06:04', '2022-11-07 09:38:10', '2022-11-07 09:38:10', 3, 3),
(73, 23, 'Active', '2022-11-07 09:33:36', '2022-11-07 09:34:06', '2022-11-07 09:34:06', 3, 3),
(74, 23, 'Active', '2022-11-07 09:34:06', '2022-11-07 09:34:21', '2022-11-07 09:34:21', 3, 3),
(75, 23, 'Active', '2022-11-07 09:34:21', '2022-11-07 09:36:35', '2022-11-07 09:36:35', 3, 3),
(76, 23, 'Active', '2022-11-07 09:36:35', '2022-11-07 09:37:02', '2022-11-07 09:37:02', 3, 3),
(77, 23, 'Active', '2022-11-07 09:37:02', '2023-02-28 03:42:14', '2023-02-28 03:42:14', 3, 3),
(78, 22, 'Active', '2022-11-07 09:38:10', '2022-11-07 09:39:07', '2022-11-07 09:39:07', 3, 3),
(79, 22, 'Active', '2022-11-07 09:39:07', '2022-11-07 09:40:15', '2022-11-07 09:40:15', 3, 3),
(80, 22, 'Active', '2022-11-07 09:40:15', '2022-11-07 10:12:15', '2022-11-07 10:12:15', 3, 3),
(81, 22, 'Active', '2022-11-07 10:12:15', '2022-11-07 10:13:26', '2022-11-07 10:13:26', 3, 3),
(82, 22, 'Active', '2022-11-07 10:13:26', '2022-11-07 10:14:22', '2022-11-07 10:14:22', 3, 3),
(83, 22, 'Active', '2022-11-07 10:14:22', '2022-11-07 10:16:47', '2022-11-07 10:16:47', 3, 3),
(84, 22, 'Active', '2022-11-07 10:16:47', '2022-11-07 10:17:21', '2022-11-07 10:17:21', 3, 3),
(85, 22, 'Active', '2022-11-07 10:17:21', '2022-11-07 10:19:43', '2022-11-07 10:19:43', 3, 3),
(86, 22, 'Active', '2022-11-07 10:19:43', '2022-11-07 10:19:43', NULL, 3, 3),
(87, 21, 'Not Started', '2022-11-08 03:48:08', '2022-11-08 03:48:44', '2022-11-08 03:48:44', 3, 3),
(88, 21, 'Not Started', '2022-11-08 03:48:44', '2022-11-08 04:04:33', '2022-11-08 04:04:33', 3, 3),
(89, 21, 'Not Started', '2022-11-08 04:04:33', '2022-11-08 04:04:51', '2022-11-08 04:04:51', 3, 3),
(90, 21, 'Not Started', '2022-11-08 04:04:51', '2022-12-05 10:04:24', '2022-12-05 10:04:24', 3, 3),
(91, 20, 'Not Started', '2022-11-08 04:06:17', '2022-11-08 04:06:59', '2022-11-08 04:06:59', 3, 3),
(92, 20, 'Not Started', '2022-11-08 04:06:59', '2022-11-08 04:07:22', '2022-11-08 04:07:22', 3, 3),
(93, 20, 'Not Started', '2022-11-08 04:07:22', '2022-12-05 10:25:05', '2022-12-05 10:25:05', 3, 3),
(94, 30, 'Completed', '2022-11-15 08:42:08', '2022-11-15 08:42:08', NULL, 1, 1),
(95, 1, 'Active', '2022-11-22 01:40:42', '2022-11-22 01:46:04', '2022-11-22 01:46:04', 1, 1),
(96, 1, 'Active', '2022-11-22 01:46:04', '2022-11-22 01:46:47', '2022-11-22 01:46:47', 1, 1),
(97, 1, 'Active', '2022-11-22 01:46:47', '2022-11-22 01:58:22', '2022-11-22 01:58:22', 1, 1),
(98, 1, 'Active', '2022-11-22 01:58:22', '2022-11-22 02:03:02', '2022-11-22 02:03:02', 1, 1),
(99, 1, 'Active', '2022-11-22 02:03:02', '2022-11-22 02:03:13', '2022-11-22 02:03:13', 1, 1),
(100, 1, 'Active', '2022-11-22 02:03:13', '2022-11-22 02:12:19', '2022-11-22 02:12:19', 1, 1),
(101, 1, 'Active', '2022-11-22 02:12:19', '2022-11-22 02:13:49', '2022-11-22 02:13:49', 1, 1),
(102, 1, 'Active', '2022-11-22 02:13:49', '2022-11-22 02:14:51', '2022-11-22 02:14:51', 1, 1),
(103, 1, 'Active', '2022-11-22 02:14:51', '2022-11-22 02:17:14', '2022-11-22 02:17:14', 1, 1),
(104, 1, 'Active', '2022-11-22 02:17:14', '2023-01-09 06:53:06', '2023-01-09 06:53:06', 1, 1),
(105, 31, 'Not Started', '2022-11-22 03:52:19', '2022-11-22 03:56:25', '2022-11-22 03:56:25', 1, 1),
(106, 31, 'Not Started', '2022-11-22 03:56:25', '2022-11-22 03:57:44', '2022-11-22 03:57:44', 1, 1),
(107, 31, 'Active', '2022-11-22 03:57:44', '2022-12-06 02:01:34', '2022-12-06 02:01:34', 1, 1),
(108, 21, 'Not Started', '2022-12-05 10:04:24', '2022-12-05 10:05:09', '2022-12-05 10:05:09', 1, 1),
(109, 21, 'Not Started', '2022-12-05 10:05:09', '2022-12-05 10:06:16', '2022-12-05 10:06:16', 1, 1),
(110, 21, 'Not Started', '2022-12-05 10:06:16', '2022-12-05 10:06:49', '2022-12-05 10:06:49', 1, 1),
(111, 21, 'Not Started', '2022-12-05 10:06:49', '2022-12-05 10:07:21', '2022-12-05 10:07:21', 1, 1),
(112, 21, 'Not Started', '2022-12-05 10:07:21', '2022-12-05 10:09:20', '2022-12-05 10:09:20', 1, 1),
(113, 21, 'Not Started', '2022-12-05 10:09:20', '2022-12-05 10:11:50', '2022-12-05 10:11:50', 1, 1),
(114, 21, 'Not Started', '2022-12-05 10:11:50', '2022-12-05 10:14:39', '2022-12-05 10:14:39', 1, 1),
(115, 21, 'Not Started', '2022-12-05 10:14:39', '2022-12-05 10:17:55', '2022-12-05 10:17:55', 1, 1),
(116, 21, 'Not Started', '2022-12-05 10:17:55', '2022-12-05 10:17:55', NULL, 1, 1),
(117, 20, 'Not Started', '2022-12-05 10:25:05', '2022-12-05 10:29:57', '2022-12-05 10:29:57', 1, 1),
(118, 20, 'Not Started', '2022-12-05 10:29:57', '2022-12-05 10:30:49', '2022-12-05 10:30:49', 1, 1),
(119, 20, 'Not Started', '2022-12-05 10:30:49', '2022-12-05 10:30:49', NULL, 1, 1),
(120, 17, 'Not Started', '2022-12-05 10:32:13', '2022-12-05 10:32:53', '2022-12-05 10:32:53', 1, 1),
(121, 17, 'Not Started', '2022-12-05 10:32:53', '2022-12-05 10:35:10', '2022-12-05 10:35:10', 1, 1),
(122, 17, 'Not Started', '2022-12-05 10:35:10', '2022-12-05 10:35:10', NULL, 1, 1),
(123, 7, 'Not Started', '2022-12-05 10:36:33', '2022-12-05 10:36:51', '2022-12-05 10:36:51', 1, 1),
(124, 7, 'Not Started', '2022-12-05 10:36:51', '2022-12-05 10:36:51', NULL, 1, 1),
(125, 31, 'Active', '2022-12-06 02:01:34', '2022-12-06 02:01:34', NULL, 1, 1),
(126, 1, 'Completed', '2023-01-09 06:53:06', '2023-01-09 06:54:00', '2023-01-09 06:54:00', 1, 1),
(127, 1, 'Completed', '2023-01-09 06:54:00', '2023-01-09 06:56:47', '2023-01-09 06:56:47', 1, 1),
(128, 1, 'Completed', '2023-01-09 06:56:47', '2023-01-09 06:59:45', '2023-01-09 06:59:45', 1, 1),
(129, 1, 'Completed', '2023-01-09 06:59:45', '2023-01-09 07:00:09', '2023-01-09 07:00:09', 1, 1),
(130, 1, 'Completed', '2023-01-09 07:00:09', '2023-01-09 07:09:29', '2023-01-09 07:09:29', 1, 1),
(131, 1, 'Completed', '2023-01-09 07:09:29', '2023-01-09 07:09:29', NULL, 1, 1),
(132, 6, 'Not Started', '2023-01-09 07:27:25', '2023-01-09 07:27:57', '2023-01-09 07:27:57', 1, 1),
(133, 6, 'Not Started', '2023-01-09 07:27:57', '2023-01-09 07:28:53', '2023-01-09 07:28:53', 1, 1),
(134, 6, 'Active', '2023-01-09 07:28:53', '2023-01-09 07:34:24', '2023-01-09 07:34:24', 1, 1),
(135, 6, 'Active', '2023-01-09 07:34:24', '2023-01-09 07:36:34', '2023-01-09 07:36:34', 1, 1),
(136, 6, 'Active', '2023-01-09 07:36:34', '2023-01-09 07:43:52', '2023-01-09 07:43:52', 1, 1),
(137, 6, 'Active', '2023-01-09 07:43:52', '2023-01-09 07:45:13', '2023-01-09 07:45:13', 1, 1),
(138, 6, 'Completed', '2023-01-09 07:45:13', '2023-01-09 07:52:33', '2023-01-09 07:52:33', 1, 1),
(139, 6, 'Completed', '2023-01-09 07:52:33', '2023-01-09 07:52:33', NULL, 1, 1),
(140, 5, 'Not Started', '2023-01-09 07:56:09', '2023-01-09 07:56:43', '2023-01-09 07:56:43', 1, 1),
(141, 5, 'Completed', '2023-01-09 07:56:43', '2023-01-09 07:58:09', '2023-01-09 07:58:09', 1, 1),
(142, 5, 'Completed', '2023-01-09 07:58:09', '2023-01-09 07:59:15', '2023-01-09 07:59:15', 1, 1),
(143, 5, 'Completed', '2023-01-09 07:59:15', '2023-01-09 07:59:56', '2023-01-09 07:59:56', 1, 1),
(144, 5, 'Active', '2023-01-09 07:59:56', '2023-01-09 07:59:56', NULL, 1, 1),
(145, 4, 'Active', '2023-01-09 08:06:25', '2023-01-09 08:06:43', '2023-01-09 08:06:43', 1, 1),
(146, 4, 'Active', '2023-01-09 08:06:43', '2023-01-09 08:07:27', '2023-01-09 08:07:27', 1, 1),
(147, 4, 'Active', '2023-01-09 08:07:28', '2023-01-09 08:08:03', '2023-01-09 08:08:03', 1, 1),
(148, 4, 'Active', '2023-01-09 08:08:03', '2023-01-09 08:08:35', '2023-01-09 08:08:35', 1, 1),
(149, 4, 'Active', '2023-01-09 08:08:35', '2023-01-09 08:11:00', '2023-01-09 08:11:00', 1, 1),
(150, 4, 'Active', '2023-01-09 08:11:00', '2023-01-09 08:12:12', '2023-01-09 08:12:12', 1, 1),
(151, 4, 'Active', '2023-01-09 08:12:12', '2023-01-09 08:13:37', '2023-01-09 08:13:37', 1, 1),
(152, 4, 'Active', '2023-01-09 08:13:37', '2023-01-09 08:34:53', '2023-01-09 08:34:53', 1, 1),
(153, 4, 'Active', '2023-01-09 08:34:53', '2023-01-09 08:34:53', NULL, 1, 1),
(154, 18, 'Active', '2023-01-11 09:14:35', '2023-01-11 09:14:35', NULL, 1, 1),
(155, 32, 'Not Started', '2023-02-23 06:16:03', '2023-02-23 06:16:03', NULL, 1, 1),
(156, 33, 'Not Started', '2023-02-23 06:18:33', '2023-02-23 06:18:33', NULL, 1, 1),
(157, 34, 'Not Started', '2023-02-23 06:21:18', '2023-02-23 09:35:40', '2023-02-23 09:35:40', 1, 1),
(158, 34, 'Not Started', '2023-02-23 09:35:40', '2023-02-23 09:37:01', '2023-02-23 09:37:01', 1, 1),
(159, 34, 'Not Started', '2023-02-23 09:37:01', '2023-02-23 09:45:49', '2023-02-23 09:45:49', 1, 1),
(160, 34, 'Not Started', '2023-02-23 09:45:49', '2023-02-23 09:55:32', '2023-02-23 09:55:32', 1, 1),
(161, 34, 'Not Started', '2023-02-23 09:55:32', '2023-02-23 09:58:44', '2023-02-23 09:58:44', 1, 1),
(162, 34, 'Active', '2023-02-23 09:58:44', '2023-02-27 09:34:42', '2023-02-27 09:34:42', 1, 1),
(163, 34, 'Active', '2023-02-27 09:34:42', '2023-02-27 09:50:29', '2023-02-27 09:50:29', 1, 1),
(164, 34, 'Active', '2023-02-27 09:50:29', '2023-02-27 09:51:15', '2023-02-27 09:51:15', 1, 1),
(165, 34, 'Active', '2023-02-27 09:51:15', '2023-02-27 09:54:33', '2023-02-27 09:54:33', 1, 1),
(166, 34, 'Active', '2023-02-27 09:54:33', '2023-03-07 02:51:30', '2023-03-07 02:51:30', 1, 1),
(167, 23, 'Active', '2023-02-28 03:42:14', '2023-02-28 03:42:53', '2023-02-28 03:42:53', 1, 1),
(168, 23, 'Active', '2023-02-28 03:42:53', '2023-02-28 09:48:37', '2023-02-28 09:48:37', 1, 1),
(169, 23, 'Active', '2023-02-28 09:48:37', '2023-02-28 09:48:37', NULL, 1, 1),
(170, 34, 'Active', '2023-03-07 02:51:30', '2023-03-07 02:51:30', NULL, 1, 1),
(171, 35, 'Not Started', '2023-03-08 08:34:03', '2023-03-08 08:34:03', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_team_assign`
--

CREATE TABLE `campaign_team_assign` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campaign_team_assign`
--

INSERT INTO `campaign_team_assign` (`id`, `campaign_id`, `team_id`, `created_at`, `created_by`, `deleted_at`, `updated_at`, `updated_by`) VALUES
(1, 23, 1, '2022-11-21 06:56:01', 1, '2022-11-21 02:56:01', '2022-11-21 02:56:01', 1),
(2, 23, 1, '2022-11-21 06:56:18', 1, '2022-11-21 02:56:18', '2022-11-21 02:56:18', 1),
(3, 23, 2, '2022-11-21 06:56:18', 1, '2022-11-21 02:56:18', '2022-11-21 02:56:18', 1),
(4, 23, 2, '2022-11-21 08:49:24', 1, '2022-11-21 02:56:18', '2022-11-21 02:56:43', 1),
(5, 23, 1, '2022-11-21 02:57:20', 1, NULL, '2022-11-21 02:57:20', 1),
(6, 1, 2, '2022-11-21 08:51:29', 1, '2022-11-21 04:51:29', '2022-11-21 04:51:29', 1),
(7, 34, 1, '2023-02-28 07:46:49', 1, '2023-02-28 03:46:49', '2023-02-28 03:46:49', 1),
(8, 34, 2, '2023-02-28 03:46:49', 1, NULL, '2023-02-28 03:46:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `client_handler` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `type`, `email`, `number`, `location`, `client_handler`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Rayqube', 'Direct', 'rayqube@mail.com', '12345', 'Dubai JLT', 3, 'Active', '2022-08-12 07:28:58', '2022-08-12 07:28:58', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contractor`
--

CREATE TABLE `contractor` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `defect_monitoring`
--

CREATE TABLE `defect_monitoring` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `video_path` varchar(550) DEFAULT NULL,
  `photo_path` varchar(550) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `fixed_at` timestamp NULL DEFAULT NULL,
  `fixed_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `defect_monitoring`
--

INSERT INTO `defect_monitoring` (`id`, `description`, `campaign_id`, `video_path`, `photo_path`, `asset_id`, `location_id`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `fixed_at`, `fixed_by`) VALUES
(1, NULL, NULL, NULL, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/defect_tracking/274-2742751_1-mb-image-download.jpg', 2, 2, 'Active', '2022-10-18 11:45:28', '2022-10-18 11:45:28', 2, 2, NULL, NULL),
(2, NULL, 30, NULL, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/defect_tracking/1665755933921.jfif', 3, 2, 'Active', '2022-10-18 12:13:22', '2022-10-18 12:13:22', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'Outdoor', 'Active', '2022-08-12 07:32:14', '2022-08-12 07:32:14', NULL, 1, 1, NULL),
(2, 'Metro', 'Active', '2022-08-12 07:32:39', '2022-08-12 07:32:39', NULL, 1, 1, NULL),
(3, 'InMall', 'Active', '2022-08-12 07:32:54', '2022-08-12 07:32:54', NULL, 1, 1, NULL),
(4, 'InStore', 'Active', '2022-08-12 07:33:12', '2022-08-12 07:33:12', NULL, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `building_name` varchar(250) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `area` varchar(250) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `near_by_landmark` varchar(500) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `building_name`, `street`, `area`, `city`, `country`, `near_by_landmark`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 'G11 - Etisalat', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(3, 'G12 - Al Qusais', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(4, 'G13 - Dubai Airport Freezone', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(5, 'G14 - Al Nahda', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(6, 'G15 - Stadium', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(7, 'G16 - Al Qiyadah', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(8, 'G17 - Abu Hail', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(9, 'G18 - Abu Baker Al Siddique', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(10, 'G21 - Baniyas Square', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(11, 'G22 - Palm Deira', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(12, 'G25 - Sharaf DG', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(13, 'G27 - Oud Metha', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(14, 'G28 - Dubai Healthcare City', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(15, 'G29 - Jadaf', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(16, 'G30 - Creek', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(17, 'R11 - Centerpoint', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(18, 'R12 - Emirates', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(19, 'R13 - Airport T3', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(20, 'R14 - Airport T1', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(21, 'R15 - GGICO', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(22, 'R16 - Deira City Centre', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(23, 'R17 - Al Rigga', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(24, 'R18 - Union Square', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(25, 'R20 - ADCB', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(26, 'R21 - Max', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(27, 'R22 - World Trade Centre', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(28, 'R23 - Emirates Towers', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(29, 'R24 - Financial Centre', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(30, 'R25 - Burj Khalifa/Dubai Mall', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(31, 'R26 - Business Bay', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(32, 'R29 - Al Safa', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(33, 'R31 - Umm Al Sheif', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(34, 'R32 - Mall of Emirates', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(35, 'R33 - Mashreq', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(36, 'R34 - Dubai Internet City', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(37, 'R35 - Al Khail', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(38, 'R36 - Sobha', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(39, 'R37 - DMCC', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(40, 'R38 - Jabel Ali', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(41, 'R39  -Ibn Battuta', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(42, 'R40 - Energy', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(43, 'R41 - Danube', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(44, 'R42 - UAE Exchange', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(45, 'G23 - Al Ras', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(46, 'G24 - Al Ghubaiba', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(47, 'R19 - Burjuman', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(48, 'DIP', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(49, 'EEP 2a', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(50, 'EEP 5a', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(51, 'EEP 6a', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(52, 'EEP 8a', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(53, 'EEP 10a', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(54, 'EEP 11a', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(55, 'EEP 12a', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(57, 'G19 - Salah Al Din', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(61, 'R32 - MOE', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(62, 'R34 - DIC', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(64, 'R74 - DIP', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(65, 'R73 - Jumeirah Golf', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(66, 'Discovery Gardens', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(67, 'R72 - Al Furjan', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(68, 'R70 - Gardens', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(69, 'R71 - Discovery Gardens', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(70, 'Between Danube-Energy', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(71, 'Between Mashreq-MOE', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(72, 'Near MOE', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(73, 'Near Umm Al Sheif', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(74, 'Between Umm Al Sheif-Al Safa', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(75, 'Near Al Safa', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(76, 'Between Al Safa-BSB', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(77, 'Between BSB-BJK', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(78, 'Near DIFC', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(79, 'Between EMT-WTC', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(80, 'Near WTC', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(81, 'Near ADCB', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(82, 'Near Oud Metha', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(83, 'Between oud metha-Health Car', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(84, 'Near Al Jadaf', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(85, 'Near Abu Baker al Sadeek', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(86, 'Between Abu Baker-Abu Hail', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(87, 'Between Stadium-Al Qiyadah', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(88, 'Between Energy-IBN', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(89, 'Between Stadium-Al Nahda', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(90, 'Expo Station', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(91, 'Between IBN-Jabel Ali', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(92, 'Between Jabel Ali-DMCC', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(93, 'Between DMCC-Shoba', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(94, 'After Sobha', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(95, 'Between Nakheel-DIC', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(96, 'Between DIC-Mashreq', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(97, 'G20 - Union Square', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(100, 'R31 - Equiti', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(101, 'TPS 20', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(102, 'TPS 22', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(103, 'The Massive', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(104, 'The G7 Psdeal', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(105, 'Da Vinci', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(106, 'Van Gohh', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(107, 'Monet', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(108, 'Frida', '', '', '', 'Dubai', 'UAE', '', 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 1),
(11, 'App\\Models\\User', 4),
(15, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Level1', 'web', '2021-12-08 08:36:48', '2022-08-09 01:39:46'),
(2, 'Level2', 'web', '2021-12-08 09:06:01', '2022-08-09 01:39:54'),
(3, 'Level3', 'web', '2022-06-08 03:25:27', '2022-08-09 01:40:02'),
(4, 'Level4', 'web', '2022-06-29 08:26:59', '2022-08-09 01:40:11'),
(5, 'Level5', 'web', '2022-08-09 01:40:28', '2022-08-09 01:40:28'),
(6, 'Level6', 'web', '2022-08-09 01:40:35', '2022-08-09 01:40:35'),
(7, 'Level7', 'web', '2022-08-09 02:19:07', '2022-08-09 02:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `proof_pictures`
--

CREATE TABLE `proof_pictures` (
  `id` int(11) NOT NULL,
  `campaign_proof_id` int(11) NOT NULL,
  `image` varchar(250) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proof_pictures`
--

INSERT INTO `proof_pictures` (`id`, `campaign_proof_id`, `image`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/24_pico-img.jpg.jpg', '2022-11-09 11:20:34', '2022-11-09 11:20:34', 2, 2),
(2, 1, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/40_V-01.png.png', '2022-11-09 11:20:34', '2022-11-09 11:20:34', 2, 2),
(3, 1, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/40_V-03.png.png', '2022-11-09 11:20:34', '2022-11-09 11:20:34', 2, 2),
(4, 2, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Color Palette.png.png', '2022-11-16 13:20:56', '2022-11-16 13:20:56', 1, 1),
(5, 3, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/274-2742751_1-mb-image-download.jpg.jpg', '2022-11-22 08:01:26', '2022-11-22 08:01:26', 1, 1),
(6, 3, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Planet9_3840x2160.jpg.jpg', '2022-11-22 08:01:31', '2022-11-22 08:01:31', 1, 1),
(7, 3, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/sample1.jpg.jpg', '2022-11-22 08:01:33', '2022-11-22 08:01:33', 1, 1),
(9, 5, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/WHEEL-1.png.png', '2023-01-03 10:34:32', '2023-01-03 10:34:32', 3, 3),
(10, 6, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/WHEEL-1.png.png', '2023-01-05 12:18:18', '2023-01-05 12:18:18', 3, 3),
(11, 7, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/WHEEL-3.png.png', '2023-01-05 12:18:48', '2023-01-05 12:18:48', 3, 3),
(12, 8, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/person.jpg.jpg', '2023-01-09 08:11:12', '2023-01-09 08:11:12', 1, 1),
(13, 9, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 08:30:01', '2023-01-09 08:30:01', 1, 1),
(14, 10, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 08:30:42', '2023-01-09 08:30:42', 1, 1),
(15, 11, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 09:59:27', '2023-01-09 09:59:27', 1, 1),
(16, 12, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 10:03:37', '2023-01-09 10:03:37', 1, 1),
(17, 13, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 10:04:53', '2023-01-09 10:04:53', 1, 1),
(18, 14, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 10:05:49', '2023-01-09 10:05:49', 1, 1),
(19, 15, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 10:06:04', '2023-01-09 10:06:04', 1, 1),
(20, 16, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 10:29:43', '2023-01-09 10:29:43', 1, 1),
(21, 17, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 10:52:53', '2023-01-09 10:52:53', 1, 1),
(22, 18, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:02:09', '2023-01-09 11:02:09', 1, 1),
(23, 19, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:05:11', '2023-01-09 11:05:11', 1, 1),
(24, 20, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:05:12', '2023-01-09 11:05:12', 1, 1),
(25, 21, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:06:29', '2023-01-09 11:06:29', 1, 1),
(26, 22, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:08:12', '2023-01-09 11:08:12', 1, 1),
(27, 23, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:09:00', '2023-01-09 11:09:00', 1, 1),
(28, 24, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:09:12', '2023-01-09 11:09:12', 1, 1),
(29, 25, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:20:57', '2023-01-09 11:20:57', 1, 1),
(30, 26, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:28:21', '2023-01-09 11:28:21', 1, 1),
(31, 27, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:41:50', '2023-01-09 11:41:50', 1, 1),
(32, 28, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:43:15', '2023-01-09 11:43:15', 1, 1),
(33, 29, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:44:05', '2023-01-09 11:44:05', 1, 1),
(34, 30, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:44:21', '2023-01-09 11:44:21', 1, 1),
(35, 31, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:56:17', '2023-01-09 11:56:17', 1, 1),
(36, 32, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:58:31', '2023-01-09 11:58:31', 1, 1),
(37, 33, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 11:58:53', '2023-01-09 11:58:53', 1, 1),
(38, 34, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 12:01:09', '2023-01-09 12:01:09', 1, 1),
(39, 35, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 12:07:37', '2023-01-09 12:07:37', 1, 1),
(40, 36, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 12:11:28', '2023-01-09 12:11:28', 1, 1),
(41, 37, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 12:13:03', '2023-01-09 12:13:03', 1, 1),
(42, 38, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 12:13:03', '2023-01-09 12:13:03', 1, 1),
(43, 39, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 12:34:14', '2023-01-09 12:34:14', 1, 1),
(44, 40, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/Screenshot_20230105_122953.png.png', '2023-01-09 12:34:22', '2023-01-09 12:34:22', 1, 1),
(45, 41, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2910500854.png.png', '2023-01-11 06:35:11', '2023-01-11 06:35:11', 1, 1),
(46, 42, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2910500854.png.png', '2023-01-11 06:46:14', '2023-01-11 06:46:14', 1, 1),
(47, 43, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29105d1460.png.png', '2023-01-11 11:47:20', '2023-01-11 11:47:20', 1, 1),
(48, 43, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29578aa4ff.png.png', '2023-01-11 11:47:21', '2023-01-11 11:47:21', 1, 1),
(49, 43, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2957826d9f.png.png', '2023-01-11 11:47:21', '2023-01-11 11:47:21', 1, 1),
(50, 44, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2910492750.png.png', '2023-01-11 11:47:38', '2023-01-11 11:47:38', 1, 1),
(51, 44, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2910500854.png.png', '2023-01-11 11:47:38', '2023-01-11 11:47:38', 1, 1),
(52, 45, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b28c7a6646d.png.png', '2023-01-11 13:06:01', '2023-01-11 13:06:01', 1, 1),
(53, 45, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29105d1460.png.png', '2023-01-11 13:06:02', '2023-01-11 13:06:02', 1, 1),
(54, 45, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29578aa4ff.png.png', '2023-01-11 13:06:02', '2023-01-11 13:06:02', 1, 1),
(55, 45, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2957826d9f.png.png', '2023-01-11 13:06:03', '2023-01-11 13:06:03', 1, 1),
(56, 45, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2957911bea.png.png', '2023-01-11 13:06:03', '2023-01-11 13:06:03', 1, 1),
(57, 45, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29680811db.png.png', '2023-01-11 13:06:03', '2023-01-11 13:06:03', 1, 1),
(58, 45, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2910492750.png.png', '2023-01-11 13:06:04', '2023-01-11 13:06:04', 1, 1),
(59, 46, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b28c7a6646d.png.png', '2023-01-11 13:15:41', '2023-01-11 13:15:41', 1, 1),
(60, 46, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29105d1460.png.png', '2023-01-11 13:15:42', '2023-01-11 13:15:42', 1, 1),
(61, 46, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29578aa4ff.png.png', '2023-01-11 13:15:42', '2023-01-11 13:15:42', 1, 1),
(62, 46, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2957826d9f.png.png', '2023-01-11 13:15:43', '2023-01-11 13:15:43', 1, 1),
(63, 46, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2957911bea.png.png', '2023-01-11 13:15:43', '2023-01-11 13:15:43', 1, 1),
(64, 46, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29680811db.png.png', '2023-01-11 13:15:43', '2023-01-11 13:15:43', 1, 1),
(65, 46, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2910492750.png.png', '2023-01-11 13:15:44', '2023-01-11 13:15:44', 1, 1),
(66, 47, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b29680811db.png.png', '2023-01-11 13:22:41', '2023-01-11 13:22:41', 1, 1),
(67, 47, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/63b2910500854.png.png', '2023-01-11 13:22:42', '2023-01-11 13:22:42', 1, 1),
(68, 48, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/_1672231588.png.png', '2023-01-12 07:30:53', '2023-01-12 07:30:53', 1, 1),
(69, 48, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/_1672231613.png.png', '2023-01-12 07:30:53', '2023-01-12 07:30:53', 1, 1),
(70, 48, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/_1672231658.png.png', '2023-01-12 07:30:53', '2023-01-12 07:30:53', 1, 1),
(71, 48, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/_1672231666.png.png', '2023-01-12 07:30:54', '2023-01-12 07:30:54', 1, 1),
(72, 48, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/proof_pictures/_1672231693.png.png', '2023-01-12 07:30:54', '2023-01-12 07:30:54', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin1', 'web', '2021-12-08 09:10:28', '2022-08-09 01:44:24'),
(2, 'Admin2', 'web', '2021-12-08 09:15:19', '2022-08-09 01:44:35'),
(3, 'Director', 'web', '2021-12-08 10:17:13', '2022-08-09 01:44:50'),
(4, 'Manager', 'web', '2022-06-08 03:00:03', '2022-08-09 01:45:06'),
(5, 'Specialist', 'web', '2022-08-09 01:45:35', '2022-08-09 01:45:35'),
(6, 'O&M Director', 'web', '2022-08-09 02:13:59', '2022-08-09 02:13:59'),
(7, 'O&M Manager', 'web', '2022-08-09 02:14:30', '2022-08-09 02:14:30'),
(8, 'O&M Coordinator', 'web', '2022-08-09 02:15:22', '2022-08-09 02:15:22'),
(9, 'InMall Director', 'web', '2022-08-09 02:15:52', '2022-08-09 02:15:52'),
(10, 'InMall Manager', 'web', '2022-08-09 02:16:23', '2022-08-09 02:16:23'),
(11, 'InMall Coordinator', 'web', '2022-08-09 02:16:48', '2022-08-09 02:16:48'),
(12, 'InStore Director', 'web', '2022-08-09 02:18:07', '2022-08-09 02:18:07'),
(13, 'InStore Manager', 'web', '2022-08-09 02:18:21', '2022-08-09 02:18:21'),
(14, 'InStore Coordinator', 'web', '2022-08-09 02:18:38', '2022-08-09 02:18:38'),
(15, 'Driver', 'web', '2022-08-09 02:19:20', '2022-08-09 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(5, 6),
(5, 9),
(5, 12),
(6, 7),
(6, 8),
(6, 10),
(6, 11),
(6, 13),
(6, 14),
(7, 15);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(350) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `supervisor_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`) VALUES
(1, 'Installation', 3, '2022-11-17 07:12:45', '2022-11-17 07:12:45', NULL, 1, 1),
(2, 'Maintenance', 1, '2022-11-17 07:13:03', '2022-11-17 07:13:03', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `team_id`, `member_id`) VALUES
(1, 1, 3),
(2, 1, 2),
(3, 2, 1),
(4, 2, 4),
(5, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin2', 'admin2@mail.com', NULL, 'bfd59291e825b5f2bbf1eb76569f8fe7', 'Active', NULL, '2022-05-25 07:44:27', '2022-08-09 03:11:54'),
(2, 'Test Driver', 'driver@mail.com', NULL, 'bfd59291e825b5f2bbf1eb76569f8fe7', 'Active', NULL, '2022-06-27 04:46:32', '2022-10-18 10:17:37'),
(3, 'Admin1', 'admin@mail.com', NULL, 'bfd59291e825b5f2bbf1eb76569f8fe7', 'Active', NULL, '2022-08-09 03:12:31', '2022-08-09 03:12:31'),
(4, 'InMall Coordinator User', 'mallcoordinator@mail.com', NULL, 'bfd59291e825b5f2bbf1eb76569f8fe7', 'Active', NULL, '2022-08-09 04:10:05', '2022-08-09 04:10:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ref_no` (`ref_no`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `asset_in_network`
--
ALTER TABLE `asset_in_network`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_network`
--
ALTER TABLE `asset_network`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_status`
--
ALTER TABLE `asset_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_assign`
--
ALTER TABLE `campaign_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_buckets`
--
ALTER TABLE `campaign_buckets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_installations`
--
ALTER TABLE `campaign_installations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `campaign_installations_designs`
--
ALTER TABLE `campaign_installations_designs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`),
  ADD KEY `installation_id` (`installation_id`);

--
-- Indexes for table `campaign_installation_assign`
--
ALTER TABLE `campaign_installation_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_monitoring`
--
ALTER TABLE `campaign_monitoring`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_permits`
--
ALTER TABLE `campaign_permits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_proof`
--
ALTER TABLE `campaign_proof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `campaign_status`
--
ALTER TABLE `campaign_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_team_assign`
--
ALTER TABLE `campaign_team_assign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contractor`
--
ALTER TABLE `contractor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `defect_monitoring`
--
ALTER TABLE `defect_monitoring`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `proof_pictures`
--
ALTER TABLE `proof_pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1208;

--
-- AUTO_INCREMENT for table `asset_in_network`
--
ALTER TABLE `asset_in_network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_network`
--
ALTER TABLE `asset_network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_status`
--
ALTER TABLE `asset_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `campaign_assign`
--
ALTER TABLE `campaign_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `campaign_buckets`
--
ALTER TABLE `campaign_buckets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `campaign_installations`
--
ALTER TABLE `campaign_installations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_installations_designs`
--
ALTER TABLE `campaign_installations_designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_installation_assign`
--
ALTER TABLE `campaign_installation_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_monitoring`
--
ALTER TABLE `campaign_monitoring`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `campaign_permits`
--
ALTER TABLE `campaign_permits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaign_proof`
--
ALTER TABLE `campaign_proof`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `campaign_status`
--
ALTER TABLE `campaign_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `campaign_team_assign`
--
ALTER TABLE `campaign_team_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contractor`
--
ALTER TABLE `contractor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `defect_monitoring`
--
ALTER TABLE `defect_monitoring`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `proof_pictures`
--
ALTER TABLE `proof_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
