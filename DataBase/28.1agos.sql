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

-- Volcando datos para la tabla evaluacioninstructores.centro: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `centro` DISABLE KEYS */;
INSERT INTO `centro` (`Codigo`, `Descripcion`, `Direccion`, `FK_Regional`) VALUES
	(56456, 'Centro de Gestión de Mercados, Logística y TI', 'Calle 52 # 13 - 65', 3845);
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

-- Volcando datos para la tabla evaluacioninstructores.coordinacion: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `coordinacion` DISABLE KEYS */;
INSERT INTO `coordinacion` (`Codigo`, `Nombre`, `FK_Centro`) VALUES
	(1, 'Fontibon', NULL),
	(2, 'Convergys', NULL),
	(3, 'Articulacion', NULL),
	(4, 'Logistica', NULL),
	(5, 'Mercadeo', NULL),
	(6, 'IndustriasCreativas', NULL),
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
	(1, 2456, NULL, NULL),
	(2, 2456, 599557, 2),
	(3, 3123, 599557, 2),
	(4, 3123, 599557, 5),
	(5, 2456, 599557, 7);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.detalle_ficha: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_ficha` DISABLE KEYS */;
INSERT INTO `detalle_ficha` (`id_detalle_ficha`, `FK_ficha`, `FK_instructor`, `Titular`) VALUES
	(1, 912296, 21, 'S'),
	(2, 912296, 16, 'N'),
	(3, 912296, 20, 'N'),
	(4, 912294, 16, 'S'),
	(5, 912294, 21, 'N'),
	(6, 912294, 20, 'N'),
	(7, 912292, 20, 'S'),
	(8, 912292, 16, 'N'),
	(9, 912292, 16, 'N');
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

-- Volcando datos para la tabla evaluacioninstructores.ficha: ~248 rows (aproximadamente)
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` (`Codigo`, `FK_Coordinacion`, `FK_Programa`) VALUES
	(577560, 1, NULL),
	(578580, 7, NULL),
	(578582, 7, NULL),
	(578598, 7, NULL),
	(578884, 8, NULL),
	(579395, 8, NULL),
	(580068, 5, NULL),
	(580094, 5, NULL),
	(581242, 4, NULL),
	(598724, 4, NULL),
	(598851, 5, NULL),
	(599323, 7, NULL),
	(599337, 7, NULL),
	(599346, 7, NULL),
	(599557, 1, NULL),
	(599559, 1, NULL),
	(599573, 4, NULL),
	(620004, 4, NULL),
	(628300, 7, NULL),
	(628304, 5, NULL),
	(628306, 7, NULL),
	(628308, 7, NULL),
	(628687, 6, NULL),
	(628690, 7, NULL),
	(628692, 6, NULL),
	(628696, 6, NULL),
	(628720, 6, NULL),
	(633350, 7, NULL),
	(661371, 4, NULL),
	(661383, 4, NULL),
	(661384, 7, NULL),
	(661385, 6, NULL),
	(661387, 5, NULL),
	(661388, 5, NULL),
	(661394, 8, NULL),
	(673587, 5, NULL),
	(679444, 7, NULL),
	(679458, 7, NULL),
	(679465, 7, NULL),
	(679470, 7, NULL),
	(679493, 6, NULL),
	(683845, 4, NULL),
	(685811, 5, NULL),
	(685812, 5, NULL),
	(720211, 7, NULL),
	(749329, 6, NULL),
	(749640, 5, NULL),
	(750201, 7, NULL),
	(750202, 7, NULL),
	(750211, 7, NULL),
	(750212, 7, NULL),
	(752047, 4, NULL),
	(752066, 4, NULL),
	(752081, 4, NULL),
	(752088, 4, NULL),
	(752669, 4, NULL),
	(752967, 5, NULL),
	(753798, 4, NULL),
	(791749, 4, NULL),
	(794092, 8, NULL),
	(794096, 8, NULL),
	(794098, 8, NULL),
	(805076, 8, NULL),
	(812058, 1, NULL),
	(812063, 1, NULL),
	(812460, 4, NULL),
	(812461, 4, NULL),
	(812463, 4, NULL),
	(812466, 4, NULL),
	(812468, 4, NULL),
	(812904, 5, NULL),
	(814144, 7, NULL),
	(814145, 7, NULL),
	(814170, 7, NULL),
	(821466, 4, NULL),
	(827864, 8, NULL),
	(827866, 8, NULL),
	(843872, 8, NULL),
	(846047, 5, NULL),
	(846049, 5, NULL),
	(854097, 4, NULL),
	(858069, 4, NULL),
	(864525, 4, NULL),
	(864576, 6, NULL),
	(864584, 6, NULL),
	(864600, 6, NULL),
	(864603, 6, NULL),
	(864608, 6, NULL),
	(864616, 4, NULL),
	(864620, 6, NULL),
	(864625, 4, NULL),
	(864627, 4, NULL),
	(864629, 4, NULL),
	(864630, 4, NULL),
	(864637, 4, NULL),
	(864647, 4, NULL),
	(864754, 7, NULL),
	(864755, 7, NULL),
	(864759, 7, NULL),
	(864760, 7, NULL),
	(864772, 7, NULL),
	(864774, 7, NULL),
	(864778, 7, NULL),
	(864779, 7, NULL),
	(864784, 7, NULL),
	(864840, 7, NULL),
	(864850, 7, NULL),
	(866552, 8, NULL),
	(866553, 8, NULL),
	(867258, 1, NULL),
	(878912, 1, NULL),
	(879241, 8, NULL),
	(879502, 8, NULL),
	(879790, 1, NULL),
	(887847, 8, NULL),
	(892785, 8, NULL),
	(892788, 8, NULL),
	(893311, 7, NULL),
	(893313, 7, NULL),
	(893316, 7, NULL),
	(893317, 7, NULL),
	(893318, 7, NULL),
	(893320, 7, NULL),
	(893321, 7, NULL),
	(893322, 7, NULL),
	(893323, 7, NULL),
	(894395, 6, NULL),
	(895018, 1, NULL),
	(896800, 7, NULL),
	(897513, 8, NULL),
	(897520, 8, NULL),
	(897523, 8, NULL),
	(898712, 1, NULL),
	(899317, 4, NULL),
	(899328, 4, NULL),
	(899329, 4, NULL),
	(899379, 5, NULL),
	(899380, 5, NULL),
	(899401, 5, NULL),
	(899786, 1, NULL),
	(899787, 1, NULL),
	(899788, 1, NULL),
	(899789, 1, NULL),
	(899790, 1, NULL),
	(899791, 1, NULL),
	(899794, 1, NULL),
	(899795, 1, NULL),
	(899796, 1, NULL),
	(899797, 1, NULL),
	(899798, 1, NULL),
	(899799, 1, NULL),
	(899801, 1, NULL),
	(899810, 1, NULL),
	(900548, 8, NULL),
	(900549, 5, NULL),
	(900557, 5, NULL),
	(900563, 5, NULL),
	(900564, 5, NULL),
	(900565, 5, NULL),
	(900566, 5, NULL),
	(901068, 6, NULL),
	(901092, 6, NULL),
	(901118, 6, NULL),
	(901121, 6, NULL),
	(901123, 6, NULL),
	(901134, 6, NULL),
	(901139, 6, NULL),
	(901321, 6, NULL),
	(901437, 4, NULL),
	(901438, 5, NULL),
	(901440, 4, NULL),
	(901447, 5, NULL),
	(901450, 5, NULL),
	(901451, 4, NULL),
	(901452, 5, NULL),
	(901453, 4, NULL),
	(901454, 4, NULL),
	(901461, 5, NULL),
	(904135, 1, NULL),
	(904716, 5, NULL),
	(906289, 8, NULL),
	(907616, 2, NULL),
	(907630, 2, NULL),
	(912292, 3, NULL),
	(912294, 3, NULL),
	(912296, 3, NULL),
	(912297, 3, NULL),
	(912301, 3, NULL),
	(912302, 3, NULL),
	(912312, 3, NULL),
	(912540, 1, NULL),
	(912697, 8, NULL),
	(913009, 8, NULL),
	(913055, 8, NULL),
	(919438, 3, NULL),
	(919439, 3, NULL),
	(919446, 3, NULL),
	(919451, 3, NULL),
	(919456, 3, NULL),
	(919457, 3, NULL),
	(921427, 8, NULL),
	(921434, 8, NULL),
	(921446, 8, NULL),
	(921464, 4, NULL),
	(921521, 1, NULL),
	(921533, 8, NULL),
	(923858, 3, NULL),
	(923860, 3, NULL),
	(924151, 3, NULL),
	(929276, 3, NULL),
	(929291, 3, NULL),
	(929787, 8, NULL),
	(929821, 8, NULL),
	(930526, 2, NULL),
	(930533, 2, NULL),
	(937148, 2, NULL),
	(937154, 2, NULL),
	(937159, 2, NULL),
	(938069, 1, NULL),
	(938070, 1, NULL),
	(938071, 1, NULL),
	(947902, 4, NULL),
	(948306, 5, NULL),
	(953689, 2, NULL),
	(953695, 2, NULL),
	(953696, 2, NULL),
	(953698, 2, NULL),
	(953709, 2, NULL),
	(953713, 2, NULL),
	(953714, 2, NULL),
	(953725, 2, NULL),
	(953726, 2, NULL),
	(957411, 2, NULL),
	(957429, 2, NULL),
	(957430, 2, NULL),
	(957440, 2, NULL),
	(958526, 5, NULL),
	(961792, 1, NULL),
	(968184, 1, NULL),
	(975124, 2, NULL),
	(975129, 2, NULL),
	(975145, 2, NULL),
	(975707, 2, NULL),
	(975731, 2, NULL),
	(979074, 2, NULL),
	(979076, 2, NULL),
	(979077, 2, NULL),
	(979078, 2, NULL);
/*!40000 ALTER TABLE `ficha` ENABLE KEYS */;


-- Volcando estructura para tabla evaluacioninstructores.instructor
CREATE TABLE IF NOT EXISTS `instructor` (
  `Id_Instructor` int(5) NOT NULL AUTO_INCREMENT,
  `Documento` bigint(20) DEFAULT NULL,
  `Tipo_Documento` varchar(5) DEFAULT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Correo` varchar(50) NOT NULL DEFAULT '-',
  `TipoInstructor` varchar(20) NOT NULL,
  `Foto` binary(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Instructor`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla evaluacioninstructores.instructor: ~245 rows (aproximadamente)
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` (`Id_Instructor`, `Documento`, `Tipo_Documento`, `Nombres`, `Apellidos`, `Correo`, `TipoInstructor`, `Foto`) VALUES
	(1, NULL, NULL, 'OLGA JUDITH ', 'SALAS VESGA', '-', 'TRANSVERSAL', NULL),
	(2, NULL, NULL, 'CLAUDIA JENITH ', 'AGUILAR SALINAS', '-', 'TRANSVERSAL', NULL),
	(3, NULL, NULL, 'INGRID CATHERINE', ' QUIROZ VEGA', '-', 'TRANSVERSAL', NULL),
	(4, NULL, NULL, 'DAVID ', 'CACERES', '-', 'TRANSVERSAL', NULL),
	(5, NULL, NULL, 'JORGE ENRIQUE ', 'VILLA VILLAMIL ', '-', 'TECNICO', NULL),
	(6, NULL, NULL, 'VIVIANA ANDREA', ' GUZMAN LUNA ', '-', 'TECNICO', NULL),
	(7, NULL, NULL, 'FELIPE ', 'ALFONSO ISAZA', '-', 'TECNICO', NULL),
	(8, NULL, NULL, 'VIVIAM MAYERLI ', 'HERNANDEZ AMAYA ', '-', 'TECNICO', NULL),
	(9, NULL, NULL, 'JUAN CAMILO ', 'BOHORQUEZ RODRIGUEZ', '-', 'TECNICO', NULL),
	(10, NULL, NULL, 'VICTOR HUGO ', 'REYES MORENO ', '-', 'TECNICO', NULL),
	(11, NULL, NULL, 'CARLOS ARTURO', ' GARCIA OMEZ', '-', 'TECNICO', NULL),
	(12, NULL, NULL, 'DAVID ', 'MEJIA VARON ', '-', 'TECNICO', NULL),
	(13, NULL, NULL, 'CLAUDIA PATRICIA', 'RAMIREZ AVILA', '-', 'TECNICO', NULL),
	(14, NULL, NULL, 'LEONARDO FABIO ', 'GUTIERREZ GALVIS', '-', 'TECNICO', NULL),
	(15, NULL, NULL, 'SERGIO IVAN ', 'SALGUERO RODRIGUEZ', '-', 'TECNICO', NULL),
	(16, NULL, NULL, 'ROBERTO JULIAN', 'RIAÑO RIOS ', '-', 'TECNICO', NULL),
	(17, NULL, NULL, 'JORGE ENRIQUE ', 'FONSECA GARCIA', '-', 'TECNICO', NULL),
	(18, NULL, NULL, 'LEONARDO FAVIO  ', 'BRAVO GUAQUETA', '-', 'TECNICO', NULL),
	(19, NULL, NULL, 'XIOMARA ANDREA ', 'ESPINOSA ESTUPIÑAN', '-', 'TECNICO', NULL),
	(20, NULL, NULL, 'ALEJANDRO ', 'MUNEVAR BETANCOURT', '-', 'TECNICO', NULL),
	(21, NULL, NULL, 'DIEGO ALEJANDRO ', 'BOADA MORALES', '-', 'TECNICO', NULL),
	(22, NULL, NULL, 'ALONSO ANDRES ', 'VALENCIA BARRAGAN', '-', 'TECNICO', NULL),
	(32, NULL, NULL, 'VANESSA ', 'SANCHEZ GUAYAZAN ', '-', 'TRANSVERSAL', NULL),
	(33, NULL, NULL, 'LEIDY MARCELA ', 'GARCIA BALLESTEROS', '-', 'TRANSVERSAL', NULL),
	(34, NULL, NULL, 'MAYERLING', ' DUEÑAS AVILA ', '-', 'TRANSVERSAL', NULL),
	(35, NULL, NULL, 'DIEGO ALEJANDRO ', 'MUÑOZ ESCOBAR', '-', 'TRANSVERSAL', NULL),
	(36, NULL, NULL, 'MANUEL CAMILO ', 'VELASQUEZ ESPINOSA', '-', 'TRANSVERSAL', NULL),
	(37, NULL, NULL, 'DELIA CAROLINA ', 'GÓMEZ MORENO ', '-', 'TRANSVERSAL', NULL),
	(38, NULL, NULL, 'BRENDA', ' JEAN GONZALEZ', '-', 'TRANSVERSAL', NULL),
	(39, NULL, NULL, 'LANSUEL ', 'MARTINEZ ROCHA', '-', 'TRANSVERSAL', NULL),
	(40, NULL, NULL, 'SANDRA BIBIANA', ' MUÑOZ SARMIENTO', '-', 'TRANSVERSAL', NULL),
	(41, NULL, NULL, 'ERIKA LISBETH  ', 'TORRES ROMERO', '-', 'TRANSVERSAL', NULL),
	(42, NULL, NULL, 'VIVIANA MARCELA', ' MARTIN ORTIZ ', '-', 'TRANSVERSAL', NULL),
	(43, NULL, NULL, 'JUAN SEBASTIAN ', 'PEREZ RAMIREZ ', '-', 'TRANSVERSAL', NULL),
	(44, NULL, NULL, 'DIANA DEL PILAR', ' GALAN VEGA ', '-', 'TRANSVERSAL', NULL),
	(45, NULL, NULL, 'LINA PAOLA ', 'GARCIA MOLINA', '-', 'TRANSVERSAL', NULL),
	(46, NULL, NULL, 'MARIA CAROLINA ', 'ROZO VELANDIA', '-', 'TRANSVERSAL', NULL),
	(47, NULL, NULL, 'CAMILO ', 'VELASQUEZ ESPINOSA', '-', 'TRANSVERSAL', NULL),
	(48, NULL, NULL, 'JOSE MAURICIO ', 'VISBAL PADILLA ', '-', 'TRANSVERSAL', NULL),
	(49, NULL, NULL, 'CAMILO ARTURO', ' CALVACHE TELLEZ ', '-', 'TRANSVERSAL', NULL),
	(50, NULL, NULL, 'CAROLINA', ' VILLANUEVA GOMEZ', '-', 'TRANSVERSAL', NULL),
	(63, NULL, NULL, 'RUTH CONSUELO ', 'COCA FONSECA', '-', 'TRANSVERSAL', NULL),
	(64, NULL, NULL, 'LORENA GISELL  ', 'REYES JARAMILLO', '-', 'TRANSVERSAL', NULL),
	(65, NULL, NULL, 'MAURICIO', ' ONOFRE OSORIO', '-', 'TRANSVERSAL', NULL),
	(66, NULL, NULL, 'NORELLA ', 'CRUZ CASTAÑO', '-', 'TRANSVERSAL', NULL),
	(67, NULL, NULL, 'ALEXANDER ', 'ALZAMORA PACHECO ', '-', 'TRANSVERSAL', NULL),
	(68, NULL, NULL, 'LUZ MARINA ', 'GUEVARA HERNÁNDEZ', '-', 'TRANSVERSAL', NULL),
	(69, NULL, NULL, 'FAISA YASMIN', ' RUIZ PIÑEROS', '-', 'TECNICO', NULL),
	(70, NULL, NULL, 'SOFY ALEXANDRA ', 'CRUZ ORTIZ ', '-', 'TECNICO', NULL),
	(71, NULL, NULL, 'MAURICIO ', 'VEGA TEQUIA ', '-', 'TECNICO', NULL),
	(72, NULL, NULL, 'JOHANNA ANDREA VALENZUELA', 'SARMIENTO BELTRÁN', '-', 'TECNICO', NULL),
	(73, NULL, NULL, 'NILSEN MICHELE ', 'CARABALLO ', '-', 'TECNICO', NULL),
	(74, NULL, NULL, 'NUBIA ELVIRA ', 'BUENO RINCON', '-', 'TECNICO', NULL),
	(75, NULL, NULL, 'GRACIELA ', 'ARIAS VARGAS ', '-', 'TECNICO', NULL),
	(76, NULL, NULL, 'GLADYS STELLA ', 'OTALORA ', '-', 'TECNICO', NULL),
	(77, NULL, NULL, 'JORGE ANDRES ', 'GAMBOA GONZALEZ ', '-', 'TECNICO', NULL),
	(78, NULL, NULL, 'DECCY YESMITH ', 'CASTELLANOS CÁRDENAS ', '-', 'TECNICO', NULL),
	(79, NULL, NULL, 'MARTIN EMILIO', ' RIVEROS CAMPOS ', '-', 'TECNICO', NULL),
	(80, NULL, NULL, 'CLELIAN LIZETH ', 'LEGUIZAMÓN BOLÍVAR ', '-', 'TECNICO', NULL),
	(81, NULL, NULL, 'MAURICIO ', 'AVILA GARZON ', '-', 'TECNICO', NULL),
	(82, NULL, NULL, 'LINO JOSÉ ', 'TOBIAS AHUMADA', '-', 'TECNICO', NULL),
	(83, NULL, NULL, 'CARLOS GUSTAVO ', 'RODRÍGUEZ HERNÁNDEZ', '-', 'TECNICO', NULL),
	(84, NULL, NULL, 'OLGA LUCIA ', 'RODRIGUEZ MARTINEZ ', '-', 'TECNICO', NULL),
	(85, NULL, NULL, 'GUSTAVO ', 'RODRIGUEZ VASQUEZ', '-', 'TECNICO', NULL),
	(86, NULL, NULL, 'JAVIER ENRIQUE ', 'GIL TORRES', '-', 'TECNICO', NULL),
	(87, NULL, NULL, 'WILLIAM AUGUSTO ', 'VALENCIA CEBALLOS', '-', 'TECNICO', NULL),
	(88, NULL, NULL, 'WILLIAM ERNESTO ', 'GÓMEZ ROMERO', '-', 'TECNICO', NULL),
	(89, NULL, NULL, 'MIGUEL ANTONIO ', 'GARCIA CASTILLA ', '-', 'TECNICO', NULL),
	(90, NULL, NULL, 'GUSTAVO CLEMENTE ', 'HUERTAS PAEZ ', '-', 'TECNICO', NULL),
	(91, NULL, NULL, 'EDGAR JOAQUIN ', 'PAEZ RODRIGUEZ ', '-', 'TECNICO', NULL),
	(92, NULL, NULL, 'ANYELINA ', 'GONZALEZ CASTILLO', '-', 'TECNICO', NULL),
	(93, NULL, NULL, 'RAMON JULIO ', 'CUBIDES RODRIGUEZ', '-', 'TECNICO', NULL),
	(94, NULL, NULL, 'ADRIANA CATALINA ', 'VEGA TEQUIA ', '-', 'TECNICO', NULL),
	(95, NULL, NULL, 'FERNANDO AUGUSTO ', 'CUESTAS BARRAGAN', '-', 'TECNICO', NULL),
	(96, NULL, NULL, 'NADIA PATRICIA ', 'GRANADOS AMADO', '-', 'TECNICO', NULL),
	(126, NULL, NULL, 'JORGE MIGUEL', ' TOVAR HERNANDEZ ', '-', 'TRANSVERSAL', NULL),
	(127, NULL, NULL, 'FREDY', 'PEÑA GIRALDO ', '-', 'TRANSVERSAL', NULL),
	(128, NULL, NULL, 'NATALIA ', 'BAEZ RODRIGUEZ', '-', 'TRANSVERSAL', NULL),
	(129, NULL, NULL, 'DAVID ROBERTO', 'ESCOBAR BARACALDO ', '-', 'TRANSVERSAL', NULL),
	(130, NULL, NULL, 'DIEGO ARMANDO ', 'MELGAREJO ZERDA', '-', 'TRANSVERSAL', NULL),
	(131, NULL, NULL, 'JORGE ALBERTO  ', 'URICOECHEA MARMOLEJO', '-', 'TECNICO', NULL),
	(132, NULL, NULL, 'DANIEL GERARDO ', 'LOPEZ FIGUEROA ', '-', 'TECNICO', NULL),
	(133, NULL, NULL, 'MARGARITA ROSA ', 'LOPEZ FIGUEROA ', '-', 'TECNICO', NULL),
	(134, NULL, NULL, 'DIEGO FERNANDO ', 'CASTAÑEDA SUAREZ ', '-', 'TECNICO', NULL),
	(135, NULL, NULL, 'LUIS EDUARDO ', 'VALLEJO SANCHEZ ', '-', 'TECNICO', NULL),
	(136, NULL, NULL, 'FABIAN ALEXIS', 'OLIVEROS RANGEL', '-', 'TECNICO', NULL),
	(137, NULL, NULL, 'FABIAN EDUARDO ', 'RODRIGUEZ QUINTERO', '-', 'TECNICO', NULL),
	(138, NULL, NULL, 'EKATHERINE ', 'CARDONA DIAZ ', '-', 'TECNICO', NULL),
	(139, NULL, NULL, 'JUAN ANTONIO', 'LIEVANO ALZATE', '-', 'TECNICO', NULL),
	(140, NULL, NULL, 'WILSON ', 'CARDENAS GONZALEZ ', '-', 'TECNICO', NULL),
	(141, NULL, NULL, 'OSCAR FABIAN ', 'CACERES CORAL', '-', 'TECNICO', NULL),
	(142, NULL, NULL, 'JORGE ALBERTO ', 'GARGIA GARCIA', '-', 'TECNICO', NULL),
	(143, NULL, NULL, 'NICOLAS ', 'ALVAREZ CARDENAS', '-', 'TECNICO', NULL),
	(144, NULL, NULL, 'JUAN DAVID ', 'LA ROTTA FORERO ', '-', 'TECNICO', NULL),
	(145, NULL, NULL, 'JUAN PABLO ', 'NAVARRO LONDOÑO', '-', 'TECNICO', NULL),
	(146, NULL, NULL, 'CARLOS ORLANDO', 'ALBA GARCIA', '-', 'TECNICO', NULL),
	(147, NULL, NULL, 'ANDREA CATALINA ', 'BONILLA CABANA', '-', 'TECNICO', NULL),
	(148, NULL, NULL, 'JOHANN ', 'JARRIN AZUERO ', '-', 'TECNICO', NULL),
	(149, NULL, NULL, 'ANDRES EDUARDO', 'SANCHEZ BERNAL ', '-', 'TECNICO', NULL),
	(150, NULL, NULL, 'WILLIAM ', 'GALINDO RINCON ', '-', 'TECNICO', NULL),
	(151, NULL, NULL, 'DANIEL GUSTAVO', 'ALVAREZ GAITAN', '-', 'TECNICO', NULL),
	(153, NULL, NULL, 'DIANA GISELLE', ' HERNANDEZ', '-', 'TRANSVERSAL', NULL),
	(154, NULL, NULL, 'WILMER LEONARDO', 'BELTRAN BELTRAN', '-', 'TRANSVERSAL', NULL),
	(155, NULL, NULL, 'MARIA CRISTINA ', 'CARO VILLANUEVA', '-', 'TRANSVERSAL', NULL),
	(156, NULL, NULL, 'ANDRES FELIPE ', 'AGUILAR HURTADO', '-', 'TRANSVERSAL', NULL),
	(157, NULL, NULL, 'YENY MARCELA', 'CIFUENTES', '-', 'TRANSVERSAL', NULL),
	(158, NULL, NULL, 'JUAN DE JESUS ', 'MARTÍNEZ RODRÍGUEZ', '-', 'TRANSVERSAL', NULL),
	(159, NULL, NULL, 'IVAN DANIEL ', 'VALENZUELA', '-', 'TRANSVERSAL', NULL),
	(160, NULL, NULL, 'PAOLA ANDREA', 'MONTEALEGRE RAMIREZ', '-', 'TECNICO', NULL),
	(161, NULL, NULL, 'CRISTINA ', 'RAMIREZ MENESES', '-', 'TECNICO', NULL),
	(162, NULL, NULL, 'LAURA JOHANNA ', 'BARRERO', '-', 'TECNICO', NULL),
	(163, NULL, NULL, 'KEYLA KARINA', 'GONZALEZ MARTINEZ', '-', 'TECNICO', NULL),
	(164, NULL, NULL, 'JUAN CARLOS ', 'SANDOVAL SOTELO', '-', 'TECNICO', NULL),
	(165, NULL, NULL, 'MONICA YISETH ', 'CORTES MORALES', '-', 'TECNICO', NULL),
	(166, NULL, NULL, 'JHON JAIRO ', 'LEURO DELGADO', '-', 'TECNICO', NULL),
	(167, NULL, NULL, 'SAMIR ALVEIRO ', 'MEDINA RONCANCIO', '-', 'TECNICO', NULL),
	(168, NULL, NULL, 'FABER ANDRES ', 'CHAPARRO PATIÑO', '-', 'TECNICO', NULL),
	(169, NULL, NULL, 'NATHALY ESPERANZA ', 'GALINDO BURGOS', '-', 'TECNICO', NULL),
	(170, NULL, NULL, 'NELSON LEONARDO ', 'ARIAS VALENCIA', '-', 'TECNICO', NULL),
	(171, NULL, NULL, 'YULI TATIANA ', 'AREVALO', '-', 'TECNICO', NULL),
	(172, NULL, NULL, 'DIANA SURLEY ', 'CASAS', '-', 'TECNICO', NULL),
	(173, NULL, NULL, 'JAVIER ', 'SANDOVAL PINEDA', '-', 'TECNICO', NULL),
	(174, NULL, NULL, 'JUAN FERNANDO ', 'SASTOQUE BERNAL', '-', 'TECNICO', NULL),
	(175, NULL, NULL, 'PAOLA ALEXANDRA ', 'ALBARRACIN VANOY', '-', 'TECNICO', NULL),
	(176, NULL, NULL, 'CARLOS EDUARDO ', 'VARGAS LOPEZ', '-', 'TECNICO', NULL),
	(177, NULL, NULL, 'GABRIEL ERNESTO', 'BARRAGAN MORENO', '-', 'TECNICO', NULL),
	(178, NULL, NULL, 'JUAN DE JESUS ', 'SANCHEZ SOSA', '-', 'TECNICO', NULL),
	(179, NULL, NULL, 'FRANCISCO ', 'MARIANO VILLALBA', '-', 'TECNICO', NULL),
	(180, NULL, NULL, 'JOSE VICENTE ', 'CORTÉS BERNAL', '-', 'TECNICO', NULL),
	(181, NULL, NULL, 'CARLOS MANUEL ', 'SUAREZ CAMACHO', '-', 'TECNICO', NULL),
	(182, NULL, NULL, 'EDUARDO ', 'MARTINEZ BORDA', '-', 'TECNICO', NULL),
	(183, NULL, NULL, 'GERMAN ANTONIO ', 'TAMAYO PEREZ', '-', 'TECNICO', NULL),
	(184, NULL, NULL, 'JOSE JOAQUIN', 'PAEZ HENAO', '-', 'TECNICO', NULL),
	(185, NULL, NULL, 'CLARA INES ', 'PUERTO RODRIGUEZ', '-', 'TECNICO', NULL),
	(186, NULL, NULL, 'RAFAEL', 'MESTIZO CASTILLO', '-', 'TECNICO', NULL),
	(188, NULL, NULL, 'JUAN ANTONIO ', 'MAMBY RAMOS', '-', 'TRANSVERSAL', NULL),
	(189, NULL, NULL, 'MAURICIO JULIAN ', 'GONZALEZ MADERO', '-', 'TRANSVERSAL', NULL),
	(190, NULL, NULL, 'MARTHA YANETH', 'BARAJAS AVILA', '-', 'TRANSVERSAL', NULL),
	(191, NULL, NULL, 'WILSON EDGAR ', 'LUQUE BUSTOS', '-', 'TRANSVERSAL', NULL),
	(192, NULL, NULL, 'ELSA ', 'QUISOBONI GACHARNA', '-', 'TRANSVERSAL', NULL),
	(193, NULL, NULL, 'CAROLINA ', 'NEIVA OBREGOSO', '-', 'TECNICO', NULL),
	(194, NULL, NULL, 'LICET PATRICIA ', 'ARRIETA ZUÑIGA', '-', 'TECNICO', NULL),
	(195, NULL, NULL, 'NELSON ', 'ARROYO MUÑOZ', '-', 'TECNICO', NULL),
	(196, NULL, NULL, 'CESAR AUGUSTO ', 'MEDINA ACERO', '-', 'TECNICO', NULL),
	(197, NULL, NULL, 'GERMAN ENRIQUE ', 'REYES ROJAS', '-', 'TECNICO', NULL),
	(198, NULL, NULL, 'DANILO FABIO ', 'RACINES HERNANDEZ', '-', 'TECNICO', NULL),
	(199, NULL, NULL, 'LUZ MARINA ', 'GUZMÁN PINZON', '-', 'TECNICO', NULL),
	(200, NULL, NULL, 'MARIA EMMA ', 'LOMBANA GONZALEZ', '-', 'TECNICO', NULL),
	(201, NULL, NULL, 'DORIS AMANDA ', 'BAZANTE CALDAS', '-', 'TECNICO', NULL),
	(202, NULL, NULL, 'LUIS ANTONIO ', 'AREVALO PULIDO', '-', 'TECNICO', NULL),
	(203, NULL, NULL, 'JERSON JULIAN ', 'DIAZ TORRES', '-', 'TECNICO', NULL),
	(204, NULL, NULL, 'EDGAR WILLIAM', 'ZAPATA OSORIO', '-', 'TECNICO', NULL),
	(205, NULL, NULL, 'MARÍA CLEMENCIA ', 'RAMÍREZ MELENDRO', '-', 'TECNICO', NULL),
	(206, NULL, NULL, 'MARIA SOLEDAD ', 'CORTES LEAÑO', '-', 'TECNICO', NULL),
	(207, NULL, NULL, 'SAÚL ', 'ÁVILA RODRÍGUEZ', '-', 'TECNICO', NULL),
	(208, NULL, NULL, 'NESTOR ', 'MARTÍN MENDEZ', '-', 'TECNICO', NULL),
	(209, NULL, NULL, 'MARIA ALEJANDRA ', 'SILVA GOMEZ', '-', 'TECNICO', NULL),
	(210, NULL, NULL, 'JORGE EDGAR ', 'CORTES MEJIA', '-', 'TECNICO', NULL),
	(211, NULL, NULL, 'ANA MERCEDES ', 'DURAN', '-', 'TECNICO', NULL),
	(212, NULL, NULL, 'GUSTAVO ADOLFO ', 'TORRES MARIN', '-', 'TECNICO', NULL),
	(213, NULL, NULL, 'JAIME ', 'ORTIZ VANEGAS', '-', 'TECNICO', NULL),
	(214, NULL, NULL, 'VIVIANA DEL MAR ', 'ARANDA GUERRERO', '-', 'TECNICO', NULL),
	(215, NULL, NULL, 'DELKA ', 'VELASCO GONZALEZ', '-', 'TECNICO', NULL),
	(216, NULL, NULL, 'ALDEMAR ', 'TORRES CHACON', '-', 'TECNICO', NULL),
	(217, NULL, NULL, 'LUZ ESTRELLA ', 'GAMBA RAMOS', '-', 'TECNICO', NULL),
	(218, NULL, NULL, 'CIELO YOMARA ', 'CHAPARRO ALDANA', '-', 'TECNICO', NULL),
	(219, NULL, NULL, 'FABIO CESAR ', 'CACERES MEJÍA', '-', 'TECNICO', NULL),
	(220, NULL, NULL, 'MYRIAM STELLA ', 'ABRIL LANCHEROS', '-', 'TECNICO', NULL),
	(221, NULL, NULL, 'RICHARD ', 'ALIRIO CLAVIJO', '-', 'TECNICO', NULL),
	(222, NULL, NULL, 'MILTON OSWALDO ', 'MATALLANA VARGAS', '-', 'TECNICO', NULL),
	(223, NULL, NULL, 'LADY PAOLA ', 'BALLEN CARRASCO', '-', 'TECNICO', NULL),
	(224, NULL, NULL, 'JULIO ENRIQUE ', 'BUITRAGO CASTRO ', '-', 'TECNICO', NULL),
	(226, NULL, NULL, 'ANDREA DEL PILAR ', 'RAMOS CAICEDO', '-', 'TRANSVERSAL', NULL),
	(227, NULL, NULL, 'JUAN DAVID ', 'GOMEZ BETANCURTH', '-', 'TRANSVERSAL', NULL),
	(228, NULL, NULL, 'YANETH DEL CARMEN ', 'CASTILLO POTOSI', '-', 'TRANSVERSAL', NULL),
	(229, NULL, NULL, 'ADRIANA MARITZA ', 'VEGA', '-', 'TECNICO', NULL),
	(230, NULL, NULL, 'DAVID ', 'ARCILA CUELLAR', '-', 'TECNICO', NULL),
	(231, NULL, NULL, 'ULDARICO ANDRADE ', 'HERNANDEZ', '-', 'TECNICO', NULL),
	(232, NULL, NULL, 'WILLIAM FERNANDO ', 'SANABRIA CASAS', '-', 'TECNICO', NULL),
	(233, NULL, NULL, 'EDGAR HUMBERTO ', 'ANGEL MILLAN', '-', 'TECNICO', NULL),
	(234, NULL, NULL, 'GREGORIO ', 'LOZANO HERNANDEZ', '-', 'TECNICO', NULL),
	(235, NULL, NULL, 'JUAN SEBASTIAN ', 'VANEGAS OLIVEROS', '-', 'TECNICO', NULL),
	(236, NULL, NULL, 'ANA YAQUELINE ', 'CHAPARRO PARRA', '-', 'TECNICO', NULL),
	(237, NULL, NULL, 'MIGUEL ADRUAL ', 'HIGUERA CARDENAS', '-', 'TECNICO', NULL),
	(238, NULL, NULL, 'DIANA CAROLINA ', 'ROJAS VELANDIA', '-', 'TECNICO', NULL),
	(239, NULL, NULL, 'ARNALT HENRY ', 'VALCARCEL MONTAÑES', '-', 'TECNICO', NULL),
	(240, NULL, NULL, 'JAIRO ENRIQUE ', 'RODRIGUEZ SANCHEZ', '-', 'TECNICO', NULL),
	(241, NULL, NULL, 'ELIZABELH ', 'DOMINGUEZ SUESCUN', '-', 'TECNICO', NULL),
	(242, NULL, NULL, 'LUIS HERNANDO ', 'CONCHA RODRIGUEZ', '-', 'TECNICO', NULL),
	(243, NULL, NULL, 'SANDRA YANNETH ', 'RUEDA GUEVARA', '-', 'TECNICO', NULL),
	(244, NULL, NULL, 'WILLIAM JAVIER ', 'RODRIGUEZ GARCIA', '-', 'TECNICO', NULL),
	(245, NULL, NULL, 'ALEXANDRA MARIA ', 'SILVA MONSALVE', '-', 'TECNICO', NULL),
	(246, NULL, NULL, 'HELBER RODRIGO ', 'ROJAS GACHA', '-', 'TECNICO', NULL),
	(247, NULL, NULL, 'MARINA ', 'PRIETO OLIVARES', '-', 'TECNICO', NULL),
	(248, NULL, NULL, 'HENRY ALFONSO ', 'GARZON SANCHEZ', '-', 'TECNICO', NULL),
	(249, NULL, NULL, 'ANDRES ', 'MEDRANDA RODRIGUEZ', '-', 'TECNICO', NULL),
	(250, NULL, NULL, 'RICARDO ', 'RODRIGUEZ RAMIREZ', '-', 'TECNICO', NULL),
	(251, NULL, NULL, 'FABIAN ORLANDO ', 'CASTRO PERALTA', '-', 'TECNICO', NULL),
	(252, NULL, NULL, 'LUIS EDUARDO ', 'REDONDO', '-', 'TECNICO', NULL),
	(253, NULL, NULL, 'HEIVER ', 'CUESTA DAVILA', '-', 'TECNICO', NULL),
	(254, NULL, NULL, 'CRISTIAN ', 'BUITRAGO ORTEGA', '-', 'TECNICO', NULL),
	(255, NULL, NULL, 'NESTOR GUILLERMO ', 'MONTAÑO GOMEZ', '-', 'TECNICO', NULL),
	(256, NULL, NULL, 'BREYMER YESID ', 'ROBLES CARO', '-', 'TECNICO', NULL),
	(257, NULL, NULL, 'AVID LEONARDO ', 'CARDENAS ALMONACID', '-', 'TECNICO', NULL),
	(258, NULL, NULL, 'FABIAN RICARDO ', 'MESTRE SOCARRAS', '-', 'TECNICO', NULL),
	(259, NULL, NULL, 'ERICK ', 'GRANADOS TORRES', '-', 'TECNICO', NULL),
	(260, NULL, NULL, 'AMPARO ', 'RUEDA JAIMES', '-', 'TECNICO', NULL),
	(261, NULL, NULL, 'ADRIANA ', 'DUARTE MATEUS', '-', 'TECNICO', NULL),
	(263, NULL, NULL, 'ALEJANDRA MARIA ', 'DUQUE CARDONA', '-', 'TRANSVERSAL', NULL),
	(264, NULL, NULL, 'AMPARO LILIANA ', 'SANTACRUZ GUEVARA', '-', 'TRANSVERSAL', NULL),
	(265, NULL, NULL, 'WILSON ALFREDO ', 'MORA RAMIREZ', '-', 'TRANSVERSAL', NULL),
	(266, NULL, NULL, 'MARIA TERESA ', 'POSADA', '-', 'TRANSVERSAL', NULL),
	(267, NULL, NULL, 'ANA ROCIO ', 'DIAZ FORERO', '-', 'TRANSVERSAL', NULL),
	(268, NULL, NULL, 'JAQUELINE ', 'RODRIGUEZ FERNANDEZ', '-', 'TRANSVERSAL', NULL),
	(269, NULL, NULL, 'AURA MATILDE ', 'CARRERO USSA', '-', 'TRANSVERSAL', NULL),
	(270, NULL, NULL, 'LUIS HERNANDO ', 'GIRALDO VALDES', '-', 'TRANSVERSAL', NULL),
	(271, NULL, NULL, 'DIANA ALEXANDRA ', 'RUBIN DEL VASTO', '-', 'TRANSVERSAL', NULL),
	(272, NULL, NULL, 'LIA INÉS DEL SOCORRO ', 'GUEVARA RUBIANO', '-', 'TRANSVERSAL', NULL),
	(273, NULL, NULL, 'MARTHA ESPERANZA ', 'LEON PEÑA', '-', 'TRANSVERSAL', NULL),
	(274, NULL, NULL, 'SANDRA MARTIZA ', 'OSPINA SIERRA', '-', 'TRANSVERSAL', NULL),
	(275, NULL, NULL, 'DIANA CONSTANZA ', 'MATALLANA CHAVES', '-', 'TRANSVERSAL', NULL),
	(276, NULL, NULL, 'MARGARITA BEATRIZ ', 'MARTINEZ HURTADO', '-', 'TRANSVERSAL', NULL),
	(277, NULL, NULL, 'LILIANA ', 'URUEÑA GRACIA', '-', 'TECNICO', NULL),
	(278, NULL, NULL, 'ELMER ', 'ZULUAGA REYES', '-', 'TECNICO', NULL),
	(279, NULL, NULL, 'LILIANA VICTORIA ', 'MORALES GUALDRON', '-', 'TECNICO', NULL),
	(280, NULL, NULL, 'ISLEN ', 'RAMIREZ CAMPOS', '-', 'TECNICO', NULL),
	(281, NULL, NULL, 'MARLY XIOMARA ', 'ELEZME MARTIN', '-', 'TECNICO', NULL),
	(282, NULL, NULL, 'JANETH CRISTINA ', 'VERA AROCA', '-', 'TECNICO', NULL),
	(283, NULL, NULL, 'MIRIAM ', 'PRECIADO MONTAÑEZ', '-', 'TECNICO', NULL),
	(284, NULL, NULL, 'MARTHA NEYITH ', 'VARGAS', '-', 'TECNICO', NULL),
	(285, NULL, NULL, 'ANA CELIA ', 'PINZON VARGAS', '-', 'TECNICO', NULL),
	(286, NULL, NULL, 'ANDRES CAMILO ', 'MEJIA ACOSTA', '-', 'TECNICO', NULL),
	(287, NULL, NULL, 'ADELA ', 'CERVERA RAMIREZ', '-', 'TECNICO', NULL),
	(288, NULL, NULL, 'MARGARETH TATIANA ', 'PEÑA ESCORCIA', '-', 'TECNICO', NULL),
	(289, NULL, NULL, 'SONIA MILENA ', 'PINZON COGUA', '-', 'TECNICO', NULL),
	(290, NULL, NULL, 'JORGE EMIRO ', 'PACHECO ANDRADE', '-', 'TECNICO', NULL),
	(291, NULL, NULL, 'JESUS ENRIQUE ', 'QUIJANO CAICEDO', '-', 'TECNICO', NULL),
	(292, NULL, NULL, 'NUBIA ESPERANZA ', 'HERNANDEZ PRIETO', '-', 'TECNICO', NULL),
	(293, NULL, NULL, 'GINA PAOLA ', 'MONTES', '-', 'TECNICO', NULL),
	(294, NULL, NULL, 'OSCAR ', 'RODRIGUEZ PARRA', '-', 'TECNICO', NULL),
	(295, NULL, NULL, 'ALEXANDER ', 'OBANDO PEÑA', '-', 'TECNICO', NULL),
	(296, NULL, NULL, 'NURY ', 'MEJIA SALAZAR', '-', 'TECNICO', NULL),
	(297, NULL, NULL, 'FRANKLYN AUGUSTO ', 'MARTINEZ ESPITIA', '-', 'TECNICO', NULL),
	(298, NULL, NULL, 'LEIDYS MARCELA ', 'ALDANA CESPEDES', '-', 'TECNICO', NULL),
	(299, NULL, NULL, 'LUCY FERNANDA ', 'LOPEZ MARIN', '-', 'TECNICO', NULL);
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

-- Volcando datos para la tabla evaluacioninstructores.programa: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` (`Codigo`, `Nombre`, `Descripcion`) VALUES
	(0, 'nulo', 'nulo'),
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

-- Volcando datos para la tabla evaluacioninstructores.regional: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `regional` DISABLE KEYS */;
INSERT INTO `regional` (`Codigo`, `Nombre`, `Descripcion`) VALUES
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

-- Volcando datos para la tabla evaluacioninstructores.saber: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `saber` DISABLE KEYS */;
INSERT INTO `saber` (`Codigo`, `Nombre`, `Descripcion`) VALUES
	(31, 'hacer', '-'),
	(32, 'Ser', '-'),
	(33, 'Saber', '-');
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


-- Volcando estructura para vista evaluacioninstructores.instructorescoordinacion
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `instructorescoordinacion` (
	`Nombre` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`Nombres` VARCHAR(45) NOT NULL COLLATE 'latin1_swedish_ci',
	`FK_ficha` INT(5) NULL,
	`Titular` CHAR(2) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


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


-- Volcando estructura para vista evaluacioninstructores.instructorescoordinacion
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `instructorescoordinacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `instructorescoordinacion` AS SELECT
coordinacion.Nombre,
instructor.Nombres,
detalle_ficha.FK_ficha,
detalle_ficha.Titular
FROM
coordinacion
INNER JOIN ficha ON ficha.FK_Coordinacion = coordinacion.Codigo
INNER JOIN detalle_ficha ON detalle_ficha.FK_ficha = ficha.Codigo
INNER JOIN instructor ON detalle_ficha.FK_instructor = instructor.Id_Instructor ;


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
