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
  KEY `fk_liquors_suppliers_suppliers` (`supplier_id`),
  KEY `fk_liquors_suppliers_liquors` (`liquor_id`),
  CONSTRAINT `fk_liquors_suppliers_liquors` FOREIGN KEY (`liquor_id`) REFERENCES `liquors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_liquors_suppliers_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquors_suppliers`
--

LOCK TABLES `liquors_suppliers` WRITE;
/*!40000 ALTER TABLE `liquors_suppliers` DISABLE KEYS */;
INSERT INTO `liquors_suppliers` VALUES (28,11,7,'2018-04-23 11:34:08','2018-04-23 11:34:08'),(29,11,8,'2018-04-23 11:34:08','2018-04-23 11:34:08'),(30,12,6,'2018-04-23 11:36:06','2018-04-23 11:36:06'),(31,13,8,'2018-04-23 11:36:42','2018-04-23 11:36:42'),(32,14,7,'2018-04-23 11:37:06','2018-04-23 11:37:06'),(33,15,7,'2018-04-23 11:37:45','2018-04-23 11:37:45'),(34,16,6,'2018-04-23 11:38:47','2018-04-23 11:38:47'),(35,16,7,'2018-04-23 11:38:47','2018-04-23 11:38:47'),(36,16,8,'2018-04-23 11:38:47','2018-04-23 11:38:47');
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

-- Dump completed on 2018-04-29  1:45:57
