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


-- Volcando estructura para tabla evaluacioninstructores.aprendizm
CREATE TABLE IF NOT EXISTS `aprendizm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Documento` bigint(20) NOT NULL,
  `Tipo_documento` enum('T.I','C.C','CE','PASS','NIT') COLLATE utf8_unicode_ci NOT NULL,
  `Nombres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Correo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Telefono` int(10) NOT NULL,
  `Fecha_inicioLectiva` date NOT NULL,
  `Fecha_finLectiva` date NOT NULL,
  `Fecha_inicioProductiva` date NOT NULL,
  `Fecha_finProductiva` date NOT NULL,
  `Usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Contraseña` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FK_Ficha` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_aprendizm_ficham` (`FK_Ficha`),
  CONSTRAINT `FK_aprendizm_ficham` FOREIGN KEY (`FK_Ficha`) REFERENCES `ficham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.aprendizm: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `aprendizm` DISABLE KEYS */;
INSERT INTO `aprendizm` (`id`, `Documento`, `Tipo_documento`, `Nombres`, `Apellidos`, `Fecha_Nacimiento`, `Correo`, `Direccion`, `Telefono`, `Fecha_inicioLectiva`, `Fecha_finLectiva`, `Fecha_inicioProductiva`, `Fecha_finProductiva`, `Usuario`, `Contraseña`, `FK_Ficha`, `created_at`, `updated_at`) VALUES
	(1, 98010470862, 'T.I', 'alberto', 'lleras', '0000-00-00', 'alonzo@hot.com', 'falsa123', 2147483647, '2015-09-23', '2015-09-04', '2015-09-15', '2015-09-06', 'dan', '123', 1, '2015-09-11 16:28:57', '2015-09-11 16:28:57');
/*!40000 ALTER TABLE `aprendizm` ENABLE KEYS */;


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


-- Volcando estructura para tabla evaluacioninstructores.centrom
CREATE TABLE IF NOT EXISTS `centrom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FK_Regional` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `centrom_fk_regional_foreign` (`FK_Regional`),
  CONSTRAINT `centrom_fk_regional_foreign` FOREIGN KEY (`FK_Regional`) REFERENCES `regionalm` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.centrom: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `centrom` DISABLE KEYS */;
INSERT INTO `centrom` (`id`, `Descripcion`, `Direccion`, `FK_Regional`, `created_at`, `updated_at`) VALUES
	(1, 'normal', 'calle', 6, '2015-09-10 15:12:13', '2015-09-10 15:12:13');
/*!40000 ALTER TABLE `centrom` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.coordinacion
CREATE TABLE IF NOT EXISTS `coordinacion` (
  `Codigo` int(5) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FK_Centro` int(5) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `FK_coordinacion_centro` (`FK_Centro`),
  CONSTRAINT `FK_coordinacion_centro` FOREIGN KEY (`FK_Centro`) REFERENCES `centro` (`Codigo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.coordinacion: ~8 rows (aproximadamente)
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


-- Volcando estructura para tabla evaluacioninstructores.coordinacionm
CREATE TABLE IF NOT EXISTS `coordinacionm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FK_Centro` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `coordinacionm_fk_centro_foreign` (`FK_Centro`),
  CONSTRAINT `coordinacionm_fk_centro_foreign` FOREIGN KEY (`FK_Centro`) REFERENCES `centrom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.coordinacionm: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `coordinacionm` DISABLE KEYS */;
INSERT INTO `coordinacionm` (`id`, `Nombre`, `FK_Centro`, `created_at`, `updated_at`) VALUES
	(1, 'jee', 1, '2015-09-10 15:12:25', '2015-09-10 15:12:25');
/*!40000 ALTER TABLE `coordinacionm` ENABLE KEYS */;


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


-- Volcando estructura para tabla evaluacioninstructores.cuestionariom
CREATE TABLE IF NOT EXISTS `cuestionariom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Fecha` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.cuestionariom: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cuestionariom` DISABLE KEYS */;
INSERT INTO `cuestionariom` (`id`, `Nombre`, `Fecha`, `created_at`, `updated_at`) VALUES
	(1, 'cuestionario 1', '2015-09-17', '2015-09-11 14:39:40', '2015-09-11 14:39:40');
/*!40000 ALTER TABLE `cuestionariom` ENABLE KEYS */;


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
  CONSTRAINT `FK_detalle_cuestionario_instructor` FOREIGN KEY (`FK_Instructor`) REFERENCES `instructorborrar` (`Id_Instructor`) ON DELETE SET NULL ON UPDATE CASCADE
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


-- Volcando estructura para tabla evaluacioninstructores.detalle_cuestionariom
CREATE TABLE IF NOT EXISTS `detalle_cuestionariom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FK_Cuestionario` int(10) unsigned NOT NULL,
  `FK_Ficha` int(10) unsigned NOT NULL,
  `FK_Instructor` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `detalle_cuestionariom_fk_cuestionario_foreign` (`FK_Cuestionario`),
  KEY `detalle_cuestionariom_fk_ficha_foreign` (`FK_Ficha`),
  KEY `detalle_cuestionariom_fk_instructor_foreign` (`FK_Instructor`),
  CONSTRAINT `detalle_cuestionariom_fk_cuestionario_foreign` FOREIGN KEY (`FK_Cuestionario`) REFERENCES `cuestionariom` (`id`),
  CONSTRAINT `detalle_cuestionariom_fk_ficha_foreign` FOREIGN KEY (`FK_Ficha`) REFERENCES `ficham` (`id`),
  CONSTRAINT `detalle_cuestionariom_fk_instructor_foreign` FOREIGN KEY (`FK_Instructor`) REFERENCES `instructorm` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.detalle_cuestionariom: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_cuestionariom` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_cuestionariom` ENABLE KEYS */;


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
  CONSTRAINT `FK_detalle_ficha_instructor` FOREIGN KEY (`FK_instructor`) REFERENCES `instructorborrar` (`Id_Instructor`) ON DELETE SET NULL ON UPDATE CASCADE
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


-- Volcando estructura para tabla evaluacioninstructores.detalle_fichasm
CREATE TABLE IF NOT EXISTS `detalle_fichasm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FK_Ficha` int(10) unsigned NOT NULL,
  `FK_Instructor` int(10) unsigned NOT NULL,
  `Titular` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `detalle_fichasm_fk_ficha_foreign` (`FK_Ficha`),
  KEY `detalle_fichasm_fk_instructor_foreign` (`FK_Instructor`),
  CONSTRAINT `detalle_fichasm_fk_ficha_foreign` FOREIGN KEY (`FK_Ficha`) REFERENCES `ficham` (`id`),
  CONSTRAINT `detalle_fichasm_fk_instructor_foreign` FOREIGN KEY (`FK_Instructor`) REFERENCES `instructorm` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.detalle_fichasm: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_fichasm` DISABLE KEYS */;
INSERT INTO `detalle_fichasm` (`id`, `FK_Ficha`, `FK_Instructor`, `Titular`, `created_at`, `updated_at`) VALUES
	(5, 1, 4, 'No', '2015-09-11 16:25:29', '2015-09-11 16:25:29');
/*!40000 ALTER TABLE `detalle_fichasm` ENABLE KEYS */;


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

-- Volcando datos para la tabla evaluacioninstructores.ficha: ~95 rows (aproximadamente)
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


-- Volcando estructura para tabla evaluacioninstructores.ficham
CREATE TABLE IF NOT EXISTS `ficham` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FK_Coordinacion` int(10) unsigned NOT NULL,
  `FK_Programa` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `ficham_fk_coordinacion_foreign` (`FK_Coordinacion`),
  KEY `ficham_fk_programa_foreign` (`FK_Programa`),
  CONSTRAINT `ficham_fk_coordinacion_foreign` FOREIGN KEY (`FK_Coordinacion`) REFERENCES `coordinacionm` (`id`),
  CONSTRAINT `ficham_fk_programa_foreign` FOREIGN KEY (`FK_Programa`) REFERENCES `programam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.ficham: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ficham` DISABLE KEYS */;
INSERT INTO `ficham` (`id`, `FK_Coordinacion`, `FK_Programa`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2015-09-10 15:12:49', '2015-09-10 15:12:49');
/*!40000 ALTER TABLE `ficham` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.instructorborrar
CREATE TABLE IF NOT EXISTS `instructorborrar` (
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

-- Volcando datos para la tabla evaluacioninstructores.instructorborrar: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `instructorborrar` DISABLE KEYS */;
INSERT INTO `instructorborrar` (`Id_Instructor`, `Documento`, `Tipo_Documento`, `Nombres`, `Apellidos`, `Correo`, `TipoInstructor`, `Foto`) VALUES
	(1, 213789678, 'C.C.', 'Pedro', 'Pedrez', '-', 'Tecnico', NULL),
	(2, 231454234, 'C.C.', 'Manpinta', 'Jee', '-', 'Transversal', NULL),
	(3, 0, '', 'DIEGO ALEJANDRO', 'BOADA MORALES', '-', '', NULL);
/*!40000 ALTER TABLE `instructorborrar` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.instructorm
CREATE TABLE IF NOT EXISTS `instructorm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Documento` bigint(20) NOT NULL,
  `Tipo_documento` enum('T.I','C.C','CE','PASS','NIT') COLLATE utf8_unicode_ci NOT NULL,
  `Nombres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Correo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipoInstructor` enum('TRANSVERSAL','TECNICO') COLLATE utf8_unicode_ci NOT NULL,
  `foto` blob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.instructorm: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `instructorm` DISABLE KEYS */;
INSERT INTO `instructorm` (`id`, `Documento`, `Tipo_documento`, `Nombres`, `Apellidos`, `Correo`, `tipoInstructor`, `foto`, `created_at`, `updated_at`) VALUES
	(4, 1, 'T.I', 'Daniel', 'Moreno', 'd@.com', 'TRANSVERSAL', _binary '', '2015-09-10 15:13:24', '2015-09-10 15:13:35');
/*!40000 ALTER TABLE `instructorm` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.instructors
CREATE TABLE IF NOT EXISTS `instructors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.instructors: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.migrations: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1),
	('2015_09_04_133455_instructor', 2),
	('2015_09_04_171956_instructor', 3),
	('2015_09_04_172124_regional', 3),
	('2015_09_04_172130_centro', 4),
	('2015_09_04_172138_coordinacion', 5),
	('2015_09_04_174342_programa', 6),
	('2015_09_05_005651_programa', 7),
	('2015_09_05_005726_ficha', 8),
	('2015_09_08_221400_create_instructors_table', 9),
	('2015_09_08_223803_users', 10),
	('2015_09_11_022858_cuestionario', 11),
	('2015_09_11_025157_detalle_cuestionario', 12),
	('2015_09_11_154940_create_dfichas_table', 13);
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


-- Volcando estructura para tabla evaluacioninstructores.programam
CREATE TABLE IF NOT EXISTS `programam` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.programam: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `programam` DISABLE KEYS */;
INSERT INTO `programam` (`id`, `Nombre`, `Descripcion`, `created_at`, `updated_at`) VALUES
	(1, 'yee', 'normal', '2015-09-10 15:12:41', '2015-09-10 15:12:41');
/*!40000 ALTER TABLE `programam` ENABLE KEYS */;


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


-- Volcando estructura para tabla evaluacioninstructores.regionalm
CREATE TABLE IF NOT EXISTS `regionalm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.regionalm: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `regionalm` DISABLE KEYS */;
INSERT INTO `regionalm` (`id`, `Nombre`, `Descripcion`, `created_at`, `updated_at`) VALUES
	(2, 'Distrito capital', 'activo', '2015-09-09 02:21:24', '2015-09-09 02:21:24'),
	(3, 'Antioquia', 'Inactivo', '2015-09-09 02:21:41', '2015-09-09 02:21:41'),
	(4, 'Manizales', 'activo', '2015-09-09 02:21:58', '2015-09-09 02:21:58'),
	(5, 'costa atalntico', 'por confirmar', '2015-09-09 02:22:22', '2015-09-09 02:22:22'),
	(6, 'Faustino', 'Asprilla', '2015-09-09 02:22:49', '2015-09-09 02:22:49'),
	(7, 'Meta', 'activo', '2015-09-09 02:23:06', '2015-09-09 02:23:06');
/*!40000 ALTER TABLE `regionalm` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla evaluacioninstructores.users: ~100 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Guillermo', 'Jorge08@yahoo.es', '$2y$10$B5w0guNtBoC6wAui.0V0UOI8s6x7mKoQ/76jO3BsgsWgkUyRrwcvC', '0Z7sYX0gPLFqL9cixiBzv9g44oaKiBk9pIbztccmDW362VuoMb2GggocznsG', '0000-00-00 00:00:00', '2015-09-11 01:30:02'),
	(2, 'Berta', 'iBenitez@Baeza.com', '$2y$10$mrbR/bQOT5Fuuor3TtmLJOyiqT4J3j1cFxABNwuHBjNYs10NDwHD2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'Africa', 'Navarro.Cristian@Anaya.com.es', '$2y$10$kYVC8S5c.eYz68DV1LDOVe1arJ8tDKwKLV54Zq5Rd4RmZSmmB09L6', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(4, 'Jose', 'Muniz.Bruno@Rael.com', '$2y$10$8M7G.KbsR150v4Ot7UttKOQ7v/ERbuuRso/YJjPDlqkTyIwHlaJZ.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(5, 'Ignacio', 'fOrosco@Abreu.com', '$2y$10$ssbmicJa7Ccf0zR9RGBTgeHxjiTExW9B.gl9qguACwIPmZjX1aaee', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(6, 'Izan', 'Riera.Fatima@Redondo.es', '$2y$10$IOastXUfav2CEtHs8Lr7xe.uqPBN94a/0uDmOqrnJM14XUN1IMnXu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(7, 'Zoe', 'Daniela38@Jimenez.es', '$2y$10$rxRbnJb5XaIREeXjTFW.uOQ6JLD5tN0ZVcjNwknGvyZU9Df5PbhMa', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(8, 'Luna', 'Aleix12@hotmail.es', '$2y$10$qjubGM5JrmyVghr3BnlGweuiPCeanfoenzaq/.ZXlb4Jcz9/04TCS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(9, 'Dario', 'Victoria.Blazquez@yahoo.es', '$2y$10$6esJxJwt45bdR0pEylXHy.Ce3wQo.k.0nG3q87pTCObzrfIMcE4yu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(10, 'Fernando', 'Cuellar.Paula@Parra.net', '$2y$10$OR6KW9u862jPfKcPb2IXpuPOkhItRhwnUQ0q3c7Lg5u5VkLvtJ5ay', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(11, 'Irene', 'Aina55@Palacios.org', '$2y$10$7IBGqaKb9q0sBTSHYLz2zuUMsepCHdPHWcQJRYM31aEY0gVnNeymC', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(12, 'Javier', 'Gallegos.Guillem@Salazar.org', '$2y$10$Z6XuKknTLxrwoSr/VW5tEeucf.bvOkckKE5Cw8MHctRJ1IufiwaWG', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(13, 'Clara', 'Madera.Andrea@Conde.com', '$2y$10$DRSH8AGY5RR8WUQ7UHiEU.Oymp8BjdgJ4uQLyRwaXffQsZt3ZtRQe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(14, 'Lola', 'Caldera.Diana@Salgado.com', '$2y$10$/hqJyRoO5ooVG5J.5dBWy.xxbYU1zsMz0kAiGHia.sgKyWXY/orc6', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(15, 'Arnau', 'Francisco.Delrio@Quinones.com.es', '$2y$10$3ThjKrvxYqnNz/FOXfIozOVv0RWeFPPj664mMkEQSFSa789eQi.O2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(16, 'Iker', 'Anna13@Ybarra.com', '$2y$10$aCwAx3vXthEVb.e1e6iGcupyIFJgku79c0o3n7kevy379TZ4nQ7La', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(17, 'Celia', 'Juarez.Fatima@hispavista.com', '$2y$10$ArkmKXtZDkKSkPdCHEjV6eqEXclhdBfsku5foCbndP5ozMkCUmLw.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(18, 'Fatima', 'Rascon.Lara@terra.com', '$2y$10$fjWhI/qNjAa8qLlYn5iGoODNsSMxeUIwbXamLyT.rrHJ3mK5urVa6', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(19, 'Leo', 'Isabel.Teran@live.com', '$2y$10$jzElWEZJD9pIRJAUbXUMsu7HK65p8meTGfc9n8ZffxUtk1L6irhxK', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(20, 'Noelia', 'Coronado.Mireia@Sevilla.net', '$2y$10$FzuIq.tES0gp6tkA.H9Zv.6KiF29sXPUq6eZgVZ3rddkuQPIOk77.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(21, 'Blanca', 'Aguado.Ariadna@Canales.es', '$2y$10$KLZLkTfheif6rpaUEGnKveYt3iI6ITs8lvJEf1tlnfGAzKZRwhy5.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(22, 'Ines', 'Hidalgo.Laia@Peralta.com', '$2y$10$0ovZhHV02lZ5F5hD9NnZRuzXcwULrW/MxWvlLyqmxNmnCyECHzOym', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(23, 'Mireia', 'oSierra@hispavista.com', '$2y$10$yDamyld3eq50MVAcRcjKNOubzVteR87nvQlntioRMiIhjqo7.snFG', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(24, 'Jose Antonio', 'Montoya.Rayan@Botello.org', '$2y$10$neNYFJrOwApA4rL3yxQnVO9YPcPRLmDERhIvQg6cajpugsQDeESWK', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(25, 'Oscar', 'fMata@Orosco.org', '$2y$10$fkkxuGOIBYdXHc/.uoj5Re2IDEs2SewD90PVIU8AAiZPKHJP3v.Je', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(26, 'Leyre', 'Estevez.Malak@Rojas.com', '$2y$10$9CTEVoxHztJWlXODqS3H9eVD5sBKH21uSGh7G0ejhHCfvnOTkC8w6', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(27, 'Andrea', 'Manuela06@hotmail.es', '$2y$10$xL7SoiKtjJ2xKhlxOgXPPulwEkYmF7yYUiJ8NoYFPiKTx51ECfdcy', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(28, 'Raquel', 'fBarela@terra.com', '$2y$10$BaejvHFXX43IvaCPE9fXXusxpR.D7rdlS3pa0lsqFSUehsjdFaECq', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(29, 'Dario', 'Pol88@latinmail.com', '$2y$10$C3nJ2PxZwoMRpRo58KbLnO6vU7bexcXLHbHsha/Aji3pLTYLqJLSO', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(30, 'Isabel', 'Marina54@latinmail.com', '$2y$10$kXUIAYeR7yu1F3DStjZXOuyNhZqlXCnmRZbqrOgecA7XJRc7kZn8G', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(31, 'Aroa', 'Naia.Alcala@latinmail.com', '$2y$10$qPF.qgCntk5c5vN6wBs64.ZrVzuYs5W8e7YisD4mrTHAxo6ASFQHS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(32, 'Lucia', 'nConde@Galarza.com', '$2y$10$jsQ/zkq242i/nJtx.QhAwOfa9phKJldh0HdOQ8JVdrLETq4uqpnym', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(33, 'Marta', 'Bautista.Alejandro@Abeyta.es', '$2y$10$PndkKrC4H2ucqzRvbDWKsuwwCmY1sctNLpFMlrgoMBzOQIi06MmzO', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(34, 'Juan', 'Caldera.Marina@Perales.com.es', '$2y$10$6nyBROGWafFuxY92NBaChew3kliISY/TRi.XblCw7vilZitpBIiWW', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(35, 'Angel', 'Naiara90@Caballero.com', '$2y$10$IlJZ3k5BK6uK4iLKksDJ2eysnw0h3/Kfd17XGmFJ0clDeARVX0iSy', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(36, 'Helena', 'Angel02@Tejada.com', '$2y$10$ZhiICv9/VeZ4PzTloHHOou7leT3LyG3cAqb8aMl8.w1ZPk2srZgIK', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(37, 'Ane', 'Silvia.Menendez@Montemayor.com', '$2y$10$Ov/GurGa3L6AJ9kf2xaUEeuqeaQvaqS9WffpzTEpLohw2eekdMj36', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(38, 'Natalia', 'Sanabria.Ian@Merino.com', '$2y$10$vJcDpjrnEBfIgjx/2Zh7X.amB9itMqU.MBjcx0MypPw4bhvCiLEGO', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(39, 'Mohamed', 'Rico.Victor@Padilla.com', '$2y$10$N6pC/8R.8LK4SVhLRUJk2u5bSmz9GeCgZpy.tJ.Yff5GJyGx4PQVS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(40, 'Helena', 'Diego.Canales@gmail.com', '$2y$10$dwh9eaeY2rt5WhPrCM6mV.20eWIXeOl/a0RAb4.v4YtKU2R1HogpK', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(41, 'Ainhoa', 'zDomenech@gmail.com', '$2y$10$kU8KPyv7/8SCn6TwFO4VLOHDLEcKhHJDoQ5CUn7h4RghslWZGjfC2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(42, 'Sandra', 'Luevano.Jon@Alba.org', '$2y$10$UYABDS4WZqRlkSkZxJv2vu0jjxHAgo4b5u369zs83VTkmwKCUhX2u', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(43, 'Olivia', 'gGrijalva@Pozo.com', '$2y$10$y.wZu/.GBMC3ZNGVjFlch./sSm/QckMGgv8Ad9aZvA2qZH3mGI.SW', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(44, 'Victoria', 'Ainara05@Narvaez.com.es', '$2y$10$sAjZFx2siar4KqZ4obs0tOeCOMbfWxiXY3C.fiuiJi5SYgS.dmgb.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(45, 'Vera', 'qFarias@Veliz.es', '$2y$10$dDmYvHv/77dheqp.ZWFYoOsvGsgIdBxv8ta0zwIh3eD4kqNl12w5u', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(46, 'Jose', 'Sara78@Exposito.net', '$2y$10$5jPUUf4mB8Onj47EWqIKh.uqLwvqSC34CljRFVe966GknI7fUK10S', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(47, 'Africa', 'zEscalante@hispavista.com', '$2y$10$555rw9JQsv4Fius4yMkz4uyNGCF4kz2Z1fzvcPx.3ZRl4S20rMs6e', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(48, 'Isaac', 'Toro.Pol@Cortes.net', '$2y$10$uyLtx9xmamuNE5IoivjwGelJ9PjN9zT1xpygi/1cDhnydUANfJvGq', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(49, 'Raquel', 'zEsteban@Casares.com', '$2y$10$iH4wNnttqyjeXxivZ7xuNufzdtyPERo55hg3KH55Ypq9FSf5sHeG.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(50, 'Yaiza', 'Quezada.Hector@live.com', '$2y$10$J39OrN6kxtGlCcoDhBWiN.PPTYiVk3LBi2GHadp0fMgXxRgOkFE9.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(51, 'Ander', 'Yaiza.Granados@yahoo.es', '$2y$10$xL5kCZjaYgERvSJFDJOmSe4wXB/bnQeI4pAB2ZXLwH5lfr.TPrRW2', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(52, 'Francisco Javier', 'Nora16@yahoo.com', '$2y$10$PlyfV5ZtFlqCL.iU6llsTuhXjanHA0bNKw4tK39hDoTX7Sq.MN0gS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(53, 'Carolina', 'Laia.Gonzales@live.com', '$2y$10$Je1KvGzUpr8snSeJq.wsuu2XayvMRAI6VOb.Z.Q0ukDgpqX4kbk..', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(54, 'Jose Antonio', 'tRivero@Serna.es', '$2y$10$FLeWaaBRy.uQCOT.y.DCR.3INxUjzqEgXZ5JBYmA29Pp.85YaKJoq', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(55, 'Valentina', 'Alvaro.Reyna@Armenta.org', '$2y$10$CIMOlCU.gLVwBmzU.mtZB.83LbZ6k7s09xxpvz9wztw1AQSdIAeiu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(56, 'Maria', 'Paula52@Longoria.com', '$2y$10$0VdQeBClb7sgtiJHBrn8O.fCxvizTvhXfKwKz5uKF3.IrgGr8k05K', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(57, 'Laura', 'Alexandra32@Ruvalcaba.com', '$2y$10$q0IXZDoMPt8zsx/.woYlOeqzK0E9NvDDM8Tfe9gOODJwgbTvMgMAG', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(58, 'Blanca', 'Carbajal.Laura@Bernal.es', '$2y$10$btwDg5MYYDvguMycDWF74.Z3FHVeWBlvE7HOy5qnx9h7qIZy7ucF.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(59, 'Eduardo', 'Naiara87@hotmail.com', '$2y$10$yLPMOlZ5.ZsbmJpt9RmZFuh3nmHZcUOLG.vri2BU5GUWQvb8dLb0G', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(60, 'Guillermo', 'Escalante.Hugo@Barragan.com', '$2y$10$Noa4vkRvzkNDjSnLrKMg0ugNpOFGeLA64k8uK7rjQVxhJhy4JtRSy', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(61, 'Daniel', 'Almanza.Gael@hotmail.es', '$2y$10$ff4rpXROXTR4AHfAhbBug.yKpBJIybcz3Vez0y9gVodb4SmYwMtAq', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(62, 'Miguel', 'Santiago.Orta@Vigil.net', '$2y$10$kbIBR3NE/gudfgWo/tmA4ux2AKWpQtFJFqyXR6kL0scng/Ai9t0Hq', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(63, 'Ona', 'Izan34@Quiroz.net', '$2y$10$F/FwKO4WjCHmfFhKSJpLVenY.voif/xwvJuUKqK6Vgj5EWOr1RvSu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(64, 'Gonzalo', 'Cardona.Andres@hotmail.es', '$2y$10$69JB9vRvL1kiPNrS9KnjLOftyYDX4CdvEal6d.3VRNfpNMiYorQFK', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(65, 'Ane', 'uJaimes@yahoo.es', '$2y$10$DocVf3.Xq0Ii6F.hliVQ/uxws.UHfIxn11Kz2cz8qBjQ6h3pGNssO', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(66, 'Yaiza', 'Sofia.Osorio@Vera.com.es', '$2y$10$q7RV/LFt1sLOuBEo2xZaXu7L.pTIXoNaGyIvRKx6K7xe/3r7.5Gke', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(67, 'Ainara', 'gSaldana@yahoo.com', '$2y$10$hmAINM9hky41JHE1jyxuUOkDO6IYld0SZSZlq2APss9cZ7nLzsmfS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(68, 'Gonzalo', 'Cristian.Ibanez@gmail.com', '$2y$10$STRS.LoY3CWhxbbjad564OcBYOcrsA18EUuQxSpu9Z69TNSwbz1sG', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(69, 'Pol', 'Sisneros.Pablo@yahoo.com', '$2y$10$zkt9DicWh/T3Jw9CB0MW/e7E2D3YRHG.JSPv1kIsseWvUZSRTvIyG', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(70, 'Omar', 'Ordonez.Fernando@gmail.com', '$2y$10$mTFOas4IPV8W3WX7pmKcluNTX2sUdgoQlsIALSop8Bhcolvf8xYZe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(71, 'Javier', 'Sofia.Maldonado@Carreon.es', '$2y$10$pVtDH2XT6fkmg.TTrrpGmuDZnpEiVeEGyEzSJ4PluBRf8OqPCGofa', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(72, 'Mohamed', 'Delgado.Angela@latinmail.com', '$2y$10$qgroq/TAZtfzyJVXKfzzZ.c0P9QB9yCWK9WuDaoTeYTkDMBQWQDLu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(73, 'Victor', 'Paola19@Menchaca.com', '$2y$10$.seRgSVvvGzUQk4cqJmJg.BE4tX06akTgv3s4cOf2ojj1z9WmEF7y', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(74, 'Alba', 'Erik.Zapata@hispavista.com', '$2y$10$XdBHp63jjMIJAP7bvv9bg.gcjacwNV.ufRBumlxEYf.R/wX5pA37O', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(75, 'Valentina', 'Asier47@Valentin.net', '$2y$10$b07vsfXlJb2dVcjkY.SsIu2tbemUdofhyAXNi2QdAeoDSMxNdtHiu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(76, 'Celia', 'Diana10@latinmail.com', '$2y$10$sMXhXFMnpzrsI2MsS1wF9eamhLXVgWCJByT78XnzHOXzK0YPrP3NO', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(77, 'Rodrigo', 'oCorona@Leyva.com', '$2y$10$5zk4d.kUEa4kTwIOj4UwO.9xocSCAwMPfYWB0ZqNE1CpitUeFKh6C', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(78, 'Aroa', 'Adria26@Zamora.org', '$2y$10$.iYBiNoetXxR661dBqzKY.MvJJRoJdH.l0PjPfQ05KJAeBcWZlpvC', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(79, 'Martin', 'Beatriz58@Haro.es', '$2y$10$dbxiNFcjcNPkbLM8qklIE.D.Y6PAfkF1b9RTXqoA0MT7eXdMmxA0C', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(80, 'Alejandro', 'Nil.Ybarra@Sepulveda.es', '$2y$10$utfVSmmf3/OmG07zwOPodO6Z4qHcjpogedkbjB8a334Lsag.G/Vr6', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(81, 'Clara', 'sMayorga@Mojica.es', '$2y$10$nuRvNKDuXFQ4bmxxVW3VGOyLJ/JiTsqYPhK6K7AlnKaBjdBKiFaQi', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(82, 'Elena', 'Ramon.Ana@Correa.com', '$2y$10$ItSyz246HGKFPZbJ5LxoIO10iI3cHB056Kl2i1L7wFGTXUGpKHl0e', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(83, 'Oriol', 'Bueno.Victor@terra.com', '$2y$10$zEiBnWpENxCvV0P5ULD8/OWZkYzfslERPHjFA4bFn1FovWkhaQWtS', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(84, 'Gael', 'jHerrero@live.com', '$2y$10$HGPsdV5XQdgXIAX195bWAOnhJbU6d53PkeLW3rIUELqGUwGDDw8Zy', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(85, 'Alberto', 'Yeray65@Macias.es', '$2y$10$wVQyDEq9waUCPUEASXxd7utIq14PFNy6IRTOribEI2ahofOl/aR7K', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(86, 'Javier', 'Carbajal.Beatriz@Valdivia.es', '$2y$10$oPBS6qwbobatibSW6HPb..S9HYSw50kb76d4vpyaDw.RjV4bW1Gde', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(87, 'Pedro', 'Jimena.Palacios@Sandoval.org', '$2y$10$HpRwEblW0MjvQ2mMZRkG6OgmCEftcAqu5DQzU8FwZjQlkVG1tplxq', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(88, 'Biel', 'Naia28@Olivera.com.es', '$2y$10$SElV6EpYrI2ClabA6vNGE.EcuhBorFF4XCg62P0Qma8dNH9B.HtV6', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(89, 'Manuela', 'Iker76@Toledo.org', '$2y$10$qCdlpm7KnAUE6AIvPNj9numSbZkf7naMXec/iEf6dcNfRakwKgf32', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(90, 'Jose', 'Toro.Cristian@Florez.com.es', '$2y$10$ZN5D530pHmSep5VXrilNyurRNEU5MY/gBIG/ba2CwNOQx9a4KwrVa', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(91, 'Carolina', 'Celia19@Garcia.es', '$2y$10$3UNAZnaWTo99fZirSyANMuMz6n5pnF/5EjTErUW6D808.4340AoDW', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(92, 'Mara', 'nNavarrete@Villa.com', '$2y$10$kRyddelVVAuAH/cU2IeoTOpYcMcvCwgZZVLVvaV8AJY/NKj2HZt8q', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(93, 'Santiago', 'Angulo.David@Otero.com', '$2y$10$ORHcV.dk/xXbRjUA6mjvue/N1eXldCb46xRJb3LBtkj4Wk72HQCKO', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(94, 'Africa', 'Delarosa.Yeray@terra.com', '$2y$10$1PsynO6KDU4LuGVbZ8nQhe.YwWUEB3./JawXo1JTuPeQvZ/8gOchi', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(95, 'Guillem', 'sSantacruz@Serrano.com', '$2y$10$AFGbcR/GZq/U7D60pxf59uI6Oqr5lAqOnyoPIyQlx/hAWHgYNdeKG', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(96, 'Rocio', 'sMenendez@live.com', '$2y$10$qsJ7eaA56Vlg1O09goZP0uQPu7vZ/7/uwabF90DWMmJ0DA6y0YMCK', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(97, 'Pedro', 'nLimon@Mateos.es', '$2y$10$q8y./vMhEQWY3WWMeUYzCOpFfb.MAMaBwo/eTaE82caUE87gyl6m.', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(98, 'Arnau', 'Lucas.Olivares@Briseno.com', '$2y$10$VKzGwEJE3GyDR0uAFsfbNe.w5iZHaMYDTSdQaC97FHqAfiDptXcIa', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(99, 'Ainhoa', 'Nora.Ruiz@terra.com', '$2y$10$dwZVuJc58.BMikB6OEVaTeEHqC4LxxG8nos.ZL7czi4PpQXvzHygu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(100, 'Erika', 'Noelia40@terra.com', '$2y$10$Ft57XtSVzs/PFAjOQSnwdedKm82v6GlOecKXD08ny5ahKBEVFE6h6', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
