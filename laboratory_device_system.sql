-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2026 at 04:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laboratory_device_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowings`
--

CREATE TABLE `borrowings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `laptop_id` int(11) NOT NULL,
  `borrow_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Borrowed',
  `return_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowings`
--

INSERT INTO `borrowings` (`id`, `user_id`, `laptop_id`, `borrow_date`, `due_date`, `status`, `return_date`) VALUES
(15, 2, 24, '2026-10-10 13:02:39', '2026-10-10 17:00:00', 'Returned', '2026-10-10 13:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Available',
  `laptop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `device_name`, `status`, `laptop_id`) VALUES
(24, 'DELL', 'Available', 3),
(25, 'DELL', 'Available', 1),
(26, 'DELL', 'Available', 2),
(27, 'Acer', 'Available', 4),
(28, 'ASUS', 'Available', 5),
(29, 'Lenovo', 'Available', 6),
(30, 'HP', 'Available', 7),
(31, 'Lenovo', 'Available', 8),
(32, 'lenovo', 'Available', 9),
(33, 'Acer', 'Available', 10),
(34, 'Acer', 'Available', 11),
(35, 'ASUS', 'Available', 12),
(36, 'ASUS', 'Available', 13),
(37, 'ASUS', 'Available', 14),
(38, 'ASUS', 'Available', 15),
(39, 'HP', 'Available', 16),
(40, 'HP', 'Available', 17),
(41, 'Huawei Matebook', 'Available', 18),
(42, 'Huawei Matebook', 'Available', 19),
(43, 'Apple', 'Available', 20),
(44, 'Apple', 'Available', 21),
(45, 'Razer', 'Available', 22),
(46, 'Samsung', 'Available', 23);

-- --------------------------------------------------------

--
-- Table structure for table `device_archive`
--

CREATE TABLE `device_archive` (
  `archive_id` int(11) NOT NULL,
  `laptop_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `archived_date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_archive`
--

CREATE TABLE `student_archive` (
  `archive_id` int(11) NOT NULL,
  `original_user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `student_id` varchar(100) NOT NULL,
  `section` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'user',
  `archived_at` datetime NOT NULL DEFAULT current_timestamp(),
  `delete_after` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_archive`
--

INSERT INTO `student_archive` (`archive_id`, `original_user_id`, `full_name`, `student_id`, `section`, `username`, `password`, `role`, `archived_at`, `delete_after`) VALUES
(6, 3, 'natoy toy', '127977110166', 'ICT 12', 'Natoy', '123', 'user', '2026-10-10 13:05:59', '2026-10-17 13:05:59'),
(7, 4, 'ace', '127977110162', 'HUMS 1', 'ace toy', '123', 'user', '2026-10-10 13:06:02', '2026-10-17 13:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `ban_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `student_id`, `section`, `username`, `password`, `role`, `ban_until`) VALUES
(1, 'Administrator', 'ADMIN-001', 'Admin', 'admin', 'admin123', 'admin', NULL),
(2, 'zedrick pagara', '127977110164', 'ICT 2', 'zedrick', '123', 'user', NULL),
(3, 'natoy toy', '127977110166', 'ICT 12', 'Natoy', '123', 'archived', NULL),
(4, 'ace', '127977110162', 'HUMS 1', 'ace toy', '123', 'archived', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_borrowings_user` (`user_id`),
  ADD KEY `fk_borrowings_device` (`laptop_id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laptop_id` (`laptop_id`);

--
-- Indexes for table `device_archive`
--
ALTER TABLE `device_archive`
  ADD PRIMARY KEY (`archive_id`);

--
-- Indexes for table `student_archive`
--
ALTER TABLE `student_archive`
  ADD PRIMARY KEY (`archive_id`),
  ADD UNIQUE KEY `unique_archived_user` (`original_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowings`
--
ALTER TABLE `borrowings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `device_archive`
--
ALTER TABLE `device_archive`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `student_archive`
--
ALTER TABLE `student_archive`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD CONSTRAINT `fk_borrowings_device` FOREIGN KEY (`laptop_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `fk_borrowings_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
