-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para evaluacioninstructores
CREATE DATABASE IF NOT EXISTS `evaluacioninstructores` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `evaluacioninstructores`;


-- Volcando estructura para tabla evaluacioninstructores.aprendiz
CREATE TABLE IF NOT EXISTS `aprendiz` (
  `Id_Aprendiz` int(5) NOT NULL AUTO_INCREMENT,
  `Documento` bigint(20) NOT NULL,
  `Tipo_Documento` varchar(5) NOT NULL,
  `Nombres` varchar(40) NOT NULL,
  `Apellidos` varchar(40) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Correo` varchar(30) NOT NULL DEFAULT '-',
  `Direccion` varchar(50) NOT NULL DEFAULT '-',
  `Telefono` varchar(30) NOT NULL DEFAULT '-',
  `Fecha_inicioLectiva` date NOT NULL,
  `Fecha_finLectiva` date NOT NULL,
  `Fecha_inicioProductiva` date NOT NULL,
  `Fecha_finProductiva` date NOT NULL,
  `Usuario` varchar(20) DEFAULT '-',
  `Contraseña` blob,
  `FK_Ficha` int(5) DEFAULT NULL,
  PRIMARY KEY (`Id_Aprendiz`),
  KEY `FK_aprendiz_ficha` (`FK_Ficha`),
  CONSTRAINT `FK_aprendiz_ficha` FOREIGN KEY (`FK_Ficha`) REFERENCES `ficha` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45624 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.aprendiz: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `aprendiz` DISABLE KEYS */;
INSERT INTO `aprendiz` (`Id_Aprendiz`, `Documento`, `Tipo_Documento`, `Nombres`, `Apellidos`, `Fecha_Nacimiento`, `Correo`, `Direccion`, `Telefono`, `Fecha_inicioLectiva`, `Fecha_finLectiva`, `Fecha_inicioProductiva`, `Fecha_finProductiva`, `Usuario`, `Contraseña`, `FK_Ficha`) VALUES
	(45622, 971016, 'T.I.', 'Andres', 'Quintero', '1997-10-16', '-', '-', '-', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '-', NULL, 599557),
	(45623, 981025, 'C.C.', 'Juan', 'Lopez', '2015-08-07', '-', '-', '-', '2015-08-07', '2015-08-07', '2015-08-07', '2015-08-07', '-', NULL, NULL);
/*!40000 ALTER TABLE `aprendiz` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.centro
CREATE TABLE IF NOT EXISTS `centro` (
  `Codigo` int(5) NOT NULL,
  `Descripcion` varchar(255) NOT NULL DEFAULT '-',
  `Direccion` varchar(50) NOT NULL DEFAULT '-',
  `FK_Regional` int(5) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FK_centro_regional` (`FK_Regional`),
  CONSTRAINT `FK_centro_regional` FOREIGN KEY (`FK_Regional`) REFERENCES `regional` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.centro: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `centro` DISABLE KEYS */;
INSERT INTO `centro` (`Codigo`, `Descripcion`, `Direccion`, `FK_Regional`) VALUES
	(254, 'GESTION ADMINISTRATIVA', '-', 2584),
	(542, 'GESTION DE MERCADOS ', '-', 3845);
/*!40000 ALTER TABLE `centro` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.coordinacion
CREATE TABLE IF NOT EXISTS `coordinacion` (
  `Codigo` int(5) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FK_Centro` int(5) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FK_coordinacion_centro` (`FK_Centro`),
  CONSTRAINT `FK_coordinacion_centro` FOREIGN KEY (`FK_Centro`) REFERENCES `centro` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.coordinacion: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `coordinacion` DISABLE KEYS */;
INSERT INTO `coordinacion` (`Codigo`, `Nombre`, `FK_Centro`) VALUES
	(1, 'Fontibon', NULL),
	(2, 'Convergys', NULL),
	(3, 'Articulacion', NULL),
	(4, 'Logistica', NULL),
	(5, 'Mercadeo', NULL),
	(6, 'Industrias', NULL),
	(7, 'Teleinformatica', NULL),
	(8, 'Virtualizacion', NULL);
/*!40000 ALTER TABLE `coordinacion` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.cuestionario
CREATE TABLE IF NOT EXISTS `cuestionario` (
  `Codigo` int(5) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.cuestionario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
INSERT INTO `cuestionario` (`Codigo`, `Nombre`, `Fecha`) VALUES
	(2456, 'CUESTIONARIO LOGISTICA', '0000-00-00'),
	(3123, 'CUESTIONARIO ADSI', '2015-08-07');
/*!40000 ALTER TABLE `cuestionario` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.detalle_cuestionario
CREATE TABLE IF NOT EXISTS `detalle_cuestionario` (
  `Id_detalleCuestionario` int(5) NOT NULL AUTO_INCREMENT,
  `FK_Cuestionario` int(5) DEFAULT NULL,
  `FK_Ficha` int(5) DEFAULT NULL,
  `FK_Instructor` int(5) DEFAULT NULL,
  PRIMARY KEY (`Id_detalleCuestionario`),
  KEY `FK_detalle_cuestionario_cuestionario` (`FK_Cuestionario`),
  KEY `FK_detalle_cuestionario_ficha` (`FK_Ficha`),
  KEY `FK_detalle_cuestionario_instructor` (`FK_Instructor`),
  CONSTRAINT `FK_detalle_cuestionario_cuestionario` FOREIGN KEY (`FK_Cuestionario`) REFERENCES `cuestionario` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_detalle_cuestionario_ficha` FOREIGN KEY (`FK_Ficha`) REFERENCES `ficha` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_detalle_cuestionario_instructor` FOREIGN KEY (`FK_Instructor`) REFERENCES `instructor` (`Id_Instructor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.detalle_cuestionario: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_cuestionario` DISABLE KEYS */;
INSERT INTO `detalle_cuestionario` (`Id_detalleCuestionario`, `FK_Cuestionario`, `FK_Ficha`, `FK_Instructor`) VALUES
	(1, 2456, NULL, 1),
	(2, 2456, 599557, 2),
	(3, 3123, 599557, 1),
	(4, 3123, 599557, 3),
	(5, 2456, 599557, 3);
/*!40000 ALTER TABLE `detalle_cuestionario` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.detalle_ficha
CREATE TABLE IF NOT EXISTS `detalle_ficha` (
  `id_detalle_ficha` int(5) NOT NULL AUTO_INCREMENT,
  `FK_ficha` int(5) DEFAULT NULL,
  `FK_instructor` int(5) DEFAULT NULL,
  `Titular` char(2) NOT NULL,
  PRIMARY KEY (`id_detalle_ficha`),
  KEY `FK_detalle_ficha_ficha` (`FK_ficha`),
  KEY `FK_detalle_ficha_instructor` (`FK_instructor`),
  CONSTRAINT `FK_detalle_ficha_ficha` FOREIGN KEY (`FK_ficha`) REFERENCES `ficha` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_detalle_ficha_instructor` FOREIGN KEY (`FK_instructor`) REFERENCES `instructor` (`Id_Instructor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.detalle_ficha: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_ficha` DISABLE KEYS */;
INSERT INTO `detalle_ficha` (`id_detalle_ficha`, `FK_ficha`, `FK_instructor`, `Titular`) VALUES
	(1, 599557, 1, 'S'),
	(2, NULL, 2, 'N'),
	(3, NULL, 1, 'N'),
	(4, NULL, 3, 'N'),
	(5, 599557, 3, 'N'),
	(6, 599559, 1, 'S'),
	(7, NULL, 2, 'S');
/*!40000 ALTER TABLE `detalle_ficha` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.detalle_pregunta
CREATE TABLE IF NOT EXISTS `detalle_pregunta` (
  `Id_detallePregunta` int(5) NOT NULL AUTO_INCREMENT,
  `FK_Pregunta` int(5) DEFAULT NULL,
  `FK_Cuestionario` int(5) DEFAULT NULL,
  PRIMARY KEY (`Id_detallePregunta`),
  KEY `FK_detalle_pregunta_pregunta` (`FK_Pregunta`),
  KEY `FK_detalle_pregunta_cuestionario` (`FK_Cuestionario`),
  CONSTRAINT `FK_detalle_pregunta_cuestionario` FOREIGN KEY (`FK_Cuestionario`) REFERENCES `cuestionario` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_detalle_pregunta_pregunta` FOREIGN KEY (`FK_Pregunta`) REFERENCES `pregunta` (`Id_pregunta`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.detalle_pregunta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_pregunta` DISABLE KEYS */;
INSERT INTO `detalle_pregunta` (`Id_detallePregunta`, `FK_Pregunta`, `FK_Cuestionario`) VALUES
	(1, 1, 3123),
	(2, 2, 2456);
/*!40000 ALTER TABLE `detalle_pregunta` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.ficha
CREATE TABLE IF NOT EXISTS `ficha` (
  `Codigo` int(5) NOT NULL,
  `FK_Coordinacion` int(5) DEFAULT NULL,
  `FK_Programa` int(5) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FK__coordinacion` (`FK_Coordinacion`),
  KEY `FK__programa` (`FK_Programa`),
  CONSTRAINT `FK__coordinacion` FOREIGN KEY (`FK_Coordinacion`) REFERENCES `coordinacion` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK__programa` FOREIGN KEY (`FK_Programa`) REFERENCES `programa` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.ficha: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` (`Codigo`, `FK_Coordinacion`, `FK_Programa`) VALUES
	(577560, 1, NULL),
	(581242, 4, NULL),
	(598724, 4, NULL),
	(599557, 1, NULL),
	(599559, 1, NULL),
	(599573, 4, NULL),
	(620004, 4, NULL),
	(661371, 4, NULL),
	(661383, 4, NULL),
	(683845, 4, NULL),
	(752047, 4, NULL),
	(752066, 4, NULL),
	(752081, 4, NULL),
	(752088, 4, NULL),
	(752669, 4, NULL),
	(753798, 4, NULL),
	(791749, 4, NULL),
	(812058, 1, NULL),
	(812063, 1, NULL),
	(812460, 4, NULL),
	(812461, 4, NULL),
	(812463, 4, NULL),
	(812466, 4, NULL),
	(812468, 4, NULL),
	(821466, 4, NULL),
	(854097, 4, NULL),
	(858069, 4, NULL),
	(864525, 4, NULL),
	(864616, 4, NULL),
	(864625, 4, NULL),
	(864627, 4, NULL),
	(864629, 4, NULL),
	(864630, 4, NULL),
	(864637, 4, NULL),
	(864647, 4, NULL),
	(867258, 1, NULL),
	(878912, 1, NULL),
	(879790, 1, NULL),
	(895018, 1, NULL),
	(899317, 4, NULL),
	(899328, 4, NULL),
	(899329, 4, NULL),
	(901437, 4, NULL),
	(901440, 4, NULL),
	(901451, 4, NULL),
	(901453, 4, NULL),
	(901454, 4, NULL),
	(907616, 2, NULL),
	(907630, 2, NULL),
	(912292, 3, 1111),
	(912294, 3, 1111),
	(912296, 3, 1111),
	(912297, 3, 1111),
	(912301, 3, 1111),
	(912302, 3, 1111),
	(912312, 3, 1111),
	(919438, 3, 1111),
	(919439, 3, 1111),
	(919446, 3, 1111),
	(919451, 3, 1111),
	(919456, 3, 1111),
	(919457, 3, 1111),
	(921464, 4, NULL),
	(923858, 3, 1111),
	(923860, 3, NULL),
	(924151, 3, NULL),
	(929276, 3, 1111),
	(929291, 3, 1111),
	(930526, 2, NULL),
	(930533, 2, NULL),
	(937148, 2, NULL),
	(937154, 2, NULL),
	(937159, 2, NULL),
	(947902, 4, NULL),
	(953689, 2, NULL),
	(953695, 2, 1111),
	(953696, 2, NULL),
	(953698, 2, NULL),
	(953709, 2, 1111),
	(953713, 2, 1111),
	(953714, 2, 1111),
	(953725, 2, 1111),
	(953726, 2, 1111),
	(957411, 3, 1111),
	(957429, 2, 1111),
	(957430, 2, 1111),
	(957440, 2, 1111),
	(975124, 2, 1111),
	(975129, 2, 1111),
	(975145, 2, 1111),
	(975707, 2, 1111),
	(975731, 2, 1111),
	(979074, 2, 1111),
	(979076, 2, NULL),
	(979077, 2, 1111);
/*!40000 ALTER TABLE `ficha` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.instructor
CREATE TABLE IF NOT EXISTS `instructor` (
  `Id_Instructor` int(5) NOT NULL AUTO_INCREMENT,
  `Documento` bigint(20) NOT NULL,
  `Tipo_Documento` varchar(5) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Correo` varchar(50) NOT NULL DEFAULT '-',
  `TipoInstructor` varchar(20) NOT NULL,
  `Foto` binary(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Instructor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.instructor: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` (`Id_Instructor`, `Documento`, `Tipo_Documento`, `Nombres`, `Apellidos`, `Correo`, `TipoInstructor`, `Foto`) VALUES
	(1, 213789678, 'C.C.', 'Pedro', 'Pedrez', '-', 'Tecnico', NULL),
	(2, 231454234, 'C.C.', 'Manpinta', 'Jee', '-', 'Transversal', NULL),
	(3, 0, '', 'DIEGO ALEJANDRO', 'BOADA MORALES', '-', '', NULL);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.migrations: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.pregunta
CREATE TABLE IF NOT EXISTS `pregunta` (
  `Id_pregunta` int(5) NOT NULL AUTO_INCREMENT,
  `Tipo_pregunta` varchar(50) NOT NULL,
  `Descripcion` varchar(255) NOT NULL DEFAULT '-',
  `FK_Saber` int(3) DEFAULT NULL,
  PRIMARY KEY (`Id_pregunta`),
  KEY `FK_pregunta_saber` (`FK_Saber`),
  CONSTRAINT `FK_pregunta_saber` FOREIGN KEY (`FK_Saber`) REFERENCES `saber` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.pregunta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` (`Id_pregunta`, `Tipo_pregunta`, `Descripcion`, `FK_Saber`) VALUES
	(1, 'Multiple', '¿quien descubrio america?', 31),
	(2, 'Unica', '¿Es hombre o mujer?', 32);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `Codigo` int(5) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) NOT NULL DEFAULT '-',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.programa: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` (`Codigo`, `Nombre`, `Descripcion`) VALUES
	(1111, 'ADSI', 'TECNOLOGO'),
	(2222, 'PROGRAMACION DE SOFTWARE', 'TECNICO');
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.regional
CREATE TABLE IF NOT EXISTS `regional` (
  `Codigo` int(5) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` varchar(255) NOT NULL DEFAULT '-',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.regional: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `regional` DISABLE KEYS */;
INSERT INTO `regional` (`Codigo`, `Nombre`, `Descripcion`) VALUES
	(2584, 'Santander', '-'),
	(3845, 'Distrito Capital', '-');
/*!40000 ALTER TABLE `regional` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.respuesta
CREATE TABLE IF NOT EXISTS `respuesta` (
  `Id_Respuesta` int(5) NOT NULL AUTO_INCREMENT,
  `Valor_Respuesta` bigint(20) NOT NULL,
  `FK_Pregunta` int(5) DEFAULT NULL,
  `FK_Aprendiz` int(5) DEFAULT NULL,
  PRIMARY KEY (`Id_Respuesta`),
  KEY `FK__pregunta` (`FK_Pregunta`),
  KEY `FK_respuesta_aprendiz` (`FK_Aprendiz`),
  CONSTRAINT `FK__pregunta` FOREIGN KEY (`FK_Pregunta`) REFERENCES `pregunta` (`Id_pregunta`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_respuesta_aprendiz` FOREIGN KEY (`FK_Aprendiz`) REFERENCES `aprendiz` (`Id_Aprendiz`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.respuesta: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` (`Id_Respuesta`, `Valor_Respuesta`, `FK_Pregunta`, `FK_Aprendiz`) VALUES
	(1, 500, 1, 45623),
	(2, 0, 1, 45622),
	(3, 100, 2, 45623);
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.saber
CREATE TABLE IF NOT EXISTS `saber` (
  `Codigo` int(3) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` varchar(255) NOT NULL DEFAULT '-',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.saber: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `saber` DISABLE KEYS */;
INSERT INTO `saber` (`Codigo`, `Nombre`, `Descripcion`) VALUES
	(31, 'hacer', '-'),
	(32, 'Ser', '-');
/*!40000 ALTER TABLE `saber` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.users: ~100 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(8, 'Jose', 'yBueno@Quintana.es', '#fCm%>/5\\AME', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(9, 'Leo', 'uDelafuente@yahoo.com', '~9iBuv', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(10, 'Jesus', 'Vega.Aroa@Montalvo.com', '?$(b,##V*xW|?v$', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(11, 'Alberto', 'Saul.Delgado@Mejia.com', ')]"auu@k`ueC.}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(12, 'Miguel Angel', 'Jesus.Narvaez@latinmail.com', 'yab\\/dA`D\\vztTs', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(13, 'Unai', 'gNieves@hotmail.es', 'c%VM5-0HQZch%0#MYzJ2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(14, 'Mateo', 'Gallego.Alma@Palomo.es', 'S+:US$RsOCfi', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(15, 'Ignacio', 'Javier22@Naranjo.com', 'I\'r88z!]tK>i[_', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(16, 'Victor', 'oCandelaria@Centeno.com', '.X5N7k,!.V', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(17, 'Nicolas', 'vQuiroz@Murillo.es', ':~,GX_+Kl"a', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(18, 'Jaime', 'Munoz.Jaime@terra.com', '{xgz~[B0K--x{?]gF', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(19, 'Ignacio', 'wCordoba@Henriquez.com', '"7[dyV:tY$', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(20, 'Jose Manuel', 'Rueda.Marc@Castro.com', '~8QNbI', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(21, 'Izan', 'cEstevez@yahoo.com', 'k:Jbx<>j[;M$/q\\m;', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(22, 'Dario', 'Sara.Luna@Baca.net', 'O4_&HksYL|=&n3>u;0t', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(23, 'Ivan', 'cAlfaro@Montano.org', 'zKaEe!ORUzSGKU', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(24, 'Luis', 'Otero.Adria@terra.com', 'vUy48Gn{`2[+7+x', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(25, 'Alex', 'Fernandez.Paula@Lozada.com', '|B4Jqz&c', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(26, 'Joel', 'Guzman.Iria@Mares.com.es', 'tE-k#SXo8O2ygX7~%CL', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(27, 'Hugo', 'Bonilla.Ruben@Cintron.org', 'm,N+!JN$Qy#', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(28, 'Juan', 'cGaribay@yahoo.com', '\'\\4\'~[?CZfMZAg]ru', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(29, 'Juan Jose', 'Dominguez.Silvia@Alarcon.org', '<([f?D@EOzu#~', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(30, 'Rodrigo', 'Vega.Garza@Barraza.com', '8s\\E`y(3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(31, 'Marco', 'Soto.Jorge@gmail.com', '=n5R/\\ku', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(32, 'Cristian', 'Deleon.Paola@Nava.es', '?=zpja9', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(33, 'Santiago', 'Sauceda.Marc@Adame.com', '=@(Yfq', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(34, 'Jon', 'gLazaro@hotmail.es', 'YPk?\'a3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(35, 'Hugo', 'Caro.Anna@yahoo.com', 'FS8nyR\\>K*?F\\RvV]?', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(36, 'Santiago', 'Brito.Roberto@hispavista.com', '=Jm1x3', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(37, 'Pedro', 'fDominguez@Preciado.es', '?:7+\'r8x', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(38, 'Jesus', 'Marta40@live.com', 'sYD/TZV;fZz1Zq$x*ySm', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(39, 'Ander', 'Oscar.Tejeda@Zepeda.es', 'bb<$VV|.3i_jTA#BX}E', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(40, 'Jesus', 'Isabel.Ocampo@hispavista.com', '9~X<|q3>j&14J:R?,v', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(41, 'Adam', 'Mota.Dario@Carretero.es', 'g<am5s!`}$#A', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(42, 'Oscar', 'Zoe.Oquendo@terra.com', 'E6G~|~a)\\p3y6%Ah){', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(43, 'Jose Antonio', 'Joel.Gamez@gmail.com', 'B+qT1!)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(44, 'Oscar', 'Delrio.Elena@Navas.net', '+)bE~X*J', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(45, 'Alejandro', 'Delacruz.Alonso@Lira.com', 'xB&52g"[Zwk4FE~', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(46, 'Francisco Javier', 'Olvera.Leyre@terra.com', '-okMUtw1M5~N-leK', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(47, 'Aaron', 'uDelapaz@hispavista.com', '2j|(@/x]x%lu){pma\\Z', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(48, 'Marco', 'Iker51@hispavista.com', 'H$UYt}9iaz\\b(inb+^', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(49, 'Biel', 'Gimeno.Gael@Santamaria.com', 'V$jhY((d', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(50, 'Jesus', 'Berta.Armenta@hispavista.com', '0U6<q<c4*dr`-Vt-', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(51, 'Yeray', 'zCarrion@Mas.es', 'W4Nyq@Aby', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(52, 'Francisco Javier', 'fCordoba@hotmail.es', 'm@87|o)#s&YH', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(53, 'Samuel', 'dSerrato@terra.com', '3}WB|KVj9', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(54, 'Raul', 'Sara.Benavidez@Betancourt.com', 'o$tne/=4Z', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(55, 'Gael', 'Caro.Fernando@live.com', '|S>[6{Y$\'nt', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(56, 'Alonso', 'Arroyo.Malak@terra.com', 'nA\\HP{)`qlk', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(57, 'Jose Antonio', 'yNoriega@Barrera.com', 'VfVeyYOW%2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(58, 'Cesar', 'Anna.Plaza@Urbina.es', 'K">R9]tUj', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(59, 'Jesus', 'Valentina05@hispavista.com', '[uP!{P6;R]^qK:xa', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(60, 'Ander', 'Aaron50@live.com', '^!^dV1*', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(61, 'Alberto', 'Puente.Ian@live.com', '9Q\\V<|J~T^uMCDUq', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(62, 'David', 'Enrique.Covarrubias@Castillo.es', 'x}@`%)+A', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(63, 'Joel', 'Sara51@Camarillo.org', 'yjc{y/zn;D?WYwhW', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(64, 'Joel', 'Henriquez.Martin@yahoo.es', 'Ct^4fg\'i$dXu]', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(65, 'Pol', 'sRoybal@latinmail.com', '0-*P^=)(', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(66, 'Jose', 'Manuel76@Olmos.com', 'RmlqG?\'i', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(67, 'Aitor', 'Sergio31@gmail.com', '5CG)&3qSdD2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(68, 'Ignacio', 'Martina.Tomas@Arteaga.com', '?b9!Yp9UE`{\'#E@', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(69, 'Francisco', 'Ballesteros.Santiago@Contreras.es', '}^i/2b=k!S[5%k', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(70, 'Daniel', 'qSilva@Carbonell.net', '4(odw+546', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(71, 'Ian', 'eConde@Escobedo.com', '~MDfm!T`+', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(72, 'Rayan', 'Oscar.Cortes@hotmail.es', 'Q8p@$*u,229I5+', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(73, 'Oriol', 'Munoz.Miriam@Villalobos.com', '349C<X53>*EvgjG{', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(74, 'Miguel Angel', 'hSegura@Serrano.com', '<Mq-oM7&S5Wn~', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(75, 'Adrian', 'Pol66@terra.com', '#|Z?I;x{?G', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(76, 'Daniel', 'Ocampo.Mario@yahoo.com', 'E{ysWs92', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(77, 'Biel', 'Aina00@live.com', '/Q5)X)@', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(78, 'Juan', 'Marco72@Brito.com', 'JsGUE@p^IHV;3Eh.xFz', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(79, 'Alvaro', 'hChavarria@Amador.es', '7\'{-RF=@', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(80, 'Alex', 'Juan20@hispavista.com', ':f=O7=6i0<Q5', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(81, 'Aitor', 'tGastelum@latinmail.com', 'Rpl2sFZx]"', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(82, 'Omar', 'Daniel96@hispavista.com', 'G/;].@:nTbYgS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(83, 'Luis', 'Adrian01@yahoo.es', '(pi>YSa5P\\;>', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(84, 'Arnau', 'Palomino.Erik@Costa.es', 'qUkPqgn8sO', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(85, 'Mateo', 'Joan35@Giron.org', 'ryH6]3(', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(86, 'Jose Antonio', 'Victoria.Molina@Izquierdo.com', 'w32wvn\'12ck_d', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(87, 'Roberto', 'nVerduzco@Caballero.es', 'S1ly-E$t\'f', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(88, 'Jose Antonio', 'Leo51@Segovia.com', 'E?Kc5$s:@">k8[0r', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(89, 'Ruben', 'Santiago.Villa@Carretero.net', 'EU(A&=\\=g7Q#^d^zQ', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(90, 'Unai', 'Sofia.Pichardo@Salinas.es', '-N(!U>e*', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(91, 'Oriol', 'mMatias@gmail.com', '0!)"~z/R]K:mm`boY,U', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(92, 'Ruben', 'tOcasio@Negrete.com', 'Cc_{~k?', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(93, 'Alex', 'Padron.Aleix@live.com', 'o"be9dFLSx>g*4$', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(94, 'Victor', 'Andrea.Patino@yahoo.es', ',98Xw=.jPBHy#ftO', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(95, 'Juan Jose', 'uLoya@hotmail.es', 'O0?27KXhKrPLF/r', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(96, 'Eric', 'Daniel65@Teran.org', '|-cp,!%*', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(97, 'Guillem', 'Teresa.Lorente@yahoo.es', '`qce3)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(98, 'Diego', 'bBaca@yahoo.es', '@p:m"I(C', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(99, 'Javier', 'Mohamed.Quintana@yahoo.es', '}s(8:kxl(o[{', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(100, 'Rafael', 'zAnton@hispavista.com', '-RRAnlt', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(101, 'Aitor', 'Yaiza.Alvarado@Jimenez.com', '@*Q5B8b)0fZNYK[4', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(102, 'Ignacio', 'kBarroso@terra.com', '$g]s;PZKx4x/UwvP', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(103, 'Jose Manuel', 'Asier81@Saldana.org', 'TZ>i94|Tg)?E%', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(104, 'Lucas', 'Victoria.Casarez@Reyna.es', '>Pgyj8uu&CO(?o', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(105, 'Javier', 'Samuel.Barreto@Meraz.org', 'bNAO<&|sT', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(106, 'Luis', 'sDuenas@yahoo.es', '+kdM3j\'P-rZh0_', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(107, 'Carlos', 'kSegura@gmail.com', 'u(vMN@P]4B\'A', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Volcando estructura para vista evaluacioninstructores.seleccioninstructor
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `seleccioninstructor` (
	`Nombres` VARCHAR(45) NOT NULL COLLATE 'latin1_swedish_ci',
	`Apellidos` VARCHAR(45) NOT NULL COLLATE 'latin1_swedish_ci',
	`Ficha` INT(5) NULL,
	`Titular` CHAR(2) NOT NULL COLLATE 'latin1_swedish_ci',
	`Coordinacion` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista evaluacioninstructores.ssassa
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ssassa` (
	`Nombres` VARCHAR(45) NOT NULL COLLATE 'latin1_swedish_ci',
	`Apellidos` VARCHAR(45) NOT NULL COLLATE 'latin1_swedish_ci',
	`Titular` CHAR(2) NOT NULL COLLATE 'latin1_swedish_ci',
	`FK_ficha` INT(5) NULL,
	`FK_Coordinacion` INT(5) NULL,
	`Nombre` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Volcando estructura para vista evaluacioninstructores.seleccioninstructor
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `seleccioninstructor`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `seleccioninstructor` AS SELECT
instructor.Nombres,
instructor.Apellidos,
detalle_ficha.FK_ficha AS Ficha,
detalle_ficha.Titular,
coordinacion.Nombre AS Coordinacion
FROM
ficha
INNER JOIN detalle_ficha ON detalle_ficha.FK_ficha = ficha.Codigo
INNER JOIN detalle_cuestionario ON detalle_cuestionario.FK_Ficha = ficha.Codigo
INNER JOIN instructor ON detalle_ficha.FK_instructor = instructor.Id_Instructor AND detalle_cuestionario.FK_Instructor = instructor.Id_Instructor
INNER JOIN coordinacion ON ficha.FK_Coordinacion = coordinacion.Codigo ;


-- Volcando estructura para vista evaluacioninstructores.ssassa
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ssassa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `ssassa` AS SELECT
instructor.Nombres,
instructor.Apellidos,
detalle_ficha.Titular,
detalle_ficha.FK_ficha,
ficha.FK_Coordinacion,
coordinacion.Nombre
FROM
ficha
INNER JOIN detalle_ficha ON detalle_ficha.FK_ficha = ficha.Codigo
INNER JOIN detalle_cuestionario ON detalle_cuestionario.FK_Ficha = ficha.Codigo
INNER JOIN instructor ON detalle_ficha.FK_instructor = instructor.Id_Instructor AND detalle_cuestionario.FK_Instructor = instructor.Id_Instructor
INNER JOIN coordinacion ON ficha.FK_Coordinacion = coordinacion.Codigo ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
