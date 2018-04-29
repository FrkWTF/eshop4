-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: eshop4_test
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `producer_id` int(11) NOT NULL,
  `produced_at` datetime DEFAULT NULL,
  `serial_number` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blurb` text COLLATE utf8_unicode_ci,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_liquors_producers` (`producer_id`) USING BTREE,
  CONSTRAINT `fk_liquors_producers` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquors`
--

LOCK TABLES `liquors` WRITE;
/*!40000 ALTER TABLE `liquors` DISABLE KEYS */;
INSERT INTO `liquors` VALUES (1,'Pro Rails E-Commerce',1,'2018-04-23 00:00:00','199',NULL,45,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(2,'Pro Rails E-Commerce 2nd Edition',1,'2018-04-23 00:00:00','199',NULL,65,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(3,'Pro Rails E-Commerce 3rd Edition',1,'2018-04-23 00:00:00','199',NULL,85,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(4,'Pro Rails E-Commerce 4th Edition',1,'2018-04-23 00:00:00','199',NULL,105,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(5,'Pro Rails E-Commerce 5th Edition',1,'2018-04-23 00:00:00','199',NULL,125,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(6,'Pro Rails E-Commerce 6th Edition',1,'2018-04-23 00:00:00','199',NULL,145,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(7,'Pro Rails E-Commerce 7th Edition',2,'2018-04-23 00:00:00','199',NULL,165,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(8,'Ruby for Dummies',1,'2018-04-23 00:00:00','199',NULL,185,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(9,'Pride and Prejudice',2,'2018-04-23 00:00:00','299',NULL,40,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL),(10,'The Idiot',2,'2018-04-23 00:00:00','299',NULL,40,'2018-04-23 11:53:31','2018-04-23 11:53:31',NULL,NULL,NULL,NULL);
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
