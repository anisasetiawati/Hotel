-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ujikom_hotel
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','resepsionis') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'resepsionis',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Administrator','admin','admin','$2y$10$9wq3Xmk1EfIdk3S.9Jdtne2oW1gCw6mdiI1Atp3l1wgWTl2TmBgJ6',NULL,'2022-04-12 06:46:58','2022-04-12 06:46:58'),(2,'Resepsionis','resepsionis','resepsionis','$2y$10$XiGj9cto2pJmfDQhw4Cl.eX4K7RhxAT5Ohy2k8FjQyDkfKpVVov5S',NULL,'2022-04-12 06:46:58','2022-04-12 06:46:58'),(3,'Putri','putri','resepsionis','$2y$10$FTlqwc8IczVJLXkknZzGSe4RJaFC2Ce.Umm5LHovqeqYwjrfWOlce',NULL,'2022-04-12 06:46:58','2022-04-13 05:09:09');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fasilitas_hotels`
--

DROP TABLE IF EXISTS `fasilitas_hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasilitas_hotels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_fasilitas_hotel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_fasilitas_hotel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi_fasilitas_hotel` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasilitas_hotels`
--

LOCK TABLES `fasilitas_hotels` WRITE;
/*!40000 ALTER TABLE `fasilitas_hotels` DISABLE KEYS */;
INSERT INTO `fasilitas_hotels` VALUES (1,'Kolam Renang','788_1649797814.jpg','Kolam renang yang kami sediakan cukup luas, dan nyaman. Dapat dikunjungi kapan saja, dan dilengkapi fasilitas untuk anak - anak.'),(2,'Restoran','981_1649851787.jpg','Menyediakan berbagai hidangan dengan suguhan panorama pantai yang bisa dinikmati bersama keluarga. Pemandangan senja paling di nanti dan paling banyak disukai pengunjung.'),(3,'Parkir Luas','697_1649899719.jpg','Parkir yang disediakan luas, sehingga dapat menampung berbagai jenis kendaraan pribadi. Dengan keamanan dan kebersihan yang terjamin terjaga dengan baik.'),(4,'Sarapan Pagi Gratis','142_1649851836.jpg','Sarapan gratis merupakan salah satu fasilitas andalan yang kami sediakan, sehingga setiap pengunjung dapat menikmati sarapan gratis perorangnya. Dengan berbagai menu yang beragam setiap harinya.');
/*!40000 ALTER TABLE `fasilitas_hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fasilitas_kamars`
--

DROP TABLE IF EXISTS `fasilitas_kamars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fasilitas_kamars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kamar_id` bigint(20) unsigned NOT NULL,
  `nama_fasilitas_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fasilitas_kamars_kamar_id_foreign` (`kamar_id`),
  CONSTRAINT `fasilitas_kamars_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasilitas_kamars`
--

LOCK TABLES `fasilitas_kamars` WRITE;
/*!40000 ALTER TABLE `fasilitas_kamars` DISABLE KEYS */;
INSERT INTO `fasilitas_kamars` VALUES (1,1,'TV'),(2,1,'AC'),(3,2,'TV'),(4,2,'AC'),(5,2,'Telepon'),(7,1,'WIFI'),(8,3,'WIFI'),(9,3,'TV'),(11,3,'SOFA'),(14,2,'WIFI'),(15,3,'DAPUR'),(16,3,'RUANG TAMU'),(17,1,'KULKAS'),(18,1,'Kopi & Teh'),(20,1,'SOFA');
/*!40000 ALTER TABLE `fasilitas_kamars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kamars`
--

DROP TABLE IF EXISTS `kamars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kamars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_kamar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jum_kamar` int(11) NOT NULL,
  `harga_kamar` int(11) DEFAULT NULL,
  `deskripsi_kamar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kamars`
--

LOCK TABLES `kamars` WRITE;
/*!40000 ALTER TABLE `kamars` DISABLE KEYS */;
INSERT INTO `kamars` VALUES (1,'Deluxe Room','55_1649797785.jpg',10,712647,'Deluxe room  berukuran  40 m2, mempunyai pilihan double bed atau twin bed. Desain kamarnya simple namun elegan. Balkonnya berhadapan langsung dengan pemandangan kota.'),(2,'Standard Room','236_1649852375.jpg',10,418798,'Standar room menyediakan kamar dengan harga terjangkau, dan bisa disesuaikan dengan kebutuhan dari setiap pemesan. Namun dilengkapi dengan fasilitas yang sesuai.'),(3,'Suite Room','807_1649853450.jpg',10,1301719,'Suite Room merupakan kamar dengan desain serta fasilitas paling mewah yang disediakan. Kamar yang terpisah dengan ruang tamu dan dapur, serta memiliki pemandangan paling menarik, yaitu pemandangan pantai yang memukau. Menjadikan Suite Room sebagai kamar yang cocok untuk liburan keluarga.');
/*!40000 ALTER TABLE `kamars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2022_04_01_234445_create_admins_table',1),(3,'2022_04_07_074121_create_kamars_table',1),(4,'2022_04_09_015158_create_fasilitas_kamars_table',1),(5,'2022_04_09_093639_create_fasilitas_hotels_table',1),(6,'2022_04_10_232342_create_pemesanans_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemesanans`
--

DROP TABLE IF EXISTS `pemesanans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemesanans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kamar_id` bigint(20) unsigned DEFAULT NULL,
  `tgl_checkin` date NOT NULL,
  `tgl_checkout` date NOT NULL,
  `jum_kamar_dipesan` int(11) NOT NULL,
  `nama_pemesan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_pemesan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_tamu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pesan','checkin','checkout','batal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pesan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pemesanans_kamar_id_foreign` (`kamar_id`),
  CONSTRAINT `pemesanans_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemesanans`
--

LOCK TABLES `pemesanans` WRITE;
/*!40000 ALTER TABLE `pemesanans` DISABLE KEYS */;
INSERT INTO `pemesanans` VALUES (1,2,'2022-04-16','2022-04-17',1,'Melba Deckow','pstoltenberg@gmail.com','+1-906-664-1680','Donato Lemke','pesan','2022-04-12 17:00:00','2022-04-12 17:00:00'),(2,1,'2022-04-15','2022-04-18',1,'Dr. Keon Gleason','ncarroll@gmail.com','(734) 384-6623','Amira Adams Jr.','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(3,2,'2022-04-17','2022-04-18',2,'Colton Eichmann','august00@hotmail.com','+1 (850) 699-8881','Brenden Fisher','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(4,3,'2022-04-12','2022-04-13',1,'Jan Volkman III','pattie42@hotmail.com','+1 (812) 649-6453','Rebeka Kilback','pesan','2022-04-10 17:00:00','2022-04-10 17:00:00'),(5,3,'2022-04-19','2022-04-21',2,'Presley Mosciski I','ferry.annabel@gmail.com','1-661-904-5680','Arvilla Hickle III','pesan','2022-04-16 17:00:00','2022-04-16 17:00:00'),(6,3,'2022-04-15','2022-04-18',1,'Creola Watsica','abruen@yahoo.com','+1.504.632.6428','Retta Murazik','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(7,1,'2022-04-17','2022-04-18',2,'Lucy Brakus PhD','phegmann@hotmail.com','1-323-619-7611','Javier Harvey','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(8,3,'2022-04-15','2022-04-17',1,'Houston Will IV','kelsi27@gmail.com','423-910-6271','Elda Grady','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(9,3,'2022-04-07','2022-04-09',1,'Monserrat Stehr','turcotte.gunner@hotmail.com','+1.830.799.8374','Elbert Swift IV','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(10,2,'2022-04-09','2022-04-10',1,'Mrs. Jacky Grant PhD','jovan75@yahoo.com','+12069772384','Nikko Huel V','pesan','2022-04-06 17:00:00','2022-04-06 17:00:00'),(11,2,'2022-04-05','2022-04-06',1,'Breanna Marvin V','asteuber@hotmail.com','657.776.7269','Muriel Cartwright','pesan','2022-04-01 17:00:00','2022-04-01 17:00:00'),(12,3,'2022-04-09','2022-04-10',2,'Kenyatta Swift V','rhett.ferry@hotmail.com','1-336-440-3447','Prof. Sylvester Friesen','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(13,3,'2022-04-18','2022-04-21',1,'Rudy Yundt DDS','zrunolfsdottir@gmail.com','+1-386-209-5929','Kip Hermann','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(14,3,'2022-04-07','2022-04-08',2,'Frankie Torp','giovanna49@yahoo.com','+1-707-953-8952','Mallie Schinner','pesan','2022-04-03 17:00:00','2022-04-03 17:00:00'),(15,2,'2022-04-07','2022-04-10',1,'Kelsi Yundt','murray.koelpin@yahoo.com','463-961-9016','Dr. Hosea Morar','pesan','2022-04-03 17:00:00','2022-04-03 17:00:00'),(16,1,'2022-04-16','2022-04-18',2,'Hazel Parker','kihn.sadye@gmail.com','678-520-7645','Terrill Bernier MD','pesan','2022-04-12 17:00:00','2022-04-12 17:00:00'),(17,1,'2022-04-16','2022-04-17',2,'Ms. Rosemarie Jacobi Sr.','leo17@yahoo.com','+1-323-510-7926','Rosella Wiza','pesan','2022-04-12 17:00:00','2022-04-12 17:00:00'),(18,1,'2022-04-12','2022-04-13',2,'Virgie Berge Sr.','wyman.bradley@yahoo.com','+15418630259','Alberto Marks','pesan','2022-04-09 17:00:00','2022-04-09 17:00:00'),(19,1,'2022-04-16','2022-04-17',2,'Ms. Savanah Murazik DDS','schamberger.nathaniel@yahoo.com','(713) 266-8186','Dr. Alfonso Gerhold','pesan','2022-04-12 17:00:00','2022-04-12 17:00:00'),(20,3,'2022-04-13','2022-04-14',1,'Ms. Rosetta Bruen I','franecki.shanon@hotmail.com','+1-915-498-3597','Prof. Craig Keeling V','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(21,1,'2022-04-09','2022-04-12',1,'Giovanni Ortiz DDS','amya60@gmail.com','+1-763-232-6051','Dean Ryan DVM','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(22,1,'2022-04-18','2022-04-21',2,'Stuart Homenick','caesar.considine@hotmail.com','+1-562-664-7968','Mr. Muhammad Pollich V','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(23,1,'2022-04-15','2022-04-16',2,'Nia Prohaska','eddie.davis@hotmail.com','+1.747.823.5615','Ismael Kirlin','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(24,1,'2022-04-17','2022-04-18',1,'Camille Doyle','lucious74@yahoo.com','212.685.4316','Osborne Schmidt','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(25,3,'2022-04-12','2022-04-15',1,'Jorge Trantow','beier.felton@yahoo.com','854-359-7707','Bill Vandervort','pesan','2022-04-10 17:00:00','2022-04-10 17:00:00'),(26,3,'2022-04-14','2022-04-17',1,'Ms. Guadalupe Predovic','oreichert@hotmail.com','+1.231.677.9122','Moriah Upton','pesan','2022-04-12 17:00:00','2022-04-12 17:00:00'),(27,2,'2022-04-11','2022-04-13',1,'Annamarie Hauck','orn.naomi@yahoo.com','615-715-2510','Ruby Satterfield','pesan','2022-04-07 17:00:00','2022-04-07 17:00:00'),(28,3,'2022-04-10','2022-04-13',2,'Mr. Merle Rippin III','bailey.grady@gmail.com','929-215-2244','Erin Marvin','pesan','2022-04-08 17:00:00','2022-04-08 17:00:00'),(29,1,'2022-04-19','2022-04-22',2,'Nils Daugherty','gerald49@hotmail.com','+1-630-717-6866','Stacey Murray','pesan','2022-04-17 17:00:00','2022-04-17 17:00:00'),(30,1,'2022-04-06','2022-04-09',2,'Oma Cremin I','gertrude71@gmail.com','321-709-5448','Vidal Rippin','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(31,3,'2022-04-10','2022-04-11',2,'Flossie Mosciski','nzieme@hotmail.com','+1-301-773-7074','Kasey Grimes','pesan','2022-04-07 17:00:00','2022-04-07 17:00:00'),(32,1,'2022-04-17','2022-04-20',1,'Hortense Marvin','hleffler@hotmail.com','(423) 755-4114','Emmitt Green DDS','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(33,2,'2022-04-17','2022-04-18',2,'Peyton Schroeder DVM','rkirlin@hotmail.com','1-757-490-9092','Mr. Malachi Doyle V','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(34,1,'2022-04-15','2022-04-18',2,'Joany Buckridge','darion.ullrich@yahoo.com','606.650.4315','Prof. Allison Kreiger Sr.','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(35,1,'2022-04-09','2022-04-10',2,'Aglae Boyle','dolly.macejkovic@yahoo.com','+1 (214) 493-0853','Dr. Torrey Blanda II','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(36,2,'2022-04-15','2022-04-16',1,'Ines Bednar','jasmin.dibbert@hotmail.com','564-542-7304','Dixie Hackett','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(37,3,'2022-04-08','2022-04-09',2,'Alivia Jacobi','qbednar@yahoo.com','458.329.8451','Darion Lubowitz','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(38,2,'2022-04-13','2022-04-15',2,'Miss Isobel O\'Hara IV','schumm.dan@gmail.com','1-954-421-8162','Brice Roob III','pesan','2022-04-09 17:00:00','2022-04-09 17:00:00'),(39,3,'2022-04-18','2022-04-21',2,'Olaf Wilderman','jskiles@yahoo.com','+1 (352) 250-7666','Stefan Prosacco IV','pesan','2022-04-15 17:00:00','2022-04-15 17:00:00'),(40,2,'2022-04-17','2022-04-19',2,'Nelson Considine','mose50@yahoo.com','971.924.2016','Mr. Nicholas Kozey','pesan','2022-04-15 17:00:00','2022-04-15 17:00:00'),(41,2,'2022-04-17','2022-04-19',1,'Dr. Damion Fisher','camryn65@yahoo.com','(216) 598-0826','Russel Wehner','pesan','2022-04-15 17:00:00','2022-04-15 17:00:00'),(42,2,'2022-04-07','2022-04-08',2,'Halie Ullrich','imonahan@hotmail.com','1-734-295-1404','Karli Schmeler III','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(43,1,'2022-04-09','2022-04-11',2,'Mrs. Makayla Zulauf','whodkiewicz@gmail.com','864.716.4458','Eric Lubowitz','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(44,2,'2022-04-18','2022-04-20',1,'Marina Kassulke','schroeder.lucy@gmail.com','1-201-402-9696','Jovanny Greenfelder','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(45,1,'2022-04-13','2022-04-14',1,'Dr. Darwin Brown','harvey64@hotmail.com','(209) 752-6834','Prof. Kenyatta Erdman','pesan','2022-04-09 17:00:00','2022-04-09 17:00:00'),(46,1,'2022-04-13','2022-04-14',1,'Veda Hermann','miller.may@hotmail.com','626.613.9441','Miss Antonia McCullough III','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(47,2,'2022-04-12','2022-04-15',2,'Hosea Bartell','howe.jarod@gmail.com','1-541-270-8135','Dr. Scotty Wyman Jr.','pesan','2022-04-08 17:00:00','2022-04-08 17:00:00'),(48,2,'2022-04-09','2022-04-10',1,'Larissa Volkman','peyton35@yahoo.com','+1-769-598-9267','Mr. Davion Reinger','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(49,3,'2022-04-06','2022-04-09',1,'Prof. Jessika Batz','victor60@hotmail.com','1-667-772-1173','Pearlie Wiegand','pesan','2022-04-02 17:00:00','2022-04-02 17:00:00'),(50,3,'2022-04-09','2022-04-11',2,'Miss Mariam Breitenberg','phyatt@hotmail.com','1-612-677-0281','Dorothy Von Sr.','pesan','2022-04-06 17:00:00','2022-04-06 17:00:00'),(51,1,'2022-04-18','2022-04-21',1,'Ms. Anya Stracke Sr.','murazik.braulio@hotmail.com','(808) 705-2745','Dr. Maximus Bergnaum PhD','pesan','2022-04-16 17:00:00','2022-04-16 17:00:00'),(52,3,'2022-04-06','2022-04-07',2,'Danny Schultz','kris.elody@gmail.com','+1.458.940.8577','Houston Hammes','pesan','2022-04-02 17:00:00','2022-04-02 17:00:00'),(53,1,'2022-04-16','2022-04-18',1,'Mr. Vince Monahan','hand.bernice@gmail.com','+1-574-643-0590','Prof. Ima Marvin','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(54,3,'2022-04-09','2022-04-10',2,'Prof. Lilyan Bartoletti','fabiola96@gmail.com','575-992-4606','Samson Steuber','pesan','2022-04-07 17:00:00','2022-04-07 17:00:00'),(55,3,'2022-04-16','2022-04-19',1,'Monty Walsh','ostark@yahoo.com','+1-773-938-9037','Mina Metz','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(56,2,'2022-04-07','2022-04-10',2,'Rowan Bayer','tharber@yahoo.com','1-820-392-7960','Lowell O\'Kon','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(57,3,'2022-04-08','2022-04-11',2,'Prof. Javon Treutel MD','tschimmel@gmail.com','+17345808548','Rogers Gleason','pesan','2022-04-06 17:00:00','2022-04-06 17:00:00'),(58,3,'2022-04-13','2022-04-14',1,'Juliana Streich','cremin.levi@gmail.com','+1-458-951-1877','Ebba Cormier','pesan','2022-04-09 17:00:00','2022-04-09 17:00:00'),(59,1,'2022-04-16','2022-04-18',1,'Winston Toy','rblanda@gmail.com','+1.781.384.5968','Forrest Stiedemann','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(60,2,'2022-04-06','2022-04-09',2,'Wendell Pacocha','rollin.beier@hotmail.com','+1 (517) 480-1483','Nathen Koepp','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(61,2,'2022-04-17','2022-04-19',1,'Dolly Halvorson','cale69@gmail.com','+1 (479) 749-9152','Delaney Osinski','pesan','2022-04-15 17:00:00','2022-04-15 17:00:00'),(62,2,'2022-04-13','2022-04-16',2,'Rachel Hintz','eblanda@yahoo.com','(740) 592-8545','Prof. Dameon Gleason','pesan','2022-04-09 17:00:00','2022-04-09 17:00:00'),(63,2,'2022-04-12','2022-04-15',2,'Ayla Flatley','brandyn33@yahoo.com','1-424-710-9538','Bartholome Leuschke','pesan','2022-04-08 17:00:00','2022-04-08 17:00:00'),(64,1,'2022-04-17','2022-04-19',2,'Annamae Langworth','sabrina82@yahoo.com','646.592.7149','Philip Eichmann','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(65,2,'2022-04-09','2022-04-11',1,'Larue Streich','bmcdermott@hotmail.com','(415) 861-2017','Edwin Jacobson','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(66,2,'2022-04-11','2022-04-12',2,'Lon Towne','kerluke.wilburn@yahoo.com','1-415-560-8444','Itzel Satterfield','pesan','2022-04-07 17:00:00','2022-04-07 17:00:00'),(67,1,'2022-04-15','2022-04-18',2,'Aliza Stoltenberg','johnnie.roob@gmail.com','1-865-573-1271','Lilly Shields','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(68,2,'2022-04-10','2022-04-12',1,'Prof. Delta Walter II','simeon79@gmail.com','+19384224236','Robyn Dach','pesan','2022-04-06 17:00:00','2022-04-06 17:00:00'),(69,2,'2022-04-11','2022-04-14',1,'Alexanne Quitzon','domenick.medhurst@yahoo.com','470-789-6938','Demario Pollich','pesan','2022-04-08 17:00:00','2022-04-08 17:00:00'),(70,3,'2022-04-15','2022-04-16',2,'Samir Krajcik','kayley.walsh@gmail.com','727-793-5118','Zena Hermiston','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(71,3,'2022-04-07','2022-04-09',1,'Roberta Shanahan','nolan.bradford@hotmail.com','+1-269-330-8960','Aisha Bradtke','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(72,3,'2022-04-15','2022-04-18',1,'Alexandro Bechtelar IV','tstamm@yahoo.com','+1 (361) 256-8194','Prof. Kavon Waelchi DDS','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(73,2,'2022-04-05','2022-04-07',1,'Dayana Marks III','sadams@hotmail.com','1-626-940-1162','Kasey Kling','pesan','2022-04-03 17:00:00','2022-04-03 17:00:00'),(74,3,'2022-04-15','2022-04-16',2,'Jessie Rice','elias64@gmail.com','567-484-0817','Dr. Alexandro Schimmel','pesan','2022-04-12 17:00:00','2022-04-12 17:00:00'),(75,2,'2022-04-12','2022-04-15',2,'Nova Lebsack','viva04@gmail.com','463.604.5777','Stone Simonis','pesan','2022-04-08 17:00:00','2022-04-08 17:00:00'),(76,3,'2022-04-17','2022-04-20',2,'Keely Reinger','ross.rosenbaum@gmail.com','+1.484.853.2342','Cara White','pesan','2022-04-15 17:00:00','2022-04-15 17:00:00'),(77,2,'2022-04-19','2022-04-21',2,'Brett Lesch','bridgette19@hotmail.com','510.291.6229','Jannie Becker','pesan','2022-04-16 17:00:00','2022-04-16 17:00:00'),(78,1,'2022-04-15','2022-04-18',2,'Prof. Zachary Pfeffer PhD','xhilpert@hotmail.com','1-859-686-3041','Mr. Walter Bechtelar','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(79,3,'2022-04-07','2022-04-08',1,'Orrin Bailey','reilly.kenny@yahoo.com','(252) 858-0044','Clyde Kunde','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(80,3,'2022-04-08','2022-04-09',1,'Ari Wisozk','belle.lesch@hotmail.com','828-431-0604','Bobby Ziemann','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(81,2,'2022-04-06','2022-04-07',2,'Trudie Baumbach','rlynch@hotmail.com','1-240-872-9035','Tamia Little','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(82,2,'2022-04-13','2022-04-15',1,'Jenifer Schamberger III','julio24@yahoo.com','+17434905288','Adrien Gerlach','pesan','2022-04-09 17:00:00','2022-04-09 17:00:00'),(83,3,'2022-04-13','2022-04-16',2,'Dr. Gregorio Borer','rogahn.lenna@hotmail.com','+1-267-431-3060','Kyle Lueilwitz','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(84,1,'2022-04-19','2022-04-20',1,'Mrs. Haylie Prohaska V','white.fabiola@hotmail.com','(984) 418-2629','Micheal Brekke','pesan','2022-04-17 17:00:00','2022-04-17 17:00:00'),(85,3,'2022-04-17','2022-04-18',2,'Aniyah Barton I','tcarter@yahoo.com','386.815.6544','Annabell Lemke','pesan','2022-04-13 17:00:00','2022-04-13 17:00:00'),(86,2,'2022-04-16','2022-04-19',2,'Breana Beahan','shill@hotmail.com','718-466-9627','Prof. Maia Bins','pesan','2022-04-12 17:00:00','2022-04-12 17:00:00'),(87,2,'2022-04-17','2022-04-18',2,'Mrs. Ottilie Larkin','kian.larson@gmail.com','(458) 423-8743','Edgardo Kulas','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(88,3,'2022-04-06','2022-04-09',1,'Gail Nienow','lstoltenberg@hotmail.com','779.575.4256','Katelyn Rutherford III','pesan','2022-04-03 17:00:00','2022-04-03 17:00:00'),(89,1,'2022-04-15','2022-04-17',2,'Vella Keebler','hickle.adrian@hotmail.com','+1 (605) 791-7261','Amiya Bogisich','pesan','2022-04-12 17:00:00','2022-04-12 17:00:00'),(90,3,'2022-04-14','2022-04-16',2,'Dr. Caleb Hudson Sr.','marquardt.ubaldo@yahoo.com','+1.740.419.9572','Prof. Alisa Heaney','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(91,1,'2022-04-07','2022-04-09',1,'Lamont Crist','sprohaska@yahoo.com','+15863991401','Prof. Elliott Grant','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(92,3,'2022-04-07','2022-04-08',1,'Roxane Stamm','reanna.hansen@hotmail.com','+1-925-658-8564','Myrna Kutch','pesan','2022-04-05 17:00:00','2022-04-05 17:00:00'),(93,3,'2022-04-15','2022-04-18',1,'Dr. Kenna Hansen V','gusikowski.maxwell@yahoo.com','(458) 646-5953','Dr. Jaycee Bins PhD','pesan','2022-04-11 17:00:00','2022-04-11 17:00:00'),(94,2,'2022-04-09','2022-04-11',2,'Miller Wilkinson','jeromy.upton@hotmail.com','+1-541-790-6121','Landen Dach','pesan','2022-04-07 17:00:00','2022-04-07 17:00:00'),(95,1,'2022-04-12','2022-04-15',2,'Octavia Fay','stella.wolf@hotmail.com','(682) 958-3886','Prof. Nya Hilpert','pesan','2022-04-08 17:00:00','2022-04-08 17:00:00'),(96,3,'2022-04-13','2022-04-15',2,'Harmony Koepp','vjacobson@gmail.com','+1.806.321.8949','Ismael Johnson','pesan','2022-04-10 17:00:00','2022-04-10 17:00:00'),(97,3,'2022-04-06','2022-04-07',2,'Mrs. Alene Homenick','corkery.arnoldo@hotmail.com','667-569-5322','Wilmer Yost Sr.','pesan','2022-04-04 17:00:00','2022-04-04 17:00:00'),(98,3,'2022-04-07','2022-04-09',2,'Myles Gibson DDS','nicolas.carolyne@yahoo.com','(779) 208-8337','Maybell Eichmann IV','pesan','2022-04-03 17:00:00','2022-04-03 17:00:00'),(99,3,'2022-04-17','2022-04-18',2,'Mr. Cory White PhD','tcole@hotmail.com','(520) 512-1806','Mr. Zion Murphy DDS','pesan','2022-04-14 17:00:00','2022-04-14 17:00:00'),(100,2,'2022-04-12','2022-04-14',2,'Braeden Gerhold','hope.krajcik@yahoo.com','786-468-6863','Mr. Marcellus Osinski','pesan','2022-04-09 17:00:00','2022-04-09 17:00:00'),(101,1,'2022-04-14','2022-04-15',2,'Annisa','annisa@gmail.com','09826492849','Annisa','pesan','2022-04-13 01:49:14','2022-04-13 01:49:14'),(102,1,'2022-04-16','2022-04-17',2,'Putri','putri27@gmail.com','0836282929','Putri','pesan','2022-04-13 02:41:25','2022-04-13 02:41:25'),(103,1,'2022-04-15','2022-04-22',2,'Annisa','yanisumaryani870@gmail.com','09826492849','Annisa','pesan','2022-04-13 22:03:01','2022-04-13 22:03:01');
/*!40000 ALTER TABLE `pemesanans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15 20:24:37
