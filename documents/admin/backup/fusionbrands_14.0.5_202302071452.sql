-- MySQL dump 10.19  Distrib 10.3.36-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: unboxerpcrm_fusionbrands
-- ------------------------------------------------------
-- Server version	10.3.36-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `llxas_accounting_account`
--

DROP TABLE IF EXISTS `llxas_accounting_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_accounting_account` (
  `rowid` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_pcg_version` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pcg_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_parent` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `labelshort` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_accounting_category` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `reconcilable` tinyint(4) NOT NULL DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_account` (`account_number`,`entity`,`fk_pcg_version`),
  KEY `idx_accounting_account_fk_pcg_version` (`fk_pcg_version`),
  KEY `idx_accounting_account_account_parent` (`account_parent`),
  CONSTRAINT `fk_accounting_account_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `llxas_accounting_system` (`pcg_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_accounting_account`
--

LOCK TABLES `llxas_accounting_account` WRITE;
/*!40000 ALTER TABLE `llxas_accounting_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_accounting_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_accounting_bookkeeping`
--

DROP TABLE IF EXISTS `llxas_accounting_bookkeeping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_accounting_bookkeeping` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `piece_num` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_ref` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_compte` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_compte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_operation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) DEFAULT NULL,
  `sens` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lettering_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journal_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_export` datetime DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_fk_doc` (`fk_doc`),
  KEY `idx_accounting_bookkeeping_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_numero_compte` (`numero_compte`,`entity`),
  KEY `idx_accounting_bookkeeping_code_journal` (`code_journal`,`entity`),
  KEY `idx_accounting_bookkeeping_piece_num` (`piece_num`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_accounting_bookkeeping`
--

LOCK TABLES `llxas_accounting_bookkeeping` WRITE;
/*!40000 ALTER TABLE `llxas_accounting_bookkeeping` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_accounting_bookkeeping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_accounting_bookkeeping_tmp`
--

DROP TABLE IF EXISTS `llxas_accounting_bookkeeping_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_accounting_bookkeeping_tmp` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_ref` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_compte` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_compte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_operation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lettering_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journal_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_num` int(11) NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_tmp_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_tmp_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_tmp_numero_compte` (`numero_compte`),
  KEY `idx_accounting_bookkeeping_tmp_code_journal` (`code_journal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_accounting_bookkeeping_tmp`
--

LOCK TABLES `llxas_accounting_bookkeeping_tmp` WRITE;
/*!40000 ALTER TABLE `llxas_accounting_bookkeeping_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_accounting_bookkeeping_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_accounting_fiscalyear`
--

DROP TABLE IF EXISTS `llxas_accounting_fiscalyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_accounting_fiscalyear` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_accounting_fiscalyear`
--

LOCK TABLES `llxas_accounting_fiscalyear` WRITE;
/*!40000 ALTER TABLE `llxas_accounting_fiscalyear` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_accounting_fiscalyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_accounting_groups_account`
--

DROP TABLE IF EXISTS `llxas_accounting_groups_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_accounting_groups_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_accounting_account` int(11) NOT NULL,
  `fk_c_accounting_category` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_accounting_groups_account`
--

LOCK TABLES `llxas_accounting_groups_account` WRITE;
/*!40000 ALTER TABLE `llxas_accounting_groups_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_accounting_groups_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_accounting_journal`
--

DROP TABLE IF EXISTS `llxas_accounting_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_accounting_journal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nature` smallint(6) NOT NULL DEFAULT 1,
  `active` smallint(6) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_journal_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_accounting_journal`
--

LOCK TABLES `llxas_accounting_journal` WRITE;
/*!40000 ALTER TABLE `llxas_accounting_journal` DISABLE KEYS */;
INSERT INTO `llxas_accounting_journal` (`rowid`, `entity`, `code`, `label`, `nature`, `active`) VALUES (1,1,'VT','ACCOUNTING_SELL_JOURNAL',2,1),(2,1,'AC','ACCOUNTING_PURCHASE_JOURNAL',3,1),(3,1,'BQ','FinanceJournal',4,1),(4,1,'OD','ACCOUNTING_MISCELLANEOUS_JOURNAL',1,1),(5,1,'AN','ACCOUNTING_HAS_NEW_JOURNAL',9,1),(6,1,'ER','ExpenseReportsJournal',5,1),(7,1,'INV','InventoryJournal',8,1);
/*!40000 ALTER TABLE `llxas_accounting_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_accounting_system`
--

DROP TABLE IF EXISTS `llxas_accounting_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_accounting_system` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_country` int(11) DEFAULT NULL,
  `pcg_version` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` smallint(6) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_accounting_system`
--

LOCK TABLES `llxas_accounting_system` WRITE;
/*!40000 ALTER TABLE `llxas_accounting_system` DISABLE KEYS */;
INSERT INTO `llxas_accounting_system` (`rowid`, `fk_country`, `pcg_version`, `label`, `active`) VALUES (38,11,'US-BASE','USA basic chart of accounts',1),(39,14,'CA-ENG-BASE','Canadian basic chart of accounts - English',1),(42,154,'SAT/24-2019','Catalogo y codigo agrupador fiscal del 2019',1);
/*!40000 ALTER TABLE `llxas_accounting_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_actioncomm`
--

DROP TABLE IF EXISTS `llxas_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_actioncomm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `fk_action` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `fk_user_action` int(11) DEFAULT NULL,
  `fk_user_done` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `visibility` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `fulldayevent` smallint(6) NOT NULL DEFAULT 0,
  `percent` smallint(6) NOT NULL DEFAULT 0,
  `location` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calling_duration` int(11) DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_msgid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_tocc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_tobcc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `errors_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_vote` int(11) DEFAULT NULL,
  `event_paid` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `recurid` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurrule` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recurdateend` datetime DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `elementtype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_actioncomm_ref` (`ref`,`entity`),
  KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  KEY `idx_actioncomm_code` (`code`),
  KEY `idx_actioncomm_fk_element` (`fk_element`),
  KEY `idx_actioncomm_fk_user_action` (`fk_user_action`),
  KEY `idx_actioncomm_fk_project` (`fk_project`),
  KEY `idx_actioncomm_datep` (`datep`),
  KEY `idx_actioncomm_datep2` (`datep2`),
  KEY `idx_actioncomm_recurid` (`recurid`),
  KEY `idx_actioncomm_ref_ext` (`ref_ext`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_actioncomm`
--

LOCK TABLES `llxas_actioncomm` WRITE;
/*!40000 ALTER TABLE `llxas_actioncomm` DISABLE KEYS */;
INSERT INTO `llxas_actioncomm` (`id`, `ref`, `ref_ext`, `entity`, `datep`, `datep2`, `fk_action`, `code`, `datec`, `tms`, `fk_user_author`, `fk_user_mod`, `fk_project`, `fk_soc`, `fk_contact`, `fk_parent`, `fk_user_action`, `fk_user_done`, `transparency`, `priority`, `visibility`, `fulldayevent`, `percent`, `location`, `durationp`, `label`, `note`, `calling_duration`, `email_subject`, `email_msgid`, `email_from`, `email_sender`, `email_to`, `email_tocc`, `email_tobcc`, `errors_to`, `reply_to`, `num_vote`, `event_paid`, `status`, `recurid`, `recurrule`, `recurdateend`, `fk_element`, `elementtype`, `import_key`, `extraparams`) VALUES (1,'1',NULL,1,'2022-11-09 13:30:22','2022-11-09 13:30:22',40,'AC_COMPANY_CREATE','2022-11-09 13:30:22','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Third party Mat Sweet created','Author: admin\nThird party Mat Sweet created',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2',NULL,1,'2022-11-09 13:31:03','2022-11-09 13:31:03',40,'AC_CONTACT_CREATE','2022-11-09 13:31:03','2023-01-25 00:17:13',1,NULL,NULL,1,1,0,1,NULL,0,0,'default',0,-1,'',NULL,'Contact Matt Sweet created','Author: admin\nContact Matt Sweet created',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'3',NULL,1,'2022-11-09 16:48:30','2022-11-09 16:48:30',40,'AC_CONTACT_CREATE','2022-11-09 16:48:30','2023-01-25 00:17:13',1,NULL,NULL,1,2,0,1,NULL,0,0,'default',0,-1,'',NULL,'Contact Jane Sweet created','Author: admin\nContact Jane Sweet created',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'4',NULL,1,'2022-11-09 16:58:16','2022-11-09 16:58:16',40,'AC_PROPAL_VALIDATE','2022-11-09 16:58:16','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Proposal PR110922-00001 validated','Author: admin\nProposal PR110922-00001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,'propal',NULL,NULL),(5,'5',NULL,1,'2022-11-09 16:58:28','2022-11-09 16:58:28',40,'AC_PROPAL_CLOSE_SIGNED','2022-11-09 16:58:28','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Proposal PR110922-00001 signed','Author: admin\nProposal PR110922-00001 signed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,'propal',NULL,NULL),(6,'6',NULL,1,'2022-11-09 17:00:05','2022-11-09 17:00:05',40,'AC_ORDER_VALIDATE','2022-11-09 17:00:05','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order CO2209-0001 validated','Author: admin\nOrder CO2209-0001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,'order',NULL,NULL),(7,'7',NULL,1,'2022-11-09 17:02:09','2022-11-09 17:02:09',40,'AC_COMPANY_CREATE','2022-11-09 17:02:09','2023-01-25 00:17:13',1,NULL,NULL,2,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Third party VENDOR 1 created','Author: admin\nThird party VENDOR 1 created',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'8',NULL,1,'2022-11-09 17:17:33','2022-11-09 17:17:33',40,'AC_ORDER_CLOSE','2022-11-09 17:17:33','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order (PROV1) classified delivered','Author: admin\nOrder (PROV1) classified delivered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,'shipping',NULL,NULL),(9,'9',NULL,1,'2022-11-09 17:17:33','2022-11-09 17:17:33',40,'AC_SHIPPING_VALIDATE','2022-11-09 17:17:33','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Shipment SH110922-00001 validated','Author: admin\nShipment SH110922-00001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,1,'shipping',NULL,NULL),(10,'10',NULL,1,'2022-11-09 17:19:30','2022-11-09 17:19:30',40,'AC_ORDER_VALIDATE','2022-11-09 17:19:30','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order CO2211-0002 validated','Author: admin\nOrder CO2211-0002 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,3,'order',NULL,NULL),(11,'11',NULL,1,'2023-01-23 12:37:09','2023-01-23 12:37:09',40,'AC_ORDER_VALIDATE','2023-01-23 12:37:09','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order SO2022-00001 validated','Author: admin\nOrder SO2022-00001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2,'order',NULL,NULL),(12,'12',NULL,1,'2023-01-23 12:38:43','2023-01-23 12:38:43',40,'AC_SHIPPING_DELETE','2023-01-23 12:38:43','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Record (PROV3) deleted','Author: admin\nRecord (PROV3) deleted',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,3,'shipping',NULL,NULL),(13,'13',NULL,1,'2023-01-23 13:04:06','2023-01-23 13:04:06',40,'AC_ORDER_VALIDATE','2023-01-23 13:04:06','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order SO2022-00001 validated','Author: admin\nOrder SO2022-00001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2,'order',NULL,NULL),(14,'14',NULL,1,'2023-01-23 13:10:40','2023-01-23 13:10:40',40,'AC_ORDER_VALIDATE','2023-01-23 13:10:40','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order SO2022-00001 validated','Author: admin\nOrder SO2022-00001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2,'order',NULL,NULL),(15,'15',NULL,1,'2023-01-23 13:11:22','2023-01-23 13:11:22',40,'AC_ORDER_VALIDATE','2023-01-23 13:11:22','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order SO2022-00001 validated','Author: admin\nOrder SO2022-00001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2,'order',NULL,NULL),(16,'16',NULL,1,'2023-01-23 17:36:37','2023-01-23 17:36:37',40,'AC_ORDER_VALIDATE','2023-01-23 17:36:37','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order SO2022-00001 validated','Author: admin\nOrder SO2022-00001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2,'order',NULL,NULL),(17,'17',NULL,1,'2023-01-23 18:09:24','2023-01-23 18:09:24',40,'AC_ORDER_VALIDATE','2023-01-23 18:09:24','2023-01-25 00:17:13',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order SO2022-00001 validated','Author: admin\nOrder SO2022-00001 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,2,'order',NULL,NULL),(18,'18',NULL,1,'2023-02-07 13:19:39','2023-02-07 13:19:39',40,'AC_ORDER_VALIDATE','2023-02-07 13:19:39','2023-02-07 18:19:39',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order CO2211-0002 validated','Author: admin\nOrder CO2211-0002 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,3,'order',NULL,NULL),(19,'19',NULL,1,'2023-02-07 13:22:53','2023-02-07 13:22:53',40,'AC_PRODUCT_MODIFY','2023-02-07 13:22:53','2023-02-07 18:22:53',1,NULL,NULL,NULL,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Product DP611 modified','Author: admin\nProduct DP611 modified',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,70,'product',NULL,NULL),(20,'20',NULL,1,'2023-02-07 13:27:16','2023-02-07 13:27:16',40,'AC_ORDER_VALIDATE','2023-02-07 13:27:16','2023-02-07 18:27:16',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order SO2022-00004 validated','Author: admin\nOrder SO2022-00004 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,4,'order',NULL,NULL),(21,'21',NULL,1,'2023-02-07 13:43:19','2023-02-07 13:43:19',40,'AC_ORDER_VALIDATE','2023-02-07 13:43:19','2023-02-07 18:43:19',1,NULL,NULL,1,NULL,0,1,NULL,0,0,'default',0,-1,'',NULL,'Order SO2023-00005 validated','Author: admin\nOrder SO2023-00005 validated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,5,'order',NULL,NULL);
/*!40000 ALTER TABLE `llxas_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_actioncomm_extrafields`
--

DROP TABLE IF EXISTS `llxas_actioncomm_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_actioncomm_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_actioncomm_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_actioncomm_extrafields`
--

LOCK TABLES `llxas_actioncomm_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_actioncomm_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_actioncomm_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_actioncomm_reminder`
--

DROP TABLE IF EXISTS `llxas_actioncomm_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_actioncomm_reminder` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `dateremind` datetime NOT NULL,
  `typeremind` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user` int(11) NOT NULL,
  `offsetvalue` int(11) NOT NULL,
  `offsetunit` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `lasterror` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_actioncomm` int(11) NOT NULL,
  `fk_email_template` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_reminder_unique` (`fk_actioncomm`,`fk_user`,`typeremind`,`offsetvalue`,`offsetunit`),
  KEY `idx_actioncomm_reminder_dateremind` (`dateremind`),
  KEY `idx_actioncomm_reminder_fk_user` (`fk_user`),
  KEY `idx_actioncomm_reminder_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_actioncomm_reminder`
--

LOCK TABLES `llxas_actioncomm_reminder` WRITE;
/*!40000 ALTER TABLE `llxas_actioncomm_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_actioncomm_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_actioncomm_resources`
--

DROP TABLE IF EXISTS `llxas_actioncomm_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_actioncomm_resources` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_actioncomm` int(11) NOT NULL,
  `element_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_element` int(11) NOT NULL,
  `answer_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `transparency` smallint(6) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_resources` (`fk_actioncomm`,`element_type`,`fk_element`),
  KEY `idx_actioncomm_resources_fk_element` (`fk_element`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_actioncomm_resources`
--

LOCK TABLES `llxas_actioncomm_resources` WRITE;
/*!40000 ALTER TABLE `llxas_actioncomm_resources` DISABLE KEYS */;
INSERT INTO `llxas_actioncomm_resources` (`rowid`, `fk_actioncomm`, `element_type`, `fk_element`, `answer_status`, `mandatory`, `transparency`) VALUES (1,1,'user',1,'0',0,0),(2,2,'user',1,'0',0,0),(3,2,'socpeople',1,'0',0,0),(4,3,'user',1,'0',0,0),(5,3,'socpeople',2,'0',0,0),(6,4,'user',1,'0',0,0),(7,5,'user',1,'0',0,0),(8,6,'user',1,'0',0,0),(9,7,'user',1,'0',0,0),(10,8,'user',1,'0',0,0),(11,9,'user',1,'0',0,0),(12,10,'user',1,'0',0,0),(13,11,'user',1,'0',0,0),(14,12,'user',1,'0',0,0),(15,13,'user',1,'0',0,0),(16,14,'user',1,'0',0,0),(17,15,'user',1,'0',0,0),(18,16,'user',1,'0',0,0),(19,17,'user',1,'0',0,0),(20,18,'user',1,'0',0,0),(21,19,'user',1,'0',0,0),(22,20,'user',1,'0',0,0),(23,21,'user',1,'0',0,0);
/*!40000 ALTER TABLE `llxas_actioncomm_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_adherent`
--

DROP TABLE IF EXISTS `llxas_adherent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_adherent` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civility` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_crypted` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_adherent_type` int(11) NOT NULL,
  `morphy` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `societe` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialnetworks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snapchat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_perso` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `public` smallint(6) NOT NULL DEFAULT 0,
  `datefin` datetime DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `canvas` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`),
  CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `llxas_adherent_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_adherent`
--

LOCK TABLES `llxas_adherent` WRITE;
/*!40000 ALTER TABLE `llxas_adherent` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_adherent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_adherent_extrafields`
--

DROP TABLE IF EXISTS `llxas_adherent_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_adherent_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_adherent_extrafields`
--

LOCK TABLES `llxas_adherent_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_adherent_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_adherent_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_adherent_type`
--

DROP TABLE IF EXISTS `llxas_adherent_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_adherent_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `morphy` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `amount` double(24,8) DEFAULT NULL,
  `vote` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_valid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_adherent_type`
--

LOCK TABLES `llxas_adherent_type` WRITE;
/*!40000 ALTER TABLE `llxas_adherent_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_adherent_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_adherent_type_extrafields`
--

DROP TABLE IF EXISTS `llxas_adherent_type_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_adherent_type_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_type_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_adherent_type_extrafields`
--

LOCK TABLES `llxas_adherent_type_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_adherent_type_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_adherent_type_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_adherent_type_lang`
--

DROP TABLE IF EXISTS `llxas_adherent_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_adherent_type_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_type` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_adherent_type_lang`
--

LOCK TABLES `llxas_adherent_type_lang` WRITE;
/*!40000 ALTER TABLE `llxas_adherent_type_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_adherent_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_advtargetemailing`
--

DROP TABLE IF EXISTS `llxas_advtargetemailing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_advtargetemailing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_element` int(11) NOT NULL,
  `type_element` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtervalue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_advtargetemailing_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_advtargetemailing`
--

LOCK TABLES `llxas_advtargetemailing` WRITE;
/*!40000 ALTER TABLE `llxas_advtargetemailing` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_advtargetemailing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_asset`
--

DROP TABLE IF EXISTS `llxas_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_asset` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_ht` double(24,8) DEFAULT NULL,
  `amount_vat` double(24,8) DEFAULT NULL,
  `fk_asset_type` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_asset_rowid` (`rowid`),
  KEY `idx_asset_ref` (`ref`),
  KEY `idx_asset_entity` (`entity`),
  KEY `idx_asset_fk_asset_type` (`fk_asset_type`),
  CONSTRAINT `fk_asset_asset_type` FOREIGN KEY (`fk_asset_type`) REFERENCES `llxas_asset_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_asset`
--

LOCK TABLES `llxas_asset` WRITE;
/*!40000 ALTER TABLE `llxas_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_asset_extrafields`
--

DROP TABLE IF EXISTS `llxas_asset_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_asset_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_asset_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_asset_extrafields`
--

LOCK TABLES `llxas_asset_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_asset_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_asset_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_asset_type`
--

DROP TABLE IF EXISTS `llxas_asset_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_asset_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountancy_code_asset` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_depreciation_asset` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_depreciation_expense` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_asset_type_label` (`label`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_asset_type`
--

LOCK TABLES `llxas_asset_type` WRITE;
/*!40000 ALTER TABLE `llxas_asset_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_asset_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_asset_type_extrafields`
--

DROP TABLE IF EXISTS `llxas_asset_type_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_asset_type_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_asset_type_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_asset_type_extrafields`
--

LOCK TABLES `llxas_asset_type_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_asset_type_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_asset_type_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bank`
--

DROP TABLE IF EXISTS `llxas_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bank` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_rappro` int(11) DEFAULT NULL,
  `fk_type` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_releve` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_chq` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_compte` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rappro` tinyint(4) DEFAULT 0,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bordereau` int(11) DEFAULT 0,
  `banque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emetteur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_datev` (`datev`),
  KEY `idx_bank_dateo` (`dateo`),
  KEY `idx_bank_fk_account` (`fk_account`),
  KEY `idx_bank_rappro` (`rappro`),
  KEY `idx_bank_num_releve` (`num_releve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bank`
--

LOCK TABLES `llxas_bank` WRITE;
/*!40000 ALTER TABLE `llxas_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bank_account`
--

DROP TABLE IF EXISTS `llxas_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bank_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `bank` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban_prefix` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_iban` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_iban` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domiciliation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `proprio` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courant` smallint(6) NOT NULL DEFAULT 0,
  `clos` smallint(6) NOT NULL DEFAULT 0,
  `rappro` smallint(6) DEFAULT 1,
  `url` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_accountancy_journal` int(11) DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_allowed` int(11) DEFAULT 0,
  `min_desired` int(11) DEFAULT 0,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ics` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ics_transfer` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_account_label` (`label`,`entity`),
  KEY `idx_fk_accountancy_journal` (`fk_accountancy_journal`),
  CONSTRAINT `fk_bank_account_accountancy_journal` FOREIGN KEY (`fk_accountancy_journal`) REFERENCES `llxas_accounting_journal` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bank_account`
--

LOCK TABLES `llxas_bank_account` WRITE;
/*!40000 ALTER TABLE `llxas_bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bank_account_extrafields`
--

DROP TABLE IF EXISTS `llxas_bank_account_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bank_account_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_account_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bank_account_extrafields`
--

LOCK TABLES `llxas_bank_account_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_bank_account_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bank_account_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bank_categ`
--

DROP TABLE IF EXISTS `llxas_bank_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bank_categ` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bank_categ`
--

LOCK TABLES `llxas_bank_categ` WRITE;
/*!40000 ALTER TABLE `llxas_bank_categ` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bank_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bank_class`
--

DROP TABLE IF EXISTS `llxas_bank_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bank_class` (
  `lineid` int(11) NOT NULL,
  `fk_categ` int(11) NOT NULL,
  UNIQUE KEY `uk_bank_class_lineid` (`lineid`,`fk_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bank_class`
--

LOCK TABLES `llxas_bank_class` WRITE;
/*!40000 ALTER TABLE `llxas_bank_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bank_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bank_url`
--

DROP TABLE IF EXISTS `llxas_bank_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bank_url` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bank` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_url` (`fk_bank`,`url_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bank_url`
--

LOCK TABLES `llxas_bank_url` WRITE;
/*!40000 ALTER TABLE `llxas_bank_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bank_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_blockedlog`
--

DROP TABLE IF EXISTS `llxas_blockedlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_blockedlog` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `action` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amounts` double(24,8) NOT NULL,
  `element` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `user_fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `ref_object` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_object` datetime DEFAULT NULL,
  `signature` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature_line` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `certified` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `signature` (`signature`),
  KEY `fk_object_element` (`fk_object`,`element`),
  KEY `entity` (`entity`),
  KEY `fk_user` (`fk_user`),
  KEY `entity_action` (`entity`,`action`),
  KEY `entity_action_certified` (`entity`,`action`,`certified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_blockedlog`
--

LOCK TABLES `llxas_blockedlog` WRITE;
/*!40000 ALTER TABLE `llxas_blockedlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_blockedlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_blockedlog_authority`
--

DROP TABLE IF EXISTS `llxas_blockedlog_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_blockedlog_authority` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `blockchain` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  KEY `signature` (`signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_blockedlog_authority`
--

LOCK TABLES `llxas_blockedlog_authority` WRITE;
/*!40000 ALTER TABLE `llxas_blockedlog_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_blockedlog_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bom_bom`
--

DROP TABLE IF EXISTS `llxas_bom_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bom_bom` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bomtype` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double(24,8) DEFAULT NULL,
  `efficiency` double(24,8) DEFAULT 1.00000000,
  `duration` double(24,8) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bom_bom_ref` (`ref`,`entity`),
  KEY `idx_bom_bom_rowid` (`rowid`),
  KEY `idx_bom_bom_ref` (`ref`),
  KEY `llxas_bom_bom_fk_user_creat` (`fk_user_creat`),
  KEY `idx_bom_bom_status` (`status`),
  KEY `idx_bom_bom_fk_product` (`fk_product`),
  CONSTRAINT `llxas_bom_bom_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bom_bom`
--

LOCK TABLES `llxas_bom_bom` WRITE;
/*!40000 ALTER TABLE `llxas_bom_bom` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bom_bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bom_bom_extrafields`
--

DROP TABLE IF EXISTS `llxas_bom_bom_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bom_bom_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bom_extrafields_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bom_bom_extrafields`
--

LOCK TABLES `llxas_bom_bom_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_bom_bom_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bom_bom_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bom_bomline`
--

DROP TABLE IF EXISTS `llxas_bom_bomline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bom_bomline` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bom` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_bom_child` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(24,8) NOT NULL,
  `qty_frozen` smallint(6) DEFAULT 0,
  `disable_stock_change` smallint(6) DEFAULT 0,
  `efficiency` double(24,8) NOT NULL DEFAULT 1.00000000,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bomline_rowid` (`rowid`),
  KEY `idx_bom_bomline_fk_product` (`fk_product`),
  KEY `idx_bom_bomline_fk_bom` (`fk_bom`),
  CONSTRAINT `llxas_bom_bomline_fk_bom` FOREIGN KEY (`fk_bom`) REFERENCES `llxas_bom_bom` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bom_bomline`
--

LOCK TABLES `llxas_bom_bomline` WRITE;
/*!40000 ALTER TABLE `llxas_bom_bomline` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bom_bomline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bom_bomline_extrafields`
--

DROP TABLE IF EXISTS `llxas_bom_bomline_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bom_bomline_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bom_bomline_extrafields`
--

LOCK TABLES `llxas_bom_bomline_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_bom_bomline_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bom_bomline_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bookmark`
--

DROP TABLE IF EXISTS `llxas_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bookmark` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bookmark_title` (`fk_user`,`entity`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bookmark`
--

LOCK TABLES `llxas_bookmark` WRITE;
/*!40000 ALTER TABLE `llxas_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_bordereau_cheque`
--

DROP TABLE IF EXISTS `llxas_bordereau_cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_bordereau_cheque` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint(6) NOT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bordereau_cheque` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_bordereau_cheque`
--

LOCK TABLES `llxas_bordereau_cheque` WRITE;
/*!40000 ALTER TABLE `llxas_bordereau_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_bordereau_cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_boxes`
--

DROP TABLE IF EXISTS `llxas_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_boxes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `box_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  `box_order` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `maxline` int(11) DEFAULT NULL,
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  KEY `idx_boxes_boxid` (`box_id`),
  KEY `idx_boxes_fk_user` (`fk_user`),
  CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `llxas_boxes_def` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_boxes`
--

LOCK TABLES `llxas_boxes` WRITE;
/*!40000 ALTER TABLE `llxas_boxes` DISABLE KEYS */;
INSERT INTO `llxas_boxes` (`rowid`, `entity`, `box_id`, `position`, `box_order`, `fk_user`, `maxline`, `params`) VALUES (1,1,1,0,'0',0,NULL,NULL),(2,1,2,0,'0',0,NULL,NULL),(3,1,3,0,'0',0,NULL,NULL),(4,1,4,0,'0',0,NULL,NULL),(5,1,5,0,'0',0,NULL,NULL),(6,1,6,0,'0',0,NULL,NULL),(7,1,7,0,'0',0,NULL,NULL),(8,1,8,0,'0',0,NULL,NULL),(9,1,9,0,'0',0,NULL,NULL),(10,1,10,0,'0',0,NULL,NULL),(11,1,11,0,'0',0,NULL,NULL),(12,1,12,0,'0',0,NULL,NULL),(13,1,13,0,'0',0,NULL,NULL),(14,1,14,0,'0',0,NULL,NULL),(15,1,15,0,'0',0,NULL,NULL),(16,1,16,0,'0',0,NULL,NULL),(17,1,17,0,'0',0,NULL,NULL),(18,1,18,0,'0',0,NULL,NULL),(19,1,19,0,'0',0,NULL,NULL),(20,1,20,0,'0',0,NULL,NULL),(21,1,21,0,'0',0,NULL,NULL),(22,1,22,0,'0',0,NULL,NULL),(23,1,23,0,'0',0,NULL,NULL),(24,1,24,0,'0',0,NULL,NULL),(25,1,25,0,'0',0,NULL,NULL),(26,1,26,0,'0',0,NULL,NULL),(27,1,27,0,'0',0,NULL,NULL),(28,1,28,0,'0',0,NULL,NULL),(29,1,29,0,'0',0,NULL,NULL),(31,1,31,0,'0',0,NULL,NULL),(32,1,32,0,'0',0,NULL,NULL),(33,1,32,27,'0',0,NULL,NULL),(34,1,33,0,'0',0,NULL,NULL),(35,1,34,0,'0',0,NULL,NULL),(36,1,35,0,'0',0,NULL,NULL),(37,1,36,0,'0',0,NULL,NULL),(38,1,37,0,'0',0,NULL,NULL),(39,1,40,0,'0',0,NULL,NULL),(40,1,41,0,'0',0,NULL,NULL),(41,1,42,0,'0',0,NULL,NULL),(42,1,52,0,'0',0,NULL,NULL);
/*!40000 ALTER TABLE `llxas_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_boxes_def`
--

DROP TABLE IF EXISTS `llxas_boxes_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_boxes_def` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_boxes_def`
--

LOCK TABLES `llxas_boxes_def` WRITE;
/*!40000 ALTER TABLE `llxas_boxes_def` DISABLE KEYS */;
INSERT INTO `llxas_boxes_def` (`rowid`, `file`, `entity`, `tms`, `note`) VALUES (1,'box_lastlogin.php',1,'2021-11-10 17:55:49',NULL),(2,'box_birthdays.php',1,'2021-11-10 17:55:49',NULL),(3,'box_commandes.php',1,'2022-01-08 01:29:08',NULL),(4,'box_graph_orders_permonth.php',1,'2022-01-08 01:29:08',NULL),(5,'box_clients.php',1,'2022-01-08 01:29:08',NULL),(6,'box_prospect.php',1,'2022-01-08 01:29:08',NULL),(7,'box_contacts.php',1,'2022-01-08 01:29:08',NULL),(8,'box_activity.php',1,'2022-01-08 01:29:08','(WarningUsingThisBoxSlowDown)'),(9,'box_goodcustomers.php',1,'2022-01-08 01:29:08','(WarningUsingThisBoxSlowDown)'),(10,'box_last_ticket.php',1,'2022-02-11 22:55:42',NULL),(11,'box_last_modified_ticket.php',1,'2022-02-11 22:55:42',NULL),(12,'box_actions.php',1,'2022-02-11 22:55:42',NULL),(13,'box_factures_imp.php',1,'2022-05-23 22:43:06',NULL),(14,'box_factures.php',1,'2022-05-23 22:43:06',NULL),(15,'box_graph_invoices_permonth.php',1,'2022-05-23 22:43:06',NULL),(16,'box_customers_outstanding_bill_reached.php',1,'2022-05-23 22:43:06',NULL),(17,'box_graph_propales_permonth.php',1,'2022-05-27 13:42:48',NULL),(18,'box_propales.php',1,'2022-05-27 13:42:48',NULL),(19,'box_shipments.php',1,'2022-05-27 13:44:53',NULL),(20,'box_contracts.php',1,'2022-05-27 13:46:04',NULL),(21,'box_services_expired.php',1,'2022-05-27 13:46:04',NULL),(22,'box_ficheinter.php',1,'2022-05-27 13:47:03',NULL),(23,'box_graph_invoices_supplier_permonth.php',1,'2022-05-27 13:48:23',NULL),(24,'box_graph_orders_supplier_permonth.php',1,'2022-05-27 13:48:23',NULL),(25,'box_fournisseurs.php',1,'2022-05-27 13:48:23',NULL),(26,'box_factures_fourn_imp.php',1,'2022-05-27 13:48:23',NULL),(27,'box_factures_fourn.php',1,'2022-05-27 13:48:23',NULL),(28,'box_supplier_orders.php',1,'2022-05-27 13:48:23',NULL),(29,'box_supplier_orders_awaiting_reception.php',1,'2022-05-27 13:48:23',NULL),(31,'box_produits.php',1,'2022-11-09 18:41:36',NULL),(32,'box_produits_alerte_stock.php',1,'2022-11-09 18:41:36',NULL),(33,'box_graph_product_distribution.php',1,'2022-11-09 18:41:36',NULL),(34,'box_project.php',1,'2022-11-09 18:41:45',NULL),(35,'box_task.php',1,'2022-11-09 18:41:45',NULL),(36,'box_validated_projects.php',1,'2022-11-09 18:41:45',NULL),(37,'box_funnel_of_prospection.php',1,'2022-11-09 18:41:45',NULL),(38,'box_accountancy_last_manual_entries.php',1,'2022-11-09 18:42:16',NULL),(39,'box_accountancy_suspense_account.php',1,'2022-11-09 18:42:16',NULL),(40,'box_services_contracts.php',1,'2022-11-09 19:03:30',NULL),(41,'box_bookmarks.php',1,'2022-11-09 19:03:53',NULL),(42,'box_scheduled_jobs.php',1,'2022-11-09 19:04:52',NULL),(43,'box_dolibarr_state_board.php',1,'2023-01-25 00:17:12',NULL),(44,'box_members_last_modified.php',1,'2023-01-25 00:17:12',NULL),(45,'box_members_last_subscriptions.php',1,'2023-01-25 00:17:12',NULL),(46,'box_members_subscriptions_by_year.php',1,'2023-01-25 00:17:12',NULL),(47,'box_members_by_type.php',1,'2023-01-25 00:17:12',NULL),(48,'box_graph_ticket_by_severity.php',1,'2023-01-25 00:17:14',NULL),(49,'box_graph_nb_ticket_last_x_days.php',1,'2023-01-25 00:17:14',NULL),(50,'box_graph_nb_tickets_type.php',1,'2023-01-25 00:17:14',NULL),(51,'box_graph_new_vs_close_ticket.php',1,'2023-01-25 00:17:14',NULL),(52,'box_comptes.php',1,'2023-01-25 00:18:17',NULL),(53,'box_ticket_by_severity.php',1,'2023-01-25 00:18:23',NULL),(54,'box_nb_ticket_last_x_days.php',1,'2023-01-25 00:18:23',NULL),(55,'box_nb_tickets_type.php',1,'2023-01-25 00:18:23',NULL),(56,'box_new_vs_close_ticket.php',1,'2023-01-25 00:18:23',NULL);
/*!40000 ALTER TABLE `llxas_boxes_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_budget`
--

DROP TABLE IF EXISTS `llxas_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_budget` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_budget`
--

LOCK TABLES `llxas_budget` WRITE;
/*!40000 ALTER TABLE `llxas_budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_budget_lines`
--

DROP TABLE IF EXISTS `llxas_budget_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_budget_lines` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_budget` int(11) NOT NULL,
  `fk_project_ids` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(24,8) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_budget_lines` (`fk_budget`,`fk_project_ids`),
  CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`fk_budget`) REFERENCES `llxas_budget` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_budget_lines`
--

LOCK TABLES `llxas_budget_lines` WRITE;
/*!40000 ALTER TABLE `llxas_budget_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_budget_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_accounting_category`
--

DROP TABLE IF EXISTS `llxas_c_accounting_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_accounting_category` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `range_account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sens` tinyint(4) NOT NULL DEFAULT 0,
  `category_type` tinyint(4) NOT NULL DEFAULT 0,
  `formula` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_accounting_category` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_accounting_category`
--

LOCK TABLES `llxas_c_accounting_category` WRITE;
/*!40000 ALTER TABLE `llxas_c_accounting_category` DISABLE KEYS */;
INSERT INTO `llxas_c_accounting_category` (`rowid`, `entity`, `code`, `label`, `range_account`, `sens`, `category_type`, `formula`, `position`, `fk_country`, `active`) VALUES (1,1,'INCOMES','Income of products/services','Example: 7xxxxx',0,0,'',10,0,1),(2,1,'EXPENSES','Expenses of products/services','Example: 6xxxxx',0,0,'',20,0,1),(3,1,'PROFIT','Balance','',0,1,'INCOMES+EXPENSES',30,0,1);
/*!40000 ALTER TABLE `llxas_c_accounting_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_action_trigger`
--

DROP TABLE IF EXISTS `llxas_c_action_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_action_trigger` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `elementtype` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_action_trigger_code` (`code`),
  KEY `idx_action_trigger_rang` (`rang`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_action_trigger`
--

LOCK TABLES `llxas_c_action_trigger` WRITE;
/*!40000 ALTER TABLE `llxas_c_action_trigger` DISABLE KEYS */;
INSERT INTO `llxas_c_action_trigger` (`rowid`, `elementtype`, `code`, `label`, `description`, `rang`) VALUES (1,'societe','COMPANY_CREATE','Third party created','Executed when a third party is created',1),(2,'societe','COMPANY_SENTBYMAIL','Mails sent from third party card','Executed when you send email from third party card',1),(3,'societe','COMPANY_DELETE','Third party deleted','Executed when you delete third party',1),(4,'propal','PROPAL_VALIDATE','Customer proposal validated','Executed when a commercial proposal is validated',2),(5,'propal','PROPAL_SENTBYMAIL','Commercial proposal sent by mail','Executed when a commercial proposal is sent by mail',3),(6,'propal','PROPAL_CLOSE_SIGNED','Customer proposal closed signed','Executed when a customer proposal is closed signed',2),(7,'propal','PROPAL_CLOSE_REFUSED','Customer proposal closed refused','Executed when a customer proposal is closed refused',2),(8,'propal','PROPAL_CLASSIFY_BILLED','Customer proposal set billed','Executed when a customer proposal is set to billed',2),(9,'propal','PROPAL_DELETE','Customer proposal deleted','Executed when a customer proposal is deleted',2),(10,'commande','ORDER_VALIDATE','Customer order validate','Executed when a customer order is validated',4),(11,'commande','ORDER_CLOSE','Customer order classify delivered','Executed when a customer order is set delivered',5),(12,'commande','ORDER_CLASSIFY_BILLED','Customer order classify billed','Executed when a customer order is set to billed',5),(13,'commande','ORDER_CANCEL','Customer order canceled','Executed when a customer order is canceled',5),(14,'commande','ORDER_SENTBYMAIL','Customer order sent by mail','Executed when a customer order is sent by mail ',5),(15,'commande','ORDER_DELETE','Customer order deleted','Executed when a customer order is deleted',5),(16,'facture','BILL_VALIDATE','Customer invoice validated','Executed when a customer invoice is approved',6),(17,'facture','BILL_PAYED','Customer invoice payed','Executed when a customer invoice is payed',7),(18,'facture','BILL_CANCEL','Customer invoice canceled','Executed when a customer invoice is conceled',8),(19,'facture','BILL_SENTBYMAIL','Customer invoice sent by mail','Executed when a customer invoice is sent by mail',9),(20,'facture','BILL_UNVALIDATE','Customer invoice unvalidated','Executed when a customer invoice status set back to draft',9),(21,'facture','BILL_DELETE','Customer invoice deleted','Executed when a customer invoice is deleted',9),(22,'proposal_supplier','PROPOSAL_SUPPLIER_VALIDATE','Price request validated','Executed when a commercial proposal is validated',10),(23,'proposal_supplier','PROPOSAL_SUPPLIER_SENTBYMAIL','Price request sent by mail','Executed when a commercial proposal is sent by mail',10),(24,'proposal_supplier','PROPOSAL_SUPPLIER_CLOSE_SIGNED','Price request closed signed','Executed when a customer proposal is closed signed',10),(25,'proposal_supplier','PROPOSAL_SUPPLIER_CLOSE_REFUSED','Price request closed refused','Executed when a customer proposal is closed refused',10),(26,'proposal_supplier','PROPOSAL_SUPPLIER_DELETE','Price request deleted','Executed when a customer proposal delete',10),(27,'order_supplier','ORDER_SUPPLIER_VALIDATE','Supplier order validated','Executed when a supplier order is validated',12),(28,'order_supplier','ORDER_SUPPLIER_APPROVE','Supplier order request approved','Executed when a supplier order is approved',13),(29,'order_supplier','ORDER_SUPPLIER_SUBMIT','Supplier order request submited','Executed when a supplier order is approved',13),(30,'order_supplier','ORDER_SUPPLIER_RECEIVE','Supplier order request received','Executed when a supplier order is received',13),(31,'order_supplier','ORDER_SUPPLIER_REFUSE','Supplier order request refused','Executed when a supplier order is refused',13),(32,'order_supplier','ORDER_SUPPLIER_SENTBYMAIL','Supplier order sent by mail','Executed when a supplier order is sent by mail',14),(33,'order_supplier','ORDER_SUPPLIER_CLASSIFY_BILLED','Supplier order set billed','Executed when a supplier order is set as billed',14),(34,'order_supplier','ORDER_SUPPLIER_DELETE','Supplier order deleted','Executed when a supplier order is deleted',14),(35,'invoice_supplier','BILL_SUPPLIER_VALIDATE','Supplier invoice validated','Executed when a supplier invoice is validated',15),(36,'invoice_supplier','BILL_SUPPLIER_UNVALIDATE','Supplier invoice unvalidated','Executed when a supplier invoice status is set back to draft',15),(37,'invoice_supplier','BILL_SUPPLIER_PAYED','Supplier invoice payed','Executed when a supplier invoice is payed',16),(38,'invoice_supplier','BILL_SUPPLIER_SENTBYMAIL','Supplier invoice sent by mail','Executed when a supplier invoice is sent by mail',17),(39,'invoice_supplier','BILL_SUPPLIER_CANCELED','Supplier invoice cancelled','Executed when a supplier invoice is cancelled',17),(40,'invoice_supplier','BILL_SUPPLIER_DELETE','Supplier invoice deleted','Executed when a supplier invoice is deleted',17),(41,'contrat','CONTRACT_VALIDATE','Contract validated','Executed when a contract is validated',18),(42,'contrat','CONTRACT_SENTBYMAIL','Contract sent by mail','Executed when a contract is sent by mail',18),(43,'contrat','CONTRACT_DELETE','Contract deleted','Executed when a contract is deleted',18),(44,'shipping','SHIPPING_VALIDATE','Shipping validated','Executed when a shipping is validated',20),(45,'shipping','SHIPPING_SENTBYMAIL','Shipping sent by mail','Executed when a shipping is sent by mail',21),(46,'shipping','SHIPPING_DELETE','Shipping sent is deleted','Executed when a shipping is deleted',21),(47,'reception','RECEPTION_VALIDATE','Reception validated','Executed when a reception is validated',22),(48,'reception','RECEPTION_SENTBYMAIL','Reception sent by mail','Executed when a reception is sent by mail',22),(49,'member','MEMBER_VALIDATE','Member validated','Executed when a member is validated',22),(50,'member','MEMBER_SENTBYMAIL','Mails sent from member card','Executed when you send email from member card',23),(51,'member','MEMBER_SUBSCRIPTION_CREATE','Member subscribtion recorded','Executed when a member subscribtion is deleted',24),(52,'member','MEMBER_SUBSCRIPTION_MODIFY','Member subscribtion modified','Executed when a member subscribtion is modified',24),(53,'member','MEMBER_SUBSCRIPTION_DELETE','Member subscribtion deleted','Executed when a member subscribtion is deleted',24),(54,'member','MEMBER_RESILIATE','Member resiliated','Executed when a member is resiliated',25),(55,'member','MEMBER_DELETE','Member deleted','Executed when a member is deleted',26),(56,'ficheinter','FICHINTER_VALIDATE','Intervention validated','Executed when a intervention is validated',30),(57,'ficheinter','FICHINTER_CLASSIFY_BILLED','Intervention set billed','Executed when a intervention is set to billed (when option FICHINTER_CLASSIFY_BILLED is set)',32),(58,'ficheinter','FICHINTER_CLASSIFY_UNBILLED','Intervention set unbilled','Executed when a intervention is set to unbilled (when option FICHINTER_CLASSIFY_BILLED is set)',33),(59,'ficheinter','FICHINTER_REOPEN','Intervention opened','Executed when a intervention is re-opened',34),(60,'ficheinter','FICHINTER_SENTBYMAIL','Intervention sent by mail','Executed when a intervention is sent by mail',35),(61,'ficheinter','FICHINTER_DELETE','Intervention is deleted','Executed when a intervention is deleted',35),(62,'product','PRODUCT_CREATE','Product or service created','Executed when a product or sevice is created',40),(63,'product','PRODUCT_DELETE','Product or service deleted','Executed when a product or sevice is deleted',42),(64,'expensereport','EXPENSE_REPORT_CREATE','Expense report created','Executed when an expense report is created',201),(65,'expensereport','EXPENSE_REPORT_VALIDATE','Expense report validated','Executed when an expense report is validated',202),(66,'expensereport','EXPENSE_REPORT_APPROVE','Expense report approved','Executed when an expense report is approved',203),(67,'expensereport','EXPENSE_REPORT_PAID','Expense report billed','Executed when an expense report is set as billed',204),(68,'expensereport','EXPENSE_REPORT_DELETE','Expense report deleted','Executed when an expense report is deleted',205),(69,'expensereport','HOLIDAY_VALIDATE','Expense report validated','Executed when an expense report is validated',211),(70,'expensereport','HOLIDAY_APPROVE','Expense report approved','Executed when an expense report is approved',212),(71,'project','PROJECT_VALIDATE','Project validation','Executed when a project is validated',141),(72,'project','PROJECT_DELETE','Project deleted','Executed when a project is deleted',143),(73,'ticket','TICKET_CREATE','Ticket created','Executed when a ticket is created',161),(74,'ticket','TICKET_MODIFY','Ticket modified','Executed when a ticket is modified',163),(75,'ticket','TICKET_ASSIGNED','Ticket assigned','Executed when a ticket is modified',164),(76,'ticket','TICKET_CLOSE','Ticket closed','Executed when a ticket is closed',165),(77,'ticket','TICKET_SENTBYMAIL','Ticket message sent by email','Executed when a message is sent from the ticket record',166),(78,'ticket','TICKET_DELETE','Ticket deleted','Executed when a ticket is deleted',167),(79,'user','USER_SENTBYMAIL','Email sent','Executed when an email is sent from user card',300),(80,'product','PRODUCT_MODIFY','Product or service modified','Executed when a product or sevice is modified',41),(81,'member','MEMBER_MODIFY','Member modified','Executed when a member is modified',23),(82,'ficheinter','FICHINTER_MODIFY','Intervention modified','Executed when a intervention is modified',19),(83,'project','PROJECT_CREATE','Project creation','Executed when a project is created',140),(84,'project','PROJECT_MODIFY','Project modified','Executed when a project is modified',142),(85,'bom','BOM_VALIDATE','BOM validated','Executed when a BOM is validated',650),(86,'bom','BOM_UNVALIDATE','BOM unvalidated','Executed when a BOM is unvalidated',651),(87,'bom','BOM_CLOSE','BOM disabled','Executed when a BOM is disabled',652),(88,'bom','BOM_REOPEN','BOM reopen','Executed when a BOM is re-open',653),(89,'bom','BOM_DELETE','BOM deleted','Executed when a BOM deleted',654),(90,'mrp','MRP_MO_VALIDATE','MO validated','Executed when a MO is validated',660),(91,'mrp','MRP_MO_PRODUCED','MO produced','Executed when a MO is produced',661),(92,'mrp','MRP_MO_DELETE','MO deleted','Executed when a MO is deleted',662),(93,'mrp','MRP_MO_CANCEL','MO canceled','Executed when a MO is canceled',663),(94,'contact','CONTACT_CREATE','Contact address created','Executed when a contact is created',50),(95,'contact','CONTACT_SENTBYMAIL','Mails sent from third party card','Executed when you send email from contact address record',51),(96,'contact','CONTACT_DELETE','Contact address deleted','Executed when a contact is deleted',52),(97,'recruitment','RECRUITMENTJOBPOSITION_CREATE','Job created','Executed when a job is created',7500),(98,'recruitment','RECRUITMENTJOBPOSITION_MODIFY','Job modified','Executed when a job is modified',7502),(99,'recruitment','RECRUITMENTJOBPOSITION_SENTBYMAIL','Mails sent from job record','Executed when you send email from job record',7504),(100,'recruitment','RECRUITMENTJOBPOSITION_DELETE','Job deleted','Executed when a job is deleted',7506),(101,'recruitment','RECRUITMENTCANDIDATURE_CREATE','Candidature created','Executed when a candidature is created',7510),(102,'recruitment','RECRUITMENTCANDIDATURE_MODIFY','Candidature modified','Executed when a candidature is modified',7512),(103,'recruitment','RECRUITMENTCANDIDATURE_SENTBYMAIL','Mails sent from candidature record','Executed when you send email from candidature record',7514),(104,'recruitment','RECRUITMENTCANDIDATURE_DELETE','Candidature deleted','Executed when a candidature is deleted',7516),(105,'project','TASK_CREATE','Task created','Executed when a project task is created',150),(106,'project','TASK_MODIFY','Task modified','Executed when a project task is modified',151),(107,'project','TASK_DELETE','Task deleted','Executed when a project task is deleted',152),(108,'societe','COMPANY_MODIFY','Third party update','Executed when you update third party',1),(109,'contact','CONTACT_MODIFY','Contact address update','Executed when a contact is updated',51);
/*!40000 ALTER TABLE `llxas_c_action_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_actioncomm`
--

DROP TABLE IF EXISTS `llxas_c_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_actioncomm` (
  `id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'system',
  `libelle` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `todo` tinyint(4) DEFAULT NULL,
  `color` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picto` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_actioncomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_actioncomm`
--

LOCK TABLES `llxas_c_actioncomm` WRITE;
/*!40000 ALTER TABLE `llxas_c_actioncomm` DISABLE KEYS */;
INSERT INTO `llxas_c_actioncomm` (`id`, `code`, `type`, `libelle`, `module`, `active`, `todo`, `color`, `picto`, `position`) VALUES (1,'AC_TEL','system','Phone call',NULL,1,NULL,NULL,NULL,2),(2,'AC_FAX','system','Send Fax',NULL,1,NULL,NULL,NULL,3),(4,'AC_EMAIL','system','Send Email',NULL,1,NULL,NULL,NULL,4),(5,'AC_RDV','system','Rendez-vous',NULL,1,NULL,NULL,NULL,1),(6,'AC_EMAIL_IN','system','reception Email',NULL,1,NULL,NULL,NULL,4),(11,'AC_INT','system','Intervention on site',NULL,1,NULL,NULL,NULL,4),(40,'AC_OTH_AUTO','systemauto','Other (automatically inserted events)',NULL,1,NULL,NULL,NULL,20),(50,'AC_OTH','system','Other (manually inserted events)',NULL,1,NULL,NULL,NULL,5),(60,'AC_EO_ONLINECONF','module','Online/Virtual conference','conference@eventorganization',1,NULL,NULL,NULL,60),(61,'AC_EO_INDOORCONF','module','Indoor conference','conference@eventorganization',1,NULL,NULL,NULL,61),(62,'AC_EO_ONLINEBOOTH','module','Online/Virtual booth','booth@eventorganization',1,NULL,NULL,NULL,62),(63,'AC_EO_INDOORBOOTH','module','Indoor booth','booth@eventorganization',1,NULL,NULL,NULL,63);
/*!40000 ALTER TABLE `llxas_c_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_availability`
--

DROP TABLE IF EXISTS `llxas_c_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_availability` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_availability` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_availability`
--

LOCK TABLES `llxas_c_availability` WRITE;
/*!40000 ALTER TABLE `llxas_c_availability` DISABLE KEYS */;
INSERT INTO `llxas_c_availability` (`rowid`, `code`, `label`, `active`, `position`) VALUES (1,'AV_NOW','Immediate',1,0),(2,'AV_1W','1 week',1,0),(3,'AV_2W','2 weeks',1,0),(4,'AV_3W','3 weeks',1,0);
/*!40000 ALTER TABLE `llxas_c_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_barcode_type`
--

DROP TABLE IF EXISTS `llxas_c_barcode_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_barcode_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coder` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `example` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_barcode_type`
--

LOCK TABLES `llxas_c_barcode_type` WRITE;
/*!40000 ALTER TABLE `llxas_c_barcode_type` DISABLE KEYS */;
INSERT INTO `llxas_c_barcode_type` (`rowid`, `code`, `entity`, `libelle`, `coder`, `example`) VALUES (1,'EAN8',1,'EAN8','0','1234567'),(2,'EAN13',1,'EAN13','0','123456789012'),(3,'UPC',1,'UPC','0','123456789012'),(4,'ISBN',1,'ISBN','0','123456789'),(5,'C39',1,'Code 39','0','1234567890'),(6,'C128',1,'Code 128','0','ABCD1234567890'),(7,'DATAMATRIX',1,'Datamatrix','0','1234567xyz'),(8,'QRCODE',1,'Qr Code','0','www.dolibarr.org');
/*!40000 ALTER TABLE `llxas_c_barcode_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_chargesociales`
--

DROP TABLE IF EXISTS `llxas_c_chargesociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_chargesociales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deductible` smallint(6) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_chargesociales`
--

LOCK TABLES `llxas_c_chargesociales` WRITE;
/*!40000 ALTER TABLE `llxas_c_chargesociales` DISABLE KEYS */;
INSERT INTO `llxas_c_chargesociales` (`id`, `libelle`, `deductible`, `active`, `code`, `accountancy_code`, `fk_pays`, `module`) VALUES (4110,'Business Federal Tax',0,1,'FED','23900',11,NULL);
/*!40000 ALTER TABLE `llxas_c_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_civility`
--

DROP TABLE IF EXISTS `llxas_c_civility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_civility` (
  `rowid` int(11) NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_civility` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_civility`
--

LOCK TABLES `llxas_c_civility` WRITE;
/*!40000 ALTER TABLE `llxas_c_civility` DISABLE KEYS */;
INSERT INTO `llxas_c_civility` (`rowid`, `code`, `label`, `active`, `module`) VALUES (1,'MME','Madame',1,NULL),(3,'MR','Monsieur',1,NULL),(5,'MLE','Mademoiselle',1,NULL),(7,'MTRE','Maître',1,NULL),(8,'DR','Docteur',1,NULL);
/*!40000 ALTER TABLE `llxas_c_civility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_country`
--

DROP TABLE IF EXISTS `llxas_c_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_country` (
  `rowid` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_iso` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `eec` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `favorite` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_country_code` (`code`),
  UNIQUE KEY `idx_c_country_label` (`label`),
  UNIQUE KEY `idx_c_country_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_country`
--

LOCK TABLES `llxas_c_country` WRITE;
/*!40000 ALTER TABLE `llxas_c_country` DISABLE KEYS */;
INSERT INTO `llxas_c_country` (`rowid`, `code`, `code_iso`, `label`, `eec`, `active`, `favorite`) VALUES (0,'',NULL,'-',NULL,1,1),(1,'FR','FRA','France',1,1,0),(2,'BE','BEL','Belgium',1,1,0),(3,'IT','ITA','Italy',1,1,0),(4,'ES','ESP','Spain',1,1,0),(5,'DE','DEU','Germany',1,1,0),(6,'CH','CHE','Switzerland',NULL,1,0),(7,'GB','GBR','United Kingdom',1,1,0),(8,'IE','IRL','Irland',1,1,0),(9,'CN','CHN','China',NULL,1,0),(10,'TN','TUN','Tunisia',NULL,1,0),(11,'US','USA','United States',NULL,1,0),(12,'MA','MAR','Maroc',NULL,1,0),(13,'DZ','DZA','Algeria',NULL,1,0),(14,'CA','CAN','Canada',NULL,1,0),(15,'TG','TGO','Togo',NULL,1,0),(16,'GA','GAB','Gabon',NULL,1,0),(17,'NL','NLD','Nederland',1,1,0),(18,'HU','HUN','Hongrie',1,1,0),(19,'RU','RUS','Russia',NULL,1,0),(20,'SE','SWE','Sweden',1,1,0),(21,'CI','CIV','Côte d\'Ivoire',NULL,1,0),(22,'SN','SEN','Senegal',NULL,1,0),(23,'AR','ARG','Argentine',NULL,1,0),(24,'CM','CMR','Cameroun',NULL,1,0),(25,'PT','PRT','Portugal',1,1,0),(26,'SA','SAU','Saudi Arabia',NULL,1,0),(27,'MC','MCO','Monaco',1,1,0),(28,'AU','AUS','Australia',NULL,1,0),(29,'SG','SGP','Singapour',NULL,1,0),(30,'AF','AFG','Afghanistan',NULL,1,0),(31,'AX','ALA','Iles Aland',NULL,1,0),(32,'AL','ALB','Albanie',NULL,1,0),(33,'AS','ASM','Samoa américaines',NULL,1,0),(34,'AD','AND','Andorre',NULL,1,0),(35,'AO','AGO','Angola',NULL,1,0),(36,'AI','AIA','Anguilla',NULL,1,0),(37,'AQ','ATA','Antarctique',NULL,1,0),(38,'AG','ATG','Antigua-et-Barbuda',NULL,1,0),(39,'AM','ARM','Arménie',NULL,1,0),(40,'AW','ABW','Aruba',NULL,1,0),(41,'AT','AUT','Autriche',1,1,0),(42,'AZ','AZE','Azerbaïdjan',NULL,1,0),(43,'BS','BHS','Bahamas',NULL,1,0),(44,'BH','BHR','Bahreïn',NULL,1,0),(45,'BD','BGD','Bangladesh',NULL,1,0),(46,'BB','BRB','Barbade',NULL,1,0),(47,'BY','BLR','Biélorussie',NULL,1,0),(48,'BZ','BLZ','Belize',NULL,1,0),(49,'BJ','BEN','Bénin',NULL,1,0),(50,'BM','BMU','Bermudes',NULL,1,0),(51,'BT','BTN','Bhoutan',NULL,1,0),(52,'BO','BOL','Bolivie',NULL,1,0),(53,'BA','BIH','Bosnie-Herzégovine',NULL,1,0),(54,'BW','BWA','Botswana',NULL,1,0),(55,'BV','BVT','Ile Bouvet',NULL,1,0),(56,'BR','BRA','Brazil',NULL,1,0),(57,'IO','IOT','Territoire britannique de l\'Océan Indien',NULL,1,0),(58,'BN','BRN','Brunei',NULL,1,0),(59,'BG','BGR','Bulgarie',1,1,0),(60,'BF','BFA','Burkina Faso',NULL,1,0),(61,'BI','BDI','Burundi',NULL,1,0),(62,'KH','KHM','Cambodge',NULL,1,0),(63,'CV','CPV','Cap-Vert',NULL,1,0),(64,'KY','CYM','Iles Cayman',NULL,1,0),(65,'CF','CAF','République centrafricaine',NULL,1,0),(66,'TD','TCD','Tchad',NULL,1,0),(67,'CL','CHL','Chili',NULL,1,0),(68,'CX','CXR','Ile Christmas',NULL,1,0),(69,'CC','CCK','Iles des Cocos (Keeling)',NULL,1,0),(70,'CO','COL','Colombie',NULL,1,0),(71,'KM','COM','Comores',NULL,1,0),(72,'CG','COG','Congo',NULL,1,0),(73,'CD','COD','République démocratique du Congo',NULL,1,0),(74,'CK','COK','Iles Cook',NULL,1,0),(75,'CR','CRI','Costa Rica',NULL,1,0),(76,'HR','HRV','Croatie',1,1,0),(77,'CU','CUB','Cuba',NULL,1,0),(78,'CY','CYP','Cyprus',1,1,0),(79,'CZ','CZE','République Tchèque',1,1,0),(80,'DK','DNK','Danemark',1,1,0),(81,'DJ','DJI','Djibouti',NULL,1,0),(82,'DM','DMA','Dominique',NULL,1,0),(83,'DO','DOM','République Dominicaine',NULL,1,0),(84,'EC','ECU','Equateur',NULL,1,0),(85,'EG','EGY','Egypte',NULL,1,0),(86,'SV','SLV','Salvador',NULL,1,0),(87,'GQ','GNQ','Guinée Equatoriale',NULL,1,0),(88,'ER','ERI','Erythrée',NULL,1,0),(89,'EE','EST','Estonia',1,1,0),(90,'ET','ETH','Ethiopie',NULL,1,0),(91,'FK','FLK','Iles Falkland',NULL,1,0),(92,'FO','FRO','Iles Féroé',NULL,1,0),(93,'FJ','FJI','Iles Fidji',NULL,1,0),(94,'FI','FIN','Finlande',1,1,0),(95,'GF','GUF','Guyane française',NULL,1,0),(96,'PF','PYF','Polynésie française',NULL,1,0),(97,'TF','ATF','Terres australes françaises',NULL,1,0),(98,'GM','GMB','Gambie',NULL,1,0),(99,'GE','GEO','Georgia',NULL,1,0),(100,'GH','GHA','Ghana',NULL,1,0),(101,'GI','GIB','Gibraltar',NULL,1,0),(102,'GR','GRC','Greece',1,1,0),(103,'GL','GRL','Groenland',NULL,1,0),(104,'GD','GRD','Grenade',NULL,1,0),(106,'GU','GUM','Guam',NULL,1,0),(107,'GT','GTM','Guatemala',NULL,1,0),(108,'GN','GIN','Guinea',NULL,1,0),(109,'GW','GNB','Guinea-Bissao',NULL,1,0),(111,'HT','HTI','Haiti',NULL,1,0),(112,'HM','HMD','Iles Heard et McDonald',NULL,1,0),(113,'VA','VAT','Saint-Siège (Vatican)',NULL,1,0),(114,'HN','HND','Honduras',NULL,1,0),(115,'HK','HKG','Hong Kong',NULL,1,0),(116,'IS','ISL','Islande',NULL,1,0),(117,'IN','IND','India',NULL,1,0),(118,'ID','IDN','Indonésie',NULL,1,0),(119,'IR','IRN','Iran',NULL,1,0),(120,'IQ','IRQ','Iraq',NULL,1,0),(121,'IL','ISR','Israel',NULL,1,0),(122,'JM','JAM','Jamaïque',NULL,1,0),(123,'JP','JPN','Japon',NULL,1,0),(124,'JO','JOR','Jordanie',NULL,1,0),(125,'KZ','KAZ','Kazakhstan',NULL,1,0),(126,'KE','KEN','Kenya',NULL,1,0),(127,'KI','KIR','Kiribati',NULL,1,0),(128,'KP','PRK','North Corea',NULL,1,0),(129,'KR','KOR','South Corea',NULL,1,0),(130,'KW','KWT','Koweït',NULL,1,0),(131,'KG','KGZ','Kirghizistan',NULL,1,0),(132,'LA','LAO','Laos',NULL,1,0),(133,'LV','LVA','Lettonie',1,1,0),(134,'LB','LBN','Liban',NULL,1,0),(135,'LS','LSO','Lesotho',NULL,1,0),(136,'LR','LBR','Liberia',NULL,1,0),(137,'LY','LBY','Libye',NULL,1,0),(138,'LI','LIE','Liechtenstein',NULL,1,0),(139,'LT','LTU','Lituanie',1,1,0),(140,'LU','LUX','Luxembourg',1,1,0),(141,'MO','MAC','Macao',NULL,1,0),(142,'MK','MKD','ex-République yougoslave de Macédoine',NULL,1,0),(143,'MG','MDG','Madagascar',NULL,1,0),(144,'MW','MWI','Malawi',NULL,1,0),(145,'MY','MYS','Malaisie',NULL,1,0),(146,'MV','MDV','Maldives',NULL,1,0),(147,'ML','MLI','Mali',NULL,1,0),(148,'MT','MLT','Malte',1,1,0),(149,'MH','MHL','Iles Marshall',NULL,1,0),(151,'MR','MRT','Mauritanie',NULL,1,0),(152,'MU','MUS','Maurice',NULL,1,0),(153,'YT','MYT','Mayotte',NULL,1,0),(154,'MX','MEX','Mexique',NULL,1,0),(155,'FM','FSM','Micronésie',NULL,1,0),(156,'MD','MDA','Moldavie',NULL,1,0),(157,'MN','MNG','Mongolie',NULL,1,0),(158,'MS','MSR','Monserrat',NULL,1,0),(159,'MZ','MOZ','Mozambique',NULL,1,0),(160,'MM','MMR','Birmanie (Myanmar)',NULL,1,0),(161,'NA','NAM','Namibie',NULL,1,0),(162,'NR','NRU','Nauru',NULL,1,0),(163,'NP','NPL','Népal',NULL,1,0),(165,'NC','NCL','Nouvelle-Calédonie',NULL,1,0),(166,'NZ','NZL','Nouvelle-Zélande',NULL,1,0),(167,'NI','NIC','Nicaragua',NULL,1,0),(168,'NE','NER','Niger',NULL,1,0),(169,'NG','NGA','Nigeria',NULL,1,0),(170,'NU','NIU','Nioué',NULL,1,0),(171,'NF','NFK','Ile Norfolk',NULL,1,0),(172,'MP','MNP','Mariannes du Nord',NULL,1,0),(173,'NO','NOR','Norvège',NULL,1,0),(174,'OM','OMN','Oman',NULL,1,0),(175,'PK','PAK','Pakistan',NULL,1,0),(176,'PW','PLW','Palaos',NULL,1,0),(177,'PS','PSE','Territoire Palestinien Occupé',NULL,1,0),(178,'PA','PAN','Panama',NULL,1,0),(179,'PG','PNG','Papouasie-Nouvelle-Guinée',NULL,1,0),(180,'PY','PRY','Paraguay',NULL,1,0),(181,'PE','PER','Peru',NULL,1,0),(182,'PH','PHL','Philippines',NULL,1,0),(183,'PN','PCN','Iles Pitcairn',NULL,1,0),(184,'PL','POL','Pologne',1,1,0),(185,'PR','PRI','Porto Rico',NULL,1,0),(186,'QA','QAT','Qatar',NULL,1,0),(188,'RO','ROU','Roumanie',1,1,0),(189,'RW','RWA','Rwanda',NULL,1,0),(190,'SH','SHN','Sainte-Hélène',NULL,1,0),(191,'KN','KNA','Saint-Christophe-et-Niévès',NULL,1,0),(192,'LC','LCA','Sainte-Lucie',NULL,1,0),(193,'PM','SPM','Saint-Pierre-et-Miquelon',NULL,1,0),(194,'VC','VCT','Saint-Vincent-et-les-Grenadines',NULL,1,0),(195,'WS','WSM','Samoa',NULL,1,0),(196,'SM','SMR','Saint-Marin',NULL,1,0),(197,'ST','STP','Sao Tomé-et-Principe',NULL,1,0),(198,'RS','SRB','Serbie',NULL,1,0),(199,'SC','SYC','Seychelles',NULL,1,0),(200,'SL','SLE','Sierra Leone',NULL,1,0),(201,'SK','SVK','Slovaquie',1,1,0),(202,'SI','SVN','Slovénie',1,1,0),(203,'SB','SLB','Iles Salomon',NULL,1,0),(204,'SO','SOM','Somalie',NULL,1,0),(205,'ZA','ZAF','South Africa',NULL,1,0),(206,'GS','SGS','Iles Géorgie du Sud et Sandwich du Sud',NULL,1,0),(207,'LK','LKA','Sri Lanka',NULL,1,0),(208,'SD','SDN','Soudan',NULL,1,0),(209,'SR','SUR','Suriname',NULL,1,0),(210,'SJ','SJM','Iles Svalbard et Jan Mayen',NULL,1,0),(211,'SZ','SWZ','Swaziland',NULL,1,0),(212,'SY','SYR','Syrie',NULL,1,0),(213,'TW','TWN','Taïwan',NULL,1,0),(214,'TJ','TJK','Tadjikistan',NULL,1,0),(215,'TZ','TZA','Tanzanie',NULL,1,0),(216,'TH','THA','Thaïlande',NULL,1,0),(217,'TL','TLS','Timor Oriental',NULL,1,0),(218,'TK','TKL','Tokélaou',NULL,1,0),(219,'TO','TON','Tonga',NULL,1,0),(220,'TT','TTO','Trinité-et-Tobago',NULL,1,0),(221,'TR','TUR','Turquie',NULL,1,0),(222,'TM','TKM','Turkménistan',NULL,1,0),(223,'TC','TCA','Iles Turks-et-Caicos',NULL,1,0),(224,'TV','TUV','Tuvalu',NULL,1,0),(225,'UG','UGA','Ouganda',NULL,1,0),(226,'UA','UKR','Ukraine',NULL,1,0),(227,'AE','ARE','United Arab Emirates',NULL,1,0),(228,'UM','UMI','Iles mineures éloignées des États-Unis',NULL,1,0),(229,'UY','URY','Uruguay',NULL,1,0),(230,'UZ','UZB','Ouzbékistan',NULL,1,0),(231,'VU','VUT','Vanuatu',NULL,1,0),(232,'VE','VEN','Vénézuela',NULL,1,0),(233,'VN','VNM','Viêt Nam',NULL,1,0),(234,'VG','VGB','Iles Vierges britanniques',NULL,1,0),(235,'VI','VIR','Iles Vierges américaines',NULL,1,0),(236,'WF','WLF','Wallis-et-Futuna',NULL,1,0),(237,'EH','ESH','Sahara occidental',NULL,1,0),(238,'YE','YEM','Yémen',NULL,1,0),(239,'ZM','ZMB','Zambie',NULL,1,0),(240,'ZW','ZWE','Zimbabwe',NULL,1,0),(241,'GG','GGY','Guernesey',NULL,1,0),(242,'IM','IMN','Ile de Man',1,1,0),(243,'JE','JEY','Jersey',NULL,1,0),(244,'ME','MNE','Monténégro',NULL,1,0),(245,'BL','BLM','Saint-Barthélemy',NULL,1,0),(246,'MF','MAF','Saint-Martin',NULL,1,0),(247,'XK','XKX','Kosovo',NULL,1,0),(300,'CW','CUW','Curaçao',NULL,1,0),(301,'SX','SXM','Sint Maarten',NULL,1,0);
/*!40000 ALTER TABLE `llxas_c_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_currencies`
--

DROP TABLE IF EXISTS `llxas_c_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_currencies` (
  `code_iso` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unicode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`code_iso`),
  UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_currencies`
--

LOCK TABLES `llxas_c_currencies` WRITE;
/*!40000 ALTER TABLE `llxas_c_currencies` DISABLE KEYS */;
INSERT INTO `llxas_c_currencies` (`code_iso`, `label`, `unicode`, `active`) VALUES ('AED','United Arab Emirates Dirham',NULL,1),('AFN','Afghanistan Afghani','[1547]',1),('ALL','Albania Lek','[76,101,107]',1),('ANG','Netherlands Antilles Guilder','[402]',1),('AOA','Angola Kwanza',NULL,1),('ARP','Pesos argentins',NULL,0),('ARS','Argentino Peso','[36]',1),('ATS','Shiliing autrichiens',NULL,0),('AUD','Australia Dollar','[36]',1),('AWG','Aruba Guilder','[402]',1),('AZN','Azerbaijan New Manat','[1084,1072,1085]',1),('BAM','Bosnia and Herzegovina Convertible Marka','[75,77]',1),('BBD','Barbados Dollar','[36]',1),('BDT','Bangladeshi Taka','[2547]',1),('BEF','Francs belges',NULL,0),('BGN','Bulgaria Lev','[1083,1074]',1),('BHD','Bahrain',NULL,1),('BMD','Bermuda Dollar','[36]',1),('BND','Brunei Darussalam Dollar','[36]',1),('BOB','Bolivia Boliviano','[36,98]',1),('BRL','Brazil Real','[82,36]',1),('BSD','Bahamas Dollar','[36]',1),('BWP','Botswana Pula','[80]',1),('BYR','Belarus Ruble','[112,46]',1),('BZD','Belize Dollar','[66,90,36]',1),('CAD','Canada Dollar','[36]',1),('CHF','Switzerland Franc','[67,72,70]',1),('CLP','Chile Peso','[36]',1),('CNY','China Yuan Renminbi','[165]',1),('COP','Colombia Peso','[36]',1),('CRC','Costa Rica Colon','[8353]',1),('CUP','Cuba Peso','[8369]',1),('CVE','Cap Verde Escudo','[4217]',1),('CZK','Czech Republic Koruna','[75,269]',1),('DEM','Deutsche Mark',NULL,0),('DKK','Denmark Krone','[107,114]',1),('DOP','Dominican Republic Peso','[82,68,36]',1),('DZD','Algeria Dinar',NULL,1),('EEK','Estonia Kroon','[107,114]',1),('EGP','Egypt Pound','[163]',1),('ESP','Pesete',NULL,0),('ETB','Ethiopian Birr',NULL,1),('EUR','Euro Member Countries','[8364]',1),('FIM','Mark finlandais',NULL,0),('FJD','Fiji Dollar','[36]',1),('FKP','Falkland Islands (Malvinas) Pound','[163]',1),('FRF','Francs francais',NULL,0),('GBP','United Kingdom Pound','[163]',1),('GGP','Guernsey Pound','[163]',1),('GHC','Ghana Cedis','[162]',1),('GIP','Gibraltar Pound','[163]',1),('GNF','Guinea Franc','[70,71]',1),('GRD','Drachme (grece)',NULL,0),('GTQ','Guatemala Quetzal','[81]',1),('GYD','Guyana Dollar','[36]',1),('HKD','Hong Kong Dollar','[36]',1),('HNL','Honduras Lempira','[76]',1),('HRK','Croatia Kuna','[107,110]',1),('HUF','Hungary Forint','[70,116]',1),('IDR','Indonesia Rupiah','[82,112]',1),('IEP','Livres irlandaises',NULL,0),('ILS','Israel Shekel','[8362]',1),('IMP','Isle of Man Pound','[163]',1),('INR','India Rupee','[8377]',1),('IRR','Iran Rial','[65020]',1),('ISK','Iceland Krona','[107,114]',1),('ITL','Lires',NULL,0),('JEP','Jersey Pound','[163]',1),('JMD','Jamaica Dollar','[74,36]',1),('JPY','Japan Yen','[165]',1),('KES','Kenya Shilling',NULL,1),('KGS','Kyrgyzstan Som','[1083,1074]',1),('KHR','Cambodia Riel','[6107]',1),('KPW','Korea (North) Won','[8361]',1),('KRW','Korea (South) Won','[8361]',1),('KYD','Cayman Islands Dollar','[36]',1),('KZT','Kazakhstan Tenge','[1083,1074]',1),('LAK','Laos Kip','[8365]',1),('LBP','Lebanon Pound','[163]',1),('LKR','Sri Lanka Rupee','[8360]',1),('LRD','Liberia Dollar','[36]',1),('LTL','Lithuania Litas','[76,116]',1),('LUF','Francs luxembourgeois',NULL,0),('LVL','Latvia Lat','[76,115]',1),('MAD','Morocco Dirham',NULL,1),('MDL','Moldova Leu',NULL,1),('MGA','Ariary',NULL,1),('MKD','Macedonia Denar','[1076,1077,1085]',1),('MNT','Mongolia Tughrik','[8366]',1),('MRO','Mauritania Ouguiya',NULL,1),('MUR','Mauritius Rupee','[8360]',1),('MXN','Mexico Peso','[36]',1),('MXP','Pesos Mexicans',NULL,0),('MYR','Malaysia Ringgit','[82,77]',1),('MZN','Mozambique Metical','[77,84]',1),('NAD','Namibia Dollar','[36]',1),('NGN','Nigeria Naira','[8358]',1),('NIO','Nicaragua Cordoba','[67,36]',1),('NLG','Florins',NULL,0),('NOK','Norway Krone','[107,114]',1),('NPR','Nepal Rupee','[8360]',1),('NZD','New Zealand Dollar','[36]',1),('OMR','Oman Rial','[65020]',1),('PAB','Panama Balboa','[66,47,46]',1),('PEN','Peru Nuevo Sol','[83,47,46]',1),('PHP','Philippines Peso','[8369]',1),('PKR','Pakistan Rupee','[8360]',1),('PLN','Poland Zloty','[122,322]',1),('PTE','Escudos',NULL,0),('PYG','Paraguay Guarani','[71,115]',1),('QAR','Qatar Riyal','[65020]',1),('RON','Romania New Leu','[108,101,105]',1),('RSD','Serbia Dinar','[1044,1080,1085,46]',1),('RUB','Russia Ruble','[1088,1091,1073]',1),('SAR','Saudi Arabia Riyal','[65020]',1),('SBD','Solomon Islands Dollar','[36]',1),('SCR','Seychelles Rupee','[8360]',1),('SEK','Sweden Krona','[107,114]',1),('SGD','Singapore Dollar','[36]',1),('SHP','Saint Helena Pound','[163]',1),('SKK','Couronnes slovaques',NULL,0),('SOS','Somalia Shilling','[83]',1),('SRD','Suriname Dollar','[36]',1),('SUR','Rouble',NULL,0),('SVC','El Salvador Colon','[36]',1),('SYP','Syria Pound','[163]',1),('THB','Thailand Baht','[3647]',1),('TND','Tunisia Dinar',NULL,1),('TRL','Turkey Lira','[84,76]',0),('TRY','Turkey Lira','[8356]',1),('TTD','Trinidad and Tobago Dollar','[84,84,36]',1),('TVD','Tuvalu Dollar','[36]',1),('TWD','Taiwan New Dollar','[78,84,36]',1),('UAH','Ukraine Hryvna','[8372]',1),('USD','United States Dollar','[36]',1),('UYU','Uruguay Peso','[36,85]',1),('UZS','Uzbekistan Som','[1083,1074]',1),('VEF','Venezuela Bolivar Fuerte','[66,115]',1),('VND','Viet Nam Dong','[8363]',1),('XAF','Communaute Financiere Africaine (BEAC) CFA Franc',NULL,1),('XCD','East Caribbean Dollar','[36]',1),('XEU','Ecus',NULL,0),('XOF','Communaute Financiere Africaine (BCEAO) Franc',NULL,1),('XPF','Franc CFP','[70]',1),('YER','Yemen Rial','[65020]',1),('ZAR','South Africa Rand','[82]',1),('ZWD','Zimbabwe Dollar','[90,36]',1);
/*!40000 ALTER TABLE `llxas_c_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_departements`
--

DROP TABLE IF EXISTS `llxas_c_departements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_departements` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_departement` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_region` int(11) DEFAULT NULL,
  `cheflieu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `ncc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  KEY `idx_departements_fk_region` (`fk_region`),
  CONSTRAINT `fk_departements_fk_region` FOREIGN KEY (`fk_region`) REFERENCES `llxas_c_regions` (`code_region`)
) ENGINE=InnoDB AUTO_INCREMENT=1510 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_departements`
--

LOCK TABLES `llxas_c_departements` WRITE;
/*!40000 ALTER TABLE `llxas_c_departements` DISABLE KEYS */;
INSERT INTO `llxas_c_departements` (`rowid`, `code_departement`, `fk_region`, `cheflieu`, `tncc`, `ncc`, `nom`, `active`) VALUES (1,'0',0,'0',0,'-','-',1),(2,'971',1,'97105',3,'GUADELOUPE','Guadeloupe',1),(3,'972',2,'97209',3,'MARTINIQUE','Martinique',1),(4,'973',3,'97302',3,'GUYANE','Guyane',1),(5,'974',4,'97411',3,'REUNION','Réunion',1),(6,'976',6,'97601',3,'MAYOTTE','Mayotte',1),(7,'01',84,'01053',5,'AIN','Ain',1),(8,'02',32,'02408',5,'AISNE','Aisne',1),(9,'03',84,'03190',5,'ALLIER','Allier',1),(10,'04',93,'04070',4,'ALPES-DE-HAUTE-PROVENCE','Alpes-de-Haute-Provence',1),(11,'05',93,'05061',4,'HAUTES-ALPES','Hautes-Alpes',1),(12,'06',93,'06088',4,'ALPES-MARITIMES','Alpes-Maritimes',1),(13,'07',84,'07186',5,'ARDECHE','Ardèche',1),(14,'08',44,'08105',4,'ARDENNES','Ardennes',1),(15,'09',76,'09122',5,'ARIEGE','Ariège',1),(16,'10',44,'10387',5,'AUBE','Aube',1),(17,'11',76,'11069',5,'AUDE','Aude',1),(18,'12',76,'12202',5,'AVEYRON','Aveyron',1),(19,'13',93,'13055',4,'BOUCHES-DU-RHONE','Bouches-du-Rhône',1),(20,'14',28,'14118',2,'CALVADOS','Calvados',1),(21,'15',84,'15014',2,'CANTAL','Cantal',1),(22,'16',75,'16015',3,'CHARENTE','Charente',1),(23,'17',75,'17300',3,'CHARENTE-MARITIME','Charente-Maritime',1),(24,'18',24,'18033',2,'CHER','Cher',1),(25,'19',75,'19272',3,'CORREZE','Corrèze',1),(26,'2A',94,'2A004',3,'CORSE-DU-SUD','Corse-du-Sud',1),(27,'2B',94,'2B033',3,'HAUTE-CORSE','Haute-Corse',1),(28,'21',27,'21231',3,'COTE-D OR','Côte-d Or',1),(29,'22',53,'22278',4,'COTES-D ARMOR','Côtes-d Armor',1),(30,'23',75,'23096',3,'CREUSE','Creuse',1),(31,'24',75,'24322',3,'DORDOGNE','Dordogne',1),(32,'25',27,'25056',2,'DOUBS','Doubs',1),(33,'26',84,'26362',3,'DROME','Drôme',1),(34,'27',28,'27229',5,'EURE','Eure',1),(35,'28',24,'28085',1,'EURE-ET-LOIR','Eure-et-Loir',1),(36,'29',53,'29232',2,'FINISTERE','Finistère',1),(37,'30',76,'30189',2,'GARD','Gard',1),(38,'31',76,'31555',3,'HAUTE-GARONNE','Haute-Garonne',1),(39,'32',76,'32013',2,'GERS','Gers',1),(40,'33',75,'33063',3,'GIRONDE','Gironde',1),(41,'34',76,'34172',5,'HERAULT','Hérault',1),(42,'35',53,'35238',1,'ILLE-ET-VILAINE','Ille-et-Vilaine',1),(43,'36',24,'36044',5,'INDRE','Indre',1),(44,'37',24,'37261',1,'INDRE-ET-LOIRE','Indre-et-Loire',1),(45,'38',84,'38185',5,'ISERE','Isère',1),(46,'39',27,'39300',2,'JURA','Jura',1),(47,'40',75,'40192',4,'LANDES','Landes',1),(48,'41',24,'41018',0,'LOIR-ET-CHER','Loir-et-Cher',1),(49,'42',84,'42218',3,'LOIRE','Loire',1),(50,'43',84,'43157',3,'HAUTE-LOIRE','Haute-Loire',1),(51,'44',52,'44109',3,'LOIRE-ATLANTIQUE','Loire-Atlantique',1),(52,'45',24,'45234',2,'LOIRET','Loiret',1),(53,'46',76,'46042',2,'LOT','Lot',1),(54,'47',75,'47001',0,'LOT-ET-GARONNE','Lot-et-Garonne',1),(55,'48',76,'48095',3,'LOZERE','Lozère',1),(56,'49',52,'49007',0,'MAINE-ET-LOIRE','Maine-et-Loire',1),(57,'50',28,'50502',3,'MANCHE','Manche',1),(58,'51',44,'51108',3,'MARNE','Marne',1),(59,'52',44,'52121',3,'HAUTE-MARNE','Haute-Marne',1),(60,'53',52,'53130',3,'MAYENNE','Mayenne',1),(61,'54',44,'54395',0,'MEURTHE-ET-MOSELLE','Meurthe-et-Moselle',1),(62,'55',44,'55029',3,'MEUSE','Meuse',1),(63,'56',53,'56260',2,'MORBIHAN','Morbihan',1),(64,'57',44,'57463',3,'MOSELLE','Moselle',1),(65,'58',27,'58194',3,'NIEVRE','Nièvre',1),(66,'59',32,'59350',2,'NORD','Nord',1),(67,'60',32,'60057',5,'OISE','Oise',1),(68,'61',28,'61001',5,'ORNE','Orne',1),(69,'62',32,'62041',2,'PAS-DE-CALAIS','Pas-de-Calais',1),(70,'63',84,'63113',2,'PUY-DE-DOME','Puy-de-Dôme',1),(71,'64',75,'64445',4,'PYRENEES-ATLANTIQUES','Pyrénées-Atlantiques',1),(72,'65',76,'65440',4,'HAUTES-PYRENEES','Hautes-Pyrénées',1),(73,'66',76,'66136',4,'PYRENEES-ORIENTALES','Pyrénées-Orientales',1),(74,'67',44,'67482',2,'BAS-RHIN','Bas-Rhin',1),(75,'68',44,'68066',2,'HAUT-RHIN','Haut-Rhin',1),(76,'69',84,'69123',2,'RHONE','Rhône',1),(77,'70',27,'70550',3,'HAUTE-SAONE','Haute-Saône',1),(78,'71',27,'71270',0,'SAONE-ET-LOIRE','Saône-et-Loire',1),(79,'72',52,'72181',3,'SARTHE','Sarthe',1),(80,'73',84,'73065',3,'SAVOIE','Savoie',1),(81,'74',84,'74010',3,'HAUTE-SAVOIE','Haute-Savoie',1),(82,'75',11,'75056',0,'PARIS','Paris',1),(83,'76',28,'76540',3,'SEINE-MARITIME','Seine-Maritime',1),(84,'77',11,'77288',0,'SEINE-ET-MARNE','Seine-et-Marne',1),(85,'78',11,'78646',4,'YVELINES','Yvelines',1),(86,'79',75,'79191',4,'DEUX-SEVRES','Deux-Sèvres',1),(87,'80',32,'80021',3,'SOMME','Somme',1),(88,'81',76,'81004',2,'TARN','Tarn',1),(89,'82',76,'82121',0,'TARN-ET-GARONNE','Tarn-et-Garonne',1),(90,'83',93,'83137',2,'VAR','Var',1),(91,'84',93,'84007',0,'VAUCLUSE','Vaucluse',1),(92,'85',52,'85191',3,'VENDEE','Vendée',1),(93,'86',75,'86194',3,'VIENNE','Vienne',1),(94,'87',75,'87085',3,'HAUTE-VIENNE','Haute-Vienne',1),(95,'88',44,'88160',4,'VOSGES','Vosges',1),(96,'89',27,'89024',5,'YONNE','Yonne',1),(97,'90',27,'90010',0,'TERRITOIRE DE BELFORT','Territoire de Belfort',1),(98,'91',11,'91228',5,'ESSONNE','Essonne',1),(99,'92',11,'92050',4,'HAUTS-DE-SEINE','Hauts-de-Seine',1),(100,'93',11,'93008',3,'SEINE-SAINT-DENIS','Seine-Saint-Denis',1),(101,'94',11,'94028',2,'VAL-DE-MARNE','Val-de-Marne',1),(102,'95',11,'95500',2,'VAL-D OISE','Val-d Oise',1),(103,'B',4101,NULL,NULL,'BURGENLAND','Burgenland',1),(104,'K',4101,NULL,NULL,'KAERNTEN','Kärnten',1),(105,'N',4101,NULL,NULL,'NIEDEROESTERREICH','Niederösterreich',1),(106,'O',4101,NULL,NULL,'OBEROESTERREICH','Oberösterreich',1),(107,'S',4101,NULL,NULL,'SALZBURG','Salzburg',1),(108,'ST',4101,NULL,NULL,'STEIERMARK','Steiermark',1),(109,'T',4101,NULL,NULL,'TIROL','Tirol',1),(110,'V',4101,NULL,NULL,'VORARLBERG','Vorarlberg',1),(111,'W',4101,NULL,NULL,'WIEN','Wien',1),(112,'01',201,'',1,'ANVERS','Anvers',1),(113,'02',203,'',3,'BRUXELLES-CAPITALE','Bruxelles-Capitale',1),(114,'03',202,'',2,'BRABANT-WALLON','Brabant-Wallon',1),(115,'04',201,'',1,'BRABANT-FLAMAND','Brabant-Flamand',1),(116,'05',201,'',1,'FLANDRE-OCCIDENTALE','Flandre-Occidentale',1),(117,'06',201,'',1,'FLANDRE-ORIENTALE','Flandre-Orientale',1),(118,'07',202,'',2,'HAINAUT','Hainaut',1),(119,'08',201,'',2,'LIEGE','Liège',1),(120,'09',202,'',1,'LIMBOURG','Limbourg',1),(121,'10',202,'',2,'LUXEMBOURG','Luxembourg',1),(122,'11',201,'',2,'NAMUR','Namur',1),(123,'AG',315,NULL,NULL,NULL,'AGRIGENTO',1),(124,'AL',312,NULL,NULL,NULL,'ALESSANDRIA',1),(125,'AN',310,NULL,NULL,NULL,'ANCONA',1),(126,'AO',319,NULL,NULL,NULL,'AOSTA',1),(127,'AR',316,NULL,NULL,NULL,'AREZZO',1),(128,'AP',310,NULL,NULL,NULL,'ASCOLI PICENO',1),(129,'AT',312,NULL,NULL,NULL,'ASTI',1),(130,'AV',304,NULL,NULL,NULL,'AVELLINO',1),(131,'BA',313,NULL,NULL,NULL,'BARI',1),(132,'BT',313,NULL,NULL,NULL,'BARLETTA-ANDRIA-TRANI',1),(133,'BL',320,NULL,NULL,NULL,'BELLUNO',1),(134,'BN',304,NULL,NULL,NULL,'BENEVENTO',1),(135,'BG',309,NULL,NULL,NULL,'BERGAMO',1),(136,'BI',312,NULL,NULL,NULL,'BIELLA',1),(137,'BO',305,NULL,NULL,NULL,'BOLOGNA',1),(138,'BZ',317,NULL,NULL,NULL,'BOLZANO',1),(139,'BS',309,NULL,NULL,NULL,'BRESCIA',1),(140,'BR',313,NULL,NULL,NULL,'BRINDISI',1),(141,'CA',314,NULL,NULL,NULL,'CAGLIARI',1),(142,'CL',315,NULL,NULL,NULL,'CALTANISSETTA',1),(143,'CB',311,NULL,NULL,NULL,'CAMPOBASSO',1),(144,'CI',314,NULL,NULL,NULL,'CARBONIA-IGLESIAS',1),(145,'CE',304,NULL,NULL,NULL,'CASERTA',1),(146,'CT',315,NULL,NULL,NULL,'CATANIA',1),(147,'CZ',303,NULL,NULL,NULL,'CATANZARO',1),(148,'CH',301,NULL,NULL,NULL,'CHIETI',1),(149,'CO',309,NULL,NULL,NULL,'COMO',1),(150,'CS',303,NULL,NULL,NULL,'COSENZA',1),(151,'CR',309,NULL,NULL,NULL,'CREMONA',1),(152,'KR',303,NULL,NULL,NULL,'CROTONE',1),(153,'CN',312,NULL,NULL,NULL,'CUNEO',1),(154,'EN',315,NULL,NULL,NULL,'ENNA',1),(155,'FM',310,NULL,NULL,NULL,'FERMO',1),(156,'FE',305,NULL,NULL,NULL,'FERRARA',1),(157,'FI',316,NULL,NULL,NULL,'FIRENZE',1),(158,'FG',313,NULL,NULL,NULL,'FOGGIA',1),(159,'FC',305,NULL,NULL,NULL,'FORLI-CESENA',1),(160,'FR',307,NULL,NULL,NULL,'FROSINONE',1),(161,'GE',308,NULL,NULL,NULL,'GENOVA',1),(162,'GO',306,NULL,NULL,NULL,'GORIZIA',1),(163,'GR',316,NULL,NULL,NULL,'GROSSETO',1),(164,'IM',308,NULL,NULL,NULL,'IMPERIA',1),(165,'IS',311,NULL,NULL,NULL,'ISERNIA',1),(166,'SP',308,NULL,NULL,NULL,'LA SPEZIA',1),(167,'AQ',301,NULL,NULL,NULL,'L AQUILA',1),(168,'LT',307,NULL,NULL,NULL,'LATINA',1),(169,'LE',313,NULL,NULL,NULL,'LECCE',1),(170,'LC',309,NULL,NULL,NULL,'LECCO',1),(171,'LI',314,NULL,NULL,NULL,'LIVORNO',1),(172,'LO',309,NULL,NULL,NULL,'LODI',1),(173,'LU',316,NULL,NULL,NULL,'LUCCA',1),(174,'MC',310,NULL,NULL,NULL,'MACERATA',1),(175,'MN',309,NULL,NULL,NULL,'MANTOVA',1),(176,'MS',316,NULL,NULL,NULL,'MASSA-CARRARA',1),(177,'MT',302,NULL,NULL,NULL,'MATERA',1),(178,'VS',314,NULL,NULL,NULL,'MEDIO CAMPIDANO',1),(179,'ME',315,NULL,NULL,NULL,'MESSINA',1),(180,'MI',309,NULL,NULL,NULL,'MILANO',1),(181,'MB',309,NULL,NULL,NULL,'MONZA e BRIANZA',1),(182,'MO',305,NULL,NULL,NULL,'MODENA',1),(183,'NA',304,NULL,NULL,NULL,'NAPOLI',1),(184,'NO',312,NULL,NULL,NULL,'NOVARA',1),(185,'NU',314,NULL,NULL,NULL,'NUORO',1),(186,'OG',314,NULL,NULL,NULL,'OGLIASTRA',1),(187,'OT',314,NULL,NULL,NULL,'OLBIA-TEMPIO',1),(188,'OR',314,NULL,NULL,NULL,'ORISTANO',1),(189,'PD',320,NULL,NULL,NULL,'PADOVA',1),(190,'PA',315,NULL,NULL,NULL,'PALERMO',1),(191,'PR',305,NULL,NULL,NULL,'PARMA',1),(192,'PV',309,NULL,NULL,NULL,'PAVIA',1),(193,'PG',318,NULL,NULL,NULL,'PERUGIA',1),(194,'PU',310,NULL,NULL,NULL,'PESARO e URBINO',1),(195,'PE',301,NULL,NULL,NULL,'PESCARA',1),(196,'PC',305,NULL,NULL,NULL,'PIACENZA',1),(197,'PI',316,NULL,NULL,NULL,'PISA',1),(198,'PT',316,NULL,NULL,NULL,'PISTOIA',1),(199,'PN',306,NULL,NULL,NULL,'PORDENONE',1),(200,'PZ',302,NULL,NULL,NULL,'POTENZA',1),(201,'PO',316,NULL,NULL,NULL,'PRATO',1),(202,'RG',315,NULL,NULL,NULL,'RAGUSA',1),(203,'RA',305,NULL,NULL,NULL,'RAVENNA',1),(204,'RC',303,NULL,NULL,NULL,'REGGIO CALABRIA',1),(205,'RE',305,NULL,NULL,NULL,'REGGIO NELL EMILIA',1),(206,'RI',307,NULL,NULL,NULL,'RIETI',1),(207,'RN',305,NULL,NULL,NULL,'RIMINI',1),(208,'RM',307,NULL,NULL,NULL,'ROMA',1),(209,'RO',320,NULL,NULL,NULL,'ROVIGO',1),(210,'SA',304,NULL,NULL,NULL,'SALERNO',1),(211,'SS',314,NULL,NULL,NULL,'SASSARI',1),(212,'SV',308,NULL,NULL,NULL,'SAVONA',1),(213,'SI',316,NULL,NULL,NULL,'SIENA',1),(214,'SR',315,NULL,NULL,NULL,'SIRACUSA',1),(215,'SO',309,NULL,NULL,NULL,'SONDRIO',1),(216,'TA',313,NULL,NULL,NULL,'TARANTO',1),(217,'TE',301,NULL,NULL,NULL,'TERAMO',1),(218,'TR',318,NULL,NULL,NULL,'TERNI',1),(219,'TO',312,NULL,NULL,NULL,'TORINO',1),(220,'TP',315,NULL,NULL,NULL,'TRAPANI',1),(221,'TN',317,NULL,NULL,NULL,'TRENTO',1),(222,'TV',320,NULL,NULL,NULL,'TREVISO',1),(223,'TS',306,NULL,NULL,NULL,'TRIESTE',1),(224,'UD',306,NULL,NULL,NULL,'UDINE',1),(225,'VA',309,NULL,NULL,NULL,'VARESE',1),(226,'VE',320,NULL,NULL,NULL,'VENEZIA',1),(227,'VB',312,NULL,NULL,NULL,'VERBANO-CUSIO-OSSOLA',1),(228,'VC',312,NULL,NULL,NULL,'VERCELLI',1),(229,'VR',320,NULL,NULL,NULL,'VERONA',1),(230,'VV',303,NULL,NULL,NULL,'VIBO VALENTIA',1),(231,'VI',320,NULL,NULL,NULL,'VICENZA',1),(232,'VT',307,NULL,NULL,NULL,'VITERBO',1),(233,'AL01',1301,'',0,'','Wilaya d\'Adrar',1),(234,'AL02',1301,'',0,'','Wilaya de Chlef',1),(235,'AL03',1301,'',0,'','Wilaya de Laghouat',1),(236,'AL04',1301,'',0,'','Wilaya d\'Oum El Bouaghi',1),(237,'AL05',1301,'',0,'','Wilaya de Batna',1),(238,'AL06',1301,'',0,'','Wilaya de Béjaïa',1),(239,'AL07',1301,'',0,'','Wilaya de Biskra',1),(240,'AL08',1301,'',0,'','Wilaya de Béchar',1),(241,'AL09',1301,'',0,'','Wilaya de Blida',1),(242,'AL10',1301,'',0,'','Wilaya de Bouira',1),(243,'AL11',1301,'',0,'','Wilaya de Tamanrasset',1),(244,'AL12',1301,'',0,'','Wilaya de Tébessa',1),(245,'AL13',1301,'',0,'','Wilaya de Tlemcen',1),(246,'AL14',1301,'',0,'','Wilaya de Tiaret',1),(247,'AL15',1301,'',0,'','Wilaya de Tizi Ouzou',1),(248,'AL16',1301,'',0,'','Wilaya d\'Alger',1),(249,'AL17',1301,'',0,'','Wilaya de Djelfa',1),(250,'AL18',1301,'',0,'','Wilaya de Jijel',1),(251,'AL19',1301,'',0,'','Wilaya de Sétif	',1),(252,'AL20',1301,'',0,'','Wilaya de Saïda',1),(253,'AL21',1301,'',0,'','Wilaya de Skikda',1),(254,'AL22',1301,'',0,'','Wilaya de Sidi Bel Abbès',1),(255,'AL23',1301,'',0,'','Wilaya d\'Annaba',1),(256,'AL24',1301,'',0,'','Wilaya de Guelma',1),(257,'AL25',1301,'',0,'','Wilaya de Constantine',1),(258,'AL26',1301,'',0,'','Wilaya de Médéa',1),(259,'AL27',1301,'',0,'','Wilaya de Mostaganem',1),(260,'AL28',1301,'',0,'','Wilaya de M\'Sila',1),(261,'AL29',1301,'',0,'','Wilaya de Mascara',1),(262,'AL30',1301,'',0,'','Wilaya d\'Ouargla',1),(263,'AL31',1301,'',0,'','Wilaya d\'Oran',1),(264,'AL32',1301,'',0,'','Wilaya d\'El Bayadh',1),(265,'AL33',1301,'',0,'','Wilaya d\'Illizi',1),(266,'AL34',1301,'',0,'','Wilaya de Bordj Bou Arreridj',1),(267,'AL35',1301,'',0,'','Wilaya de Boumerdès',1),(268,'AL36',1301,'',0,'','Wilaya d\'El Tarf',1),(269,'AL37',1301,'',0,'','Wilaya de Tindouf',1),(270,'AL38',1301,'',0,'','Wilaya de Tissemsilt',1),(271,'AL39',1301,'',0,'','Wilaya d\'El Oued',1),(272,'AL40',1301,'',0,'','Wilaya de Khenchela',1),(273,'AL41',1301,'',0,'','Wilaya de Souk Ahras',1),(274,'AL42',1301,'',0,'','Wilaya de Tipaza',1),(275,'AL43',1301,'',0,'','Wilaya de Mila',1),(276,'AL44',1301,'',0,'','Wilaya d\'Aïn Defla',1),(277,'AL45',1301,'',0,'','Wilaya de Naâma',1),(278,'AL46',1301,'',0,'','Wilaya d\'Aïn Témouchent',1),(279,'AL47',1301,'',0,'','Wilaya de Ghardaia',1),(280,'AL48',1301,'',0,'','Wilaya de Relizane',1),(281,'MA',1209,'',0,'','Province de Benslimane',1),(282,'MA1',1209,'',0,'','Province de Berrechid',1),(283,'MA2',1209,'',0,'','Province de Khouribga',1),(284,'MA3',1209,'',0,'','Province de Settat',1),(285,'MA4',1210,'',0,'','Province d\'El Jadida',1),(286,'MA5',1210,'',0,'','Province de Safi',1),(287,'MA6',1210,'',0,'','Province de Sidi Bennour',1),(288,'MA7',1210,'',0,'','Province de Youssoufia',1),(289,'MA6B',1205,'',0,'','Préfecture de Fès',1),(290,'MA7B',1205,'',0,'','Province de Boulemane',1),(291,'MA8',1205,'',0,'','Province de Moulay Yacoub',1),(292,'MA9',1205,'',0,'','Province de Sefrou',1),(293,'MA8A',1202,'',0,'','Province de Kénitra',1),(294,'MA9A',1202,'',0,'','Province de Sidi Kacem',1),(295,'MA10',1202,'',0,'','Province de Sidi Slimane',1),(296,'MA11',1208,'',0,'','Préfecture de Casablanca',1),(297,'MA12',1208,'',0,'','Préfecture de Mohammédia',1),(298,'MA13',1208,'',0,'','Province de Médiouna',1),(299,'MA14',1208,'',0,'','Province de Nouaceur',1),(300,'MA15',1214,'',0,'','Province d\'Assa-Zag',1),(301,'MA16',1214,'',0,'','Province d\'Es-Semara',1),(302,'MA17A',1214,'',0,'','Province de Guelmim',1),(303,'MA18',1214,'',0,'','Province de Tata',1),(304,'MA19',1214,'',0,'','Province de Tan-Tan',1),(305,'MA15',1215,'',0,'','Province de Boujdour',1),(306,'MA16',1215,'',0,'','Province de Lâayoune',1),(307,'MA17',1215,'',0,'','Province de Tarfaya',1),(308,'MA18',1211,'',0,'','Préfecture de Marrakech',1),(309,'MA19',1211,'',0,'','Province d\'Al Haouz',1),(310,'MA20',1211,'',0,'','Province de Chichaoua',1),(311,'MA21',1211,'',0,'','Province d\'El Kelâa des Sraghna',1),(312,'MA22',1211,'',0,'','Province d\'Essaouira',1),(313,'MA23',1211,'',0,'','Province de Rehamna',1),(314,'MA24',1206,'',0,'','Préfecture de Meknès',1),(315,'MA25',1206,'',0,'','Province d’El Hajeb',1),(316,'MA26',1206,'',0,'','Province d\'Errachidia',1),(317,'MA27',1206,'',0,'','Province d’Ifrane',1),(318,'MA28',1206,'',0,'','Province de Khénifra',1),(319,'MA29',1206,'',0,'','Province de Midelt',1),(320,'MA30',1204,'',0,'','Préfecture d\'Oujda-Angad',1),(321,'MA31',1204,'',0,'','Province de Berkane',1),(322,'MA32',1204,'',0,'','Province de Driouch',1),(323,'MA33',1204,'',0,'','Province de Figuig',1),(324,'MA34',1204,'',0,'','Province de Jerada',1),(325,'MA35',1204,'',0,'','Province de Nador',1),(326,'MA36',1204,'',0,'','Province de Taourirt',1),(327,'MA37',1216,'',0,'','Province d\'Aousserd',1),(328,'MA38',1216,'',0,'','Province d\'Oued Ed-Dahab',1),(329,'MA39',1207,'',0,'','Préfecture de Rabat',1),(330,'MA40',1207,'',0,'','Préfecture de Skhirat-Témara',1),(331,'MA41',1207,'',0,'','Préfecture de Salé',1),(332,'MA42',1207,'',0,'','Province de Khémisset',1),(333,'MA43',1213,'',0,'','Préfecture d\'Agadir Ida-Outanane',1),(334,'MA44',1213,'',0,'','Préfecture d\'Inezgane-Aït Melloul',1),(335,'MA45',1213,'',0,'','Province de Chtouka-Aït Baha',1),(336,'MA46',1213,'',0,'','Province d\'Ouarzazate',1),(337,'MA47',1213,'',0,'','Province de Sidi Ifni',1),(338,'MA48',1213,'',0,'','Province de Taroudant',1),(339,'MA49',1213,'',0,'','Province de Tinghir',1),(340,'MA50',1213,'',0,'','Province de Tiznit',1),(341,'MA51',1213,'',0,'','Province de Zagora',1),(342,'MA52',1212,'',0,'','Province d\'Azilal',1),(343,'MA53',1212,'',0,'','Province de Beni Mellal',1),(344,'MA54',1212,'',0,'','Province de Fquih Ben Salah',1),(345,'MA55',1201,'',0,'','Préfecture de M\'diq-Fnideq',1),(346,'MA56',1201,'',0,'','Préfecture de Tanger-Asilah',1),(347,'MA57',1201,'',0,'','Province de Chefchaouen',1),(348,'MA58',1201,'',0,'','Province de Fahs-Anjra',1),(349,'MA59',1201,'',0,'','Province de Larache',1),(350,'MA60',1201,'',0,'','Province d\'Ouezzane',1),(351,'MA61',1201,'',0,'','Province de Tétouan',1),(352,'MA62',1203,'',0,'','Province de Guercif',1),(353,'MA63',1203,'',0,'','Province d\'Al Hoceïma',1),(354,'MA64',1203,'',0,'','Province de Taounate',1),(355,'MA65',1203,'',0,'','Province de Taza',1),(356,'MA6A',1205,'',0,'','Préfecture de Fès',1),(357,'MA7A',1205,'',0,'','Province de Boulemane',1),(358,'MA15A',1214,'',0,'','Province d\'Assa-Zag',1),(359,'MA16A',1214,'',0,'','Province d\'Es-Semara',1),(360,'MA18A',1211,'',0,'','Préfecture de Marrakech',1),(361,'MA19A',1214,'',0,'','Province de Tan-Tan',1),(362,'MA19B',1214,'',0,'','Province de Tan-Tan',1),(363,'TN01',1001,'',0,'','Ariana',1),(364,'TN02',1001,'',0,'','Béja',1),(365,'TN03',1001,'',0,'','Ben Arous',1),(366,'TN04',1001,'',0,'','Bizerte',1),(367,'TN05',1001,'',0,'','Gabès',1),(368,'TN06',1001,'',0,'','Gafsa',1),(369,'TN07',1001,'',0,'','Jendouba',1),(370,'TN08',1001,'',0,'','Kairouan',1),(371,'TN09',1001,'',0,'','Kasserine',1),(372,'TN10',1001,'',0,'','Kébili',1),(373,'TN11',1001,'',0,'','La Manouba',1),(374,'TN12',1001,'',0,'','Le Kef',1),(375,'TN13',1001,'',0,'','Mahdia',1),(376,'TN14',1001,'',0,'','Médenine',1),(377,'TN15',1001,'',0,'','Monastir',1),(378,'TN16',1001,'',0,'','Nabeul',1),(379,'TN17',1001,'',0,'','Sfax',1),(380,'TN18',1001,'',0,'','Sidi Bouzid',1),(381,'TN19',1001,'',0,'','Siliana',1),(382,'TN20',1001,'',0,'','Sousse',1),(383,'TN21',1001,'',0,'','Tataouine',1),(384,'TN22',1001,'',0,'','Tozeur',1),(385,'TN23',1001,'',0,'','Tunis',1),(386,'TN24',1001,'',0,'','Zaghouan',1),(387,'001',5201,'',0,'','Belisario Boeto',1),(388,'002',5201,'',0,'','Hernando Siles',1),(389,'003',5201,'',0,'','Jaime Zudáñez',1),(390,'004',5201,'',0,'','Juana Azurduy de Padilla',1),(391,'005',5201,'',0,'','Luis Calvo',1),(392,'006',5201,'',0,'','Nor Cinti',1),(393,'007',5201,'',0,'','Oropeza',1),(394,'008',5201,'',0,'','Sud Cinti',1),(395,'009',5201,'',0,'','Tomina',1),(396,'010',5201,'',0,'','Yamparáez',1),(397,'011',5202,'',0,'','Abel Iturralde',1),(398,'012',5202,'',0,'','Aroma',1),(399,'013',5202,'',0,'','Bautista Saavedra',1),(400,'014',5202,'',0,'','Caranavi',1),(401,'015',5202,'',0,'','Eliodoro Camacho',1),(402,'016',5202,'',0,'','Franz Tamayo',1),(403,'017',5202,'',0,'','Gualberto Villarroel',1),(404,'018',5202,'',0,'','Ingaví',1),(405,'019',5202,'',0,'','Inquisivi',1),(406,'020',5202,'',0,'','José Ramón Loayza',1),(407,'021',5202,'',0,'','Larecaja',1),(408,'022',5202,'',0,'','Los Andes (Bolivia)',1),(409,'023',5202,'',0,'','Manco Kapac',1),(410,'024',5202,'',0,'','Muñecas',1),(411,'025',5202,'',0,'','Nor Yungas',1),(412,'026',5202,'',0,'','Omasuyos',1),(413,'027',5202,'',0,'','Pacajes',1),(414,'028',5202,'',0,'','Pedro Domingo Murillo',1),(415,'029',5202,'',0,'','Sud Yungas',1),(416,'030',5202,'',0,'','General José Manuel Pando',1),(417,'031',5203,'',0,'','Arani',1),(418,'032',5203,'',0,'','Arque',1),(419,'033',5203,'',0,'','Ayopaya',1),(420,'034',5203,'',0,'','Bolívar (Bolivia)',1),(421,'035',5203,'',0,'','Campero',1),(422,'036',5203,'',0,'','Capinota',1),(423,'037',5203,'',0,'','Cercado (Cochabamba)',1),(424,'038',5203,'',0,'','Esteban Arze',1),(425,'039',5203,'',0,'','Germán Jordán',1),(426,'040',5203,'',0,'','José Carrasco',1),(427,'041',5203,'',0,'','Mizque',1),(428,'042',5203,'',0,'','Punata',1),(429,'043',5203,'',0,'','Quillacollo',1),(430,'044',5203,'',0,'','Tapacarí',1),(431,'045',5203,'',0,'','Tiraque',1),(432,'046',5203,'',0,'','Chapare',1),(433,'047',5204,'',0,'','Carangas',1),(434,'048',5204,'',0,'','Cercado (Oruro)',1),(435,'049',5204,'',0,'','Eduardo Avaroa',1),(436,'050',5204,'',0,'','Ladislao Cabrera',1),(437,'051',5204,'',0,'','Litoral de Atacama',1),(438,'052',5204,'',0,'','Mejillones',1),(439,'053',5204,'',0,'','Nor Carangas',1),(440,'054',5204,'',0,'','Pantaleón Dalence',1),(441,'055',5204,'',0,'','Poopó',1),(442,'056',5204,'',0,'','Sabaya',1),(443,'057',5204,'',0,'','Sajama',1),(444,'058',5204,'',0,'','San Pedro de Totora',1),(445,'059',5204,'',0,'','Saucarí',1),(446,'060',5204,'',0,'','Sebastián Pagador',1),(447,'061',5204,'',0,'','Sud Carangas',1),(448,'062',5204,'',0,'','Tomás Barrón',1),(449,'063',5205,'',0,'','Alonso de Ibáñez',1),(450,'064',5205,'',0,'','Antonio Quijarro',1),(451,'065',5205,'',0,'','Bernardino Bilbao',1),(452,'066',5205,'',0,'','Charcas (Potosí)',1),(453,'067',5205,'',0,'','Chayanta',1),(454,'068',5205,'',0,'','Cornelio Saavedra',1),(455,'069',5205,'',0,'','Daniel Campos',1),(456,'070',5205,'',0,'','Enrique Baldivieso',1),(457,'071',5205,'',0,'','José María Linares',1),(458,'072',5205,'',0,'','Modesto Omiste',1),(459,'073',5205,'',0,'','Nor Chichas',1),(460,'074',5205,'',0,'','Nor Lípez',1),(461,'075',5205,'',0,'','Rafael Bustillo',1),(462,'076',5205,'',0,'','Sud Chichas',1),(463,'077',5205,'',0,'','Sud Lípez',1),(464,'078',5205,'',0,'','Tomás Frías',1),(465,'079',5206,'',0,'','Aniceto Arce',1),(466,'080',5206,'',0,'','Burdet O\'Connor',1),(467,'081',5206,'',0,'','Cercado (Tarija)',1),(468,'082',5206,'',0,'','Eustaquio Méndez',1),(469,'083',5206,'',0,'','José María Avilés',1),(470,'084',5206,'',0,'','Gran Chaco',1),(471,'085',5207,'',0,'','Andrés Ibáñez',1),(472,'086',5207,'',0,'','Caballero',1),(473,'087',5207,'',0,'','Chiquitos',1),(474,'088',5207,'',0,'','Cordillera (Bolivia)',1),(475,'089',5207,'',0,'','Florida',1),(476,'090',5207,'',0,'','Germán Busch',1),(477,'091',5207,'',0,'','Guarayos',1),(478,'092',5207,'',0,'','Ichilo',1),(479,'093',5207,'',0,'','Obispo Santistevan',1),(480,'094',5207,'',0,'','Sara',1),(481,'095',5207,'',0,'','Vallegrande',1),(482,'096',5207,'',0,'','Velasco',1),(483,'097',5207,'',0,'','Warnes',1),(484,'098',5207,'',0,'','Ángel Sandóval',1),(485,'099',5207,'',0,'','Ñuflo de Chaves',1),(486,'100',5208,'',0,'','Cercado (Beni)',1),(487,'101',5208,'',0,'','Iténez',1),(488,'102',5208,'',0,'','Mamoré',1),(489,'103',5208,'',0,'','Marbán',1),(490,'104',5208,'',0,'','Moxos',1),(491,'105',5208,'',0,'','Vaca Díez',1),(492,'106',5208,'',0,'','Yacuma',1),(493,'107',5208,'',0,'','General José Ballivián Segurola',1),(494,'108',5209,'',0,'','Abuná',1),(495,'109',5209,'',0,'','Madre de Dios',1),(496,'110',5209,'',0,'','Manuripi',1),(497,'111',5209,'',0,'','Nicolás Suárez',1),(498,'112',5209,'',0,'','General Federico Román',1),(499,'NSW',2801,'',1,'','New South Wales',1),(500,'VIC',2801,'',1,'','Victoria',1),(501,'QLD',2801,'',1,'','Queensland',1),(502,'SA',2801,'',1,'','South Australia',1),(503,'ACT',2801,'',1,'','Australia Capital Territory',1),(504,'TAS',2801,'',1,'','Tasmania',1),(505,'WA',2801,'',1,'','Western Australia',1),(506,'NT',2801,'',1,'','Northern Territory',1),(507,'ON',1401,'',1,'','Ontario',1),(508,'QC',1401,'',1,'','Quebec',1),(509,'NS',1401,'',1,'','Nova Scotia',1),(510,'NB',1401,'',1,'','New Brunswick',1),(511,'MB',1401,'',1,'','Manitoba',1),(512,'BC',1401,'',1,'','British Columbia',1),(513,'PE',1401,'',1,'','Prince Edward Island',1),(514,'SK',1401,'',1,'','Saskatchewan',1),(515,'AB',1401,'',1,'','Alberta',1),(516,'NL',1401,'',1,'','Newfoundland and Labrador',1),(517,'VI',419,'01',19,'ALAVA','Álava',1),(518,'AB',404,'02',4,'ALBACETE','Albacete',1),(519,'A',411,'03',11,'ALICANTE','Alicante',1),(520,'AL',401,'04',1,'ALMERIA','Almería',1),(521,'O',418,'33',18,'ASTURIAS','Asturias',1),(522,'AV',403,'05',3,'AVILA','Ávila',1),(523,'BA',412,'06',12,'BADAJOZ','Badajoz',1),(524,'B',406,'08',6,'BARCELONA','Barcelona',1),(525,'BU',403,'09',8,'BURGOS','Burgos',1),(526,'CC',412,'10',12,'CACERES','Cáceres',1),(527,'CA',401,'11',1,'CADIZ','Cádiz',1),(528,'S',410,'39',10,'CANTABRIA','Cantabria',1),(529,'CS',411,'12',11,'CASTELLON','Castellón',1),(530,'CE',407,'51',7,'CEUTA','Ceuta',1),(531,'CR',404,'13',4,'CIUDAD REAL','Ciudad Real',1),(532,'CO',401,'14',1,'CORDOBA','Córdoba',1),(533,'CU',404,'16',4,'CUENCA','Cuenca',1),(534,'GI',406,'17',6,'GERONA','Gerona',1),(535,'GR',401,'18',1,'GRANADA','Granada',1),(536,'GU',404,'19',4,'GUADALAJARA','Guadalajara',1),(537,'SS',419,'20',19,'GUIPUZCOA','Guipúzcoa',1),(538,'H',401,'21',1,'HUELVA','Huelva',1),(539,'HU',402,'22',2,'HUESCA','Huesca',1),(540,'PM',414,'07',14,'ISLAS BALEARES','Islas Baleares',1),(541,'J',401,'23',1,'JAEN','Jaén',1),(542,'C',413,'15',13,'LA CORUÑA','La Coruña',1),(543,'LO',415,'26',15,'LA RIOJA','La Rioja',1),(544,'GC',405,'35',5,'LAS PALMAS','Las Palmas',1),(545,'LE',403,'24',3,'LEON','León',1),(546,'L',406,'25',6,'LERIDA','Lérida',1),(547,'LU',413,'27',13,'LUGO','Lugo',1),(548,'M',416,'28',16,'MADRID','Madrid',1),(549,'MA',401,'29',1,'MALAGA','Málaga',1),(550,'ML',409,'52',9,'MELILLA','Melilla',1),(551,'MU',417,'30',17,'MURCIA','Murcia',1),(552,'NA',408,'31',8,'NAVARRA','Navarra',1),(553,'OR',413,'32',13,'ORENSE','Orense',1),(554,'P',403,'34',3,'PALENCIA','Palencia',1),(555,'PO',413,'36',13,'PONTEVEDRA','Pontevedra',1),(556,'SA',403,'37',3,'SALAMANCA','Salamanca',1),(557,'TF',405,'38',5,'STA. CRUZ DE TENERIFE','Santa Cruz de Tenerife',1),(558,'SG',403,'40',3,'SEGOVIA','Segovia',1),(559,'SE',401,'41',1,'SEVILLA','Sevilla',1),(560,'SO',403,'42',3,'SORIA','Soria',1),(561,'T',406,'43',6,'TARRAGONA','Tarragona',1),(562,'TE',402,'44',2,'TERUEL','Teruel',1),(563,'TO',404,'45',5,'TOLEDO','Toledo',1),(564,'V',411,'46',11,'VALENCIA','Valencia',1),(565,'VA',403,'47',3,'VALLADOLID','Valladolid',1),(566,'BI',419,'48',19,'VIZCAYA','Vizcaya',1),(567,'ZA',403,'49',3,'ZAMORA','Zamora',1),(568,'Z',402,'50',1,'ZARAGOZA','Zaragoza',1),(569,'BW',501,NULL,NULL,'BADEN-WÜRTTEMBERG','Baden-Württemberg',1),(570,'BY',501,NULL,NULL,'BAYERN','Bayern',1),(571,'BE',501,NULL,NULL,'BERLIN','Berlin',1),(572,'BB',501,NULL,NULL,'BRANDENBURG','Brandenburg',1),(573,'HB',501,NULL,NULL,'BREMEN','Bremen',1),(574,'HH',501,NULL,NULL,'HAMBURG','Hamburg',1),(575,'HE',501,NULL,NULL,'HESSEN','Hessen',1),(576,'MV',501,NULL,NULL,'MECKLENBURG-VORPOMMERN','Mecklenburg-Vorpommern',1),(577,'NI',501,NULL,NULL,'NIEDERSACHSEN','Niedersachsen',1),(578,'NW',501,NULL,NULL,'NORDRHEIN-WESTFALEN','Nordrhein-Westfalen',1),(579,'RP',501,NULL,NULL,'RHEINLAND-PFALZ','Rheinland-Pfalz',1),(580,'SL',501,NULL,NULL,'SAARLAND','Saarland',1),(581,'SN',501,NULL,NULL,'SACHSEN','Sachsen',1),(582,'ST',501,NULL,NULL,'SACHSEN-ANHALT','Sachsen-Anhalt',1),(583,'SH',501,NULL,NULL,'SCHLESWIG-HOLSTEIN','Schleswig-Holstein',1),(584,'TH',501,NULL,NULL,'THÜRINGEN','Thüringen',1),(585,'66',10201,'',0,'','Αθήνα',1),(586,'67',10205,'',0,'','Δράμα',1),(587,'01',10205,'',0,'','Έβρος',1),(588,'02',10205,'',0,'','Θάσος',1),(589,'03',10205,'',0,'','Καβάλα',1),(590,'04',10205,'',0,'','Ξάνθη',1),(591,'05',10205,'',0,'','Ροδόπη',1),(592,'06',10203,'',0,'','Ημαθία',1),(593,'07',10203,'',0,'','Θεσσαλονίκη',1),(594,'08',10203,'',0,'','Κιλκίς',1),(595,'09',10203,'',0,'','Πέλλα',1),(596,'10',10203,'',0,'','Πιερία',1),(597,'11',10203,'',0,'','Σέρρες',1),(598,'12',10203,'',0,'','Χαλκιδική',1),(599,'13',10206,'',0,'','Άρτα',1),(600,'14',10206,'',0,'','Θεσπρωτία',1),(601,'15',10206,'',0,'','Ιωάννινα',1),(602,'16',10206,'',0,'','Πρέβεζα',1),(603,'17',10213,'',0,'','Γρεβενά',1),(604,'18',10213,'',0,'','Καστοριά',1),(605,'19',10213,'',0,'','Κοζάνη',1),(606,'20',10213,'',0,'','Φλώρινα',1),(607,'21',10212,'',0,'','Καρδίτσα',1),(608,'22',10212,'',0,'','Λάρισα',1),(609,'23',10212,'',0,'','Μαγνησία',1),(610,'24',10212,'',0,'','Τρίκαλα',1),(611,'25',10212,'',0,'','Σποράδες',1),(612,'26',10212,'',0,'','Βοιωτία',1),(613,'27',10202,'',0,'','Εύβοια',1),(614,'28',10202,'',0,'','Ευρυτανία',1),(615,'29',10202,'',0,'','Φθιώτιδα',1),(616,'30',10202,'',0,'','Φωκίδα',1),(617,'31',10209,'',0,'','Αργολίδα',1),(618,'32',10209,'',0,'','Αρκαδία',1),(619,'33',10209,'',0,'','Κορινθία',1),(620,'34',10209,'',0,'','Λακωνία',1),(621,'35',10209,'',0,'','Μεσσηνία',1),(622,'36',10211,'',0,'','Αιτωλοακαρνανία',1),(623,'37',10211,'',0,'','Αχαΐα',1),(624,'38',10211,'',0,'','Ηλεία',1),(625,'39',10207,'',0,'','Ζάκυνθος',1),(626,'40',10207,'',0,'','Κέρκυρα',1),(627,'41',10207,'',0,'','Κεφαλληνία',1),(628,'42',10207,'',0,'','Ιθάκη',1),(629,'43',10207,'',0,'','Λευκάδα',1),(630,'44',10208,'',0,'','Ικαρία',1),(631,'45',10208,'',0,'','Λέσβος',1),(632,'46',10208,'',0,'','Λήμνος',1),(633,'47',10208,'',0,'','Σάμος',1),(634,'48',10208,'',0,'','Χίος',1),(635,'49',10210,'',0,'','Άνδρος',1),(636,'50',10210,'',0,'','Θήρα',1),(637,'51',10210,'',0,'','Κάλυμνος',1),(638,'52',10210,'',0,'','Κάρπαθος',1),(639,'53',10210,'',0,'','Κέα-Κύθνος',1),(640,'54',10210,'',0,'','Κω',1),(641,'55',10210,'',0,'','Μήλος',1),(642,'56',10210,'',0,'','Μύκονος',1),(643,'57',10210,'',0,'','Νάξος',1),(644,'58',10210,'',0,'','Πάρος',1),(645,'59',10210,'',0,'','Ρόδος',1),(646,'60',10210,'',0,'','Σύρος',1),(647,'61',10210,'',0,'','Τήνος',1),(648,'62',10204,'',0,'','Ηράκλειο',1),(649,'63',10204,'',0,'','Λασίθι',1),(650,'64',10204,'',0,'','Ρέθυμνο',1),(651,'65',10204,'',0,'','Χανιά',1),(652,'AG',601,NULL,NULL,'ARGOVIE','Argovie',1),(653,'AI',601,NULL,NULL,'APPENZELL RHODES INTERIEURES','Appenzell Rhodes intérieures',1),(654,'AR',601,NULL,NULL,'APPENZELL RHODES EXTERIEURES','Appenzell Rhodes extérieures',1),(655,'BE',601,NULL,NULL,'BERNE','Berne',1),(656,'BL',601,NULL,NULL,'BALE CAMPAGNE','Bâle Campagne',1),(657,'BS',601,NULL,NULL,'BALE VILLE','Bâle Ville',1),(658,'FR',601,NULL,NULL,'FRIBOURG','Fribourg',1),(659,'GE',601,NULL,NULL,'GENEVE','Genève',1),(660,'GL',601,NULL,NULL,'GLARIS','Glaris',1),(661,'GR',601,NULL,NULL,'GRISONS','Grisons',1),(662,'JU',601,NULL,NULL,'JURA','Jura',1),(663,'LU',601,NULL,NULL,'LUCERNE','Lucerne',1),(664,'NE',601,NULL,NULL,'NEUCHATEL','Neuchâtel',1),(665,'NW',601,NULL,NULL,'NIDWALD','Nidwald',1),(666,'OW',601,NULL,NULL,'OBWALD','Obwald',1),(667,'SG',601,NULL,NULL,'SAINT-GALL','Saint-Gall',1),(668,'SH',601,NULL,NULL,'SCHAFFHOUSE','Schaffhouse',1),(669,'SO',601,NULL,NULL,'SOLEURE','Soleure',1),(670,'SZ',601,NULL,NULL,'SCHWYZ','Schwyz',1),(671,'TG',601,NULL,NULL,'THURGOVIE','Thurgovie',1),(672,'TI',601,NULL,NULL,'TESSIN','Tessin',1),(673,'UR',601,NULL,NULL,'URI','Uri',1),(674,'VD',601,NULL,NULL,'VAUD','Vaud',1),(675,'VS',601,NULL,NULL,'VALAIS','Valais',1),(676,'ZG',601,NULL,NULL,'ZUG','Zug',1),(677,'ZH',601,NULL,NULL,'ZURICH','Zürich',1),(678,'701',701,NULL,0,NULL,'Bedfordshire',1),(679,'702',701,NULL,0,NULL,'Berkshire',1),(680,'703',701,NULL,0,NULL,'Bristol, City of',1),(681,'704',701,NULL,0,NULL,'Buckinghamshire',1),(682,'705',701,NULL,0,NULL,'Cambridgeshire',1),(683,'706',701,NULL,0,NULL,'Cheshire',1),(684,'707',701,NULL,0,NULL,'Cleveland',1),(685,'708',701,NULL,0,NULL,'Cornwall',1),(686,'709',701,NULL,0,NULL,'Cumberland',1),(687,'710',701,NULL,0,NULL,'Cumbria',1),(688,'711',701,NULL,0,NULL,'Derbyshire',1),(689,'712',701,NULL,0,NULL,'Devon',1),(690,'713',701,NULL,0,NULL,'Dorset',1),(691,'714',701,NULL,0,NULL,'Co. Durham',1),(692,'715',701,NULL,0,NULL,'East Riding of Yorkshire',1),(693,'716',701,NULL,0,NULL,'East Sussex',1),(694,'717',701,NULL,0,NULL,'Essex',1),(695,'718',701,NULL,0,NULL,'Gloucestershire',1),(696,'719',701,NULL,0,NULL,'Greater Manchester',1),(697,'720',701,NULL,0,NULL,'Hampshire',1),(698,'721',701,NULL,0,NULL,'Hertfordshire',1),(699,'722',701,NULL,0,NULL,'Hereford and Worcester',1),(700,'723',701,NULL,0,NULL,'Herefordshire',1),(701,'724',701,NULL,0,NULL,'Huntingdonshire',1),(702,'725',701,NULL,0,NULL,'Isle of Man',1),(703,'726',701,NULL,0,NULL,'Isle of Wight',1),(704,'727',701,NULL,0,NULL,'Jersey',1),(705,'728',701,NULL,0,NULL,'Kent',1),(706,'729',701,NULL,0,NULL,'Lancashire',1),(707,'730',701,NULL,0,NULL,'Leicestershire',1),(708,'731',701,NULL,0,NULL,'Lincolnshire',1),(709,'732',701,NULL,0,NULL,'London - City of London',1),(710,'733',701,NULL,0,NULL,'Merseyside',1),(711,'734',701,NULL,0,NULL,'Middlesex',1),(712,'735',701,NULL,0,NULL,'Norfolk',1),(713,'736',701,NULL,0,NULL,'North Yorkshire',1),(714,'737',701,NULL,0,NULL,'North Riding of Yorkshire',1),(715,'738',701,NULL,0,NULL,'Northamptonshire',1),(716,'739',701,NULL,0,NULL,'Northumberland',1),(717,'740',701,NULL,0,NULL,'Nottinghamshire',1),(718,'741',701,NULL,0,NULL,'Oxfordshire',1),(719,'742',701,NULL,0,NULL,'Rutland',1),(720,'743',701,NULL,0,NULL,'Shropshire',1),(721,'744',701,NULL,0,NULL,'Somerset',1),(722,'745',701,NULL,0,NULL,'Staffordshire',1),(723,'746',701,NULL,0,NULL,'Suffolk',1),(724,'747',701,NULL,0,NULL,'Surrey',1),(725,'748',701,NULL,0,NULL,'Sussex',1),(726,'749',701,NULL,0,NULL,'Tyne and Wear',1),(727,'750',701,NULL,0,NULL,'Warwickshire',1),(728,'751',701,NULL,0,NULL,'West Midlands',1),(729,'752',701,NULL,0,NULL,'West Sussex',1),(730,'753',701,NULL,0,NULL,'West Yorkshire',1),(731,'754',701,NULL,0,NULL,'West Riding of Yorkshire',1),(732,'755',701,NULL,0,NULL,'Wiltshire',1),(733,'756',701,NULL,0,NULL,'Worcestershire',1),(734,'757',701,NULL,0,NULL,'Yorkshire',1),(735,'758',702,NULL,0,NULL,'Anglesey',1),(736,'759',702,NULL,0,NULL,'Breconshire',1),(737,'760',702,NULL,0,NULL,'Caernarvonshire',1),(738,'761',702,NULL,0,NULL,'Cardiganshire',1),(739,'762',702,NULL,0,NULL,'Carmarthenshire',1),(740,'763',702,NULL,0,NULL,'Ceredigion',1),(741,'764',702,NULL,0,NULL,'Denbighshire',1),(742,'765',702,NULL,0,NULL,'Flintshire',1),(743,'766',702,NULL,0,NULL,'Glamorgan',1),(744,'767',702,NULL,0,NULL,'Gwent',1),(745,'768',702,NULL,0,NULL,'Gwynedd',1),(746,'769',702,NULL,0,NULL,'Merionethshire',1),(747,'770',702,NULL,0,NULL,'Monmouthshire',1),(748,'771',702,NULL,0,NULL,'Mid Glamorgan',1),(749,'772',702,NULL,0,NULL,'Montgomeryshire',1),(750,'773',702,NULL,0,NULL,'Pembrokeshire',1),(751,'774',702,NULL,0,NULL,'Powys',1),(752,'775',702,NULL,0,NULL,'Radnorshire',1),(753,'776',702,NULL,0,NULL,'South Glamorgan',1),(754,'777',703,NULL,0,NULL,'Aberdeen, City of',1),(755,'778',703,NULL,0,NULL,'Angus',1),(756,'779',703,NULL,0,NULL,'Argyll',1),(757,'780',703,NULL,0,NULL,'Ayrshire',1),(758,'781',703,NULL,0,NULL,'Banffshire',1),(759,'782',703,NULL,0,NULL,'Berwickshire',1),(760,'783',703,NULL,0,NULL,'Bute',1),(761,'784',703,NULL,0,NULL,'Caithness',1),(762,'785',703,NULL,0,NULL,'Clackmannanshire',1),(763,'786',703,NULL,0,NULL,'Dumfriesshire',1),(764,'787',703,NULL,0,NULL,'Dumbartonshire',1),(765,'788',703,NULL,0,NULL,'Dundee, City of',1),(766,'789',703,NULL,0,NULL,'East Lothian',1),(767,'790',703,NULL,0,NULL,'Fife',1),(768,'791',703,NULL,0,NULL,'Inverness',1),(769,'792',703,NULL,0,NULL,'Kincardineshire',1),(770,'793',703,NULL,0,NULL,'Kinross-shire',1),(771,'794',703,NULL,0,NULL,'Kirkcudbrightshire',1),(772,'795',703,NULL,0,NULL,'Lanarkshire',1),(773,'796',703,NULL,0,NULL,'Midlothian',1),(774,'797',703,NULL,0,NULL,'Morayshire',1),(775,'798',703,NULL,0,NULL,'Nairnshire',1),(776,'799',703,NULL,0,NULL,'Orkney',1),(777,'800',703,NULL,0,NULL,'Peebleshire',1),(778,'801',703,NULL,0,NULL,'Perthshire',1),(779,'802',703,NULL,0,NULL,'Renfrewshire',1),(780,'803',703,NULL,0,NULL,'Ross & Cromarty',1),(781,'804',703,NULL,0,NULL,'Roxburghshire',1),(782,'805',703,NULL,0,NULL,'Selkirkshire',1),(783,'806',703,NULL,0,NULL,'Shetland',1),(784,'807',703,NULL,0,NULL,'Stirlingshire',1),(785,'808',703,NULL,0,NULL,'Sutherland',1),(786,'809',703,NULL,0,NULL,'West Lothian',1),(787,'810',703,NULL,0,NULL,'Wigtownshire',1),(788,'811',704,NULL,0,NULL,'Antrim',1),(789,'812',704,NULL,0,NULL,'Armagh',1),(790,'813',704,NULL,0,NULL,'Co. Down',1),(791,'814',704,NULL,0,NULL,'Co. Fermanagh',1),(792,'815',704,NULL,0,NULL,'Co. Londonderry',1),(793,'AL',1101,'',0,'ALABAMA','Alabama',1),(794,'AK',1101,'',0,'ALASKA','Alaska',1),(795,'AZ',1101,'',0,'ARIZONA','Arizona',1),(796,'AR',1101,'',0,'ARKANSAS','Arkansas',1),(797,'CA',1101,'',0,'CALIFORNIA','California',1),(798,'CO',1101,'',0,'COLORADO','Colorado',1),(799,'CT',1101,'',0,'CONNECTICUT','Connecticut',1),(800,'DE',1101,'',0,'DELAWARE','Delaware',1),(801,'FL',1101,'',0,'FLORIDA','Florida',1),(802,'GA',1101,'',0,'GEORGIA','Georgia',1),(803,'HI',1101,'',0,'HAWAII','Hawaii',1),(804,'ID',1101,'',0,'IDAHO','Idaho',1),(805,'IL',1101,'',0,'ILLINOIS','Illinois',1),(806,'IN',1101,'',0,'INDIANA','Indiana',1),(807,'IA',1101,'',0,'IOWA','Iowa',1),(808,'KS',1101,'',0,'KANSAS','Kansas',1),(809,'KY',1101,'',0,'KENTUCKY','Kentucky',1),(810,'LA',1101,'',0,'LOUISIANA','Louisiana',1),(811,'ME',1101,'',0,'MAINE','Maine',1),(812,'MD',1101,'',0,'MARYLAND','Maryland',1),(813,'MA',1101,'',0,'MASSACHUSSETTS','Massachusetts',1),(814,'MI',1101,'',0,'MICHIGAN','Michigan',1),(815,'MN',1101,'',0,'MINNESOTA','Minnesota',1),(816,'MS',1101,'',0,'MISSISSIPPI','Mississippi',1),(817,'MO',1101,'',0,'MISSOURI','Missouri',1),(818,'MT',1101,'',0,'MONTANA','Montana',1),(819,'NE',1101,'',0,'NEBRASKA','Nebraska',1),(820,'NV',1101,'',0,'NEVADA','Nevada',1),(821,'NH',1101,'',0,'NEW HAMPSHIRE','New Hampshire',1),(822,'NJ',1101,'',0,'NEW JERSEY','New Jersey',1),(823,'NM',1101,'',0,'NEW MEXICO','New Mexico',1),(824,'NY',1101,'',0,'NEW YORK','New York',1),(825,'NC',1101,'',0,'NORTH CAROLINA','North Carolina',1),(826,'ND',1101,'',0,'NORTH DAKOTA','North Dakota',1),(827,'OH',1101,'',0,'OHIO','Ohio',1),(828,'OK',1101,'',0,'OKLAHOMA','Oklahoma',1),(829,'OR',1101,'',0,'OREGON','Oregon',1),(830,'PA',1101,'',0,'PENNSYLVANIA','Pennsylvania',1),(831,'RI',1101,'',0,'RHODE ISLAND','Rhode Island',1),(832,'SC',1101,'',0,'SOUTH CAROLINA','South Carolina',1),(833,'SD',1101,'',0,'SOUTH DAKOTA','South Dakota',1),(834,'TN',1101,'',0,'TENNESSEE','Tennessee',1),(835,'TX',1101,'',0,'TEXAS','Texas',1),(836,'UT',1101,'',0,'UTAH','Utah',1),(837,'VT',1101,'',0,'VERMONT','Vermont',1),(838,'VA',1101,'',0,'VIRGINIA','Virginia',1),(839,'WA',1101,'',0,'WASHINGTON','Washington',1),(840,'WV',1101,'',0,'WEST VIRGINIA','West Virginia',1),(841,'WI',1101,'',0,'WISCONSIN','Wisconsin',1),(842,'WY',1101,'',0,'WYOMING','Wyoming',1),(843,'GR',1701,NULL,NULL,NULL,'Groningen',1),(844,'FR',1701,NULL,NULL,NULL,'Friesland',1),(845,'DR',1701,NULL,NULL,NULL,'Drenthe',1),(846,'OV',1701,NULL,NULL,NULL,'Overijssel',1),(847,'GD',1701,NULL,NULL,NULL,'Gelderland',1),(848,'FL',1701,NULL,NULL,NULL,'Flevoland',1),(849,'UT',1701,NULL,NULL,NULL,'Utrecht',1),(850,'NH',1701,NULL,NULL,NULL,'Noord-Holland',1),(851,'ZH',1701,NULL,NULL,NULL,'Zuid-Holland',1),(852,'ZL',1701,NULL,NULL,NULL,'Zeeland',1),(853,'NB',1701,NULL,NULL,NULL,'Noord-Brabant',1),(854,'LB',1701,NULL,NULL,NULL,'Limburg',1),(855,'SS',8601,'',0,'','San Salvador',1),(856,'SA',8603,'',0,'','Santa Ana',1),(857,'AH',8603,'',0,'','Ahuachapan',1),(858,'SO',8603,'',0,'','Sonsonate',1),(859,'US',8602,'',0,'','Usulutan',1),(860,'SM',8602,'',0,'','San Miguel',1),(861,'MO',8602,'',0,'','Morazan',1),(862,'LU',8602,'',0,'','La Union',1),(863,'LL',8601,'',0,'','La Libertad',1),(864,'CH',8601,'',0,'','Chalatenango',1),(865,'CA',8601,'',0,'','Cabañas',1),(866,'LP',8601,'',0,'','La Paz',1),(867,'SV',8601,'',0,'','San Vicente',1),(868,'CU',8601,'',0,'','Cuscatlan',1),(869,'2301',2301,'',0,'CATAMARCA','Catamarca',1),(870,'2302',2301,'',0,'JUJUY','Jujuy',1),(871,'2303',2301,'',0,'TUCAMAN','Tucamán',1),(872,'2304',2301,'',0,'SANTIAGO DEL ESTERO','Santiago del Estero',1),(873,'2305',2301,'',0,'SALTA','Salta',1),(874,'2306',2302,'',0,'CHACO','Chaco',1),(875,'2307',2302,'',0,'CORRIENTES','Corrientes',1),(876,'2308',2302,'',0,'ENTRE RIOS','Entre Ríos',1),(877,'2309',2302,'',0,'FORMOSA','Formosa',1),(878,'2310',2302,'',0,'SANTA FE','Santa Fe',1),(879,'2311',2303,'',0,'LA RIOJA','La Rioja',1),(880,'2312',2303,'',0,'MENDOZA','Mendoza',1),(881,'2313',2303,'',0,'SAN JUAN','San Juan',1),(882,'2314',2303,'',0,'SAN LUIS','San Luis',1),(883,'2315',2304,'',0,'CORDOBA','Córdoba',1),(884,'2316',2304,'',0,'BUENOS AIRES','Buenos Aires',1),(885,'2317',2304,'',0,'CABA','Caba',1),(886,'2318',2305,'',0,'LA PAMPA','La Pampa',1),(887,'2319',2305,'',0,'NEUQUEN','Neuquén',1),(888,'2320',2305,'',0,'RIO NEGRO','Río Negro',1),(889,'2321',2305,'',0,'CHUBUT','Chubut',1),(890,'2322',2305,'',0,'SANTA CRUZ','Santa Cruz',1),(891,'2323',2305,'',0,'TIERRA DEL FUEGO','Tierra del Fuego',1),(892,'2324',2305,'',0,'ISLAS MALVINAS','Islas Malvinas',1),(893,'2325',2305,'',0,'ANTARTIDA','Antártida',1),(894,'2326',2305,'',0,'MISIONES','Misiones',1),(895,'CC',4601,'Oistins',0,'CC','Christ Church',1),(896,'SA',4601,'Greenland',0,'SA','Saint Andrew',1),(897,'SG',4601,'Bulkeley',0,'SG','Saint George',1),(898,'JA',4601,'Holetown',0,'JA','Saint James',1),(899,'SJ',4601,'Four Roads',0,'SJ','Saint John',1),(900,'SB',4601,'Bathsheba',0,'SB','Saint Joseph',1),(901,'SL',4601,'Crab Hill',0,'SL','Saint Lucy',1),(902,'SM',4601,'Bridgetown',0,'SM','Saint Michael',1),(903,'SP',4601,'Speightstown',0,'SP','Saint Peter',1),(904,'SC',4601,'Crane',0,'SC','Saint Philip',1),(905,'ST',4601,'Hillaby',0,'ST','Saint Thomas',1),(906,'AC',5601,'ACRE',0,'AC','Acre',1),(907,'AL',5601,'ALAGOAS',0,'AL','Alagoas',1),(908,'AP',5601,'AMAPA',0,'AP','Amapá',1),(909,'AM',5601,'AMAZONAS',0,'AM','Amazonas',1),(910,'BA',5601,'BAHIA',0,'BA','Bahia',1),(911,'CE',5601,'CEARA',0,'CE','Ceará',1),(912,'ES',5601,'ESPIRITO SANTO',0,'ES','Espirito Santo',1),(913,'GO',5601,'GOIAS',0,'GO','Goiás',1),(914,'MA',5601,'MARANHAO',0,'MA','Maranhão',1),(915,'MT',5601,'MATO GROSSO',0,'MT','Mato Grosso',1),(916,'MS',5601,'MATO GROSSO DO SUL',0,'MS','Mato Grosso do Sul',1),(917,'MG',5601,'MINAS GERAIS',0,'MG','Minas Gerais',1),(918,'PA',5601,'PARA',0,'PA','Pará',1),(919,'PB',5601,'PARAIBA',0,'PB','Paraiba',1),(920,'PR',5601,'PARANA',0,'PR','Paraná',1),(921,'PE',5601,'PERNAMBUCO',0,'PE','Pernambuco',1),(922,'PI',5601,'PIAUI',0,'PI','Piauí',1),(923,'RJ',5601,'RIO DE JANEIRO',0,'RJ','Rio de Janeiro',1),(924,'RN',5601,'RIO GRANDE DO NORTE',0,'RN','Rio Grande do Norte',1),(925,'RS',5601,'RIO GRANDE DO SUL',0,'RS','Rio Grande do Sul',1),(926,'RO',5601,'RONDONIA',0,'RO','Rondônia',1),(927,'RR',5601,'RORAIMA',0,'RR','Roraima',1),(928,'SC',5601,'SANTA CATARINA',0,'SC','Santa Catarina',1),(929,'SE',5601,'SERGIPE',0,'SE','Sergipe',1),(930,'SP',5601,'SAO PAULO',0,'SP','Sao Paulo',1),(931,'TO',5601,'TOCANTINS',0,'TO','Tocantins',1),(932,'DF',5601,'DISTRITO FEDERAL',0,'DF','Distrito Federal',1),(933,'151',6715,'',0,'151','Arica',1),(934,'152',6715,'',0,'152','Parinacota',1),(935,'011',6701,'',0,'011','Iquique',1),(936,'014',6701,'',0,'014','Tamarugal',1),(937,'021',6702,'',0,'021','Antofagasa',1),(938,'022',6702,'',0,'022','El Loa',1),(939,'023',6702,'',0,'023','Tocopilla',1),(940,'031',6703,'',0,'031','Copiapó',1),(941,'032',6703,'',0,'032','Chañaral',1),(942,'033',6703,'',0,'033','Huasco',1),(943,'041',6704,'',0,'041','Elqui',1),(944,'042',6704,'',0,'042','Choapa',1),(945,'043',6704,'',0,'043','Limarí',1),(946,'051',6705,'',0,'051','Valparaíso',1),(947,'052',6705,'',0,'052','Isla de Pascua',1),(948,'053',6705,'',0,'053','Los Andes',1),(949,'054',6705,'',0,'054','Petorca',1),(950,'055',6705,'',0,'055','Quillota',1),(951,'056',6705,'',0,'056','San Antonio',1),(952,'057',6705,'',0,'057','San Felipe de Aconcagua',1),(953,'058',6705,'',0,'058','Marga Marga',1),(954,'061',6706,'',0,'061','Cachapoal',1),(955,'062',6706,'',0,'062','Cardenal Caro',1),(956,'063',6706,'',0,'063','Colchagua',1),(957,'071',6707,'',0,'071','Talca',1),(958,'072',6707,'',0,'072','Cauquenes',1),(959,'073',6707,'',0,'073','Curicó',1),(960,'074',6707,'',0,'074','Linares',1),(961,'081',6708,'',0,'081','Concepción',1),(962,'082',6708,'',0,'082','Arauco',1),(963,'083',6708,'',0,'083','Biobío',1),(964,'084',6708,'',0,'084','Ñuble',1),(965,'091',6709,'',0,'091','Cautín',1),(966,'092',6709,'',0,'092','Malleco',1),(967,'141',6714,'',0,'141','Valdivia',1),(968,'142',6714,'',0,'142','Ranco',1),(969,'101',6710,'',0,'101','Llanquihue',1),(970,'102',6710,'',0,'102','Chiloé',1),(971,'103',6710,'',0,'103','Osorno',1),(972,'104',6710,'',0,'104','Palena',1),(973,'111',6711,'',0,'111','Coihaique',1),(974,'112',6711,'',0,'112','Aisén',1),(975,'113',6711,'',0,'113','Capitán Prat',1),(976,'114',6711,'',0,'114','General Carrera',1),(977,'121',6712,'',0,'121','Magallanes',1),(978,'122',6712,'',0,'122','Antártica Chilena',1),(979,'123',6712,'',0,'123','Tierra del Fuego',1),(980,'124',6712,'',0,'124','Última Esperanza',1),(981,'131',6713,'',0,'131','Santiago',1),(982,'132',6713,'',0,'132','Cordillera',1),(983,'133',6713,'',0,'133','Chacabuco',1),(984,'134',6713,'',0,'134','Maipo',1),(985,'135',6713,'',0,'135','Melipilla',1),(986,'136',6713,'',0,'136','Talagante',1),(987,'AN',11701,NULL,0,'AN','Andaman & Nicobar',1),(988,'AP',11701,NULL,0,'AP','Andhra Pradesh',1),(989,'AR',11701,NULL,0,'AR','Arunachal Pradesh',1),(990,'AS',11701,NULL,0,'AS','Assam',1),(991,'BR',11701,NULL,0,'BR','Bihar',1),(992,'CG',11701,NULL,0,'CG','Chattisgarh',1),(993,'CH',11701,NULL,0,'CH','Chandigarh',1),(994,'DD',11701,NULL,0,'DD','Daman & Diu',1),(995,'DL',11701,NULL,0,'DL','Delhi',1),(996,'DN',11701,NULL,0,'DN','Dadra and Nagar Haveli',1),(997,'GA',11701,NULL,0,'GA','Goa',1),(998,'GJ',11701,NULL,0,'GJ','Gujarat',1),(999,'HP',11701,NULL,0,'HP','Himachal Pradesh',1),(1000,'HR',11701,NULL,0,'HR','Haryana',1),(1001,'JH',11701,NULL,0,'JH','Jharkhand',1),(1002,'JK',11701,NULL,0,'JK','Jammu & Kashmir',1),(1003,'KA',11701,NULL,0,'KA','Karnataka',1),(1004,'KL',11701,NULL,0,'KL','Kerala',1),(1005,'LD',11701,NULL,0,'LD','Lakshadweep',1),(1006,'MH',11701,NULL,0,'MH','Maharashtra',1),(1007,'ML',11701,NULL,0,'ML','Meghalaya',1),(1008,'MN',11701,NULL,0,'MN','Manipur',1),(1009,'MP',11701,NULL,0,'MP','Madhya Pradesh',1),(1010,'MZ',11701,NULL,0,'MZ','Mizoram',1),(1011,'NL',11701,NULL,0,'NL','Nagaland',1),(1012,'OR',11701,NULL,0,'OR','Orissa',1),(1013,'PB',11701,NULL,0,'PB','Punjab',1),(1014,'PY',11701,NULL,0,'PY','Puducherry',1),(1015,'RJ',11701,NULL,0,'RJ','Rajasthan',1),(1016,'SK',11701,NULL,0,'SK','Sikkim',1),(1017,'TE',11701,NULL,0,'TE','Telangana',1),(1018,'TN',11701,NULL,0,'TN','Tamil Nadu',1),(1019,'TR',11701,NULL,0,'TR','Tripura',1),(1020,'UL',11701,NULL,0,'UL','Uttarakhand',1),(1021,'UP',11701,NULL,0,'UP','Uttar Pradesh',1),(1022,'WB',11701,NULL,0,'WB','West Bengal',1),(1023,'BA',11801,NULL,0,'BA','Bali',1),(1024,'BB',11801,NULL,0,'BB','Bangka Belitung',1),(1025,'BT',11801,NULL,0,'BT','Banten',1),(1026,'BE',11801,NULL,0,'BA','Bengkulu',1),(1027,'YO',11801,NULL,0,'YO','DI Yogyakarta',1),(1028,'JK',11801,NULL,0,'JK','DKI Jakarta',1),(1029,'GO',11801,NULL,0,'GO','Gorontalo',1),(1030,'JA',11801,NULL,0,'JA','Jambi',1),(1031,'JB',11801,NULL,0,'JB','Jawa Barat',1),(1032,'JT',11801,NULL,0,'JT','Jawa Tengah',1),(1033,'JI',11801,NULL,0,'JI','Jawa Timur',1),(1034,'KB',11801,NULL,0,'KB','Kalimantan Barat',1),(1035,'KS',11801,NULL,0,'KS','Kalimantan Selatan',1),(1036,'KT',11801,NULL,0,'KT','Kalimantan Tengah',1),(1037,'KI',11801,NULL,0,'KI','Kalimantan Timur',1),(1038,'KU',11801,NULL,0,'KU','Kalimantan Utara',1),(1039,'KR',11801,NULL,0,'KR','Kepulauan Riau',1),(1040,'LA',11801,NULL,0,'LA','Lampung',1),(1041,'MA',11801,NULL,0,'MA','Maluku',1),(1042,'MU',11801,NULL,0,'MU','Maluku Utara',1),(1043,'AC',11801,NULL,0,'AC','Nanggroe Aceh Darussalam',1),(1044,'NB',11801,NULL,0,'NB','Nusa Tenggara Barat',1),(1045,'NT',11801,NULL,0,'NT','Nusa Tenggara Timur',1),(1046,'PA',11801,NULL,0,'PA','Papua',1),(1047,'PB',11801,NULL,0,'PB','Papua Barat',1),(1048,'RI',11801,NULL,0,'RI','Riau',1),(1049,'SR',11801,NULL,0,'SR','Sulawesi Barat',1),(1050,'SN',11801,NULL,0,'SN','Sulawesi Selatan',1),(1051,'ST',11801,NULL,0,'ST','Sulawesi Tengah',1),(1052,'SG',11801,NULL,0,'SG','Sulawesi Tenggara',1),(1053,'SA',11801,NULL,0,'SA','Sulawesi Utara',1),(1054,'SB',11801,NULL,0,'SB','Sumatera Barat',1),(1055,'SS',11801,NULL,0,'SS','Sumatera Selatan',1),(1056,'SU',11801,NULL,0,'SU','Sumatera Utara	',1),(1057,'CMX',15401,'',0,'CMX','Ciudad de México',1),(1058,'AGS',15401,'',0,'AGS','Aguascalientes',1),(1059,'BCN',15401,'',0,'BCN','Baja California Norte',1),(1060,'BCS',15401,'',0,'BCS','Baja California Sur',1),(1061,'CAM',15401,'',0,'CAM','Campeche',1),(1062,'CHP',15401,'',0,'CHP','Chiapas',1),(1063,'CHI',15401,'',0,'CHI','Chihuahua',1),(1064,'COA',15401,'',0,'COA','Coahuila',1),(1065,'COL',15401,'',0,'COL','Colima',1),(1066,'DUR',15401,'',0,'DUR','Durango',1),(1067,'GTO',15401,'',0,'GTO','Guanajuato',1),(1068,'GRO',15401,'',0,'GRO','Guerrero',1),(1069,'HGO',15401,'',0,'HGO','Hidalgo',1),(1070,'JAL',15401,'',0,'JAL','Jalisco',1),(1071,'MEX',15401,'',0,'MEX','México',1),(1072,'MIC',15401,'',0,'MIC','Michoacán de Ocampo',1),(1073,'MOR',15401,'',0,'MOR','Morelos',1),(1074,'NAY',15401,'',0,'NAY','Nayarit',1),(1075,'NLE',15401,'',0,'NLE','Nuevo León',1),(1076,'OAX',15401,'',0,'OAX','Oaxaca',1),(1077,'PUE',15401,'',0,'PUE','Puebla',1),(1078,'QRO',15401,'',0,'QRO','Querétaro',1),(1079,'ROO',15401,'',0,'ROO','Quintana Roo',1),(1080,'SLP',15401,'',0,'SLP','San Luis Potosí',1),(1081,'SIN',15401,'',0,'SIN','Sinaloa',1),(1082,'SON',15401,'',0,'SON','Sonora',1),(1083,'TAB',15401,'',0,'TAB','Tabasco',1),(1084,'TAM',15401,'',0,'TAM','Tamaulipas',1),(1085,'TLX',15401,'',0,'TLX','Tlaxcala',1),(1086,'VER',15401,'',0,'VER','Veracruz',1),(1087,'YUC',15401,'',0,'YUC','Yucatán',1),(1088,'ZAC',15401,'',0,'ZAC','Zacatecas',1),(1089,'ANT',7001,'',0,'ANT','Antioquia',1),(1090,'BOL',7001,'',0,'BOL','Bolívar',1),(1091,'BOY',7001,'',0,'BOY','Boyacá',1),(1092,'CAL',7001,'',0,'CAL','Caldas',1),(1093,'CAU',7001,'',0,'CAU','Cauca',1),(1094,'CUN',7001,'',0,'CUN','Cundinamarca',1),(1095,'HUI',7001,'',0,'HUI','Huila',1),(1096,'LAG',7001,'',0,'LAG','La Guajira',1),(1097,'MET',7001,'',0,'MET','Meta',1),(1098,'NAR',7001,'',0,'NAR','Nariño',1),(1099,'NDS',7001,'',0,'NDS','Norte de Santander',1),(1100,'SAN',7001,'',0,'SAN','Santander',1),(1101,'SUC',7001,'',0,'SUC','Sucre',1),(1102,'TOL',7001,'',0,'TOL','Tolima',1),(1103,'VAC',7001,'',0,'VAC','Valle del Cauca',1),(1104,'RIS',7001,'',0,'RIS','Risalda',1),(1105,'ATL',7001,'',0,'ATL','Atlántico',1),(1106,'COR',7001,'',0,'COR','Córdoba',1),(1107,'SAP',7001,'',0,'SAP','San Andrés, Providencia y Santa Catalina',1),(1108,'ARA',7001,'',0,'ARA','Arauca',1),(1109,'CAS',7001,'',0,'CAS','Casanare',1),(1110,'AMA',7001,'',0,'AMA','Amazonas',1),(1111,'CAQ',7001,'',0,'CAQ','Caquetá',1),(1112,'CHO',7001,'',0,'CHO','Chocó',1),(1113,'GUA',7001,'',0,'GUA','Guainía',1),(1114,'GUV',7001,'',0,'GUV','Guaviare',1),(1115,'PUT',7001,'',0,'PUT','Putumayo',1),(1116,'QUI',7001,'',0,'QUI','Quindío',1),(1117,'VAU',7001,'',0,'VAU','Vaupés',1),(1118,'BOG',7001,'',0,'BOG','Bogotá',1),(1119,'VID',7001,'',0,'VID','Vichada',1),(1120,'CES',7001,'',0,'CES','Cesar',1),(1121,'MAG',7001,'',0,'MAG','Magdalena',1),(1122,'AT',11401,'',0,'AT','Atlántida',1),(1123,'CH',11401,'',0,'CH','Choluteca',1),(1124,'CL',11401,'',0,'CL','Colón',1),(1125,'CM',11401,'',0,'CM','Comayagua',1),(1126,'CO',11401,'',0,'CO','Copán',1),(1127,'CR',11401,'',0,'CR','Cortés',1),(1128,'EP',11401,'',0,'EP','El Paraíso',1),(1129,'FM',11401,'',0,'FM','Francisco Morazán',1),(1130,'GD',11401,'',0,'GD','Gracias a Dios',1),(1131,'IN',11401,'',0,'IN','Intibucá',1),(1132,'IB',11401,'',0,'IB','Islas de la Bahía',1),(1133,'LP',11401,'',0,'LP','La Paz',1),(1134,'LM',11401,'',0,'LM','Lempira',1),(1135,'OC',11401,'',0,'OC','Ocotepeque',1),(1136,'OL',11401,'',0,'OL','Olancho',1),(1137,'SB',11401,'',0,'SB','Santa Bárbara',1),(1138,'VL',11401,'',0,'VL','Valle',1),(1139,'YO',11401,'',0,'YO','Yoro',1),(1140,'DC',11401,'',0,'DC','Distrito Central',1),(1141,'AB',18801,'',0,'','Alba',1),(1142,'AR',18801,'',0,'','Arad',1),(1143,'AG',18801,'',0,'','Argeș',1),(1144,'BC',18801,'',0,'','Bacău',1),(1145,'BH',18801,'',0,'','Bihor',1),(1146,'BN',18801,'',0,'','Bistrița-Năsăud',1),(1147,'BT',18801,'',0,'','Botoșani',1),(1148,'BV',18801,'',0,'','Brașov',1),(1149,'BR',18801,'',0,'','Brăila',1),(1150,'BZ',18801,'',0,'','Buzău',1),(1151,'CL',18801,'',0,'','Călărași',1),(1152,'CS',18801,'',0,'','Caraș-Severin',1),(1153,'CJ',18801,'',0,'','Cluj',1),(1154,'CT',18801,'',0,'','Constanța',1),(1155,'CV',18801,'',0,'','Covasna',1),(1156,'DB',18801,'',0,'','Dâmbovița',1),(1157,'DJ',18801,'',0,'','Dolj',1),(1158,'GL',18801,'',0,'','Galați',1),(1159,'GR',18801,'',0,'','Giurgiu',1),(1160,'GJ',18801,'',0,'','Gorj',1),(1161,'HR',18801,'',0,'','Harghita',1),(1162,'HD',18801,'',0,'','Hunedoara',1),(1163,'IL',18801,'',0,'','Ialomița',1),(1164,'IS',18801,'',0,'','Iași',1),(1165,'IF',18801,'',0,'','Ilfov',1),(1166,'MM',18801,'',0,'','Maramureș',1),(1167,'MH',18801,'',0,'','Mehedinți',1),(1168,'MS',18801,'',0,'','Mureș',1),(1169,'NT',18801,'',0,'','Neamț',1),(1170,'OT',18801,'',0,'','Olt',1),(1171,'PH',18801,'',0,'','Prahova',1),(1172,'SM',18801,'',0,'','Satu Mare',1),(1173,'SJ',18801,'',0,'','Sălaj',1),(1174,'SB',18801,'',0,'','Sibiu',1),(1175,'SV',18801,'',0,'','Suceava',1),(1176,'TR',18801,'',0,'','Teleorman',1),(1177,'TM',18801,'',0,'','Timiș',1),(1178,'TL',18801,'',0,'','Tulcea',1),(1179,'VS',18801,'',0,'','Vaslui',1),(1180,'VL',18801,'',0,'','Vâlcea',1),(1181,'VN',18801,'',0,'','Vrancea',1),(1182,'BU',18801,'',0,'','Bucuresti',1),(1183,'VE-L',23201,'',0,'VE-L','Mérida',1),(1184,'VE-T',23201,'',0,'VE-T','Trujillo',1),(1185,'VE-E',23201,'',0,'VE-E','Barinas',1),(1186,'VE-M',23202,'',0,'VE-M','Miranda',1),(1187,'VE-W',23202,'',0,'VE-W','Vargas',1),(1188,'VE-A',23202,'',0,'VE-A','Distrito Capital',1),(1189,'VE-D',23203,'',0,'VE-D','Aragua',1),(1190,'VE-G',23203,'',0,'VE-G','Carabobo',1),(1191,'VE-I',23204,'',0,'VE-I','Falcón',1),(1192,'VE-K',23204,'',0,'VE-K','Lara',1),(1193,'VE-U',23204,'',0,'VE-U','Yaracuy',1),(1194,'VE-F',23205,'',0,'VE-F','Bolívar',1),(1195,'VE-X',23205,'',0,'VE-X','Amazonas',1),(1196,'VE-Y',23205,'',0,'VE-Y','Delta Amacuro',1),(1197,'VE-O',23206,'',0,'VE-O','Nueva Esparta',1),(1198,'VE-Z',23206,'',0,'VE-Z','Dependencias Federales',1),(1199,'VE-C',23207,'',0,'VE-C','Apure',1),(1200,'VE-J',23207,'',0,'VE-J','Guárico',1),(1201,'VE-H',23207,'',0,'VE-H','Cojedes',1),(1202,'VE-P',23207,'',0,'VE-P','Portuguesa',1),(1203,'VE-B',23208,'',0,'VE-B','Anzoátegui',1),(1204,'VE-N',23208,'',0,'VE-N','Monagas',1),(1205,'VE-R',23208,'',0,'VE-R','Sucre',1),(1206,'VE-V',23209,'',0,'VE-V','Zulia',1),(1207,'VE-S',23209,'',0,'VE-S','Táchira',1),(1208,'LU0001',14001,'',0,'','Clervaux',1),(1209,'LU0002',14001,'',0,'','Diekirch',1),(1210,'LU0003',14001,'',0,'','Redange',1),(1211,'LU0004',14001,'',0,'','Vianden',1),(1212,'LU0005',14001,'',0,'','Wiltz',1),(1213,'LU0006',14002,'',0,'','Echternach',1),(1214,'LU0007',14002,'',0,'','Grevenmacher',1),(1215,'LU0008',14002,'',0,'','Remich',1),(1216,'LU0009',14003,'',0,'','Capellen',1),(1217,'LU0010',14003,'',0,'','Esch-sur-Alzette',1),(1218,'LU0011',14003,'',0,'','Luxembourg',1),(1219,'LU0012',14003,'',0,'','Mersch',1),(1220,'0101',18101,'',0,'','Chachapoyas',1),(1221,'0102',18101,'',0,'','Bagua',1),(1222,'0103',18101,'',0,'','Bongará',1),(1223,'0104',18101,'',0,'','Condorcanqui',1),(1224,'0105',18101,'',0,'','Luya',1),(1225,'0106',18101,'',0,'','Rodríguez de Mendoza',1),(1226,'0107',18101,'',0,'','Utcubamba',1),(1227,'0201',18102,'',0,'','Huaraz',1),(1228,'0202',18102,'',0,'','Aija',1),(1229,'0203',18102,'',0,'','Antonio Raymondi',1),(1230,'0204',18102,'',0,'','Asunción',1),(1231,'0205',18102,'',0,'','Bolognesi',1),(1232,'0206',18102,'',0,'','Carhuaz',1),(1233,'0207',18102,'',0,'','Carlos Fermín Fitzcarrald',1),(1234,'0208',18102,'',0,'','Casma',1),(1235,'0209',18102,'',0,'','Corongo',1),(1236,'0210',18102,'',0,'','Huari',1),(1237,'0211',18102,'',0,'','Huarmey',1),(1238,'0212',18102,'',0,'','Huaylas',1),(1239,'0213',18102,'',0,'','Mariscal Luzuriaga',1),(1240,'0214',18102,'',0,'','Ocros',1),(1241,'0215',18102,'',0,'','Pallasca',1),(1242,'0216',18102,'',0,'','Pomabamba',1),(1243,'0217',18102,'',0,'','Recuay',1),(1244,'0218',18102,'',0,'','Papá',1),(1245,'0219',18102,'',0,'','Sihuas',1),(1246,'0220',18102,'',0,'','Yungay',1),(1247,'0301',18103,'',0,'','Abancay',1),(1248,'0302',18103,'',0,'','Andahuaylas',1),(1249,'0303',18103,'',0,'','Antabamba',1),(1250,'0304',18103,'',0,'','Aymaraes',1),(1251,'0305',18103,'',0,'','Cotabambas',1),(1252,'0306',18103,'',0,'','Chincheros',1),(1253,'0307',18103,'',0,'','Grau',1),(1254,'0401',18104,'',0,'','Arequipa',1),(1255,'0402',18104,'',0,'','Camaná',1),(1256,'0403',18104,'',0,'','Caravelí',1),(1257,'0404',18104,'',0,'','Castilla',1),(1258,'0405',18104,'',0,'','Caylloma',1),(1259,'0406',18104,'',0,'','Condesuyos',1),(1260,'0407',18104,'',0,'','Islay',1),(1261,'0408',18104,'',0,'','La Unión',1),(1262,'0501',18105,'',0,'','Huamanga',1),(1263,'0502',18105,'',0,'','Cangallo',1),(1264,'0503',18105,'',0,'','Huanca Sancos',1),(1265,'0504',18105,'',0,'','Huanta',1),(1266,'0505',18105,'',0,'','La Mar',1),(1267,'0506',18105,'',0,'','Lucanas',1),(1268,'0507',18105,'',0,'','Parinacochas',1),(1269,'0508',18105,'',0,'','Páucar del Sara Sara',1),(1270,'0509',18105,'',0,'','Sucre',1),(1271,'0510',18105,'',0,'','Víctor Fajardo',1),(1272,'0511',18105,'',0,'','Vilcas Huamán',1),(1273,'0601',18106,'',0,'','Cajamarca',1),(1274,'0602',18106,'',0,'','Cajabamba',1),(1275,'0603',18106,'',0,'','Celendín',1),(1276,'0604',18106,'',0,'','Chota',1),(1277,'0605',18106,'',0,'','Contumazá',1),(1278,'0606',18106,'',0,'','Cutervo',1),(1279,'0607',18106,'',0,'','Hualgayoc',1),(1280,'0608',18106,'',0,'','Jaén',1),(1281,'0609',18106,'',0,'','San Ignacio',1),(1282,'0610',18106,'',0,'','San Marcos',1),(1283,'0611',18106,'',0,'','San Miguel',1),(1284,'0612',18106,'',0,'','San Pablo',1),(1285,'0613',18106,'',0,'','Santa Cruz',1),(1286,'0701',18107,'',0,'','Callao',1),(1287,'0801',18108,'',0,'','Cusco',1),(1288,'0802',18108,'',0,'','Acomayo',1),(1289,'0803',18108,'',0,'','Anta',1),(1290,'0804',18108,'',0,'','Calca',1),(1291,'0805',18108,'',0,'','Canas',1),(1292,'0806',18108,'',0,'','Canchis',1),(1293,'0807',18108,'',0,'','Chumbivilcas',1),(1294,'0808',18108,'',0,'','Espinar',1),(1295,'0809',18108,'',0,'','La Convención',1),(1296,'0810',18108,'',0,'','Paruro',1),(1297,'0811',18108,'',0,'','Paucartambo',1),(1298,'0812',18108,'',0,'','Quispicanchi',1),(1299,'0813',18108,'',0,'','Urubamba',1),(1300,'0901',18109,'',0,'','Huancavelica',1),(1301,'0902',18109,'',0,'','Acobamba',1),(1302,'0903',18109,'',0,'','Angaraes',1),(1303,'0904',18109,'',0,'','Castrovirreyna',1),(1304,'0905',18109,'',0,'','Churcampa',1),(1305,'0906',18109,'',0,'','Huaytará',1),(1306,'0907',18109,'',0,'','Tayacaja',1),(1307,'1001',18110,'',0,'','Huánuco',1),(1308,'1002',18110,'',0,'','Ambón',1),(1309,'1003',18110,'',0,'','Dos de Mayo',1),(1310,'1004',18110,'',0,'','Huacaybamba',1),(1311,'1005',18110,'',0,'','Huamalíes',1),(1312,'1006',18110,'',0,'','Leoncio Prado',1),(1313,'1007',18110,'',0,'','Marañón',1),(1314,'1008',18110,'',0,'','Pachitea',1),(1315,'1009',18110,'',0,'','Puerto Inca',1),(1316,'1010',18110,'',0,'','Lauricocha',1),(1317,'1011',18110,'',0,'','Yarowilca',1),(1318,'1101',18111,'',0,'','Ica',1),(1319,'1102',18111,'',0,'','Chincha',1),(1320,'1103',18111,'',0,'','Nazca',1),(1321,'1104',18111,'',0,'','Palpa',1),(1322,'1105',18111,'',0,'','Pisco',1),(1323,'1201',18112,'',0,'','Huancayo',1),(1324,'1202',18112,'',0,'','Concepción',1),(1325,'1203',18112,'',0,'','Chanchamayo',1),(1326,'1204',18112,'',0,'','Jauja',1),(1327,'1205',18112,'',0,'','Junín',1),(1328,'1206',18112,'',0,'','Satipo',1),(1329,'1207',18112,'',0,'','Tarma',1),(1330,'1208',18112,'',0,'','Yauli',1),(1331,'1209',18112,'',0,'','Chupaca',1),(1332,'1301',18113,'',0,'','Trujillo',1),(1333,'1302',18113,'',0,'','Ascope',1),(1334,'1303',18113,'',0,'','Bolívar',1),(1335,'1304',18113,'',0,'','Chepén',1),(1336,'1305',18113,'',0,'','Julcán',1),(1337,'1306',18113,'',0,'','Otuzco',1),(1338,'1307',18113,'',0,'','Pacasmayo',1),(1339,'1308',18113,'',0,'','Pataz',1),(1340,'1309',18113,'',0,'','Sánchez Carrión',1),(1341,'1310',18113,'',0,'','Santiago de Chuco',1),(1342,'1311',18113,'',0,'','Gran Chimú',1),(1343,'1312',18113,'',0,'','Virú',1),(1344,'1401',18114,'',0,'','Chiclayo',1),(1345,'1402',18114,'',0,'','Ferreñafe',1),(1346,'1403',18114,'',0,'','Lambayeque',1),(1347,'1501',18115,'',0,'','Lima',1),(1348,'1502',18116,'',0,'','Huaura',1),(1349,'1503',18116,'',0,'','Barranca',1),(1350,'1504',18116,'',0,'','Cajatambo',1),(1351,'1505',18116,'',0,'','Canta',1),(1352,'1506',18116,'',0,'','Cañete',1),(1353,'1507',18116,'',0,'','Huaral',1),(1354,'1508',18116,'',0,'','Huarochirí',1),(1355,'1509',18116,'',0,'','Oyón',1),(1356,'1510',18116,'',0,'','Yauyos',1),(1357,'1601',18117,'',0,'','Maynas',1),(1358,'1602',18117,'',0,'','Alto Amazonas',1),(1359,'1603',18117,'',0,'','Loreto',1),(1360,'1604',18117,'',0,'','Mariscal Ramón Castilla',1),(1361,'1605',18117,'',0,'','Requena',1),(1362,'1606',18117,'',0,'','Ucayali',1),(1363,'1607',18117,'',0,'','Datem del Marañón',1),(1364,'1701',18118,'',0,'','Tambopata',1),(1365,'1702',18118,'',0,'','Manú',1),(1366,'1703',18118,'',0,'','Tahuamanu',1),(1367,'1801',18119,'',0,'','Mariscal Nieto',1),(1368,'1802',18119,'',0,'','General Sánchez Cerro',1),(1369,'1803',18119,'',0,'','Ilo',1),(1370,'1901',18120,'',0,'','Pasco',1),(1371,'1902',18120,'',0,'','Daniel Alcides Carrión',1),(1372,'1903',18120,'',0,'','Oxapampa',1),(1373,'2001',18121,'',0,'','Piura',1),(1374,'2002',18121,'',0,'','Ayabaca',1),(1375,'2003',18121,'',0,'','Huancabamba',1),(1376,'2004',18121,'',0,'','Morropón',1),(1377,'2005',18121,'',0,'','Paita',1),(1378,'2006',18121,'',0,'','Sullana',1),(1379,'2007',18121,'',0,'','Talara',1),(1380,'2008',18121,'',0,'','Sechura',1),(1381,'2101',18122,'',0,'','Puno',1),(1382,'2102',18122,'',0,'','Azángaro',1),(1383,'2103',18122,'',0,'','Carabaya',1),(1384,'2104',18122,'',0,'','Chucuito',1),(1385,'2105',18122,'',0,'','El Collao',1),(1386,'2106',18122,'',0,'','Huancané',1),(1387,'2107',18122,'',0,'','Lampa',1),(1388,'2108',18122,'',0,'','Melgar',1),(1389,'2109',18122,'',0,'','Moho',1),(1390,'2110',18122,'',0,'','San Antonio de Putina',1),(1391,'2111',18122,'',0,'','San Román',1),(1392,'2112',18122,'',0,'','Sandia',1),(1393,'2113',18122,'',0,'','Yunguyo',1),(1394,'2201',18123,'',0,'','Moyobamba',1),(1395,'2202',18123,'',0,'','Bellavista',1),(1396,'2203',18123,'',0,'','El Dorado',1),(1397,'2204',18123,'',0,'','Huallaga',1),(1398,'2205',18123,'',0,'','Lamas',1),(1399,'2206',18123,'',0,'','Mariscal Cáceres',1),(1400,'2207',18123,'',0,'','Picota',1),(1401,'2208',18123,'',0,'','La Rioja',1),(1402,'2209',18123,'',0,'','San Martín',1),(1403,'2210',18123,'',0,'','Tocache',1),(1404,'2301',18124,'',0,'','Tacna',1),(1405,'2302',18124,'',0,'','Candarave',1),(1406,'2303',18124,'',0,'','Jorge Basadre',1),(1407,'2304',18124,'',0,'','Tarata',1),(1408,'2401',18125,'',0,'','Tumbes',1),(1409,'2402',18125,'',0,'','Contralmirante Villar',1),(1410,'2403',18125,'',0,'','Zarumilla',1),(1411,'2501',18126,'',0,'','Coronel Portillo',1),(1412,'2502',18126,'',0,'','Atalaya',1),(1413,'2503',18126,'',0,'','Padre Abad',1),(1414,'2504',18126,'',0,'','Purús',1),(1415,'PA-1',17801,'',0,'','Bocas del Toro',1),(1416,'PA-2',17801,'',0,'','Coclé',1),(1417,'PA-3',17801,'',0,'','Colón',1),(1418,'PA-4',17801,'',0,'','Chiriquí',1),(1419,'PA-5',17801,'',0,'','Darién',1),(1420,'PA-6',17801,'',0,'','Herrera',1),(1421,'PA-7',17801,'',0,'','Los Santos',1),(1422,'PA-8',17801,'',0,'','Panamá',1),(1423,'PA-9',17801,'',0,'','Veraguas',1),(1424,'PA-13',17801,'',0,'','Panamá Oeste',1),(1425,'AE-1',22701,'',0,'','Abu Dhabi',1),(1426,'AE-2',22701,'',0,'','Dubai',1),(1427,'AE-3',22701,'',0,'','Ajman',1),(1428,'AE-4',22701,'',0,'','Fujairah',1),(1429,'AE-5',22701,'',0,'','Ras al-Khaimah',1),(1430,'AE-6',22701,'',0,'','Sharjah',1),(1431,'AE-7',22701,'',0,'','Umm al-Quwain',1),(1432,'AD-002',34000,'AD100',NULL,NULL,'Canillo',1),(1433,'AD-003',34000,'AD200',NULL,NULL,'Encamp',1),(1434,'AD-004',34000,'AD400',NULL,NULL,'La Massana',1),(1435,'AD-005',34000,'AD300',NULL,NULL,'Ordino',1),(1436,'AD-006',34000,'AD600',NULL,NULL,'Sant Julià de Lòria',1),(1437,'AD-007',34000,'AD500',NULL,NULL,'Andorra la Vella',1),(1438,'AD-008',34000,'AD700',NULL,NULL,'Escaldes-Engordany',1),(1439,'HU-BK',183300,'HU331',NULL,NULL,'Bács-Kiskun',1),(1440,'HU-BA',182300,'HU231',NULL,NULL,'Baranya',1),(1441,'HU-BE',183300,'HU332',NULL,NULL,'Békés',1),(1442,'HU-BZ',183100,'HU311',NULL,NULL,'Borsod-Abaúj-Zemplén',1),(1443,'HU-BU',180100,'HU101',NULL,NULL,'Budapest',1),(1444,'HU-CS',183300,'HU333',NULL,NULL,'Csongrád',1),(1445,'HU-FE',182100,'HU211',NULL,NULL,'Fejér',1),(1446,'HU-GS',182200,'HU221',NULL,NULL,'Győr-Moson-Sopron',1),(1447,'HU-HB',183200,'HU321',NULL,NULL,'Hajdú-Bihar',1),(1448,'HU-HE',183100,'HU312',NULL,NULL,'Heves',1),(1449,'HU-JN',183200,'HU322',NULL,NULL,'Jász-Nagykun-Szolnok',1),(1450,'HU-KE',182100,'HU212',NULL,NULL,'Komárom-Esztergom',1),(1451,'HU-NO',183100,'HU313',NULL,NULL,'Nógrád',1),(1452,'HU-PE',180100,'HU102',NULL,NULL,'Pest',1),(1453,'HU-SO',182300,'HU232',NULL,NULL,'Somogy',1),(1454,'HU-SZ',183200,'HU323',NULL,NULL,'Szabolcs-Szatmár-Bereg',1),(1455,'HU-TO',182300,'HU233',NULL,NULL,'Tolna',1),(1456,'HU-VA',182200,'HU222',NULL,NULL,'Vas',1),(1457,'HU-VE',182100,'HU213',NULL,NULL,'Veszprém',1),(1458,'HU-ZA',182200,'HU223',NULL,NULL,'Zala',1),(1459,'PT-AV',15001,NULL,NULL,'AVEIRO','Aveiro',1),(1460,'PT-AC',15002,NULL,NULL,'AZORES','Azores',1),(1461,'PT-BE',15001,NULL,NULL,'BEJA','Beja',1),(1462,'PT-BR',15001,NULL,NULL,'BRAGA','Braga',1),(1463,'PT-BA',15001,NULL,NULL,'BRAGANCA','Bragança',1),(1464,'PT-CB',15001,NULL,NULL,'CASTELO BRANCO','Castelo Branco',1),(1465,'PT-CO',15001,NULL,NULL,'COIMBRA','Coimbra',1),(1466,'PT-EV',15001,NULL,NULL,'EVORA','Évora',1),(1467,'PT-FA',15001,NULL,NULL,'FARO','Faro',1),(1468,'PT-GU',15001,NULL,NULL,'GUARDA','Guarda',1),(1469,'PT-LE',15001,NULL,NULL,'LEIRIA','Leiria',1),(1470,'PT-LI',15001,NULL,NULL,'LISBON','Lisboa',1),(1471,'PT-AML',15001,NULL,NULL,'AREA METROPOLITANA LISBOA','Área Metropolitana de Lisboa',1),(1472,'PT-MA',15002,NULL,NULL,'MADEIRA','Madeira',1),(1473,'PT-PA',15001,NULL,NULL,'PORTALEGRE','Portalegre',1),(1474,'PT-PO',15001,NULL,NULL,'PORTO','Porto',1),(1475,'PT-SA',15001,NULL,NULL,'SANTAREM','Santarém',1),(1476,'PT-SE',15001,NULL,NULL,'SETUBAL','Setúbal',1),(1477,'PT-VC',15001,NULL,NULL,'VIANA DO CASTELO','Viana Do Castelo',1),(1478,'PT-VR',15001,NULL,NULL,'VILA REAL','Vila Real',1),(1479,'PT-VI',15001,NULL,NULL,'VISEU','Viseu',1),(1480,'SI031',20203,NULL,NULL,'MURA','Mura',1),(1481,'SI032',20203,NULL,NULL,'DRAVA','Drava',1),(1482,'SI033',20203,NULL,NULL,'CARINTHIA','Carinthia',1),(1483,'SI034',20203,NULL,NULL,'SAVINJA','Savinja',1),(1484,'SI035',20203,NULL,NULL,'CENTRAL SAVA','Central Sava',1),(1485,'SI036',20203,NULL,NULL,'LOWER SAVA','Lower Sava',1),(1486,'SI037',20203,NULL,NULL,'SOUTHEAST SLOVENIA','Southeast Slovenia',1),(1487,'SI038',20203,NULL,NULL,'LITTORAL–INNER CARNIOLA','Littoral–Inner Carniola',1),(1488,'SI041',20204,NULL,NULL,'CENTRAL SLOVENIA','Central Slovenia',1),(1489,'SI038',20204,NULL,NULL,'UPPER CARNIOLA','Upper Carniola',1),(1490,'SI043',20204,NULL,NULL,'GORIZIA','Gorizia',1),(1491,'SI044',20204,NULL,NULL,'COASTAL–KARST','Coastal–Karst',1),(1492,'AO-ABO',35001,NULL,NULL,'BENGO','Bengo',1),(1493,'AO-BGU',35001,NULL,NULL,'BENGUELA','Benguela',1),(1494,'AO-BIE',35001,NULL,NULL,'BIÉ','Bié',1),(1495,'AO-CAB',35001,NULL,NULL,'CABINDA','Cabinda',1),(1496,'AO-CCU',35001,NULL,NULL,'KUANDO KUBANGO','Kuando Kubango',1),(1497,'AO-CNO',35001,NULL,NULL,'KWANZA NORTE','Kwanza Norte',1),(1498,'AO-CUS',35001,NULL,NULL,'KWANZA SUL','Kwanza Sul',1),(1499,'AO-CNN',35001,NULL,NULL,'CUNENE','Cunene',1),(1500,'AO-HUA',35001,NULL,NULL,'HUAMBO','Huambo',1),(1501,'AO-HUI',35001,NULL,NULL,'HUÍLA','Huila',1),(1502,'AO-LUA',35001,NULL,NULL,'LUANDA','Luanda',1),(1503,'AO-LNO',35001,NULL,NULL,'LUNDA-NORTE','Lunda-Norte',1),(1504,'AO-LSU',35001,NULL,NULL,'LUNDA-SUL','Lunda-Sul',1),(1505,'AO-MAL',35001,NULL,NULL,'MALANGE','Malange',1),(1506,'AO-MOX',35001,NULL,NULL,'MOXICO','Moxico',1),(1507,'AO-NAM',35001,NULL,NULL,'NAMÍBE','Namíbe',1),(1508,'AO-UIG',35001,NULL,NULL,'UÍGE','Uíge',1),(1509,'AO-ZAI',35001,NULL,NULL,'ZAÍRE','Zaíre',1);
/*!40000 ALTER TABLE `llxas_c_departements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_ecotaxe`
--

DROP TABLE IF EXISTS `llxas_c_ecotaxe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_ecotaxe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_ecotaxe` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_ecotaxe`
--

LOCK TABLES `llxas_c_ecotaxe` WRITE;
/*!40000 ALTER TABLE `llxas_c_ecotaxe` DISABLE KEYS */;
INSERT INTO `llxas_c_ecotaxe` (`rowid`, `code`, `label`, `price`, `organization`, `fk_pays`, `active`) VALUES (1,'25040','PETIT APPAREILS MENAGERS',0.25000000,'Eco-systèmes',1,1),(2,'25050','TRES PETIT APPAREILS MENAGERS',0.08000000,'Eco-systèmes',1,1),(3,'32070','ECRAN POIDS < 5 KG',2.08000000,'Eco-systèmes',1,1),(4,'32080','ECRAN POIDS > 5 KG',1.25000000,'Eco-systèmes',1,1),(5,'32051','ORDINATEUR PORTABLE',0.42000000,'Eco-systèmes',1,1),(6,'32061','TABLETTE INFORMATIQUE',0.84000000,'Eco-systèmes',1,1),(7,'36011','ORDINATEUR FIXE (UC)',1.15000000,'Eco-systèmes',1,1),(8,'36021','IMPRIMANTES',0.83000000,'Eco-systèmes',1,1),(9,'36030','IT (INFORMATIQUE ET TELECOMS)',0.83000000,'Eco-systèmes',1,1),(10,'36040','PETIT IT (CLAVIERS / SOURIS)',0.08000000,'Eco-systèmes',1,1),(11,'36050','TELEPHONIE MOBILE',0.02000000,'Eco-systèmes',1,1),(12,'36060','CONNECTIQUE CABLES',0.02000000,'Eco-systèmes',1,1),(13,'45010','GROS MATERIEL GRAND PUBLIC (TELEAGRANDISSEURS)',1.67000000,'Eco-systèmes',1,1),(14,'45020','MOYEN MATERIEL GRAND PUBLIC (LOUPES ELECTRONIQUES)',0.42000000,'Eco-systèmes',1,1),(15,'45030','PETIT MATERIEL GRAND PUBLIC (VIE QUOTIDIENNE)',0.08000000,'Eco-systèmes',1,1),(16,'75030','JOUETS < 0,5 KG',0.08000000,'Eco-systèmes',1,1),(17,'75040','JOUETS ENTRE 0,5 KG ET 10 KG',0.17000000,'Eco-systèmes',1,1),(18,'74050','JOUETS > 10 KG',1.67000000,'Eco-systèmes',1,1),(19,'85010','EQUIPEMENT MEDICAL < 0,5 KG',0.08000000,'Eco-systèmes',1,1);
/*!40000 ALTER TABLE `llxas_c_ecotaxe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_effectif`
--

DROP TABLE IF EXISTS `llxas_c_effectif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_effectif` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_effectif` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_effectif`
--

LOCK TABLES `llxas_c_effectif` WRITE;
/*!40000 ALTER TABLE `llxas_c_effectif` DISABLE KEYS */;
INSERT INTO `llxas_c_effectif` (`id`, `code`, `libelle`, `active`, `module`) VALUES (0,'EF0','-',1,NULL),(1,'EF1-5','1 - 5',1,NULL),(2,'EF6-10','6 - 10',1,NULL),(3,'EF11-50','11 - 50',1,NULL),(4,'EF51-100','51 - 100',1,NULL),(5,'EF100-500','100 - 500',1,NULL),(6,'EF500-','> 500',1,NULL);
/*!40000 ALTER TABLE `llxas_c_effectif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_email_senderprofile`
--

DROP TABLE IF EXISTS `llxas_c_email_senderprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_email_senderprofile` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `private` smallint(6) NOT NULL DEFAULT 0,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` smallint(6) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_senderprofile` (`entity`,`label`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_email_senderprofile`
--

LOCK TABLES `llxas_c_email_senderprofile` WRITE;
/*!40000 ALTER TABLE `llxas_c_email_senderprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_email_senderprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_email_templates`
--

DROP TABLE IF EXISTS `llxas_c_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_email_templates` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_template` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `private` smallint(6) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `topic` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joinfiles` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_lines` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_templates` (`entity`,`label`,`lang`),
  KEY `idx_type` (`type_template`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_email_templates`
--

LOCK TABLES `llxas_c_email_templates` WRITE;
/*!40000 ALTER TABLE `llxas_c_email_templates` DISABLE KEYS */;
INSERT INTO `llxas_c_email_templates` (`rowid`, `entity`, `module`, `type_template`, `lang`, `private`, `fk_user`, `datec`, `tms`, `label`, `position`, `enabled`, `active`, `topic`, `joinfiles`, `content`, `content_lines`) VALUES (1,0,'banque','thirdparty','',0,NULL,NULL,'2021-11-10 17:54:37','(YourSEPAMandate)',1,'$conf->societe->enabled && $conf->banque->enabled && $conf->prelevement->enabled',0,'__(YourSEPAMandate)__',NULL,'__(Hello)__,<br><br>\n\n__(FindYourSEPAMandate)__ :<br>\n__MYCOMPANY_NAME__<br>\n__MYCOMPANY_FULLADDRESS__<br><br>\n__(Sincerely)__<br>\n__USER_SIGNATURE__',NULL),(2,0,'adherent','member','',0,NULL,NULL,'2021-11-10 17:54:37','(SendingEmailOnAutoSubscription)',10,'$conf->adherent->enabled',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipRequestWasReceived)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipRequestWasReceived)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),(3,0,'adherent','member','',0,NULL,NULL,'2021-11-10 17:54:37','(SendingEmailOnMemberValidation)',20,'$conf->adherent->enabled',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasValidated)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipWasValidated)__<br>__(FirstName)__ : __MEMBER_FIRSTNAME__<br>__(LastName)__ : __MEMBER_LASTNAME__<br>__(ID)__ : __MEMBER_ID__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),(4,0,'adherent','member','',0,NULL,NULL,'2021-11-10 17:54:37','(SendingEmailOnNewSubscription)',30,'$conf->adherent->enabled',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourSubscriptionWasRecorded)__','1','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourSubscriptionWasRecorded)__<br>\n\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),(5,0,'adherent','member','',0,NULL,NULL,'2021-11-10 17:54:37','(SendingReminderForExpiredSubscription)',40,'$conf->adherent->enabled',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(SubscriptionReminderEmail)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfSubscriptionReminderEmail)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),(6,0,'adherent','member','',0,NULL,NULL,'2021-11-10 17:54:37','(SendingEmailOnCancelation)',50,'$conf->adherent->enabled',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasCanceled)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(YourMembershipWasCanceled)__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),(7,0,'adherent','member','',0,NULL,NULL,'2021-11-10 17:54:37','(SendingAnEMailToMember)',60,'$conf->adherent->enabled',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(CardContent)__','0','__(Hello)__,<br><br>\n\n__(ThisIsContentOfYourCard)__<br>\n__(ID)__ : __ID__<br>\n__(Civiliyty)__ : __MEMBER_CIVILITY__<br>\n__(Firstname)__ : __MEMBER_FIRSTNAME__<br>\n__(Lastname)__ : __MEMBER_LASTNAME__<br>\n__(Fullname)__ : __MEMBER_FULLNAME__<br>\n__(Company)__ : __MEMBER_COMPANY__<br>\n__(Address)__ : __MEMBER_ADDRESS__<br>\n__(Zip)__ : __MEMBER_ZIP__<br>\n__(Town)__ : __MEMBER_TOWN__<br>\n__(Country)__ : __MEMBER_COUNTRY__<br>\n__(Email)__ : __MEMBER_EMAIL__<br>\n__(Birthday)__ : __MEMBER_BIRTH__<br>\n__(Photo)__ : __MEMBER_PHOTO__<br>\n__(Login)__ : __MEMBER_LOGIN__<br>\n__(Password)__ : __MEMBER_PASSWORD__<br>\n__(Phone)__ : __MEMBER_PHONE__<br>\n__(PhonePerso)__ : __MEMBER_PHONEPRO__<br>\n__(PhoneMobile)__ : __MEMBER_PHONEMOBILE__<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),(8,0,'recruitment','recruitmentcandidature_send','',0,NULL,NULL,'2021-11-10 17:54:37','(AnswerCandidature)',100,'$conf->recruitment->enabled',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourCandidature)__','0','__(Hello)__ __CANDIDATE_FULLNAME__,<br><br>\n\n__(YourCandidatureAnswerMessage)__<br>__ONLINE_INTERVIEW_SCHEDULER_TEXT_AND_URL__\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),(9,0,'','conferenceorbooth','',0,NULL,NULL,'2023-01-25 00:17:13','(EventOrganizationEmailAskConf)',10,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskConf)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventConfRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),(10,0,'','conferenceorbooth','',0,NULL,NULL,'2023-01-25 00:17:13','(EventOrganizationEmailAskBooth)',20,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskBooth)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBoothRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),(11,0,'','conferenceorbooth','',0,NULL,NULL,'2023-01-25 00:17:13','(EventOrganizationEmailSubsBooth)',30,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailBoothPayment)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventPaymentOfBoothWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),(12,0,'','conferenceorbooth','',0,NULL,NULL,'2023-01-25 00:17:13','(EventOrganizationEmailSubsEvent)',40,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailRegistrationPayment)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventPaymentOfRegistrationWasReceived)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),(13,0,'','conferenceorbooth','',0,NULL,NULL,'2023-01-25 00:17:13','(EventOrganizationMassEmailAttendees)',50,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailAttendees)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBulkMailToAttendees)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),(14,0,'','conferenceorbooth','',0,NULL,NULL,'2023-01-25 00:17:13','(EventOrganizationMassEmailSpeakers)',60,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailSpeakers)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBulkMailToSpeakers)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),(15,0,'partnership','partnership_send','',0,NULL,NULL,'2023-01-25 00:17:15','(SendingEmailOnPartnershipWillSoonBeCanceled)',100,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipWillSoonBeCanceledTopic)__','0','<body>\n <p>Hello,<br><br>\n__(YourPartnershipWillSoonBeCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),(16,0,'partnership','partnership_send','',0,NULL,NULL,'2023-01-25 00:17:15','(SendingEmailOnPartnershipCanceled)',100,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipCanceledTopic)__','0','<body>\n <p>Hello,<br><br>\n__(YourPartnershipCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),(17,0,'partnership','partnership_send','',0,NULL,NULL,'2023-01-25 00:17:15','(SendingEmailOnPartnershipRefused)',100,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipRefusedTopic)__','0','<body>\n <p>Hello,<br><br>\n__(YourPartnershipRefusedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),(18,0,'partnership','partnership_send','',0,NULL,NULL,'2023-01-25 00:17:15','(SendingEmailOnPartnershipAccepted)',100,'1',1,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipAcceptedTopic)__','0','<body>\n <p>Hello,<br><br>\n__(YourPartnershipAcceptedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL);
/*!40000 ALTER TABLE `llxas_c_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_exp_tax_cat`
--

DROP TABLE IF EXISTS `llxas_c_exp_tax_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_exp_tax_cat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_exp_tax_cat`
--

LOCK TABLES `llxas_c_exp_tax_cat` WRITE;
/*!40000 ALTER TABLE `llxas_c_exp_tax_cat` DISABLE KEYS */;
INSERT INTO `llxas_c_exp_tax_cat` (`rowid`, `label`, `entity`, `active`) VALUES (1,'ExpAutoCat',1,0),(2,'ExpCycloCat',1,0),(3,'ExpMotoCat',1,0),(4,'ExpAuto3CV',1,1),(5,'ExpAuto4CV',1,1),(6,'ExpAuto5CV',1,1),(7,'ExpAuto6CV',1,1),(8,'ExpAuto7CV',1,1),(9,'ExpAuto8CV',1,1),(10,'ExpAuto9CV',1,0),(11,'ExpAuto10CV',1,0),(12,'ExpAuto11CV',1,0),(13,'ExpAuto12CV',1,0),(14,'ExpAuto3PCV',1,0),(15,'ExpAuto4PCV',1,0),(16,'ExpAuto5PCV',1,0),(17,'ExpAuto6PCV',1,0),(18,'ExpAuto7PCV',1,0),(19,'ExpAuto8PCV',1,0),(20,'ExpAuto9PCV',1,0),(21,'ExpAuto10PCV',1,0),(22,'ExpAuto11PCV',1,0),(23,'ExpAuto12PCV',1,0),(24,'ExpAuto13PCV',1,0),(25,'ExpCyclo',1,0),(26,'ExpMoto12CV',1,0),(27,'ExpMoto345CV',1,0),(28,'ExpMoto5PCV',1,0);
/*!40000 ALTER TABLE `llxas_c_exp_tax_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_exp_tax_range`
--

DROP TABLE IF EXISTS `llxas_c_exp_tax_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_exp_tax_range` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 1,
  `range_ik` double NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_exp_tax_range`
--

LOCK TABLES `llxas_c_exp_tax_range` WRITE;
/*!40000 ALTER TABLE `llxas_c_exp_tax_range` DISABLE KEYS */;
INSERT INTO `llxas_c_exp_tax_range` (`rowid`, `fk_c_exp_tax_cat`, `range_ik`, `entity`, `active`) VALUES (1,4,0,1,1),(2,4,5000,1,1),(3,4,20000,1,1),(4,5,0,1,1),(5,5,5000,1,1),(6,5,20000,1,1),(7,6,0,1,1),(8,6,5000,1,1),(9,6,20000,1,1),(10,7,0,1,1),(11,7,5000,1,1),(12,7,20000,1,1),(13,8,0,1,1),(14,8,5000,1,1),(15,8,20000,1,1);
/*!40000 ALTER TABLE `llxas_c_exp_tax_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_field_list`
--

DROP TABLE IF EXISTS `llxas_c_field_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_field_list` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `element` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `align` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `sort` tinyint(4) NOT NULL DEFAULT 1,
  `search` tinyint(4) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_field_list`
--

LOCK TABLES `llxas_c_field_list` WRITE;
/*!40000 ALTER TABLE `llxas_c_field_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_field_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_format_cards`
--

DROP TABLE IF EXISTS `llxas_c_format_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_format_cards` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paper_size` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orientation` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metric` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leftmargin` double(24,8) NOT NULL,
  `topmargin` double(24,8) NOT NULL,
  `nx` int(11) NOT NULL,
  `ny` int(11) NOT NULL,
  `spacex` double(24,8) NOT NULL,
  `spacey` double(24,8) NOT NULL,
  `width` double(24,8) NOT NULL,
  `height` double(24,8) NOT NULL,
  `font_size` int(11) NOT NULL,
  `custom_x` double(24,8) NOT NULL,
  `custom_y` double(24,8) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_format_cards`
--

LOCK TABLES `llxas_c_format_cards` WRITE;
/*!40000 ALTER TABLE `llxas_c_format_cards` DISABLE KEYS */;
INSERT INTO `llxas_c_format_cards` (`rowid`, `code`, `name`, `paper_size`, `orientation`, `metric`, `leftmargin`, `topmargin`, `nx`, `ny`, `spacex`, `spacey`, `width`, `height`, `font_size`, `custom_x`, `custom_y`, `active`) VALUES (1,'5160','Avery-5160, WL-875WX','letter','P','mm',5.58165000,12.70000000,3,10,3.55600000,0.00000000,65.87490000,25.40000000,7,0.00000000,0.00000000,1),(2,'5161','Avery-5161, WL-75WX','letter','P','mm',4.44500000,12.70000000,2,10,3.96800000,0.00000000,101.60000000,25.40000000,7,0.00000000,0.00000000,1),(3,'5162','Avery-5162, WL-100WX','letter','P','mm',3.87350000,22.35200000,2,7,4.95400000,0.00000000,101.60000000,33.78100000,8,0.00000000,0.00000000,1),(4,'5163','Avery-5163, WL-125WX','letter','P','mm',4.57200000,12.70000000,2,5,3.55600000,0.00000000,101.60000000,50.80000000,10,0.00000000,0.00000000,1),(5,'5164','5164 (Letter)','letter','P','in',0.14800000,0.50000000,2,3,0.20310000,0.00000000,4.00000000,3.33000000,12,0.00000000,0.00000000,0),(6,'8600','Avery-8600','letter','P','mm',7.10000000,19.00000000,3,10,9.50000000,3.10000000,66.60000000,25.40000000,7,0.00000000,0.00000000,1),(7,'99012','DYMO 99012 89*36mm','custom','L','mm',1.00000000,1.00000000,1,1,0.00000000,0.00000000,36.00000000,89.00000000,10,36.00000000,89.00000000,1),(8,'99014','DYMO 99014 101*54mm','custom','L','mm',1.00000000,1.00000000,1,1,0.00000000,0.00000000,54.00000000,101.00000000,10,54.00000000,101.00000000,1),(9,'AVERYC32010','Avery-C32010','A4','P','mm',15.00000000,13.00000000,2,5,10.00000000,0.00000000,85.00000000,54.00000000,10,0.00000000,0.00000000,1),(10,'CARD','Dolibarr Business cards','A4','P','mm',15.00000000,15.00000000,2,5,0.00000000,0.00000000,85.00000000,54.00000000,10,0.00000000,0.00000000,1),(11,'L7163','Avery-L7163','A4','P','mm',5.00000000,15.00000000,2,7,2.50000000,0.00000000,99.10000000,38.10000000,8,0.00000000,0.00000000,1);
/*!40000 ALTER TABLE `llxas_c_format_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_forme_juridique`
--

DROP TABLE IF EXISTS `llxas_c_forme_juridique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_forme_juridique` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isvatexempted` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_forme_juridique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_forme_juridique`
--

LOCK TABLES `llxas_c_forme_juridique` WRITE;
/*!40000 ALTER TABLE `llxas_c_forme_juridique` DISABLE KEYS */;
INSERT INTO `llxas_c_forme_juridique` (`rowid`, `code`, `fk_pays`, `libelle`, `isvatexempted`, `active`, `module`, `position`) VALUES (1,0,0,'-',0,1,NULL,0),(2,2301,23,'Monotributista',0,1,NULL,0),(3,2302,23,'Sociedad Civil',0,1,NULL,0),(4,2303,23,'Sociedades Comerciales',0,1,NULL,0),(5,2304,23,'Sociedades de Hecho',0,1,NULL,0),(6,2305,23,'Sociedades Irregulares',0,1,NULL,0),(7,2306,23,'Sociedad Colectiva',0,1,NULL,0),(8,2307,23,'Sociedad en Comandita Simple',0,1,NULL,0),(9,2308,23,'Sociedad de Capital e Industria',0,1,NULL,0),(10,2309,23,'Sociedad Accidental o en participación',0,1,NULL,0),(11,2310,23,'Sociedad de Responsabilidad Limitada',0,1,NULL,0),(12,2311,23,'Sociedad Anónima',0,1,NULL,0),(13,2312,23,'Sociedad Anónima con Participación Estatal Mayoritaria',0,1,NULL,0),(14,2313,23,'Sociedad en Comandita por Acciones (arts. 315 a 324, LSC)',0,1,NULL,0),(15,4100,41,'GmbH - Gesellschaft mit beschränkter Haftung',0,1,NULL,0),(16,4101,41,'GesmbH - Gesellschaft mit beschränkter Haftung',0,1,NULL,0),(17,4102,41,'AG - Aktiengesellschaft',0,1,NULL,0),(18,4103,41,'EWIV - Europäische wirtschaftliche Interessenvereinigung',0,1,NULL,0),(19,4104,41,'KEG - Kommanditerwerbsgesellschaft',0,1,NULL,0),(20,4105,41,'OEG - Offene Erwerbsgesellschaft',0,1,NULL,0),(21,4106,41,'OHG - Offene Handelsgesellschaft',0,1,NULL,0),(22,4107,41,'AG & Co KG - Kommanditgesellschaft',0,1,NULL,0),(23,4108,41,'GmbH & Co KG - Kommanditgesellschaft',0,1,NULL,0),(24,4109,41,'KG - Kommanditgesellschaft',0,1,NULL,0),(25,4110,41,'OG - Offene Gesellschaft',0,1,NULL,0),(26,4111,41,'GbR - Gesellschaft nach bürgerlichem Recht',0,1,NULL,0),(27,4112,41,'GesbR - Gesellschaft nach bürgerlichem Recht',0,1,NULL,0),(28,4113,41,'GesnbR - Gesellschaft nach bürgerlichem Recht',0,1,NULL,0),(29,4114,41,'e.U. - eingetragener Einzelunternehmer',0,1,NULL,0),(30,11,1,'Artisan Commerçant (EI)',0,1,NULL,0),(31,12,1,'Commerçant (EI)',0,1,NULL,0),(32,13,1,'Artisan (EI)',0,1,NULL,0),(33,14,1,'Officier public ou ministériel',0,1,NULL,0),(34,15,1,'Profession libérale (EI)',0,1,NULL,0),(35,16,1,'Exploitant agricole',0,1,NULL,0),(36,17,1,'Agent commercial',0,1,NULL,0),(37,18,1,'Associé Gérant de société',0,1,NULL,0),(38,19,1,'Personne physique',0,1,NULL,0),(39,21,1,'Indivision',0,1,NULL,0),(40,22,1,'Société créée de fait',0,1,NULL,0),(41,23,1,'Société en participation',0,1,NULL,0),(42,24,1,'Société coopérative d\'interet collectif (SCIC)',0,1,NULL,0),(43,25,1,'Société coopérative de production à responsabilité limitée (SCOP)',0,1,NULL,0),(44,27,1,'Paroisse hors zone concordataire',0,1,NULL,0),(45,29,1,'Groupement de droit privé non doté de la personnalité morale',0,1,NULL,0),(46,31,1,'Personne morale de droit étranger, immatriculée au RCS',0,1,NULL,0),(47,32,1,'Personne morale de droit étranger, non immatriculée au RCS',0,1,NULL,0),(48,35,1,'Régime auto-entrepreneur',0,1,NULL,0),(49,41,1,'Etablissement public ou régie à caractère industriel ou commercial',0,1,NULL,0),(50,51,1,'Société coopérative commerciale particulière',0,1,NULL,0),(51,52,1,'Société en nom collectif',0,1,NULL,0),(52,53,1,'Société en commandite',0,1,NULL,0),(53,54,1,'Société à responsabilité limitée (SARL)',0,1,NULL,0),(54,55,1,'Société anonyme à conseil d administration',0,1,NULL,0),(55,56,1,'Société anonyme à directoire',0,1,NULL,0),(56,57,1,'Société par actions simplifiée (SAS)',0,1,NULL,0),(57,58,1,'Entreprise Unipersonnelle à Responsabilité Limitée (EURL)',0,1,NULL,0),(58,59,1,'Société par actions simplifiée unipersonnelle (SASU)',0,1,NULL,0),(59,60,1,'Entreprise Individuelle à Responsabilité Limitée (EIRL)',0,1,NULL,0),(60,61,1,'Caisse d\'épargne et de prévoyance',0,1,NULL,0),(61,62,1,'Groupement d\'intérêt économique (GIE)',0,1,NULL,0),(62,63,1,'Société coopérative agricole',0,1,NULL,0),(63,64,1,'Société non commerciale d assurances',0,1,NULL,0),(64,65,1,'Société civile',0,1,NULL,0),(65,69,1,'Personnes de droit privé inscrites au RCS',0,1,NULL,0),(66,71,1,'Administration de l état',0,1,NULL,0),(67,72,1,'Collectivité territoriale',0,1,NULL,0),(68,73,1,'Etablissement public administratif',0,1,NULL,0),(69,74,1,'Personne morale de droit public administratif',0,1,NULL,0),(70,81,1,'Organisme gérant régime de protection social à adhésion obligatoire',0,1,NULL,0),(71,82,1,'Organisme mutualiste',0,1,NULL,0),(72,83,1,'Comité d entreprise',0,1,NULL,0),(73,84,1,'Organisme professionnel',0,1,NULL,0),(74,85,1,'Organisme de retraite à adhésion non obligatoire',0,1,NULL,0),(75,91,1,'Syndicat de propriétaires',0,1,NULL,0),(76,92,1,'Association loi 1901 ou assimilé',0,1,NULL,0),(77,93,1,'Fondation',0,1,NULL,0),(78,99,1,'Personne morale de droit privé',0,1,NULL,0),(79,200,2,'Indépendant',0,1,NULL,0),(80,201,2,'SRL - Société à responsabilité limitée',0,1,NULL,0),(81,202,2,'SA   - Société Anonyme',0,1,NULL,0),(82,203,2,'SCRL - Société coopérative à responsabilité limitée',0,1,NULL,0),(83,204,2,'ASBL - Association sans but Lucratif',0,1,NULL,0),(84,205,2,'SCRI - Société coopérative à responsabilité illimitée',0,1,NULL,0),(85,206,2,'SCS  - Société en commandite simple',0,1,NULL,0),(86,207,2,'SCA  - Société en commandite par action',0,1,NULL,0),(87,208,2,'SNC  - Société en nom collectif',0,1,NULL,0),(88,209,2,'GIE  - Groupement d intérêt économique',0,1,NULL,0),(89,210,2,'GEIE - Groupement européen d intérêt économique',0,1,NULL,0),(90,220,2,'Eenmanszaak',0,1,NULL,0),(91,221,2,'BVBA - Besloten vennootschap met beperkte aansprakelijkheid',0,1,NULL,0),(92,222,2,'NV   - Naamloze Vennootschap',0,1,NULL,0),(93,223,2,'CVBA - Coöperatieve vennootschap met beperkte aansprakelijkheid',0,1,NULL,0),(94,224,2,'VZW  - Vereniging zonder winstoogmerk',0,1,NULL,0),(95,225,2,'CVOA - Coöperatieve vennootschap met onbeperkte aansprakelijkheid ',0,1,NULL,0),(96,226,2,'GCV  - Gewone commanditaire vennootschap',0,1,NULL,0),(97,227,2,'Comm.VA - Commanditaire vennootschap op aandelen',0,1,NULL,0),(98,228,2,'VOF  - Vennootschap onder firma',0,1,NULL,0),(99,229,2,'VS0  - Vennootschap met sociaal oogmerk',0,1,NULL,0),(100,500,5,'GmbH - Gesellschaft mit beschränkter Haftung',0,1,NULL,0),(101,501,5,'AG - Aktiengesellschaft ',0,1,NULL,0),(102,502,5,'GmbH&Co. KG - Gesellschaft mit beschränkter Haftung & Compagnie Kommanditgesellschaft',0,1,NULL,0),(103,503,5,'Gewerbe - Personengesellschaft',0,1,NULL,0),(104,504,5,'UG - Unternehmergesellschaft -haftungsbeschränkt-',0,1,NULL,0),(105,505,5,'GbR - Gesellschaft des bürgerlichen Rechts',0,1,NULL,0),(106,506,5,'KG - Kommanditgesellschaft',0,1,NULL,0),(107,507,5,'Ltd. - Limited Company',0,1,NULL,0),(108,508,5,'OHG - Offene Handelsgesellschaft',0,1,NULL,0),(109,8001,80,'Aktieselvskab A/S',0,1,NULL,0),(110,8002,80,'Anparts Selvskab ApS',0,1,NULL,0),(111,8003,80,'Personlig ejet selvskab',0,1,NULL,0),(112,8004,80,'Iværksætterselvskab IVS',0,1,NULL,0),(113,8005,80,'Interessentskab I/S',0,1,NULL,0),(114,8006,80,'Holdingselskab',0,1,NULL,0),(115,8007,80,'Selskab Med Begrænset Hæftelse SMBA',0,1,NULL,0),(116,8008,80,'Kommanditselskab K/S',0,1,NULL,0),(117,8009,80,'SPE-selskab',0,1,NULL,0),(118,10201,102,'Ατομική επιχείρηση',0,1,NULL,0),(119,10202,102,'Εταιρική  επιχείρηση',0,1,NULL,0),(120,10203,102,'Ομόρρυθμη Εταιρεία Ο.Ε',0,1,NULL,0),(121,10204,102,'Ετερόρρυθμη Εταιρεία Ε.Ε',0,1,NULL,0),(122,10205,102,'Εταιρεία Περιορισμένης Ευθύνης Ε.Π.Ε',0,1,NULL,0),(123,10206,102,'Ανώνυμη Εταιρεία Α.Ε',0,1,NULL,0),(124,10207,102,'Ανώνυμη ναυτιλιακή εταιρεία Α.Ν.Ε',0,1,NULL,0),(125,10208,102,'Συνεταιρισμός',0,1,NULL,0),(126,10209,102,'Συμπλοιοκτησία',0,1,NULL,0),(127,301,3,'Società semplice',0,1,NULL,0),(128,302,3,'Società in nome collettivo s.n.c.',0,1,NULL,0),(129,303,3,'Società in accomandita semplice s.a.s.',0,1,NULL,0),(130,304,3,'Società per azioni s.p.a.',0,1,NULL,0),(131,305,3,'Società a responsabilità limitata s.r.l.',0,1,NULL,0),(132,306,3,'Società in accomandita per azioni s.a.p.a.',0,1,NULL,0),(133,307,3,'Società cooperativa a r.l.',0,1,NULL,0),(134,308,3,'Società consortile',0,1,NULL,0),(135,309,3,'Società europea',0,1,NULL,0),(136,310,3,'Società cooperativa europea',0,1,NULL,0),(137,311,3,'Società unipersonale',0,1,NULL,0),(138,312,3,'Società di professionisti',0,1,NULL,0),(139,313,3,'Società di fatto',0,1,NULL,0),(140,315,3,'Società apparente',0,1,NULL,0),(141,316,3,'Impresa individuale ',0,1,NULL,0),(142,317,3,'Impresa coniugale',0,1,NULL,0),(143,318,3,'Impresa familiare',0,1,NULL,0),(144,319,3,'Consorzio cooperativo',0,1,NULL,0),(145,320,3,'Società cooperativa sociale',0,1,NULL,0),(146,321,3,'Società cooperativa di consumo',0,1,NULL,0),(147,322,3,'Società cooperativa agricola',0,1,NULL,0),(148,323,3,'A.T.I. Associazione temporanea di imprese',0,1,NULL,0),(149,324,3,'R.T.I. Raggruppamento temporaneo di imprese',0,1,NULL,0),(150,325,3,'Studio associato',0,1,NULL,0),(151,600,6,'Raison Individuelle',0,1,NULL,0),(152,601,6,'Société Simple',0,1,NULL,0),(153,602,6,'Société en nom collectif',0,1,NULL,0),(154,603,6,'Société en commandite',0,1,NULL,0),(155,604,6,'Société anonyme (SA)',0,1,NULL,0),(156,605,6,'Société en commandite par actions',0,1,NULL,0),(157,606,6,'Société à responsabilité limitée (SARL)',0,1,NULL,0),(158,607,6,'Société coopérative',0,1,NULL,0),(159,608,6,'Association',0,1,NULL,0),(160,609,6,'Fondation',0,1,NULL,0),(161,700,7,'Sole Trader',0,1,NULL,0),(162,701,7,'Partnership',0,1,NULL,0),(163,702,7,'Private Limited Company by shares (LTD)',0,1,NULL,0),(164,703,7,'Public Limited Company',0,1,NULL,0),(165,704,7,'Workers Cooperative',0,1,NULL,0),(166,705,7,'Limited Liability Partnership',0,1,NULL,0),(167,706,7,'Franchise',0,1,NULL,0),(168,1000,10,'Société à responsabilité limitée (SARL)',0,1,NULL,0),(169,1001,10,'Société en Nom Collectif (SNC)',0,1,NULL,0),(170,1002,10,'Société en Commandite Simple (SCS)',0,1,NULL,0),(171,1003,10,'société en participation',0,1,NULL,0),(172,1004,10,'Société Anonyme (SA)',0,1,NULL,0),(173,1005,10,'Société Unipersonnelle à Responsabilité Limitée (SUARL)',0,1,NULL,0),(174,1006,10,'Groupement d\'intérêt économique (GEI)',0,1,NULL,0),(175,1007,10,'Groupe de sociétés',0,1,NULL,0),(176,1701,17,'Eenmanszaak',0,1,NULL,0),(177,1702,17,'Maatschap',0,1,NULL,0),(178,1703,17,'Vennootschap onder firma',0,1,NULL,0),(179,1704,17,'Commanditaire vennootschap',0,1,NULL,0),(180,1705,17,'Besloten vennootschap (BV)',0,1,NULL,0),(181,1706,17,'Naamloze Vennootschap (NV)',0,1,NULL,0),(182,1707,17,'Vereniging',0,1,NULL,0),(183,1708,17,'Stichting',0,1,NULL,0),(184,1709,17,'Coöperatie met beperkte aansprakelijkheid (BA)',0,1,NULL,0),(185,1710,17,'Coöperatie met uitgesloten aansprakelijkheid (UA)',0,1,NULL,0),(186,1711,17,'Coöperatie met wettelijke aansprakelijkheid (WA)',0,1,NULL,0),(187,1712,17,'Onderlinge waarborgmaatschappij',0,1,NULL,0),(188,401,4,'Empresario Individual',0,1,NULL,0),(189,402,4,'Comunidad de Bienes',0,1,NULL,0),(190,403,4,'Sociedad Civil',0,1,NULL,0),(191,404,4,'Sociedad Colectiva',0,1,NULL,0),(192,405,4,'Sociedad Limitada',0,1,NULL,0),(193,406,4,'Sociedad Anónima',0,1,NULL,0),(194,407,4,'Sociedad Comanditaria por Acciones',0,1,NULL,0),(195,408,4,'Sociedad Comanditaria Simple',0,1,NULL,0),(196,409,4,'Sociedad Laboral',0,1,NULL,0),(197,410,4,'Sociedad Cooperativa',0,1,NULL,0),(198,411,4,'Sociedad de Garantía Recíproca',0,1,NULL,0),(199,412,4,'Entidad de Capital-Riesgo',0,1,NULL,0),(200,413,4,'Agrupación de Interés Económico',0,1,NULL,0),(201,414,4,'Sociedad de Inversión Mobiliaria',0,1,NULL,0),(202,415,4,'Agrupación sin Ánimo de Lucro',0,1,NULL,0),(203,15201,152,'Mauritius Private Company Limited By Shares',0,1,NULL,0),(204,15202,152,'Mauritius Company Limited By Guarantee',0,1,NULL,0),(205,15203,152,'Mauritius Public Company Limited By Shares',0,1,NULL,0),(206,15204,152,'Mauritius Foreign Company',0,1,NULL,0),(207,15205,152,'Mauritius GBC1 (Offshore Company)',0,1,NULL,0),(208,15206,152,'Mauritius GBC2 (International Company)',0,1,NULL,0),(209,15207,152,'Mauritius General Partnership',0,1,NULL,0),(210,15208,152,'Mauritius Limited Partnership',0,1,NULL,0),(211,15209,152,'Mauritius Sole Proprietorship',0,1,NULL,0),(212,15210,152,'Mauritius Trusts',0,1,NULL,0),(213,15401,154,'Sociedad en nombre colectivo',0,1,NULL,0),(214,15402,154,'Sociedad en comandita simple',0,1,NULL,0),(215,15403,154,'Sociedad de responsabilidad limitada',0,1,NULL,0),(216,15404,154,'Sociedad anónima',0,1,NULL,0),(217,15405,154,'Sociedad en comandita por acciones',0,1,NULL,0),(218,15406,154,'Sociedad cooperativa',0,1,NULL,0),(219,14001,140,'Entreprise individuelle',0,1,NULL,0),(220,14002,140,'Société en nom collectif (SENC)',0,1,NULL,0),(221,14003,140,'Société en commandite simple (SECS)',0,1,NULL,0),(222,14004,140,'Société en commandite par actions (SECA)',0,1,NULL,0),(223,14005,140,'Société à responsabilité limitée (SARL)',0,1,NULL,0),(224,14006,140,'Société anonyme (SA)',0,1,NULL,0),(225,14007,140,'Société coopérative (SC)',0,1,NULL,0),(226,14008,140,'Société européenne (SE)',0,1,NULL,0),(227,18801,188,'AFJ - Alte forme juridice',0,1,NULL,0),(228,18802,188,'ASF - Asociatie familialã',0,1,NULL,0),(229,18803,188,'CON - Concesiune',0,1,NULL,0),(230,18804,188,'CRL - Soc civilã profesionala cu pers. juridica si rãspundere limitata (SPRL)',0,1,NULL,0),(231,18805,188,'INC - Închiriere',0,1,NULL,0),(232,18806,188,'LOC - Locaţie de gestiune',0,1,NULL,0),(233,18807,188,'OC1 - Organizaţie cooperatistã meşteşugãreascã',0,1,NULL,0),(234,18808,188,'OC2 - Organizaţie cooperatistã de consum',0,1,NULL,0),(235,18809,188,'OC3 - Organizaţie cooperatistã de credit',0,1,NULL,0),(236,18810,188,'PFA - Persoanã fizicã independentã',0,1,NULL,0),(237,18811,188,'RA - Regie autonomã',0,1,NULL,0),(238,18812,188,'SA - Societate comercialã pe acţiuni',0,1,NULL,0),(239,18813,188,'SCS - Societate comercialã în comanditã simplã',0,1,NULL,0),(240,18814,188,'SNC - Societate comercialã în nume colectiv',0,1,NULL,0),(241,18815,188,'SPI - Societate profesionala practicieni in insolventa (SPPI)',0,1,NULL,0),(242,18816,188,'SRL - Societate comercialã cu rãspundere limitatã',0,1,NULL,0),(243,18817,188,'URL - Intreprindere profesionala unipersonala cu rãspundere limitata (IPURL)',0,1,NULL,0),(244,17801,178,'Empresa individual',0,1,NULL,0),(245,17802,178,'Asociación General',0,1,NULL,0),(246,17803,178,'Sociedad de Responsabilidad Limitada',0,1,NULL,0),(247,17804,178,'Sociedad Civil',0,1,NULL,0),(248,17805,178,'Sociedad Anónima',0,1,NULL,0),(249,1300,13,'Personne physique',0,1,NULL,0),(250,1301,13,'Société à responsabilité limitée (SARL)',0,1,NULL,0),(251,1302,13,'Entreprise unipersonnelle à responsabilité limitée (EURL)',0,1,NULL,0),(252,1303,13,'Société en Nom Collectif (SNC)',0,1,NULL,0),(253,1304,13,'société par actions (SPA)',0,1,NULL,0),(254,1305,13,'Société en Commandite Simple (SCS)',0,1,NULL,0),(255,1306,13,'Société en commandite par actions (SCA)',0,1,NULL,0),(256,1307,13,'Société en participation',0,1,NULL,0),(257,1308,13,'Groupe de sociétés',0,1,NULL,0);
/*!40000 ALTER TABLE `llxas_c_forme_juridique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_holiday_types`
--

DROP TABLE IF EXISTS `llxas_c_holiday_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_holiday_types` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `affect` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `newByMonth` double(8,5) NOT NULL DEFAULT 0.00000,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_holiday_types` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_holiday_types`
--

LOCK TABLES `llxas_c_holiday_types` WRITE;
/*!40000 ALTER TABLE `llxas_c_holiday_types` DISABLE KEYS */;
INSERT INTO `llxas_c_holiday_types` (`rowid`, `code`, `label`, `affect`, `delay`, `newByMonth`, `fk_country`, `active`) VALUES (1,'LEAVE_SICK','Sick leave',0,0,0.00000,NULL,1),(2,'LEAVE_OTHER','Other leave',0,0,0.00000,NULL,1),(3,'LEAVE_PAID','Paid vacation',1,7,0.00000,NULL,0),(4,'LEAVE_RTT_FR','RTT',1,7,0.83000,1,1),(5,'LEAVE_PAID_FR','Paid vacation',1,30,2.08334,1,1);
/*!40000 ALTER TABLE `llxas_c_holiday_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_hrm_department`
--

DROP TABLE IF EXISTS `llxas_c_hrm_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_hrm_department` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_hrm_department`
--

LOCK TABLES `llxas_c_hrm_department` WRITE;
/*!40000 ALTER TABLE `llxas_c_hrm_department` DISABLE KEYS */;
INSERT INTO `llxas_c_hrm_department` (`rowid`, `pos`, `code`, `label`, `active`) VALUES (1,5,'MANAGEMENT','Management',1),(3,15,'TRAINING','Training',1),(4,20,'IT','Inform. Technology (IT)',0),(5,25,'MARKETING','Marketing',0),(6,30,'SALES','Sales',1),(7,35,'LEGAL','Legal',0),(8,40,'FINANCIAL','Financial accounting',1),(9,45,'HUMANRES','Human resources',1),(10,50,'PURCHASING','Purchasing',1),(12,60,'CUSTOMSERV','Customer service',0),(14,70,'LOGISTIC','Logistics',1),(15,75,'CONSTRUCT','Engineering/design',0),(16,80,'PRODUCTION','Production',1),(17,85,'QUALITY','Quality assurance',0);
/*!40000 ALTER TABLE `llxas_c_hrm_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_hrm_function`
--

DROP TABLE IF EXISTS `llxas_c_hrm_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_hrm_function` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_level` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_hrm_function`
--

LOCK TABLES `llxas_c_hrm_function` WRITE;
/*!40000 ALTER TABLE `llxas_c_hrm_function` DISABLE KEYS */;
INSERT INTO `llxas_c_hrm_function` (`rowid`, `pos`, `code`, `label`, `c_level`, `active`) VALUES (1,5,'EXECBOARD','Executive board',0,1),(2,10,'MANAGDIR','Managing director',1,1),(3,15,'ACCOUNTMANAG','Account manager',0,1),(4,20,'ENGAGDIR','Engagement director',1,1),(5,25,'DIRECTOR','Director',1,1),(6,30,'PROJMANAG','Project manager',0,1),(7,35,'DEPHEAD','Department head',0,1),(8,40,'SECRETAR','Secretary',0,1),(9,45,'EMPLOYEE','Department employee',0,1);
/*!40000 ALTER TABLE `llxas_c_hrm_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_hrm_public_holiday`
--

DROP TABLE IF EXISTS `llxas_c_hrm_public_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_hrm_public_holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 0,
  `fk_country` int(11) DEFAULT NULL,
  `code` varchar(62) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dayrule` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_hrm_public_holiday` (`entity`,`code`),
  UNIQUE KEY `uk_c_hrm_public_holiday2` (`entity`,`fk_country`,`dayrule`,`day`,`month`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_hrm_public_holiday`
--

LOCK TABLES `llxas_c_hrm_public_holiday` WRITE;
/*!40000 ALTER TABLE `llxas_c_hrm_public_holiday` DISABLE KEYS */;
INSERT INTO `llxas_c_hrm_public_holiday` (`id`, `entity`, `fk_country`, `code`, `dayrule`, `day`, `month`, `year`, `active`, `import_key`) VALUES (1,0,0,'NEWYEARDAY1','',1,1,0,1,NULL),(2,0,0,'LABORDAY1','',1,5,0,1,NULL),(3,0,0,'ASSOMPTIONDAY1','',15,8,0,1,NULL),(4,0,0,'CHRISTMASDAY1','',25,12,0,1,NULL),(5,0,1,'FR-VICTORYDAY','',8,5,0,1,NULL),(6,0,1,'FR-NATIONALDAY','',14,7,0,1,NULL),(7,0,1,'FR-ASSOMPTION','',15,8,0,1,NULL),(8,0,1,'FR-TOUSSAINT','',1,11,0,1,NULL),(9,0,1,'FR-ARMISTICE','',11,11,0,1,NULL),(10,0,1,'FR-EASTER','eastermonday',0,0,0,1,NULL),(11,0,1,'FR-ASCENSION','ascension',0,0,0,1,NULL),(12,0,1,'FR-PENTECOST','pentecost',0,0,0,1,NULL),(13,0,3,'IT-LIBEAZIONE','',25,4,0,1,NULL),(14,0,3,'IT-EPIPHANY','',1,6,0,1,NULL),(15,0,3,'IT-REPUBBLICA','',2,6,0,1,NULL),(16,0,3,'IT-TUTTISANTIT','',1,11,0,1,NULL),(17,0,3,'IT-IMMACULE','',8,12,0,1,NULL),(18,0,3,'IT-SAINTSTEFAN','',26,12,0,1,NULL),(19,0,4,'ES-EASTER','easter',0,0,0,1,NULL),(20,0,4,'ES-REYE','',1,6,0,1,NULL),(21,0,4,'ES-HISPANIDAD','',12,10,0,1,NULL),(22,0,4,'ES-TOUSSAINT','',1,11,0,1,NULL),(23,0,4,'ES-CONSTITUIZION','',6,12,0,1,NULL),(24,0,4,'ES-IMMACULE','',8,12,0,1,NULL),(25,0,41,'AT-EASTER','eastermonday',0,0,0,1,NULL),(26,0,41,'AT-ASCENSION','ascension',0,0,0,1,NULL),(27,0,41,'AT-PENTECOST','pentecost',0,0,0,1,NULL),(28,0,41,'AT-FRONLEICHNAM','fronleichnam',0,0,0,1,NULL),(29,0,41,'AT-KONEGIE','',1,6,0,1,NULL),(30,0,41,'AT-26OKT','',26,10,0,1,NULL),(31,0,41,'AT-TOUSSAINT','',1,11,0,1,NULL),(32,0,41,'AT-IMMACULE','',8,12,0,1,NULL),(33,0,41,'AT-24DEC','',24,12,0,1,NULL),(34,0,41,'AT-SAINTSTEFAN','',26,12,0,1,NULL),(35,0,41,'AT-Silvester','',31,12,0,1,NULL),(36,0,117,'IN-REPUBLICDAY','',26,1,0,1,NULL),(37,0,117,'IN-GANDI','',2,10,0,1,NULL);
/*!40000 ALTER TABLE `llxas_c_hrm_public_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_incoterms`
--

DROP TABLE IF EXISTS `llxas_c_incoterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_incoterms` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_incoterms` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_incoterms`
--

LOCK TABLES `llxas_c_incoterms` WRITE;
/*!40000 ALTER TABLE `llxas_c_incoterms` DISABLE KEYS */;
INSERT INTO `llxas_c_incoterms` (`rowid`, `code`, `label`, `libelle`, `active`) VALUES (1,'EXW','Ex Works','Ex Works, departing unloaded, uncleared ex works (only suitable for domestic, national flows)',1),(2,'FCA','Free Carrier','Free Carrier, goods cleared and loaded in the country of departure, at the seller\'s or at the buyer\'s freight forwarder',1),(3,'FAS','Free Alongside Ship','Free Alongside Ship, on the quay of the port of departure',1),(4,'FOB','Free On Board','Free On Board, loaded on the boat, the costs of loading into the boat depending on the liner term indicated by the shipping company (at the seller\'s expense)',1),(5,'CFR','Cost and Freight','Cost and Freight, loaded into the ship, delivery to the port of departure, costs paid to the port of arrival, without insurance for the transport, not unloaded from the ship at destination (unloading costs are included or not at the port of arrival)',1),(6,'CIF','Cost, Insurance, Freight','Cost, Insurance and Freight, loaded on the boat, costs to the port of arrival, with the transported goods insurance taken out by the seller on behalf of the buyer',1),(7,'CPT','Carriage Paid To','Carriage Paid To, delivery to first carrier, charges until unloaded from mode of transport, without transport insurance',1),(8,'CIP','Carriage Insurance Paid','Carriage and Insurance Paid to, idem CPT, with transported goods insurance taken out by the seller on behalf of the buyer',1),(9,'DAT','Delivered At Terminal','Delivered At Terminal, goods (unloaded) delivered to the quay, to a designated maritime, river, air, road or rail terminal (import customs clearance and post-routing paid by the buyer)',1),(10,'DAP','Delivered At Place','Delivered At Place, goods (not unloaded) made available to the buyer in the country of importation at the place specified in the contract (unloading, import customs clearance paid by the buyer)',1),(11,'DDP','Delivered Duty Paid','Delivered Duty Paid, goods (not unloaded) delivered to final destination, import customs clearance and taxes payable by the seller; the buyer pays only for the unloading (if VAT-type taxes are excluded, specify this clearly)',1),(12,'DPU','Delivered at Place Unloaded','Delivered at Place unloaded',1);
/*!40000 ALTER TABLE `llxas_c_incoterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_input_method`
--

DROP TABLE IF EXISTS `llxas_c_input_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_input_method` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libelle` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_method` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_input_method`
--

LOCK TABLES `llxas_c_input_method` WRITE;
/*!40000 ALTER TABLE `llxas_c_input_method` DISABLE KEYS */;
INSERT INTO `llxas_c_input_method` (`rowid`, `code`, `libelle`, `active`, `module`) VALUES (1,'OrderByMail','Courrier',1,NULL),(2,'OrderByFax','Fax',1,NULL),(3,'OrderByEMail','EMail',1,NULL),(4,'OrderByPhone','Téléphone',1,NULL),(5,'OrderByWWW','En ligne',1,NULL);
/*!40000 ALTER TABLE `llxas_c_input_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_input_reason`
--

DROP TABLE IF EXISTS `llxas_c_input_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_input_reason` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_reason` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_input_reason`
--

LOCK TABLES `llxas_c_input_reason` WRITE;
/*!40000 ALTER TABLE `llxas_c_input_reason` DISABLE KEYS */;
INSERT INTO `llxas_c_input_reason` (`rowid`, `code`, `label`, `active`, `module`) VALUES (1,'SRC_INTE','Web site',1,NULL),(2,'SRC_CAMP_MAIL','Mailing campaign',1,NULL),(3,'SRC_CAMP_PHO','Phone campaign',1,NULL),(4,'SRC_CAMP_FAX','Fax campaign',1,NULL),(5,'SRC_COMM','Commercial contact',1,NULL),(6,'SRC_SHOP','Shop contact',1,NULL),(7,'SRC_CAMP_EMAIL','EMailing campaign',1,NULL),(8,'SRC_WOM','Word of mouth',1,NULL),(9,'SRC_PARTNER','Partner',1,NULL),(10,'SRC_EMPLOYEE','Employee',1,NULL),(11,'SRC_SPONSORING','Sponsorship',1,NULL),(12,'SRC_CUSTOMER','Incoming contact of a customer',1,NULL);
/*!40000 ALTER TABLE `llxas_c_input_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_lead_status`
--

DROP TABLE IF EXISTS `llxas_c_lead_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_lead_status` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `percent` double(5,2) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_lead_status_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_lead_status`
--

LOCK TABLES `llxas_c_lead_status` WRITE;
/*!40000 ALTER TABLE `llxas_c_lead_status` DISABLE KEYS */;
INSERT INTO `llxas_c_lead_status` (`rowid`, `code`, `label`, `position`, `percent`, `active`) VALUES (1,'PROSP','Prospection',10,0.00,1),(2,'QUAL','Qualification',20,20.00,1),(3,'PROPO','Proposal',30,40.00,1),(4,'NEGO','Negotiation',40,60.00,1),(5,'PENDING','Pending',50,50.00,0),(6,'WON','Won',60,100.00,1),(7,'LOST','Lost',70,0.00,1);
/*!40000 ALTER TABLE `llxas_c_lead_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_paiement`
--

DROP TABLE IF EXISTS `llxas_c_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(62) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_paiement_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_paiement`
--

LOCK TABLES `llxas_c_paiement` WRITE;
/*!40000 ALTER TABLE `llxas_c_paiement` DISABLE KEYS */;
INSERT INTO `llxas_c_paiement` (`id`, `entity`, `code`, `libelle`, `type`, `active`, `accountancy_code`, `module`, `position`) VALUES (1,1,'TIP','TIP',2,0,NULL,NULL,0),(2,1,'VIR','Transfer',2,1,NULL,NULL,0),(3,1,'PRE','Debit order',2,1,NULL,NULL,0),(4,1,'LIQ','Cash',2,1,NULL,NULL,0),(6,1,'CB','Credit card',2,1,NULL,NULL,0),(7,1,'CHQ','Cheque',2,1,NULL,NULL,0),(50,1,'VAD','Online payment',2,0,NULL,NULL,0),(51,1,'TRA','Traite',2,0,NULL,NULL,0),(52,1,'LCR','LCR',2,0,NULL,NULL,0),(53,1,'FAC','Factor',2,0,NULL,NULL,0);
/*!40000 ALTER TABLE `llxas_c_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_paper_format`
--

DROP TABLE IF EXISTS `llxas_c_paper_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_paper_format` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` float(6,2) DEFAULT 0.00,
  `height` float(6,2) DEFAULT 0.00,
  `unit` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_paper_format`
--

LOCK TABLES `llxas_c_paper_format` WRITE;
/*!40000 ALTER TABLE `llxas_c_paper_format` DISABLE KEYS */;
INSERT INTO `llxas_c_paper_format` (`rowid`, `code`, `label`, `width`, `height`, `unit`, `active`, `module`) VALUES (1,'EU4A0','Format 4A0',1682.00,2378.00,'mm',1,NULL),(2,'EU2A0','Format 2A0',1189.00,1682.00,'mm',1,NULL),(3,'EUA0','Format A0',840.00,1189.00,'mm',1,NULL),(4,'EUA1','Format A1',594.00,840.00,'mm',1,NULL),(5,'EUA2','Format A2',420.00,594.00,'mm',1,NULL),(6,'EUA3','Format A3',297.00,420.00,'mm',1,NULL),(7,'EUA4','Format A4',210.00,297.00,'mm',1,NULL),(8,'EUA5','Format A5',148.00,210.00,'mm',1,NULL),(9,'EUA6','Format A6',105.00,148.00,'mm',1,NULL),(100,'USLetter','Format Letter (A)',216.00,279.00,'mm',1,NULL),(105,'USLegal','Format Legal',216.00,356.00,'mm',1,NULL),(110,'USExecutive','Format Executive',190.00,254.00,'mm',1,NULL),(115,'USLedger','Format Ledger/Tabloid (B)',279.00,432.00,'mm',1,NULL),(200,'CAP1','Format Canadian P1',560.00,860.00,'mm',1,NULL),(205,'CAP2','Format Canadian P2',430.00,560.00,'mm',1,NULL),(210,'CAP3','Format Canadian P3',280.00,430.00,'mm',1,NULL),(215,'CAP4','Format Canadian P4',215.00,280.00,'mm',1,NULL),(220,'CAP5','Format Canadian P5',140.00,215.00,'mm',1,NULL),(225,'CAP6','Format Canadian P6',107.00,140.00,'mm',1,NULL);
/*!40000 ALTER TABLE `llxas_c_paper_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_partnership_type`
--

DROP TABLE IF EXISTS `llxas_c_partnership_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_partnership_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_partnership_type`
--

LOCK TABLES `llxas_c_partnership_type` WRITE;
/*!40000 ALTER TABLE `llxas_c_partnership_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_partnership_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_payment_term`
--

DROP TABLE IF EXISTS `llxas_c_payment_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_payment_term` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libelle_facture` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_cdr` tinyint(4) DEFAULT NULL,
  `nbjour` smallint(6) DEFAULT NULL,
  `decalage` smallint(6) DEFAULT NULL,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_payment_term_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_payment_term`
--

LOCK TABLES `llxas_c_payment_term` WRITE;
/*!40000 ALTER TABLE `llxas_c_payment_term` DISABLE KEYS */;
INSERT INTO `llxas_c_payment_term` (`rowid`, `entity`, `code`, `sortorder`, `active`, `libelle`, `libelle_facture`, `type_cdr`, `nbjour`, `decalage`, `module`, `position`) VALUES (1,1,'RECEP',1,1,'Due upon receipt','Due upon receipt',0,1,NULL,NULL,0),(2,1,'30D',2,1,'30 days','Due in 30 days',0,30,NULL,NULL,0),(3,1,'30DENDMONTH',3,1,'30 days end of month','Due in 30 days, end of month',1,30,NULL,NULL,0),(4,1,'60D',4,1,'60 days','Due in 60 days, end of month',0,60,NULL,NULL,0),(5,1,'60DENDMONTH',5,1,'60 days end of month','Due in 60 days, end of month',1,60,NULL,NULL,0),(6,1,'PT_ORDER',6,1,'Due on order','Due on order',0,1,NULL,NULL,0),(7,1,'PT_DELIVERY',7,1,'Due on delivery','Due on delivery',0,1,NULL,NULL,0),(8,1,'PT_5050',8,1,'50 and 50','50% on order, 50% on delivery',0,1,NULL,NULL,0),(9,1,'10D',9,1,'10 days','Due in 10 days',0,10,NULL,NULL,0),(10,1,'10DENDMONTH',10,1,'10 days end of month','Due in 10 days, end of month',1,10,NULL,NULL,0),(11,1,'14D',11,1,'14 days','Due in 14 days',0,14,NULL,NULL,0),(12,1,'14DENDMONTH',12,1,'14 days end of month','Due in 14 days, end of month',1,14,NULL,NULL,0);
/*!40000 ALTER TABLE `llxas_c_payment_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_price_expression`
--

DROP TABLE IF EXISTS `llxas_c_price_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_price_expression` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expression` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_price_expression`
--

LOCK TABLES `llxas_c_price_expression` WRITE;
/*!40000 ALTER TABLE `llxas_c_price_expression` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_price_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_price_global_variable`
--

DROP TABLE IF EXISTS `llxas_c_price_global_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_price_global_variable` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_price_global_variable`
--

LOCK TABLES `llxas_c_price_global_variable` WRITE;
/*!40000 ALTER TABLE `llxas_c_price_global_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_price_global_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_price_global_variable_updater`
--

DROP TABLE IF EXISTS `llxas_c_price_global_variable_updater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_price_global_variable_updater` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_variable` int(11) NOT NULL,
  `update_interval` int(11) DEFAULT 0,
  `next_update` int(11) DEFAULT 0,
  `last_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_price_global_variable_updater`
--

LOCK TABLES `llxas_c_price_global_variable_updater` WRITE;
/*!40000 ALTER TABLE `llxas_c_price_global_variable_updater` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_price_global_variable_updater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_product_nature`
--

DROP TABLE IF EXISTS `llxas_c_product_nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_product_nature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` tinyint(4) NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_product_nature` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_product_nature`
--

LOCK TABLES `llxas_c_product_nature` WRITE;
/*!40000 ALTER TABLE `llxas_c_product_nature` DISABLE KEYS */;
INSERT INTO `llxas_c_product_nature` (`rowid`, `code`, `label`, `active`) VALUES (1,0,'RowMaterial',1),(2,1,'Finished',1);
/*!40000 ALTER TABLE `llxas_c_product_nature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_productbatch_qcstatus`
--

DROP TABLE IF EXISTS `llxas_c_productbatch_qcstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_productbatch_qcstatus` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_productbatch_qcstatus` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_productbatch_qcstatus`
--

LOCK TABLES `llxas_c_productbatch_qcstatus` WRITE;
/*!40000 ALTER TABLE `llxas_c_productbatch_qcstatus` DISABLE KEYS */;
INSERT INTO `llxas_c_productbatch_qcstatus` (`rowid`, `entity`, `code`, `label`, `active`) VALUES (1,1,'OK','InWorkingOrder',1),(2,1,'KO','OutOfOrder',1);
/*!40000 ALTER TABLE `llxas_c_productbatch_qcstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_propalst`
--

DROP TABLE IF EXISTS `llxas_c_propalst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_propalst` (
  `id` smallint(6) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_propalst` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_propalst`
--

LOCK TABLES `llxas_c_propalst` WRITE;
/*!40000 ALTER TABLE `llxas_c_propalst` DISABLE KEYS */;
INSERT INTO `llxas_c_propalst` (`id`, `code`, `label`, `active`) VALUES (0,'PR_DRAFT','Brouillon',1),(1,'PR_OPEN','Ouverte',1),(2,'PR_SIGNED','Signée',1),(3,'PR_NOTSIGNED','Non Signée',1),(4,'PR_FAC','Facturée',1);
/*!40000 ALTER TABLE `llxas_c_propalst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_prospectcontactlevel`
--

DROP TABLE IF EXISTS `llxas_c_prospectcontactlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_prospectcontactlevel` (
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_prospectcontactlevel`
--

LOCK TABLES `llxas_c_prospectcontactlevel` WRITE;
/*!40000 ALTER TABLE `llxas_c_prospectcontactlevel` DISABLE KEYS */;
INSERT INTO `llxas_c_prospectcontactlevel` (`code`, `label`, `sortorder`, `active`, `module`) VALUES ('PL_HIGH','High',4,1,NULL),('PL_LOW','Low',2,1,NULL),('PL_MEDIUM','Medium',3,1,NULL),('PL_NONE','None',1,1,NULL);
/*!40000 ALTER TABLE `llxas_c_prospectcontactlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_prospectlevel`
--

DROP TABLE IF EXISTS `llxas_c_prospectlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_prospectlevel` (
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_prospectlevel`
--

LOCK TABLES `llxas_c_prospectlevel` WRITE;
/*!40000 ALTER TABLE `llxas_c_prospectlevel` DISABLE KEYS */;
INSERT INTO `llxas_c_prospectlevel` (`code`, `label`, `sortorder`, `active`, `module`) VALUES ('PL_HIGH','High',4,1,NULL),('PL_LOW','Low',2,1,NULL),('PL_MEDIUM','Medium',3,1,NULL),('PL_NONE','None',1,1,NULL);
/*!40000 ALTER TABLE `llxas_c_prospectlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_recruitment_origin`
--

DROP TABLE IF EXISTS `llxas_c_recruitment_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_recruitment_origin` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_recruitment_origin`
--

LOCK TABLES `llxas_c_recruitment_origin` WRITE;
/*!40000 ALTER TABLE `llxas_c_recruitment_origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_recruitment_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_regions`
--

DROP TABLE IF EXISTS `llxas_c_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_regions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_region` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `cheflieu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code_region` (`code_region`),
  KEY `idx_c_regions_fk_pays` (`fk_pays`),
  CONSTRAINT `fk_c_regions_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llxas_c_country` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_regions`
--

LOCK TABLES `llxas_c_regions` WRITE;
/*!40000 ALTER TABLE `llxas_c_regions` DISABLE KEYS */;
INSERT INTO `llxas_c_regions` (`rowid`, `code_region`, `fk_pays`, `cheflieu`, `tncc`, `nom`, `active`) VALUES (1,0,0,'0',0,'-',1),(2,1,1,'97105',3,'Guadeloupe',1),(3,2,1,'97209',3,'Martinique',1),(4,3,1,'97302',3,'Guyane',1),(5,4,1,'97411',3,'Réunion',1),(6,6,1,'97601',3,'Mayotte',1),(7,11,1,'75056',1,'Île-de-France',1),(8,24,1,'45234',2,'Centre-Val de Loire',1),(9,27,1,'21231',0,'Bourgogne-Franche-Comté',1),(10,28,1,'76540',0,'Normandie',1),(11,32,1,'59350',4,'Hauts-de-France',1),(12,44,1,'67482',2,'Grand Est',1),(13,52,1,'44109',4,'Pays de la Loire',1),(14,53,1,'35238',0,'Bretagne',1),(15,75,1,'33063',0,'Nouvelle-Aquitaine',1),(16,76,1,'31355',1,'Occitanie',1),(17,84,1,'69123',1,'Auvergne-Rhône-Alpes',1),(18,93,1,'13055',0,'Provence-Alpes-Côte d\'Azur',1),(19,94,1,'2A004',0,'Corse',1),(20,4101,41,'',0,'Österreich',1),(21,201,2,'',1,'Flandre',1),(22,202,2,'',2,'Wallonie',1),(23,203,2,'',3,'Bruxelles-Capitale',1),(24,301,3,NULL,1,'Abruzzo',1),(25,302,3,NULL,1,'Basilicata',1),(26,303,3,NULL,1,'Calabria',1),(27,304,3,NULL,1,'Campania',1),(28,305,3,NULL,1,'Emilia-Romagna',1),(29,306,3,NULL,1,'Friuli-Venezia Giulia',1),(30,307,3,NULL,1,'Lazio',1),(31,308,3,NULL,1,'Liguria',1),(32,309,3,NULL,1,'Lombardia',1),(33,310,3,NULL,1,'Marche',1),(34,311,3,NULL,1,'Molise',1),(35,312,3,NULL,1,'Piemonte',1),(36,313,3,NULL,1,'Puglia',1),(37,314,3,NULL,1,'Sardegna',1),(38,315,3,NULL,1,'Sicilia',1),(39,316,3,NULL,1,'Toscana',1),(40,317,3,NULL,1,'Trentino-Alto Adige',1),(41,318,3,NULL,1,'Umbria',1),(42,319,3,NULL,1,'Valle d Aosta',1),(43,320,3,NULL,1,'Veneto',1),(44,401,4,'',0,'Andalucia',1),(45,402,4,'',0,'Aragón',1),(46,403,4,'',0,'Castilla y León',1),(47,404,4,'',0,'Castilla la Mancha',1),(48,405,4,'',0,'Canarias',1),(49,406,4,'',0,'Cataluña',1),(50,407,4,'',0,'Comunidad de Ceuta',1),(51,408,4,'',0,'Comunidad Foral de Navarra',1),(52,409,4,'',0,'Comunidad de Melilla',1),(53,410,4,'',0,'Cantabria',1),(54,411,4,'',0,'Comunidad Valenciana',1),(55,412,4,'',0,'Extemadura',1),(56,413,4,'',0,'Galicia',1),(57,414,4,'',0,'Islas Baleares',1),(58,415,4,'',0,'La Rioja',1),(59,416,4,'',0,'Comunidad de Madrid',1),(60,417,4,'',0,'Región de Murcia',1),(61,418,4,'',0,'Principado de Asturias',1),(62,419,4,'',0,'Pais Vasco',1),(63,420,4,'',0,'Otros',1),(64,501,5,'',0,'Deutschland',1),(65,10201,102,NULL,NULL,'Αττική',1),(66,10202,102,NULL,NULL,'Στερεά Ελλάδα',1),(67,10203,102,NULL,NULL,'Κεντρική Μακεδονία',1),(68,10204,102,NULL,NULL,'Κρήτη',1),(69,10205,102,NULL,NULL,'Ανατολική Μακεδονία και Θράκη',1),(70,10206,102,NULL,NULL,'Ήπειρος',1),(71,10207,102,NULL,NULL,'Ιόνια νησιά',1),(72,10208,102,NULL,NULL,'Βόρειο Αιγαίο',1),(73,10209,102,NULL,NULL,'Πελοπόννησος',1),(74,10210,102,NULL,NULL,'Νότιο Αιγαίο',1),(75,10211,102,NULL,NULL,'Δυτική Ελλάδα',1),(76,10212,102,NULL,NULL,'Θεσσαλία',1),(77,10213,102,NULL,NULL,'Δυτική Μακεδονία',1),(78,601,6,'',1,'Cantons',1),(79,701,7,'',0,'England',1),(80,702,7,'',0,'Wales',1),(81,703,7,'',0,'Scotland',1),(82,704,7,'',0,'Northern Ireland',1),(83,1001,10,'',0,'Ariana',1),(84,1002,10,'',0,'Béja',1),(85,1003,10,'',0,'Ben Arous',1),(86,1004,10,'',0,'Bizerte',1),(87,1005,10,'',0,'Gabès',1),(88,1006,10,'',0,'Gafsa',1),(89,1007,10,'',0,'Jendouba',1),(90,1008,10,'',0,'Kairouan',1),(91,1009,10,'',0,'Kasserine',1),(92,1010,10,'',0,'Kébili',1),(93,1011,10,'',0,'La Manouba',1),(94,1012,10,'',0,'Le Kef',1),(95,1013,10,'',0,'Mahdia',1),(96,1014,10,'',0,'Médenine',1),(97,1015,10,'',0,'Monastir',1),(98,1016,10,'',0,'Nabeul',1),(99,1017,10,'',0,'Sfax',1),(100,1018,10,'',0,'Sidi Bouzid',1),(101,1019,10,'',0,'Siliana',1),(102,1020,10,'',0,'Sousse',1),(103,1021,10,'',0,'Tataouine',1),(104,1022,10,'',0,'Tozeur',1),(105,1023,10,'',0,'Tunis',1),(106,1024,10,'',0,'Zaghouan',1),(107,1101,11,'',0,'United-States',1),(108,1301,13,'',0,'Algerie',1),(109,1401,14,'',0,'Canada',1),(110,1701,17,'',0,'Provincies van Nederland ',1),(111,2301,23,'',0,'Norte',1),(112,2302,23,'',0,'Litoral',1),(113,2303,23,'',0,'Cuyana',1),(114,2304,23,'',0,'Central',1),(115,2305,23,'',0,'Patagonia',1),(116,2801,28,'',0,'Australia',1),(117,4601,46,'',0,'Barbados',1),(118,5201,52,'',0,'Chuquisaca',1),(119,5202,52,'',0,'La Paz',1),(120,5203,52,'',0,'Cochabamba',1),(121,5204,52,'',0,'Oruro',1),(122,5205,52,'',0,'Potosí',1),(123,5206,52,'',0,'Tarija',1),(124,5207,52,'',0,'Santa Cruz',1),(125,5208,52,'',0,'El Beni',1),(126,5209,52,'',0,'Pando',1),(127,5601,56,'',0,'Brasil',1),(128,7001,70,'',0,'Colombie',1),(129,6701,67,NULL,NULL,'Tarapacá',1),(130,6702,67,NULL,NULL,'Antofagasta',1),(131,6703,67,NULL,NULL,'Atacama',1),(132,6704,67,NULL,NULL,'Coquimbo',1),(133,6705,67,NULL,NULL,'Valparaíso',1),(134,6706,67,NULL,NULL,'General Bernardo O Higgins',1),(135,6707,67,NULL,NULL,'Maule',1),(136,6708,67,NULL,NULL,'Biobío',1),(137,6709,67,NULL,NULL,'Raucanía',1),(138,6710,67,NULL,NULL,'Los Lagos',1),(139,6711,67,NULL,NULL,'Aysén General Carlos Ibáñez del Campo',1),(140,6712,67,NULL,NULL,'Magallanes y Antártica Chilena',1),(141,6713,67,NULL,NULL,'Metropolitana de Santiago',1),(142,6714,67,NULL,NULL,'Los Ríos',1),(143,6715,67,NULL,NULL,'Arica y Parinacota',1),(144,8601,86,NULL,NULL,'Central',1),(145,8602,86,NULL,NULL,'Oriental',1),(146,8603,86,NULL,NULL,'Occidental',1),(147,11401,114,'',0,'Honduras',1),(148,11701,117,'',0,'India',1),(149,11801,118,'',0,'Indonesia',1),(150,1201,12,'',0,'Tanger-Tétouan',1),(151,1202,12,'',0,'Gharb-Chrarda-Beni Hssen',1),(152,1203,12,'',0,'Taza-Al Hoceima-Taounate',1),(153,1204,12,'',0,'L\'Oriental',1),(154,1205,12,'',0,'Fès-Boulemane',1),(155,1206,12,'',0,'Meknès-Tafialet',1),(156,1207,12,'',0,'Rabat-Salé-Zemour-Zaër',1),(157,1208,12,'',0,'Grand Cassablanca',1),(158,1209,12,'',0,'Chaouia-Ouardigha',1),(159,1210,12,'',0,'Doukahla-Adba',1),(160,1211,12,'',0,'Marrakech-Tensift-Al Haouz',1),(161,1212,12,'',0,'Tadla-Azilal',1),(162,1213,12,'',0,'Sous-Massa-Drâa',1),(163,1214,12,'',0,'Guelmim-Es Smara',1),(164,1215,12,'',0,'Laâyoune-Boujdour-Sakia el Hamra',1),(165,1216,12,'',0,'Oued Ed-Dahab Lagouira',1),(166,14001,140,'',0,'Diekirch',1),(167,14002,140,'',0,'Grevenmacher',1),(168,14003,140,'',0,'Luxembourg',1),(169,15201,152,'',0,'Rivière Noire',1),(170,15202,152,'',0,'Flacq',1),(171,15203,152,'',0,'Grand Port',1),(172,15204,152,'',0,'Moka',1),(173,15205,152,'',0,'Pamplemousses',1),(174,15206,152,'',0,'Plaines Wilhems',1),(175,15207,152,'',0,'Port-Louis',1),(176,15208,152,'',0,'Rivière du Rempart',1),(177,15209,152,'',0,'Savanne',1),(178,15210,152,'',0,'Rodrigues',1),(179,15211,152,'',0,'Les îles Agaléga',1),(180,15212,152,'',0,'Les écueils des Cargados Carajos',1),(181,15401,154,'',0,'Mexique',1),(182,18801,188,'',0,'Romania',1),(183,23201,232,'',0,'Los Andes',1),(184,23202,232,'',0,'Capital',1),(185,23203,232,'',0,'Central',1),(186,23204,232,'',0,'Cento Occidental',1),(187,23205,232,'',0,'Guayana',1),(188,23206,232,'',0,'Insular',1),(189,23207,232,'',0,'Los Llanos',1),(190,23208,232,'',0,'Nor-Oriental',1),(191,23209,232,'',0,'Zuliana',1),(192,18101,181,'',0,'Amazonas',1),(193,18102,181,'',0,'Ancash',1),(194,18103,181,'',0,'Apurimac',1),(195,18104,181,'',0,'Arequipa',1),(196,18105,181,'',0,'Ayacucho',1),(197,18106,181,'',0,'Cajamarca',1),(198,18107,181,'',0,'Callao',1),(199,18108,181,'',0,'Cuzco',1),(200,18109,181,'',0,'Huancavelica',1),(201,18110,181,'',0,'Huanuco',1),(202,18111,181,'',0,'Ica',1),(203,18112,181,'',0,'Junin',1),(204,18113,181,'',0,'La Libertad',1),(205,18114,181,'',0,'Lambayeque',1),(206,18115,181,'',0,'Lima Metropolitana',1),(207,18116,181,'',0,'Lima',1),(208,18117,181,'',0,'Loreto',1),(209,18118,181,'',0,'Madre de Dios',1),(210,18119,181,'',0,'Moquegua',1),(211,18120,181,'',0,'Pasco',1),(212,18121,181,'',0,'Piura',1),(213,18122,181,'',0,'Puno',1),(214,18123,181,'',0,'San Martín',1),(215,18124,181,'',0,'Tacna',1),(216,18125,181,'',0,'Tumbes',1),(217,18126,181,'',0,'Ucayali',1),(218,17801,178,'',0,'Panama',1),(219,22701,227,'',0,'United Arab Emirates',1),(220,34000,34,'AD',NULL,'Andorra',1),(221,183100,18,'HU31',NULL,'Northern Hungary',1),(222,183200,18,'HU32',NULL,'Northern Great Plain',1),(223,183300,18,'HU33',NULL,'Southern Great Plain',1),(224,180100,18,'HU1',NULL,'Central Hungary',1),(225,182100,18,'HU21',NULL,'Central Transdanubia',1),(226,182200,18,'HU22',NULL,'Western Transdanubia',1),(227,182300,18,'HU23',NULL,'Southern Transdanubia',1),(228,15001,25,'PT',NULL,'Portugal',1),(229,15002,25,'PT9',NULL,'Azores-Madeira',1),(230,20203,202,'SI03',NULL,'East Slovenia',1),(231,20204,202,'SI04',NULL,'West Slovenia',1),(232,901,9,'京',0,'北京市',1),(233,902,9,'津',0,'天津市',1),(234,903,9,'沪',0,'上海市',1),(235,904,9,'渝',0,'重庆市',1),(236,905,9,'冀',0,'河北省',1),(237,906,9,'晋',0,'山西省',1),(238,907,9,'辽',0,'辽宁省',1),(239,908,9,'吉',0,'吉林省',1),(240,909,9,'黑',0,'黑龙江省',1),(241,910,9,'苏',0,'江苏省',1),(242,911,9,'浙',0,'浙江省',1),(243,912,9,'皖',0,'安徽省',1),(244,913,9,'闽',0,'福建省',1),(245,914,9,'赣',0,'江西省',1),(246,915,9,'鲁',0,'山东省',1),(247,916,9,'豫',0,'河南省',1),(248,917,9,'鄂',0,'湖北省',1),(249,918,9,'湘',0,'湖南省',1),(250,919,9,'粤',0,'广东省',1),(251,920,9,'琼',0,'海南省',1),(252,921,9,'川',0,'四川省',1),(253,922,9,'贵',0,'贵州省',1),(254,923,9,'云',0,'云南省',1),(255,924,9,'陕',0,'陕西省',1),(256,925,9,'甘',0,'甘肃省',1),(257,926,9,'青',0,'青海省',1),(258,927,9,'台',0,'台湾省',1),(259,928,9,'蒙',0,'内蒙古自治区',1),(260,929,9,'桂',0,'广西壮族自治区',1),(261,930,9,'藏',0,'西藏自治区',1),(262,931,9,'宁',0,'宁夏回族自治区',1),(263,932,9,'新',0,'新疆维吾尔自治区',1),(264,933,9,'港',0,'香港特别行政区',1),(265,934,9,'澳',0,'澳门特别行政区',1),(266,35001,35,'AO',NULL,'Angola',1);
/*!40000 ALTER TABLE `llxas_c_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_revenuestamp`
--

DROP TABLE IF EXISTS `llxas_c_revenuestamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_revenuestamp` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pays` int(11) NOT NULL,
  `taux` double NOT NULL,
  `revenuestamp_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `note` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=1543 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_revenuestamp`
--

LOCK TABLES `llxas_c_revenuestamp` WRITE;
/*!40000 ALTER TABLE `llxas_c_revenuestamp` DISABLE KEYS */;
INSERT INTO `llxas_c_revenuestamp` (`rowid`, `fk_pays`, `taux`, `revenuestamp_type`, `note`, `active`, `accountancy_code_sell`, `accountancy_code_buy`) VALUES (101,10,0.4,'fixed','Revenue stamp tunisia',1,NULL,NULL),(1541,154,1.5,'percent','Revenue stamp mexico',1,NULL,NULL),(1542,154,3,'percent','Revenue stamp mexico',1,NULL,NULL);
/*!40000 ALTER TABLE `llxas_c_revenuestamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_shipment_mode`
--

DROP TABLE IF EXISTS `llxas_c_shipment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_shipment_mode` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_shipment_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_shipment_mode`
--

LOCK TABLES `llxas_c_shipment_mode` WRITE;
/*!40000 ALTER TABLE `llxas_c_shipment_mode` DISABLE KEYS */;
INSERT INTO `llxas_c_shipment_mode` (`rowid`, `entity`, `tms`, `code`, `libelle`, `description`, `tracking`, `active`, `module`) VALUES (1,1,'2021-11-10 17:54:37','CATCH','In-Store Collection','In-store collection by the customer','',1,NULL),(2,1,'2021-11-10 17:54:37','TRANS','Generic transport service','Generic transport service','',1,NULL),(3,1,'2021-11-10 17:54:37','COLSUI','Colissimo Suivi','Colissimo Suivi','https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}',0,NULL),(4,1,'2021-11-10 17:54:37','LETTREMAX','Lettre Max','Courrier Suivi et Lettre Max','https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}',0,NULL),(5,1,'2021-11-10 17:54:37','UPS','UPS','United Parcel Service','http://wwwapps.ups.com/etracking/tracking.cgi?InquiryNumber2=&InquiryNumber3=&tracknums_displayed=3&loc=fr_FR&TypeOfInquiryNumber=T&HTMLVersion=4.0&InquiryNumber22=&InquiryNumber32=&track=Track&Suivi.x=64&Suivi.y=7&Suivi=Valider&InquiryNumber1={TRACKID}',1,NULL),(6,1,'2021-11-10 17:54:37','KIALA','KIALA','Relais Kiala','http://www.kiala.fr/tnt/delivery/{TRACKID}',0,NULL),(7,1,'2021-11-10 17:54:37','GLS','GLS','General Logistics Systems','https://gls-group.eu/FR/fr/suivi-colis?match={TRACKID}',0,NULL),(8,1,'2021-11-10 17:54:37','CHRONO','Chronopost','Chronopost','http://www.chronopost.fr/expedier/inputLTNumbersNoJahia.do?listeNumeros={TRACKID}',0,NULL),(9,1,'2021-11-10 17:54:37','INPERSON','In person at your site',NULL,NULL,0,NULL),(10,1,'2021-11-10 17:54:37','FEDEX','Fedex',NULL,'https://www.fedex.com/apps/fedextrack/index.html?tracknumbers={TRACKID}',0,NULL),(11,1,'2021-11-10 17:54:37','TNT','TNT',NULL,'https://www.tnt.com/express/fr_fr/site/outils-expedition/suivi.html?searchType=con&cons=={TRACKID}',0,NULL),(12,1,'2021-11-10 17:54:37','DHL','DHL',NULL,'https://www.dhl.com/fr-fr/home/tracking/tracking-global-forwarding.html?submit=1&tracking-id={TRACKID}',0,NULL),(13,1,'2021-11-10 17:54:37','DPD','DPD',NULL,'https://www.dpd.fr/trace/{TRACKID}',0,NULL),(14,1,'2021-11-10 17:54:37','MAINFREIGHT','Mainfreight',NULL,'https://www.mainfreight.com/track?{TRACKID}',0,NULL);
/*!40000 ALTER TABLE `llxas_c_shipment_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_shipment_package_type`
--

DROP TABLE IF EXISTS `llxas_c_shipment_package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_shipment_package_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_shipment_package_type`
--

LOCK TABLES `llxas_c_shipment_package_type` WRITE;
/*!40000 ALTER TABLE `llxas_c_shipment_package_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_shipment_package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_socialnetworks`
--

DROP TABLE IF EXISTS `llxas_c_socialnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_socialnetworks` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_socialnetworks_code_entity` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_socialnetworks`
--

LOCK TABLES `llxas_c_socialnetworks` WRITE;
/*!40000 ALTER TABLE `llxas_c_socialnetworks` DISABLE KEYS */;
INSERT INTO `llxas_c_socialnetworks` (`rowid`, `entity`, `code`, `label`, `url`, `icon`, `active`) VALUES (1,1,'facebook','Facebook','https://www.facebook.com/{socialid}','fa-facebook',1),(2,1,'skype','Skype','https://www.skype.com/{socialid}','fa-skype',1),(3,1,'twitter','Twitter','https://www.twitter.com/{socialid}','fa-twitter',1),(4,1,'linkedin','LinkedIn','https://www.linkedin.com/{socialid}','fa-linkedin',1),(5,1,'instagram','Instagram','https://www.instagram.com/{socialid}','fa-instagram',1),(6,1,'snapchat','Snapchat','{socialid}','fa-snapchat',1),(7,1,'googleplus','GooglePlus','https://www.googleplus.com/{socialid}','fa-google-plus-g',0),(8,1,'youtube','Youtube','https://www.youtube.com/{socialid}','fa-youtube',1),(9,1,'whatsapp','Whatsapp','{socialid}','fa-whatsapp',1),(10,1,'tumblr','Tumblr','https://www.tumblr.com/{socialid}','fa-tumblr',0),(11,1,'vero','Vero','https://vero.co/{socialid}','',0),(12,1,'viadeo','Viadeo','https://fr.viadeo.com/fr/{socialid}','fa-viadeo',0),(13,1,'slack','Slack','{socialid}','fa-slack',0),(14,1,'xing','Xing','{socialid}','fa-xing',0),(15,1,'meetup','Meetup','{socialid}','fa-meetup',0),(16,1,'pinterest','Pinterest','{socialid}','fa-pinterest',0),(17,1,'flickr','Flickr','{socialid}','fa-flickr',0),(18,1,'500px','500px','{socialid}','fa-500px',0),(19,1,'giphy','Giphy','{socialid}','',0),(20,1,'gifycat','Gificat','{socialid}','',0),(21,1,'dailymotion','Dailymotion','{socialid}','',0),(22,1,'vimeo','Vimeo','{socialid}','',0),(23,1,'periscope','Periscope','{socialid}','',0),(24,1,'twitch','Twitch','{socialid}','',0),(25,1,'discord','Discord','{socialid}','fa-discord',0),(26,1,'wikipedia','Wikipedia','{socialid}','',0),(27,1,'reddit','Reddit','{socialid}','fa-reddit',0),(28,1,'quora','Quora','{socialid}','',0),(29,1,'tripadvisor','Tripadvisor','{socialid}','',0),(30,1,'mastodon','Mastodon','{socialid}','',0),(31,1,'diaspora','Diaspora','{socialid}','',0),(32,1,'viber','Viber','{socialid}','',0);
/*!40000 ALTER TABLE `llxas_c_socialnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_stcomm`
--

DROP TABLE IF EXISTS `llxas_c_stcomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_stcomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picto` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_stcomm`
--

LOCK TABLES `llxas_c_stcomm` WRITE;
/*!40000 ALTER TABLE `llxas_c_stcomm` DISABLE KEYS */;
INSERT INTO `llxas_c_stcomm` (`id`, `code`, `libelle`, `picto`, `active`) VALUES (-1,'ST_NO','Do not contact',NULL,1),(0,'ST_NEVER','Never contacted',NULL,1),(1,'ST_TODO','To contact',NULL,1),(2,'ST_PEND','Contact in progress',NULL,1),(3,'ST_DONE','Contacted',NULL,1);
/*!40000 ALTER TABLE `llxas_c_stcomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_stcommcontact`
--

DROP TABLE IF EXISTS `llxas_c_stcommcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_stcommcontact` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picto` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcommcontact` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_stcommcontact`
--

LOCK TABLES `llxas_c_stcommcontact` WRITE;
/*!40000 ALTER TABLE `llxas_c_stcommcontact` DISABLE KEYS */;
INSERT INTO `llxas_c_stcommcontact` (`id`, `code`, `libelle`, `picto`, `active`) VALUES (-1,'ST_NO','Do not contact',NULL,1),(0,'ST_NEVER','Never contacted',NULL,1),(1,'ST_TODO','To contact',NULL,1),(2,'ST_PEND','Contact in progress',NULL,1),(3,'ST_DONE','Contacted',NULL,1);
/*!40000 ALTER TABLE `llxas_c_stcommcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_ticket_category`
--

DROP TABLE IF EXISTS `llxas_c_ticket_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_ticket_category` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `force_severity` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_ticket_category`
--

LOCK TABLES `llxas_c_ticket_category` WRITE;
/*!40000 ALTER TABLE `llxas_c_ticket_category` DISABLE KEYS */;
INSERT INTO `llxas_c_ticket_category` (`rowid`, `entity`, `code`, `pos`, `label`, `active`, `use_default`, `fk_parent`, `force_severity`, `description`, `public`) VALUES (1,1,'OTHER',10,'Other',1,1,0,NULL,NULL,0);
/*!40000 ALTER TABLE `llxas_c_ticket_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_ticket_resolution`
--

DROP TABLE IF EXISTS `llxas_c_ticket_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_ticket_resolution` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_ticket_resolution`
--

LOCK TABLES `llxas_c_ticket_resolution` WRITE;
/*!40000 ALTER TABLE `llxas_c_ticket_resolution` DISABLE KEYS */;
INSERT INTO `llxas_c_ticket_resolution` (`rowid`, `entity`, `code`, `pos`, `label`, `active`, `use_default`, `description`) VALUES (1,1,'SOLVED','10','Solved',1,0,NULL),(2,1,'CANCELED','50','Canceled',1,0,NULL),(3,1,'OTHER','90','Other',1,0,NULL);
/*!40000 ALTER TABLE `llxas_c_ticket_resolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_ticket_severity`
--

DROP TABLE IF EXISTS `llxas_c_ticket_severity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_ticket_severity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_ticket_severity`
--

LOCK TABLES `llxas_c_ticket_severity` WRITE;
/*!40000 ALTER TABLE `llxas_c_ticket_severity` DISABLE KEYS */;
INSERT INTO `llxas_c_ticket_severity` (`rowid`, `entity`, `code`, `pos`, `label`, `color`, `active`, `use_default`, `description`) VALUES (1,1,'LOW','10','Low','',1,0,NULL),(2,1,'NORMAL','20','Normal','',1,1,NULL),(3,1,'HIGH','30','High','',1,0,NULL),(4,1,'BLOCKING','40','Critical / blocking','',1,0,NULL);
/*!40000 ALTER TABLE `llxas_c_ticket_severity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_ticket_type`
--

DROP TABLE IF EXISTS `llxas_c_ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_ticket_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_ticket_type`
--

LOCK TABLES `llxas_c_ticket_type` WRITE;
/*!40000 ALTER TABLE `llxas_c_ticket_type` DISABLE KEYS */;
INSERT INTO `llxas_c_ticket_type` (`rowid`, `entity`, `code`, `pos`, `label`, `active`, `use_default`, `description`) VALUES (1,1,'COM','10','Commercial question',1,0,NULL),(2,1,'HELP','15','Request for functionnal help',1,0,NULL),(3,1,'ISSUE','20','Issue or bug',1,0,NULL),(4,1,'REQUEST','25','Change or enhancement request',1,0,NULL),(5,1,'PROJECT','30','Project',0,0,NULL),(6,1,'OTHER','40','Other',1,0,NULL),(7,1,'PROBLEM','22','Problem',0,0,NULL);
/*!40000 ALTER TABLE `llxas_c_ticket_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_transport_mode`
--

DROP TABLE IF EXISTS `llxas_c_transport_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_transport_mode` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_transport_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_transport_mode`
--

LOCK TABLES `llxas_c_transport_mode` WRITE;
/*!40000 ALTER TABLE `llxas_c_transport_mode` DISABLE KEYS */;
INSERT INTO `llxas_c_transport_mode` (`rowid`, `entity`, `code`, `label`, `active`) VALUES (1,1,'MAR','Transport maritime (y compris camions ou wagons sur bateau)',1),(2,1,'TRA','Transport par chemin de fer (y compris camions sur wagon)',1),(3,1,'ROU','Transport par route',1),(4,1,'AIR','Transport par air',1),(5,1,'POS','Envois postaux',1),(6,1,'OLE','Installations de transport fixe (oléoduc)',1),(7,1,'NAV','Transport par navigation intérieure',1),(8,1,'PRO','Propulsion propre',1);
/*!40000 ALTER TABLE `llxas_c_transport_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_tva`
--

DROP TABLE IF EXISTS `llxas_c_tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_tva` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pays` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `taux` double NOT NULL,
  `localtax1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `note` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_tva_id` (`fk_pays`,`code`,`taux`,`recuperableonly`)
) ENGINE=InnoDB AUTO_INCREMENT=2462 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_tva`
--

LOCK TABLES `llxas_c_tva` WRITE;
/*!40000 ALTER TABLE `llxas_c_tva` DISABLE KEYS */;
INSERT INTO `llxas_c_tva` (`rowid`, `fk_pays`, `code`, `taux`, `localtax1`, `localtax1_type`, `localtax2`, `localtax2_type`, `recuperableonly`, `note`, `active`, `accountancy_code_sell`, `accountancy_code_buy`) VALUES (11,1,'',0,'0','0','0','0',0,'VAT Rate 0 ou non applicable',1,NULL,NULL),(12,1,'',20,'0','0','0','0',0,'VAT standard rate (France hors DOM-TOM)',1,NULL,NULL),(13,1,'',10,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(14,1,'',5.5,'0','0','0','0',0,'VAT reduced rate (France hors DOM-TOM)',1,NULL,NULL),(15,1,'',2.1,'0','0','0','0',0,'VAT super-reduced rate',1,NULL,NULL),(16,1,'85',8.5,'0','0','0','0',0,'VAT standard rate (DOM sauf Guyane et Saint-Martin)',0,NULL,NULL),(17,1,'85NPR',8.5,'0','0','0','0',1,'VAT standard rate (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',0,NULL,NULL),(18,1,'85NPROM',8.5,'2','3','0','0',1,'VAT standard rate (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer',0,NULL,NULL),(19,1,'85NPROMOMR',8.5,'2','3','2.5','3',1,'VAT standard rate (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer et Octroi de Mer Regional',0,NULL,NULL),(21,2,'',0,'0','0','0','0',0,'VAT Rate 0 ou non applicable',1,NULL,NULL),(22,2,'',6,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(23,2,'',21,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(24,2,'',12,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(31,3,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(32,3,'',10,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(33,3,'',4,'0','0','0','0',0,'VAT super-reduced rate',1,NULL,NULL),(34,3,'',22,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(41,4,'',0,'0','3','-19:-15:-9','5',0,'VAT Rate 0',1,NULL,NULL),(42,4,'',10,'1.4','3','-19:-15:-9','5',0,'VAT reduced rate',1,NULL,NULL),(43,4,'',4,'0.5','3','-19:-15:-9','5',0,'VAT super-reduced rate',1,NULL,NULL),(44,4,'',21,'5.2','3','-19:-15:-9','5',0,'VAT standard rate',1,NULL,NULL),(51,5,'',0,'0','0','0','0',0,'No VAT',1,NULL,NULL),(52,5,'',7,'0','0','0','0',0,'ermäßigte USt.',1,NULL,NULL),(54,5,'',5.5,'0','0','0','0',0,'USt. Forst',0,NULL,NULL),(55,5,'',10.7,'0','0','0','0',0,'USt. Landwirtschaft',0,NULL,NULL),(56,5,'',19,'0','0','0','0',0,'allgemeine Ust.',1,NULL,NULL),(61,6,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(62,6,'',3.7,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(63,6,'',2.5,'0','0','0','0',0,'VAT super-reduced rate',1,NULL,NULL),(64,6,'',7.7,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(71,7,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(72,7,'',17.5,'0','0','0','0',0,'VAT standard rate before 2011',1,NULL,NULL),(73,7,'',5,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(74,7,'',20,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(81,8,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(82,8,'',23,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(83,8,'',13.5,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(84,8,'',9,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(85,8,'',4.8,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(91,9,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(92,9,'',13,'0','0','0','0',0,'VAT reduced rate 0',1,NULL,NULL),(93,9,'',3,'0','0','0','0',0,'VAT super reduced rate 0',1,NULL,NULL),(94,9,'',17,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(101,10,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(102,10,'',12,'0','0','0','0',0,'VAT 12%',1,NULL,NULL),(103,10,'',18,'0','0','0','0',0,'VAT 18%',1,NULL,NULL),(104,10,'',7.5,'0','0','0','0',0,'VAT 6% Majoré à 25% (7.5%)',1,NULL,NULL),(105,10,'',15,'0','0','0','0',0,'VAT 12% Majoré à 25% (15%)',1,NULL,NULL),(106,10,'',22.5,'0','0','0','0',0,'VAT 18% Majoré à 25% (22.5%)',1,NULL,NULL),(107,10,'',6,'0','0','0','0',0,'VAT 6%',1,NULL,NULL),(111,11,'',0,'0','0','0','0',0,'No Sales Tax',1,NULL,NULL),(112,11,'',4,'0','0','0','0',0,'Sales Tax 4%',1,NULL,NULL),(113,11,'',6,'0','0','0','0',0,'Sales Tax 6%',1,NULL,NULL),(121,12,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(122,12,'',14,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(123,12,'',10,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(124,12,'',7,'0','0','0','0',0,'VAT super-reduced rate',1,NULL,NULL),(125,12,'',20,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(131,13,'',0,'0','0','0','0',0,'TVA 0%',1,NULL,NULL),(132,13,'',9,'0','0','0','0',0,'TVA 9%',1,NULL,NULL),(133,13,'',19,'0','0','0','0',0,'TVA 19%',1,NULL,NULL),(141,14,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(142,14,'',7,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(143,14,'',5,'9.975','1','0','0',0,'GST/TPS and PST/TVQ rate for Province',1,NULL,NULL),(171,17,'',0,'0','0','0','0',0,'0 BTW tarief',1,NULL,NULL),(172,17,'',6,'0','0','0','0',0,'Verlaagd BTW tarief',1,NULL,NULL),(173,17,'',19,'0','0','0','0',0,'Algemeen BTW tarief',1,NULL,NULL),(174,17,'',21,'0','0','0','0',0,'Algemeen BTW tarief (vanaf 1 oktober 2012)',0,NULL,NULL),(201,20,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(202,20,'',12,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(203,20,'',6,'0','0','0','0',0,'VAT super-reduced rate',1,NULL,NULL),(204,20,'',25,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(211,21,'',0,'0','0','0','0',0,'IVA Rate 0',1,NULL,NULL),(212,21,'',18,'7.5','2','0','0',0,'IVA standard rate',1,NULL,NULL),(221,22,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(222,22,'',10,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(223,22,'',18,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(231,23,'',0,'0','0','0','0',0,'IVA Rate 0',1,NULL,NULL),(232,23,'',10.5,'0','0','0','0',0,'IVA reduced rate',1,NULL,NULL),(233,23,'',21,'0','0','0','0',0,'IVA standard rate',1,NULL,NULL),(241,24,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(242,24,'',19.25,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(251,25,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(252,25,'',13,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(253,25,'',23,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(254,25,'',6,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(261,26,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(262,26,'',5,'0','0','0','0',0,'VAT Rate 5',1,NULL,NULL),(271,27,'',0,'0','0','0','0',0,'VAT Rate 0 ou non applicable',1,NULL,NULL),(272,27,'',8.5,'0','0','0','0',0,'VAT standard rate (DOM sauf Guyane et Saint-Martin)',0,NULL,NULL),(273,27,'',8.5,'0','0','0','0',1,'VAT standard rate (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',0,NULL,NULL),(274,27,'',5.5,'0','0','0','0',0,'VAT reduced rate (France hors DOM-TOM)',0,NULL,NULL),(275,27,'',19.6,'0','0','0','0',0,'VAT standard rate (France hors DOM-TOM)',1,NULL,NULL),(276,27,'',2.1,'0','0','0','0',0,'VAT super-reduced rate',1,NULL,NULL),(277,27,'',7,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(281,28,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(282,28,'',10,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(351,35,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(352,35,'',7,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(353,35,'',14,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(411,41,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(412,41,'',10,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(413,41,'',20,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(461,46,'',0,'0','0','0','0',0,'No VAT',1,NULL,NULL),(462,46,'',15,'0','0','0','0',0,'VAT 15%',1,NULL,NULL),(463,46,'',7.5,'0','0','0','0',0,'VAT 7.5%',1,NULL,NULL),(561,56,'',0,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(591,59,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(592,59,'',7,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(593,59,'',20,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(671,67,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(672,67,'',19,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(721,72,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(722,72,'',18,'0.9','1','0','0',0,'VAT Rate 18+0.9',1,NULL,NULL),(781,78,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(782,78,'',9,'0','0','0','0',0,'VAT Rate 9',1,NULL,NULL),(783,78,'',5,'0','0','0','0',0,'VAT Rate 5',1,NULL,NULL),(784,78,'',19,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(801,80,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(802,80,'',25,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(861,86,'',0,'0','0','0','0',0,'SIN IVA',1,NULL,NULL),(862,86,'',13,'0','0','0','0',0,'IVA 13',1,NULL,NULL),(1021,102,'',0,'0','0','0','0',0,'Μηδενικό Φ.Π.Α.',1,NULL,NULL),(1022,102,'',24,'0','0','0','0',0,'Κανονικός Φ.Π.Α.',1,NULL,NULL),(1023,102,'',13,'0','0','0','0',0,'Μειωμένος Φ.Π.Α.',1,NULL,NULL),(1024,102,'',6,'0','0','0','0',0,'Υπερμειωμένος Φ.Π.Α.',1,NULL,NULL),(1025,102,'',16,'0','0','0','0',0,'Νήσων κανονικός Φ.Π.Α.',1,NULL,NULL),(1026,102,'',9,'0','0','0','0',0,'Νήσων μειωμένος Φ.Π.Α.',1,NULL,NULL),(1027,102,'',4,'0','0','0','0',0,'Νήσων υπερμειωμένος Φ.Π.Α.',1,NULL,NULL),(1028,102,'',17,'0','0','0','0',0,'Νήσων υπερμειωμένος Φ.Π.Α.',1,NULL,NULL),(1141,114,'',0,'0','0','0','0',0,'No ISV',1,NULL,NULL),(1142,114,'',12,'0','0','0','0',0,'ISV 12%',1,NULL,NULL),(1161,116,'',0,'0','0','0','0',0,'VAT rate 0',1,NULL,NULL),(1162,116,'',7,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1163,116,'',25.5,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1171,117,'',0,'0','0','0','0',0,'VAT Rate 0',0,NULL,NULL),(1172,117,'C+S-5',0,'2.5','1','2.5','1',0,'CGST+SGST - Same state sales',1,NULL,NULL),(1173,117,'I-5',5,'0','0','0','0',0,'IGST',1,NULL,NULL),(1174,117,'C+S-12',0,'6','1','6','1',0,'CGST+SGST - Same state sales',1,NULL,NULL),(1175,117,'I-12',12,'0','0','0','0',0,'IGST',1,NULL,NULL),(1176,117,'C+S-18',0,'9','1','9','1',0,'CGST+SGST - Same state sales',1,NULL,NULL),(1177,117,'I-18',18,'0','0','0','0',0,'IGST',1,NULL,NULL),(1178,117,'C+S-28',0,'14','1','14','1',0,'CGST+SGST - Same state sales',1,NULL,NULL),(1179,117,'I-28',28,'0','0','0','0',0,'IGST',1,NULL,NULL),(1231,123,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1232,123,'',5,'0','0','0','0',0,'VAT Rate 5',1,NULL,NULL),(1401,140,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1402,140,'',14,'0','0','0','0',0,'VAT intermediary rate',1,NULL,NULL),(1403,140,'',8,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1404,140,'',3,'0','0','0','0',0,'VAT super-reduced rate',1,NULL,NULL),(1405,140,'',17,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1481,148,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1482,148,'',7,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1483,148,'',5,'0','0','0','0',0,'VAT super-reduced rate',1,NULL,NULL),(1484,148,'',18,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1511,151,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1512,151,'',14,'0','0','0','0',0,'VAT Rate 14',1,NULL,NULL),(1521,152,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1522,152,'',15,'0','0','0','0',0,'VAT Rate 15',1,NULL,NULL),(1541,154,'',0,'0','0','0','0',0,'No VAT',1,NULL,NULL),(1542,154,'',16,'0','0','0','0',0,'VAT 16%',1,NULL,NULL),(1543,154,'',10,'0','0','0','0',0,'VAT Frontero',1,NULL,NULL),(1651,165,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1652,165,'',3,'0','0','0','0',0,'VAT standard 3',1,NULL,NULL),(1653,165,'',6,'0','0','0','0',0,'VAT standard 6',1,NULL,NULL),(1654,165,'',11,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1655,165,'',22,'0','0','0','0',0,'VAT standard high',1,NULL,NULL),(1661,166,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1662,166,'',15,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1691,169,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1692,169,'',5,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1731,173,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1732,173,'',14,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1733,173,'',8,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1734,173,'',25,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1781,178,'',0,'0','0','0','0',0,'ITBMS Rate 0',1,NULL,NULL),(1782,178,'',7,'0','0','0','0',0,'ITBMS standard rate',1,NULL,NULL),(1811,181,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1818,181,'',18,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1841,184,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1842,184,'',8,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1843,184,'',3,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1844,184,'',23,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1881,188,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(1882,188,'',9,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1883,188,'',19,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(1884,188,'',5,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(1931,193,'',0,'0','0','0','0',0,'No VAT in SPM',1,NULL,NULL),(2011,201,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(2012,201,'',10,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(2013,201,'',19,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(2021,202,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(2022,202,'',9.5,'0','0','0','0',0,'VAT reduced rate',1,NULL,NULL),(2023,202,'',22,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(2051,205,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(2052,205,'',15,'0','0','0','0',0,'VAT standard rate',1,NULL,NULL),(2071,207,'',0,'0','0','0','0',0,'VAT 0',1,NULL,NULL),(2072,207,'',15,'0','0','0','0',0,'VAT 15%',1,NULL,NULL),(2131,213,'',0,'0','0','0','0',0,'VAT 0',1,NULL,NULL),(2132,213,'',5,'0','0','0','0',0,'VAT 5%',1,NULL,NULL),(2261,226,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL),(2262,226,'',20,'0','0','0','0',0,'VAT standart rate',1,NULL,NULL),(2321,232,'',0,'0','0','0','0',0,'No VAT',1,NULL,NULL),(2322,232,'',12,'0','0','0','0',0,'VAT 12%',1,NULL,NULL),(2323,232,'',8,'0','0','0','0',0,'VAT 8%',1,NULL,NULL),(2461,246,'',0,'0','0','0','0',0,'VAT Rate 0',1,NULL,NULL);
/*!40000 ALTER TABLE `llxas_c_tva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_type_contact`
--

DROP TABLE IF EXISTS `llxas_c_type_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_type_contact` (
  `rowid` int(11) NOT NULL,
  `element` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'external',
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_type_contact`
--

LOCK TABLES `llxas_c_type_contact` WRITE;
/*!40000 ALTER TABLE `llxas_c_type_contact` DISABLE KEYS */;
INSERT INTO `llxas_c_type_contact` (`rowid`, `element`, `source`, `code`, `libelle`, `active`, `module`, `position`) VALUES (10,'contrat','internal','SALESREPSIGN','Commercial signataire du contrat',1,NULL,0),(11,'contrat','internal','SALESREPFOLL','Commercial suivi du contrat',1,NULL,0),(20,'contrat','external','BILLING','Contact client facturation contrat',1,NULL,0),(21,'contrat','external','CUSTOMER','Contact client suivi contrat',1,NULL,0),(22,'contrat','external','SALESREPSIGN','Contact client signataire contrat',1,NULL,0),(31,'propal','internal','SALESREPFOLL','Commercial à l\'origine de la propale',1,NULL,0),(40,'propal','external','BILLING','Contact client facturation propale',1,NULL,0),(41,'propal','external','CUSTOMER','Contact client suivi propale',1,NULL,0),(42,'propal','external','SHIPPING','Contact client livraison propale',1,NULL,0),(50,'facture','internal','SALESREPFOLL','Responsable suivi du paiement',1,NULL,0),(60,'facture','external','BILLING','Contact client facturation',1,NULL,0),(61,'facture','external','SHIPPING','Contact client livraison',1,NULL,0),(62,'facture','external','SERVICE','Contact client prestation',1,NULL,0),(70,'invoice_supplier','internal','SALESREPFOLL','Responsable suivi du paiement',1,NULL,0),(71,'invoice_supplier','external','BILLING','Contact fournisseur facturation',1,NULL,0),(72,'invoice_supplier','external','SHIPPING','Contact fournisseur livraison',1,NULL,0),(73,'invoice_supplier','external','SERVICE','Contact fournisseur prestation',1,NULL,0),(80,'agenda','internal','ACTOR','Responsable',1,NULL,0),(81,'agenda','internal','GUEST','Guest',1,NULL,0),(85,'agenda','external','ACTOR','Responsable',1,NULL,0),(86,'agenda','external','GUEST','Guest',1,NULL,0),(91,'commande','internal','SALESREPFOLL','Responsable suivi de la commande',1,NULL,0),(100,'commande','external','BILLING','Contact client facturation commande',1,NULL,0),(101,'commande','external','CUSTOMER','Contact client suivi commande',1,NULL,0),(102,'commande','external','SHIPPING','Contact client livraison commande',1,NULL,0),(110,'supplier_proposal','internal','SALESREPFOLL','Responsable suivi de la demande',1,NULL,0),(111,'supplier_proposal','external','BILLING','Contact fournisseur facturation',1,NULL,0),(112,'supplier_proposal','external','SHIPPING','Contact fournisseur livraison',1,NULL,0),(113,'supplier_proposal','external','SERVICE','Contact fournisseur prestation',1,NULL,0),(120,'fichinter','internal','INTERREPFOLL','Responsable suivi de l\'intervention',1,NULL,0),(121,'fichinter','internal','INTERVENING','Intervenant',1,NULL,0),(130,'fichinter','external','BILLING','Contact client facturation intervention',1,NULL,0),(131,'fichinter','external','CUSTOMER','Contact client suivi de l\'intervention',1,NULL,0),(140,'order_supplier','internal','SALESREPFOLL','Responsable suivi de la commande',1,NULL,0),(141,'order_supplier','internal','SHIPPING','Responsable réception de la commande',1,NULL,0),(142,'order_supplier','external','BILLING','Contact fournisseur facturation commande',1,NULL,0),(143,'order_supplier','external','CUSTOMER','Contact fournisseur suivi commande',1,NULL,0),(145,'order_supplier','external','SHIPPING','Contact fournisseur livraison commande',1,NULL,0),(150,'dolresource','internal','USERINCHARGE','In charge of resource',1,NULL,0),(151,'dolresource','external','THIRDINCHARGE','In charge of resource',1,NULL,0),(155,'ticket','internal','SUPPORTTEC','Utilisateur contact support',1,NULL,0),(156,'ticket','internal','CONTRIBUTOR','Intervenant',1,NULL,0),(157,'ticket','external','SUPPORTCLI','Contact client suivi incident',1,NULL,0),(158,'ticket','external','CONTRIBUTOR','Intervenant',1,NULL,0),(160,'project','internal','PROJECTLEADER','Chef de Projet',1,NULL,0),(161,'project','internal','PROJECTCONTRIBUTOR','Intervenant',1,NULL,0),(170,'project','external','PROJECTLEADER','Chef de Projet',1,NULL,0),(171,'project','external','PROJECTCONTRIBUTOR','Intervenant',1,NULL,0),(180,'project_task','internal','TASKEXECUTIVE','Responsable',1,NULL,0),(181,'project_task','internal','TASKCONTRIBUTOR','Intervenant',1,NULL,0),(190,'project_task','external','TASKEXECUTIVE','Responsable',1,NULL,0),(191,'project_task','external','TASKCONTRIBUTOR','Intervenant',1,NULL,0),(210,'conferenceorbooth','internal','MANAGER','Conference or Booth manager',1,NULL,0),(211,'conferenceorbooth','external','SPEAKER','Conference Speaker',1,NULL,0),(212,'conferenceorbooth','external','RESPONSIBLE','Booth responsible',1,NULL,0);
/*!40000 ALTER TABLE `llxas_c_type_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_type_container`
--

DROP TABLE IF EXISTS `llxas_c_type_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_type_container` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_container_id` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_type_container`
--

LOCK TABLES `llxas_c_type_container` WRITE;
/*!40000 ALTER TABLE `llxas_c_type_container` DISABLE KEYS */;
INSERT INTO `llxas_c_type_container` (`rowid`, `code`, `entity`, `label`, `module`, `active`) VALUES (1,'page',1,'Page','system',1),(2,'banner',1,'Banner','system',1),(3,'blogpost',1,'BlogPost','system',1),(4,'menu',1,'Menu','system',1),(5,'other',1,'Other','system',1);
/*!40000 ALTER TABLE `llxas_c_type_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_type_fees`
--

DROP TABLE IF EXISTS `llxas_c_type_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_type_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_type_fees` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_type_fees`
--

LOCK TABLES `llxas_c_type_fees` WRITE;
/*!40000 ALTER TABLE `llxas_c_type_fees` DISABLE KEYS */;
INSERT INTO `llxas_c_type_fees` (`id`, `code`, `label`, `type`, `accountancy_code`, `active`, `module`, `position`) VALUES (1,'TF_OTHER','Other',0,NULL,1,NULL,0),(2,'TF_TRIP','Transportation',0,NULL,1,NULL,0),(3,'TF_LUNCH','Lunch',0,NULL,1,NULL,0),(4,'EX_KME','ExpLabelKm',0,NULL,1,NULL,0),(5,'EX_FUE','ExpLabelFuelCV',0,NULL,0,NULL,0),(6,'EX_HOT','ExpLabelHotel',0,NULL,0,NULL,0),(7,'EX_PAR','ExpLabelParkingCV',0,NULL,0,NULL,0),(8,'EX_TOL','ExpLabelTollCV',0,NULL,0,NULL,0),(9,'EX_TAX','ExpLabelVariousTaxes',0,NULL,0,NULL,0),(10,'EX_IND','ExpLabelIndemnityTransSubscrip',0,NULL,0,NULL,0),(11,'EX_SUM','ExpLabelMaintenanceSupply',0,NULL,0,NULL,0),(12,'EX_SUO','ExpLabelOfficeSupplies',0,NULL,0,NULL,0),(13,'EX_CAR','ExpLabelCarRental',0,NULL,0,NULL,0),(14,'EX_DOC','ExpLabelDocumentation',0,NULL,0,NULL,0),(15,'EX_CUR','ExpLabelCustomersReceiving',0,NULL,0,NULL,0),(16,'EX_OTR','ExpLabelOtherReceiving',0,NULL,0,NULL,0),(17,'EX_POS','ExpLabelPostage',0,NULL,0,NULL,0),(18,'EX_CAM','ExpLabelMaintenanceRepairCV',0,NULL,0,NULL,0),(19,'EX_EMM','ExpLabelEmployeesMeal',0,NULL,0,NULL,0),(20,'EX_GUM','ExpLabelGuestsMeal',0,NULL,0,NULL,0),(21,'EX_BRE','ExpLabelBreakfast',0,NULL,0,NULL,0),(22,'EX_FUE_VP','ExpLabelFuelPV',0,NULL,0,NULL,0),(23,'EX_TOL_VP','ExpLabelTollPV',0,NULL,0,NULL,0),(24,'EX_PAR_VP','ExpLabelParkingPV',0,NULL,0,NULL,0),(25,'EX_CAM_VP','ExpLabelMaintenanceRepairPV',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `llxas_c_type_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_type_resource`
--

DROP TABLE IF EXISTS `llxas_c_type_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_type_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_type_resource`
--

LOCK TABLES `llxas_c_type_resource` WRITE;
/*!40000 ALTER TABLE `llxas_c_type_resource` DISABLE KEYS */;
INSERT INTO `llxas_c_type_resource` (`rowid`, `code`, `label`, `active`) VALUES (1,'RES_ROOMS','Rooms',1),(2,'RES_CARS','Cars',1);
/*!40000 ALTER TABLE `llxas_c_type_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_typent`
--

DROP TABLE IF EXISTS `llxas_c_typent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_typent` (
  `id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_typent` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_typent`
--

LOCK TABLES `llxas_c_typent` WRITE;
/*!40000 ALTER TABLE `llxas_c_typent` DISABLE KEYS */;
INSERT INTO `llxas_c_typent` (`id`, `code`, `libelle`, `fk_country`, `active`, `module`, `position`) VALUES (1,'TE_STARTUP','Start-up',NULL,0,NULL,0),(2,'TE_GROUP','Grand groupe',NULL,1,NULL,0),(3,'TE_MEDIUM','PME/PMI',NULL,1,NULL,0),(4,'TE_SMALL','TPE',NULL,1,NULL,0),(5,'TE_ADMIN','Administration',NULL,1,NULL,0),(6,'TE_WHOLE','Grossiste',NULL,0,NULL,0),(7,'TE_RETAIL','Revendeur',NULL,0,NULL,0),(8,'TE_PRIVATE','Particulier',NULL,1,NULL,0),(100,'TE_OTHER','Autres',NULL,1,NULL,0),(231,'TE_A_RI','Responsable Inscripto (typo A)',23,0,NULL,0),(232,'TE_B_RNI','Responsable No Inscripto (typo B)',23,0,NULL,0),(233,'TE_C_FE','Consumidor Final/Exento (typo C)',23,0,NULL,0);
/*!40000 ALTER TABLE `llxas_c_typent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_units`
--

DROP TABLE IF EXISTS `llxas_c_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_units` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_label` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_units_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_units`
--

LOCK TABLES `llxas_c_units` WRITE;
/*!40000 ALTER TABLE `llxas_c_units` DISABLE KEYS */;
INSERT INTO `llxas_c_units` (`rowid`, `code`, `scale`, `label`, `short_label`, `unit_type`, `active`) VALUES (1,'T',3,'WeightUnitton','T','weight',1),(2,'KG',0,'WeightUnitkg','kg','weight',1),(3,'G',-3,'WeightUnitg','g','weight',1),(4,'MG',-6,'WeightUnitmg','mg','weight',1),(5,'OZ',98,'WeightUnitounce','Oz','weight',1),(6,'LB',99,'WeightUnitpound','lb','weight',1),(7,'M',0,'SizeUnitm','m','size',1),(8,'DM',-1,'SizeUnitdm','dm','size',1),(9,'CM',-2,'SizeUnitcm','cm','size',1),(10,'MM',-3,'SizeUnitmm','mm','size',1),(11,'FT',98,'SizeUnitfoot','ft','size',1),(12,'IN',99,'SizeUnitinch','in','size',1),(13,'M2',0,'SurfaceUnitm2','m2','surface',1),(14,'DM2',-2,'SurfaceUnitdm2','dm2','surface',1),(15,'CM2',-4,'SurfaceUnitcm2','cm2','surface',1),(16,'MM2',-6,'SurfaceUnitmm2','mm2','surface',1),(17,'FT2',98,'SurfaceUnitfoot2','ft2','surface',1),(18,'IN2',99,'SurfaceUnitinch2','in2','surface',1),(19,'M3',0,'VolumeUnitm3','m3','volume',1),(20,'DM3',-3,'VolumeUnitdm3','dm3','volume',1),(21,'CM3',-6,'VolumeUnitcm3','ml','volume',1),(22,'MM3',-9,'VolumeUnitmm3','mm3','volume',1),(23,'FT3',88,'VolumeUnitfoot3','ft3','volume',1),(24,'IN3',89,'VolumeUnitinch3','in3','volume',1),(26,'L',98,'VolumeUnitlitre','L','volume',1),(27,'GAL',99,'VolumeUnitgallon','gal','volume',1),(28,'P',0,'Piece','p','qty',1),(29,'SET',0,'Set','set','qty',1),(30,'S',0,'second','s','time',1),(31,'MI',60,'minute','i','time',1),(32,'H',3600,'hour','h','time',1),(33,'D',86400,'day','d','time',1),(34,'W',604800,'week','w','time',1),(35,'MO',2629800,'month','m','time',1),(36,'Y',31557600,'year','y','time',1),(38,'CON',NULL,'CONTAINER','CONTA',NULL,1),(39,'PZ',NULL,'PIECE','PZ',NULL,1),(40,'PAL',NULL,'PALLET','PAL',NULL,1),(41,'CAS',NULL,'CASE','CASE',NULL,1),(42,'Ea',0,'Each','Ea','qty',1),(43,'Jar',0,'JAR','Jar','qty',1),(44,'Bo',0,'Bottle','Bottl','qty',1),(45,'Box',0,'Box','Box','qty',1),(47,'EaV',0,'Each (Vol)','Each ','volume',1);
/*!40000 ALTER TABLE `llxas_c_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_c_ziptown`
--

DROP TABLE IF EXISTS `llxas_c_ziptown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_c_ziptown` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_county` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  KEY `idx_c_ziptown_fk_county` (`fk_county`),
  KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  KEY `idx_c_ziptown_zip` (`zip`),
  CONSTRAINT `fk_c_ziptown_fk_county` FOREIGN KEY (`fk_county`) REFERENCES `llxas_c_departements` (`rowid`),
  CONSTRAINT `fk_c_ziptown_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llxas_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_c_ziptown`
--

LOCK TABLES `llxas_c_ziptown` WRITE;
/*!40000 ALTER TABLE `llxas_c_ziptown` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_c_ziptown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie`
--

DROP TABLE IF EXISTS `llxas_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `label` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie`
--

LOCK TABLES `llxas_categorie` WRITE;
/*!40000 ALTER TABLE `llxas_categorie` DISABLE KEYS */;
INSERT INTO `llxas_categorie` (`rowid`, `entity`, `fk_parent`, `label`, `ref_ext`, `type`, `description`, `color`, `fk_soc`, `visible`, `date_creation`, `tms`, `fk_user_creat`, `fk_user_modif`, `import_key`) VALUES (1,1,0,'BLANK',NULL,0,'','999999',NULL,0,'2023-01-17 15:26:06','2023-01-17 20:26:06',1,NULL,NULL),(2,1,0,'CUSTOM',NULL,0,'','00bf00',NULL,0,'2023-01-17 15:26:45','2023-01-17 20:26:45',1,NULL,NULL),(3,1,0,'HOME SERIES',NULL,0,'','bfbf00',NULL,0,'2023-01-17 15:27:12','2023-01-17 20:27:12',1,NULL,NULL),(4,1,0,'LIFESTYLE',NULL,0,'','bf0000',NULL,0,'2023-01-17 15:27:58','2023-01-17 20:27:58',1,NULL,NULL),(5,1,0,'MLB','',0,'','aa56ff',NULL,0,'2023-01-17 15:29:14','2023-01-17 20:30:05',1,1,NULL),(6,1,0,'NCAA',NULL,0,'','ff7f00',NULL,0,'2023-01-17 15:29:46','2023-01-17 20:29:46',1,NULL,NULL),(7,1,0,'NHL',NULL,0,'','007fff',NULL,0,'2023-01-17 15:30:26','2023-01-17 20:30:26',1,NULL,NULL);
/*!40000 ALTER TABLE `llxas_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_account`
--

DROP TABLE IF EXISTS `llxas_categorie_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_account` (
  `fk_categorie` int(11) NOT NULL,
  `fk_account` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_account`),
  KEY `idx_categorie_account_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_account_fk_account` (`fk_account`),
  CONSTRAINT `fk_categorie_account_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_account_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `llxas_bank_account` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_account`
--

LOCK TABLES `llxas_categorie_account` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_actioncomm`
--

DROP TABLE IF EXISTS `llxas_categorie_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_actioncomm` (
  `fk_categorie` int(11) NOT NULL,
  `fk_actioncomm` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_actioncomm`),
  KEY `idx_categorie_actioncomm_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_actioncomm_fk_actioncomm` (`fk_actioncomm`),
  CONSTRAINT `fk_categorie_actioncomm_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_actioncomm_fk_actioncomm` FOREIGN KEY (`fk_actioncomm`) REFERENCES `llxas_actioncomm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_actioncomm`
--

LOCK TABLES `llxas_categorie_actioncomm` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_actioncomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_contact`
--

DROP TABLE IF EXISTS `llxas_categorie_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_contact` (
  `fk_categorie` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_categorie_contact_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_contact_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llxas_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_contact`
--

LOCK TABLES `llxas_categorie_contact` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_fournisseur`
--

DROP TABLE IF EXISTS `llxas_categorie_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_fournisseur` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_fournisseur_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_fournisseur_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_fournisseur`
--

LOCK TABLES `llxas_categorie_fournisseur` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_lang`
--

DROP TABLE IF EXISTS `llxas_categorie_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_category` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`),
  CONSTRAINT `fk_category_lang_fk_category` FOREIGN KEY (`fk_category`) REFERENCES `llxas_categorie` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_lang`
--

LOCK TABLES `llxas_categorie_lang` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_member`
--

DROP TABLE IF EXISTS `llxas_categorie_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_member` (
  `fk_categorie` int(11) NOT NULL,
  `fk_member` int(11) NOT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_member`),
  KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_member_fk_member` (`fk_member`),
  CONSTRAINT `fk_categorie_member_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_member_member_rowid` FOREIGN KEY (`fk_member`) REFERENCES `llxas_adherent` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_member`
--

LOCK TABLES `llxas_categorie_member` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_product`
--

DROP TABLE IF EXISTS `llxas_categorie_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_product` (
  `fk_categorie` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_product`),
  KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_product_fk_product` (`fk_product`),
  CONSTRAINT `fk_categorie_product_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llxas_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_product`
--

LOCK TABLES `llxas_categorie_product` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_product` DISABLE KEYS */;
INSERT INTO `llxas_categorie_product` (`fk_categorie`, `fk_product`, `import_key`) VALUES (1,4,NULL),(1,5,NULL),(1,6,NULL),(1,7,NULL),(1,8,NULL),(1,9,NULL),(1,10,NULL),(1,11,NULL),(1,12,NULL),(1,66,NULL),(2,1,NULL),(2,2,NULL),(2,3,NULL),(2,64,NULL),(2,65,NULL),(2,67,NULL),(2,68,NULL),(2,69,NULL),(2,70,NULL),(2,71,NULL),(2,72,NULL),(2,73,NULL),(2,74,NULL),(2,75,NULL),(2,76,NULL),(2,77,NULL),(2,78,NULL),(2,79,NULL),(2,80,NULL),(2,81,NULL),(3,58,NULL),(3,59,NULL),(3,60,NULL),(3,61,NULL),(3,62,NULL),(3,82,NULL),(3,83,NULL),(3,84,NULL),(3,85,NULL),(3,86,NULL),(3,87,NULL),(3,88,NULL),(3,89,NULL),(3,90,NULL),(3,91,NULL),(3,92,NULL),(3,93,NULL),(3,94,NULL),(3,95,NULL),(3,96,NULL),(3,97,NULL),(3,98,NULL),(3,99,NULL),(3,100,NULL),(3,101,NULL),(3,102,NULL),(3,103,NULL),(3,104,NULL),(3,105,NULL),(3,106,NULL),(3,107,NULL),(3,108,NULL),(3,109,NULL),(3,110,NULL),(3,111,NULL),(3,112,NULL),(3,113,NULL),(3,114,NULL),(3,115,NULL),(3,116,NULL),(3,117,NULL),(3,118,NULL),(3,119,NULL),(3,120,NULL),(3,121,NULL),(3,122,NULL),(3,123,NULL),(3,124,NULL),(3,125,NULL),(3,126,NULL),(4,37,NULL),(4,38,NULL),(4,39,NULL),(4,40,NULL),(4,41,NULL),(4,42,NULL),(4,43,NULL),(4,44,NULL),(4,45,NULL),(4,46,NULL),(4,47,NULL),(4,48,NULL),(4,49,NULL),(4,50,NULL),(4,51,NULL),(4,52,NULL),(4,63,NULL),(4,127,NULL),(4,128,NULL),(4,129,NULL),(4,130,NULL),(4,131,NULL),(4,132,NULL),(5,13,NULL),(5,14,NULL),(5,15,NULL),(5,17,NULL),(5,18,NULL),(5,19,NULL),(5,20,NULL),(5,21,NULL),(5,22,NULL),(5,23,NULL),(5,24,NULL),(5,133,NULL),(5,134,NULL),(5,135,NULL),(5,136,NULL),(5,137,NULL),(5,138,NULL),(5,139,NULL),(5,140,NULL),(5,141,NULL),(5,142,NULL),(5,143,NULL),(5,144,NULL),(5,145,NULL),(5,146,NULL),(5,147,NULL),(5,148,NULL),(5,149,NULL),(5,150,NULL),(5,151,NULL),(6,25,NULL),(6,26,NULL),(6,27,NULL),(6,28,NULL),(6,29,NULL),(6,30,NULL),(6,31,NULL),(6,32,NULL),(6,33,NULL),(6,34,NULL),(6,35,NULL),(6,36,NULL),(6,152,NULL),(6,153,NULL),(6,154,NULL),(6,155,NULL),(6,156,NULL),(6,157,NULL),(6,158,NULL),(6,159,NULL),(6,160,NULL),(6,161,NULL),(6,162,NULL),(6,163,NULL),(6,164,NULL),(6,165,NULL),(6,166,NULL),(6,167,NULL),(6,168,NULL),(6,169,NULL),(6,170,NULL),(6,171,NULL),(6,172,NULL),(6,173,NULL),(6,174,NULL),(6,175,NULL),(6,176,NULL),(6,177,NULL),(6,178,NULL),(6,179,NULL),(6,180,NULL),(6,181,NULL),(6,182,NULL),(6,183,NULL),(6,184,NULL),(6,185,NULL),(6,186,NULL),(6,187,NULL),(6,188,NULL),(6,189,NULL),(6,190,NULL),(6,191,NULL),(6,192,NULL),(6,193,NULL),(6,194,NULL),(6,195,NULL),(6,196,NULL),(6,197,NULL),(6,198,NULL),(6,199,NULL),(6,200,NULL),(6,201,NULL),(6,202,NULL),(6,203,NULL),(6,204,NULL),(6,205,NULL),(6,206,NULL),(6,207,NULL),(7,53,NULL),(7,54,NULL),(7,55,NULL),(7,56,NULL),(7,57,NULL),(7,208,NULL),(7,209,NULL),(7,210,NULL),(7,211,NULL),(7,212,NULL),(7,213,NULL),(7,214,NULL),(7,215,NULL),(7,216,NULL),(7,217,NULL),(7,218,NULL),(7,219,NULL),(7,220,NULL),(7,221,NULL),(7,222,NULL),(7,223,NULL),(7,224,NULL),(7,225,NULL),(7,226,NULL),(7,227,NULL),(7,228,NULL),(7,229,NULL),(7,230,NULL),(7,231,NULL),(7,232,NULL),(7,233,NULL),(7,234,NULL);
/*!40000 ALTER TABLE `llxas_categorie_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_project`
--

DROP TABLE IF EXISTS `llxas_categorie_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_project` (
  `fk_categorie` int(11) NOT NULL,
  `fk_project` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_project`),
  KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_project_fk_project` (`fk_project`),
  CONSTRAINT `fk_categorie_project_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_project_fk_project_rowid` FOREIGN KEY (`fk_project`) REFERENCES `llxas_projet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_project`
--

LOCK TABLES `llxas_categorie_project` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_societe`
--

DROP TABLE IF EXISTS `llxas_categorie_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_societe` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_societe_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_societe_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_societe_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_societe`
--

LOCK TABLES `llxas_categorie_societe` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_user`
--

DROP TABLE IF EXISTS `llxas_categorie_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_user` (
  `fk_categorie` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_user`),
  KEY `idx_categorie_user_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_user_fk_user` (`fk_user`),
  CONSTRAINT `fk_categorie_user_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_user`
--

LOCK TABLES `llxas_categorie_user` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_warehouse`
--

DROP TABLE IF EXISTS `llxas_categorie_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_warehouse` (
  `fk_categorie` int(11) NOT NULL,
  `fk_warehouse` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_warehouse`),
  KEY `idx_categorie_warehouse_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_warehouse_fk_warehouse` (`fk_warehouse`),
  CONSTRAINT `fk_categorie_warehouse_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_warehouse_fk_warehouse_rowid` FOREIGN KEY (`fk_warehouse`) REFERENCES `llxas_entrepot` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_warehouse`
--

LOCK TABLES `llxas_categorie_warehouse` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categorie_website_page`
--

DROP TABLE IF EXISTS `llxas_categorie_website_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categorie_website_page` (
  `fk_categorie` int(11) NOT NULL,
  `fk_website_page` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_website_page`),
  KEY `idx_categorie_website_page_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_website_page_fk_website_page` (`fk_website_page`),
  CONSTRAINT `fk_categorie_websitepage_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llxas_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_websitepage_website_page_rowid` FOREIGN KEY (`fk_website_page`) REFERENCES `llxas_website_page` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categorie_website_page`
--

LOCK TABLES `llxas_categorie_website_page` WRITE;
/*!40000 ALTER TABLE `llxas_categorie_website_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categorie_website_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_categories_extrafields`
--

DROP TABLE IF EXISTS `llxas_categories_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_categories_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_categories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_categories_extrafields`
--

LOCK TABLES `llxas_categories_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_categories_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_categories_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_chargesociales`
--

DROP TABLE IF EXISTS `llxas_chargesociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_chargesociales` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `periode` date DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_chargesociales`
--

LOCK TABLES `llxas_chargesociales` WRITE;
/*!40000 ALTER TABLE `llxas_chargesociales` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande`
--

DROP TABLE IF EXISTS `llxas_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `source` smallint(6) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facture` tinyint(4) DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  KEY `idx_commande_fk_soc` (`fk_soc`),
  KEY `idx_commande_fk_user_author` (`fk_user_author`),
  KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_commande_fk_projet` (`fk_projet`),
  KEY `idx_commande_fk_account` (`fk_account`),
  KEY `idx_commande_fk_currency` (`fk_currency`),
  CONSTRAINT `fk_commande_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llxas_projet` (`rowid`),
  CONSTRAINT `fk_commande_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande`
--

LOCK TABLES `llxas_commande` WRITE;
/*!40000 ALTER TABLE `llxas_commande` DISABLE KEYS */;
INSERT INTO `llxas_commande` (`rowid`, `ref`, `entity`, `ref_ext`, `ref_int`, `ref_client`, `fk_soc`, `fk_projet`, `tms`, `date_creation`, `date_valid`, `date_cloture`, `date_commande`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_user_cloture`, `source`, `fk_statut`, `amount_ht`, `remise_percent`, `remise_absolue`, `remise`, `total_tva`, `localtax1`, `localtax2`, `total_ht`, `total_ttc`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `module_source`, `pos_source`, `facture`, `fk_account`, `fk_currency`, `fk_cond_reglement`, `fk_mode_reglement`, `date_livraison`, `fk_shipping_method`, `fk_warehouse`, `fk_availability`, `fk_input_reason`, `fk_delivery_address`, `fk_incoterms`, `location_incoterms`, `import_key`, `extraparams`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES (1,'SO2022-0001',1,NULL,NULL,'Galena Park',1,NULL,'2023-02-07 18:42:55','2022-11-09 16:59:44','2022-11-09 17:00:05',NULL,'2022-09-23',1,NULL,1,NULL,NULL,3,0.00000000,0,NULL,0,435.33000000,0.00000000,0.00000000,9823.83000000,10259.16000000,'','Please remit to: 205 Mercy Way, Liberty Hill, TX 78642<br>\r\n','conford','commande/SO2022-0001/SO2022-0001_2022-10-07_Galena Park_Mat Sweet.pdf',NULL,NULL,0,NULL,NULL,2,2,'2022-10-07 00:00:00',1,NULL,4,5,NULL,0,'',NULL,NULL,0,'USD',1.00000000,9823.83000000,435.33000000,10259.16000000),(2,'SO2022-00002',1,NULL,NULL,'test',1,NULL,'2023-02-07 18:34:43','2022-11-09 17:06:51','2023-01-23 18:09:24',NULL,'2022-11-09',1,NULL,1,NULL,NULL,0,0.00000000,0,NULL,0,0.00000000,0.00000000,0.00000000,9.50000000,9.50000000,'','','einstein','commande/SO2022-00001/SO2022-00001.pdf',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',NULL,NULL,0,'USD',1.00000000,9.50000000,0.00000000,9.50000000),(3,'SO2022-0003',1,NULL,NULL,NULL,1,NULL,'2023-02-07 18:43:18','2022-11-09 17:19:23','2023-02-07 13:19:39',NULL,'2022-11-09',1,NULL,1,NULL,NULL,0,0.00000000,0,NULL,0,435.33000000,0.00000000,0.00000000,9823.83000000,10259.16000000,'','Please remit to: 205 Mercy Way, Liberty Hill, TX 78642<br>\r\n','einstein','commande/SO2022-0003/SO2022-0003.pdf',NULL,NULL,0,NULL,NULL,2,2,'2022-10-07 00:00:00',1,NULL,4,5,NULL,0,'',NULL,NULL,0,'USD',1.00000000,9823.83000000,435.33000000,10259.16000000),(4,'SO2022-00004',1,NULL,NULL,NULL,1,NULL,'2023-02-07 18:27:16','2022-12-05 13:29:17','2023-02-07 13:27:16',NULL,'2022-12-05',2,NULL,1,NULL,NULL,1,0.00000000,0,NULL,0,0.00000000,0.00000000,0.00000000,9.50000000,9.50000000,'','','einstein','commande/SO2022-00004/SO2022-00004.pdf',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',NULL,NULL,0,'USD',1.00000000,9.50000000,0.00000000,9.50000000),(5,'SO2023-00005',1,NULL,NULL,NULL,1,NULL,'2023-02-07 18:43:19','2023-02-07 13:42:50','2023-02-07 13:43:19',NULL,'2023-02-07',1,NULL,1,NULL,NULL,1,0.00000000,0,NULL,0,0.00000000,0.00000000,0.00000000,18.25000000,18.25000000,'','','einstein','commande/SO2023-00005/SO2023-00005.pdf',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',NULL,NULL,0,'USD',1.00000000,18.25000000,0.00000000,18.25000000);
/*!40000 ALTER TABLE `llxas_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande_extrafields`
--

DROP TABLE IF EXISTS `llxas_commande_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_extrafields` (`fk_object`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande_extrafields`
--

LOCK TABLES `llxas_commande_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_commande_extrafields` DISABLE KEYS */;
INSERT INTO `llxas_commande_extrafields` (`rowid`, `tms`, `fk_object`, `import_key`, `custy`) VALUES (5,'2023-01-23 23:09:21',2,NULL,'1');
/*!40000 ALTER TABLE `llxas_commande_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande_fournisseur`
--

DROP TABLE IF EXISTS `llxas_commande_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande_fournisseur` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_approve2` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_approve2` int(11) DEFAULT NULL,
  `source` smallint(6) NOT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `fk_input_method` int(11) DEFAULT 0,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`fk_soc`,`entity`),
  KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`),
  KEY `billed` (`billed`),
  CONSTRAINT `fk_commande_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande_fournisseur`
--

LOCK TABLES `llxas_commande_fournisseur` WRITE;
/*!40000 ALTER TABLE `llxas_commande_fournisseur` DISABLE KEYS */;
INSERT INTO `llxas_commande_fournisseur` (`rowid`, `ref`, `entity`, `ref_ext`, `ref_supplier`, `fk_soc`, `fk_projet`, `tms`, `date_creation`, `date_valid`, `date_approve`, `date_approve2`, `date_commande`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_user_approve`, `fk_user_approve2`, `source`, `fk_statut`, `billed`, `amount_ht`, `remise_percent`, `remise`, `total_tva`, `localtax1`, `localtax2`, `total_ht`, `total_ttc`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `date_livraison`, `fk_account`, `fk_cond_reglement`, `fk_mode_reglement`, `fk_input_method`, `fk_incoterms`, `location_incoterms`, `import_key`, `extraparams`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES (1,'(PROV1)',1,NULL,'',2,NULL,'2022-11-09 22:03:59','2022-11-09 17:03:59',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,0,0,0,0.00000000,0,0,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,'','','muscadet',NULL,NULL,NULL,1,NULL,0,0,'',NULL,NULL,0,'USD',1.00000000,0.00000000,0.00000000,0.00000000);
/*!40000 ALTER TABLE `llxas_commande_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande_fournisseur_dispatch`
--

DROP TABLE IF EXISTS `llxas_commande_fournisseur_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande_fournisseur_dispatch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_reception` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_fk_commande` (`fk_commande`),
  KEY `idx_commande_fournisseur_dispatch_fk_reception` (`fk_reception`),
  CONSTRAINT `fk_commande_fournisseur_dispatch_fk_reception` FOREIGN KEY (`fk_reception`) REFERENCES `llxas_reception` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande_fournisseur_dispatch`
--

LOCK TABLES `llxas_commande_fournisseur_dispatch` WRITE;
/*!40000 ALTER TABLE `llxas_commande_fournisseur_dispatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_commande_fournisseur_dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande_fournisseur_dispatch_extrafields`
--

DROP TABLE IF EXISTS `llxas_commande_fournisseur_dispatch_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande_fournisseur_dispatch_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande_fournisseur_dispatch_extrafields`
--

LOCK TABLES `llxas_commande_fournisseur_dispatch_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_commande_fournisseur_dispatch_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_commande_fournisseur_dispatch_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande_fournisseur_extrafields`
--

DROP TABLE IF EXISTS `llxas_commande_fournisseur_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande_fournisseur_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande_fournisseur_extrafields`
--

LOCK TABLES `llxas_commande_fournisseur_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_commande_fournisseur_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_commande_fournisseur_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande_fournisseur_log`
--

DROP TABLE IF EXISTS `llxas_commande_fournisseur_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande_fournisseur_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datelog` datetime NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_statut` smallint(6) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande_fournisseur_log`
--

LOCK TABLES `llxas_commande_fournisseur_log` WRITE;
/*!40000 ALTER TABLE `llxas_commande_fournisseur_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_commande_fournisseur_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande_fournisseurdet`
--

DROP TABLE IF EXISTS `llxas_commande_fournisseurdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande_fournisseurdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  KEY `fk_commande_fournisseurdet_fk_unit` (`fk_unit`),
  KEY `idx_commande_fournisseurdet_fk_commande` (`fk_commande`),
  KEY `idx_commande_fournisseurdet_fk_product` (`fk_product`),
  CONSTRAINT `fk_commande_fournisseurdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande_fournisseurdet`
--

LOCK TABLES `llxas_commande_fournisseurdet` WRITE;
/*!40000 ALTER TABLE `llxas_commande_fournisseurdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_commande_fournisseurdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commande_fournisseurdet_extrafields`
--

DROP TABLE IF EXISTS `llxas_commande_fournisseurdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commande_fournisseurdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseurdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commande_fournisseurdet_extrafields`
--

LOCK TABLES `llxas_commande_fournisseurdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_commande_fournisseurdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_commande_fournisseurdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commandedet`
--

DROP TABLE IF EXISTS `llxas_commandedet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commandedet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_user_modify` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_fk_commande` (`fk_commande`),
  KEY `idx_commandedet_fk_product` (`fk_product`),
  KEY `fk_commandedet_fk_unit` (`fk_unit`),
  KEY `fk_commandedet_fk_commandefourndet` (`fk_commandefourndet`),
  CONSTRAINT `fk_commandedet_fk_commande` FOREIGN KEY (`fk_commande`) REFERENCES `llxas_commande` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_commandefourndet` FOREIGN KEY (`fk_commandefourndet`) REFERENCES `llxas_commande_fournisseurdet` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commandedet`
--

LOCK TABLES `llxas_commandedet` WRITE;
/*!40000 ALTER TABLE `llxas_commandedet` DISABLE KEYS */;
INSERT INTO `llxas_commandedet` (`rowid`, `fk_commande`, `fk_parent_line`, `fk_product`, `label`, `description`, `vat_src_code`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `remise`, `fk_remise_except`, `price`, `subprice`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `buy_price_ht`, `fk_product_fournisseur_price`, `special_code`, `rang`, `fk_unit`, `import_key`, `ref_ext`, `fk_commandefourndet`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_subprice`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`, `fk_user_modify`) VALUES (1,1,NULL,22,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,1,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(2,1,NULL,23,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,2,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(3,1,NULL,24,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,3,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(4,1,NULL,25,NULL,'','',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,4,NULL,NULL,'',NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000,NULL),(5,1,NULL,26,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,5,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(6,1,NULL,27,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,6,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(7,1,NULL,28,NULL,'','',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,7,NULL,NULL,'',NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000,NULL),(8,1,NULL,29,NULL,'','',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,8,NULL,NULL,'',NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000,NULL),(9,1,NULL,30,NULL,'','',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,9,NULL,NULL,'',NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000,NULL),(10,1,NULL,31,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,10,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(11,1,NULL,32,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,11,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(12,1,NULL,33,NULL,'','',0.000,0.000,'0',0.000,'0',3,0,0,NULL,9.5,9.50000000,28.50000000,0.00000000,0.00000000,0.00000000,28.50000000,0,NULL,NULL,0,4.50000000,NULL,0,12,NULL,NULL,'',NULL,NULL,'USD',9.50000000,28.50000000,0.00000000,28.50000000,NULL),(13,1,NULL,34,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,9.5,9.50000000,85.50000000,0.00000000,0.00000000,0.00000000,85.50000000,0,NULL,NULL,0,4.50000000,NULL,0,13,NULL,NULL,'',NULL,NULL,'USD',9.50000000,85.50000000,0.00000000,85.50000000,NULL),(14,1,NULL,35,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,9.5,9.50000000,85.50000000,0.00000000,0.00000000,0.00000000,85.50000000,0,NULL,NULL,0,4.50000000,NULL,0,14,NULL,NULL,'',NULL,NULL,'USD',9.50000000,85.50000000,0.00000000,85.50000000,NULL),(15,1,NULL,36,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,15,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(16,1,NULL,37,NULL,'','',0.000,0.000,'0',0.000,'0',20,0,0,NULL,8.75,8.75000000,175.00000000,0.00000000,0.00000000,0.00000000,175.00000000,0,NULL,NULL,0,3.75000000,NULL,0,16,NULL,NULL,'',NULL,NULL,'USD',8.75000000,175.00000000,0.00000000,175.00000000,NULL),(17,1,NULL,38,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,17,NULL,NULL,'',NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000,NULL),(18,1,NULL,39,NULL,'','',0.000,0.000,'0',0.000,'0',27,0,0,NULL,8.75,8.75000000,236.25000000,0.00000000,0.00000000,0.00000000,236.25000000,0,NULL,NULL,0,3.75000000,NULL,0,18,NULL,NULL,'',NULL,NULL,'USD',8.75000000,236.25000000,0.00000000,236.25000000,NULL),(19,1,NULL,40,NULL,'','',0.000,0.000,'0',0.000,'0',18,0,0,NULL,8.75,8.75000000,157.50000000,0.00000000,0.00000000,0.00000000,157.50000000,0,NULL,NULL,0,3.75000000,NULL,0,19,NULL,NULL,'',NULL,NULL,'USD',8.75000000,157.50000000,0.00000000,157.50000000,NULL),(20,1,NULL,41,NULL,'','',0.000,0.000,'0',0.000,'0',28,0,0,NULL,8.75,8.75000000,245.00000000,0.00000000,0.00000000,0.00000000,245.00000000,0,NULL,NULL,0,3.75000000,NULL,0,20,NULL,NULL,'',NULL,NULL,'USD',8.75000000,245.00000000,0.00000000,245.00000000,NULL),(21,1,NULL,42,NULL,'','',0.000,0.000,'0',0.000,'0',14,0,0,NULL,8.75,8.75000000,122.50000000,0.00000000,0.00000000,0.00000000,122.50000000,0,NULL,NULL,0,3.75000000,NULL,0,21,NULL,NULL,'',NULL,NULL,'USD',8.75000000,122.50000000,0.00000000,122.50000000,NULL),(22,1,NULL,43,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,22,NULL,NULL,'',NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000,NULL),(23,1,NULL,44,NULL,'','',0.000,0.000,'0',0.000,'0',5,0,0,NULL,8.75,8.75000000,43.75000000,0.00000000,0.00000000,0.00000000,43.75000000,0,NULL,NULL,0,3.75000000,NULL,0,23,NULL,NULL,'',NULL,NULL,'USD',8.75000000,43.75000000,0.00000000,43.75000000,NULL),(24,1,NULL,45,NULL,'','',0.000,0.000,'0',0.000,'0',32,0,0,NULL,8.75,8.75000000,280.00000000,0.00000000,0.00000000,0.00000000,280.00000000,0,NULL,NULL,0,3.75000000,NULL,0,24,NULL,NULL,'',NULL,NULL,'USD',8.75000000,280.00000000,0.00000000,280.00000000,NULL),(25,1,NULL,46,NULL,'','',0.000,0.000,'0',0.000,'0',4,0,0,NULL,8.75,8.75000000,35.00000000,0.00000000,0.00000000,0.00000000,35.00000000,0,NULL,NULL,0,3.75000000,NULL,0,25,NULL,NULL,'',NULL,NULL,'USD',8.75000000,35.00000000,0.00000000,35.00000000,NULL),(26,1,NULL,47,NULL,'','',0.000,0.000,'0',0.000,'0',18,0,0,NULL,8.75,8.75000000,157.50000000,0.00000000,0.00000000,0.00000000,157.50000000,0,NULL,NULL,0,3.75000000,NULL,0,26,NULL,NULL,'',NULL,NULL,'USD',8.75000000,157.50000000,0.00000000,157.50000000,NULL),(27,1,NULL,48,NULL,'','',0.000,0.000,'0',0.000,'0',13,0,0,NULL,8.75,8.75000000,113.75000000,0.00000000,0.00000000,0.00000000,113.75000000,0,NULL,NULL,0,3.75000000,NULL,0,27,NULL,NULL,'',NULL,NULL,'USD',8.75000000,113.75000000,0.00000000,113.75000000,NULL),(28,1,NULL,49,NULL,'','',0.000,0.000,'0',0.000,'0',11,0,0,NULL,8.75,8.75000000,96.25000000,0.00000000,0.00000000,0.00000000,96.25000000,0,NULL,NULL,0,3.75000000,NULL,0,28,NULL,NULL,'',NULL,NULL,'USD',8.75000000,96.25000000,0.00000000,96.25000000,NULL),(29,1,NULL,50,NULL,'','',0.000,0.000,'0',0.000,'0',25,0,0,NULL,8.75,8.75000000,218.75000000,0.00000000,0.00000000,0.00000000,218.75000000,0,NULL,NULL,0,3.75000000,NULL,0,29,NULL,NULL,'',NULL,NULL,'USD',8.75000000,218.75000000,0.00000000,218.75000000,NULL),(30,1,NULL,51,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,30,NULL,NULL,'',NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000,NULL),(31,1,NULL,52,NULL,'','',0.000,0.000,'0',0.000,'0',7,0,0,NULL,8.75,8.75000000,61.25000000,0.00000000,0.00000000,0.00000000,61.25000000,0,NULL,NULL,0,3.75000000,NULL,0,31,NULL,NULL,'',NULL,NULL,'USD',8.75000000,61.25000000,0.00000000,61.25000000,NULL),(32,1,NULL,53,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,32,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(33,1,NULL,54,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,33,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(34,1,NULL,55,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,34,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(35,1,NULL,56,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,35,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(36,1,NULL,NULL,NULL,'Shipping Charges','',6.000,0.000,'0',0.000,'0',1,0,0,NULL,7255.58,7255.58000000,7255.58000000,435.33000000,0.00000000,0.00000000,7690.91000000,1,NULL,NULL,0,0.00000000,NULL,0,36,NULL,NULL,'',NULL,NULL,'USD',7255.58000000,7255.58000000,435.33000000,7690.91000000,NULL),(37,3,NULL,22,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,1,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(38,3,NULL,23,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,2,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(39,3,NULL,24,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,3,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(40,3,NULL,25,NULL,'','',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,4,NULL,NULL,'',NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000,NULL),(41,3,NULL,26,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,5,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(42,3,NULL,27,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,6,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(43,3,NULL,28,NULL,'','',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,7,NULL,NULL,'',NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000,NULL),(44,3,NULL,29,NULL,'','',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,8,NULL,NULL,'',NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000,NULL),(45,3,NULL,30,NULL,'','',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,9,NULL,NULL,'',NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000,NULL),(46,3,NULL,31,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,10,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(47,3,NULL,32,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,11,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(48,3,NULL,33,NULL,'','',0.000,0.000,'0',0.000,'0',3,0,0,NULL,9.5,9.50000000,28.50000000,0.00000000,0.00000000,0.00000000,28.50000000,0,NULL,NULL,0,4.50000000,NULL,0,12,NULL,NULL,'',NULL,NULL,'USD',9.50000000,28.50000000,0.00000000,28.50000000,NULL),(49,3,NULL,34,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,9.5,9.50000000,85.50000000,0.00000000,0.00000000,0.00000000,85.50000000,0,NULL,NULL,0,4.50000000,NULL,0,13,NULL,NULL,'',NULL,NULL,'USD',9.50000000,85.50000000,0.00000000,85.50000000,NULL),(50,3,NULL,35,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,9.5,9.50000000,85.50000000,0.00000000,0.00000000,0.00000000,85.50000000,0,NULL,NULL,0,4.50000000,NULL,0,14,NULL,NULL,'',NULL,NULL,'USD',9.50000000,85.50000000,0.00000000,85.50000000,NULL),(51,3,NULL,36,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,15,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(52,3,NULL,37,NULL,'','',0.000,0.000,'0',0.000,'0',20,0,0,NULL,8.75,8.75000000,175.00000000,0.00000000,0.00000000,0.00000000,175.00000000,0,NULL,NULL,0,3.75000000,NULL,0,16,NULL,NULL,'',NULL,NULL,'USD',8.75000000,175.00000000,0.00000000,175.00000000,NULL),(53,3,NULL,38,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,17,NULL,NULL,'',NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000,NULL),(54,3,NULL,39,NULL,'','',0.000,0.000,'0',0.000,'0',27,0,0,NULL,8.75,8.75000000,236.25000000,0.00000000,0.00000000,0.00000000,236.25000000,0,NULL,NULL,0,3.75000000,NULL,0,18,NULL,NULL,'',NULL,NULL,'USD',8.75000000,236.25000000,0.00000000,236.25000000,NULL),(55,3,NULL,40,NULL,'','',0.000,0.000,'0',0.000,'0',18,0,0,NULL,8.75,8.75000000,157.50000000,0.00000000,0.00000000,0.00000000,157.50000000,0,NULL,NULL,0,3.75000000,NULL,0,19,NULL,NULL,'',NULL,NULL,'USD',8.75000000,157.50000000,0.00000000,157.50000000,NULL),(56,3,NULL,41,NULL,'','',0.000,0.000,'0',0.000,'0',28,0,0,NULL,8.75,8.75000000,245.00000000,0.00000000,0.00000000,0.00000000,245.00000000,0,NULL,NULL,0,3.75000000,NULL,0,20,NULL,NULL,'',NULL,NULL,'USD',8.75000000,245.00000000,0.00000000,245.00000000,NULL),(57,3,NULL,42,NULL,'','',0.000,0.000,'0',0.000,'0',14,0,0,NULL,8.75,8.75000000,122.50000000,0.00000000,0.00000000,0.00000000,122.50000000,0,NULL,NULL,0,3.75000000,NULL,0,21,NULL,NULL,'',NULL,NULL,'USD',8.75000000,122.50000000,0.00000000,122.50000000,NULL),(58,3,NULL,43,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,22,NULL,NULL,'',NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000,NULL),(59,3,NULL,44,NULL,'','',0.000,0.000,'0',0.000,'0',5,0,0,NULL,8.75,8.75000000,43.75000000,0.00000000,0.00000000,0.00000000,43.75000000,0,NULL,NULL,0,3.75000000,NULL,0,23,NULL,NULL,'',NULL,NULL,'USD',8.75000000,43.75000000,0.00000000,43.75000000,NULL),(60,3,NULL,45,NULL,'','',0.000,0.000,'0',0.000,'0',32,0,0,NULL,8.75,8.75000000,280.00000000,0.00000000,0.00000000,0.00000000,280.00000000,0,NULL,NULL,0,3.75000000,NULL,0,24,NULL,NULL,'',NULL,NULL,'USD',8.75000000,280.00000000,0.00000000,280.00000000,NULL),(61,3,NULL,46,NULL,'','',0.000,0.000,'0',0.000,'0',4,0,0,NULL,8.75,8.75000000,35.00000000,0.00000000,0.00000000,0.00000000,35.00000000,0,NULL,NULL,0,3.75000000,NULL,0,25,NULL,NULL,'',NULL,NULL,'USD',8.75000000,35.00000000,0.00000000,35.00000000,NULL),(62,3,NULL,47,NULL,'','',0.000,0.000,'0',0.000,'0',18,0,0,NULL,8.75,8.75000000,157.50000000,0.00000000,0.00000000,0.00000000,157.50000000,0,NULL,NULL,0,3.75000000,NULL,0,26,NULL,NULL,'',NULL,NULL,'USD',8.75000000,157.50000000,0.00000000,157.50000000,NULL),(63,3,NULL,48,NULL,'','',0.000,0.000,'0',0.000,'0',13,0,0,NULL,8.75,8.75000000,113.75000000,0.00000000,0.00000000,0.00000000,113.75000000,0,NULL,NULL,0,3.75000000,NULL,0,27,NULL,NULL,'',NULL,NULL,'USD',8.75000000,113.75000000,0.00000000,113.75000000,NULL),(64,3,NULL,49,NULL,'','',0.000,0.000,'0',0.000,'0',11,0,0,NULL,8.75,8.75000000,96.25000000,0.00000000,0.00000000,0.00000000,96.25000000,0,NULL,NULL,0,3.75000000,NULL,0,28,NULL,NULL,'',NULL,NULL,'USD',8.75000000,96.25000000,0.00000000,96.25000000,NULL),(65,3,NULL,50,NULL,'','',0.000,0.000,'0',0.000,'0',25,0,0,NULL,8.75,8.75000000,218.75000000,0.00000000,0.00000000,0.00000000,218.75000000,0,NULL,NULL,0,3.75000000,NULL,0,29,NULL,NULL,'',NULL,NULL,'USD',8.75000000,218.75000000,0.00000000,218.75000000,NULL),(66,3,NULL,51,NULL,'','',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,30,NULL,NULL,'',NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000,NULL),(67,3,NULL,52,NULL,'','',0.000,0.000,'0',0.000,'0',7,0,0,NULL,8.75,8.75000000,61.25000000,0.00000000,0.00000000,0.00000000,61.25000000,0,NULL,NULL,0,3.75000000,NULL,0,31,NULL,NULL,'',NULL,NULL,'USD',8.75000000,61.25000000,0.00000000,61.25000000,NULL),(68,3,NULL,53,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,32,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(69,3,NULL,54,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,33,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(70,3,NULL,55,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,34,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(71,3,NULL,56,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,35,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(72,3,NULL,NULL,NULL,'Shipping Charges','',6.000,0.000,'0',0.000,'0',1,0,0,NULL,7255.58,7255.58000000,7255.58000000,435.33000000,0.00000000,0.00000000,7690.91000000,1,NULL,NULL,0,0.00000000,NULL,0,36,NULL,NULL,'',NULL,NULL,'USD',7255.58000000,7255.58000000,435.33000000,7690.91000000,NULL),(73,2,NULL,16,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,1,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(74,3,NULL,70,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,0,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,NULL,NULL,0,0.00000000,NULL,0,37,NULL,NULL,'',NULL,NULL,'USD',0.00000000,0.00000000,0.00000000,0.00000000,NULL),(75,3,NULL,70,NULL,'TEST DESCR','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,0,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,NULL,NULL,0,0.00000000,NULL,0,38,NULL,NULL,'',NULL,NULL,'USD',0.00000000,0.00000000,0.00000000,0.00000000,NULL),(76,3,NULL,70,NULL,'TEST DESCR','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,0,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,NULL,NULL,0,0.00000000,NULL,0,39,NULL,NULL,'',NULL,NULL,'USD',0.00000000,0.00000000,0.00000000,0.00000000,NULL),(77,4,NULL,16,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,1,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(78,5,NULL,16,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.5,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,1,NULL,NULL,'',NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000,NULL),(79,5,NULL,6,NULL,'','',0.000,0.000,'0',0.000,'0',1,0,0,NULL,8.75,8.75000000,8.75000000,0.00000000,0.00000000,0.00000000,8.75000000,0,NULL,NULL,0,3.75000000,NULL,0,2,NULL,NULL,'',NULL,NULL,'USD',8.75000000,8.75000000,0.00000000,8.75000000,NULL);
/*!40000 ALTER TABLE `llxas_commandedet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_commandedet_extrafields`
--

DROP TABLE IF EXISTS `llxas_commandedet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_commandedet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_extrafields` (`fk_object`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_commandedet_extrafields`
--

LOCK TABLES `llxas_commandedet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_commandedet_extrafields` DISABLE KEYS */;
INSERT INTO `llxas_commandedet_extrafields` (`rowid`, `tms`, `fk_object`, `import_key`, `notes`) VALUES (1,'2023-01-19 16:01:33',37,NULL,'text for testing purposes '),(2,'2023-01-23 17:36:54',73,NULL,NULL),(3,'2023-02-07 18:21:30',74,NULL,NULL),(4,'2023-02-07 18:23:11',75,NULL,NULL),(5,'2023-02-07 18:24:24',76,NULL,NULL),(6,'2023-02-07 18:27:10',77,NULL,NULL),(7,'2023-02-07 18:42:50',78,NULL,NULL),(8,'2023-02-07 18:43:10',79,NULL,NULL);
/*!40000 ALTER TABLE `llxas_commandedet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_comment`
--

DROP TABLE IF EXISTS `llxas_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_comment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `element_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `import_key` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_comment`
--

LOCK TABLES `llxas_comment` WRITE;
/*!40000 ALTER TABLE `llxas_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_const`
--

DROP TABLE IF EXISTS `llxas_const`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_const` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT 'string',
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_const` (`name`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=595 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_const`
--

LOCK TABLES `llxas_const` WRITE;
/*!40000 ALTER TABLE `llxas_const` DISABLE KEYS */;
INSERT INTO `llxas_const` (`rowid`, `name`, `entity`, `value`, `type`, `visible`, `note`, `tms`) VALUES (2,'MAIN_FEATURES_LEVEL',0,'0','chaine',1,'Level of features to show: -1=stable+deprecated, 0=stable only (default), 1=stable+experimental, 2=stable+experimental+development','2021-11-10 17:54:38'),(3,'MAILING_LIMIT_SENDBYWEB',0,'25','chaine',1,'Number of targets to defined packet size when sending mass email','2021-11-10 17:54:38'),(4,'MAIN_ENABLE_LOG_TO_HTML',0,'0','chaine',1,'If this option is set to 1, it is possible to see log output at end of HTML sources by adding paramater logtohtml=1 on URL. Module log must also be enabled.','2021-11-10 17:54:38'),(5,'MAIN_SECURITY_CSRF_WITH_TOKEN',0,'0','chaine',1,'If this option is set to 1, a CSRF protection using an antiCSRF token is added.','2021-11-10 17:54:38'),(6,'SYSLOG_HANDLERS',0,'[\"mod_syslog_file\"]','chaine',0,'Which logger to use','2021-11-10 17:54:38'),(7,'SYSLOG_FILE',0,'DOL_DATA_ROOT/dolibarr.log','chaine',0,'Directory where to write log file','2021-11-10 17:54:38'),(8,'SYSLOG_LEVEL',0,'7','chaine',0,'Level of debug info to show','2021-11-10 17:54:38'),(9,'MAIN_UPLOAD_DOC',0,'2048','chaine',0,'Max size for file upload (0 means no upload allowed)','2021-11-10 17:54:38'),(10,'MAIN_ENABLE_OVERWRITE_TRANSLATION',1,'1','chaine',0,'Enable translation overwrite','2021-11-10 17:54:38'),(11,'MAIN_ENABLE_DEFAULT_VALUES',1,'1','chaine',0,'Enable default value overwrite','2021-11-10 17:54:38'),(13,'MAIN_MAIL_SMTP_SERVER',1,'','chaine',0,'Host or ip address for SMTP server','2021-11-10 17:54:38'),(14,'MAIN_MAIL_SMTP_PORT',1,'','chaine',0,'Port for SMTP server','2021-11-10 17:54:38'),(15,'MAIN_MAIL_EMAIL_FROM',1,'robot@domain.com','chaine',0,'email emitter for Dolibarr automatic emails','2021-11-10 17:54:38'),(16,'MAIN_SIZE_LISTE_LIMIT',0,'25','chaine',0,'Maximum length of lists','2021-11-10 17:54:38'),(17,'MAIN_SIZE_SHORTLIST_LIMIT',0,'3','chaine',0,'Maximum length of short lists','2021-11-10 17:54:38'),(18,'MAIN_MENU_STANDARD',0,'eldy_menu.php','chaine',0,'Menu manager for internal users','2021-11-10 17:54:38'),(19,'MAIN_MENUFRONT_STANDARD',0,'eldy_menu.php','chaine',0,'Menu manager for external users','2021-11-10 17:54:38'),(20,'MAIN_MENU_SMARTPHONE',0,'eldy_menu.php','chaine',0,'Menu manager for internal users using smartphones','2021-11-10 17:54:38'),(21,'MAIN_MENUFRONT_SMARTPHONE',0,'eldy_menu.php','chaine',0,'Menu manager for external users using smartphones','2021-11-10 17:54:38'),(22,'MAIN_DELAY_ACTIONS_TODO',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées','2021-11-10 17:54:38'),(23,'MAIN_DELAY_ORDERS_TO_PROCESS',1,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes clients non traitées','2021-11-10 17:54:38'),(24,'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées','2021-11-10 17:54:38'),(25,'MAIN_DELAY_PROPALS_TO_CLOSE',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales à cloturer','2021-11-10 17:54:38'),(26,'MAIN_DELAY_PROPALS_TO_BILL',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales non facturées','2021-11-10 17:54:38'),(27,'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures client impayées','2021-11-10 17:54:38'),(28,'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY',1,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées','2021-11-10 17:54:38'),(29,'MAIN_DELAY_NOT_ACTIVATED_SERVICES',1,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services à activer','2021-11-10 17:54:38'),(30,'MAIN_DELAY_RUNNING_SERVICES',1,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services expirés','2021-11-10 17:54:38'),(31,'MAIN_DELAY_MEMBERS',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard','2021-11-10 17:54:38'),(32,'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE',1,'62','chaine',0,'Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire','2021-11-10 17:54:38'),(33,'MAIN_DELAY_EXPENSEREPORTS_TO_PAY',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur les notes de frais impayées','2021-11-10 17:54:38'),(34,'MAIN_FIX_FOR_BUGGED_MTA',1,'1','chaine',1,'Set constant to fix email ending from PHP with some linux ike system','2021-11-10 17:54:38'),(35,'MAILING_EMAIL_FROM',1,'dolibarr@domain.com','chaine',0,'EMail emmetteur pour les envois d emailings','2021-11-10 17:54:38'),(36,'PRODUCT_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/products','chaine',0,NULL,'2021-11-10 17:54:38'),(37,'CONTRACT_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/contracts','chaine',0,NULL,'2021-11-10 17:54:38'),(38,'USERGROUP_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/usergroups','chaine',0,NULL,'2021-11-10 17:54:38'),(39,'USER_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/users','chaine',0,NULL,'2021-11-10 17:54:38'),(40,'PRODUCT_PRICE_BASE_TYPE',0,'HT','string',0,NULL,'2021-11-10 17:54:38'),(42,'DATABASE_PWD_ENCRYPTED',1,'1','chaine',0,'','2021-11-10 17:55:49'),(43,'MAIN_SECURITY_SALT',0,'20211110125549','chaine',0,'','2021-11-10 17:55:49'),(44,'MAIN_SECURITY_HASH_ALGO',0,'password_hash','chaine',0,'','2021-11-10 17:55:49'),(45,'MAIN_VERSION_FIRST_INSTALL',0,'13.0.2','chaine',0,'Dolibarr version when first install','2021-11-10 17:55:49'),(46,'MAIN_VERSION_LAST_INSTALL',0,'13.0.2','chaine',0,'Dolibarr version when last install','2021-11-10 17:55:49'),(48,'MAIN_MODULE_REPORTS',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"201.97.204.94\"}','2021-11-22 16:06:01'),(49,'MAIN_MODULE_REPORTS_CSS',1,'[\"\\/reports\\/css\\/reports.css\"]','chaine',0,NULL,'2021-11-22 16:06:01'),(53,'COMMANDE_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/orders','chaine',0,NULL,'2022-01-08 01:29:08'),(56,'SOCIETE_CODECOMPTA_ADDON',1,'mod_codecompta_panicum','chaine',0,'Module to control third parties codes','2022-01-08 01:29:08'),(58,'COMPANY_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/thirdparties','chaine',0,NULL,'2022-01-08 01:29:08'),(59,'SOCIETE_ADD_REF_IN_LIST',1,'0','yesno',0,'Display customer ref into select list','2022-01-08 01:29:08'),(69,'MAIN_MODULE_TAX',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"189.216.190.221\"}','2022-02-08 01:37:49'),(76,'TAX_MODE',1,'1','chaine',0,'','2022-02-08 01:38:58'),(77,'TAX_MODE_SELL_PRODUCT',1,'invoice','chaine',0,'','2022-02-08 01:38:58'),(78,'TAX_MODE_BUY_PRODUCT',1,'invoice','chaine',0,'','2022-02-08 01:38:58'),(79,'TAX_MODE_SELL_SERVICE',1,'invoice','chaine',0,'','2022-02-08 01:38:58'),(80,'TAX_MODE_BUY_SERVICE',1,'invoice','chaine',0,'','2022-02-08 01:38:58'),(81,'MAIN_INFO_VAT_RETURN',1,'0','chaine',0,'','2022-02-08 01:38:58'),(91,'TICKET_ENABLE_PUBLIC_INTERFACE',1,'0','chaine',0,'Enable ticket public interface','2022-02-11 22:55:42'),(93,'TICKET_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/tickets','chaine',0,'Ticket templates ODT/ODS directory for templates','2022-02-11 22:55:42'),(95,'MAIN_AGENDA_ACTIONAUTO_COMPANY_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(96,'MAIN_AGENDA_ACTIONAUTO_COMPANY_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(97,'MAIN_AGENDA_ACTIONAUTO_COMPANY_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(98,'MAIN_AGENDA_ACTIONAUTO_PROPAL_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(99,'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLOSE_SIGNED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(100,'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLOSE_REFUSED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(101,'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLASSIFY_BILLED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(102,'MAIN_AGENDA_ACTIONAUTO_PROPAL_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(103,'MAIN_AGENDA_ACTIONAUTO_PROPAL_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(104,'MAIN_AGENDA_ACTIONAUTO_ORDER_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(105,'MAIN_AGENDA_ACTIONAUTO_ORDER_CLOSE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(106,'MAIN_AGENDA_ACTIONAUTO_ORDER_CLASSIFY_BILLED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(107,'MAIN_AGENDA_ACTIONAUTO_ORDER_CANCEL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(108,'MAIN_AGENDA_ACTIONAUTO_ORDER_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(109,'MAIN_AGENDA_ACTIONAUTO_ORDER_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(110,'MAIN_AGENDA_ACTIONAUTO_BILL_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(111,'MAIN_AGENDA_ACTIONAUTO_BILL_PAYED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(112,'MAIN_AGENDA_ACTIONAUTO_BILL_CANCEL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(113,'MAIN_AGENDA_ACTIONAUTO_BILL_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(114,'MAIN_AGENDA_ACTIONAUTO_BILL_UNVALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(115,'MAIN_AGENDA_ACTIONAUTO_BILL_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(116,'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(117,'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(118,'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_CLOSE_SIGNED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(119,'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_CLOSE_REFUSED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(120,'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(121,'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(122,'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_APPROVE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(123,'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_SUBMIT',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(124,'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_RECEIVE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(125,'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_REFUSE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(126,'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(127,'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_CLASSIFY_BILLED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(128,'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(129,'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(130,'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_UNVALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(131,'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_PAYED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(132,'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(133,'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_CANCELED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(134,'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(135,'MAIN_AGENDA_ACTIONAUTO_CONTRACT_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(136,'MAIN_AGENDA_ACTIONAUTO_CONTRACT_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(137,'MAIN_AGENDA_ACTIONAUTO_CONTRACT_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(138,'MAIN_AGENDA_ACTIONAUTO_FICHINTER_MODIFY',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(139,'MAIN_AGENDA_ACTIONAUTO_SHIPPING_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(140,'MAIN_AGENDA_ACTIONAUTO_SHIPPING_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(141,'MAIN_AGENDA_ACTIONAUTO_SHIPPING_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(142,'MAIN_AGENDA_ACTIONAUTO_RECEPTION_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(143,'MAIN_AGENDA_ACTIONAUTO_RECEPTION_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(144,'MAIN_AGENDA_ACTIONAUTO_MEMBER_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(145,'MAIN_AGENDA_ACTIONAUTO_MEMBER_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(146,'MAIN_AGENDA_ACTIONAUTO_MEMBER_MODIFY',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(147,'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(148,'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_MODIFY',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(149,'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(150,'MAIN_AGENDA_ACTIONAUTO_MEMBER_RESILIATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(151,'MAIN_AGENDA_ACTIONAUTO_MEMBER_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(152,'MAIN_AGENDA_ACTIONAUTO_FICHINTER_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(153,'MAIN_AGENDA_ACTIONAUTO_FICHINTER_CLASSIFY_BILLED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(154,'MAIN_AGENDA_ACTIONAUTO_FICHINTER_CLASSIFY_UNBILLED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(155,'MAIN_AGENDA_ACTIONAUTO_FICHINTER_REOPEN',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(156,'MAIN_AGENDA_ACTIONAUTO_FICHINTER_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(157,'MAIN_AGENDA_ACTIONAUTO_FICHINTER_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(158,'MAIN_AGENDA_ACTIONAUTO_PRODUCT_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(159,'MAIN_AGENDA_ACTIONAUTO_PRODUCT_MODIFY',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(160,'MAIN_AGENDA_ACTIONAUTO_PRODUCT_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(161,'MAIN_AGENDA_ACTIONAUTO_CONTACT_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(162,'MAIN_AGENDA_ACTIONAUTO_CONTACT_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(163,'MAIN_AGENDA_ACTIONAUTO_CONTACT_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(164,'MAIN_AGENDA_ACTIONAUTO_PROJECT_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(165,'MAIN_AGENDA_ACTIONAUTO_PROJECT_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(166,'MAIN_AGENDA_ACTIONAUTO_PROJECT_MODIFY',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(167,'MAIN_AGENDA_ACTIONAUTO_PROJECT_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(168,'MAIN_AGENDA_ACTIONAUTO_TICKET_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(169,'MAIN_AGENDA_ACTIONAUTO_TICKET_MODIFY',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(170,'MAIN_AGENDA_ACTIONAUTO_TICKET_ASSIGNED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(171,'MAIN_AGENDA_ACTIONAUTO_TICKET_CLOSE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(172,'MAIN_AGENDA_ACTIONAUTO_TICKET_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(173,'MAIN_AGENDA_ACTIONAUTO_TICKET_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(174,'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(175,'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(176,'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_APPROVE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(177,'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_PAID',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(178,'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(179,'MAIN_AGENDA_ACTIONAUTO_HOLIDAY_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(180,'MAIN_AGENDA_ACTIONAUTO_HOLIDAY_APPROVE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(181,'MAIN_AGENDA_ACTIONAUTO_USER_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(182,'MAIN_AGENDA_ACTIONAUTO_BOM_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(183,'MAIN_AGENDA_ACTIONAUTO_BOM_UNVALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(184,'MAIN_AGENDA_ACTIONAUTO_BOM_CLOSE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(185,'MAIN_AGENDA_ACTIONAUTO_BOM_REOPEN',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(186,'MAIN_AGENDA_ACTIONAUTO_BOM_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(187,'MAIN_AGENDA_ACTIONAUTO_MRP_MO_VALIDATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(188,'MAIN_AGENDA_ACTIONAUTO_MRP_MO_PRODUCED',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(189,'MAIN_AGENDA_ACTIONAUTO_MRP_MO_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(190,'MAIN_AGENDA_ACTIONAUTO_MRP_MO_CANCEL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(191,'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTJOBPOSITION_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(192,'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTJOBPOSITION_MODIFY',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(193,'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTJOBPOSITION_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(194,'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTJOBPOSITION_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(195,'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTCANDIDATURE_CREATE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(196,'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTCANDIDATURE_MODIFY',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(197,'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTCANDIDATURE_SENTBYMAIL',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(198,'MAIN_AGENDA_ACTIONAUTO_RECRUITMENTCANDIDATURE_DELETE',1,'1','chaine',0,NULL,'2022-02-11 22:55:42'),(200,'SUPPLIER_ORDER_WITH_PREDEFINED_PRICES_ONLY',1,'1','chaine',1,'Filter prodcuts with thrids on PO','2022-02-17 02:10:13'),(201,'MAIN_MODULE_LISTEXPORTIMPORT',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.164.190\"}','2022-04-26 00:16:29'),(202,'MAIN_MODULE_LISTEXPORTIMPORT_HOOKS',1,'[\"main\"]','chaine',0,NULL,'2022-04-26 00:16:29'),(203,'LIST_EXPORT_IMPORT_USE_COMPACT_MODE',1,'1','chaine',0,'Use compact mode of list export/import module','2022-04-26 00:16:29'),(204,'LIST_EXPORT_IMPORT_ENABLE_FREE_LIST',1,'0','chaine',0,'Enable free list button of list export/import module','2022-04-26 00:16:29'),(206,'EXPORT_CSV_SEPARATOR_TO_USE',1,',','chaine',0,'','2022-04-26 00:16:52'),(209,'FACTURE_ADDON_PDF',1,'crabe','chaine',0,'Name of PDF model of invoice','2022-05-23 22:43:06'),(210,'FACTURE_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/invoices','chaine',0,NULL,'2022-05-23 22:43:06'),(217,'EXPENSEREPORT_ADDON_PDF',1,'standard','chaine',0,'Name of manager to build PDF expense reports documents','2022-05-27 13:38:37'),(218,'EXPENSEREPORT_ADDON',1,'mod_expensereport_jade','chaine',0,'Name of manager to generate expense report ref number','2022-05-27 13:38:37'),(219,'MAIN_DELAY_EXPENSEREPORTS',1,'15','chaine',0,'Tolerance delay (in days) before alert for expense reports to approve','2022-05-27 13:38:37'),(220,'EXPENSEREPORT_SAND_MASK',1,'ER{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:38:47'),(222,'COMPANY_ELEPHANT_MASK_CUSTOMER',1,'CU{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:42:16'),(223,'COMPANY_ELEPHANT_MASK_SUPPLIER',1,'SU{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:42:16'),(224,'SOCIETE_CODECLIENT_ADDON',1,'mod_codeclient_elephant','chaine',0,'','2022-05-27 13:42:19'),(225,'MAIN_MODULE_PROPALE',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.188.76.190\"}','2022-05-27 13:42:48'),(226,'PROPALE_ADDON_PDF',1,'azur','chaine',0,'Name of the proposal generation manager in PDF format','2022-05-27 13:42:48'),(228,'PROPALE_VALIDITY_DURATION',1,'15','chaine',0,'Duration of validity of business proposals','2022-05-27 13:42:48'),(229,'PROPALE_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/proposals','chaine',0,NULL,'2022-05-27 13:42:48'),(231,'PROPALE_ADDON',1,'mod_propale_saphir','chaine',0,'','2022-05-27 13:43:31'),(232,'PROPALE_SAPHIR_MASK',1,'PR{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:43:36'),(234,'MAIN_MODULE_EXPEDITION',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.188.76.190\"}','2022-05-27 13:44:53'),(235,'EXPEDITION_ADDON_PDF',1,'rouget','chaine',0,'Nom du gestionnaire de generation des bons expeditions en PDF','2022-05-27 13:44:53'),(237,'EXPEDITION_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/shipments','chaine',0,NULL,'2022-05-27 13:44:53'),(238,'DELIVERY_ADDON_PDF',1,'typhon','chaine',0,'Nom du gestionnaire de generation des bons de reception en PDF','2022-05-27 13:44:53'),(239,'DELIVERY_ADDON_NUMBER',1,'mod_delivery_jade','chaine',0,'Nom du gestionnaire de numerotation des bons de reception','2022-05-27 13:44:53'),(240,'DELIVERY_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/deliveries','chaine',0,NULL,'2022-05-27 13:44:53'),(241,'MAIN_SUBMODULE_EXPEDITION',1,'1','chaine',0,'Enable delivery receipts','2022-05-27 13:44:53'),(243,'EXPEDITION_ADDON_NUMBER',1,'mod_expedition_ribera','chaine',0,'','2022-05-27 13:45:17'),(244,'MAIN_MODULE_CONTRAT',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.188.76.190\"}','2022-05-27 13:46:04'),(246,'CONTRACT_ADDON_PDF',1,'strato','chaine',0,'Name of PDF model of contract','2022-05-27 13:46:04'),(247,'CONTRACT_MAGRE_MASK',1,'CT{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:46:16'),(248,'CONTRACT_ADDON',1,'mod_contract_magre','chaine',0,'','2022-05-27 13:46:18'),(249,'MAIN_MODULE_FICHEINTER',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.188.76.190\"}','2022-05-27 13:47:03'),(250,'FICHEINTER_ADDON_PDF',1,'soleil','chaine',0,NULL,'2022-05-27 13:47:03'),(252,'FICHINTER_ARTIC_MASK',1,'FI{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:47:13'),(253,'FICHEINTER_ADDON',1,'arctic','chaine',0,'','2022-05-27 13:47:14'),(254,'TICKET_UNIVERSAL_MASK',1,'TS{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:47:28'),(255,'TICKET_ADDON',1,'mod_ticket_universal','chaine',0,'','2022-05-27 13:48:11'),(257,'COMMANDE_SUPPLIER_ADDON_PDF',1,'muscadet','chaine',0,'Nom du gestionnaire de generation des bons de commande en PDF','2022-05-27 13:48:23'),(260,'SUPPLIER_ORDER_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/supplier_orders','chaine',0,NULL,'2022-05-27 13:48:23'),(261,'COMMANDE_FOURNISSEUR_ORCHIDEE_MASK',1,'PO{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:48:32'),(262,'COMMANDE_SUPPLIER_ADDON_NUMBER',1,'mod_commande_fournisseur_orchidee','chaine',0,'','2022-05-27 13:48:34'),(263,'SUPPLIER_INVOICE_TULIP_MASK',1,'SI{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:49:33'),(264,'SUPPLIER_CREDIT_TULIP_MASK',1,'SC{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:49:33'),(265,'INVOICE_SUPPLIER_ADDON_NUMBER',1,'mod_facture_fournisseur_tulip','chaine',0,'','2022-05-27 13:49:34'),(266,'SUPPLIER_PAYMENT_BRODATOR_MASK',1,'SPAY{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:49:42'),(267,'SUPPLIER_PAYMENT_ADDON',1,'mod_supplier_payment_brodator','chaine',0,'','2022-05-27 13:49:45'),(269,'SUPPLIER_PROPOSAL_ADDON_PDF',1,'aurore','chaine',0,'Name of submodule to generate PDF for supplier quotation request','2022-05-27 13:49:59'),(271,'SUPPLIER_PROPOSAL_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/supplier_proposals','chaine',0,NULL,'2022-05-27 13:49:59'),(272,'SUPPLIER_PROPOSAL_SAPHIR_MASK',1,'RQ{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:50:08'),(273,'SUPPLIER_PROPOSAL_ADDON',1,'mod_supplier_proposal_saphir','chaine',0,'','2022-05-27 13:50:10'),(274,'MAIN_MODULE_RECEPTION',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.188.76.190\"}','2022-05-27 13:50:23'),(275,'RECEPTION_ADDON_PDF',1,'squille','chaine',0,'Nom du gestionnaire de generation des bons receptions en PDF','2022-05-27 13:50:23'),(277,'RECEPTION_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/receptions','chaine',0,NULL,'2022-05-27 13:50:23'),(278,'MAIN_SUBMODULE_RECEPTION',1,'1','chaine',0,'Enable receptions','2022-05-27 13:50:23'),(279,'RECEPTION_MOONSTONE_MASK',1,'RCP{mm}{dd}{yy}-{00000}','chaine',0,'','2022-05-27 13:50:45'),(280,'RECEPTION_ADDON_NUMBER',1,'mod_reception_moonstone','chaine',0,'','2022-05-27 13:50:48'),(282,'INCOTERM_ACTIVATE',1,'','chaine',0,'Description de INCOTERM_ACTIVATE','2022-05-27 13:51:06'),(287,'SALARIES_ACCOUNTING_ACCOUNT_PAYMENT',1,'421','chaine',0,NULL,'2022-05-27 13:56:43'),(288,'SALARIES_ACCOUNTING_ACCOUNT_CHARGE',1,'641','chaine',0,NULL,'2022-05-27 13:56:43'),(289,'MAIN_MODULE_PAYMENTBYBANKTRANSFER',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"201.97.232.229\"}','2022-05-27 13:56:45'),(291,'MAIN_MODULE_PRELEVEMENT',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"201.97.232.229\"}','2022-05-27 13:56:54'),(292,'BANK_ADDON_PDF',1,'sepamandate','chaine',0,'Name of manager to generate SEPA mandate','2022-05-27 13:56:54'),(298,'MAIN_MAX_DECIMALS_UNIT',1,'3','chaine',0,'','2022-06-16 17:05:52'),(299,'MAIN_MAX_DECIMALS_TOT',1,'2','chaine',0,'','2022-06-16 17:05:52'),(300,'MAIN_MAX_DECIMALS_SHOWN',1,'8','chaine',0,'','2022-06-16 17:05:52'),(301,'MAIN_MODULE_UNBOXUTIL',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.188.76.190\"}','2022-06-17 19:59:48'),(302,'MAIN_MODULE_UNBOXUTIL_TRIGGERS',1,'1','chaine',0,NULL,'2022-06-17 19:59:48'),(303,'MAIN_MODULE_UNBOXUTIL_LOGIN',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(304,'MAIN_MODULE_UNBOXUTIL_SUBSTITUTIONS',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(305,'MAIN_MODULE_UNBOXUTIL_MENUS',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(306,'MAIN_MODULE_UNBOXUTIL_TPL',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(307,'MAIN_MODULE_UNBOXUTIL_BARCODE',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(308,'MAIN_MODULE_UNBOXUTIL_MODELS',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(309,'MAIN_MODULE_UNBOXUTIL_PRINTING',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(310,'MAIN_MODULE_UNBOXUTIL_THEME',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(311,'MAIN_MODULE_UNBOXUTIL_MODULEFOREXTERNAL',1,'0','chaine',0,NULL,'2022-06-17 19:59:48'),(341,'MAIN_LOGIN_BACKGROUND',1,'fusionbrands_display.jpg','chaine',0,'','2022-11-09 18:19:04'),(343,'MAIN_LANG_DEFAULT',1,'en_US','chaine',0,'','2022-11-09 18:21:07'),(345,'MAIN_THEME',1,'eldy','chaine',0,'','2022-11-09 18:21:07'),(346,'THEME_ELDY_TOPMENU_BACK1',1,'34,0,109','chaine',0,'','2022-11-09 18:21:07'),(347,'MAIN_SIZE_LISTE_LIMIT',1,'25','chaine',0,'','2022-11-09 18:21:07'),(348,'MAIN_SIZE_SHORTLIST_LIMIT',1,'3','chaine',0,'','2022-11-09 18:21:07'),(349,'MAIN_START_WEEK',1,'1','chaine',0,'','2022-11-09 18:21:07'),(350,'MAIN_DEFAULT_WORKING_DAYS',1,'1-5','chaine',0,'','2022-11-09 18:21:07'),(351,'MAIN_DEFAULT_WORKING_HOURS',1,'9-18','chaine',0,'','2022-11-09 18:21:07'),(352,'MAIN_FIRSTNAME_NAME_POSITION',1,'0','chaine',0,'','2022-11-09 18:21:07'),(353,'MAIN_SHOW_LOGO',1,'1','chaine',0,'','2022-11-09 18:40:44'),(354,'MAIN_MODULE_PRODUCT',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 18:41:36'),(355,'PRODUCT_CODEPRODUCT_ADDON',1,'mod_codeproduct_leopard','chaine',0,'Module to control product codes','2022-11-09 18:41:36'),(358,'MAIN_MODULE_PROJET',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 18:41:45'),(359,'PROJECT_ADDON_PDF',1,'baleine','chaine',0,'Name of PDF/ODT project manager class','2022-11-09 18:41:45'),(360,'PROJECT_ADDON',1,'mod_project_simple','chaine',0,'Name of Numbering Rule project manager class','2022-11-09 18:41:45'),(361,'PROJECT_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/projects','chaine',0,NULL,'2022-11-09 18:41:45'),(362,'PROJECT_TASK_ADDON_PDF',1,'','chaine',0,'Name of PDF/ODT tasks manager class','2022-11-09 18:41:45'),(363,'PROJECT_TASK_ADDON',1,'mod_task_simple','chaine',0,'Name of Numbering Rule task manager class','2022-11-09 18:41:45'),(364,'PROJECT_TASK_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/tasks','chaine',0,NULL,'2022-11-09 18:41:45'),(365,'PROJECT_USE_OPPORTUNITIES',1,'1','chaine',0,NULL,'2022-11-09 18:41:45'),(366,'MAIN_DELAY_PROJECT_TO_CLOSE',1,'7','chaine',0,NULL,'2022-11-09 18:41:45'),(367,'MAIN_DELAY_TASKS_TODO',1,'7','chaine',0,NULL,'2022-11-09 18:41:45'),(369,'HOLIDAY_ADDON',1,'mod_holiday_madonna','chaine',0,'Nom du gestionnaire de numerotation des congés','2022-11-09 18:41:53'),(370,'HOLIDAY_ADDON_PDF',1,'celebrate','chaine',0,'Name of PDF model of holiday','2022-11-09 18:41:53'),(371,'HOLIDAY_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/holiday','chaine',0,NULL,'2022-11-09 18:41:53'),(372,'MAIN_MODULE_SUPPLIERPROPOSAL',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 18:41:59'),(373,'MAIN_MODULE_LOAN',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 18:42:11'),(374,'LOAN_ACCOUNTING_ACCOUNT_CAPITAL',1,'164','chaine',0,NULL,'2022-11-09 18:42:11'),(375,'LOAN_ACCOUNTING_ACCOUNT_INSURANCE',1,'6162','chaine',0,NULL,'2022-11-09 18:42:11'),(377,'MAIN_MODULE_MARGIN_TABS_0',1,'product:+margin:Margins:margins:$user->rights->margins->liretous:/margin/tabs/productMargins.php?id=__ID__','chaine',0,NULL,'2022-11-09 18:42:14'),(378,'MAIN_MODULE_MARGIN_TABS_1',1,'thirdparty:+margin:Margins:margins:empty($user->socid) && $user->rights->margins->liretous && ($object->client > 0):/margin/tabs/thirdpartyMargins.php?socid=__ID__','chaine',0,NULL,'2022-11-09 18:42:14'),(379,'MARGIN_TYPE',1,'costprice','chaine',0,'Rule for margin calculation by default','2022-11-09 18:42:14'),(381,'MAIN_COMPANY_CODE_ALWAYS_REQUIRED',1,'1','chaine',0,'With this constants on, third party code is always required whatever is numbering module behaviour','2022-11-09 18:42:16'),(382,'MAIN_BANK_ACCOUNTANCY_CODE_ALWAYS_REQUIRED',1,'1','chaine',0,'With this constants on, bank account number is always required','2022-11-09 18:42:16'),(383,'ACCOUNTING_ACCOUNT_SUSPENSE',1,'471','chaine',0,NULL,'2022-11-09 18:42:16'),(384,'ACCOUNTING_ACCOUNT_TRANSFER_CASH',1,'58','chaine',0,NULL,'2022-11-09 18:42:16'),(385,'CHARTOFACCOUNTS',1,'2','chaine',0,NULL,'2022-11-09 18:42:16'),(386,'ACCOUNTING_EXPORT_MODELCSV',1,'1','chaine',0,NULL,'2022-11-09 18:42:16'),(387,'ACCOUNTING_LENGTH_GACCOUNT',1,'','chaine',0,NULL,'2022-11-09 18:42:16'),(388,'ACCOUNTING_LENGTH_AACCOUNT',1,'','chaine',0,NULL,'2022-11-09 18:42:16'),(389,'ACCOUNTING_LIST_SORT_VENTILATION_TODO',1,'1','yesno',0,NULL,'2022-11-09 18:42:16'),(390,'ACCOUNTING_LIST_SORT_VENTILATION_DONE',1,'1','yesno',0,NULL,'2022-11-09 18:42:16'),(391,'ACCOUNTING_EXPORT_DATE',1,'%d%m%Y','chaine',0,NULL,'2022-11-09 18:42:16'),(392,'ACCOUNTING_EXPORT_SEPARATORCSV',1,',','string',0,NULL,'2022-11-09 18:42:16'),(393,'ACCOUNTING_EXPORT_FORMAT',1,'csv','chaine',0,NULL,'2022-11-09 18:42:16'),(395,'MAIN_MODULE_STOCK',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 19:03:32'),(396,'STOCK_ALLOW_NEGATIVE_TRANSFER',1,'1','chaine',1,NULL,'2022-11-09 19:03:32'),(397,'STOCK_ADDON_PDF',1,'standard','chaine',0,'Name of PDF model of stock','2022-11-09 19:03:32'),(398,'MOUVEMENT_ADDON_PDF',1,'stdmovement','chaine',0,'Name of PDF model of stock mouvement','2022-11-09 19:03:32'),(399,'STOCK_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/stocks','chaine',0,NULL,'2022-11-09 19:03:32'),(400,'MOUVEMENT_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/stocks/mouvements','chaine',0,NULL,'2022-11-09 19:03:32'),(403,'ECM_AUTO_TREE_ENABLED',1,'1','chaine',0,'Auto tree is enabled by default','2022-11-09 19:03:42'),(404,'MAIN_MODULE_KANVIEW',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 19:03:46'),(405,'MAIN_MODULE_KANVIEW_TRIGGERS',1,'0','chaine',0,NULL,'2022-11-09 19:03:46'),(406,'MAIN_MODULE_KANVIEW_LOGIN',1,'0','chaine',0,NULL,'2022-11-09 19:03:46'),(407,'MAIN_MODULE_KANVIEW_SUBSTITUTIONS',1,'0','chaine',0,NULL,'2022-11-09 19:03:46'),(408,'MAIN_MODULE_KANVIEW_MENUS',1,'0','chaine',0,NULL,'2022-11-09 19:03:46'),(409,'MAIN_MODULE_KANVIEW_THEME',1,'0','chaine',0,NULL,'2022-11-09 19:03:46'),(410,'MAIN_MODULE_KANVIEW_TPL',1,'0','chaine',0,NULL,'2022-11-09 19:03:46'),(411,'MAIN_MODULE_KANVIEW_BARCODE',1,'0','chaine',0,NULL,'2022-11-09 19:03:46'),(412,'MAIN_MODULE_KANVIEW_MODELS',1,'0','chaine',0,NULL,'2022-11-09 19:03:46'),(413,'KANVIEW_HOME_PAGE',1,'projets','string',0,'KANVIEW_HOME_PAGE','2022-11-09 19:03:46'),(414,'KANVIEW_PROJETS_TAG',1,'opp_amount','string',0,'KANVIEW_PROJETS_TAG','2022-11-09 19:03:46'),(415,'KANVIEW_PROJETS_DRAFT_COLOR',1,'#46c6f4','string',0,'KANVIEW_PROJETS_DRAFT_COLOR','2022-11-09 19:03:46'),(416,'KANVIEW_PROJETS_OPEN_COLOR',1,'#73bf44','string',0,'KANVIEW_PROJETS_OPEN_COLOR','2022-11-09 19:03:46'),(417,'KANVIEW_PROJETS_CLOSED_COLOR',1,'#ff0000','string',0,'KANVIEW_PROJETS_CLOSED_COLOR','2022-11-09 19:03:46'),(418,'KANVIEW_TASKS_TAG',1,'task_period','string',0,'KANVIEW_TASKS_TAG','2022-11-09 19:03:46'),(419,'KANVIEW_TASKS_OK_COLOR',1,'#73bf44','string',0,'KANVIEW_TASKS_OK_COLOR','2022-11-09 19:03:46'),(420,'KANVIEW_TASKS_LATE1_COLOR',1,'#f7991d','string',0,'KANVIEW_TASKS_LATE1_COLOR','2022-11-09 19:03:46'),(421,'KANVIEW_TASKS_LATE2_COLOR',1,'#ff0000','string',0,'KANVIEW_TASKS_LATE2_COLOR','2022-11-09 19:03:46'),(422,'KANVIEW_PROPALS_TAG',1,'datep','string',0,'KANVIEW_PROPALS_TAG','2022-11-09 19:03:46'),(423,'KANVIEW_INVOICES_TAG',1,'datef','string',0,'KANVIEW_INVOICES_TAG','2022-11-09 19:03:46'),(424,'KANVIEW_PROSPECTS_TAG',1,'prospectlevel_label','string',0,'KANVIEW_PROSPECTS_TAG','2022-11-09 19:03:46'),(425,'KANVIEW_PROSPECTS_PL_HIGH_COLOR',1,'#73bf44','string',0,'KANVIEW_PROSPECTS_PL_HIGH_COLOR','2022-11-09 19:03:46'),(426,'KANVIEW_PROSPECTS_PL_LOW_COLOR',1,'#b76caa','string',0,'KANVIEW_PROSPECTS_PL_LOW_COLOR','2022-11-09 19:03:46'),(427,'KANVIEW_PROSPECTS_PL_MEDIUM_COLOR',1,'#f7991d','string',0,'KANVIEW_PROSPECTS_PL_MEDIUM_COLOR','2022-11-09 19:03:46'),(428,'KANVIEW_PROSPECTS_PL_NONE_COLOR',1,'#ff0000','string',0,'KANVIEW_PROSPECTS_PL_NONE_COLOR','2022-11-09 19:03:46'),(429,'KANVIEW_ORDERS_TAG',1,'amount_ht','string',0,'KANVIEW_ORDERS_TAG','2022-11-09 19:03:46'),(430,'KANVIEW_ORDERS_LATE1_COLOR',1,'#b76caa','string',0,'KANVIEW_ORDERS_LATE1_COLOR','2022-11-09 19:03:46'),(431,'KANVIEW_ORDERS_LATE2_COLOR',1,'#f7991d','string',0,'KANVIEW_ORDERS_LATE2_COLOR','2022-11-09 19:03:46'),(432,'KANVIEW_ORDERS_LATE3_COLOR',1,'#ff0000','string',0,'KANVIEW_ORDERS_LATE3_COLOR','2022-11-09 19:03:46'),(433,'KANVIEW_INVOICES_LATE1_COLOR',1,'#b76caa','string',0,'KANVIEW_INVOICES_LATE1_COLOR','2022-11-09 19:03:46'),(434,'KANVIEW_INVOICES_LATE2_COLOR',1,'#f7991d','string',0,'KANVIEW_INVOICES_LATE2_COLOR','2022-11-09 19:03:46'),(435,'KANVIEW_INVOICES_LATE3_COLOR',1,'#ff0000','string',0,'KANVIEW_INVOICES_LATE3_COLOR','2022-11-09 19:03:46'),(436,'KANVIEW_SHOW_PICTO',1,'1','yesno',0,'KANVIEW_SHOW_PICTO','2022-11-09 19:03:46'),(437,'KANVIEW_PROPALS_LATE1_COLOR',1,'#46c6f4','string',0,'KANVIEW_PROPALS_LATE1_COLOR','2022-11-09 19:03:46'),(438,'KANVIEW_PROPALS_LATE2_COLOR',1,'#f7991d','string',0,'KANVIEW_PROPALS_LATE2_COLOR','2022-11-09 19:03:46'),(439,'KANVIEW_PROPALS_LATE3_COLOR',1,'#b76c99','string',0,'KANVIEW_PROPALS_LATE3_COLOR','2022-11-09 19:03:46'),(440,'KANVIEW_PROPALS_LATE4_COLOR',1,'#ff0000','string',0,'KANVIEW_PROPALS_LATE4_COLOR','2022-11-09 19:03:46'),(441,'KANVIEW_INVOICES_SUPPLIERS_TAG',1,'datef','string',0,'KANVIEW_INVOICES_SUPPLIERS_TAG','2022-11-09 19:03:46'),(442,'KANVIEW_INVOICES_SUPPLIERS_LATE1_COLOR',1,'#b76caa','string',0,'KANVIEW_INVOICES_SUPPLIERS_LATE1_COLOR','2022-11-09 19:03:46'),(443,'KANVIEW_INVOICES_SUPPLIERS_LATE2_COLOR',1,'#f7991d','string',0,'KANVIEW_INVOICES_SUPPLIERS_LATE2_COLOR','2022-11-09 19:03:46'),(444,'KANVIEW_INVOICES_SUPPLIERS_LATE3_COLOR',1,'#ff0000','string',0,'KANVIEW_INVOICES_SUPPLIERS_LATE3_COLOR','2022-11-09 19:03:46'),(445,'KANVIEW_PROJETS_OPENED_PROJECTS_BY_DEFAULT',1,'0','yesno',0,'KANVIEW_PROJETS_OPENED_PROJECTS_BY_DEFAULT','2022-11-09 19:03:46'),(446,'KANVIEW_PROJETS_SYCHRONIZE_OPP_PERCENT_WITH_STATUS',1,'0','yesno',0,'KANVIEW_PROJETS_SYCHRONIZE_OPP_PERCENT_WITH_STATUS','2022-11-09 19:03:46'),(447,'KANVIEW_PROSPECTS_ADD_PROSPECTSCLIENTS',1,'0','yesno',0,'KANVIEW_PROSPECTS_ADD_PROSPECTSCLIENTS','2022-11-09 19:03:46'),(448,'KANVIEW_FILTER_DEFAULT_DATE_START',1,'6','string',0,'KANVIEW_FILTER_DEFAULT_DATE_START','2022-11-09 19:03:46'),(449,'MAIN_MODULE_CATEGORIE',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 19:03:48'),(450,'CATEGORIE_RECURSIV_ADD',1,'0','yesno',0,'Affect parent categories','2022-11-09 19:03:48'),(451,'MAIN_MODULE_BOOKMARK',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 19:03:53'),(453,'MAIN_MODULE_WORKFLOW',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 19:04:05'),(454,'WORKFLOW_ORDER_CLASSIFY_BILLED_PROPAL',1,'1','chaine',0,'WORKFLOW_ORDER_CLASSIFY_BILLED_PROPAL','2022-11-09 19:04:05'),(455,'WORKFLOW_INVOICE_CLASSIFY_BILLED_PROPAL',1,'1','chaine',0,'WORKFLOW_INVOICE_CLASSIFY_BILLED_PROPAL','2022-11-09 19:04:05'),(456,'WORKFLOW_ORDER_CLASSIFY_SHIPPED_SHIPPING',1,'1','chaine',0,'WORKFLOW_ORDER_CLASSIFY_SHIPPED_SHIPPING','2022-11-09 19:04:05'),(457,'WORKFLOW_INVOICE_AMOUNT_CLASSIFY_BILLED_ORDER',1,'1','chaine',0,'WORKFLOW_INVOICE_AMOUNT_CLASSIFY_BILLED_ORDER','2022-11-09 19:04:05'),(458,'WORKFLOW_ORDER_CLASSIFY_BILLED_SUPPLIER_PROPOSAL',1,'1','chaine',0,'WORKFLOW_ORDER_CLASSIFY_BILLED_SUPPLIER_PROPOSAL','2022-11-09 19:04:05'),(459,'WORKFLOW_INVOICE_AMOUNT_CLASSIFY_BILLED_SUPPLIER_ORDER',1,'1','chaine',0,'WORKFLOW_INVOICE_AMOUNT_CLASSIFY_BILLED_SUPPLIER_ORDER','2022-11-09 19:04:05'),(460,'WORKFLOW_BILL_ON_RECEPTION',1,'1','chaine',0,'WORKFLOW_BILL_ON_RECEPTION','2022-11-09 19:04:05'),(461,'MAIN_MODULE_IMPORT',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 19:04:09'),(462,'MAIN_MODULE_EXPORT',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 19:04:11'),(463,'MAIN_MODULE_NOTIFICATION',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.189.142.190\"}','2022-11-09 19:04:31'),(466,'CRON_KEY',0,'','chaine',0,'CRON KEY','2022-11-09 19:04:52'),(469,'MAIN_INFO_SOCIETE_COUNTRY',1,'11:US:United States','chaine',0,'','2023-01-17 20:03:49'),(470,'MAIN_INFO_SOCIETE_STATE',1,'835:TX:Texas','chaine',0,'','2023-01-17 20:03:49'),(471,'MAIN_INFO_SOCIETE_NOM',1,'Fusion Brands','chaine',0,'','2023-01-17 20:03:49'),(472,'MAIN_INFO_SOCIETE_ADDRESS',1,'205 Mercy Way','chaine',0,'','2023-01-17 20:03:49'),(473,'MAIN_INFO_SOCIETE_TOWN',1,'Liberty Hill','chaine',0,'','2023-01-17 20:03:49'),(474,'MAIN_INFO_SOCIETE_ZIP',1,'78642','chaine',0,'','2023-01-17 20:03:49'),(475,'MAIN_MONNAIE',1,'USD','chaine',0,'','2023-01-17 20:03:49'),(476,'MAIN_INFO_SOCIETE_TEL',1,'(512) 876-992','chaine',0,'','2023-01-17 20:03:49'),(477,'MAIN_INFO_SOCIETE_MAIL',1,'sales@fusion-brands.com','chaine',0,'','2023-01-17 20:03:49'),(478,'MAIN_INFO_SOCIETE_WEB',1,'https://fusion-brands.com/','chaine',0,'','2023-01-17 20:03:49'),(479,'MAIN_INFO_SOCIETE_LOGO',1,'logo-05.png','chaine',0,'','2023-01-17 20:03:49'),(480,'MAIN_INFO_SOCIETE_LOGO_SMALL',1,'logo-05_small.png','chaine',0,'','2023-01-17 20:03:49'),(481,'MAIN_INFO_SOCIETE_LOGO_MINI',1,'logo-05_mini.png','chaine',0,'','2023-01-17 20:03:49'),(482,'MAIN_INFO_SOCIETE_LOGO_SQUARRED',1,'logo-05.png','chaine',0,'','2023-01-17 20:03:49'),(483,'MAIN_INFO_SOCIETE_LOGO_SQUARRED_SMALL',1,'logo-05_small.png','chaine',0,'','2023-01-17 20:03:49'),(484,'MAIN_INFO_SOCIETE_LOGO_SQUARRED_MINI',1,'logo-05_mini.png','chaine',0,'','2023-01-17 20:03:49'),(485,'MAIN_INFO_SOCIETE_MANAGERS',1,'Ross Adams','chaine',0,'','2023-01-17 20:03:49'),(486,'MAIN_INFO_SOCIETE_FORME_JURIDIQUE',1,'0','chaine',0,'','2023-01-17 20:03:49'),(487,'SOCIETE_FISCAL_MONTH_START',1,'1','chaine',0,'','2023-01-17 20:03:49'),(488,'FACTURE_TVAOPTION',1,'1','chaine',0,'','2023-01-17 20:03:49'),(489,'FACTURE_ADDON',1,'mod_facture_mercure','chaine',0,'','2023-01-17 22:36:44'),(494,'FACTURE_MERCURE_MASK_INVOICE',1,'INV{yyyy}-{0000}','chaine',0,'','2023-01-17 22:38:12'),(495,'FACTURE_MERCURE_MASK_REPLACEMENT',1,'INR{yyyy}-{00000}','chaine',0,'','2023-01-17 22:38:12'),(496,'FACTURE_MERCURE_MASK_CREDIT',1,'AC{yyyy}-{00000}','chaine',0,'','2023-01-17 22:38:12'),(497,'FACTURE_MERCURE_MASK_DEPOSIT',1,'AV{yyyy}-{00000}','chaine',0,'','2023-01-17 22:38:12'),(498,'PAYMENT_ANT_MASK',1,'PAY{yyyy}-{00000}','chaine',0,'','2023-01-17 22:38:29'),(500,'COMMANDE_ADDON',1,'mod_commande_saphir','chaine',0,'','2023-01-17 22:39:43'),(501,'EXPEDITION_RIBERA_MASK',1,'SH{yyyy}-{00000}','chaine',0,'','2023-01-17 22:40:14'),(518,'MAIN_PDF_FORMAT',1,'USLetter','chaine',0,'','2023-01-23 22:22:53'),(519,'MAIN_PDF_MARGIN_LEFT',1,'10','chaine',0,'','2023-01-23 22:22:53'),(520,'MAIN_PDF_MARGIN_RIGHT',1,'10','chaine',0,'','2023-01-23 22:22:53'),(521,'MAIN_PDF_MARGIN_BOTTOM',1,'10','chaine',0,'','2023-01-23 22:22:53'),(522,'MAIN_PROFID1_IN_ADDRESS',1,'0','chaine',0,'','2023-01-23 22:22:53'),(523,'MAIN_GENERATE_DOCUMENTS_WITHOUT_VAT',1,'0','chaine',0,'','2023-01-23 22:22:53'),(524,'MAIN_TVAINTRA_NOT_IN_ADDRESS',1,'0','chaine',0,'','2023-01-23 22:22:53'),(525,'MAIN_GENERATE_DOCUMENTS_HIDE_DETAILS',1,'0','chaine',0,'','2023-01-23 22:22:53'),(526,'MAIN_GENERATE_DOCUMENTS_HIDE_DESC',1,'0','chaine',0,'','2023-01-23 22:22:53'),(527,'MAIN_GENERATE_DOCUMENTS_HIDE_REF',1,'0','chaine',0,'','2023-01-23 22:22:53'),(528,'MAIN_DOCUMENTS_LOGO_HEIGHT',1,'20','chaine',0,'','2023-01-23 22:22:53'),(529,'MAIN_INVERT_SENDER_RECIPIENT',1,'0','chaine',0,'','2023-01-23 22:22:53'),(530,'MAIN_PDF_USE_ISO_LOCATION',1,'0','chaine',0,'','2023-01-23 22:22:53'),(531,'MAIN_GENERATE_DOCUMENTS_SHOW_FOOT_DETAILS',1,'0','chaine',0,'','2023-01-23 22:22:53'),(532,'PDF_USE_ALSO_LANGUAGE_CODE',1,'0','chaine',0,'','2023-01-23 22:22:53'),(533,'SHOW_SUBPRODUCT_REF_IN_PDF',1,'0','chaine',0,'','2023-01-23 22:22:53'),(534,'MAIN_MODULE_ACCOUNTING',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:16'),(535,'MAIN_MODULE_AGENDA',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:17'),(536,'MAIN_MODULE_BANQUE',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:17'),(537,'MAIN_MODULE_BARCODE',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:18'),(538,'MAIN_MODULE_CRON',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:18'),(539,'MAIN_MODULE_COMMANDE',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:19'),(540,'MAIN_MODULE_ECM',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:19'),(541,'MAIN_MODULE_EXPENSEREPORT',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:19'),(542,'MAIN_MODULE_FACTURE',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:20'),(543,'MAIN_MODULE_FOURNISSEUR',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:20'),(544,'MAIN_MODULE_HOLIDAY',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:21'),(545,'MAIN_MODULE_MARGIN',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:21'),(548,'MAIN_MODULE_PRINTING',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:22'),(549,'MAIN_MODULE_RESOURCE',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:22'),(550,'MAIN_MODULE_SALARIES',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:22'),(551,'MAIN_MODULE_SERVICE',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:22'),(552,'MAIN_MODULE_SOCIETE',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:22'),(553,'MAIN_MODULE_TICKET',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:23'),(554,'MAIN_MODULE_TICKET_TABS_0',1,'thirdparty:+ticket:Tickets:@ticket:$user->rights->ticket->read:/ticket/list.php?socid=__ID__','chaine',0,NULL,'2023-01-25 00:18:23'),(555,'MAIN_MODULE_TICKET_TABS_1',1,'project:+ticket:Tickets:@ticket:$user->rights->ticket->read:/ticket/list.php?projectid=__ID__','chaine',0,NULL,'2023-01-25 00:18:23'),(556,'MAIN_MODULE_TICKET_TRIGGERS',1,'1','chaine',0,NULL,'2023-01-25 00:18:23'),(557,'MAIN_MODULE_USER',0,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:23'),(558,'MAIN_MODULE_VARIANTS',1,'1','string',0,'{\"authorid\":0,\"ip\":\"201.105.28.79\"}','2023-01-25 00:18:24'),(559,'MAIN_VERSION_LAST_UPGRADE',0,'14.0.5','chaine',0,'Dolibarr version for last upgrade','2023-01-25 00:18:26'),(561,'MAIN_USE_PROPAL_REFCLIENT_FOR_ORDER',1,'1','chaine',1,'Copy customer reference from proposal to order.','2023-01-31 00:01:57'),(562,'MAIN_VIEW_LINE_NUMBER',1,'1','chaine',1,'Line numbers','2023-01-31 00:27:51'),(563,'MAIN_LAST_PING_KO_DATE',1,'20230207141041','chaine',0,'','2023-02-07 14:10:41'),(564,'PRODUIT_LIMIT_SIZE',1,'1000','chaine',0,'','2023-02-07 18:24:20'),(566,'PRODUIT_CUSTOMER_PRICES_BY_QTY',1,'0','chaine',0,'','2023-02-07 18:24:20'),(568,'PRODUCT_PRICE_UNIQ',1,'1','chaine',0,'','2023-02-07 18:24:20'),(569,'PRODUIT_MULTIPRICES',1,'0','chaine',0,'','2023-02-07 18:24:20'),(570,'PRODUIT_CUSTOMER_PRICES',1,'0','chaine',0,'','2023-02-07 18:24:20'),(571,'PRODUCT_PRICE_BASE_TYPE',1,'HT','chaine',0,'','2023-02-07 18:24:20'),(572,'PRODUIT_DESC_IN_FORM',1,'1','chaine',0,'','2023-02-07 18:24:20'),(573,'PRODUIT_USE_SEARCH_TO_SELECT',1,'0','chaine',0,'','2023-02-07 18:24:20'),(574,'PRODUIT_FOURN_TEXTS',1,'0','chaine',0,'','2023-02-07 18:24:20'),(575,'PRODUIT_AUTOFILL_DESC',1,'0','chaine',0,'','2023-02-07 18:24:20'),(576,'PRODUCT_USE_SUPPLIER_PACKAGING',1,'0','chaine',0,'','2023-02-07 18:24:20'),(577,'COMMANDE_SAPHIR_MASK',1,'SO{yyyy}-{00000+3}','chaine',0,'','2023-02-07 18:27:00'),(578,'MAIN_MODULE_DISCOUNTRULES',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"187.188.14.214\"}','2023-02-07 18:45:50'),(579,'MAIN_MODULE_DISCOUNTRULES_TABS_0',1,'product:+discountrules:TabTitleDiscountRule:discountrules@discountrules:$user->rights->discountrules->read:/discountrules/discountrule_list.php?contextpage=discountrulelistforproduct&fk_product=__ID__','chaine',0,NULL,'2023-02-07 18:45:50'),(580,'MAIN_MODULE_DISCOUNTRULES_TABS_1',1,'thirdparty:+discountrules:TabTitleDiscountRule:discountrules@discountrules:$user->rights->discountrules->read:/discountrules/discountrule_list.php?contextpage=discountrulelistforcompany&fk_company=__ID__','chaine',0,NULL,'2023-02-07 18:45:50'),(581,'MAIN_MODULE_DISCOUNTRULES_TRIGGERS',1,'1','chaine',0,NULL,'2023-02-07 18:45:50'),(582,'MAIN_MODULE_DISCOUNTRULES_LOGIN',1,'0','chaine',0,NULL,'2023-02-07 18:45:50'),(583,'MAIN_MODULE_DISCOUNTRULES_SUBSTITUTIONS',1,'0','chaine',0,NULL,'2023-02-07 18:45:50'),(584,'MAIN_MODULE_DISCOUNTRULES_MENUS',1,'0','chaine',0,NULL,'2023-02-07 18:45:50'),(585,'MAIN_MODULE_DISCOUNTRULES_THEME',1,'0','chaine',0,NULL,'2023-02-07 18:45:50'),(586,'MAIN_MODULE_DISCOUNTRULES_TPL',1,'0','chaine',0,NULL,'2023-02-07 18:45:50'),(587,'MAIN_MODULE_DISCOUNTRULES_BARCODE',1,'0','chaine',0,NULL,'2023-02-07 18:45:50'),(588,'MAIN_MODULE_DISCOUNTRULES_MODELS',1,'1','chaine',0,NULL,'2023-02-07 18:45:50'),(589,'MAIN_MODULE_DISCOUNTRULES_CSS',1,'[\"\\/discountrules\\/css\\/discountrules.css.php\"]','chaine',0,NULL,'2023-02-07 18:45:50'),(590,'MAIN_MODULE_DISCOUNTRULES_JS',1,'[\"\\/discountrules\\/js\\/discountrules.js.php\"]','chaine',0,NULL,'2023-02-07 18:45:50'),(591,'MAIN_MODULE_DISCOUNTRULES_HOOKS',1,'[\"propalcard\",\"ordercard\",\"invoicecard\",\"globalcard\",\"productservicelist\",\"servicelist\",\"productlist\",\"productcard\",\"discountrulelist\",\"societecard\"]','chaine',0,NULL,'2023-02-07 18:45:50'),(592,'DISCOUNTRULES_MOD_LAST_RELOAD_VERSION',0,'2.54','chaine',0,'Last version reload','2023-02-07 18:45:50'),(593,'MAIN_IHM_PARAMS_REV',1,'3','chaine',0,'','2023-02-07 18:45:50'),(594,'SYSTEMTOOLS_MYSQLDUMP',1,'/usr/bin/mysqldump','chaine',0,'','2023-02-07 19:52:47');
/*!40000 ALTER TABLE `llxas_const` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_contrat`
--

DROP TABLE IF EXISTS `llxas_contrat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_contrat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_commercial_signature` int(11) DEFAULT NULL,
  `fk_commercial_suivi` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  KEY `idx_contrat_fk_soc` (`fk_soc`),
  KEY `idx_contrat_fk_user_author` (`fk_user_author`),
  CONSTRAINT `fk_contrat_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_contrat_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_contrat`
--

LOCK TABLES `llxas_contrat` WRITE;
/*!40000 ALTER TABLE `llxas_contrat` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_contrat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_contrat_extrafields`
--

DROP TABLE IF EXISTS `llxas_contrat_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_contrat_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contrat_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_contrat_extrafields`
--

LOCK TABLES `llxas_contrat_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_contrat_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_contrat_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_contratdet`
--

DROP TABLE IF EXISTS `llxas_contratdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_contratdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contrat` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `label` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `price_ht` double DEFAULT NULL,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 1,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_ouverture` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `commentaire` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  KEY `idx_contratdet_fk_product` (`fk_product`),
  KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`),
  KEY `fk_contratdet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_contratdet_fk_contrat` FOREIGN KEY (`fk_contrat`) REFERENCES `llxas_contrat` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llxas_product` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_contratdet`
--

LOCK TABLES `llxas_contratdet` WRITE;
/*!40000 ALTER TABLE `llxas_contratdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_contratdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_contratdet_extrafields`
--

DROP TABLE IF EXISTS `llxas_contratdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_contratdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_contratdet_extrafields`
--

LOCK TABLES `llxas_contratdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_contratdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_contratdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_contratdet_log`
--

DROP TABLE IF EXISTS `llxas_contratdet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_contratdet_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contratdet` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `statut` smallint(6) NOT NULL,
  `fk_user_author` int(11) NOT NULL,
  `commentaire` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_log_fk_contratdet` (`fk_contratdet`),
  KEY `idx_contratdet_log_date` (`date`),
  CONSTRAINT `fk_contratdet_log_fk_contratdet` FOREIGN KEY (`fk_contratdet`) REFERENCES `llxas_contratdet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_contratdet_log`
--

LOCK TABLES `llxas_contratdet_log` WRITE;
/*!40000 ALTER TABLE `llxas_contratdet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_contratdet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_cronjob`
--

DROP TABLE IF EXISTS `llxas_cronjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_cronjob` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `command` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classesname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `methodename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `md5params` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastoutput` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unitfrequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3600',
  `frequency` int(11) NOT NULL DEFAULT 0,
  `maxrun` int(11) NOT NULL DEFAULT 0,
  `nbrun` int(11) DEFAULT NULL,
  `autodelete` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `processing` int(11) NOT NULL DEFAULT 0,
  `test` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_mailing` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `idx_cronjob_status` (`status`),
  KEY `idx_cronjob_datelastrun` (`datelastrun`),
  KEY `idx_cronjob_datenextrun` (`datenextrun`),
  KEY `idx_cronjob_datestart` (`datestart`),
  KEY `idx_cronjob_dateend` (`dateend`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_cronjob`
--

LOCK TABLES `llxas_cronjob` WRITE;
/*!40000 ALTER TABLE `llxas_cronjob` DISABLE KEYS */;
INSERT INTO `llxas_cronjob` (`rowid`, `tms`, `datec`, `jobtype`, `label`, `command`, `classesname`, `objectname`, `methodename`, `params`, `md5params`, `module_name`, `priority`, `datelastrun`, `datenextrun`, `datestart`, `dateend`, `datelastresult`, `lastresult`, `lastoutput`, `unitfrequency`, `frequency`, `maxrun`, `nbrun`, `autodelete`, `status`, `processing`, `test`, `fk_user_author`, `fk_user_mod`, `fk_mailing`, `note`, `libname`, `entity`) VALUES (1,'2022-02-11 22:55:42','2022-02-11 17:55:42','method','SendEmailsReminders',NULL,'comm/action/class/actioncomm.class.php','ActionComm','sendEmailsReminder',NULL,NULL,'agenda',10,NULL,NULL,'2022-02-11 17:55:42',NULL,NULL,NULL,NULL,'60',5,0,NULL,0,1,0,'$conf->agenda->enabled',NULL,NULL,NULL,'SendEMailsReminder',NULL,1),(2,'2022-05-23 22:43:06','2022-05-23 17:43:06','method','RecurringInvoices',NULL,'compta/facture/class/facture-rec.class.php','FactureRec','createRecurringInvoices',NULL,NULL,'facture',50,NULL,NULL,'2022-05-23 23:00:00',NULL,NULL,NULL,NULL,'86400',1,0,NULL,0,1,0,'$conf->facture->enabled',NULL,NULL,NULL,'Generate recurring invoices',NULL,1),(3,'2022-11-09 19:04:52','2022-11-09 14:04:52','method','PurgeDeleteTemporaryFilesShort',NULL,'core/class/utils.class.php','Utils','purgeFiles',NULL,NULL,'cron',50,NULL,NULL,'2022-11-09 14:04:52',NULL,NULL,NULL,NULL,'604800',2,0,NULL,0,1,0,'1',NULL,NULL,NULL,'PurgeDeleteTemporaryFiles',NULL,0),(4,'2022-11-09 19:04:52','2022-11-09 14:04:52','method','MakeLocalDatabaseDumpShort',NULL,'core/class/utils.class.php','Utils','dumpDatabase','none,auto,1,auto,10',NULL,'cron',90,NULL,NULL,'2022-11-09 14:04:52',NULL,NULL,NULL,NULL,'604800',1,0,NULL,0,0,0,'1',NULL,NULL,NULL,'MakeLocalDatabaseDump',NULL,0),(5,'2023-01-25 00:18:20','2023-01-24 19:18:20','method','SendEmailsRemindersOnInvoiceDueDate',NULL,'compta/facture/class/facture.class.php','Facture','sendEmailsRemindersOnInvoiceDueDate','10,all,EmailTemplateCode',NULL,'facture',50,NULL,NULL,'2023-01-24 23:00:00',NULL,NULL,NULL,NULL,'86400',1,0,NULL,0,0,0,'$conf->facture->enabled',NULL,NULL,NULL,'Send an emails when the unpaid invoices reach a due date + n days = today. First param is the offset n of days, second parameter is \"all\" or a payment mode code, last paramater is the code of email template to use (an email template with EmailTemplateCode must exists. the version in the language of the thirdparty will be used in priority).',NULL,1);
/*!40000 ALTER TABLE `llxas_cronjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_default_values`
--

DROP TABLE IF EXISTS `llxas_default_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_default_values` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_default_values` (`type`,`entity`,`user_id`,`page`,`param`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_default_values`
--

LOCK TABLES `llxas_default_values` WRITE;
/*!40000 ALTER TABLE `llxas_default_values` DISABLE KEYS */;
INSERT INTO `llxas_default_values` (`rowid`, `entity`, `type`, `user_id`, `page`, `param`, `value`) VALUES (1,1,'createform',0,'commande/list.php','date_commande','DESC'),(2,1,'createform',0,'fourn/commande/list.php','date_commande','DESC');
/*!40000 ALTER TABLE `llxas_default_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_delivery`
--

DROP TABLE IF EXISTS `llxas_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_delivery` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_delivery_uk_ref` (`ref`,`entity`),
  KEY `idx_delivery_fk_soc` (`fk_soc`),
  KEY `idx_delivery_fk_user_author` (`fk_user_author`),
  KEY `idx_delivery_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_delivery_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_delivery`
--

LOCK TABLES `llxas_delivery` WRITE;
/*!40000 ALTER TABLE `llxas_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_delivery_extrafields`
--

DROP TABLE IF EXISTS `llxas_delivery_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_delivery_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_delivery_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_delivery_extrafields`
--

LOCK TABLES `llxas_delivery_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_delivery_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_delivery_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_deliverydet`
--

DROP TABLE IF EXISTS `llxas_deliverydet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_deliverydet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_delivery` int(11) DEFAULT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `idx_deliverydet_fk_delivery` (`fk_delivery`),
  CONSTRAINT `fk_deliverydet_fk_delivery` FOREIGN KEY (`fk_delivery`) REFERENCES `llxas_delivery` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_deliverydet`
--

LOCK TABLES `llxas_deliverydet` WRITE;
/*!40000 ALTER TABLE `llxas_deliverydet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_deliverydet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_deliverydet_extrafields`
--

DROP TABLE IF EXISTS `llxas_deliverydet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_deliverydet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_deliverydet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_deliverydet_extrafields`
--

LOCK TABLES `llxas_deliverydet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_deliverydet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_deliverydet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_deplacement`
--

DROP TABLE IF EXISTS `llxas_deplacement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_deplacement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dated` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 1,
  `km` double DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_deplacement`
--

LOCK TABLES `llxas_deplacement` WRITE;
/*!40000 ALTER TABLE `llxas_deplacement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_deplacement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_discountrule`
--

DROP TABLE IF EXISTS `llxas_discountrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_discountrule` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) NOT NULL DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_status` int(11) DEFAULT NULL,
  `fk_project` int(11) unsigned NOT NULL DEFAULT 0,
  `date_creation` datetime NOT NULL,
  `all_category_product` int(1) NOT NULL DEFAULT 0,
  `all_category_company` int(1) NOT NULL DEFAULT 0,
  `fk_product` int(11) NOT NULL DEFAULT 0,
  `fk_country` int(11) NOT NULL DEFAULT 0,
  `fk_company` int(11) NOT NULL DEFAULT 0,
  `fk_c_typent` int(11) DEFAULT 0,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `product_price` decimal(20,6) DEFAULT NULL,
  `product_reduction_amount` decimal(20,6) DEFAULT NULL,
  `reduction` decimal(20,6) DEFAULT NULL,
  `fk_reduction_tax` tinyint(1) NOT NULL DEFAULT 1,
  `cumulative` tinyint(1) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `priority_rank` int(3) NOT NULL DEFAULT 0,
  `basecumulative` tinyint(1) DEFAULT NULL,
  `applytoorder` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_discountrule`
--

LOCK TABLES `llxas_discountrule` WRITE;
/*!40000 ALTER TABLE `llxas_discountrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_discountrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_discountrule_category_company`
--

DROP TABLE IF EXISTS `llxas_discountrule_category_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_discountrule_category_company` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_discountrule` int(11) NOT NULL DEFAULT 0,
  `fk_category_company` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `llxas_discountrule_category_company_fk_discountrule` (`fk_discountrule`),
  CONSTRAINT `llxas_discountrule_category_company_fk_discountrule` FOREIGN KEY (`fk_discountrule`) REFERENCES `llxas_discountrule` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_discountrule_category_company`
--

LOCK TABLES `llxas_discountrule_category_company` WRITE;
/*!40000 ALTER TABLE `llxas_discountrule_category_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_discountrule_category_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_discountrule_category_product`
--

DROP TABLE IF EXISTS `llxas_discountrule_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_discountrule_category_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_discountrule` int(11) NOT NULL DEFAULT 0,
  `fk_category_product` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `llxas_discountrule_category_product_fk_discountrule` (`fk_discountrule`),
  CONSTRAINT `llxas_discountrule_category_product_fk_discountrule` FOREIGN KEY (`fk_discountrule`) REFERENCES `llxas_discountrule` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_discountrule_category_product`
--

LOCK TABLES `llxas_discountrule_category_product` WRITE;
/*!40000 ALTER TABLE `llxas_discountrule_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_discountrule_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_discountrule_extrafields`
--

DROP TABLE IF EXISTS `llxas_discountrule_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_discountrule_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_discountrule_extrafields`
--

LOCK TABLES `llxas_discountrule_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_discountrule_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_discountrule_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_discountrules_chargerule`
--

DROP TABLE IF EXISTS `llxas_discountrules_chargerule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_discountrules_chargerule` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) DEFAULT 1,
  `fk_c_typent` int(11) DEFAULT NULL,
  `all_category_product` int(1) DEFAULT 0,
  `all_category_company` int(1) DEFAULT 0,
  `termfrom` datetime DEFAULT NULL,
  `termto` datetime DEFAULT NULL,
  `from_quantity` int(11) DEFAULT NULL,
  `to_quantity` int(11) DEFAULT NULL,
  `reduction` double(24,8) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_discountrules_chargerule_rowid` (`rowid`),
  KEY `idx_discountrules_chargerule_ref` (`ref`),
  KEY `idx_discountrules_chargerule_entity` (`entity`),
  KEY `idx_discountrules_chargerule_fk_soc` (`fk_soc`),
  KEY `idx_discountrules_chargerule_fk_project` (`fk_project`),
  KEY `llxas_discountrules_chargerule_fk_user_creat` (`fk_user_creat`),
  KEY `idx_discountrules_chargerule_fk_country` (`fk_country`),
  KEY `idx_discountrules_chargerule_fk_c_typent` (`fk_c_typent`),
  KEY `idx_discountrules_chargerule_status` (`status`),
  CONSTRAINT `llxas_discountrules_chargerule_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_discountrules_chargerule`
--

LOCK TABLES `llxas_discountrules_chargerule` WRITE;
/*!40000 ALTER TABLE `llxas_discountrules_chargerule` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_discountrules_chargerule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_discountrules_chargerule_extrafields`
--

DROP TABLE IF EXISTS `llxas_discountrules_chargerule_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_discountrules_chargerule_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_chargerule_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_discountrules_chargerule_extrafields`
--

LOCK TABLES `llxas_discountrules_chargerule_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_discountrules_chargerule_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_discountrules_chargerule_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_document_model`
--

DROP TABLE IF EXISTS `llxas_document_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_document_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_document_model`
--

LOCK TABLES `llxas_document_model` WRITE;
/*!40000 ALTER TABLE `llxas_document_model` DISABLE KEYS */;
INSERT INTO `llxas_document_model` (`rowid`, `nom`, `entity`, `type`, `libelle`, `description`) VALUES (6,'azur',1,'propal',NULL,NULL),(7,'rouget',1,'shipping',NULL,NULL),(8,'typhon',1,'delivery',NULL,NULL),(9,'strato',1,'contract',NULL,NULL),(10,'soleil',1,'ficheinter',NULL,NULL),(13,'squille',1,'reception',NULL,NULL),(14,'sepamandate',1,'bankaccount',NULL,NULL),(15,'',1,'task',NULL,NULL),(16,'beluga',1,'project',NULL,NULL),(17,'baleine',1,'project',NULL,NULL),(18,'aurore',1,'supplier_proposal',NULL,NULL),(19,'standard',1,'stock',NULL,NULL),(20,'stdmovement',1,'mouvement',NULL,NULL),(22,'conford',1,'order','Confirmation Order',NULL),(24,'standard',1,'expensereport',NULL,NULL),(25,'crabe',1,'invoice',NULL,NULL),(26,'muscadet',1,'order_supplier',NULL,NULL),(27,'TICKET_ADDON_PDF_ODT_PATH',1,'ticket',NULL,NULL),(34,'einstein',1,'order','Sales Order',NULL);
/*!40000 ALTER TABLE `llxas_document_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_don`
--

DROP TABLE IF EXISTS `llxas_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_don` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `datedon` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_payment` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `societe` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` smallint(6) NOT NULL DEFAULT 1,
  `fk_projet` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_don`
--

LOCK TABLES `llxas_don` WRITE;
/*!40000 ALTER TABLE `llxas_don` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_don_extrafields`
--

DROP TABLE IF EXISTS `llxas_don_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_don_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_don_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_don_extrafields`
--

LOCK TABLES `llxas_don_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_don_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_don_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_ecm_directories`
--

DROP TABLE IF EXISTS `llxas_ecm_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_ecm_directories` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cachenbofdoc` int(11) NOT NULL DEFAULT 0,
  `fullpath` varchar(750) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `acl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_directories` (`label`,`fk_parent`,`entity`),
  KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`),
  CONSTRAINT `fk_ecm_directories_fk_user_c` FOREIGN KEY (`fk_user_c`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_ecm_directories_fk_user_m` FOREIGN KEY (`fk_user_m`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_ecm_directories`
--

LOCK TABLES `llxas_ecm_directories` WRITE;
/*!40000 ALTER TABLE `llxas_ecm_directories` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_ecm_directories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_ecm_directories_extrafields`
--

DROP TABLE IF EXISTS `llxas_ecm_directories_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_ecm_directories_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ecm_directories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_ecm_directories_extrafields`
--

LOCK TABLES `llxas_ecm_directories_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_ecm_directories_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_ecm_directories_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_ecm_files`
--

DROP TABLE IF EXISTS `llxas_ecm_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_ecm_files` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `share` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_object_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `src_object_id` int(11) DEFAULT NULL,
  `fullpath_orig` varchar(750) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(750) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `gen_or_uploaded` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_files` (`filepath`,`filename`,`entity`),
  KEY `idx_ecm_files_label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_ecm_files`
--

LOCK TABLES `llxas_ecm_files` WRITE;
/*!40000 ALTER TABLE `llxas_ecm_files` DISABLE KEYS */;
INSERT INTO `llxas_ecm_files` (`rowid`, `ref`, `label`, `share`, `entity`, `filepath`, `filename`, `src_object_type`, `src_object_id`, `fullpath_orig`, `description`, `keywords`, `cover`, `position`, `gen_or_uploaded`, `extraparams`, `date_c`, `tms`, `fk_user_c`, `fk_user_m`, `note_private`, `note_public`, `acl`) VALUES (1,'27bbcfb1401c166ad888629ea7487d2e','dba32341869625f4fd3b70d5ad8e7c1f',NULL,1,'propale/PR110922-00001','PR110922-00001.pdf','propal',1,'','',NULL,NULL,1,'generated',NULL,'2022-11-09 13:40:00','2022-11-09 21:58:28',1,1,NULL,NULL,NULL),(2,'1e0dc918392ac44c5193420f4d728275','327691f51fc482a819f8c73cb414c065',NULL,1,'commande/CO2209-0001','CO2209-0001.pdf','commande',1,'','','',NULL,1,'generated',NULL,'2022-11-09 17:00:05','2023-01-31 03:54:39',1,1,NULL,NULL,NULL),(3,'7cde8c8b9b650ee22866938be93cb2a7','00afc59abc38c57b9bc66ae86645e16a',NULL,1,'expedition/sending/SH110922-00001','SH110922-00001.pdf','expedition',1,'','',NULL,NULL,1,'generated',NULL,'2022-11-09 17:17:33','2022-11-09 22:17:33',1,NULL,NULL,NULL,NULL),(4,'76fe3e6c1006a578633cc367648c1cc6','a37470b7472773694eb595402ec93621',NULL,1,'commande/CO2211-0002','CO2211-0002.pdf','commande',3,'','','',NULL,1,'generated',NULL,'2022-11-09 17:19:30','2023-02-07 17:03:42',1,1,NULL,NULL,NULL),(9,'96f4158924ebe497e7bea18b4dc158df','df33106ae8aac9de5680962c90a3b2dc',NULL,1,'commande/CO2211-0002','CO2211-0002_2022-10-07__Mat Sweet.pdf','commande',3,'','','',NULL,2,'generated',NULL,'2023-01-20 18:29:22','2023-02-07 18:24:24',1,1,NULL,NULL,NULL),(10,'30c1d72846c57cf69af299f5f077ec2d','23ac51af56d714e91fd793c1bcdab7b6',NULL,1,'commande/SO2022-00001','SO2022-00001.pdf','commande',2,'','',NULL,NULL,1,'generated',NULL,'2023-01-23 12:36:55','2023-01-23 23:10:12',1,1,NULL,NULL,NULL),(11,'a92680bbde63019309914d6d953cec41','2472b395f9dfbfa3d3a83151d2801eb3',NULL,1,'commande/CO2209-0001','CO2209-0001_2022-10-07_Galena Park_Mat Sweet.pdf','commande',1,'','','',NULL,2,'generated',NULL,'2023-01-30 18:44:28','2023-01-31 03:57:17',1,1,NULL,NULL,NULL),(12,'627a028976cbf03041ec7c026b0bb7d3','37f2f50f6b3252d4e8d964f129d1c185',NULL,1,'commande/SO2022-00004','SO2022-00004.pdf','commande',4,'','','',NULL,1,'generated',NULL,'2023-02-07 13:27:10','2023-02-07 18:27:16',1,1,NULL,NULL,NULL),(13,'560f477a859679a9a363241028a172c2','4b11472d486a770e742432b204a79df1',NULL,1,'commande/SO2022-0001','SO2022-0001_2022-10-07_Galena Park_Mat Sweet.pdf','commande',1,'','','',NULL,1,'generated',NULL,'2023-02-07 13:42:55','2023-02-07 18:42:55',1,NULL,NULL,NULL,NULL),(14,'8ccc37fdff57798f0b8fcc47168691ac','afbb5b133fda890cf7dbe612256cc4b0',NULL,1,'commande/SO2022-0003','SO2022-0003_2022-10-07__Mat Sweet.pdf','commande',3,'','','',NULL,1,'generated',NULL,'2023-02-07 13:43:07','2023-02-07 18:43:07',1,NULL,NULL,NULL,NULL),(15,'21a7cfa8eb9248d09ce91f6133922711','6006625780c9f9aecc00d7a72eba6b33',NULL,1,'commande/SO2023-00005','SO2023-00005.pdf','commande',5,'','','',NULL,1,'generated',NULL,'2023-02-07 13:43:10','2023-02-07 18:43:19',1,1,NULL,NULL,NULL),(16,'c77021b958392e20a6ccf67f1028c022','d82aed45bd8224d5e61a50d46b396e56',NULL,1,'commande/SO2022-0003','SO2022-0003.pdf','commande',3,'','','',NULL,2,'generated',NULL,'2023-02-07 13:43:18','2023-02-07 18:51:18',1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `llxas_ecm_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_ecm_files_extrafields`
--

DROP TABLE IF EXISTS `llxas_ecm_files_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_ecm_files_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ecm_files_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_ecm_files_extrafields`
--

LOCK TABLES `llxas_ecm_files_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_ecm_files_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_ecm_files_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_element_contact`
--

DROP TABLE IF EXISTS `llxas_element_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_element_contact` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 5,
  `element_id` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_element_contact_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llxas_c_type_contact` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_element_contact`
--

LOCK TABLES `llxas_element_contact` WRITE;
/*!40000 ALTER TABLE `llxas_element_contact` DISABLE KEYS */;
INSERT INTO `llxas_element_contact` (`rowid`, `datecreate`, `statut`, `element_id`, `fk_c_type_contact`, `fk_socpeople`) VALUES (1,'2022-11-09 13:40:00',4,1,41,1),(2,'2022-11-09 16:49:03',4,1,42,2),(3,'2022-11-09 16:59:44',4,1,101,1),(4,'2022-11-09 16:59:44',4,1,102,2),(5,'2022-11-09 16:59:44',4,1,100,2),(6,'2022-11-09 16:59:44',4,1,102,1),(7,'2022-11-09 17:06:51',4,2,100,2),(8,'2022-11-09 17:06:51',4,2,101,1),(9,'2022-11-09 17:06:51',4,2,102,1),(10,'2022-11-09 17:08:34',4,2,41,1),(11,'2022-11-09 17:08:34',4,2,42,2),(12,'2022-11-09 17:19:23',4,3,100,2),(13,'2022-11-09 17:19:23',4,3,101,1),(14,'2022-11-09 17:19:23',4,3,102,1),(15,'2022-11-09 17:19:23',4,3,102,2),(16,'2022-12-05 13:29:17',4,4,100,2),(17,'2022-12-05 13:29:17',4,4,101,1),(18,'2022-12-05 13:29:17',4,4,102,1),(19,'2023-02-07 13:42:51',4,5,100,2),(20,'2023-02-07 13:42:51',4,5,101,1),(21,'2023-02-07 13:42:51',4,5,102,1);
/*!40000 ALTER TABLE `llxas_element_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_element_element`
--

DROP TABLE IF EXISTS `llxas_element_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_element_element` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_source` int(11) NOT NULL,
  `sourcetype` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  KEY `idx_element_element_fk_target` (`fk_target`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_element_element`
--

LOCK TABLES `llxas_element_element` WRITE;
/*!40000 ALTER TABLE `llxas_element_element` DISABLE KEYS */;
INSERT INTO `llxas_element_element` (`rowid`, `fk_source`, `sourcetype`, `fk_target`, `targettype`) VALUES (2,1,'commande',1,'shipping'),(1,1,'propal',1,'commande'),(3,3,'commande',2,'shipping');
/*!40000 ALTER TABLE `llxas_element_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_element_resources`
--

DROP TABLE IF EXISTS `llxas_element_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_element_resources` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) DEFAULT NULL,
  `element_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `busy` int(11) DEFAULT NULL,
  `mandatory` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  KEY `idx_element_element_element_id` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_element_resources`
--

LOCK TABLES `llxas_element_resources` WRITE;
/*!40000 ALTER TABLE `llxas_element_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_element_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_emailcollector_emailcollector`
--

DROP TABLE IF EXISTS `llxas_emailcollector_emailcollector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_emailcollector_emailcollector` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostcharset` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'UTF-8',
  `login` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_directory` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_directory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maxemailpercollect` int(11) DEFAULT 100,
  `datelastresult` datetime DEFAULT NULL,
  `codelastresult` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastresult` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datelastok` datetime DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollector_ref` (`ref`,`entity`),
  KEY `idx_emailcollector_entity` (`entity`),
  KEY `idx_emailcollector_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_emailcollector_emailcollector`
--

LOCK TABLES `llxas_emailcollector_emailcollector` WRITE;
/*!40000 ALTER TABLE `llxas_emailcollector_emailcollector` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_emailcollector_emailcollector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_emailcollector_emailcollectoraction`
--

DROP TABLE IF EXISTS `llxas_emailcollector_emailcollectoraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_emailcollector_emailcollectoraction` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionparam` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectoraction` (`fk_emailcollector`,`type`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectoraction_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llxas_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_emailcollector_emailcollectoraction`
--

LOCK TABLES `llxas_emailcollector_emailcollectoraction` WRITE;
/*!40000 ALTER TABLE `llxas_emailcollector_emailcollectoraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_emailcollector_emailcollectoraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_emailcollector_emailcollectorfilter`
--

DROP TABLE IF EXISTS `llxas_emailcollector_emailcollectorfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_emailcollector_emailcollectorfilter` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rulevalue` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectorfilter` (`fk_emailcollector`,`type`,`rulevalue`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectorfilter_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llxas_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_emailcollector_emailcollectorfilter`
--

LOCK TABLES `llxas_emailcollector_emailcollectorfilter` WRITE;
/*!40000 ALTER TABLE `llxas_emailcollector_emailcollectorfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_emailcollector_emailcollectorfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_entrepot`
--

DROP TABLE IF EXISTS `llxas_entrepot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_entrepot` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_project` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lieu` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_parent` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_entrepot_label` (`ref`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_entrepot`
--

LOCK TABLES `llxas_entrepot` WRITE;
/*!40000 ALTER TABLE `llxas_entrepot` DISABLE KEYS */;
INSERT INTO `llxas_entrepot` (`rowid`, `ref`, `datec`, `tms`, `entity`, `fk_project`, `description`, `lieu`, `address`, `zip`, `town`, `fk_departement`, `fk_pays`, `phone`, `fax`, `statut`, `fk_user_author`, `model_pdf`, `import_key`, `fk_parent`) VALUES (1,'Office','2022-11-09 17:02:23','2022-11-09 22:02:23',1,NULL,'','Off','','','',NULL,11,'','',1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `llxas_entrepot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_entrepot_extrafields`
--

DROP TABLE IF EXISTS `llxas_entrepot_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_entrepot_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_entrepot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_entrepot_extrafields`
--

LOCK TABLES `llxas_entrepot_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_entrepot_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_entrepot_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_establishment`
--

DROP TABLE IF EXISTS `llxas_establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_establishment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `profid1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profid2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profid3` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_establishment`
--

LOCK TABLES `llxas_establishment` WRITE;
/*!40000 ALTER TABLE `llxas_establishment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_event_element`
--

DROP TABLE IF EXISTS `llxas_event_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_event_element` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_source` int(11) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_event_element`
--

LOCK TABLES `llxas_event_element` WRITE;
/*!40000 ALTER TABLE `llxas_event_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_event_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_eventorganization_conferenceorboothattendee`
--

DROP TABLE IF EXISTS `llxas_eventorganization_conferenceorboothattendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_eventorganization_conferenceorboothattendee` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_actioncomm` int(11) DEFAULT NULL,
  `fk_project` int(11) NOT NULL,
  `fk_invoice` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_subscription` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_eventorganization_conferenceorboothattendee` (`fk_project`,`email`,`fk_actioncomm`),
  KEY `idx_eventorganization_conferenceorboothattendee_rowid` (`rowid`),
  KEY `idx_eventorganization_conferenceorboothattendee_ref` (`ref`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_soc` (`fk_soc`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_actioncomm` (`fk_actioncomm`),
  KEY `idx_eventorganization_conferenceorboothattendee_email` (`email`),
  KEY `idx_eventorganization_conferenceorboothattendee_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_eventorganization_conferenceorboothattendee`
--

LOCK TABLES `llxas_eventorganization_conferenceorboothattendee` WRITE;
/*!40000 ALTER TABLE `llxas_eventorganization_conferenceorboothattendee` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_eventorganization_conferenceorboothattendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_eventorganization_conferenceorboothattendee_extrafields`
--

DROP TABLE IF EXISTS `llxas_eventorganization_conferenceorboothattendee_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_eventorganization_conferenceorboothattendee_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_conferenceorboothattendee_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_eventorganization_conferenceorboothattendee_extrafields`
--

LOCK TABLES `llxas_eventorganization_conferenceorboothattendee_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_eventorganization_conferenceorboothattendee_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_eventorganization_conferenceorboothattendee_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_events`
--

DROP TABLE IF EXISTS `llxas_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_events` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `prefix_session` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `authentication_method` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_oauth_token` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_events_dateevent` (`dateevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_events`
--

LOCK TABLES `llxas_events` WRITE;
/*!40000 ALTER TABLE `llxas_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expedition`
--

DROP TABLE IF EXISTS `llxas_expedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expedition` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  KEY `idx_expedition_fk_soc` (`fk_soc`),
  KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_expedition_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llxas_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_expedition_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expedition`
--

LOCK TABLES `llxas_expedition` WRITE;
/*!40000 ALTER TABLE `llxas_expedition` DISABLE KEYS */;
INSERT INTO `llxas_expedition` (`rowid`, `tms`, `ref`, `entity`, `fk_soc`, `fk_projet`, `ref_ext`, `ref_int`, `ref_customer`, `date_creation`, `fk_user_author`, `fk_user_modif`, `date_valid`, `fk_user_valid`, `date_delivery`, `date_expedition`, `fk_address`, `fk_shipping_method`, `tracking_number`, `fk_statut`, `billed`, `height`, `width`, `size_units`, `size`, `weight_units`, `weight`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `fk_incoterms`, `location_incoterms`, `import_key`, `extraparams`) VALUES (1,'2022-11-09 22:17:33','SH110922-00001',1,1,0,NULL,NULL,'Galena Park','2022-11-09 17:17:27',1,NULL,'2022-11-09 17:17:33',1,'2022-10-07 00:00:00','2022-11-09 17:17:33',NULL,1,'',1,0,NULL,NULL,0,NULL,3,NULL,NULL,'Please remit to: 205 Mercy Way, Liberty Hill, TX 78642<br>\r\n',NULL,NULL,0,'',NULL,NULL),(2,'2022-11-09 22:19:56','(PROV2)',1,1,0,NULL,NULL,NULL,'2022-11-09 17:19:56',1,NULL,NULL,NULL,'2022-10-07 00:00:00',NULL,NULL,1,'',0,0,NULL,NULL,0,NULL,3,NULL,NULL,'Please remit to: 205 Mercy Way, Liberty Hill, TX 78642<br>\r\n',NULL,NULL,0,'',NULL,NULL);
/*!40000 ALTER TABLE `llxas_expedition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expedition_extrafields`
--

DROP TABLE IF EXISTS `llxas_expedition_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expedition_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expedition_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expedition_extrafields`
--

LOCK TABLES `llxas_expedition_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_expedition_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_expedition_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expedition_package`
--

DROP TABLE IF EXISTS `llxas_expedition_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expedition_package` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expedition` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000,
  `fk_package_type` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `dangerous_goods` smallint(6) DEFAULT 0,
  `tail_lift` smallint(6) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expedition_package`
--

LOCK TABLES `llxas_expedition_package` WRITE;
/*!40000 ALTER TABLE `llxas_expedition_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_expedition_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expeditiondet`
--

DROP TABLE IF EXISTS `llxas_expeditiondet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expeditiondet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expedition` int(11) NOT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`),
  KEY `idx_expeditiondet_fk_origin_line` (`fk_origin_line`),
  CONSTRAINT `fk_expeditiondet_fk_expedition` FOREIGN KEY (`fk_expedition`) REFERENCES `llxas_expedition` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expeditiondet`
--

LOCK TABLES `llxas_expeditiondet` WRITE;
/*!40000 ALTER TABLE `llxas_expeditiondet` DISABLE KEYS */;
INSERT INTO `llxas_expeditiondet` (`rowid`, `fk_expedition`, `fk_origin_line`, `fk_entrepot`, `qty`, `rang`) VALUES (1,1,1,1,1,1),(2,1,2,1,1,2),(3,1,3,1,1,3),(4,1,4,1,2,4),(5,1,5,1,1,5),(6,1,6,1,1,6),(7,1,7,1,2,7),(8,1,8,1,2,8),(9,1,9,1,2,9),(10,1,10,1,1,10),(11,1,11,1,1,11),(12,1,12,1,3,12),(13,1,13,1,9,13),(14,1,14,1,9,14),(15,1,15,1,1,15),(16,1,16,1,20,16),(17,1,17,1,9,17),(18,1,18,1,27,18),(19,1,19,1,18,19),(20,1,20,1,28,20),(21,1,21,1,14,21),(22,1,22,1,9,22),(23,1,23,1,5,23),(24,1,24,1,32,24),(25,1,25,1,4,25),(26,1,26,1,18,26),(27,1,27,1,13,27),(28,1,28,1,11,28),(29,1,29,1,25,29),(30,1,30,1,9,30),(31,1,31,1,7,31),(32,1,32,1,1,32),(33,1,33,1,1,33),(34,1,34,1,1,34),(35,1,35,1,1,35),(36,2,37,1,1,1),(37,2,38,1,1,2),(38,2,39,1,1,3),(39,2,40,1,2,4),(40,2,41,1,1,5),(41,2,42,1,1,6),(42,2,43,1,2,7),(43,2,44,1,2,8),(44,2,45,1,2,9),(45,2,46,1,1,10),(46,2,47,1,1,11),(47,2,48,1,3,12),(48,2,49,1,9,13),(49,2,50,1,9,14),(50,2,51,1,1,15),(51,2,52,1,20,16),(52,2,53,1,9,17),(53,2,54,1,27,18),(54,2,55,1,18,19),(55,2,56,1,28,20),(56,2,57,1,14,21),(57,2,58,1,9,22),(58,2,59,1,5,23),(59,2,60,1,32,24),(60,2,61,1,4,25),(61,2,62,1,18,26),(62,2,63,1,13,27),(63,2,64,1,11,28),(64,2,65,1,25,29),(65,2,66,1,9,30),(66,2,67,1,7,31),(67,2,68,1,1,32),(68,2,69,1,1,33),(69,2,70,1,1,34),(70,2,71,1,1,35);
/*!40000 ALTER TABLE `llxas_expeditiondet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expeditiondet_batch`
--

DROP TABLE IF EXISTS `llxas_expeditiondet_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expeditiondet_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expeditiondet` int(11) NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `fk_origin_stock` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_expeditiondet` (`fk_expeditiondet`),
  CONSTRAINT `fk_expeditiondet_batch_fk_expeditiondet` FOREIGN KEY (`fk_expeditiondet`) REFERENCES `llxas_expeditiondet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expeditiondet_batch`
--

LOCK TABLES `llxas_expeditiondet_batch` WRITE;
/*!40000 ALTER TABLE `llxas_expeditiondet_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_expeditiondet_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expeditiondet_extrafields`
--

DROP TABLE IF EXISTS `llxas_expeditiondet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expeditiondet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expeditiondet_extrafields`
--

LOCK TABLES `llxas_expeditiondet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_expeditiondet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_expeditiondet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expensereport`
--

DROP TABLE IF EXISTS `llxas_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expensereport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_number_int` int(11) DEFAULT NULL,
  `ref_ext` int(11) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_create` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_validator` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL,
  `fk_c_paiement` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_refuse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_cancel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integration_compta` int(11) DEFAULT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `model_pdf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expensereport_uk_ref` (`ref`,`entity`),
  KEY `idx_expensereport_date_debut` (`date_debut`),
  KEY `idx_expensereport_date_fin` (`date_fin`),
  KEY `idx_expensereport_fk_statut` (`fk_statut`),
  KEY `idx_expensereport_fk_user_author` (`fk_user_author`),
  KEY `idx_expensereport_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expensereport_fk_user_approve` (`fk_user_approve`),
  KEY `idx_expensereport_fk_refuse` (`fk_user_approve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expensereport`
--

LOCK TABLES `llxas_expensereport` WRITE;
/*!40000 ALTER TABLE `llxas_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_expensereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expensereport_det`
--

DROP TABLE IF EXISTS `llxas_expensereport_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expensereport_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int(11) NOT NULL,
  `docnumber` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` int(11) DEFAULT -1,
  `qty` double NOT NULL,
  `subprice` double(24,8) NOT NULL DEFAULT 0.00000000,
  `value_unit` double(24,8) NOT NULL,
  `remise_percent` double DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `date` date NOT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_facture` int(11) DEFAULT 0,
  `fk_ecm_files` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule_warning_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expensereport_det`
--

LOCK TABLES `llxas_expensereport_det` WRITE;
/*!40000 ALTER TABLE `llxas_expensereport_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_expensereport_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expensereport_extrafields`
--

DROP TABLE IF EXISTS `llxas_expensereport_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expensereport_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expensereport_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expensereport_extrafields`
--

LOCK TABLES `llxas_expensereport_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_expensereport_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_expensereport_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expensereport_ik`
--

DROP TABLE IF EXISTS `llxas_expensereport_ik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expensereport_ik` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 0,
  `fk_range` int(11) NOT NULL DEFAULT 0,
  `coef` double NOT NULL DEFAULT 0,
  `ikoffset` double NOT NULL DEFAULT 0,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expensereport_ik`
--

LOCK TABLES `llxas_expensereport_ik` WRITE;
/*!40000 ALTER TABLE `llxas_expensereport_ik` DISABLE KEYS */;
INSERT INTO `llxas_expensereport_ik` (`rowid`, `datec`, `tms`, `fk_c_exp_tax_cat`, `fk_range`, `coef`, `ikoffset`, `active`) VALUES (1,NULL,'2021-11-10 17:54:38',4,1,0.41,0,1),(2,NULL,'2021-11-10 17:54:38',4,2,0.244,824,1),(3,NULL,'2021-11-10 17:54:38',4,3,0.286,0,1),(4,NULL,'2021-11-10 17:54:38',5,4,0.493,0,1),(5,NULL,'2021-11-10 17:54:38',5,5,0.277,1082,1),(6,NULL,'2021-11-10 17:54:38',5,6,0.332,0,1),(7,NULL,'2021-11-10 17:54:38',6,7,0.543,0,1),(8,NULL,'2021-11-10 17:54:38',6,8,0.305,1180,1),(9,NULL,'2021-11-10 17:54:38',6,9,0.364,0,1),(10,NULL,'2021-11-10 17:54:38',7,10,0.568,0,1),(11,NULL,'2021-11-10 17:54:38',7,11,0.32,1244,1),(12,NULL,'2021-11-10 17:54:38',7,12,0.382,0,1),(13,NULL,'2021-11-10 17:54:38',8,13,0.595,0,1),(14,NULL,'2021-11-10 17:54:38',8,14,0.337,1288,1),(15,NULL,'2021-11-10 17:54:38',8,15,0.401,0,1);
/*!40000 ALTER TABLE `llxas_expensereport_ik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_expensereport_rules`
--

DROP TABLE IF EXISTS `llxas_expensereport_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_expensereport_rules` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dates` datetime NOT NULL,
  `datee` datetime NOT NULL,
  `amount` double(24,8) NOT NULL,
  `restrictive` tinyint(4) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `code_expense_rules_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_for_all` tinyint(4) DEFAULT 0,
  `entity` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_expensereport_rules`
--

LOCK TABLES `llxas_expensereport_rules` WRITE;
/*!40000 ALTER TABLE `llxas_expensereport_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_expensereport_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_export_compta`
--

DROP TABLE IF EXISTS `llxas_export_compta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_export_compta` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_export` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_export_compta`
--

LOCK TABLES `llxas_export_compta` WRITE;
/*!40000 ALTER TABLE `llxas_export_compta` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_export_compta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_export_model`
--

DROP TABLE IF EXISTS `llxas_export_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_export_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_export_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_export_model`
--

LOCK TABLES `llxas_export_model` WRITE;
/*!40000 ALTER TABLE `llxas_export_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_export_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_extrafields`
--

DROP TABLE IF EXISTS `llxas_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `elementtype` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldcomputed` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fielddefault` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldunique` int(11) DEFAULT 0,
  `fieldrequired` int(11) DEFAULT 0,
  `perms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(11) DEFAULT 0,
  `alwayseditable` int(11) DEFAULT 0,
  `param` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `printable` int(11) DEFAULT 0,
  `totalizable` tinyint(1) DEFAULT 0,
  `langs` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_extrafields`
--

LOCK TABLES `llxas_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_extrafields` DISABLE KEYS */;
INSERT INTO `llxas_extrafields` (`rowid`, `name`, `entity`, `elementtype`, `label`, `type`, `size`, `fieldcomputed`, `fielddefault`, `fieldunique`, `fieldrequired`, `perms`, `enabled`, `pos`, `alwayseditable`, `param`, `list`, `printable`, `totalizable`, `langs`, `help`, `fk_user_author`, `fk_user_modif`, `datec`, `tms`) VALUES (1,'product',1,'ticket','Product','sellist','',NULL,NULL,0,0,NULL,'1',1,1,'a:1:{s:7:\"options\";a:1:{s:41:\"product:label:rowid:: fk_product_type = 0\";N;}}','1',0,1,NULL,NULL,1,1,'2022-02-11 17:57:14','2022-02-11 22:57:14'),(2,'manuty',1,'product','Manufacture Type','select','',NULL,NULL,0,0,NULL,'1',1,1,'a:1:{s:7:\"options\";a:2:{i:1;s:12:\"Laser Etched\";i:2;s:13:\"Digital Print\";}}','1',0,0,NULL,NULL,1,1,'2023-01-17 17:33:14','2023-01-17 22:33:14'),(3,'notes',1,'commandedet','Notes & Features','varchar','255',NULL,NULL,0,0,NULL,'1',1,1,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}','1',0,0,NULL,NULL,1,1,'2023-01-18 19:07:37','2023-01-19 00:07:37'),(5,'custy',1,'commande','Order Type','select','',NULL,NULL,0,0,NULL,'1',1,1,'a:1:{s:7:\"options\";a:2:{i:1;s:7:\"Student\";i:2;s:4:\"Bulk\";}}','1',0,0,NULL,NULL,1,1,'2023-01-30 20:03:55','2023-01-31 01:03:55'),(6,'dsc',0,'facture','Discount Season %','varchar','50',NULL,NULL,0,0,NULL,'1',100,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}','1',2,0,'discountrules@discountrules','Discount Season %',1,1,'2022-06-14 21:42:57','2023-02-07 18:45:50'),(7,'dscv',0,'facture','Discount Season Total','varchar','50',NULL,NULL,0,0,NULL,'1',100,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}','1',2,0,'discountrules@discountrules','Discount Season Value',1,1,'2022-06-14 21:48:57','2023-02-07 18:45:50'),(8,'dscdocument',0,'facture','Discount Document %','varchar','50',NULL,NULL,0,0,NULL,'1',100,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}','1',2,0,'discountrules@discountrules','Discount Document %',1,1,'2022-06-14 21:42:57','2023-02-07 18:45:50'),(9,'dscvdocument',0,'facture','Discount Document Total','varchar','50',NULL,NULL,0,0,NULL,'1',100,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}','1',2,0,'discountrules@discountrules','Discount Document Value',1,1,'2022-06-14 21:48:57','2023-02-07 18:45:50'),(10,'dscdocuments',0,'facture','Discount Broker %','varchar','50',NULL,NULL,0,0,NULL,'1',100,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}','1',2,0,'discountrules@discountrules','Discount Broker %',1,1,'2022-06-14 21:42:57','2023-02-07 18:45:50'),(11,'dscvdocuments',0,'facture','Discount Broker Total','varchar','50',NULL,NULL,0,0,NULL,'1',100,0,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}','1',2,0,'discountrules@discountrules','Discount Broker Total',1,1,'2022-06-14 21:48:57','2023-02-07 18:45:50'),(12,'desctotal',0,'facture','Total Invoice','double','24,8',NULL,NULL,0,0,NULL,'1',100,1,'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}','0',0,1,NULL,NULL,1,1,'2022-09-08 19:56:34','2023-02-07 18:45:50');
/*!40000 ALTER TABLE `llxas_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facture`
--

DROP TABLE IF EXISTS `llxas_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_closing` datetime DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `close_code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_note` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `module_source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_fac_rec_source` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `increment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_mode_transport` int(11) DEFAULT NULL,
  `situation_cycle_ref` smallint(6) DEFAULT NULL,
  `situation_counter` smallint(6) DEFAULT NULL,
  `situation_final` smallint(6) DEFAULT NULL,
  `retained_warranty` double DEFAULT NULL,
  `retained_warranty_date_limit` date DEFAULT NULL,
  `retained_warranty_fk_cond_reglement` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_ref` (`ref`,`entity`),
  KEY `idx_facture_fk_soc` (`fk_soc`),
  KEY `idx_facture_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  KEY `idx_facture_fk_projet` (`fk_projet`),
  KEY `idx_facture_fk_account` (`fk_account`),
  KEY `idx_facture_fk_currency` (`fk_currency`),
  KEY `idx_facture_fk_statut` (`fk_statut`),
  CONSTRAINT `fk_facture_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llxas_facture` (`rowid`),
  CONSTRAINT `fk_facture_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llxas_projet` (`rowid`),
  CONSTRAINT `fk_facture_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facture`
--

LOCK TABLES `llxas_facture` WRITE;
/*!40000 ALTER TABLE `llxas_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facture_extrafields`
--

DROP TABLE IF EXISTS `llxas_facture_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facture_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dsc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dscv` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dscdocument` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dscvdocument` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dscdocuments` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dscvdocuments` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desctotal` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facture_extrafields`
--

LOCK TABLES `llxas_facture_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_facture_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facture_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facture_fourn`
--

DROP TABLE IF EXISTS `llxas_facture_fourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facture_fourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_supplier` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `date_closing` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double(24,8) DEFAULT 0.00000000,
  `close_code` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_note` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fourn_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_fourn_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llxas_projet` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facture_fourn`
--

LOCK TABLES `llxas_facture_fourn` WRITE;
/*!40000 ALTER TABLE `llxas_facture_fourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facture_fourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facture_fourn_det`
--

DROP TABLE IF EXISTS `llxas_facture_fourn_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facture_fourn_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_product` (`fk_product`),
  KEY `idx_facture_fourn_det_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facture_fourn_det_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facture_fourn_det_fk_facture` FOREIGN KEY (`fk_facture_fourn`) REFERENCES `llxas_facture_fourn` (`rowid`),
  CONSTRAINT `fk_facture_fourn_det_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facture_fourn_det`
--

LOCK TABLES `llxas_facture_fourn_det` WRITE;
/*!40000 ALTER TABLE `llxas_facture_fourn_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facture_fourn_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facture_fourn_det_extrafields`
--

DROP TABLE IF EXISTS `llxas_facture_fourn_det_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facture_fourn_det_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_det_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facture_fourn_det_extrafields`
--

LOCK TABLES `llxas_facture_fourn_det_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_facture_fourn_det_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facture_fourn_det_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facture_fourn_extrafields`
--

DROP TABLE IF EXISTS `llxas_facture_fourn_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facture_fourn_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facture_fourn_extrafields`
--

LOCK TABLES `llxas_facture_fourn_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_facture_fourn_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facture_fourn_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facture_rec`
--

DROP TABLE IF EXISTS `llxas_facture_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facture_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `suspended` int(11) DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT 0,
  `date_lim_reglement` date DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelpdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `usenewprice` int(11) DEFAULT 0,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT 0,
  `generate_pdf` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llxas_projet` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facture_rec`
--

LOCK TABLES `llxas_facture_rec` WRITE;
/*!40000 ALTER TABLE `llxas_facture_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facture_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facture_rec_extrafields`
--

DROP TABLE IF EXISTS `llxas_facture_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facture_rec_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facture_rec_extrafields`
--

LOCK TABLES `llxas_facture_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_facture_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facture_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facturedet`
--

DROP TABLE IF EXISTS `llxas_facturedet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facturedet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `situation_percent` double DEFAULT 100,
  `fk_prev_id` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  KEY `idx_facturedet_fk_facture` (`fk_facture`),
  KEY `idx_facturedet_fk_product` (`fk_product`),
  KEY `idx_facturedet_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facturedet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llxas_facture` (`rowid`),
  CONSTRAINT `fk_facturedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facturedet`
--

LOCK TABLES `llxas_facturedet` WRITE;
/*!40000 ALTER TABLE `llxas_facturedet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facturedet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facturedet_extrafields`
--

DROP TABLE IF EXISTS `llxas_facturedet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facturedet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facturedet_extrafields`
--

LOCK TABLES `llxas_facturedet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_facturedet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facturedet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facturedet_rec`
--

DROP TABLE IF EXISTS `llxas_facturedet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facturedet_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `date_start_fill` int(11) DEFAULT 0,
  `date_end_fill` int(11) DEFAULT 0,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(10) unsigned DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  KEY `fk_facturedet_rec_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facturedet_rec`
--

LOCK TABLES `llxas_facturedet_rec` WRITE;
/*!40000 ALTER TABLE `llxas_facturedet_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facturedet_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_facturedet_rec_extrafields`
--

DROP TABLE IF EXISTS `llxas_facturedet_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_facturedet_rec_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_facturedet_rec_extrafields`
--

LOCK TABLES `llxas_facturedet_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_facturedet_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_facturedet_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_fichinter`
--

DROP TABLE IF EXISTS `llxas_fichinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_fichinter` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `fk_contrat` int(11) DEFAULT 0,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  KEY `idx_fichinter_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_fichinter_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_fichinter`
--

LOCK TABLES `llxas_fichinter` WRITE;
/*!40000 ALTER TABLE `llxas_fichinter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_fichinter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_fichinter_extrafields`
--

DROP TABLE IF EXISTS `llxas_fichinter_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_fichinter_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinter_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_fichinter_extrafields`
--

LOCK TABLES `llxas_fichinter_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_fichinter_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_fichinter_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_fichinter_rec`
--

DROP TABLE IF EXISTS `llxas_fichinter_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_fichinter_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_contrat` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelpdf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_fichinter_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_fichinter_rec_fk_soc` (`fk_soc`),
  KEY `idx_fichinter_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_fichinter_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_fichinter_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llxas_projet` (`rowid`),
  CONSTRAINT `fk_fichinter_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_fichinter_rec`
--

LOCK TABLES `llxas_fichinter_rec` WRITE;
/*!40000 ALTER TABLE `llxas_fichinter_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_fichinter_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_fichinterdet`
--

DROP TABLE IF EXISTS `llxas_fichinterdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_fichinterdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int(11) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`),
  CONSTRAINT `fk_fichinterdet_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `llxas_fichinter` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_fichinterdet`
--

LOCK TABLES `llxas_fichinterdet` WRITE;
/*!40000 ALTER TABLE `llxas_fichinterdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_fichinterdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_fichinterdet_extrafields`
--

DROP TABLE IF EXISTS `llxas_fichinterdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_fichinterdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinterdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_fichinterdet_extrafields`
--

LOCK TABLES `llxas_fichinterdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_fichinterdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_fichinterdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_fichinterdet_rec`
--

DROP TABLE IF EXISTS `llxas_fichinterdet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_fichinterdet_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `fk_export_commpta` int(11) NOT NULL DEFAULT 0,
  `special_code` int(10) unsigned DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_fichinterdet_rec`
--

LOCK TABLES `llxas_fichinterdet_rec` WRITE;
/*!40000 ALTER TABLE `llxas_fichinterdet_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_fichinterdet_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_holiday`
--

DROP TABLE IF EXISTS `llxas_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_holiday` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int(11) DEFAULT 0,
  `statut` int(11) NOT NULL DEFAULT 1,
  `fk_validator` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `detail_refuse` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_entity` (`entity`),
  KEY `idx_holiday_fk_user` (`fk_user`),
  KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  KEY `idx_holiday_date_create` (`date_create`),
  KEY `idx_holiday_date_debut` (`date_debut`),
  KEY `idx_holiday_date_fin` (`date_fin`),
  KEY `idx_holiday_fk_validator` (`fk_validator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_holiday`
--

LOCK TABLES `llxas_holiday` WRITE;
/*!40000 ALTER TABLE `llxas_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_holiday_config`
--

DROP TABLE IF EXISTS `llxas_holiday_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_holiday_config` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_holiday_config` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_holiday_config`
--

LOCK TABLES `llxas_holiday_config` WRITE;
/*!40000 ALTER TABLE `llxas_holiday_config` DISABLE KEYS */;
INSERT INTO `llxas_holiday_config` (`rowid`, `name`, `value`) VALUES (1,'lastUpdate',NULL);
/*!40000 ALTER TABLE `llxas_holiday_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_holiday_extrafields`
--

DROP TABLE IF EXISTS `llxas_holiday_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_holiday_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_holiday_extrafields`
--

LOCK TABLES `llxas_holiday_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_holiday_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_holiday_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_holiday_logs`
--

DROP TABLE IF EXISTS `llxas_holiday_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_holiday_logs` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_action` datetime NOT NULL,
  `fk_user_action` int(11) NOT NULL,
  `fk_user_update` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `type_action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prev_solde` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_solde` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_holiday_logs`
--

LOCK TABLES `llxas_holiday_logs` WRITE;
/*!40000 ALTER TABLE `llxas_holiday_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_holiday_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_holiday_users`
--

DROP TABLE IF EXISTS `llxas_holiday_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_holiday_users` (
  `fk_user` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT 0,
  UNIQUE KEY `uk_holiday_users` (`fk_user`,`fk_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_holiday_users`
--

LOCK TABLES `llxas_holiday_users` WRITE;
/*!40000 ALTER TABLE `llxas_holiday_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_holiday_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_import_model`
--

DROP TABLE IF EXISTS `llxas_import_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_import_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_import_model` (`label`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_import_model`
--

LOCK TABLES `llxas_import_model` WRITE;
/*!40000 ALTER TABLE `llxas_import_model` DISABLE KEYS */;
INSERT INTO `llxas_import_model` (`rowid`, `fk_user`, `label`, `type`, `field`, `entity`) VALUES (1,0,'upload sku template','unboxutil_2','4=p.rowid,1=p.fk_commande,7=p.label,8=p.Qty',0);
/*!40000 ALTER TABLE `llxas_import_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_intracommreport`
--

DROP TABLE IF EXISTS `llxas_intracommreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_intracommreport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type_declaration` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periods` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_xml` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_export` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_intracommreport`
--

LOCK TABLES `llxas_intracommreport` WRITE;
/*!40000 ALTER TABLE `llxas_intracommreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_intracommreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_inventory`
--

DROP TABLE IF EXISTS `llxas_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_inventory` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 0,
  `ref` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_inventory` datetime DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_inventory_ref` (`ref`,`entity`),
  KEY `idx_inventory_tms` (`tms`),
  KEY `idx_inventory_date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_inventory`
--

LOCK TABLES `llxas_inventory` WRITE;
/*!40000 ALTER TABLE `llxas_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_inventorydet`
--

DROP TABLE IF EXISTS `llxas_inventorydet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_inventorydet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_inventory` int(11) DEFAULT 0,
  `fk_warehouse` int(11) DEFAULT 0,
  `fk_product` int(11) DEFAULT 0,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_stock` double DEFAULT NULL,
  `qty_view` double DEFAULT NULL,
  `qty_regulated` double DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_inventorydet` (`fk_inventory`,`fk_warehouse`,`fk_product`,`batch`),
  KEY `idx_inventorydet_tms` (`tms`),
  KEY `idx_inventorydet_datec` (`datec`),
  KEY `idx_inventorydet_fk_inventory` (`fk_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_inventorydet`
--

LOCK TABLES `llxas_inventorydet` WRITE;
/*!40000 ALTER TABLE `llxas_inventorydet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_inventorydet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_knowledgemanagement_knowledgerecord`
--

DROP TABLE IF EXISTS `llxas_knowledgemanagement_knowledgerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_knowledgemanagement_knowledgerecord` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_ticket` int(11) DEFAULT NULL,
  `fk_c_ticket_category` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_knowledgemanagement_knowledgerecord`
--

LOCK TABLES `llxas_knowledgemanagement_knowledgerecord` WRITE;
/*!40000 ALTER TABLE `llxas_knowledgemanagement_knowledgerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_knowledgemanagement_knowledgerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_knowledgemanagement_knowledgerecord_extrafields`
--

DROP TABLE IF EXISTS `llxas_knowledgemanagement_knowledgerecord_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_knowledgemanagement_knowledgerecord_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_knowledgemanagement_knowledgerecord_extrafields`
--

LOCK TABLES `llxas_knowledgemanagement_knowledgerecord_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_knowledgemanagement_knowledgerecord_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_knowledgemanagement_knowledgerecord_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_links`
--

DROP TABLE IF EXISTS `llxas_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_links` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datea` datetime NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objecttype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectid` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_links` (`objectid`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_links`
--

LOCK TABLES `llxas_links` WRITE;
/*!40000 ALTER TABLE `llxas_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_listexportimport_format`
--

DROP TABLE IF EXISTS `llxas_listexportimport_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_listexportimport_format` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `format` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warning` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_listexportimport_format`
--

LOCK TABLES `llxas_listexportimport_format` WRITE;
/*!40000 ALTER TABLE `llxas_listexportimport_format` DISABLE KEYS */;
INSERT INTO `llxas_listexportimport_format` (`rowid`, `format`, `type`, `description`, `title`, `warning`, `picto`, `position`, `active`) VALUES (1,'csv','export','','ExportCSV','','csv.png',1,1),(2,'pdf','export','','ExportPDF','','pdf.png',2,1),(3,'png','export','','ExportPNG','','image.png',3,1),(4,'sql','export','','ExportSQL','ExportsFullList','sql.png',4,1),(5,'csvfromdb','export','CSVFromDBDescription','ExportCSVFromDB','ExportsFullList','csv.png',5,0),(6,'csv','import','DataShouldFitToTableFields','ImportCSV','','csv.png',10,0),(7,'sql','import','','ImportSQL','','sql_import.png',11,0);
/*!40000 ALTER TABLE `llxas_listexportimport_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_loan`
--

DROP TABLE IF EXISTS `llxas_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_loan` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `capital` double(24,8) NOT NULL DEFAULT 0.00000000,
  `insurance_amount` double(24,8) DEFAULT 0.00000000,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `nbterm` double DEFAULT NULL,
  `rate` double NOT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital_position` double(24,8) DEFAULT 0.00000000,
  `date_position` date DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `accountancy_account_capital` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_account_insurance` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_account_interest` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_loan`
--

LOCK TABLES `llxas_loan` WRITE;
/*!40000 ALTER TABLE `llxas_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_loan_schedule`
--

DROP TABLE IF EXISTS `llxas_loan_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_loan_schedule` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_payment_loan` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_loan_schedule`
--

LOCK TABLES `llxas_loan_schedule` WRITE;
/*!40000 ALTER TABLE `llxas_loan_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_loan_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_localtax`
--

DROP TABLE IF EXISTS `llxas_localtax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_localtax` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `localtaxtype` tinyint(4) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_localtax`
--

LOCK TABLES `llxas_localtax` WRITE;
/*!40000 ALTER TABLE `llxas_localtax` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_localtax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_mailing`
--

DROP TABLE IF EXISTS `llxas_mailing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_mailing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `statut` smallint(6) DEFAULT 0,
  `titre` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `sujet` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bgcolor` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bgimage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cible` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nbemail` int(11) DEFAULT NULL,
  `email_from` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_replyto` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_errorsto` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_appro` datetime DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_appro` int(11) DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_file1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_file2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_file3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joined_file4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_mailing`
--

LOCK TABLES `llxas_mailing` WRITE;
/*!40000 ALTER TABLE `llxas_mailing` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_mailing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_mailing_cibles`
--

DROP TABLE IF EXISTS `llxas_mailing_cibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_mailing_cibles` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_mailing` int(11) NOT NULL,
  `fk_contact` int(11) NOT NULL,
  `lastname` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `source_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `error_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_cibles` (`fk_mailing`,`email`),
  KEY `idx_mailing_cibles_email` (`email`),
  KEY `idx_mailing_cibles_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_mailing_cibles`
--

LOCK TABLES `llxas_mailing_cibles` WRITE;
/*!40000 ALTER TABLE `llxas_mailing_cibles` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_mailing_cibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_mailing_unsubscribe`
--

DROP TABLE IF EXISTS `llxas_mailing_unsubscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_mailing_unsubscribe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsubscribegroup` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_unsubscribe` (`email`,`entity`,`unsubscribegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_mailing_unsubscribe`
--

LOCK TABLES `llxas_mailing_unsubscribe` WRITE;
/*!40000 ALTER TABLE `llxas_mailing_unsubscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_mailing_unsubscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_menu`
--

DROP TABLE IF EXISTS `llxas_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_menu` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `menu_handler` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainmenu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leftmenu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_menu` int(11) NOT NULL,
  `fk_mainmenu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_leftmenu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `langs` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `perms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usertype` int(11) NOT NULL DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_menu_uk_menu` (`menu_handler`,`fk_menu`,`position`,`url`,`entity`),
  KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_menu`
--

LOCK TABLES `llxas_menu` WRITE;
/*!40000 ALTER TABLE `llxas_menu` DISABLE KEYS */;
INSERT INTO `llxas_menu` (`rowid`, `menu_handler`, `entity`, `module`, `type`, `mainmenu`, `leftmenu`, `fk_menu`, `fk_mainmenu`, `fk_leftmenu`, `position`, `url`, `target`, `titre`, `prefix`, `langs`, `level`, `perms`, `enabled`, `usertype`, `tms`) VALUES (1,'all',1,'reports','top','reports','1',0,NULL,NULL,100,'/reports/index.php','','Reports',NULL,'reports@reports',NULL,'$user->rights->reports->use','$conf->reports->enabled',0,'2021-11-22 16:06:01'),(31,'all',1,'kanview','top','kanview',NULL,0,NULL,NULL,100,'/kanview/view/kanview_board.php','','Kanview_TopMenu_Dashboard',NULL,'kanview@kanview',NULL,'$user->rights->kanview->canuse','$conf->kanview->enabled',0,'2022-11-09 19:03:46'),(32,'all',1,'kanview','left','kanview',NULL,31,NULL,NULL,200,'/kanview/view/projets_kb.php','','Kanview_LeftMenu_Projet_Kanban',NULL,'kanview@kanview',NULL,'((!$conf->global->MAIN_USE_ADVANCED_PERMS) && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->projet->enabled && $user->rights->projet->lire) || ($conf->global->MAIN_USE_ADVANCED_PERMS && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->projet->enabled && $user->rights->projet->lire && $user->rights->kanview->kanview_advance->canuse_projects)','$conf->kanview->enabled && $conf->projet->enabled',0,'2022-11-09 19:03:46'),(33,'all',1,'kanview','left','kanview',NULL,31,NULL,NULL,250,'/kanview/view/tasks_kb.php','','Kanview_LeftMenu_ProjetTask_Kanban',NULL,'kanview@kanview',NULL,'((!$conf->global->MAIN_USE_ADVANCED_PERMS) && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->projet->enabled && $user->rights->projet->lire) || ($conf->global->MAIN_USE_ADVANCED_PERMS && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->projet->enabled && $user->rights->projet->lire && $user->rights->kanview->kanview_advance->canuse_tasks)','$conf->kanview->enabled && $conf->projet->enabled',0,'2022-11-09 19:03:46'),(34,'all',1,'kanview','left','kanview',NULL,31,NULL,NULL,300,'/kanview/view/propals_kb.php','','Kanview_LeftMenu_Propal_Kanban',NULL,'kanview@kanview',NULL,'((!$conf->global->MAIN_USE_ADVANCED_PERMS) && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->propal->enabled && $user->rights->propale->lire && $user->rights->propale->creer && $user->rights->propale->cloturer) || ($conf->global->MAIN_USE_ADVANCED_PERMS && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->propal->enabled && $user->rights->propale->lire && $user->rights->propale->creer && $user->rights->propale->cloturer && $user->rights->kanview->kanview_advance->canuse_propals && $user->rights->propale->propal_advance->validate && 1)','$conf->kanview->enabled && $conf->propal->enabled',0,'2022-11-09 19:03:46'),(35,'all',1,'kanview','left','kanview',NULL,31,NULL,NULL,400,'/kanview/view/orders_kb.php','','Kanview_LeftMenu_Commande_Kanban',NULL,'kanview@kanview',NULL,'((!$conf->global->MAIN_USE_ADVANCED_PERMS) && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->commande->enabled && $user->rights->commande->lire && $user->rights->commande->creer) || ($conf->global->MAIN_USE_ADVANCED_PERMS && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->commande->enabled && $user->rights->commande->lire && $user->rights->commande->creer && $user->rights->kanview->kanview_advance->canuse_orders && $user->rights->commande->order_advance->validate && $user->rights->commande->order_advance->annuler && $user->rights->commande->order_advance->close)','$conf->kanview->enabled && $conf->commande->enabled',0,'2022-11-09 19:03:46'),(36,'all',1,'kanview','left','kanview',NULL,31,NULL,NULL,500,'/kanview/view/invoices_kb.php','','Kanview_LeftMenu_Facture_Kanban',NULL,'kanview@kanview',NULL,'((!$conf->global->MAIN_USE_ADVANCED_PERMS) && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->facture->enabled && $user->rights->facture->lire && $user->rights->facture->creer && $user->rights->facture->paiement) || ($conf->global->MAIN_USE_ADVANCED_PERMS && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->facture->enabled && $user->rights->facture->lire && $user->rights->facture->creer && $user->rights->facture->paiement && $user->rights->kanview->kanview_advance->canuse_invoices && $user->rights->facture->invoice_advance->unvalidate && $user->rights->facture->invoice_advance->validate)','$conf->kanview->enabled && $conf->facture->enabled',0,'2022-11-09 19:03:46'),(37,'all',1,'kanview','left','kanview',NULL,31,NULL,NULL,600,'/kanview/view/prospects_kb.php','','Kanview_LeftMenu_Societe_Kanban',NULL,'kanview@kanview',NULL,'((!$conf->global->MAIN_USE_ADVANCED_PERMS) && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->societe->enabled && $user->rights->societe->lire && $user->rights->societe->creer) || ($conf->global->MAIN_USE_ADVANCED_PERMS && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->societe->enabled && $user->rights->societe->lire && $user->rights->societe->creer && $user->rights->kanview->kanview_advance->canuse_prospects)','$conf->kanview->enabled && $conf->societe->enabled',0,'2022-11-09 19:03:46'),(38,'all',1,'kanview','left','kanview',NULL,31,NULL,NULL,700,'/kanview/view/invoices_suppliers_kb.php','','Kanview_LeftMenu_FactureFournisseur_Kanban',NULL,'kanview@kanview',NULL,'((!$conf->global->MAIN_USE_ADVANCED_PERMS) && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->fournisseur->enabled && $user->rights->fournisseur->facture->lire && $user->rights->fournisseur->facture->creer) || ($conf->global->MAIN_USE_ADVANCED_PERMS && $conf->kanview->enabled && $user->rights->kanview->canuse && $conf->fournisseur->enabled && $user->rights->fournisseur->facture->lire && $user->rights->fournisseur->facture->creer && $user->rights->kanview->kanview_advance->canuse_invoices_suppliers && $user->rights->fournisseur->supplier_invoice_advance->validate)','$conf->kanview->enabled && $conf->fournisseur->enabled',0,'2022-11-09 19:03:46'),(39,'all',1,'kanview','left','kanview',NULL,31,NULL,NULL,800,'/kanview/admin/kanview_config.php','_blank','Kanview_LeftMenu_Config',NULL,'kanview@kanview',NULL,'$user->admin','$conf->kanview->enabled && $user->admin',0,'2022-11-09 19:03:46'),(44,'all',1,'agenda','top','agenda',NULL,0,NULL,NULL,86,'/comm/action/index.php','','TMenuAgenda','<span class=\"fas fa-calendar-alt infobox-action paddingright pictofixedwidth\" style=\"\"></span>','agenda',NULL,'$user->rights->agenda->myactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(45,'all',1,'agenda','left','agenda',NULL,44,NULL,NULL,100,'/comm/action/index.php?mainmenu=agenda&amp;leftmenu=agenda','','Actions','<span class=\"fas fa-calendar-alt infobox-action paddingright pictofixedwidth\" style=\"\"></span>','agenda',NULL,'$user->rights->agenda->myactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(46,'all',1,'agenda','left','agenda',NULL,45,NULL,NULL,101,'/comm/action/card.php?mainmenu=agenda&amp;leftmenu=agenda&amp;action=create','','NewAction','','commercial',NULL,'($user->rights->agenda->myactions->create||$user->rights->agenda->allactions->create)','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(47,'all',1,'agenda','left','agenda',NULL,45,NULL,NULL,140,'/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda','','Calendar','','agenda',NULL,'$user->rights->agenda->myactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(48,'all',1,'agenda','left','agenda',NULL,47,NULL,NULL,141,'/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=todo&amp;filter=mine','','MenuToDoMyActions','','agenda',NULL,'$user->rights->agenda->myactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(49,'all',1,'agenda','left','agenda',NULL,47,NULL,NULL,142,'/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=done&amp;filter=mine','','MenuDoneMyActions','','agenda',NULL,'$user->rights->agenda->myactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(50,'all',1,'agenda','left','agenda',NULL,47,NULL,NULL,143,'/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=todo&amp;filtert=-1','','MenuToDoActions','','agenda',NULL,'$user->rights->agenda->allactions->read','$user->rights->agenda->allactions->read',2,'2023-01-25 00:18:17'),(51,'all',1,'agenda','left','agenda',NULL,47,NULL,NULL,144,'/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=done&amp;filtert=-1','','MenuDoneActions','','agenda',NULL,'$user->rights->agenda->allactions->read','$user->rights->agenda->allactions->read',2,'2023-01-25 00:18:17'),(52,'all',1,'agenda','left','agenda',NULL,45,NULL,NULL,110,'/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda','','List','','agenda',NULL,'$user->rights->agenda->myactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(53,'all',1,'agenda','left','agenda',NULL,52,NULL,NULL,111,'/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=todo&amp;filter=mine','','MenuToDoMyActions','','agenda',NULL,'$user->rights->agenda->myactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(54,'all',1,'agenda','left','agenda',NULL,52,NULL,NULL,112,'/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=done&amp;filter=mine','','MenuDoneMyActions','','agenda',NULL,'$user->rights->agenda->myactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(55,'all',1,'agenda','left','agenda',NULL,52,NULL,NULL,113,'/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=todo&amp;filtert=-1','','MenuToDoActions','','agenda',NULL,'$user->rights->agenda->allactions->read','$user->rights->agenda->allactions->read',2,'2023-01-25 00:18:17'),(56,'all',1,'agenda','left','agenda',NULL,52,NULL,NULL,114,'/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=done&amp;filtert=-1','','MenuDoneActions','','agenda',NULL,'$user->rights->agenda->allactions->read','$user->rights->agenda->allactions->read',2,'2023-01-25 00:18:17'),(57,'all',1,'agenda','left','agenda',NULL,45,NULL,NULL,160,'/comm/action/rapport/index.php?mainmenu=agenda&amp;leftmenu=agenda','','Reportings','','agenda',NULL,'$user->rights->agenda->allactions->read','$conf->agenda->enabled',2,'2023-01-25 00:18:17'),(58,'all',1,'agenda','left','agenda',NULL,45,NULL,NULL,170,'/categories/index.php?mainmenu=agenda&amp;leftmenu=agenda&type=10','','Categories','','agenda',NULL,'$user->rights->agenda->allactions->read','$conf->categorie->enabled',2,'2023-01-25 00:18:17'),(59,'all',1,'barcode','left','tools','barcodeprint',-1,'tools',NULL,200,'/barcode/printsheet.php?mainmenu=tools&leftmenu=barcodeprint','','BarCodePrintsheet','<span class=\"fas fa-barcode paddingright pictofixedwidth\" style=\"\"></span>','products',NULL,'($conf->global->MAIN_USE_ADVANCED_PERMS && $user->rights->barcode->lire_advance) || (! $conf->global->MAIN_USE_ADVANCED_PERMS)','$conf->barcode->enabled',0,'2023-01-25 00:18:18'),(60,'all',1,'barcode','left','home',NULL,-1,'home','admintools',300,'/barcode/codeinit.php?mainmenu=home&leftmenu=admintools','','MassBarcodeInit','','products',NULL,'($conf->global->MAIN_USE_ADVANCED_PERMS && $user->rights->barcode->creer_advance) || (! $conf->global->MAIN_USE_ADVANCED_PERMS)','$conf->barcode->enabled && preg_match(\'/^(admintools|all)/\',$leftmenu)',0,'2023-01-25 00:18:18'),(61,'all',1,'cron','left','home',NULL,-1,'home','admintools',200,'/cron/list.php?leftmenu=admintools','','CronList','','cron',NULL,'$user->rights->cron->read','$conf->cron->enabled && preg_match(\'/^(admintools|all)/\', $leftmenu)',2,'2023-01-25 00:18:18'),(62,'all',1,'ecm','top','ecm',NULL,0,NULL,NULL,82,'/ecm/index.php','','MenuECM','<span class=\"fas fa-folder-open paddingright pictofixedwidth\" style=\"\"></span>','ecm',NULL,'$user->rights->ecm->read || $user->rights->ecm->upload || $user->rights->ecm->setup','$conf->ecm->enabled',2,'2023-01-25 00:18:19'),(63,'all',1,'ecm','left','ecm','ecm',-1,'ecm',NULL,101,'/ecm/index.php?mainmenu=ecm&leftmenu=ecm','','ECMArea','<span class=\"fas fa-folder-open paddingright pictofixedwidth\" style=\"\"></span>','ecm',NULL,'$user->rights->ecm->read || $user->rights->ecm->upload','$user->rights->ecm->read || $user->rights->ecm->upload',2,'2023-01-25 00:18:19'),(64,'all',1,'ecm','left','ecm','ecm_manual',-1,'ecm','ecm',102,'/ecm/index.php?action=file_manager&mainmenu=ecm&leftmenu=ecm','','ECMSectionsManual','','ecm',NULL,'$user->rights->ecm->read || $user->rights->ecm->upload','$user->rights->ecm->read || $user->rights->ecm->upload',2,'2023-01-25 00:18:19'),(65,'all',1,'ecm','left','ecm',NULL,-1,'ecm','ecm',103,'/ecm/index_auto.php?action=file_manager&mainmenu=ecm&leftmenu=ecm','','ECMSectionsAuto','','ecm',NULL,'$user->rights->ecm->read || $user->rights->ecm->upload','($user->rights->ecm->read || $user->rights->ecm->upload) && ! empty($conf->global->ECM_AUTO_TREE_ENABLED)',2,'2023-01-25 00:18:19'),(66,'all',1,'margins','left','billing','margins',-1,'billing',NULL,100,'/margin/index.php','','Margins','<span class=\"fas fa-calculator infobox-bank_account paddingright pictofixedwidth\" style=\"\"></span>','margins',NULL,'$user->rights->margins->liretous','$conf->margin->enabled',2,'2023-01-25 00:18:22'),(67,'all',1,'printing','left','home',NULL,-1,'home','admintools',300,'/printing/index.php?mainmenu=home&leftmenu=admintools','','MenuDirectPrinting','','printing',NULL,'$user->rights->printing->read','$conf->printing->enabled && preg_match(\'/^(admintools|all)/\', $leftmenu)',0,'2023-01-25 00:18:22'),(68,'all',1,'resource','left','tools','resource',-1,'tools',NULL,100,'/resource/list.php','','MenuResourceIndex','<span class=\"fas fa-laptop-house  em092 infobox-action paddingright pictofixedwidth em92\" style=\"\"></span>','resource',NULL,'$user->rights->resource->read','1',0,'2023-01-25 00:18:22'),(69,'all',1,'resource','left','tools','resource_add',-1,'tools','resource',101,'/resource/card.php?action=create','','MenuResourceAdd','','resource',NULL,'$user->rights->resource->write','1',0,'2023-01-25 00:18:22'),(70,'all',1,'resource','left','tools','resource_list',-1,'tools','resource',102,'/resource/list.php','','List','','resource',NULL,'$user->rights->resource->read','1',0,'2023-01-25 00:18:22'),(71,'all',1,'ticket','left','ticket','ticket',-1,'ticket',NULL,101,'/ticket/index.php','','Ticket','<span class=\"fas fa-ticket-alt infobox-contrat paddingright pictofixedwidth em092\" style=\"\"></span>','ticket',NULL,'$user->rights->ticket->read','$conf->ticket->enabled',2,'2023-01-25 00:18:23'),(72,'all',1,'ticket','left','ticket',NULL,-1,'ticket','ticket',102,'/ticket/card.php?action=create','','NewTicket','','ticket',NULL,'$user->rights->ticket->write','$conf->ticket->enabled',2,'2023-01-25 00:18:23'),(73,'all',1,'ticket','left','ticket','ticketlist',-1,'ticket','ticket',103,'/ticket/list.php?search_fk_status=non_closed','','List','','ticket',NULL,'$user->rights->ticket->read','$conf->ticket->enabled',2,'2023-01-25 00:18:23'),(74,'all',1,'ticket','left','ticket','ticketmy',-1,'ticket','ticket',105,'/ticket/list.php?mode=mine&search_fk_status=non_closed','','MenuTicketMyAssign','','ticket',NULL,'$user->rights->ticket->read','$conf->ticket->enabled',0,'2023-01-25 00:18:23'),(75,'all',1,'ticket','left','ticket',NULL,-1,'ticket','ticket',107,'/ticket/stats/index.php','','Statistics','','ticket',NULL,'$user->rights->ticket->read','$conf->ticket->enabled',0,'2023-01-25 00:18:23'),(76,'all',1,'discountrules','left','products','discountrules',-1,'products',NULL,1001,'/discountrules/discountrule_list.php','','ListDiscountRule','<span class=\"fas fa-tag em092 pictofixedwidth discount-rules-left-menu-picto\" style=\"color: #e72400;\"></span>','discountrules@discountrules',NULL,'$user->rights->discountrules->read','$conf->discountrules->enabled',0,'2023-02-07 18:45:50'),(77,'all',1,'discountrules','left','products','discountrulesCreate',-1,'products','discountrules',1002,'/discountrules/discountrule_card.php?action=create','','NewDiscountRule','','discountrules@discountrules',NULL,'$user->rights->discountrules->create','$conf->discountrules->enabled',0,'2023-02-07 18:45:50'),(78,'all',1,'discountrules','left','products','discountrulesList',-1,'products','discountrules',1003,'/discountrules/discountrule_list.php','','MenuDiscountRuleListe','','discountrules@discountrules',NULL,'$user->rights->discountrules->read','$conf->discountrules->enabled',0,'2023-02-07 18:45:50'),(79,'all',1,'discountrules','left','products','discountrulesPricesList',-1,'products','discountrules',1004,'/discountrules/prices_list.php','','MenuDiscountRulePricesList','','discountrules@discountrules',NULL,'$user->rights->discountrules->read','$conf->discountrules->enabled',0,'2023-02-07 18:45:50'),(80,'all',1,'discountrules','left','importdiscountrules','importdiscountrules_left',-1,'tools','import',1005,'/discountrules/discount_rules_import.php?datatoimport=importdiscountrules&mainmenu=tools','','idrImportDiscountRules','<img src=\"/discountrules/img/discountrules_card.png\" alt=\"\" class=\"paddingright pictofixedwidth valignmiddle\">','importdiscountrules@discountrules',NULL,'$user->rights->discountrules->create','$conf->discountrules->enabled',0,'2023-02-07 18:45:50');
/*!40000 ALTER TABLE `llxas_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_mrp_mo`
--

DROP TABLE IF EXISTS `llxas_mrp_mo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_mrp_mo` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `date_start_planned` datetime DEFAULT NULL,
  `date_end_planned` datetime DEFAULT NULL,
  `fk_bom` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_ref` (`ref`),
  KEY `idx_mrp_mo_entity` (`entity`),
  KEY `idx_mrp_mo_fk_soc` (`fk_soc`),
  KEY `fk_mrp_mo_fk_user_creat` (`fk_user_creat`),
  KEY `idx_mrp_mo_status` (`status`),
  KEY `idx_mrp_mo_fk_product` (`fk_product`),
  KEY `idx_mrp_mo_date_start_planned` (`date_start_planned`),
  KEY `idx_mrp_mo_date_end_planned` (`date_end_planned`),
  KEY `idx_mrp_mo_fk_bom` (`fk_bom`),
  KEY `idx_mrp_mo_fk_project` (`fk_project`),
  CONSTRAINT `fk_mrp_mo_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_mrp_mo`
--

LOCK TABLES `llxas_mrp_mo` WRITE;
/*!40000 ALTER TABLE `llxas_mrp_mo` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_mrp_mo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_mrp_mo_extrafields`
--

DROP TABLE IF EXISTS `llxas_mrp_mo_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_mrp_mo_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_mrp_mo_extrafields`
--

LOCK TABLES `llxas_mrp_mo_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_mrp_mo_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_mrp_mo_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_mrp_production`
--

DROP TABLE IF EXISTS `llxas_mrp_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_mrp_production` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_mo` int(11) NOT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `fk_product` int(11) NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 1,
  `qty_frozen` smallint(6) DEFAULT 0,
  `disable_stock_change` smallint(6) DEFAULT 0,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_mrp_production` int(11) DEFAULT NULL,
  `fk_stock_movement` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_mrp_production_product` (`fk_product`),
  KEY `fk_mrp_production_stock_movement` (`fk_stock_movement`),
  KEY `idx_mrp_production_fk_mo` (`fk_mo`),
  CONSTRAINT `fk_mrp_production_mo` FOREIGN KEY (`fk_mo`) REFERENCES `llxas_mrp_mo` (`rowid`),
  CONSTRAINT `fk_mrp_production_product` FOREIGN KEY (`fk_product`) REFERENCES `llxas_product` (`rowid`),
  CONSTRAINT `fk_mrp_production_stock_movement` FOREIGN KEY (`fk_stock_movement`) REFERENCES `llxas_stock_mouvement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_mrp_production`
--

LOCK TABLES `llxas_mrp_production` WRITE;
/*!40000 ALTER TABLE `llxas_mrp_production` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_mrp_production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_multicurrency`
--

DROP TABLE IF EXISTS `llxas_multicurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_multicurrency` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_multicurrency`
--

LOCK TABLES `llxas_multicurrency` WRITE;
/*!40000 ALTER TABLE `llxas_multicurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_multicurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_multicurrency_rate`
--

DROP TABLE IF EXISTS `llxas_multicurrency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_multicurrency_rate` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_sync` datetime DEFAULT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `fk_multicurrency` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_multicurrency_rate`
--

LOCK TABLES `llxas_multicurrency_rate` WRITE;
/*!40000 ALTER TABLE `llxas_multicurrency_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_multicurrency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_notify`
--

DROP TABLE IF EXISTS `llxas_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_notify` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `daten` datetime DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'email',
  `type_target` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objet_type` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objet_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_notify`
--

LOCK TABLES `llxas_notify` WRITE;
/*!40000 ALTER TABLE `llxas_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_notify_def`
--

DROP TABLE IF EXISTS `llxas_notify_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_notify_def` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` date DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'email',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_notify_def`
--

LOCK TABLES `llxas_notify_def` WRITE;
/*!40000 ALTER TABLE `llxas_notify_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_notify_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_notify_def_object`
--

DROP TABLE IF EXISTS `llxas_notify_def_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_notify_def_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `objet_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objet_id` int(11) NOT NULL,
  `type_notif` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'browser',
  `date_notif` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moreparam` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_notify_def_object`
--

LOCK TABLES `llxas_notify_def_object` WRITE;
/*!40000 ALTER TABLE `llxas_notify_def_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_notify_def_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_oauth_state`
--

DROP TABLE IF EXISTS `llxas_oauth_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_oauth_state` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_oauth_state`
--

LOCK TABLES `llxas_oauth_state` WRITE;
/*!40000 ALTER TABLE `llxas_oauth_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_oauth_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_oauth_token`
--

DROP TABLE IF EXISTS `llxas_oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_oauth_token` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tokenstring` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `restricted_ips` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_oauth_token`
--

LOCK TABLES `llxas_oauth_token` WRITE;
/*!40000 ALTER TABLE `llxas_oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_object_lang`
--

DROP TABLE IF EXISTS `llxas_object_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_object_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_object` int(11) NOT NULL DEFAULT 0,
  `type_object` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_object_lang` (`fk_object`,`type_object`,`property`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_object_lang`
--

LOCK TABLES `llxas_object_lang` WRITE;
/*!40000 ALTER TABLE `llxas_object_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_object_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_onlinesignature`
--

DROP TABLE IF EXISTS `llxas_onlinesignature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_onlinesignature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `object_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pathoffile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_onlinesignature`
--

LOCK TABLES `llxas_onlinesignature` WRITE;
/*!40000 ALTER TABLE `llxas_onlinesignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_onlinesignature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_opensurvey_comments`
--

DROP TABLE IF EXISTS `llxas_opensurvey_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_opensurvey_comments` (
  `id_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sondage` char(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usercomment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `idx_id_comment` (`id_comment`),
  KEY `idx_id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_opensurvey_comments`
--

LOCK TABLES `llxas_opensurvey_comments` WRITE;
/*!40000 ALTER TABLE `llxas_opensurvey_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_opensurvey_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_opensurvey_formquestions`
--

DROP TABLE IF EXISTS `llxas_opensurvey_formquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_opensurvey_formquestions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `id_sondage` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_answers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_opensurvey_formquestions`
--

LOCK TABLES `llxas_opensurvey_formquestions` WRITE;
/*!40000 ALTER TABLE `llxas_opensurvey_formquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_opensurvey_formquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_opensurvey_sondage`
--

DROP TABLE IF EXISTS `llxas_opensurvey_sondage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_opensurvey_sondage` (
  `id_sondage` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `commentaires` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_admin` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_admin` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `titre` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `format` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailsonde` tinyint(4) NOT NULL DEFAULT 0,
  `allow_comments` tinyint(4) NOT NULL DEFAULT 1,
  `allow_spy` tinyint(4) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sujet` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_sondage`),
  KEY `idx_date_fin` (`date_fin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_opensurvey_sondage`
--

LOCK TABLES `llxas_opensurvey_sondage` WRITE;
/*!40000 ALTER TABLE `llxas_opensurvey_sondage` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_opensurvey_sondage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_opensurvey_user_formanswers`
--

DROP TABLE IF EXISTS `llxas_opensurvey_user_formanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_opensurvey_user_formanswers` (
  `fk_user_survey` int(11) NOT NULL,
  `fk_question` int(11) NOT NULL,
  `reponses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_opensurvey_user_formanswers`
--

LOCK TABLES `llxas_opensurvey_user_formanswers` WRITE;
/*!40000 ALTER TABLE `llxas_opensurvey_user_formanswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_opensurvey_user_formanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_opensurvey_user_studs`
--

DROP TABLE IF EXISTS `llxas_opensurvey_user_studs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_opensurvey_user_studs` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sondage` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reponses` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_users`),
  KEY `idx_opensurvey_user_studs_id_users` (`id_users`),
  KEY `idx_opensurvey_user_studs_nom` (`nom`),
  KEY `idx_opensurvey_user_studs_id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_opensurvey_user_studs`
--

LOCK TABLES `llxas_opensurvey_user_studs` WRITE;
/*!40000 ALTER TABLE `llxas_opensurvey_user_studs` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_opensurvey_user_studs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_overwrite_trans`
--

DROP TABLE IF EXISTS `llxas_overwrite_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_overwrite_trans` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transkey` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transvalue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_overwrite_trans` (`lang`,`transkey`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_overwrite_trans`
--

LOCK TABLES `llxas_overwrite_trans` WRITE;
/*!40000 ALTER TABLE `llxas_overwrite_trans` DISABLE KEYS */;
INSERT INTO `llxas_overwrite_trans` (`rowid`, `entity`, `lang`, `transkey`, `transvalue`) VALUES (1,1,'en_US','TeleFax','Alt. Phone'),(2,1,'en_US','Fax','Alt. Phone'),(3,1,'en_US','OrderByFax','Alt. Phone'),(4,1,'en_US','LDAPFieldFax','Alt. Phone'),(5,1,'en_US','CreateReception','Create Receipt'),(6,1,'en_US','ClassifyReception','Classify Received');
/*!40000 ALTER TABLE `llxas_overwrite_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_paiement`
--

DROP TABLE IF EXISTS `llxas_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_paiement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_site` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_export_compta` int(11) NOT NULL DEFAULT 0,
  `pos_change` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_paiement`
--

LOCK TABLES `llxas_paiement` WRITE;
/*!40000 ALTER TABLE `llxas_paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_paiement_facture`
--

DROP TABLE IF EXISTS `llxas_paiement_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_paiement_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_paiement` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiement_facture` (`fk_paiement`,`fk_facture`),
  KEY `idx_paiement_facture_fk_facture` (`fk_facture`),
  KEY `idx_paiement_facture_fk_paiement` (`fk_paiement`),
  CONSTRAINT `fk_paiement_facture_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llxas_facture` (`rowid`),
  CONSTRAINT `fk_paiement_facture_fk_paiement` FOREIGN KEY (`fk_paiement`) REFERENCES `llxas_paiement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_paiement_facture`
--

LOCK TABLES `llxas_paiement_facture` WRITE;
/*!40000 ALTER TABLE `llxas_paiement_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_paiement_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_paiementcharge`
--

DROP TABLE IF EXISTS `llxas_paiementcharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_paiementcharge` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_charge` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_paiementcharge`
--

LOCK TABLES `llxas_paiementcharge` WRITE;
/*!40000 ALTER TABLE `llxas_paiementcharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_paiementcharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_paiementfourn`
--

DROP TABLE IF EXISTS `llxas_paiementfourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_paiementfourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_paiementfourn`
--

LOCK TABLES `llxas_paiementfourn` WRITE;
/*!40000 ALTER TABLE `llxas_paiementfourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_paiementfourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_paiementfourn_facturefourn`
--

DROP TABLE IF EXISTS `llxas_paiementfourn_facturefourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_paiementfourn_facturefourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_paiementfourn` int(11) DEFAULT NULL,
  `fk_facturefourn` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_paiementfourn_facturefourn`
--

LOCK TABLES `llxas_paiementfourn_facturefourn` WRITE;
/*!40000 ALTER TABLE `llxas_paiementfourn_facturefourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_paiementfourn_facturefourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_partnership`
--

DROP TABLE IF EXISTS `llxas_partnership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_partnership` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `status` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `date_partnership_start` date NOT NULL,
  `date_partnership_end` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `reason_decline_or_cancel` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_last_url_check_error` int(11) DEFAULT 0,
  `last_check_backlink` datetime DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_partnership_rowid` (`rowid`),
  KEY `idx_partnership_ref` (`ref`),
  KEY `idx_partnership_fk_soc` (`fk_soc`),
  KEY `llxas_partnership_fk_user_creat` (`fk_user_creat`),
  KEY `idx_partnership_status` (`status`),
  KEY `idx_partnership_fk_member` (`fk_member`),
  CONSTRAINT `llxas_partnership_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_partnership`
--

LOCK TABLES `llxas_partnership` WRITE;
/*!40000 ALTER TABLE `llxas_partnership` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_partnership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_partnership_extrafields`
--

DROP TABLE IF EXISTS `llxas_partnership_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_partnership_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_partnership_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_partnership_extrafields`
--

LOCK TABLES `llxas_partnership_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_partnership_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_partnership_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_payment_donation`
--

DROP TABLE IF EXISTS `llxas_payment_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_payment_donation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_donation` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_site` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_payment_donation`
--

LOCK TABLES `llxas_payment_donation` WRITE;
/*!40000 ALTER TABLE `llxas_payment_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_payment_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_payment_expensereport`
--

DROP TABLE IF EXISTS `llxas_payment_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_payment_expensereport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_payment_expensereport`
--

LOCK TABLES `llxas_payment_expensereport` WRITE;
/*!40000 ALTER TABLE `llxas_payment_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_payment_expensereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_payment_loan`
--

DROP TABLE IF EXISTS `llxas_payment_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_payment_loan` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_payment_loan`
--

LOCK TABLES `llxas_payment_loan` WRITE;
/*!40000 ALTER TABLE `llxas_payment_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_payment_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_payment_salary`
--

DROP TABLE IF EXISTS `llxas_payment_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_payment_salary` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_payment_salary_ref` (`num_payment`),
  KEY `idx_payment_salary_user` (`fk_user`,`entity`),
  KEY `idx_payment_salary_datep` (`datep`),
  KEY `idx_payment_salary_datesp` (`datesp`),
  KEY `idx_payment_salary_dateep` (`dateep`),
  CONSTRAINT `fk_payment_salary_user` FOREIGN KEY (`fk_user`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_payment_salary`
--

LOCK TABLES `llxas_payment_salary` WRITE;
/*!40000 ALTER TABLE `llxas_payment_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_payment_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_payment_various`
--

DROP TABLE IF EXISTS `llxas_payment_various`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_payment_various` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `sens` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subledger_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_payment_various`
--

LOCK TABLES `llxas_payment_various` WRITE;
/*!40000 ALTER TABLE `llxas_payment_various` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_payment_various` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_payment_vat`
--

DROP TABLE IF EXISTS `llxas_payment_vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_payment_vat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_tva` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_payment_vat`
--

LOCK TABLES `llxas_payment_vat` WRITE;
/*!40000 ALTER TABLE `llxas_payment_vat` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_payment_vat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_pos_cash_fence`
--

DROP TABLE IF EXISTS `llxas_pos_cash_fence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_pos_cash_fence` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening` double(24,8) DEFAULT 0.00000000,
  `cash` double(24,8) DEFAULT 0.00000000,
  `card` double(24,8) DEFAULT 0.00000000,
  `cheque` double(24,8) DEFAULT 0.00000000,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `day_close` int(11) DEFAULT NULL,
  `month_close` int(11) DEFAULT NULL,
  `year_close` int(11) DEFAULT NULL,
  `posmodule` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posnumber` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_pos_cash_fence`
--

LOCK TABLES `llxas_pos_cash_fence` WRITE;
/*!40000 ALTER TABLE `llxas_pos_cash_fence` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_pos_cash_fence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_prelevement_bons`
--

DROP TABLE IF EXISTS `llxas_prelevement_bons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_prelevement_bons` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'debit-order',
  `ref` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `statut` smallint(6) DEFAULT 0,
  `credite` smallint(6) DEFAULT 0,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint(6) DEFAULT NULL,
  `fk_user_trans` int(11) DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_prelevement_bons`
--

LOCK TABLES `llxas_prelevement_bons` WRITE;
/*!40000 ALTER TABLE `llxas_prelevement_bons` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_prelevement_bons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_prelevement_facture`
--

DROP TABLE IF EXISTS `llxas_prelevement_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_prelevement_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  `fk_prelevement_lignes` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_facture_fk_prelevement_lignes` (`fk_prelevement_lignes`),
  CONSTRAINT `fk_prelevement_facture_fk_prelevement_lignes` FOREIGN KEY (`fk_prelevement_lignes`) REFERENCES `llxas_prelevement_lignes` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_prelevement_facture`
--

LOCK TABLES `llxas_prelevement_facture` WRITE;
/*!40000 ALTER TABLE `llxas_prelevement_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_prelevement_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_prelevement_facture_demande`
--

DROP TABLE IF EXISTS `llxas_prelevement_facture_demande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_prelevement_facture_demande` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  `sourcetype` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint(6) DEFAULT 0,
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_user_demande` int(11) NOT NULL,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_payment_site` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_facture_demande_fk_facture` (`fk_facture`),
  KEY `idx_prelevement_facture_demande_fk_facture_fourn` (`fk_facture_fourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_prelevement_facture_demande`
--

LOCK TABLES `llxas_prelevement_facture_demande` WRITE;
/*!40000 ALTER TABLE `llxas_prelevement_facture_demande` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_prelevement_facture_demande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_prelevement_lignes`
--

DROP TABLE IF EXISTS `llxas_prelevement_lignes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_prelevement_lignes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT 0,
  `client_nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`),
  CONSTRAINT `fk_prelevement_lignes_fk_prelevement_bons` FOREIGN KEY (`fk_prelevement_bons`) REFERENCES `llxas_prelevement_bons` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_prelevement_lignes`
--

LOCK TABLES `llxas_prelevement_lignes` WRITE;
/*!40000 ALTER TABLE `llxas_prelevement_lignes` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_prelevement_lignes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_prelevement_rejet`
--

DROP TABLE IF EXISTS `llxas_prelevement_rejet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_prelevement_rejet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prelevement_lignes` int(11) DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `afacturer` tinyint(4) DEFAULT 0,
  `fk_facture` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_prelevement_rejet`
--

LOCK TABLES `llxas_prelevement_rejet` WRITE;
/*!40000 ALTER TABLE `llxas_prelevement_rejet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_prelevement_rejet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_printing`
--

DROP TABLE IF EXISTS `llxas_printing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_printing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `printer_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `printer_location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `printer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copy` int(11) NOT NULL DEFAULT 1,
  `module` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_printing`
--

LOCK TABLES `llxas_printing` WRITE;
/*!40000 ALTER TABLE `llxas_printing` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_printing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product`
--

DROP TABLE IF EXISTS `llxas_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_parent` int(11) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customcode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `fk_state` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `cost_price` double(24,8) DEFAULT NULL,
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `tobuy` tinyint(4) DEFAULT 1,
  `onportal` tinyint(4) DEFAULT 0,
  `tobatch` tinyint(4) NOT NULL DEFAULT 0,
  `fk_product_type` int(11) DEFAULT 0,
  `duration` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seuil_stock_alerte` float DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partnumber` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_measure` float DEFAULT NULL,
  `net_measure_units` tinyint(4) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint(4) DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint(4) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `width_units` tinyint(4) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `height_units` tinyint(4) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint(4) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint(4) DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fifo` double(24,8) DEFAULT NULL,
  `lifo` double(24,8) DEFAULT NULL,
  `fk_default_warehouse` int(11) DEFAULT NULL,
  `canvas` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finished` tinyint(4) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_price_expression` int(11) DEFAULT NULL,
  `desiredstock` float DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `price_autogen` tinyint(4) DEFAULT 0,
  `fk_project` int(11) DEFAULT NULL,
  `batch_mask` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `qc_frequency` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_label` (`label`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_import_key` (`import_key`),
  KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  KEY `idx_product_fk_country` (`fk_country`),
  KEY `idx_product_fk_user_author` (`fk_user_author`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  KEY `idx_product_fk_project` (`fk_project`),
  KEY `fk_product_fk_unit` (`fk_unit`),
  KEY `fk_product_finished` (`finished`),
  KEY `fk_product_default_warehouse` (`fk_default_warehouse`),
  CONSTRAINT `fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llxas_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_default_warehouse` FOREIGN KEY (`fk_default_warehouse`) REFERENCES `llxas_entrepot` (`rowid`),
  CONSTRAINT `fk_product_finished` FOREIGN KEY (`finished`) REFERENCES `llxas_c_product_nature` (`code`),
  CONSTRAINT `fk_product_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llxas_c_country` (`rowid`),
  CONSTRAINT `fk_product_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product`
--

LOCK TABLES `llxas_product` WRITE;
/*!40000 ALTER TABLE `llxas_product` DISABLE KEYS */;
INSERT INTO `llxas_product` (`rowid`, `ref`, `entity`, `ref_ext`, `datec`, `tms`, `fk_parent`, `label`, `description`, `note_public`, `note`, `customcode`, `fk_country`, `fk_state`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_base_type`, `cost_price`, `default_vat_code`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `fk_user_author`, `fk_user_modif`, `tosell`, `tobuy`, `onportal`, `tobatch`, `fk_product_type`, `duration`, `seuil_stock_alerte`, `url`, `barcode`, `fk_barcode_type`, `accountancy_code_sell`, `accountancy_code_sell_intra`, `accountancy_code_sell_export`, `accountancy_code_buy`, `accountancy_code_buy_intra`, `accountancy_code_buy_export`, `partnumber`, `net_measure`, `net_measure_units`, `weight`, `weight_units`, `length`, `length_units`, `width`, `width_units`, `height`, `height_units`, `surface`, `surface_units`, `volume`, `volume_units`, `stock`, `pmp`, `fifo`, `lifo`, `fk_default_warehouse`, `canvas`, `finished`, `hidden`, `import_key`, `model_pdf`, `fk_price_expression`, `desiredstock`, `fk_unit`, `price_autogen`, `fk_project`, `batch_mask`, `lifetime`, `qc_frequency`) VALUES (1,'DP610',1,NULL,NULL,'2023-01-17 21:01:33',0,'Silver Liberty 20oz',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(2,'LE604 ',1,NULL,NULL,'2023-01-17 21:02:37',0,'Black Liberty 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(3,'LE701 ',1,NULL,NULL,'2023-01-17 21:02:37',0,'White Napa 12oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.10000000,0.00000000,0.00000000,0.00000000,'HT',3.10000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(4,'606B',1,NULL,NULL,'2022-11-09 21:43:28',0,' Black Liberty 20oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(5,'609B ',1,NULL,NULL,'2022-11-09 21:43:28',0,'White Liberty 20oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(6,'612B ',1,NULL,NULL,'2022-11-09 21:43:28',0,'Silver Liberty 20oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(7,'615B ',1,NULL,NULL,'2022-11-09 21:43:28',0,'Royal Blue Liberty 20oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(8,'618B ',1,NULL,NULL,'2022-11-09 21:43:29',0,'Red Liberty 20oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(9,'703B ',1,NULL,NULL,'2022-11-09 21:43:29',0,'White Napa 12oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,8.10000000,0.00000000,0.00000000,0.00000000,'HT',3.10000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(10,'706B',1,NULL,NULL,'2022-11-09 21:43:29',0,'Silver Napa 12oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,8.10000000,0.00000000,0.00000000,0.00000000,'HT',3.10000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(11,'903B ',1,NULL,NULL,'2022-11-09 21:43:29',0,'Black Tundra 26oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,13.00000000,0.00000000,0.00000000,0.00000000,'HT',8.00000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(12,'906B ',1,NULL,NULL,'2022-11-09 21:43:29',0,'White Tundra 26oz - Blank',NULL,NULL,NULL,NULL,NULL,NULL,13.00000000,0.00000000,0.00000000,0.00000000,'HT',8.00000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(13,'B02SS ',1,NULL,NULL,'2022-11-09 21:43:30',0,'Atlanta Braves - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(14,'B04SS ',1,NULL,NULL,'2022-11-09 21:43:30',0,'Boston Red Sox - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(15,'B05SS ',1,NULL,NULL,'2022-11-09 21:43:30',0,'Chicago Cubs - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(16,' B11SS ',1,NULL,NULL,'2022-11-09 21:43:30',0,'Houston Astros - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,9.50000000,0.00000000,0.00000000,'HT',4.50000000,NULL,0.000,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(17,'B13SS ',1,NULL,NULL,'2022-11-09 21:43:30',0,'LA Angels of Anaheim - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(18,'B14SS ',1,NULL,NULL,'2022-11-09 21:43:31',0,'LA Dodgers - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(19,'B18SS ',1,NULL,NULL,'2022-11-09 21:43:31',0,'New York Mets - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(20,'B19SS ',1,NULL,NULL,'2022-11-09 21:43:31',0,'New York Yankees - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(21,'B23SS ',1,NULL,NULL,'2022-11-09 21:43:31',0,'St.Louis Cardinals - 20oz Sideline',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(22,'B24SS',1,NULL,NULL,'2023-01-30 23:46:29',0,' San Diego Padres - 20oz Sideline Series ',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,9.50000000,0.00000000,0.00000000,'HT',4.50000000,NULL,0.000,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(23,'B28SS ',1,NULL,NULL,'2022-11-09 21:43:32',0,'Texas Rangers - 20oz Sideline Series ',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(24,'B29SS ',1,NULL,NULL,'2022-11-09 21:43:32',0,'Toronto Blue Jays - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(25,'C04SS ',1,NULL,NULL,'2022-11-09 21:43:32',0,'Arizona State - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(26,'C05SS ',1,NULL,NULL,'2022-11-09 21:43:32',0,'Arkansas - 20oz Sideline Series ',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(27,'C14SS ',1,NULL,NULL,'2022-11-09 21:43:32',0,'Colorado - 20oz Sideline Series ',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(28,'C16SS ',1,NULL,NULL,'2022-11-09 21:43:33',0,'Florida State - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(29,'C23SS ',1,NULL,NULL,'2022-11-09 21:48:37',0,'Iowa State - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,9.50000000,0.00000000,0.00000000,'HT',4.50000000,NULL,0.000,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(30,'C27SS ',1,NULL,NULL,'2022-11-09 21:43:33',0,'Louisiana - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(31,'C32SS ',1,NULL,NULL,'2022-11-09 21:43:33',0,'Miami - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(32,'C41SS ',1,NULL,NULL,'2022-11-09 21:43:33',0,'New Mexico State - 20oz Sideline\nSeries',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(33,'C44SS ',1,NULL,NULL,'2022-11-09 21:43:34',0,'Ohio State - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(34,'C56SS ',1,NULL,NULL,'2022-11-09 21:43:34',0,'Texas - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(35,'C57SS',1,NULL,NULL,'2022-11-09 21:43:34',0,' Texas A&M - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(36,'C58SS ',1,NULL,NULL,'2022-11-09 21:43:34',0,'Texas Tech - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(37,'GL105 ',1,NULL,NULL,'2023-01-17 21:02:37',0,'Adventures - White 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(38,'GL106 ',1,NULL,NULL,'2023-01-17 21:02:37',0,'Life is Better - Royal Blue 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(39,'GL107 ',1,NULL,NULL,'2023-01-17 21:02:37',0,'USA Flag - Red 20oz',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(40,'GL108',1,NULL,NULL,'2023-01-17 21:02:38',0,'Eat Sleep Hunt - Black 20oz',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(41,'GL109 ',1,NULL,NULL,'2023-01-17 21:02:38',0,'But First, Coffee - White 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(42,'GL110 ',1,NULL,NULL,'2023-01-17 21:02:38',0,'Fishing Life - Black 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(43,'GL203 ',1,NULL,NULL,'2023-01-17 21:02:38',0,'Good Vibes - White 12oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(44,'GL204',1,NULL,NULL,'2023-01-17 21:02:38',0,'Compass - White 12oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(45,'GP506 ',1,NULL,NULL,'2023-01-17 21:01:33',0,'Sun and Moon - Silver 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(46,'GP507 ',1,NULL,NULL,'2023-01-17 21:01:33',0,'Golf - Silver 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(47,'GP508 ',1,NULL,NULL,'2023-01-17 21:01:33',0,'Live, Laugh, Love - Silver 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(48,'GP509 ',1,NULL,NULL,'2023-01-17 21:01:34',0,'Go Pink - Silver 20oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(49,'GP608 ',1,NULL,NULL,'2023-01-17 21:01:34',0,'Flamingo\'s - Silver 12oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(50,'GP609 ',1,NULL,NULL,'2023-01-17 21:01:34',0,'Floral - Silver 12oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(51,'GP610 ',1,NULL,NULL,'2023-01-17 21:01:34',0,'Paw Prints - Silver 12oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(52,'GP611 ',1,NULL,NULL,'2023-01-17 21:01:34',0,'Give Thanks - Silver 12oz ',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(53,'H08SS ',1,NULL,NULL,'2022-11-09 21:43:36',0,'Colorado Avalanche - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(54,'H10SS ',1,NULL,NULL,'2022-11-09 21:43:36',0,'Dallas Stars - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(55,'H14SS ',1,NULL,NULL,'2022-11-09 21:43:37',0,'LA Kings - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(56,'H16SS ',1,NULL,NULL,'2022-11-09 21:43:37',0,'Minnesota Wild - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(57,'H25SS ',1,NULL,NULL,'2022-11-09 21:43:37',0,'San Jose Sharks - 20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,9.50000000,0.00000000,0.00000000,0.00000000,'HT',4.50000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(58,'SHS04 ',1,NULL,NULL,'2022-11-09 21:43:37',0,'Arkansas Home - Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(59,'SHS10 ',1,NULL,NULL,'2022-11-09 21:43:38',0,'Georgia Home - Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(60,'SHS15 ',1,NULL,NULL,'2022-11-09 21:43:38',0,'Iowa Home - Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(61,'SHS18 ',1,NULL,NULL,'2022-11-09 21:43:38',0,'Louisiana Home - Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(62,'SHS43 ',1,NULL,NULL,'2022-11-09 21:43:38',0,'Texas Home - Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,8.75000000,0.00000000,0.00000000,0.00000000,'HT',3.75000000,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(63,'DI001',1,NULL,NULL,'2023-01-17 21:19:18',0,'Donation Item',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(64,'LE501',1,NULL,NULL,'2023-01-17 21:19:18',0,'Black Taylor 20oz  -  Custom Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(65,'LE502',1,NULL,NULL,'2023-01-17 21:19:18',0,'Black Taylor 20oz  -  Custom 2 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(66,'503B',1,NULL,NULL,'2023-01-17 21:19:18',0,'Black Taylor 20oz  -  Blank',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(67,'LE605',1,NULL,NULL,'2023-01-17 21:19:18',0,'Black Liberty 20oz  -  Custom 2 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(68,'LE607',1,NULL,NULL,'2023-01-17 21:19:18',0,'White Liberty 20oz  -  Custom 1 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(69,'LE608',1,NULL,NULL,'2023-01-17 21:19:19',0,'White Liberty 20oz  -  Custom 2 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(70,'DP611',1,NULL,NULL,'2023-02-07 18:22:53',0,'Silver Liberty 20oz - Custom 2 Digital Print','TEST DESCR',NULL,NULL,'',NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,0.000,0,0.000,'0',0.000,'0',NULL,1,1,1,0,0,0,'',NULL,NULL,NULL,NULL,'','','','','','',NULL,NULL,NULL,NULL,3,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,'',NULL,NULL),(71,'LE613',1,NULL,NULL,'2023-01-17 21:19:19',0,'Royal Blue Liberty 20oz  -  Custom 1 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(72,'LE614',1,NULL,NULL,'2023-01-17 21:19:19',0,'Royal Blue Liberty 20oz  -  Custom 2 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(73,'LE616',1,NULL,NULL,'2023-01-17 21:19:19',0,'Red Liberty 20oz  -  Custom 1 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(74,'LE617',1,NULL,NULL,'2023-01-17 21:19:19',0,'Red Liberty 20oz  -  Custom 2 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(75,'LE702',1,NULL,NULL,'2023-01-17 21:19:20',0,'White Napa 12oz  -  Custom 2 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(76,'DP704',1,NULL,NULL,'2023-01-17 21:19:20',0,'Silver Napa 12oz  -  Custom 1 Digital Print',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(77,'DP705',1,NULL,NULL,'2023-01-17 21:19:20',0,'Silver Napa 12oz  -  Custom 2 Digital Print',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(78,'LE901',1,NULL,NULL,'2023-01-17 21:19:20',0,'Black Tundra 26oz  -  Custom 1 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(79,'LE902',1,NULL,NULL,'2023-01-17 21:19:20',0,'Black Tundra 26oz  -  Custom 2 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(80,'LE904',1,NULL,NULL,'2023-01-17 21:19:20',0,'White Tundra 26oz  -  Custom 1 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(81,'LE905',1,NULL,NULL,'2023-01-17 21:19:21',0,'White Tundra 26oz  -  Custom 2 Laser Etched',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(82,'SHS01',1,NULL,NULL,'2023-01-17 21:19:21',0,'Alabama Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(83,'SHS02',1,NULL,NULL,'2023-01-17 21:19:21',0,'Alaska Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(84,'SHS03',1,NULL,NULL,'2023-01-17 21:19:21',0,'Arizona Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(85,'SHS05',1,NULL,NULL,'2023-01-17 21:19:21',0,'California Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(86,'SHS06',1,NULL,NULL,'2023-01-17 21:19:21',0,'Colorado Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(87,'SHS07',1,NULL,NULL,'2023-01-17 21:19:22',0,'Connecticut Home   -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(88,'SHS08',1,NULL,NULL,'2023-01-17 21:19:22',0,'Delaware Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(89,'SHS09',1,NULL,NULL,'2023-01-17 21:19:22',0,'Florida Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(90,'SHS11',1,NULL,NULL,'2023-01-17 21:19:22',0,'Hawaii Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(91,'SHS12',1,NULL,NULL,'2023-01-17 21:19:22',0,'Idaho Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(92,'SHS13',1,NULL,NULL,'2023-01-17 21:19:22',0,'Illinois Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(93,'SHS14',1,NULL,NULL,'2023-01-17 21:19:22',0,'Indiana Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(94,'SHS16',1,NULL,NULL,'2023-01-17 21:19:23',0,'Kansas Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(95,'SHS17',1,NULL,NULL,'2023-01-17 21:19:23',0,'Kentucky Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(96,'SHS19',1,NULL,NULL,'2023-01-17 21:19:23',0,'Maine Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(97,'SHS20',1,NULL,NULL,'2023-01-17 21:19:23',0,'Maryland Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(98,'SHS21',1,NULL,NULL,'2023-01-17 21:19:23',0,'Massachusettes Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(99,'SHS22',1,NULL,NULL,'2023-01-17 21:19:23',0,'Michigan Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(100,'SHS23',1,NULL,NULL,'2023-01-17 21:19:24',0,'Minnesota Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(101,'SHS24',1,NULL,NULL,'2023-01-17 21:19:24',0,'Mississippi Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(102,'SHS25',1,NULL,NULL,'2023-01-17 21:19:24',0,'Missouri Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(103,'SHS26',1,NULL,NULL,'2023-01-17 21:19:24',0,'Montana Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(104,'SHS27',1,NULL,NULL,'2023-01-17 21:19:24',0,'Nebraska Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(105,'SHS28',1,NULL,NULL,'2023-01-17 21:19:24',0,'Nevada Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(106,'SHS29',1,NULL,NULL,'2023-01-17 21:19:25',0,'New Hampshire Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(107,'SHS30',1,NULL,NULL,'2023-01-17 21:19:25',0,'New Jersey Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(108,'SHS31',1,NULL,NULL,'2023-01-17 21:19:25',0,'New Mexico Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(109,'SHS32',1,NULL,NULL,'2023-01-17 21:19:25',0,'New York Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(110,'SHS33',1,NULL,NULL,'2023-01-17 21:19:25',0,'North Carolina Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(111,'SHS34',1,NULL,NULL,'2023-01-17 21:19:25',0,'North Dakota Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(112,'SHS35',1,NULL,NULL,'2023-01-17 21:19:25',0,'Ohio Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(113,'SHS36',1,NULL,NULL,'2023-01-17 21:19:26',0,'Oklahoma Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(114,'SHS37',1,NULL,NULL,'2023-01-17 21:19:26',0,'Oregon Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(115,'SHS38',1,NULL,NULL,'2023-01-17 21:19:26',0,'Pennsylvania Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(116,'SHS39',1,NULL,NULL,'2023-01-17 21:19:26',0,'Rhode Island Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(117,'SHS40',1,NULL,NULL,'2023-01-17 21:19:26',0,'South Carolina Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(118,'SHS41',1,NULL,NULL,'2023-01-17 21:19:26',0,'South Dakota Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(119,'SHS42',1,NULL,NULL,'2023-01-17 21:19:27',0,'Tennessee Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(120,'SHS44',1,NULL,NULL,'2023-01-17 21:19:27',0,'Utah Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(121,'SHS45',1,NULL,NULL,'2023-01-17 21:19:27',0,'Vermont Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(122,'SHS46',1,NULL,NULL,'2023-01-17 21:19:27',0,'Virginia Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(123,'SHS47',1,NULL,NULL,'2023-01-17 21:19:27',0,'Washington Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(124,'SHS48',1,NULL,NULL,'2023-01-17 21:19:27',0,'West Virginia Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(125,'SHS49',1,NULL,NULL,'2023-01-17 21:19:28',0,'Wisconsin Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(126,'SHS50',1,NULL,NULL,'2023-01-17 21:19:28',0,'Wyoming Home  -  Silver 20oz',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(127,'GP612',1,NULL,NULL,'2023-01-17 21:19:28',0,'Be Kind  -  Pewter 12oz Digital Print',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(128,'GP613',1,NULL,NULL,'2023-01-17 21:19:28',0,'You Never Know  -  Cranberry 12oz Digital Print',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(129,'GP614',1,NULL,NULL,'2023-01-17 21:19:28',0,'Life\'s Better  -  Blue 12oz Digital Print',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(130,'GP615',1,NULL,NULL,'2023-01-17 21:19:28',0,'Rude & Sarcastic  -  Rose Gold 12oz Digital Print',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(131,'GP616',1,NULL,NULL,'2023-01-17 21:19:28',0,'I\'ll Do It Tomorrow  -  Green 12oz Digital Print',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(132,'GP617',1,NULL,NULL,'2023-01-17 21:19:29',0,'Keep Calm Rock On  -  White 12oz Digital Print',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(133,'B01SS',1,NULL,NULL,'2023-01-17 21:19:29',0,'Arizona Diamondbacks  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(134,'B03SS',1,NULL,NULL,'2023-01-17 21:19:29',0,'Baltimore Orioles  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(135,'B06SS',1,NULL,NULL,'2023-01-17 21:19:29',0,'Chicago White Sox  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(136,'B07SS',1,NULL,NULL,'2023-01-17 21:19:29',0,'Cincinnati Reds  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(137,'B08SS',1,NULL,NULL,'2023-01-17 21:19:29',0,'Cleveland Indians  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(138,'B09SS',1,NULL,NULL,'2023-01-17 21:19:30',0,'Colorado Rockies  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(139,'B10SS',1,NULL,NULL,'2023-01-17 21:19:30',0,'Detroit Tigers  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(140,'B11SS',1,NULL,NULL,'2023-01-17 21:19:30',0,'Houston Astros  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(141,'B12SS',1,NULL,NULL,'2023-01-17 21:19:30',0,'Kansas City Royals  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(142,'B15SS',1,NULL,NULL,'2023-01-17 21:19:30',0,'Miami Marlins  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(143,'B16SS',1,NULL,NULL,'2023-01-17 21:19:30',0,'Milwaukee Brewers  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(144,'B17SS',1,NULL,NULL,'2023-01-17 21:19:30',0,'Minnesota Twins  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(145,'B20SS',1,NULL,NULL,'2023-01-17 21:19:31',0,'Oakland Athletics  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(146,'B21SS',1,NULL,NULL,'2023-01-17 21:19:31',0,'Philadelphia Phillies  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(147,'B22SS',1,NULL,NULL,'2023-01-17 21:19:31',0,'Pittsburgh Pirates  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(148,'B25SS',1,NULL,NULL,'2023-01-17 21:19:31',0,'San Francisco Giants  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(149,'B26SS',1,NULL,NULL,'2023-01-17 21:19:31',0,'Seattle Mariners  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(150,'B27SS',1,NULL,NULL,'2023-01-17 21:19:31',0,'Tampa Bay Rays  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(151,'B30SS',1,NULL,NULL,'2023-01-17 21:19:31',0,'Washington Nationals  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(152,'C01SS',1,NULL,NULL,'2023-01-17 21:19:32',0,'Alabama  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(153,'C02SS',1,NULL,NULL,'2023-01-17 21:19:32',0,'Appalachian State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(154,'C03SS',1,NULL,NULL,'2023-01-17 21:19:32',0,'Arizona  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(155,'C06SS',1,NULL,NULL,'2023-01-17 21:19:32',0,'Arkansas State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(156,'C07SS',1,NULL,NULL,'2023-01-17 21:19:32',0,'Auburn  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(157,'C08SS',1,NULL,NULL,'2023-01-17 21:19:32',0,'Baylor  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(158,'C09SS',1,NULL,NULL,'2023-01-17 21:19:33',0,'Boise State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(159,'C10SS',1,NULL,NULL,'2023-01-17 21:19:33',0,'Butler  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(160,'C11SS',1,NULL,NULL,'2023-01-17 21:19:33',0,'BYU  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(161,'C12SS',1,NULL,NULL,'2023-01-17 21:19:33',0,'Central Florida  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(162,'C13SS',1,NULL,NULL,'2023-01-17 21:19:33',0,'Clemson  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(163,'C15SS',1,NULL,NULL,'2023-01-17 21:19:33',0,'Florida  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(164,'C17SS',1,NULL,NULL,'2023-01-17 21:19:34',0,'Georgia  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(165,'C18SS',1,NULL,NULL,'2023-01-17 21:19:34',0,'Georgia Southern  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(166,'C19SS',1,NULL,NULL,'2023-01-17 21:19:34',0,'Georgia Tech  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(167,'C20SS',1,NULL,NULL,'2023-01-17 21:19:34',0,'Illinois  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(168,'C21SS',1,NULL,NULL,'2023-01-17 21:19:34',0,'Indiana  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(169,'C22SS',1,NULL,NULL,'2023-01-17 21:19:34',0,'Iowa  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(170,'C24SS',1,NULL,NULL,'2023-01-17 21:19:34',0,'Kansas  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(171,'C25SS',1,NULL,NULL,'2023-01-17 21:19:35',0,'Kansas State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(172,'C26SS',1,NULL,NULL,'2023-01-17 21:19:35',0,'Kentucky  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(173,'C28SS',1,NULL,NULL,'2023-01-17 21:19:35',0,'Louisville  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(174,'C29SS',1,NULL,NULL,'2023-01-17 21:19:35',0,'LSU  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(175,'C30SS',1,NULL,NULL,'2023-01-17 21:19:35',0,'Maryland  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(176,'C31SS',1,NULL,NULL,'2023-01-17 21:19:35',0,'Memphis  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(177,'C33SS',1,NULL,NULL,'2023-01-17 21:19:36',0,'Michigan  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(178,'C34SS',1,NULL,NULL,'2023-01-17 21:19:36',0,'Michigan State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(179,'C35SS',1,NULL,NULL,'2023-01-17 21:19:36',0,'Minnesota  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(180,'C36SS',1,NULL,NULL,'2023-01-17 21:19:36',0,'Mississippi State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(181,'C37SS',1,NULL,NULL,'2023-01-17 21:19:36',0,'Missouri  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(182,'C38SS',1,NULL,NULL,'2023-01-17 21:19:36',0,'NC State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(183,'C39SS',1,NULL,NULL,'2023-01-17 21:19:37',0,'Nebraska  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(184,'C40SS',1,NULL,NULL,'2023-01-17 21:19:37',0,'New Mexico  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(185,'C42SS',1,NULL,NULL,'2023-01-17 21:19:37',0,'North Carolina  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(186,'C43SS',1,NULL,NULL,'2023-01-17 21:19:37',0,'North Dakota State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(187,'C45SS',1,NULL,NULL,'2023-01-17 21:19:37',0,'Oklahoma  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(188,'C46SS',1,NULL,NULL,'2023-01-17 21:19:37',0,'Ole Miss  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(189,'C47SS',1,NULL,NULL,'2023-01-17 21:19:38',0,'Oregon  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(190,'C48SS',1,NULL,NULL,'2023-01-17 21:19:38',0,'Oregon State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(191,'C49SS',1,NULL,NULL,'2023-01-17 21:19:38',0,'Penn State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(192,'C50SS',1,NULL,NULL,'2023-01-17 21:19:38',0,'Pittsburgh  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(193,'C51SS',1,NULL,NULL,'2023-01-17 21:19:38',0,'Purdue  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(194,'C52SS',1,NULL,NULL,'2023-01-17 21:19:38',0,'South Carolina  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(195,'C53SS',1,NULL,NULL,'2023-01-17 21:19:38',0,'South Florida  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(196,'C54SS',1,NULL,NULL,'2023-01-17 21:19:39',0,'Southern Miss  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(197,'C55SS',1,NULL,NULL,'2023-01-17 21:19:39',0,'Tennessee  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(198,'C59SS',1,NULL,NULL,'2023-01-17 21:19:39',0,'Utah  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(199,'C60SS',1,NULL,NULL,'2023-01-17 21:19:39',0,'Virginia  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(200,'C61SS',1,NULL,NULL,'2023-01-17 21:19:39',0,'Virginia Tech  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(201,'C62SS',1,NULL,NULL,'2023-01-17 21:19:39',0,'Washington  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(202,'C63SS',1,NULL,NULL,'2023-01-17 21:19:40',0,'Washington State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(203,'C64SS',1,NULL,NULL,'2023-01-17 21:19:40',0,'West Virginia  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(204,'C65SS',1,NULL,NULL,'2023-01-17 21:19:40',0,'Western Kentucky  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(205,'C66SS',1,NULL,NULL,'2023-01-17 21:19:40',0,'Wisconsin  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(206,'C67SS',1,NULL,NULL,'2023-01-17 21:19:40',0,'Louisiana Tech -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(207,'C68SS',1,NULL,NULL,'2023-01-17 21:19:40',0,'McNeese State  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(208,'H01SS',1,NULL,NULL,'2023-01-17 21:19:41',0,'Anaheim Ducks  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(209,'H02SS',1,NULL,NULL,'2023-01-17 21:19:41',0,'Arizona Coyotes  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(210,'H03SS',1,NULL,NULL,'2023-01-17 21:19:41',0,'Boston Bruins  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(211,'H04SS',1,NULL,NULL,'2023-01-17 21:19:41',0,'Buffalo Sabres  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(212,'H05SS',1,NULL,NULL,'2023-01-17 21:19:41',0,'Calgary Flames  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(213,'H06SS',1,NULL,NULL,'2023-01-17 21:19:41',0,'Carolina Hurricanes  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(214,'H07SS',1,NULL,NULL,'2023-01-17 21:19:41',0,'Chicago Blackhawks  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(215,'H09SS',1,NULL,NULL,'2023-01-17 21:19:42',0,'Columbus Blue Jackets  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(216,'H11SS',1,NULL,NULL,'2023-01-17 21:19:42',0,'Detroit Red Wings  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(217,'H12SS',1,NULL,NULL,'2023-01-17 21:19:42',0,'Edmonton Oilers  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(218,'H13SS',1,NULL,NULL,'2023-01-17 21:19:42',0,'Florida Panthers  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(219,'H15SS',1,NULL,NULL,'2023-01-17 21:19:42',0,'Las Vegas Knights  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(220,'H17SS',1,NULL,NULL,'2023-01-17 21:19:42',0,'Montreal Canadiens  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(221,'H18SS',1,NULL,NULL,'2023-01-17 21:19:43',0,'Nashville Predators  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(222,'H19SS',1,NULL,NULL,'2023-01-17 21:19:43',0,'New Jersey Devils  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(223,'H20SS',1,NULL,NULL,'2023-01-17 21:19:43',0,'New York Islanders  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(224,'H21SS',1,NULL,NULL,'2023-01-17 21:19:43',0,'New York Rangers  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(225,'H22SS',1,NULL,NULL,'2023-01-17 21:19:43',0,'Ottowa Senators  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(226,'H23SS',1,NULL,NULL,'2023-01-17 21:19:43',0,'Philadelphia Flyers  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(227,'H24SS',1,NULL,NULL,'2023-01-17 21:19:44',0,'Pittsburgh Penguins  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(228,'H26SS',1,NULL,NULL,'2023-01-17 21:19:44',0,'Seattle Kraken  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(229,'H27SS',1,NULL,NULL,'2023-01-17 21:19:44',0,'St Louis Blues  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(230,'H28SS',1,NULL,NULL,'2023-01-17 21:19:44',0,'Tampa Bay Lightning  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(231,'H29SS',1,NULL,NULL,'2023-01-17 21:19:44',0,'Toronto Maple Leafs  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(232,'H30SS',1,NULL,NULL,'2023-01-17 21:19:44',0,'Vancouver Canucks  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(233,'H31SS',1,NULL,NULL,'2023-01-17 21:19:44',0,'Washington Capitals  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL),(234,'H32SS',1,NULL,NULL,'2023-01-17 21:19:45',0,'Winnepeg Jets  -  20oz Sideline Series',NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,'HT',NULL,NULL,NULL,0,0.000,'0',0.000,'0',NULL,NULL,1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00000000,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `llxas_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_association`
--

DROP TABLE IF EXISTS `llxas_product_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_association` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_pere` int(11) NOT NULL DEFAULT 0,
  `fk_product_fils` int(11) NOT NULL DEFAULT 0,
  `qty` double DEFAULT NULL,
  `incdec` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_association` (`fk_product_pere`,`fk_product_fils`),
  KEY `idx_product_association_fils` (`fk_product_fils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_association`
--

LOCK TABLES `llxas_product_association` WRITE;
/*!40000 ALTER TABLE `llxas_product_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_attribute`
--

DROP TABLE IF EXISTS `llxas_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_attribute` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rang` int(11) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_ref` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_attribute`
--

LOCK TABLES `llxas_product_attribute` WRITE;
/*!40000 ALTER TABLE `llxas_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_attribute_combination`
--

DROP TABLE IF EXISTS `llxas_product_attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_attribute_combination` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_parent` int(11) NOT NULL,
  `fk_product_child` int(11) NOT NULL,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  `variation_weight` double NOT NULL,
  `variation_ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_att_com_product_parent` (`fk_product_parent`),
  KEY `idx_product_att_com_product_child` (`fk_product_child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_attribute_combination`
--

LOCK TABLES `llxas_product_attribute_combination` WRITE;
/*!40000 ALTER TABLE `llxas_product_attribute_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_attribute_combination2val`
--

DROP TABLE IF EXISTS `llxas_product_attribute_combination2val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_attribute_combination2val` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prod_combination` int(11) NOT NULL,
  `fk_prod_attr` int(11) NOT NULL,
  `fk_prod_attr_val` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_attribute_combination2val`
--

LOCK TABLES `llxas_product_attribute_combination2val` WRITE;
/*!40000 ALTER TABLE `llxas_product_attribute_combination2val` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_attribute_combination2val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_attribute_combination_price_level`
--

DROP TABLE IF EXISTS `llxas_product_attribute_combination_price_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_attribute_combination_price_level` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_attribute_combination` int(11) NOT NULL DEFAULT 1,
  `fk_price_level` int(11) NOT NULL DEFAULT 1,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `fk_product_attribute_combination` (`fk_product_attribute_combination`,`fk_price_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_attribute_combination_price_level`
--

LOCK TABLES `llxas_product_attribute_combination_price_level` WRITE;
/*!40000 ALTER TABLE `llxas_product_attribute_combination_price_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_attribute_combination_price_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_attribute_value`
--

DROP TABLE IF EXISTS `llxas_product_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_attribute_value` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_attribute` int(11) NOT NULL,
  `ref` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_value` (`fk_product_attribute`,`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_attribute_value`
--

LOCK TABLES `llxas_product_attribute_value` WRITE;
/*!40000 ALTER TABLE `llxas_product_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_batch`
--

DROP TABLE IF EXISTS `llxas_product_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product_stock` int(11) NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_batch` (`fk_product_stock`,`batch`),
  KEY `idx_fk_product_stock` (`fk_product_stock`),
  KEY `idx_batch` (`batch`),
  CONSTRAINT `fk_product_batch_fk_product_stock` FOREIGN KEY (`fk_product_stock`) REFERENCES `llxas_product_stock` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_batch`
--

LOCK TABLES `llxas_product_batch` WRITE;
/*!40000 ALTER TABLE `llxas_product_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_customer_price`
--

DROP TABLE IF EXISTS `llxas_product_customer_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_customer_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_customer` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`),
  KEY `idx_product_customer_price_fk_user` (`fk_user`),
  KEY `idx_product_customer_price_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_product_customer_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llxas_product` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_customer_price`
--

LOCK TABLES `llxas_product_customer_price` WRITE;
/*!40000 ALTER TABLE `llxas_product_customer_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_customer_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_customer_price_log`
--

DROP TABLE IF EXISTS `llxas_product_customer_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_customer_price_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL DEFAULT 0,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_customer` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_customer_price_log`
--

LOCK TABLES `llxas_product_customer_price_log` WRITE;
/*!40000 ALTER TABLE `llxas_product_customer_price_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_customer_price_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_extrafields`
--

DROP TABLE IF EXISTS `llxas_product_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manuty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_extrafields` (`fk_object`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_extrafields`
--

LOCK TABLES `llxas_product_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_product_extrafields` DISABLE KEYS */;
INSERT INTO `llxas_product_extrafields` (`rowid`, `tms`, `fk_object`, `import_key`, `manuty`) VALUES (1,'2023-01-17 23:05:04',64,NULL,'1'),(2,'2023-01-17 23:05:04',65,NULL,'1'),(3,'2023-01-17 23:05:05',2,NULL,'1'),(4,'2023-01-17 23:05:05',67,NULL,'1'),(5,'2023-01-17 23:05:05',68,NULL,'1'),(6,'2023-01-17 23:05:05',69,NULL,'1'),(7,'2023-01-17 23:05:05',71,NULL,'1'),(8,'2023-01-17 23:05:06',72,NULL,'1'),(9,'2023-01-17 23:05:06',73,NULL,'1'),(10,'2023-01-17 23:05:06',74,NULL,'1'),(11,'2023-01-17 23:05:06',3,NULL,'1'),(12,'2023-01-17 23:05:06',75,NULL,'1'),(13,'2023-01-17 23:05:06',78,NULL,'1'),(14,'2023-01-17 23:05:06',79,NULL,'1'),(15,'2023-01-17 23:05:07',80,NULL,'1'),(16,'2023-01-17 23:05:07',81,NULL,'1'),(17,'2023-01-17 23:05:07',37,NULL,'1'),(18,'2023-01-17 23:05:07',38,NULL,'1'),(19,'2023-01-17 23:05:07',39,NULL,'1'),(20,'2023-01-17 23:05:07',40,NULL,'1'),(21,'2023-01-17 23:05:08',41,NULL,'1'),(22,'2023-01-17 23:05:08',42,NULL,'1'),(23,'2023-01-17 23:05:08',43,NULL,'1'),(24,'2023-01-17 23:05:08',44,NULL,'1'),(25,'2023-01-17 23:06:30',1,NULL,'2'),(27,'2023-01-17 23:06:30',76,NULL,'2'),(28,'2023-01-17 23:06:30',77,NULL,'2'),(29,'2023-01-17 23:06:31',45,NULL,'2'),(30,'2023-01-17 23:06:31',46,NULL,'2'),(31,'2023-01-17 23:06:31',47,NULL,'2'),(32,'2023-01-17 23:06:31',48,NULL,'2'),(33,'2023-01-17 23:06:31',49,NULL,'2'),(34,'2023-01-17 23:06:31',50,NULL,'2'),(35,'2023-01-17 23:06:32',51,NULL,'2'),(36,'2023-01-17 23:06:32',52,NULL,'2'),(37,'2023-01-17 23:06:32',127,NULL,'2'),(38,'2023-01-17 23:06:32',128,NULL,'2'),(39,'2023-01-17 23:06:32',129,NULL,'2'),(40,'2023-01-17 23:06:32',130,NULL,'2'),(41,'2023-01-17 23:06:33',131,NULL,'2'),(42,'2023-01-17 23:06:33',132,NULL,'2'),(43,'2023-02-07 18:22:53',70,NULL,'2');
/*!40000 ALTER TABLE `llxas_product_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_fournisseur_price`
--

DROP TABLE IF EXISTS `llxas_product_fournisseur_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_fournisseur_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `ref_fourn` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_fourn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `charges` double(24,8) DEFAULT 0.00000000,
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `tva_tx` double(6,3) NOT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `info_bits` int(11) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `fk_supplier_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time_days` int(11) DEFAULT NULL,
  `supplier_reputation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packaging` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  CONSTRAINT `fk_product_fournisseur_price_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llxas_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llxas_product` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_fournisseur_price`
--

LOCK TABLES `llxas_product_fournisseur_price` WRITE;
/*!40000 ALTER TABLE `llxas_product_fournisseur_price` DISABLE KEYS */;
INSERT INTO `llxas_product_fournisseur_price` (`rowid`, `entity`, `datec`, `tms`, `fk_product`, `fk_soc`, `ref_fourn`, `desc_fourn`, `fk_availability`, `price`, `quantity`, `remise_percent`, `remise`, `unitprice`, `charges`, `default_vat_code`, `barcode`, `fk_barcode_type`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `info_bits`, `fk_user`, `fk_supplier_price_expression`, `import_key`, `delivery_time_days`, `supplier_reputation`, `packaging`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_unitprice`, `multicurrency_price`) VALUES (1,1,NULL,'2022-11-09 22:31:17',1,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(2,1,NULL,'2022-11-09 22:31:17',2,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(3,1,NULL,'2022-11-09 22:31:17',3,2,NULL,NULL,NULL,3.10000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(4,1,NULL,'2022-11-09 22:31:18',4,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(5,1,NULL,'2022-11-09 22:31:18',5,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(6,1,NULL,'2022-11-09 22:31:18',6,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(7,1,NULL,'2022-11-09 22:31:18',7,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(8,1,NULL,'2022-11-09 22:31:18',8,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(9,1,NULL,'2022-11-09 22:31:19',9,2,NULL,NULL,NULL,3.10000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(10,1,NULL,'2022-11-09 22:31:19',10,2,NULL,NULL,NULL,3.10000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(11,1,NULL,'2022-11-09 22:31:19',11,2,NULL,NULL,NULL,8.00000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(12,1,NULL,'2022-11-09 22:31:19',12,2,NULL,NULL,NULL,8.00000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(13,1,NULL,'2022-11-09 22:31:19',13,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(14,1,NULL,'2022-11-09 22:31:20',14,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(15,1,NULL,'2022-11-09 22:31:20',15,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(16,1,NULL,'2022-11-09 22:31:20',16,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(17,1,NULL,'2022-11-09 22:31:20',17,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(18,1,NULL,'2022-11-09 22:31:21',18,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(19,1,NULL,'2022-11-09 22:31:21',19,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(20,1,NULL,'2022-11-09 22:31:21',20,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(21,1,NULL,'2022-11-09 22:31:21',21,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(22,1,NULL,'2022-11-09 22:31:21',22,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(23,1,NULL,'2022-11-09 22:31:22',23,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(24,1,NULL,'2022-11-09 22:31:22',24,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(25,1,NULL,'2022-11-09 22:31:22',25,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(26,1,NULL,'2022-11-09 22:31:22',26,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(27,1,NULL,'2022-11-09 22:31:22',27,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(28,1,NULL,'2022-11-09 22:31:23',28,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(29,1,NULL,'2022-11-09 22:31:23',29,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(30,1,NULL,'2022-11-09 22:31:23',30,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(31,1,NULL,'2022-11-09 22:31:23',31,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(32,1,NULL,'2022-11-09 22:31:23',32,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(33,1,NULL,'2022-11-09 22:31:24',33,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(34,1,NULL,'2022-11-09 22:31:24',34,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(35,1,NULL,'2022-11-09 22:31:24',35,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(36,1,NULL,'2022-11-09 22:31:24',36,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(37,1,NULL,'2022-11-09 22:31:24',37,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(38,1,NULL,'2022-11-09 22:31:24',38,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(39,1,NULL,'2022-11-09 22:31:25',39,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(40,1,NULL,'2022-11-09 22:31:25',40,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(41,1,NULL,'2022-11-09 22:31:25',41,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(42,1,NULL,'2022-11-09 22:31:25',42,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(43,1,NULL,'2022-11-09 22:31:25',43,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(44,1,NULL,'2022-11-09 22:31:26',44,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(45,1,NULL,'2022-11-09 22:31:26',45,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(46,1,NULL,'2022-11-09 22:31:26',46,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(47,1,NULL,'2022-11-09 22:31:26',47,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(48,1,NULL,'2022-11-09 22:31:27',48,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(49,1,NULL,'2022-11-09 22:31:27',49,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(50,1,NULL,'2022-11-09 22:31:27',50,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(51,1,NULL,'2022-11-09 22:31:27',51,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(52,1,NULL,'2022-11-09 22:31:27',52,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(53,1,NULL,'2022-11-09 22:31:28',53,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(54,1,NULL,'2022-11-09 22:31:28',54,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(55,1,NULL,'2022-11-09 22:31:28',55,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(56,1,NULL,'2022-11-09 22:31:28',56,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(57,1,NULL,'2022-11-09 22:31:28',57,2,NULL,NULL,NULL,4.50000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(58,1,NULL,'2022-11-09 22:31:29',58,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(59,1,NULL,'2022-11-09 22:31:29',59,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(60,1,NULL,'2022-11-09 22:31:29',60,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(61,1,NULL,'2022-11-09 22:31:29',61,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(62,1,NULL,'2022-11-09 22:31:29',62,2,NULL,NULL,NULL,3.75000000,1,0,0,0.00000000,0.00000000,NULL,NULL,NULL,0.000,0.000,'0',0.000,'0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL);
/*!40000 ALTER TABLE `llxas_product_fournisseur_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_fournisseur_price_extrafields`
--

DROP TABLE IF EXISTS `llxas_product_fournisseur_price_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_fournisseur_price_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_fournisseur_price_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_fournisseur_price_extrafields`
--

LOCK TABLES `llxas_product_fournisseur_price_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_product_fournisseur_price_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_fournisseur_price_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_fournisseur_price_log`
--

DROP TABLE IF EXISTS `llxas_product_fournisseur_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_fournisseur_price_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_fournisseur_price_log`
--

LOCK TABLES `llxas_product_fournisseur_price_log` WRITE;
/*!40000 ALTER TABLE `llxas_product_fournisseur_price_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_fournisseur_price_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_lang`
--

DROP TABLE IF EXISTS `llxas_product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`),
  CONSTRAINT `fk_product_lang_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llxas_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_lang`
--

LOCK TABLES `llxas_product_lang` WRITE;
/*!40000 ALTER TABLE `llxas_product_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_lot`
--

DROP TABLE IF EXISTS `llxas_product_lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_lot` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  `eol_date` datetime DEFAULT NULL,
  `manufacturing_date` datetime DEFAULT NULL,
  `scrapping_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lot` (`fk_product`,`batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_lot`
--

LOCK TABLES `llxas_product_lot` WRITE;
/*!40000 ALTER TABLE `llxas_product_lot` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_lot_extrafields`
--

DROP TABLE IF EXISTS `llxas_product_lot_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_lot_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_lot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_lot_extrafields`
--

LOCK TABLES `llxas_product_lot_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_product_lot_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_lot_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_perentity`
--

DROP TABLE IF EXISTS `llxas_product_perentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_perentity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pmp` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_perentity` (`fk_product`,`entity`),
  KEY `idx_product_perentity_fk_product` (`fk_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_perentity`
--

LOCK TABLES `llxas_product_perentity` WRITE;
/*!40000 ALTER TABLE `llxas_product_perentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_perentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_price`
--

DROP TABLE IF EXISTS `llxas_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `date_price` datetime NOT NULL,
  `price_level` smallint(6) DEFAULT 1,
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `default_vat_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_tx` double(6,3) NOT NULL DEFAULT 0.000,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `price_by_qty` int(11) NOT NULL DEFAULT 0,
  `fk_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_price_fk_user_author` (`fk_user_author`),
  KEY `idx_product_price_fk_product` (`fk_product`),
  CONSTRAINT `fk_product_price_product` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_product_price_user_author` FOREIGN KEY (`fk_product`) REFERENCES `llxas_product` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_price`
--

LOCK TABLES `llxas_product_price` WRITE;
/*!40000 ALTER TABLE `llxas_product_price` DISABLE KEYS */;
INSERT INTO `llxas_product_price` (`rowid`, `entity`, `tms`, `fk_product`, `date_price`, `price_level`, `price`, `price_ttc`, `price_min`, `price_min_ttc`, `price_base_type`, `default_vat_code`, `tva_tx`, `recuperableonly`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `fk_user_author`, `tosell`, `price_by_qty`, `fk_price_expression`, `import_key`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_price`, `multicurrency_price_ttc`) VALUES (1,1,'2022-11-09 21:39:31',16,'2022-11-09 16:39:31',1,9.50000000,9.50000000,0.00000000,0.00000000,'HT',NULL,0.000,0,0.000,'0',0.000,'0',1,1,0,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(2,1,'2022-11-09 21:48:37',29,'2022-11-09 16:48:37',1,9.50000000,9.50000000,0.00000000,0.00000000,'HT',NULL,0.000,0,0.000,'0',0.000,'0',1,1,0,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL),(3,1,'2023-01-30 23:46:29',22,'2023-01-30 18:46:29',1,9.50000000,9.50000000,0.00000000,0.00000000,'HT',NULL,0.000,0,0.000,'0',0.000,'0',1,1,0,NULL,NULL,NULL,NULL,1.00000000,NULL,NULL);
/*!40000 ALTER TABLE `llxas_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_price_by_qty`
--

DROP TABLE IF EXISTS `llxas_product_price_by_qty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_price_by_qty` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_price` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'HT',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`),
  CONSTRAINT `fk_product_price_by_qty_fk_product_price` FOREIGN KEY (`fk_product_price`) REFERENCES `llxas_product_price` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_price_by_qty`
--

LOCK TABLES `llxas_product_price_by_qty` WRITE;
/*!40000 ALTER TABLE `llxas_product_price_by_qty` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_price_by_qty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_pricerules`
--

DROP TABLE IF EXISTS `llxas_product_pricerules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_pricerules` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `fk_level` int(11) NOT NULL,
  `var_percent` double NOT NULL,
  `var_min_percent` double NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `unique_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_pricerules`
--

LOCK TABLES `llxas_product_pricerules` WRITE;
/*!40000 ALTER TABLE `llxas_product_pricerules` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_pricerules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_stock`
--

DROP TABLE IF EXISTS `llxas_product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_stock` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `reel` double DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  KEY `idx_product_stock_fk_product` (`fk_product`),
  KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_stock`
--

LOCK TABLES `llxas_product_stock` WRITE;
/*!40000 ALTER TABLE `llxas_product_stock` DISABLE KEYS */;
INSERT INTO `llxas_product_stock` (`rowid`, `tms`, `fk_product`, `fk_entrepot`, `reel`, `import_key`) VALUES (1,'2022-11-09 22:05:11',1,1,100,NULL),(2,'2022-11-09 22:05:11',2,1,100,NULL),(3,'2022-11-09 22:05:11',3,1,100,NULL),(4,'2022-11-09 22:05:11',4,1,100,NULL),(5,'2022-11-09 22:05:12',5,1,100,NULL),(6,'2022-11-09 22:05:12',6,1,100,NULL),(7,'2022-11-09 22:05:12',7,1,100,NULL),(8,'2022-11-09 22:05:12',8,1,100,NULL),(9,'2022-11-09 22:05:12',9,1,100,NULL),(10,'2022-11-09 22:05:13',10,1,100,NULL),(11,'2022-11-09 22:05:13',11,1,100,NULL),(12,'2022-11-09 22:05:13',12,1,100,NULL),(13,'2022-11-09 22:05:13',13,1,100,NULL),(14,'2022-11-09 22:05:13',14,1,100,NULL),(15,'2022-11-09 22:05:14',15,1,100,NULL),(16,'2022-11-09 22:05:14',16,1,100,NULL),(17,'2022-11-09 22:05:14',17,1,100,NULL),(18,'2022-11-09 22:05:14',18,1,100,NULL),(19,'2022-11-09 22:05:14',19,1,100,NULL),(20,'2022-11-09 22:05:15',20,1,100,NULL),(21,'2022-11-09 22:05:15',21,1,100,NULL),(22,'2022-11-09 22:05:15',22,1,100,NULL),(23,'2022-11-09 22:05:15',23,1,100,NULL),(24,'2022-11-09 22:05:15',24,1,100,NULL),(25,'2022-11-09 22:05:16',25,1,100,NULL),(26,'2022-11-09 22:05:16',26,1,100,NULL),(27,'2022-11-09 22:05:16',27,1,100,NULL),(28,'2022-11-09 22:05:16',28,1,100,NULL),(29,'2022-11-09 22:05:16',29,1,100,NULL),(30,'2022-11-09 22:05:17',30,1,100,NULL),(31,'2022-11-09 22:05:17',31,1,100,NULL),(32,'2022-11-09 22:05:17',32,1,100,NULL),(33,'2022-11-09 22:05:17',33,1,100,NULL),(34,'2022-11-09 22:05:17',34,1,100,NULL),(35,'2022-11-09 22:05:17',35,1,100,NULL),(36,'2022-11-09 22:05:18',36,1,100,NULL),(37,'2022-11-09 22:05:18',37,1,100,NULL),(38,'2022-11-09 22:05:18',38,1,100,NULL),(39,'2022-11-09 22:05:18',39,1,100,NULL),(40,'2022-11-09 22:05:18',40,1,100,NULL),(41,'2022-11-09 22:05:19',41,1,100,NULL),(42,'2022-11-09 22:05:19',42,1,100,NULL),(43,'2022-11-09 22:05:19',43,1,100,NULL),(44,'2022-11-09 22:05:19',44,1,100,NULL),(45,'2022-11-09 22:05:19',45,1,100,NULL),(46,'2022-11-09 22:05:20',46,1,100,NULL),(47,'2022-11-09 22:05:20',47,1,100,NULL),(48,'2022-11-09 22:05:20',48,1,100,NULL),(49,'2022-11-09 22:05:20',49,1,100,NULL),(50,'2022-11-09 22:05:20',50,1,100,NULL),(51,'2022-11-09 22:05:21',51,1,100,NULL),(52,'2022-11-09 22:05:21',52,1,100,NULL),(53,'2022-11-09 22:05:21',53,1,100,NULL),(54,'2022-11-09 22:05:21',54,1,100,NULL),(55,'2022-11-09 22:05:21',55,1,100,NULL),(56,'2022-11-09 22:05:22',56,1,100,NULL),(57,'2022-11-09 22:05:22',57,1,100,NULL),(58,'2022-11-09 22:05:22',58,1,100,NULL),(59,'2022-11-09 22:05:22',59,1,100,NULL),(60,'2022-11-09 22:05:22',60,1,100,NULL),(61,'2022-11-09 22:05:23',61,1,100,NULL),(62,'2022-11-09 22:05:23',62,1,100,NULL);
/*!40000 ALTER TABLE `llxas_product_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_product_warehouse_properties`
--

DROP TABLE IF EXISTS `llxas_product_warehouse_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_product_warehouse_properties` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `seuil_stock_alerte` float DEFAULT 0,
  `desiredstock` float DEFAULT 0,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_product_warehouse_properties`
--

LOCK TABLES `llxas_product_warehouse_properties` WRITE;
/*!40000 ALTER TABLE `llxas_product_warehouse_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_product_warehouse_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_projet`
--

DROP TABLE IF EXISTS `llxas_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_projet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `public` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 0,
  `fk_opp_status` int(11) DEFAULT NULL,
  `opp_percent` double(5,2) DEFAULT NULL,
  `fk_opp_status_end` int(11) DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `fk_user_close` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_msgid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opp_amount` double(24,8) DEFAULT NULL,
  `budget_amount` double(24,8) DEFAULT NULL,
  `usage_opportunity` int(11) DEFAULT 0,
  `usage_task` int(11) DEFAULT 1,
  `usage_bill_time` int(11) DEFAULT 0,
  `usage_organize_event` int(11) DEFAULT 0,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accept_conference_suggestions` int(11) DEFAULT 0,
  `accept_booth_suggestions` int(11) DEFAULT 0,
  `price_registration` double(24,8) DEFAULT NULL,
  `price_booth` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  KEY `idx_projet_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_projet_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_projet`
--

LOCK TABLES `llxas_projet` WRITE;
/*!40000 ALTER TABLE `llxas_projet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_projet_extrafields`
--

DROP TABLE IF EXISTS `llxas_projet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_projet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_projet_extrafields`
--

LOCK TABLES `llxas_projet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_projet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_projet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_projet_task`
--

DROP TABLE IF EXISTS `llxas_projet_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_projet_task` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_projet` int(11) NOT NULL,
  `fk_task_parent` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_effective` double DEFAULT 0,
  `planned_workload` double DEFAULT 0,
  `progress` int(11) DEFAULT 0,
  `priority` int(11) DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_task_ref` (`ref`,`entity`),
  KEY `idx_projet_task_fk_projet` (`fk_projet`),
  KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_projet_task_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llxas_projet` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_projet_task`
--

LOCK TABLES `llxas_projet_task` WRITE;
/*!40000 ALTER TABLE `llxas_projet_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_projet_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_projet_task_extrafields`
--

DROP TABLE IF EXISTS `llxas_projet_task_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_projet_task_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_task_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_projet_task_extrafields`
--

LOCK TABLES `llxas_projet_task_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_projet_task_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_projet_task_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_projet_task_time`
--

DROP TABLE IF EXISTS `llxas_projet_task_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_projet_task_time` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_task` int(11) NOT NULL,
  `task_date` date DEFAULT NULL,
  `task_datehour` datetime DEFAULT NULL,
  `task_date_withhour` int(11) DEFAULT 0,
  `task_duration` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_line_id` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_task_time_task` (`fk_task`),
  KEY `idx_projet_task_time_date` (`task_date`),
  KEY `idx_projet_task_time_datehour` (`task_datehour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_projet_task_time`
--

LOCK TABLES `llxas_projet_task_time` WRITE;
/*!40000 ALTER TABLE `llxas_projet_task_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_projet_task_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_propal`
--

DROP TABLE IF EXISTS `llxas_propal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_propal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_signature` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_signature` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  KEY `idx_propal_fk_soc` (`fk_soc`),
  KEY `idx_propal_fk_user_author` (`fk_user_author`),
  KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_propal_fk_projet` (`fk_projet`),
  KEY `idx_propal_fk_account` (`fk_account`),
  KEY `idx_propal_fk_currency` (`fk_currency`),
  KEY `idx_propal_fk_warehouse` (`fk_warehouse`),
  KEY `fk_propal_fk_user_signature` (`fk_user_signature`),
  CONSTRAINT `fk_propal_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llxas_projet` (`rowid`),
  CONSTRAINT `fk_propal_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_signature` FOREIGN KEY (`fk_user_signature`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_propal`
--

LOCK TABLES `llxas_propal` WRITE;
/*!40000 ALTER TABLE `llxas_propal` DISABLE KEYS */;
INSERT INTO `llxas_propal` (`rowid`, `ref`, `entity`, `ref_ext`, `ref_int`, `ref_client`, `fk_soc`, `fk_projet`, `tms`, `datec`, `datep`, `fin_validite`, `date_valid`, `date_signature`, `date_cloture`, `fk_user_author`, `fk_user_modif`, `fk_user_valid`, `fk_user_signature`, `fk_user_cloture`, `fk_statut`, `price`, `remise_percent`, `remise_absolue`, `remise`, `total_ht`, `total_tva`, `localtax1`, `localtax2`, `total_ttc`, `fk_account`, `fk_currency`, `fk_cond_reglement`, `fk_mode_reglement`, `note_private`, `note_public`, `model_pdf`, `last_main_doc`, `date_livraison`, `fk_shipping_method`, `fk_warehouse`, `fk_availability`, `fk_input_reason`, `fk_incoterms`, `location_incoterms`, `import_key`, `extraparams`, `fk_delivery_address`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_tx`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES (1,'PR110922-00001',1,NULL,NULL,'Galena Park',1,NULL,'2023-01-25 00:17:14','2022-11-09 13:40:00','2022-11-09','2022-11-24 12:00:00','2022-11-09 16:58:16','2022-11-09 16:58:28','2022-11-09 16:58:28',1,1,1,1,1,2,0,NULL,NULL,0,9823.83000000,435.33000000,0.00000000,0.00000000,10259.16000000,NULL,NULL,2,2,'','Please remit to: 205 Mercy Way, Liberty Hill, TX 78642\r\n','azur','propale/PR110922-00001/PR110922-00001.pdf',NULL,1,NULL,4,5,0,'',NULL,NULL,NULL,0,'USD',1.00000000,9823.83000000,435.33000000,10259.16000000),(2,'(PROV2)',1,NULL,NULL,'',1,NULL,'2022-11-09 22:08:34','2022-11-09 17:08:34','2022-11-09','2022-11-24 17:08:34',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,9823.83000000,435.33000000,0.00000000,0.00000000,10259.16000000,NULL,NULL,2,2,'','Please remit to: 205 Mercy Way, Liberty Hill, TX 78642\r\n','azur',NULL,NULL,1,NULL,4,5,0,'',NULL,NULL,NULL,0,'USD',1.00000000,9823.83000000,435.33000000,10259.16000000);
/*!40000 ALTER TABLE `llxas_propal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_propal_extrafields`
--

DROP TABLE IF EXISTS `llxas_propal_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_propal_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_propal_extrafields`
--

LOCK TABLES `llxas_propal_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_propal_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_propal_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_propal_merge_pdf_product`
--

DROP TABLE IF EXISTS `llxas_propal_merge_pdf_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_propal_merge_pdf_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) NOT NULL,
  `file_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_propal_merge_pdf_product`
--

LOCK TABLES `llxas_propal_merge_pdf_product` WRITE;
/*!40000 ALTER TABLE `llxas_propal_merge_pdf_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_propal_merge_pdf_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_propaldet`
--

DROP TABLE IF EXISTS `llxas_propaldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_propaldet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_propal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_fk_propal` (`fk_propal`),
  KEY `idx_propaldet_fk_product` (`fk_product`),
  KEY `fk_propaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_propaldet_fk_propal` FOREIGN KEY (`fk_propal`) REFERENCES `llxas_propal` (`rowid`),
  CONSTRAINT `fk_propaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_propaldet`
--

LOCK TABLES `llxas_propaldet` WRITE;
/*!40000 ALTER TABLE `llxas_propaldet` DISABLE KEYS */;
INSERT INTO `llxas_propaldet` (`rowid`, `fk_propal`, `fk_parent_line`, `fk_product`, `label`, `description`, `fk_remise_except`, `vat_src_code`, `tva_tx`, `localtax1_tx`, `localtax1_type`, `localtax2_tx`, `localtax2_type`, `qty`, `remise_percent`, `remise`, `price`, `subprice`, `total_ht`, `total_tva`, `total_localtax1`, `total_localtax2`, `total_ttc`, `product_type`, `date_start`, `date_end`, `info_bits`, `buy_price_ht`, `fk_product_fournisseur_price`, `special_code`, `rang`, `fk_unit`, `fk_multicurrency`, `multicurrency_code`, `multicurrency_subprice`, `multicurrency_total_ht`, `multicurrency_total_tva`, `multicurrency_total_ttc`) VALUES (1,1,NULL,22,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,1,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(2,1,NULL,23,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,2,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(3,1,NULL,24,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,3,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(4,1,NULL,25,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,4,NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000),(5,1,NULL,26,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,5,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(6,1,NULL,27,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,6,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(7,1,NULL,28,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,7,NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000),(8,1,NULL,29,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',2,0,0,9.5,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,8,NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000),(9,1,NULL,30,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,9,NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000),(10,1,NULL,31,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,10,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(11,1,NULL,32,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,11,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(12,1,NULL,33,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',3,0,0,NULL,9.50000000,28.50000000,0.00000000,0.00000000,0.00000000,28.50000000,0,NULL,NULL,0,4.50000000,NULL,0,12,NULL,NULL,'USD',9.50000000,28.50000000,0.00000000,28.50000000),(13,1,NULL,34,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,9.50000000,85.50000000,0.00000000,0.00000000,0.00000000,85.50000000,0,NULL,NULL,0,4.50000000,NULL,0,13,NULL,NULL,'USD',9.50000000,85.50000000,0.00000000,85.50000000),(14,1,NULL,35,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,9.50000000,85.50000000,0.00000000,0.00000000,0.00000000,85.50000000,0,NULL,NULL,0,4.50000000,NULL,0,14,NULL,NULL,'USD',9.50000000,85.50000000,0.00000000,85.50000000),(15,1,NULL,36,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,15,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(16,1,NULL,37,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',20,0,0,NULL,8.75000000,175.00000000,0.00000000,0.00000000,0.00000000,175.00000000,0,NULL,NULL,0,3.75000000,NULL,0,16,NULL,NULL,'USD',8.75000000,175.00000000,0.00000000,175.00000000),(17,1,NULL,38,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,17,NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000),(18,1,NULL,39,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',27,0,0,NULL,8.75000000,236.25000000,0.00000000,0.00000000,0.00000000,236.25000000,0,NULL,NULL,0,3.75000000,NULL,0,18,NULL,NULL,'USD',8.75000000,236.25000000,0.00000000,236.25000000),(19,1,NULL,40,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',18,0,0,NULL,8.75000000,157.50000000,0.00000000,0.00000000,0.00000000,157.50000000,0,NULL,NULL,0,3.75000000,NULL,0,19,NULL,NULL,'USD',8.75000000,157.50000000,0.00000000,157.50000000),(20,1,NULL,41,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',28,0,0,NULL,8.75000000,245.00000000,0.00000000,0.00000000,0.00000000,245.00000000,0,NULL,NULL,0,3.75000000,NULL,0,20,NULL,NULL,'USD',8.75000000,245.00000000,0.00000000,245.00000000),(21,1,NULL,42,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',14,0,0,NULL,8.75000000,122.50000000,0.00000000,0.00000000,0.00000000,122.50000000,0,NULL,NULL,0,3.75000000,NULL,0,21,NULL,NULL,'USD',8.75000000,122.50000000,0.00000000,122.50000000),(22,1,NULL,43,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,22,NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000),(23,1,NULL,44,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',5,0,0,NULL,8.75000000,43.75000000,0.00000000,0.00000000,0.00000000,43.75000000,0,NULL,NULL,0,3.75000000,NULL,0,23,NULL,NULL,'USD',8.75000000,43.75000000,0.00000000,43.75000000),(24,1,NULL,45,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',32,0,0,NULL,8.75000000,280.00000000,0.00000000,0.00000000,0.00000000,280.00000000,0,NULL,NULL,0,3.75000000,NULL,0,24,NULL,NULL,'USD',8.75000000,280.00000000,0.00000000,280.00000000),(25,1,NULL,46,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',4,0,0,NULL,8.75000000,35.00000000,0.00000000,0.00000000,0.00000000,35.00000000,0,NULL,NULL,0,3.75000000,NULL,0,25,NULL,NULL,'USD',8.75000000,35.00000000,0.00000000,35.00000000),(26,1,NULL,47,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',18,0,0,NULL,8.75000000,157.50000000,0.00000000,0.00000000,0.00000000,157.50000000,0,NULL,NULL,0,3.75000000,NULL,0,26,NULL,NULL,'USD',8.75000000,157.50000000,0.00000000,157.50000000),(27,1,NULL,48,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',13,0,0,NULL,8.75000000,113.75000000,0.00000000,0.00000000,0.00000000,113.75000000,0,NULL,NULL,0,3.75000000,NULL,0,27,NULL,NULL,'USD',8.75000000,113.75000000,0.00000000,113.75000000),(28,1,NULL,49,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',11,0,0,NULL,8.75000000,96.25000000,0.00000000,0.00000000,0.00000000,96.25000000,0,NULL,NULL,0,3.75000000,NULL,0,28,NULL,NULL,'USD',8.75000000,96.25000000,0.00000000,96.25000000),(29,1,NULL,50,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',25,0,0,NULL,8.75000000,218.75000000,0.00000000,0.00000000,0.00000000,218.75000000,0,NULL,NULL,0,3.75000000,NULL,0,29,NULL,NULL,'USD',8.75000000,218.75000000,0.00000000,218.75000000),(30,1,NULL,51,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,30,NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000),(31,1,NULL,52,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',7,0,0,NULL,8.75000000,61.25000000,0.00000000,0.00000000,0.00000000,61.25000000,0,NULL,NULL,0,3.75000000,NULL,0,31,NULL,NULL,'USD',8.75000000,61.25000000,0.00000000,61.25000000),(32,1,NULL,53,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,32,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(33,1,NULL,54,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,33,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(34,1,NULL,55,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,34,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(35,1,NULL,56,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,35,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(36,1,NULL,NULL,NULL,'Shipping Charges',NULL,'',6.000,0.000,'0',0.000,'0',1,0,0,7255.58,7255.58000000,7255.58000000,435.33000000,0.00000000,0.00000000,7690.91000000,1,NULL,NULL,0,0.00000000,NULL,0,36,NULL,NULL,'USD',7255.58000000,7255.58000000,435.33000000,7690.91000000),(37,2,NULL,22,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,6,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(38,2,NULL,23,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,1,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(39,2,NULL,24,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,2,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(40,2,NULL,25,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,3,NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000),(41,2,NULL,26,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,4,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(42,2,NULL,27,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,5,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(43,2,NULL,28,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,7,NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000),(44,2,NULL,29,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,8,NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000),(45,2,NULL,30,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',2,0,0,NULL,9.50000000,19.00000000,0.00000000,0.00000000,0.00000000,19.00000000,0,NULL,NULL,0,4.50000000,NULL,0,9,NULL,NULL,'USD',9.50000000,19.00000000,0.00000000,19.00000000),(46,2,NULL,31,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,10,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(47,2,NULL,32,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,11,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(48,2,NULL,33,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',3,0,0,NULL,9.50000000,28.50000000,0.00000000,0.00000000,0.00000000,28.50000000,0,NULL,NULL,0,4.50000000,NULL,0,12,NULL,NULL,'USD',9.50000000,28.50000000,0.00000000,28.50000000),(49,2,NULL,34,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,9.50000000,85.50000000,0.00000000,0.00000000,0.00000000,85.50000000,0,NULL,NULL,0,4.50000000,NULL,0,13,NULL,NULL,'USD',9.50000000,85.50000000,0.00000000,85.50000000),(50,2,NULL,35,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,9.50000000,85.50000000,0.00000000,0.00000000,0.00000000,85.50000000,0,NULL,NULL,0,4.50000000,NULL,0,14,NULL,NULL,'USD',9.50000000,85.50000000,0.00000000,85.50000000),(51,2,NULL,36,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,15,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(52,2,NULL,37,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',20,0,0,NULL,8.75000000,175.00000000,0.00000000,0.00000000,0.00000000,175.00000000,0,NULL,NULL,0,3.75000000,NULL,0,16,NULL,NULL,'USD',8.75000000,175.00000000,0.00000000,175.00000000),(53,2,NULL,38,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,17,NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000),(54,2,NULL,39,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',27,0,0,NULL,8.75000000,236.25000000,0.00000000,0.00000000,0.00000000,236.25000000,0,NULL,NULL,0,3.75000000,NULL,0,18,NULL,NULL,'USD',8.75000000,236.25000000,0.00000000,236.25000000),(55,2,NULL,40,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',18,0,0,NULL,8.75000000,157.50000000,0.00000000,0.00000000,0.00000000,157.50000000,0,NULL,NULL,0,3.75000000,NULL,0,19,NULL,NULL,'USD',8.75000000,157.50000000,0.00000000,157.50000000),(56,2,NULL,41,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',28,0,0,NULL,8.75000000,245.00000000,0.00000000,0.00000000,0.00000000,245.00000000,0,NULL,NULL,0,3.75000000,NULL,0,20,NULL,NULL,'USD',8.75000000,245.00000000,0.00000000,245.00000000),(57,2,NULL,42,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',14,0,0,NULL,8.75000000,122.50000000,0.00000000,0.00000000,0.00000000,122.50000000,0,NULL,NULL,0,3.75000000,NULL,0,21,NULL,NULL,'USD',8.75000000,122.50000000,0.00000000,122.50000000),(58,2,NULL,43,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,22,NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000),(59,2,NULL,44,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',5,0,0,NULL,8.75000000,43.75000000,0.00000000,0.00000000,0.00000000,43.75000000,0,NULL,NULL,0,3.75000000,NULL,0,23,NULL,NULL,'USD',8.75000000,43.75000000,0.00000000,43.75000000),(60,2,NULL,45,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',32,0,0,NULL,8.75000000,280.00000000,0.00000000,0.00000000,0.00000000,280.00000000,0,NULL,NULL,0,3.75000000,NULL,0,24,NULL,NULL,'USD',8.75000000,280.00000000,0.00000000,280.00000000),(61,2,NULL,46,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',4,0,0,NULL,8.75000000,35.00000000,0.00000000,0.00000000,0.00000000,35.00000000,0,NULL,NULL,0,3.75000000,NULL,0,25,NULL,NULL,'USD',8.75000000,35.00000000,0.00000000,35.00000000),(62,2,NULL,47,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',18,0,0,NULL,8.75000000,157.50000000,0.00000000,0.00000000,0.00000000,157.50000000,0,NULL,NULL,0,3.75000000,NULL,0,26,NULL,NULL,'USD',8.75000000,157.50000000,0.00000000,157.50000000),(63,2,NULL,48,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',13,0,0,NULL,8.75000000,113.75000000,0.00000000,0.00000000,0.00000000,113.75000000,0,NULL,NULL,0,3.75000000,NULL,0,27,NULL,NULL,'USD',8.75000000,113.75000000,0.00000000,113.75000000),(64,2,NULL,49,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',11,0,0,NULL,8.75000000,96.25000000,0.00000000,0.00000000,0.00000000,96.25000000,0,NULL,NULL,0,3.75000000,NULL,0,28,NULL,NULL,'USD',8.75000000,96.25000000,0.00000000,96.25000000),(65,2,NULL,50,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',25,0,0,NULL,8.75000000,218.75000000,0.00000000,0.00000000,0.00000000,218.75000000,0,NULL,NULL,0,3.75000000,NULL,0,29,NULL,NULL,'USD',8.75000000,218.75000000,0.00000000,218.75000000),(66,2,NULL,51,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',9,0,0,NULL,8.75000000,78.75000000,0.00000000,0.00000000,0.00000000,78.75000000,0,NULL,NULL,0,3.75000000,NULL,0,30,NULL,NULL,'USD',8.75000000,78.75000000,0.00000000,78.75000000),(67,2,NULL,52,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',7,0,0,NULL,8.75000000,61.25000000,0.00000000,0.00000000,0.00000000,61.25000000,0,NULL,NULL,0,3.75000000,NULL,0,31,NULL,NULL,'USD',8.75000000,61.25000000,0.00000000,61.25000000),(68,2,NULL,53,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,32,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(69,2,NULL,54,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,33,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(70,2,NULL,55,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,34,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(71,2,NULL,56,NULL,'',NULL,'',0.000,0.000,'0',0.000,'0',1,0,0,NULL,9.50000000,9.50000000,0.00000000,0.00000000,0.00000000,9.50000000,0,NULL,NULL,0,4.50000000,NULL,0,35,NULL,NULL,'USD',9.50000000,9.50000000,0.00000000,9.50000000),(72,2,NULL,NULL,NULL,'Shipping Charges',NULL,'',6.000,0.000,'0',0.000,'0',1,0,0,NULL,7255.58000000,7255.58000000,435.33000000,0.00000000,0.00000000,7690.91000000,1,NULL,NULL,0,0.00000000,NULL,0,36,NULL,NULL,'USD',7255.58000000,7255.58000000,435.33000000,7690.91000000);
/*!40000 ALTER TABLE `llxas_propaldet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_propaldet_extrafields`
--

DROP TABLE IF EXISTS `llxas_propaldet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_propaldet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_propaldet_extrafields`
--

LOCK TABLES `llxas_propaldet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_propaldet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_propaldet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_reception`
--

DROP TABLE IF EXISTS `llxas_reception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_reception` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_supplier` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_reception_uk_ref` (`ref`,`entity`),
  KEY `idx_reception_fk_soc` (`fk_soc`),
  KEY `idx_reception_fk_user_author` (`fk_user_author`),
  KEY `idx_reception_fk_user_valid` (`fk_user_valid`),
  KEY `idx_reception_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_reception_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llxas_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_reception_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_reception_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_reception_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_reception`
--

LOCK TABLES `llxas_reception` WRITE;
/*!40000 ALTER TABLE `llxas_reception` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_reception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_reception_extrafields`
--

DROP TABLE IF EXISTS `llxas_reception_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_reception_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_reception_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_reception_extrafields`
--

LOCK TABLES `llxas_reception_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_reception_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_reception_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_recruitment_recruitmentcandidature`
--

DROP TABLE IF EXISTS `llxas_recruitment_recruitmentcandidature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_recruitment_recruitmentcandidature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `fk_recruitmentjobposition` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `firstname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `remuneration_requested` int(11) DEFAULT NULL,
  `remuneration_proposed` int(11) DEFAULT NULL,
  `email_msgid` varchar(175) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_recruitment_origin` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_recruitmentcandidature_email_msgid` (`email_msgid`),
  KEY `idx_recruitment_recruitmentcandidature_rowid` (`rowid`),
  KEY `idx_recruitment_recruitmentcandidature_ref` (`ref`),
  KEY `llxas_recruitment_recruitmentcandidature_fk_user_creat` (`fk_user_creat`),
  KEY `idx_recruitment_recruitmentcandidature_status` (`status`),
  CONSTRAINT `llxas_recruitment_recruitmentcandidature_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_recruitment_recruitmentcandidature`
--

LOCK TABLES `llxas_recruitment_recruitmentcandidature` WRITE;
/*!40000 ALTER TABLE `llxas_recruitment_recruitmentcandidature` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_recruitment_recruitmentcandidature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_recruitment_recruitmentcandidature_extrafields`
--

DROP TABLE IF EXISTS `llxas_recruitment_recruitmentcandidature_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_recruitment_recruitmentcandidature_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_recruitmentcandidature_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_recruitment_recruitmentcandidature_extrafields`
--

LOCK TABLES `llxas_recruitment_recruitmentcandidature_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_recruitment_recruitmentcandidature_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_recruitment_recruitmentcandidature_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_recruitment_recruitmentjobposition`
--

DROP TABLE IF EXISTS `llxas_recruitment_recruitmentjobposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_recruitment_recruitmentjobposition` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_user_recruiter` int(11) DEFAULT NULL,
  `email_recruiter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_supervisor` int(11) DEFAULT NULL,
  `fk_establishment` int(11) DEFAULT NULL,
  `date_planned` date DEFAULT NULL,
  `remuneration_suggested` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_recruitment_recruitmentjobposition_rowid` (`rowid`),
  KEY `idx_recruitment_recruitmentjobposition_ref` (`ref`),
  KEY `idx_recruitment_recruitmentjobposition_fk_soc` (`fk_soc`),
  KEY `idx_recruitment_recruitmentjobposition_fk_project` (`fk_project`),
  KEY `llxas_recruitment_recruitmentjobposition_fk_user_recruiter` (`fk_user_recruiter`),
  KEY `llxas_recruitment_recruitmentjobposition_fk_user_supervisor` (`fk_user_supervisor`),
  KEY `llxas_recruitment_recruitmentjobposition_fk_establishment` (`fk_establishment`),
  KEY `llxas_recruitment_recruitmentjobposition_fk_user_creat` (`fk_user_creat`),
  KEY `idx_recruitment_recruitmentjobposition_status` (`status`),
  CONSTRAINT `llxas_recruitment_recruitmentjobposition_fk_establishment` FOREIGN KEY (`fk_establishment`) REFERENCES `llxas_establishment` (`rowid`),
  CONSTRAINT `llxas_recruitment_recruitmentjobposition_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `llxas_recruitment_recruitmentjobposition_fk_user_recruiter` FOREIGN KEY (`fk_user_recruiter`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `llxas_recruitment_recruitmentjobposition_fk_user_supervisor` FOREIGN KEY (`fk_user_supervisor`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_recruitment_recruitmentjobposition`
--

LOCK TABLES `llxas_recruitment_recruitmentjobposition` WRITE;
/*!40000 ALTER TABLE `llxas_recruitment_recruitmentjobposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_recruitment_recruitmentjobposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_recruitment_recruitmentjobposition_extrafields`
--

DROP TABLE IF EXISTS `llxas_recruitment_recruitmentjobposition_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_recruitment_recruitmentjobposition_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_recruitmentjobposition_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_recruitment_recruitmentjobposition_extrafields`
--

LOCK TABLES `llxas_recruitment_recruitmentjobposition_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_recruitment_recruitmentjobposition_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_recruitment_recruitmentjobposition_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_reports_config`
--

DROP TABLE IF EXISTS `llxas_reports_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_reports_config` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type_field` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_reports_config`
--

LOCK TABLES `llxas_reports_config` WRITE;
/*!40000 ALTER TABLE `llxas_reports_config` DISABLE KEYS */;
INSERT INTO `llxas_reports_config` (`rowid`, `entity`, `type_field`, `value`, `label`) VALUES (1,1,'PRODUIT_MULTIPRICES_LIMIT','',NULL);
/*!40000 ALTER TABLE `llxas_reports_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_reports_group`
--

DROP TABLE IF EXISTS `llxas_reports_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_reports_group` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_reports_group_code` (`code`),
  UNIQUE KEY `idx_reports_group_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_reports_group`
--

LOCK TABLES `llxas_reports_group` WRITE;
/*!40000 ALTER TABLE `llxas_reports_group` DISABLE KEYS */;
INSERT INTO `llxas_reports_group` (`rowid`, `entity`, `code`, `name`, `active`) VALUES (1,1,'0000','noAssigned',1),(2,1,'FINA','Financial',1),(6,1,'PROD','Products',1),(7,1,'COMM','Commercial',1),(8,1,'TIER','Third',1),(9,1,'PROJ','Project',1),(10,1,'AGEN','Agenda',1),(11,1,'PRES','Dolipresta',0),(12,1,'RRHH','HRM',1),(13,1,'TICK','Tickets',1),(14,1,'UPL','Upload Templates',1);
/*!40000 ALTER TABLE `llxas_reports_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_reports_report`
--

DROP TABLE IF EXISTS `llxas_reports_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_reports_report` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_group` int(11) DEFAULT 1,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xmlin` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_reports_report`
--

LOCK TABLES `llxas_reports_report` WRITE;
/*!40000 ALTER TABLE `llxas_reports_report` DISABLE KEYS */;
INSERT INTO `llxas_reports_report` (`rowid`, `entity`, `code`, `fk_group`, `name`, `xmlin`, `active`) VALUES (1,1,'P001',6,'ProductsList','Products.xml',1),(2,1,'P002',6,'ProductsStock','Stocks.xml',1),(3,1,'P003',6,'StockAlert','Stock_Alerts.xml',1),(4,1,'P004',6,'ProductsSales','Product_Sales.xml',1),(5,1,'P005',2,'CustomersInvoices','Invoices.xml',1),(6,1,'P006',7,'CommercialProposals','Prospects.xml',1),(7,1,'P007',7,'CustomersOrders','Orders.xml',1),(8,1,'P008',8,'ThirdParties','Thirds.xml',1),(9,1,'P009',8,'Contacts','Contacts.xml',1),(10,1,'P010',2,'SalesSummary','Stats_Invoice.xml',1),(11,1,'P011',2,'BillsSuppliers','Supplier_Invoices.xml',1),(12,1,'P012',2,'PurchasesSummary','Stats_Invoice_Supplier.xml',1),(13,1,'P013',6,'SalesDetails','Sales_Details.xml',1),(14,1,'P014',7,'SuppliersOrders','Provider_Orders.xml',1),(15,1,'P015',2,'SalesTaxDetail','Sales_Vat.xml',1),(16,1,'P016',2,'PurchasesTaxDetail','Buys_Vat.xml',1),(17,1,'P017',6,'UndeliveredProducts','Order_Exped.xml',1),(18,1,'P018',6,'OrderedProducts','Ordered_Products.xml',1),(19,1,'P019',9,'Projects','Projects.xml',1),(20,1,'P020',6,'MarginByProduct','Margin_By_Product.xml',1),(21,1,'P021',2,'CustomerMargins','Margin_By_Customer.xml',1),(22,1,'P022',7,'MarginBySalesRepresentative','Margin_By_Sales_Rep.xml',1),(23,1,'P023',7,'ActiveContracts','Active_Contracts.xml',1),(24,1,'P024',7,'ExpiringContracts','Expiring_Contracts.xml',1),(25,1,'P025',2,'CashBalance','Balance.xml',1),(26,1,'P026',2,'IncomeByCustomer','Income_By_Customer.xml',1),(27,1,'P027',2,'SalesBySalesRepresentative','Sales_By_Sales_Rep.xml',1),(28,1,'P028',11,'CustomerEcommerceOrders','Ecommerce_Orders.xml',0),(29,1,'P029',11,'EcommerceSalesTaxDetail','Ecommerce_Sales_Vat.xml',0),(30,1,'P030',11,'EcommerceCustomersInvoices','Invoices_Ecommerce.xml',0),(31,1,'P031',11,'ProductsSalesEcommerce','Product_Sales_Ecommerce.xml',0),(32,1,'P032',11,'EcommerceSalesSummary','Stats_Invoice_Ecommerce.xml',0),(33,1,'P033',6,'StockValue','Stocks_Value.xml',1),(34,1,'P034',6,'StockMovements','Stocks_Mov.xml',1),(35,1,'P035',7,'EntryDetails','Entry_Details.xml',1),(36,1,'P036',7,'OutputDetails','Output_Details.xml',1),(37,1,'P037',7,'ProposalsNotFirmed','ProspectsNotFirmed.xml',1),(38,1,'P038',2,'CommitmentBalance','Balance_comp.xml',1),(39,1,'P039',7,'Interventions','Intervention.xml',1),(40,1,'P040',7,'InterventionsDetails','Intervention_Details.xml',1),(41,1,'P041',10,'Agenda','Agenda.xml',1),(42,1,'P042',9,'ProjectsMargin','Margin_Projects.xml',1),(43,1,'P043',6,'BatchSales','lotes.xml',1),(44,1,'P044',6,'BatchPurchases','lotescompra.xml',1),(45,1,'P045',2,'OutstandingDebits','Debits.xml',1),(46,1,'P046',2,'OutcomeBySupplier','Outcome_By_Supplier.xml',1),(47,1,'P047',2,'BankMovements','BankMovements.xml',1),(48,1,'P048',9,'Tasks','Tasks.xml',1),(49,1,'P049',2,'SocialCharges','SocialCharges.xml',1),(50,1,'P050',12,'Holidays','Holidays.xml',1),(51,1,'P051',6,'Inventory','Inventory.xml',1),(52,1,'P052',6,'ListOfStockMovements','ListStockMov.xml',1),(53,1,'P053',6,'ShelledProducts','ShelledProducts.xml',1),(54,1,'P054',6,'BatchStock','lotes_stock.xml',1),(56,1,'P056',6,'VariantsStock','Stocks_Variants.xml',1),(57,1,'P057',6,'VariantsSales','Sales_Variants.xml',1),(58,1,'P058',6,'SAT','SAT.xml',0),(59,1,'P059',1,'Shelled_Products','Shelled_Products.xml',1),(60,1,'P060',1,'pe_Supplier','pe_Supplier.xml',1),(61,1,'P061',13,'Tickets','Tickets.xml',1),(62,1,'P062',1,'Accounts Payable','Accounts Payable.xml',1),(63,1,'P063',1,'Accounts Receivable','Accounts Receivable.xml',1),(65,1,'P065',1,'St_Val','St_Val.xml',1),(66,1,'P066',14,'SkuQty','SkuQty.xml',1);
/*!40000 ALTER TABLE `llxas_reports_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_resource`
--

DROP TABLE IF EXISTS `llxas_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_code_type_resource` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_resource_ref` (`ref`,`entity`),
  KEY `fk_code_type_resource_idx` (`fk_code_type_resource`),
  KEY `idx_resource_fk_country` (`fk_country`),
  CONSTRAINT `fk_resource_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llxas_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_resource`
--

LOCK TABLES `llxas_resource` WRITE;
/*!40000 ALTER TABLE `llxas_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_resource_extrafields`
--

DROP TABLE IF EXISTS `llxas_resource_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_resource_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_resource_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_resource_extrafields`
--

LOCK TABLES `llxas_resource_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_resource_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_resource_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_rights_def`
--

DROP TABLE IF EXISTS `llxas_rights_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_rights_def` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_position` int(11) NOT NULL DEFAULT 0,
  `family_position` int(11) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `perms` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subperms` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bydefault` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_rights_def`
--

LOCK TABLES `llxas_rights_def` WRITE;
/*!40000 ALTER TABLE `llxas_rights_def` DISABLE KEYS */;
INSERT INTO `llxas_rights_def` (`id`, `libelle`, `module`, `module_position`, `family_position`, `entity`, `perms`, `subperms`, `type`, `bydefault`) VALUES (11,'Read invoices','facture',0,0,1,'lire',NULL,'a',0),(12,'Create and update invoices','facture',0,0,1,'creer',NULL,'a',0),(13,'Devalidate invoices','facture',0,0,1,'invoice_advance','unvalidate','a',0),(14,'Validate invoices','facture',0,0,1,'invoice_advance','validate','a',0),(15,'Send invoices by email','facture',0,0,1,'invoice_advance','send','a',0),(16,'Issue payments on invoices','facture',0,0,1,'paiement',NULL,'a',0),(19,'Delete invoices','facture',0,0,1,'supprimer',NULL,'a',0),(21,'Read commercial proposals','propale',10,0,1,'lire',NULL,'r',0),(22,'Create and update commercial proposals','propale',10,0,1,'creer',NULL,'w',0),(24,'Validate commercial proposals','propale',10,0,1,'propal_advance','validate','d',0),(25,'Send commercial proposals to customers','propale',10,0,1,'propal_advance','send','d',0),(26,'Close commercial proposals','propale',10,0,1,'cloturer',NULL,'d',0),(27,'Delete commercial proposals','propale',10,0,1,'supprimer',NULL,'d',0),(28,'Exporting commercial proposals and attributes','propale',10,0,1,'export',NULL,'r',0),(31,'Read products','produit',26,0,1,'lire',NULL,'r',0),(32,'Create/modify products','produit',26,0,1,'creer',NULL,'w',0),(34,'Delete products','produit',26,0,1,'supprimer',NULL,'d',0),(38,'Export products','produit',26,0,1,'export',NULL,'r',0),(39,'Ignore minimum price','produit',26,0,1,'ignore_price_min_advance',NULL,'r',0),(41,'Read projects and tasks (shared projects or projects I am contact for). Can also enter time consumed on assigned tasks (timesheet)','projet',14,0,1,'lire',NULL,'r',0),(42,'Create/modify projects and tasks (shared projects or projects I am contact for)','projet',14,0,1,'creer',NULL,'w',0),(44,'Delete project and tasks (shared projects or projects I am contact for)','projet',14,0,1,'supprimer',NULL,'d',0),(45,'Export projects','projet',14,0,1,'export',NULL,'d',0),(61,'Lire les fiches d\'intervention','ficheinter',41,0,1,'lire',NULL,'r',0),(62,'Creer/modifier les fiches d\'intervention','ficheinter',41,0,1,'creer',NULL,'w',0),(64,'Supprimer les fiches d\'intervention','ficheinter',41,0,1,'supprimer',NULL,'d',0),(67,'Exporter les fiches interventions','ficheinter',41,0,1,'export',NULL,'r',0),(68,'Envoyer les fiches d\'intervention par courriel','ficheinter',41,0,1,'ficheinter_advance','send','r',0),(69,'Valider les fiches d\'intervention ','ficheinter',41,0,1,'ficheinter_advance','validate','a',0),(70,'Dévalider les fiches d\'intervention','ficheinter',41,0,1,'ficheinter_advance','unvalidate','a',0),(81,'Read sales orders','commande',0,0,1,'lire',NULL,'r',0),(82,'Creeat/modify sales orders','commande',0,0,1,'creer',NULL,'w',0),(84,'Validate sales orders','commande',0,0,1,'order_advance','validate','d',0),(86,'Send sale orders by email','commande',0,0,1,'order_advance','send','d',0),(87,'Close sale orders','commande',0,0,1,'order_advance','close','d',0),(88,'Cancel sale orders','commande',0,0,1,'order_advance','annuler','d',0),(89,'Delete sales orders','commande',0,0,1,'supprimer',NULL,'d',0),(91,'Lire les charges','tax',50,0,1,'charges','lire','r',0),(92,'Creer/modifier les charges','tax',50,0,1,'charges','creer','w',0),(93,'Supprimer les charges','tax',50,0,1,'charges','supprimer','d',0),(94,'Exporter les charges','tax',50,0,1,'charges','export','r',0),(101,'Lire les expeditions','expedition',40,0,1,'lire',NULL,'r',0),(102,'Creer modifier les expeditions','expedition',40,0,1,'creer',NULL,'w',0),(104,'Valider les expeditions','expedition',40,0,1,'shipping_advance','validate','d',0),(105,'Envoyer les expeditions aux clients','expedition',40,0,1,'shipping_advance','send','d',0),(106,'Exporter les expeditions','expedition',40,0,1,'shipment','export','r',0),(109,'Supprimer les expeditions','expedition',40,0,1,'supprimer',NULL,'d',0),(111,'Read bank account and transactions','banque',0,0,1,'lire',NULL,'r',0),(112,'Creer/modifier montant/supprimer ecriture bancaire','banque',0,0,1,'modifier',NULL,'w',0),(113,'Configurer les comptes bancaires (creer, gerer categories)','banque',0,0,1,'configurer',NULL,'a',0),(114,'Rapprocher les ecritures bancaires','banque',0,0,1,'consolidate',NULL,'w',0),(115,'Exporter transactions et releves','banque',0,0,1,'export',NULL,'r',0),(116,'Virements entre comptes','banque',0,0,1,'transfer',NULL,'w',0),(117,'Gerer les envois de cheques','banque',0,0,1,'cheque',NULL,'w',0),(121,'Read third parties','societe',0,0,1,'lire',NULL,'r',0),(122,'Create and update third parties','societe',0,0,1,'creer',NULL,'w',0),(125,'Delete third parties','societe',0,0,1,'supprimer',NULL,'d',0),(126,'Export third parties','societe',0,0,1,'export',NULL,'r',0),(141,'Read all projects and tasks (also private projects I am not contact for)','projet',14,0,1,'all','lire','r',0),(142,'Create/modify all projects and tasks (also private projects I am not contact for). Can also enter time consumed on assigned tasks (timesheet)','projet',14,0,1,'all','creer','w',0),(144,'Delete all projects and tasks (also private projects I am not contact for)','projet',14,0,1,'all','supprimer','d',0),(151,'Read direct debit payment orders','prelevement',52,0,1,'bons','lire','r',0),(152,'Create/modify a direct debit payment order','prelevement',52,0,1,'bons','creer','w',0),(153,'Send/Transmit direct debit payment orders','prelevement',52,0,1,'bons','send','a',0),(154,'Record Credits/Rejects of direct debit payment orders','prelevement',52,0,1,'bons','credit','a',0),(161,'Lire les contrats','contrat',41,0,1,'lire',NULL,'r',0),(162,'Creer / modifier les contrats','contrat',41,0,1,'creer',NULL,'w',0),(163,'Activer un service d\'un contrat','contrat',41,0,1,'activer',NULL,'w',0),(164,'Desactiver un service d\'un contrat','contrat',41,0,1,'desactiver',NULL,'w',0),(165,'Supprimer un contrat','contrat',41,0,1,'supprimer',NULL,'d',0),(167,'Export contracts','contrat',41,0,1,'export',NULL,'r',0),(241,'Lire les categories','categorie',20,0,1,'lire',NULL,'r',0),(242,'Creer/modifier les categories','categorie',20,0,1,'creer',NULL,'w',0),(243,'Supprimer les categories','categorie',20,0,1,'supprimer',NULL,'d',0),(251,'Consulter les autres utilisateurs','user',0,0,1,'user','lire','r',0),(252,'Consulter les permissions des autres utilisateurs','user',0,0,1,'user_advance','readperms','r',0),(253,'Creer/modifier utilisateurs internes et externes','user',0,0,1,'user','creer','w',0),(254,'Creer/modifier utilisateurs externes seulement','user',0,0,1,'user_advance','write','w',0),(255,'Modifier le mot de passe des autres utilisateurs','user',0,0,1,'user','password','w',0),(256,'Supprimer ou desactiver les autres utilisateurs','user',0,0,1,'user','supprimer','d',0),(262,'Read all third parties (and their objects) by internal users (otherwise only if commercial contact). Not effective for external users (limited to themselves).','societe',0,0,1,'client','voir','r',0),(281,'Read contacts','societe',0,0,1,'contact','lire','r',0),(282,'Create and update contact','societe',0,0,1,'contact','creer','w',0),(283,'Delete contacts','societe',0,0,1,'contact','supprimer','d',0),(286,'Export contacts','societe',0,0,1,'contact','export','d',0),(301,'Read barcodes','barcode',0,0,1,'lire_advance',NULL,'r',1),(302,'Create/modify barcodes','barcode',0,0,1,'creer_advance',NULL,'w',0),(331,'Lire les bookmarks','bookmark',50,0,1,'lire',NULL,'r',0),(332,'Creer/modifier les bookmarks','bookmark',50,0,1,'creer',NULL,'r',0),(333,'Supprimer les bookmarks','bookmark',50,0,1,'supprimer',NULL,'r',0),(341,'Consulter ses propres permissions','user',0,0,1,'self_advance','readperms','r',0),(342,'Creer/modifier ses propres infos utilisateur','user',0,0,1,'self','creer','w',0),(343,'Modifier son propre mot de passe','user',0,0,1,'self','password','w',0),(344,'Modifier ses propres permissions','user',0,0,1,'self_advance','writeperms','w',0),(351,'Consulter les groupes','user',0,0,1,'group_advance','read','r',0),(352,'Consulter les permissions des groupes','user',0,0,1,'group_advance','readperms','r',0),(353,'Creer/modifier les groupes et leurs permissions','user',0,0,1,'group_advance','write','w',0),(354,'Supprimer ou desactiver les groupes','user',0,0,1,'group_advance','delete','d',0),(358,'Exporter les utilisateurs','user',0,0,1,'user','export','r',0),(511,'Read employee salaries and payments (yours and your subordinates)','salaries',0,0,1,'read',NULL,'r',0),(512,'Create/modify payments of empoyee salaries','salaries',0,0,1,'write',NULL,'w',0),(514,'Delete payments of employee salary','salaries',0,0,1,'delete',NULL,'d',0),(517,'Read salaries and payments of all employees','salaries',0,0,1,'readall',NULL,'r',0),(519,'Export payments of employee salaries','salaries',0,0,1,'export',NULL,'r',0),(520,'Read loans','loan',50,0,1,'read',NULL,'r',0),(522,'Create/modify loans','loan',50,0,1,'write',NULL,'w',0),(524,'Delete loans','loan',50,0,1,'delete',NULL,'d',0),(525,'Access loan calculator','loan',50,0,1,'calc',NULL,'r',0),(527,'Export loans','loan',50,0,1,'export',NULL,'r',0),(531,'Read services','service',0,0,1,'lire',NULL,'r',0),(532,'Create/modify services','service',0,0,1,'creer',NULL,'w',0),(534,'Delete les services','service',0,0,1,'supprimer',NULL,'d',0),(538,'Export services','service',0,0,1,'export',NULL,'r',0),(561,'Read bank transfer payment orders','paymentbybanktransfer',52,0,1,'read',NULL,'r',0),(562,'Create/modify a bank transfer payment order','paymentbybanktransfer',52,0,1,'create',NULL,'w',0),(563,'Send/Transmit bank transfer payment order','paymentbybanktransfer',52,0,1,'send',NULL,'a',0),(564,'Record Debits/Rejects of bank transfer payment order','paymentbybanktransfer',52,0,1,'debit',NULL,'a',0),(771,'Read expense reports (yours and your subordinates)','expensereport',0,0,1,'lire',NULL,'r',0),(772,'Create/modify expense reports','expensereport',0,0,1,'creer',NULL,'w',0),(773,'Delete expense reports','expensereport',0,0,1,'supprimer',NULL,'d',0),(775,'Approve expense reports','expensereport',0,0,1,'approve',NULL,'w',0),(776,'Pay expense reports','expensereport',0,0,1,'to_paid',NULL,'w',0),(777,'Read expense reports of everybody','expensereport',0,0,1,'readall',NULL,'r',0),(778,'Create expense reports for everybody','expensereport',0,0,1,'writeall_advance',NULL,'w',0),(779,'Export expense reports','expensereport',0,0,1,'export',NULL,'r',0),(1001,'Lire les stocks','stock',39,0,1,'lire',NULL,'r',0),(1002,'Creer/Modifier les stocks','stock',39,0,1,'creer',NULL,'w',0),(1003,'Supprimer les stocks','stock',39,0,1,'supprimer',NULL,'d',0),(1004,'Lire mouvements de stocks','stock',39,0,1,'mouvement','lire','r',0),(1005,'Creer/modifier mouvements de stocks','stock',39,0,1,'mouvement','creer','w',0),(1101,'Read delivery receipts','expedition',40,0,1,'delivery','lire','r',0),(1102,'Create/modify delivery receipts','expedition',40,0,1,'delivery','creer','w',0),(1104,'Validate delivery receipts','expedition',40,0,1,'delivery_advance','validate','d',0),(1109,'Delete delivery receipts','expedition',40,0,1,'delivery','supprimer','d',0),(1121,'Read supplier proposals','supplier_proposal',35,0,1,'lire',NULL,'w',0),(1122,'Create/modify supplier proposals','supplier_proposal',35,0,1,'creer',NULL,'w',0),(1123,'Validate supplier proposals','supplier_proposal',35,0,1,'validate_advance',NULL,'w',0),(1124,'Envoyer les demandes fournisseurs','supplier_proposal',35,0,1,'send_advance',NULL,'w',0),(1125,'Delete supplier proposals','supplier_proposal',35,0,1,'supprimer',NULL,'w',0),(1126,'Close supplier price requests','supplier_proposal',35,0,1,'cloturer',NULL,'w',0),(1181,'Consulter les fournisseurs','fournisseur',0,0,1,'lire',NULL,'r',0),(1182,'Consulter les commandes fournisseur','fournisseur',0,0,1,'commande','lire','r',0),(1183,'Creer une commande fournisseur','fournisseur',0,0,1,'commande','creer','w',0),(1184,'Valider une commande fournisseur','fournisseur',0,0,1,'supplier_order_advance','validate','w',0),(1185,'Approuver une commande fournisseur','fournisseur',0,0,1,'commande','approuver','w',0),(1186,'Commander une commande fournisseur','fournisseur',0,0,1,'commande','commander','w',0),(1187,'Receptionner une commande fournisseur','fournisseur',0,0,1,'commande','receptionner','d',0),(1188,'Supprimer une commande fournisseur','fournisseur',0,0,1,'commande','supprimer','d',0),(1189,'Check/Uncheck a supplier order reception','fournisseur',0,0,1,'commande_advance','check','w',0),(1191,'Exporter les commande fournisseurs, attributs','fournisseur',0,0,1,'commande','export','r',0),(1201,'Lire les exports','export',72,0,1,'lire',NULL,'r',0),(1202,'Creer/modifier un export','export',72,0,1,'creer',NULL,'w',0),(1231,'Consulter les factures fournisseur','fournisseur',0,0,1,'facture','lire','r',0),(1232,'Creer une facture fournisseur','fournisseur',0,0,1,'facture','creer','w',0),(1233,'Valider une facture fournisseur','fournisseur',0,0,1,'supplier_invoice_advance','validate','w',0),(1234,'Supprimer une facture fournisseur','fournisseur',0,0,1,'facture','supprimer','d',0),(1235,'Envoyer les factures par mail','fournisseur',0,0,1,'supplier_invoice_advance','send','a',0),(1236,'Exporter les factures fournisseurs, attributs et reglements','fournisseur',0,0,1,'facture','export','r',0),(1251,'Run mass imports of external data (data load)','import',70,0,1,'run',NULL,'r',0),(1321,'Export customer invoices, attributes and payments','facture',0,0,1,'facture','export','r',0),(1322,'Re-open a fully paid invoice','facture',0,0,1,'invoice_advance','reopen','r',0),(1421,'Export sales orders and attributes','commande',0,0,1,'commande','export','r',0),(2401,'Read actions/tasks linked to his account','agenda',0,0,1,'myactions','read','r',0),(2402,'Create/modify actions/tasks linked to his account','agenda',0,0,1,'myactions','create','w',0),(2403,'Delete actions/tasks linked to his account','agenda',0,0,1,'myactions','delete','w',0),(2411,'Read actions/tasks of others','agenda',0,0,1,'allactions','read','r',0),(2412,'Create/modify actions/tasks of others','agenda',0,0,1,'allactions','create','w',0),(2413,'Delete actions/tasks of others','agenda',0,0,1,'allactions','delete','w',0),(2414,'Export actions/tasks of others','agenda',0,0,1,'export',NULL,'w',0),(2501,'Read or download documents','ecm',0,0,1,'read',NULL,'r',0),(2503,'Upload a document','ecm',0,0,1,'upload',NULL,'w',0),(2515,'Administer directories of documents','ecm',0,0,1,'setup',NULL,'w',0),(20001,'Read leave requests (yours and your subordinates)','holiday',0,0,1,'read',NULL,'w',0),(20002,'Create/modify leave requests','holiday',0,0,1,'write',NULL,'w',0),(20003,'Delete leave requests','holiday',0,0,1,'delete',NULL,'w',0),(20004,'Read leave requests for everybody','holiday',0,0,1,'readall',NULL,'w',0),(20005,'Create/modify leave requests for everybody','holiday',0,0,1,'writeall_advance',NULL,'w',0),(20006,'Setup leave requests of users (setup and update balance)','holiday',0,0,1,'define_holiday',NULL,'w',0),(20007,'Approve leave requests','holiday',0,0,1,'approve',NULL,'w',0),(23001,'Read cron jobs','cron',0,0,1,'read',NULL,'w',0),(23002,'Create cron Jobs','cron',0,0,1,'create',NULL,'w',0),(23003,'Delete cron Jobs','cron',0,0,1,'delete',NULL,'w',0),(23004,'Execute cron Jobs','cron',0,0,1,'execute',NULL,'w',0),(50401,'Bind products and invoices with accounting accounts','accounting',61,0,1,'bind','write','r',0),(50411,'Read operations in Ledger','accounting',61,0,1,'mouvements','lire','r',0),(50412,'Write/Edit operations in Ledger','accounting',61,0,1,'mouvements','creer','w',0),(50414,'Delete operations in Ledger','accounting',61,0,1,'mouvements','supprimer','d',0),(50415,'Delete all operations by year and journal in Ledger','accounting',61,0,1,'mouvements','supprimer_tous','d',0),(50418,'Export operations of the Ledger','accounting',61,0,1,'mouvements','export','r',0),(50420,'Report and export reports (turnover, balance, journals, ledger)','accounting',61,0,1,'comptarapport','lire','r',0),(50430,'Manage fiscal periods, validate movements and close periods','accounting',61,0,1,'fiscalyear','write','r',0),(50440,'Manage chart of accounts, setup of accountancy','accounting',61,0,1,'chartofaccount',NULL,'r',0),(56001,'Read ticket','ticket',0,0,1,'read',NULL,'r',0),(56002,'Create les tickets','ticket',0,0,1,'write',NULL,'w',0),(56003,'Delete les tickets','ticket',0,0,1,'delete',NULL,'d',0),(56004,'Manage tickets','ticket',0,0,1,'manage',NULL,'w',0),(59001,'Visualiser les marges','margins',55,0,1,'liretous',NULL,'r',0),(59002,'Définir les marges','margins',55,0,1,'creer',NULL,'w',0),(59003,'Read every user margin','margins',55,0,1,'read','all','r',0),(63001,'Read resources','resource',16,0,1,'read',NULL,'w',0),(63002,'Create/Modify resources','resource',16,0,1,'write',NULL,'w',0),(63003,'Delete resources','resource',16,0,1,'delete',NULL,'w',0),(63004,'Link resources to agenda events','resource',16,0,1,'link',NULL,'w',0),(64001,'DirectPrint','printing',52,0,1,'read',NULL,'r',0),(513001,'Export list','listexportimport',50,0,1,'export',NULL,'r',1),(513002,'Import list','listexportimport',50,0,1,'import',NULL,'m',0),(577888,'Read objects of Unboxutil','unboxutil',90,0,1,'myobject','read','w',0),(577889,'Create/Update objects of Unboxutil','unboxutil',90,0,1,'myobject','write','w',0),(577890,'Delete objects of Unboxutil','unboxutil',90,0,1,'myobject','delete','w',0),(577891,'Create/Update objects of Unboxutil','unboxutil',90,0,1,'myobject','write','w',0),(577892,'Delete objects of Unboxutil','unboxutil',90,0,1,'myobject','delete','w',0),(941601,'Lire les receptions','reception',40,0,1,'lire',NULL,'r',0),(941602,'Creer modifier les receptions','reception',40,0,1,'creer',NULL,'w',0),(941603,'Valider les receptions','reception',40,0,1,'reception_advance','validate','d',0),(941604,'Envoyer les receptions aux clients','reception',40,0,1,'reception_advance','send','d',0),(941605,'Exporter les receptions','reception',40,0,1,'reception','export','r',0),(941606,'Supprimer les receptions','reception',40,0,1,'supprimer',NULL,'d',0),(1040910,'ReadDiscountsRules','discountrules',0,0,1,'read',NULL,'w',0),(1040911,'CreateUpdateDiscountsRules','discountrules',0,0,1,'create',NULL,'w',0),(1040912,'DeleteDiscountsRules','discountrules',0,0,1,'delete',NULL,'w',0),(4000040,'DesignReports','reports',50,0,1,'admin',NULL,'a',1),(4000041,'UseReports','reports',50,0,1,'use',NULL,'a',1),(4000042,'ProductsList','reports',50,0,1,'P001',NULL,'a',1),(4000043,'ProductsStock','reports',50,0,1,'P002',NULL,'a',1),(4000044,'StockAlert','reports',50,0,1,'P003',NULL,'a',1),(4000045,'ProductsSales','reports',50,0,1,'P004',NULL,'a',1),(4000046,'CustomersInvoices','reports',50,0,1,'P005',NULL,'a',1),(4000047,'CommercialProposals','reports',50,0,1,'P006',NULL,'a',1),(4000048,'CustomersOrders','reports',50,0,1,'P007',NULL,'a',1),(4000049,'ThirdParties','reports',50,0,1,'P008',NULL,'a',1),(40000410,'Contacts','reports',50,0,1,'P009',NULL,'a',1),(40000411,'SalesSummary','reports',50,0,1,'P010',NULL,'a',1),(40000412,'BillsSuppliers','reports',50,0,1,'P011',NULL,'a',1),(40000413,'PurchasesSummary','reports',50,0,1,'P012',NULL,'a',1),(40000414,'SalesDetails','reports',50,0,1,'P013',NULL,'a',1),(40000415,'SuppliersOrders','reports',50,0,1,'P014',NULL,'a',1),(40000416,'SalesTaxDetail','reports',50,0,1,'P015',NULL,'a',1),(40000417,'PurchasesTaxDetail','reports',50,0,1,'P016',NULL,'a',1),(40000418,'UndeliveredProducts','reports',50,0,1,'P017',NULL,'a',1),(40000419,'OrderedProducts','reports',50,0,1,'P018',NULL,'a',1),(40000420,'Projects','reports',50,0,1,'P019',NULL,'a',1),(40000421,'MarginByProduct','reports',50,0,1,'P020',NULL,'a',1),(40000422,'CustomerMargins','reports',50,0,1,'P021',NULL,'a',1),(40000423,'MarginBySalesRepresentative','reports',50,0,1,'P022',NULL,'a',1),(40000424,'ActiveContracts','reports',50,0,1,'P023',NULL,'a',1),(40000425,'ExpiringContracts','reports',50,0,1,'P024',NULL,'a',1),(40000426,'CashBalance','reports',50,0,1,'P025',NULL,'a',1),(40000427,'IncomeByCustomer','reports',50,0,1,'P026',NULL,'a',1),(40000428,'SalesBySalesRepresentative','reports',50,0,1,'P027',NULL,'a',1),(40000434,'StockValue','reports',50,0,1,'P033',NULL,'a',1),(40000435,'StockMovements','reports',50,0,1,'P034',NULL,'a',1),(40000436,'EntryDetails','reports',50,0,1,'P035',NULL,'a',1),(40000437,'OutputDetails','reports',50,0,1,'P036',NULL,'a',1),(40000438,'ProposalsNotFirmed','reports',50,0,1,'P037',NULL,'a',1),(40000439,'CommitmentBalance','reports',50,0,1,'P038',NULL,'a',1),(40000440,'Interventions','reports',50,0,1,'P039',NULL,'a',1),(40000441,'InterventionsDetails','reports',50,0,1,'P040',NULL,'a',1),(40000442,'Agenda','reports',50,0,1,'P041',NULL,'a',1),(40000443,'ProjectsMargin','reports',50,0,1,'P042',NULL,'a',1),(40000444,'BatchSales','reports',50,0,1,'P043',NULL,'a',1),(40000445,'BatchPurchases','reports',50,0,1,'P044',NULL,'a',1),(40000446,'OutstandingDebits','reports',50,0,1,'P045',NULL,'a',1),(40000447,'OutcomeBySupplier','reports',50,0,1,'P046',NULL,'a',1),(40000448,'BankMovements','reports',50,0,1,'P047',NULL,'a',1),(40000449,'Tasks','reports',50,0,1,'P048',NULL,'a',1),(40000450,'SocialCharges','reports',50,0,1,'P049',NULL,'a',1),(40000451,'Holidays','reports',50,0,1,'P050',NULL,'a',1),(40000452,'Inventory','reports',50,0,1,'P051',NULL,'a',1),(40000453,'ListOfStockMovements','reports',50,0,1,'P052',NULL,'a',1),(40000454,'ShelledProducts','reports',50,0,1,'P053',NULL,'a',1),(40000455,'BatchStock','reports',50,0,1,'P054',NULL,'a',1),(40000456,'Modelo347','reports',50,0,1,'P055',NULL,'a',1),(40000457,'VariantsStock','reports',50,0,1,'P056',NULL,'a',1),(40000458,'VariantsSales','reports',50,0,1,'P057',NULL,'a',1),(40000460,'Shelled_Products','reports',50,0,1,'P059',NULL,'a',1),(40000461,'pe_Supplier','reports',50,0,1,'P060',NULL,'a',1),(40000462,'Tickets','reports',50,0,1,'P061',NULL,'a',1),(40000463,'Accounts Payable','reports',50,0,1,'P062',NULL,'a',1),(40000464,'Accounts Receivable','reports',50,0,1,'P063',NULL,'a',1),(40000465,'Sku & Qty','reports',50,0,1,'P064',NULL,'a',1),(40000466,'St_Val','reports',50,0,1,'P065',NULL,'a',1),(40000467,'SkuQty','reports',50,0,1,'P066',NULL,'a',1),(125032002,'Rights_CanUseKanview','kanview',100,0,1,'canuse',NULL,'w',0),(125032003,'Rights_CanUseKanview_Projects','kanview',100,0,1,'kanview_advance','canuse_projects','w',0),(125032004,'Rights_CanUseKanview_Tasks','kanview',100,0,1,'kanview_advance','canuse_tasks','w',0),(125032005,'Rights_CanUseKanview_Propals','kanview',100,0,1,'kanview_advance','canuse_propals','w',0),(125032006,'Rights_CanUseKanview_Orders','kanview',100,0,1,'kanview_advance','canuse_orders','w',0),(125032007,'Rights_CanUseKanview_Invoices','kanview',100,0,1,'kanview_advance','canuse_invoices','w',0),(125032008,'Rights_CanUseKanview_Prospects','kanview',100,0,1,'kanview_advance','canuse_prospects','w',0),(125032009,'Rights_CanUseKanview_InvoicesSuppliers','kanview',100,0,1,'kanview_advance','canuse_invoices_suppliers','w',0);
/*!40000 ALTER TABLE `llxas_rights_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_salary`
--

DROP TABLE IF EXISTS `llxas_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_salary` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `fk_typepayment` int(11) NOT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_salary`
--

LOCK TABLES `llxas_salary` WRITE;
/*!40000 ALTER TABLE `llxas_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_salary_extrafields`
--

DROP TABLE IF EXISTS `llxas_salary_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_salary_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_salary_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_salary_extrafields`
--

LOCK TABLES `llxas_salary_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_salary_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_salary_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_session`
--

DROP TABLE IF EXISTS `llxas_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_session` (
  `session_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_variable` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_accessed` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `remote_ip` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_session`
--

LOCK TABLES `llxas_session` WRITE;
/*!40000 ALTER TABLE `llxas_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe`
--

DROP TABLE IF EXISTS `llxas_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_alias` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 0,
  `parent` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `code_client` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_fournisseur` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_compta` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_compta_fournisseur` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_departement` int(11) DEFAULT 0,
  `fk_pays` int(11) DEFAULT 0,
  `fk_account` int(11) DEFAULT 0,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialnetworks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snapchat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_effectif` int(11) DEFAULT 0,
  `fk_typent` int(11) DEFAULT NULL,
  `fk_forme_juridique` int(11) DEFAULT 0,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siren` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siret` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ape` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idprof4` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idprof5` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idprof6` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tva_intra` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` double(24,8) DEFAULT NULL,
  `fk_stcomm` int(11) NOT NULL DEFAULT 0,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix_comm` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client` tinyint(4) DEFAULT 0,
  `fournisseur` tinyint(4) DEFAULT 0,
  `supplier_account` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_prospectlevel` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_bad` tinyint(4) DEFAULT 0,
  `customer_rate` double DEFAULT 0,
  `supplier_rate` double DEFAULT 0,
  `remise_client` double DEFAULT 0,
  `remise_supplier` double DEFAULT 0,
  `mode_reglement` tinyint(4) DEFAULT NULL,
  `cond_reglement` tinyint(4) DEFAULT NULL,
  `transport_mode` tinyint(4) DEFAULT NULL,
  `mode_reglement_supplier` tinyint(4) DEFAULT NULL,
  `cond_reglement_supplier` tinyint(4) DEFAULT NULL,
  `transport_mode_supplier` tinyint(4) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tva_assuj` tinyint(4) DEFAULT 1,
  `localtax1_assuj` tinyint(4) DEFAULT 0,
  `localtax1_value` double(6,3) DEFAULT NULL,
  `localtax2_assuj` tinyint(4) DEFAULT 0,
  `localtax2_value` double(6,3) DEFAULT NULL,
  `barcode` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `price_level` int(11) DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `order_min_amount` double(24,8) DEFAULT NULL,
  `supplier_order_min_amount` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_squarred` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canvas` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `webservices_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webservices_key` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_societe_user_creat` (`fk_user_creat`),
  KEY `idx_societe_user_modif` (`fk_user_modif`),
  KEY `idx_societe_stcomm` (`fk_stcomm`),
  KEY `idx_societe_pays` (`fk_pays`),
  KEY `idx_societe_account` (`fk_account`),
  KEY `idx_societe_prospectlevel` (`fk_prospectlevel`),
  KEY `idx_societe_typent` (`fk_typent`),
  KEY `idx_societe_forme_juridique` (`fk_forme_juridique`),
  KEY `idx_societe_shipping_method` (`fk_shipping_method`),
  KEY `idx_societe_warehouse` (`fk_warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe`
--

LOCK TABLES `llxas_societe` WRITE;
/*!40000 ALTER TABLE `llxas_societe` DISABLE KEYS */;
INSERT INTO `llxas_societe` (`rowid`, `nom`, `name_alias`, `entity`, `ref_ext`, `ref_int`, `statut`, `parent`, `status`, `code_client`, `code_fournisseur`, `code_compta`, `code_compta_fournisseur`, `address`, `zip`, `town`, `fk_departement`, `fk_pays`, `fk_account`, `phone`, `fax`, `url`, `email`, `socialnetworks`, `skype`, `twitter`, `facebook`, `linkedin`, `instagram`, `snapchat`, `googleplus`, `youtube`, `whatsapp`, `fk_effectif`, `fk_typent`, `fk_forme_juridique`, `fk_currency`, `siren`, `siret`, `ape`, `idprof4`, `idprof5`, `idprof6`, `tva_intra`, `capital`, `fk_stcomm`, `note_private`, `note_public`, `model_pdf`, `prefix_comm`, `client`, `fournisseur`, `supplier_account`, `fk_prospectlevel`, `fk_incoterms`, `location_incoterms`, `customer_bad`, `customer_rate`, `supplier_rate`, `remise_client`, `remise_supplier`, `mode_reglement`, `cond_reglement`, `transport_mode`, `mode_reglement_supplier`, `cond_reglement_supplier`, `transport_mode_supplier`, `fk_shipping_method`, `tva_assuj`, `localtax1_assuj`, `localtax1_value`, `localtax2_assuj`, `localtax2_value`, `barcode`, `fk_barcode_type`, `price_level`, `outstanding_limit`, `order_min_amount`, `supplier_order_min_amount`, `default_lang`, `logo`, `logo_squarred`, `canvas`, `fk_warehouse`, `webservices_url`, `webservices_key`, `accountancy_code_sell`, `accountancy_code_buy`, `tms`, `datec`, `fk_user_creat`, `fk_user_modif`, `fk_multicurrency`, `multicurrency_code`, `import_key`) VALUES (1,'Mat Sweet','',1,NULL,NULL,0,NULL,1,'CU110922-00001',NULL,NULL,NULL,'1210 Hayward Dr.','78411','Corpus Christie',835,11,0,NULL,NULL,NULL,'customer1@test.com','[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,0,NULL,NULL,'',NULL,1,0,NULL,'',0,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0.000,NULL,0.000,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2022-11-09 18:30:22','2022-11-09 13:30:22',1,1,0,'',NULL),(2,'VENDOR 1','',1,NULL,NULL,0,NULL,1,NULL,'SU110922-00001',NULL,NULL,'133 Ridge Av',NULL,NULL,0,11,0,NULL,NULL,NULL,NULL,'[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,0,NULL,NULL,'',NULL,0,1,NULL,'',0,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0.000,NULL,0.000,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2022-11-09 22:02:09','2022-11-09 17:02:09',1,1,0,'',NULL);
/*!40000 ALTER TABLE `llxas_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_account`
--

DROP TABLE IF EXISTS `llxas_societe_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `login` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass_encoding` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_crypted` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_temp` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_website` int(11) DEFAULT NULL,
  `site` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_account` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_account` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `date_previous_login` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_account_login_website_soc` (`entity`,`fk_soc`,`login`,`site`,`fk_website`),
  UNIQUE KEY `uk_societe_account_key_account_soc` (`entity`,`fk_soc`,`key_account`,`site`,`fk_website`),
  KEY `idx_societe_account_rowid` (`rowid`),
  KEY `idx_societe_account_login` (`login`),
  KEY `idx_societe_account_status` (`status`),
  KEY `idx_societe_account_fk_website` (`fk_website`),
  KEY `idx_societe_account_fk_soc` (`fk_soc`),
  CONSTRAINT `llxas_societe_account_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `llxas_societe_account_fk_website` FOREIGN KEY (`fk_website`) REFERENCES `llxas_website` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_account`
--

LOCK TABLES `llxas_societe_account` WRITE;
/*!40000 ALTER TABLE `llxas_societe_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_address`
--

DROP TABLE IF EXISTS `llxas_societe_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_address` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_address`
--

LOCK TABLES `llxas_societe_address` WRITE;
/*!40000 ALTER TABLE `llxas_societe_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_commerciaux`
--

DROP TABLE IF EXISTS `llxas_societe_commerciaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_commerciaux` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_commerciaux` (`fk_soc`,`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_commerciaux`
--

LOCK TABLES `llxas_societe_commerciaux` WRITE;
/*!40000 ALTER TABLE `llxas_societe_commerciaux` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_commerciaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_contacts`
--

DROP TABLE IF EXISTS `llxas_societe_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_contacts` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_societe_contacts_idx1` (`entity`,`fk_soc`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_societe_contacts_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `fk_societe_contacts_fk_soc` (`fk_soc`),
  KEY `fk_societe_contacts_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_societe_contacts_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llxas_c_type_contact` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llxas_socpeople` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_contacts`
--

LOCK TABLES `llxas_societe_contacts` WRITE;
/*!40000 ALTER TABLE `llxas_societe_contacts` DISABLE KEYS */;
INSERT INTO `llxas_societe_contacts` (`rowid`, `entity`, `date_creation`, `fk_soc`, `fk_c_type_contact`, `fk_socpeople`, `tms`, `import_key`) VALUES (10,1,'2022-11-09 16:48:30',1,100,2,'2022-11-09 21:48:30',NULL),(11,1,'2022-11-09 16:48:30',1,60,2,'2022-11-09 21:48:30',NULL),(12,1,'2022-11-09 16:48:49',1,101,1,'2022-11-09 21:48:49',NULL),(13,1,'2022-11-09 16:48:49',1,102,1,'2022-11-09 21:48:49',NULL);
/*!40000 ALTER TABLE `llxas_societe_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_extrafields`
--

DROP TABLE IF EXISTS `llxas_societe_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_extrafields`
--

LOCK TABLES `llxas_societe_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_societe_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_perentity`
--

DROP TABLE IF EXISTS `llxas_societe_perentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_perentity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountancy_code_buy` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_perentity` (`fk_soc`,`entity`),
  KEY `idx_societe_perentity_fk_soc` (`fk_soc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_perentity`
--

LOCK TABLES `llxas_societe_perentity` WRITE;
/*!40000 ALTER TABLE `llxas_societe_perentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_perentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_prices`
--

DROP TABLE IF EXISTS `llxas_societe_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_prices` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `price_level` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_prices`
--

LOCK TABLES `llxas_societe_prices` WRITE;
/*!40000 ALTER TABLE `llxas_societe_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_remise`
--

DROP TABLE IF EXISTS `llxas_societe_remise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_remise` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_client` double(6,3) NOT NULL DEFAULT 0.000,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_remise`
--

LOCK TABLES `llxas_societe_remise` WRITE;
/*!40000 ALTER TABLE `llxas_societe_remise` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_remise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_remise_except`
--

DROP TABLE IF EXISTS `llxas_societe_remise_except`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_remise_except` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `tva_tx` double(6,3) NOT NULL DEFAULT 0.000,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fk_user` int(11) NOT NULL,
  `fk_facture_line` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_invoice_supplier_line` int(11) DEFAULT NULL,
  `fk_invoice_supplier` int(11) DEFAULT NULL,
  `fk_invoice_supplier_source` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `multicurrency_amount_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`),
  KEY `idx_societe_remise_except_discount_type` (`discount_type`),
  KEY `fk_soc_remise_fk_invoice_supplier_line` (`fk_invoice_supplier_line`),
  KEY `fk_societe_remise_fk_invoice_supplier_source` (`fk_invoice_supplier`),
  CONSTRAINT `fk_soc_remise_fk_facture_line` FOREIGN KEY (`fk_facture_line`) REFERENCES `llxas_facturedet` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_invoice_supplier_line` FOREIGN KEY (`fk_invoice_supplier_line`) REFERENCES `llxas_facture_fourn_det` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llxas_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llxas_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llxas_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier_source` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llxas_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_remise_except`
--

LOCK TABLES `llxas_societe_remise_except` WRITE;
/*!40000 ALTER TABLE `llxas_societe_remise_except` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_remise_except` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_remise_supplier`
--

DROP TABLE IF EXISTS `llxas_societe_remise_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_remise_supplier` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_supplier` double(6,3) NOT NULL DEFAULT 0.000,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_remise_supplier`
--

LOCK TABLES `llxas_societe_remise_supplier` WRITE;
/*!40000 ALTER TABLE `llxas_societe_remise_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_remise_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_societe_rib`
--

DROP TABLE IF EXISTS `llxas_societe_rib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_societe_rib` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ban',
  `label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban_prefix` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domiciliation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proprio` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_rib` smallint(6) NOT NULL DEFAULT 0,
  `rum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_rum` date DEFAULT NULL,
  `frstrecur` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT 'FRST',
  `last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_date_month` int(11) DEFAULT NULL,
  `exp_date_year` int(11) DEFAULT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` int(11) DEFAULT 0,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `max_total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `preapproval_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `stripe_card_ref` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ipaddress` varchar(68) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_rib` (`label`,`fk_soc`),
  KEY `llxas_societe_rib_fk_societe` (`fk_soc`),
  CONSTRAINT `llxas_societe_rib_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_societe_rib`
--

LOCK TABLES `llxas_societe_rib` WRITE;
/*!40000 ALTER TABLE `llxas_societe_rib` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_societe_rib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_socpeople`
--

DROP TABLE IF EXISTS `llxas_socpeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_socpeople` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civility` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `poste` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_perso` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_mobile` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialnetworks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabberid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snapchat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_email` smallint(6) NOT NULL DEFAULT 0,
  `priv` smallint(6) NOT NULL DEFAULT 0,
  `fk_prospectcontactlevel` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_stcommcontact` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canvas` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_fk_soc` (`fk_soc`),
  KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`),
  CONSTRAINT `fk_socpeople_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llxas_societe` (`rowid`),
  CONSTRAINT `fk_socpeople_user_creat_user_rowid` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_socpeople`
--

LOCK TABLES `llxas_socpeople` WRITE;
/*!40000 ALTER TABLE `llxas_socpeople` DISABLE KEYS */;
INSERT INTO `llxas_socpeople` (`rowid`, `datec`, `tms`, `fk_soc`, `entity`, `ref_ext`, `civility`, `lastname`, `firstname`, `address`, `zip`, `town`, `fk_departement`, `fk_pays`, `birthday`, `poste`, `phone`, `phone_perso`, `phone_mobile`, `fax`, `email`, `socialnetworks`, `jabberid`, `skype`, `twitter`, `facebook`, `linkedin`, `instagram`, `snapchat`, `googleplus`, `youtube`, `whatsapp`, `photo`, `no_email`, `priv`, `fk_prospectcontactlevel`, `fk_stcommcontact`, `fk_user_creat`, `fk_user_modif`, `note_private`, `note_public`, `default_lang`, `canvas`, `import_key`, `statut`) VALUES (1,'2022-11-09 13:31:03','2022-11-09 18:40:26',1,1,'','','Mat Sweet','','1210 Hayward Dr.','78411','Corpus Christie',835,11,NULL,'','','','','','','[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',0,0,'',0,1,1,'','',NULL,NULL,NULL,1),(2,'2022-11-09 16:48:30','2022-11-09 21:48:30',1,1,'','','Sweet','Jane','5684 Mount St','78411','Corpus Christie',835,11,NULL,'','','','','','jane@test.com','[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'',0,1,1,'','',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `llxas_socpeople` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_socpeople_extrafields`
--

DROP TABLE IF EXISTS `llxas_socpeople_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_socpeople_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_socpeople_extrafields`
--

LOCK TABLES `llxas_socpeople_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_socpeople_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_socpeople_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_stock_mouvement`
--

DROP TABLE IF EXISTS `llxas_stock_mouvement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_stock_mouvement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datem` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `type_mouvement` smallint(6) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventorycode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_origin` int(11) DEFAULT NULL,
  `origintype` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_projet` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_stock_mouvement`
--

LOCK TABLES `llxas_stock_mouvement` WRITE;
/*!40000 ALTER TABLE `llxas_stock_mouvement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_stock_mouvement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_subscription`
--

DROP TABLE IF EXISTS `llxas_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_subscription` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `fk_type` int(11) DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` datetime DEFAULT NULL,
  `subscription` double(24,8) DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_subscription` (`fk_adherent`,`dateadh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_subscription`
--

LOCK TABLES `llxas_subscription` WRITE;
/*!40000 ALTER TABLE `llxas_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_supplier_proposal`
--

DROP TABLE IF EXISTS `llxas_supplier_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_supplier_proposal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_main_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extraparams` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_supplier_proposal`
--

LOCK TABLES `llxas_supplier_proposal` WRITE;
/*!40000 ALTER TABLE `llxas_supplier_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_supplier_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_supplier_proposal_extrafields`
--

DROP TABLE IF EXISTS `llxas_supplier_proposal_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_supplier_proposal_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_supplier_proposal_extrafields`
--

LOCK TABLES `llxas_supplier_proposal_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_supplier_proposal_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_supplier_proposal_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_supplier_proposaldet`
--

DROP TABLE IF EXISTS `llxas_supplier_proposaldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_supplier_proposaldet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_supplier_proposal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `ref_fourn` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposaldet_fk_supplier_proposal` (`fk_supplier_proposal`),
  KEY `idx_supplier_proposaldet_fk_product` (`fk_product`),
  KEY `fk_supplier_proposaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_supplier_proposaldet_fk_supplier_proposal` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `llxas_supplier_proposal` (`rowid`),
  CONSTRAINT `fk_supplier_proposaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llxas_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_supplier_proposaldet`
--

LOCK TABLES `llxas_supplier_proposaldet` WRITE;
/*!40000 ALTER TABLE `llxas_supplier_proposaldet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_supplier_proposaldet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_supplier_proposaldet_extrafields`
--

DROP TABLE IF EXISTS `llxas_supplier_proposaldet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_supplier_proposaldet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_supplier_proposaldet_extrafields`
--

LOCK TABLES `llxas_supplier_proposaldet_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_supplier_proposaldet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_supplier_proposaldet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_takepos_floor_tables`
--

DROP TABLE IF EXISTS `llxas_takepos_floor_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_takepos_floor_tables` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leftpos` float DEFAULT NULL,
  `toppos` float DEFAULT NULL,
  `floor` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_takepos_floor_tables`
--

LOCK TABLES `llxas_takepos_floor_tables` WRITE;
/*!40000 ALTER TABLE `llxas_takepos_floor_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_takepos_floor_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_ticket`
--

DROP TABLE IF EXISTS `llxas_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_ticket` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `track_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `fk_project` int(11) DEFAULT 0,
  `origin_email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_assign` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_statut` int(11) DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `progress` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timing` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `severity_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `notify_tiers_at_create` tinyint(4) DEFAULT NULL,
  `email_msgid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ticket_track_id` (`track_id`),
  UNIQUE KEY `uk_ticket_ref` (`ref`,`entity`),
  KEY `idx_ticket_entity` (`entity`),
  KEY `idx_ticket_fk_soc` (`fk_soc`),
  KEY `idx_ticket_fk_user_assign` (`fk_user_assign`),
  KEY `idx_ticket_fk_project` (`fk_project`),
  KEY `idx_ticket_fk_statut` (`fk_statut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_ticket`
--

LOCK TABLES `llxas_ticket` WRITE;
/*!40000 ALTER TABLE `llxas_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_ticket_extrafields`
--

DROP TABLE IF EXISTS `llxas_ticket_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_ticket_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ticket_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_ticket_extrafields`
--

LOCK TABLES `llxas_ticket_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_ticket_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_ticket_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_tva`
--

DROP TABLE IF EXISTS `llxas_tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_tva` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) DEFAULT NULL,
  `num_payment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_tva`
--

LOCK TABLES `llxas_tva` WRITE;
/*!40000 ALTER TABLE `llxas_tva` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_tva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_user`
--

DROP TABLE IF EXISTS `llxas_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_int` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` smallint(6) DEFAULT 0,
  `employee` tinyint(4) DEFAULT 1,
  `fk_establishment` int(11) DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass_encoding` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_crypted` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass_temp` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civility` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `birth` date DEFAULT NULL,
  `job` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialnetworks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_socpeople` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_expense_validator` int(11) DEFAULT NULL,
  `fk_user_holiday_validator` int(11) DEFAULT NULL,
  `idpers1` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idpers2` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idpers3` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `datelastpassvalidation` datetime DEFAULT NULL,
  `datestartvalidity` datetime DEFAULT NULL,
  `dateendvalidity` datetime DEFAULT NULL,
  `iplastlogin` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ippreviouslogin` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `egroupware_id` int(11) DEFAULT NULL,
  `ldap_sid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 1,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_holiday` int(11) DEFAULT 0,
  `thm` double(24,8) DEFAULT NULL,
  `tjm` double(24,8) DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_range` int(11) DEFAULT NULL,
  `default_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_login` (`login`,`entity`),
  UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  UNIQUE KEY `uk_user_api_key` (`api_key`),
  KEY `idx_user_fk_societe` (`fk_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_user`
--

LOCK TABLES `llxas_user` WRITE;
/*!40000 ALTER TABLE `llxas_user` DISABLE KEYS */;
INSERT INTO `llxas_user` (`rowid`, `entity`, `ref_ext`, `ref_int`, `admin`, `employee`, `fk_establishment`, `datec`, `tms`, `fk_user_creat`, `fk_user_modif`, `login`, `pass_encoding`, `pass`, `pass_crypted`, `pass_temp`, `api_key`, `gender`, `civility`, `lastname`, `firstname`, `address`, `zip`, `town`, `fk_state`, `fk_country`, `birth`, `job`, `office_phone`, `office_fax`, `user_mobile`, `personal_mobile`, `email`, `personal_email`, `signature`, `socialnetworks`, `fk_soc`, `fk_socpeople`, `fk_member`, `fk_user`, `fk_user_expense_validator`, `fk_user_holiday_validator`, `idpers1`, `idpers2`, `idpers3`, `note_public`, `note`, `model_pdf`, `datelastlogin`, `datepreviouslogin`, `datelastpassvalidation`, `datestartvalidity`, `dateendvalidity`, `iplastlogin`, `ippreviouslogin`, `egroupware_id`, `ldap_sid`, `openid`, `statut`, `photo`, `lang`, `color`, `barcode`, `fk_barcode_type`, `accountancy_code`, `nb_holiday`, `thm`, `tjm`, `salary`, `salaryextra`, `dateemployment`, `dateemploymentend`, `weeklyhours`, `import_key`, `default_range`, `default_c_exp_tax_cat`, `fk_warehouse`) VALUES (1,0,NULL,NULL,1,1,0,'2021-11-10 12:55:49','2023-01-19 18:32:07',NULL,NULL,'admin',NULL,NULL,'$2y$10$fBFcRGc9yoLqncwA2fLf.OvLtlT14Hp8gbmIo0636xBHHV5cLY.0S',NULL,NULL,NULL,'','SuperAdmin','','','','',NULL,NULL,NULL,'','','','','','','','','[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'2023-02-07 14:52:27','2023-02-07 13:45:35',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL,'',NULL,0,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,NULL,NULL,1,1,0,'2022-09-30 13:16:55','2023-01-31 17:51:06',NULL,NULL,'ross',NULL,NULL,'$2y$10$A53Giyrt1ZzrAnPPKRYZIeS0IH5AsS9xAjpxS2ju78YUTq3UdtyBS',NULL,'dypk0xv7rb',NULL,'','Adams','Ross','','','',NULL,NULL,NULL,'','','','','','','','','[]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'2023-01-19 13:31:20','2023-01-09 12:49:37',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,1,NULL,NULL,'',NULL,0,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `llxas_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_user_alert`
--

DROP TABLE IF EXISTS `llxas_user_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_user_alert` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_user_alert`
--

LOCK TABLES `llxas_user_alert` WRITE;
/*!40000 ALTER TABLE `llxas_user_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_user_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_user_clicktodial`
--

DROP TABLE IF EXISTS `llxas_user_clicktodial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_user_clicktodial` (
  `fk_user` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pass` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poste` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_user_clicktodial`
--

LOCK TABLES `llxas_user_clicktodial` WRITE;
/*!40000 ALTER TABLE `llxas_user_clicktodial` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_user_clicktodial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_user_employment`
--

DROP TABLE IF EXISTS `llxas_user_employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_user_employment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_ext` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `job` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_employment` (`ref`,`entity`),
  KEY `fk_user_employment_fk_user` (`fk_user`),
  CONSTRAINT `fk_user_employment_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_user_employment`
--

LOCK TABLES `llxas_user_employment` WRITE;
/*!40000 ALTER TABLE `llxas_user_employment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_user_employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_user_extrafields`
--

DROP TABLE IF EXISTS `llxas_user_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_user_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_user_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_user_extrafields`
--

LOCK TABLES `llxas_user_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_user_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_user_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_user_param`
--

DROP TABLE IF EXISTS `llxas_user_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_user_param` (
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `param` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_user_param`
--

LOCK TABLES `llxas_user_param` WRITE;
/*!40000 ALTER TABLE `llxas_user_param` DISABLE KEYS */;
INSERT INTO `llxas_user_param` (`fk_user`, `entity`, `param`, `value`) VALUES (1,1,'MAIN_SELECTEDFIELDS_productlist','p.rowid,ef.manuty,p.label,p.ref,p.barcode,p.sellprice,p.desiredstock,p.stock,p.tosell,p.tobuy,');
/*!40000 ALTER TABLE `llxas_user_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_user_rib`
--

DROP TABLE IF EXISTS `llxas_user_rib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_user_rib` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_banque` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_guichet` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cle_rib` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban_prefix` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domiciliation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proprio` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_user_rib`
--

LOCK TABLES `llxas_user_rib` WRITE;
/*!40000 ALTER TABLE `llxas_user_rib` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_user_rib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_user_rights`
--

DROP TABLE IF EXISTS `llxas_user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_user_rights` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_rights` (`entity`,`fk_user`,`fk_id`),
  KEY `fk_user_rights_fk_user_user` (`fk_user`),
  CONSTRAINT `fk_user_rights_fk_user_user` FOREIGN KEY (`fk_user`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=1218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_user_rights`
--

LOCK TABLES `llxas_user_rights` WRITE;
/*!40000 ALTER TABLE `llxas_user_rights` DISABLE KEYS */;
INSERT INTO `llxas_user_rights` (`rowid`, `entity`, `fk_user`, `fk_id`) VALUES (982,1,1,11),(969,1,1,12),(972,1,1,13),(974,1,1,14),(976,1,1,15),(979,1,1,16),(983,1,1,19),(176,1,1,21),(169,1,1,22),(170,1,1,24),(171,1,1,25),(173,1,1,26),(175,1,1,27),(177,1,1,28),(568,1,1,31),(557,1,1,32),(561,1,1,34),(565,1,1,38),(569,1,1,39),(582,1,1,41),(575,1,1,42),(579,1,1,44),(583,1,1,45),(208,1,1,61),(205,1,1,62),(207,1,1,64),(209,1,1,67),(210,1,1,68),(211,1,1,69),(212,1,1,70),(920,1,1,81),(909,1,1,82),(912,1,1,84),(914,1,1,86),(916,1,1,87),(918,1,1,88),(921,1,1,89),(102,1,1,91),(99,1,1,92),(101,1,1,93),(103,1,1,94),(184,1,1,101),(180,1,1,102),(181,1,1,104),(182,1,1,105),(183,1,1,106),(185,1,1,109),(884,1,1,111),(865,1,1,112),(869,1,1,113),(873,1,1,114),(877,1,1,115),(881,1,1,116),(885,1,1,117),(1130,1,1,121),(1123,1,1,122),(1127,1,1,125),(1131,1,1,126),(592,1,1,141),(589,1,1,142),(593,1,1,144),(291,1,1,151),(288,1,1,152),(290,1,1,153),(292,1,1,154),(201,1,1,161),(194,1,1,162),(196,1,1,163),(198,1,1,164),(200,1,1,165),(202,1,1,167),(770,1,1,241),(767,1,1,242),(771,1,1,243),(1204,1,1,251),(1166,1,1,252),(1169,1,1,253),(1172,1,1,254),(1175,1,1,255),(1179,1,1,256),(1134,1,1,262),(1146,1,1,281),(1139,1,1,282),(1143,1,1,283),(1147,1,1,286),(784,1,1,300),(888,1,1,301),(890,1,1,302),(780,1,1,331),(777,1,1,332),(781,1,1,333),(1182,1,1,341),(1184,1,1,342),(1186,1,1,343),(1188,1,1,344),(1200,1,1,351),(1193,1,1,352),(1197,1,1,353),(1201,1,1,354),(1205,1,1,358),(1102,1,1,511),(1091,1,1,512),(1095,1,1,514),(1099,1,1,517),(1103,1,1,519),(658,1,1,520),(647,1,1,522),(651,1,1,524),(655,1,1,525),(659,1,1,527),(1116,1,1,531),(1109,1,1,532),(1113,1,1,534),(1117,1,1,538),(271,1,1,561),(268,1,1,562),(270,1,1,563),(272,1,1,564),(962,1,1,771),(939,1,1,772),(943,1,1,773),(947,1,1,775),(951,1,1,776),(955,1,1,777),(959,1,1,778),(963,1,1,779),(714,1,1,1001),(711,1,1,1002),(715,1,1,1003),(720,1,1,1004),(721,1,1,1005),(190,1,1,1101),(188,1,1,1102),(189,1,1,1104),(191,1,1,1109),(640,1,1,1121),(625,1,1,1122),(629,1,1,1123),(633,1,1,1124),(637,1,1,1125),(641,1,1,1126),(990,1,1,1181),(1018,1,1,1182),(995,1,1,1183),(998,1,1,1184),(1001,1,1,1185),(1005,1,1,1186),(1009,1,1,1187),(1015,1,1,1188),(1012,1,1,1189),(1019,1,1,1191),(792,1,1,1201),(793,1,1,1202),(1036,1,1,1231),(1025,1,1,1232),(1028,1,1,1233),(1031,1,1,1234),(1034,1,1,1235),(1037,1,1,1236),(788,1,1,1251),(986,1,1,1321),(988,1,1,1322),(924,1,1,1421),(846,1,1,2401),(843,1,1,2402),(847,1,1,2403),(856,1,1,2411),(853,1,1,2412),(857,1,1,2413),(860,1,1,2414),(932,1,1,2501),(929,1,1,2503),(933,1,1,2515),(1062,1,1,20001),(1043,1,1,20002),(1047,1,1,20003),(1055,1,1,20004),(1059,1,1,20005),(1063,1,1,20006),(1051,1,1,20007),(902,1,1,23001),(895,1,1,23002),(899,1,1,23003),(903,1,1,23004),(816,1,1,50401),(832,1,1,50411),(821,1,1,50412),(825,1,1,50414),(829,1,1,50415),(833,1,1,50418),(836,1,1,50420),(838,1,1,50430),(814,1,1,50440),(1160,1,1,56001),(1153,1,1,56002),(1157,1,1,56003),(1161,1,1,56004),(1066,1,1,59001),(1068,1,1,59002),(1070,1,1,59003),(1084,1,1,63001),(1077,1,1,63002),(1081,1,1,63003),(1085,1,1,63004),(1072,1,1,64001),(123,1,1,513001),(124,1,1,513002),(296,1,1,577888),(295,1,1,577889),(297,1,1,577890),(255,1,1,941601),(251,1,1,941602),(252,1,1,941603),(253,1,1,941604),(254,1,1,941605),(256,1,1,941606),(1214,1,1,1040910),(1211,1,1,1040911),(1215,1,1,1040912),(18,1,1,4000040),(19,1,1,4000041),(20,1,1,4000042),(21,1,1,4000043),(22,1,1,4000044),(23,1,1,4000045),(24,1,1,4000046),(25,1,1,4000047),(26,1,1,4000048),(27,1,1,4000049),(28,1,1,40000410),(29,1,1,40000411),(30,1,1,40000412),(31,1,1,40000413),(32,1,1,40000414),(33,1,1,40000415),(34,1,1,40000416),(35,1,1,40000417),(36,1,1,40000418),(37,1,1,40000419),(38,1,1,40000420),(39,1,1,40000421),(40,1,1,40000422),(41,1,1,40000423),(42,1,1,40000424),(43,1,1,40000425),(44,1,1,40000426),(45,1,1,40000427),(46,1,1,40000428),(47,1,1,40000434),(48,1,1,40000435),(49,1,1,40000436),(50,1,1,40000437),(51,1,1,40000438),(52,1,1,40000439),(53,1,1,40000440),(54,1,1,40000441),(55,1,1,40000442),(56,1,1,40000443),(57,1,1,40000444),(58,1,1,40000445),(59,1,1,40000446),(60,1,1,40000447),(61,1,1,40000448),(62,1,1,40000449),(63,1,1,40000450),(64,1,1,40000451),(65,1,1,40000452),(66,1,1,40000453),(67,1,1,40000454),(68,1,1,40000455),(69,1,1,40000456),(70,1,1,40000457),(71,1,1,40000458),(104,1,1,40000462),(812,1,1,40000465),(813,1,1,40000467),(748,1,1,125032002),(750,1,1,125032003),(752,1,1,125032004),(754,1,1,125032005),(756,1,1,125032006),(758,1,1,125032007),(760,1,1,125032008),(762,1,1,125032009),(984,1,2,11),(971,1,2,12),(973,1,2,13),(975,1,2,14),(977,1,2,15),(981,1,2,16),(985,1,2,19),(363,1,2,21),(364,1,2,22),(365,1,2,24),(366,1,2,25),(367,1,2,26),(368,1,2,27),(369,1,2,28),(570,1,2,31),(559,1,2,32),(563,1,2,34),(567,1,2,38),(571,1,2,39),(584,1,2,41),(577,1,2,42),(581,1,2,44),(585,1,2,45),(370,1,2,61),(371,1,2,62),(372,1,2,64),(373,1,2,67),(374,1,2,68),(375,1,2,69),(376,1,2,70),(922,1,2,81),(911,1,2,82),(913,1,2,84),(915,1,2,86),(917,1,2,87),(919,1,2,88),(923,1,2,89),(384,1,2,91),(385,1,2,92),(386,1,2,93),(387,1,2,94),(388,1,2,101),(389,1,2,102),(390,1,2,104),(391,1,2,105),(392,1,2,106),(393,1,2,109),(886,1,2,111),(867,1,2,112),(871,1,2,113),(875,1,2,114),(879,1,2,115),(883,1,2,116),(887,1,2,117),(1132,1,2,121),(1125,1,2,122),(1129,1,2,125),(1133,1,2,126),(594,1,2,141),(591,1,2,142),(595,1,2,144),(405,1,2,151),(406,1,2,152),(407,1,2,153),(408,1,2,154),(409,1,2,161),(410,1,2,162),(411,1,2,163),(412,1,2,164),(413,1,2,165),(414,1,2,167),(772,1,2,241),(769,1,2,242),(773,1,2,243),(1206,1,2,251),(1167,1,2,252),(1171,1,2,253),(1173,1,2,254),(1177,1,2,255),(1181,1,2,256),(1135,1,2,262),(1148,1,2,281),(1141,1,2,282),(1145,1,2,283),(1149,1,2,286),(785,1,2,300),(889,1,2,301),(891,1,2,302),(782,1,2,331),(779,1,2,332),(783,1,2,333),(1183,1,2,341),(1185,1,2,342),(1187,1,2,343),(1189,1,2,344),(1202,1,2,351),(1195,1,2,352),(1199,1,2,353),(1203,1,2,354),(1207,1,2,358),(1104,1,2,511),(1093,1,2,512),(1097,1,2,514),(1101,1,2,517),(1105,1,2,519),(660,1,2,520),(649,1,2,522),(653,1,2,524),(657,1,2,525),(661,1,2,527),(1118,1,2,531),(1111,1,2,532),(1115,1,2,534),(1119,1,2,538),(440,1,2,561),(441,1,2,562),(442,1,2,563),(443,1,2,564),(964,1,2,771),(941,1,2,772),(945,1,2,773),(949,1,2,775),(953,1,2,776),(957,1,2,777),(961,1,2,778),(965,1,2,779),(716,1,2,1001),(713,1,2,1002),(717,1,2,1003),(722,1,2,1004),(723,1,2,1005),(452,1,2,1101),(453,1,2,1102),(454,1,2,1104),(455,1,2,1109),(642,1,2,1121),(627,1,2,1122),(631,1,2,1123),(635,1,2,1124),(639,1,2,1125),(643,1,2,1126),(991,1,2,1181),(1020,1,2,1182),(997,1,2,1183),(999,1,2,1184),(1003,1,2,1185),(1007,1,2,1186),(1011,1,2,1187),(1017,1,2,1188),(1013,1,2,1189),(1021,1,2,1191),(794,1,2,1201),(795,1,2,1202),(1038,1,2,1231),(1027,1,2,1232),(1029,1,2,1233),(1033,1,2,1234),(1035,1,2,1235),(1039,1,2,1236),(789,1,2,1251),(987,1,2,1321),(989,1,2,1322),(925,1,2,1421),(848,1,2,2401),(845,1,2,2402),(849,1,2,2403),(858,1,2,2411),(855,1,2,2412),(859,1,2,2413),(861,1,2,2414),(934,1,2,2501),(931,1,2,2503),(935,1,2,2515),(1064,1,2,20001),(1045,1,2,20002),(1049,1,2,20003),(1057,1,2,20004),(1061,1,2,20005),(1065,1,2,20006),(1053,1,2,20007),(904,1,2,23001),(897,1,2,23002),(901,1,2,23003),(905,1,2,23004),(817,1,2,50401),(834,1,2,50411),(823,1,2,50412),(827,1,2,50414),(831,1,2,50415),(835,1,2,50418),(837,1,2,50420),(839,1,2,50430),(815,1,2,50440),(1162,1,2,56001),(1155,1,2,56002),(1159,1,2,56003),(1163,1,2,56004),(1067,1,2,59001),(1069,1,2,59002),(1071,1,2,59003),(1086,1,2,63001),(1079,1,2,63002),(1083,1,2,63003),(1087,1,2,63004),(1073,1,2,64001),(486,1,2,513001),(487,1,2,513002),(488,1,2,577888),(489,1,2,577889),(490,1,2,577890),(491,1,2,941601),(492,1,2,941602),(493,1,2,941603),(494,1,2,941604),(495,1,2,941605),(496,1,2,941606),(1216,1,2,1040910),(1213,1,2,1040911),(1217,1,2,1040912),(497,1,2,4000040),(498,1,2,4000041),(499,1,2,4000042),(500,1,2,4000043),(501,1,2,4000044),(502,1,2,4000045),(503,1,2,4000046),(504,1,2,4000047),(505,1,2,4000048),(506,1,2,4000049),(507,1,2,40000410),(508,1,2,40000411),(509,1,2,40000412),(510,1,2,40000413),(511,1,2,40000414),(512,1,2,40000415),(513,1,2,40000416),(514,1,2,40000417),(515,1,2,40000418),(516,1,2,40000419),(517,1,2,40000420),(518,1,2,40000421),(519,1,2,40000422),(520,1,2,40000423),(521,1,2,40000424),(522,1,2,40000425),(523,1,2,40000426),(524,1,2,40000427),(525,1,2,40000428),(526,1,2,40000434),(527,1,2,40000435),(528,1,2,40000436),(529,1,2,40000437),(530,1,2,40000438),(531,1,2,40000439),(532,1,2,40000440),(533,1,2,40000441),(534,1,2,40000442),(535,1,2,40000443),(536,1,2,40000444),(537,1,2,40000445),(538,1,2,40000446),(539,1,2,40000447),(540,1,2,40000448),(541,1,2,40000449),(542,1,2,40000450),(543,1,2,40000451),(544,1,2,40000452),(545,1,2,40000453),(546,1,2,40000454),(547,1,2,40000455),(548,1,2,40000456),(549,1,2,40000457),(550,1,2,40000458),(551,1,2,40000460),(552,1,2,40000461),(553,1,2,40000462),(749,1,2,125032002),(751,1,2,125032003),(753,1,2,125032004),(755,1,2,125032005),(757,1,2,125032006),(759,1,2,125032007),(761,1,2,125032008),(763,1,2,125032009);
/*!40000 ALTER TABLE `llxas_user_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_usergroup`
--

DROP TABLE IF EXISTS `llxas_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_usergroup` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_usergroup`
--

LOCK TABLES `llxas_usergroup` WRITE;
/*!40000 ALTER TABLE `llxas_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_usergroup_extrafields`
--

DROP TABLE IF EXISTS `llxas_usergroup_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_usergroup_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_usergroup_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_usergroup_extrafields`
--

LOCK TABLES `llxas_usergroup_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_usergroup_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_usergroup_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_usergroup_rights`
--

DROP TABLE IF EXISTS `llxas_usergroup_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_usergroup_rights` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_usergroup` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_rights` (`entity`,`fk_usergroup`,`fk_id`),
  KEY `fk_usergroup_rights_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_rights_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llxas_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_usergroup_rights`
--

LOCK TABLES `llxas_usergroup_rights` WRITE;
/*!40000 ALTER TABLE `llxas_usergroup_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_usergroup_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_usergroup_user`
--

DROP TABLE IF EXISTS `llxas_usergroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_usergroup_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_usergroup` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_user` (`entity`,`fk_user`,`fk_usergroup`),
  KEY `fk_usergroup_user_fk_user` (`fk_user`),
  KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llxas_user` (`rowid`),
  CONSTRAINT `fk_usergroup_user_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llxas_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_usergroup_user`
--

LOCK TABLES `llxas_usergroup_user` WRITE;
/*!40000 ALTER TABLE `llxas_usergroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_usergroup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_website`
--

DROP TABLE IF EXISTS `llxas_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_website` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type_container` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maincolor` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maincolorbis` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otherlang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `fk_default_home` int(11) DEFAULT NULL,
  `use_manifest` int(11) DEFAULT NULL,
  `virtualhost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastaccess` datetime DEFAULT NULL,
  `pageviews_month` bigint(20) unsigned DEFAULT 0,
  `pageviews_total` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_website_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_website`
--

LOCK TABLES `llxas_website` WRITE;
/*!40000 ALTER TABLE `llxas_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_website_extrafields`
--

DROP TABLE IF EXISTS `llxas_website_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_website_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_website_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_website_extrafields`
--

LOCK TABLES `llxas_website_extrafields` WRITE;
/*!40000 ALTER TABLE `llxas_website_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_website_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_website_page`
--

DROP TABLE IF EXISTS `llxas_website_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_website_page` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_website` int(11) NOT NULL,
  `type_container` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `pageurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aliasalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_page` int(11) DEFAULT NULL,
  `allowed_in_frames` int(11) DEFAULT 0,
  `htmlheader` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `grabbed_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `author_alias` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_object` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_website_page_url` (`fk_website`,`pageurl`),
  CONSTRAINT `fk_website_page_website` FOREIGN KEY (`fk_website`) REFERENCES `llxas_website` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_website_page`
--

LOCK TABLES `llxas_website_page` WRITE;
/*!40000 ALTER TABLE `llxas_website_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_website_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_workstation_workstation`
--

DROP TABLE IF EXISTS `llxas_workstation_workstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_workstation_workstation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(PROV)',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_public` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `note_private` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `nb_operators_required` int(11) DEFAULT NULL,
  `thm_operator_estimated` double DEFAULT NULL,
  `thm_machine_estimated` double DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_workstation_workstation_rowid` (`rowid`),
  KEY `idx_workstation_workstation_ref` (`ref`),
  KEY `fk_workstation_workstation_fk_user_creat` (`fk_user_creat`),
  KEY `idx_workstation_workstation_status` (`status`),
  CONSTRAINT `fk_workstation_workstation_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llxas_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_workstation_workstation`
--

LOCK TABLES `llxas_workstation_workstation` WRITE;
/*!40000 ALTER TABLE `llxas_workstation_workstation` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_workstation_workstation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_workstation_workstation_resource`
--

DROP TABLE IF EXISTS `llxas_workstation_workstation_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_workstation_workstation_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_resource` int(11) DEFAULT NULL,
  `fk_workstation` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_workstation_workstation_resource`
--

LOCK TABLES `llxas_workstation_workstation_resource` WRITE;
/*!40000 ALTER TABLE `llxas_workstation_workstation_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_workstation_workstation_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_workstation_workstation_usergroup`
--

DROP TABLE IF EXISTS `llxas_workstation_workstation_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_workstation_workstation_usergroup` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_workstation` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_workstation_workstation_usergroup`
--

LOCK TABLES `llxas_workstation_workstation_usergroup` WRITE;
/*!40000 ALTER TABLE `llxas_workstation_workstation_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_workstation_workstation_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llxas_zapier_hook`
--

DROP TABLE IF EXISTS `llxas_zapier_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llxas_zapier_hook` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llxas_zapier_hook`
--

LOCK TABLES `llxas_zapier_hook` WRITE;
/*!40000 ALTER TABLE `llxas_zapier_hook` DISABLE KEYS */;
/*!40000 ALTER TABLE `llxas_zapier_hook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-07 14:52:50
