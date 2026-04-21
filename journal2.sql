-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: journal
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `idlessons` int NOT NULL AUTO_INCREMENT,
  `today` date NOT NULL,
  `topic` varchar(45) DEFAULT 'Програмирование',
  `groupe` varchar(45) DEFAULT '38ИС',
  PRIMARY KEY (`idlessons`),
  UNIQUE KEY `today_UNIQUE` (`today`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `idmarks` int NOT NULL AUTO_INCREMENT,
  `mark` int NOT NULL DEFAULT '0',
  `students_idstudent` int NOT NULL,
  `lessons_idlessons` int NOT NULL,
  PRIMARY KEY (`idmarks`),
  KEY `fk_marks_students1_idx` (`students_idstudent`),
  KEY `fk_marks_lessons1_idx` (`lessons_idlessons`),
  CONSTRAINT `fk_marks_lessons1` FOREIGN KEY (`lessons_idlessons`) REFERENCES `lessons` (`idlessons`),
  CONSTRAINT `fk_marks_students1` FOREIGN KEY (`students_idstudent`) REFERENCES `students` (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `present`
--

DROP TABLE IF EXISTS `present`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `present` (
  `idmarks` int NOT NULL AUTO_INCREMENT,
  `present` char(100) NOT NULL DEFAULT 'е',
  `students_idstudent` int NOT NULL,
  `lessons_idlessons` int NOT NULL,
  PRIMARY KEY (`idmarks`),
  KEY `fk_present_students_idx` (`students_idstudent`),
  KEY `fk_present_lessons1_idx` (`lessons_idlessons`),
  CONSTRAINT `fk_present_lessons1` FOREIGN KEY (`lessons_idlessons`) REFERENCES `lessons` (`idlessons`),
  CONSTRAINT `fk_present_students` FOREIGN KEY (`students_idstudent`) REFERENCES `students` (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `present`
--

LOCK TABLES `present` WRITE;
/*!40000 ALTER TABLE `present` DISABLE KEYS */;
/*!40000 ALTER TABLE `present` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `idstudent` int NOT NULL AUTO_INCREMENT,
  `name_lastname` varchar(100) NOT NULL,
  `groupe` varchar(45) NOT NULL DEFAULT '38ИС',
  PRIMARY KEY (`idstudent`),
  UNIQUE KEY `name_lastname_UNIQUE` (`name_lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-10 18:47:48
