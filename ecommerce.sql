-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2023 at 06:08 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentication_user_profile`
--

CREATE TABLE `authentication_user_profile` (
  `user_ptr_id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `number` varchar(20) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `img` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add attribute', 7, 'add_attribute'),
(26, 'Can change attribute', 7, 'change_attribute'),
(27, 'Can delete attribute', 7, 'delete_attribute'),
(28, 'Can view attribute', 7, 'view_attribute'),
(29, 'Can add attribute value', 8, 'add_attributevalue'),
(30, 'Can change attribute value', 8, 'change_attributevalue'),
(31, 'Can delete attribute value', 8, 'delete_attributevalue'),
(32, 'Can view attribute value', 8, 'view_attributevalue'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add inventory', 10, 'add_inventory'),
(38, 'Can change inventory', 10, 'change_inventory'),
(39, 'Can delete inventory', 10, 'delete_inventory'),
(40, 'Can view inventory', 10, 'view_inventory'),
(41, 'Can add stock control', 11, 'add_stockcontrol'),
(42, 'Can change stock control', 11, 'change_stockcontrol'),
(43, 'Can delete stock control', 11, 'delete_stockcontrol'),
(44, 'Can view stock control', 11, 'view_stockcontrol'),
(45, 'Can add product', 12, 'add_product'),
(46, 'Can change product', 12, 'change_product'),
(47, 'Can delete product', 12, 'delete_product'),
(48, 'Can view product', 12, 'view_product'),
(49, 'Can add image', 13, 'add_image'),
(50, 'Can change image', 13, 'change_image'),
(51, 'Can delete image', 13, 'delete_image'),
(52, 'Can view image', 13, 'view_image'),
(53, 'Can add cart', 14, 'add_cart'),
(54, 'Can change cart', 14, 'change_cart'),
(55, 'Can delete cart', 14, 'delete_cart'),
(56, 'Can view cart', 14, 'view_cart'),
(57, 'Can add user', 15, 'add_user_profile'),
(58, 'Can change user', 15, 'change_user_profile'),
(59, 'Can delete user', 15, 'delete_user_profile'),
(60, 'Can view user', 15, 'view_user_profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$t7EK8BMDTmRYtKfu7MGkTD$89sWSxzJatPLewnYps3w6/vcBHqUKCbOmhE8+/RXCvM=', '2023-07-17 14:46:29.960431', 1, 'admin', '', '', '', 1, 1, '2023-07-17 14:46:13.996563');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(15, 'authentication', 'user_profile'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'shop', 'attribute'),
(8, 'shop', 'attributevalue'),
(14, 'shop', 'cart'),
(9, 'shop', 'category'),
(13, 'shop', 'image'),
(10, 'shop', 'inventory'),
(12, 'shop', 'product'),
(11, 'shop', 'stockcontrol');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-17 14:42:10.283792'),
(2, 'auth', '0001_initial', '2023-07-17 14:42:18.782163'),
(3, 'admin', '0001_initial', '2023-07-17 14:42:20.507177'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-17 14:42:20.549317'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-17 14:42:20.582428'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-17 14:42:21.019890'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-17 14:42:21.627268'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-17 14:42:21.763720'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-17 14:42:21.807867'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-17 14:42:22.245332'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-17 14:42:22.268405'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-17 14:42:22.299496'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-17 14:42:22.394832'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-17 14:42:22.504193'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-17 14:42:22.805566'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-17 14:42:22.842685'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-17 14:42:22.945023'),
(18, 'authentication', '0001_initial', '2023-07-17 14:42:24.577033'),
(19, 'authentication', '0002_user_profile_delete_user_rofile', '2023-07-17 14:42:26.976817'),
(20, 'authentication', '0003_alter_user_profile_img_alter_user_profile_number', '2023-07-17 14:42:27.602251'),
(21, 'sessions', '0001_initial', '2023-07-17 14:42:28.162106'),
(22, 'shop', '0001_initial', '2023-07-17 14:42:38.528569');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7fja4aqmeqmokl9cvl3qu0ohan9ix85j', '.eJxVjDsOwjAQBe_iGlmO_6ak5wzWeneNA8iR8qkQd4dIKaB9M_NeIsO2trwtPOeRxFkM4vS7FcAH9x3QHfptkjj1dR6L3BV50EVeJ-Ln5XD_Dhos7Vtj8LZoz1ZpNAjFG52c0VSCGqKCggzWVWByZKkmFysyeQfGpRBJGfH-AO1uOF0:1qLPUb:PMPSonAfSI2_oFOPKImIHg5QK0NGt1sdXkZlZ4chP68', '2023-07-31 14:46:29.999561');

-- --------------------------------------------------------

--
-- Table structure for table `shop_attribute`
--

CREATE TABLE `shop_attribute` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_attributevalue`
--

CREATE TABLE `shop_attributevalue` (
  `id` bigint(20) NOT NULL,
  `value` varchar(60) NOT NULL,
  `attribute_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_cart`
--

CREATE TABLE `shop_cart` (
  `id` bigint(20) NOT NULL,
  `size` varchar(11) NOT NULL,
  `color` varchar(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `inventory_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_category`
--

CREATE TABLE `shop_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_image`
--

CREATE TABLE `shop_image` (
  `id` bigint(20) NOT NULL,
  `url` varchar(100) NOT NULL,
  `alternattext` varchar(50) DEFAULT NULL,
  `is_feature` tinyint(1) NOT NULL,
  `inventory_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_inventory`
--

CREATE TABLE `shop_inventory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `des` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_inventory_attribute`
--

CREATE TABLE `shop_inventory_attribute` (
  `id` bigint(20) NOT NULL,
  `inventory_id` bigint(20) NOT NULL,
  `attributevalue_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_product`
--

CREATE TABLE `shop_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(70) NOT NULL,
  `description` longtext NOT NULL,
  `slug` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_category`
--

CREATE TABLE `shop_product_category` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_stockcontrol`
--

CREATE TABLE `shop_stockcontrol` (
  `id` bigint(20) NOT NULL,
  `last_checked` datetime(6) NOT NULL,
  `units` int(11) NOT NULL,
  `Inventory_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authentication_user_profile`
--
ALTER TABLE `authentication_user_profile`
  ADD PRIMARY KEY (`user_ptr_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `shop_attribute`
--
ALTER TABLE `shop_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_attributevalue`
--
ALTER TABLE `shop_attributevalue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_attributevalue_attribute_id_1311e3b9_fk_shop_attribute_id` (`attribute_id`);

--
-- Indexes for table `shop_cart`
--
ALTER TABLE `shop_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_cart_inventory_id_a8ef2b60_fk_shop_inventory_id` (`inventory_id`),
  ADD KEY `shop_cart_user_id_27925ac6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_category_slug_4508178e` (`slug`);

--
-- Indexes for table `shop_image`
--
ALTER TABLE `shop_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_image_inventory_id_3fb5c802_fk_shop_inventory_id` (`inventory_id`);

--
-- Indexes for table `shop_inventory`
--
ALTER TABLE `shop_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_inventory_product_id_17905599_fk_shop_product_id` (`product_id`),
  ADD KEY `shop_inventory_category_id_1815add5_fk_shop_category_id` (`category_id`);

--
-- Indexes for table `shop_inventory_attribute`
--
ALTER TABLE `shop_inventory_attribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_inventory_attribute_inventory_id_attributeva_c20d23f5_uniq` (`inventory_id`,`attributevalue_id`),
  ADD KEY `shop_inventory_attri_attributevalue_id_545b12d5_fk_shop_attr` (`attributevalue_id`);

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_slug_30bd2d5d` (`slug`);

--
-- Indexes for table `shop_product_category`
--
ALTER TABLE `shop_product_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shop_product_category_product_id_category_id_d7d3b465_uniq` (`product_id`,`category_id`),
  ADD KEY `shop_product_category_category_id_9635f39e_fk_shop_category_id` (`category_id`);

--
-- Indexes for table `shop_stockcontrol`
--
ALTER TABLE `shop_stockcontrol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Inventory_id` (`Inventory_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `shop_attribute`
--
ALTER TABLE `shop_attribute`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_attributevalue`
--
ALTER TABLE `shop_attributevalue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_cart`
--
ALTER TABLE `shop_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_image`
--
ALTER TABLE `shop_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_inventory`
--
ALTER TABLE `shop_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_inventory_attribute`
--
ALTER TABLE `shop_inventory_attribute`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_product_category`
--
ALTER TABLE `shop_product_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_stockcontrol`
--
ALTER TABLE `shop_stockcontrol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authentication_user_profile`
--
ALTER TABLE `authentication_user_profile`
  ADD CONSTRAINT `authentication_user_profile_user_id_4e224b8f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `authentication_user_profile_user_ptr_id_ad791716_fk_auth_user_id` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `shop_attributevalue`
--
ALTER TABLE `shop_attributevalue`
  ADD CONSTRAINT `shop_attributevalue_attribute_id_1311e3b9_fk_shop_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `shop_attribute` (`id`);

--
-- Constraints for table `shop_cart`
--
ALTER TABLE `shop_cart`
  ADD CONSTRAINT `shop_cart_inventory_id_a8ef2b60_fk_shop_inventory_id` FOREIGN KEY (`inventory_id`) REFERENCES `shop_inventory` (`id`),
  ADD CONSTRAINT `shop_cart_user_id_27925ac6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `shop_image`
--
ALTER TABLE `shop_image`
  ADD CONSTRAINT `shop_image_inventory_id_3fb5c802_fk_shop_inventory_id` FOREIGN KEY (`inventory_id`) REFERENCES `shop_inventory` (`id`);

--
-- Constraints for table `shop_inventory`
--
ALTER TABLE `shop_inventory`
  ADD CONSTRAINT `shop_inventory_category_id_1815add5_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`),
  ADD CONSTRAINT `shop_inventory_product_id_17905599_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Constraints for table `shop_inventory_attribute`
--
ALTER TABLE `shop_inventory_attribute`
  ADD CONSTRAINT `shop_inventory_attri_attributevalue_id_545b12d5_fk_shop_attr` FOREIGN KEY (`attributevalue_id`) REFERENCES `shop_attributevalue` (`id`),
  ADD CONSTRAINT `shop_inventory_attri_inventory_id_e97a7bd5_fk_shop_inve` FOREIGN KEY (`inventory_id`) REFERENCES `shop_inventory` (`id`);

--
-- Constraints for table `shop_product_category`
--
ALTER TABLE `shop_product_category`
  ADD CONSTRAINT `shop_product_category_category_id_9635f39e_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`),
  ADD CONSTRAINT `shop_product_category_product_id_deb8d294_fk_shop_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`);

--
-- Constraints for table `shop_stockcontrol`
--
ALTER TABLE `shop_stockcontrol`
  ADD CONSTRAINT `shop_stockcontrol_Inventory_id_06db6cf8_fk_shop_inventory_id` FOREIGN KEY (`Inventory_id`) REFERENCES `shop_inventory` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
