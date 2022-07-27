-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 27, 2022 at 05:14 AM
-- Server version: 8.0.27
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bukky_res`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
CREATE TABLE IF NOT EXISTS `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `activity` varchar(55) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `user_id`, `activity`, `datetime`) VALUES
(1, 5, 'Login', '2022-07-26 02:40:19'),
(2, 12, 'Login', '2022-07-26 03:21:01'),
(3, 12, 'Logout', '2022-07-26 03:58:22');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

DROP TABLE IF EXISTS `adjustments`;
CREATE TABLE IF NOT EXISTS `adjustments` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_items`
--

DROP TABLE IF EXISTS `adjustment_items`;
CREATE TABLE IF NOT EXISTS `adjustment_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `adjustment_id` int NOT NULL,
  `product_id` int NOT NULL,
  `adjustment` int NOT NULL,
  `diff` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `bookings` varchar(500) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `payment_status` enum('Pending','Paid','Cancelled') NOT NULL DEFAULT 'Pending',
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `comments` text,
  `amount` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_types`
--

DROP TABLE IF EXISTS `booking_types`;
CREATE TABLE IF NOT EXISTS `booking_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `hourly_price` double(10,2) NOT NULL DEFAULT '0.00',
  `hours` int NOT NULL DEFAULT '1',
  `type` enum('fixed','hourly') NOT NULL,
  `available` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `updated_at`, `created_at`) VALUES
(12, 'African Dish', '2022-07-26 13:46:48', '2022-07-26 13:46:48'),
(14, 'Foreign dish', '2022-07-26 13:53:26', '2022-07-26 13:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `neighborhood` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `address`, `neighborhood`, `created_at`, `updated_at`, `deleted_at`, `comments`) VALUES
(1, 'samji baba', '', NULL, '08166939205', '1b, bukky estate', NULL, NULL, NULL, NULL, 'thanks');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
CREATE TABLE IF NOT EXISTS `expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `title`, `description`, `created_at`, `updated_at`, `price`) VALUES
(1, 'transport', 'transportation stuffs', '2022-07-26 14:56:36', NULL, 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `hold_order`
--

DROP TABLE IF EXISTS `hold_order`;
CREATE TABLE IF NOT EXISTS `hold_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `table_id` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `cart` text,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hold_order`
--

INSERT INTO `hold_order` (`id`, `user_id`, `table_id`, `comment`, `cart`, `status`, `created_at`) VALUES
(1, 12, 2, NULL, '[{\"id\":\"20\",\"product_id\":\"2\",\"price\":\"300\",\"size\":\"with Ewedu\",\"name\":\"Eba (with Ewedu)\",\"quantity\":\"2\",\"p_qty\":\"1\"},{\"id\":\"21\",\"product_id\":\"2\",\"price\":\"500\",\"size\":\"with gbegiri\",\"name\":\"Eba (with gbegiri)\",\"quantity\":\"3\",\"p_qty\":\"1\"}]', 0, '2022-07-26 15:30:36'),
(2, 5, 1, NULL, '[{\"id\":\"21\",\"product_id\":\"2\",\"price\":\"500\",\"size\":\"with gbegiri\",\"name\":\"Eba (with gbegiri)\",\"quantity\":\"1\",\"p_qty\":\"1\"},{\"id\":\"22\",\"product_id\":\"2\",\"price\":\"450\",\"size\":\"with efo riri\",\"name\":\"Eba (with efo riri)\",\"quantity\":\"1\",\"p_qty\":\"1\"}]', 1, '2022-07-26 15:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

DROP TABLE IF EXISTS `homepage`;
CREATE TABLE IF NOT EXISTS `homepage` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `homepage`
--

INSERT INTO `homepage` (`id`, `key`, `type`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, 'story_title', 'text', 'Story Title', '<span>Discover</span>Our Story', NULL, '2017-09-20 16:13:04'),
(2, 'story_desc', 'textarea', 'Story Description', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.', NULL, '2017-09-20 16:13:04'),
(3, 'menu_title', 'text', 'Menu Title', '<span>Discover</span>Our Menu', NULL, '2017-09-20 16:13:04'),
(4, 'menu_desc', 'textarea', 'Menu Description', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.', NULL, '2017-09-20 16:13:04'),
(5, 'img_title1', 'text', 'Image Title 1', '<h2><span>We Are Sharing</span></h2>                    <h1>delicious treats</h1>', NULL, '2017-09-25 16:36:13'),
(6, 'img_title2', 'text', 'Image Title 2', '<h2><span>The Perfect</span></h2>                    <h1>Blend</h1>', NULL, '2017-09-25 16:36:13'),
(7, 'category', NULL, 'Home Categories', '', NULL, '2017-09-25 17:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `track_type` varchar(55) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeroom` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
CREATE TABLE IF NOT EXISTS `ltm_translations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1125 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(862, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2018-01-31 06:10:18', '2018-01-31 06:16:58'),
(863, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2018-01-31 06:10:18', '2018-01-31 06:16:58'),
(864, 0, 'en', 'common', 'home', 'Home', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(865, 0, 'en', 'common', 'add', 'Add', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(866, 0, 'en', 'common', 'add_new', 'Add New', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(867, 0, 'en', 'common', 'edit', 'Edit', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(868, 0, 'en', 'common', 'save', 'Save', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(869, 0, 'en', 'common', 'cancel', 'Cancel', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(870, 0, 'en', 'common', 'name', 'Name', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(871, 0, 'en', 'common', 'category', 'Category', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(872, 0, 'en', 'common', 'categories', 'Categories', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(873, 0, 'en', 'common', 'product', 'Product', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(874, 0, 'en', 'common', 'products', 'Products', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(875, 0, 'en', 'common', 'description', 'Description', '2018-01-31 06:10:18', '2018-01-31 06:26:25'),
(876, 0, 'en', 'common', 'delete', 'Delete', '2018-01-31 06:10:19', '2018-01-31 06:26:25'),
(877, 0, 'en', 'common', 'no_record_found', 'No Record Found', '2018-01-31 06:10:19', '2018-01-31 06:26:25'),
(878, 0, 'en', 'dashboard', 'today', 'Today', '2018-01-31 06:10:19', '2018-01-31 06:16:59'),
(879, 0, 'en', 'dashboard', 'yesterday', 'Yesterday', '2018-01-31 06:10:19', '2018-01-31 06:16:59'),
(880, 0, 'en', 'dashboard', '7_days', 'Last 7 Days', '2018-01-31 06:10:19', '2018-01-31 06:16:59'),
(881, 0, 'en', 'dashboard', '30_days', 'Last 30 Days', '2018-01-31 06:10:19', '2018-01-31 06:16:59'),
(882, 0, 'en', 'dashboard', '12_month', 'Last 12 Month', '2018-01-31 06:10:19', '2018-01-31 06:16:59'),
(883, 0, 'en', 'dashboard', 'total_sales', 'Total Sales', '2018-01-31 06:10:19', '2018-01-31 06:16:59'),
(884, 0, 'en', 'dashboard', 'last_pos_sales', 'Last 10 POS Sales', '2018-01-31 06:10:19', '2018-01-31 06:16:59'),
(885, 0, 'en', 'dashboard', 'top_10_items', 'Top 10 Sale Items', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(886, 0, 'en', 'dashboard', 'product_name', 'Product Name', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(887, 0, 'en', 'dashboard', 'sales', 'Sales', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(888, 0, 'en', 'dashboard', 'sales_date', 'Sales Date', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(889, 0, 'en', 'dashboard', 'discount', 'Discount', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(890, 0, 'en', 'dashboard', 'total_amount', 'Total Amount', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(891, 0, 'en', 'dashboard', 'status', 'Status', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(892, 0, 'en', 'dashboard', 'show', 'Show', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(893, 0, 'en', 'login', 'login', 'Login', '2018-01-31 06:10:19', '2018-01-31 06:26:12'),
(894, 0, 'en', 'login', 'login_text', 'Login in. To see it in action', '2018-01-31 06:10:19', '2018-01-31 06:26:12'),
(895, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(896, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(897, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(898, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(899, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(900, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(901, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2018-01-31 06:10:19', '2018-01-31 06:17:00'),
(902, 0, 'en', 'pos', 'cart_items', 'Cart Items', '2018-01-31 06:10:20', '2018-01-31 06:17:00'),
(903, 0, 'en', 'pos', 'sub_total', 'Sub Total', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(904, 0, 'en', 'pos', 'total', 'Total', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(905, 0, 'en', 'pos', 'checkout', 'Checkout', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(906, 0, 'en', 'pos', 'clear_cart', 'Clear Cart', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(907, 0, 'en', 'pos', 'how_would_you_pay', 'How would you like to pay?', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(908, 0, 'en', 'pos', 'discount', 'Discount', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(909, 0, 'en', 'pos', 'tax', 'Tax', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(910, 0, 'en', 'pos', 'complete_order', 'Complete Order', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(911, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(912, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(913, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(914, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(915, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(916, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(917, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(918, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(919, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(920, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(921, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(922, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(923, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2018-01-31 06:10:20', '2018-01-31 06:17:01'),
(924, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2018-01-31 06:10:20', '2018-01-31 06:17:02'),
(925, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(926, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(927, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(928, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(929, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(930, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(931, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(932, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(933, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(934, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(935, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(936, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(937, 0, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(938, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(939, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(940, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(941, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(942, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(943, 0, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(944, 0, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(945, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(946, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(947, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(948, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(949, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(950, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(951, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(952, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(953, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2018-01-31 06:10:21', '2018-01-31 06:17:02'),
(954, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2018-01-31 06:10:21', '2018-01-31 06:17:03'),
(955, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2018-01-31 06:10:21', '2018-01-31 06:17:03'),
(956, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2018-01-31 06:10:21', '2018-01-31 06:17:03'),
(957, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2018-01-31 06:10:21', '2018-01-31 06:17:03'),
(958, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2018-01-31 06:10:21', '2018-01-31 06:17:03'),
(959, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(960, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(961, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(962, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(963, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(964, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(965, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(966, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(967, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(968, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(969, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(970, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(971, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(972, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(973, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(974, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(975, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(976, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(977, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2018-01-31 06:10:22', '2018-01-31 06:17:03'),
(978, 1, 'es', 'auth', 'failed', 'Estas credenciales no coinciden con nuestros registros.', '2018-01-31 06:17:03', '2018-01-31 06:17:03'),
(979, 1, 'es', 'auth', 'throttle', 'Demasiados intentos de acceso. Por favor intente nuevamente en :seconds segundos.', '2018-01-31 06:17:03', '2018-01-31 06:17:03'),
(980, 0, 'es', 'common', 'home', 'Home', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(981, 0, 'es', 'common', 'add', 'Add', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(982, 0, 'es', 'common', 'add_new', 'Add New', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(983, 0, 'es', 'common', 'edit', 'Edit', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(984, 0, 'es', 'common', 'save', 'Save', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(985, 0, 'es', 'common', 'cancel', 'Cancel', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(986, 0, 'es', 'common', 'name', 'Name', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(987, 0, 'es', 'common', 'category', 'Category', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(988, 0, 'es', 'common', 'categories', 'Categories', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(989, 0, 'es', 'common', 'product', 'Product', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(990, 0, 'es', 'common', 'products', 'Products', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(991, 0, 'es', 'common', 'description', 'Description', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(992, 0, 'es', 'common', 'delete', 'Delete', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(993, 0, 'es', 'common', 'no_record_found', 'No Record Found', '2018-01-31 06:17:04', '2018-01-31 06:26:25'),
(994, 1, 'es', 'dashboard', 'today', 'Today', '2018-01-31 06:17:04', '2018-01-31 06:17:04'),
(995, 1, 'es', 'dashboard', 'yesterday', 'Yesterday', '2018-01-31 06:17:04', '2018-01-31 06:17:04'),
(996, 1, 'es', 'dashboard', '7_days', 'Last 7 Days', '2018-01-31 06:17:04', '2018-01-31 06:17:04'),
(997, 1, 'es', 'dashboard', '30_days', 'Last 30 Days', '2018-01-31 06:17:04', '2018-01-31 06:17:04'),
(998, 1, 'es', 'dashboard', '12_month', 'Last 12 Month', '2018-01-31 06:17:04', '2018-01-31 06:17:04'),
(999, 1, 'es', 'dashboard', 'total_sales', 'Total Sales', '2018-01-31 06:17:04', '2018-01-31 06:17:04'),
(1000, 1, 'es', 'dashboard', 'last_pos_sales', 'Last 10 POS Sales', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1001, 1, 'es', 'dashboard', 'top_10_items', 'Top 10 Sale Items', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1002, 1, 'es', 'dashboard', 'product_name', 'Product Name', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1003, 1, 'es', 'dashboard', 'sales', 'Sales', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1004, 1, 'es', 'dashboard', 'sales_date', 'Sales Date', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1005, 1, 'es', 'dashboard', 'discount', 'Discount', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1006, 1, 'es', 'dashboard', 'total_amount', 'Total Amount', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1007, 1, 'es', 'dashboard', 'status', 'Status', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1008, 1, 'es', 'dashboard', 'show', 'Show', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1009, 0, 'es', 'login', 'login', 'Login', '2018-01-31 06:17:05', '2018-01-31 06:26:12'),
(1010, 0, 'es', 'login', 'login_text', 'Login in. To see it in action', '2018-01-31 06:17:05', '2018-01-31 06:26:12'),
(1011, 1, 'es', 'pagination', 'previous', '&laquo; Anterior', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1012, 1, 'es', 'pagination', 'next', 'Siguiente &raquo;', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1013, 1, 'es', 'passwords', 'password', 'Las contraseñas deben coincidir y contener al menos 6 caracteres', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1014, 1, 'es', 'passwords', 'reset', '¡Tu contraseña ha sido restablecida!', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1015, 1, 'es', 'passwords', 'sent', '¡Te hemos enviado por correo el enlace para restablecer tu contraseña!', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1016, 1, 'es', 'passwords', 'token', 'El token de recuperación de contraseña es inválido.', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1017, 1, 'es', 'passwords', 'user', 'No podemos encontrar ningún usuario con ese correo electrónico.', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1018, 1, 'es', 'pos', 'cart_items', 'Cart Items', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1019, 1, 'es', 'pos', 'sub_total', 'Sub Total', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1020, 1, 'es', 'pos', 'total', 'Total', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1021, 1, 'es', 'pos', 'checkout', 'Checkout', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1022, 1, 'es', 'pos', 'clear_cart', 'Clear Cart', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1023, 1, 'es', 'pos', 'how_would_you_pay', 'How would you like to pay?', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1024, 1, 'es', 'pos', 'discount', 'Discount', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1025, 1, 'es', 'pos', 'tax', 'Tax', '2018-01-31 06:17:05', '2018-01-31 06:17:05'),
(1026, 1, 'es', 'pos', 'complete_order', 'Complete Order', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1027, 1, 'es', 'validation', 'accepted', ':attribute debe ser aceptado.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1028, 1, 'es', 'validation', 'active_url', ':attribute no es una URL válida.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1029, 1, 'es', 'validation', 'after', ':attribute debe ser una fecha posterior a :date.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1030, 1, 'es', 'validation', 'after_or_equal', ':attribute debe ser una fecha posterior o igual a :date.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1031, 1, 'es', 'validation', 'alpha', ':attribute sólo debe contener letras.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1032, 1, 'es', 'validation', 'alpha_dash', ':attribute sólo debe contener letras, números y guiones.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1033, 1, 'es', 'validation', 'alpha_num', ':attribute sólo debe contener letras y números.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1034, 1, 'es', 'validation', 'array', ':attribute debe ser un conjunto.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1035, 1, 'es', 'validation', 'before', ':attribute debe ser una fecha anterior a :date.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1036, 1, 'es', 'validation', 'before_or_equal', ':attribute debe ser una fecha anterior o igual a :date.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1037, 1, 'es', 'validation', 'between.numeric', ':attribute tiene que estar entre :min - :max.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1038, 1, 'es', 'validation', 'between.file', ':attribute debe pesar entre :min - :max kilobytes.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1039, 1, 'es', 'validation', 'between.string', ':attribute tiene que tener entre :min - :max caracteres.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1040, 1, 'es', 'validation', 'between.array', ':attribute tiene que tener entre :min - :max ítems.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1041, 1, 'es', 'validation', 'boolean', 'El campo :attribute debe tener un valor verdadero o falso.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1042, 1, 'es', 'validation', 'confirmed', 'La confirmación de :attribute no coincide.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1043, 1, 'es', 'validation', 'date', ':attribute no es una fecha válida.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1044, 1, 'es', 'validation', 'date_format', ':attribute no corresponde al formato :format.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1045, 1, 'es', 'validation', 'different', ':attribute y :other deben ser diferentes.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1046, 1, 'es', 'validation', 'digits', ':attribute debe tener :digits dígitos.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1047, 1, 'es', 'validation', 'digits_between', ':attribute debe tener entre :min y :max dígitos.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1048, 1, 'es', 'validation', 'dimensions', 'Las dimensiones de la imagen :attribute no son válidas.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1049, 1, 'es', 'validation', 'distinct', 'El campo :attribute contiene un valor duplicado.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1050, 1, 'es', 'validation', 'email', ':attribute no es un correo válido', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1051, 1, 'es', 'validation', 'exists', ':attribute es inválido.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1052, 1, 'es', 'validation', 'file', 'El campo :attribute debe ser un archivo.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1053, 1, 'es', 'validation', 'filled', 'El campo :attribute es obligatorio.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1054, 1, 'es', 'validation', 'image', ':attribute debe ser una imagen.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1055, 1, 'es', 'validation', 'in', ':attribute es inválido.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1056, 1, 'es', 'validation', 'in_array', 'El campo :attribute no existe en :other.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1057, 1, 'es', 'validation', 'integer', ':attribute debe ser un número entero.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1058, 1, 'es', 'validation', 'ip', ':attribute debe ser una dirección IP válida.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1059, 1, 'es', 'validation', 'ipv4', ':attribute debe ser un dirección IPv4 válida', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1060, 1, 'es', 'validation', 'ipv6', ':attribute debe ser un dirección IPv6 válida.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1061, 1, 'es', 'validation', 'json', 'El campo :attribute debe tener una cadena JSON válida.', '2018-01-31 06:17:06', '2018-01-31 06:17:06'),
(1062, 1, 'es', 'validation', 'max.numeric', ':attribute no debe ser mayor a :max.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1063, 1, 'es', 'validation', 'max.file', ':attribute no debe ser mayor que :max kilobytes.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1064, 1, 'es', 'validation', 'max.string', ':attribute no debe ser mayor que :max caracteres.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1065, 1, 'es', 'validation', 'max.array', ':attribute no debe tener más de :max elementos.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1066, 1, 'es', 'validation', 'mimes', ':attribute debe ser un archivo con formato: :values.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1067, 1, 'es', 'validation', 'mimetypes', ':attribute debe ser un archivo con formato: :values.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1068, 1, 'es', 'validation', 'min.numeric', 'El tamaño de :attribute debe ser de al menos :min.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1069, 1, 'es', 'validation', 'min.file', 'El tamaño de :attribute debe ser de al menos :min kilobytes.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1070, 1, 'es', 'validation', 'min.string', ':attribute debe contener al menos :min caracteres.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1071, 1, 'es', 'validation', 'min.array', ':attribute debe tener al menos :min elementos.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1072, 1, 'es', 'validation', 'not_in', ':attribute es inválido.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1073, 1, 'es', 'validation', 'numeric', ':attribute debe ser numérico.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1074, 1, 'es', 'validation', 'present', 'El campo :attribute debe estar presente.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1075, 1, 'es', 'validation', 'regex', 'El formato de :attribute es inválido.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1076, 1, 'es', 'validation', 'required', 'El campo :attribute es obligatorio.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1077, 1, 'es', 'validation', 'required_if', 'El campo :attribute es obligatorio cuando :other es :value.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1078, 1, 'es', 'validation', 'required_unless', 'El campo :attribute es obligatorio a menos que :other esté en :values.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1079, 1, 'es', 'validation', 'required_with', 'El campo :attribute es obligatorio cuando :values está presente.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1080, 1, 'es', 'validation', 'required_with_all', 'El campo :attribute es obligatorio cuando :values está presente.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1081, 1, 'es', 'validation', 'required_without', 'El campo :attribute es obligatorio cuando :values no está presente.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1082, 1, 'es', 'validation', 'required_without_all', 'El campo :attribute es obligatorio cuando ninguno de :values estén presentes.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1083, 1, 'es', 'validation', 'same', ':attribute y :other deben coincidir.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1084, 1, 'es', 'validation', 'size.numeric', 'El tamaño de :attribute debe ser :size.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1085, 1, 'es', 'validation', 'size.file', 'El tamaño de :attribute debe ser :size kilobytes.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1086, 1, 'es', 'validation', 'size.string', ':attribute debe contener :size caracteres.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1087, 1, 'es', 'validation', 'size.array', ':attribute debe contener :size elementos.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1088, 1, 'es', 'validation', 'string', 'El campo :attribute debe ser una cadena de caracteres.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1089, 1, 'es', 'validation', 'timezone', 'El :attribute debe ser una zona válida.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1090, 1, 'es', 'validation', 'unique', ':attribute ya ha sido registrado.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1091, 1, 'es', 'validation', 'uploaded', 'Subir :attribute ha fallado.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1092, 1, 'es', 'validation', 'url', 'El formato :attribute es inválido.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1093, 1, 'es', 'validation', 'custom.password.min', 'La :attribute debe contener más de :min caracteres', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1094, 1, 'es', 'validation', 'custom.email.unique', 'El :attribute ya ha sido registrado.', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1095, 1, 'es', 'validation', 'attributes.name', 'nombre', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1096, 1, 'es', 'validation', 'attributes.username', 'usuario', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1097, 1, 'es', 'validation', 'attributes.email', 'correo electrónico', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1098, 1, 'es', 'validation', 'attributes.first_name', 'nombre', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1099, 1, 'es', 'validation', 'attributes.last_name', 'apellido', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1100, 1, 'es', 'validation', 'attributes.password', 'contraseña', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1101, 1, 'es', 'validation', 'attributes.password_confirmation', 'confirmación de la contraseña', '2018-01-31 06:17:07', '2018-01-31 06:17:07'),
(1102, 1, 'es', 'validation', 'attributes.city', 'ciudad', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1103, 1, 'es', 'validation', 'attributes.country', 'país', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1104, 1, 'es', 'validation', 'attributes.address', 'dirección', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1105, 1, 'es', 'validation', 'attributes.phone', 'teléfono', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1106, 1, 'es', 'validation', 'attributes.mobile', 'móvil', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1107, 1, 'es', 'validation', 'attributes.age', 'edad', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1108, 1, 'es', 'validation', 'attributes.sex', 'sexo', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1109, 1, 'es', 'validation', 'attributes.gender', 'género', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1110, 1, 'es', 'validation', 'attributes.year', 'año', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1111, 1, 'es', 'validation', 'attributes.month', 'mes', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1112, 1, 'es', 'validation', 'attributes.day', 'día', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1113, 1, 'es', 'validation', 'attributes.hour', 'hora', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1114, 1, 'es', 'validation', 'attributes.minute', 'minuto', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1115, 1, 'es', 'validation', 'attributes.second', 'segundo', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1116, 1, 'es', 'validation', 'attributes.title', 'título', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1117, 1, 'es', 'validation', 'attributes.content', 'contenido', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1118, 1, 'es', 'validation', 'attributes.body', 'contenido', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1119, 1, 'es', 'validation', 'attributes.description', 'descripción', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1120, 1, 'es', 'validation', 'attributes.excerpt', 'extracto', '2018-01-31 06:17:08', '2018-01-31 06:17:08'),
(1121, 1, 'es', 'validation', 'attributes.date', 'fecha', '2018-01-31 06:17:09', '2018-01-31 06:17:09'),
(1122, 1, 'es', 'validation', 'attributes.time', 'hora', '2018-01-31 06:17:09', '2018-01-31 06:17:09'),
(1123, 1, 'es', 'validation', 'attributes.subject', 'asunto', '2018-01-31 06:17:09', '2018-01-31 06:17:09'),
(1124, 1, 'es', 'validation', 'attributes.message', 'mensaje', '2018-01-31 06:17:09', '2018-01-31 06:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `order_by` int NOT NULL,
  `translate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_10_16_183611_create_categories_table', 0),
(2, '2017_10_16_183611_create_customers_table', 0),
(3, '2017_10_16_183611_create_homepage_table', 0),
(4, '2017_10_16_183611_create_menus_table', 0),
(5, '2017_10_16_183611_create_newsletters_table', 0),
(6, '2017_10_16_183611_create_pages_table', 0),
(7, '2017_10_16_183611_create_password_resets_table', 0),
(8, '2017_10_16_183611_create_permission_role_table', 0),
(9, '2017_10_16_183611_create_permissions_table', 0),
(10, '2017_10_16_183611_create_products_table', 0),
(11, '2017_10_16_183611_create_roles_table', 0),
(12, '2017_10_16_183611_create_sale_items_table', 0),
(13, '2017_10_16_183611_create_sales_table', 0),
(14, '2017_10_16_183611_create_settings_table', 0),
(15, '2017_10_16_183611_create_sliders_table', 0),
(16, '2017_10_16_183611_create_suppliers_table', 0),
(17, '2017_10_16_183611_create_users_table', 0),
(18, '2017_10_23_101103_create_categories_table', 0),
(19, '2017_10_23_101103_create_customers_table', 0),
(20, '2017_10_23_101103_create_homepage_table', 0),
(21, '2017_10_23_101103_create_menus_table', 0),
(22, '2017_10_23_101103_create_newsletters_table', 0),
(23, '2017_10_23_101103_create_pages_table', 0),
(24, '2017_10_23_101103_create_password_resets_table', 0),
(25, '2017_10_23_101103_create_permission_role_table', 0),
(26, '2017_10_23_101103_create_permissions_table', 0),
(27, '2017_10_23_101103_create_products_table', 0),
(28, '2017_10_23_101103_create_roles_table', 0),
(29, '2017_10_23_101103_create_sale_items_table', 0),
(30, '2017_10_23_101103_create_sales_table', 0),
(31, '2017_10_23_101103_create_settings_table', 0),
(32, '2017_10_23_101103_create_sliders_table', 0),
(33, '2017_10_23_101103_create_suppliers_table', 0),
(34, '2017_10_23_101103_create_users_table', 0),
(35, '2017_12_15_163503_entrust_setup_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `parent_id` int NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `image`, `body`, `parent_id`, `is_delete`) VALUES
(1, 'Terms & Condition', 'services', '574724_page.jpg', 'Pellentesque pellentesque eget tempor tellus. Fusce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. Fusce lacinia tempor malesuada.\r\n\r\n                            <h2>H2 Heading</h2>\r\n                            <p>Pellentesque pellentesque usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus.  tellus eget tempor. Fusce lacinia tempor malesuada.</p>\r\n\r\n                            <h3>H3 Heading</h3>\r\n                            <p>Pellentesque tempor tellus eget pellentesque. usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus.  Fusce lacinia tempor malesuada.</p>\r\n\r\n                            <h4>H4 Heading</h4>\r\n                            <p>Pellentesque pellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. </p>\r\n\r\n                            <h5>H5 Heading</h5><div>this is a test editing </div>\r\n                            <p>Pellentesque pellentesque tempor llentesque pellentesque tempor tellus eget libero llentesque pellentesque tempor tellus eget libero tellus ementellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellenellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellenum.</p>\r\n\r\n                            <h6>H6 Heading</h6>\r\n                            <p>Pellentesque pellentesque tempor tellus eget libero</p>', 0, 0),
(2, 'FAQ', 'faq', 'page2.jpg', '<div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span><span style=\"font-weight: bold;\"><br></span></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?<br></span></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><br></span></div><div><span style=\"font-weight: bold;\">1 : this is a question number 1</span><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><br></span></div><div><span style=\"font-weight: bold;\">1 : this is a question number 1</span><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><br></span></div><div><span style=\"color: rgb(102, 102, 102); font-family: \" varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\"><span style=\"color: rgb(103, 106, 108); font-weight: bold;\">1 : this is a question number 1</span><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\"><br></span></div><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\"><span style=\"color: rgb(103, 106, 108); font-weight: bold;\">1 : this is a question number 1</span><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\"><br></span></div><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\"><span style=\"color: rgb(103, 106, 108); font-weight: bold;\">1 : this is a question number 1</span><div style=\"color: rgb(103, 106, 108);\"><span varela=\"\" round\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\" style=\"color: rgb(102, 102, 102);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique?</span></div></span></div></span></div></span></div>', 0, 0),
(3, 'About Us', 'about-us', 'page3.jpg', '<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. </p>\r\n\r\n\r\n<h2> Heading 2</h2>\r\n\r\n<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. </p><p><br></p><h2 style=\"color: rgb(103, 106, 108);\">Heading 2</h2><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat.</p>', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'view_sale', 'View Sales ', NULL, 1, NULL, NULL),
(2, 'add_sale', 'Add Sales', NULL, 1, NULL, NULL),
(3, 'add_product', 'Add Product ', NULL, 1, NULL, NULL),
(4, 'view_products', 'View Products', NULL, 1, NULL, NULL),
(5, 'edit_products', 'Edit Products', NULL, 1, NULL, NULL),
(6, 'delete_products', 'Delete Products', NULL, 1, NULL, NULL),
(7, 'add_category', 'Add Category ', NULL, 1, NULL, NULL),
(8, 'view_categorys', 'View Categorys', NULL, 1, NULL, NULL),
(9, 'edit_categorys', 'Edit Categorys', NULL, 1, NULL, NULL),
(10, 'delete_categorys', 'Delete Categorys', NULL, 1, NULL, NULL),
(11, 'add_expense', 'Add Expense ', NULL, 1, NULL, NULL),
(12, 'view_expense', 'View Expenses', NULL, 1, NULL, NULL),
(13, 'edit_expense', 'Edit Expenses', NULL, 1, NULL, NULL),
(14, 'delete_expense', 'Delete Expenses', NULL, 1, NULL, NULL),
(15, 'setting', 'Overall Setting', NULL, 0, NULL, NULL),
(16, 'frontend_setting', 'Frontend Setting', NULL, 0, NULL, NULL),
(17, 'reports', 'View Reports ', NULL, 1, NULL, NULL),
(18, 'roles', 'Manage Roles ', NULL, 1, NULL, NULL),
(19, 'dashboard', 'Dasoboard', NULL, 1, NULL, NULL),
(20, 'users', 'Manage Users', NULL, 1, NULL, NULL),
(21, 'Profile', 'View Profile', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(1, 2),
(2, 2),
(4, 2),
(5, 2),
(6, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(19, 2),
(21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `titles` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prices` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `is_delete` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `barcode`, `name`, `description`, `titles`, `prices`, `quantity`, `is_delete`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 12, NULL, 'Amala', 'Fresh Amala', '[\"with Ewedu\",\"with Efo riro\",\"With Egusi\"]', '[\"300\",\"500\",\"450\"]', 0, 0, '2022-07-26 13:54:47', '2022-07-26 13:54:47', NULL),
(2, 12, NULL, 'Eba', 'Fresh Eba ibo', '[\"with Ewedu\",\"with gbegiri\",\"with efo riri\"]', '[\"300\",\"500\",\"450\"]', 0, 0, '2022-07-26 13:55:37', '2022-07-26 13:55:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(55) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_amount` decimal(25,2) DEFAULT NULL,
  `tax` decimal(25,2) DEFAULT NULL,
  `discount` decimal(25,2) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `paid` decimal(25,2) DEFAULT NULL,
  `paid_by` enum('cash','cheque') DEFAULT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
CREATE TABLE IF NOT EXISTS `purchase_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `units` int NOT NULL DEFAULT '1',
  `unit_price` double(10,2) DEFAULT NULL,
  `gross_total` double(10,2) DEFAULT NULL,
  `sold_price` double(10,2) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `guests` int DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_time` time DEFAULT NULL,
  `comments` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Booked','Cancelled') NOT NULL DEFAULT 'Booked',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Super Administrator', 'Main Admin', NULL, '2022-07-26 14:39:29'),
(2, 'manager', 'Sales Manager', NULL, NULL, '2022-07-26 14:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(5, 1),
(12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT '0',
  `cashier_id` int DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1:completed, 0 canceled',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) DEFAULT '0.00',
  `vat` double(10,2) DEFAULT '0.00',
  `delivery_cost` double(10,2) DEFAULT '0.00',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Walk-in customer',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'pos',
  `payment_with` enum('card','cash') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'cash',
  `total_given` double(10,2) DEFAULT NULL,
  `change` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `cashier_id`, `comments`, `created_at`, `updated_at`, `status`, `amount`, `discount`, `vat`, `delivery_cost`, `name`, `email`, `phone`, `address`, `comment`, `type`, `payment_with`, `total_given`, `change`) VALUES
(1, NULL, 5, 'payment made', '2022-07-26 13:57:39', '2022-07-26 14:50:15', 0, 1100.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'pos', 'cash', 1100.00, 0.00),
(2, 1, 12, 'thanks', '2022-07-26 14:24:41', '2022-07-26 14:50:13', 0, 1700.00, 0.00, 0.00, 0.00, 'Walk-in customer', NULL, NULL, NULL, NULL, 'order', 'card', 1700.00, 0.00),
(3, NULL, 12, 'payment completed', '2022-07-26 14:42:57', '2022-07-26 14:49:58', 0, 322.50, 0.00, 22.50, 0.00, 'Walk-in customer', NULL, NULL, NULL, NULL, 'pos', 'cash', 322.50, 0.00),
(4, NULL, 5, NULL, '2022-07-26 14:49:14', '2022-07-26 14:49:55', 0, 53756181.25, 0.00, 3750431.25, 0.00, NULL, NULL, NULL, NULL, NULL, 'pos', 'cash', 53756181.00, -0.25);

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
CREATE TABLE IF NOT EXISTS `sale_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `p_qty` int NOT NULL DEFAULT '0',
  `size` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `price`, `quantity`, `p_qty`, `size`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '300.00', 2, 0, 'with Ewedu', '2022-07-26 13:57:39', '2022-07-26 13:57:39'),
(2, 1, 1, '500.00', 1, 0, 'with Efo riro', '2022-07-26 13:57:39', '2022-07-26 13:57:39'),
(3, 2, 2, '500.00', 1, 0, 'with gbegiri', '2022-07-26 14:24:41', '2022-07-26 14:24:41'),
(4, 2, 1, '450.00', 1, 0, 'With Egusi', '2022-07-26 14:24:41', '2022-07-26 14:24:41'),
(5, 2, 2, '450.00', 1, 0, 'with efo riri', '2022-07-26 14:24:41', '2022-07-26 14:24:41'),
(6, 2, 2, '300.00', 1, 0, 'with Ewedu', '2022-07-26 14:24:41', '2022-07-26 14:24:41'),
(7, 3, 2, '300.00', 1, 0, 'with Ewedu', '2022-07-26 14:42:57', '2022-07-26 14:42:57'),
(8, 4, 2, '500.00', 11, 0, 'with gbegiri', '2022-07-26 14:49:14', '2022-07-26 14:49:14'),
(9, 4, 2, '450.00', 111111, 0, 'with efo riri', '2022-07-26 14:49:14', '2022-07-26 14:49:14'),
(10, 4, 2, '300.00', 1, 0, 'with Ewedu', '2022-07-26 14:49:14', '2022-07-26 14:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'Site Title', 'Bukky Restaurant', NULL, '2022-07-26 14:00:54'),
(2, 'phone', 'Phone', '0801111122', NULL, '2022-07-26 14:00:54'),
(3, 'email', 'Email', 'bukky@gmail.com', NULL, '2022-07-26 14:00:54'),
(4, 'address', 'Address', '1b, fasasi road, bukky estate, Ibadan', NULL, '2022-07-26 14:00:54'),
(5, 'country', 'Country', 'Nigeria', NULL, '2022-07-26 14:00:54'),
(6, 'timing1', 'Monday To Saturday', '8 am a 9 pm', NULL, '2018-12-14 21:58:02'),
(7, 'sunday', 'Sunday', 'Cerrado', NULL, '2018-12-14 21:58:02'),
(8, 'facebook', 'Facebook', '', NULL, '2022-07-26 14:25:30'),
(9, 'twitter', 'Twitter', '', NULL, '2022-07-26 14:25:30'),
(10, 'vat', 'VAT', '7.5', NULL, '2022-07-26 14:25:30'),
(11, 'delivery_cost', 'Delivery Cost', '20', NULL, '2018-12-14 21:58:02'),
(12, 'currency', 'Currency', 'NGN', NULL, '2022-07-26 14:00:54'),
(13, 'lng', 'Longitude', '', NULL, '2022-07-26 14:25:30'),
(14, 'lat', 'Latitude', '', NULL, '2022-07-26 14:25:30'),
(15, 'stripe', 'Stripe Payment', 'no', NULL, '2022-07-26 14:05:27'),
(16, 'frontend', 'Hide Frontend', 'yes', NULL, '2022-07-26 14:00:54'),
(17, 'promotions', 'Receipt Message', 'Thanks for your patronage', NULL, '2022-07-26 14:00:54'),
(18, 'discount', 'Discount ($)', '0', NULL, '2018-12-14 21:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(6, 'Slider Image', '333296.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suppliers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `table_name`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, NULL),
(2, '2', NULL, NULL),
(3, '3', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Admin', 'admin@bukky.com', '$2y$10$NDJ8GvTAdoJ/uG0AQ2Y.9ucXwjy75NVf.VgFnSZDSakRRvrEyAlMq', 1, 'V9dmK7QBTJIfBcKFhyZ9Ejh7AqN0zOdRkUGjhI6yUlKjb9QBAfkauuspgsFo', NULL, '2022-07-26 14:45:41'),
(12, 'Bukky Bukky', 'bukky@gmail.com', '$2y$10$gn.zbjFb4rGxPkGDkT/vD.k9p9zLiStS0eQJFkFp28YsuGm5xm4SG', 2, '1DEZvR6btckZBHCYrk0GQPCiTUO0AicegfVs9zbofiU7gmLnrCI15scsmJ4E', '2022-07-26 14:20:26', '2022-07-26 14:20:26');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
