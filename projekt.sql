-- MySQL dump 10.13  Distrib 5.5.21, for Win32 (x86)
--
-- Host: localhost    Database: projekt
-- ------------------------------------------------------
-- Server version	5.5.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lekarze`
--

DROP TABLE IF EXISTS `lekarze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lekarze` (
  `id_l` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `imie` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `nazwisko` char(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_l`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lekarze`
--

LOCK TABLES `lekarze` WRITE;
/*!40000 ALTER TABLE `lekarze` DISABLE KEYS */;
INSERT INTO `lekarze` VALUES (1,'Krystyna','Golec'),(2,'Jarosław','Głowacki'),(3,'Wiesław','Serduszko'),(4,'Magdalena','Ogórek'),(5,'Robert','Majewski'),(6,'Weronika','Zawadzka'),(7,'Mikołaj','Świenty');
/*!40000 ALTER TABLE `lekarze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacjenci`
--

DROP TABLE IF EXISTS `pacjenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacjenci` (
  `pesel` char(11) COLLATE utf8_unicode_ci NOT NULL,
  `imie` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `nazwisko` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `telefon` char(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_urodzenia` date NOT NULL,
  PRIMARY KEY (`pesel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacjenci`
--

LOCK TABLES `pacjenci` WRITE;
/*!40000 ALTER TABLE `pacjenci` DISABLE KEYS */;
INSERT INTO `pacjenci` VALUES ('02053018526','Bartłomiej','Łydka','801256415','2002-05-30'),('35022445821','Erich','Keller','324152635','1935-02-24'),('69091274569','Katarzyna','Korek','324102365','1969-09-12'),('78012107856','Łukasz','Mars','606032174','1978-01-21'),('89072906573','Roksana','Kowalska','501038873','1989-07-29'),('95061906584','Zuzanna','Packa','666474089','1995-06-19'),('97051906584','Karolina','Nowak','517244089','1997-05-19');
/*!40000 ALTER TABLE `pacjenci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uslugi`
--

DROP TABLE IF EXISTS `uslugi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uslugi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rodzaj` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `cena` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uslugi`
--

LOCK TABLES `uslugi` WRITE;
/*!40000 ALTER TABLE `uslugi` DISABLE KEYS */;
INSERT INTO `uslugi` VALUES (1,'wypełnienie',150),(2,'usunięcie',120),(3,'leczenie kanałowe',180),(4,'proteza',690),(5,'implant',1500),(6,'piaskowanie',100),(7,'usunięcie kamienia',80),(8,'wybielanie',600),(9,'znieczulenie',40);
/*!40000 ALTER TABLE `uslugi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wizyta`
--

DROP TABLE IF EXISTS `wizyta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wizyta` (
  `id_w` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_l` tinyint(3) unsigned NOT NULL,
  `pesel` char(11) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `godzina` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_w`),
  KEY `pesel` (`pesel`),
  KEY `id_l` (`id_l`),
  KEY `id` (`id`),
  CONSTRAINT `wizyta_ibfk_1` FOREIGN KEY (`pesel`) REFERENCES `pacjenci` (`pesel`),
  CONSTRAINT `wizyta_ibfk_2` FOREIGN KEY (`id_l`) REFERENCES `lekarze` (`id_l`),
  CONSTRAINT `wizyta_ibfk_3` FOREIGN KEY (`id`) REFERENCES `uslugi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wizyta`
--

LOCK TABLES `wizyta` WRITE;
/*!40000 ALTER TABLE `wizyta` DISABLE KEYS */;
INSERT INTO `wizyta` VALUES (1,1,'02053018526',1,'2019-06-06','10:30');
/*!40000 ALTER TABLE `wizyta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-06 17:12:35
