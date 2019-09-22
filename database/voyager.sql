-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.37-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table voyager.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
REPLACE INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Category 1', 'category-1', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(2, NULL, 1, 'Category 2', 'category-2', '2019-09-21 17:17:17', '2019-09-21 17:17:17');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table voyager.custom_controller
CREATE TABLE IF NOT EXISTS `custom_controller` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.custom_controller: ~0 rows (approximately)
/*!40000 ALTER TABLE `custom_controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_controller` ENABLE KEYS */;

-- Dumping structure for table voyager.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.data_rows: ~69 rows (approximately)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
REPLACE INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{"default":"","null":"","options":{"":"-- None --"},"relationship":{"key":"id","label":"name"}}', 2),
	(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{"default":1}', 3),
	(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
	(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name"}}', 5),
	(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
	(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
	(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
	(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
	(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
	(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title"},"validation":{"rule":"unique:pages,slug"}}', 6),
	(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
	(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
	(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"INACTIVE","options":{"INACTIVE":"INACTIVE","ACTIVE":"ACTIVE"}}', 9),
	(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
	(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
	(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
	(98, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(99, 17, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
	(100, 17, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
	(101, 17, 'photo', 'image', 'Photo', 0, 1, 1, 1, 1, 1, '{}', 4),
	(102, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
	(103, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
	(106, 17, 'id_user', 'text', 'Id User', 1, 1, 1, 1, 1, 1, '{}', 5),
	(108, 17, 'test_belongstomany_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"user_test","pivot":"1","taggable":null}', 7),
	(109, 17, 'test_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"id","key":"id","label":"name","pivot_table":"categories","pivot":"0","taggable":null}', 8),
	(110, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(111, 19, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
	(112, 19, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
	(113, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(114, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table voyager.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.data_types: ~9 rows (approximately)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
REPLACE INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(17, 'test', 'test', 'Test', 'Tests', NULL, 'App\\Models\\Test', NULL, NULL, NULL, 1, 1, '{"order_column":"id","order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2019-09-21 18:08:05', '2019-09-22 08:57:13'),
	(19, 'custom_controller', 'custom-controller', 'Custom Controller', 'Custom Controllers', NULL, 'App\\Models\\CustomController', NULL, 'App\\Http\\Controllers\\Admin\\CustomController', NULL, 1, 1, '{"order_column":"id","order_display_column":null,"order_direction":"desc","default_search_key":null}', '2019-09-22 09:14:12', '2019-09-22 09:14:12');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table voyager.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.menus: ~1 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
REPLACE INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2019-09-21 17:17:15', '2019-09-21 17:17:15');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table voyager.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.menu_items: ~16 rows (approximately)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
REPLACE INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-09-21 17:17:15', '2019-09-21 17:17:15', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2019-09-21 17:17:15', '2019-09-21 17:22:57', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-09-21 17:17:15', '2019-09-21 17:17:15', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-09-21 17:17:15', '2019-09-21 17:17:15', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-09-21 17:17:15', '2019-09-21 17:17:15', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-09-21 17:17:15', '2019-09-21 17:22:57', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-09-21 17:17:15', '2019-09-21 17:22:57', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-09-21 17:17:15', '2019-09-21 17:22:57', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-09-21 17:17:15', '2019-09-21 17:22:57', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2019-09-21 17:17:15', '2019-09-21 17:22:57', 'voyager.settings.index', NULL),
	(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2019-09-21 17:17:17', '2019-09-21 17:17:17', 'voyager.categories.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2019-09-21 17:17:17', '2019-09-21 17:22:57', 'voyager.posts.index', NULL),
	(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2019-09-21 17:17:17', '2019-09-21 17:22:57', 'voyager.pages.index', NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-09-21 17:17:18', '2019-09-21 17:22:57', 'voyager.hooks', NULL),
	(22, 1, 'Tests', '', '_self', 'voyager-hammer', '#000000', NULL, 11, '2019-09-21 18:08:05', '2019-09-22 11:58:29', 'voyager.test.index', 'null'),
	(28, 1, 'Custom Controllers', '/admin/custom-controller', '_self', 'voyager-hammer', '#000000', NULL, 12, '2019-09-22 12:37:43', '2019-09-22 12:37:43', NULL, '');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table voyager.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.migrations: ~26 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2016_01_01_000000_create_pages_table', 2),
	(24, '2016_01_01_000000_create_posts_table', 2),
	(25, '2016_02_15_204651_create_categories_table', 2),
	(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table voyager.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.pages: ~1 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
REPLACE INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-09-21 17:17:17', '2019-09-21 17:17:17');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table voyager.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table voyager.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.permissions: ~51 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
REPLACE INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(2, 'browse_bread', NULL, '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(3, 'browse_database', NULL, '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(4, 'browse_media', NULL, '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(5, 'browse_compass', NULL, '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(6, 'browse_menus', 'menus', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(7, 'read_menus', 'menus', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(8, 'edit_menus', 'menus', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(9, 'add_menus', 'menus', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(10, 'delete_menus', 'menus', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(11, 'browse_roles', 'roles', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(12, 'read_roles', 'roles', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(13, 'edit_roles', 'roles', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(14, 'add_roles', 'roles', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(15, 'delete_roles', 'roles', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(16, 'browse_users', 'users', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(17, 'read_users', 'users', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(18, 'edit_users', 'users', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(19, 'add_users', 'users', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(20, 'delete_users', 'users', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(21, 'browse_settings', 'settings', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(22, 'read_settings', 'settings', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(23, 'edit_settings', 'settings', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(24, 'add_settings', 'settings', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(25, 'delete_settings', 'settings', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(26, 'browse_categories', 'categories', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(27, 'read_categories', 'categories', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(28, 'edit_categories', 'categories', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(29, 'add_categories', 'categories', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(30, 'delete_categories', 'categories', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(31, 'browse_posts', 'posts', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(32, 'read_posts', 'posts', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(33, 'edit_posts', 'posts', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(34, 'add_posts', 'posts', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(35, 'delete_posts', 'posts', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(36, 'browse_pages', 'pages', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(37, 'read_pages', 'pages', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(38, 'edit_pages', 'pages', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(39, 'add_pages', 'pages', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(40, 'delete_pages', 'pages', '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(41, 'browse_hooks', NULL, '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(77, 'browse_test', 'test', '2019-09-21 18:08:05', '2019-09-21 18:08:05'),
	(78, 'read_test', 'test', '2019-09-21 18:08:05', '2019-09-21 18:08:05'),
	(79, 'edit_test', 'test', '2019-09-21 18:08:05', '2019-09-21 18:08:05'),
	(80, 'add_test', 'test', '2019-09-21 18:08:05', '2019-09-21 18:08:05'),
	(81, 'delete_test', 'test', '2019-09-21 18:08:05', '2019-09-21 18:08:05'),
	(82, 'browse_custom_controller', 'custom_controller', '2019-09-22 09:14:12', '2019-09-22 09:14:12'),
	(83, 'read_custom_controller', 'custom_controller', '2019-09-22 09:14:12', '2019-09-22 09:14:12'),
	(84, 'edit_custom_controller', 'custom_controller', '2019-09-22 09:14:12', '2019-09-22 09:14:12'),
	(85, 'add_custom_controller', 'custom_controller', '2019-09-22 09:14:12', '2019-09-22 09:14:12'),
	(86, 'delete_custom_controller', 'custom_controller', '2019-09-22 09:14:12', '2019-09-22 09:14:12');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table voyager.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.permission_role: ~111 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
REPLACE INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 1),
	(3, 3),
	(4, 1),
	(4, 3),
	(5, 1),
	(5, 3),
	(6, 1),
	(6, 3),
	(7, 1),
	(7, 3),
	(8, 1),
	(8, 3),
	(9, 1),
	(9, 3),
	(10, 1),
	(10, 3),
	(11, 1),
	(11, 3),
	(12, 1),
	(12, 3),
	(13, 1),
	(13, 3),
	(14, 1),
	(14, 3),
	(15, 1),
	(15, 3),
	(16, 1),
	(16, 3),
	(17, 1),
	(17, 3),
	(18, 1),
	(18, 3),
	(19, 1),
	(19, 3),
	(20, 1),
	(20, 3),
	(21, 1),
	(21, 3),
	(22, 1),
	(22, 3),
	(23, 1),
	(23, 3),
	(24, 1),
	(24, 3),
	(25, 1),
	(25, 3),
	(26, 1),
	(26, 3),
	(27, 1),
	(27, 3),
	(28, 1),
	(28, 3),
	(29, 1),
	(29, 3),
	(30, 1),
	(30, 3),
	(31, 1),
	(31, 3),
	(32, 1),
	(32, 3),
	(33, 1),
	(33, 3),
	(34, 1),
	(34, 3),
	(35, 1),
	(35, 3),
	(36, 1),
	(36, 3),
	(37, 1),
	(37, 3),
	(38, 1),
	(38, 3),
	(39, 1),
	(39, 3),
	(40, 1),
	(40, 3),
	(41, 3),
	(77, 1),
	(77, 2),
	(77, 3),
	(78, 1),
	(78, 2),
	(78, 3),
	(79, 1),
	(79, 2),
	(79, 3),
	(80, 1),
	(80, 2),
	(80, 3),
	(81, 1),
	(81, 2),
	(81, 3),
	(82, 1),
	(82, 2),
	(82, 3),
	(83, 1),
	(83, 2),
	(83, 3),
	(84, 1),
	(84, 2),
	(84, 3),
	(85, 1),
	(85, 2),
	(85, 3),
	(86, 1),
	(86, 2),
	(86, 3);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table voyager.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.posts: ~5 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
REPLACE INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-09-21 17:17:17', '2019-09-21 17:17:17');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table voyager.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(2, 'user', 'Normal User', '2019-09-21 17:17:15', '2019-09-21 17:17:15'),
	(3, 'manager', 'manager', '2019-09-22 11:53:48', '2019-09-22 11:53:48');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table voyager.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.settings: ~10 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
REPLACE INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyagers', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table voyager.test
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.test: ~1 rows (approximately)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
REPLACE INTO `test` (`id`, `name`, `email`, `photo`, `id_user`, `created_at`, `updated_at`) VALUES
	(1, 'test', 'tester@tester.com', 'test\\September2019\\CogrFvlbnm9THEffjk5v.png', 1, '2019-09-21 17:51:00', '2019-09-22 10:21:09');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- Dumping structure for table voyager.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.translations: ~30 rows (approximately)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
REPLACE INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-09-21 17:17:18', '2019-09-21 17:17:18'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-09-21 17:17:18', '2019-09-21 17:17:18');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table voyager.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$RJodoDbgJWrl2rH/M9zIj.R8tyPrDbYT.oOk0xKpsiy21gjKu79vi', 'NwU96NiVPGP2mNicvel4vIMTOpSPiaTg0xFiC8N5408ywufR7GJHjOfeWmAU', NULL, '2019-09-21 17:17:17', '2019-09-21 17:17:17'),
	(2, 3, 'test', 'test@test.com', 'users/default.png', NULL, '$2y$10$t0nwGzYw4Gf7OouJZ5EIFuDLC29z.7a2bKpIf1kl.czZNa0e6w0Pe', NULL, '{"locale":"en"}', '2019-09-22 10:51:17', '2019-09-22 11:54:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table voyager.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table voyager.user_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Dumping structure for table voyager.user_test
CREATE TABLE IF NOT EXISTS `user_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table voyager.user_test: ~1 rows (approximately)
/*!40000 ALTER TABLE `user_test` DISABLE KEYS */;
REPLACE INTO `user_test` (`id`, `user_id`, `test_id`, `created_at`, `update_at`) VALUES
	(1, 1, 1, '2019-09-22 16:06:02', NULL);
/*!40000 ALTER TABLE `user_test` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
