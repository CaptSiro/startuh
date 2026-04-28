-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 28, 2026 at 12:41 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rc_startuh`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_ai_page`
--

DROP TABLE IF EXISTS `core_ai_page`;
CREATE TABLE IF NOT EXISTS `core_ai_page` (
  `id_ai_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `prompt` text NOT NULL,
  PRIMARY KEY (`id_ai_page`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_domain`
--

DROP TABLE IF EXISTS `core_domain`;
CREATE TABLE IF NOT EXISTS `core_domain` (
  `id_domain` int NOT NULL AUTO_INCREMENT,
  `protocol` varchar(8) NOT NULL DEFAULT 'http',
  `host` varchar(255) NOT NULL,
  `port` int NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `cost` int NOT NULL DEFAULT '1',
  `is_enabled` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_external_page`
--

DROP TABLE IF EXISTS `core_external_page`;
CREATE TABLE IF NOT EXISTS `core_external_page` (
  `id_external_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id_external_page`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_external_page`
--

INSERT INTO `core_external_page` (`id_external_page`, `id_page`, `url`) VALUES
(1, 1, 'http://localhost/startuh/'),
(2, 7, 'http://localhost/startuh/extension');

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_directory`
--

DROP TABLE IF EXISTS `core_fs_directory`;
CREATE TABLE IF NOT EXISTS `core_fs_directory` (
  `id_fs_directory` int NOT NULL AUTO_INCREMENT,
  `id_fs_parent` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fs_directory`),
  KEY `id_fs_parent` (`id_fs_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_file`
--

DROP TABLE IF EXISTS `core_fs_file`;
CREATE TABLE IF NOT EXISTS `core_fs_file` (
  `id_fs_file` int NOT NULL AUTO_INCREMENT,
  `id_fs_parent` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `extension` varchar(16) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `type` varchar(128) NOT NULL,
  `size` mediumtext NOT NULL,
  PRIMARY KEY (`id_fs_file`),
  KEY `id_fs_parent` (`id_fs_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=879 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_image_variant`
--

DROP TABLE IF EXISTS `core_fs_image_variant`;
CREATE TABLE IF NOT EXISTS `core_fs_image_variant` (
  `id_fs_image_variant` int NOT NULL AUTO_INCREMENT,
  `transformer` varchar(255) NOT NULL,
  `version` int DEFAULT '1',
  `quality` float DEFAULT '1',
  `function` varchar(255) NOT NULL,
  `width` int DEFAULT '-1',
  `height` int DEFAULT '-1',
  PRIMARY KEY (`id_fs_image_variant`),
  UNIQUE KEY `transformer` (`transformer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_fs_image_variant`
--

INSERT INTO `core_fs_image_variant` (`id_fs_image_variant`, `transformer`, `version`, `quality`, `function`, `width`, `height`) VALUES
(1, 'full-hd', 1, 1, 'fit', 1920, 1080),
(2, 'hd', 1, 1, 'fit', 1280, 720);

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_shortcut`
--

DROP TABLE IF EXISTS `core_fs_shortcut`;
CREATE TABLE IF NOT EXISTS `core_fs_shortcut` (
  `id_fs_shortcut` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_fs_file` int NOT NULL,
  PRIMARY KEY (`id_fs_shortcut`),
  UNIQUE KEY `name` (`name`),
  KEY `id_fs_file` (`id_fs_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_group`
--

DROP TABLE IF EXISTS `core_group`;
CREATE TABLE IF NOT EXISTS `core_group` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_group`
--

INSERT INTO `core_group` (`id_group`, `name`, `is_editable`) VALUES
(1, 'Default', 0),
(2, 'Root', 0),
(3, 'Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_groups_x_resources`
--

DROP TABLE IF EXISTS `core_groups_x_resources`;
CREATE TABLE IF NOT EXISTS `core_groups_x_resources` (
  `id_group` int NOT NULL,
  `id_resource` int NOT NULL,
  `id_privilege` int NOT NULL,
  UNIQUE KEY `id_group` (`id_group`,`id_resource`,`id_privilege`),
  KEY `id_resource` (`id_resource`),
  KEY `id_privilege` (`id_privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_language`
--

DROP TABLE IF EXISTS `core_language`;
CREATE TABLE IF NOT EXISTS `core_language` (
  `id_language` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_language`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_language`
--

INSERT INTO `core_language` (`id_language`, `code`, `is_default`) VALUES
(1, 'en-US', 1),
(2, 'cs-CZ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon`
--

DROP TABLE IF EXISTS `core_lexicon`;
CREATE TABLE IF NOT EXISTS `core_lexicon` (
  `id_phrase` int NOT NULL AUTO_INCREMENT,
  `id_lexicon_group` int NOT NULL,
  `default` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_phrase`),
  KEY `id_lexicon_group` (`id_lexicon_group`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_lexicon`
--

INSERT INTO `core_lexicon` (`id_phrase`, `id_lexicon_group`, `default`, `is_dynamic`) VALUES
(1, 1, 'Name', 0),
(2, 2, 'Create', 0),
(3, 1, 'Priority', 0),
(4, 1, 'Status', 0),
(5, 1, 'Title', 0),
(6, 1, 'Template', 0),
(7, 3, 'Pages', 0),
(8, 1, 'Function', 0),
(9, 1, 'Group', 0),
(10, 1, 'Default', 0),
(11, 1, 'Translations', 0),
(12, 1, 'Username', 0),
(13, 1, 'Tag', 0),
(14, 1, 'Value', 0),
(15, 4, 'Search articles...', 0),
(16, 4, 'No results found', 0),
(17, 5, 'Language select', 0),
(18, 6, 'Reimagine Your New Tab', 0),
(19, 6, 'A focused, distraction-free workspace that blends productivity, aesthetics, and speed.', 0),
(20, 6, 'Install Extension', 0),
(21, 6, 'View Documentation', 0),
(22, 6, 'Fast', 0),
(23, 6, 'Loads instantly with zero clutter and optimized rendering.', 0),
(24, 6, 'Customizable', 0),
(25, 6, 'Control layout, widgets, and behavior without complexity.', 0),
(26, 6, 'Minimal', 0),
(27, 6, 'Only what you need. No noise, no distractions.', 0),
(28, 6, 'Modular by Design', 0),
(29, 6, 'Build your tab like a system. Add, remove, and rearrange components effortlessly.', 0),
(30, 6, 'Seamless Sync', 0),
(31, 6, 'Your setup follows you across devices with consistent behavior and layout.', 0),
(32, 6, 'Designed for Focus', 0),
(33, 6, 'Clean visuals, subtle motion, and intentional spacing keep you in flow.', 0),
(34, 6, 'See It in Action', 0),
(35, 6, 'Start Using It Today', 0),
(36, 6, 'No setup. No friction. Just install and go.', 0),
(37, 6, 'Get Started', 0),
(38, 7, 'Highly customizable chrome extension', 0),
(39, 7, 'Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_group`
--

DROP TABLE IF EXISTS `core_lexicon_group`;
CREATE TABLE IF NOT EXISTS `core_lexicon_group` (
  `id_lexicon_group` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_lexicon_group`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_lexicon_group`
--

INSERT INTO `core_lexicon_group` (`id_lexicon_group`, `name`) VALUES
(2, 'admin.nexus'),
(3, 'admin.page.editor'),
(7, 'footer'),
(1, 'grid.labels'),
(6, 'home'),
(5, 'language.select'),
(4, 'search');

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_rule`
--

DROP TABLE IF EXISTS `core_lexicon_rule`;
CREATE TABLE IF NOT EXISTS `core_lexicon_rule` (
  `id_rule` int NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_rule`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_lexicon_rule`
--

INSERT INTO `core_lexicon_rule` (`id_rule`, `rule`, `label`) VALUES
(1, '/.*/', '*'),
(2, '/^1$/', '1'),
(3, '/^[2-4]$/', '2-4'),
(4, '/^0|[2-9]|\\d{2,}$/', '0, 2+'),
(5, '/^0|[5-9]|\\d{2,}$/', '0, 5+');

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_translation`
--

DROP TABLE IF EXISTS `core_lexicon_translation`;
CREATE TABLE IF NOT EXISTS `core_lexicon_translation` (
  `id_translation` int NOT NULL AUTO_INCREMENT,
  `id_phrase` int NOT NULL,
  `id_language` int NOT NULL,
  `translation` text NOT NULL,
  `id_rule` int DEFAULT NULL,
  PRIMARY KEY (`id_translation`),
  KEY `id_phrase` (`id_phrase`),
  KEY `id_language` (`id_language`),
  KEY `id_rule` (`id_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_menu`
--

DROP TABLE IF EXISTS `core_menu`;
CREATE TABLE IF NOT EXISTS `core_menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_menu`
--

INSERT INTO `core_menu` (`id_menu`, `name`) VALUES
(1, 'Header'),
(2, 'Footer'),
(3, 'Legal'),
(4, 'Header (Docs)');

-- --------------------------------------------------------

--
-- Table structure for table `core_menu_x_pages`
--

DROP TABLE IF EXISTS `core_menu_x_pages`;
CREATE TABLE IF NOT EXISTS `core_menu_x_pages` (
  `id_menu` int NOT NULL,
  `id_page` int NOT NULL,
  UNIQUE KEY `id_menu` (`id_menu`,`id_page`),
  KEY `id_page` (`id_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_menu_x_pages`
--

INSERT INTO `core_menu_x_pages` (`id_menu`, `id_page`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 7),
(2, 8),
(4, 1),
(4, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `core_module`
--

DROP TABLE IF EXISTS `core_module`;
CREATE TABLE IF NOT EXISTS `core_module` (
  `identifier` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation`
--

DROP TABLE IF EXISTS `core_navigation`;
CREATE TABLE IF NOT EXISTS `core_navigation` (
  `id_slug` int NOT NULL AUTO_INCREMENT,
  `id_navigation_context` int NOT NULL,
  `id_parent` int DEFAULT NULL,
  `id_language` int NOT NULL,
  `slug` varchar(255) NOT NULL,
  `id_navigation_factory` int DEFAULT NULL,
  `data` varchar(255) DEFAULT '',
  PRIMARY KEY (`id_slug`),
  UNIQUE KEY `id_navigation_context` (`id_navigation_context`,`id_parent`,`id_language`,`slug`),
  KEY `id_parent` (`id_parent`),
  KEY `id_language` (`id_language`),
  KEY `id_navigation_factory` (`id_navigation_factory`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation`
--

INSERT INTO `core_navigation` (`id_slug`, `id_navigation_context`, `id_parent`, `id_language`, `slug`, `id_navigation_factory`, `data`) VALUES
(1, 1, NULL, 1, 'startuh', 1, '1'),
(2, 1, NULL, 1, 'install-extension', 1, '2'),
(3, 1, NULL, 1, 'documentation', 1, '3'),
(4, 1, 3, 1, 'editor', 1, '4'),
(7, 1, 3, 1, 'try-extension', 1, '7'),
(8, 1, 3, 1, 'widgets', 1, '8'),
(9, 1, 8, 1, 'time', 1, '9'),
(10, 1, 8, 1, 'bookmarks', 1, '10'),
(11, 1, 8, 1, 'creating-custom-widget', 1, '11');

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation_context`
--

DROP TABLE IF EXISTS `core_navigation_context`;
CREATE TABLE IF NOT EXISTS `core_navigation_context` (
  `id_navigation_context` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_navigation_context`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation_context`
--

INSERT INTO `core_navigation_context` (`id_navigation_context`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation_factory`
--

DROP TABLE IF EXISTS `core_navigation_factory`;
CREATE TABLE IF NOT EXISTS `core_navigation_factory` (
  `id_navigation_factory` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_navigation_factory`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation_factory`
--

INSERT INTO `core_navigation_factory` (`id_navigation_factory`, `name`) VALUES
(1, 'page');

-- --------------------------------------------------------

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
CREATE TABLE IF NOT EXISTS `core_page` (
  `id_page` int NOT NULL AUTO_INCREMENT,
  `id_page_parent` int DEFAULT NULL,
  `id_page_template` int NOT NULL,
  `id_page_status` int NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `publish` datetime DEFAULT NULL,
  `remove` datetime DEFAULT NULL,
  `priority` int DEFAULT '0',
  PRIMARY KEY (`id_page`),
  KEY `id_page_template` (`id_page_template`),
  KEY `id_page_status` (`id_page_status`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page`
--

INSERT INTO `core_page` (`id_page`, `id_page_parent`, `id_page_template`, `id_page_status`, `created`, `updated`, `publish`, `remove`, `priority`) VALUES
(1, NULL, 5, 2, '2026-04-24 22:25:01', '2026-04-25 09:07:32', NULL, NULL, 0),
(2, NULL, 3, 2, '2026-04-25 09:08:28', '2026-04-25 09:08:28', NULL, NULL, 1),
(3, NULL, 4, 2, '2026-04-25 11:25:31', '2026-04-25 11:55:19', NULL, NULL, 2),
(4, 3, 3, 2, '2026-04-25 11:57:05', '2026-04-25 11:57:05', NULL, NULL, 1),
(7, 3, 5, 2, '2026-04-25 12:27:35', '2026-04-25 12:27:49', NULL, NULL, 0),
(8, 3, 4, 2, '2026-04-25 12:29:22', '2026-04-25 12:29:22', NULL, NULL, 2),
(9, 8, 3, 2, '2026-04-25 12:29:55', '2026-04-25 12:32:58', NULL, NULL, 0),
(10, 8, 3, 2, '2026-04-25 12:34:27', '2026-04-25 12:37:57', NULL, NULL, 1),
(11, 8, 3, 2, '2026-04-25 12:39:21', '2026-04-25 12:39:21', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `core_page_localization`
--

DROP TABLE IF EXISTS `core_page_localization`;
CREATE TABLE IF NOT EXISTS `core_page_localization` (
  `id_localized_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `id_language` int NOT NULL,
  `id_slug` int NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id_localized_page`),
  KEY `id_page` (`id_page`),
  KEY `id_language` (`id_language`),
  KEY `id_slug` (`id_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_localization`
--

INSERT INTO `core_page_localization` (`id_localized_page`, `id_page`, `id_language`, `id_slug`, `title`) VALUES
(1, 1, 1, 1, 'Startuh'),
(2, 2, 1, 2, 'Install Extension'),
(3, 3, 1, 3, 'Documentation'),
(4, 4, 1, 4, 'Editor'),
(7, 7, 1, 7, 'Try Extension'),
(8, 8, 1, 8, 'Widgets'),
(9, 9, 1, 9, 'Time'),
(10, 10, 1, 10, 'Bookmarks'),
(11, 11, 1, 11, 'Creating custom widget');

-- --------------------------------------------------------

--
-- Table structure for table `core_page_status`
--

DROP TABLE IF EXISTS `core_page_status`;
CREATE TABLE IF NOT EXISTS `core_page_status` (
  `id_page_status` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_page_status`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_status`
--

INSERT INTO `core_page_status` (`id_page_status`, `name`, `is_editable`) VALUES
(1, 'Draft', 0),
(2, 'Public', 0),
(3, 'Archived', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_page_template`
--

DROP TABLE IF EXISTS `core_page_template`;
CREATE TABLE IF NOT EXISTS `core_page_template` (
  `id_page_template` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_template`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_template`
--

INSERT INTO `core_page_template` (`id_page_template`, `name`) VALUES
(2, 'AI Generated'),
(3, 'Article'),
(5, 'External'),
(4, 'Page Listing'),
(1, 'Text');

-- --------------------------------------------------------

--
-- Table structure for table `core_privilege`
--

DROP TABLE IF EXISTS `core_privilege`;
CREATE TABLE IF NOT EXISTS `core_privilege` (
  `id_privilege` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_privilege`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_privilege`
--

INSERT INTO `core_privilege` (`id_privilege`, `name`, `is_editable`) VALUES
(1, 'Read', 0),
(2, 'Create', 0),
(3, 'Update', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_related_pages`
--

DROP TABLE IF EXISTS `core_related_pages`;
CREATE TABLE IF NOT EXISTS `core_related_pages` (
  `id_source` int NOT NULL,
  `id_target` int NOT NULL,
  UNIQUE KEY `id_source` (`id_source`,`id_target`),
  KEY `id_target` (`id_target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_resource`
--

DROP TABLE IF EXISTS `core_resource`;
CREATE TABLE IF NOT EXISTS `core_resource` (
  `id_resource` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id_resource`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_resource`
--

INSERT INTO `core_resource` (`id_resource`, `name`, `type`) VALUES
(1, 'Pages', 1),
(2, 'File System', 1),
(3, 'Docs', 1),
(4, 'Domains', 1),
(5, 'Localization', 1),
(6, 'System', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_setting`
--

DROP TABLE IF EXISTS `core_setting`;
CREATE TABLE IF NOT EXISTS `core_setting` (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_setting`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_setting`
--

INSERT INTO `core_setting` (`id_setting`, `name`, `value`, `is_editable`) VALUES
(1, 'route-chasm-core:side-loader_hash-length', '4', 0),
(2, 'route-chasm-core:side-loader_max-retries', '128', 1),
(3, 'route-chasm-core:number_of_model_rows_in_grid', '20', 1),
(4, 'route-chasm-core:use_env_password_method', 'yes', 1),
(5, 'startuh:background_directory_os', '', 1),
(6, 'startuh:background_directory_os_hash', '05caff9b5e3cbd510d06286ecc277886', 0),
(7, 'route-chasm-core:search_minimum_query_length', '3', 1),
(8, 'route-chasm-core:show_admin_login_in_footer', '1', 1),
(9, 'route-chasm-core:number_of_articles_per_listing_page', '21', 1),
(10, 'route-chasm-docs:search_dropdown_max_entries', '5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_sideloader`
--

DROP TABLE IF EXISTS `core_sideloader`;
CREATE TABLE IF NOT EXISTS `core_sideloader` (
  `id_cache` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(127) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cache`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_sideloader`
--

INSERT INTO `core_sideloader` (`id_cache`, `hash`, `path`) VALUES
(1, 'fNny', 'C:\\programming\\php\\startuh\\public\\js\\Binding.js'),
(2, '3qA4', 'C:\\programming\\php\\startuh\\public\\js\\Components.js'),
(3, 'ldH1', 'C:\\programming\\php\\startuh\\public\\js\\Impulse.js'),
(4, 'I0bp', 'C:\\programming\\php\\startuh\\public\\js\\NumberRange.js'),
(5, 'EeM3', 'C:\\programming\\php\\startuh\\public\\js\\Resizeable.js'),
(6, 'p0Pk', 'C:\\programming\\php\\startuh\\public\\js\\api.js'),
(7, 'qwE5', 'C:\\programming\\php\\startuh\\public\\js\\dropdown.js'),
(8, 'YsHN', 'C:\\programming\\php\\startuh\\public\\js\\main.js'),
(9, 'D5qm', 'C:\\programming\\php\\startuh\\public\\js\\shortcut.js'),
(10, 'khC7', 'C:\\programming\\php\\startuh\\public\\js\\std.js'),
(11, 'aMzE', 'C:\\programming\\php\\startuh\\public\\js\\terminal.js'),
(12, 'bEl3', 'C:\\programming\\php\\startuh\\public\\js\\window.js'),
(13, '1dAI', 'C:\\programming\\php\\startuh\\public\\css\\main.css'),
(14, 'nIEO', 'C:\\programming\\php\\startuh\\public\\css\\resizeable.css'),
(15, 'U8yL', 'C:\\programming\\php\\startuh\\public\\css\\window.css'),
(16, 'WGJh', 'C:\\programming\\php\\startuh\\src\\components\\core\\jsml\\jsml.js'),
(17, '0KUv', 'C:\\programming\\php\\startuh\\src\\components\\core\\Admin\\Nexus\\nexus.js'),
(18, 'Ip7g', 'C:\\programming\\php\\startuh\\src\\core\\fs\\fs.js'),
(19, 'by1e', 'C:\\programming\\php\\startuh\\src\\components\\core\\Admin\\User\\admin-user.js'),
(20, 'uSIm', 'C:\\programming\\php\\startuh\\src\\components\\layout\\Spotlight\\spotlight.js'),
(21, '2tRR', 'C:\\programming\\php\\startuh\\src\\core\\forms\\form.js'),
(22, 'gaYY', 'C:\\programming\\php\\startuh\\src\\core\\fs\\fs.css'),
(23, 'y13I', 'C:\\programming\\php\\startuh\\src\\components\\core\\Admin\\Login\\admin-login.css'),
(24, 'y1Rl', 'C:\\programming\\php\\startuh\\src\\components\\layout\\Spotlight\\spotlight.css'),
(25, '-2kb', 'C:\\programming\\php\\startuh\\src\\core\\forms\\form.css'),
(26, 'BM_0', 'C:\\programming\\php\\startuh\\src\\components\\core\\RoutedMenu\\menu.js'),
(27, 'MVFE', 'C:\\programming\\php\\startuh\\src\\components\\windows\\LanguageSelect\\language-select.js'),
(28, 'gLaL', 'C:\\programming\\php\\startuh\\src\\components\\core\\WebPage\\admin-page.css'),
(29, 'b7s1', 'C:\\programming\\php\\startuh\\src\\components\\core\\RoutedMenu\\menu.css'),
(30, 'R9Xd', 'C:\\programming\\php\\startuh\\src\\components\\layout\\Accordion\\accordion.js'),
(31, 'KpHW', 'C:\\programming\\php\\startuh\\src\\components\\layout\\Accordion\\accordion.css'),
(32, 'KjHB', 'C:\\programming\\php\\startuh\\src\\project\\startuh.js'),
(33, 'uIQE', 'C:\\programming\\php\\startuh\\src\\components\\Lumora\\Editor\\inspector.js'),
(34, 'ZU0h', 'C:\\programming\\php\\startuh\\src\\project\\widgets\\time.js'),
(35, 'Xw4h', 'C:\\programming\\php\\startuh\\src\\project\\startuh.css'),
(36, '3qUK', 'C:\\programming\\php\\startuh\\src\\components\\Lumora\\Editor\\editor.css'),
(37, 'Lrpg', 'C:\\programming\\php\\startuh\\src\\project\\widgets\\time.css'),
(38, 'N5CC', 'C:\\programming\\php\\startuh\\src\\components\\core\\Admin\\Nexus\\nexus.css'),
(39, '6f4I', 'C:\\programming\\php\\startuh\\src\\components\\layout\\Grid\\grid.css'),
(40, 'aIsL', 'C:\\programming\\php\\startuh\\src\\components\\core\\Admin\\FileSystem\\fs-mkdir.js'),
(41, '1K-4', 'C:\\programming\\php\\startuh\\src\\components\\core\\FileSystem\\fs-drop-area.js'),
(42, 'BFCp', 'C:\\programming\\php\\startuh\\src\\components\\core\\BreadCrumbs\\bread-crumbs.css'),
(43, '1lpl', 'C:\\programming\\php\\startuh\\src\\components\\core\\FileSystem\\fs-drop-area.css'),
(44, 'nodw', 'C:\\programming\\php\\startuh\\src\\project\\widgets\\bookmarks.js'),
(45, 'dxzF', 'C:\\programming\\php\\startuh\\src\\project\\widgets\\bookmarks.css'),
(46, 'eT3p', 'C:\\programming\\php\\startuh\\src\\components\\core\\Pagination\\pagination-control.css'),
(47, '379c', 'C:\\programming\\php\\startuh\\src\\components\\docs\\docs.js'),
(48, 'AIwD', 'C:\\programming\\php\\startuh\\src\\components\\core\\Markdown\\markdown.js'),
(49, 'x6yv', 'C:\\programming\\php\\startuh\\src\\components\\core\\Markdown\\md-tokenizer.js'),
(50, 'aJMf', 'C:\\programming\\php\\startuh\\src\\components\\core\\Markdown\\md-parser.js'),
(51, 'gqmC', 'C:\\programming\\php\\startuh\\src\\components\\core\\Markdown\\md-gallery.js'),
(52, 'qs10', 'C:\\programming\\php\\startuh\\src\\components\\pages\\Article\\article.js'),
(53, 'btVg', 'C:\\programming\\php\\startuh\\src\\components\\core\\Search\\search.js'),
(54, '_VfB', 'C:\\programming\\php\\startuh\\src\\components\\core\\Markdown\\markdown.css'),
(55, 'soeo', 'C:\\programming\\php\\startuh\\src\\components\\pages\\Article\\article.css'),
(56, 'SSml', 'C:\\programming\\php\\startuh\\src\\components\\core\\PageMenu\\header.css'),
(57, 'g5w8', 'C:\\programming\\php\\startuh\\src\\components\\core\\Search\\header-search.css'),
(58, 'Ku8v', 'C:\\programming\\php\\startuh\\src\\components\\core\\PageMenu\\footer.css'),
(59, 'KBh8', 'C:\\programming\\php\\startuh\\src\\components\\core\\fs\\file-control.js'),
(60, 'hMMW', 'C:\\programming\\php\\startuh\\src\\components\\layout\\Tabs\\tabs.js'),
(61, 'o_jH', 'C:\\programming\\php\\startuh\\src\\components\\core\\fs\\file-control.css'),
(62, '1rjQ', 'C:\\programming\\php\\startuh\\src\\components\\layout\\Tabs\\tabs.css'),
(63, 'J5Kf', 'C:\\programming\\php\\startuh\\src\\models\\extensions\\IsDefault\\is-default.js'),
(64, '_bQI', 'C:\\programming\\php\\startuh\\src\\components\\Home\\home.css'),
(65, 'VMMR', 'C:\\programming\\php\\startuh\\src\\models\\extensions\\Priority\\priority.js'),
(66, 'CKuO', 'C:\\programming\\php\\startuh\\src\\models\\extensions\\Priority\\priority.css'),
(67, 'y-hZ', 'C:\\programming\\php\\startuh\\src\\components\\pages\\External\\external.js'),
(68, 'Kz1m', 'C:\\programming\\php\\startuh\\src\\components\\pages\\Article\\article-editor.js'),
(69, 'LHxH', 'C:\\programming\\php\\startuh\\src\\components\\core\\Markdown\\Editor\\md-editor.js'),
(70, 'JdyG', 'C:\\programming\\php\\startuh\\src\\components\\core\\Markdown\\Editor\\md-editor.css'),
(71, 'pW45', 'C:\\programming\\php\\startuh\\src\\components\\core\\Admin\\Page\\page-editor.js'),
(72, 'UqJW', 'C:\\programming\\php\\startuh\\src\\components\\core\\Admin\\Page\\page-editor.css'),
(73, 'mi2x', 'C:\\programming\\php\\startuh\\src\\components\\pages\\Listing\\listing.css'),
(74, '2uTc', 'C:\\programming\\php\\startuh\\src\\components\\pages\\AiGeneratedPage\\ai-page-generator.js'),
(75, 'bMXD', 'C:\\programming\\php\\startuh\\src\\components\\pages\\Listing\\listing-card.js'),
(76, 'nKAm', 'C:\\programming\\php\\startuh\\src\\components\\pages\\Listing\\listing-card.css');

-- --------------------------------------------------------

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
CREATE TABLE IF NOT EXISTS `core_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `tag` (`tag`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_user`
--

INSERT INTO `core_user` (`id_user`, `username`, `password`, `tag`) VALUES
(1, 'Root', '', 'root'),
(2, 'Anonymous', '', 'anonymous');

-- --------------------------------------------------------

--
-- Table structure for table `core_users_x_groups`
--

DROP TABLE IF EXISTS `core_users_x_groups`;
CREATE TABLE IF NOT EXISTS `core_users_x_groups` (
  `id_user` int NOT NULL,
  `id_group` int NOT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_users_x_groups`
--

INSERT INTO `core_users_x_groups` (`id_user`, `id_group`) VALUES
(1, 2),
(1, 3),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `docs_content`
--

DROP TABLE IF EXISTS `docs_content`;
CREATE TABLE IF NOT EXISTS `docs_content` (
  `id_content` int NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `file_size` int NOT NULL,
  `last_updated` int NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id_content`),
  UNIQUE KEY `file` (`file`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `docs_content`
--

INSERT INTO `docs_content` (`id_content`, `file`, `file_size`, `last_updated`, `hash`) VALUES
(1, 'C:\\programming\\php\\startuh\\src\\core\\view\\View.php', 176, 1776679579, '2e2a333a02bc7113e4e5f787b91d47e684b1cf65'),
(2, 'C:\\programming\\php\\startuh\\src\\components\\Home\\Home.phtml', 4024, 1777280474, '2b9e4a0fe1a1cbb978d0ec4dfae3d3765a6b91df');

-- --------------------------------------------------------

--
-- Table structure for table `docs_contents_x_fragments`
--

DROP TABLE IF EXISTS `docs_contents_x_fragments`;
CREATE TABLE IF NOT EXISTS `docs_contents_x_fragments` (
  `id_content` int NOT NULL,
  `id_fragment` int NOT NULL,
  UNIQUE KEY `id_content` (`id_content`,`id_fragment`),
  KEY `id_fragment` (`id_fragment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docs_fragment`
--

DROP TABLE IF EXISTS `docs_fragment`;
CREATE TABLE IF NOT EXISTS `docs_fragment` (
  `id_fragment` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  PRIMARY KEY (`id_fragment`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `docs_fragment`
--

INSERT INTO `docs_fragment` (`id_fragment`, `name`, `summary`) VALUES
(1, 'C:\\programming\\php\\startuh\\src\\core\\view\\View.php', 'Defines the View interface with methods for rendering, retrieving the root view, and string representation.'),
(2, 'C:\\programming\\php\\startuh\\src\\components\\Home\\Home.phtml', 'This file defines the layout and rendering logic for the home landing page of an application, utilizing components for the header and footer, and dynamically generating content based on translations and project resources.');

-- --------------------------------------------------------

--
-- Table structure for table `ext_page_meta`
--

DROP TABLE IF EXISTS `ext_page_meta`;
CREATE TABLE IF NOT EXISTS `ext_page_meta` (
  `id_page_meta` int NOT NULL AUTO_INCREMENT,
  `id_localized_page` int NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `og_title` text NOT NULL,
  `og_description` text NOT NULL,
  PRIMARY KEY (`id_page_meta`),
  KEY `id_localized_page` (`id_localized_page`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ext_page_meta`
--

INSERT INTO `ext_page_meta` (`id_page_meta`, `id_localized_page`, `description`, `keywords`, `og_title`, `og_description`) VALUES
(1, 1, '', '', '', ''),
(2, 2, '', '', '', ''),
(3, 3, '', '', '', ''),
(4, 4, '', '', '', ''),
(7, 7, '', '', '', ''),
(8, 8, '', '', '', ''),
(9, 9, 'The Time Widget is a versatile tool designed to display the current time and date in a user-friendly manner. This article provides an overview of the Time Widget, detailing its functionalities, configuration options, and how to effectively use it without any programming knowledge.', '', '', ''),
(10, 10, 'In the digital age, organizing online resources has become essential. The Bookmarks extension serves as a practical tool to manage and access your favorite web links efficiently. This article will explore the functionalities of the Bookmarks extension and guide you on how to utilize it effectively.', '', '', ''),
(11, 11, '', '', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `core_ai_page`
--
ALTER TABLE `core_ai_page`
  ADD CONSTRAINT `core_ai_page_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`);

--
-- Constraints for table `core_external_page`
--
ALTER TABLE `core_external_page`
  ADD CONSTRAINT `core_external_page_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`);

--
-- Constraints for table `core_fs_directory`
--
ALTER TABLE `core_fs_directory`
  ADD CONSTRAINT `core_fs_directory_ibfk_1` FOREIGN KEY (`id_fs_parent`) REFERENCES `core_fs_directory` (`id_fs_directory`);

--
-- Constraints for table `core_fs_file`
--
ALTER TABLE `core_fs_file`
  ADD CONSTRAINT `core_fs_file_ibfk_1` FOREIGN KEY (`id_fs_parent`) REFERENCES `core_fs_directory` (`id_fs_directory`);

--
-- Constraints for table `core_fs_shortcut`
--
ALTER TABLE `core_fs_shortcut`
  ADD CONSTRAINT `core_fs_shortcut_ibfk_1` FOREIGN KEY (`id_fs_file`) REFERENCES `core_fs_file` (`id_fs_file`);

--
-- Constraints for table `core_groups_x_resources`
--
ALTER TABLE `core_groups_x_resources`
  ADD CONSTRAINT `core_groups_x_resources_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `core_group` (`id_group`),
  ADD CONSTRAINT `core_groups_x_resources_ibfk_2` FOREIGN KEY (`id_resource`) REFERENCES `core_resource` (`id_resource`),
  ADD CONSTRAINT `core_groups_x_resources_ibfk_3` FOREIGN KEY (`id_privilege`) REFERENCES `core_privilege` (`id_privilege`);

--
-- Constraints for table `core_lexicon`
--
ALTER TABLE `core_lexicon`
  ADD CONSTRAINT `core_lexicon_ibfk_1` FOREIGN KEY (`id_lexicon_group`) REFERENCES `core_lexicon_group` (`id_lexicon_group`);

--
-- Constraints for table `core_lexicon_translation`
--
ALTER TABLE `core_lexicon_translation`
  ADD CONSTRAINT `core_lexicon_translation_ibfk_1` FOREIGN KEY (`id_phrase`) REFERENCES `core_lexicon` (`id_phrase`),
  ADD CONSTRAINT `core_lexicon_translation_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_lexicon_translation_ibfk_3` FOREIGN KEY (`id_rule`) REFERENCES `core_lexicon_rule` (`id_rule`);

--
-- Constraints for table `core_navigation`
--
ALTER TABLE `core_navigation`
  ADD CONSTRAINT `core_navigation_ibfk_1` FOREIGN KEY (`id_navigation_context`) REFERENCES `core_navigation_context` (`id_navigation_context`),
  ADD CONSTRAINT `core_navigation_ibfk_2` FOREIGN KEY (`id_parent`) REFERENCES `core_navigation` (`id_slug`),
  ADD CONSTRAINT `core_navigation_ibfk_3` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_navigation_ibfk_4` FOREIGN KEY (`id_navigation_factory`) REFERENCES `core_navigation_factory` (`id_navigation_factory`);

--
-- Constraints for table `core_page`
--
ALTER TABLE `core_page`
  ADD CONSTRAINT `core_page_ibfk_1` FOREIGN KEY (`id_page_template`) REFERENCES `core_page_template` (`id_page_template`),
  ADD CONSTRAINT `core_page_ibfk_2` FOREIGN KEY (`id_page_status`) REFERENCES `core_page_status` (`id_page_status`);

--
-- Constraints for table `core_page_localization`
--
ALTER TABLE `core_page_localization`
  ADD CONSTRAINT `core_page_localization_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`),
  ADD CONSTRAINT `core_page_localization_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_page_localization_ibfk_3` FOREIGN KEY (`id_slug`) REFERENCES `core_navigation` (`id_slug`);

--
-- Constraints for table `core_users_x_groups`
--
ALTER TABLE `core_users_x_groups`
  ADD CONSTRAINT `core_users_x_groups_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `core_user` (`id_user`),
  ADD CONSTRAINT `core_users_x_groups_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `core_group` (`id_group`);

--
-- Constraints for table `docs_contents_x_fragments`
--
ALTER TABLE `docs_contents_x_fragments`
  ADD CONSTRAINT `docs_contents_x_fragments_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `docs_content` (`id_content`),
  ADD CONSTRAINT `docs_contents_x_fragments_ibfk_2` FOREIGN KEY (`id_fragment`) REFERENCES `docs_fragment` (`id_fragment`);

--
-- Constraints for table `ext_page_meta`
--
ALTER TABLE `ext_page_meta`
  ADD CONSTRAINT `ext_page_meta_ibfk_1` FOREIGN KEY (`id_localized_page`) REFERENCES `core_page_localization` (`id_localized_page`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
