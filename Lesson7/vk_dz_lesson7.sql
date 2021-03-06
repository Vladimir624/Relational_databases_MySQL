-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_idx` (`admin_id`),
  CONSTRAINT `fk_community_profile1` FOREIGN KEY (`admin_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'enim',30),(2,'temporibus',15),(3,'cumque',55),(4,'est',40),(5,'rerum',71),(6,'laudantium',56),(7,'blanditiis',41),(8,'sit',3),(9,'alias',16),(10,'molestiae',15);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request` (
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 - отклонён; 0 - запрос; 1 - дружба',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `from_user_idx` (`from_user_id`),
  KEY `to_user_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_request_profile1` FOREIGN KEY (`from_user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_friend_request_profile2` FOREIGN KEY (`to_user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
INSERT INTO `friend_request` VALUES (1,68,-1,'1988-01-07 12:50:59','2016-11-05 22:56:32'),(2,31,1,'1997-12-13 14:15:20','1980-07-07 00:30:05'),(3,54,-1,'2008-08-29 08:21:47','2008-02-13 03:41:58'),(3,65,1,'2005-07-17 15:22:38','2007-12-31 03:35:04'),(4,18,-1,'2015-02-18 17:53:44','1980-12-15 04:17:43'),(5,18,0,'1993-06-08 09:58:30','2004-01-08 02:31:17'),(5,57,0,'1992-02-18 02:30:52',NULL),(6,18,1,'1985-05-30 19:31:45',NULL),(7,88,0,'2001-08-10 10:48:18',NULL),(8,51,1,'2021-05-05 08:03:12','1979-03-04 16:22:32'),(9,70,1,'2017-06-10 22:53:13',NULL),(10,17,1,'1972-09-03 18:32:51',NULL),(10,41,1,'1988-06-01 19:50:16',NULL),(11,50,1,'1990-05-26 07:03:00',NULL),(11,74,0,'2016-03-12 04:07:30',NULL),(12,76,1,'1994-05-02 15:22:50',NULL),(15,4,-1,'2001-08-14 01:19:18','2017-06-22 06:17:46'),(16,39,1,'1990-10-02 01:50:26','2010-07-14 16:23:56'),(17,4,-1,'1981-04-17 07:25:27','1981-01-30 14:43:30'),(18,41,0,'2007-08-02 15:55:17','2008-01-03 07:54:14'),(20,33,0,'1991-06-17 06:07:54',NULL),(21,2,-1,'1998-11-06 00:00:13',NULL),(21,57,-1,'1993-09-13 19:46:10','1983-06-22 22:11:37'),(22,5,1,'1989-12-16 04:43:57',NULL),(22,42,-1,'2020-02-27 18:26:48','2018-11-05 11:16:01'),(23,78,0,'1980-04-27 18:57:12',NULL),(25,16,0,'2011-01-28 17:36:29','1979-08-18 15:58:59'),(25,67,1,'1999-03-15 12:29:32',NULL),(25,77,-1,'2004-07-20 15:50:48',NULL),(25,83,1,'1980-05-04 20:52:44','1982-12-28 22:34:49'),(28,96,1,'2010-03-13 00:28:31','1999-06-24 15:57:20'),(31,95,-1,'2002-11-17 10:51:29','2011-11-15 04:42:09'),(32,89,-1,'2006-06-30 22:30:37',NULL),(34,19,0,'1993-08-19 00:15:08','1987-04-23 12:02:15'),(34,74,-1,'1979-08-19 13:46:03','1996-10-09 21:26:34'),(35,43,1,'1972-12-16 20:46:09',NULL),(38,98,0,'1981-07-18 16:22:30',NULL),(39,4,1,'1973-12-02 16:11:40',NULL),(39,51,1,'1990-10-06 03:54:16',NULL),(39,80,-1,'1994-08-02 08:31:26','2008-04-16 05:42:56'),(39,87,1,'1975-10-05 20:33:39',NULL),(41,40,-1,'2013-08-02 16:40:38','2021-06-29 21:54:31'),(43,20,-1,'2004-08-12 05:37:36',NULL),(44,69,-1,'1973-12-18 00:29:44',NULL),(45,60,-1,'1973-08-11 02:51:01',NULL),(47,12,0,'1980-09-24 15:24:22','1980-08-26 08:33:36'),(47,97,-1,'1972-03-24 23:43:50','1987-06-01 21:08:11'),(48,35,-1,'2018-04-19 21:14:19','1982-09-06 17:08:00'),(49,27,0,'1992-05-12 02:27:38','1994-02-17 15:26:32'),(50,26,0,'1994-03-30 15:55:01','1985-02-13 01:09:13'),(51,48,1,'1979-12-12 12:52:25','2020-08-31 17:20:10'),(55,47,1,'2006-04-19 00:54:55',NULL),(58,79,0,'2000-02-15 08:35:35','1985-04-10 22:19:58'),(59,8,-1,'1996-12-19 05:14:39','1990-07-04 22:26:13'),(59,30,1,'2010-04-23 23:41:52',NULL),(60,5,1,'1993-05-13 02:24:48',NULL),(60,6,-1,'2011-05-17 23:56:40',NULL),(60,35,-1,'2009-08-25 06:57:24','2003-04-17 20:10:41'),(62,17,1,'1983-06-10 01:32:14',NULL),(62,86,-1,'2007-07-15 15:38:54',NULL),(64,94,-1,'1991-07-30 19:30:42',NULL),(65,62,-1,'1995-04-05 00:43:30','2011-03-27 13:40:03'),(65,72,1,'2018-06-18 05:35:47',NULL),(66,1,0,'2000-03-27 02:27:42',NULL),(67,53,0,'1978-12-12 03:08:24','1994-04-07 02:22:30'),(67,55,0,'2012-06-21 10:50:37',NULL),(68,16,0,'1981-05-18 00:54:52',NULL),(71,45,1,'2009-06-19 11:39:30',NULL),(71,66,0,'1999-05-06 09:30:23',NULL),(71,95,1,'1998-09-23 11:27:29','1973-01-07 10:43:23'),(73,100,1,'2020-04-09 14:06:11',NULL),(78,2,0,'1978-08-27 12:46:39','2010-02-08 09:47:53'),(78,52,1,'1982-07-17 21:10:12',NULL),(79,60,1,'1986-11-14 11:10:08','1976-12-27 20:45:35'),(80,2,0,'1977-04-11 22:15:23',NULL),(80,11,-1,'1974-08-10 13:32:27',NULL),(80,18,-1,'2003-09-17 16:10:07',NULL),(80,77,-1,'1986-12-25 01:53:20','2007-07-20 02:35:52'),(82,24,0,'1974-12-16 06:51:53','1978-01-08 10:00:33'),(83,4,1,'1987-03-15 16:45:52',NULL),(83,35,1,'1984-11-25 06:12:07',NULL),(84,49,0,'1986-01-24 14:54:57','1972-12-21 23:42:19'),(84,65,-1,'1980-12-20 12:35:29',NULL),(87,49,-1,'2003-02-08 18:43:31','1992-07-30 00:03:19'),(88,2,-1,'1973-06-18 19:09:39',NULL),(88,17,-1,'1999-10-14 09:57:20',NULL),(88,36,0,'1976-04-09 20:15:38','1985-01-23 07:14:17'),(88,75,1,'1970-10-31 06:28:30','1991-10-06 14:42:26'),(90,72,1,'2000-05-04 01:21:05',NULL),(90,98,0,'1985-12-09 12:01:17','2003-11-25 16:36:58'),(92,12,1,'2011-11-17 02:42:37','1998-10-12 05:45:29'),(93,6,0,'2002-09-10 09:51:01',NULL),(94,91,0,'1997-01-07 17:01:14',NULL),(96,54,-1,'1982-09-04 00:41:13','1988-08-06 07:36:34'),(96,56,0,'2015-09-15 22:17:27','1993-11-22 06:32:09'),(97,3,1,'2005-09-13 13:36:31',NULL),(97,44,-1,'1978-10-01 10:31:45','2000-09-07 23:24:55'),(97,51,1,'1974-03-15 10:53:27','2019-10-11 04:55:31'),(100,87,-1,'2020-08-21 16:16:54',NULL),(100,99,0,'2020-01-15 14:50:31',NULL);
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `message_id` int unsigned DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_media_UNIQUE` (`user_id`,`media_id`),
  UNIQUE KEY `user_message_UNIQUE` (`user_id`,`message_id`),
  UNIQUE KEY `user_post_UNIQUE` (`user_id`,`post_id`),
  KEY `fk_like_profile1_idx` (`user_id`),
  KEY `fk_like_media1_idx` (`media_id`),
  KEY `fk_like_message1_idx` (`message_id`),
  KEY `fk_like_post1_idx` (`post_id`),
  CONSTRAINT `fk_like_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_like_message1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`),
  CONSTRAINT `fk_like_post1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_like_profile1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (1,78,31,NULL,NULL),(2,36,93,NULL,NULL),(3,95,88,NULL,NULL),(4,65,25,NULL,NULL),(5,29,91,NULL,NULL),(6,39,1,NULL,NULL),(7,69,33,NULL,NULL),(8,69,26,NULL,NULL),(9,57,92,NULL,NULL),(10,84,59,NULL,NULL),(11,47,38,NULL,NULL),(12,62,58,NULL,NULL),(13,49,56,NULL,NULL),(14,57,47,NULL,NULL),(15,79,35,NULL,NULL),(16,61,37,NULL,NULL),(17,28,47,NULL,NULL),(18,6,94,NULL,NULL),(19,32,26,NULL,NULL),(20,84,82,NULL,NULL),(21,37,39,NULL,NULL),(22,85,100,NULL,NULL),(23,35,49,NULL,NULL),(24,85,3,NULL,NULL),(25,49,20,NULL,NULL),(26,14,14,NULL,NULL),(27,40,69,NULL,NULL),(28,50,22,NULL,NULL),(29,61,75,NULL,NULL),(30,74,98,NULL,NULL),(31,47,17,NULL,NULL),(32,19,16,NULL,NULL),(33,36,68,NULL,NULL),(34,82,NULL,94,NULL),(35,95,NULL,45,NULL),(36,54,NULL,31,NULL),(37,75,NULL,59,NULL),(38,9,NULL,56,NULL),(39,83,NULL,86,NULL),(40,75,NULL,69,NULL),(41,98,NULL,58,NULL),(42,16,NULL,1,NULL),(43,84,NULL,54,NULL),(44,45,NULL,51,NULL),(45,96,NULL,67,NULL),(46,76,NULL,59,NULL),(47,82,NULL,60,NULL),(48,74,NULL,65,NULL),(49,19,NULL,51,NULL),(50,75,NULL,44,NULL),(51,96,NULL,95,NULL),(52,82,NULL,59,NULL),(53,55,NULL,81,NULL),(54,48,NULL,88,NULL),(56,77,NULL,28,NULL),(57,72,NULL,29,NULL),(58,29,NULL,3,NULL),(59,70,NULL,64,NULL),(60,42,NULL,28,NULL),(61,47,NULL,27,NULL),(62,48,NULL,23,NULL),(63,62,NULL,88,NULL),(64,56,NULL,33,NULL),(65,94,NULL,72,NULL),(66,33,NULL,46,NULL),(67,71,NULL,NULL,13),(68,32,NULL,NULL,78),(69,89,NULL,NULL,37),(70,50,NULL,NULL,11),(71,2,NULL,NULL,57),(72,70,NULL,NULL,63),(73,42,NULL,NULL,74),(74,30,NULL,NULL,1),(75,39,NULL,NULL,70),(76,8,NULL,NULL,97),(77,59,NULL,NULL,8),(78,15,NULL,NULL,17),(79,54,NULL,NULL,23),(80,49,NULL,NULL,90),(81,13,NULL,NULL,42),(82,99,NULL,NULL,38),(83,65,NULL,NULL,73),(84,79,NULL,NULL,37),(86,1,NULL,NULL,54),(87,30,NULL,NULL,78),(88,37,NULL,NULL,49),(89,29,NULL,NULL,27),(90,68,NULL,NULL,33),(91,89,NULL,NULL,67),(92,26,NULL,NULL,100),(93,75,NULL,NULL,75),(94,9,NULL,NULL,38),(95,75,NULL,NULL,11),(96,62,NULL,NULL,90),(97,12,NULL,NULL,80),(98,83,NULL,NULL,71),(99,51,NULL,NULL,76),(100,91,NULL,NULL,65);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `url` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blob` blob,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `media_type_idx` (`media_type_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `fk_media_media_type1` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`id`),
  CONSTRAINT `fk_media_profile1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `media_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,3,33,'43ba8a4f-c295-3bd5-9f46-991447020c6d',NULL,NULL,'1989-07-25 23:42:15',NULL),(2,3,38,'5f49f0e4-c357-3a63-a746-e9a140d00007',NULL,NULL,'2017-02-13 20:12:54',NULL),(3,1,67,'61c41bfa-4cad-3f15-9565-166a9ae04ccb',NULL,NULL,'2000-03-06 13:31:02',NULL),(4,3,56,'c4c5edcf-bc9a-3f7c-8bc8-12f371dc34c5',NULL,NULL,'2020-07-07 01:06:48',NULL),(5,1,8,'233c7a68-bbc0-38d8-80bd-870cbce01add',NULL,NULL,'2020-06-04 06:08:36',NULL),(6,3,66,'214fd624-c33d-3f3e-90a4-d19af6cfccb0',NULL,NULL,'1994-08-23 13:08:57',NULL),(7,2,72,'f8f595ea-aff0-33b6-9107-a5b8a22ebb52',NULL,NULL,'2003-04-23 21:47:30',NULL),(8,3,64,'fc4af160-9404-309c-9844-a63403226ce5',NULL,NULL,'2001-10-07 06:53:38',NULL),(9,3,34,'ce01147a-0322-381b-94d9-61c97c4e4bcf',NULL,NULL,'1980-06-29 21:35:28',NULL),(10,1,99,'de06abc6-cbda-3e5c-b0b6-f1c52c44fba0',NULL,NULL,'2012-06-14 01:12:16',NULL),(11,3,40,'e52e4d3a-17a0-3487-816e-73e79db8ed57',NULL,NULL,'1991-10-06 11:12:09',NULL),(12,3,41,'f624b968-ae81-3c8f-82ee-3e4ddae10d02',NULL,NULL,'2009-12-16 06:34:12',NULL),(13,3,35,'336fd602-a505-3aa2-b988-81136c5e2306',NULL,NULL,'1983-01-29 12:00:42',NULL),(14,3,22,'163e8bed-1f43-341a-8b44-6e698faa356f',NULL,NULL,'2019-11-19 22:51:24',NULL),(15,3,76,'b59d5dd7-ff82-30fb-89ae-54c1829c2068',NULL,NULL,'2001-05-25 16:39:48',NULL),(16,2,66,'9b1fddd1-64a0-3660-9216-6c3832654091',NULL,NULL,'1999-08-29 16:02:06',NULL),(17,1,24,'9789cf89-3483-3634-88bf-641c4e286700',NULL,NULL,'1998-04-04 19:09:33',NULL),(18,1,24,'e39b760d-9bc7-356e-a804-d14e470b61c2',NULL,NULL,'1972-08-07 03:08:15',NULL),(19,3,89,'e6bb7a2e-9bcb-31b9-aae9-afcfb1b649c1',NULL,NULL,'1974-01-19 08:52:03',NULL),(20,3,22,'10d7f954-197d-34c4-83b2-d363253a9b79',NULL,NULL,'1995-01-17 02:53:03',NULL),(21,3,62,'c7453cc6-acc6-3494-af95-a364e645cbcf',NULL,NULL,'1979-10-30 18:31:17',NULL),(22,3,44,'9a99062e-3623-30d3-a5e8-9af97c082d4d',NULL,NULL,'2001-05-12 22:37:41',NULL),(23,1,63,'552fdea5-ee37-374a-83a1-9f23c5759b0a',NULL,NULL,'2019-09-12 21:44:45',NULL),(24,1,18,'9a3fc68e-f526-3007-9a66-1ee79d53d909',NULL,NULL,'2004-08-16 02:35:02',NULL),(25,3,12,'87c36598-3458-31fc-8117-7f640ab22497',NULL,NULL,'2020-02-17 08:06:47',NULL),(26,1,72,'baccb63b-d3b8-35ee-ba4d-e7b384b0f219',NULL,NULL,'1995-05-15 21:32:49',NULL),(27,2,8,'c61ddaf4-64fb-3ced-ad85-418668e15f30',NULL,NULL,'1987-07-22 06:54:46',NULL),(28,1,24,'a566a4b2-8221-339d-a5f5-ec0769d42cce',NULL,NULL,'1991-05-21 23:41:33',NULL),(29,2,82,'a9028bda-8413-364e-8e66-19d2d8b7b32a',NULL,NULL,'1999-11-28 08:06:29',NULL),(30,2,15,'9174dfb0-5932-3e7f-8b86-33c70464c2f0',NULL,NULL,'2013-02-27 16:32:13',NULL),(31,2,93,'33a17e9e-6ab8-3e71-8aa8-3bb6160da7cb',NULL,NULL,'1988-08-24 22:20:01',NULL),(32,3,65,'fb174d23-efe3-303a-8699-88511f1d6aa2',NULL,NULL,'2020-07-20 22:47:06',NULL),(33,1,85,'8bfa7925-4e27-3d10-971f-a8947c56645c',NULL,NULL,'1987-04-05 11:12:53',NULL),(34,3,8,'34bf7370-339a-3005-ad28-d8a43f7cd4de',NULL,NULL,'1977-12-15 05:46:11',NULL),(35,3,68,'2549c227-d846-3905-bee0-823e5adbcaf4',NULL,NULL,'1984-05-14 13:39:05',NULL),(36,1,71,'aa5d7bc0-b261-32b9-9e00-e1c799b88124',NULL,NULL,'2001-12-31 22:37:38',NULL),(37,1,17,'1e4387c5-a4f0-329c-9463-8c53edb09e3f',NULL,NULL,'1993-12-06 22:48:54',NULL),(38,1,62,'2d8021fc-39b6-343a-94ac-7ec6ac088d91',NULL,NULL,'1994-12-19 18:08:26',NULL),(39,3,21,'e404be9d-37d6-350d-9987-83a6dcd7e4f3',NULL,NULL,'2001-04-30 01:38:54',NULL),(40,3,76,'530a0e1b-9e2a-3d5d-85eb-fcef0a84c510',NULL,NULL,'2000-12-29 23:42:07',NULL),(41,1,95,'e1c55d29-e1cf-3583-acef-56a84a0fbce8',NULL,NULL,'1988-09-19 11:39:09',NULL),(42,2,82,'5204ae62-ffd7-3e34-b50d-3196fc6d2636',NULL,NULL,'1977-08-12 11:07:45',NULL),(43,1,59,'a8f24342-036c-3e9f-a8d8-e65aeb95d306',NULL,NULL,'1995-11-19 03:35:39',NULL),(44,1,45,'826d782e-c46d-35af-b582-16f8b8e302db',NULL,NULL,'1990-06-16 18:43:13',NULL),(45,2,50,'8e537ef2-b910-345f-a953-6aeb604e02b0',NULL,NULL,'2002-09-17 08:49:00',NULL),(46,2,97,'b281816c-456b-3eb5-bf3c-1fe2075352a7',NULL,NULL,'2016-09-11 19:56:05',NULL),(47,2,40,'3a7bad08-6047-3581-9c37-5c5698662d4a',NULL,NULL,'2003-12-24 01:45:53',NULL),(48,2,60,'d400a89c-41f0-399c-a44b-f780f9184370',NULL,NULL,'1976-05-01 04:19:04',NULL),(49,1,50,'e2f4ced1-047a-395b-a333-1133bf6c0114',NULL,NULL,'2020-10-03 18:17:48',NULL),(50,3,97,'48b3ffb6-b300-3440-85ad-8d24db0f9287',NULL,NULL,'1995-08-08 02:20:07',NULL),(51,1,96,'8531160d-bf00-38a0-aaee-56ad3ac4350a',NULL,NULL,'1980-12-01 11:55:54',NULL),(52,2,45,'a482fef1-00d3-3f83-99fb-7310b0acb638',NULL,NULL,'1997-02-25 15:36:58',NULL),(53,1,81,'4dfb9162-526d-374f-8c76-905259be5e60',NULL,NULL,'2009-06-27 14:54:19',NULL),(54,1,92,'9b24a25c-b9d8-39d8-a8b0-5c8765d937fb',NULL,NULL,'2004-07-12 01:40:13',NULL),(55,1,85,'3154fd4b-f801-384b-9704-b3f5387f04e5',NULL,NULL,'2000-12-12 16:06:29',NULL),(56,3,32,'28218037-3a42-3da5-af35-1cfcfd172e32',NULL,NULL,'1996-11-23 16:16:05',NULL),(57,3,14,'52e324c9-aaf8-39b2-94be-4b3e14e9ccfd',NULL,NULL,'1982-06-08 21:32:33',NULL),(58,1,81,'27a5bded-6f51-36ad-8a85-99753d3da10d',NULL,NULL,'2019-06-03 12:29:33',NULL),(59,3,19,'7632a813-32a1-384b-831c-0f3d01a5b148',NULL,NULL,'1982-09-21 20:16:16',NULL),(60,1,11,'60824c5c-9701-3c30-9e83-ef6df100cf18',NULL,NULL,'2018-09-02 06:55:55',NULL),(61,3,84,'98f6a0a7-2f63-3478-b2f7-1c7689fd64a8',NULL,NULL,'1972-03-17 09:04:45',NULL),(62,1,11,'19457dc2-5186-3468-b2b8-18cbd14be0b6',NULL,NULL,'2019-08-30 06:22:17',NULL),(63,1,69,'1d508ecf-58f5-3a29-a9b4-5e1616f42d21',NULL,NULL,'2007-03-04 22:26:07',NULL),(64,3,47,'856d2327-ffe2-3640-844d-fe5236f6d0b9',NULL,NULL,'2021-01-16 05:40:56',NULL),(65,1,38,'b29ded50-44a1-3c6a-aeec-79066151376f',NULL,NULL,'1985-11-24 17:59:47',NULL),(66,2,35,'a7914377-55c3-3c5e-b68f-288700763fd8',NULL,NULL,'1983-01-09 12:40:45',NULL),(67,1,10,'d382908a-20b7-3a6d-b11a-6b41d4dd3e4b',NULL,NULL,'1977-11-23 16:38:51',NULL),(68,3,46,'9bf45135-5193-3678-81c6-e986a01ca429',NULL,NULL,'1980-11-19 23:35:45',NULL),(69,3,86,'6068ccdb-a064-3619-9fe9-1ae6a1bc6f15',NULL,NULL,'1974-09-12 21:12:59',NULL),(70,2,90,'2158782f-e650-399b-944a-4a40673c9c3a',NULL,NULL,'2006-09-15 00:59:44',NULL),(71,3,4,'7e63ad45-9f11-3cbd-a4d3-ecc723b27cba',NULL,NULL,'1973-05-30 09:24:32',NULL),(72,1,50,'8ba5e17b-6a20-379f-8a75-7ea8a63c0657',NULL,NULL,'2002-04-05 09:23:22',NULL),(73,1,36,'d2e6f9e2-85a3-37bf-85e6-fb18a00eeda5',NULL,NULL,'2011-10-19 00:08:10',NULL),(74,1,88,'25bfaa49-e7be-3c1b-91b3-2984d0e27456',NULL,NULL,'2017-04-17 19:51:16',NULL),(75,2,56,'acd05a3d-c47d-3d59-a2c5-e4338cb6d906',NULL,NULL,'2017-06-03 13:12:30',NULL),(76,3,22,'2983fdaa-3653-3586-a8e6-057acb1e9d48',NULL,NULL,'1983-02-24 13:56:41',NULL),(77,2,6,'65a2a7c3-fa82-35b0-92ba-c67451b18bbc',NULL,NULL,'1985-09-06 01:15:41',NULL),(78,1,63,'5bad0f1c-f779-347d-83d7-a19e64232353',NULL,NULL,'1997-09-18 05:54:19',NULL),(79,3,3,'2016be53-7f29-3dbc-943c-4da06d7b13f2',NULL,NULL,'1997-03-19 05:58:09',NULL),(80,1,93,'2b845c55-9edd-3326-88a1-0dcbb0dce1ed',NULL,NULL,'2010-10-17 01:05:54',NULL),(81,2,51,'73f824a8-b296-386b-b1a1-b9746f6643fe',NULL,NULL,'2002-04-30 02:47:15',NULL),(82,1,73,'5ca884fc-8b76-335b-9689-8b400bf9b84e',NULL,NULL,'1978-01-18 11:37:21',NULL),(83,2,7,'6c732587-775d-3a48-ae26-1223bbfd0634',NULL,NULL,'2016-01-25 22:18:37',NULL),(84,1,50,'b33dc0c7-151b-373c-8a0e-3612932b3d78',NULL,NULL,'1985-10-22 19:13:02',NULL),(85,3,55,'f7380203-9da0-3e8e-bca0-d79234b1951c',NULL,NULL,'2014-05-14 03:58:23',NULL),(86,2,62,'01badb85-3f6a-3ab6-ab20-eed703b1d61c',NULL,NULL,'2001-04-22 14:09:26',NULL),(87,2,61,'1f1e4716-429e-3237-825e-78b924ad768d',NULL,NULL,'1989-12-18 06:04:11',NULL),(88,1,75,'707db5b9-8c62-3dce-9515-4c35c632e5e7',NULL,NULL,'1972-04-29 17:19:06',NULL),(89,3,42,'33e95ed9-936a-315b-bc43-6cf75fce5040',NULL,NULL,'1977-02-27 15:48:31',NULL),(90,2,50,'88005c2c-e4fd-399f-a78b-a9776363980f',NULL,NULL,'2001-01-11 09:56:32',NULL),(91,3,62,'43fbfce1-9cb4-34af-911e-cd2df1e3edc5',NULL,NULL,'2014-06-15 20:41:00',NULL),(92,3,36,'9547ad55-6a51-36c2-b248-0e76864ebb3e',NULL,NULL,'1993-08-11 22:14:26',NULL),(93,3,3,'fbfa5371-07bb-3287-82b9-11aadf116175',NULL,NULL,'1976-07-22 21:25:28',NULL),(94,3,42,'e5d2da0a-e30b-37d4-92b9-55fcea652963',NULL,NULL,'1996-01-21 21:13:32',NULL),(95,1,6,'979fdd03-8962-3a79-a42f-7eed559bc3ba',NULL,NULL,'1977-02-21 19:06:48',NULL),(96,1,46,'e7663a57-aaf6-3fe8-bec3-47b7b895627c',NULL,NULL,'1972-03-03 05:09:43',NULL),(97,2,60,'29ab82bf-661c-3e62-9869-ddcf2e5f9277',NULL,NULL,'2019-08-17 03:33:08',NULL),(98,1,17,'de10d900-ee6a-31e2-9abf-67ce523667d0',NULL,NULL,'1995-06-10 05:24:25',NULL),(99,2,37,'dc1959c2-b306-3527-9cc8-22d6c80c87f8',NULL,NULL,'1974-09-14 19:04:30',NULL),(100,2,58,'4f78055a-55c0-31af-a266-1ab924f93b24',NULL,NULL,'1985-08-24 03:57:50',NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,'photo'),(2,'audio'),(3,'video');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_user_idx` (`from_user_id`),
  KEY `to_user_idx` (`to_user_id`),
  KEY `media_idx` (`media_id`),
  CONSTRAINT `fk_mesage_profile1` FOREIGN KEY (`from_user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_mesage_profile2` FOREIGN KEY (`to_user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_message_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,36,4,'Sequi labore et possimus ut reprehenderit sunt.',74,'1993-06-22 02:32:23',NULL,NULL),(2,18,25,'Laudantium quia earum omnis cumque distinctio voluptatem nobis maiores.',83,'1976-11-27 01:15:09','1993-01-23 12:15:52',NULL),(3,95,16,'Dolor porro est et alias labore omnis.',36,'2000-10-18 04:20:37','1973-04-07 16:15:24',NULL),(4,34,83,'Qui culpa et amet fugit ut recusandae.',11,'2000-12-28 19:20:34','2019-07-24 15:38:30',NULL),(5,28,35,'Voluptas quis velit qui voluptatem cumque nulla dolorem iure.',89,'2016-08-02 08:37:13',NULL,NULL),(6,37,73,'Rem consequatur modi qui deserunt ea molestiae corrupti.',46,'2011-03-17 08:32:27',NULL,NULL),(7,26,52,'Excepturi iusto et laudantium voluptates pariatur eveniet qui quis.',13,'1984-03-01 03:02:54','1982-08-10 17:36:27',NULL),(8,100,81,'Similique et provident numquam non quisquam quaerat.',98,'1996-06-30 17:02:37','1993-05-10 02:58:43',NULL),(9,8,8,'Dolores voluptas voluptatem quis.',31,'2006-01-04 00:44:26','1991-06-20 06:21:55',NULL),(10,67,14,'Eum molestias optio magnam accusamus.',56,'1984-07-03 17:27:00',NULL,NULL),(11,80,50,'Impedit at eligendi deleniti fugit earum fugiat.',59,'2020-11-09 03:02:12','2016-03-29 07:29:36',NULL),(12,54,67,'Voluptas illum consectetur qui magni rerum.',84,'2007-09-16 09:09:02',NULL,NULL),(13,37,61,'Inventore aut numquam ut et.',99,'1980-12-20 23:28:05',NULL,NULL),(14,72,95,'Harum qui sed ea quaerat officiis laboriosam.',81,'2016-11-21 12:32:43','1972-09-20 13:48:38',NULL),(15,83,22,'Distinctio facere quaerat nobis veniam et enim.',16,'2012-10-19 04:06:40',NULL,NULL),(16,71,58,'Animi soluta maiores qui vitae mollitia autem.',89,'2014-08-30 13:49:07',NULL,NULL),(17,16,84,'Qui numquam accusamus ea fuga corporis et eum.',40,'2014-04-19 22:41:40','1982-03-07 16:56:46',NULL),(18,29,84,'Excepturi accusamus distinctio veniam sint consequatur esse ut.',21,'1979-04-09 12:02:38','1982-07-04 03:12:12',NULL),(19,26,91,'Explicabo dolor qui dolores cupiditate cupiditate.',29,'2015-05-18 10:45:52',NULL,NULL),(20,57,58,'Illum illum aperiam in et ab laudantium.',42,'2005-10-01 23:05:35','1988-10-30 06:08:58',NULL),(21,12,37,'Optio aliquid in qui.',92,'1991-11-09 13:00:58',NULL,NULL),(22,71,91,'Doloremque explicabo laborum dolores qui illo velit.',58,'2003-05-27 01:23:34',NULL,NULL),(23,54,27,'Qui voluptatum aliquid dolorum tenetur ipsam qui.',19,'1977-01-04 19:36:26',NULL,NULL),(24,53,98,'Dicta ducimus neque non beatae.',13,'1975-08-21 12:32:44',NULL,NULL),(25,34,80,'Temporibus unde est dolor velit pariatur quod.',35,'2015-03-13 02:31:10',NULL,NULL),(26,49,50,'Rerum doloribus eum quos eaque magni.',93,'2009-06-19 15:22:37','2001-12-27 09:27:39',NULL),(27,37,66,'Sunt deleniti numquam cupiditate laudantium sint omnis assumenda maiores.',77,'1994-11-29 14:51:18','1989-06-22 22:03:54',NULL),(28,77,95,'Rerum voluptatibus rerum consequatur et alias.',60,'2012-09-07 12:07:45','1987-07-18 21:51:09',NULL),(29,97,21,'Tenetur qui reprehenderit beatae autem.',50,'1979-09-02 01:28:51',NULL,NULL),(30,26,77,'Odio qui velit non vel suscipit suscipit ratione.',7,'1978-12-26 03:34:27',NULL,NULL),(31,68,89,'Iure facilis natus delectus molestias ab earum fuga.',44,'2021-04-10 06:22:28','1980-09-06 02:22:08',NULL),(32,59,59,'Velit aut dolorem qui sit sed error ipsam.',34,'2005-03-24 19:05:28',NULL,NULL),(33,17,13,'Sequi exercitationem neque beatae exercitationem fuga.',60,'1997-02-06 04:03:42',NULL,NULL),(34,36,65,'Aut vero et nobis ut.',58,'2019-03-12 17:26:16','1993-10-06 00:39:35',NULL),(35,49,98,'Eveniet earum vero totam sed et minima non.',38,'2014-02-01 13:28:42',NULL,NULL),(36,84,47,'Quaerat atque quia in.',88,'1978-02-12 09:19:33','1991-02-19 01:16:04',NULL),(37,76,83,'Soluta doloremque dolor mollitia autem et beatae.',54,'2013-08-10 10:06:33',NULL,NULL),(38,53,60,'Et tempora in iusto quos et.',48,'1971-11-10 10:26:36',NULL,NULL),(39,12,57,'Quidem cumque laborum expedita ut odit ipsa.',68,'2001-02-15 21:47:50',NULL,NULL),(40,61,82,'Molestias sunt dolorem sint quo perferendis.',44,'2018-04-06 11:46:51','2001-05-16 13:09:01',NULL),(41,68,49,'Reiciendis aperiam enim voluptas sed possimus esse.',32,'2003-06-02 17:42:52',NULL,NULL),(42,12,7,'Sunt qui et autem velit.',91,'1977-09-05 17:09:44','1970-01-25 06:06:24',NULL),(43,45,23,'Maiores illum nam at mollitia maxime.',3,'1981-03-04 03:24:57',NULL,NULL),(44,5,59,'Voluptas nesciunt rem rem dolore sed velit enim.',68,'1992-04-07 15:55:33','1988-07-11 02:47:59',NULL),(45,63,7,'Et facilis nemo placeat libero eos velit.',65,'1986-09-21 15:22:46','1981-05-07 14:09:54',NULL),(46,100,90,'Nulla eum nesciunt delectus enim praesentium animi.',12,'2009-08-06 17:11:09','1991-11-03 11:28:38',NULL),(47,88,66,'Rerum dolore laborum vero.',95,'1999-01-18 14:04:54',NULL,NULL),(48,41,18,'Sapiente dolores nihil quidem ducimus alias laborum quia fuga.',54,'2020-06-09 00:25:26','1975-10-09 03:49:55',NULL),(49,88,29,'Voluptates dolor vitae voluptas tempora rerum minima ab.',10,'2010-06-26 20:15:54','1998-11-28 22:55:30',NULL),(50,55,90,'Blanditiis voluptatibus voluptatibus maiores architecto mollitia et qui.',91,'2010-12-15 15:42:09','1973-02-22 22:28:31',NULL),(51,99,58,'Non doloremque nesciunt qui voluptatem aut.',39,'1977-05-06 23:59:53','2005-09-19 18:42:10',NULL),(52,31,69,'Dolore eos est qui sunt.',46,'2011-07-23 06:01:56',NULL,NULL),(53,21,13,'Et facere et exercitationem omnis velit.',68,'1987-12-14 20:02:16','1988-12-03 11:44:25',NULL),(54,23,18,'Iure enim vero placeat occaecati magnam corrupti nihil.',27,'1978-08-13 12:13:19','2008-12-02 22:37:50',NULL),(55,90,81,'Autem perferendis dolor ut voluptatem saepe alias eum.',33,'2009-03-28 01:40:15','1981-03-25 01:41:07',NULL),(56,55,80,'Qui voluptatibus quas cupiditate nemo mollitia dolor.',22,'1972-01-24 16:50:19',NULL,NULL),(57,67,67,'Reiciendis excepturi odit asperiores aliquid rerum inventore ut.',87,'1978-01-26 22:45:11',NULL,NULL),(58,61,7,'Aperiam qui dolores suscipit asperiores corrupti sunt.',4,'1984-10-18 13:08:33','1980-02-18 21:35:33',NULL),(59,14,95,'Labore dolorum quis a.',33,'2001-07-10 11:11:37',NULL,NULL),(60,24,50,'Accusamus rerum inventore eos perspiciatis voluptates odit.',22,'1984-10-22 14:10:44',NULL,NULL),(61,14,48,'Similique ipsam unde totam repudiandae perferendis.',79,'2001-04-03 19:05:42','1991-05-15 11:52:52',NULL),(62,53,78,'Autem debitis quis est alias itaque.',48,'2010-02-10 07:54:40',NULL,NULL),(63,98,98,'Voluptate et error ipsum consequuntur reiciendis.',61,'2001-04-01 02:00:53','2011-08-25 04:47:18',NULL),(64,66,21,'Autem et sequi doloribus necessitatibus quaerat commodi repellendus.',78,'1979-07-02 17:52:05',NULL,NULL),(65,92,11,'Molestiae vero sed veniam qui accusamus est ipsa.',58,'1980-11-28 21:10:16','2015-12-03 19:28:16',NULL),(66,25,66,'Doloribus aut modi suscipit eaque aliquid impedit.',38,'2001-12-30 05:01:17','1980-09-07 07:51:22',NULL),(67,46,32,'Reprehenderit minima tempore ratione similique dolore.',5,'2002-05-15 13:27:45',NULL,NULL),(68,33,92,'Repudiandae dolorem saepe exercitationem dolorem alias qui.',12,'1990-10-04 13:45:11',NULL,NULL),(69,37,6,'Ex molestiae quis enim et minima dolores.',6,'2007-12-10 22:04:22',NULL,NULL),(70,69,29,'Quidem rerum enim assumenda quia.',56,'1989-03-17 13:38:21',NULL,NULL),(71,91,43,'Quo ut magnam delectus itaque.',3,'1991-01-01 18:03:03',NULL,NULL),(72,70,96,'Dolore aut iusto temporibus sit ut est vitae aut.',81,'1974-06-30 03:58:13','2017-08-16 10:37:27',NULL),(73,17,94,'Repellendus modi dolores in itaque et.',79,'1994-08-22 20:13:25','1983-09-25 13:01:03',NULL),(74,77,60,'Cum est debitis delectus delectus.',99,'2012-07-27 04:36:43',NULL,NULL),(75,55,51,'Non fuga quae praesentium.',10,'1970-08-14 01:35:25',NULL,NULL),(76,13,76,'Consequuntur dolore dolor molestiae quas est qui autem.',75,'1975-07-19 12:49:40',NULL,NULL),(77,51,21,'Natus quisquam delectus nam dolorum praesentium nemo.',7,'2017-09-24 06:54:45',NULL,NULL),(78,55,54,'Porro vitae ipsum et quisquam similique vel.',99,'2001-10-28 02:39:47','2010-01-01 11:13:54',NULL),(79,67,90,'Ad iure qui eaque expedita veritatis repellendus mollitia.',4,'1996-02-27 12:16:19',NULL,NULL),(80,73,59,'Hic velit debitis fuga recusandae.',33,'2012-04-06 12:46:36',NULL,NULL),(81,28,50,'Culpa et cum eius dolores necessitatibus numquam.',76,'1983-08-14 22:34:56',NULL,NULL),(82,31,19,'Dolorem commodi ipsa qui aperiam et et.',72,'1999-11-04 20:58:39',NULL,NULL),(83,11,36,'Et ea quo qui quod quo rerum animi.',65,'1996-08-06 17:27:55','1984-12-10 19:53:20',NULL),(84,89,13,'Vel amet quia labore occaecati.',24,'1982-04-06 12:27:39',NULL,NULL),(85,88,67,'Aut repellendus corporis consequatur exercitationem et.',75,'2004-03-25 08:23:12',NULL,NULL),(86,97,80,'Cumque illo suscipit aliquid sunt.',50,'1972-02-25 19:31:43',NULL,NULL),(87,72,30,'Debitis consectetur rerum voluptatem quos ut.',71,'1978-07-20 08:17:35',NULL,NULL),(88,78,85,'Velit et esse corporis laudantium quo vitae.',24,'2007-06-27 07:01:02',NULL,NULL),(89,77,52,'Aperiam quo possimus voluptas maiores aut vero et asperiores.',14,'1978-04-28 21:32:27',NULL,NULL),(90,81,24,'Sed velit officia laborum quia repellendus autem.',72,'1974-07-23 15:52:06',NULL,NULL),(91,13,52,'Delectus et provident dolores adipisci.',21,'1990-05-06 22:22:48','1999-06-03 09:56:28',NULL),(92,89,82,'Consectetur amet eum asperiores placeat dolorem aspernatur voluptatem et.',40,'2020-09-13 06:07:55','2020-12-18 04:46:33',NULL),(93,61,93,'Ipsum veniam asperiores totam nihil mollitia dolor.',76,'1976-01-22 01:03:27',NULL,NULL),(94,25,81,'Excepturi blanditiis ad mollitia iusto quis qui.',88,'1984-03-03 12:43:39','1971-05-21 08:58:10',NULL),(95,49,69,'Deserunt iusto molestias vel et rem fuga aut.',55,'2013-01-24 16:59:35','2010-03-07 02:38:54',NULL),(96,24,65,'Aut dolor quam ducimus velit eos.',34,'2018-10-06 05:30:12','1978-03-25 04:58:28',NULL),(97,74,37,'Molestiae id magni sequi commodi dolore magnam rem.',64,'1972-09-23 22:59:24','2007-05-07 16:32:52',NULL),(98,44,15,'Similique eos velit voluptas at.',48,'2007-09-13 22:09:37',NULL,NULL),(99,68,91,'Voluptatum omnis quas molestias recusandae.',99,'1980-12-07 23:51:01','1971-01-29 02:24:00',NULL),(100,81,71,'Quos ut amet laborum et accusantium incidunt officiis cumque.',23,'1983-11-04 19:30:35',NULL,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `goods_quantity` int unsigned NOT NULL,
  `cost` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,44,'2013-03-15 21:06:03',5,4551.11),(2,4,'2012-06-24 05:16:46',3,959.44),(3,4,'2013-03-15 21:06:03',2,4128.50),(4,1,'2011-08-03 04:16:08',3,7012.02),(5,12,'2011-08-03 04:16:08',4,1278.50),(6,33,'2013-04-19 21:46:03',6,10046.78);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `community_id` int unsigned DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`),
  KEY `community_idx` (`community_id`),
  KEY `post_idx` (`post_id`),
  KEY `media_idx` (`media_id`),
  CONSTRAINT `fk_post_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_post_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_post_post1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_post_profile1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,60,NULL,NULL,'Eligendi laborum corrupti ea ea amet inventore.',13,'2011-08-03 04:16:08'),(2,77,NULL,NULL,'Architecto doloremque ea facere a et.',56,'1986-07-31 14:34:17'),(3,78,NULL,NULL,'Nesciunt itaque sequi voluptas et.',88,'1987-09-30 20:43:12'),(4,44,NULL,NULL,'In omnis ipsum sit odio animi perspiciatis.',66,'2013-03-15 21:06:03'),(5,59,NULL,NULL,'Voluptatem quia commodi ad ut quia.',14,'2020-02-12 08:20:58'),(6,79,NULL,NULL,'Omnis eos deserunt tempore ea.',73,'1996-06-19 17:52:12'),(7,26,NULL,NULL,'Error perferendis qui mollitia eius aut magni iste.',58,'2010-03-02 17:45:12'),(8,46,NULL,NULL,'Necessitatibus consequatur voluptatem eos.',29,'2004-08-29 15:53:48'),(9,72,NULL,NULL,'Eveniet voluptatem molestiae aut totam aut non minima aut.',20,'1981-03-17 07:53:26'),(10,16,NULL,NULL,'Est nisi quis quo dicta.',85,'1989-05-08 18:48:16'),(11,91,NULL,NULL,'Eveniet quos sint nulla necessitatibus repudiandae sunt excepturi.',52,'2013-04-19 21:46:03'),(12,49,NULL,NULL,'Exercitationem in hic consequatur ex voluptas libero.',69,'1987-11-25 19:50:50'),(13,29,NULL,NULL,'Nulla debitis est qui quo nostrum.',52,'1981-07-15 11:55:40'),(14,32,NULL,NULL,'Consectetur consectetur modi maiores soluta.',85,'2014-07-12 18:43:13'),(15,46,NULL,NULL,'Praesentium animi omnis ut harum.',72,'1974-08-09 03:17:16'),(16,57,NULL,NULL,'Dolores explicabo reprehenderit nam ullam quaerat dignissimos.',5,'2003-10-31 09:51:22'),(17,85,NULL,NULL,'Qui laudantium alias et tempora.',33,'1981-01-17 17:08:07'),(18,60,NULL,NULL,'Aspernatur ut nihil ipsa quia voluptas in.',62,'1998-03-19 00:03:08'),(19,21,NULL,NULL,'Omnis ipsum repellat iste est.',4,'2016-06-13 01:52:57'),(20,28,NULL,NULL,'Numquam consequatur incidunt voluptatibus vitae.',80,'2012-06-24 05:16:46'),(21,17,NULL,NULL,'Praesentium occaecati et recusandae maxime suscipit in et.',6,'2014-04-30 20:33:13'),(22,52,NULL,NULL,'Nam deserunt deserunt sunt dolor qui.',42,'2021-05-18 21:36:56'),(23,64,NULL,NULL,'Eveniet aut et dolore vitae iusto.',98,'2014-05-16 14:42:31'),(24,71,NULL,NULL,'Corrupti saepe dignissimos est.',36,'2007-10-03 13:05:50'),(25,18,NULL,NULL,'Dignissimos praesentium ea deserunt similique est voluptas.',87,'1980-05-01 23:56:09'),(26,20,NULL,NULL,'Vero similique eos blanditiis quia optio facere nemo.',8,'2014-12-12 20:14:35'),(27,39,NULL,NULL,'In iste dolores quae qui aut.',69,'2020-11-14 08:44:56'),(28,76,NULL,NULL,'Voluptas recusandae fuga iusto quasi.',67,'1970-05-22 09:13:58'),(29,21,NULL,NULL,'Officia quasi beatae quisquam quaerat aut veniam aliquid.',8,'2001-03-14 13:01:01'),(30,52,NULL,NULL,'Accusamus sequi aut quos facilis et.',66,'1992-10-22 06:29:36'),(31,80,NULL,NULL,'Tenetur inventore natus eos nobis rerum.',8,'1991-05-28 02:36:43'),(32,70,NULL,NULL,'Aliquid deleniti molestias nisi aspernatur et qui recusandae.',64,'2015-10-23 19:16:17'),(33,41,NULL,NULL,'Repudiandae fuga fugit voluptatem distinctio quia dolorem aliquam.',30,'1994-05-24 15:00:41'),(34,26,NULL,NULL,'Illo molestiae recusandae quia est vel sed ratione.',62,'1997-04-06 10:09:58'),(35,33,NULL,NULL,'Voluptatum consequuntur nostrum vel fugiat autem.',54,'1998-08-04 05:28:25'),(36,42,NULL,NULL,'Sit sunt pariatur qui recusandae.',49,'2010-03-21 20:09:31'),(37,60,NULL,NULL,'Quia autem quibusdam repudiandae illum.',93,'2003-01-31 22:11:22'),(38,91,NULL,NULL,'Itaque rem hic voluptate nisi.',23,'2003-10-30 15:45:41'),(39,91,NULL,NULL,'Odit cupiditate dolor qui exercitationem.',62,'2010-09-09 22:48:30'),(40,59,NULL,NULL,'Eligendi et exercitationem accusamus rerum quis enim praesentium.',8,'2003-05-01 13:57:40'),(41,48,NULL,NULL,'Inventore ut sed dignissimos et pariatur similique voluptatum velit.',78,'2012-08-15 09:48:29'),(42,15,NULL,NULL,'Sint ipsa in eum et.',86,'2014-05-02 23:43:05'),(43,47,NULL,NULL,'Reprehenderit dolor ipsum voluptatem quidem possimus dignissimos esse harum.',91,'1999-10-10 05:14:19'),(44,53,NULL,NULL,'Officiis blanditiis voluptatem ex quia minus.',67,'1986-08-25 04:39:45'),(45,99,NULL,NULL,'Itaque distinctio nihil nisi odit.',5,'2015-08-20 09:32:33'),(46,32,NULL,NULL,'Eveniet fugiat dolorem quia officia officia voluptatibus aut accusantium.',79,'1999-05-10 21:33:37'),(47,13,NULL,NULL,'Harum voluptatem vel et et.',2,'2010-11-08 12:43:45'),(48,42,NULL,NULL,'Culpa aspernatur error rerum.',53,'2005-06-06 20:35:34'),(49,32,NULL,NULL,'Expedita quis sint magni.',68,'2017-05-13 03:55:47'),(50,15,NULL,NULL,'Odio sit ea quia maxime ab aut voluptatibus.',64,'2009-08-23 14:21:50'),(51,22,NULL,NULL,'Quasi dolor qui et sed molestiae dolorem.',56,'2010-02-19 15:20:57'),(52,13,NULL,NULL,'Placeat quasi non enim distinctio dolores.',81,'1988-02-12 20:02:57'),(53,49,NULL,NULL,'Voluptatem aut ut aut et dignissimos.',4,'2010-08-19 04:10:24'),(54,3,NULL,NULL,'Velit est et qui qui aut a.',39,'2012-02-20 03:50:27'),(55,65,NULL,NULL,'Dolorum et quam sit et a dolorum.',62,'2000-09-02 16:59:39'),(56,47,NULL,NULL,'Culpa qui quia iusto ut voluptate est.',13,'2000-01-21 16:33:34'),(57,40,NULL,NULL,'Est aliquid excepturi quisquam delectus architecto soluta.',61,'2010-04-11 05:32:23'),(58,99,NULL,NULL,'Voluptate architecto ducimus sed est non impedit vel.',86,'2004-08-23 09:53:16'),(59,52,NULL,NULL,'Fugit adipisci voluptas laboriosam tempora facere vitae.',52,'1996-01-03 14:52:49'),(60,52,NULL,NULL,'Magni dolore possimus omnis non et debitis.',51,'1987-06-04 23:59:28'),(61,56,NULL,NULL,'Eos commodi sunt neque cumque repudiandae commodi.',84,'2002-05-14 00:37:48'),(62,29,NULL,NULL,'Cumque et vel iure magni mollitia sed debitis.',68,'2021-05-29 00:04:43'),(63,86,NULL,NULL,'Aliquam ut ut laborum qui.',71,'1985-05-26 09:04:51'),(64,21,NULL,NULL,'Facilis beatae et amet animi accusantium ut debitis.',17,'2008-08-12 11:15:42'),(65,38,NULL,NULL,'Voluptatem ut et in voluptas.',36,'1996-01-16 20:17:14'),(66,81,NULL,NULL,'Velit recusandae voluptates ut ut sed.',59,'2019-04-24 14:21:32'),(67,91,NULL,NULL,'Et sunt ea quo.',94,'1971-03-27 17:49:02'),(68,39,NULL,NULL,'Reprehenderit consequatur vel blanditiis laborum similique reprehenderit perspiciatis.',40,'2015-07-02 07:00:05'),(69,97,NULL,NULL,'Recusandae alias consequatur ea aliquid.',42,'2002-07-27 03:29:11'),(70,78,NULL,NULL,'Accusantium fuga et itaque est corrupti iusto.',62,'2005-02-05 01:55:27'),(71,4,NULL,NULL,'Esse totam et eligendi voluptas dolor facilis suscipit.',24,'1998-08-23 23:07:40'),(72,75,NULL,NULL,'Et nemo vitae veniam et assumenda fugit.',43,'1996-05-24 10:41:18'),(73,85,NULL,NULL,'Quaerat aspernatur perspiciatis quam fugiat quos.',74,'1971-10-23 13:06:56'),(74,28,NULL,NULL,'Qui in numquam repellendus enim et.',37,'1975-05-06 03:33:28'),(75,25,NULL,NULL,'Et sit non ad culpa natus molestiae.',80,'2018-03-30 23:17:43'),(76,87,NULL,NULL,'Suscipit delectus vitae nobis tempore.',81,'1975-08-06 20:36:46'),(77,64,NULL,NULL,'Autem laboriosam autem ab qui.',15,'2004-02-25 05:53:14'),(78,49,NULL,NULL,'Ipsam quos laboriosam fuga voluptas.',50,'1997-03-17 19:55:48'),(79,85,NULL,NULL,'Magnam explicabo ducimus sequi rerum.',69,'1994-01-26 00:59:31'),(80,67,NULL,NULL,'Dolores atque sit enim quas labore vero voluptate.',23,'1974-03-09 19:04:30'),(81,4,NULL,NULL,'Dolores natus ut accusamus quasi.',47,'1990-10-01 15:59:08'),(82,82,NULL,NULL,'Harum officiis consequatur blanditiis consequatur.',95,'1990-03-13 05:20:13'),(83,41,NULL,NULL,'Error autem dignissimos iste.',21,'1993-06-30 12:51:10'),(84,34,NULL,NULL,'Voluptas quam maiores nihil.',38,'2017-04-20 19:17:40'),(85,63,NULL,NULL,'Velit esse a aut perferendis consectetur.',12,'2020-11-14 03:08:11'),(86,99,NULL,NULL,'Incidunt atque et blanditiis vitae et hic.',66,'1973-05-12 18:14:22'),(87,36,NULL,NULL,'Nulla et officia aut qui sint provident illo sapiente.',74,'1983-09-17 02:06:36'),(88,8,NULL,NULL,'Sed voluptas sit et et est voluptate.',20,'1993-09-16 09:59:33'),(89,47,NULL,NULL,'Natus rerum et dolores quia.',35,'1982-05-04 16:12:52'),(90,56,NULL,NULL,'Minus quia eos non molestias.',71,'1992-10-12 08:23:58'),(91,15,NULL,NULL,'Officia harum perferendis quod voluptas minus neque.',43,'2019-05-24 04:27:26'),(92,52,NULL,NULL,'Et ducimus voluptas autem corrupti sint sint aut.',79,'2004-10-25 19:57:30'),(93,57,NULL,NULL,'Earum et reiciendis eos ab.',100,'1987-05-22 12:00:01'),(94,28,NULL,NULL,'Autem pariatur similique cumque ut.',42,'2015-08-15 23:58:54'),(95,68,NULL,NULL,'Vitae aut consequatur veniam sit delectus occaecati consectetur iure.',94,'1982-02-02 19:27:37'),(96,64,NULL,NULL,'Omnis quis et voluptate ut possimus et.',72,'2003-04-24 12:54:30'),(97,41,NULL,NULL,'Atque nemo minus ab omnis debitis quas cumque veritatis.',45,'1990-07-25 18:32:22'),(98,67,NULL,NULL,'Exercitationem facilis a molestiae assumenda dolor culpa.',81,'1985-05-15 10:20:24'),(99,65,NULL,NULL,'Facilis quia eum itaque id vero.',100,'2020-01-07 05:34:44'),(100,18,NULL,NULL,'Rerum est ut ut.',27,'2010-09-25 10:47:26');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `description` text COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2021-07-18 16:03:48','2021-07-18 16:03:48'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2021-07-18 16:03:48','2021-07-18 16:03:48'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2021-07-18 16:03:48','2021-07-18 16:03:48'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2021-07-18 16:03:48','2021-07-18 16:03:48'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2021-07-18 16:03:48','2021-07-18 16:03:48'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2021-07-18 16:03:48','2021-07-18 16:03:48'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2021-07-18 16:03:48','2021-07-18 16:03:48');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int unsigned NOT NULL,
  `firstname` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('m','f','x') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birhday` date NOT NULL,
  `address` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `photo_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `firstname_lastname_idx` (`lastname`,`firstname`),
  KEY `media_idx` (`photo_id`),
  CONSTRAINT `fk_profile_media1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Shannon','Sauer','m','2007-04-26','1558 Johns Ports Suite 301\nChamplintown, NV 46089-7923','2005-06-10 07:38:12',NULL),(2,'Savanah','Kohler','f','1996-06-10','82252 Schaefer Square\nSierrachester, VA 67129-5153',NULL,NULL),(3,'Juvenal','McGlynn','m','1984-11-16','24198 Grady Dam\nPredovicmouth, NJ 00533',NULL,NULL),(4,'Maud','Rutherford','m','2018-01-19','2170 Edgar Lakes\nMayertburgh, MI 67842-4881','2000-05-09 05:57:16',NULL),(5,'Donavon','Goyette','f','1984-01-13','09049 Elisabeth Mission Suite 397\nNew Treyview, MO 36349-2466','1976-08-27 03:23:11',NULL),(6,'Tabitha','Nikolaus','m','2019-09-30','9832 Pouros Grove\nZboncakhaven, MD 07600','1978-06-04 12:54:31',NULL),(7,'Raphaelle','Huel','m','2008-07-27','9158 Wiegand Shoals Apt. 342\nAndystad, GA 38183-1717','2004-01-10 09:31:08',NULL),(8,'Deon','Kling','m','2002-11-30','531 Fabiola Meadow\nLake Rosannaburgh, AL 00114-2616',NULL,NULL),(9,'Elaina','Dietrich','f','1988-02-20','210 Dylan Manors\nWest Bobby, MA 44310-2905',NULL,NULL),(10,'Hilton','Cormier','m','1977-05-09','6018 Wilson Rapid Suite 276\nCarmenport, NY 61332','1995-03-02 22:45:52',NULL),(11,'Gonzalo','Altenwerth','f','1982-11-26','008 Sanford Plaza Suite 024\nBeattymouth, LA 63373-6049',NULL,NULL),(12,'Trace','Bruen','f','2018-12-03','502 Tessie Stream\nPort Clemmie, NV 52972-6868',NULL,NULL),(13,'Rebeca','Mann','f','1998-01-11','21454 Lexie Center\nNew Jarretton, AK 73050',NULL,NULL),(14,'Bernadette','Armstrong','m','1981-02-28','34128 Gaylord Ranch\nOvaberg, DE 16966',NULL,NULL),(15,'Eleanore','Stiedemann','f','2010-11-28','388 Malinda Drive\nNorth Elijahview, AL 80421',NULL,NULL),(16,'Curt','Nader','f','1999-04-07','54508 Wolff Creek\nPort Osbaldo, WA 84278-9022','2014-08-27 07:37:53',NULL),(17,'Elvie','Homenick','f','1978-01-07','2996 Adams Courts Suite 176\nBridieside, PA 85316','2002-01-24 23:06:41',NULL),(18,'Norma','McLaughlin','m','2003-06-05','3050 Pouros Fields\nNorth Mireillehaven, SD 31118-4099',NULL,NULL),(19,'Ashley','Heidenreich','f','1971-08-05','11518 Wunsch Meadow Apt. 370\nConradmouth, ID 35916-4991',NULL,NULL),(20,'Devan','Zieme','f','2002-01-29','53666 Hilll Brooks Apt. 938\nWest Hollyburgh, GA 39017-8785',NULL,NULL),(21,'Antone','Kshlerin','f','1981-06-02','796 Gladys Mall\nVonRuedenbury, CA 19863-0600','2008-08-09 10:17:01',NULL),(22,'Jeromy','Murphy','m','2000-04-18','407 Erdman Centers\nIsraelshire, AL 16193-2741','1994-10-14 11:02:21',NULL),(23,'Christop','Treutel','f','2008-12-09','156 Percival Falls Suite 549\nHerzogport, FL 61872','2003-03-30 16:39:33',NULL),(24,'Name','Reichel','m','1988-08-05','3825 Marina Radial Apt. 835\nSouth Rowanshire, IA 17966','2010-04-26 04:35:13',NULL),(25,'Giovanni','Lynch','f','1999-06-29','4947 Maye Forest\nPort Margot, ME 19508-6591','1974-04-14 17:15:41',NULL),(26,'Mafalda','Green','m','1976-06-13','03730 Neha Light Apt. 438\nSouth Daron, AK 94177-9038',NULL,NULL),(27,'Carole','Wilkinson','m','1986-08-04','16357 Grayson Loaf\nNorth Bo, UT 55291-5798',NULL,NULL),(28,'Alena','Schulist','f','1983-07-18','5884 Hilll Drive Suite 821\nGreenholtville, LA 41194-9860',NULL,NULL),(29,'Berry','Feeney','m','1993-12-25','2110 Corkery Place Apt. 945\nNelsonfort, ND 90394',NULL,NULL),(30,'Ubaldo','Friesen','m','1981-06-16','304 Altenwerth Plaza\nValentinstad, MD 01389',NULL,NULL),(31,'Alicia','Watsica','m','2015-12-08','391 Quigley River\nWest Carley, MA 94639-8140',NULL,NULL),(32,'Napoleon','Stracke','m','1982-10-20','119 Adolphus Drives\nParkerborough, UT 72078','2009-05-28 07:55:25',NULL),(33,'Damian','Hauck','m','1987-07-14','0256 Domingo Burg Suite 540\nTevinborough, AZ 39615','1980-05-09 08:18:20',NULL),(34,'Domingo','Berge','m','1988-11-21','70631 Rowland Estates\nSouth Kenborough, GA 46439',NULL,NULL),(35,'Stacy','Macejkovic','m','2001-09-14','449 Hillard Gardens\nWest Shany, MD 96726-8972',NULL,NULL),(36,'Yadira','Green','f','1987-01-27','7754 Glover Drive\nNew Westley, WA 93092-1629',NULL,NULL),(37,'Guillermo','Kohler','m','2009-06-17','907 Waters Pine\nNorth Curtisport, TX 21756',NULL,NULL),(38,'Edgardo','Kuvalis','m','2001-07-10','96319 Hailie Motorway Suite 946\nSouth Jeffreyton, NY 68040','1977-12-04 12:52:55',NULL),(39,'Willow','Blick','m','2018-05-05','41271 Connelly Ports\nSouth Lionelton, ND 37326','1989-11-13 22:15:11',NULL),(40,'Keeley','Gerlach','m','1995-06-08','82010 Magnolia Dam Suite 365\nEldridgefort, ME 66745',NULL,NULL),(41,'Delia','Beer','f','1977-02-05','75912 Olson Glens\nLake Candidaberg, VA 86659-6443',NULL,NULL),(42,'Noemi','Farrell','f','1992-06-26','201 Kuvalis Passage Apt. 770\nZettaport, WV 79675-4405',NULL,NULL),(43,'Miracle','Weimann','m','1970-09-07','93818 Ilene Pike\nMorissettehaven, NE 66147-3572','2002-11-01 20:29:15',NULL),(44,'Mia','Miller','f','1989-02-20','7063 Elenor Park\nJacobsontown, PA 62635','2014-09-09 02:26:20',NULL),(45,'Davonte','Beer','f','1979-02-25','29427 Elmore Crescent Apt. 955\nRuntefurt, ND 42203-8005','1986-07-06 19:01:10',NULL),(46,'Josephine','Brakus','f','2003-12-18','949 Sammy Viaduct Apt. 994\nNew Cristobal, IL 06964','1979-03-09 06:11:06',NULL),(47,'Nicholaus','Donnelly','f','1983-12-08','84988 Feeney Springs\nPort Santinaberg, IA 37780','2001-12-20 18:12:20',NULL),(48,'Jaydon','Oberbrunner','f','1983-12-27','632 Rowe Corner\nPort Ezequiel, GA 28800',NULL,NULL),(49,'Alexandre','Hessel','m','2011-08-30','3396 Bednar Isle\nEast Robynland, PA 49193','2010-11-10 01:45:26',NULL),(50,'Nikko','Bayer','f','2001-08-15','3484 Beier Meadow\nKeelyville, SC 99659-2046',NULL,NULL),(51,'Kiera','Funk','m','1973-11-07','47289 Jacobs Summit Suite 968\nBradhaven, LA 16472-1536','2000-06-15 22:12:56',NULL),(52,'Nannie','Walker','f','1976-11-30','48133 Konopelski Lock Suite 318\nPort Carolyne, SD 73957-3733','2005-08-06 13:39:28',NULL),(53,'Alize','Franecki','f','2002-09-16','7450 Dean Fall Apt. 207\nThomasfurt, NY 03467-1220',NULL,NULL),(54,'Maximo','Lakin','f','1993-02-24','906 Meaghan Village Suite 475\nNorth Marcia, IN 97160','1987-10-12 12:16:38',NULL),(55,'Estelle','Block','f','1992-08-17','263 Drake Drive Suite 667\nBerryborough, OH 66192-9904','1996-12-07 16:35:08',NULL),(56,'Eleonore','Donnelly','f','1981-05-12','056 Isabella Passage Apt. 709\nNew Misaelmouth, MI 89426','1973-05-20 11:25:49',NULL),(57,'Danyka','Beahan','f','2008-09-04','769 Pfeffer Hills Suite 315\nHammesside, IL 04388',NULL,NULL),(58,'Rebeka','Smith','m','1970-02-21','71237 Corkery Pine Apt. 985\nLake Gene, MO 52532-5458','2016-05-23 10:33:31',NULL),(59,'Kellie','Eichmann','f','2012-04-23','581 Felipa Lodge\nLegrostown, MI 00251',NULL,NULL),(60,'Vladimir','Huels','f','1981-02-14','29109 Mertz Crossing\nPort Wendell, MT 81336-9445','1989-01-15 09:32:53',NULL),(61,'Jordon','Rogahn','f','1972-05-04','95931 Collier Orchard\nDeannaview, DC 59291',NULL,NULL),(62,'Carolyn','Dibbert','f','2012-11-25','5484 Heathcote View Apt. 037\nSouth Frieda, MA 21297-5611','2006-09-04 04:07:51',NULL),(63,'Katheryn','Klein','m','2017-12-10','17087 Dooley Harbor\nEast Gwenchester, CT 36499',NULL,NULL),(64,'Agustina','West','f','2007-12-16','2777 Mertz Loop\nHowellville, UT 63950-0625',NULL,NULL),(65,'Coby','Wilkinson','m','1980-02-22','031 Keeling Lake Suite 558\nPort Kadeshire, KY 47129-4282',NULL,NULL),(66,'Kevon','Toy','f','2011-05-10','5280 Armani Plaza\nNorth Rey, OH 80778',NULL,NULL),(67,'Prince','Rosenbaum','f','2009-10-17','505 Padberg Ways\nPurdybury, OR 82038-3960','2018-10-13 02:07:26',NULL),(68,'Deion','Kutch','m','2016-11-24','522 Gleichner Dam\nGutkowskiview, HI 75922-0754',NULL,NULL),(69,'Quincy','Pacocha','m','1980-04-05','596 Beulah Fords Apt. 458\nGorczanyport, MD 53614',NULL,NULL),(70,'Dayton','Franecki','f','2002-03-18','465 August Crest\nLake Nathan, CA 31214','2007-08-16 04:07:40',NULL),(71,'Quinn','Franecki','f','1980-02-09','057 Stark Unions\nMarianaport, SD 68158','2014-04-01 14:47:14',NULL),(72,'Billie','Senger','m','2013-10-14','86317 Bashirian Springs Apt. 653\nRunolfsdottirport, MD 78863-6678','1988-12-01 01:43:45',NULL),(73,'Bessie','Crist','m','2012-11-15','12044 Wiza Plain Suite 672\nAdrainport, KS 45129',NULL,NULL),(74,'Nicole','Corkery','m','2020-08-17','4902 Goodwin Islands\nNorth Brookland, WY 50639','1986-05-17 17:56:08',NULL),(75,'Leopoldo','Wyman','f','2015-04-28','54009 Barry Mission Suite 127\nRyannfort, FL 37209',NULL,NULL),(76,'Jedidiah','Douglas','f','2018-12-01','766 Quigley Port\nWest Virgiehaven, GA 25179','2000-07-08 05:19:45',NULL),(77,'Payton','Lindgren','m','1977-03-25','53827 Willa Road\nCordeliatown, SD 50112',NULL,NULL),(78,'Corrine','Collier','m','1986-12-23','95623 Rahsaan Curve\nWest Zaria, NV 54249',NULL,NULL),(79,'Brooklyn','Schulist','f','1982-12-02','100 Clara Via\nNorth Arnoldo, MS 62027-2872',NULL,NULL),(80,'Sammy','Huel','m','2000-07-12','172 Stokes Turnpike Suite 077\nIdaland, NH 60543-9935','2018-02-22 15:07:06',NULL),(81,'Bernhard','Reichert','f','2011-06-18','2087 Considine Dale Suite 560\nGregoriomouth, MA 64990-2476',NULL,NULL),(82,'Jayda','Kautzer','m','1973-07-02','34024 Haley Row Suite 697\nNew Matildastad, NM 98106',NULL,NULL),(83,'Kyra','Block','m','1988-11-15','23432 Stamm Crossing\nBinstown, CA 04396-8289','2019-07-15 04:03:20',NULL),(84,'Bonnie','Blanda','m','1986-01-08','010 Cremin Drive Apt. 682\nBrennaberg, LA 15010','1986-06-01 01:20:31',NULL),(85,'Bradly','Schultz','m','1999-09-11','692 Randal Islands Apt. 077\nFrankview, CO 73187-4242',NULL,NULL),(86,'Amber','Gaylord','m','1988-08-31','041 Melba Glens Apt. 887\nNew Georgiana, MN 96619','1986-05-21 13:45:57',NULL),(87,'Vincenza','Hilll','f','1973-08-20','87899 Wehner Cape\nPort Nadia, CA 31160',NULL,NULL),(88,'Johathan','Boehm','f','2005-10-06','640 Breitenberg Rapids\nLake Bella, OR 14242-8391','1998-06-01 19:21:31',NULL),(89,'Garth','Beer','m','1991-02-25','875 Runolfsdottir Court\nWest Jess, KS 19928-0845','2001-12-09 04:53:38',NULL),(90,'Annabel','Stracke','m','1970-06-13','76275 Bergstrom Row Apt. 135\nIgnaciohaven, MI 44728-7593',NULL,NULL),(91,'Rosalia','Cruickshank','m','1971-07-25','94973 Landen Center Apt. 320\nLydiamouth, IN 37265',NULL,NULL),(92,'Nicola','Altenwerth','m','1983-01-28','0774 Bahringer Brooks\nNorth Brock, WI 92642-2230',NULL,NULL),(93,'Delores','Heathcote','f','2014-01-31','3074 Oral Flat\nLake Micah, NJ 77447','2018-04-24 16:54:03',NULL),(94,'Leatha','Muller','m','2008-10-02','37594 Kozey Drives\nAlexandreatown, NV 83091','1978-05-03 13:37:08',NULL),(95,'Trever','Hudson','m','2004-04-26','8618 Heller Skyway\nKington, PA 15063-2389','1982-02-02 20:57:26',NULL),(96,'Lavon','Trantow','m','1986-02-22','5258 Darian Ridges Apt. 941\nBoylefurt, OK 58662-5993','2004-05-01 02:26:46',NULL),(97,'Rosemarie','Walter','f','1976-07-22','9017 Lubowitz Ford Apt. 227\nSouth Gussieville, UT 48036-4413',NULL,NULL),(98,'Pearlie','Walker','f','2002-02-14','75035 Alyson Circle Apt. 831\nWest Willtown, CO 78499-5846','1996-10-18 11:38:39',NULL),(99,'Ettie','Auer','f','1994-01-16','752 Pfannerstill Glen\nEast Einoville, OH 80457-4309',NULL,NULL),(100,'Alessandra','Nienow','f','2010-09-08','7022 Johan Shores\nSouth Terrancestad, MO 55228-5855',NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses_products` (
  `id` int NOT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,0),(2,2500),(3,0),(4,30),(5,500),(6,1);
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `password_hash` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at_copy1` datetime DEFAULT NULL,
  `deleted_at_copy1` datetime DEFAULT NULL,
  `created_at_copy1` datetime DEFAULT NULL,
  `updated_at_copy2` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'elissa71@example.com',79394624141,'915b00d0068ad0e307605e4626ac1490b2c924ee','2002-02-27 20:10:01','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(2,'conroy.erik@example.net',79984567561,'90513f8951b4c940530b5cd24cecf8e4f0a346a4','1998-03-28 12:43:14','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(3,'orn.cristal@example.com',79440162215,'71f13148c99bd16ddcac08817baf947918264eae','2003-09-11 16:54:28','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(4,'davis.birdie@example.org',79761967642,'a3f61b9351e0046b2b81aa1b80e2824acd992f4b','2016-06-27 14:58:45','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(5,'nstracke@example.com',79834143737,'7d278de07a9fd3fa597238843347a950355f561f','1973-03-17 20:40:04','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(6,'hnolan@example.com',79773171759,'cfab119380f234d1409a202ab5262a98a1c337a9','1995-03-03 04:02:54','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(7,'sawayn.barbara@example.org',79782773806,'3a3db6912f81070ebbb822015a8811a5356621ff','2017-01-03 16:16:38','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(8,'sanford.ebert@example.com',79438606290,'5f6c3dbb9cce7db4ea349f7ed74937b4f98c4490','2016-02-12 20:29:07','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(9,'yspencer@example.net',79695873589,'60caaed5aed01887fff2ab7aaa170035a4edff71','1974-08-24 06:22:58','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(10,'kurt45@example.org',79094405075,'6588c7bf4d09cb2969c0ad41534a1935cc7a13e4','2002-03-23 10:38:12','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(11,'jennie93@example.org',79189408955,'2d87459f56ceb5f2a1bf8c2b11849091d6005ef2','1984-10-23 14:33:50','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(12,'herminio.jenkins@example.org',79555345357,'f0c3bab00e4a9b988f9a94da4a8f56e2e2affc30','1979-06-28 15:26:00','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(13,'haley.alessia@example.net',79627758127,'55f4b54ad1cddd5413a2918d1493e1e299b5fb9a','1973-08-11 08:16:51','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(14,'rippin.prudence@example.com',79152506407,'5d3830b38dd2a6c0fb889a16f27575682d820a3d','1988-03-28 03:10:47','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(15,'napoleon.spinka@example.com',79697660175,'3126ef1bf6f9c11969cd40b6264b0e50a1affb05','1974-02-13 03:01:12','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(16,'okilback@example.net',79717110227,'d87ecd60a3748fd6bb7f6b11c210403f0a74ccae','2005-05-27 22:58:15','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(17,'braun.brando@example.net',79190975992,'dbd0de94342820d215a623a600913cb8c4b6875c','1986-12-02 20:59:57','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(18,'kuhic.russell@example.org',79403670772,'b247ad3a764fe8d2e72786f3c684c9ba5b63ba28','1997-09-13 18:48:04','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(19,'richie41@example.org',79021812241,'cbb11e98618f793ece32d8e789963469b7f418bd','1990-11-01 05:30:31','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(20,'pdare@example.org',79480771441,'a811e0b90a99eb637e1284330e958e275ba3fff3','2006-10-06 03:50:12','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(21,'verda.koss@example.org',79714179510,'248f52dfafcda4b7b588bb140a63bd722db3a4a2','2016-07-12 16:07:45','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(22,'edgar02@example.org',79895227371,'c94ca431cc1f90d3183b72936c04d1f75b8a27ec','1974-10-22 13:56:08','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(23,'sean.huels@example.net',79481254758,'1841c435055b4da013846ba144e4c229ad0cd2c6','1972-02-15 13:09:52','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(24,'xharber@example.org',79185554024,'f7d510ce5e2c319f1ca596ac43f2df28aa487c39','2001-05-21 23:34:55','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(25,'sarai.nikolaus@example.net',79858714813,'88df25c570b888df0044dc4aba8adbb63d15d4df','1988-11-17 22:59:15','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(26,'krajcik.wilfred@example.net',79934308057,'bfbec7fe50d213bb45f97949a7eaf11d3feb3b83','2001-12-24 20:38:31','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(27,'bennett.leuschke@example.net',79038582216,'711dbfa25b259af0b6207016449d8e9de51ab992','2007-11-27 08:13:03','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(28,'bettie.schuster@example.org',79189129622,'fe4c304af7225bc4c953b699e25c9e33851ae881','1982-08-08 00:27:43','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(29,'una66@example.net',79561436862,'9aa8dc9cc0ca029e159f093d3ed3d2868c83b8bb','2000-12-13 10:35:30','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(30,'bradly61@example.org',79808584029,'de966b1fd5256731f87ea0fd2c356400f3747f88','1974-09-04 14:57:26','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(31,'coby53@example.com',79101654229,'882c0df22674c3fb3771cc2350ee8865c9e0cad1','2011-01-03 14:05:32','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(32,'alexandria67@example.org',79252144398,'8c34b9771e795f46daee0324ac8e707796aa40f3','1982-05-05 12:57:33','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(33,'valentine05@example.com',79799148155,'7ad0b20b3919f66a7ae42ab165751b9305039bdd','2014-06-15 05:09:34','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(34,'fwhite@example.org',79780145610,'ec01f2a4cf8b49fe85e9f946101acbbd0415c725','1990-02-14 09:40:12','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(35,'cassandre26@example.org',79411861459,'09ef7e82561db5f6701336052c9b119d81f14f07','2017-06-16 20:23:00','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(36,'wallace02@example.com',79705554683,'633de8b1ebcfa4830d8d56cc7a87a577268544f4','2018-09-03 00:58:32','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(37,'drake.marvin@example.org',79138602524,'24108c82731f47841c971bd60a47312f92117ee4','2019-07-26 11:33:25','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(38,'ashlynn.stracke@example.org',79423220526,'77256aa74b7416cc3dd735e48ec0f641104ab94c','2017-08-18 18:05:41','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(39,'kira46@example.net',79333819751,'f7407249517329ea90158e77d96874f96c405737','1993-07-22 22:28:44','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(40,'elvie14@example.com',79753397889,'08f69aaf651bda037e4aa4c45d5491111bc62f90','1982-11-23 15:04:23','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(41,'harold00@example.com',79122118822,'cb5e8f03e1bd57b72423431b078067e303d35ab5','1971-05-04 05:38:40','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(42,'javonte.beer@example.org',79911216148,'6e9cbb651507823b44c6871666ddf8da830e3327','1979-03-13 17:54:09','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(43,'junior99@example.net',79803185029,'2849b110ffe647bb1d851b4e6016047f50d5867f','2001-02-27 05:29:46','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(44,'brannon37@example.net',79477211342,'bb17c84749ec40a07bd9d41126586b6ff30a9081','1992-05-18 21:06:34','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(45,'stacey.cronin@example.org',79591203821,'ac5d448c76d8ee47c6931bebc62ad1079449b989','1989-12-21 20:07:09','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(46,'breitenberg.hortense@example.org',79639435583,'eafdf7a81db6f38c033e39dc6a33b81d85becf3a','1990-02-24 16:24:05','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(47,'orlo51@example.org',79273187985,'e306dd03645140e4e954cc22af57491ac5259f37','1993-04-11 22:50:08','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(48,'hassie77@example.org',79652405807,'dbe5a8458548b55df7cc427a44e1746b518e67bb','1983-09-16 16:58:25','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(49,'lizzie.jakubowski@example.org',79036425950,'8d64a8c04842942957a88357645e750a1900f083','2015-02-04 11:36:01','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(50,'rwaters@example.com',79738161002,'d8befba0738b615faedf5f0c51b4727cf9dbe754','2011-02-28 06:09:52','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(51,'ozella22@example.net',79117521592,'feb61c1cf864354fcb97b05c5c8674cd7981d59c','1974-07-06 10:42:32','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(52,'vlarson@example.net',79263116989,'e3c7e91403e37864aaa577f37c60121ed2b6ab50','2004-08-29 15:55:08','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(53,'mike55@example.com',79410650815,'168281a4e72ce5c4b6084cb50a065c2b17de1064','1999-06-29 00:26:57','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(54,'crooks.penelope@example.com',79025615103,'c1b68ad43549c58169c796665749f2c1533bd2c7','1992-11-22 05:27:22','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(55,'hills.thad@example.com',79225514791,'5bfe955fb581f819d77ef7653aede638de340228','2021-03-17 18:59:01','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(56,'theron.beier@example.net',79741875413,'9814744c6149cfc357981762861e7efa3bf6ba65','1983-06-14 17:53:08','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(57,'pollich.myra@example.org',79168450168,'9882b6824a0fa2c087d9abe60f750a68fee9ea20','1972-11-17 10:12:54','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(58,'egreenholt@example.org',79567301654,'90c5987561981cc7d4445d607bfd975372aa9c98','2012-08-10 11:22:51','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(59,'alvena.schmitt@example.com',79251014347,'129ddda86f4f8f853eb7da81ea1cb2ac76886b5f','2000-12-08 04:33:54','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(60,'btowne@example.org',79995727017,'d4162f03174231a27c566c0a8fa121e41d5985f5','1996-07-01 02:05:17','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(61,'ilene39@example.net',79385217770,'6ec3160d40ea21d5cd17a2af055c3208bd307a84','2013-11-04 07:30:45','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(62,'tyra.d\'amore@example.com',79973027861,'284a31e37eaace44d43f7242ee6a9032d61c3cea','2004-09-24 10:23:44','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(63,'dbernhard@example.com',79564230401,'1a54374c80797e5ea65bf42a2cb00bd0d7ac8536','1974-02-01 04:27:29','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(64,'vicky.pacocha@example.com',79550038822,'72bb58f3912c445394c74a73c8f69032b76687ef','1994-01-19 12:33:53','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(65,'thompson.mackenzie@example.org',79239929738,'aa8dda107c2d338c5927da85753b562fd97e201b','1985-03-01 08:38:46','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(66,'stamm.elda@example.net',79270666778,'8087d3661b24d2a05694c29367383255c781f64b','1989-09-22 20:30:40','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(67,'mckayla.crooks@example.org',79441283702,'8d01fe58dcf0016f98dee19d8ddedf2d3538257c','1984-05-13 04:04:24','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(68,'odell34@example.org',79226064752,'9c286d5136a17b37d575a4ab751a06270d7db9b4','1978-12-13 15:39:33','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(69,'imuller@example.org',79135193470,'e4a95483c6f54f3164fd5a51840c08d25df19985','1992-07-18 05:47:00','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(70,'price.tillman@example.net',79516925028,'8dd692213e22b2a49ff8e32c972b97b3ab676808','1993-07-13 17:54:19','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(71,'earl96@example.net',79838241033,'b586de461133fdb910cd7e6c72047300c87aca7e','1986-11-02 04:24:19','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(72,'pollich.arnoldo@example.com',79485870492,'b2740f9505b1f8496ae3d5518f4480df3971fedd','1982-04-21 18:25:24','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(73,'hratke@example.org',79937942049,'bb1e6edd5c4730d382c6a4b303630a1f04c7339e','1992-10-10 17:38:13','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(74,'raphael.schamberger@example.com',79661813901,'e52f3e351c633b45271948e46042ef517860cd79','2013-06-01 13:09:32','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(75,'rosella12@example.org',79381843691,'e1feb2eb7201f82cc8b1109c62bd678e866c4de2','1975-07-25 10:46:35','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(76,'johnson.jerad@example.com',79832083051,'6c648f2944eba7fa37becd1411e13f12d03ade6a','1987-04-01 07:20:58','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(77,'itzel08@example.org',79973332508,'16ee480b01c18fdfd01bbc0be990e132145655e5','2015-03-23 14:17:52','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(78,'fletcher36@example.org',79402134639,'38fdf9be5519ebf0f54547c5fc666d05d1b4d065','1981-05-09 18:05:02','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(79,'eo\'conner@example.net',79083152255,'6b076d9b1b418af51f8e995650de2786e16c1465','2006-09-09 22:46:04','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(80,'yyost@example.com',79682787265,'950c6a345b5fd17e8baa459c9cddc3a18522b94e','2003-01-15 07:08:38','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(81,'haskell.mcdermott@example.com',79463379977,'b9b82741a502a527a97996169a1e93aab7d108c6','2002-02-06 14:59:25','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(82,'ylarkin@example.org',79573823239,'b4af7c0e593d7f0727bfc14bd20f8b866cb46ab7','1986-05-21 06:09:03','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(83,'gislason.dillon@example.org',79646037694,'fa3d944605273f0c59f747d02aca2f77775235fc','1994-03-20 02:35:34','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(84,'darrell.senger@example.com',79721330546,'cc735120ec15464d45a6008fa15e49497fc6b222','1999-09-26 03:18:18','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(85,'adele.morissette@example.com',79405971609,'c8cb66d526014f048c5570425c69e8299f8cbd94','1972-05-02 09:09:02','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(86,'jordi14@example.net',79185095847,'970ee5c654e0cde3f1d2e747d0e8bf88fba4f7fe','1987-10-29 02:05:08','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(87,'ofunk@example.org',79940725725,'a497150a8fefffec3555784418aa9ba68460a10c','1990-10-14 20:05:55','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(88,'cleuschke@example.net',79956222632,'eb81be5b259183f0440a56d61653c60bd3964899','1985-07-21 22:03:00','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(89,'schaefer.chance@example.net',79417572922,'ad0570bb43bef822ad6492c6c6e7ab236515e06a','1996-03-03 00:17:53','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(90,'bettie.kuhlman@example.net',79023828741,'11af3ba093d37ae2cc4471969a070e40067d1a62','1992-12-07 01:26:28','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(91,'kankunding@example.com',79333667813,'ff3d0d3bf3b7565d40ab6037ef0c03a381c17f69','1987-07-05 02:03:36','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(92,'rene.gorczany@example.com',79308236694,'46721c8562892eb80bd7a9c42795775182c1ca33','2004-12-17 12:11:05','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(93,'gutkowski.hope@example.org',79662372557,'d1dda08d1177bf3cd5dd05993d124f28369f1b97','2011-10-10 05:14:53','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(94,'boehm.price@example.com',79662431380,'66ecfab34f38c3736a7b073ae04041b3c9a6be2e','1986-07-07 10:04:33','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(95,'abraham.romaguera@example.org',79662154707,'cdfa1ea74b84050e7b1fe46b9a2417a5e00a47b4','2018-12-14 05:27:35','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(96,'ohilpert@example.net',79090559651,'978d7be2b4211d0e20be706bae6612efa32a4352','2005-04-03 07:43:37','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(97,'rigoberto.gulgowski@example.org',79813092445,'5768a005e7348c4f21a921e8b9a53ab4d322c4a4','2010-07-22 11:06:21','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(98,'antonia52@example.net',79778756837,'7b6ff415bc844247208efcf0e6d71c1b52d945e3','1985-02-05 13:29:39','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(99,'ruthe68@example.net',79731930041,'64562595cbc354299566ff45bb06fbb2dc5b6788','1998-09-17 11:46:10','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00'),(100,'langosh.cynthia@example.net',79393879566,'58f757c01cc7b51707bc5c3d7bfcb2faabef6cc0','2000-08-18 12:23:07','2021-07-10 13:55:31',NULL,'2021-07-10 12:24:46','2021-07-10 12:24:46','2017-10-20 08:10:00','2017-10-20 18:10:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_community`
--

DROP TABLE IF EXISTS `user_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_community` (
  `community_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `user_idx` (`user_id`),
  KEY `community_idx` (`community_id`),
  CONSTRAINT `fk_community_has_profile_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_community_has_profile_profile1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_community`
--

LOCK TABLES `user_community` WRITE;
/*!40000 ALTER TABLE `user_community` DISABLE KEYS */;
INSERT INTO `user_community` VALUES (2,1),(6,1),(8,1),(2,3),(8,3),(9,3),(4,4),(7,6),(7,7),(6,8),(8,8),(1,9),(4,10),(3,11),(1,12),(4,12),(7,12),(2,16),(8,16),(7,17),(4,19),(5,20),(6,21),(4,24),(9,24),(9,26),(6,27),(1,28),(2,28),(9,28),(8,29),(9,32),(7,33),(6,34),(6,35),(3,36),(5,37),(4,41),(4,42),(2,45),(4,45),(3,46),(10,47),(1,48),(10,48),(8,50),(7,51),(6,52),(7,53),(9,53),(4,55),(1,56),(6,56),(3,57),(7,57),(5,58),(7,58),(4,59),(1,62),(3,62),(7,62),(2,65),(3,65),(8,65),(9,65),(1,66),(8,67),(9,67),(9,70),(10,70),(5,72),(7,72),(4,75),(8,75),(7,76),(2,80),(6,80),(7,80),(5,81),(1,82),(8,86),(9,86),(8,87),(1,89),(6,89),(5,90),(9,90),(4,92),(9,92),(8,93),(4,94),(7,94),(10,95),(1,97),(3,99),(4,100),(8,100);
/*!40000 ALTER TABLE `user_community` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-18 16:20:51
