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
-- Table structure for table `liquors_suppliers`
--

DROP TABLE IF EXISTS `liquors_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquors_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `liquor_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_liquors_suppliers_liquors` (`liquor_id`) USING BTREE,
  KEY `fk_liquors_suppliers_suppliers` (`supplier_id`) USING BTREE,
  CONSTRAINT `fk_liquors_suppliers_liquors` FOREIGN KEY (`liquor_id`) REFERENCES `liquors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_liquors_suppliers_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquors_suppliers`
--

LOCK TABLES `liquors_suppliers` WRITE;
/*!40000 ALTER TABLE `liquors_suppliers` DISABLE KEYS */;
INSERT INTO `liquors_suppliers` VALUES (83,1,1,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(84,2,2,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(85,3,2,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(86,4,2,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(87,5,2,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(88,6,2,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(89,7,2,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(90,8,3,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(91,9,4,'2018-04-23 13:53:31','2018-04-23 13:53:31'),(92,10,5,'2018-04-23 13:53:31','2018-04-23 13:53:31');
/*!40000 ALTER TABLE `liquors_suppliers` ENABLE KEYS */;
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
