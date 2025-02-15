-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Feb 15, 2025 at 12:48 PM
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
-- Database: `today_sky`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`id`, `full_name`, `email`, `phone_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Milton Walker', 'ardith30@example.org', '+1.925.472.1181', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(2, 'Mrs. Abigayle Koelpin', 'dorcas15@example.com', '+1.770.439.8819', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(3, 'Ferne Heller', 'grant.dallin@example.net', '+1-731-333-7885', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(4, 'Carley Robel', 'vwyman@example.com', '+1 (202) 640-6067', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(5, 'Meta Brakus', 'jklein@example.net', '(202) 727-0236', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `educations`
--

CREATE TABLE `educations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `applicant_id` bigint(20) UNSIGNED NOT NULL,
  `institution` varchar(255) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educations`
--

INSERT INTO `educations` (`id`, `applicant_id`, `institution`, `degree`, `year`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Balistreri-Stokes University', 'MBA', '1991', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(2, 1, 'Emmerich-Marvin University', 'BSc Computer Science', '2000', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(3, 2, 'Douglas Ltd University', 'MBA', '1986', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(4, 2, 'Cruickshank-Feest University', 'MSc AI', '1994', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(5, 3, 'Kshlerin and Sons University', 'BBA', '1981', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(6, 3, 'Wiza, Schaden and Gerlach University', 'BSc Computer Science', '2013', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(7, 4, 'Casper Ltd University', 'BSc Computer Science', '2023', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(8, 4, 'Cummings-Bruen University', 'MBA', '2002', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(9, 5, 'Erdman Inc University', 'MSc AI', '1980', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(10, 5, 'Littel Group University', 'MBA', '1984', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_14_134849_create_applicants_table', 1),
(5, '2025_02_14_135552_create_educations_table', 1),
(6, '2025_02_14_135607_create_work_experiences_table', 1),
(7, '2025_02_14_135620_create_skills_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('iWlNEK4TZ0JZLc9TmE90H77Jm2I4BSIOrMK7dzh5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDhGRFBRQUk4dlVKUmFrZ1VnODZ5OUpQT0dTTUs4UHVqbTA3V05sRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHBsaWNhbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1739619895);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `applicant_id` bigint(20) UNSIGNED NOT NULL,
  `skill` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `applicant_id`, `skill`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Flutter', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(2, 1, 'Laravel', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(3, 1, 'Python', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(4, 1, 'AWS', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(5, 2, 'Vue.js', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(6, 2, 'Python', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(7, 2, 'Flutter', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(8, 2, 'SQL', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(9, 3, 'Flutter', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(10, 3, 'Laravel', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(11, 3, 'AWS', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(12, 3, 'React', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(13, 4, 'Docker', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(14, 4, 'AWS', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(15, 4, 'SQL', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(16, 4, 'React', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(17, 5, 'Flutter', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(18, 5, 'Vue.js', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(19, 5, 'AWS', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(20, 5, 'SQL', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_experiences`
--

CREATE TABLE `work_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `applicant_id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_experiences`
--

INSERT INTO `work_experiences` (`id`, `applicant_id`, `company`, `role`, `duration`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Brekke-Kemmer', 'Network Systems Analyst', '2017-2027', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(2, 1, 'Smitham, Macejkovic and Boyle', 'Education Teacher', '2023-2030', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(3, 2, 'Mosciski, McKenzie and Adams', 'Coaches and Scout', '2019-2028', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(4, 2, 'Murazik-Strosin', 'Legislator', '2015-2027', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(5, 3, 'Hahn-McKenzie', 'Producer', '2024-2027', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(6, 3, 'Rath, Kub and Bartoletti', 'Pressure Vessel Inspector', '2022-2029', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(7, 4, 'Flatley-Wisozk', 'Shoe Machine Operators', '2022-2025', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(8, 4, 'Kuphal, Haley and Windler', 'Aviation Inspector', '2020-2025', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(9, 5, 'Nienow, Homenick and O\'Kon', 'Heavy Equipment Mechanic', '2020-2025', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL),
(10, 5, 'Volkman, Smith and Crona', 'Proofreaders and Copy Marker', '2018-2028', '2025-02-15 08:43:23', '2025-02-15 08:43:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applicants_email_unique` (`email`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `educations`
--
ALTER TABLE `educations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `educations_applicant_id_foreign` (`applicant_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skills_applicant_id_foreign` (`applicant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `work_experiences`
--
ALTER TABLE `work_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_experiences_applicant_id_foreign` (`applicant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `educations`
--
ALTER TABLE `educations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_experiences`
--
ALTER TABLE `work_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `educations`
--
ALTER TABLE `educations`
  ADD CONSTRAINT `educations_applicant_id_foreign` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_applicant_id_foreign` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `work_experiences`
--
ALTER TABLE `work_experiences`
  ADD CONSTRAINT `work_experiences_applicant_id_foreign` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
