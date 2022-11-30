-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 03:34 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_baru`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(3) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `close_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `brand` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trx_details`
--

CREATE TABLE `trx_details` (
  `id` int(11) NOT NULL,
  `id_header` int(11) NOT NULL,
  `item_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `prize` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_details`
--

INSERT INTO `trx_details` (`id`, `id_header`, `item_name`, `total_quantity`, `prize`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chitato', 1, 5000, '2022-11-28 02:06:54', NULL),
(2, 1, 'Teh Pucuk', 1, 5000, '2022-11-28 02:06:54', NULL),
(3, 1, 'Aqua', 1, 3000, '2022-11-28 02:06:54', NULL),
(4, 1, 'ISOPLUS', 1, 3000, '2022-11-29 03:04:04', '2022-11-28 21:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `trx_header`
--

CREATE TABLE `trx_header` (
  `id` int(11) NOT NULL,
  `id_infos` int(11) NOT NULL,
  `trx_time` datetime NOT NULL,
  `discount_total` double NOT NULL,
  `prize_total` double NOT NULL,
  `payment` double NOT NULL,
  `exchange` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_header`
--

INSERT INTO `trx_header` (`id`, `id_infos`, `trx_time`, `discount_total`, `prize_total`, `payment`, `exchange`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-28 03:01:06', 0, 18000, 16000, 2000, '2022-11-28 02:02:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trx_infos`
--

CREATE TABLE `trx_infos` (
  `id` int(11) NOT NULL,
  `branch_info` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cashier_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trx_infos`
--

INSERT INTO `trx_infos` (`id`, `branch_info`, `cashier_name`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'Arcade 2', 'Indah', 1, '2022-11-28 01:57:42', NULL),
(2, 'Arcade 2', 'Dede', 1, '2022-11-28 02:00:20', NULL),
(3, 'Arcade 1', 'Indah', 0, '2022-11-28 02:00:20', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trx_details`
--
ALTER TABLE `trx_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_header_details` (`id_header`);

--
-- Indexes for table `trx_header`
--
ALTER TABLE `trx_header`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trx_` (`id_infos`);

--
-- Indexes for table `trx_infos`
--
ALTER TABLE `trx_infos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trx_details`
--
ALTER TABLE `trx_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trx_header`
--
ALTER TABLE `trx_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trx_infos`
--
ALTER TABLE `trx_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trx_details`
--
ALTER TABLE `trx_details`
  ADD CONSTRAINT `fk_trx_header_details` FOREIGN KEY (`id_header`) REFERENCES `trx_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trx_header`
--
ALTER TABLE `trx_header`
  ADD CONSTRAINT `fk_trx_` FOREIGN KEY (`id_infos`) REFERENCES `trx_infos` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
