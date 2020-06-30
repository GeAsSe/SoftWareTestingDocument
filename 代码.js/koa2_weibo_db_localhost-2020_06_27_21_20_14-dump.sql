-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: koa2_weibo_db
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atRelations`
--

create database koa2_weibo_db;
use koa2_weibo_db

DROP TABLE IF EXISTS `atRelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atRelations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `blogId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `atRealations_blogs_id_fk` (`blogId`),
  KEY `atRealations_users_id_fk` (`userId`),
  CONSTRAINT `atRealations_blogs_id_fk` FOREIGN KEY (`blogId`) REFERENCES `blogs` (`id`),
  CONSTRAINT `atRealations_users_id_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atRelations`
--

LOCK TABLES `atRelations` WRITE;
/*!40000 ALTER TABLE `atRelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `atRelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `userid` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_users_id_fk` (`userid`),
  CONSTRAINT `blogs_users_id_fk` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'fwwrfvw',3,'','2020-06-23 15:39:17','2020-06-23 15:39:17'),(2,'ahahah',3,'','2020-06-23 15:39:25','2020-06-23 15:39:25');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userRelations`
--

DROP TABLE IF EXISTS `userRelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userRelations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `followerId` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userRelations_users_id_fk` (`userId`),
  KEY `userRelations_users_id_fk_2` (`followerId`),
  CONSTRAINT `userRelations_users_id_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `userRelations_users_id_fk_2` FOREIGN KEY (`followerId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userRelations`
--

LOCK TABLES `userRelations` WRITE;
/*!40000 ALTER TABLE `userRelations` DISABLE KEYS */;
INSERT INTO `userRelations` VALUES (1,3,3,'2020-06-23 15:24:55','2020-06-23 15:24:55'),(2,4,4,'2020-06-23 15:25:06','2020-06-23 15:25:06');
/*!40000 ALTER TABLE `userRelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` decimal(10,0) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'haha','1b1b53734f0ff4add1833af15ae6750e','haha',NULL,NULL,1,'2020-06-23 14:57:12','2020-06-23 14:57:12'),(3,'zz','61aba3fb695909ad9946625d0054b69f','zz',NULL,NULL,1,'2020-06-23 15:24:55','2020-06-23 15:24:55'),(4,'ee','61aba3fb695909ad9946625d0054b69f','ee',NULL,NULL,1,'2020-06-23 15:25:06','2020-06-23 15:25:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-27 21:20:14
