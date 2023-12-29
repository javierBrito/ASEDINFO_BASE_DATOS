-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-12-2023 a las 22:32:49
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
-- Base de datos: `asedinfo_data`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aho_socio`
--

CREATE TABLE `aho_socio` (
  `codigo` int(11) NOT NULL,
  `tipo_socio` varchar(150) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `cod_persona` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aho_socio`
--

INSERT INTO `aho_socio` (`codigo`, `tipo_socio`, `fecha_inicio`, `cod_persona`, `estado`) VALUES
(1, 'tipo socio', '2023-08-21 00:00:00.000000', 1, 'A'),
(2, 'especial', '2023-08-28 00:00:00.000000', 2, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_modulo`
--

CREATE TABLE `cat_modulo` (
  `codigo` int(11) NOT NULL,
  `nemonico` varchar(3) NOT NULL,
  `descripcion` varchar(125) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `fecha_registra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_modulo`
--

INSERT INTO `cat_modulo` (`codigo`, `nemonico`, `descripcion`, `estado`, `fecha_registra`) VALUES
(1, 'AHO', 'MODULO DE AHORROS', 'A', '2023-09-12'),
(2, 'VEN', 'MODULO DE VENTAS', 'A', '2023-09-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_operacion`
--

CREATE TABLE `cat_operacion` (
  `codigo` int(11) NOT NULL,
  `cod_modulo` int(11) NOT NULL,
  `nemonico` varchar(3) NOT NULL,
  `descripcion` varchar(125) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `fecha_registra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_operacion`
--

INSERT INTO `cat_operacion` (`codigo`, `cod_modulo`, `nemonico`, `descripcion`, `estado`, `fecha_registra`) VALUES
(1, 1, 'CRE', 'CREDITO', 'A', '2023-09-13'),
(2, 1, 'DEB', 'DEBITO', 'A', '2023-09-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_parametro`
--

CREATE TABLE `cat_parametro` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'TRIAL',
  `valor` decimal(10,0) DEFAULT NULL COMMENT 'TRIAL',
  `nemonico` varchar(12) DEFAULT NULL COMMENT 'TRIAL',
  `valor_cadena` varchar(255) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `cat_parametro`
--

INSERT INTO `cat_parametro` (`codigo`, `descripcion`, `valor`, `nemonico`, `valor_cadena`, `estado`) VALUES
(1, 'Número de días de vigencia para la expiración de la contraseña', 5000, 'CAD_DIAS', NULL, NULL),
(2, 'Caducidad masiva de contraseñas', 0, 'CAD_MASIVA', NULL, NULL),
(3, 'Cantidad de contraseñas antiguas para validar si se repiten', 5, 'NUM_CLAVES', NULL, NULL),
(4, 'Número de días anteriores para recordar la caducidad de una contraseña', 5, 'RECORDATORIO', NULL, NULL),
(5, 'Número de días de vigencia del token', 2, 'CAD_TOKEN', NULL, NULL),
(6, 'Url de documento de Acuerdo de Responsabilidad', NULL, 'URL_ACUERDO', 'http://www.educacion.gob.ec', NULL),
(7, 'Número mínimo de registros del archivo a procesar para la asignación de roles de usuarios de forma masiva.', 1, 'NUM_MIN_ROL', NULL, NULL),
(8, 'Correos notificación asignación masiva de roles', NULL, 'NUM_MAI_ROL', 'monica.bayas@educacion.gob.ec', NULL),
(9, 'Número máximo de Registros a subir en cargas masivas.', 2000, 'MAX_REGISTRO', NULL, NULL),
(10, 'Edad Máxima.', 70, 'MAX_EDAD', NULL, NULL),
(11, 'Edad Mínima.', 4, 'MIN_EDAD', NULL, NULL),
(12, 'Token para envío de whatsapp', 30, 'token', 'GA231108155143', 'A'),
(13, 'Número de celular desde donde se envía los whatsapp', 30, 'celular', '0992752367', 'A'),
(14, 'INSTANCIA DE LA COMPETENCIA', 1, 'INSTANCIA', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_persona`
--

CREATE TABLE `cat_persona` (
  `codigo` int(11) NOT NULL,
  `identificacion` varchar(60) NOT NULL,
  `cedula` varchar(15) DEFAULT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `fecha_nacimiento` datetime(6) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `correo` varchar(50) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_persona`
--

INSERT INTO `cat_persona` (`codigo`, `identificacion`, `cedula`, `nombres`, `apellidos`, `fecha_nacimiento`, `direccion`, `correo`, `celular`, `estado`) VALUES
(1, '1707025746', NULL, 'VICENTE JAVIER', 'BRITO ARIAS', '1961-05-12 00:00:00.000000', 'venezuela y san nicolas Terracota B casa 30', 'vjbritoa@hotmail.com', '0992752367', 'A'),
(2, '1718092487', NULL, 'DARIO XAVIER', 'BRITO LÓPEZ', '1989-08-19 00:00:00.000000', 'VENEZUELA Y VIÑEDOS TERRACOTA B CASA 30', 'dxbritol@gmail.com', '0995038551', 'A'),
(3, '1721498838', NULL, 'DAVID SANTIAGO', 'BRITO LÓPEZ', '1993-01-13 01:00:00.000000', 'VENEZUELA Y VIÑEDOS', 'davidsbritol@gmail.com', '0998069137', 'A'),
(46, 'javier.brito0562@gmail.co', 'Suscriptor', 'Vicente', 'Peña', NULL, NULL, 'javier.brito0562@gmail.com', NULL, 'A'),
(47, 'crisbi@hotmail.com', 'Suscriptor', 'Ma. Cris', 'Brito López', NULL, NULL, 'crisbi@hotmail.com', NULL, 'A'),
(48, 'vjbritoa@yahoo.com', 'Suscriptor', 'JAVIER', 'BRITO', '2023-12-29 00:00:00.000000', NULL, 'vjbritoa@yahoo.com', '0992752367', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_producto`
--

CREATE TABLE `cat_producto` (
  `codigo` int(11) NOT NULL,
  `cod_marca` int(6) DEFAULT NULL,
  `cod_unidad` int(6) DEFAULT NULL,
  `descripcion` varchar(125) NOT NULL,
  `precio_compra` float DEFAULT NULL,
  `precio_costo` float NOT NULL,
  `precio_mayoreo` float DEFAULT NULL,
  `precio_minoreo` float DEFAULT NULL,
  `aplica_iva` int(1) DEFAULT 1,
  `num_existencia_actual` int(4) NOT NULL,
  `num_existencia_minima` int(4) DEFAULT NULL,
  `imagen` blob DEFAULT NULL,
  `nombre_imagen` varchar(100) DEFAULT NULL,
  `path_imagen` varchar(100) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `fecha_registra` date DEFAULT NULL,
  `cod_modulo` int(6) NOT NULL,
  `cod_categoria` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_producto`
--

INSERT INTO `cat_producto` (`codigo`, `cod_marca`, `cod_unidad`, `descripcion`, `precio_compra`, `precio_costo`, `precio_mayoreo`, `precio_minoreo`, `aplica_iva`, `num_existencia_actual`, `num_existencia_minima`, `imagen`, `nombre_imagen`, `path_imagen`, `estado`, `fecha_registra`, `cod_modulo`, `cod_categoria`) VALUES
(1, NULL, NULL, 'NETFLIX', 0, 10, 9, 0, 0, 1, 2, NULL, NULL, NULL, 'A', '2023-12-21', 2, NULL),
(2, NULL, NULL, 'MATRIZ', 4, 5, 4.5, 0, 0, 5, 2, NULL, NULL, NULL, 'A', '2023-12-29', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_transaccion`
--

CREATE TABLE `cat_transaccion` (
  `codigo` int(11) NOT NULL,
  `cod_cliente` int(6) NOT NULL,
  `cod_producto` int(6) DEFAULT NULL,
  `descripcion` varchar(125) NOT NULL,
  `precio` float DEFAULT NULL,
  `precio_promocion` float DEFAULT NULL,
  `num_producto` int(4) NOT NULL,
  `num_producto_adicional` int(4) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `monto_descuento` float DEFAULT NULL,
  `aplica_iva` int(1) DEFAULT 1,
  `estado` varchar(1) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_caduca` date DEFAULT NULL,
  `fecha_registra` date NOT NULL,
  `num_mes` int(4) DEFAULT NULL,
  `cod_modulo` int(6) NOT NULL,
  `cod_operacion` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_transaccion`
--

INSERT INTO `cat_transaccion` (`codigo`, `cod_cliente`, `cod_producto`, `descripcion`, `precio`, `precio_promocion`, `num_producto`, `num_producto_adicional`, `monto`, `monto_descuento`, `aplica_iva`, `estado`, `fecha_inicio`, `fecha_fin`, `fecha_caduca`, `fecha_registra`, `num_mes`, `cod_modulo`, `cod_operacion`) VALUES
(1, 2, 1, 'PRUEBAS', 10, NULL, 1, NULL, 10, NULL, 0, 'A', '2023-12-21', '2024-01-28', NULL, '2023-12-28', 1, 2, 1),
(2, 1, 1, 'TRANSACCION JB', 5, NULL, 1, NULL, 5, NULL, 0, 'A', '2023-12-22', '2024-01-27', NULL, '2023-12-27', 1, 2, 1),
(3, 1, 1, 'MATRIZ', 10, NULL, 2, NULL, 20, NULL, 0, 'A', '2023-12-22', '2024-01-22', NULL, '2023-12-22', 1, 2, 1),
(4, 1, 1, 'TRANSACCION JB', 10, NULL, 1, NULL, 10, NULL, 0, 'A', '2023-12-27', '2024-01-28', NULL, '2023-12-28', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_aplicacion`
--

CREATE TABLE `seg_aplicacion` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `prefijo` varchar(3) NOT NULL COMMENT 'TRIAL',
  `nombre` varchar(255) NOT NULL COMMENT 'TRIAL',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'TRIAL',
  `tipo` varchar(3) NOT NULL COMMENT 'TRIAL',
  `url` varchar(150) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'TRIAL',
  `est_visualizacion_rpr` varchar(1) DEFAULT 'S' COMMENT 'TRIAL',
  `est_visualizacion_rec` varchar(1) DEFAULT 'S' COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_aplicacion`
--

INSERT INTO `seg_aplicacion` (`codigo`, `prefijo`, `nombre`, `descripcion`, `tipo`, `url`, `estado`, `est_visualizacion_rpr`, `est_visualizacion_rec`) VALUES
(1, 'SEG', 'Seguridades', 'Seguridades MinEduc', '1', '/asedinfo-servicios', 'A', NULL, NULL),
(2, 'VEN', 'VENTAS', 'VENTAS DE PRODUCTOS Y SERVICIOS', '1', '/asedinfo-servicios', 'A', NULL, NULL),
(3, 'AHO', 'AHORROS', 'AHORROS', '1', '/asedinfo-servicios', 'A', NULL, NULL),
(4, 'CAT', 'CATALOGO', 'CATALOGO DE TODOS LOS APLICATIVOS', '1', '/asedinfo-servicios', 'A', NULL, NULL),
(5, 'COM', 'COMPETENCIA', 'COMPETENCIA 2024', '1', '/asedinfo-servicios', 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_asignacion_usuario_sede`
--

CREATE TABLE `seg_asignacion_usuario_sede` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `codigo_usuario` int(11) NOT NULL COMMENT 'TRIAL',
  `codigo_sede` int(11) NOT NULL COMMENT 'TRIAL',
  `fecha_asignacion` datetime(6) NOT NULL COMMENT 'TRIAL',
  `fecha_finalizacion` datetime(6) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_clave_usuario`
--

CREATE TABLE `seg_clave_usuario` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_usuario` int(11) NOT NULL COMMENT 'TRIAL',
  `clave` varchar(255) NOT NULL COMMENT 'TRIAL',
  `fecha_inicio` datetime(6) NOT NULL COMMENT 'TRIAL',
  `fecha_fin` datetime(6) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) DEFAULT NULL COMMENT 'TRIAL',
  `estado_fin_clave` varchar(1) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_clave_usuario`
--

INSERT INTO `seg_clave_usuario` (`codigo`, `cod_usuario`, `clave`, `fecha_inicio`, `fecha_fin`, `estado`, `estado_fin_clave`) VALUES
(1, 1, '0f3d014eead934bbdbacb62a01dc4831', '2014-08-29 22:58:29.000000', NULL, 'A', NULL),
(14, 1, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-20 12:10:21.601000', NULL, 'A', NULL),
(15, 1, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-20 12:46:28.962000', NULL, 'A', NULL),
(16, 1, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-20 12:46:37.948000', NULL, 'A', NULL),
(17, 7, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-21 10:43:39.864000', NULL, 'A', NULL),
(18, 7, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-21 10:44:17.409000', NULL, 'A', NULL),
(19, 2, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-24 11:35:46.666000', NULL, 'A', NULL),
(20, 3, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-28 10:04:17.822000', NULL, 'A', NULL),
(21, 4, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-04 10:09:50.951000', NULL, 'A', NULL),
(22, 6, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-04 10:33:15.869000', NULL, 'A', NULL),
(23, 7, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-04 10:33:16.132000', NULL, 'A', NULL),
(24, 8, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-04 10:52:14.016000', NULL, 'A', NULL),
(25, 9, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-04 11:16:25.474000', NULL, 'A', NULL),
(26, 9, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-04 11:18:10.084000', NULL, 'A', NULL),
(27, 10, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:12:20.169000', NULL, 'A', NULL),
(28, 11, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:20:39.361000', NULL, 'A', NULL),
(29, 12, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:20:39.874000', NULL, 'A', NULL),
(30, 13, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:20:40.180000', NULL, 'A', NULL),
(31, 13, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:20:40.967000', NULL, 'A', NULL),
(32, 14, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:20:41.298000', NULL, 'A', NULL),
(33, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:20:41.723000', NULL, 'A', NULL),
(34, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:20:41.956000', NULL, 'A', NULL),
(35, 16, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 12:20:42.200000', NULL, 'A', NULL),
(36, 17, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 14:58:24.267000', NULL, 'A', NULL),
(37, 12, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 14:58:24.714000', NULL, 'A', NULL),
(38, 13, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 14:58:24.940000', NULL, 'A', NULL),
(39, 13, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 14:58:25.132000', NULL, 'A', NULL),
(40, 14, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 14:58:25.315000', NULL, 'A', NULL),
(41, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 14:58:25.486000', NULL, 'A', NULL),
(42, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 14:58:25.723000', NULL, 'A', NULL),
(43, 18, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 14:58:25.957000', NULL, 'A', NULL),
(44, 19, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:37:59.616000', NULL, 'A', NULL),
(45, 12, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:37:59.893000', NULL, 'A', NULL),
(46, 13, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:38:00.075000', NULL, 'A', NULL),
(47, 14, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:38:00.290000', NULL, 'A', NULL),
(48, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:38:00.623000', NULL, 'A', NULL),
(49, 20, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:38:00.857000', NULL, 'A', NULL),
(50, 21, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:52:27.223000', NULL, 'A', NULL),
(51, 12, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:52:27.508000', NULL, 'A', NULL),
(52, 13, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:52:27.669000', NULL, 'A', NULL),
(53, 14, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:52:27.840000', NULL, 'A', NULL),
(54, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:52:28.022000', NULL, 'A', NULL),
(55, 22, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 15:52:28.332000', NULL, 'A', NULL),
(56, 23, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:00:40.910000', NULL, 'A', NULL),
(57, 12, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:00:41.197000', NULL, 'A', NULL),
(58, 13, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:00:41.368000', NULL, 'A', NULL),
(59, 14, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:00:41.673000', NULL, 'A', NULL),
(60, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:00:41.888000', NULL, 'A', NULL),
(61, 24, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:00:42.086000', NULL, 'A', NULL),
(62, 25, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:29:58.185000', NULL, 'A', NULL),
(63, 12, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:29:58.647000', NULL, 'A', NULL),
(64, 13, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:29:58.830000', NULL, 'A', NULL),
(65, 14, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:29:59.138000', NULL, 'A', NULL),
(66, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:29:59.347000', NULL, 'A', NULL),
(67, 26, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-15 16:29:59.564000', NULL, 'A', NULL),
(68, 27, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-18 12:32:24.443000', NULL, 'A', NULL),
(69, 12, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-18 12:32:24.874000', NULL, 'A', NULL),
(70, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-18 12:32:25.333000', NULL, 'A', NULL),
(71, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-18 12:32:25.532000', NULL, 'A', NULL),
(72, 28, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-18 14:53:01.001000', NULL, 'A', NULL),
(73, 12, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-18 14:53:01.299000', NULL, 'A', NULL),
(74, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-18 14:53:01.509000', NULL, 'A', NULL),
(75, 15, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-18 14:53:01.719000', NULL, 'A', NULL),
(76, 29, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-26 14:05:49.639000', NULL, 'A', NULL),
(77, 30, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-26 14:05:50.351000', NULL, 'A', NULL),
(78, 31, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-26 14:05:50.676000', NULL, 'A', NULL),
(79, 31, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-26 14:05:50.980000', NULL, 'A', NULL),
(80, 32, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-29 10:34:17.066000', NULL, 'A', NULL),
(81, 33, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-29 10:34:17.839000', NULL, 'A', NULL),
(82, 34, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-29 10:34:18.220000', NULL, 'A', NULL),
(83, 34, '0f3d014eead934bbdbacb62a01dc4831', '2023-12-29 10:34:18.491000', NULL, 'A', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_inicio_sesion`
--

CREATE TABLE `seg_inicio_sesion` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `fecha` datetime(6) DEFAULT NULL COMMENT 'TRIAL',
  `ip` varchar(50) DEFAULT NULL COMMENT 'TRIAL',
  `usuario` varchar(10) DEFAULT NULL COMMENT 'TRIAL',
  `prefijo_aplicacion` varchar(3) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_inicio_sesion`
--

INSERT INTO `seg_inicio_sesion` (`codigo`, `fecha`, `ip`, `usuario`, `prefijo_aplicacion`) VALUES
(1, '2023-06-20 00:00:00.000001', '10.2.193.246', '1707025746', 'SEG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_recurso`
--

CREATE TABLE `seg_recurso` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `nombre` varchar(50) NOT NULL COMMENT 'TRIAL',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'TRIAL',
  `url` varchar(150) NOT NULL COMMENT 'TRIAL',
  `codigo_padre` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `nivel` decimal(1,0) NOT NULL COMMENT 'TRIAL',
  `estado` varchar(1) NOT NULL COMMENT 'TRIAL',
  `codigo_aplicacion` int(11) NOT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_recurso`
--

INSERT INTO `seg_recurso` (`codigo`, `nombre`, `descripcion`, `url`, `codigo_padre`, `nivel`, `estado`, `codigo_aplicacion`) VALUES
(1, 'Seguridad', 'Administración', '#', NULL, 1, 'A', 1),
(2, 'Aplicación', 'Administración de Aplicación', 'pages/seguridad/aplicacion', 1, 2, 'A', 1),
(3, 'Recursos por Rol', 'Asignación de Recursos por Rol', 'pages/seguridad/rolAplicacionRecurso', 1, 2, 'A', 1),
(4, 'Sede', 'Administración de Sede', 'pages/seguridad/sede', 1, 2, 'A', 1),
(5, 'Recurso', 'Administración de Recurso', 'pages/seguridad/recurso', 1, 2, 'A', 1),
(6, 'Rol por Aplicación', 'Administración de Rol por Aplicación', 'pages/seguridad/rolAplicacion', 1, 2, 'A', 1),
(7, 'Usuarios', 'Administración de Usuarios', 'pages/seguridad/usuario', 1, 2, 'A', 1),
(8, 'Usuario Rol Aplicación', 'Usuario por Roly por Aplicación', 'pages/seguridad/usuarioRolAplicacion', 1, 2, 'A', 1),
(9, 'Venta', 'Administración Venta', '#', NULL, 1, 'A', 2),
(10, 'Cliente', 'Gestión datos cliente', 'pages/venta/cliente', 9, 2, 'A', 2),
(11, 'Ahorro', 'Administración Ahorro', '#', NULL, 1, 'A', 3),
(12, 'Datos Socio', 'Gestión datos socio', 'pages/ahorro/socio', 11, 2, 'A', 3),
(13, 'Catálogo', 'Catálogo', '#', NULL, 1, 'A', 4),
(14, 'Persona', 'Gestión datos persona', '/pages/catalogo/persona', 13, 2, 'A', 4),
(15, 'Producto', 'Gestión datos producto', '/pages/catalogo/producto', 13, 2, 'A', 4),
(16, 'Transacción', 'Gestión datos transacción', '/pages/venta/transaccion', 9, 2, 'A', 2),
(17, 'Competencia', 'Administración Competencia', '#', NULL, 1, 'A', 5),
(18, 'Participante', 'Gestión datos participante', 'pages/competencia/participante', 17, 2, 'A', 5),
(19, 'Puntaje', 'Gestión datos puntaje', 'pages/competencia/puntaje', 17, 2, 'A', 5),
(20, 'Categoría', 'Gestión datos categoría', '/pages/catalogo/categoria', 13, 2, 'A', 4),
(21, 'Subcategoría', 'Gestión datos subcategoría', '/pages/catalogo/subcategoria', 13, 2, 'A', 4),
(22, 'Parámetro', 'Parámetro', '/pages/catalogo/parametro', 13, 2, 'A', 4),
(23, 'Resultado', 'Gestión resultado', '/pages/competencia/resultado', 17, 2, 'A', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_rol_aplicacion`
--

CREATE TABLE `seg_rol_aplicacion` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_aplicacion` int(11) NOT NULL COMMENT 'TRIAL',
  `nombre` varchar(50) NOT NULL COMMENT 'TRIAL',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) NOT NULL COMMENT 'TRIAL',
  `enum_rol_seg` varchar(24) DEFAULT NULL COMMENT 'TRIAL',
  `fec_inactivacion` datetime(6) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_rol_aplicacion`
--

INSERT INTO `seg_rol_aplicacion` (`codigo`, `cod_aplicacion`, `nombre`, `descripcion`, `estado`, `enum_rol_seg`, `fec_inactivacion`) VALUES
(1, 1, 'ADMINISTRADOR GENERAL', 'SUPER ADMINISTRADOR PARA EL SISTEMA DE SEGURIDADES Y ENCARGADO DE CREAR ADMINISTRADOR DE APLICACIONES', 'A', 'ADMINISTRADOR_GENERAL', NULL),
(2, 1, 'ADMINISTRADOR DE APLICACIONES', 'ADMINISTRADOR QUE CONFIGURA UNA NUEVA APLICACIÓN, Y SE ENCARGA DE CREAR ADMINISTRADORES OPERATIVOS', 'I', 'ADMINISTRADOR_APLICACION', NULL),
(3, 1, 'ADMINISTRADOR OPERATIVO', 'ADMINISTRADOR QUE SE ENCARGA DE CREAR USUARIOS PARA UNA APLICACIÓN ESPECÍFICA', 'I', 'ADMINISTRADOR_GENERAL', NULL),
(4, 2, 'ADMINISTRADOR GENERAL', 'SUPER ADMINISTRADOR PARA EL SISTEMA DE VENTAS Y ENCARGADO DE CREAR USUARIOS SU ROL Y PERFIL', 'A', 'ADMINISTRADOR_GENERAL', NULL),
(5, 2, 'ADMINISTRADOR OPERATIVO', 'ADMINISTRADOR QUE SE ENCARGA DE CREAR USUARIOS PARA UNA APLICACIÓN ESPECÍFICA', 'I', 'ADMINISTRADOR_OPERATIVO', NULL),
(6, 3, 'ADMINISTRADOR GENERAL', 'SUPER ADMINISTRADOR PARA EL SISTEMA DE VENTAS Y ENCARGADO DE CREAR USUARIOS SU ROL Y PERFIL', 'A', 'ADMINISTRADOR_GENERAL', NULL),
(7, 3, 'ADMINISTRADOR OPERATIVO', 'ADMINISTRADOR QUE SE ENCARGA DE CREAR USUARIOS PARA UNA APLICACIÓN ESPECÍFICA', 'A', 'ADMINISTRADOR_OPERATIVO', NULL),
(8, 3, 'ADMINISTRADOR APLICACIÓN', 'ADMINISTRADOR APLICACIÓN', 'A', 'ADMINISTRADOR_APLICACION', NULL),
(9, 4, 'ADMINISTRADOR GENERAL', 'ADMINISTRADOR GENERAL PARA TODOS LOS APLICATIVOS', 'A', 'ADMINISTRADOR_GENERAL', NULL),
(10, 5, 'ADMINISTRADOR GENERAL', 'SUPER ADMINISTRADOR PARA EL SISTEMA DE VENTAS Y ENCARGADO DE CREAR USUARIOS SU ROL Y PERFIL', 'A', 'ADMINISTRADOR_GENERAL', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_rol_aplicacion_recurso`
--

CREATE TABLE `seg_rol_aplicacion_recurso` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `codigo_rol_aplicacion` int(11) NOT NULL COMMENT 'TRIAL',
  `codigo_recurso` int(11) NOT NULL COMMENT 'TRIAL',
  `estado` varchar(1) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_rol_aplicacion_recurso`
--

INSERT INTO `seg_rol_aplicacion_recurso` (`codigo`, `codigo_rol_aplicacion`, `codigo_recurso`, `estado`) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'A'),
(3, 1, 3, 'A'),
(4, 1, 4, 'A'),
(5, 1, 5, 'A'),
(6, 1, 6, 'A'),
(7, 1, 7, 'A'),
(8, 2, 1, 'A'),
(9, 2, 3, 'A'),
(10, 2, 5, 'A'),
(11, 2, 6, 'A'),
(12, 2, 7, 'A'),
(13, 3, 1, 'A'),
(14, 3, 7, 'A'),
(15, 3, 8, 'A'),
(16, 1, 8, 'A'),
(17, 5, 9, 'I'),
(18, 5, 9, 'I'),
(19, 4, 9, 'A'),
(20, 5, 10, 'I'),
(21, 4, 10, 'A'),
(22, 6, 11, 'A'),
(23, 6, 12, 'A'),
(24, 7, 11, 'A'),
(25, 7, 12, 'A'),
(26, 7, 12, 'I'),
(27, 9, 13, 'A'),
(28, 9, 14, 'A'),
(29, 9, 15, 'A'),
(30, 4, 16, 'A'),
(31, 10, 18, 'A'),
(32, 10, 19, 'A'),
(33, 10, 17, 'A'),
(34, 9, 20, 'A'),
(35, 9, 21, 'A'),
(36, 9, 22, 'A'),
(37, 10, 23, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_sede`
--

CREATE TABLE `seg_sede` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `nombre` varchar(150) NOT NULL COMMENT 'TRIAL',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'TRIAL',
  `nemonico` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `sede_superior` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) NOT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_sede`
--

INSERT INTO `seg_sede` (`codigo`, `nombre`, `descripcion`, `nemonico`, `sede_superior`, `estado`) VALUES
(1, 'MATRIZ', 'MATRIZ', 'MATRIZ', NULL, 'A'),
(2, 'MATRIZ PRUEBA', 'MATRIZ PRUEBA', 'MATPRU', 1, 'A'),
(3, 'SEDE ASEDINFO', 'SEDE ASEDINFO', 'SEDEASED', 1, 'A'),
(4, 'PRUEBA', 'string', 'NEMO', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_usuario`
--

CREATE TABLE `seg_usuario` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_persona` int(11) NOT NULL COMMENT 'TRIAL',
  `cambio_clave` varchar(2) DEFAULT NULL COMMENT 'TRIAL',
  `actualizacion_datos` varchar(2) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) NOT NULL COMMENT 'TRIAL',
  `token_cambio_clave` varchar(255) DEFAULT NULL COMMENT 'TRIAL',
  `fecha_solicitud_clave` datetime(6) DEFAULT NULL COMMENT 'TRIAL',
  `enum_rol_seg` varchar(24) DEFAULT NULL COMMENT 'TRIAL',
  `con_asignacion` decimal(1,0) DEFAULT NULL COMMENT 'TRIAL',
  `est_inactivar_roles` varchar(1) DEFAULT NULL COMMENT 'TRIAL',
  `est_activar_roles` varchar(1) DEFAULT NULL COMMENT 'TRIAL',
  `cod_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_usuario`
--

INSERT INTO `seg_usuario` (`codigo`, `cod_persona`, `cambio_clave`, `actualizacion_datos`, `estado`, `token_cambio_clave`, `fecha_solicitud_clave`, `enum_rol_seg`, `con_asignacion`, `est_inactivar_roles`, `est_activar_roles`, `cod_sede`) VALUES
(1, 1, 'SI', 'NO', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'SI', 'SI', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 'SI', 'SI', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 5, 'NO', 'NO', 'A', NULL, '2023-12-04 10:09:50.879000', NULL, NULL, NULL, NULL, NULL),
(5, 6, 'NO', 'NO', 'A', NULL, '2023-12-04 10:24:49.731000', NULL, NULL, NULL, NULL, NULL),
(6, 7, 'NO', 'NO', 'A', NULL, '2023-12-04 10:33:15.772000', NULL, NULL, NULL, NULL, NULL),
(7, 8, 'NO', 'NO', 'A', NULL, '2023-12-04 10:33:16.081000', NULL, NULL, NULL, NULL, NULL),
(8, 9, 'NO', 'NO', 'A', NULL, '2023-12-04 10:52:13.882000', NULL, NULL, NULL, NULL, NULL),
(9, 4, 'NO', 'NO', 'A', NULL, '2023-12-04 11:18:09.881000', NULL, NULL, NULL, NULL, NULL),
(10, 10, 'NO', 'NO', 'A', NULL, '2023-12-15 12:12:20.098000', NULL, NULL, NULL, NULL, NULL),
(11, 11, 'NO', 'NO', 'A', NULL, '2023-12-15 12:20:39.295000', NULL, NULL, NULL, NULL, NULL),
(12, 12, 'NO', 'NO', 'A', NULL, '2023-12-18 14:53:01.239000', NULL, NULL, NULL, NULL, NULL),
(13, 13, 'NO', 'NO', 'A', NULL, '2023-12-15 16:29:58.786000', NULL, NULL, NULL, NULL, NULL),
(14, 14, 'NO', 'NO', 'A', NULL, '2023-12-15 16:29:59.085000', NULL, NULL, NULL, NULL, NULL),
(15, 15, 'NO', 'NO', 'A', NULL, '2023-12-18 14:53:01.682000', NULL, NULL, NULL, NULL, NULL),
(16, 16, 'NO', 'NO', 'A', NULL, '2023-12-15 12:20:42.142000', NULL, NULL, NULL, NULL, NULL),
(17, 17, 'NO', 'NO', 'A', NULL, '2023-12-15 14:58:24.193000', NULL, NULL, NULL, NULL, NULL),
(18, 18, 'NO', 'NO', 'A', NULL, '2023-12-15 14:58:25.876000', NULL, NULL, NULL, NULL, NULL),
(19, 19, 'NO', 'NO', 'A', NULL, '2023-12-15 15:37:59.547000', NULL, NULL, NULL, NULL, NULL),
(20, 20, 'NO', 'NO', 'A', NULL, '2023-12-15 15:38:00.819000', NULL, NULL, NULL, NULL, NULL),
(21, 21, 'NO', 'NO', 'A', NULL, '2023-12-15 15:52:27.162000', NULL, NULL, NULL, NULL, NULL),
(22, 22, 'NO', 'NO', 'A', NULL, '2023-12-15 15:52:28.285000', NULL, NULL, NULL, NULL, NULL),
(23, 23, 'NO', 'NO', 'A', NULL, '2023-12-15 16:00:40.845000', NULL, NULL, NULL, NULL, NULL),
(24, 24, 'NO', 'NO', 'A', NULL, '2023-12-15 16:00:42.052000', NULL, NULL, NULL, NULL, NULL),
(25, 25, 'NO', 'NO', 'A', NULL, '2023-12-15 16:29:58.143000', NULL, NULL, NULL, NULL, NULL),
(26, 26, 'NO', 'NO', 'A', NULL, '2023-12-15 16:29:59.517000', NULL, NULL, NULL, NULL, NULL),
(27, 27, 'NO', 'NO', 'A', NULL, '2023-12-18 12:32:24.399000', NULL, NULL, NULL, NULL, NULL),
(28, 28, 'NO', 'NO', 'A', NULL, '2023-12-18 14:53:00.914000', NULL, NULL, NULL, NULL, NULL),
(29, 30, 'NO', 'NO', 'A', NULL, '2023-12-26 14:05:49.499000', NULL, NULL, NULL, NULL, NULL),
(30, 31, 'NO', 'NO', 'A', NULL, '2023-12-26 14:05:50.298000', NULL, NULL, NULL, NULL, NULL),
(31, 32, 'NO', 'NO', 'A', NULL, '2023-12-26 14:05:50.882000', NULL, NULL, NULL, NULL, NULL),
(32, 46, 'NO', 'NO', 'A', NULL, '2023-12-29 10:34:17.000000', NULL, NULL, NULL, NULL, NULL),
(33, 47, 'NO', 'NO', 'A', NULL, '2023-12-29 10:34:17.782000', NULL, NULL, NULL, NULL, NULL),
(34, 48, 'NO', 'NO', 'A', NULL, '2023-12-29 10:34:18.411000', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_usuario_act_roles_app`
--

CREATE TABLE `seg_usuario_act_roles_app` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_aplicacion` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `cod_usuario` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) DEFAULT NULL COMMENT 'TRIAL',
  `fecha_asignacion` datetime(6) DEFAULT NULL COMMENT 'TRIAL',
  `fecha_finalizacion` datetime(6) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_usuario_aplicacion`
--

CREATE TABLE `seg_usuario_aplicacion` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_aplicacion` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `cod_usuario` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) DEFAULT NULL COMMENT 'TRIAL',
  `fecha_asignacion` datetime(6) DEFAULT NULL COMMENT 'TRIAL',
  `fecha_finalizacion` datetime(6) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_usuario_aplicacion`
--

INSERT INTO `seg_usuario_aplicacion` (`codigo`, `cod_aplicacion`, `cod_usuario`, `estado`, `fecha_asignacion`, `fecha_finalizacion`) VALUES
(1, 1, 1, 'A', '2023-08-25 10:05:37.957000', NULL),
(2, 2, 1, 'A', '2023-08-25 10:05:37.957000', NULL),
(3, 3, 1, 'A', '2023-07-24 16:07:07.771000', NULL),
(4, 4, 1, 'A', '2023-08-23 12:27:31.906000', NULL),
(5, 4, 2, 'A', '2023-08-24 11:40:30.781000', NULL),
(6, 4, 3, 'A', '2023-12-13 10:20:39.342000', NULL),
(7, 5, 2, 'A', '2023-12-12 10:43:58.008000', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_usuario_detalle_accion`
--

CREATE TABLE `seg_usuario_detalle_accion` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_usuario` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `tipo_registro` varchar(1) DEFAULT NULL COMMENT 'TRIAL',
  `solicitado` varchar(100) DEFAULT NULL COMMENT 'TRIAL',
  `ip` varchar(50) DEFAULT NULL COMMENT 'TRIAL',
  `tipo_accion` decimal(1,0) DEFAULT NULL COMMENT 'TRIAL',
  `fecha_accion` datetime(6) DEFAULT NULL COMMENT 'TRIAL',
  `entidad` varchar(100) DEFAULT NULL COMMENT 'TRIAL',
  `cod_entidad` decimal(19,0) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_usuario_detalle_accion`
--

INSERT INTO `seg_usuario_detalle_accion` (`codigo`, `cod_usuario`, `tipo_registro`, `solicitado`, `ip`, `tipo_accion`, `fecha_accion`, `entidad`, `cod_entidad`) VALUES
(1, 1, 'A', NULL, '0.0.0.0', 1, '2023-07-19 12:33:30.000000', NULL, NULL),
(2, 2, 'A', NULL, '0.0.0.0', 1, '2023-07-25 11:01:20.799000', NULL, NULL),
(3, 3, 'A', NULL, '0.0.0.0', 1, '2023-07-25 11:02:55.988000', NULL, NULL),
(4, 2, 'A', NULL, '0.0.0.0', 1, '2023-07-25 11:19:39.347000', NULL, NULL),
(5, 2, 'A', NULL, '0.0.0.0', 1, '2023-07-25 11:19:53.716000', NULL, NULL),
(6, 1, 'A', NULL, '0.0.0.0', 1, '2023-07-28 16:42:46.443000', NULL, NULL),
(7, 1, 'A', NULL, '0.0.0.0', 1, '2023-07-28 16:45:18.596000', NULL, NULL),
(8, 1, 'A', NULL, '0.0.0.0', 1, '2023-07-28 16:46:48.639000', NULL, NULL),
(9, 2, 'A', NULL, '0.0.0.0', 1, '2023-07-31 09:50:46.735000', NULL, NULL),
(10, 1, 'A', NULL, '0.0.0.0', 1, '2023-07-31 10:01:26.629000', NULL, NULL),
(11, 3, 'A', NULL, '0.0.0.0', 1, '2023-07-31 10:03:01.272000', NULL, NULL),
(12, 4, 'A', NULL, '0.0.0.0', 1, '2023-07-31 10:17:51.553000', NULL, NULL),
(13, 5, 'A', NULL, '0.0.0.0', 1, '2023-07-31 10:20:53.272000', NULL, NULL),
(14, 6, 'A', NULL, '0.0.0.0', 1, '2023-07-31 10:30:43.218000', NULL, NULL),
(15, 6, 'A', NULL, '0.0.0.0', 1, '2023-07-31 10:36:34.431000', NULL, NULL),
(16, 6, 'A', NULL, '0.0.0.0', 1, '2023-07-31 10:36:49.400000', NULL, NULL),
(17, 1, 'A', NULL, '0.0.0.0', 1, '2023-07-31 14:46:14.869000', NULL, NULL),
(18, 1, 'A', NULL, '0.0.0.0', 1, '2023-08-20 12:10:21.824000', NULL, NULL),
(19, 1, 'A', NULL, '0.0.0.0', 1, '2023-08-20 12:46:29.003000', NULL, NULL),
(20, 1, 'A', NULL, '0.0.0.0', 1, '2023-08-20 12:46:37.986000', NULL, NULL),
(21, 7, 'A', NULL, '0.0.0.0', 1, '2023-08-21 10:43:39.982000', NULL, NULL),
(22, 7, 'A', NULL, '0.0.0.0', 1, '2023-08-21 10:44:17.789000', NULL, NULL),
(23, 2, 'A', NULL, '0.0.0.0', 1, '2023-08-24 11:35:46.941000', NULL, NULL),
(24, 3, 'A', NULL, '0.0.0.0', 1, '2023-08-28 10:04:17.959000', NULL, NULL),
(25, 4, 'A', NULL, '0.0.0.0', 1, '2023-12-04 10:09:51.018000', NULL, NULL),
(26, 6, 'A', NULL, '0.0.0.0', 1, '2023-12-04 10:33:15.916000', NULL, NULL),
(27, 7, 'A', NULL, '0.0.0.0', 1, '2023-12-04 10:33:16.169000', NULL, NULL),
(28, 8, 'A', NULL, '0.0.0.0', 1, '2023-12-04 10:52:14.057000', NULL, NULL),
(29, 9, 'A', NULL, '0.0.0.0', 1, '2023-12-04 11:16:25.513000', NULL, NULL),
(30, 9, 'A', NULL, '0.0.0.0', 1, '2023-12-04 11:18:10.133000', NULL, NULL),
(31, 10, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:12:20.241000', NULL, NULL),
(32, 11, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:20:39.401000', NULL, NULL),
(33, 12, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:20:39.913000', NULL, NULL),
(34, 13, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:20:40.229000', NULL, NULL),
(35, 13, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:20:41.026000', NULL, NULL),
(36, 14, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:20:41.368000', NULL, NULL),
(37, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:20:41.773000', NULL, NULL),
(38, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:20:41.993000', NULL, NULL),
(39, 16, 'A', NULL, '0.0.0.0', 1, '2023-12-15 12:20:42.247000', NULL, NULL),
(40, 17, 'A', NULL, '0.0.0.0', 1, '2023-12-15 14:58:24.329000', NULL, NULL),
(41, 12, 'A', NULL, '0.0.0.0', 1, '2023-12-15 14:58:24.764000', NULL, NULL),
(42, 13, 'A', NULL, '0.0.0.0', 1, '2023-12-15 14:58:24.979000', NULL, NULL),
(43, 13, 'A', NULL, '0.0.0.0', 1, '2023-12-15 14:58:25.171000', NULL, NULL),
(44, 14, 'A', NULL, '0.0.0.0', 1, '2023-12-15 14:58:25.354000', NULL, NULL),
(45, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-15 14:58:25.514000', NULL, NULL),
(46, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-15 14:58:25.762000', NULL, NULL),
(47, 18, 'A', NULL, '0.0.0.0', 1, '2023-12-15 14:58:26.006000', NULL, NULL),
(48, 19, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:37:59.668000', NULL, NULL),
(49, 12, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:37:59.932000', NULL, NULL),
(50, 13, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:38:00.136000', NULL, NULL),
(51, 14, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:38:00.329000', NULL, NULL),
(52, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:38:00.683000', NULL, NULL),
(53, 20, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:38:00.904000', NULL, NULL),
(54, 21, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:52:27.273000', NULL, NULL),
(55, 12, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:52:27.547000', NULL, NULL),
(56, 13, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:52:27.707000', NULL, NULL),
(57, 14, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:52:27.879000', NULL, NULL),
(58, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:52:28.151000', NULL, NULL),
(59, 22, 'A', NULL, '0.0.0.0', 1, '2023-12-15 15:52:28.370000', NULL, NULL),
(60, 23, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:00:40.973000', NULL, NULL),
(61, 12, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:00:41.236000', NULL, NULL),
(62, 13, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:00:41.407000', NULL, NULL),
(63, 14, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:00:41.724000', NULL, NULL),
(64, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:00:41.927000', NULL, NULL),
(65, 24, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:00:42.125000', NULL, NULL),
(66, 25, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:29:58.270000', NULL, NULL),
(67, 12, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:29:58.685000', NULL, NULL),
(68, 13, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:29:58.948000', NULL, NULL),
(69, 14, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:29:59.200000', NULL, NULL),
(70, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:29:59.393000', NULL, NULL),
(71, 26, 'A', NULL, '0.0.0.0', 1, '2023-12-15 16:29:59.602000', NULL, NULL),
(72, 27, 'A', NULL, '0.0.0.0', 1, '2023-12-18 12:32:24.533000', NULL, NULL),
(73, 12, 'A', NULL, '0.0.0.0', 1, '2023-12-18 12:32:24.924000', NULL, NULL),
(74, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-18 12:32:25.371000', NULL, NULL),
(75, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-18 12:32:25.570000', NULL, NULL),
(76, 28, 'A', NULL, '0.0.0.0', 1, '2023-12-18 14:53:01.041000', NULL, NULL),
(77, 12, 'A', NULL, '0.0.0.0', 1, '2023-12-18 14:53:01.338000', NULL, NULL),
(78, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-18 14:53:01.549000', NULL, NULL),
(79, 15, 'A', NULL, '0.0.0.0', 1, '2023-12-18 14:53:01.758000', NULL, NULL),
(80, 29, 'A', NULL, '0.0.0.0', 1, '2023-12-26 14:05:49.979000', NULL, NULL),
(81, 30, 'A', NULL, '0.0.0.0', 1, '2023-12-26 14:05:50.389000', NULL, NULL),
(82, 31, 'A', NULL, '0.0.0.0', 1, '2023-12-26 14:05:50.715000', NULL, NULL),
(83, 31, 'A', NULL, '0.0.0.0', 1, '2023-12-26 14:05:51.064000', NULL, NULL),
(84, 32, 'A', NULL, '0.0.0.0', 1, '2023-12-29 10:34:17.137000', NULL, NULL),
(85, 33, 'A', NULL, '0.0.0.0', 1, '2023-12-29 10:34:17.901000', NULL, NULL),
(86, 34, 'A', NULL, '0.0.0.0', 1, '2023-12-29 10:34:18.282000', NULL, NULL),
(87, 34, 'A', NULL, '0.0.0.0', 1, '2023-12-29 10:34:18.542000', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_usuario_inact_app`
--

CREATE TABLE `seg_usuario_inact_app` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_aplicacion` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `cod_usuario` int(11) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) DEFAULT NULL COMMENT 'TRIAL',
  `fecha_asignacion` datetime(6) DEFAULT NULL COMMENT 'TRIAL',
  `fecha_finalizacion` datetime(6) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_usuario_rol_aplicacion`
--

CREATE TABLE `seg_usuario_rol_aplicacion` (
  `codigo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_usuario` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_rol_aplicacion` int(11) NOT NULL COMMENT 'TRIAL',
  `fecha_inicial` datetime(6) NOT NULL COMMENT 'TRIAL',
  `fecha_final` datetime(6) DEFAULT NULL COMMENT 'TRIAL',
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `seg_usuario_rol_aplicacion`
--

INSERT INTO `seg_usuario_rol_aplicacion` (`codigo`, `cod_usuario`, `cod_rol_aplicacion`, `fecha_inicial`, `fecha_final`, `estado`) VALUES
(1, 1, 1, '2023-07-19 08:38:18.000000', NULL, 'A'),
(2, 1, 2, '2023-07-17 11:22:55.000000', '2023-07-17 12:32:28.000000', 'I'),
(3, 1, 3, '2023-07-17 11:19:17.000000', '2023-08-23 12:30:14.497000', 'I'),
(4, 1, 5, '2023-07-19 11:54:47.000000', NULL, 'A'),
(5, 1, 6, '2023-07-24 16:06:44.976000', NULL, 'A'),
(6, 1, 7, '2023-07-24 16:07:07.850000', '2023-08-21 14:38:58.020000', 'I'),
(7, 1, 9, '2023-08-23 12:27:32.157000', NULL, 'A'),
(8, 2, 4, '2023-08-24 11:36:15.612000', NULL, 'A'),
(9, 2, 9, '2023-08-24 11:40:30.902000', NULL, 'A'),
(10, 1, 4, '2023-08-25 10:05:38.136000', NULL, 'A'),
(11, 3, 6, '2023-08-28 10:04:53.333000', '2023-12-13 10:20:29.467000', 'I'),
(12, 1, 10, '2023-12-01 16:34:51.603000', NULL, 'A'),
(13, 3, 10, '2023-12-12 10:43:32.730000', NULL, 'A'),
(14, 2, 10, '2023-12-12 10:43:58.181000', NULL, 'A'),
(15, 3, 9, '2023-12-13 10:20:39.610000', NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ven_cliente`
--

CREATE TABLE `ven_cliente` (
  `codigo` int(11) NOT NULL,
  `tipo_cliente` varchar(150) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `cod_persona` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ven_cliente`
--

INSERT INTO `ven_cliente` (`codigo`, `tipo_cliente`, `fecha_inicio`, `cod_persona`, `estado`) VALUES
(1, 'REGULAR', '2023-08-21 00:00:00.000000', 1, 'A'),
(2, 'mayorista', '2023-08-25 00:00:00.000000', 2, 'A'),
(3, 'ocasional', '2023-08-28 00:00:00.000000', 3, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_categoria`
--

CREATE TABLE `wp_categoria` (
  `codigo` int(11) NOT NULL,
  `denominacion` varchar(100) NOT NULL DEFAULT '',
  `estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wp_categoria`
--

INSERT INTO `wp_categoria` (`codigo`, `denominacion`, `estado`) VALUES
(1, 'PRE INFANTIL', 'A'),
(2, 'INFANTIL', 'A'),
(3, 'JUNIOR', 'A'),
(4, 'ESTUDIANTES', 'A'),
(5, 'AMATEUR', 'A'),
(6, 'PRO-AM', 'A'),
(7, 'OPEN', 'A'),
(8, 'URBANO', 'A'),
(9, '1VS1 -INDESTRUCTIBLE-', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_estado_competencia`
--

CREATE TABLE `wp_estado_competencia` (
  `codigo` int(11) NOT NULL,
  `denominacion` varchar(100) NOT NULL DEFAULT '',
  `estado` varchar(1) DEFAULT NULL,
  `color_boton` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wp_estado_competencia`
--

INSERT INTO `wp_estado_competencia` (`codigo`, `denominacion`, `estado`, `color_boton`) VALUES
(1, 'Pendiente', 'A', 'gray'),
(2, 'Inscrito', 'A', 'yellow'),
(3, 'En Camerino', 'A', 'blue'),
(4, 'En Escenario', 'A', 'green'),
(5, 'Completado', 'A', 'Brown'),
(6, 'No se presenta', 'A', 'red');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_instancia`
--

CREATE TABLE `wp_instancia` (
  `codigo` int(11) NOT NULL,
  `denominacion` varchar(100) DEFAULT '',
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wp_instancia`
--

INSERT INTO `wp_instancia` (`codigo`, `denominacion`, `estado`) VALUES
(1, 'CLASIFICATORIA', 'A'),
(2, 'SEMIFINAL', 'A'),
(3, 'FINAL', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_modelo_puntaje`
--

CREATE TABLE `wp_modelo_puntaje` (
  `codigo` int(11) NOT NULL,
  `denominacion` varchar(100) NOT NULL DEFAULT '',
  `porcentaje` decimal(5,2) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wp_modelo_puntaje`
--

INSERT INTO `wp_modelo_puntaje` (`codigo`, `denominacion`, `porcentaje`, `estado`) VALUES
(1, 'MOVIMIENTOS', 50.00, 'A'),
(2, 'DESTREZAS', 50.00, 'A'),
(99, 'TOTALES', 0.00, 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_participante`
--

CREATE TABLE `wp_participante` (
  `codigo` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(60) DEFAULT '',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` varchar(100) DEFAULT '',
  `postcode` varchar(20) DEFAULT '',
  `city` varchar(100) DEFAULT '',
  `state` varchar(100) DEFAULT '',
  `cod_persona` int(11) NOT NULL,
  `cod_subcategoria` int(11) DEFAULT NULL,
  `cod_instancia` int(11) DEFAULT NULL,
  `cod_estado_competencia` int(11) DEFAULT NULL,
  `num_puntaje_juez` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_participante`
--

INSERT INTO `wp_participante` (`codigo`, `customer_id`, `user_id`, `username`, `first_name`, `last_name`, `email`, `date_last_active`, `date_registered`, `country`, `postcode`, `city`, `state`, `cod_persona`, `cod_subcategoria`, `cod_instancia`, `cod_estado_competencia`, `num_puntaje_juez`) VALUES
(43, 19, 9, 'javier.brito', 'Vicente', 'Peña', 'javier.brito0562@gmail.com', '2023-12-12 20:22:00', '2023-12-12 13:37:28', NULL, NULL, NULL, '', 46, 1, 1, 1, 0),
(44, 18, 10, 'Ma. Cris', 'Ma. Cris', 'Brito López', 'crisbi@hotmail.com', '2023-12-06 01:26:00', NULL, NULL, NULL, NULL, '', 47, 1, 1, 1, 0),
(45, 16, 6, 'Santiago Lopez', 'JAVIER', 'BRITO', 'vjbritoa@yahoo.com', '2023-12-04 00:36:00', '2023-12-03 19:32:54', 'ECUADOR', NULL, NULL, '', 48, 2, 1, 1, 0),
(46, 16, 6, 'Santiago Lopez', 'JAVIER', 'BRITO', 'vjbritoa@yahoo.com', '2023-12-04 00:36:00', '2023-12-03 19:32:54', 'ECUADOR', NULL, NULL, '', 48, 2, 1, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_puntaje`
--

CREATE TABLE `wp_puntaje` (
  `codigo` int(11) NOT NULL,
  `cod_modelo_puntaje` int(11) NOT NULL,
  `cod_instancia` int(11) NOT NULL,
  `cod_participante` int(11) NOT NULL,
  `cod_subcategoria` int(11) DEFAULT NULL,
  `puntaje` decimal(5,2) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `cod_usuario_juez` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wp_puntaje`
--

INSERT INTO `wp_puntaje` (`codigo`, `cod_modelo_puntaje`, `cod_instancia`, `cod_participante`, `cod_subcategoria`, `puntaje`, `estado`, `cod_usuario_juez`) VALUES
(56, 1, 1, 38, 1, 7.00, 'A', 2),
(57, 2, 1, 38, 1, 8.00, 'A', 2),
(58, 99, 1, 38, 1, 7.50, 'A', 2),
(59, 1, 1, 39, 1, 8.00, 'A', 2),
(60, 2, 1, 39, 1, 9.00, 'A', 2),
(61, 99, 1, 39, 1, 8.50, 'A', 2),
(62, 1, 1, 40, 1, 9.00, 'A', 2),
(63, 2, 1, 40, 1, 10.00, 'A', 2),
(64, 99, 1, 40, 1, 9.50, 'A', 2),
(65, 1, 1, 41, 1, 7.00, 'A', 2),
(66, 2, 1, 41, 1, 7.00, 'A', 2),
(67, 99, 1, 41, 1, 7.00, 'A', 2),
(68, 99, 1, 38, 1, 7.50, 'A', 2),
(69, 99, 1, 38, 1, 7.50, 'A', 2),
(70, 99, 1, 38, 1, 7.50, 'A', 2),
(71, 99, 1, 38, 1, 7.50, 'A', 2),
(72, 99, 1, 38, 1, 7.50, 'A', 2),
(73, 99, 1, 41, 1, 7.00, 'A', 2),
(74, 99, 1, 39, 1, 8.50, 'A', 2),
(75, 99, 1, 40, 1, 9.50, 'A', 2),
(76, 99, 1, 39, 1, 8.50, 'A', 2),
(77, 99, 1, 39, 1, 8.50, 'A', 2),
(78, 99, 1, 39, 1, 8.50, 'A', 2),
(79, 99, 1, 39, 1, 8.50, 'A', 2),
(80, 99, 1, 38, 1, 7.50, 'A', 2),
(81, 99, 1, 39, 1, 8.50, 'A', 2),
(82, 99, 1, 40, 1, 9.50, 'A', 2),
(83, 99, 1, 41, 1, 7.00, 'A', 2),
(84, 99, 1, 38, 1, 7.50, 'A', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_sub_categoria`
--

CREATE TABLE `wp_sub_categoria` (
  `codigo` int(11) NOT NULL,
  `denominacion` varchar(100) DEFAULT '',
  `cod_categoria` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wp_sub_categoria`
--

INSERT INTO `wp_sub_categoria` (`codigo`, `denominacion`, `cod_categoria`, `estado`) VALUES
(1, 'SOLISTA SALSA', 1, 'A'),
(2, 'PAREJA SALSA', 1, 'A'),
(3, 'PAREJA BACHATA', 1, 'A'),
(4, 'SOLISTA SALSA', 2, 'A'),
(5, 'SOLISTA SALSA MASCULINO', 2, 'A'),
(6, 'SOLISTA BACHATA FEMENINO', 2, 'A'),
(7, 'SOLISTA BACHATA MASCULINO', 2, 'A'),
(8, 'PAREJA SALSA', 2, 'A'),
(9, 'PAREJA BACHATA', 2, 'A'),
(10, 'SAME GENDER SALSA', 2, 'A'),
(11, 'SAME GENDER BACHATA', 2, 'A'),
(12, 'GRUPOS SALSA (ABIERTA)', 2, 'A'),
(13, 'GRUPOS BACHATA (ABIERTA)', 2, 'A'),
(14, 'SHOW DANCE (ABIERTA)', 2, 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aho_socio`
--
ALTER TABLE `aho_socio`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cat_modulo`
--
ALTER TABLE `cat_modulo`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cat_operacion`
--
ALTER TABLE `cat_operacion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cat_parametro`
--
ALTER TABLE `cat_parametro`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cat_persona`
--
ALTER TABLE `cat_persona`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cat_producto`
--
ALTER TABLE `cat_producto`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cat_transaccion`
--
ALTER TABLE `cat_transaccion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_aplicacion`
--
ALTER TABLE `seg_aplicacion`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `uk_seg_aplicacion_prefijo` (`prefijo`);

--
-- Indices de la tabla `seg_asignacion_usuario_sede`
--
ALTER TABLE `seg_asignacion_usuario_sede`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_clave_usuario`
--
ALTER TABLE `seg_clave_usuario`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idx_seg_clave_fech` (`fecha_fin`,`cod_usuario`,`clave`);

--
-- Indices de la tabla `seg_inicio_sesion`
--
ALTER TABLE `seg_inicio_sesion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_recurso`
--
ALTER TABLE `seg_recurso`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_seg_aplicacion_recurso` (`codigo_aplicacion`);

--
-- Indices de la tabla `seg_rol_aplicacion`
--
ALTER TABLE `seg_rol_aplicacion`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_seg_aplicacion_rol` (`cod_aplicacion`);

--
-- Indices de la tabla `seg_rol_aplicacion_recurso`
--
ALTER TABLE `seg_rol_aplicacion_recurso`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_sede`
--
ALTER TABLE `seg_sede`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_usuario`
--
ALTER TABLE `seg_usuario`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_usuario_act_roles_app`
--
ALTER TABLE `seg_usuario_act_roles_app`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_usuario_aplicacion`
--
ALTER TABLE `seg_usuario_aplicacion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_usuario_detalle_accion`
--
ALTER TABLE `seg_usuario_detalle_accion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_usuario_inact_app`
--
ALTER TABLE `seg_usuario_inact_app`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `seg_usuario_rol_aplicacion`
--
ALTER TABLE `seg_usuario_rol_aplicacion`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_seg_rol_usuario` (`cod_rol_aplicacion`);

--
-- Indices de la tabla `ven_cliente`
--
ALTER TABLE `ven_cliente`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `wp_categoria`
--
ALTER TABLE `wp_categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `wp_estado_competencia`
--
ALTER TABLE `wp_estado_competencia`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `wp_instancia`
--
ALTER TABLE `wp_instancia`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `wp_modelo_puntaje`
--
ALTER TABLE `wp_modelo_puntaje`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `wp_participante`
--
ALTER TABLE `wp_participante`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `email` (`email`);

--
-- Indices de la tabla `wp_puntaje`
--
ALTER TABLE `wp_puntaje`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `wp_sub_categoria`
--
ALTER TABLE `wp_sub_categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aho_socio`
--
ALTER TABLE `aho_socio`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cat_modulo`
--
ALTER TABLE `cat_modulo`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cat_operacion`
--
ALTER TABLE `cat_operacion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cat_parametro`
--
ALTER TABLE `cat_parametro`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cat_persona`
--
ALTER TABLE `cat_persona`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `cat_producto`
--
ALTER TABLE `cat_producto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cat_transaccion`
--
ALTER TABLE `cat_transaccion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `seg_aplicacion`
--
ALTER TABLE `seg_aplicacion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `seg_asignacion_usuario_sede`
--
ALTER TABLE `seg_asignacion_usuario_sede`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL';

--
-- AUTO_INCREMENT de la tabla `seg_clave_usuario`
--
ALTER TABLE `seg_clave_usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `seg_inicio_sesion`
--
ALTER TABLE `seg_inicio_sesion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `seg_recurso`
--
ALTER TABLE `seg_recurso`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `seg_rol_aplicacion`
--
ALTER TABLE `seg_rol_aplicacion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `seg_rol_aplicacion_recurso`
--
ALTER TABLE `seg_rol_aplicacion_recurso`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `seg_sede`
--
ALTER TABLE `seg_sede`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `seg_usuario`
--
ALTER TABLE `seg_usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `seg_usuario_act_roles_app`
--
ALTER TABLE `seg_usuario_act_roles_app`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL';

--
-- AUTO_INCREMENT de la tabla `seg_usuario_aplicacion`
--
ALTER TABLE `seg_usuario_aplicacion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `seg_usuario_detalle_accion`
--
ALTER TABLE `seg_usuario_detalle_accion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `seg_usuario_inact_app`
--
ALTER TABLE `seg_usuario_inact_app`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL';

--
-- AUTO_INCREMENT de la tabla `seg_usuario_rol_aplicacion`
--
ALTER TABLE `seg_usuario_rol_aplicacion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ven_cliente`
--
ALTER TABLE `ven_cliente`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `wp_categoria`
--
ALTER TABLE `wp_categoria`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `wp_estado_competencia`
--
ALTER TABLE `wp_estado_competencia`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `wp_instancia`
--
ALTER TABLE `wp_instancia`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `wp_modelo_puntaje`
--
ALTER TABLE `wp_modelo_puntaje`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `wp_participante`
--
ALTER TABLE `wp_participante`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `wp_puntaje`
--
ALTER TABLE `wp_puntaje`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `wp_sub_categoria`
--
ALTER TABLE `wp_sub_categoria`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
