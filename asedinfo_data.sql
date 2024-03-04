-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-03-2024 a las 12:53:03
-- Versión del servidor: 10.6.16-MariaDB-0ubuntu0.22.04.1
-- Versión de PHP: 8.0.30

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
(1, 'Número de días de vigencia para la expiración de la contraseña', '5000', 'CAD_DIAS', NULL, NULL),
(2, 'Caducidad masiva de contraseñas', '0', 'CAD_MASIVA', NULL, NULL),
(3, 'Cantidad de contraseñas antiguas para validar si se repiten', '5', 'NUM_CLAVES', NULL, NULL),
(4, 'Número de días anteriores para recordar la caducidad de una contraseña', '5', 'RECORDATORIO', NULL, NULL),
(5, 'Número de días de vigencia del token', '2', 'CAD_TOKEN', NULL, NULL),
(6, 'Url de documento de Acuerdo de Responsabilidad', NULL, 'URL_ACUERDO', 'http://www.educacion.gob.ec', NULL),
(7, 'Número mínimo de registros del archivo a procesar para la asignación de roles de usuarios de forma masiva.', '1', 'NUM_MIN_ROL', NULL, NULL),
(8, 'Correos notificación asignación masiva de roles', NULL, 'NUM_MAI_ROL', 'monica.bayas@educacion.gob.ec', NULL),
(9, 'Número máximo de Registros a subir en cargas masivas.', '2000', 'MAX_REGISTRO', NULL, NULL),
(10, 'Edad Máxima.', '70', 'MAX_EDAD', NULL, NULL),
(11, 'Edad Mínima.', '4', 'MIN_EDAD', NULL, NULL),
(12, 'Token para envío de whatsapp', '30', 'token', 'GA231108155143', 'A'),
(13, 'Número de celular desde donde se envía los whatsapp', '30', 'celular', '0992752367', 'A'),
(14, 'INSTANCIA DE LA COMPETENCIA', '1', 'INSTANCIA', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_persona`
--

CREATE TABLE `cat_persona` (
  `codigo` int(11) NOT NULL,
  `identificacion` varchar(120) NOT NULL,
  `cedula` varchar(15) DEFAULT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) DEFAULT NULL,
  `fecha_nacimiento` datetime(6) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `correo` varchar(120) NOT NULL,
  `celular` varchar(120) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `prefijo_telefonico` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_persona`
--

INSERT INTO `cat_persona` (`codigo`, `identificacion`, `cedula`, `nombres`, `apellidos`, `fecha_nacimiento`, `direccion`, `correo`, `celular`, `estado`, `prefijo_telefonico`) VALUES
(1, '1707025746', NULL, 'Vicente javier', 'Brito arias', '1961-05-12 00:00:00.000000', 'venezuela y san nicolas Terracota B casa 30', 'vjbritoa@hotmail.com', '0992752367', 'A', '593'),
(2, '1718092487', NULL, 'Dario xavier', 'Brito lópez', '1989-08-19 00:00:00.000000', 'VENEZUELA Y VIÑEDOS TERRACOTA B CASA 30', 'dxbritol@gmail.com', '0995038551', 'A', '593'),
(3, '1721498838', NULL, 'David', 'Brito', '2024-02-23 00:00:00.000000', NULL, 'davidsbritol@gmail.com', '0998069137', 'A', '593'),
(10, '30058273', NULL, 'Yorwin', 'Duran', NULL, '', 'godlevel05.y@gmail.com', '0984470497', 'A', '593'),
(11, '1717933699', NULL, 'Cris', 'Brito', '2024-01-29 00:00:00.000000', NULL, 'mcbritolopez@gmail.com', '630413275', 'A', '31'),
(12, '1713905550', NULL, 'Juan', 'Perez', NULL, NULL, 'cogijcp@gmail.com', '0992530322', 'A', '593'),
(13, '1718261264', NULL, 'Lesley', 'Perez', NULL, NULL, 'lesleygabrielap@hotmail.com', '0960663828', 'A', '593'),
(14, '1722638887', NULL, 'Jorge', 'Aguas', NULL, NULL, 'dnlwtc@gmail.com', '0983242456', 'A', '593'),
(15, '1803752458', NULL, 'Milton', 'Hilaño', '2024-02-27 00:00:00.000000', NULL, 'androtv0420@gmail.com', '0962339655', 'A', '593'),
(16, '1726352709', NULL, 'Mariuxi', 'Obando', NULL, NULL, 'mariupeke_112@live.com', '0995190359', 'A', '593'),
(17, '1754050696', NULL, 'Sebastian', 'Proano', NULL, NULL, 'sebasprolo2002@gmail.com', '0983077886', 'A', '593'),
(18, '1104558752', NULL, 'Maribel', 'Cabrera', NULL, NULL, 'cisnecabrera@gmail.com', '0999047121', 'A', '593'),
(19, '1717217044', NULL, 'Leonardo', 'Rodriguez', NULL, NULL, 'leoedyy@hotmail.com', '0984381313', 'A', '593'),
(20, '1719757930', NULL, 'Diego', 'Almeida', NULL, NULL, 'Diego1.dmultimedia@gmail.com', '0982420240', 'A', '593'),
(21, '1721903266', NULL, 'Wendy', 'Acosta', NULL, NULL, 'alexvaca269@gmail.com', '0985101963', 'A', '593'),
(22, '0401615562', NULL, 'Patricio', 'Yazan', NULL, NULL, 'patrikc2988@gmail.com', '0939624108', 'A', '593'),
(23, '1720146750', NULL, 'Paola', 'Ruiz', NULL, NULL, 'alexa_54_@hotmail.com', '0987143102', 'A', '593'),
(24, '1712261229', NULL, 'Alex', 'Vaca', NULL, NULL, 'alex_vacam@hotmail.com', '0987336066', 'A', '593'),
(25, '1724975477', NULL, 'Lisbeth', 'Ninabanda', NULL, NULL, 'lisbethninabanda95@gmail.com', '0989063406', 'A', '593'),
(26, '1716193550', NULL, 'Santiago', 'Rivas', NULL, NULL, 'guagualoco26@gmail.com', '0982495821', 'A', '593'),
(27, '0926712480', NULL, 'Mauricio', 'Sellan', NULL, NULL, 'xsellan23@gmail.com', '0993157349', 'A', '593'),
(28, '1714430996', NULL, 'Gabriela', 'Hernandez', NULL, NULL, 'gabyht27@hotmail.com', '34648940340', 'A', '593'),
(29, '0302556337', NULL, 'Kevin', 'Calderon', NULL, NULL, 'kevincalderonmadesco@gmail.com', '0968404562', 'A', '593'),
(30, '1711969764', NULL, 'Javier', 'Torres', NULL, NULL, 'Mrjtorress@gmail.com', '0992874901', 'A', '593'),
(31, '1721498804', NULL, 'Pablo', 'Proano', NULL, NULL, 'pablojasasmh@hotmail.com', '0958627026', 'A', '593'),
(32, '1713573366', NULL, 'Adriana', 'Reinoso', '2024-02-02 00:00:00.000000', NULL, 'adryrei07@hotmail.com', '0983314167', 'A', '593'),
(33, '0922677307', NULL, 'Alfredo', 'Palma', NULL, NULL, 'palma.docencia1@gmail.com', '0991214089', 'A', '593'),
(34, '1720996451', NULL, 'Santiago', 'Vera', NULL, NULL, 'zbera1213@gmail.com', '0994312544', 'A', '593'),
(35, '1311402927', NULL, 'Jason', 'Delgado', NULL, NULL, 'jasondel95@hotmail.com', '0981273647', 'A', '593'),
(36, '1201416920', NULL, 'Carlos', 'Orozco', NULL, NULL, 'corozcog@hotmail.com', '0999633326', 'A', '593'),
(37, '1713415642', NULL, 'Pedro', 'Ayala', NULL, NULL, 'pedroayala99@gmail.com', '0984585693', 'A', '593'),
(38, '1719964916', NULL, 'Daniela', 'Miranda', NULL, NULL, 'danymiranda1213@gmail.com', '0996647143', 'A', '593'),
(39, '1004209910001', NULL, 'Juan', 'Bolaños', '2024-02-20 00:00:00.000000', NULL, 'audiomaxproduccion@gmail.com', '0990863118', 'A', '593'),
(40, '1714981766', NULL, 'Karla', 'Herrera', NULL, NULL, 'karla.herrera89@hotmail.com', '0984448293', 'A', '593'),
(41, '1708527757', NULL, 'Cesar', 'Tayo', NULL, NULL, 'cesart_ucl@yahoo.com', '0996803456', 'A', '593'),
(42, '1721068136', NULL, 'Daniel', 'Medina', NULL, NULL, 'medinadanielsan@gmail.com', '0980013967', 'A', '593'),
(43, '1715381792001', NULL, 'Daniel', 'Ramon', NULL, NULL, 'danielramon_29@hotmail.com', '0998011887', 'A', '593'),
(44, '1750981902', NULL, 'Rodrigo', 'Rueda', NULL, NULL, 'rodrigorueda94@gmail.com', '0967484943', 'A', '593'),
(45, '0910460831', NULL, 'Carlos', 'Garcia', NULL, NULL, 'carlosgarcia1167@hotmail.com', '0987596780', 'A', '593'),
(46, '1714571153', NULL, 'Alex', 'Salcedo', NULL, NULL, 'alexfrank79@hotmail.com', '0987733303', 'A', '593'),
(47, '1717550287', NULL, 'Cristhian', 'Morales', NULL, NULL, 'cris_gabicho2236@hotmail.com', '0990767523', 'A', '593'),
(48, '0502403173', NULL, 'Any', 'Galvez', '2024-03-02 00:00:00.000000', NULL, 'algc07@hotmail.com', '0988464598', 'A', '593'),
(49, '1803085636', NULL, 'Jorge', 'Perez', NULL, NULL, 'jorgeluislps21@gmail.com', '0980586464', 'A', '593'),
(50, '1721109013', NULL, 'Luis', 'Chacha', NULL, NULL, 'l_edwar2@hotmail.com', '0998\'0626', 'A', '593'),
(51, '1721943254', NULL, 'Jorge', 'Huilcarema', NULL, NULL, 'libero2244@hotmail.com', '0992000974', 'A', '593'),
(52, '1725355729', NULL, 'Paul', 'Proano', NULL, NULL, 'paulprolo@outlook.es', '0995605755', 'A', '593'),
(53, '04817535', NULL, 'Fares', 'Zuniga', '2024-02-14 00:00:00.000000', NULL, 'zunigafares93@gmail.com', '018323199044', 'A', '1'),
(54, '0930940218', NULL, 'Xavier', 'Franco', NULL, NULL, 'fandres97@hotmail.es', '0994715256', 'A', '593'),
(55, '0703769596', NULL, 'Carlos', 'Saquinaula', '2024-02-07 00:00:00.000000', NULL, 'carlos.saquinaula83@gmail.com', '0959800278', 'A', '593'),
(56, '1003389837', NULL, 'Jorge', 'Yazan', NULL, NULL, 'vierysjorge@hotmail.com', '0994781065', 'A', '593'),
(57, '1722724315', NULL, 'Yolanda', 'Yugsi', NULL, NULL, 'eliz18yol@gmail.com', '0961166917', 'A', '593'),
(58, '1723624142', NULL, 'Monica', 'Dutan', NULL, NULL, 'monica.dutan082@gmail.com', '0960661994', 'A', '593'),
(59, '1714784913', NULL, 'Freddy', 'Arias', NULL, NULL, 'freddyarias424@hotmail.es', '0987989143', 'A', '593'),
(60, '1717734956', NULL, 'Mauricio', 'Ponce', NULL, NULL, 'fponceortiz@gmail.com', '0982331629', 'A', '593'),
(61, '1724583313', NULL, 'Sara', 'Abi riascos', NULL, NULL, 'Saraabigail1995@hotmail.com', '0984132690', 'A', '593'),
(62, '1713212510', NULL, 'Diego', 'Cadena', NULL, NULL, 'difecava82@hotmail.com', '0995850712', 'A', '593'),
(63, '1104471394', NULL, 'Carlos', 'Gonzalez', NULL, NULL, 'carlosdavid.gv@gmail.com', '09882050', 'A', '593'),
(64, '0503820805', NULL, 'Diego', 'Claudio', NULL, NULL, 'diegoxavier.100@gmail.com', '0995487050', 'A', '593'),
(65, '1720692506', NULL, 'Alejandro', 'Chancusig', NULL, NULL, 'alejomh17206@yahoo.es', '0995204128', 'A', '593'),
(66, '1716879653', NULL, 'Jefferson', 'Marcillo', NULL, NULL, 'jeffergoods_10@hotmail.com', '0984736139', 'A', '593'),
(67, '1722775978', NULL, 'Cristian', 'Mina', NULL, NULL, 'cristian.mina@outlook.es', '0995350938', 'A', '593'),
(68, '1761790326', NULL, 'Gilberto', 'Carroz', NULL, NULL, 'gilbertocarroz005@gmail.com', '0963248253', 'A', '593'),
(69, '0704725175', NULL, 'Viviana', 'Quevedo', NULL, NULL, 'vivianaquevedo29@gmail.com', '0997587196', 'A', '593'),
(70, '1723352689', NULL, 'Fabricio', 'Arce', NULL, NULL, 'alexanderarce592@gmail.com', '0989864128', 'A', '593'),
(71, '1721333605', NULL, 'Jorge', 'Calva', NULL, NULL, 'dixmh@hotmail.com', '0998544197', 'A', '593'),
(72, '1716870215', NULL, 'Hernan', 'Suarez', NULL, NULL, 'cre.nfs.cyrus@gmail.com', '0987460920', 'A', '593'),
(73, '50381197L', NULL, 'Hector', 'Paredes', '2024-02-06 00:00:00.000000', NULL, 'hparedesbr@gmail.com', '0618494424', 'A', '34'),
(74, '1804208005', NULL, 'Santiago', 'Vasquez', NULL, NULL, 'santiago_vasquez180@hotmail.com', '0984972790', 'A', '593'),
(75, '1722723457', NULL, 'Juan', 'Morales', NULL, NULL, 'jsebmorales@gmail.com', '0992723925', 'A', '593'),
(76, '1708459571', NULL, 'Eduardo', 'Carrera', NULL, NULL, 'ejcarreras68@gmail.com', '0982235444', 'A', '593'),
(77, '1205621541', NULL, 'Jessica', 'Aguilar', NULL, NULL, 'jlaguilarc2@gmail.com', '0962933685', 'A', '593'),
(78, '1726270380', NULL, 'Kari', 'Leon', NULL, NULL, 'kari.leon.qx@gmail.com', '0984863884', 'A', '593'),
(82, 'vjbritoa@hotmail.com', 'Suscriptor', 'Grupo once', '', NULL, NULL, 'vjbritoa@hotmail.com', '0992752367', 'A', '593'),
(83, 'vjbritoa@hotmail.com', 'Suscriptor', 'Grupo doce', '', NULL, NULL, 'vjbritoa@hotmail.com', '', 'A', '593'),
(84, 'solista-salsa@correo.com', 'Suscriptor', 'Maria solista', '', NULL, NULL, 'solista-salsa@correo.com', '', 'A', '593'),
(88, '1734989080', NULL, 'Evelyn', 'Zabala', NULL, '', 'evelynzabala379@gmail.com', '0992118938', 'A', '593'),
(89, '1734989080', NULL, 'Evelyn', 'Zabala', NULL, '', 'evelynzabala379@gmail.com', '0992118938', 'A', '593'),
(90, '09908000471', NULL, 'Carlos', 'Ortiz', NULL, '', 'lampard8.1998@hotmail.com', '0990800047', 'A', '593'),
(91, '593995971516', NULL, 'Saul', 'Armas', NULL, '', 'saularmas669@gmail.com', '0995971516', 'A', '593'),
(92, '1707025746', NULL, 'Vicente javier', 'Brito arias', '1961-05-12 00:00:00.000000', 'venezuela y san nicolas Terracota B casa 30', 'vjbritoa@hotmail.com', '0992752367', 'A', '593'),
(93, '1707025746', NULL, 'Javier', 'Brito', '2024-01-25 00:00:00.000000', NULL, 'vjbritoa@hotmail.com', '0992752367', 'A', '593'),
(94, '1718092487', NULL, 'Dario', 'Brito', '2024-01-25 00:00:00.000000', NULL, 'dxbritol@gmail.com', '0995038551', 'A', '593'),
(95, '593984048301', NULL, 'Javier', 'Salazar', NULL, '', 'd.javier.salazar.m@gmail.com', '0984048301', 'A', '593'),
(96, '1721109013', NULL, 'Luis', 'Chacha', NULL, NULL, 'l_edwar2@hotmail.com', '0998\'0626', 'A', '593'),
(97, '593969558209', NULL, 'Vere', 'Villegas', '2024-03-03 00:00:00.000000', NULL, 'vere_villegss17@hotmail.com', '0969558209', 'A', '593'),
(98, '1724143282', NULL, 'Gustavo', 'Morales', NULL, '', 'gustavoalfredomg@gmail.com', '0996735008', 'A', '593'),
(99, '@EMILIOZFG', NULL, 'Emilio', 'Gomez', NULL, '', 'dxbritol@gmail.com', '0995038551', 'A', '593'),
(100, '16154360701', NULL, 'Arron', 'Arron', '2024-01-30 00:00:00.000000', NULL, 'pinemonemt@gmail.com', '06154360701', 'A', '1'),
(101, '593995043172', NULL, 'Esteban ', 'Reinoso', NULL, '', 'estebanreinosogranja@gmail.com', '0995043172', 'A', '593'),
(102, '14153359195', NULL, 'Sunil', 'B', NULL, '', 'sunil3558@gmail.com', '4153359195', 'A', '593'),
(103, 'KOSTIANTYNR', NULL, 'Kostiantyn', 'Romaniv', NULL, '', 'dxbritol@gmail.com', '0995038551', 'A', '593'),
(104, '393332148690', NULL, 'Tatiana', 'Nacimba', '2024-01-30 00:00:00.000000', NULL, 'nacimba126@gmail.com', '03332148690', 'A', '39'),
(105, '1719235978', NULL, 'Cristina', 'Aguas', '1989-08-16 00:00:00.000000', '', 'tefo_1989@hotmail.com', '0983068602', 'A', '593'),
(106, '1719235978', NULL, 'Cris', 'Aguas', '2024-01-29 00:00:00.000000', NULL, 'tefo_1989@hotmail.com', '0983068602', 'A', '593'),
(107, '1719235978', NULL, 'Cristina', 'Aguas', '1989-08-16 00:00:00.000000', '', 'tefo_1989@hotmail.com', '0983068602', 'A', '593'),
(108, '593', NULL, 'Daniel', 'Intriago', NULL, '', 'danielintriago1605@gmail.com', '0988476609', 'A', '593'),
(109, '593988476609', NULL, 'Daniel', 'Intriago', '2024-02-05 00:00:00.000000', NULL, 'danielintriago1605@gmail.com', '0988476609', 'A', '593'),
(110, '1104972706', NULL, 'Maria Jose', 'Araujo', NULL, '', 'mj.araujomorocho@gmail.com', '0994445416', 'A', '593'),
(111, '593987528119', NULL, 'Maria Jose', 'Rivadeneira', NULL, '', 'majo_rivadeneira_andino@hotmail.com', '0987528119', 'A', '593'),
(112, '1717661456', NULL, 'Anita', 'Carrera', '2024-02-22 00:00:00.000000', NULL, 'anyk1000@hotmail.com', '0963548358', 'A', '593'),
(113, '1724916927', NULL, 'Adrian', 'Brito', NULL, '', 'arcarlos1998@gmail.com', '0962189888', 'A', '593'),
(114, '593984533290', NULL, 'Luis', 'Espin', NULL, '', 'disney4170618@gmail.com', '0984533290', 'A', '593'),
(115, '0401065131', NULL, 'Gorky', 'Garcia', NULL, '', 'gorky.garcia@gmail.com', '0999662276', 'A', '593'),
(123, 'ADMIN', NULL, 'Admin', 'Asedinfo', NULL, '', 'soporte@asedinfo.com', '0990620178', 'A', '593'),
(124, '593991775351', NULL, 'Julio', 'Poveda', NULL, '', 'zeus18jp@gmail.com', '0991775351', 'A', '593'),
(125, '593995051030', NULL, 'Luis', 'Oña', NULL, '', 'jr_o2000@hotmail.com', '0995051030', 'A', '593'),
(126, '593995033313', NULL, 'Diego', 'Vicuña', NULL, '', 'jdvicuna777@gmail.com', '0995033313', 'A', '593'),
(136, '34622846851', NULL, 'Manuel', 'Sousa', NULL, '', 'heyrstore@gmail.com', '0622846851', 'A', '34'),
(137, '593994510994', NULL, 'Ivan', 'Cantos', NULL, '', 'popote.castillo@gmail.com', '0994510994', 'A', '593'),
(138, '593979342891', NULL, 'Edison', 'Guevara', NULL, '', 'edisonguevara@webwonderss.com', '0979342891', 'A', '593'),
(139, '593980666472', NULL, 'Andres', 'Tipan', NULL, '', 'arq.andrestipan@gmail.com', '0980666472', 'A', '593'),
(140, '573016906590', NULL, 'Diego', 'Bolaños', NULL, '', 'dvbolanos@gmail.com', '03016906590', 'A', '57'),
(141, 'minutoAminuto', 'minutoAminuto', 'MINUTO', 'MINUTO A', NULL, '', 'minutoAminuto@asedinfo.com', '0992752367', 'A', '593'),
(146, 'juanhomr@gmail.com', 'Suscriptor', 'JUAN MENDEZ', ' ', NULL, NULL, 'juanhomr@gmail.com', NULL, 'A', '593'),
(147, 'crisbravo565@gmail.com', 'Suscriptor', 'DANIELA BRAVO', ' ', NULL, NULL, 'crisbravo565@gmail.com', NULL, 'A', '593'),
(148, '593993506943', 'Suscriptor', 'Ruth', 'Rivera', NULL, '', 'r_jenniffer@hotmail.com', '0993506943', 'A', '593'),
(149, 'davidsbritol@gmail.com', 'Suscriptor', 'DAVID BRITO', '', NULL, NULL, 'davidsbritol@gmail.com', NULL, 'A', '593'),
(151, 'huizi.iris@gmail.com', 'Suscriptor', 'IRIS HUIZI', ' ', NULL, NULL, 'huizi.iris@gmail.com', NULL, 'A', '593'),
(152, 'cinthialuna0@gmail.com', 'Suscriptor', 'CINTHIA LUNA', ' ', '2007-09-17 00:00:00.000000', NULL, 'cinthialuna0@gmail.com', '0998069137', 'A', '593'),
(154, 'apartidasrosendo@gmail.com', 'Suscriptor', 'ANDREA PARTIDAS', ' ', NULL, NULL, 'apartidasrosendo@gmail.com', NULL, 'A', '593'),
(161, 'bailaquebaila20@gmail.com', 'Suscriptor', 'ISMAEL PALMAR', ' ', NULL, NULL, 'bailaquebaila20@gmail.com', NULL, 'A', '593'),
(162, 'esojessy@hotmail.com', 'Suscriptor', 'JÉSSICA RIVAS', ' ', NULL, NULL, 'esojessy@hotmail.com', NULL, 'A', '593'),
(163, 'mabelpumisacho.17@gmail.com', 'Suscriptor', 'SOFÍA LEMA', '', '2016-02-20 00:00:00.000000', NULL, 'mabelpumisacho.17@gmail.com', '0984569667', 'A', '593'),
(164, 'juan.martín.dueñas', 'Suscriptor', 'JUAN MARTÍN DUEÑAS', '', '2009-12-13 00:00:00.000000', NULL, 'mabelpumisacho.17@gmail.com', '0984569667', 'A', '593'),
(165, '593999306611', NULL, 'Patricio', 'Galvez', NULL, '', 'pgalvezquito@hotmail.com', '0999306611', 'A', '593'),
(166, '593989714709', NULL, 'Jonathan', 'Cevallos', NULL, '', 'jdhbomax6@jdigitalshop.com', '0989714709', 'A', '593');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_prefijo_telefonico`
--

CREATE TABLE `cat_prefijo_telefonico` (
  `nombre_pais` varchar(150) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_prefijo_telefonico`
--

INSERT INTO `cat_prefijo_telefonico` (`nombre_pais`, `codigo`) VALUES
('Afganistán', '93'),
('Albania', '355'),
('Alemania', '49'),
('Andorra', '376'),
('Angola', '244'),
('Anguila', '1264'),
('Antartida', '672'),
('Antigua y Barbuda', '1268'),
('Antillas Holandesas', '599'),
('Arabia Saudí', '966'),
('Argelia', '213'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Ascension Island', '247'),
('Australia', '61'),
('Austria', '43'),
('Azerbaiyan', '994'),
('Bahamas', '1242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1246'),
('Belarus', '375'),
('Bélgica', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia y Herzegovina', '387'),
('Botswana', '267'),
('Brasil', '55'),
('Brunei Darussalam', '673'),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cabo Verde', '238'),
('Camboya', '855'),
('Camerún', '237'),
('Canada', '1'),
('Chad', '235'),
('Chequia', '420'),
('Chile', '56'),
('China', '86'),
('Chipre', '357'),
('Colombia', '57'),
('Comores Islas', '269'),
('Costa de Marfil', '225'),
('Costa Rica', '506'),
('Croacia', '385'),
('Cuba', '53'),
('Dinamarca', '45'),
('Djibouti', '253'),
('Dominica', '1767'),
('Ecuador', '593'),
('Egipto', '20'),
('El Salvador', '503'),
('Emiratos Árabes Unidos', '971'),
('Eritrea', '291'),
('Eslovaquia', '421'),
('Eslovenia', '386'),
('España', '34'),
('Estados Federados de Micronesia', '691'),
('Estados Unidos', '1'),
('Estonia', '372'),
('Esvalbard y Jan Mayen', '79'),
('Etiopía', '251'),
('Fiji', '679'),
('Filipinas', '63'),
('Finlandia', '358'),
('Francia', '33'),
('Gabón', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Ghana', '233'),
('Gibraltar', '350'),
('Granada', '1473'),
('Grecia', '30'),
('Groenlandia', '299'),
('Guadalupe', '590'),
('Guam', '1671'),
('Guatemala', '502'),
('Guernsey', '44'),
('Guinea', '224'),
('Guinea Ecuatorial', '240'),
('Guinea Francesa', '594'),
('Guinea Bissau', '245'),
('Guyana', '592'),
('Haití', '509'),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungría', '36'),
('India', '91'),
('Indonesia', '62'),
('Irak', '964'),
('Iran', '98'),
('Isla Navidad', '61'),
('Isla Navidad', '672'),
('Islandia', '354'),
('Islas Caiman', '1345'),
('Islas Cook', '682'),
('Islas de Norte-Mariana', '1670'),
('Islas Feroe', '298'),
('Islas Malvinas', '500'),
('Islas Marshall', '692'),
('Islas Norfolk', '672'),
('Islas Salomón', '677'),
('Islas Turks y Caicos', '1649'),
('Islas Ultramarinas de Estados Unidos', '808'),
('Islas Vírgenes Britanicas', '1284'),
('Islas Vírgenes Estadounidenses', '1340'),
('Isle of Man', '44'),
('Israel', '972'),
('Italia', '39'),
('Jamaica', '1876'),
('Japón', '81'),
('Jersey', '44'),
('Jordania', '962'),
('Kazajstan', '7'),
('Kenia', '254'),
('Kirgistan', '996'),
('Kiribati', '686'),
('Kuwait', '965'),
('Lesoto', '266'),
('Letonia', '371'),
('Libano', '961'),
('Liberia', '231'),
('Libia', '218'),
('Liechtenstein', '41'),
('Lituania', '370'),
('Luxemburgo', '352'),
('Macao', '853'),
('Macedonia', '389'),
('Madagascar', '261'),
('Malasia', '60'),
('Malawi', '265'),
('Maldivas', '960'),
('Mali', '223'),
('Malta', '356'),
('Marruecos', '212'),
('Martinica', '596'),
('Mauricio', '230'),
('Mauritania', '222'),
('Mayote', '269'),
('México', '52'),
('Mianmar', '95'),
('Moldavia', '373'),
('Mónaco', '377'),
('Mongolia', '976'),
('Montserrat', '1664'),
('Mozambique', '258'),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Nicaragua', '505'),
('Níger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Noruega', '47'),
('Nueva Caledonia', '687'),
('Nueva Zelanda', '64'),
('Oman', '968'),
('Países Bajos', '31'),
('Pakistan', '92'),
('Palau', '680'),
('Palestina', '970'),
('Panama', '507'),
('Papúa Nueva Guinea', '675'),
('Paraguay', '595'),
('Perú', '51'),
('Pitcairn', '872'),
('Polinesia Francesa', '689'),
('Polonia', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reino Unido', '44'),
('República Centroafricana', '236'),
('República de Corea (Corea del Sur)', '82'),
('República de Irlanda', '353'),
('República del Congo', '242'),
('República Democratica del Congo', '243'),
('República Democratica Popular de Corea (Corea del Norte)', '850'),
('República Democratica Popular de Laos', '856'),
('República Dominicana', '1809'),
('República Dominicana', '1829'),
('República Dominicana', '1849'),
('Reunión', '262'),
('Ruanda', '250'),
('Rumanía', '40'),
('Rusia', '7'),
('Sahara Occidental', '212'),
('Samoa, Isla', '685'),
('Samoa Americana, Isla', '684'),
('San Marino', '378'),
('San Pedro y Miquelon', '508'),
('San Vincente y Las Granadinas', '1784'),
('Santa Helena', '290'),
('Santa Kitts y Nevis', '1869'),
('Santa Lucía', '1758'),
('Santo Tomé y Príncipe', '239'),
('Senegal', '221'),
('Serbia y Montenegro', '42'),
('Seychelles', '248'),
('Sierra Leona', '232'),
('Singapur', '65'),
('Siria', '963'),
('Somalia', '252'),
('Sri Lanka', '94'),
('Suazilandia', '268'),
('Sudafrica', '27'),
('Sudan', '249'),
('Suecia', '46'),
('Suiza', '41'),
('Surinam', '597'),
('Tailandia', '66'),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania', '255'),
('Tanzania', '259'),
('Territorio Oceanico de la India Britanica', '246'),
('Timor', '670'),
('Timor Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tongo', '676'),
('Trinidad y Tobago', '1868'),
('Túnez', '216'),
('Turkmenistan', '993'),
('Turquía', '90'),
('Tuvalu', '688'),
('Ucrania', '380'),
('Uganda', '256'),
('Unión Soviética', '7'),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Vaticano', '379'),
('Venezuela', '58'),
('Vietnam', '84'),
('Wallis y Futuna', '681'),
('Yemen', '967'),
('Yugoslavia', '381'),
('Zaire', '243'),
('Zambia', '260'),
('Zimbawe', '263'),
('Afganistán', '93'),
('Albania', '355'),
('Alemania', '49'),
('Andorra', '376'),
('Angola', '244'),
('Anguila', '1264'),
('Antartida', '672'),
('Antigua y Barbuda', '1268'),
('Antillas Holandesas', '599'),
('Arabia Saudí', '966'),
('Argelia', '213'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Ascension Island', '247'),
('Australia', '61'),
('Austria', '43'),
('Azerbaiyan', '994'),
('Bahamas', '1242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1246'),
('Belarus', '375'),
('Bélgica', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia y Herzegovina', '387'),
('Botswana', '267'),
('Brasil', '55'),
('Brunei Darussalam', '673'),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cabo Verde', '238'),
('Camboya', '855'),
('Camerún', '237'),
('Canada', '1'),
('Chad', '235'),
('Chequia', '420'),
('Chile', '56'),
('China', '86'),
('Chipre', '357'),
('Colombia', '57'),
('Comores Islas', '269'),
('Costa de Marfil', '225'),
('Costa Rica', '506'),
('Croacia', '385'),
('Cuba', '53'),
('Dinamarca', '45'),
('Djibouti', '253'),
('Dominica', '1767'),
('Ecuador', '593'),
('Egipto', '20'),
('El Salvador', '503'),
('Emiratos Árabes Unidos', '971'),
('Eritrea', '291'),
('Eslovaquia', '421'),
('Eslovenia', '386'),
('España', '34'),
('Estados Federados de Micronesia', '691'),
('Estados Unidos', '1'),
('Estonia', '372'),
('Esvalbard y Jan Mayen', '79'),
('Etiopía', '251'),
('Fiji', '679'),
('Filipinas', '63'),
('Finlandia', '358'),
('Francia', '33'),
('Gabón', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Ghana', '233'),
('Gibraltar', '350'),
('Granada', '1473'),
('Grecia', '30'),
('Groenlandia', '299'),
('Guadalupe', '590'),
('Guam', '1671'),
('Guatemala', '502'),
('Guernsey', '44'),
('Guinea', '224'),
('Guinea Ecuatorial', '240'),
('Guinea Francesa', '594'),
('Guinea Bissau', '245'),
('Guyana', '592'),
('Haití', '509'),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungría', '36'),
('India', '91'),
('Indonesia', '62'),
('Irak', '964'),
('Iran', '98'),
('Isla Navidad', '61'),
('Isla Navidad', '672'),
('Islandia', '354'),
('Islas Caiman', '1345'),
('Islas Cook', '682'),
('Islas de Norte-Mariana', '1670'),
('Islas Feroe', '298'),
('Islas Malvinas', '500'),
('Islas Marshall', '692'),
('Islas Norfolk', '672'),
('Islas Salomón', '677'),
('Islas Turks y Caicos', '1649'),
('Islas Ultramarinas de Estados Unidos', '808'),
('Islas Vírgenes Britanicas', '1284'),
('Islas Vírgenes Estadounidenses', '1340'),
('Isle of Man', '44'),
('Israel', '972'),
('Italia', '39'),
('Jamaica', '1876'),
('Japón', '81'),
('Jersey', '44'),
('Jordania', '962'),
('Kazajstan', '7'),
('Kenia', '254'),
('Kirgistan', '996'),
('Kiribati', '686'),
('Kuwait', '965'),
('Lesoto', '266'),
('Letonia', '371'),
('Libano', '961'),
('Liberia', '231'),
('Libia', '218'),
('Liechtenstein', '41'),
('Lituania', '370'),
('Luxemburgo', '352'),
('Macao', '853'),
('Macedonia', '389'),
('Madagascar', '261'),
('Malasia', '60'),
('Malawi', '265'),
('Maldivas', '960'),
('Mali', '223'),
('Malta', '356'),
('Marruecos', '212'),
('Martinica', '596'),
('Mauricio', '230'),
('Mauritania', '222'),
('Mayote', '269'),
('México', '52'),
('Mianmar', '95'),
('Moldavia', '373'),
('Mónaco', '377'),
('Mongolia', '976'),
('Montserrat', '1664'),
('Mozambique', '258'),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Nicaragua', '505'),
('Níger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Noruega', '47'),
('Nueva Caledonia', '687'),
('Nueva Zelanda', '64'),
('Oman', '968'),
('Países Bajos', '31'),
('Pakistan', '92'),
('Palau', '680'),
('Palestina', '970'),
('Panama', '507'),
('Papúa Nueva Guinea', '675'),
('Paraguay', '595'),
('Perú', '51'),
('Pitcairn', '872'),
('Polinesia Francesa', '689'),
('Polonia', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reino Unido', '44'),
('República Centroafricana', '236'),
('República de Corea (Corea del Sur)', '82'),
('República de Irlanda', '353'),
('República del Congo', '242'),
('República Democratica del Congo', '243'),
('República Democratica Popular de Corea (Corea del Norte)', '850'),
('República Democratica Popular de Laos', '856'),
('República Dominicana', '1809'),
('República Dominicana', '1829'),
('República Dominicana', '1849'),
('Reunión', '262'),
('Ruanda', '250'),
('Rumanía', '40'),
('Rusia', '7'),
('Sahara Occidental', '212'),
('Samoa, Isla', '685'),
('Samoa Americana, Isla', '684'),
('San Marino', '378'),
('San Pedro y Miquelon', '508'),
('San Vincente y Las Granadinas', '1784'),
('Santa Helena', '290'),
('Santa Kitts y Nevis', '1869'),
('Santa Lucía', '1758'),
('Santo Tomé y Príncipe', '239'),
('Senegal', '221'),
('Serbia y Montenegro', '42'),
('Seychelles', '248'),
('Sierra Leona', '232'),
('Singapur', '65'),
('Siria', '963'),
('Somalia', '252'),
('Sri Lanka', '94'),
('Suazilandia', '268'),
('Sudafrica', '27'),
('Sudan', '249'),
('Suecia', '46'),
('Suiza', '41'),
('Surinam', '597'),
('Tailandia', '66'),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania', '255'),
('Tanzania', '259'),
('Territorio Oceanico de la India Britanica', '246'),
('Timor', '670'),
('Timor Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tongo', '676'),
('Trinidad y Tobago', '1868'),
('Túnez', '216'),
('Turkmenistan', '993'),
('Turquía', '90'),
('Tuvalu', '688'),
('Ucrania', '380'),
('Uganda', '256'),
('Unión Soviética', '7'),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Vaticano', '379'),
('Venezuela', '58'),
('Vietnam', '84'),
('Wallis y Futuna', '681'),
('Yemen', '967'),
('Yugoslavia', '381'),
('Zaire', '243'),
('Zambia', '260'),
('Zimbawe', '263'),
('Afganistán', '93'),
('Albania', '355'),
('Alemania', '49'),
('Andorra', '376'),
('Angola', '244'),
('Anguila', '1264'),
('Antartida', '672'),
('Antigua y Barbuda', '1268'),
('Antillas Holandesas', '599'),
('Arabia Saudí', '966'),
('Argelia', '213'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Ascension Island', '247'),
('Australia', '61'),
('Austria', '43'),
('Azerbaiyan', '994'),
('Bahamas', '1242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1246'),
('Belarus', '375'),
('Bélgica', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia y Herzegovina', '387'),
('Botswana', '267'),
('Brasil', '55'),
('Brunei Darussalam', '673'),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cabo Verde', '238'),
('Camboya', '855'),
('Camerún', '237'),
('Canada', '1'),
('Chad', '235'),
('Chequia', '420'),
('Chile', '56'),
('China', '86'),
('Chipre', '357'),
('Colombia', '57'),
('Comores Islas', '269'),
('Costa de Marfil', '225'),
('Costa Rica', '506'),
('Croacia', '385'),
('Cuba', '53'),
('Dinamarca', '45'),
('Djibouti', '253'),
('Dominica', '1767'),
('Ecuador', '593'),
('Egipto', '20'),
('El Salvador', '503'),
('Emiratos Árabes Unidos', '971'),
('Eritrea', '291'),
('Eslovaquia', '421'),
('Eslovenia', '386'),
('España', '34'),
('Estados Federados de Micronesia', '691'),
('Estados Unidos', '1'),
('Estonia', '372'),
('Esvalbard y Jan Mayen', '79'),
('Etiopía', '251'),
('Fiji', '679'),
('Filipinas', '63'),
('Finlandia', '358'),
('Francia', '33'),
('Gabón', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Ghana', '233'),
('Gibraltar', '350'),
('Granada', '1473'),
('Grecia', '30'),
('Groenlandia', '299'),
('Guadalupe', '590'),
('Guam', '1671'),
('Guatemala', '502'),
('Guernsey', '44'),
('Guinea', '224'),
('Guinea Ecuatorial', '240'),
('Guinea Francesa', '594'),
('Guinea Bissau', '245'),
('Guyana', '592'),
('Haití', '509'),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungría', '36'),
('India', '91'),
('Indonesia', '62'),
('Irak', '964'),
('Iran', '98'),
('Isla Navidad', '61'),
('Isla Navidad', '672'),
('Islandia', '354'),
('Islas Caiman', '1345'),
('Islas Cook', '682'),
('Islas de Norte-Mariana', '1670'),
('Islas Feroe', '298'),
('Islas Malvinas', '500'),
('Islas Marshall', '692'),
('Islas Norfolk', '672'),
('Islas Salomón', '677'),
('Islas Turks y Caicos', '1649'),
('Islas Ultramarinas de Estados Unidos', '808'),
('Islas Vírgenes Britanicas', '1284'),
('Islas Vírgenes Estadounidenses', '1340'),
('Isle of Man', '44'),
('Israel', '972'),
('Italia', '39'),
('Jamaica', '1876'),
('Japón', '81'),
('Jersey', '44'),
('Jordania', '962'),
('Kazajstan', '7'),
('Kenia', '254'),
('Kirgistan', '996'),
('Kiribati', '686'),
('Kuwait', '965'),
('Lesoto', '266'),
('Letonia', '371'),
('Libano', '961'),
('Liberia', '231'),
('Libia', '218'),
('Liechtenstein', '41'),
('Lituania', '370'),
('Luxemburgo', '352'),
('Macao', '853'),
('Macedonia', '389'),
('Madagascar', '261'),
('Malasia', '60'),
('Malawi', '265'),
('Maldivas', '960'),
('Mali', '223'),
('Malta', '356'),
('Marruecos', '212'),
('Martinica', '596'),
('Mauricio', '230'),
('Mauritania', '222'),
('Mayote', '269'),
('México', '52'),
('Mianmar', '95'),
('Moldavia', '373'),
('Mónaco', '377'),
('Mongolia', '976'),
('Montserrat', '1664'),
('Mozambique', '258'),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Nicaragua', '505'),
('Níger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Noruega', '47'),
('Nueva Caledonia', '687'),
('Nueva Zelanda', '64'),
('Oman', '968'),
('Países Bajos', '31'),
('Pakistan', '92'),
('Palau', '680'),
('Palestina', '970'),
('Panama', '507'),
('Papúa Nueva Guinea', '675'),
('Paraguay', '595'),
('Perú', '51'),
('Pitcairn', '872'),
('Polinesia Francesa', '689'),
('Polonia', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reino Unido', '44'),
('República Centroafricana', '236'),
('República de Corea (Corea del Sur)', '82'),
('República de Irlanda', '353'),
('República del Congo', '242'),
('República Democratica del Congo', '243'),
('República Democratica Popular de Corea (Corea del Norte)', '850'),
('República Democratica Popular de Laos', '856'),
('República Dominicana', '1809'),
('República Dominicana', '1829'),
('República Dominicana', '1849'),
('Reunión', '262'),
('Ruanda', '250'),
('Rumanía', '40'),
('Rusia', '7'),
('Sahara Occidental', '212'),
('Samoa, Isla', '685'),
('Samoa Americana, Isla', '684'),
('San Marino', '378'),
('San Pedro y Miquelon', '508'),
('San Vincente y Las Granadinas', '1784'),
('Santa Helena', '290'),
('Santa Kitts y Nevis', '1869'),
('Santa Lucía', '1758'),
('Santo Tomé y Príncipe', '239'),
('Senegal', '221'),
('Serbia y Montenegro', '42'),
('Seychelles', '248'),
('Sierra Leona', '232'),
('Singapur', '65'),
('Siria', '963'),
('Somalia', '252'),
('Sri Lanka', '94'),
('Suazilandia', '268'),
('Sudafrica', '27'),
('Sudan', '249'),
('Suecia', '46'),
('Suiza', '41'),
('Surinam', '597'),
('Tailandia', '66'),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania', '255'),
('Tanzania', '259'),
('Territorio Oceanico de la India Britanica', '246'),
('Timor', '670'),
('Timor Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tongo', '676'),
('Trinidad y Tobago', '1868'),
('Túnez', '216'),
('Turkmenistan', '993'),
('Turquía', '90'),
('Tuvalu', '688'),
('Ucrania', '380'),
('Uganda', '256'),
('Unión Soviética', '7'),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Vaticano', '379'),
('Venezuela', '58'),
('Vietnam', '84'),
('Wallis y Futuna', '681'),
('Yemen', '967'),
('Yugoslavia', '381'),
('Zaire', '243'),
('Zambia', '260'),
('Zimbawe', '263'),
('Afganistán', '93'),
('Albania', '355'),
('Alemania', '49'),
('Andorra', '376'),
('Angola', '244'),
('Anguila', '1264'),
('Antartida', '672'),
('Antigua y Barbuda', '1268'),
('Antillas Holandesas', '599'),
('Arabia Saudí', '966'),
('Argelia', '213'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Ascension Island', '247'),
('Australia', '61'),
('Austria', '43'),
('Azerbaiyan', '994'),
('Bahamas', '1242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1246'),
('Belarus', '375'),
('Bélgica', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia y Herzegovina', '387'),
('Botswana', '267'),
('Brasil', '55'),
('Brunei Darussalam', '673'),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cabo Verde', '238'),
('Camboya', '855'),
('Camerún', '237'),
('Canada', '1'),
('Chad', '235'),
('Chequia', '420'),
('Chile', '56'),
('China', '86'),
('Chipre', '357'),
('Colombia', '57'),
('Comores Islas', '269'),
('Costa de Marfil', '225'),
('Costa Rica', '506'),
('Croacia', '385'),
('Cuba', '53'),
('Dinamarca', '45'),
('Djibouti', '253'),
('Dominica', '1767'),
('Ecuador', '593'),
('Egipto', '20'),
('El Salvador', '503'),
('Emiratos Árabes Unidos', '971'),
('Eritrea', '291'),
('Eslovaquia', '421'),
('Eslovenia', '386'),
('España', '34'),
('Estados Federados de Micronesia', '691'),
('Estados Unidos', '1'),
('Estonia', '372'),
('Esvalbard y Jan Mayen', '79'),
('Etiopía', '251'),
('Fiji', '679'),
('Filipinas', '63'),
('Finlandia', '358'),
('Francia', '33'),
('Gabón', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Ghana', '233'),
('Gibraltar', '350'),
('Granada', '1473'),
('Grecia', '30'),
('Groenlandia', '299'),
('Guadalupe', '590'),
('Guam', '1671'),
('Guatemala', '502'),
('Guernsey', '44'),
('Guinea', '224'),
('Guinea Ecuatorial', '240'),
('Guinea Francesa', '594'),
('Guinea Bissau', '245'),
('Guyana', '592'),
('Haití', '509'),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungría', '36'),
('India', '91'),
('Indonesia', '62'),
('Irak', '964'),
('Iran', '98'),
('Isla Navidad', '61'),
('Isla Navidad', '672'),
('Islandia', '354'),
('Islas Caiman', '1345'),
('Islas Cook', '682'),
('Islas de Norte-Mariana', '1670'),
('Islas Feroe', '298'),
('Islas Malvinas', '500'),
('Islas Marshall', '692'),
('Islas Norfolk', '672'),
('Islas Salomón', '677'),
('Islas Turks y Caicos', '1649'),
('Islas Ultramarinas de Estados Unidos', '808'),
('Islas Vírgenes Britanicas', '1284'),
('Islas Vírgenes Estadounidenses', '1340'),
('Isle of Man', '44'),
('Israel', '972'),
('Italia', '39'),
('Jamaica', '1876'),
('Japón', '81'),
('Jersey', '44'),
('Jordania', '962'),
('Kazajstan', '7'),
('Kenia', '254'),
('Kirgistan', '996'),
('Kiribati', '686'),
('Kuwait', '965'),
('Lesoto', '266'),
('Letonia', '371'),
('Libano', '961'),
('Liberia', '231'),
('Libia', '218'),
('Liechtenstein', '41'),
('Lituania', '370'),
('Luxemburgo', '352'),
('Macao', '853'),
('Macedonia', '389'),
('Madagascar', '261'),
('Malasia', '60'),
('Malawi', '265'),
('Maldivas', '960'),
('Mali', '223'),
('Malta', '356'),
('Marruecos', '212'),
('Martinica', '596'),
('Mauricio', '230'),
('Mauritania', '222'),
('Mayote', '269'),
('México', '52'),
('Mianmar', '95'),
('Moldavia', '373'),
('Mónaco', '377'),
('Mongolia', '976'),
('Montserrat', '1664'),
('Mozambique', '258'),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Nicaragua', '505'),
('Níger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Noruega', '47'),
('Nueva Caledonia', '687'),
('Nueva Zelanda', '64'),
('Oman', '968'),
('Países Bajos', '31'),
('Pakistan', '92'),
('Palau', '680'),
('Palestina', '970'),
('Panama', '507'),
('Papúa Nueva Guinea', '675'),
('Paraguay', '595'),
('Perú', '51'),
('Pitcairn', '872'),
('Polinesia Francesa', '689'),
('Polonia', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reino Unido', '44'),
('República Centroafricana', '236'),
('República de Corea (Corea del Sur)', '82'),
('República de Irlanda', '353'),
('República del Congo', '242'),
('República Democratica del Congo', '243'),
('República Democratica Popular de Corea (Corea del Norte)', '850'),
('República Democratica Popular de Laos', '856'),
('República Dominicana', '1809'),
('República Dominicana', '1829'),
('República Dominicana', '1849'),
('Reunión', '262'),
('Ruanda', '250'),
('Rumanía', '40'),
('Rusia', '7'),
('Sahara Occidental', '212'),
('Samoa, Isla', '685'),
('Samoa Americana, Isla', '684'),
('San Marino', '378'),
('San Pedro y Miquelon', '508'),
('San Vincente y Las Granadinas', '1784'),
('Santa Helena', '290'),
('Santa Kitts y Nevis', '1869'),
('Santa Lucía', '1758'),
('Santo Tomé y Príncipe', '239'),
('Senegal', '221'),
('Serbia y Montenegro', '42'),
('Seychelles', '248'),
('Sierra Leona', '232'),
('Singapur', '65'),
('Siria', '963'),
('Somalia', '252'),
('Sri Lanka', '94'),
('Suazilandia', '268'),
('Sudafrica', '27'),
('Sudan', '249'),
('Suecia', '46'),
('Suiza', '41'),
('Surinam', '597'),
('Tailandia', '66'),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania', '255'),
('Tanzania', '259'),
('Territorio Oceanico de la India Britanica', '246'),
('Timor', '670'),
('Timor Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tongo', '676'),
('Trinidad y Tobago', '1868'),
('Túnez', '216'),
('Turkmenistan', '993'),
('Turquía', '90'),
('Tuvalu', '688'),
('Ucrania', '380'),
('Uganda', '256'),
('Unión Soviética', '7'),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Vaticano', '379'),
('Venezuela', '58'),
('Vietnam', '84'),
('Wallis y Futuna', '681'),
('Yemen', '967'),
('Yugoslavia', '381'),
('Zaire', '243'),
('Zambia', '260'),
('Zimbawe', '263'),
('Afganistán', '93'),
('Albania', '355'),
('Alemania', '49'),
('Andorra', '376'),
('Angola', '244'),
('Anguila', '1264'),
('Antartida', '672'),
('Antigua y Barbuda', '1268'),
('Antillas Holandesas', '599'),
('Arabia Saudí', '966'),
('Argelia', '213'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Ascension Island', '247'),
('Australia', '61'),
('Austria', '43'),
('Azerbaiyan', '994'),
('Bahamas', '1242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1246'),
('Belarus', '375'),
('Bélgica', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia y Herzegovina', '387'),
('Botswana', '267'),
('Brasil', '55'),
('Brunei Darussalam', '673'),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cabo Verde', '238'),
('Camboya', '855'),
('Camerún', '237'),
('Canada', '1'),
('Chad', '235'),
('Chequia', '420'),
('Chile', '56'),
('China', '86'),
('Chipre', '357'),
('Colombia', '57'),
('Comores Islas', '269'),
('Costa de Marfil', '225'),
('Costa Rica', '506'),
('Croacia', '385'),
('Cuba', '53'),
('Dinamarca', '45'),
('Djibouti', '253'),
('Dominica', '1767'),
('Ecuador', '593'),
('Egipto', '20'),
('El Salvador', '503'),
('Emiratos Árabes Unidos', '971'),
('Eritrea', '291'),
('Eslovaquia', '421'),
('Eslovenia', '386'),
('España', '34'),
('Estados Federados de Micronesia', '691'),
('Estados Unidos', '1'),
('Estonia', '372'),
('Esvalbard y Jan Mayen', '79'),
('Etiopía', '251'),
('Fiji', '679'),
('Filipinas', '63'),
('Finlandia', '358'),
('Francia', '33'),
('Gabón', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Ghana', '233'),
('Gibraltar', '350'),
('Granada', '1473'),
('Grecia', '30'),
('Groenlandia', '299'),
('Guadalupe', '590'),
('Guam', '1671'),
('Guatemala', '502'),
('Guernsey', '44'),
('Guinea', '224'),
('Guinea Ecuatorial', '240'),
('Guinea Francesa', '594'),
('Guinea Bissau', '245'),
('Guyana', '592'),
('Haití', '509'),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungría', '36'),
('India', '91'),
('Indonesia', '62'),
('Irak', '964'),
('Iran', '98'),
('Isla Navidad', '61'),
('Isla Navidad', '672'),
('Islandia', '354'),
('Islas Caiman', '1345'),
('Islas Cook', '682'),
('Islas de Norte-Mariana', '1670'),
('Islas Feroe', '298'),
('Islas Malvinas', '500'),
('Islas Marshall', '692'),
('Islas Norfolk', '672'),
('Islas Salomón', '677'),
('Islas Turks y Caicos', '1649'),
('Islas Ultramarinas de Estados Unidos', '808'),
('Islas Vírgenes Britanicas', '1284'),
('Islas Vírgenes Estadounidenses', '1340'),
('Isle of Man', '44'),
('Israel', '972'),
('Italia', '39'),
('Jamaica', '1876'),
('Japón', '81'),
('Jersey', '44'),
('Jordania', '962'),
('Kazajstan', '7'),
('Kenia', '254'),
('Kirgistan', '996'),
('Kiribati', '686'),
('Kuwait', '965'),
('Lesoto', '266'),
('Letonia', '371'),
('Libano', '961'),
('Liberia', '231'),
('Libia', '218'),
('Liechtenstein', '41'),
('Lituania', '370'),
('Luxemburgo', '352'),
('Macao', '853'),
('Macedonia', '389'),
('Madagascar', '261'),
('Malasia', '60'),
('Malawi', '265'),
('Maldivas', '960'),
('Mali', '223'),
('Malta', '356'),
('Marruecos', '212'),
('Martinica', '596'),
('Mauricio', '230'),
('Mauritania', '222'),
('Mayote', '269'),
('México', '52'),
('Mianmar', '95'),
('Moldavia', '373'),
('Mónaco', '377'),
('Mongolia', '976'),
('Montserrat', '1664'),
('Mozambique', '258'),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Nicaragua', '505'),
('Níger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Noruega', '47'),
('Nueva Caledonia', '687'),
('Nueva Zelanda', '64'),
('Oman', '968'),
('Países Bajos', '31'),
('Pakistan', '92'),
('Palau', '680'),
('Palestina', '970'),
('Panama', '507'),
('Papúa Nueva Guinea', '675'),
('Paraguay', '595'),
('Perú', '51'),
('Pitcairn', '872'),
('Polinesia Francesa', '689'),
('Polonia', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reino Unido', '44'),
('República Centroafricana', '236'),
('República de Corea (Corea del Sur)', '82'),
('República de Irlanda', '353'),
('República del Congo', '242'),
('República Democratica del Congo', '243'),
('República Democratica Popular de Corea (Corea del Norte)', '850'),
('República Democratica Popular de Laos', '856'),
('República Dominicana', '1809'),
('República Dominicana', '1829'),
('República Dominicana', '1849'),
('Reunión', '262'),
('Ruanda', '250'),
('Rumanía', '40'),
('Rusia', '7'),
('Sahara Occidental', '212'),
('Samoa, Isla', '685'),
('Samoa Americana, Isla', '684'),
('San Marino', '378'),
('San Pedro y Miquelon', '508'),
('San Vincente y Las Granadinas', '1784'),
('Santa Helena', '290'),
('Santa Kitts y Nevis', '1869'),
('Santa Lucía', '1758'),
('Santo Tomé y Príncipe', '239'),
('Senegal', '221'),
('Serbia y Montenegro', '42'),
('Seychelles', '248'),
('Sierra Leona', '232'),
('Singapur', '65'),
('Siria', '963'),
('Somalia', '252'),
('Sri Lanka', '94'),
('Suazilandia', '268'),
('Sudafrica', '27'),
('Sudan', '249'),
('Suecia', '46'),
('Suiza', '41'),
('Surinam', '597'),
('Tailandia', '66'),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania', '255'),
('Tanzania', '259'),
('Territorio Oceanico de la India Britanica', '246'),
('Timor', '670'),
('Timor Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tongo', '676'),
('Trinidad y Tobago', '1868'),
('Túnez', '216'),
('Turkmenistan', '993'),
('Turquía', '90'),
('Tuvalu', '688'),
('Ucrania', '380'),
('Uganda', '256'),
('Unión Soviética', '7'),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Vaticano', '379'),
('Venezuela', '58'),
('Vietnam', '84'),
('Wallis y Futuna', '681'),
('Yemen', '967'),
('Yugoslavia', '381'),
('Zaire', '243'),
('Zambia', '260'),
('Zimbawe', '263'),
('Afganistán', '93'),
('Albania', '355'),
('Alemania', '49'),
('Andorra', '376'),
('Angola', '244'),
('Anguila', '1264'),
('Antartida', '672'),
('Antigua y Barbuda', '1268'),
('Antillas Holandesas', '599'),
('Arabia Saudí', '966'),
('Argelia', '213'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Ascension Island', '247'),
('Australia', '61'),
('Austria', '43'),
('Azerbaiyan', '994'),
('Bahamas', '1242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1246'),
('Belarus', '375'),
('Bélgica', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia y Herzegovina', '387'),
('Botswana', '267'),
('Brasil', '55'),
('Brunei Darussalam', '673'),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cabo Verde', '238'),
('Camboya', '855'),
('Camerún', '237'),
('Canada', '1'),
('Chad', '235'),
('Chequia', '420'),
('Chile', '56'),
('China', '86'),
('Chipre', '357'),
('Colombia', '57'),
('Comores Islas', '269'),
('Costa de Marfil', '225'),
('Costa Rica', '506'),
('Croacia', '385'),
('Cuba', '53'),
('Dinamarca', '45'),
('Djibouti', '253'),
('Dominica', '1767'),
('Ecuador', '593'),
('Egipto', '20'),
('El Salvador', '503'),
('Emiratos Árabes Unidos', '971'),
('Eritrea', '291'),
('Eslovaquia', '421'),
('Eslovenia', '386'),
('España', '34'),
('Estados Federados de Micronesia', '691'),
('Estados Unidos', '1'),
('Estonia', '372'),
('Esvalbard y Jan Mayen', '79'),
('Etiopía', '251'),
('Fiji', '679'),
('Filipinas', '63'),
('Finlandia', '358'),
('Francia', '33'),
('Gabón', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Ghana', '233'),
('Gibraltar', '350'),
('Granada', '1473'),
('Grecia', '30'),
('Groenlandia', '299'),
('Guadalupe', '590'),
('Guam', '1671'),
('Guatemala', '502'),
('Guernsey', '44'),
('Guinea', '224'),
('Guinea Ecuatorial', '240'),
('Guinea Francesa', '594'),
('Guinea Bissau', '245'),
('Guyana', '592'),
('Haití', '509'),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungría', '36'),
('India', '91'),
('Indonesia', '62'),
('Irak', '964'),
('Iran', '98'),
('Isla Navidad', '61'),
('Isla Navidad', '672'),
('Islandia', '354'),
('Islas Caiman', '1345'),
('Islas Cook', '682'),
('Islas de Norte-Mariana', '1670'),
('Islas Feroe', '298'),
('Islas Malvinas', '500'),
('Islas Marshall', '692'),
('Islas Norfolk', '672'),
('Islas Salomón', '677'),
('Islas Turks y Caicos', '1649'),
('Islas Ultramarinas de Estados Unidos', '808'),
('Islas Vírgenes Britanicas', '1284'),
('Islas Vírgenes Estadounidenses', '1340'),
('Isle of Man', '44'),
('Israel', '972'),
('Italia', '39'),
('Jamaica', '1876'),
('Japón', '81'),
('Jersey', '44'),
('Jordania', '962'),
('Kazajstan', '7'),
('Kenia', '254'),
('Kirgistan', '996'),
('Kiribati', '686'),
('Kuwait', '965'),
('Lesoto', '266'),
('Letonia', '371'),
('Libano', '961'),
('Liberia', '231'),
('Libia', '218'),
('Liechtenstein', '41'),
('Lituania', '370'),
('Luxemburgo', '352'),
('Macao', '853'),
('Macedonia', '389'),
('Madagascar', '261'),
('Malasia', '60'),
('Malawi', '265'),
('Maldivas', '960'),
('Mali', '223'),
('Malta', '356'),
('Marruecos', '212'),
('Martinica', '596'),
('Mauricio', '230'),
('Mauritania', '222'),
('Mayote', '269'),
('México', '52'),
('Mianmar', '95'),
('Moldavia', '373'),
('Mónaco', '377'),
('Mongolia', '976'),
('Montserrat', '1664'),
('Mozambique', '258'),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Nicaragua', '505'),
('Níger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Noruega', '47'),
('Nueva Caledonia', '687'),
('Nueva Zelanda', '64'),
('Oman', '968'),
('Países Bajos', '31'),
('Pakistan', '92'),
('Palau', '680'),
('Palestina', '970'),
('Panama', '507'),
('Papúa Nueva Guinea', '675'),
('Paraguay', '595'),
('Perú', '51'),
('Pitcairn', '872'),
('Polinesia Francesa', '689'),
('Polonia', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reino Unido', '44'),
('República Centroafricana', '236'),
('República de Corea (Corea del Sur)', '82'),
('República de Irlanda', '353'),
('República del Congo', '242'),
('República Democratica del Congo', '243'),
('República Democratica Popular de Corea (Corea del Norte)', '850'),
('República Democratica Popular de Laos', '856'),
('República Dominicana', '1809'),
('República Dominicana', '1829'),
('República Dominicana', '1849'),
('Reunión', '262'),
('Ruanda', '250'),
('Rumanía', '40'),
('Rusia', '7'),
('Sahara Occidental', '212'),
('Samoa, Isla', '685'),
('Samoa Americana, Isla', '684'),
('San Marino', '378'),
('San Pedro y Miquelon', '508'),
('San Vincente y Las Granadinas', '1784'),
('Santa Helena', '290'),
('Santa Kitts y Nevis', '1869'),
('Santa Lucía', '1758'),
('Santo Tomé y Príncipe', '239'),
('Senegal', '221'),
('Serbia y Montenegro', '42'),
('Seychelles', '248'),
('Sierra Leona', '232'),
('Singapur', '65'),
('Siria', '963'),
('Somalia', '252'),
('Sri Lanka', '94'),
('Suazilandia', '268'),
('Sudafrica', '27'),
('Sudan', '249'),
('Suecia', '46'),
('Suiza', '41'),
('Surinam', '597'),
('Tailandia', '66'),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania', '255'),
('Tanzania', '259'),
('Territorio Oceanico de la India Britanica', '246'),
('Timor', '670'),
('Timor Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tongo', '676'),
('Trinidad y Tobago', '1868'),
('Túnez', '216'),
('Turkmenistan', '993'),
('Turquía', '90'),
('Tuvalu', '688'),
('Ucrania', '380'),
('Uganda', '256'),
('Unión Soviética', '7'),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Vaticano', '379'),
('Venezuela', '58'),
('Vietnam', '84'),
('Wallis y Futuna', '681'),
('Yemen', '967'),
('Yugoslavia', '381'),
('Zaire', '243'),
('Zambia', '260'),
('Zimbawe', '263'),
('Afganistán', '93'),
('Albania', '355'),
('Alemania', '49'),
('Andorra', '376'),
('Angola', '244'),
('Anguila', '1264'),
('Antartida', '672'),
('Antigua y Barbuda', '1268'),
('Antillas Holandesas', '599'),
('Arabia Saudí', '966'),
('Argelia', '213'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Ascension Island', '247'),
('Australia', '61'),
('Austria', '43'),
('Azerbaiyan', '994'),
('Bahamas', '1242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1246'),
('Belarus', '375'),
('Bélgica', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia y Herzegovina', '387'),
('Botswana', '267'),
('Brasil', '55'),
('Brunei Darussalam', '673'),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cabo Verde', '238'),
('Camboya', '855'),
('Camerún', '237'),
('Canada', '1'),
('Chad', '235'),
('Chequia', '420'),
('Chile', '56'),
('China', '86'),
('Chipre', '357'),
('Colombia', '57'),
('Comores Islas', '269'),
('Costa de Marfil', '225'),
('Costa Rica', '506'),
('Croacia', '385'),
('Cuba', '53'),
('Dinamarca', '45'),
('Djibouti', '253'),
('Dominica', '1767'),
('Ecuador', '593'),
('Egipto', '20'),
('El Salvador', '503'),
('Emiratos Árabes Unidos', '971'),
('Eritrea', '291'),
('Eslovaquia', '421'),
('Eslovenia', '386'),
('España', '34'),
('Estados Federados de Micronesia', '691'),
('Estados Unidos', '1'),
('Estonia', '372'),
('Esvalbard y Jan Mayen', '79'),
('Etiopía', '251'),
('Fiji', '679'),
('Filipinas', '63'),
('Finlandia', '358'),
('Francia', '33'),
('Gabón', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Ghana', '233'),
('Gibraltar', '350'),
('Granada', '1473'),
('Grecia', '30'),
('Groenlandia', '299'),
('Guadalupe', '590'),
('Guam', '1671'),
('Guatemala', '502'),
('Guernsey', '44'),
('Guinea', '224'),
('Guinea Ecuatorial', '240'),
('Guinea Francesa', '594'),
('Guinea Bissau', '245'),
('Guyana', '592'),
('Haití', '509'),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungría', '36'),
('India', '91'),
('Indonesia', '62'),
('Irak', '964'),
('Iran', '98'),
('Isla Navidad', '61'),
('Isla Navidad', '672'),
('Islandia', '354'),
('Islas Caiman', '1345'),
('Islas Cook', '682'),
('Islas de Norte-Mariana', '1670'),
('Islas Feroe', '298'),
('Islas Malvinas', '500'),
('Islas Marshall', '692'),
('Islas Norfolk', '672'),
('Islas Salomón', '677'),
('Islas Turks y Caicos', '1649'),
('Islas Ultramarinas de Estados Unidos', '808'),
('Islas Vírgenes Britanicas', '1284'),
('Islas Vírgenes Estadounidenses', '1340'),
('Isle of Man', '44'),
('Israel', '972'),
('Italia', '39'),
('Jamaica', '1876'),
('Japón', '81'),
('Jersey', '44'),
('Jordania', '962'),
('Kazajstan', '7'),
('Kenia', '254'),
('Kirgistan', '996'),
('Kiribati', '686'),
('Kuwait', '965'),
('Lesoto', '266'),
('Letonia', '371'),
('Libano', '961'),
('Liberia', '231'),
('Libia', '218'),
('Liechtenstein', '41'),
('Lituania', '370'),
('Luxemburgo', '352'),
('Macao', '853'),
('Macedonia', '389'),
('Madagascar', '261'),
('Malasia', '60'),
('Malawi', '265'),
('Maldivas', '960'),
('Mali', '223'),
('Malta', '356'),
('Marruecos', '212'),
('Martinica', '596'),
('Mauricio', '230'),
('Mauritania', '222'),
('Mayote', '269'),
('México', '52'),
('Mianmar', '95'),
('Moldavia', '373'),
('Mónaco', '377'),
('Mongolia', '976'),
('Montserrat', '1664'),
('Mozambique', '258'),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Nicaragua', '505'),
('Níger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Noruega', '47'),
('Nueva Caledonia', '687'),
('Nueva Zelanda', '64'),
('Oman', '968'),
('Países Bajos', '31'),
('Pakistan', '92'),
('Palau', '680'),
('Palestina', '970'),
('Panama', '507'),
('Papúa Nueva Guinea', '675'),
('Paraguay', '595'),
('Perú', '51'),
('Pitcairn', '872'),
('Polinesia Francesa', '689'),
('Polonia', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reino Unido', '44'),
('República Centroafricana', '236'),
('República de Corea (Corea del Sur)', '82'),
('República de Irlanda', '353'),
('República del Congo', '242'),
('República Democratica del Congo', '243'),
('República Democratica Popular de Corea (Corea del Norte)', '850'),
('República Democratica Popular de Laos', '856'),
('República Dominicana', '1809'),
('República Dominicana', '1829'),
('República Dominicana', '1849'),
('Reunión', '262'),
('Ruanda', '250'),
('Rumanía', '40'),
('Rusia', '7'),
('Sahara Occidental', '212'),
('Samoa, Isla', '685'),
('Samoa Americana, Isla', '684'),
('San Marino', '378'),
('San Pedro y Miquelon', '508'),
('San Vincente y Las Granadinas', '1784'),
('Santa Helena', '290'),
('Santa Kitts y Nevis', '1869'),
('Santa Lucía', '1758'),
('Santo Tomé y Príncipe', '239'),
('Senegal', '221'),
('Serbia y Montenegro', '42'),
('Seychelles', '248'),
('Sierra Leona', '232'),
('Singapur', '65'),
('Siria', '963'),
('Somalia', '252'),
('Sri Lanka', '94'),
('Suazilandia', '268'),
('Sudafrica', '27'),
('Sudan', '249'),
('Suecia', '46'),
('Suiza', '41'),
('Surinam', '597'),
('Tailandia', '66'),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania', '255'),
('Tanzania', '259'),
('Territorio Oceanico de la India Britanica', '246'),
('Timor', '670'),
('Timor Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tongo', '676'),
('Trinidad y Tobago', '1868'),
('Túnez', '216'),
('Turkmenistan', '993'),
('Turquía', '90'),
('Tuvalu', '688'),
('Ucrania', '380'),
('Uganda', '256'),
('Unión Soviética', '7'),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Vaticano', '379'),
('Venezuela', '58'),
('Vietnam', '84'),
('Wallis y Futuna', '681'),
('Yemen', '967'),
('Yugoslavia', '381'),
('Zaire', '243'),
('Zambia', '260'),
('Zimbawe', '263'),
('Afganistán', '93'),
('Albania', '355'),
('Alemania', '49'),
('Andorra', '376'),
('Angola', '244'),
('Anguila', '1264'),
('Antartida', '672'),
('Antigua y Barbuda', '1268'),
('Antillas Holandesas', '599'),
('Arabia Saudí', '966'),
('Argelia', '213'),
('Argentina', '54'),
('Armenia', '374'),
('Aruba', '297'),
('Ascension Island', '247'),
('Australia', '61'),
('Austria', '43'),
('Azerbaiyan', '994'),
('Bahamas', '1242'),
('Bahrain', '973'),
('Bangladesh', '880'),
('Barbados', '1246'),
('Belarus', '375'),
('Bélgica', '32'),
('Belize', '501'),
('Benin', '229'),
('Bermuda', '1441'),
('Bhutan', '975'),
('Bolivia', '591'),
('Bosnia y Herzegovina', '387'),
('Botswana', '267'),
('Brasil', '55'),
('Brunei Darussalam', '673'),
('Bulgaria', '359'),
('Burkina Faso', '226'),
('Burundi', '257'),
('Cabo Verde', '238'),
('Camboya', '855'),
('Camerún', '237'),
('Canada', '1'),
('Chad', '235'),
('Chequia', '420'),
('Chile', '56'),
('China', '86'),
('Chipre', '357'),
('Colombia', '57'),
('Comores Islas', '269'),
('Costa de Marfil', '225'),
('Costa Rica', '506'),
('Croacia', '385'),
('Cuba', '53'),
('Dinamarca', '45'),
('Djibouti', '253'),
('Dominica', '1767'),
('Ecuador', '593'),
('Egipto', '20'),
('El Salvador', '503'),
('Emiratos Árabes Unidos', '971'),
('Eritrea', '291'),
('Eslovaquia', '421'),
('Eslovenia', '386'),
('España', '34'),
('Estados Federados de Micronesia', '691'),
('Estados Unidos', '1'),
('Estonia', '372'),
('Esvalbard y Jan Mayen', '79'),
('Etiopía', '251'),
('Fiji', '679'),
('Filipinas', '63'),
('Finlandia', '358'),
('Francia', '33'),
('Gabón', '241'),
('Gambia', '220'),
('Georgia', '995'),
('Ghana', '233'),
('Gibraltar', '350'),
('Granada', '1473'),
('Grecia', '30'),
('Groenlandia', '299'),
('Guadalupe', '590'),
('Guam', '1671'),
('Guatemala', '502'),
('Guernsey', '44'),
('Guinea', '224'),
('Guinea Ecuatorial', '240'),
('Guinea Francesa', '594'),
('Guinea Bissau', '245'),
('Guyana', '592'),
('Haití', '509'),
('Honduras', '504'),
('Hong Kong', '852'),
('Hungría', '36'),
('India', '91'),
('Indonesia', '62'),
('Irak', '964'),
('Iran', '98'),
('Isla Navidad', '61'),
('Isla Navidad', '672'),
('Islandia', '354'),
('Islas Caiman', '1345'),
('Islas Cook', '682'),
('Islas de Norte-Mariana', '1670'),
('Islas Feroe', '298'),
('Islas Malvinas', '500'),
('Islas Marshall', '692'),
('Islas Norfolk', '672'),
('Islas Salomón', '677'),
('Islas Turks y Caicos', '1649'),
('Islas Ultramarinas de Estados Unidos', '808'),
('Islas Vírgenes Britanicas', '1284'),
('Islas Vírgenes Estadounidenses', '1340'),
('Isle of Man', '44'),
('Israel', '972'),
('Italia', '39'),
('Jamaica', '1876'),
('Japón', '81'),
('Jersey', '44'),
('Jordania', '962'),
('Kazajstan', '7'),
('Kenia', '254'),
('Kirgistan', '996'),
('Kiribati', '686'),
('Kuwait', '965'),
('Lesoto', '266'),
('Letonia', '371'),
('Libano', '961'),
('Liberia', '231'),
('Libia', '218'),
('Liechtenstein', '41'),
('Lituania', '370'),
('Luxemburgo', '352'),
('Macao', '853'),
('Macedonia', '389'),
('Madagascar', '261'),
('Malasia', '60'),
('Malawi', '265'),
('Maldivas', '960'),
('Mali', '223'),
('Malta', '356'),
('Marruecos', '212'),
('Martinica', '596'),
('Mauricio', '230'),
('Mauritania', '222'),
('Mayote', '269'),
('México', '52'),
('Mianmar', '95'),
('Moldavia', '373'),
('Mónaco', '377'),
('Mongolia', '976'),
('Montserrat', '1664'),
('Mozambique', '258'),
('Namibia', '264'),
('Nauru', '674'),
('Nepal', '977'),
('Nicaragua', '505'),
('Níger', '227'),
('Nigeria', '234'),
('Niue', '683'),
('Noruega', '47'),
('Nueva Caledonia', '687'),
('Nueva Zelanda', '64'),
('Oman', '968'),
('Países Bajos', '31'),
('Pakistan', '92'),
('Palau', '680'),
('Palestina', '970'),
('Panama', '507'),
('Papúa Nueva Guinea', '675'),
('Paraguay', '595'),
('Perú', '51'),
('Pitcairn', '872'),
('Polinesia Francesa', '689'),
('Polonia', '48'),
('Portugal', '351'),
('Puerto Rico', '1'),
('Qatar', '974'),
('Reino Unido', '44'),
('República Centroafricana', '236'),
('República de Corea (Corea del Sur)', '82'),
('República de Irlanda', '353'),
('República del Congo', '242'),
('República Democratica del Congo', '243'),
('República Democratica Popular de Corea (Corea del Norte)', '850'),
('República Democratica Popular de Laos', '856'),
('República Dominicana', '1809'),
('República Dominicana', '1829'),
('República Dominicana', '1849'),
('Reunión', '262'),
('Ruanda', '250'),
('Rumanía', '40'),
('Rusia', '7'),
('Sahara Occidental', '212'),
('Samoa, Isla', '685'),
('Samoa Americana, Isla', '684'),
('San Marino', '378'),
('San Pedro y Miquelon', '508'),
('San Vincente y Las Granadinas', '1784'),
('Santa Helena', '290'),
('Santa Kitts y Nevis', '1869'),
('Santa Lucía', '1758'),
('Santo Tomé y Príncipe', '239'),
('Senegal', '221'),
('Serbia y Montenegro', '42'),
('Seychelles', '248'),
('Sierra Leona', '232'),
('Singapur', '65'),
('Siria', '963'),
('Somalia', '252'),
('Sri Lanka', '94'),
('Suazilandia', '268'),
('Sudafrica', '27'),
('Sudan', '249'),
('Suecia', '46'),
('Suiza', '41'),
('Surinam', '597'),
('Tailandia', '66'),
('Taiwan', '886'),
('Tajikistan', '992'),
('Tanzania', '255'),
('Tanzania', '259'),
('Territorio Oceanico de la India Britanica', '246'),
('Timor', '670'),
('Timor Leste', '670'),
('Togo', '228'),
('Tokelau', '690'),
('Tongo', '676'),
('Trinidad y Tobago', '1868'),
('Túnez', '216'),
('Turkmenistan', '993'),
('Turquía', '90'),
('Tuvalu', '688'),
('Ucrania', '380'),
('Uganda', '256'),
('Unión Soviética', '7'),
('Uruguay', '598'),
('Uzbekistan', '998'),
('Vanuatu', '678'),
('Vaticano', '379'),
('Venezuela', '58'),
('Vietnam', '84'),
('Wallis y Futuna', '681'),
('Yemen', '967'),
('Yugoslavia', '381'),
('Zaire', '243'),
('Zambia', '260'),
('Zimbawe', '263');

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
(1, NULL, NULL, 'Pantalla Netflix', 2.55, 3.66, 3.5, 0, 0, 903, 2, NULL, NULL, NULL, 'A', '2024-02-02', 2, NULL),
(2, NULL, NULL, 'Pantalla netflix', 0, 3.66, 3.5, 0, 0, 9999, 10, NULL, NULL, NULL, 'I', '2023-12-21', 2, NULL),
(3, NULL, NULL, 'IPTV ProyectoX', 6, 12, 10, 0, 0, 981, 1, NULL, NULL, NULL, 'A', '2024-02-02', 2, NULL),
(4, NULL, NULL, 'MagisTV', 2.5, 8, 4.5, 0, 0, 52, 5, NULL, NULL, NULL, 'A', '2024-02-02', 2, NULL),
(5, NULL, NULL, 'YouTube', 0.9, 4, 2.5, 0, 0, 935, 1, NULL, NULL, NULL, 'A', '2024-02-02', 2, NULL),
(6, NULL, NULL, 'Pantalla STAR+', 0.5, 3.5, 3.33, 0, 0, 993, 10, NULL, NULL, NULL, 'A', '2024-02-03', 2, NULL),
(7, NULL, NULL, 'Pantalla Disney', 0.5, 2.5, 2, 0, 0, 981, 10, NULL, NULL, NULL, 'A', '2024-02-03', 2, NULL),
(8, NULL, NULL, 'Pantalla MAX', 0.5, 2.5, 2, 0, 0, 996, 10, NULL, NULL, NULL, 'A', '2024-03-03', 2, NULL),
(9, NULL, NULL, 'Cuenta Netflix 40k', 10.25, 11, 10.5, 0, 0, 995, 10, NULL, NULL, NULL, 'A', '2024-02-05', 2, NULL),
(10, NULL, NULL, 'Cuenta Netflix 35k', 9, 11, 10.5, 0, 0, 859, 10, NULL, NULL, NULL, 'A', '2024-02-05', 2, NULL),
(11, NULL, NULL, 'Cuenta Netflix 15$ (2 m +2)', 8.25, 9.5, 9, 0, 0, 997, 999, NULL, NULL, NULL, 'A', '2024-02-08', 2, NULL),
(12, NULL, NULL, 'Cuenta netflix 16$ (2 m +6)', 17.5, 10, 9.5, 0, 0, 966, 10, NULL, NULL, NULL, 'A', '2024-02-08', 2, NULL),
(13, NULL, NULL, 'COMBO+ (Disney y STAR+)', 2.7, 6.666, 6, 0, 0, 938, 10, NULL, NULL, NULL, 'A', '2024-02-06', 2, NULL),
(14, NULL, NULL, 'Cuenta MAX', 0.5, 2, 1, 0, 0, 998, 10, NULL, NULL, NULL, 'A', '2024-03-03', 2, NULL),
(15, NULL, NULL, 'Cuenta prime video', 0.5, 1.5, 1, 0, 0, 938, 999, NULL, NULL, NULL, 'A', '2024-02-05', 2, NULL),
(16, NULL, NULL, 'Pantalla COMBO+', 0.75, 4.5, 4, 0, 0, 989, 10, NULL, NULL, NULL, 'A', '2024-02-06', 2, NULL),
(17, NULL, NULL, 'Cuenta Netflix 175TL', 6.2, 7.5, 7, 0, 0, 974, 10, NULL, NULL, NULL, 'A', '2024-02-05', 2, NULL),
(18, NULL, NULL, 'Spotify', 0.8, 2, 1, 0, 0, 9969, 10, NULL, NULL, NULL, 'A', '2024-01-25', 2, NULL),
(19, NULL, NULL, 'Cuenta Netflix 20k', 5.2, 5.5, 5.25, 0, 0, 9955, 10, NULL, NULL, NULL, 'A', '2024-02-05', 2, NULL),
(20, NULL, NULL, 'Combo IptvStarNet', 9, 17, 17, 0, 0, 9979, 4, NULL, NULL, NULL, 'A', '2024-02-05', 2, NULL),
(21, NULL, NULL, 'Cuenta Disney', 1.7, 3, 2.5, 0, 0, 985, 10, NULL, NULL, NULL, 'A', '2024-02-05', 2, NULL),
(22, NULL, NULL, 'Pin Netflix 200TL', 7, 7, 6.64, 0, 0, 9995, 10, NULL, NULL, NULL, 'A', '2024-02-06', 2, NULL),
(23, NULL, NULL, 'Cuenta STAR+', 1.7, 4, 3, 0, 0, 997, 10, NULL, NULL, NULL, 'A', '2024-02-06', 2, NULL),
(24, NULL, NULL, 'Hosting', 0.02, 1, 0.9, 0, 0, 9999, 10, NULL, NULL, NULL, 'A', '2024-02-25', 2, NULL),
(25, NULL, NULL, 'Dominio', 0.82, 1, 1, 0, 0, 9999, 3, NULL, NULL, NULL, 'A', '2024-02-25', 2, NULL),
(26, NULL, NULL, 'Hosting y Dominio', 0.84, 2, 2, 0, 0, 9999, 0, NULL, NULL, NULL, 'A', '2024-02-25', 2, NULL),
(27, NULL, NULL, 'IVA KH', 1, 1, 1, 0, 0, 9998, 1, NULL, NULL, NULL, 'A', '2024-03-01', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_transaccion`
--

CREATE TABLE `cat_transaccion` (
  `codigo` int(11) NOT NULL,
  `cod_cliente` int(6) NOT NULL,
  `cod_producto` int(6) DEFAULT NULL,
  `descripcion` varchar(125) NOT NULL,
  `clave_cuenta` varchar(100) NOT NULL,
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
  `fecha_cambia` date DEFAULT NULL,
  `fecha_registra` date NOT NULL,
  `num_mes` int(4) DEFAULT NULL,
  `cod_modulo` int(6) NOT NULL,
  `cod_operacion` int(6) DEFAULT NULL,
  `num_dias_extra` int(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_transaccion`
--

INSERT INTO `cat_transaccion` (`codigo`, `cod_cliente`, `cod_producto`, `descripcion`, `clave_cuenta`, `precio`, `precio_promocion`, `num_producto`, `num_producto_adicional`, `monto`, `monto_descuento`, `aplica_iva`, `estado`, `fecha_inicio`, `fecha_fin`, `fecha_cambia`, `fecha_registra`, `num_mes`, `cod_modulo`, `cod_operacion`, `num_dias_extra`) VALUES
(1, 2, 1, 'Pantalla netflix', '', 3.66, NULL, 1, NULL, 10.98, NULL, 0, 'I', '2023-12-19', '2024-03-27', NULL, '2023-12-27', 3, 2, 1, 0),
(2, 2, 1, 'Netflix', '', 3.66, NULL, 2, NULL, 7.32, NULL, 0, 'I', '2023-12-02', '2024-01-02', NULL, '2024-01-03', 1, 2, 1, 0),
(3, 2, 1, 'Netflix', '', 3.66, NULL, 2, NULL, 7.32, NULL, 0, 'I', '2023-12-03', '2024-02-03', NULL, '2024-01-03', 1, 2, 1, 0),
(4, 4, 3, 'Iptv proyectox', '', 10, NULL, 1, NULL, 10, NULL, 0, 'I', '2023-12-09', '2024-01-09', NULL, '2024-01-04', 1, 2, 1, 0),
(5, 4, 3, 'Iptv proyecto x', '', 10, NULL, 1, NULL, 10, NULL, 0, 'I', '2023-12-10', '2024-01-10', '2024-01-10', '2024-01-04', 1, 2, 1, 0),
(6, 2, 3, 'Iptv proyecto x', '', 10, NULL, 1, NULL, 10, NULL, 0, 'I', '2023-12-09', '2024-01-09', '2024-01-09', '2024-01-04', 1, 2, 1, 0),
(7, 4, 3, 'Magistv', '', 12, NULL, 1, NULL, 12, NULL, 0, 'I', '2024-01-05', '2024-02-05', '2024-01-01', '2024-01-05', 1, 2, 1, 0),
(8, 4, 3, 'Iptv p x', '', 12, NULL, 1, NULL, 12, NULL, 0, 'I', '2024-01-05', '2024-02-05', '2024-01-05', '2024-01-05', 1, 2, 1, 0),
(9, 2, 1, 'Netflix', '', 3.66667, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-01-05', '2024-04-05', NULL, '2024-01-05', 3, 2, 1, 0),
(10, 4, 3, 'Iptv proyecto x', 'ai000ased	Kv2k3JtaNv', 10, NULL, 1, NULL, 10, NULL, 0, 'R', '2023-12-09', '2024-01-09', NULL, '2024-01-08', 1, 2, 1, 0),
(11, 41, 1, 'Netflix', 'netflix04@asedinfo.com	Net4735', 3.5, NULL, 1, NULL, 10.5, NULL, 0, 'R', '2023-10-20', '2024-01-20', NULL, '2024-01-16', 3, 2, 1, 0),
(12, 41, 1, 'Netflix', 'netflix04@asedinfo.com	Net4735', 3.5, NULL, 1, NULL, 10.5, NULL, 0, 'I', '2023-10-20', '2024-01-20', NULL, '2024-01-16', 3, 2, 1, 0),
(13, 41, 1, '*Netflix*', 'netflix04@asedinfo.com	Net4735', 3.5, NULL, 1, NULL, 10.5, NULL, 0, 'I', '2024-01-20', '2024-04-20', NULL, '2024-02-06', 3, 2, 1, 0),
(14, 6, 1, 'Netflix', 'netflix01@asedinfo.com	Net9843', 3.5, NULL, 2, NULL, 21, NULL, 0, 'R', '2023-10-17', '2024-01-17', NULL, '2024-01-17', 3, 2, 1, 0),
(15, 6, 1, '*Netflix* (2 pantallas)', 'netflix01@asedinfo.com	Net9843', 3.5, NULL, 2, NULL, 21, NULL, 0, 'A', '2024-01-19', '2024-04-19', NULL, '2024-02-06', 3, 2, 1, 0),
(16, 7, 4, '*MagisTV*', 'Lperez021	Fiona1222', 8, NULL, 0, NULL, 8, NULL, 0, 'R', '2024-02-18', '2024-02-18', NULL, '2024-02-06', 0, 2, 1, 0),
(17, 74, 1, '*Netflix*', 'netflix04@asedinfo.com	Net4286', 3.66, NULL, 1, NULL, 10.98, NULL, 0, 'A', '2024-01-02', '2024-04-02', NULL, '2024-02-07', 3, 2, 1, 0),
(18, 8, 3, '*IPTV ProyectoX*', 'jaguasai004	QFH8efSY3J', 8, NULL, 1, NULL, 56, NULL, 0, 'A', '2024-01-03', '2024-07-03', NULL, '2024-02-06', 6, 2, 1, 0),
(19, 72, 1, '*Netflix*', 'netflix14@asedinfo.com	Net8932', 3.34, NULL, 1, NULL, 20.04, NULL, 0, 'A', '2024-01-03', '2024-07-03', NULL, '2024-02-06', 6, 2, 1, 0),
(20, 10, 1, '*Netflix* (2 pantallas)', 'netflix01@asedinfo.com	Net9843', 3.5, NULL, 2, NULL, 21, NULL, 0, 'A', '2023-12-08', '2024-03-08', NULL, '2024-02-06', 3, 2, 1, 0),
(21, 4, 3, '*IPTV ProyectoX*', 'ai000ased	Kv2k3JtaNv', 10, NULL, 0, NULL, 10, NULL, 0, 'R', '2024-02-09', '2024-02-09', NULL, '2024-02-06', 0, 2, 1, 0),
(22, 12, 1, '*Netflix*', 'netflix12@asedinfo.com	Net5391', 3.66, NULL, 1, NULL, 10.98, NULL, 0, 'A', '2023-12-26', '2024-03-26', NULL, '2024-02-06', 3, 2, 1, 0),
(23, 13, 16, 'Disney y starplus', 'dsplus@asedinfo.com	Sdplus2213', 4.5, NULL, 0, NULL, 13.5, NULL, 0, 'R', '2024-01-27', '2024-01-27', NULL, '2024-01-19', 0, 2, 1, 0),
(24, 13, 6, 'Starplus', 'dsplus@asedinfo.com	Sdplus2213', 3.33, NULL, 1, NULL, 9.99, NULL, 0, 'I', '2023-10-27', '2024-01-27', NULL, '2024-01-19', 3, 2, 1, 0),
(25, 13, 1, '*Netflix*', 'netflix14@asedinfo.com	Net8932', 3.5, NULL, 1, NULL, 21, NULL, 0, 'A', '2023-12-28', '2024-06-28', NULL, '2024-02-06', 6, 2, 1, 0),
(26, 14, 3, '*IPTV ProyectoX*', 'ai013dalmeida	dVrMwuJDZk', 10, NULL, 0, NULL, 10, NULL, 0, 'R', '2024-02-16', '2024-02-16', NULL, '2024-02-06', 0, 2, 1, 0),
(27, 15, 5, '*YouTube*', 'alexvaca269@gmail.com	youtasedinfo', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-12-09', '2024-12-09', NULL, '2024-02-06', 12, 2, 1, 0),
(28, 15, 7, '*Disney*', 'disney.plus@asedinfo.com	DisneY8213', 2, NULL, 0, NULL, 6, NULL, 0, 'R', '2024-03-01', '2024-03-01', NULL, '2024-02-06', 0, 2, 1, 0),
(29, 87, 7, '*Disney*', 'dsplus@asedinfo.com   Sdplus3289', 2.25, NULL, 1, NULL, 6.75, NULL, 0, 'A', '2024-02-28', '2024-05-28', NULL, '2024-02-28', 3, 2, 1, 0),
(30, 18, 4, '*MagisTV* (ai0170Avaca)', 'ai0170Avaca	   MagStv3212', 4.5, NULL, 1, NULL, 13.5, NULL, 0, 'A', '2024-01-01', '2024-04-01', NULL, '2024-02-06', 3, 2, 1, 0),
(31, 18, 4, '*MagisTV* (Edupadron)', 'Edupadron	197646', 4.5, NULL, 1, NULL, 18, NULL, 0, 'A', '2024-01-26', '2024-05-26', NULL, '2024-02-06', 4, 2, 1, 0),
(32, 75, 6, 'Starplus', 'dsplus@asedinfo.com	Sdplus2213', 3.5, NULL, 0, NULL, 3.5, NULL, 0, 'R', '2024-01-25', '2024-01-25', NULL, '2024-01-22', 0, 2, 1, 0),
(33, 75, 1, 'Netflix', 'netflix06@asedinfo.com', 3.66, NULL, 0, NULL, 3.66, NULL, 0, 'R', '2024-01-25', '2024-01-25', NULL, '2024-01-22', 0, 2, 1, 0),
(34, 75, 3, 'Iptv proyecto x', 'ai040mriva 3YNfUX7qrU', 12, NULL, 0, NULL, 12, NULL, 0, 'R', '2024-01-25', '2024-01-25', NULL, '2024-01-22', 0, 2, 1, 0),
(35, 76, 7, 'Disney', 'disney.plus@asedinfo.com', 2.5, NULL, 0, NULL, 2.5, NULL, 0, 'R', '2024-01-26', '2024-01-26', NULL, '2024-01-22', 0, 2, 1, 0),
(36, 49, 10, 'Netflix (carlos.saquinaula83)', 'carlos.saquinaula83@gmail.com	IsAAc130116', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-01-25', '2024-01-25', '2024-01-28', '2024-01-25', 0, 2, 1, 0),
(37, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7.5, NULL, 0, NULL, 7.5, NULL, 0, 'R', '2024-01-23', '2024-01-23', '2024-01-29', '2024-01-22', 0, 2, 1, 0),
(38, 76, 10, 'Netflix (saularmas669@gmail.com)', 'saularmas669@gmail.com	Nuevacontraseña2121', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-01-25', '2024-01-25', '2024-01-29', '2024-01-22', 0, 2, 1, 0),
(39, 36, 13, 'Star y disney', 'dsplus05@asedinfo.com	macris1020', 6.666, NULL, 1, NULL, 6.666, NULL, 0, 'I', '2023-12-27', '2024-01-27', '2024-02-11', '2024-01-22', 1, 2, 1, 0),
(40, 18, 4, '*MagisTV* (ai0172Czamb)', 'ai0172Czamb	sppz2004', 4.5, NULL, 1, NULL, 36, NULL, 0, 'A', '2023-12-27', '2024-08-27', NULL, '2024-02-06', 8, 2, 1, 0),
(41, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', '2024-01-29', '2024-01-23', 6, 2, 1, 0),
(42, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', '2024-01-29', '2024-01-23', 6, 2, 1, 0),
(43, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7.5, NULL, 1, NULL, 45, NULL, 0, 'I', '2024-01-23', '2024-07-23', '2024-01-29', '2024-01-23', 6, 2, 1, 0),
(44, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', NULL, '2024-01-23', 6, 2, 1, 0),
(45, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', NULL, '2024-01-23', 6, 2, 1, 0),
(46, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', '2024-01-29', '2024-01-23', 6, 2, 1, 0),
(47, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', '2024-01-29', '2024-01-23', 6, 2, 1, 0),
(48, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', NULL, '2024-01-23', 6, 2, 1, 0),
(49, 76, 7, '*Disney*', 'disney.plus@asedinfo.com', 2.16, NULL, 1, NULL, 6.48, NULL, 0, 'A', '2024-01-26', '2024-04-26', NULL, '2024-02-06', 3, 2, 1, 0),
(50, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', '2024-01-29', '2024-01-23', 6, 2, 1, 0),
(51, 5, 17, 'Netflix (mcbritolopez@gmail.com)', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'I', '2024-01-23', '2024-07-23', '2024-01-29', '2024-01-23', 6, 2, 1, 0),
(52, 5, 17, '*Netflix*', 'mcbritolopez@gmail.com	PBn3tfl1x2023.', 7, NULL, 1, NULL, 42, NULL, 0, 'A', '2024-01-23', '2024-07-23', '2024-03-05', '2024-02-20', 6, 2, 1, 0),
(53, 76, 10, '*Netflix*', 'saularmas669@gmail.com	Nuevacontraseña2121', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-25', '2024-02-25', '2024-02-26', '2024-02-13', 0, 2, 1, 0),
(54, 18, 4, '*MagisTV* (Agarcia173)', 'Agarcia173	MagS359', 4.5, NULL, 1, NULL, 36, NULL, 0, 'A', '2023-12-29', '2024-08-29', NULL, '2024-02-06', 8, 2, 1, 0),
(55, 18, 4, '*MagisTV* (SLeon174)', 'SLeon174	MagS539', 4.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-14', '2024-03-14', NULL, '2024-02-06', 2, 2, 1, 0),
(56, 18, 4, 'MagisTV (JPerez175)', 'JPerez175	MagS294', 4.5, NULL, 1, NULL, 4.5, NULL, 0, 'I', '2024-01-03', '2024-02-03', NULL, '2024-02-02', 1, 2, 1, 0),
(57, 18, 4, '*MagisTV* (ACobo176)', 'ACobo176	juanma', 4.5, NULL, 0, NULL, 4.5, NULL, 0, 'R', '2024-02-11', '2024-02-11', NULL, '2024-02-06', 0, 2, 1, 0),
(58, 18, 4, '*MagisTV* (EPaucar177)', 'EPaucar177	MagS389', 4.5, NULL, 1, NULL, 4.5, NULL, 0, 'I', '2024-01-11', '2024-02-11', NULL, '2024-02-06', 1, 2, 1, 0),
(59, 19, 5, '*YouTube*', 'musicytlabo23@gmail.com	Gela', 2.75, NULL, 1, NULL, 8.25, NULL, 0, 'A', '2023-12-16', '2024-03-16', NULL, '2024-02-06', 3, 2, 1, 0),
(60, 20, 5, 'Youtube', 'guagualoco26@gmail.com	AsedinfoSoporte', 4, NULL, 0, NULL, 4, NULL, 0, 'R', '2024-02-04', '2024-02-04', NULL, '2024-01-24', 0, 2, 1, 0),
(61, 21, 5, '*YouTube* (2 cuentas)', 'maurosellanm205@gmail.com	alvarobuitron1991@gmail.com	AsedinfoSoporte  10p', 4, NULL, 0, NULL, 8, NULL, 0, 'R', '2024-02-22', '2024-02-22', NULL, '2024-02-06', 0, 2, 1, 0),
(62, 22, 1, '*Netflix* (2 pantallas)', 'netflix06@asedinfo.com	Net5534', 3.5, NULL, 2, NULL, 21, NULL, 0, 'A', '2024-01-10', '2024-04-10', NULL, '2024-02-06', 3, 2, 1, 0),
(63, 22, 4, '*MagisTV*', 'ai021zamba	Lotv68  12+2', 7.084, NULL, 1, NULL, 85.008, NULL, 0, 'A', '2024-01-05', '2025-01-05', NULL, '2024-02-06', 12, 2, 1, 0),
(64, 23, 5, 'Youtube', 'kevincalderonmadesco@gmail.com	Gela    majithoibrahim@gmail.com	youtasedinfo ', 4, NULL, 0, NULL, 8, NULL, 0, 'R', '2024-02-03', '2024-02-03', NULL, '2024-01-24', 0, 2, 1, 0),
(65, 24, 5, '*YouTube*', 'mrjtorress@gmail.com	AsedinfoSoporte', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-11-26', '2024-11-26', NULL, '2024-02-06', 12, 2, 1, 0),
(66, 25, 4, '*MagisTV*', 'ai024Jasas	MagStv215  12+2', 7.084, NULL, 1, NULL, 85.008, NULL, 0, 'A', '2023-11-05', '2024-11-05', NULL, '2024-02-06', 12, 2, 1, 0),
(67, 26, 1, '*Netflix*', 'netflix12@asedinfo.com	Net5391', 3.5, NULL, 1, NULL, 7, NULL, 0, 'A', '2024-01-21', '2024-03-21', NULL, '2024-02-06', 2, 2, 1, 0),
(68, 27, 7, '*Disney*', 'disney.plus@asedinfo.com	DisneY8213', 2.16, NULL, 1, NULL, 12.96, NULL, 0, 'A', '2024-01-01', '2024-07-01', NULL, '2024-02-06', 6, 2, 1, 0),
(69, 28, 3, '*IPTV ProyectoX*', 'ai053svera	ccKuheSG9s', 8, NULL, 1, NULL, 16, NULL, 0, 'A', '2024-01-04', '2024-03-04', NULL, '2024-02-18', 2, 2, 1, 0),
(70, 29, 1, '*Netflix*', 'info@asedinfo.com	Net2349', 3.5, NULL, 0, NULL, 10.5, NULL, 0, 'R', '2024-03-01', '2024-03-01', NULL, '2024-02-06', 0, 2, 1, 0),
(71, 78, 1, '*Netflix*', 'netflix06@asedinfo.com	Net5534', 3.5, NULL, 1, NULL, 10.5, NULL, 0, 'A', '2024-01-04', '2024-04-04', NULL, '2024-02-06', 3, 2, 1, 0),
(72, 30, 1, '*Netflix* (2 pantallas)', 'netflix07@asedinfo.com	Net3524', 3.5, NULL, 2, NULL, 21, NULL, 0, 'A', '2023-12-27', '2024-03-27', NULL, '2024-02-06', 3, 2, 1, 0),
(73, 30, 5, '*YouTube*', 'moisesorozcop2021@gmail.com	Gela', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-06-02', '2024-06-02', NULL, '2024-02-06', 12, 2, 1, 0),
(74, 31, 1, '*Netflix* (2 pantallas)', 'info@asedinfo.com	Net2349', 3.34, NULL, 0, NULL, 13.36, NULL, 0, 'R', '2024-03-02', '2024-03-02', NULL, '2024-02-07', 0, 2, 1, 0),
(75, 32, 1, '*Netflix* (2 pantallas)', 'netflix12@asedinfo.com	Net5391', 3.5, NULL, 2, NULL, 21, NULL, 0, 'A', '2023-12-21', '2024-03-21', NULL, '2024-02-06', 3, 2, 1, 0),
(76, 80, 5, '*YouTube*', 'd.javier.salazar.m@gmail.com	youtasedinfo', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-09-14', '2024-09-14', NULL, '2024-02-06', 12, 2, 1, 0),
(77, 33, 5, '*YouTube*', 'ameliareveloalvarez@gmail.com	AsedinfoSoporte', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-10-11', '2024-10-11', NULL, '2024-02-06', 12, 2, 1, 0),
(78, 34, 5, 'Youtube', 'khmv2189@gmail.com	Gela', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-09-12', '2024-09-12', NULL, '2024-01-24', 12, 2, 1, 0),
(79, 35, 4, '*MagisTV*', 'Ctayo037	MagS786  12+5', 7.084, NULL, 1, NULL, 106.26, NULL, 0, 'A', '2024-02-01', '2025-05-01', NULL, '2024-02-06', 15, 2, 1, 0),
(80, 37, 5, '*YouTube*', 'daniel.ramon90@gmail.com	youtasedinfo', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-12-12', '2024-12-12', NULL, '2024-02-06', 12, 2, 1, 0),
(81, 39, 1, '*Netflix*', 'netflix04@asedinfo.com	Net4286', 3.34, NULL, 1, NULL, 10.02, NULL, 0, 'A', '2024-01-04', '2024-04-04', NULL, '2024-02-06', 3, 2, 1, 0),
(82, 39, 7, '*Disney*', 'disney.plus@asedinfo.com	DisneY8213', 2.5, NULL, 1, NULL, 7.5, NULL, 0, 'A', '2024-01-12', '2024-04-12', NULL, '2024-02-06', 3, 2, 1, 0),
(83, 40, 1, '*Netflix*', 'netflix07@asedinfo.com	Net3524', 3.34, NULL, 1, NULL, 10.02, NULL, 0, 'A', '2023-12-30', '2024-03-30', NULL, '2024-02-06', 3, 2, 1, 0),
(84, 41, 1, '*Netflix*', 'netflix04@asedinfo.com	Net4286', 3.5, NULL, 1, NULL, 10.5, NULL, 0, 'A', '2024-01-20', '2024-04-20', NULL, '2024-02-07', 3, 2, 1, 0),
(85, 42, 4, 'Magistv', 'ai0460Anny	Anny2310', 8, NULL, 0, NULL, 8, NULL, 0, 'R', '2024-02-03', '2024-02-03', NULL, '2024-01-24', 0, 2, 1, 0),
(86, 43, 1, '*Netflix*', 'netflix07@asedinfo.com	Net3524', 3.66, NULL, 1, NULL, 10.98, NULL, 0, 'A', '2023-12-27', '2024-03-27', NULL, '2024-02-06', 3, 2, 1, 0),
(87, 81, 5, '*YouTube*', 'ledwar2@gmail.com	Gela', 2.75, NULL, 1, NULL, 16.5, NULL, 0, 'A', '2023-12-24', '2024-06-24', NULL, '2024-02-06', 6, 2, 1, 0),
(88, 45, 5, '*YouTube*', 'huilcaremajorge@gmail.com	youtasedinfo', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-12-04', '2024-12-04', NULL, '2024-02-06', 12, 2, 1, 0),
(89, 82, 4, 'Magistv', 'ai0500Vere	Luciana2014', 8, NULL, 1, NULL, 8, NULL, 0, 'I', '2024-01-03', '2024-02-03', NULL, '2024-01-24', 1, 2, 1, 0),
(90, 46, 7, 'Disney', 'dsplus@asedinfo.com	Sdplus2213', 2.5, NULL, 0, NULL, 7.5, NULL, 0, 'R', '2024-02-06', '2024-02-06', NULL, '2024-01-24', 0, 2, 1, 0),
(91, 49, 10, '*Netflix* (carlos.saquinaula83@gmail.com)', 'carlos.saquinaula83@gmail.com	IsAAc130116', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-25', '2024-02-25', '2024-02-26', '2024-02-06', 0, 2, 1, 0),
(92, 46, 8, 'Hbomax', 'hbomax003@asedinfo.com	HbomaX553', 2.5, NULL, 0, NULL, 7.5, NULL, 0, 'R', '2024-02-06', '2024-02-06', NULL, '2024-01-25', 0, 2, 1, 0),
(93, 83, 18, '*Spotify*', '', 2, NULL, 1, NULL, 6, NULL, 0, 'A', '2024-01-26', '2024-04-26', NULL, '2024-02-17', 3, 2, 1, 0),
(94, 84, 5, '*YouTube*', 'egomezmorales@gmail.com	asedinfo000', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-10-09', '2024-10-09', NULL, '2024-02-06', 12, 2, 1, 0),
(95, 47, 5, '*YouTube*', 'faresflores49@gmail.com	asedinfo000', 2.75, NULL, 1, NULL, 16.5, NULL, 0, 'A', '2023-10-16', '2024-04-16', NULL, '2024-02-06', 6, 2, 1, 0),
(96, 85, 5, 'Youtube', 'rguti2986@gmail.com	asedinfo000', 2.75, NULL, 0, NULL, 2.75, NULL, 0, 'R', '2024-01-30', '2024-01-30', NULL, '2024-01-25', 0, 2, 1, 0),
(97, 46, 5, '*YouTube*', 'paulprolo@outlook.es	  Dario', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-05-22', '2024-05-22', NULL, '2024-02-06', 12, 2, 1, 0),
(98, 48, 5, '*YouTube*', 'xavierandresfm97@gmail.com	  Dario', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-03-17', '2024-03-17', NULL, '2024-02-06', 12, 2, 1, 0),
(99, 31, 5, '*YouTube*', 'pedroayala99@gmail.com	 Dario', 2.75, NULL, 0, NULL, 33, NULL, 0, 'R', '2024-03-05', '2024-03-05', NULL, '2024-02-06', 0, 2, 1, 0),
(100, 9, 5, '*YouTube*', 'androtv0420@gmail.com	 Dario', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-10-24', '2024-10-24', NULL, '2024-02-06', 12, 2, 1, 0),
(101, 38, 5, '*YouTube*', 'rodrigorueda94@gmail.com	asedinfo000', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-10-09', '2024-10-09', NULL, '2024-02-06', 12, 2, 1, 0),
(102, 86, 5, '*YouTube*', 'estebanreg1991@gmail.com	asedinfo000', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2023-10-14', '2024-10-14', NULL, '2024-02-06', 12, 2, 1, 0),
(103, 11, 5, '*YouTube*', 'joss01and@gmail.com	Dario', 2.75, NULL, 1, NULL, 5.5, NULL, 0, 'A', '2024-01-30', '2024-03-30', NULL, '2024-02-06', 2, 2, 1, 0),
(104, 79, 19, 'Netflix (netflix01)', 'netflix01@asedinfo.com	Net9843', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-01-29', '2024-01-29', NULL, '2024-01-25', 0, 2, 1, 0),
(105, 79, 19, 'Netflix (netflix02)', 'netflix02@asedinfo.com	Net2594', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-02-05', '2024-02-05', NULL, '2024-01-25', 0, 2, 1, 0),
(106, 102, 1, '*Netflix*', 'netflix02@asedinfo.com', 4.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-12-26', '2024-02-26', NULL, '2024-02-21', 2, 2, 1, 0),
(107, 88, 1, '*Netflix*', 'netflix02@asedinfo.com', 4, NULL, 1, NULL, 12, NULL, 0, 'A', '2024-01-20', '2024-04-20', NULL, '2024-02-21', 3, 2, 1, 0),
(108, 85, 1, 'Netflix', 'netflix02@asedinfo.com	Net2594', 4, NULL, 0, NULL, 4, NULL, 0, 'R', '2024-01-30', '2024-01-30', NULL, '2024-01-25', 0, 2, 1, 0),
(109, 102, 1, '*Netflix*', 'netflix02@asedinfo.com', 4, NULL, 1, NULL, 4, NULL, 0, 'A', '2023-12-22', '2024-01-22', NULL, '2024-02-21', 1, 2, 1, 0),
(110, 79, 19, 'Netflix (netflix04)', 'netflix04@asedinfo.com	Net4286', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-02-01', '2024-02-01', NULL, '2024-01-25', 0, 2, 1, 0),
(111, 79, 19, 'Netflix (netflix06)', 'netflix06@asedinfo.com	Net5534', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-02-01', '2024-02-01', NULL, '2024-01-25', 0, 2, 1, 0),
(112, 79, 19, 'Netflix (netflix07)', 'netflix07@asedinfo.com	Net3524', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-01-29', '2024-01-29', NULL, '2024-01-25', 0, 2, 1, 0),
(113, 13, 16, '*Disney y STAR+*', 'dsplus@asedinfo.com	Sdplus3289', 4, NULL, 1, NULL, 24, NULL, 0, 'A', '2024-01-27', '2024-07-27', NULL, '2024-02-28', 6, 2, 1, 0),
(114, 79, 19, 'Netflix (netflix01)', 'netflix01@asedinfo.com	Net9843', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-02-01', '2024-02-01', NULL, '2024-01-29', 0, 2, 1, 0),
(115, 79, 19, 'Netflix (netflix07)', 'netflix07@asedinfo.com	Net3524', 5.5, NULL, 0, NULL, 0, NULL, 0, 'R', '2024-02-01', '2024-02-01', NULL, '2024-01-29', 0, 2, 1, 0),
(116, 79, 12, 'Netflix (netflix14) usa', 'netflix14@asedinfo.com	Net8932', 17, NULL, 0, NULL, 17, NULL, 0, 'R', '2024-01-31', '2024-01-31', NULL, '2024-01-29', 0, 2, 1, 0),
(117, 79, 19, 'Netflix (info)', 'info@asedinfo.com	Net2349', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-02-04', '2024-02-04', NULL, '2024-01-29', 0, 2, 1, 0),
(118, 79, 12, '*Netflix* (netflix12)', 'netflix12@asedinfo.com	Net5391', 17, NULL, 1, NULL, 17, NULL, 0, 'A', '2024-02-09', '2024-03-24', NULL, '2024-02-23', 1, 2, 1, 15),
(119, 47, 17, '*Netflix*', 'zunigafares93@gmail.com	Samuelito03', 8, NULL, 0, NULL, 8, NULL, 0, 'R', '2024-02-18', '2024-02-18', '2024-02-14', '2024-02-06', 0, 2, 1, 0),
(120, 90, 12, '*Netflix*', 'tefo_1989@hotmail.com	Nunit@1689criss', 4.5, NULL, 1, NULL, 18, NULL, 0, 'A', '2023-12-04', '2024-04-04', '2024-03-16', '2024-02-25', 4, 2, 1, 0),
(121, 49, 10, '*Netflix* (casm.netflix@gmail.com)', 'casm.netflix@gmail.com	2016IsAaC', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-12', '2024-02-12', '2024-02-13', '2024-02-06', 0, 2, 1, 0),
(122, 75, 20, '*IPTV, STAR+ y Netflix*', 'ai040mriva 3YNfUX7qrU  dsplus@asedinfo.com	netflix06@asedinfo.com', 17, NULL, 0, NULL, 17, NULL, 0, 'R', '2024-02-25', '2024-02-25', NULL, '2024-02-06', 0, 2, 1, 0),
(123, 75, 1, '*Netflix*', 'netflix06@asedinfo.com', 3.66, NULL, 1, NULL, 3.66, NULL, 0, 'I', '2024-01-25', '2024-02-25', NULL, '2024-02-06', 1, 2, 1, 0),
(124, 75, 3, 'Iptv proyecto x', 'ai040mriva 3YNfUX7qrU', 10, NULL, 1, NULL, 10, NULL, 0, 'I', '2024-01-25', '2024-02-25', NULL, '2024-01-30', 1, 2, 1, 0),
(125, 79, 19, '*Netflix* (netflix04)', 'netflix04@asedinfo.com	Net4286', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-02-18', '2024-02-18', NULL, '2024-02-06', 0, 2, 1, 13),
(126, 79, 19, 'Netflix (netflix06)', 'netflix06@asedinfo.com	Net5534', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-02-04', '2024-02-04', NULL, '2024-02-02', 0, 2, 1, 0),
(127, 79, 19, 'Netflix (netflix01)', 'netflix01@asedinfo.com	Net9843', 5.5, NULL, 0, NULL, 0, NULL, 0, 'R', '2024-02-01', '2024-02-01', NULL, '2024-02-02', 0, 2, 1, 0),
(128, 79, 19, 'Netflix (netflix01)', 'netflix01@asedinfo.com	Net9843', 5.5, NULL, 0, NULL, 0, NULL, 0, 'R', '2024-02-13', '2024-02-13', NULL, '2024-02-02', 0, 2, 1, 12),
(129, 79, 19, '*Netflix* (netflix01)', 'netflix01@asedinfo.com	Net9843', 5.5, NULL, 0, NULL, 0, NULL, 0, 'R', '2024-02-14', '2024-02-14', NULL, '2024-02-06', 0, 2, 1, 1),
(130, 79, 19, '*Netflix* (netflix07)', 'netflix07@asedinfo.com	Net3524', 5.5, NULL, 0, NULL, 0, NULL, 0, 'R', '2024-02-14', '2024-02-14', NULL, '2024-02-06', 0, 2, 1, 13),
(131, 79, 12, '*Netflix* (netflix14) usa', 'netflix14@asedinfo.com	Net8932', 17, NULL, 1, NULL, 17, NULL, 0, 'A', '2024-02-18', '2024-03-18', NULL, '2024-03-02', 1, 2, 1, 0),
(132, 85, 1, '*Netflix*', 'netflix02@asedinfo.com', 4, NULL, 1, NULL, 12, NULL, 0, 'A', '2024-01-30', '2024-04-30', NULL, '2024-02-21', 3, 2, 1, 0),
(133, 85, 5, '*YouTube*', 'rguti2986@gmail.com	asedinfo000', 2.75, NULL, 1, NULL, 8.25, NULL, 0, 'A', '2024-01-30', '2024-04-30', NULL, '2024-02-06', 3, 2, 1, 0),
(134, 20, 5, '*YouTube*', 'guagualoco26@gmail.com	AsedinfoSoporte', 4, NULL, 0, NULL, 4, NULL, 0, 'R', '2024-03-04', '2024-03-04', NULL, '2024-02-06', 0, 2, 1, 0),
(135, 11, 10, '*Netflix* (joss01and@gmail.com)', 'joss01and@gmail.com	Brunoypan2023', 10.5, NULL, 0, NULL, 10.5, NULL, 0, 'R', '2024-02-17', '2024-02-17', '2024-02-21', '2024-02-17', 0, 2, 1, 0),
(136, 11, 10, 'Netflix (netflix05@asedinfo.com)', 'netflix05@asedinfo.com	Net7382', 10.5, NULL, 0, NULL, 10.5, NULL, 0, 'R', '2024-02-06', '2024-02-06', '2024-02-07', '2024-02-02', 0, 2, 1, 0),
(137, 21, 10, '*Netflix*', 'netflix16@asedinfo.com	mau1987', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-22', '2024-02-22', '2024-02-23', '2024-02-18', 0, 2, 1, 0),
(138, 50, 10, '*Netflix* (Cristina Q)', 'amyariadna07@gmail.com	amy2007', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-12', '2024-02-12', '2024-02-11', '2024-02-08', 0, 2, 1, 0),
(139, 34, 10, '*Netflix*', 'khmv2189@gmail.com	Marti1502', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-12', '2024-02-12', '2024-02-12', '2024-02-06', 0, 2, 1, 0),
(140, 51, 10, '*Netflix*', 'eliz18yol@hotmail.com	yolyeli.18', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-28', '2024-02-28', '2024-03-01', '2024-02-29', 0, 2, 1, 0),
(141, 52, 10, '*Netflix*', 'monica.dutan082@gmail.com	luzyugsi2021', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-29', '2024-02-29', '2024-03-08', '2024-02-24', 0, 2, 1, 0),
(142, 76, 10, '*Netflix*', 'saularmas669@gmail.com	Nuevacontraseña2121', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-01-25', '2024-02-25', '2024-02-26', '2024-02-13', 1, 2, 1, 0),
(143, 53, 10, '*Netflix*', 'asedinfo000@gmail.com	Net6345', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-12', '2024-02-12', '2024-02-11', '2024-02-06', 0, 2, 1, 0),
(144, 8, 10, '*Netflix* (netflix03@asedinfo.com)', 'netflix03@asedinfo.com	Net3942', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-18', '2024-02-18', '2024-02-18', '2024-02-17', 0, 2, 1, 0),
(145, 8, 10, '*Netflix* (netflix09@asedinfo.com)', 'netflix09@asedinfo.com	Camila1112*', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-18', '2024-03-18', '2024-03-23', '2024-03-03', 1, 2, 1, 0),
(146, 54, 10, '*Netflix*', 'fponceortiz@gmail.com	19832021', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-14', '2024-02-14', '2024-02-12', '2024-02-06', 0, 2, 1, 0),
(147, 40, 10, 'Netflix (y.outasedinf.o@gmail.com)', 'y.outasedinf.o@gmail.com	Netflix78', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-05', '2024-02-05', '2024-02-07', '2024-02-02', 0, 2, 1, 0),
(148, 55, 10, 'Netflix (gabymay290990@hotmail.com)', 'gabymay290990@hotmail.com	Rafa1002', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-08', '2024-02-08', '2024-02-10', '2024-02-02', 0, 2, 1, 0),
(149, 56, 10, '*Netflix* (ramiro.gahona@hotmail.com)', 'ramiro.gahona@hotmail.com	EmeleC583961', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-29', '2024-02-29', '2024-02-27', '2024-02-14', 0, 2, 1, 0),
(150, 17, 10, '*Netflix*', 'youtasedinfo@gmail.com 	Paolina101268.$', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-19', '2024-02-19', '2024-02-18', '2024-02-06', 0, 2, 1, 0),
(151, 57, 10, '*Netflix*', 'netflix10@asedinfo.com	David_290172*', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-02-17', '2024-02-17', '2024-02-14', '2024-02-06', 0, 2, 1, 0),
(152, 23, 5, '*YouTube* (2 cuentas)', 'kevincalderonmadesco@gmail.com	Gela    majithoibrahim@gmail.com	youtasedinfo ', 4, NULL, 0, NULL, 8, NULL, 0, 'R', '2024-03-03', '2024-03-03', NULL, '2024-02-06', 0, 2, 1, 0),
(153, 42, 4, '*MagisTV*', 'AGalvez98	Anny2310', 3.83, NULL, 1, NULL, 22.98, NULL, 0, 'A', '2024-02-03', '2024-09-02', NULL, '2024-02-06', 6, 2, 1, 30),
(154, 79, 19, '*Netflix* (info@asedinfo.com)', 'info@asedinfo.com	Net2349', 5.5, NULL, 0, NULL, 0, NULL, 0, 'R', '2024-02-20', '2024-02-20', NULL, '2024-02-09', 0, 2, 1, 16),
(155, 79, 19, '*Netflix* (netflix06)', 'netflix06@asedinfo.com	Net5534', 5.5, NULL, 0, NULL, 0, NULL, 0, 'R', '2024-02-17', '2024-02-17', NULL, '2024-02-06', 0, 2, 1, 13),
(156, 40, 10, '*Netflix* (y.outasedinf.o@gmail.com)', 'y.outasedinf.o@gmail.com	Netflix78', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-03-05', '2024-03-05', '2024-03-04', '2024-02-20', 0, 2, 1, 0),
(157, 55, 10, '*Netflix*', 'gabymay290990@hotmail.com	Rafa1002', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-08', '2024-03-08', '2024-03-10', '2024-02-26', 1, 2, 1, 0),
(158, 46, 7, '*Disney*', 'dsplus@asedinfo.com	Sdplus3289', 2.5, NULL, 1, NULL, 7.5, NULL, 0, 'A', '2024-02-06', '2024-06-05', NULL, '2024-02-28', 3, 2, 1, 30),
(159, 46, 8, '*Hbomax*', 'hbomax003@asedinfo.com	HbomaX553', 2.5, NULL, 1, NULL, 7.5, NULL, 0, 'A', '2024-02-06', '2024-06-05', NULL, '2024-02-06', 3, 2, 1, 30),
(160, 94, 10, '*Netflix* (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 0, NULL, 11, NULL, 0, 'R', '2024-03-01', '2024-03-01', '2024-03-02', '2024-02-26', 0, 2, 1, 0),
(161, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(162, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(163, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(164, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(165, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(166, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(167, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(168, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(169, 94, 10, 'Netflix (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 11, NULL, 1, NULL, 11, NULL, 0, 'I', '2024-02-01', '2024-03-01', '2024-02-13', '2024-02-05', 1, 2, 1, 0),
(170, 94, 12, '*Netflix* (netflix11@asedinfo.com)', 'netflix11@asedinfo.com	danielcine@585', 20, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-10', '2024-03-10', '2024-03-08', '2024-02-22', 1, 2, 1, 0),
(171, 94, 12, '*Netflix* (netflix15@asedinfo.com)', 'netflix15@asedinfo.com	Net9203', 20, NULL, 1, NULL, 20, NULL, 0, 'A', '2024-02-19', '2024-03-19', '2024-03-18', '2024-03-02', 1, 2, 1, 0),
(172, 94, 12, '*Netflix* (netflix17@asedinfo.com)', 'netflix17@asedinfo.com	Net8320', 20, NULL, 1, NULL, 20, NULL, 0, 'A', '2024-02-29', '2024-03-30', '2024-03-11', '2024-02-25', 1, 2, 1, 1),
(173, 18, 10, '*Netflix* (netflix08@asedinfo.com)', 'netflix08@asedinfo.com	Net6643', 10.5, NULL, 0, NULL, 10.5, NULL, 0, 'R', '2024-02-17', '2024-02-17', '2024-02-18', '2024-02-06', 0, 2, 1, 0),
(174, 79, 13, '*Disney y STAR+* (dsplus@asedinfo.com)', 'dsplus@asedinfo.com	Sdplus3289', 6.666, NULL, 1, NULL, 6.666, NULL, 0, 'A', '2024-01-29', '2024-03-14', NULL, '2024-02-28', 1, 2, 1, 14),
(175, 11, 10, '*Netflix* (netflix05@asedinfo.com)', 'netflix05@asedinfo.com	Net7382', 10.5, NULL, 1, NULL, 10.5, NULL, 0, 'A', '2024-02-06', '2024-03-06', '2024-03-04', '2024-02-20', 1, 2, 1, 0),
(176, 79, 22, '*Netflix* (netflix02)', 'netflix02@asedinfo.com	Net4359', 7, NULL, 1, NULL, 7, NULL, 0, 'A', '2024-02-06', '2024-03-06', NULL, '2024-02-21', 1, 2, 1, 0),
(177, 79, 21, '*Disney* (disney.plus@asedinfo.com)', 'disney.plus@asedinfo.com	DisneY8213', 3, NULL, 1, NULL, 3, NULL, 0, 'A', '2024-02-04', '2024-03-04', NULL, '2024-02-06', 1, 2, 1, 0),
(178, 18, 21, '*Disney* (disneyplus@asedinfo.com)', 'disneyplus@asedinfo.com    DisneY3385', 3, NULL, 0, NULL, 3, NULL, 0, 'R', '2024-03-08', '2024-03-08', '2024-02-28', '2024-02-06', 0, 2, 1, 0),
(179, 18, 21, '*Disney* (disney@asedinfo.com)', 'disney@asedinfo.com	DisneY425', 3, NULL, 0, NULL, 3, NULL, 0, 'R', '2024-02-22', '2024-02-22', '2024-02-22', '2024-02-06', 0, 2, 1, 0),
(180, 67, 21, '*Disney* (disney@sh.asedinfo.com)', 'disney@sh.asedinfo.com	DisneY596', 3, NULL, 1, NULL, 6, NULL, 0, 'A', '2024-02-15', '2024-04-15', '2024-03-10', '2024-02-06', 2, 2, 1, 0),
(181, 95, 23, '*STAR+*', 'disney@sh.asedinfo.com	DisneY596', 4, NULL, 1, NULL, 12, NULL, 0, 'A', '2024-01-25', '2024-04-25', '2024-03-10', '2024-02-06', 3, 2, 1, 0),
(182, 34, 13, '*Disney y STAR+*', 'dsplus01@asedinfo.com	Mati2410.', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2024-01-02', '2024-04-02', '2024-04-01', '2024-02-18', 3, 2, 1, 0),
(183, 41, 1, '*Netflix* (DyLi)', 'netflix04@asedinfo.com	Net4286', 3.5, NULL, 1, NULL, 10.5, NULL, 0, 'A', '2024-02-07', '2024-05-07', NULL, '2024-02-07', 3, 2, 1, 0),
(184, 79, 1, '*Netflix* (3 pantallas)', 'netflix14@asedinfo.com', 0.01, NULL, 2, NULL, 0.48, NULL, 0, 'A', '2024-02-04', '2026-02-04', NULL, '2024-03-03', 24, 2, 1, 0),
(185, 54, 10, '*Netflix*', 'fponceortiz@gmail.com	19832021', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-14', '2024-03-14', '2024-03-15', '2024-03-01', 1, 2, 1, 0),
(186, 34, 10, '*Netflix*', 'khmv2189@gmail.com	Marti1502', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-12', '2024-03-12', '2024-03-10', '2024-02-26', 1, 2, 1, 0),
(187, 97, 11, '*Netflix*', 'netflix18@asedinfo.com	Angaxa.2024', 9.5, NULL, 1, NULL, 114, NULL, 0, 'A', '2024-02-08', '2025-02-15', '2024-03-09', '2024-02-23', 12, 2, 1, 7),
(188, 60, 13, '*Disney y STAR+*', 'dsplus02@asedinfo.com	Perico2804', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2023-12-15', '2024-03-15', '2024-03-14', '2024-02-27', 3, 2, 1, 0),
(189, 41, 13, '*Disney y STAR+*', 'dsplus04@asedinfo.com	Cristhian2236', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2023-12-22', '2024-03-22', '2024-03-27', '2024-02-14', 3, 2, 1, 0),
(190, 33, 13, '*Disney y STAR+*', 'dsplus05@asedinfo.com	naviplusmx77', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2024-02-07', '2024-05-07', '2024-03-21', '2024-02-09', 3, 2, 1, 0),
(191, 21, 13, '*Disney y STAR+*', 'disneyplus2@asedinfo.com	Sdplus3965', 6.666, NULL, 0, NULL, 6.666, NULL, 0, 'R', '2024-02-22', '2024-02-22', '2024-02-26', '2024-02-09', 0, 2, 1, 0),
(192, 55, 13, '*Disney y STAR+*', 'dsplus07@asedinfo.com	danna1002', 6.666, NULL, 1, NULL, 6.666, NULL, 0, 'A', '2024-02-08', '2024-03-08', '2024-03-07', '2024-02-09', 1, 2, 1, 0),
(193, 41, 13, '*Disney y STAR+* (gustavomiguelvega@gmail.com)', 'gustavomiguelvega@gmail.com	iSyP9yiG', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'I', '2023-12-30', '2024-03-30', '2024-02-13', '2024-02-09', 3, 2, 1, 0),
(194, 18, 13, '*Disney y STAR+* (dsplus09@asedinfo.com)', 'dsplus09@asedinfo.com	Sdplus8932', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2024-01-04', '2024-04-04', '2024-03-27', '2024-02-14', 3, 2, 1, 0),
(195, 8, 13, '*Disney y STAR+*', 'lyangahel2017@gmail.com	Camila1112', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2024-01-06', '2024-04-06', '2024-03-28', '2024-02-14', 3, 2, 1, 0),
(196, 19, 13, '*Disney y STAR+*', 'dsplus11@asedinfo.com	Karol123', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2024-01-13', '2024-04-13', '2024-04-10', '2024-02-27', 3, 2, 1, 0),
(197, 98, 13, '*Disney y STAR+*', 'dsplus08@asedinfo.com	Sdplus8394', 6.666, NULL, 1, NULL, 39.996, NULL, 0, 'A', '2024-01-01', '2024-07-01', '2024-03-27', '2024-02-14', 6, 2, 1, 0),
(198, 99, 13, '*Disney y STAR+*', 'disney4170618@gmail.com	Disney0203', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2024-01-06', '2024-04-06', '2024-03-27', '2024-02-14', 3, 2, 1, 0),
(199, 102, 13, '*Disney y STAR+*', 'gorky.garcia@gmail.com	G0rkyAlex*', 6.666, NULL, 1, NULL, 6.666, NULL, 0, 'I', '2024-01-17', '2024-02-17', '2024-02-17', '2024-02-18', 1, 2, 1, 0),
(200, 4, 3, '*IPTV ProyectoX*', 'ai000ased	Kv2k3JtaNv', 10, NULL, 1, NULL, 10, NULL, 0, 'A', '2024-02-09', '2024-03-09', NULL, '2024-02-12', 1, 2, 1, 0),
(201, 18, 4, '*MagisTV* (ACobo176)', 'ACobo176	juanma', 4.5, NULL, 1, NULL, 4.5, NULL, 0, 'A', '2024-02-11', '2024-03-11', NULL, '2024-02-12', 1, 2, 1, 0),
(202, 49, 10, '*Netflix* (casm.netflix@gmail.com)', 'casm.netflix@gmail.com	2016IsAaC', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-12', '2024-03-12', '2024-03-10', '2024-02-26', 1, 2, 1, 0),
(203, 53, 10, '*Netflix*', 'asedinfo000@gmail.com	Net6345', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-12', '2024-03-12', '2024-03-05', '2024-02-13', 1, 2, 1, 0),
(204, 79, 19, '*Netflix* (netflix01)', 'netflix01@asedinfo.com	Net9843', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-03-01', '2024-03-01', NULL, '2024-02-17', 0, 2, 1, 0),
(205, 79, 19, '*Netflix* (netflix07)', 'netflix07@asedinfo.com	Net3524', 5.5, NULL, 0, NULL, 5.5, NULL, 0, 'R', '2024-03-01', '2024-03-01', NULL, '2024-02-17', 0, 2, 1, 0),
(206, 7, 4, '*MagisTV*', 'Lperez021	Fiona1222', 8, NULL, 1, NULL, 8, NULL, 0, 'A', '2024-02-18', '2024-03-18', NULL, '2024-02-14', 1, 2, 1, 0),
(207, 47, 17, '*Netflix*', 'zunigafares93@gmail.com	Samuelito03', 8, NULL, 1, NULL, 8, NULL, 0, 'A', '2024-02-18', '2024-03-18', '2024-03-05', '2024-02-14', 1, 2, 1, 0),
(208, 50, 10, '*Netflix* (Cristina Q)', 'amyariadna07@gmail.com	amy2007', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-12', '2024-03-12', '2024-03-11', '2024-02-27', 1, 2, 1, 0),
(209, 14, 3, '*IPTV ProyectoX*', 'ai013dalmeida	dVrMwuJDZk', 10, NULL, 1, NULL, 10, NULL, 0, 'A', '2024-02-17', '2024-03-17', NULL, '2024-02-17', 1, 2, 1, 0),
(210, 57, 10, '*Netflix*', 'netflix10@asedinfo.com	David_290172*', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-17', '2024-03-17', '2024-03-17', '2024-03-03', 1, 2, 1, 0),
(211, 18, 10, '*Netflix* (netflix08@asedinfo.com)', 'netflix08@asedinfo.com	Net6643', 10.5, NULL, 1, NULL, 10.5, NULL, 0, 'A', '2024-02-17', '2024-03-17', '2024-03-17', '2024-03-03', 1, 2, 1, 0),
(212, 11, 10, '*Netflix* (joss01and@gmail.com)', 'joss01and@gmail.com	Brunoypan2023', 10.5, NULL, 1, NULL, 10.5, NULL, 0, 'A', '2024-02-17', '2024-03-17', '2024-03-05', '2024-02-21', 1, 2, 1, 0),
(213, 79, 19, '*Netflix* (netflix06)', 'netflix06@asedinfo.com	Net5534', 5.5, NULL, 1, NULL, 5.5, NULL, 0, 'A', '2024-02-04', '2024-03-04', NULL, '2024-02-20', 1, 2, 1, 0),
(214, 49, 18, '*Spotify*', 'dxbritol@gmail.com  cism.spotify@gmail.com  facebook  1cuentafalta', 1.66667, NULL, 3, NULL, 60.0001, NULL, 0, 'A', '2024-02-10', '2025-02-10', NULL, '2024-02-17', 12, 2, 1, 0),
(215, 103, 18, '*Spotify*', 'dxbritol@gmail.com  zeus18jp@gmail.com herdoizacarmen@hotmail.com ', 1.83, NULL, 2, NULL, 43.92, NULL, 0, 'A', '2024-02-07', '2025-02-07', NULL, '2024-02-17', 12, 2, 1, 0),
(216, 22, 18, '*Spotify*', 'spotify@asedinfo.com', 1.25, NULL, 6, NULL, 90, NULL, 0, 'A', '2024-02-14', '2025-02-14', NULL, '2024-02-17', 12, 2, 1, 0),
(217, 104, 18, '*Spotify*', 'spotify@asedinfo.com  jr_o2000@hotmail.com', 2.01, NULL, 1, NULL, 24, NULL, 0, 'A', '2024-02-14', '2025-02-14', NULL, '2024-02-17', 12, 2, 1, 0),
(218, 79, 19, '*Netflix* (netflix04)', 'netflix04@asedinfo.com	Net4286', 5.5, NULL, 1, NULL, 5.5, NULL, 0, 'A', '2024-02-05', '2024-03-05', NULL, '2024-02-21', 1, 2, 1, 0),
(219, 8, 9, '*Netflix* (netflix03@asedinfo.com)', 'netflix03@asedinfo.com	Net3942', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-19', '2024-03-19', '2024-03-17', '2024-03-03', 1, 2, 1, 0),
(220, 17, 10, '*Netflix*', 'youtasedinfo@gmail.com 	Paolina101268.$', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-19', '2024-03-19', '2024-03-04', '2024-02-20', 1, 2, 1, 0),
(221, 103, 13, '*Disney y STAR+*', 'zeus18jp@gmail.com uNIVERSAL123', 6.25, NULL, 1, NULL, 75, NULL, 0, 'A', '2024-01-09', '2025-01-09', '2024-04-01', '2024-02-19', 12, 2, 1, 0),
(222, 105, 13, '*Disney y STAR+*', 'dsplus06@asedinfo.com	Blux2000.', 6.666, NULL, 1, NULL, 19.998, NULL, 0, 'A', '2024-02-18', '2024-05-18', '2024-04-01', '2024-03-01', 3, 2, 1, 0),
(223, 79, 19, '*Netflix* (info@asedinfo.com)', 'info@asedinfo.com	Net3279', 5.5, NULL, 1, NULL, 5.5, NULL, 0, 'A', '2024-02-07', '2024-03-07', NULL, '2024-03-03', 1, 2, 1, 0),
(224, 18, 21, '*Disney* (disney@asedinfo.com)', 'disney@asedinfo.com	DisneY425', 4.5, NULL, 1, NULL, 4.5, NULL, 0, 'A', '2024-02-22', '2024-03-22', '2024-04-06', '2024-02-23', 1, 2, 1, 0),
(225, 33, 4, '*MagisTV* (Mxviptv)', 'Mxviptv	ABCTVMX', 8, NULL, 1, NULL, 8, NULL, 0, 'A', '2024-02-20', '2024-03-20', NULL, '2024-02-20', 1, 2, 1, 0),
(226, 21, 5, '*YouTube* (2 cuentas)', 'maurosellanm205@gmail.com	alvarobuitron1991@gmail.com	AsedinfoSoporte  10p', 4, NULL, 2, NULL, 8, NULL, 0, 'A', '2024-02-22', '2024-03-22', NULL, '2024-02-20', 1, 2, 1, 0),
(227, 21, 13, '*Disney y STAR+*', 'disneyplus2@asedinfo.com	Sdplus3965', 6.666, NULL, 1, NULL, 6.666, NULL, 0, 'A', '2024-02-22', '2024-03-22', '2024-04-04', '2024-02-21', 1, 2, 1, 0),
(228, 21, 10, '*Netflix*', 'netflix16@asedinfo.com	mau1987', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-22', '2024-03-22', '2024-03-07', '2024-02-23', 1, 2, 1, 0),
(229, 94, 12, '*Netflix* (netflix19@asedinfo.com)', 'netflix19@asedinfo.com	cinema62568', 10, NULL, 1, NULL, 20, NULL, 0, 'A', '2024-02-22', '2024-04-28', '2024-03-07', '2024-02-27', 2, 2, 1, 6),
(230, 106, 13, '*Disney y STAR+* (Etcnetflix010@gmail.com)', 'Etcnetflix010@gmail.com  nyc676', 6, NULL, 1, NULL, 18, NULL, 0, 'A', '2024-02-22', '2024-05-22', '2024-04-05', '2024-02-22', 3, 2, 1, 0),
(231, 79, 15, '*Prime Video*', 'Abuenahorabuenamusicamx@yahoo.com	ADN735', 1.25, NULL, 1, NULL, 7.5, NULL, 0, 'A', '2023-09-06', '2024-03-06', NULL, '2024-03-02', 6, 2, 1, 0),
(232, 75, 15, '*Prime Video*', 'lampard8.1998@hotmail.com	lampard12345', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-09-14', '2024-03-14', NULL, '2024-02-22', 6, 2, 1, 0),
(233, 69, 15, '*Prime Video*', 'jsebmorales@gmail.com	MJseb,8', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-09-14', '2024-03-14', NULL, '2024-02-22', 6, 2, 1, 0),
(234, 41, 15, '*Prime Video*', 'cris.gabicho223635@gmail.com	Cris.2236', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-09-24', '2024-03-24', NULL, '2024-02-22', 6, 2, 1, 0),
(235, 8, 15, '*Prime Video*', 'primetest01@sh.asedinfo.com	  primevideo01', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-04', '2024-04-04', NULL, '2024-02-22', 6, 2, 1, 0),
(236, 40, 15, '*Prime Video* (alexfrank79@hotmail.com)', 'alexfrank79@hotmail.com  PRIME7879video', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-12', '2024-04-12', NULL, '2024-02-22', 6, 2, 1, 0),
(237, 94, 15, '*Prime Video* (primev001@sh.asedinfo.com)', 'primev001@sh.asedinfo.com	penta878755', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-19', '2024-04-19', NULL, '2024-02-22', 6, 2, 1, 0),
(238, 70, 15, '*Prime Video*', 'transportecuentas@gmail.com	EDU2023ca', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-20', '2024-04-20', NULL, '2024-02-22', 6, 2, 1, 0),
(239, 64, 15, '*Prime Video*', 'primev002@sh.asedinfo.com	Noah-201879', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-20', '2024-04-20', NULL, '2024-02-22', 6, 2, 1, 0),
(240, 65, 15, '*Prime Video*', 'primev003@sh.asedinfo.com	Pr1m32023', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-20', '2024-04-20', NULL, '2024-02-22', 6, 2, 1, 0),
(241, 18, 15, '*Prime Video* (primev004@sh.asedinfo.com)', 'primev004@sh.asedinfo.com	Pisca2460@', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-20', '2024-04-20', NULL, '2024-02-22', 6, 2, 1, 0),
(242, 24, 15, '*Prime Video*', 'primev005@sh.asedinfo.com	CHIRIPA0610', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-20', '2024-04-20', NULL, '2024-02-22', 6, 2, 1, 0),
(243, 66, 15, '*Prime Video*', 'primev006@sh.asedinfo.com	metro2024', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-25', '2024-04-25', NULL, '2024-02-22', 6, 2, 1, 0),
(244, 97, 15, '*Prime Video*', 'primev008@sh.asedinfo.com	Juandis20*', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-11-04', '2024-05-04', NULL, '2024-02-22', 6, 2, 1, 0),
(245, 67, 15, '*Prime Video*', 'primev009@sh.asedinfo.com	primevideo23', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-11-06', '2024-05-06', NULL, '2024-02-22', 6, 2, 1, 0),
(246, 94, 15, '*Prime Video* (primev011@sh.asedinfo.com)', 'primev011@sh.asedinfo.com	primE.425', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-11-20', '2024-05-20', NULL, '2024-02-22', 6, 2, 1, 0),
(247, 40, 15, '*Prime Video* (alexfranks7@yahoo.es)', 'alexfranks7@yahoo.es	PRIME7879video', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-11-20', '2024-05-20', NULL, '2024-02-22', 6, 2, 1, 0),
(248, 18, 15, '*Prime Video* (primev012@sh.asedinfo.com)', 'primev012@sh.asedinfo.com	Prime.215', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-12-05', '2024-06-05', NULL, '2024-02-22', 6, 2, 1, 0),
(249, 71, 15, '*Prime Video*', 'primev013@sh.asedinfo.com	Prime2023*', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-12-14', '2024-06-14', NULL, '2024-02-22', 6, 2, 1, 0),
(250, 9, 15, '*Prime Video*', 'primev014@sh.asedinfo.com	Gami3891', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-12-20', '2024-06-20', NULL, '2024-02-22', 6, 2, 1, 0),
(251, 62, 15, '*Prime Video*', 'primev015@sh.asedinfo.com	SONNYsonny99', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-12-20', '2024-06-20', NULL, '2024-02-22', 6, 2, 1, 0),
(252, 106, 15, '*Prime Video*', 'etcstore002@gmail.com	Prime.023', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-12-21', '2024-06-21', NULL, '2024-02-22', 6, 2, 1, 0),
(253, 98, 15, '*Prime Video*', 'primev016@sh.asedinfo.com	Prime.839', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-01', '2024-07-01', NULL, '2024-02-22', 6, 2, 1, 0),
(254, 16, 15, '*Prime Video*', 'primev018@sh.asedinfo.com	298807', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-17', '2024-07-17', NULL, '2024-02-22', 6, 2, 1, 0),
(255, 104, 15, '*Prime Video*', 'primev019@sh.asedinfo.com	010883', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-22', '2024-07-22', NULL, '2024-02-22', 6, 2, 1, 0),
(256, 94, 15, '*Prime Video* (primev020@sh.asedinfo.com)', 'primev020@sh.asedinfo.com	cinema4829@', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-26', '2024-07-26', NULL, '2024-02-22', 6, 2, 1, 0),
(257, 34, 15, '*Prime Video*', 'primev021@sh.asedinfo.com	Emi150220.', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-27', '2024-07-27', NULL, '2024-02-22', 6, 2, 1, 0),
(258, 95, 15, '*Prime Video*', 'primev022@sh.asedinfo.com	Prime2024*', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-28', '2024-07-28', NULL, '2024-02-22', 6, 2, 1, 0),
(259, 8, 15, '*Prime Video* (primev023@sh.asedinfo.com)', 'primev023@sh.asedinfo.com	daniel1991*', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-30', '2024-07-30', NULL, '2024-02-22', 6, 2, 1, 0),
(260, 103, 15, '*Prime Video*', 'primev025@sh.asedinfo.com	Saturno2020', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-02-05', '2024-08-05', NULL, '2024-02-22', 6, 2, 1, 0),
(261, 18, 15, '*Prime Video* (primev026@sh.asedinfo.com)', 'primev026@sh.asedinfo.com	123456', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-02-11', '2024-08-11', NULL, '2024-02-22', 6, 2, 1, 0),
(262, 97, 15, '*Prime Video* (primev027@sh.asedinfo.com)', 'primev027@sh.asedinfo.com	Gabyta*', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-02-20', '2024-08-20', NULL, '2024-02-22', 6, 2, 1, 0),
(263, 107, 15, '*Prime Video* (popote.castillo@gmail.com)', 'popote.castillo@gmail.com	canal8080', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-09-29', '2024-03-29', NULL, '2024-02-22', 6, 2, 1, 0),
(264, 107, 15, '*Prime Video* (roketsx.2023@gmail.com)', 'roketsx.2023@gmail.com	prime123@', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2023-10-02', '2024-04-02', NULL, '2024-02-22', 6, 2, 1, 0),
(265, 108, 15, '*Prime Video* (primev007@sh.asedinfo.com)', 'primev007@sh.asedinfo.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2023-10-25', '2024-04-25', NULL, '2024-02-22', 6, 2, 1, 0),
(266, 108, 15, '*Prime Video* (gerald@webwonderss.com)', 'gerald@webwonderss.com	Cuenta10234', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2023-11-05', '2024-05-05', NULL, '2024-02-22', 6, 2, 1, 0),
(267, 108, 15, '*Prime Video* (croraso2@webwonderss.com)', 'croraso2@webwonderss.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2023-12-01', '2024-06-01', NULL, '2024-02-22', 6, 2, 1, 0),
(268, 108, 15, '*Prime Video* (ilastre@webwonderss.com)', 'ilastre@webwonderss.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2023-12-07', '2024-06-07', NULL, '2024-02-22', 6, 2, 1, 0),
(269, 108, 15, '*Prime Video* (fernandorteg2611@gmail.com)', 'fernandorteg2611@gmail.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2023-12-11', '2024-06-11', NULL, '2024-02-22', 6, 2, 1, 0),
(270, 108, 15, '*Prime Video* (jugegrte@webwonderss.com)', 'jugegrte@webwonderss.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2023-12-15', '2024-06-15', NULL, '2024-02-22', 6, 2, 1, 0),
(271, 108, 15, '*Prime Video* (trueque@webwonderss.com)', 'trueque@webwonderss.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2023-12-19', '2024-06-19', NULL, '2024-02-22', 6, 2, 1, 0),
(272, 108, 15, '*Prime Video* (3meshbo@webwonderss.com)', '3meshbo@webwonderss.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2023-12-19', '2024-06-19', NULL, '2024-02-22', 6, 2, 1, 0),
(273, 108, 15, '*Prime Video* (teresaguadalupe931@gmail.com)', 'teresaguadalupe931@gmail.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2024-01-05', '2024-07-05', NULL, '2024-02-22', 6, 2, 1, 0),
(274, 107, 15, '*Prime Video* (primev017@sh.asedinfo.com)', 'primev017@sh.asedinfo.com	canal8080', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-01-14', '2024-07-14', NULL, '2024-02-22', 6, 2, 1, 0),
(275, 108, 15, '*Prime Video* (teresaguadalupe931@gmail.com)', 'teresaguadalupe931@gmail.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2024-01-21', '2024-07-21', NULL, '2024-02-22', 6, 2, 1, 0),
(276, 108, 15, '*Prime Video* (edisonguevara135@gmail.com)', 'edisonguevara135@gmail.com	123456', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2024-02-19', '2024-08-19', NULL, '2024-02-22', 6, 2, 1, 0),
(277, 107, 15, '*Prime Video* (primev024@sh.asedinfo.com)', 'primev024@sh.asedinfo.com	Prime2023', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-02-05', '2024-08-05', NULL, '2024-02-22', 6, 2, 1, 0),
(278, 108, 13, '*Disney y STAR+* (trueque@webwonderss.com)', 'trueque@webwonderss.com  Arka4321#@', 6, NULL, 1, NULL, 18, NULL, 0, 'A', '2024-02-23', '2024-05-23', '2024-04-06', '2024-02-24', 3, 2, 1, 0),
(279, 76, 10, '*Netflix*', 'saularmas669@gmail.com	Nuevacontraseña2121', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-25', '2024-03-25', '2024-03-11', '2024-02-27', 1, 2, 1, 0),
(280, 49, 10, '*Netflix* (carlos.saquinaula83@gmail.com)', 'carlos.saquinaula83@gmail.com	IsAAc130116', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-25', '2024-03-25', '2024-03-10', '2024-02-26', 1, 2, 1, 0),
(281, 52, 10, '*Netflix*', 'monica.dutan082@gmail.com	luzyugsi2021', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-02-29', '2024-03-29', '2024-03-08', '2024-02-26', 1, 2, 1, 0),
(282, 31, 1, '*Netflix* (2 pantallas)', 'info@asedinfo.com	Net3279', 3.67, NULL, 2, NULL, 44.04, NULL, 0, 'A', '2024-03-02', '2024-09-02', NULL, '2024-03-03', 6, 2, 1, 0),
(283, 18, 4, '*MagisTV* (CRivera171)', 'CRivera171	MagS483', 4.5, NULL, 1, NULL, 4.5, NULL, 0, 'A', '2024-02-26', '2024-03-26', NULL, '2024-02-26', 1, 2, 1, 0),
(284, 75, 20, '*IPTV, STAR+ y Netflix*', 'ai040mriva 3YNfUX7qrU  dsplus@asedinfo.com	netflix06@asedinfo.com', 17, NULL, 1, NULL, 17, NULL, 0, 'A', '2024-02-25', '2024-03-25', NULL, '2024-02-27', 1, 2, 1, 0),
(285, 18, 21, '*Disney* (disneyplus@asedinfo.com)', 'disneyplus@asedinfo.com    DisneY3385', 5, NULL, 1, NULL, 5, NULL, 0, 'A', '2024-02-27', '2024-03-27', '2024-04-10', '2024-02-27', 1, 2, 1, 0),
(286, 56, 10, '*Netflix* (ramiro.gahona@hotmail.com)', 'ramiro.gahona@hotmail.com	EmeleC583961', 10.5, NULL, 1, NULL, 10.5, NULL, 0, 'A', '2024-02-29', '2024-03-29', '2024-03-12', '2024-02-28', 1, 2, 1, 0),
(287, 68, 13, '*Disney y STAR+*', 'dsplus03@asedinfo.com	Sava.180*', 7.5, NULL, 1, NULL, 7.5, NULL, 0, 'A', '2024-02-19', '2024-03-19', '2024-04-02', '2024-02-27', 1, 2, 1, 0),
(288, 9, 13, '*Disney y STAR+*', 'dsplus12@asedinfo.com	Ambato2024', 6, NULL, 1, NULL, 18, NULL, 0, 'A', '2024-02-27', '2024-05-27', '2024-04-10', '2024-02-27', 3, 2, 1, 0);
INSERT INTO `cat_transaccion` (`codigo`, `cod_cliente`, `cod_producto`, `descripcion`, `clave_cuenta`, `precio`, `precio_promocion`, `num_producto`, `num_producto_adicional`, `monto`, `monto_descuento`, `aplica_iva`, `estado`, `fecha_inicio`, `fecha_fin`, `fecha_cambia`, `fecha_registra`, `num_mes`, `cod_modulo`, `cod_operacion`, `num_dias_extra`) VALUES
(289, 18, 4, '*MagisTV* (EFernan175)', 'EFernan175	MagS289', 4.5, NULL, 1, NULL, 4.5, NULL, 0, 'A', '2024-02-27', '2024-03-27', NULL, '2024-02-28', 1, 2, 1, 0),
(290, 23, 5, '*YouTube* (2 cuentas)', 'kevincalderonmadesco@gmail.com	Gela    majithoibrahim@gmail.com	youtasedinfo ', 4, NULL, 1, NULL, 4, NULL, 0, 'A', '2024-03-03', '2024-04-03', NULL, '2024-02-28', 1, 2, 1, 0),
(291, 111, 12, '*Netflix*', 'netflix20@asedinfo.com	Harling*0405', 10, NULL, 1, NULL, 20, NULL, 0, 'A', '2024-02-28', '2024-05-04', '2024-03-14', '2024-02-28', 2, 2, 1, 6),
(292, 29, 1, '*Netflix*', 'info@asedinfo.com	Net3279', 3.5, NULL, 1, NULL, 10.5, NULL, 0, 'A', '2024-03-01', '2024-06-01', NULL, '2024-03-03', 3, 2, 1, 0),
(293, 15, 7, '*Disney*', 'disney.plus@asedinfo.com	DisneY8213', 1.8, NULL, 1, NULL, 10.8, NULL, 0, 'A', '2024-03-01', '2024-09-01', NULL, '2024-02-29', 6, 2, 1, 0),
(294, 15, 15, '*Prime Video*', 'primev028@sh.asedinfo.com  prime123@', 1.6, NULL, 1, NULL, 9.6, NULL, 0, 'A', '2024-03-01', '2024-09-01', NULL, '2024-03-01', 6, 2, 1, 0),
(295, 51, 10, '*Netflix*', 'eliz18yol@hotmail.com	yolyeli.18', 10.5, NULL, 1, NULL, 21, NULL, 0, 'A', '2024-02-28', '2024-04-28', '2024-03-15', '2024-03-01', 2, 2, 1, 0),
(296, 31, 5, '*YouTube*', 'pedroayala99@gmail.com	 Dario', 2.75, NULL, 1, NULL, 33, NULL, 0, 'A', '2024-03-05', '2025-03-05', NULL, '2024-02-29', 12, 2, 1, 0),
(297, 79, 19, '*Netflix* (netflix01)', 'netflix01@asedinfo.com	Net9843', 5.5, NULL, 1, NULL, 5.5, NULL, 0, 'A', '2024-02-04', '2024-03-04', NULL, '2024-03-01', 1, 2, 1, 0),
(298, 94, 10, '*Netflix* (netflix@asedinfo.com)', 'netflix@asedinfo.com	pent7634@', 10.75, NULL, 1, NULL, 10.75, NULL, 0, 'A', '2024-03-01', '2024-04-01', '2024-03-16', '2024-03-02', 1, 2, 1, 0),
(299, 79, 19, '*Netflix* (netflix07)', 'netflix07@asedinfo.com	Net3524', 5.5, NULL, 1, NULL, 5.5, NULL, 0, 'A', '2024-02-04', '2024-03-04', NULL, '2024-03-01', 1, 2, 1, 0),
(300, 34, 27, 'Marco Noboa', '', 1, NULL, 1, NULL, 12, NULL, 0, 'I', '2023-03-01', '2024-03-01', NULL, '2024-03-01', 12, 2, 1, 0),
(301, 20, 5, '*YouTube*', 'guagualoco26@gmail.com	AsedinfoSoporte', 4, NULL, 1, NULL, 4, NULL, 0, 'A', '2024-03-04', '2024-04-04', NULL, '2024-03-01', 1, 2, 1, 0),
(302, 40, 10, '*Netflix* (y.outasedinf.o@gmail.com)', 'y.outasedinf.o@gmail.com	Netflix78', 11, NULL, 1, NULL, 11, NULL, 0, 'A', '2024-03-05', '2024-04-05', '2024-03-04', '2024-03-01', 1, 2, 1, 0),
(303, 97, 15, '*Prime Video* (primev029@sh.asedinfo.com)', 'primev029@sh.asedinfo.com  Deportivo2024', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-03-01', '2024-09-01', NULL, '2024-03-02', 6, 2, 1, 0),
(304, 42, 18, '*Spotify*', 'algc07@hotmail.com   19octubre2018', 1.67, NULL, 1, NULL, 20.04, NULL, 0, 'A', '2024-02-29', '2025-03-01', NULL, '2024-03-02', 12, 2, 1, 0),
(305, 42, 15, '*Prime Video*', 'primev030@sh.asedinfo.com. 19octubre2018', 1.5, NULL, 1, NULL, 9, NULL, 0, 'A', '2024-03-02', '2024-09-02', NULL, '2024-03-02', 6, 2, 1, 0),
(306, 94, 12, '*Netflix* (netflix21@asedinfo.com)', 'netflix21@asedinfo.com	cinema2929@', 10, NULL, 1, NULL, 20, NULL, 0, 'A', '2024-03-02', '2024-05-08', '2024-03-08', '2024-03-02', 2, 2, 1, 6),
(307, 79, 21, '*Disney* (Borrar)', 'borrar', 3, NULL, 0, NULL, 3, NULL, 0, 'R', '2024-04-03', '2024-04-03', NULL, '2024-03-03', 0, 2, 1, 0),
(308, 79, 1, 'borrar', 'borra   112233', 3.66, NULL, 3, NULL, 43.92, NULL, 0, 'I', '2024-03-03', '2025-03-03', NULL, '2024-03-03', 12, 2, 1, 0),
(309, 79, 21, '*Disney* (Borrar)', 'borrar', 3, NULL, 1, NULL, 3, NULL, 0, 'A', '2024-04-03', '2024-05-03', NULL, '2024-03-03', 1, 2, 1, 0),
(310, 82, 14, '*MAX*', 'hbomax002@asedinfo.com	HbomaX9238', 2, NULL, 1, NULL, 6, NULL, 0, 'A', '2024-03-03', '2024-06-03', NULL, '2024-03-03', 3, 2, 1, 0),
(311, 112, 4, '*MagisTV*', 'PGalvez99	Video2024', 3.84, NULL, 1, NULL, 23.04, NULL, 0, 'A', '2024-03-03', '2024-10-03', NULL, '2024-03-03', 6, 2, 1, 30),
(312, 112, 18, '*Spotify*', 'pgalvezquito@hotmail.com  precioso1703', 1.67, NULL, 1, NULL, 20.04, NULL, 0, 'A', '2024-03-03', '2025-03-03', NULL, '2024-03-03', 12, 2, 1, 0),
(313, 18, 1, '*Netflix* (pantalla Alvaro)', 'info@asedinfo.com	Net3279', 3.33, NULL, 1, NULL, 9.99, NULL, 0, 'A', '2024-03-03', '2024-06-03', NULL, '2024-03-03', 3, 2, 1, 0),
(314, 113, 15, '*Prime Video* (primev031@sh.asedinfo.com)', 'primev031@sh.asedinfo.com  admin2024+', 1.17, NULL, 1, NULL, 7.02, NULL, 0, 'A', '2024-03-03', '2024-09-03', NULL, '2024-03-03', 6, 2, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_clientes`
--

CREATE TABLE `data_clientes` (
  `nombre` varchar(120) DEFAULT NULL,
  `identificacion` varchar(120) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `celular` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `data_clientes`
--

INSERT INTO `data_clientes` (`nombre`, `identificacion`, `correo`, `celular`) VALUES
('Cristina Brito', '1717933699', 'mcbritolopez@gmail.com', '31630413275'),
('Juan Perez', '1713905550', 'cogijcp@gmail.com', '0992530322'),
('Lesley Perez', '1718261264', 'lesleygabrielap@hotmail.com', '0960663828'),
('Jorge Aguas', '1722638887', 'dnlwtc@gmail.com', '0983242456'),
('Milton Hilano', '1803752458', 'androtv0420@gmail.com', '0962339655'),
('Mariuxi Obando', '1726352709', 'mariupeke_112@live.com', '0995190359'),
('Sebastian Proano', '1754050696', 'sebasprolo2002@gmail.com', '0983077886'),
('Yorwin Duran', '30058273', 'godlevel05.y@gmail.com', '0984470497'),
('Maribel Cabrera', '1104558752', 'cisnecabrera@gmail.com', '0999047121'),
('Leonardo Rodriguez', '1717217044', 'leoedyy@hotmail.com', '0984381313'),
('Diego Almeida', '1719757930', 'Diego1.dmultimedia@gmail.com', '0982420240'),
('Wendy Acosta', '1721903266', 'alexvaca269@gmail.com', '0985101963'),
('Patricio Yazan', '0401615562', 'patrikc2988@gmail.com', '0939624108'),
('Paola Ruiz', '1720146750', 'alexa_54_@hotmail.com', '0987143102'),
('Alex Vaca', '1712261229', 'alex_vacam@hotmail.com', '0987336066'),
('Lisbeth Ninabanda', '1724975477', 'lisbethninabanda95@gmail.com', '0989063406'),
('Santiago Rivas', '1716193550', 'guagualoco26@gmail.com', '0982495821'),
('Mauricio Sellan', '0926712480', 'xsellan23@gmail.com', '0993157349'),
('Gabriela Hernandez', '1714430996', 'gabyht27@hotmail.com', '34648940340'),
('Kevin Calderon', '0302556337', 'kevincalderonmadesco@gmail.com', '0968404562'),
('Javier Torres', '1711969764', 'Mrjtorress@gmail.com', '0992874901'),
('Pablo Proano', '1721498804', 'pablojasasmh@hotmail.com', '0958627026'),
('Adriana Reinoso', '1713573366', 'adryrei07@hotmail.com', '0983314167'),
('Alfredo Palma', '0922677307', 'palma.docencia1@gmail.com', '0991214089'),
('Santiago Vera', '1720996451', 'zbera1213@gmail.com', '0994312544'),
('Jason Delgado', '1311402927', 'jasondel95@hotmail.com', '0981273647'),
('Carlos Orozco', '1201416920', 'corozcog@hotmail.com', '0999633326'),
('Pedro Ayala', '1713415642', 'pedroayala99@gmail.com', '0984585693'),
('Daniela Miranda', '1719964916', 'danymiranda1213@gmail.com', '0996647143'),
('Juan Bolanos', '1004209910001', 'audiomaxproduccion@gmail.com', '0990863118'),
('Karla Herrera', '1714981766', 'karla.herrera89@hotmail.com', '0984448293'),
('Cesar Tayo', '1708527757', 'cesart_ucl@yahoo.com', '0996803456'),
('Daniel Medina', '1721068136', 'medinadanielsan@gmail.com', '0980013967'),
('Daniel Ramon', '1715381792001', 'danielramon_29@hotmail.com', '0998011887'),
('Rodrigo Rueda', '1750981902', 'rodrigorueda94@gmail.com', '0967484943'),
('Carlos Garcia', '0910460831', 'carlosgarcia1167@hotmail.com', '0987596780'),
('Alex Salcedo', '1714571153', 'alexfrank79@hotmail.com', '0987733303'),
('Cristhian Morales', '1717550287', 'cris_gabicho2236@hotmail.com', '0990767523'),
('Ana Galvez', '0502403173', 'algc07@hotmail.com', '0988464598'),
('Jorge Perez', '1803085636', 'jorgeluislps21@gmail.com', '0980586464'),
('Luis Chacha', '1721109013', 'l_edwar2@hotmail.com', '0998\'0626'),
('Jorge Huilcarema', '1721943254', 'libero2244@hotmail.com', '0992000974'),
('Paul Proano', '1725355729', 'paulprolo@outlook.es', '0995605755'),
('Fares Zuniga', '04817535', 'zunigafares93@gmail.com', '18323199044'),
('Xavier Franco', '0930940218', 'fandres97@hotmail.es', '0994715256'),
('Carlos Saquinaula', '0703769596', 'carlos.saquinaula83@gmail.com', '0991042987'),
('Jorge Yazan', '1003389837', 'vierysjorge@hotmail.com', '0994781065'),
('Yolanda Yugsi', '1722724315', 'eliz18yol@gmail.com', '0961166917'),
('Monica Dutan', '1723624142', 'monica.dutan082@gmail.com', '0960661994'),
('Freddy Arias', '1714784913', 'freddyarias424@hotmail.es', '0987989143'),
('Mauricio Ponce', '1717734956', 'fponceortiz@gmail.com', '0982331629'),
('Sara Abi Riascos', '1724583313', 'Saraabigail1995@hotmail.com', '0984132690'),
('Diego Cadena', '1713212510', 'difecava82@hotmail.com', '0995850712'),
('Carlos Gonzalez', '1104471394', 'carlosdavid.gv@gmail.com', '09882050'),
('Diego Claudio', '0503820805', 'diegoxavier.100@gmail.com', '0995487050'),
('Alejandro Chancusig', '1720692506', 'alejomh17206@yahoo.es', '0995204128'),
('Jefferson Marcillo', '1716879653', 'jeffergoods_10@hotmail.com', '0984736139'),
('Cristian Mina', '1722775978', 'cristian.mina@outlook.es', '0995350938'),
('Gilberto Carroz', '1761790326', 'gilbertocarroz005@gmail.com', '0963248253'),
('Viviana Quevedo', '0704725175', 'vivianaquevedo29@gmail.com', '0997587196'),
('Fabricio Arce', '1723352689', 'alexanderarce592@gmail.com', '0989864128'),
('Jorge Calva', '1721333605', 'dixmh@hotmail.com', '0998544197'),
('Hernan Suarez', '1716870215', 'cre.nfs.cyrus@gmail.com', '0987460920'),
('Hector Paredes', '50381197L', 'hparedesbr@gmail.com', '618494424'),
('Santiago Vasquez', '1804208005', 'santiago_vasquez180@hotmail.com', '0984972790'),
('Juan Morales', '1722723457', 'jsebmorales@gmail.com', '0992723925'),
('Eduardo Carrera', '1708459571', 'ejcarreras68@gmail.com', '0982235444'),
('Jessica Aguilar', '1205621541', 'jlaguilarc2@gmail.com', '0962933685'),
('Kari Leon', '1726270380', 'kari.leon.qx@gmail.com', '0984863884'),
('Cristina Brito', '1717933699', 'mcbritolopez@gmail.com', '31630413275'),
('Juan Perez', '1713905550', 'cogijcp@gmail.com', '0992530322'),
('Lesley Perez', '1718261264', 'lesleygabrielap@hotmail.com', '0960663828'),
('Jorge Aguas', '1722638887', 'dnlwtc@gmail.com', '0983242456'),
('Milton Hilano', '1803752458', 'androtv0420@gmail.com', '0962339655'),
('Mariuxi Obando', '1726352709', 'mariupeke_112@live.com', '0995190359'),
('Sebastian Proano', '1754050696', 'sebasprolo2002@gmail.com', '0983077886'),
('Yorwin Duran', '30058273', 'godlevel05.y@gmail.com', '0984470497'),
('Maribel Cabrera', '1104558752', 'cisnecabrera@gmail.com', '0999047121'),
('Leonardo Rodriguez', '1717217044', 'leoedyy@hotmail.com', '0984381313'),
('Diego Almeida', '1719757930', 'Diego1.dmultimedia@gmail.com', '0982420240'),
('Wendy Acosta', '1721903266', 'alexvaca269@gmail.com', '0985101963'),
('Patricio Yazan', '0401615562', 'patrikc2988@gmail.com', '0939624108'),
('Paola Ruiz', '1720146750', 'alexa_54_@hotmail.com', '0987143102'),
('Alex Vaca', '1712261229', 'alex_vacam@hotmail.com', '0987336066'),
('Lisbeth Ninabanda', '1724975477', 'lisbethninabanda95@gmail.com', '0989063406'),
('Santiago Rivas', '1716193550', 'guagualoco26@gmail.com', '0982495821'),
('Mauricio Sellan', '0926712480', 'xsellan23@gmail.com', '0993157349'),
('Gabriela Hernandez', '1714430996', 'gabyht27@hotmail.com', '34648940340'),
('Kevin Calderon', '0302556337', 'kevincalderonmadesco@gmail.com', '0968404562'),
('Javier Torres', '1711969764', 'Mrjtorress@gmail.com', '0992874901'),
('Pablo Proano', '1721498804', 'pablojasasmh@hotmail.com', '0958627026'),
('Adriana Reinoso', '1713573366', 'adryrei07@hotmail.com', '0983314167'),
('Alfredo Palma', '0922677307', 'palma.docencia1@gmail.com', '0991214089'),
('Santiago Vera', '1720996451', 'zbera1213@gmail.com', '0994312544'),
('Jason Delgado', '1311402927', 'jasondel95@hotmail.com', '0981273647'),
('Carlos Orozco', '1201416920', 'corozcog@hotmail.com', '0999633326'),
('Pedro Ayala', '1713415642', 'pedroayala99@gmail.com', '0984585693'),
('Daniela Miranda', '1719964916', 'danymiranda1213@gmail.com', '0996647143'),
('Juan Bolanos', '1004209910001', 'audiomaxproduccion@gmail.com', '0990863118'),
('Karla Herrera', '1714981766', 'karla.herrera89@hotmail.com', '0984448293'),
('Cesar Tayo', '1708527757', 'cesart_ucl@yahoo.com', '0996803456'),
('Daniel Medina', '1721068136', 'medinadanielsan@gmail.com', '0980013967'),
('Daniel Ramon', '1715381792001', 'danielramon_29@hotmail.com', '0998011887'),
('Rodrigo Rueda', '1750981902', 'rodrigorueda94@gmail.com', '0967484943'),
('Carlos Garcia', '0910460831', 'carlosgarcia1167@hotmail.com', '0987596780'),
('Alex Salcedo', '1714571153', 'alexfrank79@hotmail.com', '0987733303'),
('Cristhian Morales', '1717550287', 'cris_gabicho2236@hotmail.com', '0990767523'),
('Ana Galvez', '0502403173', 'algc07@hotmail.com', '0988464598'),
('Jorge Perez', '1803085636', 'jorgeluislps21@gmail.com', '0980586464'),
('Luis Chacha', '1721109013', 'l_edwar2@hotmail.com', '0998\'0626'),
('Jorge Huilcarema', '1721943254', 'libero2244@hotmail.com', '0992000974'),
('Paul Proano', '1725355729', 'paulprolo@outlook.es', '0995605755'),
('Fares Zuniga', '04817535', 'zunigafares93@gmail.com', '18323199044'),
('Xavier Franco', '0930940218', 'fandres97@hotmail.es', '0994715256'),
('Carlos Saquinaula', '0703769596', 'carlos.saquinaula83@gmail.com', '0991042987'),
('Jorge Yazan', '1003389837', 'vierysjorge@hotmail.com', '0994781065'),
('Yolanda Yugsi', '1722724315', 'eliz18yol@gmail.com', '0961166917'),
('Monica Dutan', '1723624142', 'monica.dutan082@gmail.com', '0960661994'),
('Freddy Arias', '1714784913', 'freddyarias424@hotmail.es', '0987989143'),
('Mauricio Ponce', '1717734956', 'fponceortiz@gmail.com', '0982331629'),
('Sara Abi Riascos', '1724583313', 'Saraabigail1995@hotmail.com', '0984132690'),
('Diego Cadena', '1713212510', 'difecava82@hotmail.com', '0995850712'),
('Carlos Gonzalez', '1104471394', 'carlosdavid.gv@gmail.com', '09882050'),
('Diego Claudio', '0503820805', 'diegoxavier.100@gmail.com', '0995487050'),
('Alejandro Chancusig', '1720692506', 'alejomh17206@yahoo.es', '0995204128'),
('Jefferson Marcillo', '1716879653', 'jeffergoods_10@hotmail.com', '0984736139'),
('Cristian Mina', '1722775978', 'cristian.mina@outlook.es', '0995350938'),
('Gilberto Carroz', '1761790326', 'gilbertocarroz005@gmail.com', '0963248253'),
('Viviana Quevedo', '0704725175', 'vivianaquevedo29@gmail.com', '0997587196'),
('Fabricio Arce', '1723352689', 'alexanderarce592@gmail.com', '0989864128'),
('Jorge Calva', '1721333605', 'dixmh@hotmail.com', '0998544197'),
('Hernan Suarez', '1716870215', 'cre.nfs.cyrus@gmail.com', '0987460920'),
('Hector Paredes', '50381197L', 'hparedesbr@gmail.com', '618494424'),
('Santiago Vasquez', '1804208005', 'santiago_vasquez180@hotmail.com', '0984972790'),
('Juan Morales', '1722723457', 'jsebmorales@gmail.com', '0992723925'),
('Eduardo Carrera', '1708459571', 'ejcarreras68@gmail.com', '0982235444'),
('Jessica Aguilar', '1205621541', 'jlaguilarc2@gmail.com', '0962933685'),
('Kari Leon', '1726270380', 'kari.leon.qx@gmail.com', '0984863884');

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
(2, 2, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-24 11:35:46.666000', NULL, 'A', NULL),
(3, 3, '0f3d014eead934bbdbacb62a01dc4831', '2023-08-28 10:04:17.822000', NULL, 'A', NULL),
(4, 4, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-15 08:14:16.246000', NULL, 'A', NULL),
(28, 5, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 11:37:25.470000', NULL, 'A', NULL),
(29, 6, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 11:37:25.503000', NULL, 'A', NULL),
(30, 5, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 11:39:02.559000', NULL, 'A', NULL),
(31, 6, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 11:39:02.579000', NULL, 'A', NULL),
(32, 7, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 14:49:35.247000', NULL, 'A', NULL),
(33, 8, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 14:49:35.306000', NULL, 'A', NULL),
(34, 7, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 14:59:25.741000', NULL, 'A', NULL),
(35, 8, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 14:59:26.082000', NULL, 'A', NULL),
(36, 7, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 15:27:16.418000', NULL, 'A', NULL),
(37, 8, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 15:27:16.526000', NULL, 'A', NULL),
(38, 9, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 15:27:16.563000', NULL, 'A', NULL),
(39, 10, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 15:27:16.591000', NULL, 'A', NULL),
(40, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:29:34.664000', NULL, 'A', NULL),
(41, 12, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:29:34.694000', NULL, 'A', NULL),
(42, 9, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:29:34.725000', NULL, 'A', NULL),
(43, 10, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:29:34.754000', NULL, 'A', NULL),
(44, 13, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:29:34.775000', NULL, 'A', NULL),
(45, 14, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:29:34.796000', NULL, 'A', NULL),
(46, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:34:54.267000', NULL, 'A', NULL),
(47, 12, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:34:54.287000', NULL, 'A', NULL),
(48, 9, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:34:54.304000', NULL, 'A', NULL),
(49, 10, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:34:54.322000', NULL, 'A', NULL),
(50, 13, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:34:54.342000', NULL, 'A', NULL),
(51, 14, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 16:34:54.363000', NULL, 'A', NULL),
(52, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 21:42:45.048000', NULL, 'A', NULL),
(53, 15, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 21:42:45.118000', NULL, 'A', NULL),
(54, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 21:44:18.529000', NULL, 'A', NULL),
(55, 15, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-28 21:44:18.581000', NULL, 'A', NULL),
(56, 9, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 09:52:20.831000', NULL, 'A', NULL),
(57, 10, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 09:52:20.858000', NULL, 'A', NULL),
(58, 13, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 09:52:20.881000', NULL, 'A', NULL),
(59, 14, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 09:52:20.917000', NULL, 'A', NULL),
(60, 16, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 09:52:20.944000', NULL, 'A', NULL),
(61, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:02:13.450000', NULL, 'A', NULL),
(62, 17, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:02:13.483000', NULL, 'A', NULL),
(63, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:06:04.679000', NULL, 'A', NULL),
(64, 17, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:06:04.714000', NULL, 'A', NULL),
(65, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:09:40.691000', NULL, 'A', NULL),
(66, 18, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:09:40.723000', NULL, 'A', NULL),
(67, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:17:13.301000', NULL, 'A', NULL),
(68, 19, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:17:13.328000', NULL, 'A', NULL),
(69, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:18:55.863000', NULL, 'A', NULL),
(70, 19, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:18:55.910000', NULL, 'A', NULL),
(71, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:19:33.024000', NULL, 'A', NULL),
(72, 19, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:19:33.045000', NULL, 'A', NULL),
(73, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:30:03.516000', NULL, 'A', NULL),
(74, 20, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:30:03.563000', NULL, 'A', NULL),
(75, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:44:20.979000', NULL, 'A', NULL),
(76, 21, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:44:21.005000', NULL, 'A', NULL),
(77, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:48:59.595000', NULL, 'A', NULL),
(78, 22, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 14:48:59.617000', NULL, 'A', NULL),
(79, 9, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 16:14:33.309000', NULL, 'A', NULL),
(80, 10, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 16:14:33.374000', NULL, 'A', NULL),
(81, 13, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 16:14:33.417000', NULL, 'A', NULL),
(82, 14, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 16:14:33.468000', NULL, 'A', NULL),
(83, 16, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 16:14:33.508000', NULL, 'A', NULL),
(84, 23, '0f3d014eead934bbdbacb62a01dc4831', '2024-02-29 16:14:33.552000', NULL, 'A', NULL),
(85, 9, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 08:20:17.112000', NULL, 'A', NULL),
(86, 10, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 08:20:17.159000', NULL, 'A', NULL),
(87, 13, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 08:20:17.190000', NULL, 'A', NULL),
(88, 14, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 08:20:17.213000', NULL, 'A', NULL),
(89, 16, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 08:20:17.273000', NULL, 'A', NULL),
(90, 23, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 08:20:17.309000', NULL, 'A', NULL),
(91, 24, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 08:20:17.388000', NULL, 'A', NULL),
(92, 11, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:27:03.032000', NULL, 'A', NULL),
(93, 9, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:31:19.691000', NULL, 'A', NULL),
(94, 10, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:31:19.714000', NULL, 'A', NULL),
(95, 13, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:31:19.736000', NULL, 'A', NULL),
(96, 14, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:31:19.761000', NULL, 'A', NULL),
(97, 16, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:31:19.785000', NULL, 'A', NULL),
(98, 23, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:31:19.815000', NULL, 'A', NULL),
(99, 24, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:31:19.838000', NULL, 'A', NULL),
(100, 25, '0f3d014eead934bbdbacb62a01dc4831', '2024-03-01 19:31:19.877000', NULL, 'A', NULL);

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
(1, 'Seguridad', 'Administración', '#', NULL, '1', 'A', 1),
(2, 'Aplicación', 'Administración de Aplicación', 'pages/seguridad/aplicacion', 1, '2', 'A', 1),
(3, 'Recursos por Rol', 'Asignación de Recursos por Rol', 'pages/seguridad/rolAplicacionRecurso', 1, '2', 'A', 1),
(4, 'Sede', 'Administración de Sede', 'pages/seguridad/sede', 1, '2', 'A', 1),
(5, 'Recurso', 'Administración de Recurso', 'pages/seguridad/recurso', 1, '2', 'A', 1),
(6, 'Rol por Aplicación', 'Administración de Rol por Aplicación', 'pages/seguridad/rolAplicacion', 1, '2', 'A', 1),
(7, 'Usuarios', 'Administración de Usuarios', 'pages/seguridad/usuario', 1, '2', 'A', 1),
(8, 'Usuario Rol Aplicación', 'Usuario por Roly por Aplicación', 'pages/seguridad/usuarioRolAplicacion', 1, '2', 'A', 1),
(9, 'Venta', 'Administración Venta', '#', NULL, '1', 'A', 2),
(10, 'Cliente', 'Gestión datos cliente', 'pages/venta/cliente', 9, '2', 'A', 2),
(11, 'Ahorro', 'Administración Ahorro', '#', NULL, '1', 'A', 3),
(12, 'Datos Socio', 'Gestión datos socio', 'pages/ahorro/socio', 11, '2', 'A', 3),
(13, 'Catálogo', 'Catálogo', '#', NULL, '1', 'A', 4),
(14, 'Persona', 'Gestión datos persona', '/pages/catalogo/persona', 13, '2', 'A', 4),
(15, 'Producto', 'Gestión datos producto', '/pages/catalogo/producto', 13, '2', 'A', 4),
(16, 'Transacción', 'Gestión datos transacción', '/pages/venta/transaccion', 9, '2', 'A', 2),
(17, 'Competencia', 'Administración Competencia', '#', NULL, '1', 'A', 5),
(18, 'Participante', 'Gestión datos participante', 'pages/competencia/participante', 17, '2', 'A', 5),
(19, 'Puntaje', 'Gestión datos puntaje', 'pages/competencia/puntaje', 17, '2', 'A', 5),
(20, 'Categoría', 'Gestión datos categoría', '/pages/catalogo/categoria', 13, '2', 'A', 4),
(21, 'Subcategoría', 'Gestión datos subcategoría', '/pages/catalogo/subcategoria', 13, '2', 'A', 4),
(22, 'Parámetro', 'Parámetro', '/pages/catalogo/parametro', 13, '2', 'A', 4),
(23, 'Resultado', 'Gestión resultado', '/pages/competencia/resultado', 17, '2', 'A', 5),
(24, 'Estado', 'Estado del desarrollo de la Competencia', 'pages/competencia/estado', 17, '2', 'A', 5),
(25, 'Sorteo', 'Generar número del competidor', 'pages/competencia/sorteo', 17, '2', 'A', 5);

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
(37, 10, 23, 'A'),
(38, 10, 24, 'A'),
(39, 10, 25, 'A');

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
(4, 141, 'NO', 'NO', 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 145, 'NO', 'NO', 'A', NULL, '2024-02-28 15:27:16.519000', NULL, NULL, NULL, NULL, NULL),
(9, 146, 'NO', 'NO', 'A', NULL, '2024-03-01 19:31:19.687000', NULL, NULL, NULL, NULL, NULL),
(10, 147, 'NO', 'NO', 'A', NULL, '2024-03-01 19:31:19.709000', NULL, NULL, NULL, NULL, NULL),
(11, 149, 'NO', 'NO', 'A', NULL, '2024-03-01 19:27:03.022000', NULL, NULL, NULL, NULL, NULL),
(13, 151, 'NO', 'NO', 'A', NULL, '2024-03-01 19:31:19.731000', NULL, NULL, NULL, NULL, NULL),
(14, 152, 'NO', 'NO', 'A', NULL, '2024-03-01 19:31:19.756000', NULL, NULL, NULL, NULL, NULL),
(16, 154, 'NO', 'NO', 'A', NULL, '2024-03-01 19:31:19.778000', NULL, NULL, NULL, NULL, NULL),
(23, 161, 'NO', 'NO', 'A', NULL, '2024-03-01 19:31:19.811000', NULL, NULL, NULL, NULL, NULL),
(24, 162, 'NO', 'NO', 'A', NULL, '2024-03-01 19:31:19.831000', NULL, NULL, NULL, NULL, NULL),
(25, 163, 'NO', 'NO', 'A', NULL, '2024-03-01 19:31:19.870000', NULL, NULL, NULL, NULL, NULL);

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
(1, 1, 'A', NULL, '0.0.0.0', '1', '2023-07-19 12:33:30.000000', NULL, NULL),
(2, 2, 'A', NULL, '0.0.0.0', '1', '2023-07-25 11:01:20.799000', NULL, NULL),
(3, 3, 'A', NULL, '0.0.0.0', '1', '2023-07-25 11:02:55.988000', NULL, NULL),
(4, 2, 'A', NULL, '0.0.0.0', '1', '2023-07-25 11:19:39.347000', NULL, NULL),
(5, 2, 'A', NULL, '0.0.0.0', '1', '2023-07-25 11:19:53.716000', NULL, NULL),
(6, 1, 'A', NULL, '0.0.0.0', '1', '2023-07-28 16:42:46.443000', NULL, NULL),
(7, 1, 'A', NULL, '0.0.0.0', '1', '2023-07-28 16:45:18.596000', NULL, NULL),
(8, 1, 'A', NULL, '0.0.0.0', '1', '2023-07-28 16:46:48.639000', NULL, NULL),
(9, 2, 'A', NULL, '0.0.0.0', '1', '2023-07-31 09:50:46.735000', NULL, NULL),
(10, 1, 'A', NULL, '0.0.0.0', '1', '2023-07-31 10:01:26.629000', NULL, NULL),
(11, 3, 'A', NULL, '0.0.0.0', '1', '2023-07-31 10:03:01.272000', NULL, NULL),
(12, 4, 'A', NULL, '0.0.0.0', '1', '2023-07-31 10:17:51.553000', NULL, NULL),
(13, 5, 'A', NULL, '0.0.0.0', '1', '2023-07-31 10:20:53.272000', NULL, NULL),
(14, 6, 'A', NULL, '0.0.0.0', '1', '2023-07-31 10:30:43.218000', NULL, NULL),
(15, 6, 'A', NULL, '0.0.0.0', '1', '2023-07-31 10:36:34.431000', NULL, NULL),
(16, 6, 'A', NULL, '0.0.0.0', '1', '2023-07-31 10:36:49.400000', NULL, NULL),
(17, 1, 'A', NULL, '0.0.0.0', '1', '2023-07-31 14:46:14.869000', NULL, NULL),
(18, 1, 'A', NULL, '0.0.0.0', '1', '2023-08-20 12:10:21.824000', NULL, NULL),
(19, 1, 'A', NULL, '0.0.0.0', '1', '2023-08-20 12:46:29.003000', NULL, NULL),
(20, 1, 'A', NULL, '0.0.0.0', '1', '2023-08-20 12:46:37.986000', NULL, NULL),
(21, 7, 'A', NULL, '0.0.0.0', '1', '2023-08-21 10:43:39.982000', NULL, NULL),
(22, 7, 'A', NULL, '0.0.0.0', '1', '2023-08-21 10:44:17.789000', NULL, NULL),
(23, 2, 'A', NULL, '0.0.0.0', '1', '2023-08-24 11:35:46.941000', NULL, NULL),
(24, 3, 'A', NULL, '0.0.0.0', '1', '2023-08-28 10:04:17.959000', NULL, NULL),
(25, 4, 'A', NULL, '0.0.0.0', '1', '2023-12-04 10:09:51.018000', NULL, NULL),
(26, 6, 'A', NULL, '0.0.0.0', '1', '2023-12-04 10:33:15.916000', NULL, NULL),
(27, 7, 'A', NULL, '0.0.0.0', '1', '2023-12-04 10:33:16.169000', NULL, NULL),
(28, 8, 'A', NULL, '0.0.0.0', '1', '2023-12-04 10:52:14.057000', NULL, NULL),
(29, 9, 'A', NULL, '0.0.0.0', '1', '2023-12-04 11:16:25.513000', NULL, NULL),
(30, 9, 'A', NULL, '0.0.0.0', '1', '2023-12-04 11:18:10.133000', NULL, NULL),
(31, 10, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:12:20.241000', NULL, NULL),
(32, 11, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:20:39.401000', NULL, NULL),
(33, 12, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:20:39.913000', NULL, NULL),
(34, 13, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:20:40.229000', NULL, NULL),
(35, 13, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:20:41.026000', NULL, NULL),
(36, 14, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:20:41.368000', NULL, NULL),
(37, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:20:41.773000', NULL, NULL),
(38, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:20:41.993000', NULL, NULL),
(39, 16, 'A', NULL, '0.0.0.0', '1', '2023-12-15 12:20:42.247000', NULL, NULL),
(40, 17, 'A', NULL, '0.0.0.0', '1', '2023-12-15 14:58:24.329000', NULL, NULL),
(41, 12, 'A', NULL, '0.0.0.0', '1', '2023-12-15 14:58:24.764000', NULL, NULL),
(42, 13, 'A', NULL, '0.0.0.0', '1', '2023-12-15 14:58:24.979000', NULL, NULL),
(43, 13, 'A', NULL, '0.0.0.0', '1', '2023-12-15 14:58:25.171000', NULL, NULL),
(44, 14, 'A', NULL, '0.0.0.0', '1', '2023-12-15 14:58:25.354000', NULL, NULL),
(45, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-15 14:58:25.514000', NULL, NULL),
(46, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-15 14:58:25.762000', NULL, NULL),
(47, 18, 'A', NULL, '0.0.0.0', '1', '2023-12-15 14:58:26.006000', NULL, NULL),
(48, 19, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:37:59.668000', NULL, NULL),
(49, 12, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:37:59.932000', NULL, NULL),
(50, 13, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:38:00.136000', NULL, NULL),
(51, 14, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:38:00.329000', NULL, NULL),
(52, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:38:00.683000', NULL, NULL),
(53, 20, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:38:00.904000', NULL, NULL),
(54, 21, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:52:27.273000', NULL, NULL),
(55, 12, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:52:27.547000', NULL, NULL),
(56, 13, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:52:27.707000', NULL, NULL),
(57, 14, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:52:27.879000', NULL, NULL),
(58, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:52:28.151000', NULL, NULL),
(59, 22, 'A', NULL, '0.0.0.0', '1', '2023-12-15 15:52:28.370000', NULL, NULL),
(60, 23, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:00:40.973000', NULL, NULL),
(61, 12, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:00:41.236000', NULL, NULL),
(62, 13, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:00:41.407000', NULL, NULL),
(63, 14, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:00:41.724000', NULL, NULL),
(64, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:00:41.927000', NULL, NULL),
(65, 24, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:00:42.125000', NULL, NULL),
(66, 25, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:29:58.270000', NULL, NULL),
(67, 12, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:29:58.685000', NULL, NULL),
(68, 13, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:29:58.948000', NULL, NULL),
(69, 14, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:29:59.200000', NULL, NULL),
(70, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:29:59.393000', NULL, NULL),
(71, 26, 'A', NULL, '0.0.0.0', '1', '2023-12-15 16:29:59.602000', NULL, NULL),
(72, 27, 'A', NULL, '0.0.0.0', '1', '2023-12-18 12:32:24.533000', NULL, NULL),
(73, 12, 'A', NULL, '0.0.0.0', '1', '2023-12-18 12:32:24.924000', NULL, NULL),
(74, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-18 12:32:25.371000', NULL, NULL),
(75, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-18 12:32:25.570000', NULL, NULL),
(76, 28, 'A', NULL, '0.0.0.0', '1', '2023-12-18 14:53:01.041000', NULL, NULL),
(77, 12, 'A', NULL, '0.0.0.0', '1', '2023-12-18 14:53:01.338000', NULL, NULL),
(78, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-18 14:53:01.549000', NULL, NULL),
(79, 15, 'A', NULL, '0.0.0.0', '1', '2023-12-18 14:53:01.758000', NULL, NULL),
(80, 29, 'A', NULL, '0.0.0.0', '1', '2024-01-09 10:56:50.956000', NULL, NULL),
(81, 29, 'A', NULL, '0.0.0.0', '1', '2024-01-09 10:58:15.160000', NULL, NULL),
(82, 29, 'A', NULL, '0.0.0.0', '1', '2024-01-09 14:02:15.386000', NULL, NULL),
(83, 29, 'A', NULL, '0.0.0.0', '1', '2024-01-09 14:37:42.638000', NULL, NULL),
(84, 29, 'A', NULL, '0.0.0.0', '1', '2024-01-09 14:38:35.102000', NULL, NULL),
(85, 4, 'A', NULL, '0.0.0.0', '1', '2024-02-15 08:14:16.258000', NULL, NULL),
(86, 4, 'A', NULL, '0.0.0.0', '1', '2024-02-15 08:14:35.256000', NULL, NULL),
(87, 4, 'A', NULL, '0.0.0.0', '1', '2024-02-15 08:21:27.649000', NULL, NULL),
(88, 5, 'A', NULL, '0.0.0.0', '1', '2024-02-15 09:26:03.440000', NULL, NULL),
(89, 6, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:29:41.887000', NULL, NULL),
(90, 6, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:29:55.734000', NULL, NULL),
(91, 6, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:31:03.285000', NULL, NULL),
(92, 6, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:35:40.885000', NULL, NULL),
(93, 7, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:44:31.930000', NULL, NULL),
(94, 7, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:44:31.969000', NULL, NULL),
(95, 8, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:44:32.029000', NULL, NULL),
(96, 9, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:53:08.873000', NULL, NULL),
(97, 10, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:53:08.905000', NULL, NULL),
(98, 9, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:59:08.759000', NULL, NULL),
(99, 10, 'A', NULL, '0.0.0.0', '1', '2024-02-21 21:59:08.785000', NULL, NULL),
(100, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-21 22:04:01.771000', NULL, NULL),
(101, 10, 'A', NULL, '0.0.0.0', '1', '2024-02-21 22:04:01.793000', NULL, NULL),
(102, 12, 'A', NULL, '0.0.0.0', '1', '2024-02-24 19:59:02.274000', NULL, NULL),
(103, 13, 'A', NULL, '0.0.0.0', '1', '2024-02-24 19:59:02.374000', NULL, NULL),
(104, 14, 'A', NULL, '0.0.0.0', '1', '2024-02-26 12:16:43.306000', NULL, NULL),
(105, 15, 'A', NULL, '0.0.0.0', '1', '2024-02-26 12:16:43.385000', NULL, NULL),
(106, 14, 'A', NULL, '0.0.0.0', '1', '2024-02-26 12:16:55.234000', NULL, NULL),
(107, 15, 'A', NULL, '0.0.0.0', '1', '2024-02-26 12:16:55.292000', NULL, NULL),
(108, 16, 'A', NULL, '0.0.0.0', '1', '2024-02-27 12:17:55.708000', NULL, NULL),
(109, 5, 'A', NULL, '0.0.0.0', '1', '2024-02-28 11:37:25.480000', NULL, NULL),
(110, 6, 'A', NULL, '0.0.0.0', '1', '2024-02-28 11:37:25.505000', NULL, NULL),
(111, 5, 'A', NULL, '0.0.0.0', '1', '2024-02-28 11:39:02.561000', NULL, NULL),
(112, 6, 'A', NULL, '0.0.0.0', '1', '2024-02-28 11:39:02.580000', NULL, NULL),
(113, 7, 'A', NULL, '0.0.0.0', '1', '2024-02-28 14:49:35.257000', NULL, NULL),
(114, 8, 'A', NULL, '0.0.0.0', '1', '2024-02-28 14:49:35.308000', NULL, NULL),
(115, 7, 'A', NULL, '0.0.0.0', '1', '2024-02-28 14:59:26.033000', NULL, NULL),
(116, 8, 'A', NULL, '0.0.0.0', '1', '2024-02-28 14:59:26.084000', NULL, NULL),
(117, 7, 'A', NULL, '0.0.0.0', '1', '2024-02-28 15:27:16.434000', NULL, NULL),
(118, 8, 'A', NULL, '0.0.0.0', '1', '2024-02-28 15:27:16.529000', NULL, NULL),
(119, 9, 'A', NULL, '0.0.0.0', '1', '2024-02-28 15:27:16.565000', NULL, NULL),
(120, 10, 'A', NULL, '0.0.0.0', '1', '2024-02-28 15:27:16.595000', NULL, NULL),
(121, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:29:34.668000', NULL, NULL),
(122, 12, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:29:34.697000', NULL, NULL),
(123, 9, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:29:34.728000', NULL, NULL),
(124, 10, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:29:34.755000', NULL, NULL),
(125, 13, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:29:34.776000', NULL, NULL),
(126, 14, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:29:34.798000', NULL, NULL),
(127, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:34:54.270000', NULL, NULL),
(128, 12, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:34:54.289000', NULL, NULL),
(129, 9, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:34:54.307000', NULL, NULL),
(130, 10, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:34:54.325000', NULL, NULL),
(131, 13, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:34:54.344000', NULL, NULL),
(132, 14, 'A', NULL, '0.0.0.0', '1', '2024-02-28 16:34:54.365000', NULL, NULL),
(133, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-28 21:42:45.061000', NULL, NULL),
(134, 15, 'A', NULL, '0.0.0.0', '1', '2024-02-28 21:42:45.120000', NULL, NULL),
(135, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-28 21:44:18.534000', NULL, NULL),
(136, 15, 'A', NULL, '0.0.0.0', '1', '2024-02-28 21:44:18.585000', NULL, NULL),
(137, 9, 'A', NULL, '0.0.0.0', '1', '2024-02-29 09:52:20.835000', NULL, NULL),
(138, 10, 'A', NULL, '0.0.0.0', '1', '2024-02-29 09:52:20.860000', NULL, NULL),
(139, 13, 'A', NULL, '0.0.0.0', '1', '2024-02-29 09:52:20.883000', NULL, NULL),
(140, 14, 'A', NULL, '0.0.0.0', '1', '2024-02-29 09:52:20.920000', NULL, NULL),
(141, 16, 'A', NULL, '0.0.0.0', '1', '2024-02-29 09:52:20.947000', NULL, NULL),
(142, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:02:13.459000', NULL, NULL),
(143, 17, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:02:13.485000', NULL, NULL),
(144, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:06:04.683000', NULL, NULL),
(145, 17, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:06:04.718000', NULL, NULL),
(146, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:09:40.694000', NULL, NULL),
(147, 18, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:09:40.727000', NULL, NULL),
(148, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:17:13.307000', NULL, NULL),
(149, 19, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:17:13.329000', NULL, NULL),
(150, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:18:55.865000', NULL, NULL),
(151, 19, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:18:55.914000', NULL, NULL),
(152, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:19:33.026000', NULL, NULL),
(153, 19, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:19:33.047000', NULL, NULL),
(154, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:30:03.519000', NULL, NULL),
(155, 20, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:30:03.568000', NULL, NULL),
(156, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:44:20.981000', NULL, NULL),
(157, 21, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:44:21.007000', NULL, NULL),
(158, 11, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:48:59.597000', NULL, NULL),
(159, 22, 'A', NULL, '0.0.0.0', '1', '2024-02-29 14:48:59.619000', NULL, NULL),
(160, 9, 'A', NULL, '0.0.0.0', '1', '2024-02-29 16:14:33.319000', NULL, NULL),
(161, 10, 'A', NULL, '0.0.0.0', '1', '2024-02-29 16:14:33.377000', NULL, NULL),
(162, 13, 'A', NULL, '0.0.0.0', '1', '2024-02-29 16:14:33.422000', NULL, NULL),
(163, 14, 'A', NULL, '0.0.0.0', '1', '2024-02-29 16:14:33.470000', NULL, NULL),
(164, 16, 'A', NULL, '0.0.0.0', '1', '2024-02-29 16:14:33.512000', NULL, NULL),
(165, 23, 'A', NULL, '0.0.0.0', '1', '2024-02-29 16:14:33.555000', NULL, NULL),
(166, 9, 'A', NULL, '0.0.0.0', '1', '2024-03-01 08:20:17.121000', NULL, NULL),
(167, 10, 'A', NULL, '0.0.0.0', '1', '2024-03-01 08:20:17.163000', NULL, NULL),
(168, 13, 'A', NULL, '0.0.0.0', '1', '2024-03-01 08:20:17.193000', NULL, NULL),
(169, 14, 'A', NULL, '0.0.0.0', '1', '2024-03-01 08:20:17.216000', NULL, NULL),
(170, 16, 'A', NULL, '0.0.0.0', '1', '2024-03-01 08:20:17.278000', NULL, NULL),
(171, 23, 'A', NULL, '0.0.0.0', '1', '2024-03-01 08:20:17.312000', NULL, NULL),
(172, 24, 'A', NULL, '0.0.0.0', '1', '2024-03-01 08:20:17.403000', NULL, NULL),
(173, 11, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:27:03.038000', NULL, NULL),
(174, 9, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:31:19.695000', NULL, NULL),
(175, 10, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:31:19.716000', NULL, NULL),
(176, 13, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:31:19.738000', NULL, NULL),
(177, 14, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:31:19.762000', NULL, NULL),
(178, 16, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:31:19.789000', NULL, NULL),
(179, 23, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:31:19.817000', NULL, NULL),
(180, 24, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:31:19.840000', NULL, NULL),
(181, 25, 'A', NULL, '0.0.0.0', '1', '2024-03-01 19:31:19.880000', NULL, NULL);

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
(14, 2, 10, '2023-12-12 10:43:58.181000', '2024-02-28 15:00:55.496000', 'I'),
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
(1, 'regular', '2023-08-21 00:00:00.000000', 1, 'I'),
(2, 'mayorista', '2023-08-25 00:00:00.000000', 2, 'I'),
(3, 'ocasional', '2023-08-28 00:00:00.000000', 3, 'A'),
(4, 'REGULAR', '2024-01-06 05:43:28.003000', 10, 'A'),
(5, 'REGULAR', '2024-01-06 00:00:00.000000', 11, 'A'),
(6, 'REGULAR', '2024-01-06 05:43:27.947000', 12, 'A'),
(7, 'REGULAR', '2024-01-06 05:43:27.961000', 13, 'A'),
(8, 'REGULAR', '2024-01-06 05:43:27.969000', 14, 'A'),
(9, 'REGULAR', '2024-01-06 00:00:00.000000', 15, 'A'),
(10, 'REGULAR', '2024-01-06 05:43:27.984000', 16, 'A'),
(11, 'REGULAR', '2024-01-06 05:43:27.992000', 17, 'A'),
(12, 'REGULAR', '2024-01-06 05:43:28.018000', 18, 'A'),
(13, 'REGULAR', '2024-01-06 05:43:28.026000', 19, 'A'),
(14, 'REGULAR', '2024-01-06 05:43:28.034000', 20, 'A'),
(15, 'REGULAR', '2024-01-06 05:43:28.042000', 21, 'A'),
(16, 'REGULAR', '2024-01-06 05:43:28.049000', 22, 'A'),
(17, 'REGULAR', '2024-01-06 05:43:28.056000', 23, 'A'),
(18, 'REGULAR', '2024-01-06 05:43:28.064000', 24, 'A'),
(19, 'REGULAR', '2024-01-06 05:43:28.072000', 25, 'A'),
(20, 'REGULAR', '2024-01-06 05:43:28.079000', 26, 'A'),
(21, 'REGULAR', '2024-01-06 05:43:28.087000', 27, 'A'),
(22, 'REGULAR', '2024-01-06 05:43:28.094000', 28, 'A'),
(23, 'REGULAR', '2024-01-06 05:43:28.102000', 29, 'A'),
(24, 'REGULAR', '2024-01-06 05:43:28.109000', 30, 'A'),
(25, 'REGULAR', '2024-01-06 05:43:28.117000', 31, 'A'),
(26, 'REGULAR', '2024-01-06 00:00:00.000000', 32, 'A'),
(27, 'REGULAR', '2024-01-06 05:43:28.131000', 33, 'A'),
(28, 'REGULAR', '2024-01-06 05:43:28.139000', 34, 'A'),
(29, 'REGULAR', '2024-01-06 05:43:28.146000', 35, 'A'),
(30, 'REGULAR', '2024-01-06 05:43:28.153000', 36, 'A'),
(31, 'REGULAR', '2024-01-06 05:43:28.160000', 37, 'A'),
(32, 'REGULAR', '2024-01-06 05:43:28.168000', 38, 'A'),
(33, 'REGULAR', '2024-01-06 00:00:00.000000', 39, 'A'),
(34, 'REGULAR', '2024-01-06 05:43:28.185000', 40, 'A'),
(35, 'REGULAR', '2024-01-06 05:43:28.192000', 41, 'A'),
(36, 'REGULAR', '2024-01-06 05:43:28.200000', 42, 'A'),
(37, 'REGULAR', '2024-01-06 05:43:28.207000', 43, 'A'),
(38, 'REGULAR', '2024-01-06 05:43:28.248000', 44, 'A'),
(39, 'REGULAR', '2024-01-06 05:43:28.256000', 45, 'A'),
(40, 'REGULAR', '2024-01-06 05:43:28.264000', 46, 'A'),
(41, 'REGULAR', '2024-01-06 05:43:28.271000', 47, 'A'),
(42, 'REGULAR', '2024-01-06 00:00:00.000000', 48, 'A'),
(43, 'REGULAR', '2024-01-06 05:43:28.286000', 49, 'A'),
(44, 'REGULAR', '2024-01-06 05:43:28.295000', 50, 'I'),
(45, 'REGULAR', '2024-01-06 05:43:28.303000', 51, 'A'),
(46, 'REGULAR', '2024-01-06 05:43:28.311000', 52, 'A'),
(47, 'REGULAR', '2024-01-06 00:00:00.000000', 53, 'A'),
(48, 'REGULAR', '2024-01-06 05:43:28.326000', 54, 'A'),
(49, 'REGULAR', '2024-01-06 00:00:00.000000', 55, 'A'),
(50, 'REGULAR', '2024-01-06 05:43:28.340000', 56, 'A'),
(51, 'REGULAR', '2024-01-06 05:43:28.347000', 57, 'A'),
(52, 'REGULAR', '2024-01-06 05:43:28.363000', 58, 'A'),
(53, 'REGULAR', '2024-01-06 05:43:28.370000', 59, 'A'),
(54, 'REGULAR', '2024-01-06 05:43:28.377000', 60, 'A'),
(55, 'REGULAR', '2024-01-06 05:43:28.384000', 61, 'A'),
(56, 'REGULAR', '2024-01-06 05:43:28.391000', 62, 'A'),
(57, 'REGULAR', '2024-01-06 05:43:28.398000', 63, 'A'),
(58, 'REGULAR', '2024-01-06 05:43:28.405000', 64, 'A'),
(59, 'REGULAR', '2024-01-06 05:43:28.412000', 65, 'A'),
(60, 'REGULAR', '2024-01-06 05:43:28.419000', 66, 'A'),
(61, 'REGULAR', '2024-01-06 05:43:28.431000', 67, 'A'),
(62, 'REGULAR', '2024-01-06 05:43:28.438000', 68, 'A'),
(63, 'REGULAR', '2024-01-06 05:43:28.445000', 69, 'A'),
(64, 'REGULAR', '2024-01-06 05:43:28.452000', 70, 'A'),
(65, 'REGULAR', '2024-01-06 05:43:28.460000', 71, 'A'),
(66, 'REGULAR', '2024-01-06 05:43:28.467000', 72, 'A'),
(67, 'REGULAR', '2024-01-06 00:00:00.000000', 73, 'A'),
(68, 'REGULAR', '2024-01-06 05:43:28.480000', 74, 'A'),
(69, 'REGULAR', '2024-01-06 05:43:28.487000', 75, 'A'),
(70, 'REGULAR', '2024-01-06 05:43:28.495000', 76, 'A'),
(71, 'REGULAR', '2024-01-06 05:43:28.504000', 77, 'A'),
(72, 'REGULAR', '2024-01-06 05:43:28.512000', 78, 'A'),
(73, '', '2024-01-17 00:00:00.000000', 88, 'I'),
(74, 'REGULAR', '2024-01-17 00:00:00.000000', 89, 'A'),
(75, 'REGULAR', '2024-01-22 00:00:00.000000', 90, 'A'),
(76, 'REGULAR', '2024-01-22 00:00:00.000000', 91, 'A'),
(77, 'regular', '2023-08-21 00:00:00.000000', 92, 'I'),
(78, '', '2024-01-24 00:00:00.000000', 93, 'A'),
(79, 'REGULAR', '2024-01-24 00:00:00.000000', 94, 'A'),
(80, 'REGULAR', '2024-01-24 00:00:00.000000', 95, 'A'),
(81, 'REGULAR', '2024-01-24 00:00:00.000000', 96, 'A'),
(82, 'REGULAR', '2024-01-24 00:00:00.000000', 97, 'A'),
(83, 'REGULAR', '2024-01-25 00:00:00.000000', 98, 'A'),
(84, 'TELEGRAM', '2024-01-25 00:00:00.000000', 99, 'A'),
(85, 'TELEGRAM', '2024-01-25 00:00:00.000000', 100, 'A'),
(86, 'REGULAR', '2024-01-25 00:00:00.000000', 101, 'A'),
(87, 'TELEGRAM', '2024-01-25 00:00:00.000000', 102, 'A'),
(88, 'TELEGRAM', '2024-01-25 00:00:00.000000', 103, 'A'),
(89, 'REGULAR', '2024-01-25 00:00:00.000000', 104, 'A'),
(90, 'REGULAR', '2024-01-29 00:00:00.000000', 106, 'A'),
(91, 'REGULAR', '2024-01-29 00:00:00.000000', 105, 'I'),
(92, 'REGULAR', '2024-01-29 00:00:00.000000', 107, 'I'),
(93, 'MAYORISTA', '2024-02-02 00:00:00.000000', 108, 'I'),
(94, 'MAYORISTA', '2024-02-02 00:00:00.000000', 109, 'A'),
(95, 'REGULAR', '2024-02-06 00:00:00.000000', 110, 'A'),
(96, 'REGULAR', '2024-02-06 00:00:00.000000', 111, 'A'),
(97, 'REGULAR', '2024-02-08 00:00:00.000000', 112, 'A'),
(98, 'REGULAR', '2024-02-09 00:00:00.000000', 113, 'A'),
(99, 'MAYORISTA', '2024-02-09 00:00:00.000000', 114, 'A'),
(100, 'REGULAR', '2024-02-09 00:00:00.000000', 115, 'A'),
(101, 'ADMIN', '2024-02-15 00:00:00.000000', 118, 'A'),
(102, 'ADMIN', '2024-02-17 00:00:00.000000', 123, 'A'),
(103, 'REGULAR', '2024-02-17 00:00:00.000000', 124, 'A'),
(104, 'REGULAR', '2024-02-17 00:00:00.000000', 125, 'A'),
(105, 'REGULAR', '2024-02-19 00:00:00.000000', 126, 'A'),
(106, 'MAYORISTA', '2024-02-22 00:00:00.000000', 136, 'A'),
(107, 'REGULAR', '2024-02-22 00:00:00.000000', 137, 'A'),
(108, 'MAYORISTA', '2024-02-22 00:00:00.000000', 138, 'A'),
(109, 'REGULAR', '2024-02-23 00:00:00.000000', 139, 'A'),
(110, 'REGULAR', '2024-02-23 00:00:00.000000', 140, 'A'),
(111, 'REGULAR', '2024-02-28 00:00:00.000000', 148, 'A'),
(112, 'REGULAR', '2024-03-03 00:00:00.000000', 165, 'A'),
(113, 'MAYORISTA', '2024-03-03 00:00:00.000000', 166, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_categoria`
--

CREATE TABLE `wp_categoria` (
  `codigo` int(11) NOT NULL,
  `denominacion` varchar(100) NOT NULL DEFAULT '',
  `estado` varchar(1) DEFAULT NULL,
  `edad_minima` decimal(5,2) DEFAULT 0.00,
  `edad_maxima` decimal(5,2) DEFAULT 0.00,
  `num_jueces` int(2) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `wp_categoria`
--

INSERT INTO `wp_categoria` (`codigo`, `denominacion`, `estado`, `edad_minima`, `edad_maxima`, `num_jueces`) VALUES
(1, 'PRE INFANTIL', 'A', '4.00', '8.99', 3),
(2, 'INFANTIL', 'A', '7.00', '12.99', 3),
(3, 'JUNIOR', 'A', '13.00', '17.99', 3),
(4, 'ESTUDIANTES', 'A', '4.00', '99.00', 3),
(5, 'AMATEUR', 'A', '13.00', '99.00', 3),
(6, 'PRO-AM', 'A', '4.00', '99.00', 6),
(7, 'OPEN', 'A', '14.00', '99.00', 6),
(8, 'URBANO', 'A', '0.00', '0.00', 0),
(9, '1VS1 -INDESTRUCTIBLE-', 'A', '0.00', '0.00', 0);

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
-- Estructura de tabla para la tabla `wp_integrante`
--

CREATE TABLE `wp_integrante` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT '',
  `correo` varchar(100) DEFAULT '',
  `cod_participante` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'TIEMPO', '25.00', 'A'),
(2, 'TÉCNICA (SALSA Y BACHATA)', '20.00', 'A'),
(3, 'COREOGRAFÍA', '15.00', 'A'),
(4, 'TÉCNICA (DANZA)', '15.00', 'A'),
(5, 'CONEXIÓN', '15.00', 'A'),
(6, 'PROFESIONALISMO', '10.00', 'A'),
(99, 'TOTALES', '0.00', 'I');

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
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` varchar(60) DEFAULT '',
  `postcode` varchar(20) DEFAULT '',
  `city` varchar(100) DEFAULT '',
  `state` varchar(100) DEFAULT '',
  `cod_persona` int(11) NOT NULL,
  `cod_subcategoria` int(11) NOT NULL,
  `cod_instancia` int(11) NOT NULL,
  `cod_estado_competencia` int(11) DEFAULT NULL,
  `num_puntaje_juez` int(2) DEFAULT NULL,
  `nombre_cancion` varchar(100) DEFAULT NULL,
  `num_participante` int(4) DEFAULT 0,
  `cancion` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_participante`
--

INSERT INTO `wp_participante` (`codigo`, `customer_id`, `user_id`, `username`, `first_name`, `last_name`, `email`, `date_last_active`, `date_registered`, `country`, `postcode`, `city`, `state`, `cod_persona`, `cod_subcategoria`, `cod_instancia`, `cod_estado_competencia`, `num_puntaje_juez`, `nombre_cancion`, `num_participante`, `cancion`) VALUES
(5, NULL, NULL, 'juan.mendez', 'JUAN MENDEZ', ' ', 'juanhomr@gmail.com', '2024-02-28 09:32:42', NULL, NULL, NULL, NULL, '', 146, 1, 1, 1, 0, NULL, 0, NULL),
(6, NULL, NULL, 'daniela.bravo', 'DANIELA BRAVO', ' ', 'crisbravo565@gmail.com', '2024-02-29 00:13:18', NULL, NULL, NULL, NULL, '', 147, 1, 1, 2, 0, NULL, 0, NULL),
(7, NULL, NULL, 'david.brito', 'DAVID BRITO', ' ', 'davidsbritol@gmail.com', '2023-12-25 02:29:44', NULL, NULL, NULL, NULL, '', 149, 1, 1, 1, 0, NULL, 0, NULL),
(9, NULL, NULL, 'iris.huizi', 'IRIS HUIZI', ' ', 'huizi.iris@gmail.com', '2024-02-29 02:24:41', NULL, NULL, NULL, NULL, '', 151, 1, 1, 1, 0, NULL, 0, NULL),
(10, NULL, NULL, 'cinthia.luna', 'CINTHIA LUNA', ' ', 'cinthialuna0@gmail.com', '2024-02-29 02:28:21', NULL, 'ECUADOR', NULL, NULL, '', 152, 15, 1, 1, 0, NULL, 0, NULL),
(15, NULL, NULL, 'andrea.partidas', 'ANDREA PARTIDAS', ' ', 'apartidasrosendo@gmail.com', '2024-02-29 07:41:31', NULL, NULL, NULL, NULL, '', 154, 1, 1, 1, 0, NULL, 0, NULL),
(23, NULL, NULL, 'ismael.palmar', 'ISMAEL PALMAR', ' ', 'bailaquebaila20@gmail.com', '2024-02-29 20:22:05', NULL, NULL, NULL, NULL, '', 161, 1, 1, 1, 0, NULL, 0, NULL),
(24, NULL, NULL, 'jessica.rivas', 'JÉSSICA RIVAS', ' ', 'esojessy@hotmail.com', '2024-03-01 09:34:24', NULL, NULL, NULL, NULL, '', 162, 1, 1, 1, 0, NULL, 0, NULL),
(26, NULL, NULL, 'mabel.pumisacho', 'SOFÍA LEMA', '', 'mabelpumisacho.17@gmail.com', '2024-03-02 05:17:00', NULL, 'ECUADOR', NULL, NULL, '', 163, 1, 1, 1, 0, NULL, 0, NULL),
(27, NULL, NULL, '', 'JUAN MARTÍN DUEÑAS', '', 'mabelpumisacho.17@gmail.com', '2024-03-02 21:30:00', NULL, 'ECUADOR', NULL, NULL, '', 164, 27, 1, 1, 0, NULL, 0, NULL);

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
(4, 'SOLISTA SALSA FEMENINO', 2, 'A'),
(5, 'SOLISTA SALSA MASCULINO', 2, 'A'),
(6, 'SOLISTA BACHATA FEMENINO', 2, 'A'),
(7, 'SOLISTA BACHATA MASCULINO', 2, 'A'),
(8, 'PAREJA SALSA', 2, 'A'),
(9, 'PAREJA BACHATA', 2, 'A'),
(10, 'SAME GENDER SALSA', 2, 'A'),
(11, 'SAME GENDER BACHATA', 2, 'A'),
(12, 'GRUPOS SALSA (ABIERTA)', 2, 'A'),
(13, 'GRUPOS BACHATA (ABIERTA)', 2, 'A'),
(14, 'SHOW DANCE (ABIERTA)', 2, 'A'),
(15, 'SOLISTA SALSA FEMENINO', 3, 'A'),
(16, 'SOLISTA SALSA MASCULINO', 3, 'A'),
(17, 'SOLISTA BACHATA FEMENINO', 3, 'A'),
(18, 'SOLISTA BACHATA MASCULINO', 3, 'A'),
(19, 'PAREJA SALSA', 3, 'A'),
(20, 'PAREJA BACHATA', 3, 'A'),
(21, 'SAME GENDER SALSA', 3, 'A'),
(22, 'SAME GENDER BACHATA', 3, 'A'),
(23, 'GRUPOS SALSA (ABIERTA)', 3, 'A'),
(24, 'GRUPOS BACHATA (ABIERTA)', 3, 'A'),
(25, 'SHOW DANCE (ABIERTA)', 3, 'A'),
(26, 'SOLISTA SALSA FEMENINO', 4, 'A'),
(27, 'SOLISTA SALSA MASCULINO', 4, 'A'),
(28, 'SOLISTA BACHATA FEMENINO', 4, 'A'),
(29, 'SOLISTA BACHATA MASCULINO', 4, 'A'),
(30, 'PAREJA SALSA (ABIERTA)', 4, 'A'),
(31, 'PAREJA BACHATA (ABIERTA)', 4, 'A'),
(32, 'GRUPOS SALSA (ABIERTA)', 4, 'A'),
(33, 'GRUPOS SALSA CUBANA (ABIERTA)', 4, 'A'),
(34, 'GRUPOS BACHATA (ABIERTA)', 4, 'A'),
(35, 'SOLISTA SALSA FEMENINO', 5, 'A'),
(36, 'SOLISTA SALSA MASCULINO', 5, 'A'),
(37, 'SOLISTA BACHATA FEMENINO', 5, 'A'),
(38, 'SOLISTA BACHATA MASCULINO', 5, 'A'),
(39, 'PAREJA SALSA PISO', 5, 'A'),
(40, 'PAREJA SALSA ACROBACIA', 5, 'A'),
(41, 'PAREJA BACHATA PISO', 5, 'A'),
(42, 'PAREJA BACHATA ACROBACIA', 5, 'A'),
(43, 'SAME GENDER SALSA', 5, 'A'),
(44, 'SAME GENDER BACHATA', 5, 'A'),
(45, 'GRUPOS SALSA (ABIERTA)', 5, 'A'),
(46, 'GRUPOS BACHATA (ABIERTA)', 5, 'A'),
(47, 'PAREJA SALSA (ABIERTA)', 6, 'A'),
(48, 'PAREJA BACHATA (ABIERTA)', 6, 'A'),
(49, 'SOLISTA SALSA FEMENINO', 7, 'A'),
(50, 'SOLISTA SALSA MASCULINO', 7, 'A'),
(51, 'SOLISTA BACHATA FEMENINO', 7, 'A'),
(52, 'SOLISTA BACHATA MASCULINO', 7, 'A'),
(53, 'SOLISTA SIN LIMITES (ABIERTA)', 7, 'A'),
(54, 'SOLISTA AFRO CUBANO (ABIERTA)', 7, 'A'),
(55, 'SOLISTA SALSA CUBANA (ABIERTA)', 7, 'A'),
(56, 'SOLISTA +40 (ABIERTA)', 7, 'A'),
(57, 'PAREJA SALSA CUBANA (ABIERTA)', 7, 'A'),
(58, 'PAREJA SALSA PISO (ABIERTA)', 7, 'A'),
(59, 'PAREJA SALSA ACROBACIA', 7, 'A'),
(60, 'PAREJA BACHATA PISO', 7, 'A'),
(61, 'PAREJA BACHATA ACROBACIA', 7, 'A'),
(62, 'PAREJA KIZOMBA', 7, 'A'),
(63, 'SAME GENDER PAREJA', 7, 'A'),
(64, 'GRUPOS SALSA CUBANA (ABIERTA)', 7, 'A'),
(65, 'GRUPOS SALSA (PAREJAS)', 7, 'A'),
(66, 'GRUPOS SALSA (SHINE)', 7, 'A'),
(67, 'GRUPOS BACHATA (PAREJAS)', 7, 'A'),
(68, 'GRUPOS BACHATA (SHINE)', 7, 'A'),
(69, 'SHOW DANCE (ABIERTA)', 7, 'A'),
(70, 'INFANTIL CREW', 8, 'A'),
(71, 'SMALL CREW', 8, 'A'),
(72, 'MEGA CREW', 8, 'A'),
(73, 'SOLISTA (ABIERTA)', 8, 'A'),
(74, 'AMATEUR', 9, 'A'),
(75, 'OPEN', 9, 'A');

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
-- Indices de la tabla `wp_integrante`
--
ALTER TABLE `wp_integrante`
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
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de la tabla `cat_producto`
--
ALTER TABLE `cat_producto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `cat_transaccion`
--
ALTER TABLE `cat_transaccion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

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
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `seg_inicio_sesion`
--
ALTER TABLE `seg_inicio_sesion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `seg_recurso`
--
ALTER TABLE `seg_recurso`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `seg_rol_aplicacion`
--
ALTER TABLE `seg_rol_aplicacion`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `seg_rol_aplicacion_recurso`
--
ALTER TABLE `seg_rol_aplicacion_recurso`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `seg_sede`
--
ALTER TABLE `seg_sede`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `seg_usuario`
--
ALTER TABLE `seg_usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=26;

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
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=182;

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
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

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
-- AUTO_INCREMENT de la tabla `wp_integrante`
--
ALTER TABLE `wp_integrante`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_modelo_puntaje`
--
ALTER TABLE `wp_modelo_puntaje`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `wp_participante`
--
ALTER TABLE `wp_participante`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `wp_puntaje`
--
ALTER TABLE `wp_puntaje`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_sub_categoria`
--
ALTER TABLE `wp_sub_categoria`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
