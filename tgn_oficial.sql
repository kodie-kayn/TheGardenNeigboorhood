-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2023 a las 00:21:56
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tgn_oficial`
--
CREATE DATABASE IF NOT EXISTS `tgn_oficial` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tgn_oficial`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'Admin'),
(1, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 2, 21),
(22, 2, 22),
(23, 2, 23),
(24, 2, 24),
(25, 2, 25),
(26, 2, 26),
(27, 2, 27),
(28, 2, 28),
(29, 2, 29),
(30, 2, 30),
(31, 2, 31),
(32, 2, 32),
(33, 2, 33),
(34, 2, 34),
(35, 2, 35),
(36, 2, 36),
(37, 2, 37),
(38, 2, 38),
(39, 2, 39),
(40, 2, 40),
(41, 2, 41),
(42, 2, 42),
(43, 2, 43),
(44, 2, 44),
(45, 2, 45),
(46, 2, 46),
(47, 2, 47),
(48, 2, 48),
(49, 2, 49),
(50, 2, 50),
(51, 2, 51),
(52, 2, 52),
(53, 2, 53),
(54, 2, 54),
(55, 2, 55),
(56, 2, 56),
(57, 2, 57),
(58, 2, 58),
(59, 2, 59),
(60, 2, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
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
(25, 'Can add carrito', 7, 'add_carrito'),
(26, 'Can change carrito', 7, 'change_carrito'),
(27, 'Can delete carrito', 7, 'delete_carrito'),
(28, 'Can view carrito', 7, 'view_carrito'),
(29, 'Can add compra', 8, 'add_compra'),
(30, 'Can change compra', 8, 'change_compra'),
(31, 'Can delete compra', 8, 'delete_compra'),
(32, 'Can view compra', 8, 'view_compra'),
(33, 'Can add producto', 9, 'add_producto'),
(34, 'Can change producto', 9, 'change_producto'),
(35, 'Can delete producto', 9, 'delete_producto'),
(36, 'Can view producto', 9, 'view_producto'),
(37, 'Can add suscribirse', 10, 'add_suscribirse'),
(38, 'Can change suscribirse', 10, 'change_suscribirse'),
(39, 'Can delete suscribirse', 10, 'delete_suscribirse'),
(40, 'Can view suscribirse', 10, 'view_suscribirse'),
(41, 'Can add tipo producto', 11, 'add_tipoproducto'),
(42, 'Can change tipo producto', 11, 'change_tipoproducto'),
(43, 'Can delete tipo producto', 11, 'delete_tipoproducto'),
(44, 'Can view tipo producto', 11, 'view_tipoproducto'),
(45, 'Can add trabajador', 12, 'add_trabajador'),
(46, 'Can change trabajador', 12, 'change_trabajador'),
(47, 'Can delete trabajador', 12, 'delete_trabajador'),
(48, 'Can view trabajador', 12, 'view_trabajador'),
(49, 'Can add producto carrito', 13, 'add_productocarrito'),
(50, 'Can change producto carrito', 13, 'change_productocarrito'),
(51, 'Can delete producto carrito', 13, 'delete_productocarrito'),
(52, 'Can view producto carrito', 13, 'view_productocarrito'),
(53, 'Can add item carrito', 14, 'add_itemcarrito'),
(54, 'Can change item carrito', 14, 'change_itemcarrito'),
(55, 'Can delete item carrito', 14, 'delete_itemcarrito'),
(56, 'Can view item carrito', 14, 'view_itemcarrito'),
(57, 'Can add user', 15, 'add_usuariopersonalizado'),
(58, 'Can change user', 15, 'change_usuariopersonalizado'),
(59, 'Can delete user', 15, 'delete_usuariopersonalizado'),
(60, 'Can view user', 15, 'view_usuariopersonalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$DVHALaW8sEVN$5Iv6PRHriU0svrbG2X+BJrrOamyP0LntPWjHdNv7wHo=', '2023-07-03 21:29:28.875349', 1, 'admin', '', '', '', 1, 1, '2023-07-03 20:48:12.109825'),
(2, 'pbkdf2_sha256$216000$tbo6Z6w3pU7z$EKooaUGZlXvqqWFQmCIJw8+OJRmeJDrRcCFe3xKGpRk=', '2023-07-03 21:28:52.206777', 0, 'exe', '', '', 'exequiel@gmail.com', 0, 1, '2023-07-03 21:28:43.922441');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrito`
--

DROP TABLE IF EXISTS `core_carrito`;
CREATE TABLE `core_carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_itemcarrito`
--

DROP TABLE IF EXISTS `core_itemcarrito`;
CREATE TABLE `core_itemcarrito` (
  `id` int(11) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `carrito_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_producto`
--

DROP TABLE IF EXISTS `core_producto`;
CREATE TABLE `core_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `vencimiento` date NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_suscribirse`
--

DROP TABLE IF EXISTS `core_suscribirse`;
CREATE TABLE `core_suscribirse` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `monto` int(10) UNSIGNED NOT NULL CHECK (`monto` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoproducto`
--

DROP TABLE IF EXISTS `core_tipoproducto`;
CREATE TABLE `core_tipoproducto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_trabajador`
--

DROP TABLE IF EXISTS `core_trabajador`;
CREATE TABLE `core_trabajador` (
  `id` int(11) NOT NULL,
  `nombre_trabajador` varchar(50) NOT NULL,
  `descripcion_trabajador` varchar(250) NOT NULL,
  `imagen_trabajador` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-07-03 21:20:18.107257', '1', 'Cliente', 1, '[{\"added\": {}}]', 3, 1),
(2, '2023-07-03 21:25:40.569741', '1', 'Cliente', 2, '[]', 3, 1),
(3, '2023-07-03 21:25:51.366523', '2', 'Admin', 1, '[{\"added\": {}}]', 3, 1),
(4, '2023-07-03 21:56:03.892765', '1', 'exequiel', 2, '[]', 15, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'core', 'carrito'),
(8, 'core', 'compra'),
(14, 'core', 'itemcarrito'),
(9, 'core', 'producto'),
(13, 'core', 'productocarrito'),
(10, 'core', 'suscribirse'),
(11, 'core', 'tipoproducto'),
(12, 'core', 'trabajador'),
(6, 'sessions', 'session'),
(15, 'usuario', 'usuariopersonalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-03 20:47:16.382823'),
(2, 'auth', '0001_initial', '2023-07-03 20:47:16.507693'),
(3, 'admin', '0001_initial', '2023-07-03 20:47:16.836309'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-03 20:47:16.928411'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-03 20:47:16.938440'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-03 20:47:16.990017'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-03 20:47:17.036406'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-03 20:47:17.053164'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-03 20:47:17.061933'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-03 20:47:17.101960'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-03 20:47:17.105443'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-03 20:47:17.114373'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-03 20:47:17.133161'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-03 20:47:17.150429'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-03 20:47:17.168369'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-03 20:47:17.176896'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-03 20:47:17.193927'),
(18, 'core', '0001_initial', '2023-07-03 20:47:17.450769'),
(19, 'sessions', '0001_initial', '2023-07-03 20:47:17.675281'),
(20, 'usuario', '0001_initial', '2023-07-03 21:09:35.670617'),
(21, 'core', '0002_auto_20230703_1752', '2023-07-03 21:52:22.196737');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('15uhbh3zv7njrnca2h5m6l0odqf8idgd', '.eJxVjEEOwiAQRe_C2hAGSgGX7nsGMsygVA0kpV0Z765NutDtf-_9l4i4rSVuPS9xZnEWWpx-t4T0yHUHfMd6a5JaXZc5yV2RB-1yapyfl8P9OyjYy7f2jjFrDaxVAGMAfNBD0ORTGIcrA5kEFpnZDqQgk8sjKxeIXfLWORTvD8m5N6M:1qGRUb:1sN5zogyiUOFp_skMYm8hJQ0wevkmXHCJ9RIWh4H784', '2023-07-17 21:53:57.190913');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuariopersonalizado`
--

DROP TABLE IF EXISTS `usuario_usuariopersonalizado`;
CREATE TABLE `usuario_usuariopersonalizado` (
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
  `date_joined` datetime(6) NOT NULL,
  `suscriptor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_usuariopersonalizado`
--

INSERT INTO `usuario_usuariopersonalizado` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `suscriptor`) VALUES
(1, 'pbkdf2_sha256$216000$ve5RNbtByG5u$mT6o9ocHFnWvuXNQmj1DFDW8zkvUVvV5Hrhz3RLeWCY=', NULL, 0, 'exequiel', '', '', 'exequiel@gmail.com', 0, 1, '2023-07-03 21:19:09.000000', 0),
(2, 'pbkdf2_sha256$216000$orxZjZwiB59M$lFWP8ZzfiR0dIgYqLrXtKZKgQlKzLv6pDUpaZnMpfKQ=', '2023-07-03 21:53:57.187919', 1, 'admin', '', '', '', 1, 1, '2023-07-03 21:53:39.001502', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuariopersonalizado_groups`
--

DROP TABLE IF EXISTS `usuario_usuariopersonalizado_groups`;
CREATE TABLE `usuario_usuariopersonalizado_groups` (
  `id` int(11) NOT NULL,
  `usuariopersonalizado_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuariopersonalizado_user_permissions`
--

DROP TABLE IF EXISTS `usuario_usuariopersonalizado_user_permissions`;
CREATE TABLE `usuario_usuariopersonalizado_user_permissions` (
  `id` int(11) NOT NULL,
  `usuariopersonalizado_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `core_itemcarrito`
--
ALTER TABLE `core_itemcarrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_itemcarrito_carrito_id_427071c4_fk_core_carrito_id` (`carrito_id`),
  ADD KEY `core_itemcarrito_producto_id_eea3400e_fk_core_producto_id` (`producto_id`);

--
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` (`tipo_id`);

--
-- Indices de la tabla `core_suscribirse`
--
ALTER TABLE `core_suscribirse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_trabajador`
--
ALTER TABLE `core_trabajador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `usuario_usuariopersonalizado`
--
ALTER TABLE `usuario_usuariopersonalizado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `usuario_usuariopersonalizado_groups`
--
ALTER TABLE `usuario_usuariopersonalizado_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_usuariopersonali_usuariopersonalizado_id__c538f30a_uniq` (`usuariopersonalizado_id`,`group_id`),
  ADD KEY `usuario_usuarioperso_group_id_69a305f5_fk_auth_grou` (`group_id`);

--
-- Indices de la tabla `usuario_usuariopersonalizado_user_permissions`
--
ALTER TABLE `usuario_usuariopersonalizado_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_usuariopersonali_usuariopersonalizado_id__884d065c_uniq` (`usuariopersonalizado_id`,`permission_id`),
  ADD KEY `usuario_usuarioperso_permission_id_80e99e79_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_itemcarrito`
--
ALTER TABLE `core_itemcarrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_suscribirse`
--
ALTER TABLE `core_suscribirse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_trabajador`
--
ALTER TABLE `core_trabajador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuario_usuariopersonalizado`
--
ALTER TABLE `usuario_usuariopersonalizado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario_usuariopersonalizado_groups`
--
ALTER TABLE `usuario_usuariopersonalizado_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_usuariopersonalizado_user_permissions`
--
ALTER TABLE `usuario_usuariopersonalizado_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD CONSTRAINT `core_carrito_usuario_id_9eafcb26_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_itemcarrito`
--
ALTER TABLE `core_itemcarrito`
  ADD CONSTRAINT `core_itemcarrito_carrito_id_427071c4_fk_core_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `core_carrito` (`id`),
  ADD CONSTRAINT `core_itemcarrito_producto_id_eea3400e_fk_core_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `core_producto` (`id`);

--
-- Filtros para la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD CONSTRAINT `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` FOREIGN KEY (`tipo_id`) REFERENCES `core_tipoproducto` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `usuario_usuariopersonalizado_groups`
--
ALTER TABLE `usuario_usuariopersonalizado_groups`
  ADD CONSTRAINT `usuario_usuarioperso_group_id_69a305f5_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `usuario_usuarioperso_usuariopersonalizado_6690a3ef_fk_usuario_u` FOREIGN KEY (`usuariopersonalizado_id`) REFERENCES `usuario_usuariopersonalizado` (`id`);

--
-- Filtros para la tabla `usuario_usuariopersonalizado_user_permissions`
--
ALTER TABLE `usuario_usuariopersonalizado_user_permissions`
  ADD CONSTRAINT `usuario_usuarioperso_permission_id_80e99e79_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `usuario_usuarioperso_usuariopersonalizado_8c5209ce_fk_usuario_u` FOREIGN KEY (`usuariopersonalizado_id`) REFERENCES `usuario_usuariopersonalizado` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
