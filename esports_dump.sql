-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: esports
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competition` (
  `ID` tinyint unsigned NOT NULL,
  `Start_Time` time NOT NULL,
  `End_Time` time DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `Replay` varchar(2083) DEFAULT NULL,
  `Game_ID` tinyint unsigned NOT NULL,
  `Tournament_ID` tinyint unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Game_ID` (`Game_ID`),
  KEY `Tournament_ID` (`Tournament_ID`),
  CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `competition_ibfk_2` FOREIGN KEY (`Tournament_ID`) REFERENCES `tournament` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition`
--

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
INSERT INTO `competition` VALUES (0,'10:15:00','12:45:00',NULL,NULL,7,0),(1,'11:15:00','13:45:00',NULL,NULL,0,0),(2,'12:15:00','14:45:00',NULL,NULL,1,0),(3,'13:15:00','15:45:00',NULL,NULL,8,0),(4,'14:15:00','16:45:00',NULL,NULL,0,0),(5,'15:15:00','17:45:00',NULL,NULL,0,0),(6,'16:15:00','18:45:00',NULL,NULL,8,0),(7,'17:15:00','19:45:00',NULL,NULL,4,1),(8,'18:15:00','20:45:00',NULL,NULL,6,1),(9,'19:15:00','21:45:00',NULL,NULL,4,1),(10,'20:15:00','22:45:00',NULL,NULL,0,1),(11,'21:15:00','23:45:00',NULL,NULL,0,1),(12,'10:00:00','12:45:00',NULL,NULL,4,1),(13,'10:30:00','12:45:00',NULL,NULL,2,2),(14,'11:00:00','12:45:00',NULL,NULL,2,2),(15,'11:30:00','12:45:00',NULL,NULL,2,2),(16,'11:00:00','12:45:00',NULL,NULL,3,2),(17,'12:00:00','12:45:00',NULL,NULL,0,0),(18,'12:45:00','12:45:00',NULL,NULL,0,1),(19,'14:35:00','12:45:00',NULL,NULL,2,2),(20,'15:47:00','12:45:00',NULL,NULL,0,3),(21,'19:45:00','20:25:00',NULL,NULL,1,0),(22,'13:12:00','14:01:00',NULL,NULL,6,0);
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitionteams`
--

DROP TABLE IF EXISTS `competitionteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competitionteams` (
  `Team_ID` tinyint unsigned NOT NULL,
  `Match_ID` tinyint unsigned NOT NULL,
  PRIMARY KEY (`Team_ID`,`Match_ID`),
  KEY `Match_ID` (`Match_ID`),
  CONSTRAINT `competitionteams_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `competitionteams_ibfk_2` FOREIGN KEY (`Match_ID`) REFERENCES `competition` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitionteams`
--

LOCK TABLES `competitionteams` WRITE;
/*!40000 ALTER TABLE `competitionteams` DISABLE KEYS */;
INSERT INTO `competitionteams` VALUES (1,0),(2,0),(3,1),(4,1),(5,2),(6,2),(7,3),(8,3),(9,4),(10,4),(11,5),(12,5),(13,6),(14,6),(15,7),(16,7),(17,8),(18,8),(19,9),(20,9),(1,10),(20,10),(2,11),(19,11),(3,12),(18,12),(4,13),(17,13),(5,14),(16,14),(6,15),(15,15),(7,16),(14,16),(8,17),(13,17),(9,18),(12,18),(10,19),(11,19),(3,20),(8,20),(5,21),(12,21),(16,22),(20,22);
/*!40000 ALTER TABLE `competitionteams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitionteamswinner`
--

DROP TABLE IF EXISTS `competitionteamswinner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competitionteamswinner` (
  `Team_ID` tinyint unsigned NOT NULL,
  `Match_ID` tinyint unsigned NOT NULL,
  PRIMARY KEY (`Match_ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `competitionteamswinner_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `competitionteamswinner_ibfk_2` FOREIGN KEY (`Match_ID`) REFERENCES `competition` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitionteamswinner`
--

LOCK TABLES `competitionteamswinner` WRITE;
/*!40000 ALTER TABLE `competitionteamswinner` DISABLE KEYS */;
INSERT INTO `competitionteamswinner` VALUES (1,10),(2,0),(4,1),(5,2),(5,14),(5,21),(6,15),(8,3),(8,17),(8,20),(9,4),(9,18),(11,19),(12,5),(14,6),(14,16),(15,7),(16,22),(17,13),(18,8),(18,12),(19,9),(19,11);
/*!40000 ALTER TABLE `competitionteamswinner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `ID` tinyint unsigned NOT NULL,
  `Genre` varchar(45) DEFAULT NULL,
  `Title` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (0,'Battle Royale','Fortnite'),(1,'First Person Shooter','Halo: Infinite'),(2,'MOBA','League of Legends'),(3,'MOBA','Deadlock'),(4,'Racing','Garfield Kart'),(5,'Fighting','Super Smash Bros Ultimate'),(6,'Fighting','Tekken 8'),(7,'First Person Shooter','Call of Duty Black Ops 6'),(8,'First Person Shooter','CS:GO 2'),(9,'Third Person Shooter','Marvel Rivals'),(10,'Action','Elden Ring: Nightreign');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infraction`
--

DROP TABLE IF EXISTS `infraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infraction` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Text_Description` varchar(63) DEFAULT NULL,
  `Report_Date` date DEFAULT NULL,
  `Class` tinyint DEFAULT NULL,
  `Player_ID` tinyint unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Player_ID` (`Player_ID`),
  CONSTRAINT `infraction_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infraction`
--

LOCK TABLES `infraction` WRITE;
/*!40000 ALTER TABLE `infraction` DISABLE KEYS */;
INSERT INTO `infraction` VALUES (1,'Unsportsmanlike Conduct','2025-02-18',2,18),(2,'Modified Equipment','2024-11-13',6,32),(3,'Fraud','2023-01-03',5,24),(4,'Physical Violence','2023-08-17',10,37),(5,'Unsportsmanlike Conduct','2025-03-23',6,23),(6,'Cheating - Aimbot','2024-06-06',8,11);
/*!40000 ALTER TABLE `infraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(55) NOT NULL,
  `Country` varchar(55) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,'Winners Utd.','Pakistan'),(2,'Losers Dvd.','United States of America'),(3,'Regionals','Canada'),(4,'L\'Internationale','Zimbabwe'),(5,'EPEMAL2 League','Mongolia');
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Player_Name` varchar(31) DEFAULT NULL,
  `Age` tinyint DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Address` varchar(63) DEFAULT NULL,
  `Team_ID` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `player_chk_1` CHECK ((`Gender` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Michele Macdonald',33,'N','4482 Amanda Loop, Figueroaview, NV 49234',1),(2,'Ashley Taylor',23,'N','6972 Gomez Mountains, Robinsonfort, NY 42213',8),(3,'Trevor Mullen',30,'N','709 Anthony Mountains, Onealtown, NC 09211',13),(4,'Gloria Miller',39,'M','USCGC Smith, FPO AE 15725',2),(5,'Christine Key',37,'F','329 Lee Mews Suite 562, Robertchester, NV 93408',10),(6,'Dylan Stewart',19,'M','5667 Blair Underpass, South Shelby, VT 07027',16),(7,'Rebecca Johnson',25,'M','0239 Salazar Squares, Kelseystad, NH 07571',19),(8,'Crystal Black',18,'M','USCGC Carpenter, FPO AA 33891',15),(9,'Janet Lewis',17,'M','25040 Bryce Meadow, New Randy, IN 59968',2),(10,'James Franklin',28,'M','5875 Johnson Cape, West Christopher, NC 45818',1),(11,'Jacob Harris',41,'M','8647 Wiggins Garden Apt. 481, South Tylermouth, MT 65195',8),(12,'Steven Wilson',39,'M','63791 Hansen Village, Williamsburgh, NM 29343',6),(13,'David Pitts',18,'M','USNV Vang, FPO AE 73515',11),(14,'April Ward',39,'F','425 Martinez Forks, East Jennifer, OR 10985',13),(15,'Crystal Gomez',21,'M','426 Young View Suite 405, Port Teresa, UT 33193',10),(16,'Jared Vaughn',41,'M','03104 Warren Locks, Port James, WI 07754',18),(17,'Robert Carroll',42,'F','50276 Cook Skyway, Lake Jordanbury, KY 81885',16),(18,'Patricia James',38,'F','54070 Fisher Gateway Apt. 525, East Katie, ID 22630',19),(19,'Sandra Ramos',19,'F','Unit 1686 Box 2047, DPO AP 42392',14),(20,'Paula White',45,'M','36901 Jared Bridge, Brendaborough, SC 68514',7),(21,'Douglas Morris',31,'F','7323 Patrick Tunnel, South Veronica, KY 87012',14),(22,'Ronald Aguilar',18,'F','5953 Miranda Divide, East Anthony, TN 54744',3),(23,'Renee Chandler',38,'F','845 Kevin Parkways, Mariahfurt, MI 22789',7),(24,'Douglas Payne',38,'M','PSC 0217, Box 3264, APO AP 36556',4),(25,'Angela Obrien',25,'F','79722 Steven Vista Suite 545, East Andrew, OR 69443',9),(26,'David Warner',41,'F','PSC 8681, Box 7754, APO AP 70521',6),(27,'Seth Taylor',36,'F','3706 Heather Prairie, Jeremyfort, UT 91286',9),(28,'Dustin Ferguson',23,'M','5145 Carroll Coves Suite 593, Moniquemouth, IN 89149',20),(29,'Lauren Caldwell',21,'M','72004 Emily Passage, South Craigport, VT 90474',3),(30,'Julie Wiggins',24,'M','6290 Thomas Mill, Aprilbury, MA 93053',20),(31,'Erin Rhodes',43,'F','62197 Timothy Radial, East Patrickside, IL 08623',15),(32,'Heidi Mckee',29,'M','3741 Adam Crescent, New Nicole, IA 99776',12),(33,'Wesley Shaw',44,'M','7430 Armstrong Fort Suite 460, Elizabethborough, ID 72780',12),(34,'Shawn Hernandez',22,'M','7604 Hill Plains, East Haroldview, MA 25751',4),(35,'Sabrina Drake',27,'F','7116 Christopher Village Apt. 857, Williamview, MO 39232',5),(36,'Michael Schmidt',40,'M','21937 Robert Shoal, Johnbury, NH 38955',11),(37,'Christopher Gonzalez',34,'F','69774 Anthony Greens Apt. 376, North Brittany, LA 30641',5),(38,'Bryan Harrison',31,'F','USNS Mitchell, FPO AA 91235',17),(39,'Victor Gutierrez',16,'M','37233 Jimmy Center, Port Shane, RI 02311',17),(40,'Emily Butler',43,'F','70618 Brewer Vista, South Johnmouth, MS 75763',18);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_restriction`
--

DROP TABLE IF EXISTS `player_restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_restriction` (
  `Player_ID` tinyint unsigned NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `Expiration` date DEFAULT NULL,
  `R_Level` tinyint NOT NULL,
  PRIMARY KEY (`Player_ID`),
  KEY `R_Level` (`R_Level`),
  CONSTRAINT `player_restriction_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_restriction_ibfk_2` FOREIGN KEY (`R_Level`) REFERENCES `restriction` (`R_Level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_restriction`
--

LOCK TABLES `player_restriction` WRITE;
/*!40000 ALTER TABLE `player_restriction` DISABLE KEYS */;
INSERT INTO `player_restriction` VALUES (9,'2024-04-01','2026-04-01',2),(11,'2024-06-06','2025-06-06',4),(23,'2025-03-23','2025-04-23',3),(37,'2023-08-17','3000-01-01',1),(39,'2025-04-01','2027-04-01',2);
/*!40000 ALTER TABLE `player_restriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerscore`
--

DROP TABLE IF EXISTS `playerscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerscore` (
  `Score_ID` tinyint unsigned NOT NULL,
  `Player_ID` tinyint unsigned NOT NULL,
  `Total_Score` smallint unsigned NOT NULL,
  PRIMARY KEY (`Score_ID`,`Player_ID`),
  KEY `Player_ID` (`Player_ID`),
  CONSTRAINT `playerscore_ibfk_1` FOREIGN KEY (`Score_ID`) REFERENCES `score` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playerscore_ibfk_2` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerscore`
--

LOCK TABLES `playerscore` WRITE;
/*!40000 ALTER TABLE `playerscore` DISABLE KEYS */;
INSERT INTO `playerscore` VALUES (1,1,84),(2,10,73),(3,4,22),(4,9,56),(7,22,78),(8,29,24),(9,24,34),(10,34,51),(13,35,53),(14,37,64),(15,12,62),(16,26,79),(19,20,38),(20,23,46),(21,2,44),(22,11,23),(25,25,66),(26,27,34),(27,5,19),(28,15,37),(31,13,53),(32,36,38),(33,32,53),(34,33,33),(37,3,81),(38,14,43),(39,19,38),(40,21,67),(43,8,25),(44,31,22),(45,6,38),(46,17,79),(49,38,15),(50,39,53),(51,16,34),(52,40,81),(55,7,88),(56,18,56),(57,28,34),(58,30,15),(61,1,38),(62,10,35),(63,28,13),(64,30,63),(67,4,59),(68,9,74),(69,7,73),(70,18,25),(73,22,16),(74,29,37),(75,16,95),(76,40,91),(79,24,28),(80,34,34),(81,38,38),(82,39,15),(85,35,98),(86,37,46),(87,6,38),(88,17,15),(91,12,81),(92,26,53),(93,8,56),(94,31,34),(97,20,24),(98,23,84),(99,19,53),(100,21,34),(103,2,84),(104,11,63),(105,3,59),(106,14,17),(109,25,34),(110,27,35),(111,32,92),(112,33,37),(115,13,36),(116,36,15),(117,5,24),(118,15,64),(121,2,27),(122,11,56),(123,22,44),(124,29,16),(127,32,63),(128,33,28),(129,35,27),(130,37,35),(133,6,33),(134,17,16),(135,28,48),(136,30,91);
/*!40000 ALTER TABLE `playerscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restriction`
--

DROP TABLE IF EXISTS `restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restriction` (
  `R_Level` tinyint NOT NULL AUTO_INCREMENT,
  `Text_Description` varchar(63) DEFAULT NULL,
  `Duration` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`R_Level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restriction`
--

LOCK TABLES `restriction` WRITE;
/*!40000 ALTER TABLE `restriction` DISABLE KEYS */;
INSERT INTO `restriction` VALUES (1,'Permanent Ban',0),(2,'Minor',24),(3,'Temporary Ban',1),(4,'Long Ban',12);
/*!40000 ALTER TABLE `restriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Competition_ID` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Competition_ID` (`Competition_ID`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`Competition_ID`) REFERENCES `competition` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(31,5),(32,5),(33,5),(34,5),(35,5),(36,5),(37,6),(38,6),(39,6),(40,6),(41,6),(42,6),(43,7),(44,7),(45,7),(46,7),(47,7),(48,7),(49,8),(50,8),(51,8),(52,8),(53,8),(54,8),(55,9),(56,9),(57,9),(58,9),(59,9),(60,9),(61,10),(62,10),(63,10),(64,10),(65,10),(66,10),(67,11),(68,11),(69,11),(70,11),(71,11),(72,11),(73,12),(74,12),(75,12),(76,12),(77,12),(78,12),(79,13),(80,13),(81,13),(82,13),(83,13),(84,13),(85,14),(86,14),(87,14),(88,14),(89,14),(90,14),(91,15),(92,15),(93,15),(94,15),(95,15),(96,15),(97,16),(98,16),(99,16),(100,16),(101,16),(102,16),(103,17),(104,17),(105,17),(106,17),(107,17),(108,17),(109,18),(110,18),(111,18),(112,18),(113,18),(114,18),(115,19),(116,19),(117,19),(118,19),(119,19),(120,19),(121,20),(122,20),(123,20),(124,20),(125,20),(126,20),(127,21),(128,21),(129,21),(130,21),(131,21),(132,21),(133,22),(134,22),(135,22),(136,22),(137,22),(138,22);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorelevel`
--

DROP TABLE IF EXISTS `scorelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scorelevel` (
  `Score_ID` tinyint unsigned NOT NULL,
  `Scr_Level` varchar(8) NOT NULL,
  PRIMARY KEY (`Score_ID`),
  CONSTRAINT `scorelevel_ibfk_1` FOREIGN KEY (`Score_ID`) REFERENCES `score` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorelevel`
--

LOCK TABLES `scorelevel` WRITE;
/*!40000 ALTER TABLE `scorelevel` DISABLE KEYS */;
INSERT INTO `scorelevel` VALUES (1,'Player'),(2,'Player'),(3,'Player'),(4,'Player'),(5,'Team'),(6,'Team'),(7,'Player'),(8,'Player'),(9,'Player'),(10,'Player'),(11,'Team'),(12,'Team'),(13,'Player'),(14,'Player'),(15,'Player'),(16,'Player'),(17,'Team'),(18,'Team'),(19,'Player'),(20,'Player'),(21,'Player'),(22,'Player'),(23,'Team'),(24,'Team'),(25,'Player'),(26,'Player'),(27,'Player'),(28,'Player'),(29,'Team'),(30,'Team'),(31,'Player'),(32,'Player'),(33,'Player'),(34,'Player'),(35,'Team'),(36,'Team'),(37,'Player'),(38,'Player'),(39,'Player'),(40,'Player'),(41,'Team'),(42,'Team'),(43,'Player'),(44,'Player'),(45,'Player'),(46,'Player'),(47,'Team'),(48,'Team'),(49,'Player'),(50,'Player'),(51,'Player'),(52,'Player'),(53,'Team'),(54,'Team'),(55,'Player'),(56,'Player'),(57,'Player'),(58,'Player'),(59,'Team'),(60,'Team'),(61,'Player'),(62,'Player'),(63,'Player'),(64,'Player'),(65,'Team'),(66,'Team'),(67,'Player'),(68,'Player'),(69,'Player'),(70,'Player'),(71,'Team'),(72,'Team'),(73,'Player'),(74,'Player'),(75,'Player'),(76,'Player'),(77,'Team'),(78,'Team'),(79,'Player'),(80,'Player'),(81,'Player'),(82,'Player'),(83,'Team'),(84,'Team'),(85,'Player'),(86,'Player'),(87,'Player'),(88,'Player'),(89,'Team'),(90,'Team'),(91,'Player'),(92,'Player'),(93,'Player'),(94,'Player'),(95,'Team'),(96,'Team'),(97,'Player'),(98,'Player'),(99,'Player'),(100,'Player'),(101,'Team'),(102,'Team'),(103,'Player'),(104,'Player'),(105,'Player'),(106,'Player'),(107,'Team'),(108,'Team'),(109,'Player'),(110,'Player'),(111,'Player'),(112,'Player'),(113,'Team'),(114,'Team'),(115,'Player'),(116,'Player'),(117,'Player'),(118,'Player'),(119,'Team'),(120,'Team'),(121,'Player'),(122,'Player'),(123,'Player'),(124,'Player'),(125,'Team'),(126,'Team'),(127,'Player'),(128,'Player'),(129,'Player'),(130,'Player'),(131,'Team'),(132,'Team'),(133,'Player'),(134,'Player'),(135,'Player'),(136,'Player'),(137,'Team'),(138,'Team');
/*!40000 ALTER TABLE `scorelevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scorerank`
--

DROP TABLE IF EXISTS `scorerank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scorerank` (
  `Score_ID` tinyint unsigned NOT NULL,
  `Score_Rank` char(1) NOT NULL,
  PRIMARY KEY (`Score_ID`),
  CONSTRAINT `scorerank_ibfk_1` FOREIGN KEY (`Score_ID`) REFERENCES `score` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scorerank`
--

LOCK TABLES `scorerank` WRITE;
/*!40000 ALTER TABLE `scorerank` DISABLE KEYS */;
INSERT INTO `scorerank` VALUES (1,'A'),(2,'B'),(3,'D'),(4,'B'),(5,'D'),(6,'B'),(7,'B'),(8,'D'),(9,'D'),(10,'C'),(11,'A'),(12,'A'),(13,'C'),(14,'B'),(15,'B'),(16,'C'),(17,'A'),(18,'D'),(19,'D'),(20,'C'),(21,'C'),(22,'D'),(23,'D'),(24,'D'),(25,'B'),(26,'D'),(27,'D'),(28,'D'),(29,'D'),(30,'D'),(31,'C'),(32,'D'),(33,'C'),(34,'D'),(35,'B'),(36,'B'),(37,'A'),(38,'C'),(39,'D'),(40,'B'),(41,'D'),(42,'C'),(43,'D'),(44,'D'),(45,'D'),(46,'B'),(47,'A'),(48,'C'),(49,'D'),(50,'C'),(51,'D'),(52,'A'),(53,'C'),(54,'B'),(55,'A'),(56,'C'),(57,'D'),(58,'D'),(59,'D'),(60,'D'),(61,'D'),(62,'D'),(63,'D'),(64,'B'),(65,'B'),(66,'C'),(67,'C'),(68,'B'),(69,'B'),(70,'D'),(71,'D'),(72,'C'),(73,'D'),(74,'D'),(75,'A'),(76,'A'),(77,'D'),(78,'B'),(79,'D'),(80,'D'),(81,'D'),(82,'D'),(83,'C'),(84,'C'),(85,'A'),(86,'C'),(87,'D'),(88,'D'),(89,'B'),(90,'D'),(91,'A'),(92,'C'),(93,'C'),(94,'D'),(95,'A'),(96,'D'),(97,'D'),(98,'A'),(99,'C'),(100,'D'),(101,'D'),(102,'D'),(103,'A'),(104,'B'),(105,'C'),(106,'D'),(107,'B'),(108,'D'),(109,'D'),(110,'D'),(111,'A'),(112,'D'),(113,'B'),(114,'D'),(115,'D'),(116,'D'),(117,'D'),(118,'B'),(119,'A'),(120,'D'),(121,'D'),(122,'C'),(123,'C'),(124,'D'),(125,'C'),(126,'D'),(127,'B'),(128,'D'),(129,'D'),(130,'D'),(131,'D'),(132,'B'),(133,'D'),(134,'D'),(135,'C'),(136,'A'),(137,'B'),(138,'D');
/*!40000 ALTER TABLE `scorerank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `ID` tinyint unsigned NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (0,'Weyland-Yutani'),(1,'Vaultec'),(2,'Raytheon'),(3,'Lumon'),(4,'Buy n\' Large'),(5,'Blackrock'),(6,'Soylent Green'),(7,'United Healthcare'),(8,'Nestle'),(9,'Lockheed Martin'),(10,'The Great British Bakeoff'),(11,'Texas Instruments');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `League_ID` tinyint unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `League_ID` (`League_ID`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`League_ID`) REFERENCES `league` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1),(6,1),(11,1),(16,1),(2,2),(7,2),(12,2),(17,2),(3,3),(8,3),(13,3),(18,3),(4,4),(9,4),(14,4),(19,4),(5,5),(10,5),(15,5),(20,5);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamscore`
--

DROP TABLE IF EXISTS `teamscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teamscore` (
  `Score_ID` tinyint unsigned NOT NULL,
  `Team_ID` tinyint unsigned NOT NULL,
  `Total_Score` smallint unsigned NOT NULL,
  PRIMARY KEY (`Score_ID`,`Team_ID`),
  KEY `Team_ID` (`Team_ID`),
  CONSTRAINT `teamscore_ibfk_1` FOREIGN KEY (`Score_ID`) REFERENCES `score` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teamscore_ibfk_2` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamscore`
--

LOCK TABLES `teamscore` WRITE;
/*!40000 ALTER TABLE `teamscore` DISABLE KEYS */;
INSERT INTO `teamscore` VALUES (5,1,34),(6,2,59),(11,3,81),(12,4,88),(17,5,95),(18,6,15),(23,7,19),(24,8,28),(29,9,21),(30,10,10),(35,11,62),(36,12,69),(41,13,14),(42,14,53),(47,15,99),(48,16,43),(53,17,55),(54,18,78),(59,19,32),(60,20,15),(65,1,64),(66,20,52),(71,2,13),(72,19,53),(77,3,34),(78,18,65),(83,4,43),(84,17,44),(89,5,63),(90,16,34),(95,6,85),(96,15,36),(101,7,16),(102,14,34),(107,8,65),(108,13,23),(113,9,61),(114,12,35),(119,11,88),(120,10,13),(125,8,57),(126,3,35),(131,12,36),(132,5,66),(137,16,50),(138,20,37);
/*!40000 ALTER TABLE `teamscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `ID` tinyint unsigned NOT NULL,
  `Date` date DEFAULT NULL,
  `Sponsor_ID` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Sponsor_ID` (`Sponsor_ID`),
  CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`Sponsor_ID`) REFERENCES `sponsor` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
INSERT INTO `tournament` VALUES (0,'2020-12-15',5),(1,'2021-12-15',7),(2,'2025-12-15',9),(3,'2021-12-15',2),(4,'2022-12-15',11),(5,'2023-12-15',6),(6,'2025-12-15',3),(7,'2022-12-15',10),(8,'2024-12-15',4),(9,'2026-12-15',1),(10,'2023-12-15',8),(11,'2021-12-15',0),(12,'2020-12-15',7),(13,'2025-12-15',10),(14,'2020-12-15',4),(15,'2025-12-15',2),(16,'2022-12-15',9);
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 11:07:28
