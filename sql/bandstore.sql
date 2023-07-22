-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: bandstore
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_image_invoice_table',1),(2,'2014_10_12_000000_create_orders_table',1),(3,'2014_10_12_000000_create_products_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_resets_table',1),(6,'2019_08_19_000000_create_failed_jobs_table',1),(7,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'waiting',
  `qty` int NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id_idx` (`product_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (24,2,2,'order-images/1VN0kMSWCnR8WrmmxvAzCFztNpy0wo1FPqP5JmVF.jpg','successed',6,NULL,'2023-07-16 01:59:08','2023-07-16 02:29:06'),(25,2,4,'order-images/1VN0kMSWCnR8WrmmxvAzCFztNpy0wo1FPqP5JmVF.jpg','canceled',3,NULL,'2023-07-16 01:59:08','2023-07-16 02:30:15'),(26,2,3,'order-images/eCPpQvHzzqBTLrYlX9EjTVwwkh3EMFbawPb41eM0.jpg','successed',3,NULL,'2023-07-16 02:27:14','2023-07-16 02:34:38');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `qty` int NOT NULL,
  `desc` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'product-images/aRhCHFysCTmjiRiYHggci9YSt5Gjojv14lYn6PIl.jpg','SG Special','Gibson','Gitar',3000000,3,'Kualitas 100% original',NULL,'2023-07-15 06:33:05','2023-07-15 23:56:03'),(2,'product-images/rTiZvkXtnDnqaWqlSAoFP04hM097CXdJVTy32RWV.jpg','Lava Me 3 Black','Lava','Gitar',5000000,0,'Kualitas 100% original',NULL,'2023-07-15 06:33:35','2023-07-16 01:59:40'),(3,'product-images/P6xyT9E4V5ArbGR1pP4tiqNd82k5VD3Pj8zq1h32.jpg','Lava Me 3 Blue','Lava','Gitar',5000000,6,'Kualitas 100% original',NULL,'2023-07-15 06:34:17','2023-07-16 02:29:36'),(4,'product-images/9jmmDc4KGb51QrAY2mamMcnDDuNfk2ApwGiISFEF.jpg','LP Humbucke','Gibson','Gitar',4000000,5,'Kualitas 100% original',NULL,'2023-07-15 06:34:59','2023-07-15 06:34:59'),(5,'product-images/4S113PvTWiWQKqPjlNi8uQ04ATV6OdBFpxDdjfQM.jpg','Monterey MGS14 Guitar Pack','Monterey','Aksesoris',800000,4,'Kualitas 100% original',NULL,'2023-07-15 06:35:39','2023-07-15 06:35:39'),(6,'product-images/zfUAh5m0oe6zx9FWyHgDenK4W2JNrPA3PHFRtmHG.jpg','Nec Fuzzdive','SCW Audio','Gear',1100000,4,'Kualitas 100% original',NULL,'2023-07-15 06:36:49','2023-07-15 06:36:49'),(7,'product-images/K5OJqGB801LgcM1HtGgggOSt1CJ0ciAZXPW81KGk.jpg','SG Tribute Electric','Gibson','Gitar',3500000,2,'Kualitas 100% original',NULL,'2023-07-15 06:37:42','2023-07-15 06:37:42'),(8,'product-images/V9ZggUuFXS3KtJMB2YOvdDQuIqavI0x38ihDgMWI.jpg','Yamaha C40','Yamaha','Gitar',800000,1,'Kualitas 100% original',NULL,'2023-07-15 06:38:16','2023-07-15 06:38:16'),(9,'product-images/2VaMgf06JB5F41lti0PxGQqBxF6v3KqUN6ctHWyW.jpg','Yamaha Piaggero','Yamaha','Keyboard',1100000,2,'Kualitas 100% original',NULL,'2023-07-15 06:38:53','2023-07-15 06:38:53'),(10,'product-images/y1jKjBO5iSZwEaMYMCvvj73bJSHcFySTT3GX982B.jpg','Yamaha Red Label FGX5','Yamaha','Gitar',1100000,1,'Kualitas 100% original',NULL,'2023-07-15 06:39:37','2023-07-15 06:39:37'),(11,'product-images/ZreRxJUn6S8uE3yQF3eDYTUzC78alt4RAclNV1Kc.jpg','Yamaha Redface CP','Yamaha','Keyboard',1500000,4,'Kualitas 100% original',NULL,'2023-07-15 06:40:08','2023-07-15 06:40:08'),(12,'product-images/RVHqeXEm4dmaKrmSYpbI5pcuKwPhWy8kAEsC1cIg.jpg','Yamaha Redface YC','Yamaha','Keyboard',999000,2,'Kualitas 100% original',NULL,'2023-07-15 06:40:47','2023-07-15 06:40:47');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'algio','$2y$10$F2JgcSZHxuT0e87/ywPnCec4ver5tLwok.uWZx0Y6MGMCoqJJdu/2','admin',NULL,'2023-07-15 06:31:01','2023-07-15 06:31:01',NULL),(2,'jamjam','$2y$10$xvwBsbUXCe5YRkkKDDY0JedmXa7QJPazXei1LSpElKKwya9RfOfMO','user',NULL,'2023-07-15 06:31:15','2023-07-16 01:59:08','Jl. Tutwuri Handayani No. 81 Kmp. Sukaresmi RT. 005 RW. 002 Kel. Citeureup Kec. Cimahi Utara Kota Cimahi 40512 (Posisi Rumah Sebelahan SMK Tutwuri Handayani Pagar dan Cat Rumah Warna Biru Tua)'),(3,'akas','$2y$10$2WSUV4qfj0GfC.3tK3g.6uF.wdnDVMiXsqQV9Gj7a4FUH0B9MOQqO','user',NULL,'2023-07-16 02:39:09','2023-07-16 02:39:09',NULL);
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

-- Dump completed on 2023-07-16 18:32:00
