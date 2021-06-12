-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2021 at 06:07 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `example_app_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatroom`
--

CREATE TABLE `chatroom` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chatroom_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chatroom_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `test1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `user_id`, `recipient_id`, `chatroom_id`, `username`, `message`, `updated_at`, `created_at`, `test1`) VALUES
(29, '1', '2', '1', 'arnob@gmail.com', 'asdasdad', '2021-06-12 05:17:37', '2021-06-12 05:17:37', NULL),
(30, '1', '2', '1', 'arnob@gmail.com', 'adasdsad', '2021-06-12 05:17:45', '2021-06-12 05:17:45', NULL),
(31, '1', '2', '1', 'arnob@gmail.com', 'asdad', '2021-06-12 05:29:32', '2021-06-12 05:29:32', NULL),
(32, '2', '2', '1', 'arnob1@gmail.com', 'asdasdasd', '2021-06-12 05:29:36', '2021-06-12 05:29:36', NULL),
(33, '1', '2', '1', 'arnob@gmail.com', 'asdasd', '2021-06-12 05:40:04', '2021-06-12 05:40:04', NULL),
(34, '2', '2', '1', 'arnob1@gmail.com', 'mnbmn', '2021-06-12 07:09:14', '2021-06-12 07:09:14', NULL),
(35, '2', '2', '1', 'arnob1@gmail.com', 'asdasd', '2021-06-12 08:21:06', '2021-06-12 08:21:06', NULL),
(36, '2', '2', '1', 'arnob1@gmail.com', 'adsadsad', '2021-06-12 08:21:16', '2021-06-12 08:21:16', NULL),
(37, '2', '2', '1', 'arnob1@gmail.com', 'asdasd', '2021-06-12 08:21:38', '2021-06-12 08:21:38', NULL),
(38, '1', '2', '1', 'arnob@gmail.com', 'asdasd', '2021-06-12 08:22:37', '2021-06-12 08:22:37', NULL),
(39, '1', '2', '1', 'arnob@gmail.com', 'dfgdfg', '2021-06-12 08:30:17', '2021-06-12 08:30:17', NULL),
(40, '1', '2', '1', 'arnob@gmail.com', 'asdasd', '2021-06-12 08:31:42', '2021-06-12 08:31:42', NULL),
(41, '1', '2', '1', 'arnob@gmail.com', 'asdasd', '2021-06-12 08:31:53', '2021-06-12 08:31:53', NULL),
(42, '1', '2', '1', 'arnob@gmail.com', 'asdasd', '2021-06-12 08:32:17', '2021-06-12 08:32:17', NULL),
(43, '1', '2', '1', 'arnob@gmail.com', 'asdasdasd', '2021-06-12 08:32:48', '2021-06-12 08:32:48', NULL),
(44, '2', '2', '2', 'arnob1@gmail.com', 'asdasdasd', '2021-06-12 08:32:52', '2021-06-12 08:32:52', NULL),
(45, '1', '2', '2', 'arnob@gmail.com', 'asdasdsa', '2021-06-12 08:41:20', '2021-06-12 08:41:20', NULL),
(46, '1', '2', '2', 'arnob@gmail.com', 'test', '2021-06-12 08:41:26', '2021-06-12 08:41:26', NULL),
(47, '1', '2', '2', 'arnob@gmail.com', 'test 2', '2021-06-12 08:41:42', '2021-06-12 08:41:42', NULL),
(48, '1', '2', '3', 'arnob@gmail.com', 'test 1', '2021-06-12 08:42:59', '2021-06-12 08:42:59', NULL),
(49, '3', '2', '3', 'arnob__1__@gmail.com', 'test 2', '2021-06-12 08:43:03', '2021-06-12 08:43:03', NULL),
(50, '1', '2', '3', 'arnob@gmail.com', 'test 4', '2021-06-12 08:43:07', '2021-06-12 08:43:07', NULL),
(51, '3', '2', '3', 'arnob__1__@gmail.com', 'test 6', '2021-06-12 08:43:11', '2021-06-12 08:43:11', NULL),
(52, '2', '2', '6', 'arnob1@gmail.com', 'is it 1', '2021-06-12 08:44:29', '2021-06-12 08:44:29', NULL),
(53, '4', '2', '6', 'arnob__2__@gmail.com', 'is it 2', '2021-06-12 08:44:31', '2021-06-12 08:44:31', NULL),
(54, '2', '2', '6', 'arnob1@gmail.com', 'is it 4', '2021-06-12 08:44:34', '2021-06-12 08:44:34', NULL),
(55, '4', '2', '6', 'arnob__2__@gmail.com', 'is it 6', '2021-06-12 08:44:38', '2021-06-12 08:44:38', NULL),
(56, '2', '2', '2', 'arnob1@gmail.com', 'aasdasd', '2021-06-12 09:49:18', '2021-06-12 09:49:18', NULL),
(57, '4', '2', '2', 'arnob__2__@gmail.com', 'asdasd', '2021-06-12 09:50:10', '2021-06-12 09:50:10', NULL),
(58, '2', '2', '2', 'arnob1@gmail.com', 'asdasd', '2021-06-12 09:51:06', '2021-06-12 09:51:06', NULL),
(59, '4', '2', '2', 'arnob__2__@gmail.com', 'asdsad', '2021-06-12 09:51:19', '2021-06-12 09:51:19', NULL),
(60, '2', '2', '2', 'arnob1@gmail.com', 'asdasd', '2021-06-12 09:51:42', '2021-06-12 09:51:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_06_12_063555_chatroom', 1),
(6, '2021_06_12_063953_chatmessage', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'arnob@gmail.com', 'arnob@gmail.com', NULL, '$2y$10$nKOoIhM8Dl2UFkj7D1KUVOv.damtGKAfHcaFWLcbQ51u/Adhh3KBu', NULL, '2021-06-12 04:37:07', '2021-06-12 04:37:07'),
(2, 'arnob1@gmail.com', 'arnob1@gmail.com', NULL, '$2y$10$voHVNhg1qv8xO.iSOgnF5eA0wlGJAxzUbLW8rD89i42xVF5GTaEWa', NULL, '2021-06-12 04:37:36', '2021-06-12 04:37:36'),
(3, 'arnob__1__@gmail.com', 'arnob__1__@gmail.com', NULL, '$2y$10$8MA42SSfJL7dD.VXapbp4u4P.VIuCbv8ipdvGECsX1r7cmiqwfg8e', NULL, '2021-06-12 08:42:41', '2021-06-12 08:42:41'),
(4, 'arnob__2__@gmail.com', 'arnob__2__@gmail.com', NULL, '$2y$10$nijfbdeMIDZmiATdYIiRzOxrgcW1zJaFVdJ1fPh7C1Nv74zmpRm8e', NULL, '2021-06-12 08:43:53', '2021-06-12 08:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatroom`
--
ALTER TABLE `chatroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatroom`
--
ALTER TABLE `chatroom`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
