-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ojs2-db
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB-0+deb11u1

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
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` tinyint(4) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_publication_id` (`publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL DEFAULT 0,
  `raw_citation` text DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,2,4),(8,2,5),(9,2,6),(10,2,7),(11,3,1),(12,3,2),(13,3,3),(14,4,1),(15,4,2),(16,4,3),(17,4,4),(18,4,5),(19,4,6),(20,4,7),(21,4,8),(22,4,9),(23,4,10),(24,4,11),(25,4,12),(26,5,1),(27,5,2),(28,6,1),(29,6,2),(30,6,3),(31,6,4),(32,6,5),(33,6,6),(34,6,7),(35,7,1),(36,7,2),(37,7,3),(38,7,4),(39,7,5),(40,7,6),(41,7,7);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'','name','personal','string'),(2,'','name','corporate','string'),(3,'','name','conference','string'),(4,'','description','Author','string'),(4,'','name','aut','string'),(5,'','description','Contributor','string'),(5,'','name','ctb','string'),(6,'','description','Editor','string'),(6,'','name','edt','string'),(7,'','description','Illustrator','string'),(7,'','name','ill','string'),(8,'','description','Photographer','string'),(8,'','name','pht','string'),(9,'','description','Sponsor','string'),(9,'','name','spn','string'),(10,'','description','Translator','string'),(10,'','name','trl','string'),(11,'','name','multimedia','string'),(12,'','name','still image','string'),(13,'','name','text','string'),(14,'','name','article','string'),(15,'','name','book','string'),(16,'','name','conference publication','string'),(17,'','name','issue','string'),(18,'','name','journal','string'),(19,'','name','newspaper','string'),(20,'','name','picture','string'),(21,'','name','review','string'),(22,'','name','periodical','string'),(23,'','name','series','string'),(24,'','name','thesis','string'),(25,'','name','web site','string'),(26,'','name','electronic','string'),(27,'','name','print','string'),(28,'','name','journal','string'),(29,'','name','issue','string'),(30,'','name','article','string'),(31,'','name','proceeding','string'),(32,'','name','conference','string'),(33,'','name','preprint','string'),(34,'','name','unknown','string'),(35,'','name','book','string'),(36,'','name','bookitem','string'),(37,'','name','proceeding','string'),(38,'','name','conference','string'),(39,'','name','report','string'),(40,'','name','document','string'),(41,'','name','unknown','string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (4,'mods34-genre-marcgt',0,0),(2,'mods34-name-role-roleTerms-marcrelator',0,0),(1,'mods34-name-types',0,0),(5,'mods34-physicalDescription-form-marcform',0,0),(3,'mods34-typeOfResource',0,0),(7,'openurl10-book-genres',0,0),(6,'openurl10-journal-genres',0,0);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_issue_orders`
--

LOCK TABLES `custom_issue_orders` WRITE;
/*!40000 ALTER TABLE `custom_issue_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_issue_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_section_orders`
--

DROP TABLE IF EXISTS `custom_section_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_section_orders`
--

LOCK TABLES `custom_section_orders` WRITE;
/*!40000 ALTER TABLE `custom_section_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_section_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `context_id` bigint(20) DEFAULT 0,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT 1,
  `can_edit` tinyint(4) NOT NULL DEFAULT 1,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL),(6,'USER_VALIDATE',0,1,NULL,NULL),(7,'REVIEWER_REGISTER',0,1,NULL,NULL),(8,'PUBLISH_NOTIFY',0,1,NULL,NULL),(9,'LOCKSS_EXISTING_ARCHIVE',0,1,NULL,NULL),(10,'LOCKSS_NEW_ARCHIVE',0,1,NULL,NULL),(11,'SUBMISSION_ACK',1,1,NULL,65536),(12,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536),(13,'EDITOR_ASSIGN',1,1,16,16),(14,'REVIEW_CANCEL',1,1,16,4096),(15,'REVIEW_REINSTATE',1,1,16,4096),(16,'REVIEW_REQUEST',1,1,16,4096),(17,'REVIEW_REQUEST_SUBSEQUENT',1,1,16,4096),(18,'REVIEW_REQUEST_ONECLICK',1,1,16,4096),(19,'REVIEW_REQUEST_ONECLICK_SUBSEQUENT',1,1,16,4096),(20,'REVIEW_REQUEST_ATTACHED',0,1,16,4096),(21,'REVIEW_REQUEST_ATTACHED_SUBSEQUENT',0,1,16,4096),(22,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096),(23,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(24,'REVIEW_CONFIRM',1,1,4096,16),(25,'REVIEW_DECLINE',1,1,4096,16),(26,'REVIEW_ACK',1,1,16,4096),(27,'REVIEW_REMIND',0,1,16,4096),(28,'REVIEW_REMIND_AUTO',0,1,NULL,4096),(29,'REVIEW_REMIND_ONECLICK',0,1,16,4096),(30,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(31,'EDITOR_DECISION_ACCEPT',0,1,16,65536),(32,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536),(33,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536),(34,'EDITOR_DECISION_REVISIONS',0,1,16,65536),(35,'EDITOR_DECISION_RESUBMIT',0,1,16,65536),(36,'EDITOR_DECISION_DECLINE',0,1,16,65536),(37,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536),(38,'EDITOR_RECOMMENDATION',0,1,16,16),(39,'COPYEDIT_REQUEST',1,1,16,4097),(40,'LAYOUT_REQUEST',1,1,16,4097),(41,'LAYOUT_COMPLETE',1,1,4097,16),(42,'EMAIL_LINK',0,1,1048576,NULL),(43,'SUBSCRIPTION_NOTIFY',0,1,NULL,1048576),(44,'OPEN_ACCESS_NOTIFY',0,1,NULL,1048576),(45,'SUBSCRIPTION_BEFORE_EXPIRY',0,1,NULL,1048576),(46,'SUBSCRIPTION_AFTER_EXPIRY',0,1,NULL,1048576),(47,'SUBSCRIPTION_AFTER_EXPIRY_LAST',0,1,NULL,1048576),(48,'SUBSCRIPTION_PURCHASE_INDL',0,1,NULL,2097152),(49,'SUBSCRIPTION_PURCHASE_INSTL',0,1,NULL,2097152),(50,'SUBSCRIPTION_RENEW_INDL',0,1,NULL,2097152),(51,'SUBSCRIPTION_RENEW_INSTL',0,1,NULL,2097152),(52,'CITATION_EDITOR_AUTHOR_QUERY',0,1,NULL,NULL),(53,'REVISED_VERSION_NOTIFY',0,1,NULL,16),(54,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17),(55,'ANNOUNCEMENT',0,1,16,1048576),(56,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL),(57,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL),(58,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL),(59,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('ANNOUNCEMENT','es_ES','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisite nuestro site para leer el <a href=\"{$url}\">anuncio completo</a>.','Se mandar?? este email tras la creaci??n de un nuevo anuncio.'),('ANNOUNCEMENT','pt_BR','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisite nosso site para ler o <a href=\"{$url}\"> comunicado completo </a>.','Este email ?? enviado quando um novo comunicado ?? criado.'),('CITATION_EDITOR_AUTHOR_QUERY','en_US','Citation Editing','{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n','This email allows copyeditors to request additional information about references from authors.'),('CITATION_EDITOR_AUTHOR_QUERY','es_ES','Edici??n de citas','{$authorFirstName},<br />\n<br />\nPor favor, ??podr??a usted verificar o proporcionarnos la cita adecuada para la siguiente referencia de su art??culo, {$submissionTitle}?:<br />\n<br />\n{$rawCitation}<br />\n<br />\n??Gracias!<br />\n<br />\n{$userFirstName}<br />\nCorrector/a de estilo, {$contextName}<br />\n','Este correo electr??nico permite a los correctores/as de estilo solicitar informaci??n adicional acerca de las referencias de los autores/as.'),('CITATION_EDITOR_AUTHOR_QUERY','pt_BR','Edi????o de cita????o','{$authorFirstName}, <br />\n<br />\nVoc?? poderia verificar ou fornecer a cita????o adequada para a seguinte refer??ncia do seu artigo, {$submitTitle}: <br />\n<br />\n{$rawCitation} <br />\n<br />\nObrigado! <br />\n<br />\n{$userFirstName} <br />\nEditor de C??pia, {$contextName} <br />\n','Solicita????o ao autor de detalhes sobre refer??ncia, enviada pelo editor de texto.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}','This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','es_ES','Petici??n de correcci??n','{$participantName}:<br />\n<br />\nMe gustar??a pedirle que llevara a cabo la correcci??n de &quot;{$submissionTitle}&quot; para {$contextName}. Para hacerlo deber??a seguir los pasos siguientes:<br />\n1. Haga clic en la URL del env??o que encontrar?? al final de este correo.<br />\n2. Abra todos los archivos disponibles en \"Archivos borradores\" y haga la correcci??n, a??adiendo todos los comentarios que necesite en \"Discusiones de correcci??n\".<br />\n3. Guarde los archivos corregidos y c??rguelos en el panel \"Corregidos\".<br />\n4. Notifique al editor/a que los archivos est??n listos y que el proceso de producci??n puede empezar.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL del env??o: {$submissionUrl}<br />\nNombre de usuario/a: {$participantUsername}','Este correo es enviado por un/a Editor/a de Secci??n a un/a corrector/a de un env??o para pedirles que comiencen un proceso de correcci??n. Le proporciona informaci??n sobre en el env??o y c??mo acceder a ??l.'),('COPYEDIT_REQUEST','pt_BR','Solicita????o de edi????o de texto','{$participantName}: <br />\n<br />\nPe??o que voc?? realize a revis??o textual de &quot;{$submissionTitle}&quot; para {$contextName} seguindo estas etapas. <br />\n1. Clique no URL da Submiss??o abaixo. <br />\n2. Abra todos os arquivos dispon??veis em \"Arquivos de Vers??o Final\" e fa??a sua revis??o textual, adicionando quaisquer discuss??es em \"Discuss??o da edi????o de texto\" conforme necess??rio. <br />\n3. Salve os arquivos revisados e fa??a o carregamento no painel \"Texto editado\". <br />\n4. Notifique o Editor de que todos os arquivos foram preparados e que o processo de \"Editora????o\" pode come??ar. <br />\n<br />\nURL de {$contextName}: {$contextUrl} <br />\nURL de Submiss??o: {$submitUrl} <br />\nNome de usu??rio: {$participantUsername}','Mensagem enviada pelo Editor de Se????o solicitando a realiza????o de uma tarefa de edi????o ao Editor de Texto, com informa????es sobre e como acessar o documento.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),('EDITOR_ASSIGN','es_ES','Asignaci??n editorial','{$editorialContactName}:<br />\n<br />\nSe le ha asignado el env??o, &quot;{$submissionTitle},&quot; a {$contextName} para que lo revise en el proceso editorial como Editor/a de Secci??n.<br />\n<br />\nURL del env??o: {$submissionUrl}<br />\nUsuario/a: {$editorUsername}<br />\n<br />\nGracias.','Este correo notifica al / a la Editor/a de Secci??n de que les ha asignado la tarea de supervisar un env??o a trav??s del proceso editorial. Proporciona informaci??n sobre el env??o y c??mo acceder a la revista.'),('EDITOR_ASSIGN','pt_BR','Tarefa editorial','{$editorialContactName}:<br />\n<br />\nA submiss??o, &quot;{$submissionTitle},&quot; ao peri??dico {$contextName} lhe foi designada para acompanhar o processo editorial em sua fun????o como Editor de Se????o.<br />\n<br />\nURL da Submiss??o: {$submissionUrl}<br />\nUsu??rio: {$editorUsername}<br />\n<br />\nObrigado.','Mensagem notifica o Editor de Se????o que uma nova tarefa de acompanhamento de submiss??o lhe foi designada pelo Editor-Gerente. Oferece informa????es sobre a submiss??o e como acessar o sistema.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','es_ES','Decisi??n del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisi??n sobre su env??o en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisi??n es: Aceptar el env??o','Este correo electr??nico del editor/a o editor/a de secci??n para el autor/a le notifica que la decisi??n final es aceptar su env??o .'),('EDITOR_DECISION_ACCEPT','pt_BR','Decis??o editorial','{$authorName}:<br />\n<br />\nN??s chegamos a uma decis??o referente a sua submiss??o para o peri??dico {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNossa decis??o ?? de: Aceitar a Submiss??o','Esta ?? uma mensagem do Editor/Editor de Se????o ao autor para notific??-lo da decis??o editorial (final) tomada sobre a submiss??o.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),('EDITOR_DECISION_DECLINE','es_ES','Decisi??n del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisi??n sobre su env??o en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisi??n es: Rechazar el env??o','Este correo electr??nico del editor/a o editor/a de secci??n al autor/a le notifica sobre la decisi??n final de \"rechazar\" su env??o.'),('EDITOR_DECISION_DECLINE','pt_BR','Decis??o editorial','{$authorName}:<br />\n<br />\nN??s chegamos a uma decis??o referente a sua submiss??o para o peri??dico {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNossa decis??o ?? de: Rejeitar a Submiss??o','Esta mensagem do Editor/Editor de Se????o ao autor notifica sobre a decis??o final tomada sobre a submiss??o.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the editor declines their submission initially, before the review stage'),('EDITOR_DECISION_INITIAL_DECLINE','es_ES','Decisi??n del editor/a','\n			{$authorName}:<br />\n<br />\nHemos llegado a una decisi??n sobre su env??o a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisi??n es: Rechazar el env??o','Este correo electr??nico se env??a al autor/a si el editor/a rechaza su env??o inicialmente, antes de la fase de revisi??n'),('EDITOR_DECISION_INITIAL_DECLINE','pt_BR','Decis??o do Editor','\n			{$authorName}: <br />\n<br />\nChegamos a uma decis??o sobre sua submiss??o para {$ contextName}, &quot;{$submissionTitle}&quot;. <br />\n<br />\nNossa decis??o ??: Recusar Submiss??o','Este email ser?? enviado ao autor se o editor recusar o envio inicialmente, antes da fase de revis??o'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review','This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','es_ES','Decisi??n del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisi??n sobre su env??o en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisi??n es: Volver a enviar a revisi??n','Este correo electr??nico del editor/a o editor/a de secci??n al autor/a le notifica sobre la decisi??n final de volver a revisar su env??o.'),('EDITOR_DECISION_RESUBMIT','pt_BR','Decis??o editorial','{$authorName}:<br />\n<br />\nN??s chegamos a uma decis??o referente a sua submiss??o para o peri??dico {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNossa decis??o ?? de: Ressubmeter para Avalia????o','Esta mensagem do Editor/Editor de Se????o ao autor notifica sobre a decis??o editorial final tomada sobre a submiss??o.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required','This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','es_ES','Decisi??n del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisi??n sobre su env??o en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisi??n es: Necesita revisiones','Este correo electr??nico del editor/a o editor/a de secci??n al autor/a le notifica que la decisi??n final respecto a su env??o es que \"necesita revisiones\".'),('EDITOR_DECISION_REVISIONS','pt_BR','Decis??o editorial','{$authorName}:<br />\n<br />\nN??s chegamos a uma decis??o referente a sua submiss??o para o peri??dico {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNossa decis??o ?? de: Revis??es Requeridas','Esta mensagem ?? enviada pelo Editor ou Editor de Se????o ao autor, notificando-o da decis??o final de \"<strong>Revis??es Requeridas</strong>\" tomada sobre a sua submiss??o.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','es_ES','Decisi??n del editor/a','{$authorName}:<br />\n<br />\nHemos llegado a una decisi??n respecto a su env??o {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisi??n es: Enviar a revisi??n<br />\n<br />\nEnlace: {$submissionUrl}','Este correo electr??nico del editor/a, o del editor/a de secci??n, notifica al autor/a que su env??o se traslada a un revisor/a externo.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','pt_BR','Decis??o do Editor','{$authorName}:<br />\n<br />\nN??s chegamos a uma decis??o referente a sua submiss??o para o peri??dico {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNossa decis??o ?? de: Enviar para avalia????o<br />\n<br />\nURL da submiss??o: {$submissionUrl}','Este e-mail enviado pelo Editor ou Editor de Se????o para um autor serve para notificar o mesmo de que sua submiss??o foi enviada para avaliadores externos.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','es_ES','Decisi??n del editor/a','{$authorName}:<br />\n<br />\nLa edici??n de su env??o, &quot;{$submissionTitle},&quot; se ha completado. Ahora lo enviaremos a producci??n.<br />\n<br />\nSubmission URL: {$submissionUrl}','Este correo electr??nico del editor/a, o del editor/a de secci??n, notifica al autor/a que su env??o se traslada a producci??n.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','pt_BR','Decis??o do Editor','{$authorName}:<br />\n<br />\nA edi????o de texto da sua submiss??o, &quot;{$submissionTitle},&quot; est?? completa. Agora ela est?? sendo enviada para  editora????o.<br />\n<br />\nURL da submiss??o: {$submissionUrl}','Este e-mail do Editor ou Editor de Se????o para um Autor notifica-os de que seus envios est??o sendo enviados para produ????o.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),('EDITOR_RECOMMENDATION','es_ES','Recomendaci??n del editor/a','{$editors}:<br />\n<br />\nLa recomendaci??n respecto al env??o a {$contextName}, &quot;{$submissionTitle}&quot; es: {$recommendation}','Este correo electr??nico del editor/a o editor/a de secci??n que aconseja para los editores/as o editores/as de secci??n que toman las decisiones les notifica sobre la recomendaci??n final respecto al env??o.'),('EDITOR_RECOMMENDATION','pt_BR','Recomenda????o do Editor','{$editors}:<br />\n<br />\nA recomenda????o referente ?? submiss??o para o peri??dico {$contextName}, &quot;{$submissionTitle}&quot; ??: {$recommendation}','Este e-mail do Editor que recomenda ou do Editor de Se????o para os Editores que tomam decis??es ou Editores de Se????o notifica-os de uma recomenda????o final sobre a submiss??o.'),('EMAIL_LINK','en_US','Article of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),('EMAIL_LINK','es_ES','Art??culo interesante','He pensado que le podr??a interesar ver el art??culo &quot;{$submissionTitle}&quot; de {$authorName}, publicado en el vol. {$volume}, n?? {$number} ({$year}) de {$contextName} en &quot;{$articleUrl}&quot;.','Esta plantilla de correo proporciona a un/a lector/a registrado/a la oportunidad de enviar informaci??n sobre un art??culo a alguien a quien le podr??a interesar. Est?? disponible a trav??s de las Herramientas de Lectura y debe ser activado por el/la Gestor/a de la Revista en las Administraci??n de Herramientas de Lectura.'),('EMAIL_LINK','pt_BR','Artigo interessante para sua leitura','Acredito ser de seu interesse o artigo \"{$submissionTitle}\", de {$authorName}, publicado na revista {$contextName}, V. {$volume}, n. {$number}, Ano {$year}, dispon??vel em \"{$articleUrl}\".','Mensagem enviada por um leitor a um colega, sobre um artigo considerado de seu interesse, com link para acesso e informa????es sobre a revista e a edi????o onde o documento foi publicado.'),('LAYOUT_COMPLETE','en_US','Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}','This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','es_ES','Galeradas completadas','{$editorialContactName}:<br />\n<br />\nYa han sido preparadas las galeradas para el manuscrito &quot;{$submissionTitle},&quot; para {$contextName} y est??n listas para corregir.<br />\n<br />\nSi tiene cualquier pregunta, no dude en contactar con nosotros/as.<br />\n<br />\n{$participantName}','Este correo electr??nico es enviado por el/la Editor/a de Maquetaci??n al / a la Editor/a de Secci??n notific??ndole que el proceso de maquetaci??n ha finalizado.'),('LAYOUT_COMPLETE','pt_BR','Composi????es conclu??das','{$editorialContactName}: <br />\n<br />\nAs provas topogr??ficas j?? foram preparadas para o manuscrito &quot;{$submissionTitle} &quot; para {$contextName} e est??o prontas para a revis??o.<br />\n<br />\nSe voc?? tiver alguma d??vida, favor entrar em contato comigo. <br />\n<br />\n{$participantName}','Mensagem enviada pelo Editor de Layout ao Editor de Se????o, informando sobre a conclus??o das composi????es.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.','This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','es_ES','Solicitud de galeradas','{$participantName}:<br />\n<br />\n\nEl env??o &quot;{$submissionTitle}&quot; a {$contextName} ahora necesita que prepare las galeradas siguiendo los siguientes pasos.<br />\n1. Haga click en la URL del env??o que hay a continuaci??n.<br />\n2. Entre a la revista con su usuario y utilice los ficheros preparados para publicaci??n para crear las galeradas de acuerdo a los est??ndares de la revista.<br />\n3. Suba las galeradas a la secci??n de ficheros de galerada.<br />\n4. Notifique al Editor de que las galeradas est??n subidas y listas.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL de env??o: {$submissionUrl}<br />\nUsuario: {$participantUsername}<br />\n<br />\nSi no puede llevar a cabo este trabajo en este momento o tiene cualquier pregunta, p??ngase en contacto con nosotros/as. Gracias por su contribuci??n a la revista.','Este correo electr??nico es enviado por el/ la Editor/a de Secci??n al / a la Editor/a de Maquetaci??n notific??ndole que se les ha asignado la tarea de editar la maquetaci??n de un env??o. Le proporciona informaci??n sobre el env??o y c??mo acceder a ??l.'),('LAYOUT_REQUEST','pt_BR','Solicita????o de composi????es','{$participantName}:<br />\n<br />\nA submiss??o &quot;{$submissionTitle}&quot; para {$contextName} de provas tipogr??ficas, conforme as seguintes etapas. <br />\n1. Clique na URL de Submiss??o abaixo. <br />\n2. Fa??a login no peri??dico e use os arquivos Prontos para Produ????o para criar as provas de acordo com os padr??es do peri??dico. <br />\n3. Carregue as provas na se????o Arquivos de Prova. <br />\n4. Notifique o Editor, usando as Discuss??es de Produ????o, informando de que as provas est??o carregadas e prontas. <br />\n<br />\nURL de {$contextName}: {$contextUrl} <br />\nURL da submiss??o: {$submitUrl} <br />\nNome de usu??rio: {$participantUsername} <br />\n<br />\nSe voc?? n??o conseguir realizar esse trabalho no momento ou tiver alguma d??vida, entre em contato comigo. Obrigado por sua contribui????o para este peri??dico.','Mensagem enviada pelo Editor de Se????o ao Editor de Layout, solicitando que sejam preparadas as Composi????es do texto final, com informa????es de acesso.'),('LOCKSS_EXISTING_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),('LOCKSS_EXISTING_ARCHIVE','es_ES','Petici??n de archivado para {$contextName}','Estimado/a [Bibliotecaria/o Universitaria/o]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, es una revista en la que un miembro de su Facultad/Universidad, [nombre de la persona], colabora como [cargo que desempe??a]. La revista est?? intentando crear un archivo LOCKSS (Lots of Copies Keep Stuff Safe) con esta y otras bibliotecas universitarias.<br />\n<br />\n[Breve descripci??n de la revista]<br />\n<br />\nLa URL para el Manifiesto Editorial LOCKSS para nuestra revista es: {$contextUrl}/gateway/lockss<br />\n<br />\nEntendemos que ya est?? participando en LOCKSS. Si podemos proporcionarle metadatos adicionales para registrar nuestra revista con su versi??n de LOCKSS, estaremos encantados/as de hacerlo.<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo solicita al / a la administrador/a de un archivo LOCKSS que tenga en cuenta esta revista para incluirla en su archivo. Proporciona la URL del Manifiesto Editorial LOCKSS de la revista.'),('LOCKSS_EXISTING_ARCHIVE','pt_BR','Solicita????o para Arquivamento de {$contextName}','Prezado(a) [bibliotec??rio(a) da universidade]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, ?? um peri??dico para o qual um membro de sua institui????o, [nome do membro], serve como [t??tulo da posi????o]. O peri??dico est?? buscando estabelecer um arquivo compat??vel com LOCKSS (Lots of Copies Keep Stuff Safe) com esta e outras bibliotecas universit??rias.<br />\n<br />\n[Breve descri????o do peri??dico]<br />\n<br />\nA URL do Manifesto do Publicador LOCKSS para nosso peri??dico ??: {$contextUrl}/gateway/lockss<br />\n<br />\nEntendemos que voc?? j?? est?? participando do LOCKSS. Se pudermos fornecer metadados adicionais para registrar nosso peri??dico com sua vers??o do LOCKSS, teremos prazer em fornec??-los.<br />\n<br />\nAtenciosamente,<br />\n{$principalContactSignature}','Esta mensagem solicita ao mantenedor de um reposit??rio LOCKSS que considere incluir este peri??dico em seu acervo, informando a URL para o Manifesto LOCKSS da editora.'),('LOCKSS_NEW_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),('LOCKSS_NEW_ARCHIVE','es_ES','Petici??n de archivado para {$contextName}','Estimado/a [Bibliotecario/a Universitario/a]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, es una revista en la que un miembro de su Facultad/Universidad, [nombre de la persona], colabora como [cargo que desempe??a]. La revista est?? intentando crear un archivo LOCKSS (Lots of Copies Keep Stuff Safe) con esta y otras bibliotecas universitarias.<br />\n<br />\n[Breve descripci??n de la revista]<br />\n<br />\nEl programa LOCKSS &amp;lt;http://lockss.org/&amp;gt;, una iniciativa internacional de bibliotecas y editoriales, es un ejemplo vivo de un repositorio de preservaci??n y archivo distribuido, a continuaci??n le mostramos m??s detalles. El software, que funciona en ordenadores personales normales es gratuito; el sistema se conecta f??cilmente; necesitando muy poco mantenimiento.<br />\n<br />\nPara contribuir al archivado de nuestra revista, le invitamos a convertirse en miembro de la comunidad LOCKSS, y as?? ayudar a recopilar y preservar t??tulos producidos en nuestra facultad y por otras entidades acad??micas de todo el mundo. Para hacerlo le rogamos que alguna persona de su biblioteca visite el sitio de LOCKSS para saber c??mo funciona este sistema. Espero recibir pronto noticias suyas en el sentido de que proporcionar?? el apoyo para poder archivar esta revista.<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo solicita al / a la destinatario/a participar en la iniciativa LOCKSS e incluir esta revista en el archivo. Le proporciona informaci??n sobre la iniciativa LOCKSS y c??mo participar.'),('LOCKSS_NEW_ARCHIVE','pt_BR','Solicita????o de inclus??o da revista {$contextName} em seu arquivo','Prezado(a) [Bibliotec??rio(a) da Universidade]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, ?? um peri??dico no qual um membro de sua institui????o, [nome do membro], serve como [t??tulo da posi????o]. O peri??dico est?? buscando estabelecer um acervo compat??vel com o LOCKSS (Lots of Copies Keep Stuff Safe) com esta e outras bibliotecas universit??rias.<br />\n<br />\n[Breve descri????o do peri??dico]<br />\n<br />\nO Programa LOCKSS &amp;lt;http://lockss.org/&amp;gt;, uma iniciativa internacional entre bibliotecas e editoras, ?? um exemplo pr??tico de um reposit??rio de preserva????o e arquivamento distribu??do, conforme detalhes adicionais abaixo. O software, que roda em um computador pessoal comum, ?? gratuito; o sistema ?? facilmente colocado online; e pouca manuten????o ?? necess??ria.<br /> \n<br />\nPara ajudar no arquivamento de nosso peri??dico, convidamos voc?? a se tornar um membro da comunidade LOCKSS, para ajudar a coletar e preservar t??tulos produzidos por seu corpo docente e por outros acad??micos no mundo todo. Para fazer isso, pe??a a algu??m da sua equipe que visite o site da LOCKSS para obter informa????es sobre como este sistema opera. Agrade??o seu retorno a respeito da viabilidade de fornecer esse suporte de arquivamento para este peri??dico. <br />\n<br />\nAtenciosamente,<br />\n{$principalContactSignature}','Mensagem convida o destinat??rio a participar da iniciativa LOCKSS e incluir a revista no seu reposit??rio. O e-mail oferece informa????es iniciais e sobre como participar na iniciativa LOCKSS e formas de se envolver.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.','This email template is used to notify a journal manager contact that a manual payment was requested.'),('MANUAL_PAYMENT_NOTIFICATION','es_ES','Notificaci??n de pago manual','Un pago manual necesita ser procesado para la revista  {$contextName} y el usuario {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nEl ??tem pagado es &quot;{$itemName}&quot;.<br />\nEl precio es {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nEste correo ha sido generado por el m??dulo de Pago Manual de Open Journal Systems.','Este correo electr??nico se usa para notificar al gestor/a de la revista de que se ha solicitado un pago manual.'),('MANUAL_PAYMENT_NOTIFICATION','pt_BR','Notifica????o de pagamento manual','?? necess??rio realizar o processamento de um pagamento manual de assinatura da revista {$contextName}, pelo usu??rio {$userFullName} (login &quot;{$userName}&quot;).<br />\n<br />\nO item adquirido ?? &quot;{$itemName}&quot;.<br />\nValor em ({$itemCurrencyCode}): {$itemCost}<br />\n<br />\nEsta ?? uma mensagem autom??tica da ferramenta de Pagamento manual do Open Journal Systems.','Mensagem autom??tica notificando editor-gerente que um pagamento manual foi realizado e exige processamento.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','es_ES','Nueva notificaci??n desde {$siteTitle}','Tiene una nueva notificaci??n desde {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nEnlace: {$url}<br />\n<br />\n{$principalContactSignature}','El correo electr??nico se env??a a usuarios/as registrados que hayan seleccionado recibir este tipo de notificaci??n.'),('NOTIFICATION','pt_BR','Nova notifica????o de {$siteTitle}','Voc?? tem uma nova notifica????o de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','Esta mensagem ?? enviada a usu??rios cadastrados que escolheram habilitar este tipo de notifica????o via email.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','es_ES','Mensaje sobre {$contextName}','Introduzca su mensaje.','Mensaje (en blanco) por defecto usado en el Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','pt_BR','Uma mensagem sobre {$contextName}','Insira a sua mensagem por gentileza.','A mensagem padr??o (em branco) usada no Criador de lista de mensagens do Notification Center.'),('OPEN_ACCESS_NOTIFY','en_US','Issue Now Open Access','Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),('OPEN_ACCESS_NOTIFY','es_ES','Ahora el n??mero es de acceso libre','Lectores:<br />\n<br />\n	{$contextName} acaba de hacer disponible de forma acceso libre el siguiente n??mero. Los invitamos a revisar la Tabla de Contenido aqu?? y despu??s visite nuestra p??gina Web  ({$contextUrl}) para consultar los art??culos que sean de su inter??s.<br />\n<br />\n	Gracias por mantener el inter??s en nuestro trabajo,<br />\n	{$editorialContactSignature}','Este correo electr??nico se env??a a los lectores/as registrados que han pedido recibir notificaciones por email cuando un n??mero se vuelve de acceso libre.'),('OPEN_ACCESS_NOTIFY','pt_BR','Nova edi????o de Acesso Livre','Leitores: <br />\n<br />\n{$contextName} acabou de disponibilizar em um formato de acesso aberto a seguinte edi????o. Convidamos voc?? a verificar o sum??rio abaixo e, em seguida, visitar nosso site ({$contextUrl}) para conferir os artigos e itens de interesse. <br />\n<br />\nObrigado pelo interesse em nosso trabalho, <br />\n{$editorialContactSignature}','Esta mensagem ?? enviada a leitores cadastrados que solicitam o recebimento do sum??rio de uma nova edi????o de Acesso Livre.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','es_ES','ORCID de env??o','Estimado/a {$authorName},\n<br/>\nSe le ha a??adido como coautor/a de un art??culo para {$contextName}. <br/>\nPara confirmar su autor??a, a??ada su identificador ORCID a este env??o mediante el siguiente enlace.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registrar o conectar su identificador ORCID</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Puede encontrar m??s informaci??n sobre ORCID en {$contextName}</a><br/>\n<br/>\nSi tiene cualquier pregunta no dude en contactarme.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','Esta plantilla de correo electr??nico se utiliza para recopilar los identificadores ORCID de los autores/as.'),('ORCID_COLLECT_AUTHOR_ID','pt_BR','ORCID da submiss??o','Prezado(a) {$authorName},<br>\n<br>\nVoc?? foi listada(o) como um coautor(a) em uma submiss??o de manuscrito \"{$submissionTitle}\" para {$contextName}.<br/>\nPara confirmar sua autoria, por favor adicione sua id ORCID a esta submiss??o, visitando o link fornecido abaixo.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registre ou conecte seu ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Mais informa????es sobre o ORCID em {$contextName}</a><br/>\n<br/>\nSe voc?? tiver quaisquer d??vidas, por favor entre em contato comigo.<br/>\n<br/>\n{$editorialContactSignature}<br/>\n','Este modelo de e-mail ?? utilizado para coletar os id ORCID dos coautores.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','es_ES','Solicitando acceso de registro ORCID','Estimado/a {$authorName},<br>\n<br>\nUsted ha sido incluido como autor en la presentaci??n del manuscrito \"{$submissionTitle}\" a {$contextName}.\n<br>\n<br>\nPerm??tanos agregar su identificaci??n ORCID a este env??o y tambi??n agregar el mismo a su perfil ORCID en la publicaci??n.<br>\nVisite el enlace al sitio web oficial de ORCID, inicie sesi??n con su perfil y autorice el acceso siguiendo las instrucciones.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registre o conecte su ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">M??s acerca de ORCID en{$contextName}</a><br/>\n<br>\nSi tiene alguna pregunta, por favor p??ngase en contacto conmigo.<br>\n<br>\n{$principalContactSignature}<br>\n','Esta plantilla de correo electr??nico se utiliza para solicitar acceso de registro ORCID a los autores/as.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','pt_BR','Solicitando acesso ao registro ORCID','Prezado(a) {$authorName}, <br>\n<br>\nVoc?? foi listado como autor na submiss??o do manuscrito \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPermita-nos adicionar seu ID do ORCID a essa submiss??o e tamb??m adicion??-lo ao seu perfil do ORCID na publica????o. <br>\nVisite o link para o site oficial do ORCID, fa??a o login com seu perfil e autorize o acesso seguindo as instru????es. <br>\n<a href=\"{$authorOrcidUrl}\"> <img id =\"orcid-id-logo\" src = \"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width = \'16 \' height = \'16 \' alt = \"??cone ORCID iD\" style = \"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\" /> Registre ou conecte seu ORCID ID </a> <br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\"> Mais sobre o ORCID em {$contextName} </a> <br/>\n<br>\nSe voc?? tiver alguma d??vida, entre em contato comigo. <br>\n<br>\n{$principalContactSignature} <br>\n','Este modelo de e-mail ?? usado para solicitar o acesso ao registro ORCID dos autores.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','es_ES','Cambio de contrase??a','Su contrase??a en {$siteTitle} se ha cambiado sin problema. Por favor, guarde en lugar seguro su nombre de usuaria/o y contrase??a, ya que son necesarios para trabajar con la revista.<br />\n<br />\nNombre de usuaria/o: {$username}<br />\nContrase??a: {$password}<br />\n<br />\n{$principalContactSignature}','Este correo se env??a a un/a usuario/a registrado/a una vez han cambiado su contrase??a siguiendo el procedimiento descrito en el correo-e PASSWORD_RESET_CONFIRM.'),('PASSWORD_RESET','pt_BR','Senha Redefinida','Sua senha foi redefinida com sucesso para uso com o site {$siteTitle}. Favor guardar esse nome de usu??rio e senha, pois s??o necess??rios para todo o trabalho com o peri??dico.<br />\n<br />\nSeu usu??rio: {$username}<br />\nSenha: {$password}<br />\n<br />\n{$principalContactSignature}','Esta mensagem ?? enviada a um usu??rio cadastrado quando ele redefiniu sua senha com sucesso, seguindo o processo descrito na mensagem PASSWORD_RESET_CONFIRM.'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','es_ES','Confirmaci??n de cambio de contrase??a','Hemos recibido una petici??n para cambiar su contrase??a en {$siteTitle}.<br />\n<br />\nSi no hizo usted esta petici??n ignore este correo-e y su contrase??a no cambiar??. Si desea cambiar su contrase??a pinche en el enlace que le mostramos a continuaci??n.<br />\n<br />\nCambiar mi contrase??a: {$url}<br />\n<br />\n{$principalContactSignature}','Este correo se env??a a un/a usuario/a registrado/a cuando indican que han olvidado su contrase??a o que no se pueden identificar. Proporciona una URL para que cambien su contrase??a.'),('PASSWORD_RESET_CONFIRM','pt_BR','Confirma????o de Redefini????o de Senha','Recebemos uma solicita????o para redefinir sua senha para o site {$siteTitle}.<br />\n<br />\nSe voc?? n??o fez essa solicita????o, favor ignorar este e-mail e sua senha n??o ser?? alterada. Se voc?? deseja redefinir sua senha, clique na URL abaixo.<br />\n<br />\nRedefinir minha senha: {$url}<br />\n<br />\n{$principalContactSignature}','Esta mensagem ?? enviada a um usu??rio cadastrado quando o mesmo indica que tenha esquecido sua senha ou n??o consiga efetuar login. Um link ?? fornecido que permite ao usu??rio redefinir sua senha.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PAYPAL_INVESTIGATE_PAYMENT','es_ES','Actividad inusual de PayPal','Open Journal Systems ha detectado una actividad inusual relacionada con el soporte de pago por PayPal de la revista {$contextName}. Esta actividad podr??a requerir una investigaci??n m??s detallada o una intervenci??n manual<br />\n                       <br />\nEste correo electr??nico ha sido generado por el m??dulo de PayPal de Open Journal Systems.<br />\n<br />\nInformaci??n completa de env??o para la solicitud:<br />\n{$postInfo}<br />\n<br />\nInformaci??n adicional (si se proporciona):<br />\n{$additionalInfo}<br />\n<br />\nVariables de servidor:<br />\n{$serverVars}<br />\n','Esta plantilla de correo es usada para notificar al contacto principal de la revista de que el plugin de PayPal ha detectado actividad sospechosa o actividad que requiere de intervenci??n manual.'),('PAYPAL_INVESTIGATE_PAYMENT','pt_BR','Atividade incomum na conta PayPal','O sistema encontrou atividade incomum relacionada ao suporte a pagamentos via PayPal da revista {$contextName}. Esta atividade pode exigir investiga????o mais profunda ou interven????o manual.<br />\n                       <br />\nEsta ?? uma mensagem autom??tica da ferramenta de Pagamento via PayPal do Open Journal Systems.<br />\n<br />\nInforma????es detalhadas da notifica????o:<br />\n{$postInfo}<br />\n<br />\nInforma????es adicionais (caso informado):<br />\n{$additionalInfo}<br />\n<br />\nVari??veis do servidor:<br />\n{$serverVars}<br />\n','Esta mensagem notifica o contato principal da revista sobre atividades suspeitas, ou atividades que exijam interven????o manual, detectadas pelo Plugin de Pagamento via PayPal.'),('PUBLISH_NOTIFY','en_US','New Issue Published','Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),('PUBLISH_NOTIFY','es_ES','Nuevo n??mero publicado','Estimados/as lectores/as:<br />\n<br />\n{$contextName} acaba de publicar su ??ltimo n??mero en {$contextUrl}. A continuaci??n le mostramos la tabla de contenidos, despu??s puede visitar nuestro sitio web para consultar los art??culos que sean de su inter??s.<br />\n<br />\nGracias por mantener el inter??s en nuestro trabajo,<br />\n{$editorialContactSignature}','Este correo se env??a a lectores/as registrados/as a trav??s del enlace \"Notificar a usuarios/as\" en la p??gina principal de los editores/as. Notifica a los/as lectores/as de la aparici??n de un nuevo n??mero y les invita a visitar la revista en la URL proporcionada.'),('PUBLISH_NOTIFY','pt_BR','Nova Edi????o Publicada','Caros leitores:<br />\n<br />\n{$contextName} acaba de publicar sua edi????o mais recente em {$contextUrl}. Convidamos a consultar o sum??rio abaixo e, em seguida, visitar o site para verificar os artigos e itens de interesse.<br />\n<br />\nAgradecemos pelo interesse em nosso trabalho,<br />\n{$editorialContactSignature}','Esta mensagem ?? enviada para leitores cadastrados atrav??s do link \"notifica????o de usu??rios\" na p??gina do Editor. Ela avisa os leitores a respeito de uma nova edi????o e os convida a acessar o peri??dico atrav??s da URL informada.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','es_ES','Revisor para {$contextName}','A la vista de su trayectoria profesional, su nombre ha sido propuesto para figurar como revisor potencial en el sistema de gesti??n electr??nica de art??culos de la revista {$contextName}, sin que ello implique ning??n compromiso por su parte y pudiendo dejar de formar parte de esta lista cuando lo desee. ??nicamente nos posibilita poder enviarle art??culos para una eventual revisi??n por su parte. En caso de estar conforme con actuar como revisor para la revista, podr?? recibir solicitudes de revisi??n de art??culos, y aceptar o rechazar dichas solicitudes en su momento.<br />\n<br />\nA continuaci??n le enviamos un nombre de usuario/a y contrase??a con los que podr?? acceder al sistema de gesti??n de env??os de la revista, donde adem??s podr?? indicarnos los temas que le son de inter??s como revisor.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nAgradecidos por su atenci??n, reciba un cordial saludo,<br />\n{$principalContactSignature}','Este email se env??a a los nuevos revisores para darles la bienvenida al sistema y proporcionarles sus datos de acceso.'),('REVIEWER_REGISTER','pt_BR','Cadastrado como Avaliador em {$contextName}','Devido ?? sua experi??ncia, tomamos a liberdade de cadastrar seu nome no banco de dados de avaliadores para {$contextName}. Isso n??o implica qualquer forma de compromisso de sua parte, mas simplesmente nos permite lhe contatar com uma submiss??o para uma poss??vel avalia????o. Ao ser convidado(a) a avaliar, voc?? ter?? a oportunidade de ver o t??tulo e o resumo do artigo em quest??o e poder?? sempre aceitar ou recusar o convite. Voc?? tamb??m pode pedir a qualquer momento para remover seu nome desta lista de avaliadores.<br />\n<br />\nEstamos fornecendo a voc?? um nome de usu??rio e senha, que s??o usados em todas as intera????es com o peri??dico por meio de seu site. Voc?? pode, por exemplo, atualizar seu perfil, incluindo seus interesses de avalia????o.<br />\n<br />\nUsu??rio: {$username}<br />\nSenha: {$password}<br />\n<br />\nAtenciosamente,<br />\n{$principalContactSignature}','Esta mensagem ?? enviada a um avaliador rec??m-cadastrado para dar-lhe as boas-vindas e deixar registrado o seu nome de login e senha.'),('REVIEW_ACK','en_US','Article Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_ACK','es_ES','Acuse de recibo de revisi??n de art??culo','{$reviewerName}:<br />\n<br />\nGracias por completar la revisi??n del env??o &quot;{$submissionTitle},&quot; para {$contextName}. Apreciamos su contribuci??n a la calidad de los trabajos que publicamos.','Este correo enviado por el/la Editor/a de Secci??n para confirmar la recepci??n de una revisi??n completada y agradecer al / a la revisor/a su contribuci??n.'),('REVIEW_ACK','pt_BR','Agradecimento pela avalia????o','{$reviewerName}:<br />\n<br />\nAgrade??o por enviar o parecer da submiss??o &quot;{$submissionTitle},&quot; para o peri??dico {$contextName}. N??s apreciamos sua contribui????o para manter a qualidade dos trabalhos que publicamos.','Mensagem enviada pelo Editor de Se????o ao Avaliador para confirmar recebimento e agradecer o avaliador pela conclus??o da avalia????o.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CANCEL','es_ES','Petici??n de revisi??n cancelada','{$reviewerName}:<br />\n<br />\nHemos decidido cancelar nuestra petici??n para que revisara el env??o &quot;{$submissionTitle},&quot; para {$contextName}. Lamentamos las molestias que hayamos podido causarle y esperamos poder volver a contactar con usted en el futuro para que nos ayude en el proceso de revisi??n.<br />\n<br />\nSi tiene cualquier pregunta, no dude en contactar con nosotros/as.','Este correo del / de la Editor/a de Secci??n a un/a Revisor/a que tiene la revisi??n de un env??o en progreso para notificarles que la revisi??n se ha cancelado.'),('REVIEW_CANCEL','pt_BR','Cancelamento de solicita????o de avalia????o','{$reviewerName}:<br />\n<br />\nN??s decidimos cancelar o pedido de avalia????o da submiss??o, &quot;{$submissionTitle},&quot; para o peri??dico {$contextName}. N??s pedimos desculpas por qualquer inconveni??ncia que isso lhe causou e esperamos poder contar com sua assist??ncia no processo de avalia????o por pares deste peri??dico no futuro.<br />\n<br />\nSe tiver alguma d??vida, por gentileza, entre em contato comigo.','Mensagem enviada pelo Editor de Se????o com um processo de avalia????o em andamento, notificando que o processo em quest??o foi cancelado.'),('REVIEW_CONFIRM','en_US','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_CONFIRM','es_ES','Acepto la revisi??n','Editores/as:<br />\n<br />\nTengo la capacidad y deseo revisar el env??o &quot;{$submissionTitle},&quot; para {$contextName}. Gracias por acordarse de m??, es mi intenci??n tener la revisi??n completa en el plazo indicado: {$reviewDueDate}, a ser posible antes.<br />\n<br />\n{$reviewerName}','Este correo es enviado por un/a revisor/a al / a la Editor/a de Secci??n en respuesta a una petici??n de revisi??n para notificarle que ha aceptado la petici??n y que ser?? completada antes de la fecha especificada.'),('REVIEW_CONFIRM','pt_BR','Dispon??vel para realizar avalia????o','Prezados editores, <br />\n<br />\nEu tenho disponibilidade para dar um parecer para a submiss??o, &quot;{$submissionTitle},&quot; para o peri??dico {$contextName}. Agrade??o por lembrar de mim, e pretendo enviar o parecer at?? {$reviewDueDate}, se n??o antes.<br />\n<br />\nAtenciosamente,\n<br />\n{$reviewerName}','Mensagem enviada pelo Avaliador ao Editor de Se????o, em resposta ?? solicita????o de avalia????o, para notificar disponibilidade para realizar a tarefa e de que a mesma ser?? conclu??da no prazo especificado.'),('REVIEW_DECLINE','en_US','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),('REVIEW_DECLINE','es_ES','Rechazo la revisi??n','Editores/as:<br />\n<br />\nMe temo que en este momento no voy a poder revisar el env??o &quot;{$submissionTitle},&quot; para {$contextName}. Gracias por pensar en m??, espero que vuelvan a contar conmigo en futuras ocasiones.<br />\n<br />\n{$reviewerName}','Este correo es enviado por un/a revisor/a al / a la Editor/a de Secci??n en respuesta a una petici??n de revisi??n para notificarle que rechaza la petici??n de revisi??n.'),('REVIEW_DECLINE','pt_BR','Indispon??vel para realizar avalia????o','Editores(as):<br />\n<br />\nTemo n??o poder dar um parecer ?? submiss??o &quot;{$submissionTitle},&quot; para o peri??dico {$contextName} no momento. Agrade??o por lembrar de mim, e fiquem ?? vontade para me convidar novamente em um outro momento.<br />\n<br />\n{$reviewerName}','Mensagem enviada pelo Avaliador ao Editor de Se????o, em resposta ?? solicita????o de avalia????o, para notificar sua N??O disponibilidade para realizar a tarefa, rejeitando a solicita????o.'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.'),('REVIEW_REINSTATE','es_ES','Solicitud de revisi??n restablecida','{$reviewerName}:<br />\n<br />\nNos gustar??a restablecer la solicitud que le hicimos para revisar el env??o &quot;{$submissionTitle},&quot; para {$contextName}. Esperamos que nos pueda ayudar en este proceso de revisi??n de la revista.<br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme.','Este correo electr??nico lo env??a el editor/a de secci??n a un revisor/a con alguna revisi??n en curso para notificarle que una revisi??n cancelada ha sido restablecida.'),('REVIEW_REINSTATE','pt_BR','Solicita????o de revis??o restabelecida','{$reviewerName}:<br />\n<br />\nN??s gostar??amos de convid??-lo(a) novamente para dar um parecer ?? submiss??o, &quot;{$submissionTitle},&quot; para o peri??dico {$contextName}. N??s esperamos que voc?? possa nos ajudar no processo de avalia????o por pares deste peri??dico.<br />\n<br />\nSe tiver alguma d??vida, por favor, entre em contato comigo.','Este e-mail ?? enviado pelo Editor de Se????o a um Avaliador que possui uma avalia????o de uma submiss??o em andamento para notific??-lo de que uma avalia????o cancelada foi restabelecida.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND','es_ES','Recordatorio de env??o de revisi??n','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petici??n de revisi??n del env??o &quot;{$submissionTitle},&quot; para {$contextName}. Esper??bamos su revisi??n antes del {$reviewDueDate}, esperamos nos la mande en cuanto la tenga lista.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contrase??a para la revista puede pinchar en el siguiente enlace para cambiar su contrase??a (se la enviaremos por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribuci??n vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado por el/la Editor/a de Secci??n para recordar a un/a revisor/a que ya debe entregar su revisi??n.'),('REVIEW_REMIND','pt_BR','Lembrete de solicita????o de avalia????o','{$reviewerName}:<br />\n<br />\nEste ?? apenas um lembrete amig??vel do nosso pedido de avalia????o da submiss??o, &quot;{$submissionTitle},&quot; ao peri??dico {$contextName}. Esper??vamos ter recebido sua avalia????o at?? {$reviewDueDate}, ent??o gostar??amos de receb??-la assim que voc?? conseguir prepar??-la.<br />\n<br />\nSe voc?? n??o tiver seu nome de usu??rio e senha para o site do peri??dico, poder?? usar este link para redefinir sua senha (que ser?? enviada por e-mail juntamente com seu nome de usu??rio). {$passwordResetUrl}<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nPor favor, confirme que poder?? completar essa contribui????o vital ao trabalho do peri??dico. Aguardo seu retorno.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Se????o ao Avaliador como lembrete da tarefa de avalia????o em andamento ainda n??o conclu??da.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO','es_ES','Recordatorio autom??tico de revisi??n de env??o','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petici??n de revisi??n del env??o &quot;{$submissionTitle},&quot; para {$contextName}. Esper??bamos su revisi??n antes del {$reviewDueDate}, y se ha generado autom??ticamente este correo-e al haberse superado dicha fecha. A??n estar??amos encantados de recibirla una vez la tenga lista.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contrase??a para la revista puede pinchar en el siguiente enlace para cambiar su contrase??a (se la enviaremos por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribuci??n vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado autom??ticamente cuando se supera la fecha de entrega de un/a revisor/a (v??ase Opciones de Revisi??n en Configuraci??n de la revista, paso 2). Las tareas planificadas deben estar activadas y configuradas (ver fichero de configuraci??n del sitio).'),('REVIEW_REMIND_AUTO','pt_BR','Lembrete autom??tico de solicita????o de avalia????o','{$reviewerName}:<br />\n<br />\nEste ?? apenas um lembrete amig??vel do nosso pedido de avalia????o da submiss??o, &quot;{$submissionTitle},&quot; ao peri??dico {$contextName}. Esper??vamos ter recebido sua avalia????o at?? {$reviewDueDate}, ent??o este email foi gerado automaticamente com o passar daquele prazo. N??s ainda assim ficar??amos gratos em receb??-la assim que voc?? conseguir prepar??-la.<br />\n<br />\nSe voc?? n??o tiver seu nome de usu??rio e senha para o site do peri??dico, poder?? usar este link para redefinir sua senha (que ser?? enviada por e-mail juntamente com seu nome de usu??rio). {$passwordResetUrl}<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nPor favor, confirme que poder?? completar essa contribui????o vital ao trabalho do peri??dico. Aguardo seu retorno.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada automaticamente ao avaliador quando a data de conclus??o de avalia????o for ultrapassada (veja as Op????es de Avalia????o no Passo 2 da Configura????o da Revista). Tarefas agendadas devem ser habilitadas e configuradas (veja o arquivo de configura????o do sistema).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','es_ES','Recordatorio autom??tico de revisi??n de env??o','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petici??n de revisi??n del env??o &quot;{$submissionTitle},&quot; para {$contextName}. Esper??bamos su revisi??n antes del {$reviewDueDate}, y se ha generado autom??ticamente este correo-e al haberse superado dicha fecha. A??n estar??amos encantados de recibirla una vez la tenga lista.<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribuci??n vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo electr??nico se env??a autom??ticamente cuando transcurre la fecha de vencimiento del revisor (consulte Opciones de revisi??n en Configuraci??n > Flujo de trabajo> Revisar) y cuando se habilita el acceso de revisor con un clic. Las tareas programadas deben estar habilitadas y configuradas (consulte el archivo de configuraci??n del sitio).'),('REVIEW_REMIND_AUTO_ONECLICK','pt_BR','Lembrete autom??tico de solicita????o de avalia????o','{$reviewerName}:<br />\n<br />\nEste ?? apenas um lembrete amig??vel do nosso pedido de avalia????o da submiss??o, &quot;{$submissionTitle},&quot; ao peri??dico {$contextName}. Esper??vamos ter recebido sua avalia????o at?? {$reviewDueDate}, ent??o este email foi gerado automaticamente com o passar daquele prazo. N??s ainda assim ficar??amos gratos em receb??-la assim que voc?? conseguir prepar??-la.<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nPor favor, confirme que poder?? completar essa contribui????o vital ao trabalho do peri??dico. Aguardo seu retorno.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada automaticamente ao avaliador quando a data de conclus??o de avalia????o for ultrapassada (veja as Op????es de Avalia????o no Passo 2 da Configura????o da Revista) e o acesso 1-Clique estiver ativado. Tarefas agendadas devem ser habilitadas e configuradas (veja o arquivo de configura????o do sistema).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','es_ES','Recordatorio de env??o de revisi??n','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petici??n de revisi??n del env??o &quot;{$submissionTitle},&quot; para {$contextName}. Esper??bamos su revisi??n antes del {$reviewDueDate}, esperamos nos la mande en cuanto la tenga lista.<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribuci??n vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado por el/la Editor/a de Secci??n para recordar a un/a revisor/a que ya debe entregar su revisi??n.'),('REVIEW_REMIND_ONECLICK','pt_BR','Lembrete de solicita????o de avalia????o','{$reviewerName}:<br />\n<br />\nEste ?? apenas um lembrete amig??vel do nosso pedido de avalia????o da submiss??o, &quot;{$submissionTitle},&quot; ao peri??dico {$contextName}. Esper??vamos ter recebido sua avalia????o at?? {$reviewDueDate}, ent??o gostar??amos de receb??-la assim que voc?? conseguir prepar??-la.<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nPor favor, confirme que poder?? completar essa contribui????o vital ao trabalho do peri??dico. Aguardo seu retorno.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Se????o ao Avaliador como lembrete da tarefa de avalia????o em andamento ainda n??o conclu??da.'),('REVIEW_REQUEST','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','es_ES','Solicitud de revisi??n de art??culo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que ser??a un excelente revisor/a del manuscrito, &quot;{$submissionTitle},&quot; que ha sido enviado a {$contextName}. A continuaci??n encontrar?? el resumen del env??o, con la esperanza de que aceptar?? llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, inicie sesi??n en la p??gina web de la revista antes del {$responseDueDate} para indicarnos si llevar?? a cabo o no la revisi??n, as?? como para tener acceso al env??o y para registrar su revisi??n y recomendaci??n. La direcci??n es {$contextUrl}<br />\n<br />\nLa revisi??n propiamente dicha deber??a estar lista el {$reviewDueDate}.<br />\n<br />\nSi no recuerda su nombre de usuaria/o y contrase??a, puede utilizar este enlace para restablecer su contrase??a (esta le ser?? enviada por correo electr??nico junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar nuestra solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electr??nico del editor/a de secci??n se dirige a un revisor/a para solicitarle que acepte o rechace la tarea de revisi??n de un env??o. El correo proporciona informaci??n sobre el env??o, como el t??tulo y el resumen, el plazo de revisi??n y c??mo acceder al env??o propiamente dicho. Este mensaje se usa cuando se selecciona el proceso de revisi??n est??ndar en Gesti??n > Ajustes > Flujo de trabajo > Revisi??n. (Si no consulte REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','pt_BR','A revista {$contextName} solicita avalia????o de artigo','{$reviewerName}:<br />\n<br />\nAcredito que voc?? poderia servir como um(a) excelente avaliador(a) do manuscrito, &quot;{$submissionTitle},&quot; que foi submetido ao peri??dico {$contextName}. O resumo da submiss??o est?? inserido abaixo e espero que voc?? considere realizar essa importante tarefa para n??s.<br />\n<br />\nFa??a o login no site do peri??dico antes de {$responseDueDate} para indicar sua disponibilidade, bem como para acessar submiss??o e registrar sua avalia????o e recomenda????o. O site ?? {$contextUrl}<br />\n<br />\nA avalia????o em si tem como prazo {$reviewDueDate}.<br />\n<br />\nSe voc?? n??o tiver seu nome de usu??rio e senha para o site do peri??dico, poder?? usar este link para redefinir sua senha (que ser?? enviada por e-mail juntamente com seu nome de usu??rio). {$passwordResetUrl}<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nAgrade??o por considerar esta solicita????o.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Mensagem do Editor de Se????o para solicitar ao Avaliador que indique disponibilidade ou n??o para realizar uma avalia????o. Oferece informa????es sobre a submiss??o, como t??tulo e resumo, al??m da data para a conclus??o dos trabalhos e como acessar o documento. Esta mensagem ?? usada quando se utiliza o Processo Padr??o de Avalia????o, definido no Passo 2 de Configura????o da Revista. (Caso contr??rio veja REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ATTACHED','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','es_ES','Petici??n de revisi??n de art??culo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que ser??a un/a excelente revisor/a del manuscrito &quot;{$submissionTitle},&quot;. A continuaci??n encontrar?? un extracto del env??o, con la esperanza de que aceptar?? llevar a cabo esta importante tarea para nosotros. A continuaci??n le mostramos las Normas de Revisi??n de esta revista y adjunto a este correo-e recibir?? el env??o. Deber??a enviarme por correo-e su revisi??n del env??o, as?? como su recomendaci??n antes del {$reviewDueDate}.<br />\n<br />\nLe ruego me conteste a este correo-e antes del {$responseDueDate} y me comunique si puede y quiere hacer la revisi??n.<br />\n<br />\nGracias por tener en cuenta esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nNormas de Revisi??n<br />\n<br />\n{$reviewGuidelines}<br />\n','Este correo electr??nico del editor/a de secci??n se dirige a un revisor/a para solicitarle que acepte o rechace la tarea de revisi??n de un env??o. El correo incluye el env??o como adjunto. Este mensaje se usa cuando se selecciona el proceso de revisi??n de adjunto de correo en Gesti??n > Ajustes > Flujo de trabajo > Revisi??n. (Si no consulte REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','pt_BR','A revista {$contextName} solicita avalia????o de artigo','{$reviewerName}:<br />\n<br />\nEu acredito que voc?? seria um ??timo(a) parecerista para o manuscrito, &quot;{$submissionTitle},&quot; e estou pedindo que considere aceitar esta importante tarefa para n??s. As Diretrizes de Avalia????o deste peri??dico seguem abaixo, e a submiss??o est?? anexa ao email. Sua avalia????o da submiss??o, junto ?? sua recomenda????o, devem ser enviadas por email para mim at?? {$reviewDueDate}.<br />\n<br />\nPor gentileza, indique se voc?? aceita dar o parecer ou n??o por e-mail at?? {$responseDueDate}.<br />\n<br />\nObrigado por considerar este pedido.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDiretrizes de Avalia????o<br />\n<br />\n{$reviewGuidelines}<br />\n','Este email ?? enviado pelo Editor de Se????o para um Avaliador solicitando que ele aceite ou decline a tarefa de dar um parecer para uma submiss??o. A submiss??o ?? enviada anexada ao e-mail. A mensagem ?? utilizada quando o Processo de Avalia????o por Anexo de E-mail ?? selecionado em Gerenciamento > Configura????es > Fluxo de Trabalho > Avalia????o. (Alternativamente veja REVIEW_REQUEST)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','es_ES','Solicitud de revisi??n de art??culo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} est?? considerando.<br />\n<br />\nDespu??s de la revisi??n de la versi??n previa del manuscrito, los autores/as han enviado una versi??n revisada de su art??culo. Le agradecer??amos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nLas normas de revisi??n de esta revista se pueden ver a continuaci??n. Adem??s, el art??culo se adjunta en este correo electr??nico. Deber??a enviarnos su revisi??n del env??o, junto con su recomendaci??n, antes del {$reviewDueDate}.<br />\n<br />\nPor favor, responda a este correo electr??nico antes del {$responseDueDate} e ind??quenos si puede y desea realizar esta revisi??n.<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nNormas de revisi??n<br />\n<br />\n{$reviewGuidelines}<br />\n','El editor de secci??n env??a este correo electr??nico a un revisor para pedirle si acepta o rechaza la tarea de revisi??n de un art??culo en segunda ronda. Este incluye el env??o como adjunto. Este mensaje se usa cuando se selecciona el proceso de revisi??n de archivos adjuntos por correo electr??nico en el paso 2 de la configuraci??n de la revista. (Por lo dem??s, vea SOLICITUD_DE_REVISI??N_POSTERIOR.)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','pt_BR','Solicita????o de avalia????o de artigo','{$reviewerName}:<br />\n<br />\nEsta mensagem ?? referente ao manuscrito &quot;{$submissionTitle},&quot; que est?? sendo considerado para publica????o pelo peri??dico {$contextName}.<br />\n<br />\nAp??s a avalia????o da vers??o anterior do manuscrito, os autores submeteram uma vers??o revisada do artigo. N??s agradecer??amos se voc?? pudesse ajudar com uma avalia????o.<br />\n<br />\nAs Diretrizes de Avalia????o deste peri??dico seguem abaixo e a submiss??o est?? anexa ao e-mail. Sua avalia????o da submiss??o, junto ?? recomenda????o, deve ser enviada por e-mail at?? {$reviewDueDate}.<br />\n<br />\nPor gentileza, envie um email de retorno at??{$responseDueDate} indicando se voc?? poder?? dar o parecer ou n??o.<br />\n<br />\nObrigado por considerar este pedido.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDiretrizes de Avalia????o<br />\n<br />\n{$reviewGuidelines}<br />\n','Esta mensagem ?? enviada pelo Editor de se????o ao avaliador, perguntando se estaria dispon??vel para enviar a avalia????o de uma submiss??o em uma segunda rodada ou superior. A mensagem inclui a submiss??o como anexo. Ela ?? usada quando o processo de avalia????o via e-mail ?? escolhido em  Configura????es > Fluxo de trabalho > Avalia????o.  (Caso contr??rio, veja REVIEW_REQUEST_SUBSEQUENT.)'),('REVIEW_REQUEST_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK','es_ES','Petici??n de revisi??n de art??culo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que ser??a un/a excelente revisor/a del manuscrito &quot;{$submissionTitle},&quot; que ha sido enviado a {$contextName}. A continuaci??n encontrar?? un extracto del env??o, con la esperanza de que aceptar?? llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, identif??quese en la revista antes de {$responseDueDate} para decirnos si har?? o no la revisi??n, as?? como para tener acceso al env??o y para registrar su revisi??n y recomendaci??n.<br />\n<br />\nLa revisi??n propiamente dicha debe estar lista para el {$reviewDueDate}.<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nGracias por tener en cuenta nuestra solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo del / de la Editor/a de Secci??n a un/a revisor/a le solicita que acepte o rechace la revisi??n de un env??o. Proporciona informaci??n sobre el env??o como el t??tulo y el resumen, el plazo de revisi??n, y c??mo acceder al env??o propiamente dicho. Este mensaje se usa cuando se selecciona el Proceso de Env??o Est??ndar en la configuraci??n de la revista, paso 2, y est?? activado el acceso a la revisi??n en un click.'),('REVIEW_REQUEST_ONECLICK','pt_BR','Solicita avalia????o de artigo','{$reviewerName}:<br />\n<br />\nEu acredito que voc?? seria um(a) excelente parecerista para o manuscrito, &quot;{$submissionTitle},&quot; que foi submetido ao peri??dico {$contextName}. O resumo da submiss??o segue abaixo e eu espero que voc?? considere o aceite desta tarefa importante.<br />\n<br />\nPor gentileza, logue no site do peri??dico at?? {$responseDueDate} para indicar se voc?? aceita fazer o parecer ou n??o, al??m de acessar a submiss??o para registrar sua avalia????o e recomenda????o.<br />\n<br />\nO prazo para entrega do parecer ?? {$reviewDueDate}.<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nObrigado por considerar este pedido.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Mensagem do Editor de Se????o para solicitar ao Avaliador que indique disponibilidade ou n??o para realizar uma avalia????o. Oferece informa????es sobre a submiss??o, como t??tulo e resumo, al??m da data para a conclus??o dos trabalhos e como acessar o documento. Esta mensagem ?? usada quando se utiliza o Processo Padr??o de Avalia????o, definido no Passo 2 de Configura????o da Revista e a op????o de acesso de avaliadores com 1-clique esteja habilitada.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','es_ES','Solicitud de revisi??n de art??culo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} est?? considerando.<br />\n<br />\nDespu??s de la revisi??n de la versi??n previa del manuscrito, los autores/as han enviado una versi??n revisada de su art??culo. Le agradecer??amos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nInicie sesi??n en el sitio web de la revista antes del {$responseDueDate} para indicar si llevar?? a cabo la revisi??n o no, adem??s de para obtener acceso al env??o y registrar su revisi??n y recomendaci??n.<br />\n<br />\nLa fecha l??mite para entregar la revisi??n es el {$reviewDueDate}.<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electr??nico del editor/a de secci??n a un revisor/a solicita que el revisor/a acepte o rechace la tarea de revisar un env??o para una ronda de revisi??n adicional. Adem??s, proporciona informaci??n sobre el env??o como el t??tulo, el resumen, la fecha de entrega de la revisi??n y c??mo obtener acceso al propio env??o. Este mensaje se usa cuando se selecciona el proceso de revisi??n est??ndar en el paso 2 de la configuraci??n de la revista y cuando se habilita el acceso al revisor/a con un solo clic.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','pt_BR','Solicita????o de avalia????o de artigo','{$reviewerName}:<br />\n<br />\nEsta mensagem ?? referente ao manuscrito &quot;{$submissionTitle},&quot; que est?? sendo considerado para publica????o pelo peri??dico {$contextName}.<br />\n<br />\nAp??s uma avalia????o da vers??o anterior do manuscrito, os autores submeteram uma vers??o revisada do artigo. N??s agradecer??amos se voc?? pudesse ajudar com um parecer.<br />\n<br />\nPor gentileza, logue no site do peri??dico at?? {$responseDueDate} para indicar se voc?? ir?? aceitar dar o parecer ou n??o, e tamb??m para acessar a submiss??o e registrar sua avalia????o e recomenda????o.<br />\n<br />\nO prazo para envio do parecer ?? {$reviewDueDate}.<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nObrigado por considerar este pedido.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este e-mail do Editor de Se????o para um Avaliador solicita que o avaliador aceite ou recuse a tarefa de avaliar uma submiss??o para uma segunda ou maior rodada de avalia????o. Ele fornece informa????es sobre a submiss??o, como t??tulo e resumo, uma data limite para avalia????o e como acessar a pr??pria submiss??o. Esta mensagem ?? usada quando o processo de avalia????o est?? selecionado em Configura????o > Fluxo de Trabalho > Avalia????o e a op????o \"Habilitar acesso 1-clique\" na ??rea do avaliador est?? ativada.'),('REVIEW_REQUEST_REMIND_AUTO','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO','es_ES','Solicitud de revisi??n de art??culo','{$reviewerName}:<br />\nLe recordamos nuestra petici??n acerca de la revisi??n del env??o &quot;{$submissionTitle},&quot; para {$contextName}. Esper??bamos tener esta revisi??n como muy tarde el {$responseDueDate}, por lo cual este correo electr??nico se ha generado autom??ticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del env??o se ha insertado a continuaci??n. Creemos que ser??a un excelente revisor para este art??culo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la p??gina web de la revista para indicar si realizar?? o no la revisi??n, y en caso afirmativo para acceder al env??o y registrar su revisi??n y su recomendaci??n. El sitio web es {$contextUrl}<br />\n<br />\nLa fecha l??mite para la revisi??n es el {$reviewDueDate}.<br />\n<br />\nSi no dispone de un nombre de usuario/a y contrase??a para el sitio web de la revista, puede hacer clic en este enlace para restablecer su contrase??a (se la enviaremos junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta petici??n.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electr??nico se env??a autom??ticamente cuando transcurre la fecha de entrega del revisor/a (vea las opciones de revisi??n en el paso 2 de la configuraci??n de la revista) y se deshabilita el acceso al revisor/a con un solo clic. Las tareas planificadas se deben habilitar y configurar (vea el archivo de configuraci??n del sitio).'),('REVIEW_REQUEST_REMIND_AUTO','pt_BR','A revista {$contextName} solicita avalia????o de artigo','{$reviewerName}:<br />\nEste ?? apenas um lembrete amig??vel do nosso pedido de avalia????o da submiss??o, &quot;{$submissionTitle},&quot; ao peri??dico {$contextName}. Esper??vamos ter recebido sua resposta at?? {$responseDueDate}, assim este email foi gerado e enviado automaticamente com o passar dessa data.\n<br />\nAcredito que voc?? serviria como um(a) excelente avaliador(a) do manuscrito. O resumo da submiss??o est?? inserido abaixo e espero que voc?? considere realizar essa importante tarefa para n??s.<br />\n<br />\nFa??a login no site do peri??dico para indicar se voc?? far?? a avalia????o ou n??o, bem como para acessar a submiss??o e registrar sua avalia????o e recomenda????o. O site ?? {$contextUrl}<br />\n<br />\nA avalia????o em si tem como prazo {$reviewDueDate}.<br />\n<br />\nSe voc?? n??o tiver seu nome de usu??rio e senha para o site do peri??dico, poder?? usar este link para redefinir sua senha (que ser?? enviada por e-mail juntamente com seu nome de usu??rio). {$passwordResetUrl}<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nAgrade??o por considerar esta solicita????o.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este e-mail ?? automaticamente enviando quando o prazo para confirma????o de um avaliador vence (veja as Op????es para avalia????o em Configura????es > Fluxo de trabalho > Avalia????o) e a op????o de habilitar acesso 1-clique para o avaliador est?? desabilitada. Tarefas agendadas devem ser habilitadas e configuradas (veja o arquivo de configura????o do site).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','es_ES','Solicitud de revisi??n de art??culo','{$reviewerName}:<br />\nLe recordamos nuestra petici??n acerca de la revisi??n del env??o &quot;{$submissionTitle},&quot; para {$contextName}. Esper??bamos tener esta revisi??n como muy tarde el {$responseDueDate}, por lo cual este correo electr??nico se ha generado autom??ticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del env??o se ha insertado a continuaci??n. Creemos que ser??a un excelente revisor para este art??culo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la p??gina web de la revista para indicar si realizar?? o no la revisi??n, y en caso afirmativo para acceder al env??o y registrar su revisi??n y su recomendaci??n. <br />\n<br />\nLa fecha l??mite para la revisi??n es el {$reviewDueDate}.<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta petici??n.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electr??nico se env??a autom??ticamente cuando transcurre la fecha de entrega del revisor/a (vea las opciones de revisi??n en el paso 2 de la configuraci??n de la revista) y se habilita el acceso al revisor/a con un solo clic. Las tareas planificadas se deben habilitar y configurar (vea el archivo de configuraci??n del sitio).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','pt_BR','Solicita avalia????o de artigo','{$reviewerName}:<br />\nEste ?? apenas um lembrete amig??vel do nosso pedido de avalia????o da submiss??o, &quot;{$submissionTitle},&quot; ao peri??dico {$contextName}. Esper??vamos ter recebido sua resposta at?? {$responseDueDate}, assim este email foi gerado e enviado automaticamente com o passar dessa data.\n<br />\nEu acredito que voc?? seria um ??timo(a) parecerista para o manuscrito. O resumo da submiss??o segue abaixo e eu espero que voc?? considere o aceite desta tarefa t??o importante para n??s.<br />\n<br />\nPor gentileza, logue no site do peri??dico para indicar se voc?? ir?? aceitar dar o parecer ou n??o, e tamb??m para acessar a submiss??o e registrar sua avalia????o e recomenda????o.<br />\n<br />\nO prazo para envio do parecer ?? {$reviewDueDate}.<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nObrigado por considerar este pedido.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Esse e-mail ?? enviado automaticamente quando a data de limite de confirma????o do avaliador termina (consulte Op????es de avalia????o em Configura????es> Fluxo de trabalho> Avalia????o) e o acesso do avaliador com 1-clique est?? ativado. As tarefas agendadas devem ser ativadas e configuradas (consulte o arquivo de configura????o do site).'),('REVIEW_REQUEST_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVIEW_REQUEST_SUBSEQUENT','es_ES','Solicitud de revisi??n de art??culo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} est?? considerando.<br />\n<br />\nDespu??s de la revisi??n de la versi??n previa del manuscrito, los autores/as han enviado una versi??n revisada de su art??culo. Le agradecer??amos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nInicie sesi??n en el sitio web de la revista antes del {$responseDueDate} para indicar si llevar?? a cabo la revisi??n o no, adem??s de para obtener acceso al env??o y registrar su revisi??n y recomendaci??n. El sitio web es {$contextUrl}<br />\n<br />\nLa fecha l??mite para entregar la revisi??n es el {$reviewDueDate}.<br />\n<br />\nSi no dispone de un nombre de usuario/a y contrase??a para el sitio web de la revista, puede hacer clic en este enlace para restablecer su contrase??a (se la enviaremos junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del env??o: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electr??nico del editor/a de secci??n a un revisor/a solicita que el revisor/a acepte o rechace la tarea de revisar un env??o para una ronda de revisi??n adicional. Adem??s, proporciona informaci??n sobre el env??o como el t??tulo, el resumen, la fecha de entrega de la revisi??n y c??mo obtener acceso al propio env??o. Este mensaje se usa cuando se selecciona el proceso de revisi??n est??ndar en Gesti??n > Ajustes > Flujo de trabajo > Revisi??n. (Por lo dem??s, vea REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVIEW_REQUEST_SUBSEQUENT','pt_BR','Solicita????o de avalia????o de artigo','{$reviewerName}:<br />\n<br />\nEsta mensagem ?? referente ao manuscrito &quot;{$submissionTitle},&quot; que est?? sendo avaliado para publica????o pelo peri??dico {$contextName}.<br />\n<br />\nAp??s a avalia????o da vers??o anterior do manuscrito, os autores submeteram uma vers??o revisada do artigo. N??s apreciar??amos se voc?? pudesse ajudar com um parecer.<br />\n<br />\nPor gentileza, logue no site do peri??dico at?? {$responseDueDate} para indicar se voc?? ir?? aceitar dar o parecer ou n??o, e tamb??m para acessar a submiss??o e registrar sua avalia????o e recomenda????o. O site ?? {$contextUrl}<br />\n<br />\nO prazo para envio do parecer ?? {$reviewDueDate}.<br />\n<br />\nCaso voc?? n??o possua login e senha para o site deste peri??dico, voc?? pode usar este link para solicitar uma nova senha (que lhe ser??, ent??o, enviada por email junto ao seu login). {$passwordResetUrl}<br />\n<br />\nURL da submiss??o: {$submissionReviewUrl}<br />\n<br />\nObrigado por considerar este pedido.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este e-mail do Editor de Se????o para um Avaliador, que solicita ao usu??rio aceitar ou recusar a tarefa de avaliar uma submiss??o para uma segunda ou maior rodada de avalia????o. Ele fornece informa????es sobre a submiss??o, como o t??tulo e resumo, uma data de limite de avalia????o, e como acessar a pr??pria submiss??o. Essa mensagem ?? usada quando o Processo de Avalia????o Padr??o ?? selecionado em Configura????es> Fluxo de trabalho> Avalia????o. (Caso contr??rio, consulte REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVISED_VERSION_NOTIFY','en_US','Revised Version Uploaded','Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),('REVISED_VERSION_NOTIFY','es_ES','Versi??n revisada cargada','Editores/as:<br />\n<br />\nEl autor {$authorName} ha cargado un versi??n revisada de &quot;{$submissionTitle}&quot;.<br />\n<br />\nURL del env??o: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','Este correo electr??nico se env??a de forma autom??tica al editor/a asignado cuando el autor/a carga una versi??n revisada de un art??culo.'),('REVISED_VERSION_NOTIFY','pt_BR','Envio de vers??o atualizada','Editores: <br />\n<br />\nUma vers??o revisada de &quot;{$submissionTitle}&quot; foi carregada pelo autor {$authorName}. <br />\n<br />\nURL da Submiss??o: {$submissionUrl} <br />\n<br />\n{$editorialContactSignature}','Este email ?? enviado automaticamente ao editor designado quando o autor faz o upload de uma vers??o revisada de um artigo.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('STATISTICS_REPORT_NOTIFICATION','es_ES','Actividad editorial por {$month}, {$year}','\n{$name}, <br />\n<br />\nEl informe de estado de su revista de {$month}, {$year} ya est?? disponible. Las estad??sticas clave de este mes son las siguientes.<br />\n<ul>\n	<li>Nuevos env??os este mes: {$newSubmissions}</li>\n	<li>Env??os rechazados este mes: {$declinedSubmissions}</li>\n	<li>Env??os aceptados este mes: {$acceptedSubmissions}</li>\n	<li>Env??os totales en el sistema: {$totalSubmissions}</li>\n</ul>\nInicie sesi??n en la revista para obtener m??s detalles sobre las <a href=\"{$editorialStatsLink}\">tendencias editoriales</a> y las <a href=\"{$publicationStatsLink}\">estad??sticas de art??culos publicados</a>. Se adjunta una copia completa del informe correspondiente a este mes .<br />\n<br />\nSaludos cordiales,<br />\n{$principalContactSignature}','Este correo electr??nico es enviado mensualmente y de manera autom??tica a los editores y administradores de publicaciones para suministrarles una visi??n general de la publicaci??n.'),('STATISTICS_REPORT_NOTIFICATION','pt_BR','Atividade editorial para {$month}, {$year}','\n{$name}, <br />\n<br />\nSeu relat??rio do estado atual do sistema do m??s de {$month}, {$year} est?? dispon??vel. Suas estat??sticas-chave deste m??s seguem abaixo.<br />\n<ul>\n	<li>Novas submiss??es este m??s: {$newSubmissions}</li>\n	<li>Submiss??es rejeitadas este m??s: {$declinedSubmissions}</li>\n	<li>Submiss??es aceitas este m??s: {$acceptedSubmissions}</li>\n	<li>Total de submiss??es no sistema {$totalSubmissions}</li>\n</ul>\nEfetue login no site do peri??dico para obter uma vis??o mais detalhada das <a href=\"{$editorialStatsLink}\">tend??ncias editoriais</a> e <a href=\"{$publicationStatsLink}\">estat??sticas de artigos publicados</a>. Uma c??pia completa do relat??rio de tendencias editoriais deste m??s segue anexa.<br />\n<br />\nAtenciosamente,<br />\n{$principalContactSignature}','Este e-mail ?? automaticamente enviado todo m??s aos editores e gerentes do sistema para dar-lhes uma vis??o geral do estado do sistema.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when they complete the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK','es_ES','Acuse de recibo del env??o','{$authorName}:<br />\n<br />\nGracias por enviar el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. Con el sistema de gesti??n de publicaciones en l??nea que utilizamos podr?? seguir el progreso a trav??s del proceso editorial tras iniciar sesi??n en el sitio web de la publicaci??n:<br />\n<br />\nURL del manuscrito: {$submissionUrl}<br />\nNombre de usuario/a: {$authorUsername}<br />\n<br />\nSi tiene alguna duda puede ponerse en contacto conmigo. Gracias por elegir esta editorial para mostrar su trabajo.<br />\n<br />\n{$editorialContactSignature}','Este correo electr??nico, si est?? activado, se env??a autom??ticamente a un autor/a cuando completa el proceso de env??o de un manuscrito a la editorial. Proporciona informaci??n sobre el seguimiento del env??o en el proceso y agradece al autor/a el env??o.'),('SUBMISSION_ACK','pt_BR','Agradecimento pela submiss??o','{$authorName}:<br />\n<br />\nObrigado por submeter o manuscrito, &quot;{$submissionTitle}&quot; ao peri??dico {$contextName}. Com o sistema de gerenciamento de peri??dicos on-line que estamos usando, voc?? poder?? acompanhar seu progresso atrav??s do processo editorial efetuando login no site do peri??dico:<br />\n<br />\nURL da Submiss??o: {$submissionUrl}<br />\nUsu??rio: {$authorUsername}<br />\n<br />\nSe voc?? tiver alguma d??vida, entre em contato conosco. Agradecemos por considerar este peri??dico para publicar o seu trabalho.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada automaticamente pelo sistema ao autor, quando habilitada, ao ser conclu??do o processo de submiss??o de um trabalho ?? revista. Oferece informa????es sobre os mecanismos para acompanhamento do trabalho durante o processo editorial, e serve como registro e confirma????o da submiss??o.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','es_ES','Acuse de recibo del env??o','Hola,<br />\n<br />\n{$submitterName} ha enviado el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. <br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme. Le agradecemos que haya elegido esta revista para dar a conocer su obra.<br />\n<br />\n{$editorialContactSignature}','Este correo electr??nico, si est?? activado, se env??a autom??ticamente a los autores/as que no son usuarios/as del OJS especificado durante el proceso de env??o.'),('SUBMISSION_ACK_NOT_USER','pt_BR','Agradecimento pela submiss??o','Ol??,<br />\n<br />\n{$submitterName} submeteu o manuscrito, &quot;{$submissionTitle}&quot; ao peri??dico {$contextName}. <br />\n<br />\nSe voc?? tiver alguma d??vida, entre em contato conosco. Agradecemos por considerar este peri??dico para publicar o seu trabalho.<br />\n<br />\n{$editorialContactSignature}','Quando habilitada, esta mensagem ?? enviada automaticamente aos coautores informados durante o processo de submiss??o, que n??o est??o cadastrados no OJS.'),('SUBSCRIPTION_AFTER_EXPIRY','en_US','Subscription Expired','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY','es_ES','Subscripci??n expirada','{$subscriberName}:<br />\n<br />\n	Su subscripci??n a {$contextName} ha expirado.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiraci??n: {$expiryDate}<br />\n<br />\n	Para renovar su suscripci??n entre en la p??gina web de la revista.  Puede acceder al sistema con su nombre de usuario, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo electr??nico notifica al suscriptor que su subscripci??n ha expirado.  Tambi??n proporciona la direcci??n URL de la revista con las instrucciones para acceder a la misma.'),('SUBSCRIPTION_AFTER_EXPIRY','pt_BR','Expira????o de assinatura','{$subscriberName}: <br />\n<br />\nSua assinatura do {$contextName} expirou. <br />\n<br />\n{$subscriptionType} <br />\nData de validade: {$expiryDate} <br />\n<br />\nPara renovar sua assinatura, acesse o site da revista. Voc?? pode fazer login no sistema com seu nome de usu??rio, &quot;{$username}&quot;. <br />\n<br />\nSe voc?? tiver alguma d??vida, por favor n??o hesite em contactar-me. <br />\n<br />\n{$subscriptionContactSignature}','Esta mensagem avisa o assinante da expira????o da assinatura. Informa a URL da revista e instru????es de acesso.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','en_US','Subscription Expired - Final Reminder','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','es_ES','Suscripci??n expirada - ??ltimo recordatorio','{$subscriberName}:<br />\n<br />\n	Su suscripci??n a {$contextName} ha expirado.<br />\n	Tenga en cuenta que este es el ??ltimo correo que recibir?? para record??rselo.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiraci??n: {$expiryDate}<br />\n<br />\n	Para renovar su suscripci??n entre en la p??gina web de la revista.  Puede acceder al sistema con su nombre de usuario/a, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo electr??nico notifica al suscriptor que su subscripci??n ha expirado.  Tambi??n proporciona la direcci??n URL de la revista con las instrucciones para acceder a la misma.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','pt_BR','Expira????o de assinatura - Lembrete final','{$subscriberName}: <br />\n<br />\nSua assinatura do {$contextName} expirou. <br />\nObserve que este ?? o lembrete final que lhe ser?? enviado por e-mail. <br />\n<br />\n{$subscriptionType} <br />\nData de validade: {$expiryDate} <br />\n<br />\nPara renovar sua assinatura, acesse o site da revista. Voc?? pode fazer login no sistema com seu nome de usu??rio, &quot;{$username}&quot;. <br />\n<br />\nSe voc?? tiver alguma d??vida, n??o hesite em contactar-me. <br />\n<br />\n{$subscriptionContactSignature}','Esta mensagem ?? o ??ltimo aviso ao assinante da expira????o da assinatura. Informa a URL da revista e instru????es de acesso.'),('SUBSCRIPTION_BEFORE_EXPIRY','en_US','Notice of Subscription Expiry','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_BEFORE_EXPIRY','es_ES','Notificaci??n de expiraci??n de suscripci??n','{$subscriberName}:<br />\n<br />\n	Su suscripci??n a {$contextName} est?? a punto de expirar.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiraci??n: {$expiryDate}<br />\n<br />\n	Para asegurarse de que contin??a teniendo acceso a la revista entre en la p??gina web de la revista y renueve su suscripci??n.  Puede acceder al sistema con su nombre de usuario/a, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo electr??nico notifica al suscriptor que su subscripci??n va a expirar pronto.  Tambi??n proporciona la direcci??n URL de la revista e instrucciones para acceder a la misma.'),('SUBSCRIPTION_BEFORE_EXPIRY','pt_BR','Aviso de expira????o de assinatura','{$subscriberName}: <br />\n<br />\nSua assinatura do {$contextName} est?? prestes a expirar. <br />\n<br />\n{$subscriptionType} <br />\nData de validade: {$expiryDate} <br />\n<br />\nPara garantir a continuidade do seu acesso a esta revista, acesse o site da revista e renove sua assinatura. Voc?? pode fazer login no sistema com seu nome de usu??rio, &quot;{$username}&quot;. <br />\n<br />\nSe voc?? tiver alguma d??vida, n??o hesite em contactar-me. <br />\n<br />\n{$subscriptionContactSignature}','Esta mensagem avisa o assinante da proximidade do t??rmino da assinatura. Informa a URL da revista e instru????es de acesso.'),('SUBSCRIPTION_NOTIFY','en_US','Subscription Notification','{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_NOTIFY','es_ES','Notificaci??n de suscripci??n','{$subscriberName}:<br />\n<br />\nAcaba de registrarse como suscriptor/a en nuestro sistema de gesti??n de revistas online para la revista {$contextName}, a continuaci??n le mostramos los datos de su suscripci??n:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPara acceder al contenido exclusivo para suscriptores/as, simplemente tiene que identificarse con su nombre de usuaria/o, &quot;{$username}&quot;.<br />\n<br />\nUna vez se haya identificado en el sistema puede cambiar los detalles de su perfil y su contrase??a en cualquier momento.<br />\n<br />\nTenga en cuenta que si se trata de una suscripci??n institucional no es necesario que los/as usuarios/as de su instituci??n se identifiquen, ya que las peticiones de contenido bajo suscripci??n ser??n autentificadas autom??ticamente por el sistema.<br />\n<br />\nSi tiene cualquier pregunta no dude en contactar con nosotros/as.<br />\n<br />\n{$subscriptionContactSignature}','Este correo electr??nico notifica a un/a lector/a registrado/a que el/la Gestor/a les ha creado una suscripci??n. Proporciona la URL de la revista junto con instrucciones para acceder a ella.'),('SUBSCRIPTION_NOTIFY','pt_BR','Confirma????o de assinatura','{$subscriberName}: <br />\n<br />\nAgora voc?? foi registrado como assinante em nossa {$contextName}, com a seguinte assinatura: <br />\n<br />\n{$subscriptionType} <br />\n<br />\nPara acessar o conte??do dispon??vel apenas para assinantes, basta fazer login no sistema com seu nome de usu??rio,  &quot;{$username} &quot;. <br />\n<br />\nDepois de fazer login no sistema, voc?? poder?? alterar os detalhes e a senha do seu perfil a qualquer momento. <br />\n<br />\nObserve que se voc?? possui uma assinatura institucional, n??o ?? necess??rio que os usu??rios da sua institui????o efetuem login, pois as solicita????es de conte??do da assinatura ser??o automaticamente autenticadas pelo sistema. <br />\n<br />\nSe voc?? tiver alguma d??vida, por favor n??o hesite em contactar-me. <br />\n<br />\n{$subscriptionContactSignature}','Mensagem notifica o leitor cadastrado que o Editor criou sua Assinatura. Proporciona todas as informa????es necess??rias para acesso ao conte??do.'),('SUBSCRIPTION_PURCHASE_INDL','en_US','Subscription Purchase: Individual','An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INDL','es_ES','Compra de suscripci??n: Individual','Se ha adquirido en l??nea una suscripci??n individual para {$contextName} con los detalles siguientes:<br />\n<br />\nTipo de suscripci??n:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$userDetails}<br />\n<br />\nInformaci??n de membres??a (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripci??n, use la siguiente URL.<br />\n<br />\nURL de la suscripci??n: {$subscriptionUrl}<br />\n','Este correo electr??nico notifica al administrador/a de suscripciones que una suscripci??n individual ha sido adquirida en l??nea. Proporciona un resumen de la informaci??n sobre la suscripci??n y un enlace de acceso r??pido a la suscripci??n adquirida.'),('SUBSCRIPTION_PURCHASE_INDL','pt_BR','Aquisi????o de Assinatura: Individual','Uma assinatura individual foi comprada on-line para {$contextName} com os seguintes detalhes. <br />\n<br />\nTipo de Assinatura: <br />\n{$subscriptionType} <br />\n<br />\nUsu??rio: <br />\n{$userDetails} <br />\n<br />\nInforma????es Assinatura (se informado): <br />\n{$membership} <br />\n<br />\nPara visualizar ou editar esta assinatura, use a seguinte URL. <br />\n<br />\nURL da Assinatura: {$subscriptionUrl} <br />\n','Esta mensagem notifica o Gerente de Assinaturas que uma assinatura individual foi adquirida online. Oferece informa????es sobre a assinatura e um link para acesso r??pido ?? mesma.'),('SUBSCRIPTION_PURCHASE_INSTL','en_US','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INSTL','es_ES','Compra de suscripci??n: Institucional','Se ha adquirido en l??nea una suscripci??n institucional para {$contextName} con los siguientes detalles. Para activar la suscripci??n, use el enlace proporcionado y configure el estado de la suscripci??n como \'Activo\'.<br />\n<br />\nTipo de suscripci??n:<br />\n{$subscriptionType}<br />\n<br />\nInstituci??n:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos de IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$userDetails}<br />\n<br />\nInformaci??n de membres??a (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripci??n, use el siguiente enlace.<br />\n<br />\nEnlace de la suscripci??n: {$subscriptionUrl}<br />\n','Este correo electr??nico notifica al administrador/a de suscripciones que una suscripci??n institucional ha sido adquirida en l??nea. Proporciona informaci??n resumida sobre la suscripci??n y un enlace de acceso r??pido a la suscripci??n adquirida.'),('SUBSCRIPTION_PURCHASE_INSTL','pt_BR','Aquisi????o de Assinatura: Institucional','Uma assinatura institucional foi comprada on-line para {$contextName} com os seguintes detalhes. Para ativar esta assinatura, use a URL fornecida e defina o status da assinatura como \'Ativo\'. <br />\n<br />\nTipo de Assinatura: <br />\n{$subscriptionType} <br />\n<br />\nInstitui????o: <br />\n{$institutionName} <br />\n{$institutionMailingAddress} <br />\n<br />\nDom??nio (se fornecido): <br />\n{$domain} <br />\n<br />\nIntervalos de IP (se houver): <br />\n{$ipRanges} <br />\n<br />\nPessoa de Contato: <br />\n{$userDetails} <br />\n<br />\nInforma????es sobre a Assinatura (se houver): <br />\n{$membership} <br />\n<br />\nPara visualizar ou editar esta assinatura, use a seguinte URL. <br />\n<br />\nURL da Assinatura: {$subscriptionUrl} <br />\n','Esta mensagem notifica o Editor Gerente que uma assinatura institucional foi adquirida online. Oferece informa????es sobre a assinatura e um link para acesso r??pido ?? mesma.'),('SUBSCRIPTION_RENEW_INDL','en_US','Subscription Renewal: Individual','An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INDL','es_ES','Renovaci??n de suscripci??n: Individual','Una suscripci??n individual ha sido renovada en l??nea para {$contextName} con los siguientes detalles.<br />\n<br />\nTipo de suscripci??n:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$userDetails}<br />\n<br />\nInformaci??n de membres??a (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripci??n use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripci??n: {$subscriptionUrl}<br />\n','Este correo notifica al administrador/a de suscripciones que una suscripci??n individual se ha renovado en l??nea. Proporciona informaci??n resumida sobre la suscripci??n y  un enlace de acceso r??pido a la suscripci??n renovada.'),('SUBSCRIPTION_RENEW_INDL','pt_BR','Renova????o de Assinatura Individual','Uma assinatura individual foi renovada online para {$contextName} com os seguintes detalhes. <br />\n<br />\nTipo de Assinatura: <br />\n{$subscriptionType} <br />\n<br />\nUsu??rio: <br />\n{$userDetails} <br />\n<br />\nInforma????es sobre a Assinatura (se houver): <br />\n{$membership} <br />\n<br />\nPara visualizar ou editar esta assinatura, use a seguinte URL. <br />\n<br />\nURL de inscri????o: {$subscriptionUrl} <br />\n','Esta mensagem notifica o Editor Gerente que uma assinatura individual foi renovada online. Oferece informa????es sobre a assinatura e um link para acesso r??pido ?? mesma.'),('SUBSCRIPTION_RENEW_INSTL','en_US','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INSTL','es_ES','Renovaci??n de suscripci??n: Institucional','Se ha renovado en l??nea una suscripci??n institucional para {$contextName} con los detalles siguientes.<br />\n<br />\nTipo de suscripci??n:<br />\n{$subscriptionType}<br />\n<br />\nInstituci??n:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$userDetails}<br />\n<br />\nInformaci??n de membres??a (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripci??n use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripci??n: {$subscriptionUrl}<br />\n','Este correo en l??nea notifica al administrador/a de suscripciones que una suscripci??n institucional ha sido renovada en l??nea. Proporciona informaci??n resumida de la suscripci??n y un enlace de acceso r??pido a la suscripci??n renovada.'),('SUBSCRIPTION_RENEW_INSTL','pt_BR','Renova????o de Assinatura Institucional','Uma assinatura institucional foi renovada online para {$contextName} com os seguintes detalhes. <br />\n<br />\nTipo de Assinatura: <br />\n{$subscriptionType} <br />\n<br />\nInstitui????o: <br />\n{$institutionName} <br />\n{$institutionMailingAddress} <br />\n<br />\nDom??nio (se fornecido): <br />\n{$domain} <br />\n<br />\nIntervalos de IP (se houver): <br />\n{$ipRanges} <br />\n<br />\nPessoa de Contato: <br />\n{$userDetails} <br />\n<br />\nInforma????es sobre membros (se houver): <br />\n{$membership} <br />\n<br />\nPara visualizar ou editar esta assinatura, use a seguinte URL. <br />\n<br />\nURL da Assinatura: {$subscriptionUrl} <br />\n','Esta mensagem notifica o Editor Gerente que uma assinatura institucional foi renovada online. Oferece informa????es sobre a assinatura e um link para acesso r??pido ?? mesma.'),('USER_REGISTER','en_US','Journal Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','es_ES','Nuevo registro de usuaria/o','{$userFullName}<br />\n<br />\nSe ha registrado con ??xito como usuario/a en {$contextName}. En este correo se incluyen su nombre de usuario/a y contrase??a, datos necesarios para realizar cualquier tarea relacionada con la revista a trav??s de la p??gina web. En cualquier momento puede solicitar que se le elimine de la lista de usuarios/as de la revista contact??ndome.<br />\n<br />\nNombre de usuario/a: {$username}<br />\nContrase??a: {$password}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo se env??a a un/a usuario/a que se acaba de registrar para darle la bienvenida al sistema y proporcionarle sus datos de acceso.'),('USER_REGISTER','pt_BR','Cadastro no Peri??dico','{$userFullName}<br />\n<br />\nAgora voc?? foi cadastrado como um usu??rio em {$contextName}. Inclu??mos seu nome de usu??rio e senha neste e-mail, necess??rios para todo o trabalho neste peri??dico por meio de seu site. A qualquer momento, voc?? pode pedir para ser removido da lista de usu??rios da revista entrando em contato comigo.<br />\n<br />\nUsu??rio: {$username}<br />\nSenha: {$password}<br />\n<br />\nAtenciosamente,<br />\n{$principalContactSignature}','Esta mensagem ?? enviada aos usu??rios rec??m-cadastrados no sistema, para dar-lhes as boas-vindas e deixar registrado seu login e senha.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),('USER_VALIDATE','es_ES','Activaci??n de cuenta','Estimado/a {$userFullName}<br />\n<br />\nHa creado una cuenta de usuario/a en {$contextName}, pero antes de poder utilizarla debe validar su correo electr??nico. Para ello, simplemente haga clic en el siguiente enlace:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo electr??nico se env??a a los usuarios/as reci??n registrados para que validen su cuenta de correo.'),('USER_VALIDATE','pt_BR','Valide seu Cadastro','{$userFullName}<br />\n<br />\nVoc?? criou uma conta no peri??dico {$contextName}, mas antes de come??ar a us??-la, voc?? precisa validar sua conta de e-mail. Para fazer isso, basta clicar no link abaixo:<br />\n<br />\n{$activateUrl}<br />\n<br />\nAtenciosamente,<br />\n{$principalContactSignature}','Esta mensagem ?? enviada a um novo usu??rio cadastrado, para valida????o do cadastro.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  KEY `email_settings_email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(2,'mods34=>mods34-xml','plugins.metadata.mods34.mods34XmlOutput.displayName','plugins.metadata.mods34.mods34XmlOutput.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(*)','xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),(3,'article=>mods34','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),(4,'mods34=>article','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)','class::classes.submission.Submission'),(5,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),(6,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string'),(7,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(9,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),(11,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),(13,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(14,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.Author[]'),(15,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(16,'SubmissionArtworkFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionArtworkFile','xml::schema(plugins/importexport/native/native.xsd)'),(17,'SupplementaryFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SupplementaryFile','xml::schema(plugins/importexport/native/native.xsd)'),(18,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(19,'native-xml=>SubmissionArtworkFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionArtworkFile'),(20,'native-xml=>SupplementaryFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SupplementaryFile'),(21,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.ArticleGalley','xml::schema(plugins/importexport/native/native.xsd)'),(22,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.ArticleGalley[]'),(23,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(24,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(25,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(26,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(27,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd'),(28,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(29,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(30,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.article.ArticleGalley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(31,'issue=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.issue.Issue[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(32,'article=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.submission.Submission[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(33,'galley=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.article.ArticleGalley[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(34,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(35,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(36,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(37,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(2,2,0,'MODS 3.4','lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter',0,0,0),(3,3,0,'Extract metadata from a(n) Submission','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(4,4,0,'Inject metadata into a(n) Submission','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(5,5,0,'DOAJ XML export','plugins.importexport.doaj.filter.DOAJXmlFilter',0,0,0),(6,6,0,'DOAJ JSON export','plugins.importexport.doaj.filter.DOAJJsonFilter',0,0,0),(7,7,0,'Native XML submission export','plugins.importexport.native.filter.ArticleNativeXmlFilter',0,0,0),(8,8,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlArticleFilter',0,0,0),(9,9,0,'Native XML issue export','plugins.importexport.native.filter.IssueNativeXmlFilter',0,0,0),(10,10,0,'Native XML issue import','plugins.importexport.native.filter.NativeXmlIssueFilter',0,0,0),(11,11,0,'Native XML issue galley export','plugins.importexport.native.filter.IssueGalleyNativeXmlFilter',0,0,0),(12,12,0,'Native XML issue galley import','plugins.importexport.native.filter.NativeXmlIssueGalleyFilter',0,0,0),(13,13,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(14,14,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(15,18,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArticleFileFilter',0,0,0),(16,19,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArtworkFileFilter',0,0,0),(17,20,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter',0,0,0),(18,15,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(19,16,0,'Native XML submission file export','plugins.importexport.native.filter.ArtworkFileNativeXmlFilter',0,0,0),(20,17,0,'Native XML submission file export','plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter',0,0,0),(21,21,0,'Native XML representation export','plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter',0,0,0),(22,22,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlArticleGalleyFilter',0,0,0),(23,23,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(24,24,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(25,25,0,'Crossref XML issue export','plugins.importexport.crossref.filter.IssueCrossrefXmlFilter',0,0,0),(26,26,0,'Crossref XML issue export','plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter',0,0,0),(27,27,0,'ArticlePubMedXmlFilter','plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter',0,0,0),(28,28,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(29,29,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(30,30,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(31,31,0,'mEDRA XML issue export','plugins.importexport.medra.filter.IssueMedraXmlFilter',0,0,0),(32,32,0,'mEDRA XML article export','plugins.importexport.medra.filter.ArticleMedraXmlFilter',0,0,0),(33,33,0,'mEDRA XML article export','plugins.importexport.medra.filter.GalleyMedraXmlFilter',0,0,0),(34,34,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(35,35,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(36,36,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(37,37,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` tinyint(4) NOT NULL DEFAULT 0,
  `supplementary` tinyint(4) DEFAULT 0,
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscription_ip`
--

DROP TABLE IF EXISTS `institutional_subscription_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscription_ip`
--

LOCK TABLES `institutional_subscription_ip` WRITE;
/*!40000 ALTER TABLE `institutional_subscription_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscription_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscriptions`
--

DROP TABLE IF EXISTS `institutional_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscriptions`
--

LOCK TABLES `institutional_subscriptions` WRITE;
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_files`
--

LOCK TABLES `issue_files` WRITE;
/*!40000 ALTER TABLE `issue_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galley_settings`
--

DROP TABLE IF EXISTS `issue_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galley_settings`
--

LOCK TABLES `issue_galley_settings` WRITE;
/*!40000 ALTER TABLE `issue_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galleys`
--

DROP TABLE IF EXISTS `issue_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`),
  KEY `issue_galleys_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galleys`
--

LOCK TABLES `issue_galleys` WRITE;
/*!40000 ALTER TABLE `issue_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_settings`
--

DROP TABLE IF EXISTS `issue_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `current` tinyint(4) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL DEFAULT 1,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL DEFAULT 0,
  `show_number` tinyint(4) NOT NULL DEFAULT 0,
  `show_year` tinyint(4) NOT NULL DEFAULT 0,
  `show_title` tinyint(4) NOT NULL DEFAULT 0,
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`),
  KEY `issues_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_views`
--

DROP TABLE IF EXISTS `item_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` varchar(32) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_views`
--

LOCK TABLES `item_views` WRITE;
/*!40000 ALTER TABLE `item_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_description_settings`
--

LOCK TABLES `metadata_description_settings` WRITE;
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_descriptions`
--

LOCK TABLES `metadata_descriptions` WRITE;
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` tinyint(4) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0,
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,0,0),(2,1,2,0,1),(3,1,3,0,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `url` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,NULL,'NMI_TYPE_USER_LOGOUT');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,0,'user','User Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_list`
--

LOCK TABLES `notification_mail_list` WRITE;
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','a:29:{i:0;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:1;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:2;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:3;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:4;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:5;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:6;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:7;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:8;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:9;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:10;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:11;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:12;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:13;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:14;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:15;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:16;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:17;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:18;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:19;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:20;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:21;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:22;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:23;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:24;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:25;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:26;a:3:{s:9:\"className\";s:35:\"lib.pkp.classes.task.ReviewReminder\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:27;a:3:{s:9:\"className\";s:37:\"lib.pkp.classes.task.StatisticsReport\";s:9:\"frequency\";a:1:{s:3:\"day\";s:1:\"1\";}s:4:\"args\";a:0:{}}i:28;a:3:{s:9:\"className\";s:40:\"classes.tasks.SubscriptionExpiryReminder\";s:9:\"frequency\";a:1:{s:3:\"day\";s:1:\"1\";}s:4:\"args\";a:0:{}}}','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('ldapauthplugin',0,'enabled','1','bool'),('ldapauthplugin',0,'ldapBindPassword','xaiWe3Neing0waQuee','string'),('ldapauthplugin',0,'ldapBindUser','cn=guest,dc=example,dc=com','string'),('ldapauthplugin',0,'ldapFilter','(uid=%USER%)','string'),('ldapauthplugin',0,'ldapLocalLoginOrder','after','string'),('ldapauthplugin',0,'ldapSelfServiceUrl','','string'),('ldapauthplugin',0,'ldapSuffix','dc=example,dc=com','string'),('ldapauthplugin',0,'ldapUrl','ldap://ldap.example.com','string'),('tinymceplugin',0,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','a:2:{i:0;s:4:\"city\";i:1;s:6:\"region\";}','object');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galley_settings`
--

DROP TABLE IF EXISTS `publication_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galley_settings`
--

LOCK TABLES `publication_galley_settings` WRITE;
/*!40000 ALTER TABLE `publication_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galleys`
--

DROP TABLE IF EXISTS `publication_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_publication_id` (`publication_id`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_status` bigint(20) DEFAULT 0,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `submission_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT 1,
  `seq` double NOT NULL DEFAULT 0,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT 0,
  `declined` tinyint(4) NOT NULL DEFAULT 0,
  `cancelled` tinyint(4) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT 1,
  `review_method` tinyint(4) NOT NULL DEFAULT 1,
  `round` tinyint(4) NOT NULL DEFAULT 1,
  `step` tinyint(4) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`file_id`),
  KEY `review_files_review_id` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL DEFAULT 1,
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`file_id`,`revision`),
  KEY `review_round_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES ('classes.tasks.SubscriptionExpiryReminder','2023-01-06 13:00:14'),('lib.pkp.classes.task.ReviewReminder','2023-01-06 13:00:14'),('lib.pkp.classes.task.StatisticsReport','2023-01-06 13:00:14'),('plugins.generic.usageStats.UsageStatsLoader','2023-01-06 13:00:14'),('plugins.importexport.crossref.CrossrefInfoSender','2023-01-06 13:00:14'),('plugins.importexport.datacite.DataciteInfoSender','2023-01-06 13:00:14'),('plugins.importexport.doaj.DOAJInfoSender','2023-01-06 13:00:14'),('plugins.importexport.medra.MedraInfoSender','2023-01-06 13:00:14');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT 0,
  `editor_restricted` tinyint(4) NOT NULL DEFAULT 0,
  `meta_indexed` tinyint(4) NOT NULL DEFAULT 0,
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT 1,
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT 0,
  `hide_title` tinyint(4) NOT NULL DEFAULT 0,
  `hide_author` tinyint(4) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` tinyint(4) NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('du0hpg9qfea0csk1g7frk0nnag',1,'191.52.39.101','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:108.0) Gecko/20100101 Firefox/108.0',1673010003,1673010359,1,'csrf|a:2:{s:9:\"timestamp\";i:1673010359;s:5:\"token\";s:32:\"635d11d426dfc2cbe2a851861ab0bcca\";}userId|s:1:\"1\";username|s:5:\"admin\";','example.com');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT 0,
  `primary_locale` varchar(14) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(1024) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'en_US',6,'a:3:{i:0;s:5:\"es_ES\";i:1;s:5:\"pt_BR\";i:2;s:5:\"en_US\";}','a:3:{i:0;s:5:\"es_ES\";i:1;s:5:\"pt_BR\";i:2;s:5:\"en_US\";}',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('contactEmail','en_US','youremail@yourhost.com'),('contactName','en_US','Open Journal Systems'),('contactName','es_ES','Open Journal Systems'),('contactName','pt_BR','Open Journal Systems'),('themePluginPath','','default');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` tinyint(4) NOT NULL DEFAULT 0,
  `can_change_metadata` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subeditor_submission_group` (
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`user_id`,`assoc_type`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_type`,`assoc_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_artwork_files`
--

DROP TABLE IF EXISTS `submission_artwork_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_artwork_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `caption` text DEFAULT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `copyright_owner_contact` text DEFAULT NULL,
  `permission_terms` text DEFAULT NULL,
  `permission_file_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `contact_author` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_artwork_files`
--

LOCK TABLES `submission_artwork_files` WRITE;
/*!40000 ALTER TABLE `submission_artwork_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_artwork_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL,
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  KEY `submission_search_object_submission` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_supplementary_files`
--

DROP TABLE IF EXISTS `submission_supplementary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_supplementary_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_supplementary_files`
--

LOCK TABLES `submission_supplementary_files` WRITE;
/*!40000 ALTER TABLE `submission_supplementary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_supplementary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_tombstones`
--

LOCK TABLES `submission_tombstones` WRITE;
/*!40000 ALTER TABLE `submission_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `submission_progress` tinyint(4) NOT NULL DEFAULT 1,
  `work_type` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_type_settings`
--

LOCK TABLES `subscription_type_settings` WRITE;
/*!40000 ALTER TABLE `subscription_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL DEFAULT 0,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT 0,
  `membership` tinyint(4) NOT NULL DEFAULT 0,
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_types`
--

LOCK TABLES `subscription_types` WRITE;
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT 1,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_temporary_records`
--

LOCK TABLES `usage_stats_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'es_ES','name','##default.groups.name.siteAdmin##','string'),(1,'pt_BR','name','##default.groups.name.siteAdmin##','string');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `show_title` tinyint(4) NOT NULL DEFAULT 1,
  `permit_self_registration` tinyint(4) NOT NULL DEFAULT 0,
  `permit_metadata_edit` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,0,0,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT 0,
  `assoc_id` bigint(20) DEFAULT 0,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'en_US','givenName',0,0,'admin','string'),(1,'en_US','familyName',0,0,'admin','string');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$EfmGAHaNV2RxCsHhjPkzoOSTArAj2kiN7GIOIkjjGbV/jS1X.BYXG','youremail@yourhost.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2023-01-06 13:00:01',NULL,'2023-01-06 13:00:26',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT 0,
  `minor` int(11) NOT NULL DEFAULT 0,
  `revision` int(11) NOT NULL DEFAULT 0,
  `build` int(11) NOT NULL DEFAULT 0,
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT 0,
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT 0,
  `sitewide` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2023-01-06 13:00:01',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2023-01-06 13:00:01',1,'plugins.metadata','mods34','',0,0),(1,0,0,0,'2023-01-06 13:00:01',1,'plugins.metadata','openurl10','',0,0),(1,0,0,0,'2023-01-06 13:00:01',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:01',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:01',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,1,0,0,'2023-01-06 13:00:01',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:01',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,1,0,'2023-01-06 13:00:02',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.gateways','resolver','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','driver','DRIVERPlugin',1,0),(1,0,1,0,'2023-01-06 13:00:02',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,1,0,0,'2023-01-06 13:00:02',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,2,0,0,'2023-01-06 13:00:02',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),(0,1,0,0,'2023-01-06 13:00:02',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','recommendBySimilarity','RecommendBySimilarityPlugin',1,1),(1,1,2,6,'2023-01-06 13:00:02',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,2,0,0,'2023-01-06 13:00:02',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,2,0,0,'2023-01-06 13:00:02',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,1,0,0,'2023-01-06 13:00:02',1,'plugins.importexport','doaj','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.importexport','native','',0,0),(2,1,0,0,'2023-01-06 13:00:02',1,'plugins.importexport','crossref','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.importexport','pubmed','',0,0),(2,0,0,0,'2023-01-06 13:00:02',1,'plugins.importexport','datacite','',0,0),(2,0,0,0,'2023-01-06 13:00:02',1,'plugins.importexport','medra','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.oaiMetadataFormats','marc','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.oaiMetadataFormats','marcxml','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.reports','subscriptions','',0,0),(2,0,0,0,'2023-01-06 13:00:02',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.reports','articles','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.reports','views','',0,0),(1,1,0,0,'2023-01-06 13:00:02',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2023-01-06 13:00:02',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,2,1,4,'2023-01-06 12:59:57',1,'core','ojs2','',0,1),(0,1,1,0,'2023-01-06 13:04:35',1,'plugins.generic','ldap','LDAPAuthPlugin',1,1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 10:10:55
