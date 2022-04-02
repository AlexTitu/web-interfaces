-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: titualex
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jocuri`
--

DROP TABLE IF EXISTS `jocuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jocuri` (
  `idjoc` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `nr_jucatori` bigint unsigned NOT NULL DEFAULT '0',
  `tip` varchar(45) DEFAULT NULL,
  `data_lansarii` date DEFAULT NULL,
  `developer` varchar(45) DEFAULT NULL,
  `urmatorul_campionat` datetime DEFAULT NULL,
  `numar_campionate` bigint unsigned NOT NULL DEFAULT '0',
  `campion_actual` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idjoc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jocuri`
--

LOCK TABLES `jocuri` WRITE;
/*!40000 ALTER TABLE `jocuri` DISABLE KEYS */;
INSERT INTO `jocuri` VALUES (1,'StarCraft II',2,'RTS','2010-07-27','Blizzard','2022-10-10 00:00:00',6,NULL),(2,'League of Legends',1,'MOBA','2009-10-27','Riot Games','2023-04-05 00:00:00',9,NULL),(3,'Counter Strike Global Offensive',1,'FPS','2012-08-21','Valve','2022-03-28 00:00:00',10,NULL),(4,'Dota 2',2,'MOBA','2009-10-09','Valve',NULL,0,NULL);
/*!40000 ALTER TABLE `jocuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jucatori`
--

DROP TABLE IF EXISTS `jucatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jucatori` (
  `idjucator` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data_nasterii` date DEFAULT NULL,
  `gen` enum('Male','Female','Other') NOT NULL,
  `nationalitate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idjucator`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jucatori`
--

LOCK TABLES `jucatori` WRITE;
/*!40000 ALTER TABLE `jucatori` DISABLE KEYS */;
INSERT INTO `jucatori` VALUES (1,'Trifan','Marian','trif.marian@gmail.com','2000-10-10','Male',NULL),(2,'Traian','Marta','tmarta99@yahoo.com','1999-09-25','Female',NULL),(3,'Gal','Mihai','misu.g@hotmail.com','1998-02-08','Male',NULL),(4,'Smith','Alexis','alex_s@gmail.com','2002-05-02','Other',NULL);
/*!40000 ALTER TABLE `jucatori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profil` (
  `idprofil` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idjucator` bigint unsigned DEFAULT NULL,
  `idjoc` bigint unsigned DEFAULT NULL,
  `data_creare` date DEFAULT NULL,
  `rank` varchar(45) DEFAULT NULL,
  `campionate_participate` bigint unsigned NOT NULL DEFAULT '0',
  `medalii_aur` bigint unsigned NOT NULL DEFAULT '0',
  `medalii_argint` bigint unsigned NOT NULL DEFAULT '0',
  `medalii_bronz` bigint unsigned NOT NULL DEFAULT '0',
  `campion` tinyint unsigned NOT NULL DEFAULT '0',
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`idprofil`),
  KEY `fk_profil_1_idx` (`idjoc`),
  KEY `fk_profil_2_idx` (`idjucator`),
  CONSTRAINT `fk_profil_1` FOREIGN KEY (`idjoc`) REFERENCES `jocuri` (`idjoc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profil_2` FOREIGN KEY (`idjucator`) REFERENCES `jucatori` (`idjucator`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
INSERT INTO `profil` VALUES (1,1,1,'2019-01-19','Master',0,0,0,2,0,'Tedy23'),(2,2,1,'2020-03-08','Newbie',0,0,0,0,0,'masterPlan'),(3,3,2,'2014-09-03','Diamond IV',0,0,2,2,0,'InstaKiLL'),(4,4,3,'2014-06-07','Global Elite',4,1,2,0,0,'t0pSh0tz'),(5,3,3,'2016-03-09','Silver Elite Master',0,0,0,0,0,'G_Man');
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-28 22:06:04
