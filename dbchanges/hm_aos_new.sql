-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2022 at 11:00 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hm_aos_new`
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
  `status` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `department_id`, `ref_no`, `name`, `type`, `location_id`, `owned_by`, `asset_photo`, `description`, `installation_time`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'abc123', 'PC screen', 'static', 1, 'Hypermedia', 'asset_photo/abc123-PC screen29-06-2022-09-51-33', 'This is a pc', '217860', 'Active', '2022-06-08 05:19:23', '2022-08-04 04:06:38', 1, 1),
(2, NULL, 'abc1234', 'another pc', 'static', 1, '', NULL, 'Another pc', '122400', 'Active', '2022-06-08 05:19:49', '2022-06-09 08:49:45', 1, 1),
(3, NULL, 'abc123wrew', 'ewrf', 'static', 2, '', NULL, 'wefwef', '36000', 'Active', '2022-06-08 09:52:31', '2022-06-09 08:49:57', 1, 1),
(4, 1, '11223', 'LCD', 'static', 1, '', NULL, 'TEST LCD', '43200', 'Active', '2022-06-21 07:39:00', '2022-06-21 07:39:00', 1, 1),
(5, 1, 'adds2211', 'test', 'static', 1, '', 'asset_photo/DD6Irlme4bVCP0p1cserqe9k6BojfWgc72sQquDZ.png', 'ddd', '217860', 'Active', '2022-06-29 05:47:12', '2022-06-29 05:49:36', 1, 1),
(6, 1, 's3rr', 'admin testss', 'digital', 1, '', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/image/qOTnVjT4xcnNR5FB9txfoqUz6CewgFttdWnhOTVH.png', 'ss', '217860', 'Active', '2022-07-06 04:30:55', '2022-07-06 04:30:55', 1, 1);

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

--
-- Dumping data for table `asset_in_network`
--

INSERT INTO `asset_in_network` (`id`, `asset_id`, `network_id`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `deleted_by`) VALUES
(2, 1, 1, '2022-06-08 10:42:19', '2022-06-08 09:51:28', 1, 1, '2022-06-08 09:51:28', NULL),
(3, 1, 3, '2022-06-08 09:51:28', '2022-06-08 09:51:28', 1, 1, NULL, NULL),
(4, 3, 3, '2022-06-08 09:53:48', '2022-06-08 09:54:01', 1, 1, '2022-06-08 09:54:01', NULL),
(5, 3, 1, '2022-06-08 09:54:01', '2022-06-09 03:28:06', 1, 1, '2022-06-09 03:28:06', NULL),
(6, 2, 1, '2022-06-09 03:27:53', '2022-06-09 03:27:56', 1, 1, '2022-06-09 03:27:56', NULL),
(7, 2, 1, '2022-06-09 03:28:00', '2022-06-09 03:28:00', 1, 1, NULL, NULL),
(8, 3, 1, '2022-06-09 03:28:10', '2022-06-09 03:28:10', 1, 1, NULL, NULL),
(9, 4, 4, '2022-07-04 07:13:38', '2022-07-04 07:13:51', 1, 1, '2022-07-04 07:13:51', NULL);

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

--
-- Dumping data for table `asset_network`
--

INSERT INTO `asset_network` (`id`, `name`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `deleted_by`) VALUES
(1, 'admin testy', 'Active', '2022-06-08 05:55:33', '2022-06-08 05:55:33', 1, 1, NULL, NULL),
(2, 'Admin', 'Inactive', '2022-06-08 05:55:43', '2022-06-08 05:55:43', 1, 1, NULL, NULL),
(3, 'test', 'Active', '2022-06-08 08:11:20', '2022-06-08 08:11:20', 1, 1, NULL, NULL),
(4, 'meeting', 'Active', '2022-07-04 07:13:28', '2022-07-04 07:13:28', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_status`
--

CREATE TABLE `asset_status` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `from_date` timestamp NULL DEFAULT NULL,
  `to_date` timestamp NULL DEFAULT NULL,
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
(1, 2, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'New', 'Booked', '2022-06-23 03:39:32', 1, '2022-06-23 03:40:47', 1, '2022-06-23 03:40:47', NULL),
(2, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'New', 'Booked', '2022-06-23 03:39:32', 1, '2022-06-23 03:40:47', 1, '2022-06-23 03:40:47', NULL),
(3, 2, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-23 03:40:47', 1, '2022-06-23 03:40:57', 1, '2022-06-23 03:40:57', NULL),
(4, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-23 03:40:47', 1, '2022-06-23 03:40:57', 1, '2022-06-23 03:40:57', NULL),
(5, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-06-23 03:40:47', 1, '2022-06-23 03:40:57', 1, '2022-06-23 03:40:57', NULL),
(6, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-23 03:40:57', 1, '2022-06-23 03:42:26', 1, '2022-06-23 03:42:26', NULL),
(7, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-06-23 03:40:57', 1, '2022-06-23 03:42:26', 1, '2022-06-23 03:42:26', NULL),
(8, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-23 03:42:26', 1, '2022-06-23 03:45:25', 1, '2022-06-23 03:45:25', NULL),
(9, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-06-23 03:42:26', 1, '2022-06-23 03:45:25', 1, '2022-06-23 03:45:25', NULL),
(10, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-23 03:45:25', 1, '2022-06-23 04:41:01', 1, '2022-06-23 04:41:01', NULL),
(11, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-06-23 03:45:25', 1, '2022-06-23 04:41:01', 1, '2022-06-23 04:41:01', NULL),
(12, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-06-23 03:45:25', 1, '2022-06-23 04:41:01', 1, '2022-06-23 04:41:01', NULL),
(13, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-23 04:41:01', 1, '2022-06-24 07:47:54', 1, '2022-06-24 07:47:54', NULL),
(14, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-06-23 04:41:01', 1, '2022-06-24 07:47:54', 1, '2022-06-24 07:47:54', NULL),
(15, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-24 07:47:54', 1, '2022-06-30 09:07:26', 1, '2022-06-30 09:07:26', NULL),
(16, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-06-24 07:47:54', 1, '2022-06-30 09:07:26', 1, '2022-06-30 09:07:26', NULL),
(17, 1, 2, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-27 04:03:25', 1, '2022-06-27 04:05:36', 1, '2022-06-27 04:05:36', NULL),
(18, 1, 2, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-27 04:05:36', 1, '2022-06-30 09:07:46', 1, '2022-06-30 09:07:46', NULL),
(19, 5, NULL, NULL, NULL, NULL, 'Available', '2022-06-29 05:47:12', 1, '2022-06-29 05:47:12', 1, NULL, NULL),
(20, 5, NULL, '2022-06-29 05:47:12', NULL, 'New', 'Available', '2022-06-29 05:47:12', 1, '2022-06-29 05:47:12', 1, NULL, NULL),
(21, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-30 09:07:26', 1, '2022-07-04 04:28:09', 1, '2022-07-04 04:28:09', NULL),
(22, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-06-30 09:07:26', 1, '2022-07-04 04:28:09', 1, '2022-07-04 04:28:09', NULL),
(23, 1, 2, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-06-30 09:07:46', 1, '2022-07-04 07:24:57', 1, '2022-07-04 07:24:57', NULL),
(24, 3, NULL, '2022-07-04 04:28:09', NULL, 'New', 'Available', '2022-07-04 04:28:09', 1, '2022-07-04 04:35:00', 1, '2022-07-04 04:35:00', NULL),
(25, 4, NULL, '2022-07-04 04:28:09', NULL, 'New', 'Available', '2022-07-04 04:28:09', 1, '2022-07-04 04:35:00', 1, '2022-07-04 04:35:00', NULL),
(26, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-07-04 04:29:09', 1, '2022-07-04 04:34:30', 1, '2022-07-04 04:34:30', NULL),
(27, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-07-04 04:29:09', 1, '2022-07-04 04:34:30', 1, '2022-07-04 04:34:30', NULL),
(28, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-07-04 04:34:30', 1, '2022-07-04 04:35:00', 1, '2022-07-04 04:35:00', NULL),
(29, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-07-04 04:34:30', 1, '2022-07-04 04:35:00', 1, '2022-07-04 04:35:00', NULL),
(30, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-07-04 04:35:00', 1, '2022-07-04 04:35:17', 1, '2022-07-04 04:35:17', NULL),
(31, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-07-04 04:35:00', 1, '2022-07-04 04:35:17', 1, '2022-07-04 04:35:17', NULL),
(32, 3, 1, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-07-04 04:35:17', 1, '2022-07-04 07:32:11', 1, '2022-07-04 07:32:11', NULL),
(33, 4, 1, '2020-11-12 19:59:59', '2022-12-10 20:00:00', 'Update', 'Booked', '2022-07-04 04:35:17', 1, '2022-07-13 07:51:24', 1, '2022-07-13 07:51:24', NULL),
(34, 1, 2, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'Update', 'Booked', '2022-07-04 07:24:57', 1, '2022-07-04 07:24:57', 1, NULL, NULL),
(35, 2, 3, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'New', 'Booked', '2022-07-04 07:32:11', 1, '2022-07-04 07:32:11', 1, NULL, NULL),
(36, 3, 3, '2022-12-12 19:59:59', '2022-12-13 20:00:00', 'New', 'Booked', '2022-07-04 07:32:11', 1, '2022-07-04 07:32:11', 1, NULL, NULL),
(37, 6, NULL, NULL, NULL, NULL, 'Available', '2022-07-06 04:30:55', 1, '2022-07-06 04:30:55', 1, NULL, NULL),
(38, 6, NULL, '2022-07-06 04:30:55', NULL, 'New', 'Available', '2022-07-06 04:30:55', 1, '2022-07-06 04:30:55', 1, NULL, NULL),
(39, 4, 1, '2020-11-12 23:59:59', '2022-12-11 00:00:00', 'Update', 'Booked', '2022-07-13 07:51:27', 1, '2022-07-22 12:41:24', 1, '2022-07-22 12:41:24', NULL),
(40, 4, 1, '2020-11-12 23:59:59', '2022-12-11 00:00:00', 'Update', 'Booked', '2022-07-22 12:41:26', 1, '2022-07-22 12:41:26', 1, NULL, NULL);

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
(1, 'Admin', 'New', 'digital', '1', NULL, 1, 'UAE', NULL, 'dee333', 'srfw3442432', 'test', '2020-11-12', '14:30:00', '2023-07-04', '14:30:00', 'Confirmed', 'Completed', 'In Progress', 'Not Started', '2022-06-23 03:39:32', '2022-07-22 12:41:23', NULL, 1, 1, NULL, NULL),
(2, 'admin test', 'New', NULL, '1', 'Coke', NULL, 'UAE', 'booking_order_file/jTGwNpA3ZXe6qNSFno6VyEhoCA5LgZMZFjpd4f75.pdf', 'dee333', 'srfw3442432', 'jj', '2022-11-04', '14:30:00', '2022-12-14', '11:21:00', 'Confirmed', 'Pending', 'Type it here', 'Active', '2022-06-23 04:36:58', '2022-06-30 09:07:46', NULL, 1, 1, NULL, NULL),
(3, 'admin testy', 'New', NULL, '1', 'Coke', NULL, 'UAE\n', NULL, 'dfd44', 'srfw3442432', 'aeae', '2022-02-04', '00:00:00', '2022-12-14', '00:00:00', 'Confirmed', 'Pending', 'eae', 'Active', '2022-07-04 07:32:11', '2022-07-04 07:32:11', NULL, 1, 1, NULL, NULL);

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
(2, 2, 1, NULL, NULL, NULL, NULL, NULL),
(3, 1, 2, NULL, NULL, NULL, NULL, NULL),
(4, 3, 2, '2022-07-06 03:03:45', '2022-07-06 03:03:57', '2022-07-06 03:03:57', 1, 1),
(5, 3, 1, '2022-07-06 03:03:57', '2022-07-06 03:03:57', NULL, 1, 1);

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
  `asset` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL,
  `installation_time` varchar(255) DEFAULT NULL,
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

INSERT INTO `campaign_buckets` (`id`, `campaign_id`, `location`, `start_date`, `end_date`, `asset_type`, `asset_network`, `asset`, `quantity`, `availability`, `installation_time`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 1, 1, '2022-12-12', '2022-12-14', 'static', NULL, 2, NULL, NULL, '01 10:00', '2022-06-23 03:39:32', '2022-06-23 03:40:57', '2022-06-23 03:40:57', 1, 1, NULL),
(2, 1, 1, '2022-12-12', '2022-12-14', 'static', NULL, 3, NULL, NULL, '36000', '2022-06-23 03:39:32', '2022-07-13 07:51:27', '2022-07-13 07:51:27', 1, 1, NULL),
(3, 1, 1, '2020-11-12', '2022-12-11', 'static', NULL, 4, NULL, NULL, '43200', '2022-06-23 03:40:47', '2022-06-23 03:42:26', NULL, 1, 1, NULL),
(4, 2, 2, '2022-12-12', '2022-12-14', 'static', NULL, 1, NULL, NULL, '217860', '2022-06-27 04:03:25', '2022-07-04 07:24:57', NULL, 1, 1, NULL),
(5, 3, 1, '2022-12-12', '2022-12-14', 'static', 1, 2, 2, NULL, '122400', '2022-07-04 07:32:11', '2022-07-04 07:32:11', NULL, 1, 1, NULL);

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

--
-- Dumping data for table `campaign_installations`
--

INSERT INTO `campaign_installations` (`id`, `campaign_id`, `type`, `instructions`, `priority`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 1, 'installation', 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.\r\n\r\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.', 'high', '2022-03-12', '2022-05-12', 'Completed', '2022-07-19 02:56:03', '2022-07-21 08:02:36', NULL, 1, 1, NULL),
(2, 2, 'dismantle', 'test', 'low', '2022-01-12', '2022-01-14', 'Active', '2022-07-19 07:49:04', '2022-07-19 07:49:04', NULL, 1, 1, NULL),
(3, 3, 'maintenance', 'maintenancec', 'low', '2022-02-01', '2022-02-05', 'Active', '2022-07-20 01:42:47', '2022-07-20 01:47:35', NULL, 1, 1, NULL),
(4, 3, 'dismantle', 'test', 'medium', '2022-09-20', '2022-10-20', 'Not Started', '2022-07-20 01:48:26', '2022-07-20 02:26:43', NULL, 1, 1, NULL),
(5, 3, 'installation', 'installing', 'high', '2022-07-01', '2022-07-04', 'Active', '2022-07-20 02:19:35', '2022-07-20 02:26:31', NULL, 1, 1, NULL);

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

--
-- Dumping data for table `campaign_installations_designs`
--

INSERT INTO `campaign_installations_designs` (`id`, `campaign_id`, `installation_id`, `description`, `photo_path`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, NULL, 1, 'test design', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/installation_designs/linkedin (1).jpg', 'Active', '2022-07-20 09:09:53', '2022-07-20 09:20:00', 1, 1);

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
(1, 1, 'ok', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/image/qOTnVjT4xcnNR5FB9txfoqUz6CewgFttdWnhOTVH.png', 'Active', '2022-06-20 08:18:16', '2022-06-20 08:37:19', 1, 1),
(2, 2, 'fe', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/image/qOTnVjT4xcnNR5FB9txfoqUz6CewgFttdWnhOTVH.png', 'Active', '2022-06-20 09:50:37', '2022-06-20 09:50:37', 1, 1),
(3, 1, 'aa', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/image/qOTnVjT4xcnNR5FB9txfoqUz6CewgFttdWnhOTVH.png', 'Active', '2022-07-04 07:29:18', '2022-07-04 07:29:18', 1, 1),
(4, 3, 'Testing from monitoring form', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/campaign_monitoring/274-2742751_1-mb-image-download.jpg', 'Active', '2022-08-04 04:27:59', '2022-08-04 04:27:59', 1, 1);

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

--
-- Dumping data for table `campaign_permits`
--

INSERT INTO `campaign_permits` (`id`, `campaign_id`, `permit_file`, `description`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'permit_file/2INXtBLR79TGkckI6X1FyhOEHMfy8EKTiQ5s2IG3.png', 'qasim', '2022-07-05 07:29:15', '2022-07-07 05:49:11', NULL, 1, 1),
(2, 2, 'permit_file/wNm8bC2kxfSkhrhSQNtsMamRkK8BreNbMUMiw10J.xlsx', 'rr', '2022-07-05 07:30:18', '2022-07-05 07:30:18', NULL, 1, 1),
(3, 2, 'permit_file/2INXtBLR79TGkckI6X1FyhOEHMfy8EKTiQ5s2IG3.png', 'trtr', '2022-07-05 07:31:28', '2022-07-05 07:31:28', NULL, 1, 1),
(4, 2, 'permit_file/4fZHY2GqJ0LC2GG6iQV2fAb6zniyumfNPmpeXTho.png', 'trtr', '2022-07-05 07:31:37', '2022-07-05 07:31:37', NULL, 1, 1),
(5, 1, 'permit_file/aswzahZkcsqfVtiEuLuSStHZMNw0KtVgXM4ZcECY.xlsx', 'efe', '2022-07-05 07:32:34', '2022-07-05 07:32:34', NULL, 1, 1),
(6, 1, 'permit_file/wNm8bC2kxfSkhrhSQNtsMamRkK8BreNbMUMiw10J.xlsx', 'efe', '2022-07-05 08:31:18', '2022-07-05 08:31:18', NULL, 1, 1),
(7, 1, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/permit_file/qOTnVjT4xcnNR5FB9txfoqUz6CewgFttdWnhOTVH (1).png', 'mall permit pending', '2022-07-07 05:32:31', '2022-07-07 05:49:29', NULL, 1, 1);

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
(1, 1, 'Completed', '2022-07-04 04:28:09', '2022-07-04 04:29:09', '2022-07-04 04:29:09', NULL, NULL),
(2, 1, 'Active', '2022-07-04 04:29:09', '2022-07-04 04:34:30', '2022-07-04 04:34:30', 1, 1),
(3, 1, 'Active', '2022-07-04 04:34:30', '2022-07-04 04:35:00', '2022-07-04 04:35:00', 1, 1),
(4, 1, 'Active', '2022-07-04 04:35:00', '2022-07-04 04:35:17', '2022-07-04 04:35:17', 1, 1),
(5, 1, 'Active', '2022-07-04 04:35:17', '2022-07-12 04:50:59', '2022-07-12 04:50:59', 1, 1),
(6, 2, 'Active', '2022-07-04 07:24:57', '2022-07-04 07:24:57', NULL, 1, 1),
(7, 3, 'Active', '2022-07-04 07:32:11', '2022-07-04 07:32:11', NULL, 1, 1),
(8, 1, 'Not Started', '2022-07-12 04:50:59', '2022-07-13 07:51:23', '2022-07-13 07:51:23', 1, 1),
(9, 1, 'Not Started', '2022-07-13 07:51:24', '2022-07-22 12:41:23', '2022-07-22 12:41:23', 1, 1),
(10, 1, 'Not Started', '2022-07-22 12:41:24', '2022-07-22 12:41:24', NULL, 1, 1);

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
(1, 'Test', 'Agency', 'test@c.com', '0589727273', 'Dubai UAE', 2, 'Active', '2022-06-08 04:05:36', '2022-06-30 07:31:16', 1, 1),
(2, 'hasan', 'Agency', 'admin@mail.com', '0589727272', 'public_html/detsurvey', 2, 'Active', '2022-07-04 07:15:31', '2022-07-04 07:15:31', 1, 1);

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

--
-- Dumping data for table `contractor`
--

INSERT INTO `contractor` (`id`, `name`, `email`, `phone`, `location`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Test contractor', 'test@contractor.com', '1231234', 'Dubai, UAE', 'Active', '2022-06-09 08:11:05', '2022-06-09 08:11:05', 1, 1);

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
(1, 'effef', 2, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/campaign_monitoring_video/file_example_MOV_1280_1_4MB.mov', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/defect_tracking/274-2742751_1-mb-image-download.jpg', 1, 1, 'Active', '2022-06-20 09:57:29', '2022-08-04 04:58:56', 1, 1, '2022-08-04 04:58:56', 1),
(2, 'Testing from monitoring form', 3, 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/campaign_monitoring_video/sample-mp4-file-small.mp4', 'https://hyper-taskmanager.s3.ap-south-1.amazonaws.com/defect_tracking/274-2742751_1-mb-image-download.jpg', 3, 2, 'Active', '2022-08-04 04:28:00', '2022-08-04 04:28:00', 1, 1, NULL, NULL);

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
(1, 'In Mall', 'Active', '2022-06-15 03:18:03', '2022-08-04 04:13:05', NULL, 1, 1, NULL),
(2, 'In Metro', 'Active', '2022-06-15 03:18:07', '2022-08-04 04:13:15', NULL, 1, 1, NULL);

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
(1, 'Home', 'Princess tower', 'Khalifa street', 'Dubai Marina', 'Dubai', 'UAE', 'Sufouh metro station', 'Active', '2022-06-08 04:39:54', '2022-06-08 04:40:13', 1, 1),
(2, 'Office', 'Princess tower', 'Khalifa street', 'Dubai Marina', 'Dubai', 'UAE', 'Sufouh metro station', 'Active', '2022-06-27 06:04:05', '2022-06-27 06:04:05', 1, 1);

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
(1, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 1);

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
(1, 'test', 'web', '2021-12-08 08:36:48', '2021-12-08 08:49:20'),
(2, 'test 2', 'web', '2021-12-08 09:06:01', '2021-12-08 09:06:01'),
(3, 'admin', 'web', '2022-06-08 03:25:27', '2022-06-08 03:25:27'),
(4, 'admin-asset-list', 'web', '2022-06-29 08:26:59', '2022-06-29 08:26:59');

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
(1, 'test Client', 'web', '2021-12-08 09:10:28', '2021-12-08 09:10:28'),
(2, 'test service', 'web', '2021-12-08 09:15:19', '2021-12-08 09:15:19'),
(3, 'admin', 'web', '2021-12-08 10:17:13', '2021-12-08 10:17:13'),
(4, 'Test', 'web', '2022-06-08 03:00:03', '2022-06-08 03:00:03');

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
(1, 3),
(2, 3),
(4, 4);

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
(1, 'Admin', 1, '2022-07-13 08:27:01', '2022-07-13 08:27:01', NULL, 1, 1),
(2, 'Admine', 1, '2022-07-13 08:28:19', '2022-07-13 08:28:19', NULL, 1, 1);

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
(1, 2, 2),
(2, 1, 1),
(3, 1, 2);

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
(1, 'Admin', 'admin@mail.com', NULL, 'bfd59291e825b5f2bbf1eb76569f8fe7', 'Active', NULL, '2022-05-25 07:44:27', '2022-05-25 07:44:27'),
(2, 'Test', 'test@mail.com', NULL, 'bfd59291e825b5f2bbf1eb76569f8fe7', 'Active', NULL, '2022-06-27 04:46:32', '2022-06-27 04:46:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `campaign_status`
--
ALTER TABLE `campaign_status`
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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `asset_in_network`
--
ALTER TABLE `asset_in_network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `asset_network`
--
ALTER TABLE `asset_network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `asset_status`
--
ALTER TABLE `asset_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `campaign_assign`
--
ALTER TABLE `campaign_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `campaign_buckets`
--
ALTER TABLE `campaign_buckets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `campaign_installations`
--
ALTER TABLE `campaign_installations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `campaign_installations_designs`
--
ALTER TABLE `campaign_installations_designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `campaign_monitoring`
--
ALTER TABLE `campaign_monitoring`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `campaign_permits`
--
ALTER TABLE `campaign_permits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `campaign_status`
--
ALTER TABLE `campaign_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contractor`
--
ALTER TABLE `contractor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `defect_monitoring`
--
ALTER TABLE `defect_monitoring`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

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
