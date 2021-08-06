-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: online_store
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
-- Temporary view structure for view `about_customer_order`
--

DROP TABLE IF EXISTS `about_customer_order`;
/*!50001 DROP VIEW IF EXISTS `about_customer_order`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `about_customer_order` AS SELECT 
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `gender`,
 1 AS `birthdate`,
 1 AS `address`,
 1 AS `order_number`,
 1 AS `order_status`,
 1 AS `created_at`,
 1 AS `total_cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `price` decimal(10,2) unsigned DEFAULT NULL,
  `quantity` int unsigned NOT NULL,
  `total` decimal(10,2) unsigned NOT NULL DEFAULT ((`price` * `quantity`)),
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `product_idx` (`product_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `fk_basket_details_profile1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_product_list_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (1,7,2,600.00,2,1200.00,'2021-08-04 01:16:45','2021-08-04 01:55:38'),(2,7,3,400.00,2,800.00,'2021-08-04 01:16:45','2021-08-04 01:55:38'),(3,7,6,68.00,4,272.00,'2021-08-04 01:16:45','2021-08-04 01:55:38'),(4,11,7,150.00,1,150.00,'2021-08-05 06:22:59','2021-08-05 06:22:59'),(5,11,8,120.00,1,120.00,'2021-08-05 06:22:59','2021-08-06 03:21:06'),(6,11,9,100.00,2,200.00,'2021-08-05 06:22:59','2021-08-05 06:22:59'),(7,11,10,95.00,2,190.00,'2021-08-05 06:22:59','2021-08-05 06:22:59'),(8,2,2,600.00,1,1200.00,'2021-08-05 06:24:38','2021-08-05 06:24:38'),(9,1,15,190.00,1,190.00,'2021-08-06 01:59:31','2021-08-06 01:59:31');
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categor`
--

DROP TABLE IF EXISTS `categor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categor`
--

LOCK TABLES `categor` WRITE;
/*!40000 ALTER TABLE `categor` DISABLE KEYS */;
INSERT INTO `categor` VALUES (1,'Аквариумные рыбки','2021-08-04 00:23:48','2021-08-04 00:23:48'),(2,'Аквариумные растения','2021-08-04 00:23:48','2021-08-04 00:23:48'),(3,'Аквариумные беспозвоночные','2021-08-04 00:23:48','2021-08-04 00:23:48');
/*!40000 ALTER TABLE `categor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty`
--

DROP TABLE IF EXISTS `loyalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `customer_type` varchar(245) NOT NULL,
  `discount` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `fk_loyaity_profile1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty`
--

LOCK TABLES `loyalty` WRITE;
/*!40000 ALTER TABLE `loyalty` DISABLE KEYS */;
INSERT INTO `loyalty` VALUES (1,1,'partner',5),(2,2,'customer',5),(3,3,'customer',5),(4,4,'customer',5),(5,5,'customer',5),(6,6,'customer',7),(7,7,'customer',10),(8,8,'partner',3),(9,11,'partner',3);
/*!40000 ALTER TABLE `loyalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `statuse_id` int NOT NULL,
  `total_cost` decimal(10,2) unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `receipt_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`),
  KEY `receipt_idx` (`receipt_id`),
  KEY `fk_order_statuse1_idx` (`statuse_id`),
  CONSTRAINT `fk_order_profile1` FOREIGN KEY (`user_id`) REFERENCES `profile` (`user_id`),
  CONSTRAINT `fk_order_receipt1` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  CONSTRAINT `fk_order_statuse1` FOREIGN KEY (`statuse_id`) REFERENCES `statuse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3,2,2500.00,7,1,'2021-08-04 02:56:49'),(7,6,3100.00,7,1,'2021-08-05 06:01:10'),(24,6,1215.00,1,2,'2021-08-05 06:10:38'),(25,6,4110.50,2,1,'2021-08-05 06:19:29'),(26,6,2739.00,5,2,'2021-08-05 06:19:29'),(27,6,788.50,6,2,'2021-08-05 06:19:29'),(28,6,1579.00,6,2,'2021-08-05 06:19:29'),(29,6,3846.50,8,1,'2021-08-05 06:19:29'),(30,6,2089.50,10,1,'2021-08-05 06:19:29'),(31,5,1954.00,5,1,'2021-08-05 06:19:29'),(32,4,6150.00,3,1,'2021-08-05 06:19:29'),(33,4,2330.50,10,2,'2021-08-05 06:19:29'),(34,3,504.50,1,2,'2021-08-05 06:19:29');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(245) NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_idx` (`product_id`),
  CONSTRAINT `fk_photo_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'https://aqua.ru/photo-archive/55555_1',1,'2021-08-04 00:45:50',NULL),(2,'https://aqua.ru/photo-archive/55555_2',1,'2021-08-04 00:45:50',NULL),(3,'https://aqua.ru/photo-archive/66666_1',2,'2021-08-04 00:45:50',NULL),(4,'https://aqua.ru/photo-archive/66666_2',2,'2021-08-04 00:45:50',NULL),(5,'https://aqua.ru/photo-archive/66666_3',2,'2021-08-04 00:45:50',NULL),(6,'https://aqua.ru/photo-archive/11111_1',3,'2021-08-04 00:45:50',NULL),(7,'https://aqua.ru/photo-archive/11111_2',3,'2021-08-04 00:45:50',NULL),(8,'https://aqua.ru/photo-archive/44445_1',4,'2021-08-04 00:45:50',NULL),(9,'https://aqua.ru/photo-archive/33333_1',5,'2021-08-04 00:45:50',NULL),(10,'https://aqua.ru/photo-archive/44444_1',6,'2021-08-04 00:45:50',NULL),(11,'https://aqua.ru/photo-archive/77777_1',7,'2021-08-04 00:45:50',NULL),(12,'https://aqua.ru/photo-archive/88888_1',8,'2021-08-04 00:45:50',NULL),(13,'https://aqua.ru/photo-archive/12345_1',9,'2021-08-04 00:45:50',NULL),(14,'https://aqua.ru/photo-archive/99999_1',10,'2021-08-04 00:45:50',NULL),(15,'https://aqua.ru/photo-archive/99991_1',11,'2021-08-04 00:45:50',NULL),(16,'https://aqua.ru/photo-archive/99992_1',12,'2021-08-04 00:45:50',NULL);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `article` int NOT NULL,
  `name` varchar(245) NOT NULL,
  `categor_id` int unsigned NOT NULL,
  `min_quantity_sale` int unsigned DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) unsigned DEFAULT NULL,
  `availability` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article` (`article`) /*!80000 INVISIBLE */,
  KEY `name` (`name`),
  KEY `categor_idx` (`categor_id`),
  CONSTRAINT `categor` FOREIGN KEY (`categor_id`) REFERENCES `categor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,55555,'Лабидохромис церулиус - желтый',1,NULL,'Популярный у аквариумистов эндемик озера Малави, встречающийся у его северно-западного побережья. Неприхотливая, относительно миролюбивая рыба, хорошо уживающаяся с представителями родственных видов равного размера и темперамента.',350.00,1,'2021-08-04 00:24:47','2021-08-06 01:26:59'),(2,66666,'Попугай красный',1,NULL,'Яркая популярная цветовая морфа цихлиды-попугая. Неприхотлива, всеядна, отличаются большой выносливостью. Совместима с соразмерными соседями при условии достаточности пространства и наличии в аквариуме укрытий.',600.00,1,'2021-08-04 00:24:47','2021-08-04 00:27:21'),(3,11111,'Юлидохромис орнатус',1,NULL,'Сравнительно небольшая, нарядно окрашенная рыба с контрастным рисунком. Неплохо уживается с соразмерными соседями сходных повадок, но агрессивна к особям своего вида. Самцы активно охраняют отвоеванную у соседей территорию. Этим юлидохромисам больше всего по вкусу аквариумы с сыпучим грунтом, разнообразными каменистыми сооружениями. Рыбы довольно пугливы, нуждаются в укрытиях. При аранжировке допустимо использование синтетической флоры или жестколистых живых растений (анубиасы, таиландский папоротник, валлиснерия и пр.). Содержащиеся в хороших условиях рыбы активны, подвижны, держатся преимущественно в средних и нижних слоях воды.',400.00,1,'2021-08-04 00:24:47','2021-08-04 00:27:21'),(4,44445,'Лампрологус апельсиновый',1,NULL,'Лампрологус апельсиновый (Lamprologus leleupi)Однотонно, но очень ярко окрашенный лампрологус, пользующийся постоянным спросом у любителей танганьикских цихлид. При достатке пространства и укрытий неплохо уживается с соразмерными сородичами. Территориальность и агрессивность проявляет лишь в период нереста и ухода за потомством. При оформлении приоритет отдается литоральным (каменистым) пейзажам с множеством расщелин, пещер, нагромождениями крупных камней. Растения не поедает, но может выдергивать из грунта. Существует несколько географических рас, несколько различающихся характером рисунка. Ареал - каменистая прибрежная полоса оз.Танганьика (Африка). Максимальный размер 10 см. Минимальный объем аквариума - от 30-50 л на пару. В более просторном аквариуме (от 100-150 л) возможно совместное содержание в стае или с другими цихлидами и сомами африканских озер. Оптимальные параметры воды: Т=22-26оС, dGH до 20о, рН 7-9, фильтрация, регулярная подмена на свежую (до 30% еженедельно). Корм: мороженые и сухие корма авторитетных производителей (например, \"Neon Tropical Diet\", \"Neon Cichlid Mix\", \"Neon Fish Meat\", \"TetraCichlidSticks\", \"Sera Cichlids Sticks\").',580.00,1,'2021-08-04 00:24:47','2021-08-06 01:26:59'),(5,33333,'Ряска',2,NULL,'Ряска представляет собой плавающие на поверхности воды овальные ярко-зелёные листики. Ряска растёт и размножается настолько быстро, что часто заполоняет всю поверхность аквариума. С одной стороны это хорошо : под ней и в ней прячутся мальки рыб, она может служить кормом для травоядных рыб, она является биологическим фильтром в аквариуме. С другой стороны, разрастаясь на поверхности воды, ряска сильно закрывает свет другим аквариумным растениям.',50.00,1,'2021-08-04 00:24:47','2021-08-04 00:27:21'),(6,44444,'Аммания \"Бонсай\"',2,NULL,'Ammania sp.\"Bonsai\" - крохотное растение, полученное селекционерами специально для нано-аквариумов. Оно имеет внешнее сходство с бакопой каролинской (Bасора caroliniana), но еще меньше по размерам. У аммании прямой и толстый стебель, на котором попарно расположены многочисленные овальные листья размером около 1 см. Изюминка аммании, помимо очень медленного роста, это переход ярко-зеленого цвета в красный на ее верхушке. Хоть аммания и является длинностебельным растением, она вполне может подойти для формирования густого \"ковра\" на переднем или среднем плане.',68.00,1,'2021-08-04 00:24:47','2021-08-06 01:26:59'),(7,77777,'Вербейник монетный (Монетница)',2,NULL,'Это типичное для Центральной Европы водное растение, которое в природе растет как на суше, так и под водой. Легко адаптируется к переводу из одного состояния в другое. Не требовательна к условия содержания. Отлично приспособилась к жизни в аквариуме, при условии, что его другие обитатели тоже любят чистую, прохладную (15-22оС) воду.',150.00,1,'2021-08-04 00:24:47','2021-08-04 00:27:21'),(8,88888,'Людвигия болотная зеленая',2,NULL,'Не часто встречающая цветовая форма людвигии болотной. С ее помощью можно формировать пышные живописные рощицы, способные стать украшением любого домашнего водоема.',120.00,1,'2021-08-04 00:24:47','2021-08-04 00:27:21'),(9,12345,'Креветка пресноводная вишневая красная',3,NULL,'Крупные самки могут достигать 4 см, самцы – не более 2 см. Тело вытянуто и немного сплюснуто с боков. Окрас – красно-вишнёвый разной степени интенсивности, окрас вариабелен и может изменяться в зависимости от особенностей содержания. Половой диморфизм выражен, самцы мельче и бледнее, чем самки.',100.00,1,'2021-08-04 00:24:47','2021-08-04 00:27:21'),(10,99999,'Улитка пресноводная зебра',3,NULL,'Улитка пресноводная зебра обитает в лесных и горных ручьях. Питается растущими на камнях водорослями. Раковина улитки от вершины до основания покрыта чередующимися черными и золотистыми зигзагообразными полосками. Тело серого цвета с темными полосами. Длина тела может достигать 5 см. Средняя продолжительность жизни 2-3 года. Максимальный размер раковины 2-2,5 см. ',95.00,1,'2021-08-04 00:24:47','2021-08-04 00:27:21'),(11,99991,'Улитка пресноводная \"Пагода\"',3,NULL,'У этой улитки очень запоминающаяся раковина в виде многоступенчатого конуса, напоминающего пагоду, тёмно-коричневого цвета. Тело перламутровое с серым отливом. 1 – 2 см в длину.',95.00,1,'2021-08-04 00:24:47','2021-08-06 01:26:59'),(12,99992,'Креветка пресноводная \"Голубой алмаз\"',3,NULL,'Искусственно выведенная японскими и немецкими селекционерами цветовая форма N. heteropoda. Размеры - cамки длиной до 30 мм, самцы до 20 мм. От массово распространённой в наших аквариумах креветки-вишни эта цветная неокаридина отличается только насыщенной тёмно-синей окраской и чуть меньшей выносливостью к неблагоприятным условиям. Легко размножается в аквариуме, если молодым особям есть куда прятаться и их не беспокоят слишком активные соседи. Тёмно-синяя окраска не слишком устойчива, и через 2-4 поколения креветка постепенно возвращается к обычному дикому окрасу.',190.00,1,'2021-08-04 00:24:47','2021-08-06 01:26:59'),(15,12745,'Попугай желтый',1,NULL,'Подробная информация скоро появится',600.00,1,'2021-08-06 01:58:59','2021-08-06 03:57:33');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int unsigned NOT NULL,
  `firstname` varchar(245) NOT NULL,
  `lastname` varchar(245) NOT NULL,
  `gender` enum('m','w') NOT NULL,
  `birthdate` date NOT NULL,
  `receive_promo_email` tinyint NOT NULL DEFAULT '1',
  `receive_promo_sms` tinyint NOT NULL DEFAULT '1',
  `address` varchar(245) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `firstname_lastname_idx` (`lastname`,`firstname`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'Ирина','Петрова','w','1988-12-05',1,1,NULL,NULL),(2,'Ирина','Петрова','w','1988-12-05',1,1,NULL,NULL),(3,'Марина','Муштук','w','2000-03-25',1,1,'Москва, Чертановская, д.14, кв. 33','2021-08-03 23:51:31'),(4,'Анна','Земцова','w','1999-08-09',1,1,NULL,NULL),(5,'Светлана','Соколова','w','1979-11-03',1,1,'Москва, Тверская, д.50, кв. 78','2021-08-05 21:24:57'),(6,'Сергей','Карпов','m','1977-05-27',1,1,NULL,NULL),(7,'Кирилл','Акинфеев','m','1995-07-18',1,1,'Химки, ул. Пролетариатов, д.10, кв. 33','2021-08-05 21:24:57'),(8,'Игорь','Чалов','m','1988-12-12',1,1,'Видное, Советская, д.4, кв. 70','2021-08-05 21:24:57'),(9,'Антон','Набабкин','m','1988-06-14',1,1,NULL,NULL),(10,'Петр','Заболотный','m','1990-01-31',1,1,'Москва, Кировоградская, д.38, кв. 10','2021-08-05 21:24:57'),(11,'Никита','Ахметов','m','1991-10-22',1,1,NULL,NULL),(12,'Анжела','Березкина','w','1985-10-10',1,1,NULL,'2021-08-05 07:17:08'),(13,'Иван','Филюшкин','m','1990-06-29',0,0,NULL,'2021-08-05 07:22:34'),(18,'Кирилл','Камазов','m','2001-05-13',0,0,NULL,'2021-08-05 07:07:13'),(19,'Ирина','Светлакова','w','2000-05-13',1,0,NULL,'2021-08-05 07:07:13'),(20,'Степан','Кутузов','m','1998-04-21',0,0,NULL,'2021-08-05 07:07:13');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (1,'Доставка'),(2,'Самовывоз');
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuse`
--

DROP TABLE IF EXISTS `statuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuse`
--

LOCK TABLES `statuse` WRITE;
/*!40000 ALTER TABLE `statuse` DISABLE KEYS */;
INSERT INTO `statuse` VALUES (1,'Создан','2021-08-05 05:51:07','2021-08-05 05:51:07'),(2,'Подтвержден','2021-08-05 05:51:07','2021-08-05 05:51:07'),(3,'На сборке','2021-08-05 05:51:07','2021-08-05 05:51:07'),(4,'Собран','2021-08-05 05:51:07','2021-08-05 05:51:07'),(5,'Доставляется','2021-08-05 05:51:07','2021-08-05 05:51:07'),(6,'Выдан','2021-08-05 05:51:07','2021-08-05 05:51:07');
/*!40000 ALTER TABLE `statuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(245) NOT NULL,
  `phone` bigint unsigned DEFAULT NULL,
  `password_hash` char(65) DEFAULT NULL,
  `agree_process_pers_data` tinyint NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1@mail.ru',89090000044,'dc3c2c385c3ba766bfb3248250f6636fe90bdd31',1,'2021-08-03 01:55:10','2021-08-03 03:17:41',NULL),(2,'2@mail.ru',89090000002,'2dd32d1e318274f5046d62ed8588e3dba7451b13',1,'2021-08-03 01:55:10',NULL,NULL),(3,'3@mail.ru',89050000003,'f620bb81786c71a3d65e5eaa72faf7032aa1b8ed',1,'2021-08-03 01:55:10',NULL,NULL),(4,'4@mail.ru',89050000004,'0096ef0563dcd5127a9664499c23e607da892059',1,'2021-08-03 01:55:10',NULL,NULL),(5,'5@mail.ru',89050550005,'1cfd5d5229d6f1df5f753c5b7c20574a05c7160f',1,'2021-08-03 01:55:10','2021-08-03 03:21:35',NULL),(6,'6@mail.ru',89050000006,'20048cdaa2e839b411b92e166c077ff7b9c72428',1,'2021-08-03 01:55:10',NULL,NULL),(7,'7@mail.ru',89050004007,'add6229bc8f3e126a37ea5eb4e81419b45c0c753',1,'2021-08-03 01:55:10','2021-08-03 03:21:35',NULL),(8,'8@mail.ru',89050000008,'b6ba4ac95ed010852f5e9313ae72fe466734385b',1,'2021-08-03 01:55:10',NULL,NULL),(9,'9@mail.ru',89050000009,'ae02ab53b8dc68d061bbd029894cf0425c810e9e',1,'2021-08-03 01:55:10',NULL,NULL),(10,'10@mail.ru',89050110010,'ba17512d742cd119fff2d5a6bce2cd9344ca7502',1,'2021-08-03 01:55:10','2021-08-03 03:21:35',NULL),(11,'11@mail.ru',89050000011,'871a914b19471f7b678c500d6bea70062d3cbcb0',1,'2021-08-03 01:55:10',NULL,NULL),(12,'12@yandex.ru',89151237755,'f416d25c0039b86411eb4eaf398541cc1ab8b7f1',1,'2021-08-05 06:53:37','2021-08-05 07:26:36',NULL),(13,'vano@yandex.ru',89161200115,NULL,1,'2021-08-05 06:53:37','2021-08-05 06:53:37',NULL),(18,'14@yandex.ru',89161237755,'cc40bfc79d5d8b748cfa66991fddd88a2b93b24a',1,'2021-08-05 06:56:28','2021-08-05 06:56:28',NULL),(19,'van95@yandex.ru',89151200115,'e1c7eedb7b8f6fe6c10f0b8cfa1fce10f250c996',1,'2021-08-05 06:56:28','2021-08-05 06:56:28',NULL),(20,'tito777@yandex.ru',89066667155,'d2083e6368b8ae1f356ef312ef13e359315b9686',1,'2021-08-05 06:56:28','2021-08-05 06:56:28',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `about_customer_order`
--

/*!50001 DROP VIEW IF EXISTS `about_customer_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `about_customer_order` AS select `profile`.`firstname` AS `firstname`,`profile`.`lastname` AS `lastname`,`profile`.`gender` AS `gender`,`profile`.`birthdate` AS `birthdate`,`profile`.`address` AS `address`,`order`.`id` AS `order_number`,`statuse`.`name` AS `order_status`,`order`.`created_at` AS `created_at`,`order`.`total_cost` AS `total_cost` from ((`order` join `statuse` on((`statuse`.`id` = `order`.`statuse_id`))) left join `profile` on((`profile`.`user_id` = `order`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-06  5:19:38
