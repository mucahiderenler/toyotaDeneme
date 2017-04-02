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
-- Table structure for table `bolums`
--
DROP TABLE IF EXISTS `travels`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `bolums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bolums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bolumAdi` varchar(45) NOT NULL,
  `bolumMudur` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolums`
--

LOCK TABLES `bolums` WRITE;
/*!40000 ALTER TABLE `bolums` DISABLE KEYS */;
INSERT INTO `bolums` VALUES (1,'TMS-F','Ali Öz'),(2,'TMS-K','Ayla Özdemir');
/*!40000 ALTER TABLE `bolums` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(45) NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `seyehatGun` varchar(45) DEFAULT NULL,
  `seyehatZaman` varchar(45) DEFAULT NULL,
  `bolumId` int(11) NOT NULL,
  PRIMARY KEY (`id`,`username`),
  KEY `bolumId_idx` (`bolumId`),
  CONSTRAINT `bolumId` FOREIGN KEY (`bolumId`) REFERENCES `bolums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ROLE_ADMIN','admin','admin',1,NULL,NULL,2),(2,'ROLE_USER','mucahiderenler','mucahid1616',1,NULL,NULL,1),(3,'ROLE_USER','user','user',1,'','',1),(4,'ROLE_USER','user2','user2',1,'','',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travels`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gidisAmac` varchar(45) CHARACTER SET utf8 NOT NULL,
  `projeKod` varchar(45) CHARACTER SET utf8 NOT NULL,
  `seyehatBas` varchar(45) NOT NULL,
  `seyehatSon` varchar(45) NOT NULL,
  `seyehatYeri` varchar(45) CHARACTER SET utf8 NOT NULL,
  `userId` int(11) NOT NULL,
  `seyehatMik` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travels`
--

LOCK TABLES `travels` WRITE;
/*!40000 ALTER TABLE `travels` DISABLE KEYS */;
INSERT INTO `travels` VALUES (5,'Project1','D-2','04/19/2017','08/12/2017','Italy',2,'2500£'),(6,'Negotiations','M-6','05/27/2017','05/31/2017','Ukraine',2,'2800$'),(7,'meet-up','K-8','05/04/2017','06/17/2017','France',2,'8000$'),(8,'Project2','A-5','04/13/2017','04/29/2017','Spain',3,'2000$'),(9,'Project3','A-2','06/13/2017','07/14/2017','Portugal',4,'3500£');
/*!40000 ALTER TABLE `travels` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-02 17:42:53
