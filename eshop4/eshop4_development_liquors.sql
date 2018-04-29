-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: eshop4_development
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.17.10.1

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
-- Table structure for table `liquors`
--

DROP TABLE IF EXISTS `liquors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `produced_at` datetime DEFAULT NULL,
  `serial_number` varchar(5) DEFAULT NULL,
  `blurb` text,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cover_image_file_name` varchar(255) DEFAULT NULL,
  `cover_image_content_type` varchar(255) DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_liquors_producers` (`producer_id`),
  CONSTRAINT `fk_liquors_producers` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquors`
--

LOCK TABLES `liquors` WRITE;
/*!40000 ALTER TABLE `liquors` DISABLE KEYS */;
INSERT INTO `liquors` VALUES (11,'Vino blanco',6,'2015-04-23 11:32:00','13','1L',5,'2018-04-23 11:34:08','2018-04-23 11:34:08',NULL,NULL,NULL,NULL),(12,'Vodka',9,'2014-04-23 11:35:00','4','1L',14,'2018-04-23 11:36:06','2018-04-23 11:36:06','alcohol-champagne-drink-celebration-party-christmas-3b643f5822041829-256x256.png','image/png',20344,'2018-04-23 11:36:06'),(13,'Ron Blanco',7,'2014-04-23 11:36:00','8','1L',15,'2018-04-23 11:36:42','2018-04-23 11:36:42','ron-bacardi-blanco.jpg','image/jpeg',6489,'2018-04-23 11:36:41'),(14,'Whisky',8,'2014-04-23 11:36:00','16','1L',14,'2018-04-23 11:37:06','2018-04-23 11:37:06',NULL,NULL,NULL,NULL),(15,'Ron',6,'2016-04-23 11:37:00','3','h1. Ron 1L\r\n* Ron 20% de alcohol',12,'2018-04-23 11:37:45','2018-04-23 11:55:27','bacardi-8.png','image/png',15809,'2018-04-23 11:37:45'),(16,'Vodka caramelo',9,'2016-09-23 11:37:00','23','1L',10.3,'2018-04-23 11:38:47','2018-04-23 11:38:47',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `liquors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-29  1:45:56
