-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: crud
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `body` longtext NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`blog_id`,`users_id`),
  KEY `fk_blog_users1_idx` (`users_id`),
  CONSTRAINT `fk_blog_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer1_info`
--

DROP TABLE IF EXISTS `footer1_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footer1_info` (
  `footer1_info_id` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(191) NOT NULL,
  `excertps` longtext NOT NULL,
  `fbook_icon` varchar(191) DEFAULT NULL,
  `linkedin_icon` varchar(191) DEFAULT NULL,
  `whatsapp_icon` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`footer1_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer1_info`
--

LOCK TABLES `footer1_info` WRITE;
/*!40000 ALTER TABLE `footer1_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `footer1_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer_bottom`
--

DROP TABLE IF EXISTS `footer_bottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footer_bottom` (
  `footer_bottom_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `copy_right_year` date DEFAULT NULL,
  PRIMARY KEY (`footer_bottom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer_bottom`
--

LOCK TABLES `footer_bottom` WRITE;
/*!40000 ALTER TABLE `footer_bottom` DISABLE KEYS */;
/*!40000 ALTER TABLE `footer_bottom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header_info`
--

DROP TABLE IF EXISTS `header_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header_info` (
  `header_info_id` int NOT NULL AUTO_INCREMENT,
  `logo` varchar(191) NOT NULL,
  `menu1` varchar(45) NOT NULL,
  `menu2` varchar(45) NOT NULL,
  `menu3` varchar(45) NOT NULL,
  `menu4` varchar(45) NOT NULL,
  `style` enum('style1','style2') DEFAULT 'style1',
  PRIMARY KEY (`header_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header_info`
--

LOCK TABLES `header_info` WRITE;
/*!40000 ALTER TABLE `header_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `header_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_info`
--

DROP TABLE IF EXISTS `meta_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_info` (
  `meta_info_id` int NOT NULL AUTO_INCREMENT,
  `site_icon` varchar(191) NOT NULL,
  `site_desc` longtext NOT NULL,
  `site_name` varchar(45) NOT NULL,
  `site_slogan` longtext NOT NULL,
  PRIMARY KEY (`meta_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_info`
--

LOCK TABLES `meta_info` WRITE;
/*!40000 ALTER TABLE `meta_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `pages_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `header_info_id` int NOT NULL,
  `footer1_info_id` int NOT NULL,
  `footer_bottom_id` int NOT NULL,
  `quicklinks_id` int NOT NULL,
  `meta_info_id` int NOT NULL,
  PRIMARY KEY (`pages_id`,`header_info_id`,`footer1_info_id`,`footer_bottom_id`,`quicklinks_id`,`meta_info_id`),
  KEY `fk_pages_header_info_idx` (`header_info_id`),
  KEY `fk_pages_footer1_info1_idx` (`footer1_info_id`),
  KEY `fk_pages_footer_bottom1_idx` (`footer_bottom_id`),
  KEY `fk_pages_quicklinks_info1_idx` (`quicklinks_id`),
  KEY `fk_pages_meta_info1_idx` (`meta_info_id`),
  CONSTRAINT `fk_pages_footer1_info1` FOREIGN KEY (`footer1_info_id`) REFERENCES `footer1_info` (`footer1_info_id`),
  CONSTRAINT `fk_pages_footer_bottom1` FOREIGN KEY (`footer_bottom_id`) REFERENCES `footer_bottom` (`footer_bottom_id`),
  CONSTRAINT `fk_pages_header_info` FOREIGN KEY (`header_info_id`) REFERENCES `header_info` (`header_info_id`),
  CONSTRAINT `fk_pages_meta_info1` FOREIGN KEY (`meta_info_id`) REFERENCES `meta_info` (`meta_info_id`),
  CONSTRAINT `fk_pages_quicklinks_info1` FOREIGN KEY (`quicklinks_id`) REFERENCES `quicklinks_info` (`quicklinks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quicklinks_info`
--

DROP TABLE IF EXISTS `quicklinks_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quicklinks_info` (
  `quicklinks_id` int NOT NULL AUTO_INCREMENT,
  `quicklinks1` enum('HOME','ABOUT','SERVICES','BLOG') DEFAULT 'HOME',
  `quicklinks2` enum('HOME','ABOUT','SERVICES','BLOG') DEFAULT 'ABOUT',
  `quicklinks3` enum('HOME','ABOUT','SERVICES','BLOG') DEFAULT 'SERVICES',
  `quicklinks4` enum('HOME','ABOUT','SERVICES','BLOG') DEFAULT 'BLOG',
  PRIMARY KEY (`quicklinks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quicklinks_info`
--

LOCK TABLES `quicklinks_info` WRITE;
/*!40000 ALTER TABLE `quicklinks_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `quicklinks_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `users_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(90) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `gender` enum('M','F') DEFAULT 'M',
  `profile)_image` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'crud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-27 13:45:59
