-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2026 at 05:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_concern_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `created_at`) VALUES
(41, 3, 'Logged in', '2026-10-18 13:44:18'),
(42, 3, 'Logged out', '2026-10-18 13:52:00'),
(43, 4, 'Logged in', '2026-10-18 13:52:11'),
(44, 4, 'Submitted report #3', '2026-10-18 13:57:38'),
(45, 4, 'Updated report #3', '2026-10-18 14:11:52'),
(46, 4, 'Updated report #3', '2026-10-18 14:14:03'),
(47, 4, 'Updated report #3', '2026-10-18 14:14:28'),
(48, 4, 'Updated report #3', '2026-10-18 14:14:32'),
(49, 4, 'Logged out', '2026-10-18 14:14:45'),
(50, 3, 'Logged in', '2026-10-18 14:14:55'),
(51, 3, 'Updated report #3 to Under Review', '2026-10-18 14:19:57'),
(52, 3, 'Logged out', '2026-10-18 14:20:14'),
(53, 4, 'Logged in', '2026-10-18 14:20:23'),
(54, 4, 'Logged out', '2026-10-18 14:20:51'),
(55, 3, 'Logged in', '2026-10-18 14:21:59');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(1, 'Bullying', 'active'),
(2, 'Academic Concern', 'active'),
(3, 'Facility or Equipment', 'active'),
(4, 'Safety', 'active'),
(5, 'Harassment', 'active'),
(6, 'Behavioral Concern', 'active'),
(7, 'Other', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `message` varchar(500) NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `report_id`, `message`, `is_read`, `created_at`) VALUES
(3, 4, 3, 'Your report #3 status is now Under Review.', 0, '2026-10-18 14:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `report_type` enum('Concern','Incident') NOT NULL,
  `subject` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(200) DEFAULT '',
  `priority` enum('Normal','High','Urgent') DEFAULT 'Normal',
  `status` enum('Pending','Under Review','In Progress','Resolved','Closed') DEFAULT 'Pending',
  `action_taken` text DEFAULT NULL,
  `resolution` text DEFAULT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `evidence_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `category_id`, `report_type`, `subject`, `description`, `location`, `priority`, `status`, `action_taken`, `resolution`, `resolved_at`, `created_at`, `updated_at`, `evidence_photo`) VALUES
(3, 4, 7, 'Concern', 'for SSC officers', 'dEA gesthbyedhndgijmu6nfijuhgsgfvefhgrdkgkutkfdhdfhf', '', 'Normal', 'Under Review', 'under review', 'ambot', NULL, '2026-10-18 13:57:38', '2026-10-18 14:19:57', 'uploads/evidence/report_3_74f5b3a9a8fd4d57e4ff847ef53e7ce1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `report_updates`
--

CREATE TABLE `report_updates` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_updates`
--

INSERT INTO `report_updates` (`id`, `report_id`, `updated_by`, `status`, `remarks`, `created_at`) VALUES
(5, 3, 4, 'Pending', 'Report submitted.', '2026-10-18 13:57:38'),
(6, 3, 4, 'Pending', 'Student updated report details.', '2026-10-18 14:11:52'),
(7, 3, 4, 'Pending', 'Student updated report details.', '2026-10-18 14:14:03'),
(8, 3, 4, 'Pending', 'Student updated report details.', '2026-10-18 14:14:28'),
(9, 3, 4, 'Pending', 'Student updated report details.', '2026-10-18 14:14:32'),
(10, 3, 3, 'Under Review', 'ambot', '2026-10-18 14:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `sms_logs`
--

CREATE TABLE `sms_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `notification_type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Pending','Sent','Failed') NOT NULL DEFAULT 'Pending',
  `response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `role` enum('admin','student') NOT NULL DEFAULT 'student',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `sms_notifications` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `role`, `status`, `created_at`, `phone_number`, `sms_notifications`) VALUES
(3, 'admin', '$2y$10$zV.Jwdfy8ZEEidqn4mU6guO63ccgKRGE4IhNorbVAv9D3CuATjNdm', 'School Admin', 'admin', 'active', '2026-10-18 13:43:58', NULL, 0),
(4, 'mariel', '$2y$10$8gJNI9RWqqDzaNt6I/tdyed2Ug4hVdw14v9PGAPMw8K1wnBDwxTSy', 'Mariel Canete', 'student', 'active', '2026-10-18 13:50:16', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `report_updates`
--
ALTER TABLE `report_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `sms_logs`
--
ALTER TABLE `sms_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sms_user` (`user_id`),
  ADD KEY `idx_sms_report` (`report_id`),
  ADD KEY `idx_sms_status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `report_updates`
--
ALTER TABLE `report_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sms_logs`
--
ALTER TABLE `sms_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `report_updates`
--
ALTER TABLE `report_updates`
  ADD CONSTRAINT `report_updates_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_updates_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
