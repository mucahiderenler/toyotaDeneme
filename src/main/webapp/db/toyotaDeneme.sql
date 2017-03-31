-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: toyotaDeneme
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `BOLUMS`
--

DROP TABLE IF EXISTS `BOLUMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOLUMS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bolumAdi` varchar(255) DEFAULT NULL,
  `bolumMudur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `BOLUMS` VALUES (1,'TMS-K','Ayla Özdemir'),(2,'TMS-F','Ali Gündogdu');
--
-- Dumping data for table `BOLUMS`
--

/*LOCK TABLES `BOLUMS` WRITE;*/
/*!40000 ALTER TABLE `BOLUMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOLUMS` ENABLE KEYS */;
/*UNLOCK TABLES;*/

--
-- Table structure for table `travels`
--

DROP TABLE IF EXISTS `travels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `gidisAmac` varchar(50) CHARACTER SET utf8 NOT NULL,
  `projeKod` varchar(50) CHARACTER SET utf8 NOT NULL,
  `seyehatBas` varchar(255) NOT NULL,
  `seyehatMik` varchar(255) NOT NULL,
  `seyehatSon` varchar(255) NOT NULL,
  `seyehatYeri` varchar(50) CHARACTER SET utf8 NOT NULL,
  `userId` int(11) NOT NULL,
  `validErrorMessage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels`
--

/*LOCK TABLES `travels` WRITE;*/
/*!40000 ALTER TABLE `travels` DISABLE KEYS */;
INSERT INTO `travels` VALUES (1,'Project1','A5','03/31/2017','2000$','04/29/2017','USA',1,NULL),(2,'meet-up','666','03/01/2017','2000$','04/08/2017','Ukraine',1,NULL),(3,'Negotiations','666','04/01/2017','2000$','04/21/2017','USA',1,NULL);
/*!40000 ALTER TABLE `travels` ENABLE KEYS */;
/*UNLOCK TABLES;*/

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) NOT NULL,
  `bolumId` int(11) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `enabled` int(11) DEFAULT NULL,
  `seyehatGun` varchar(255) DEFAULT NULL,
  `seyehatZaman` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*LOCK TABLES `users` WRITE;*/
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ROLE_ADMIN',1,'mucahid1616','mucahiderenler',1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*UNLOCK TABLES;*/
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-31 20:38:21
