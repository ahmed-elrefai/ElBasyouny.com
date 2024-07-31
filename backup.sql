-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: elreyodev.mysql.pythonanywhere-services.com    Database: elreyodev$mysqldb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add customer',8,'add_customer'),(30,'Can change customer',8,'change_customer'),(31,'Can delete customer',8,'delete_customer'),(32,'Can view customer',8,'view_customer'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add order',10,'add_order'),(38,'Can change order',10,'change_order'),(39,'Can delete order',10,'delete_order'),(40,'Can view order',10,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$7MGL5j53SfQgnOTeGWBI3q$PbFFNXfYL3+dndr+eoxl00Ly153lFsORG0dKJguLa5Y=','2024-07-19 19:58:28.386225',1,'elbasyounyadmin2024','','','',1,1,'2024-07-19 19:56:42.293358');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-07-19 19:59:23.516234','1','البان',1,'[{\"added\": {}}]',7,1),(2,'2024-07-19 19:59:28.138922','2','بقالة',1,'[{\"added\": {}}]',7,1),(3,'2024-07-19 19:59:37.569868','3','حلويات',1,'[{\"added\": {}}]',7,1),(4,'2024-07-19 20:01:05.546336','1','رز بلبن',1,'[{\"added\": {}}]',9,1),(5,'2024-07-19 20:02:46.873841','2','لبن لمار',1,'[{\"added\": {}}]',9,1),(6,'2024-07-19 20:03:52.831093','3','ثمن جبنة رومي',1,'[{\"added\": {}}]',9,1),(7,'2024-07-19 20:11:34.560064','3','ثمن جبنة رومي',2,'[{\"changed\": {\"fields\": [\"Img\"]}}]',9,1),(8,'2024-07-19 20:11:53.163277','2','لبن لمار',2,'[{\"changed\": {\"fields\": [\"Img\"]}}]',9,1),(9,'2024-07-19 20:12:10.563031','1','رز بلبن',2,'[{\"changed\": {\"fields\": [\"Img\"]}}]',9,1),(10,'2024-07-20 15:58:26.694275','4','زبادي البسيوني كبير',1,'[{\"added\": {}}]',9,1),(11,'2024-07-20 15:59:10.651548','5','شبسي تايجر بالخل',1,'[{\"added\": {}}]',9,1),(12,'2024-07-20 15:59:37.935269','6','بيج شيبس',1,'[{\"added\": {}}]',9,1),(13,'2024-07-26 15:31:11.790363','7','زبادي بلدي صغير',1,'[{\"added\": {}}]',9,1),(14,'2024-07-26 15:32:20.690273','6','بيج شيبس',3,'',9,1),(15,'2024-07-26 15:32:20.696439','5','شبسي تايجر بالخل',3,'',9,1),(16,'2024-07-26 15:32:20.702255','4','زبادي البسيوني كبير',3,'',9,1),(17,'2024-07-26 15:32:20.709637','3','ثمن جبنة رومي',3,'',9,1),(18,'2024-07-26 15:32:20.723516','2','لبن لمار',3,'',9,1),(19,'2024-07-26 15:32:20.728907','1','رز بلبن',3,'',9,1),(20,'2024-07-26 15:41:45.595237','8','مولتن كيك نوتيلا',1,'[{\"added\": {}}]',9,1),(21,'2024-07-26 18:05:31.271208','9','مهلبية بالجيلي',1,'[{\"added\": {}}]',9,1),(22,'2024-07-26 18:05:53.092435','9','مهلبية بالجيلي',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',9,1),(23,'2024-07-26 18:06:36.928019','10','مهلبية سادة',1,'[{\"added\": {}}]',9,1),(24,'2024-07-26 18:08:09.159214','11','جيلي سادة',1,'[{\"added\": {}}]',9,1),(25,'2024-07-26 18:08:43.974175','12','كاستر',1,'[{\"added\": {}}]',9,1),(26,'2024-07-26 18:09:17.081568','13','كريم كرميل',1,'[{\"added\": {}}]',9,1),(27,'2024-07-26 18:10:14.702221','14','رز بلبن مكسرات',1,'[{\"added\": {}}]',9,1),(28,'2024-07-26 18:10:54.408509','15','رز بلبن لوتس',1,'[{\"added\": {}}]',9,1),(29,'2024-07-26 18:11:18.085761','16','ام علي',1,'[{\"added\": {}}]',9,1),(30,'2024-07-26 18:12:18.273217','17','رز بلبن فرن',1,'[{\"added\": {}}]',9,1),(31,'2024-07-26 18:13:22.073674','18','ديسباسيتو لوتس',1,'[{\"added\": {}}]',9,1),(32,'2024-07-26 18:14:01.808905','19','دسباسيتو مانجو كنافة',1,'[{\"added\": {}}]',9,1),(33,'2024-07-26 18:15:05.471497','20','قشطوطة كبيرة',1,'[{\"added\": {}}]',9,1),(34,'2024-07-26 18:16:37.365046','21','قشطوطة صغيرة',1,'[{\"added\": {}}]',9,1),(35,'2024-07-26 18:17:11.090339','22','براونيز',1,'[{\"added\": {}}]',9,1),(36,'2024-07-26 18:19:23.409737','23','تشيز كيك \\ فادج',1,'[{\"added\": {}}]',9,1),(37,'2024-07-26 18:21:07.117731','24','كاب كيك شوكولاته',1,'[{\"added\": {}}]',9,1),(38,'2024-07-26 18:22:24.602446','25','كاب كيك فراولة',1,'[{\"added\": {}}]',9,1),(39,'2024-07-26 18:23:30.683575','26','كنافة بالمانجو صغيرة',1,'[{\"added\": {}}]',9,1),(40,'2024-07-26 18:24:17.570987','27','طاجن نوتيلا',1,'[{\"added\": {}}]',9,1),(41,'2024-07-26 18:25:17.811874','28','رز بلبن سادة',1,'[{\"added\": {}}]',9,1),(42,'2024-07-26 18:26:14.770321','29','لبن \\ حليب البسيوني',1,'[{\"added\": {}}]',9,1),(43,'2024-07-26 18:27:10.784712','30','زبادي بلدي جامبو',1,'[{\"added\": {}}]',9,1),(44,'2024-07-26 18:27:46.777643','31','مولتن كيك وايت',1,'[{\"added\": {}}]',9,1),(45,'2024-07-26 18:29:46.891591','29','لبن البسيوني 1ك',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'store','category'),(8,'store','customer'),(10,'store','order'),(9,'store','product');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-07-18 20:21:50.776853'),(2,'auth','0001_initial','2024-07-18 20:21:51.482269'),(3,'admin','0001_initial','2024-07-18 20:21:51.752328'),(4,'admin','0002_logentry_remove_auto_add','2024-07-18 20:21:51.800048'),(5,'admin','0003_logentry_add_action_flag_choices','2024-07-18 20:21:51.904562'),(6,'contenttypes','0002_remove_content_type_name','2024-07-18 20:21:52.232739'),(7,'auth','0002_alter_permission_name_max_length','2024-07-18 20:21:52.451429'),(8,'auth','0003_alter_user_email_max_length','2024-07-18 20:21:52.565428'),(9,'auth','0004_alter_user_username_opts','2024-07-18 20:21:52.704361'),(10,'auth','0005_alter_user_last_login_null','2024-07-18 20:21:52.955001'),(11,'auth','0006_require_contenttypes_0002','2024-07-18 20:21:52.961772'),(12,'auth','0007_alter_validators_add_error_messages','2024-07-18 20:21:53.200185'),(13,'auth','0008_alter_user_username_max_length','2024-07-18 20:21:53.416141'),(14,'auth','0009_alter_user_last_name_max_length','2024-07-18 20:21:53.608709'),(15,'auth','0010_alter_group_name_max_length','2024-07-18 20:21:53.751294'),(16,'auth','0011_update_proxy_permissions','2024-07-18 20:21:53.902249'),(17,'auth','0012_alter_user_first_name_max_length','2024-07-18 20:21:54.151635'),(18,'sessions','0001_initial','2024-07-18 20:21:54.198971'),(19,'store','0001_initial','2024-07-18 20:21:54.552997'),(20,'store','0002_rename_img_product_img_url','2024-07-18 20:21:54.581730'),(21,'store','0003_alter_category_options_rename_img_url_product_img','2024-07-18 20:21:54.701940'),(22,'store','0004_alter_customer_phone','2024-07-18 20:21:54.804271');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0okwwfqd7yv9j3u9zfsz0i1lyy4nskrl','.eJx9jtEKgjAUhl9F_usx3VoWe5YglooYU9fcLkL27rlJlIHd_BzO4Tv_N6NS1kHO4DEeXg2uc09IRmBsVzWQgtOCoOtbSHijR1VPubFj7Ss35Vr1ytK7aVoQLKReAFx8UQoRk5_TXGaflTimwynmgS3U5G9udEqvTYGA7Zmwfybrv5T8-tW98aBm-BV9M9kes1GMCiGEFwg6XW4:1sVCqM:mUeVa17GpJK1lDQm9icKG5EPaW-rwufcZjUS_8JfyVY','2024-08-03 16:21:58.534122'),('3yxd5arg8n4urt6jwrxweg9ccey7r8zg','eyJjYXJ0Ijp7fX0:1sVbMl:PG5QUy1aHakRzIU-w0NujyP0GyRFPcxcxewNiOzUcsY','2024-08-04 18:33:03.169872'),('4qpxwst2wgjxu7rmmt952l09dh4m7z3j','.eJx9jrsOwyAMRX-l8ozywkpbviULJWlERQsFM1RR_r1ABjp1OcP18bU3UNITiA0w4x3lizR9QPQMnNdqAXFtOgb6uYKA6IyVc2idt3NUFNopdiMfModL4bnwnomyebhlBQap0aQi-G-faoRYJc6PcWFJcPxZQF7VQ-J9OhnijSxJU97f9_0LC_hE_A:1sVGjX:7-0GBoZJdiInr5MriS2JUR-T1mSvfAVfc-sbxd9w4B4','2024-08-03 20:31:11.473231'),('7hlpwdclz3czzld7qaepojxma7zip1s5','.eJxFjsEKwyAMQH9l5CytW6UMj9tvDEpmh3O4aTUeRvHfq22hl8cjJI_MoDAQyBn6iinhjwz9QZ4Z-GDUqxhvOAPz1SAheetwjK0PbkyKYvtIvO9E5eW6elcpcLgZPdzfxsfm4zUwKFVbYnCsClxdnY7GPtpL5SqmJzlCu32Rc14AAyw2Kg:1sWwIe:D0QHIwbknjEgc9tfY-b4bRhjw2KIg3WbIEjn9qZlYTY','2024-08-08 11:06:20.421040'),('878qyy38fdex1r1kimawlur12295ndc0','.eJxFjcsOwiAURH_FzJr0gVgN3-LmSpsGQwXhsjAN_y7UhZuTyUxOZoehyNA7ZMM704stf6BHgRCtWaCV7AYBu63QyMF5mlMfop-z4dQ72ih2z7CsEKimqwLueZiUapS3I0-nf6Uux3BtPI_VSvnBnsn9nkopX5THLa0:1sXG8Y:UmgrvjtLzY_CCXhdM1bPv_jrdcFMRqwn0SGBa6Y8hH4','2024-08-09 08:17:14.748333'),('90b09t174gptpjikpdtnuyexvd1dx2oi','eyJjYXJ0Ijp7fX0:1sVCql:CeApupvzW72xT5KqcuCMpfQStWshNGdNgF3Ok_LFoIs','2024-08-03 16:22:23.553201'),('ao0nu8d5v1w1vqzz6azc74mwarswvifo','eyJjYXJ0Ijp7fX0:1sVD5I:XUFOzXPD23HlXYY91Spzl1CHf5Iz9DJaitZnYrY3hKE','2024-08-03 16:37:24.014704'),('b0b07a9bfcrf6uncpjvwthhul92qcllb','eyJjYXJ0Ijp7fX0:1sVE5K:pvzB99JFPD28nCyZln3YS0Q5HIc4gF7mM-8iLkyI2FM','2024-08-03 17:41:30.756701'),('bt50mwqipk4sfrqdkuym62j2ypo85sbq','.eJx1jEEOwiAURK9iZk0oYCWGs5gYpKYhwYLwWZiGuwuuunHzZhbzZoezmWB2yIF3tRt5-sBcGFL27gkjFRcM_rXCoKYQ7VKmlONSHZXpVoU-yx_VfYS6Ds7zoWuethUM_Tj0Pxyd0z-n70t9UCQbYLTgorX2BfL6M7U:1sVDyO:XpHcofwqPZZcfurrMBM9C9McsQhJicXKMSNzR31fHec','2024-08-03 17:34:20.467249'),('c93mtcql76pvn2c0vo9ijc3ajef5a3e5','eyJjYXJ0Ijp7fX0:1sXG3I:fQ7BviaD1HlZxiUI77Q_vq_w7e2nRasI-fwxLG4r6Ps','2024-08-09 08:11:48.580911'),('cj9hznwbjhpnrw6mjfjazxvbfmvmy0da','eyJjYXJ0Ijp7fX0:1sX4oD:4RbGlQnEykW1_WV__OuV-Rr4zTFfd8bHN3gmzSxOyP8','2024-08-08 20:11:29.055762'),('csvfmzphrogg08lyo3hbbq8rly8f1nnn','.eJx9jrsOwyAMRX-l8ozywkpbviULJWlERQsFM1RR_r1ABjp1OcP18bU3UNITiA0w4x3lizR9QPQMnNdqAXFtOgb6uYKA6IyVc2idt3NUFNopdiMfModL4bnwnomyebhlBQap0aQi-G-faoRYJc6PcWFJcPxZQF7VQ-J9OhnijSxJU97f9_0LC_hE_A:1sXG4O:7eSKG1ZvujB4-yO1s4P_LRfS-MpYy25BnLG1YGuhfew','2024-08-09 08:12:56.009519'),('dj0oxxfp5pws5bog371z0j3kvp803d66','eyJjYXJ0Ijp7fX0:1sX1hi:-NX4tGb-S1ym_2tC0BTwsOVJJzrGNfecPRnpjXBoOl8','2024-08-08 16:52:34.604672'),('et1km7bfj2b7k2e22voz528savn4ewtk','.eJxFjcsOwiAURH_FzJr0gVgN3-LmSpsGQwXhsjAN_y7UhZuTyUxOZoehyNA7ZMM704stf6BHgRCtWaCV7AYBu63QyMF5mlMfop-z4dQ72ih2z7CsEKimqwLueZiUapS3I0-nf6Uux3BtPI_VSvnBnsn9nkopX5THLa0:1sXG4O:-8a_j5XeBdSAlWuN437gxJsFtBKQi6ssQGpVOUu-W3o','2024-08-09 08:12:56.030983'),('f5ormhyqrw1bf65vmw6eodyzydl7b7b0','eyJjYXJ0Ijp7fX0:1sUYWc:GINquIUR0yJMsCd4JywOMvtWAYNHuO6fmA28lny5xpc','2024-08-01 21:18:54.703130'),('hg80egyypiook92sjtve4yu9eo3sraks','eyJjYXJ0Ijp7fX0:1sVCIg:da4mFGe-o95EYr3zlgLHX2BcGb1GH8JWn83ICG9-LKI','2024-08-03 15:47:10.635217'),('htdrtafca8ff4jojhw9bcvoryh0d7kev','eyJjYXJ0Ijp7fX0:1sXG7o:PfSTry1_XSsPY17MfwX5uC5ZZmXcOFDvnkiObijay4s','2024-08-09 08:16:28.242945'),('i36vu3s96p969dcsyuyjkmt4tt9iut5s','.eJx9jrsOwyAMRX-l8ozywkpbviULJWlERQsFM1RR_r1ABjp1OcP18bU3UNITiA0w4x3lizR9QPQMnNdqAXFtOgb6uYKA6IyVc2idt3NUFNopdiMfModL4bnwnomyebhlBQap0aQi-G-faoRYJc6PcWFJcPxZQF7VQ-J9OhnijSxJU97f9_0LC_hE_A:1sXG8Y:sFy4RjAGIiXPC-7-AEBNis2-EDHfosH7IHYeaIXuI8g','2024-08-09 08:17:14.587624'),('k091ct2sebrr9brf6s6pb5ox5h15fac2','eyJjYXJ0Ijp7fX0:1sUXgb:zBz-YHx-VjQjE7_LLADCX8MOtX8iQuEua_Rlb_gS4tw','2024-08-01 20:25:09.170827'),('k3ari1eu079jkre3fmv7whx8vzvmd5ya','.eJx9jrsOwyAMRX-l8ozywkpbviULJWlERQsFM1RR_r1ABjp1OcP18bU3UNITiA0w4x3lizR9QPQMnNdqAXFtOgb6uYKA6IyVc2idt3NUFNopdiMfModL4bnwnomyebhlBQap0aQi-G-faoRYJc6PcWFJcPxZQF7VQ-J9OhnijSxJU97f9_0LC_hE_A:1sVCe7:A7Iuy5Q7019SjJBNYzsAkWR81oYZL9d6_fF3ysSGoJA','2024-08-03 16:09:19.865827'),('kcki7iuf26icxquv0uj1cvs6p6spk6ib','.eJxVjDEOgzAQBP9ydWSdjY05yvS8AZ3tcyCJQMJQIf6eINHQ7szsDpGXFdr9eEDP2zr0W5GlHxO0oOG2BY4fmU6Q3jy9ZhXnaV3GoE5FXbSobk7yfV7u7WDgMvxrm4wV8kR11o1Ejh456ISNY8yIPhhjjWW2qTbEKLlyUZOhKgfKKA6OHyYWOxQ:1sXPhX:K0iPXHW3P8M9tuHdFzGN2ORyqaBorU8H1vWgMzGiF_g','2024-08-09 18:29:59.118260'),('ljxsg56wpyc20unrwv77f9acyp4j1vop','eyJjYXJ0Ijp7fX0:1sVCdu:-rztOiTwz6qpjPi2XILEyQg-tL2JTs9FJxeeB-heT-M','2024-08-03 16:09:06.917969'),('m1lxticonzkpsw5sb5ofijqa507jj6px','.eJx9jtEKgjAUhl9F_usx3VoWe5YglooYU9fcLkL27rlJlIHd_BzO4Tv_N6NS1kHO4DEeXg2uc09IRmBsVzWQgtOCoOtbSHijR1VPubFj7Ss35Vr1ytK7aVoQLKReAFx8UQoRk5_TXGaflTimwynmgS3U5G9udEqvTYGA7Zmwfybrv5T8-tW98aBm-BV9M9kes1GMCiGEFwg6XW4:1sVAob:F2w40njNrtoj_Uim2AqFZx6hkcRU9XuIjoQRmFcG5_w','2024-08-03 14:12:01.313089'),('mtaxyctcexdnvh6v06ea9wgkrjbe05u4','eyJjYXJ0Ijp7fX0:1sVbMl:PG5QUy1aHakRzIU-w0NujyP0GyRFPcxcxewNiOzUcsY','2024-08-04 18:33:03.147211'),('ogqyeydlvwlfo4hox1pq5i3xptt8vm39','.eJx1jEEKwyAURK9SZi1GbUiDZykEa0oQbLT6XZTg3atdZdPNm1nMmwPWJII-IDvexezk6AN9Y4jJ2Se0VFwwuNcGjRJ9MGseYgprsZSHexHTVf6olh5q7hzHU5943DcwtGPf_nB2Lv-cts_lQYGMh55HLmqtX_RIM70:1sVoJl:1HEjui8PR7FMjf12IfLNyhTaJe1KYXqQ9kJuGYjJ3SE','2024-08-05 08:22:49.240016'),('q3lsdt3n81rcluhm63bfa5nbhnq1vumu','eyJjYXJ0Ijp7fX0:1sX1i7:APgqJvyoB21qHA1jggCbRRmqQzRLqZ0gqCsQA0cUM5o','2024-08-08 16:52:59.852329'),('rscycv4fp47ipse2meicakbx8foxjsna','eyJjYXJ0Ijp7fX0:1sVDxN:bEUGKg54S6xQZYAOOTDUtS009aK2yBFvXGiQRsxN2Mc','2024-08-03 17:33:17.848135'),('sfirjounjmgksl4umda9xuphtj1xfw48','.eJx1j80OgyAQhF_F7Bl_AMWWZ-kFsTE0tFJ-Do3h3YvrpUnj5ctkMzuzu4FWPoLcgO94J_WKJn5AUgLOG30HyYemI2CeC0hIzq5qDq3z65x0DC0bOWf1LXWCjTv7HrVGXnAiUF__TJyiPkwDUtW0ebgFCJQjbOkGXJp-LKI6K6jOQktcSFNco7LHNznnL5ggR_w:1sXG8Y:tS5XvjjsdDaqv0FiAQMLHxt71x6l_c2qzoeEoHVro94','2024-08-09 08:17:14.687481'),('tldw2nrqw6ohmsghh4h0yphmpabb74t3','.eJx1j80OgyAQhF_F7Bl_AMWWZ-kFsTE0tFJ-Do3h3YvrpUnj5ctkMzuzu4FWPoLcgO94J_WKJn5AUgLOG30HyYemI2CeC0hIzq5qDq3z65x0DC0bOWf1LXWCjTv7HrVGXnAiUF__TJyiPkwDUtW0ebgFCJQjbOkGXJp-LKI6K6jOQktcSFNco7LHNznnL5ggR_w:1sXG4O:y30RsdEnViTGclOLYm0FvzU7cHFU7RQHWxDkJXEr1BY','2024-08-09 08:12:56.072731'),('urkhvciz2eob0cyww7zjhfkahk23d2nt','.eJx9jl0KgzAQBq8i33OIZk1tyVkKJVURS9Q0Jg9FvHujpT8W2pdhyTKbmVBq56Em0IJr0L1v_Q0qZ7CuLWsoSTxjaLsGCsGaQVdjat1QhdKPqdGddvxi6wYM0TRRwDFkhZQL6bDORfJ-krt1sV-Yi2iN4ewHrw2UoIJnM4PYptArRfxLeRxcSaePzzch3PbfpU8n-eVsGknGxHm-A1icXac:1sUw5X:M-T3uQ2m7TZump9WMytvqGxaVRzvvlc1MItMfvFz-Xg','2024-08-02 22:28:31.080207'),('wytkod7r9b7e7lp5i8qi5psuor6vnipc','eyJjYXJ0Ijp7fX0:1sUYFb:2O-PBeES8nsmj1Mjkd6qN3wwrKWWGRqN_B24z2T9guo','2024-08-01 21:01:19.287150'),('x1d0piiusidangcgtu5nd1ujf0am3fmg','.eJytkckOgjAQhl-lmTNha0HDUV_DhFQgWFOlQnswhHe3WwIqcvIymUzzL186QkV7CcUIqRkPRe-SyScUSQCiZ1UDBUnDOAB2a6EAJXhH6yESfVerSg4Rpzfah1fRtBCAVnItgJOKc0LMTPd2z9F8Ipl92JmJE60a1Fl2knKXNAWQ_WqSxBtNrN8iFGObRkt7onMocXu1rKEJPgHWvNCWF07QrPDPzqNx-xurYdGs-X9ZD6wtjxcmhhUg_xe-MZo9_Mk7fbecpheC2qTM:1sVIym:V7Cy30uxbWLFmNIEBzpXZ09ONHLBb04osytN4LinKl8','2024-08-03 22:55:04.891692'),('y52mho4e1a7aynwowt4j0qxp48csappc','eyJjYXJ0Ijp7fX0:1sX4uC:k5NwnNRmXTDcjX1pDcXPPmFAHT8POgn3zMBhmzsAlrw','2024-08-08 20:17:40.178129');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_category`
--

LOCK TABLES `store_category` WRITE;
/*!40000 ALTER TABLE `store_category` DISABLE KEYS */;
INSERT INTO `store_category` VALUES (1,'البان'),(2,'بقالة'),(3,'حلويات');
/*!40000 ALTER TABLE `store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_customer`
--

DROP TABLE IF EXISTS `store_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_customer`
--

LOCK TABLES `store_customer` WRITE;
/*!40000 ALTER TABLE `store_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `customer_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_order_customer_id_13d6d43e_fk_store_customer_id` (`customer_id`),
  KEY `store_order_product_id_11796f0f_fk_store_product_id` (`product_id`),
  CONSTRAINT `store_order_customer_id_13d6d43e_fk_store_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `store_customer` (`id`),
  CONSTRAINT `store_order_product_id_11796f0f_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `img` varchar(100) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_product_category_id_574bae65_fk_store_category_id` (`category_id`),
  CONSTRAINT `store_product_category_id_574bae65_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO "store_product" VALUES (7,'زبادي بلدي صغير',7.00,NULL,'uploads/products/زبادي_بلدي_صغير.jpeg',1),(8,'مولتن كيك نوتيلا',43.00,NULL,'uploads/products/2.jpeg',3),(9,'مهلبية بالجيلي',15.00,NULL,'uploads/products/مهلبية_بالجيلي.jpeg',3),(10,'مهلبية سادة',15.00,NULL,'uploads/products/مهلبية_سادة.jpeg',3),(11,'جيلي سادة',15.00,NULL,'uploads/products/جيلي_سادة.jpeg',3),(12,'كاستر',17.00,NULL,'uploads/products/كاستر.jpeg',3),(13,'كريم كرميل',20.00,NULL,'uploads/products/كريم_كرميل.jpeg',3),(14,'رز بلبن مكسرات',30.00,NULL,'uploads/products/ارز_بلبن_بالمكسرات.jpeg',3),(15,'رز بلبن لوتس',25.00,NULL,'uploads/products/رز_بلبن_لوتس.jpeg',3),(16,'ام علي',18.00,NULL,'uploads/products/ام_علي.jpeg',3),(17,'رز بلبن فرن',17.00,NULL,'uploads/products/رز_بلبن_فرن.jpeg',3),(18,'ديسباسيتو لوتس',43.00,NULL,'uploads/products/ديسباسيتو_لوتس.jpeg',3),(19,'دسباسيتو مانجو كنافة',43.00,NULL,'uploads/products/دسباسيتو_مانجو_كنافة.jpeg',3),(20,'قشطوطة كبيرة',35.00,NULL,'uploads/products/قشطوطة_كبيرة.jpeg',3),(21,'قشطوطة صغيرة',25.00,NULL,'uploads/products/قشطوطة_صغيرة.jpeg',3),(22,'براونيز',43.00,NULL,'uploads/products/براونيز.jpeg',3),(23,'تشيز كيك \\ فادج',33.00,NULL,'uploads/products/فادج_كيك.jpeg',3),(24,'كاب كيك شوكولاته',28.00,NULL,'uploads/products/كاب_كيك_شوكولاته.jpeg',3),(25,'كاب كيك فراولة',28.00,NULL,'uploads/products/كاب_كيك_فراولة.jpeg',3),(26,'كنافة بالمانجو صغيرة',33.00,NULL,'uploads/products/كنافة_بالمانجة_صغيرة.jpeg',3),(27,'طاجن نوتيلا',43.00,NULL,'uploads/products/طاجن_نوتيلا.jpeg',3),(28,'رز بلبن سادة',13.00,NULL,'uploads/products/رز_بلبن_TACyCs9.png',3),(29,'لبن البسيوني 1ك',35.00,NULL,'uploads/products/حليب_البسيوني_1ك.jpeg',1),(30,'زبادي بلدي جامبو',9.00,NULL,'uploads/products/زبادي_بلدي_جامبو.jpeg',1),(31,'مولتن كيك وايت',43.00,NULL,'uploads/products/مولتن_كيك_وايت.jpeg',3);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-26 21:04:35
