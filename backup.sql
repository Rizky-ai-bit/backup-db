-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: inventori
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `barang_keluar`
--

DROP TABLE IF EXISTS `barang_keluar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang_keluar` (
  `id_barang_keluar` int NOT NULL AUTO_INCREMENT,
  `id_barang` int NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `jumlah_keluar` int NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_barang_keluar`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `data_barang` (`id_barang`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_keluar`
--

LOCK TABLES `barang_keluar` WRITE;
/*!40000 ALTER TABLE `barang_keluar` DISABLE KEYS */;
INSERT INTO `barang_keluar` VALUES (17,30,'2025-07-16',10,'Satryo Anggara','2025-07-15 21:23:36','2025-07-15 21:23:36');
/*!40000 ALTER TABLE `barang_keluar` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_barang_keluar_insert` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN

  UPDATE data_barang 

  SET stok = stok - NEW.jumlah_keluar

  WHERE id_barang = NEW.id_barang;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `barang_masuk`
--

DROP TABLE IF EXISTS `barang_masuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int NOT NULL AUTO_INCREMENT,
  `id_barang` int NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `jumlah_masuk` int NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_barang_masuk`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `data_barang` (`id_barang`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barang_masuk`
--

LOCK TABLES `barang_masuk` WRITE;
/*!40000 ALTER TABLE `barang_masuk` DISABLE KEYS */;
INSERT INTO `barang_masuk` VALUES (15,28,'2025-07-16',1,NULL,'2025-07-15 21:08:09','2025-07-15 21:08:09'),(16,30,'2025-07-16',10,NULL,'2025-07-15 21:22:18','2025-07-15 21:22:18');
/*!40000 ALTER TABLE `barang_masuk` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_barang_masuk_insert` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN

  UPDATE data_barang 

  SET stok = stok + NEW.jumlah_masuk

  WHERE id_barang = NEW.id_barang;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_barang`
--

DROP TABLE IF EXISTS `data_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(40) NOT NULL,
  `package` varchar(255) NOT NULL,
  `harga_beli` bigint NOT NULL,
  `harga_jual` bigint NOT NULL,
  `id_kategori` int NOT NULL,
  `stok` int DEFAULT NULL,
  `id_supplier` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_barang`),
  KEY `id_kategori` (`id_kategori`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `data_barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE,
  CONSTRAINT `data_barang_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `data_supplier` (`id_supplier`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_barang`
--

LOCK TABLES `data_barang` WRITE;
/*!40000 ALTER TABLE `data_barang` DISABLE KEYS */;
INSERT INTO `data_barang` VALUES (14,'OZYCNQ8X','Ice Kepal','Cup',8000,15000,6,120,1,'2025-07-10 00:30:08','2025-07-10 00:30:08'),(15,'GGNTDDOY','Yogut Botol','Btl',7500,15000,6,0,1,'2025-07-10 00:31:31','2025-07-10 00:31:31'),(16,'ZFZABVBB','Yogut stik','Bks',13000,20000,6,0,2,'2025-07-10 00:32:47','2025-07-10 00:32:47'),(17,'TUZ51CID','Pancake Mika','Bks',12000,17000,5,0,1,'2025-07-10 00:34:03','2025-07-10 00:34:03'),(22,'BO2NF6BV','Pancake box','Bks',45000,70000,5,28,1,'2025-07-10 00:35:34','2025-07-10 00:35:34'),(24,'C379QU3W','Durpas','Bks',65000,80000,5,2,1,'2025-07-10 00:37:32','2025-07-10 00:37:32'),(25,'EHVSJQWU','Durian cup','cup',5000,10000,6,3,2,'2025-07-10 00:38:34','2025-07-10 00:46:02'),(26,'9WTF192W','Milk shake','Btl',8000,15000,6,41,1,'2025-07-10 00:39:35','2025-07-10 00:46:17'),(28,'PNUVBRVF','Merries Pants M isi 32+2','Bag',55000,60000,9,NULL,5,'2025-07-15 21:06:49','2025-07-15 21:06:49'),(30,'S3IZQQHJ','Beras','Kilogram',14500,15500,12,0,5,'2025-07-15 21:21:53','2025-07-15 21:21:53');
/*!40000 ALTER TABLE `data_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_supplier`
--

DROP TABLE IF EXISTS `data_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_supplier` (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp_supplier` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_supplier`
--

LOCK TABLES `data_supplier` WRITE;
/*!40000 ALTER TABLE `data_supplier` DISABLE KEYS */;
INSERT INTO `data_supplier` VALUES (1,'angger','japura','0897552676','2025-07-09 02:56:59','2025-07-09 02:56:59'),(2,'Sofyan ','Atlantis barat daya','08976517772','2025-07-09 02:56:59','2025-07-09 02:56:59'),(5,'Lumet Store','Bukepin','087729355308','2025-07-15 20:54:19','2025-07-15 20:54:19');
/*!40000 ALTER TABLE `data_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (5,'Makanan','2025-07-09 23:20:41','2025-07-09 23:20:41'),(6,'Minuman','2025-07-09 23:20:53','2025-07-09 23:20:53'),(9,'Perlengkapan Bayi','2025-07-15 21:02:14','2025-07-15 21:02:14'),(10,'Kebersihan & Kesehatan','2025-07-15 21:03:16','2025-07-15 21:03:16'),(11,'Kosmetik','2025-07-15 21:03:29','2025-07-15 21:03:29'),(12,'Sembako','2025-07-15 21:03:52','2025-07-15 21:03:52'),(13,'Material','2025-07-15 21:04:15','2025-07-15 21:04:15'),(14,'Billing','2025-07-15 21:05:00','2025-07-15 21:05:00'),(15,'Top Up','2025-07-15 21:05:20','2025-07-15 21:05:20'),(16,'Materai','2025-07-15 21:05:32','2025-07-15 21:05:32'),(17,'ATK','2025-07-15 21:05:44','2025-07-15 21:05:44'),(18,'Lainnya','2025-07-15 21:05:58','2025-07-15 21:05:58');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_07_07_015352_create_data_barangs_table',2),(5,'2025_07_07_040735_create_data_suppliers_table',2),(6,'2025_07_07_043320_create_data_table',2),(7,'2025_07_07_043958_create_barang_masuks_table',2),(8,'2025_07_07_044350_create_barang_keluars_table',2),(9,'2025_07_07_044728_create_rekap_datas_table',2),(10,'2025_07_11_064512_add_fields_to_rekap_data_table',3),(11,'2025_07_11_073538_rekap_data',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` VALUES ('swiftsofyan@gmail.com','$2y$12$8TR5ytif/D6zml2GR0G.quTTm51na/CWgAuhCRQof9yYOCgFyiWJe','2025-07-14 21:43:39');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekap_data`
--

DROP TABLE IF EXISTS `rekap_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rekap_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `data_barang_id` int DEFAULT NULL,
  `stok_awal` int DEFAULT NULL,
  `pembelian` int DEFAULT NULL,
  `penjualan` int DEFAULT NULL,
  `stok_akhir` int DEFAULT NULL,
  `harga_beli` bigint DEFAULT NULL,
  `harga_jual` bigint DEFAULT NULL,
  `keuntungan` bigint DEFAULT NULL,
  `modal_per_akhir` bigint DEFAULT NULL,
  `sub_total` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekap_datas_data_barang_id_foreign` (`data_barang_id`),
  CONSTRAINT `rekap_datas_data_barang_id_foreign` FOREIGN KEY (`data_barang_id`) REFERENCES `data_barang` (`id_barang`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekap_data`
--

LOCK TABLES `rekap_data` WRITE;
/*!40000 ALTER TABLE `rekap_data` DISABLE KEYS */;
INSERT INTO `rekap_data` VALUES (1,'2025-07-10',14,5,37,0,42,8000,15000,0,336000,0,'2025-07-11 00:39:53','2025-07-11 00:39:53'),(2,'2025-07-10',15,1,0,1,0,7500,15000,7500,0,15000,'2025-07-11 00:39:53','2025-07-11 00:39:53'),(3,'2025-07-10',16,2,0,2,0,13000,20000,14000,0,40000,'2025-07-11 00:39:53','2025-07-11 00:39:53'),(4,'2025-07-10',17,-26,26,0,0,12000,17000,0,0,0,'2025-07-11 00:39:53','2025-07-11 00:39:53'),(5,'2025-07-10',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:39:53','2025-07-11 00:39:53'),(6,'2025-07-10',24,22,0,20,2,65000,80000,300000,130000,1600000,'2025-07-11 00:39:53','2025-07-11 00:39:53'),(7,'2025-07-10',25,221,0,218,3,5000,10000,1090000,15000,2180000,'2025-07-11 00:39:53','2025-07-11 00:39:53'),(8,'2025-07-10',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:39:53','2025-07-11 00:39:53'),(9,'2025-07-12',14,42,0,0,42,8000,15000,0,336000,0,'2025-07-11 00:40:20','2025-07-11 00:40:20'),(10,'2025-07-12',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 00:40:20','2025-07-11 00:40:20'),(11,'2025-07-12',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 00:40:20','2025-07-11 00:40:20'),(12,'2025-07-12',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 00:40:20','2025-07-11 00:40:20'),(13,'2025-07-12',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:40:20','2025-07-11 00:40:20'),(14,'2025-07-12',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 00:40:20','2025-07-11 00:40:20'),(15,'2025-07-12',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 00:40:20','2025-07-11 00:40:20'),(16,'2025-07-12',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:40:20','2025-07-11 00:40:20'),(17,'2025-07-01',14,42,0,0,42,8000,15000,0,336000,0,'2025-07-11 00:45:53','2025-07-11 00:45:53'),(18,'2025-07-01',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 00:45:53','2025-07-11 00:45:53'),(19,'2025-07-01',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 00:45:53','2025-07-11 00:45:53'),(20,'2025-07-01',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 00:45:53','2025-07-11 00:45:53'),(21,'2025-07-01',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:45:53','2025-07-11 00:45:53'),(22,'2025-07-01',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 00:45:53','2025-07-11 00:45:53'),(23,'2025-07-01',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 00:45:53','2025-07-11 00:45:53'),(24,'2025-07-01',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:45:53','2025-07-11 00:45:53'),(33,'2025-07-03',14,42,0,0,42,8000,15000,0,336000,0,'2025-07-11 00:46:06','2025-07-11 00:46:06'),(34,'2025-07-03',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 00:46:06','2025-07-11 00:46:06'),(35,'2025-07-03',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 00:46:06','2025-07-11 00:46:06'),(36,'2025-07-03',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 00:46:06','2025-07-11 00:46:06'),(37,'2025-07-03',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:46:06','2025-07-11 00:46:06'),(38,'2025-07-03',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 00:46:06','2025-07-11 00:46:06'),(39,'2025-07-03',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 00:46:06','2025-07-11 00:46:06'),(40,'2025-07-03',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:46:06','2025-07-11 00:46:06'),(41,'2025-07-05',14,42,0,0,42,8000,15000,0,336000,0,'2025-07-11 00:46:14','2025-07-11 00:46:14'),(42,'2025-07-05',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 00:46:14','2025-07-11 00:46:14'),(43,'2025-07-05',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 00:46:14','2025-07-11 00:46:14'),(44,'2025-07-05',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 00:46:14','2025-07-11 00:46:14'),(45,'2025-07-05',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:46:14','2025-07-11 00:46:14'),(46,'2025-07-05',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 00:46:14','2025-07-11 00:46:14'),(47,'2025-07-05',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 00:46:14','2025-07-11 00:46:14'),(48,'2025-07-05',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:46:14','2025-07-11 00:46:14'),(49,'2025-07-06',14,42,0,0,42,8000,15000,0,336000,0,'2025-07-11 00:46:20','2025-07-11 00:46:20'),(50,'2025-07-06',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 00:46:20','2025-07-11 00:46:20'),(51,'2025-07-06',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 00:46:20','2025-07-11 00:46:20'),(52,'2025-07-06',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 00:46:20','2025-07-11 00:46:20'),(53,'2025-07-06',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:46:20','2025-07-11 00:46:20'),(54,'2025-07-06',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 00:46:20','2025-07-11 00:46:20'),(55,'2025-07-06',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 00:46:20','2025-07-11 00:46:20'),(56,'2025-07-06',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:46:20','2025-07-11 00:46:20'),(57,'2025-07-07',14,42,0,0,42,8000,15000,0,336000,0,'2025-07-11 00:46:26','2025-07-11 00:46:26'),(58,'2025-07-07',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 00:46:26','2025-07-11 00:46:26'),(59,'2025-07-07',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 00:46:26','2025-07-11 00:46:26'),(60,'2025-07-07',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 00:46:26','2025-07-11 00:46:26'),(61,'2025-07-07',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:46:26','2025-07-11 00:46:26'),(62,'2025-07-07',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 00:46:26','2025-07-11 00:46:26'),(63,'2025-07-07',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 00:46:26','2025-07-11 00:46:26'),(64,'2025-07-07',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:46:26','2025-07-11 00:46:26'),(65,'2025-07-08',14,42,0,0,42,8000,15000,0,336000,0,'2025-07-11 00:46:34','2025-07-11 00:46:34'),(66,'2025-07-08',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 00:46:34','2025-07-11 00:46:34'),(67,'2025-07-08',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 00:46:34','2025-07-11 00:46:34'),(68,'2025-07-08',17,28,0,28,0,12000,17000,140000,0,476000,'2025-07-11 00:46:34','2025-07-11 00:46:34'),(69,'2025-07-08',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:46:34','2025-07-11 00:46:34'),(70,'2025-07-08',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 00:46:34','2025-07-11 00:46:34'),(71,'2025-07-08',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 00:46:34','2025-07-11 00:46:34'),(72,'2025-07-08',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:46:34','2025-07-11 00:46:34'),(73,'2025-07-09',14,42,0,0,42,8000,15000,0,336000,0,'2025-07-11 00:46:40','2025-07-11 00:46:40'),(74,'2025-07-09',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 00:46:40','2025-07-11 00:46:40'),(75,'2025-07-09',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 00:46:40','2025-07-11 00:46:40'),(76,'2025-07-09',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 00:46:40','2025-07-11 00:46:40'),(77,'2025-07-09',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 00:46:40','2025-07-11 00:46:40'),(78,'2025-07-09',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 00:46:40','2025-07-11 00:46:40'),(79,'2025-07-09',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 00:46:40','2025-07-11 00:46:40'),(80,'2025-07-09',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 00:46:40','2025-07-11 00:46:40'),(89,'2025-07-04',14,120,0,0,120,8000,15000,0,960000,0,'2025-07-11 06:14:33','2025-07-11 06:14:33'),(90,'2025-07-04',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 06:14:33','2025-07-11 06:14:33'),(91,'2025-07-04',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 06:14:33','2025-07-11 06:14:33'),(92,'2025-07-04',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 06:14:33','2025-07-11 06:14:33'),(93,'2025-07-04',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 06:14:33','2025-07-11 06:14:33'),(94,'2025-07-04',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 06:14:33','2025-07-11 06:14:33'),(95,'2025-07-04',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 06:14:33','2025-07-11 06:14:33'),(96,'2025-07-04',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 06:14:33','2025-07-11 06:14:33'),(97,'2025-07-02',14,120,0,0,120,8000,15000,0,960000,0,'2025-07-11 06:16:20','2025-07-11 06:16:20'),(98,'2025-07-02',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 06:16:20','2025-07-11 06:16:20'),(99,'2025-07-02',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 06:16:20','2025-07-11 06:16:20'),(100,'2025-07-02',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 06:16:20','2025-07-11 06:16:20'),(101,'2025-07-02',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 06:16:20','2025-07-11 06:16:20'),(102,'2025-07-02',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 06:16:20','2025-07-11 06:16:20'),(103,'2025-07-02',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 06:16:20','2025-07-11 06:16:20'),(104,'2025-07-02',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 06:16:20','2025-07-11 06:16:20'),(105,'2025-07-13',14,120,0,0,120,8000,15000,0,960000,0,'2025-07-11 06:16:41','2025-07-11 06:16:41'),(106,'2025-07-13',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 06:16:41','2025-07-11 06:16:41'),(107,'2025-07-13',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 06:16:41','2025-07-11 06:16:41'),(108,'2025-07-13',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 06:16:41','2025-07-11 06:16:41'),(109,'2025-07-13',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 06:16:41','2025-07-11 06:16:41'),(110,'2025-07-13',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 06:16:41','2025-07-11 06:16:41'),(111,'2025-07-13',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 06:16:41','2025-07-11 06:16:41'),(112,'2025-07-13',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 06:16:41','2025-07-11 06:16:41'),(113,'2025-07-11',14,126,0,6,120,8000,15000,42000,960000,90000,'2025-07-11 06:17:07','2025-07-11 06:17:07'),(114,'2025-07-11',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 06:17:07','2025-07-11 06:17:07'),(115,'2025-07-11',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 06:17:07','2025-07-11 06:17:07'),(116,'2025-07-11',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 06:17:07','2025-07-11 06:17:07'),(117,'2025-07-11',22,2,26,0,28,45000,70000,0,1260000,0,'2025-07-11 06:17:07','2025-07-11 06:17:07'),(118,'2025-07-11',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 06:17:07','2025-07-11 06:17:07'),(119,'2025-07-11',25,4,0,1,3,5000,10000,5000,15000,10000,'2025-07-11 06:17:07','2025-07-11 06:17:07'),(120,'2025-07-11',26,43,0,2,41,8000,15000,14000,328000,30000,'2025-07-11 06:17:07','2025-07-11 06:17:07'),(121,'2025-07-14',14,120,0,0,120,8000,15000,0,960000,0,'2025-07-11 06:17:27','2025-07-11 06:17:27'),(122,'2025-07-14',15,0,0,0,0,7500,15000,0,0,0,'2025-07-11 06:17:27','2025-07-11 06:17:27'),(123,'2025-07-14',16,0,0,0,0,13000,20000,0,0,0,'2025-07-11 06:17:27','2025-07-11 06:17:27'),(124,'2025-07-14',17,0,0,0,0,12000,17000,0,0,0,'2025-07-11 06:17:27','2025-07-11 06:17:27'),(125,'2025-07-14',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-11 06:17:27','2025-07-11 06:17:27'),(126,'2025-07-14',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-11 06:17:27','2025-07-11 06:17:27'),(127,'2025-07-14',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-11 06:17:27','2025-07-11 06:17:27'),(128,'2025-07-14',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-11 06:17:27','2025-07-11 06:17:27'),(177,'2025-07-16',14,120,0,0,120,8000,15000,0,960000,0,'2025-07-15 21:10:16','2025-07-15 21:10:16'),(178,'2025-07-16',15,0,0,0,0,7500,15000,0,0,0,'2025-07-15 21:10:16','2025-07-15 21:10:16'),(179,'2025-07-16',16,0,0,0,0,13000,20000,0,0,0,'2025-07-15 21:10:16','2025-07-15 21:10:16'),(180,'2025-07-16',17,0,0,0,0,12000,17000,0,0,0,'2025-07-15 21:10:16','2025-07-15 21:10:16'),(181,'2025-07-16',22,28,0,0,28,45000,70000,0,1260000,0,'2025-07-15 21:10:16','2025-07-15 21:10:16'),(182,'2025-07-16',24,2,0,0,2,65000,80000,0,130000,0,'2025-07-15 21:10:16','2025-07-15 21:10:16'),(183,'2025-07-16',25,3,0,0,3,5000,10000,0,15000,0,'2025-07-15 21:10:16','2025-07-15 21:10:16'),(184,'2025-07-16',26,41,0,0,41,8000,15000,0,328000,0,'2025-07-15 21:10:16','2025-07-15 21:10:16'),(186,'2025-07-16',28,-1,1,0,0,55000,60000,0,0,0,'2025-07-15 21:10:16','2025-07-15 21:10:16');
/*!40000 ALTER TABLE `rekap_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('hRgaZdwYFj93thDcVsOXLkpm6i7KANbCQqRpUYso',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSEhOdUNEbFllZm41TDF4NmY1bFhOd1dtTGNHM2lxb29WTnc4RWpPSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXRhX2JhcmFuZyI7fXM6NToiZW1haWwiO3M6MjE6Imp1bnRvbXBlbDE3QGdtYWlsLmNvbSI7czo0OiJuYW1lIjtzOjEzOiJBZG1pbiBKTUJNQVJUIjtzOjQ6ImZvdG8iO3M6MjM6ImZvdG9fcHJvZmlsL2RlZmF1bHQucG5nIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=',1752640680);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin JMBMART','juntompel17@gmail.com',NULL,'$2y$12$1L5e.rGMpZq96uC.Ew3n8.EosJwfXvnHBpBLUNgf5WB4yRfggCc62','QaqH6DdSMjp0mUuq8i3DvDnPFgIu8tkFDd1o1XlcgE1MjNZJOVmkMLBZtEcZ','foto_profil/default.png','2025-07-10 20:48:23','2025-07-14 21:42:47');
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

-- Dump completed on 2025-07-16 11:46:21
