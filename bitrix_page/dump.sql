-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sevostjanov
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB-1:10.6.11+maria~deb10

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
-- Table structure for table `b_admin_notify`
--

DROP TABLE IF EXISTS `b_admin_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_admin_notify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `MESSAGE` text DEFAULT NULL,
  `ENABLE_CLOSE` char(1) DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_admin_notify`
--

LOCK TABLES `b_admin_notify` WRITE;
/*!40000 ALTER TABLE `b_admin_notify` DISABLE KEYS */;
INSERT INTO `b_admin_notify` VALUES (36,'MAIN','SITE_CHECKER','Обнаружены ошибки в работе сайта. <a href=\"/bitrix/admin/site_checker.php?lang=ru&start_test=Y\">Проверить и исправить.</a>','Y','N','M');
/*!40000 ALTER TABLE `b_admin_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_admin_notify_lang`
--

DROP TABLE IF EXISTS `b_admin_notify_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `MESSAGE` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_admin_notify_lang`
--

LOCK TABLES `b_admin_notify_lang` WRITE;
/*!40000 ALTER TABLE `b_admin_notify_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_agent`
--

DROP TABLE IF EXISTS `b_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_agent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `NAME` text DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(11) DEFAULT 86400,
  `IS_PERIOD` char(1) DEFAULT 'Y',
  `USER_ID` int(11) DEFAULT NULL,
  `RUNNING` char(1) NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100)),
  KEY `ix_agent_act_period_next_exec` (`ACTIVE`,`IS_PERIOD`,`NEXT_EXEC`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_agent`
--

LOCK TABLES `b_agent` WRITE;
/*!40000 ALTER TABLE `b_agent` DISABLE KEYS */;
INSERT INTO `b_agent` VALUES (1,'main',100,'\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();','Y','2024-03-24 12:37:41','2024-03-24 12:38:41',NULL,60,'N',NULL,'N',0),(2,'main',100,'CCaptchaAgent::DeleteOldCaptcha(3600);','Y','2024-03-24 12:37:41','2024-03-24 13:37:41',NULL,3600,'N',NULL,'N',0),(3,'main',100,'CSiteCheckerTest::CommonTest();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(4,'main',100,'CEvent::CleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(5,'main',100,'CUser::CleanUpHitAuthAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(6,'main',100,'CUndo::CleanUpOld();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(7,'main',100,'CUserCounter::DeleteOld();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(8,'main',100,'\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(9,'main',100,'CUser::AuthActionsCleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(10,'main',100,'CUser::CleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(11,'main',100,'CUser::DeactivateAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(12,'main',100,'CEventLog::CleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(14,'clouds',100,'CCloudStorage::CleanUp();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(15,'forum',100,'CForumStat::CleanUp();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(16,'forum',100,'CForumFiles::CleanUp();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(17,'landing',100,'Bitrix\\Landing\\Agent::clearRecycle();','Y','2024-03-24 12:37:41','2024-03-24 14:37:41',NULL,7200,'N',NULL,'N',0),(18,'landing',100,'Bitrix\\Landing\\Agent::clearFiles(30);','Y','2024-03-24 12:37:41','2024-03-24 13:37:41',NULL,3600,'N',NULL,'N',0),(19,'landing',100,'Bitrix\\Landing\\Agent::sendRestStatistic();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(20,'landing',100,'Bitrix\\Landing\\Agent::clearTempFiles();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(23,'messageservice',100,'\\Bitrix\\MessageService\\Queue::cleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-24 00:00:00',NULL,86400,'Y',NULL,'N',0),(24,'messageservice',100,'\\Bitrix\\MessageService\\IncomingMessage::cleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-24 00:00:00',NULL,86400,'Y',NULL,'N',0),(25,'rest',100,'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(26,'rest',100,'\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(27,'rest',100,'\\Bitrix\\Rest\\LogTable::cleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(28,'rest',100,'\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(29,'rest',100,'\\Bitrix\\Rest\\UsageStatTable::sendAgent();','Y','2024-03-24 12:37:41','2024-03-24 13:37:41',NULL,3600,'N',NULL,'N',0),(30,'rest',100,'\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-24 13:37:41',NULL,3600,'N',NULL,'N',0),(31,'rest',100,'\\Bitrix\\Rest\\Marketplace\\Notification::checkAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(32,'rest',100,'\\Bitrix\\Rest\\Marketplace\\Immune::load();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(33,'rest',100,'\\Bitrix\\Rest\\Configuration\\Structure::clearContentAgent();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(34,'rest',100,'\\Bitrix\\Rest\\Helper::recoveryAgents();','Y','2024-03-24 12:37:41','2024-03-31 12:37:41',NULL,604800,'N',NULL,'N',0),(35,'search',10,'CSearchSuggest::CleanUpAgent();','Y','2024-03-24 12:37:42','2024-03-25 12:37:42',NULL,86400,'N',NULL,'N',0),(36,'search',10,'CSearchStatistic::CleanUpAgent();','Y','2024-03-24 12:37:42','2024-03-25 12:37:42',NULL,86400,'N',NULL,'N',0),(37,'security',100,'CSecuritySession::CleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-24 13:07:41',NULL,1800,'N',NULL,'N',0),(38,'security',100,'CSecurityIPRule::CleanUpAgent();','Y','2024-03-24 12:37:41','2024-03-24 13:37:41',NULL,3600,'N',NULL,'N',0),(39,'seo',100,'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();','Y','2024-03-24 12:37:41','2024-03-24 13:37:41',NULL,3600,'N',NULL,'N',0),(40,'seo',100,'Bitrix\\Seo\\Adv\\LogTable::clean();','Y','2024-03-24 12:37:41','2024-03-25 12:37:41',NULL,86400,'N',NULL,'N',0),(41,'seo',100,'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();','Y','2024-03-24 12:37:41','2024-03-24 13:37:41',NULL,3600,'N',NULL,'N',0),(42,'subscribe',100,'CSubscription::CleanUp();','Y','2024-03-24 12:37:41','2024-03-24 03:00:00',NULL,86400,'Y',NULL,'N',0),(43,'ui',100,'\\Bitrix\\UI\\FileUploader\\TempFileAgent::clearOldRecords();','Y','2024-03-24 12:37:42','2024-03-24 13:07:42',NULL,1800,'N',NULL,'N',0),(152,'main',100,'\\Bitrix\\Main\\Data\\CacheEngineFiles::delayedDelete(26);','Y','2024-03-24 12:37:42','2024-03-21 00:00:22',NULL,1,'Y',NULL,'N',0);
/*!40000 ALTER TABLE `b_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_app_password`
--

DROP TABLE IF EXISTS `b_app_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DIGEST_PASSWORD` varchar(255) NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `SYSCOMMENT` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_app_password`
--

LOCK TABLES `b_app_password` WRITE;
/*!40000 ALTER TABLE `b_app_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_app_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_b24connector_button_site`
--

DROP TABLE IF EXISTS `b_b24connector_button_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_b24connector_button_site` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUTTON_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BUTTON_ID` (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_b24connector_button_site`
--

LOCK TABLES `b_b24connector_button_site` WRITE;
/*!40000 ALTER TABLE `b_b24connector_button_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_b24connector_button_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_b24connector_buttons`
--

DROP TABLE IF EXISTS `b_b24connector_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SCRIPT` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_b24connector_buttons`
--

LOCK TABLES `b_b24connector_buttons` WRITE;
/*!40000 ALTER TABLE `b_b24connector_buttons` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_b24connector_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_bitrixcloud_option`
--

DROP TABLE IF EXISTS `b_bitrixcloud_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) DEFAULT NULL,
  `PARAM_VALUE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_bitrixcloud_option`
--

LOCK TABLES `b_bitrixcloud_option` WRITE;
/*!40000 ALTER TABLE `b_bitrixcloud_option` DISABLE KEYS */;
INSERT INTO `b_bitrixcloud_option` VALUES (1,'backup_quota',0,'0','0'),(2,'backup_total_size',0,'0','0'),(3,'backup_last_backup_time',0,'0','1707304836'),(4,'monitoring_expire_time',0,'0','1711013285');
/*!40000 ALTER TABLE `b_bitrixcloud_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog`
--

DROP TABLE IF EXISTS `b_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  `REAL_URL` varchar(255) DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) NOT NULL DEFAULT 'N',
  `EDITOR_USE_FONT` char(1) DEFAULT 'N',
  `EDITOR_USE_LINK` char(1) DEFAULT 'N',
  `EDITOR_USE_IMAGE` char(1) DEFAULT 'N',
  `EDITOR_USE_VIDEO` char(1) DEFAULT 'N',
  `EDITOR_USE_FORMAT` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog`
--

LOCK TABLES `b_blog` WRITE;
/*!40000 ALTER TABLE `b_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_category`
--

DROP TABLE IF EXISTS `b_blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_category`
--

LOCK TABLES `b_blog_category` WRITE;
/*!40000 ALTER TABLE `b_blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_comment`
--

DROP TABLE IF EXISTS `b_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) DEFAULT NULL,
  `AUTHOR_IP` varchar(20) DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `POST_TEXT` text NOT NULL,
  `PUBLISH_STATUS` char(1) NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) DEFAULT NULL,
  `SHARE_DEST` text DEFAULT NULL,
  `PATH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_4` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_comment`
--

LOCK TABLES `b_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_group`
--

DROP TABLE IF EXISTS `b_blog_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_group`
--

LOCK TABLES `b_blog_group` WRITE;
/*!40000 ALTER TABLE `b_blog_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_image`
--

DROP TABLE IF EXISTS `b_blog_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT 0,
  `BLOG_ID` int(11) NOT NULL DEFAULT 0,
  `POST_ID` int(11) NOT NULL DEFAULT 0,
  `USER_ID` int(11) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `TITLE` varchar(255) DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT 0,
  `IS_COMMENT` varchar(1) NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_image`
--

LOCK TABLES `b_blog_image` WRITE;
/*!40000 ALTER TABLE `b_blog_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post`
--

DROP TABLE IF EXISTS `b_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text DEFAULT NULL,
  `PREVIEW_TEXT_TYPE` char(4) NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` mediumtext NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `PUBLISH_STATUS` char(1) NOT NULL DEFAULT 'P',
  `CATEGORY_ID` varchar(255) DEFAULT NULL,
  `ATRIBUTE` varchar(255) DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT 0,
  `NUM_COMMENTS_ALL` int(11) NOT NULL DEFAULT 0,
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT 0,
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `MICRO` char(1) NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) DEFAULT NULL,
  `HAS_PROPS` varchar(1) DEFAULT NULL,
  `HAS_TAGS` varchar(1) DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) DEFAULT NULL,
  `SEO_TITLE` varchar(255) DEFAULT NULL,
  `SEO_TAGS` varchar(255) DEFAULT NULL,
  `SEO_DESCRIPTION` text DEFAULT NULL,
  `BACKGROUND_CODE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post`
--

LOCK TABLES `b_blog_post` WRITE;
/*!40000 ALTER TABLE `b_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post_category`
--

DROP TABLE IF EXISTS `b_blog_post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post_category`
--

LOCK TABLES `b_blog_post_category` WRITE;
/*!40000 ALTER TABLE `b_blog_post_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_post_param`
--

DROP TABLE IF EXISTS `b_blog_post_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_post_param`
--

LOCK TABLES `b_blog_post_param` WRITE;
/*!40000 ALTER TABLE `b_blog_post_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_site_path`
--

DROP TABLE IF EXISTS `b_blog_site_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `PATH` varchar(255) NOT NULL,
  `TYPE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_site_path`
--

LOCK TABLES `b_blog_site_path` WRITE;
/*!40000 ALTER TABLE `b_blog_site_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_site_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_socnet`
--

DROP TABLE IF EXISTS `b_blog_socnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_socnet`
--

LOCK TABLES `b_blog_socnet` WRITE;
/*!40000 ALTER TABLE `b_blog_socnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_socnet_rights`
--

DROP TABLE IF EXISTS `b_blog_socnet_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`),
  KEY `IX_BLOG_SR_2` (`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_socnet_rights`
--

LOCK TABLES `b_blog_socnet_rights` WRITE;
/*!40000 ALTER TABLE `b_blog_socnet_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_trackback`
--

DROP TABLE IF EXISTS `b_blog_trackback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `PREVIEW_TEXT` text NOT NULL,
  `BLOG_NAME` varchar(255) DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_trackback`
--

LOCK TABLES `b_blog_trackback` WRITE;
/*!40000 ALTER TABLE `b_blog_trackback` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_trackback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user`
--

DROP TABLE IF EXISTS `b_blog_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user`
--

LOCK TABLES `b_blog_user` WRITE;
/*!40000 ALTER TABLE `b_blog_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user2blog`
--

DROP TABLE IF EXISTS `b_blog_user2blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user2blog`
--

LOCK TABLES `b_blog_user2blog` WRITE;
/*!40000 ALTER TABLE `b_blog_user2blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user2user_group`
--

DROP TABLE IF EXISTS `b_blog_user2user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user2user_group`
--

LOCK TABLES `b_blog_user2user_group` WRITE;
/*!40000 ALTER TABLE `b_blog_user2user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user_group`
--

DROP TABLE IF EXISTS `b_blog_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user_group`
--

LOCK TABLES `b_blog_user_group` WRITE;
/*!40000 ALTER TABLE `b_blog_user_group` DISABLE KEYS */;
INSERT INTO `b_blog_user_group` VALUES (1,NULL,'all'),(2,NULL,'registered');
/*!40000 ALTER TABLE `b_blog_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_blog_user_group_perms`
--

DROP TABLE IF EXISTS `b_blog_user_group_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_blog_user_group_perms`
--

LOCK TABLES `b_blog_user_group_perms` WRITE;
/*!40000 ALTER TABLE `b_blog_user_group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user_group_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_cache_tag`
--

DROP TABLE IF EXISTS `b_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_cache_tag` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) DEFAULT NULL,
  `CACHE_SALT` char(4) DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) DEFAULT NULL,
  `TAG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_cache_tag`
--

LOCK TABLES `b_cache_tag` WRITE;
/*!40000 ALTER TABLE `b_cache_tag` DISABLE KEYS */;
INSERT INTO `b_cache_tag` VALUES (2,NULL,NULL,'2:1711273062','**'),(11,'s1','/e25','/s1/bitrix/furniture.catalog.index/e25','iblock_id_3'),(17,'s1','/35f','landing/blocks','landing_blocks'),(25,'s1','/6d1','/s1/bitrix/catalog.section','iblock_id_3'),(148,'s1','/7d3','/s1/bitrix/furniture.vacancies/7d3','iblock_id_4'),(236,'s1','/1a5','/s1/bitrix/news.list/1a5','iblock_id_3'),(245,'s1','/e25','/s1/bitrix/news.list/06f','iblock_id_17'),(246,'s1','/1a5','/s1/bitrix/news.list/1a5','iblock_id_17'),(262,'s1','/7a8','/s1/bitrix/news.list/7a8','iblock_id_18'),(280,'s1','/fc1','/s1/bitrix/news.list/fc1','iblock_id_1'),(281,'s1','/fc1','/s1/bitrix/news.detail/fc1','iblock_id_1'),(302,'s1','/a35','/s1/bitrix/news.list/a35','iblock_id_17'),(311,'s1','/be5','/s1/bitrix/catalog.section.list/be5','iblock_id_2'),(312,'s1','/be5','/s1/bitrix/catalog.top','iblock_id_2'),(313,'s1','/14b','/s1/bitrix/catalog.element/14b','iblock_id_2'),(314,'s1','/b13','/s1/bitrix/menu.sections/b13','iblock_id_2'),(315,'s1','/055','/s1/bitrix/catalog.element/055','iblock_id_2'),(316,'s1','/f78','/s1/bitrix/menu.sections/f78','iblock_id_2'),(318,'s1','/a51','/s1/bitrix/menu.sections/a51','iblock_id_2'),(320,'s1','/f2f','/s1/bitrix/catalog.section.list/f2f','iblock_id_2'),(321,'s1','/f2f','/s1/bitrix/catalog.section','iblock_id_2'),(322,'s1','/e4d','/s1/bitrix/catalog.element/e4d','iblock_id_2'),(323,'s1','/51a','/s1/bitrix/menu.sections/51a','iblock_id_2'),(324,'s1','/7a2','/s1/bitrix/menu.sections/7a2','iblock_id_2'),(328,'s1','/9a6','/s1/bitrix/catalog.section.list/9a6','iblock_id_2'),(329,'s1','/9a6','/s1/bitrix/catalog.section','iblock_id_2'),(332,'s1','/33a','/s1/bitrix/catalog.section.list/33a','iblock_id_2'),(333,'s1','/33a','/s1/bitrix/catalog.section','iblock_id_2'),(336,'s1','/78c','/s1/bitrix/catalog.element/78c','iblock_id_2'),(337,'s1','/4c0','/s1/bitrix/catalog.section.list/4c0','iblock_id_2'),(338,'s1','/4c0','/s1/bitrix/catalog.section','iblock_id_2'),(339,'s1','/310','/s1/bitrix/menu.sections/310','iblock_id_2'),(340,'s1','/96a','/s1/bitrix/menu.sections/96a','iblock_id_2'),(356,'*','*','/bitrix/managed_cache/MYSQL/b_undo.~110625','*'),(357,'*','*','/bitrix/managed_cache/MYSQL/orm_b_user_auth_action.~251434','*');
/*!40000 ALTER TABLE `b_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_captcha`
--

DROP TABLE IF EXISTS `b_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) NOT NULL,
  `CODE` varchar(20) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_captcha`
--

LOCK TABLES `b_captcha` WRITE;
/*!40000 ALTER TABLE `b_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_checklist`
--

DROP TABLE IF EXISTS `b_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) DEFAULT NULL,
  `TESTER` varchar(255) DEFAULT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext DEFAULT NULL,
  `REPORT_COMMENT` text DEFAULT NULL,
  `REPORT` char(1) DEFAULT 'Y',
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) DEFAULT 'N',
  `HIDDEN` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_checklist`
--

LOCK TABLES `b_checklist` WRITE;
/*!40000 ALTER TABLE `b_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_copy_queue`
--

DROP TABLE IF EXISTS `b_clouds_copy_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_copy_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `OP` char(1) NOT NULL,
  `SOURCE_BUCKET_ID` int(11) NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) NOT NULL,
  `TARGET_BUCKET_ID` int(11) NOT NULL,
  `TARGET_FILE_PATH` varchar(500) NOT NULL,
  `FILE_SIZE` int(11) NOT NULL DEFAULT -1,
  `FILE_POS` int(11) NOT NULL DEFAULT 0,
  `FAIL_COUNTER` int(11) NOT NULL DEFAULT 0,
  `STATUS` char(1) NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_copy_queue`
--

LOCK TABLES `b_clouds_copy_queue` WRITE;
/*!40000 ALTER TABLE `b_clouds_copy_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_copy_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_delete_queue`
--

DROP TABLE IF EXISTS `b_clouds_delete_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_delete_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_delete_queue`
--

LOCK TABLES `b_clouds_delete_queue` WRITE;
/*!40000 ALTER TABLE `b_clouds_delete_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_delete_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_bucket`
--

DROP TABLE IF EXISTS `b_clouds_file_bucket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) DEFAULT 'Y',
  `SORT` int(11) DEFAULT 500,
  `READ_ONLY` char(1) DEFAULT 'N',
  `SERVICE_ID` varchar(50) DEFAULT NULL,
  `BUCKET` varchar(63) DEFAULT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `CNAME` varchar(100) DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT 0,
  `FILE_SIZE` double DEFAULT 0,
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) DEFAULT NULL,
  `SETTINGS` text DEFAULT NULL,
  `FILE_RULES` text DEFAULT NULL,
  `FAILOVER_ACTIVE` char(1) DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int(11) DEFAULT NULL,
  `FAILOVER_COPY` char(1) DEFAULT 'N',
  `FAILOVER_DELETE` char(1) DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_bucket`
--

LOCK TABLES `b_clouds_file_bucket` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_bucket` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_bucket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_hash`
--

DROP TABLE IF EXISTS `b_clouds_file_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_hash` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(760) NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FILE_MTIME` datetime DEFAULT NULL,
  `FILE_HASH` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_file_hash` (`BUCKET_ID`,`FILE_PATH`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_hash`
--

LOCK TABLES `b_clouds_file_hash` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_resize`
--

DROP TABLE IF EXISTS `b_clouds_file_resize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ERROR_CODE` char(1) NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text DEFAULT NULL,
  `FROM_PATH` varchar(500) DEFAULT NULL,
  `TO_PATH` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_resize`
--

LOCK TABLES `b_clouds_file_resize` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_resize` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_resize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_save`
--

DROP TABLE IF EXISTS `b_clouds_file_save`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_save` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `BUCKET_ID` int(11) NOT NULL,
  `SUBDIR` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_save`
--

LOCK TABLES `b_clouds_file_save` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_save` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_save` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_clouds_file_upload`
--

DROP TABLE IF EXISTS `b_clouds_file_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FILE_PATH` varchar(500) NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `TMP_FILE` varchar(500) DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_clouds_file_upload`
--

LOCK TABLES `b_clouds_file_upload` WRITE;
/*!40000 ALTER TABLE `b_clouds_file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_component_params`
--

DROP TABLE IF EXISTS `b_component_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `COMPONENT_NAME` varchar(255) NOT NULL,
  `TEMPLATE_NAME` varchar(255) DEFAULT NULL,
  `REAL_PATH` varchar(255) NOT NULL,
  `SEF_MODE` char(1) NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_component_params`
--

LOCK TABLES `b_component_params` WRITE;
/*!40000 ALTER TABLE `b_component_params` DISABLE KEYS */;
INSERT INTO `b_component_params` VALUES (49,'s1','bitrix:main.include','.default','/bitrix/templates/inner/header.php','N',NULL,1191,1686,'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"file\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";s:4:\"PATH\";s:17:\"/include/logo.php\";}'),(50,'s1','bitrix:main.include','.default','/bitrix/templates/inner/header.php','N',NULL,1801,2296,'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"file\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";s:4:\"PATH\";s:18:\"/include/phone.php\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";}'),(51,'s1','bitrix:menu','top_multi1','/bitrix/templates/inner/header.php','N',NULL,3959,4572,'a:10:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"2\";s:19:\"MENU_CACHE_GET_VARS\";a:1:{i:0;s:0:\"\";}s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"N\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:7:\"USE_EXT\";s:1:\"N\";}'),(52,'s1','bitrix:breadcrumb','nav','/bitrix/templates/inner/header.php','N',NULL,4642,5069,'a:3:{s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:2:\"kv\";s:10:\"START_FROM\";s:1:\"0\";}'),(53,'s1','bitrix:menu','vertical_multilevel','/bitrix/templates/inner/footer.php','N',NULL,103,666,'a:10:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"2\";s:19:\"MENU_CACHE_GET_VARS\";a:1:{i:0;s:0:\"\";}s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"N\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"N\";}'),(54,'s1','bitrix:menu','footer_menu','/bitrix/templates/inner/footer.php','N',NULL,2036,2706,'a:11:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:18:\"COMPONENT_TEMPLATE\";s:11:\"footer_menu\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"1\";s:19:\"MENU_CACHE_GET_VARS\";N;s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"N\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:6:\"bottom\";s:7:\"USE_EXT\";s:1:\"N\";}'),(55,'s1','bitrix:main.include','.default','/bitrix/templates/inner/footer.php','N',NULL,3716,4131,'a:4:{s:14:\"AREA_FILE_SHOW\";s:4:\"file\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";s:4:\"PATH\";s:18:\"/include/phone.php\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";}'),(65,'s1','bitrix:main.profile','','/company/polzovatel/polzovatel.php','N',NULL,104,175,'a:0:{}'),(72,'s1','bitrix:socserv.auth.form','icons','/bitrix/templates/.default/components/bitrix/system.auth.form/auth/template.php','N',NULL,3502,3690,'a:2:{s:13:\"AUTH_SERVICES\";s:29:\"={$arResult[\"AUTH_SERVICES\"]}\";s:6:\"SUFFIX\";s:4:\"form\";}'),(73,'s1','bitrix:socserv.auth.form','','/bitrix/templates/.default/components/bitrix/system.auth.form/auth/template.php','N',NULL,3779,4044,'a:5:{s:13:\"AUTH_SERVICES\";s:29:\"={$arResult[\"AUTH_SERVICES\"]}\";s:8:\"AUTH_URL\";s:24:\"={$arResult[\"AUTH_URL\"]}\";s:4:\"POST\";s:20:\"={$arResult[\"POST\"]}\";s:5:\"POPUP\";s:1:\"Y\";s:6:\"SUFFIX\";s:4:\"form\";}'),(78,'s1','bitrix:main.register','','/company/polzovatel/registraitsya.php','N',NULL,103,384,'a:8:{s:4:\"AUTH\";s:1:\"Y\";s:15:\"REQUIRED_FIELDS\";N;s:9:\"SET_TITLE\";s:1:\"Y\";s:11:\"SHOW_FIELDS\";N;s:12:\"SUCCESS_PAGE\";s:0:\"\";s:13:\"USER_PROPERTY\";N;s:18:\"USER_PROPERTY_NAME\";s:0:\"\";s:11:\"USE_BACKURL\";s:1:\"Y\";}'),(85,'s1','bitrix:socserv.auth.form','flat','/bitrix/templates/.default/components/bitrix/main.auth.form/auth/template.php','N',NULL,646,875,'a:2:{s:13:\"AUTH_SERVICES\";s:29:\"={$arResult[\"AUTH_SERVICES\"]}\";s:8:\"AUTH_URL\";s:24:\"={$arResult[\"CURR_URI\"]}\";}'),(89,'s1','bitrix:main.feedback','','/contacts/index.php','N',NULL,999,1255,'a:5:{s:8:\"EMAIL_TO\";s:22:\"enot07142004@gmail.com\";s:16:\"EVENT_MESSAGE_ID\";N;s:7:\"OK_TEXT\";s:59:\"Спасибо, ваше сообщение принято.\";s:15:\"REQUIRED_FIELDS\";N;s:11:\"USE_CAPTCHA\";s:1:\"Y\";}'),(90,'s1','bitrix:map.google.view','.default','/contacts/index.php','N',NULL,1293,1890,'a:8:{s:8:\"CONTROLS\";a:4:{i:0;s:17:\"LARGE_MAP_CONTROL\";i:1;s:7:\"MINIMAP\";i:2;s:12:\"HTYPECONTROL\";i:3;s:9:\"SCALELINE\";}s:13:\"INIT_MAP_TYPE\";s:6:\"NORMAL\";s:3:\"KEY\";s:86:\"ABQIAAAAOSNukcWVjXaGbDo6npRDcxS1yLxjXbTnpHav15fICwCqFS-qhhSby0EyD6rK_qL4vuBSKpeCz5cOjw\";s:8:\"MAP_DATA\";s:95:\"a:3:{s:10:\"google_lat\";s:7:\"55.7383\";s:10:\"google_lon\";s:7:\"37.5946\";s:12:\"google_scale\";i:13;}\";s:10:\"MAP_HEIGHT\";s:3:\"500\";s:6:\"MAP_ID\";s:0:\"\";s:9:\"MAP_WIDTH\";s:3:\"600\";s:7:\"OPTIONS\";a:3:{i:0;s:18:\"ENABLE_SCROLL_ZOOM\";i:1;s:20:\"ENABLE_DBLCLICK_ZOOM\";i:2;s:15:\"ENABLE_DRAGGING\";}}'),(120,'s1','bitrix:news.list','','/aktsii/index.php','N',NULL,97,1829,'a:57:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:0:\"\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"FILTER_NAME\";s:0:\"\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:2:\"18\";s:11:\"IBLOCK_TYPE\";s:6:\"action\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:14:\"MEDIA_PROPERTY\";s:0:\"\";s:11:\"MESSAGE_404\";s:0:\"\";s:10:\"NEWS_COUNT\";s:1:\"5\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:13:\"PROPERTY_CODE\";a:2:{i:0;s:5:\"PRICE\";i:1;s:0:\"\";}s:11:\"SEARCH_PAGE\";s:8:\"/search/\";s:17:\"SET_BROWSER_TITLE\";s:1:\"Y\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"Y\";s:17:\"SET_META_KEYWORDS\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:15:\"SLIDER_PROPERTY\";s:0:\"\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:14:\"TEMPLATE_THEME\";s:4:\"blue\";s:10:\"USE_RATING\";s:1:\"N\";s:9:\"USE_SHARE\";s:1:\"N\";}'),(127,'s1','bitrix:search.form','flat','/bitrix/templates/.default/components/bitrix/news/news_page/news.php','N',NULL,1068,1247,'a:1:{s:4:\"PAGE\";s:59:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"search\"]}\";}'),(128,'s1','bitrix:catalog.filter','','/bitrix/templates/.default/components/bitrix/news/news_page/news.php','N',NULL,1304,1839,'a:9:{s:11:\"IBLOCK_TYPE\";s:27:\"={$arParams[\"IBLOCK_TYPE\"]}\";s:9:\"IBLOCK_ID\";s:25:\"={$arParams[\"IBLOCK_ID\"]}\";s:11:\"FILTER_NAME\";s:27:\"={$arParams[\"FILTER_NAME\"]}\";s:10:\"FIELD_CODE\";s:33:\"={$arParams[\"FILTER_FIELD_CODE\"]}\";s:13:\"PROPERTY_CODE\";s:36:\"={$arParams[\"FILTER_PROPERTY_CODE\"]}\";s:10:\"CACHE_TYPE\";s:26:\"={$arParams[\"CACHE_TYPE\"]}\";s:10:\"CACHE_TIME\";s:26:\"={$arParams[\"CACHE_TIME\"]}\";s:12:\"CACHE_GROUPS\";s:28:\"={$arParams[\"CACHE_GROUPS\"]}\";s:17:\"PAGER_PARAMS_NAME\";s:33:\"={$arParams[\"PAGER_PARAMS_NAME\"]}\";}'),(129,'s1','bitrix:news.list','','/bitrix/templates/.default/components/bitrix/news/news_page/news.php','N',NULL,1863,4353,'a:45:{s:11:\"IBLOCK_TYPE\";s:27:\"={$arParams[\"IBLOCK_TYPE\"]}\";s:9:\"IBLOCK_ID\";s:25:\"={$arParams[\"IBLOCK_ID\"]}\";s:10:\"NEWS_COUNT\";s:26:\"={$arParams[\"NEWS_COUNT\"]}\";s:8:\"SORT_BY1\";s:24:\"={$arParams[\"SORT_BY1\"]}\";s:11:\"SORT_ORDER1\";s:27:\"={$arParams[\"SORT_ORDER1\"]}\";s:8:\"SORT_BY2\";s:24:\"={$arParams[\"SORT_BY2\"]}\";s:11:\"SORT_ORDER2\";s:27:\"={$arParams[\"SORT_ORDER2\"]}\";s:10:\"FIELD_CODE\";s:31:\"={$arParams[\"LIST_FIELD_CODE\"]}\";s:13:\"PROPERTY_CODE\";s:34:\"={$arParams[\"LIST_PROPERTY_CODE\"]}\";s:10:\"DETAIL_URL\";s:59:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"detail\"]}\";s:11:\"SECTION_URL\";s:60:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"section\"]}\";s:10:\"IBLOCK_URL\";s:57:\"={$arResult[\"FOLDER\"].$arResult[\"URL_TEMPLATES\"][\"news\"]}\";s:9:\"SET_TITLE\";s:25:\"={$arParams[\"SET_TITLE\"]}\";s:17:\"SET_LAST_MODIFIED\";s:33:\"={$arParams[\"SET_LAST_MODIFIED\"]}\";s:11:\"MESSAGE_404\";s:27:\"={$arParams[\"MESSAGE_404\"]}\";s:14:\"SET_STATUS_404\";s:30:\"={$arParams[\"SET_STATUS_404\"]}\";s:8:\"SHOW_404\";s:24:\"={$arParams[\"SHOW_404\"]}\";s:8:\"FILE_404\";s:24:\"={$arParams[\"FILE_404\"]}\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:41:\"={$arParams[\"INCLUDE_IBLOCK_INTO_CHAIN\"]}\";s:10:\"CACHE_TYPE\";s:26:\"={$arParams[\"CACHE_TYPE\"]}\";s:10:\"CACHE_TIME\";s:26:\"={$arParams[\"CACHE_TIME\"]}\";s:12:\"CACHE_FILTER\";s:28:\"={$arParams[\"CACHE_FILTER\"]}\";s:12:\"CACHE_GROUPS\";s:28:\"={$arParams[\"CACHE_GROUPS\"]}\";s:17:\"DISPLAY_TOP_PAGER\";s:33:\"={$arParams[\"DISPLAY_TOP_PAGER\"]}\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:36:\"={$arParams[\"DISPLAY_BOTTOM_PAGER\"]}\";s:11:\"PAGER_TITLE\";s:27:\"={$arParams[\"PAGER_TITLE\"]}\";s:14:\"PAGER_TEMPLATE\";s:30:\"={$arParams[\"PAGER_TEMPLATE\"]}\";s:17:\"PAGER_SHOW_ALWAYS\";s:33:\"={$arParams[\"PAGER_SHOW_ALWAYS\"]}\";s:20:\"PAGER_DESC_NUMBERING\";s:36:\"={$arParams[\"PAGER_DESC_NUMBERING\"]}\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:47:\"={$arParams[\"PAGER_DESC_NUMBERING_CACHE_TIME\"]}\";s:14:\"PAGER_SHOW_ALL\";s:30:\"={$arParams[\"PAGER_SHOW_ALL\"]}\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:38:\"={$arParams[\"PAGER_BASE_LINK_ENABLE\"]}\";s:15:\"PAGER_BASE_LINK\";s:31:\"={$arParams[\"PAGER_BASE_LINK\"]}\";s:17:\"PAGER_PARAMS_NAME\";s:33:\"={$arParams[\"PAGER_PARAMS_NAME\"]}\";s:12:\"DISPLAY_DATE\";s:28:\"={$arParams[\"DISPLAY_DATE\"]}\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:31:\"={$arParams[\"DISPLAY_PICTURE\"]}\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:36:\"={$arParams[\"DISPLAY_PREVIEW_TEXT\"]}\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:36:\"={$arParams[\"PREVIEW_TRUNCATE_LEN\"]}\";s:18:\"ACTIVE_DATE_FORMAT\";s:39:\"={$arParams[\"LIST_ACTIVE_DATE_FORMAT\"]}\";s:15:\"USE_PERMISSIONS\";s:31:\"={$arParams[\"USE_PERMISSIONS\"]}\";s:17:\"GROUP_PERMISSIONS\";s:33:\"={$arParams[\"GROUP_PERMISSIONS\"]}\";s:11:\"FILTER_NAME\";s:27:\"={$arParams[\"FILTER_NAME\"]}\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:40:\"={$arParams[\"HIDE_LINK_WHEN_NO_DETAIL\"]}\";s:11:\"CHECK_DATES\";s:27:\"={$arParams[\"CHECK_DATES\"]}\";}'),(130,'s1','bitrix:news','news_page','/news/index.php','N',NULL,99,2266,'a:67:{s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:25:\"DETAIL_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:27:\"DETAIL_DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:24:\"DETAIL_DISPLAY_TOP_PAGER\";s:1:\"N\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:21:\"DETAIL_PAGER_SHOW_ALL\";s:1:\"Y\";s:21:\"DETAIL_PAGER_TEMPLATE\";s:0:\"\";s:18:\"DETAIL_PAGER_TITLE\";s:16:\"Страница\";s:20:\"DETAIL_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:23:\"LIST_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"MESSAGE_404\";s:0:\"\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:10:\"NEWS_COUNT\";s:2:\"20\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:8:\"SEF_MODE\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:14:\"USE_CATEGORIES\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:10:\"USE_REVIEW\";s:1:\"N\";s:7:\"USE_RSS\";s:1:\"N\";s:10:\"USE_SEARCH\";s:1:\"N\";s:9:\"USE_SHARE\";s:1:\"N\";s:16:\"VARIABLE_ALIASES\";a:2:{s:10:\"SECTION_ID\";s:10:\"SECTION_ID\";s:10:\"ELEMENT_ID\";s:10:\"ELEMENT_ID\";}}'),(132,'s1','bitrix:catalog','.default','/products/index.php','Y','/products/',99,5775,'a:143:{s:15:\"ACTION_VARIABLE\";s:6:\"action\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"Y\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:10:\"BASKET_URL\";s:0:\"\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:20:\"DETAIL_BROWSER_TITLE\";s:4:\"NAME\";s:23:\"DETAIL_META_DESCRIPTION\";s:1:\"-\";s:20:\"DETAIL_META_KEYWORDS\";s:1:\"-\";s:20:\"DETAIL_PROPERTY_CODE\";a:6:{i:0;s:4:\"SIZE\";i:1;s:6:\"S_SIZE\";i:2;s:9:\"ARTNUMBER\";i:3;s:8:\"MATERIAL\";i:4;s:12:\"MANUFACTURER\";i:5;s:0:\"\";}s:19:\"DETAIL_SHOW_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:18:\"ELEMENT_SORT_FIELD\";s:4:\"sort\";s:18:\"ELEMENT_SORT_ORDER\";s:3:\"asc\";s:9:\"IBLOCK_ID\";s:1:\"2\";s:11:\"IBLOCK_TYPE\";s:8:\"products\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:18:\"LINE_ELEMENT_COUNT\";s:1:\"1\";s:17:\"LINK_ELEMENTS_URL\";s:39:\"link.php?PARENT_ELEMENT_ID=#ELEMENT_ID#\";s:14:\"LINK_IBLOCK_ID\";s:0:\"\";s:16:\"LINK_IBLOCK_TYPE\";s:0:\"\";s:17:\"LINK_PROPERTY_SID\";s:0:\"\";s:18:\"LIST_BROWSER_TITLE\";s:4:\"NAME\";s:21:\"LIST_META_DESCRIPTION\";s:1:\"-\";s:18:\"LIST_META_KEYWORDS\";s:1:\"-\";s:18:\"LIST_PROPERTY_CODE\";a:2:{i:0;s:13:\"PRICECURRENCY\";i:1;s:0:\"\";}s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:8:\"36000000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:6:\"arrows\";s:11:\"PAGER_TITLE\";s:18:\"Продукция\";s:18:\"PAGE_ELEMENT_COUNT\";s:2:\"10\";s:10:\"PRICE_CODE\";a:1:{i:0;s:5:\"PRICE\";}s:17:\"PRICE_VAT_INCLUDE\";s:1:\"N\";s:20:\"PRICE_VAT_SHOW_VALUE\";s:1:\"N\";s:19:\"PRODUCT_ID_VARIABLE\";s:2:\"id\";s:19:\"SECTION_ID_VARIABLE\";s:10:\"SECTION_ID\";s:24:\"SECTION_SHOW_PARENT_NAME\";s:1:\"N\";s:10:\"SEF_FOLDER\";s:10:\"/products/\";s:8:\"SEF_MODE\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"Y\";s:9:\"SET_TITLE\";s:1:\"Y\";s:16:\"SHOW_PRICE_COUNT\";s:1:\"1\";s:17:\"SHOW_TOP_ELEMENTS\";s:1:\"Y\";s:11:\"USE_COMPARE\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:15:\"USE_PRICE_COUNT\";s:1:\"N\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:14:\"TEMPLATE_THEME\";s:4:\"blue\";s:13:\"ADD_PICT_PROP\";s:1:\"-\";s:10:\"LABEL_PROP\";N;s:12:\"MESS_BTN_BUY\";s:12:\"Купить\";s:22:\"MESS_BTN_ADD_TO_BASKET\";s:17:\"В корзину\";s:16:\"MESS_BTN_COMPARE\";s:18:\"Сравнение\";s:15:\"MESS_BTN_DETAIL\";s:18:\"Подробнее\";s:18:\"MESS_NOT_AVAILABLE\";s:24:\"Нет в наличии\";s:26:\"MESS_NOT_AVAILABLE_SERVICE\";s:20:\"Недоступно\";s:18:\"MESS_BTN_SUBSCRIBE\";s:22:\"Подписаться\";s:20:\"SIDEBAR_SECTION_SHOW\";s:1:\"Y\";s:19:\"SIDEBAR_DETAIL_SHOW\";s:1:\"N\";s:12:\"SIDEBAR_PATH\";s:0:\"\";s:12:\"USER_CONSENT\";s:1:\"N\";s:15:\"USER_CONSENT_ID\";s:1:\"0\";s:23:\"USER_CONSENT_IS_CHECKED\";s:1:\"Y\";s:22:\"USER_CONSENT_IS_LOADED\";s:1:\"N\";s:24:\"USE_MAIN_ELEMENT_SECTION\";s:1:\"N\";s:27:\"DETAIL_STRICT_SECTION_CHECK\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:16:\"FILTER_VIEW_MODE\";s:8:\"VERTICAL\";s:21:\"FILTER_HIDE_ON_MOBILE\";s:1:\"N\";s:14:\"INSTANT_RELOAD\";s:1:\"N\";s:20:\"USE_PRODUCT_QUANTITY\";s:1:\"N\";s:25:\"PRODUCT_QUANTITY_VARIABLE\";s:8:\"quantity\";s:24:\"ADD_PROPERTIES_TO_BASKET\";s:1:\"Y\";s:22:\"PRODUCT_PROPS_VARIABLE\";s:4:\"prop\";s:26:\"PARTIAL_PRODUCT_PROPERTIES\";s:1:\"N\";s:24:\"SEARCH_PAGE_RESULT_COUNT\";s:2:\"50\";s:14:\"SEARCH_RESTART\";s:1:\"N\";s:20:\"SEARCH_NO_WORD_LOGIC\";s:1:\"Y\";s:25:\"SEARCH_USE_LANGUAGE_GUESS\";s:1:\"Y\";s:18:\"SEARCH_CHECK_DATES\";s:1:\"Y\";s:30:\"SEARCH_USE_SEARCH_RESULT_ORDER\";s:1:\"N\";s:22:\"SECTION_COUNT_ELEMENTS\";s:1:\"Y\";s:17:\"SECTION_TOP_DEPTH\";s:1:\"2\";s:18:\"SECTIONS_VIEW_MODE\";s:4:\"LIST\";s:25:\"SECTIONS_SHOW_PARENT_NAME\";s:1:\"Y\";s:19:\"ELEMENT_SORT_FIELD2\";s:2:\"id\";s:19:\"ELEMENT_SORT_ORDER2\";s:4:\"desc\";s:24:\"SECTION_BACKGROUND_IMAGE\";s:1:\"-\";s:25:\"LIST_PRODUCT_BLOCKS_ORDER\";s:46:\"price,props,sku,quantityLimit,quantity,buttons\";s:25:\"LIST_PRODUCT_ROW_VARIANTS\";s:331:\"[{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false},{\'VARIANT\':\'0\',\'BIG_DATA\':false}]\";s:20:\"LIST_ENLARGE_PRODUCT\";s:6:\"STRICT\";s:16:\"LIST_SHOW_SLIDER\";s:1:\"Y\";s:20:\"LIST_SLIDER_INTERVAL\";s:4:\"3000\";s:20:\"LIST_SLIDER_PROGRESS\";s:1:\"N\";s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:32:\"DETAIL_CHECK_SECTION_ID_VARIABLE\";s:1:\"N\";s:23:\"DETAIL_BACKGROUND_IMAGE\";s:1:\"-\";s:16:\"SHOW_DEACTIVATED\";s:1:\"N\";s:20:\"SHOW_SKU_DESCRIPTION\";s:1:\"N\";s:22:\"DETAIL_USE_VOTE_RATING\";s:1:\"N\";s:19:\"DETAIL_USE_COMMENTS\";s:1:\"N\";s:16:\"DETAIL_BRAND_USE\";s:1:\"N\";s:19:\"DETAIL_DISPLAY_NAME\";s:1:\"Y\";s:23:\"DETAIL_IMAGE_RESOLUTION\";s:5:\"16by9\";s:31:\"DETAIL_PRODUCT_INFO_BLOCK_ORDER\";s:9:\"sku,props\";s:30:\"DETAIL_PRODUCT_PAY_BLOCK_ORDER\";s:55:\"rating,price,priceRanges,quantityLimit,quantity,buttons\";s:18:\"DETAIL_SHOW_SLIDER\";s:1:\"N\";s:26:\"DETAIL_DETAIL_PICTURE_MODE\";a:2:{i:0;s:5:\"POPUP\";i:1;s:9:\"MAGNIFIER\";}s:27:\"DETAIL_ADD_DETAIL_TO_SLIDER\";s:1:\"N\";s:32:\"DETAIL_DISPLAY_PREVIEW_TEXT_MODE\";s:1:\"E\";s:19:\"DETAIL_SHOW_POPULAR\";s:1:\"Y\";s:18:\"DETAIL_SHOW_VIEWED\";s:1:\"Y\";s:9:\"USE_STORE\";s:1:\"N\";s:22:\"USE_ENHANCED_ECOMMERCE\";s:1:\"N\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:9:\"LAZY_LOAD\";s:1:\"N\";s:18:\"MESS_BTN_LAZY_LOAD\";s:23:\"Показать ещё\";s:14:\"LOAD_ON_SCROLL\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:11:\"MESSAGE_404\";s:0:\"\";s:15:\"COMPATIBLE_MODE\";s:1:\"N\";s:19:\"USE_ELEMENT_COUNTER\";s:1:\"Y\";s:28:\"DISABLE_INIT_JS_IN_COMPONENT\";s:1:\"N\";s:17:\"TOP_ELEMENT_COUNT\";s:1:\"5\";s:22:\"TOP_LINE_ELEMENT_COUNT\";s:1:\"3\";s:22:\"TOP_ELEMENT_SORT_FIELD\";s:4:\"sort\";s:22:\"TOP_ELEMENT_SORT_ORDER\";s:3:\"asc\";s:23:\"TOP_ELEMENT_SORT_FIELD2\";s:2:\"id\";s:23:\"TOP_ELEMENT_SORT_ORDER2\";s:4:\"desc\";s:13:\"TOP_VIEW_MODE\";s:7:\"SECTION\";s:17:\"SEF_URL_TEMPLATES\";a:5:{s:8:\"sections\";s:0:\"\";s:7:\"section\";s:13:\"#SECTION_ID#/\";s:7:\"element\";s:26:\"#SECTION_ID#/#ELEMENT_ID#/\";s:7:\"compare\";s:0:\"\";s:12:\"smart_filter\";s:46:\"#SECTION_ID#/filter/#SMART_FILTER_PATH#/apply/\";}}'),(135,'s1','bitrix:news.list','.default','/company/otzyvy/index.php','N',NULL,98,1717,'a:52:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:10:\"DETAIL_URL\";s:0:\"\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"N\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:11:\"FILTER_NAME\";s:0:\"\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:2:\"17\";s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:19:\"INCLUDE_SUBSECTIONS\";s:1:\"Y\";s:11:\"MESSAGE_404\";s:0:\"\";s:10:\"NEWS_COUNT\";s:1:\"5\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:17:\"SET_BROWSER_TITLE\";s:1:\"Y\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"Y\";s:17:\"SET_META_KEYWORDS\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";}'),(138,'s1','bitrix:search.suggest.input','','/bitrix/templates/.default/components/bitrix/search.form/search/template.php','N',NULL,674,908,'a:4:{s:4:\"NAME\";s:1:\"q\";s:5:\"VALUE\";s:0:\"\";s:10:\"INPUT_SIZE\";s:2:\"15\";s:13:\"DROPDOWN_SIZE\";s:2:\"10\";}'),(139,'s1','bitrix:search.form','search','/company/test.php','N',NULL,96,356,'a:2:{s:4:\"PAGE\";s:26:\"#SITE_DIR#search/index.php\";s:11:\"USE_SUGGEST\";s:1:\"N\";}');
/*!40000 ALTER TABLE `b_component_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_composite_log`
--

DROP TABLE IF EXISTS `b_composite_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_composite_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) NOT NULL,
  `URI` varchar(2000) NOT NULL,
  `TITLE` varchar(250) DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `MESSAGE` longtext DEFAULT NULL,
  `AJAX` char(1) NOT NULL DEFAULT 'N',
  `USER_ID` int(11) NOT NULL DEFAULT 0,
  `PAGE_ID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_composite_log`
--

LOCK TABLES `b_composite_log` WRITE;
/*!40000 ALTER TABLE `b_composite_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_composite_page`
--

DROP TABLE IF EXISTS `b_composite_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_composite_page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) NOT NULL,
  `HOST` varchar(100) NOT NULL,
  `URI` varchar(2000) NOT NULL,
  `TITLE` varchar(250) DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(11) NOT NULL DEFAULT 0,
  `REWRITES` int(11) NOT NULL DEFAULT 0,
  `SIZE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_composite_page`
--

LOCK TABLES `b_composite_page` WRITE;
/*!40000 ALTER TABLE `b_composite_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_agreement`
--

DROP TABLE IF EXISTS `b_consent_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_agreement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) NOT NULL,
  `TYPE` char(1) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) DEFAULT NULL,
  `AGREEMENT_TEXT` longtext DEFAULT NULL,
  `LABEL_TEXT` varchar(4000) DEFAULT NULL,
  `SECURITY_CODE` varchar(32) DEFAULT NULL,
  `USE_URL` char(1) NOT NULL DEFAULT 'N',
  `URL` varchar(255) DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_agreement`
--

LOCK TABLES `b_consent_agreement` WRITE;
/*!40000 ALTER TABLE `b_consent_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_field`
--

DROP TABLE IF EXISTS `b_consent_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(11) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_field`
--

LOCK TABLES `b_consent_field` WRITE;
/*!40000 ALTER TABLE `b_consent_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_user_consent`
--

DROP TABLE IF EXISTS `b_consent_user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_user_consent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `IP` varchar(15) NOT NULL,
  `URL` varchar(4000) DEFAULT NULL,
  `ORIGIN_ID` varchar(30) DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_user_consent`
--

LOCK TABLES `b_consent_user_consent` WRITE;
/*!40000 ALTER TABLE `b_consent_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_consent_user_consent_item`
--

DROP TABLE IF EXISTS `b_consent_user_consent_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_consent_user_consent_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_CONSENT_ID` int(11) NOT NULL,
  `VALUE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_consent_user_consent_item`
--

LOCK TABLES `b_consent_user_consent_item` WRITE;
/*!40000 ALTER TABLE `b_consent_user_consent_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_user_consent_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_counter_data`
--

DROP TABLE IF EXISTS `b_counter_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `DATA` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_counter_data`
--

LOCK TABLES `b_counter_data` WRITE;
/*!40000 ALTER TABLE `b_counter_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_counter_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_culture`
--

DROP TABLE IF EXISTS `b_culture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(50) DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT 1,
  `CHARSET` varchar(50) DEFAULT NULL,
  `DIRECTION` char(1) DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) DEFAULT 'am',
  `PM_VALUE` varchar(20) DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) DEFAULT '.',
  `NUMBER_DECIMALS` tinyint(4) DEFAULT 2,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_culture`
--

LOCK TABLES `b_culture` WRITE;
/*!40000 ALTER TABLE `b_culture` DISABLE KEYS */;
INSERT INTO `b_culture` VALUES (1,'ru','ru','DD.MM.YYYY','DD.MM.YYYY HH:MI:SS','#NAME# #LAST_NAME#',1,'UTF-8','Y','d.m.Y','j M Y','j F Y','l, j F Y','j F','j M','l, j F','D, j F','D, j M','H:i','H:i:s','am','pm',' ',',',2),(2,'en','en','MM/DD/YYYY','MM/DD/YYYY H:MI:SS T','#NAME# #LAST_NAME#',0,'UTF-8','Y','n/j/Y','M j, Y','F j, Y','l, F j, Y','F j','M j','l, F j','D, F j','D, M j','g:i a','g:i:s a','am','pm',',','.',2);
/*!40000 ALTER TABLE `b_culture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_entity_usage`
--

DROP TABLE IF EXISTS `b_entity_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_entity_usage` (
  `USER_ID` int(11) NOT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `ENTITY_ID` varchar(30) NOT NULL,
  `ITEM_ID` varchar(50) NOT NULL,
  `ITEM_ID_INT` int(11) NOT NULL DEFAULT 0,
  `PREFIX` varchar(10) NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_entity_usage`
--

LOCK TABLES `b_entity_usage` WRITE;
/*!40000 ALTER TABLE `b_entity_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_entity_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event`
--

DROP TABLE IF EXISTS `b_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) NOT NULL,
  `MESSAGE_ID` int(11) DEFAULT NULL,
  `LID` varchar(255) NOT NULL,
  `C_FIELDS` longtext DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event`
--

LOCK TABLES `b_event` WRITE;
/*!40000 ALTER TABLE `b_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_attachment`
--

DROP TABLE IF EXISTS `b_event_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `IS_FILE_COPIED` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_attachment`
--

LOCK TABLES `b_event_attachment` WRITE;
/*!40000 ALTER TABLE `b_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_log`
--

DROP TABLE IF EXISTS `b_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SEVERITY` varchar(50) NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` text DEFAULT NULL,
  `REQUEST_URI` text DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_log`
--

LOCK TABLES `b_event_log` WRITE;
/*!40000 ALTER TABLE `b_event_log` DISABLE KEYS */;
INSERT INTO `b_event_log` VALUES (281,'2024-03-17 07:24:48','WARNING','SITE_CHECKER_ERROR','main','CSiteCheckerTest::CommonTest();','-','-','/products/1/9/','s1',NULL,NULL,''),(282,'2024-03-21 06:24:55','WARNING','SITE_CHECKER_ERROR','main','CSiteCheckerTest::CommonTest();','-','-','/','s1',NULL,NULL,''),(283,'2024-03-22 13:09:45','WARNING','SITE_CHECKER_ERROR','main','CSiteCheckerTest::CommonTest();','-','-','/company/','s1',NULL,NULL,''),(284,'2024-03-24 09:37:41','WARNING','SITE_CHECKER_ERROR','main','CSiteCheckerTest::CommonTest();','-','-','/bitrix/services/main/ajax.php?mode=class&c=bitrix%3Amain.coupon.activation&action=check','s1',NULL,NULL,'');
/*!40000 ALTER TABLE `b_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message`
--

DROP TABLE IF EXISTS `b_event_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `EVENT_NAME` varchar(255) NOT NULL,
  `LID` char(2) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) DEFAULT NULL,
  `MESSAGE` longtext DEFAULT NULL,
  `MESSAGE_PHP` longtext DEFAULT NULL,
  `BODY_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `BCC` text DEFAULT NULL,
  `REPLY_TO` varchar(255) DEFAULT NULL,
  `CC` varchar(255) DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) DEFAULT NULL,
  `PRIORITY` varchar(50) DEFAULT NULL,
  `FIELD1_NAME` varchar(50) DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) DEFAULT NULL,
  `FIELD2_NAME` varchar(50) DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) DEFAULT NULL,
  `ADDITIONAL_FIELD` text DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message`
--

LOCK TABLES `b_event_message` WRITE;
/*!40000 ALTER TABLE `b_event_message` DISABLE KEYS */;
INSERT INTO `b_event_message` VALUES (1,'2024-02-07 11:14:39','NEW_USER','s1','Y','#DEFAULT_EMAIL_FROM#','#DEFAULT_EMAIL_FROM#','#SITE_NAME#: Зарегистрировался новый пользователь','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(2,'2024-02-07 11:14:39','USER_INFO','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Регистрационная информация','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(3,'2024-02-07 11:14:39','USER_PASS_REQUEST','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Запрос на смену пароля','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(4,'2024-02-07 11:14:39','USER_PASS_CHANGED','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение смены пароля','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(5,'2024-02-07 11:14:39','NEW_USER_CONFIRM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение регистрации нового пользователя','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(6,'2024-02-07 11:14:39','USER_INVITE','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Приглашение на сайт','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(7,'2024-02-07 11:14:39','FEEDBACK_FORM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: Сообщение из формы обратной связи','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(8,'2024-02-07 11:14:39','MAIN_MAIL_CONFIRM_CODE','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#MESSAGE_SUBJECT#','<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>','<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_join',NULL,NULL),(9,'2024-02-07 11:14:39','EVENT_LOG_NOTIFICATION','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','Оповещение журнала событий: #NAME#','Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#','Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nОбъект: <?=$arParams[\"ITEM_ID\"];?>\n\nПользователь: <?=$arParams[\"USER_ID\"];?> \nIP-адрес: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nСтраница: <?=$arParams[\"REQUEST_URI\"];?> \n\nКоличество записей: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(10,'2024-02-07 11:14:39','USER_CODE_REQUEST','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Запрос кода авторизации','Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.','Используйте для авторизации код:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение создано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(11,'2024-02-07 11:14:39','NEW_DEVICE_LOGIN','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','Вход с нового устройства','Здравствуйте, #NAME#,\n\nНовое устройство авторизовалось под вашим логином #LOGIN#.\n \nУстройство: #DEVICE# \nБраузер: #BROWSER#\nПлатформа: #PLATFORM#\nМестоположение: #LOCATION# (может быть неточным)\nДата: #DATE#\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n','Здравствуйте, <?=$arParams[\"NAME\"];?>,\n\nНовое устройство авторизовалось под вашим логином <?=$arParams[\"LOGIN\"];?>.\n \nУстройство: <?=$arParams[\"DEVICE\"];?> \nБраузер: <?=$arParams[\"BROWSER\"];?>\n\nПлатформа: <?=$arParams[\"PLATFORM\"];?>\n\nМестоположение: <?=$arParams[\"LOCATION\"];?> (может быть неточным)\nДата: <?=$arParams[\"DATE\"];?>\n\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ru'),(12,'2024-02-07 11:14:43','NEW_BLOG_MESSAGE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге \"#BLOG_NAME#\"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\"\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'2024-02-07 11:14:43','NEW_BLOG_COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'2024-02-07 11:14:43','NEW_BLOG_COMMENT2COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'2024-02-07 11:14:43','NEW_BLOG_COMMENT_WITHOUT_TITLE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'2024-02-07 11:14:43','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'2024-02-07 11:14:43','BLOG_YOUR_BLOG_TO_USER','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] Ваш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВаш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен в друзья к <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'2024-02-07 11:14:43','BLOG_YOU_TO_BLOG','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] Вы были добавлены в друзья блога \"#BLOG_NAME#\"','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'2024-02-07 11:14:43','BLOG_BLOG_TO_YOU','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] К вам в друзья был добавлен блог \"#BLOG_NAME#\"','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'2024-02-07 11:14:43','BLOG_USER_TO_YOUR_BLOG','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [B] В ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВ ваш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен друг <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'2024-02-07 11:14:43','BLOG_SONET_NEW_POST','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(22,'2024-02-07 11:14:43','BLOG_SONET_NEW_COMMENT','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','Re: #POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{#COMMENT_ID#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{$arParams[\'COMMENT_ID\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(23,'2024-02-07 11:14:43','BLOG_SONET_POST_SHARE','s1','Y','#EMAIL_FROM#','#EMAIL_TO#','#POST_TITLE#','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>','<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>','html',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mail_user',NULL,NULL),(24,'2024-02-07 11:14:43','BLOG_POST_BROADCAST','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: #MESSAGE_TITLE#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'2024-02-07 11:14:46','NEW_FORUM_MESSAGE','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'2024-02-07 11:14:46','NEW_FORUM_PRIV','s1','Y','#FROM_EMAIL#','#TO_EMAIL#','#SITE_NAME#: [private] #SUBJECT#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?> <?=$arParams[\"FROM_EMAIL\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'2024-02-07 11:14:46','NEW_FORUM_PRIVATE_MESSAGE','s1','Y','#FROM_EMAIL#','#TO_EMAIL#','#SITE_NAME#: [private] #SUBJECT#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСсылка на сообщение: <?=$arParams[\"MESSAGE_LINK\"];?>Сообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'2024-02-07 11:14:46','EDIT_FORUM_MESSAGE','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'2024-02-07 11:14:46','FORUM_NEW_MESSAGE_MAIL','s1','Y','#FROM_EMAIL#','#RECIPIENT#','#TOPIC_TITLE#','#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n','<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams[\"FORUM_NAME\"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nНаписать новое сообщение: <?=$arParams[\"FORUM_EMAIL\"];?>\n\n\nАвтор сообщения: <?=$arParams[\"AUTHOR\"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams[\"SITE_NAME\"];?>.\n','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'2024-02-07 11:14:53','VIRUS_DETECTED','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Обнаружен вирус','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams[\"SERVER_NAME\"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n','text','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'2024-02-07 11:14:54','SUBSCRIBE_CONFIRM','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL#','#SITE_NAME#: Подтверждение подписки','Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n','Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams[\"SERVER_NAME\"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams[\"EMAIL\"];?>\n\nДата добавления/редактирования .... <?=$arParams[\"DATE_SUBSCR\"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nОтписаться:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n','text','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'2024-02-07 11:14:56','VOTE_FOR','s1','Y','#DEFAULT_EMAIL_FROM#','#EMAIL_TO#','#SITE_NAME#: [V] #VOTE_TITLE#','#USER_NAME# принял участие в опросе \"#VOTE_TITLE#\":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.','<?=$arParams[\"USER_NAME\"];?> принял участие в опросе \"<?=$arParams[\"VOTE_TITLE\"];?>\":\n<?=$arParams[\"VOTE_STATISTIC\"];?>\n\n\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"URL\"];?>\n\nСообщение сгенерировано автоматически.','text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_event_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message_attachment`
--

DROP TABLE IF EXISTS `b_event_message_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message_attachment`
--

LOCK TABLES `b_event_message_attachment` WRITE;
/*!40000 ALTER TABLE `b_event_message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_message_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_message_site`
--

DROP TABLE IF EXISTS `b_event_message_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_message_site`
--

LOCK TABLES `b_event_message_site` WRITE;
/*!40000 ALTER TABLE `b_event_message_site` DISABLE KEYS */;
INSERT INTO `b_event_message_site` VALUES (1,'s1'),(2,'s1'),(3,'s1'),(4,'s1'),(5,'s1'),(6,'s1'),(7,'s1'),(8,'s1'),(9,'s1'),(10,'s1'),(11,'s1'),(12,'s1'),(13,'s1'),(14,'s1'),(15,'s1'),(16,'s1'),(17,'s1'),(18,'s1'),(19,'s1'),(20,'s1'),(21,'s1'),(22,'s1'),(23,'s1'),(24,'s1'),(25,'s1'),(26,'s1'),(27,'s1'),(28,'s1'),(29,'s1'),(30,'s1'),(31,'s1'),(32,'s1');
/*!40000 ALTER TABLE `b_event_message_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_event_type`
--

DROP TABLE IF EXISTS `b_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_event_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 150,
  `EVENT_TYPE` varchar(10) NOT NULL DEFAULT 'email',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_event_type`
--

LOCK TABLES `b_event_type` WRITE;
/*!40000 ALTER TABLE `b_event_type` DISABLE KEYS */;
INSERT INTO `b_event_type` VALUES (1,'ru','NEW_USER','Зарегистрировался новый пользователь','\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n',1,'email'),(2,'ru','USER_INFO','Информация о пользователе','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',2,'email'),(3,'ru','NEW_USER_CONFIRM','Подтверждение регистрации нового пользователя','\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n',3,'email'),(4,'ru','USER_PASS_REQUEST','Запрос на смену пароля','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',4,'email'),(5,'ru','USER_PASS_CHANGED','Подтверждение смены пароля','\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n',5,'email'),(6,'ru','USER_INVITE','Приглашение на сайт нового пользователя','#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n',6,'email'),(7,'ru','FEEDBACK_FORM','Отправка сообщения через форму обратной связи','#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',7,'email'),(8,'ru','MAIN_MAIL_CONFIRM_CODE','Подтверждение email-адреса отправителя','\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения',8,'email'),(9,'ru','EVENT_LOG_NOTIFICATION','Оповещение журнала событий','#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей',9,'email'),(10,'ru','USER_CODE_REQUEST','Запрос кода авторизации','#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n',10,'email'),(11,'ru','NEW_DEVICE_LOGIN','Вход с нового устройства','#USER_ID# - ID пользователя\n#EMAIL# - Email пользователя\n#LOGIN# - Логин пользователя\n#NAME# - Имя пользователя\n#LAST_NAME# - Фамилия пользователя\n#DEVICE# - Устройство\n#BROWSER# - Браузер\n#PLATFORM# - Платформа\n#USER_AGENT# - User agent\n#IP# - IP-адрес\n#DATE# - Дата\n#COUNTRY# - Страна\n#REGION# - Регион\n#CITY# - Город\n#LOCATION# - Объединенные город, регион, страна\n',11,'email'),(12,'ru','SMS_USER_CONFIRM_NUMBER','Подтверждение номера телефона по СМС','#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n',100,'sms'),(13,'ru','SMS_USER_RESTORE_PASSWORD','Восстановление пароля через СМС','#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n',100,'sms'),(14,'ru','SMS_EVENT_LOG_NOTIFICATION','Оповещение журнала событий','#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей',100,'sms'),(15,'en','NEW_USER','New user was registered','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n',1,'email'),(16,'en','USER_INFO','Account Information','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',2,'email'),(17,'en','NEW_USER_CONFIRM','New user registration confirmation','\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n',3,'email'),(18,'en','USER_PASS_REQUEST','Password Change Request','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',4,'email'),(19,'en','USER_PASS_CHANGED','Password Change Confirmation','\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n',5,'email'),(20,'en','USER_INVITE','Invitation of a new site user','#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n',6,'email'),(21,'en','FEEDBACK_FORM','Sending a message using a feedback form','#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address',7,'email'),(22,'en','MAIN_MAIL_CONFIRM_CODE','Confirm sender\'s email address','\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code',8,'email'),(23,'en','EVENT_LOG_NOTIFICATION','Event log notification','#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events',9,'email'),(24,'en','USER_CODE_REQUEST','Request for verification code','#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n',10,'email'),(25,'en','NEW_DEVICE_LOGIN','New device signed in','#USER_ID# - User ID\n#EMAIL# - User email:\n#LOGIN# - User login\n#NAME# - User first name\n#LAST_NAME# - User last name\n#DEVICE# - Device\n#BROWSER# - Browser\n#PLATFORM# - Platform\n#USER_AGENT# - User agent\n#IP# - IP address\n#DATE# - Date\n#COUNTRY# - Country\n#REGION# - Region\n#CITY# - City\n#LOCATION# - Full location (city, region, country)\n',11,'email'),(26,'en','SMS_USER_CONFIRM_NUMBER','Verify phone number using SMS','#USER_PHONE# - phone number\n#CODE# - confirmation code',100,'sms'),(27,'en','SMS_USER_RESTORE_PASSWORD','Recover password using SMS','#USER_PHONE# - phone number\n#CODE# - recovery confirmation code',100,'sms'),(28,'en','SMS_EVENT_LOG_NOTIFICATION','Event log notification','#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events',100,'sms'),(29,'ru','NEW_BLOG_MESSAGE','Новое сообщение в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100,'email'),(30,'ru','NEW_BLOG_COMMENT','Новый комментарий в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100,'email'),(31,'ru','NEW_BLOG_COMMENT2COMMENT','Новый комментарий на ваш комментарий в блоге','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100,'email'),(32,'ru','NEW_BLOG_COMMENT_WITHOUT_TITLE','Новый комментарий в блоге (без темы)','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100,'email'),(33,'ru','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','Новый комментарий на ваш комментарий в блоге (без темы)','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма',100,'email'),(34,'ru','BLOG_YOUR_BLOG_TO_USER','Ваш блог был добавлен в друзья','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100,'email'),(35,'ru','BLOG_YOU_TO_BLOG','Вы были добавлены в друзья блога','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100,'email'),(36,'ru','BLOG_BLOG_TO_YOU','К вам в друзья был добавлен блог','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100,'email'),(37,'ru','BLOG_USER_TO_YOUR_BLOG','В ваш блог был добавлен друг','#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n',100,'email'),(38,'ru','BLOG_SONET_NEW_POST','Добавлено новое сообщение','#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100,'email'),(39,'ru','BLOG_SONET_NEW_COMMENT','Добавлен новый комментарий','#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100,'email'),(40,'ru','BLOG_SONET_POST_SHARE','Добавлен новый получатель сообщения','#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n',100,'email'),(41,'ru','BLOG_POST_BROADCAST','Добавлено новое сообщение','\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма',100,'email'),(42,'en','NEW_BLOG_MESSAGE','New blog message','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100,'email'),(43,'en','NEW_BLOG_COMMENT','New comment in blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100,'email'),(44,'en','NEW_BLOG_COMMENT2COMMENT','New comment for your in blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100,'email'),(45,'en','NEW_BLOG_COMMENT_WITHOUT_TITLE','New comment in blog (without subject)','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100,'email'),(46,'en','NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE','New comment for your in blog (without subject)','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email',100,'email'),(47,'en','BLOG_YOUR_BLOG_TO_USER','Your blog has been added to friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100,'email'),(48,'en','BLOG_YOU_TO_BLOG','You have been added to blog friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100,'email'),(49,'en','BLOG_BLOG_TO_YOU','A blog has been added to your friends','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100,'email'),(50,'en','BLOG_USER_TO_YOUR_BLOG','A friend has been added to your blog','#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail',100,'email'),(51,'en','BLOG_SONET_NEW_POST','New post added','#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100,'email'),(52,'en','BLOG_SONET_NEW_COMMENT','Comment added','#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100,'email'),(53,'en','BLOG_SONET_POST_SHARE','New recipient added','#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL',100,'email'),(54,'en','BLOG_POST_BROADCAST','New post added','\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient',100,'email'),(55,'ru','NEW_FORUM_MESSAGE','Новое сообщение на форуме','\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма',100,'email'),(56,'ru','NEW_FORUM_PRIV','Приватное письмо посетителю форума','\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения',100,'email'),(57,'ru','NEW_FORUM_PRIVATE_MESSAGE','Приватное сообщение','\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение',100,'email'),(58,'ru','EDIT_FORUM_MESSAGE','Изменение сообщения на форуме','\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма',100,'email'),(59,'en','NEW_FORUM_MESSAGE','New forum message','\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail',100,'email'),(60,'en','NEW_FORUM_PRIV','Private message for forum user','\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date',100,'email'),(61,'en','NEW_FORUM_PRIVATE_MESSAGE','Private message for forum user','\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message',100,'email'),(62,'en','EDIT_FORUM_MESSAGE','Changing forum message','\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail',100,'email'),(63,'ru','FORUM_NEW_MESSAGE_MAIL','Новое сообщение на форуме в режиме общения по E-Mail','#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n',100,'email'),(64,'en','FORUM_NEW_MESSAGE_MAIL','New message at the forum (e-mail messaging mode)','#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n',100,'email'),(65,'ru','VIRUS_DETECTED','Обнаружен вирус','#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)',100,'email'),(66,'en','VIRUS_DETECTED','Virus detected','#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)',100,'email'),(67,'ru','SUBSCRIBE_CONFIRM','Подтверждение подписки','#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n',100,'email'),(68,'en','SUBSCRIBE_CONFIRM','Confirmation of subscription','#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n',100,'email'),(69,'ru','VOTE_FOR','Новый голос','#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n',100,'email'),(70,'en','VOTE_FOR','New vote','#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL',100,'email');
/*!40000 ALTER TABLE `b_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_favorite`
--

DROP TABLE IF EXISTS `b_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_favorite` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(11) NOT NULL DEFAULT 100,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `URL` text DEFAULT NULL,
  `COMMENTS` text DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(11) DEFAULT NULL,
  `COMMON` char(1) NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_favorite`
--

LOCK TABLES `b_favorite` WRITE;
/*!40000 ALTER TABLE `b_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file`
--

DROP TABLE IF EXISTS `b_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) NOT NULL,
  `ORIGINAL_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `HANDLER_ID` varchar(50) DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file`
--

LOCK TABLES `b_file` WRITE;
/*!40000 ALTER TABLE `b_file` DISABLE KEYS */;
INSERT INTO `b_file` VALUES (1,'2024-02-07 11:20:21','iblock',97,117,7208,'image/gif','iblock/0c8','aswzqfn18aj0obe37y680hnmbhne7mrl.gif','9f643eecc497982747178145cc4736a4.gif','',NULL,'7d53fd6e5f9bdc2254bfd1b1fceb5cc4'),(2,'2024-02-07 11:20:21','iblock',97,118,6154,'image/gif','iblock/6a1','ela7dvm64auyryoxrztf0s4u2qucf4dk.gif','9baa9f7a5c946e28647383d6d4a7fed2.gif','',NULL,'b6bc62034164da446f42407ddaf4b5fd'),(3,'2024-02-07 11:20:22','iblock',97,115,7024,'image/gif','iblock/293','rk18c53yzsybauqj5zxfsgho8dvbdf36.gif','3583b1ad0ff085c4fc5cc3ef35c117f5.gif','',NULL,'5e4d3c6be2f76c8e57707cc3b98287bd'),(4,'2024-02-07 11:20:22','iblock',97,117,8177,'image/gif','iblock/4a5','grv0xxqe42avq3m1dyiy60bof5lksc2l.gif','e41c3f9d5834738bb4b1a8bda651989d.gif','',NULL,'d2052402cea29429468c1da2434056a8'),(5,'2024-02-28 09:01:21','iblock',75,82,6081,'image/jpeg','iblock/1e1','7ttfzts0rl37marvkagwq3m9gqlnvcem.jpg','2e602c1c22ccb832df21ad28ad5edaad.jpg','',NULL,'3d6953d644741f5422d2587a593c2263'),(6,'2024-02-28 09:01:21','iblock',365,400,93204,'image/jpeg','iblock/e18','p5kdhk9tix7aq19e3bq89piv0cu32uo2.jpg','09812c445d3ee5f5311bbe7e44ee7d6f.jpg','',NULL,'5283ee24cd05daf110e03ab43f4bac3f'),(7,'2024-02-28 09:01:38','iblock',62,75,4431,'image/jpeg','iblock/dad','2id9t6sbjy6pyn5biftuhci14757k6yu.jpg','bb30381459dbbbe12e882e632f6b1c53.jpg','',NULL,'18bda3d93fb4e324c88431f8fe55d0d1'),(8,'2024-02-28 09:01:38','iblock',331,400,82283,'image/jpeg','iblock/c5b','rfyn4ltqviet7ptxjh2qzckjjk2iasna.jpg','626ca8c573225d46d0b4d809cebb3dae.jpg','',NULL,'af7e00e83208f0d27fcfd0a586889b56'),(9,'2024-02-28 09:01:59','iblock',75,47,3075,'image/jpeg','iblock/f86','0s6vfy1eifp8rbxht93rztfhx1oioj4l.jpg','1f5d4439c837ba415e78b9645ae0d73b.jpg','',NULL,'0c1b03f1f8124195da9ef3ac403ece35'),(10,'2024-02-28 09:01:59','iblock',400,250,29739,'image/jpeg','iblock/913','c5zgaou2l8l4njno8815sa8hwna3g22s.jpg','885f25305f6c920393bf447112730a32.jpg','',NULL,'e79d2e9452ccbd82571df4bf01852040'),(11,'2024-02-28 09:01:47','iblock',75,49,3038,'image/jpeg','iblock/ed6','nhyaxdgsaldwhtubs7wyqbcs4atmntl0.jpg','ab929afb73ab299a22e03cc039569505.jpg','',NULL,'96374bba59bf9d261b8a02f6b2d6e71d'),(12,'2024-02-28 09:01:47','iblock',400,260,36309,'image/jpeg','iblock/de3','93fh5w4hrninw0ipbtmqud7k690q26ij.jpg','f2bca316eede55098cab3bfda5b46697.jpg','',NULL,'0e1348b0e7b7e09d7f895c00090eeb96'),(13,'2024-02-07 11:20:22','iblock',75,46,2766,'image/jpeg','iblock/0a8','mnk5ay99cry8u141y9urjlyhaolridnn.jpg','74a072234e4b35fc24ee618bfc7dc98b.jpg','',NULL,'7c2658a279bd637b08512f9defd16f98'),(14,'2024-02-07 11:20:22','iblock',400,247,26265,'image/jpeg','iblock/61a','cocoj8o0p6r3rs5ez88nhf3jqjn695pn.jpg','6237fa3331d46f6efe0409d7d24cdb25.jpg','',NULL,'273a4a3252059c2b9c58950688feb714'),(15,'2024-02-07 11:20:22','iblock',59,75,4604,'image/jpeg','iblock/f91','5xvhba22n0x50cx6wi977hw2c0cukyzw.jpg','3392f27c38911965c60026ff9c0d3ef6.jpg','',NULL,'759ddcb28cfa28f4f738a771c5dea860'),(16,'2024-02-07 11:20:22','iblock',313,400,57378,'image/jpeg','iblock/a1a','714snvyjivoxewfhikd2kmc87djr375m.jpg','baee3922cc3b782c479845cd9a51aa2b.jpg','',NULL,'69062352802a2fb70aaf922a1d0bb827'),(17,'2024-02-07 11:20:22','iblock',49,75,3877,'image/jpeg','iblock/91e','hhpdo4cyzcgmg0c7agfocnyod3p60img.jpg','2bdc35b67545840a286ee2ade1e53cf1.jpg','',NULL,'83e82da486d3aee8154ebe32013ee596'),(18,'2024-02-07 11:20:22','iblock',264,400,96792,'image/jpeg','iblock/178','5o033ibd6tw38ems3k38i6zyl70olmqi.jpg','9444ca19815887874cfa5ccd2cf9b08e.jpg','',NULL,'7171e0094700d62bc27291c7b410b0d8'),(19,'2024-02-07 11:20:22','iblock',41,75,4223,'image/jpeg','iblock/9ac','sizzwwqd6xj1xh51cdt33hwdrd087iwk.jpg','9b1cf849b8732e25002db920755486e9.jpg','',NULL,'776636a0fe1dbc845ea9e0d40603e045'),(20,'2024-02-07 11:20:22','iblock',220,400,65934,'image/jpeg','iblock/045','2r4svgz1611v2jdr1x8vef6en5lthwb2.jpg','38f3bb38d0be153aa8233f8959141b8d.jpg','',NULL,'d5df0dc45acdde4cf226a92fac94045b'),(21,'2024-02-07 11:20:22','iblock',62,75,4454,'image/jpeg','iblock/679','iwnlycf7iig3xk91adeegat0dhkkgng0.jpg','d64f02c32d7aec7d187dfb4d6e89c56b.jpg','',NULL,'64d814c44c6d9745a83bfe53ca06bc87'),(22,'2024-02-07 11:20:22','iblock',329,400,78028,'image/jpeg','iblock/aba','qclm0dzeb58b91qv7lj2vp093bbm61hy.jpg','445fcbf65c020dbaebf811a58b7ef941.jpg','',NULL,'8fd2f4574d12f852da313d5c3a909546'),(23,'2024-02-07 11:20:22','iblock',50,75,4281,'image/jpeg','iblock/05d','w9ucmdi2consufgwc5zja4g3xb8jzd8b.jpg','4d4fcbcf706e07d5920751b96b2390a2.jpg','',NULL,'ca9a25c506a5bb072bfa2fb8f8f4f7b8'),(24,'2024-02-07 11:20:22','iblock',269,400,62994,'image/jpeg','iblock/287','vh1jsoxqpfr3otfjqb35u1ggugwdrmik.jpg','7412d2f4d2b8e91187d39405c1c331c0.jpg','',NULL,'1c2f06b8a9d08dc2e2bb913296db7781'),(25,'2024-02-07 11:20:22','iblock',32,75,2529,'image/jpeg','iblock/f73','s40vj2eakfnys206fkv8rpk6gbbbr22p.jpg','a20a430640daab0d2e80587a991043dc.jpg','',NULL,'2827ed6555e2ad7d1ab9fa05178fd86a'),(26,'2024-02-07 11:20:22','iblock',171,400,43694,'image/jpeg','iblock/3eb','emo2hy44su3b2eap78e2nllplra0yyk7.jpg','2b671b45113c251546674131e9681c89.jpg','',NULL,'297208428a1f9ac7e704dc2d038fffc5'),(27,'2024-02-07 11:20:22','iblock',52,75,3543,'image/jpeg','iblock/db4','pb37btxie5aftmt6on7q9sy239rnx401.jpg','35962bde726c3ffaf7ccdfd9bb607379.jpg','',NULL,'d26bf387d81e2aee9bd568a2fbf9e9cf'),(28,'2024-02-07 11:20:22','iblock',276,400,45830,'image/jpeg','iblock/887','w0i83mu2yqte5gxztwg8rvcfoiyil3b0.jpg','1421f08c8613b257c93f95ca3fd2826d.jpg','',NULL,'da0fbd7b44de760571741022ef770e56'),(29,'2024-02-07 11:20:22','iblock',69,75,4545,'image/jpeg','iblock/8dc','zsesulkywxv3crqj29urkhjz70iwfbxj.jpg','331184f76e4aafea8728856ad06f4487.jpg','',NULL,'7b930d7182ff8df315ab518e35639b70'),(30,'2024-02-07 11:20:22','iblock',366,400,50389,'image/jpeg','iblock/04a','wiqrfeqsf0yw43g30zvxl50eodzwxmw7.jpg','e26a955a944250ca5980f143faaadfbb.jpg','',NULL,'eeb73a53c1dcf5b3e792efa2d615301b'),(31,'2024-02-07 11:20:22','iblock',52,75,4430,'image/jpeg','iblock/3ef','kkxke2by1vbdtdvtic10ftqymafi034k.jpg','3e84c9ae297f66002462ef2782524e1c.jpg','',NULL,'501bbf46014cb1d281b53ea7b83cd0c5'),(32,'2024-02-07 11:20:22','iblock',279,400,60160,'image/jpeg','iblock/874','pbeuls44cm7br8drgbymy81h6pcy6ley.jpg','16798358158a0c4e8e280370dad92e34.jpg','',NULL,'95830a915d346e71c4c149849c10afe1'),(33,'2024-02-07 11:20:22','iblock',75,74,5105,'image/jpeg','iblock/935','a57i0nnv8pxbtpzn8e8i39urmpaa1nzc.jpg','809194f5dcf2a15a37cdcaa8e3abbe3d.jpg','',NULL,'c650d99532bef755d0ffa9335f470802'),(34,'2024-02-07 11:20:22','iblock',400,394,67705,'image/jpeg','iblock/565','e2lbk2ccd4v1m1frxpj6840t5y326suj.jpg','2883876e37fde7403e471cc9a24ea3e7.jpg','',NULL,'a98e999a2533a72f0e0cb3849a67138e'),(35,'2024-02-07 11:20:22','iblock',75,54,3651,'image/jpeg','iblock/5c0','i9111vtk0m9eorzz1z2zvpgemve043r1.jpg','434f471a7920ed00e08fb3916569e1f7.jpg','',NULL,'35315885e9c2132a90402689d9d98228'),(36,'2024-02-07 11:20:22','iblock',400,286,40331,'image/jpeg','iblock/0dd','23uj4hj75p70u5y033lalc3g3sf37upc.jpg','7fe0d47b409d9aa6097128b113e753b9.jpg','',NULL,'db91cd9c30e5b3cc674f7eddee9c5a1b'),(37,'2024-02-07 11:20:22','iblock',75,45,3564,'image/jpeg','iblock/276','kn2m2r5wwtw3ldnp9bog2it9fo3wdcb3.jpg','a7b9328dab5d8599953605e2d14da0b3.jpg','',NULL,'1f5ad9c2de69e183b83bad77cc962acf'),(38,'2024-02-07 11:20:22','iblock',400,238,42306,'image/jpeg','iblock/543','6hdu6mka47b0d7l0rd6h18vobcxl3h1m.jpg','e4427787c59b56b70a9c0381453f88dc.jpg','',NULL,'6066afff6bef5b67dc850b1e250443c5'),(39,'2024-02-07 11:20:22','iblock',75,47,2666,'image/jpeg','iblock/090','ujj43v17qaehyd861v7w6qhg18lgrng9.jpg','3413e989dd3239527ed2144bdb285a2b.jpg','',NULL,'4b03f33675077b161fcd9838a1e46871'),(40,'2024-02-07 11:20:22','iblock',400,249,26842,'image/jpeg','iblock/649','2t1df6y9tzkg9lzqutsxc28oac0gqohy.jpg','4f2b682c4cc7361e22e669e8faa4f344.jpg','',NULL,'22bc15f7d776a5791911747dc5f30f8d'),(41,'2024-02-07 11:20:22','iblock',75,45,3069,'image/jpeg','iblock/2e2','aj2z9iyb84q1abutfbm7qbad64ds7kwl.jpg','26051473b5a68363a0882915e3e020e5.jpg','',NULL,'77546ef250c95307818c6ad777af92a9'),(42,'2024-02-07 11:20:22','iblock',400,239,36150,'image/jpeg','iblock/0cc','jvzc8uknke56dl8du21dt1vfvwrw26a4.jpg','8c00778d633d1db6aaf29242c1602897.jpg','',NULL,'9a0e6191b30dfb9512873f84150f1b5b'),(43,'2024-02-07 11:20:22','iblock',75,47,3403,'image/jpeg','iblock/8d7','tav9k4wgog7aw17icua497lxj0rdbohr.jpg','d1a244031379e20a9d7f9cf85227bb2e.jpg','',NULL,'d536cb262a775e7a33c59e741a65fb68'),(44,'2024-02-07 11:20:22','iblock',400,250,34322,'image/jpeg','iblock/429','lg8ko0p8emvydoemzomz3my42ebzez0a.jpg','8b88ada642f37df4236b4cd129b85292.jpg','',NULL,'07d3de993206ddb91a7c294628ee6f31'),(45,'2024-02-07 11:20:22','iblock',75,49,3941,'image/jpeg','iblock/592','fhec7blaxkopsrrivxu8xn1zrl11is7x.jpg','af64b255f19f75b080d5b934f156c590.jpg','',NULL,'61e525d263d7f8cb5ce1a186de828dd6'),(46,'2024-02-07 11:20:22','iblock',400,261,37746,'image/jpeg','iblock/493','wl6c318emp7xl2a0ubzdncl12kxb2kas.jpg','b6dabd5a96bb11b68a8d7d2dd9c9a4e0.jpg','',NULL,'f35118d226de5343ce4c15837d724593'),(47,'2024-02-07 11:20:22','iblock',75,59,3571,'image/jpeg','iblock/18c','u3za7auagm3dfxtupnju4g1o727mlea2.jpg','058550b5373b90e56aacb376028089f4.jpg','',NULL,'32c8acb82b20ed1f321579592ae36679'),(48,'2024-02-07 11:20:22','iblock',400,312,34110,'image/jpeg','iblock/08f','znk9eqqzaw322rq15a3cmhlsg3pwbkyz.jpg','e2612b793f41a81309fcc54bcbf65783.jpg','',NULL,'63651af8b8f14ef256781e1c2eee6cd0'),(49,'2024-02-07 11:20:22','iblock',75,48,3030,'image/jpeg','iblock/dcd','umuo22umc258jz1a1jcj6jyekavlimi7.jpg','8065fe760829c4055200ea4831d72c17.jpg','',NULL,'26181ea78fc81ca40dbea1fe6f5d2119'),(50,'2024-02-07 11:20:22','iblock',400,258,29503,'image/jpeg','iblock/18a','5jtpd4cq3f65aa30hhwp271zpbaccaia.jpg','8b6d3cc80b138843463e65ae7a97ffe1.jpg','',NULL,'dbc94ffb6443ec079d467d2fe450af3d'),(51,'2024-02-07 11:20:22','iblock',75,52,2250,'image/jpeg','iblock/d82','31vywb5d74r845d2jecdaw0i38mtvz19.jpg','a89665621b4b083248a5a8016be4e380.jpg','',NULL,'f1f02ba5369942a2b5c58cf449602cbc'),(52,'2024-02-07 11:20:22','iblock',400,279,22919,'image/jpeg','iblock/b6e','arlyla5nl8ldjdo07bas7knweaca3msp.jpg','93de20bec81a906df174ababa31d856e.jpg','',NULL,'d38a65fd7e48941ed427c044e1028ced'),(53,'2024-02-07 11:20:22','iblock',97,115,5781,'image/gif','iblock/c48','lcz8u6p093yy130loq6kh2nxbypf521n.gif','8b0b3bc52fec8070e3561af5d05cd3a8.gif','',NULL,'4a3d72dcce6a28ea9aa42a81e7c61665'),(54,'2024-02-07 11:20:22','iblock',97,116,7345,'image/gif','iblock/ace','i4pj3ntrkyz4cl0bgp3xr2biiuv7sc8e.gif','38bf3b317397e56d07fe06731ca3a441.gif','',NULL,'383d86d3cfb7a3513c84f410f09b59a6'),(55,'2024-02-09 06:26:16','fileman',438,438,28599,'image/jpeg','medialibrary/6e2','jgaqt4h97v6rdxknvdytxg8iosnp41zx.jpg','paint1.jpg','',NULL,'62440ad147a634f764292f02fa17d622'),(56,'2024-02-27 06:39:14','iblock',1050,700,83310,'image/jpeg','iblock/fde','vkwo95048bbfy2pk31u9zp2851c7il5a.jpg','1-w.jpg','',NULL,'9b78c68b2f576b7fb78892922109b018'),(57,'2024-02-27 06:39:14','iblock',1050,700,83310,'image/jpeg','iblock/fde','vkwo95048bbfy2pk31u9zp2851c7il5a.jpg','1-w.jpg','',NULL,'fa46e28f0fd8e9abdc878ece64056c45'),(58,'2024-02-27 06:38:50','iblock',1024,1024,106981,'image/jpeg','iblock/108','oft2zgfn5kkr0jvkgz3rmn0vss2fzq0n.jpg','1.jpg','',NULL,'8e038cfcdd4b00055359bbd7d77a9d58'),(59,'2024-02-27 06:38:50','iblock',1024,1024,106981,'image/jpeg','iblock/108','oft2zgfn5kkr0jvkgz3rmn0vss2fzq0n.jpg','1.jpg','',NULL,'3b3e33585ca9769a759c5599fb45b7d4'),(60,'2024-02-27 06:38:30','iblock',1024,768,44689,'image/jpeg','iblock/d68','exjdtwcg0u3bty8r4sh8vwix8whbz164.jpg','2-w.jpg','',NULL,'647bd0aaff8396638e90ed30dd26cc1d'),(61,'2024-02-27 06:38:30','iblock',1024,768,44689,'image/jpeg','iblock/d68','exjdtwcg0u3bty8r4sh8vwix8whbz164.jpg','2-w.jpg','',NULL,'83b2b0603a4dd0cdbf3bb48f1b7f15e2'),(62,'2024-02-27 06:38:11','iblock',600,400,19375,'image/jpeg','iblock/78d','13hg0k7o68hxlzv7xprynjo5xx6u9ky7.jpg','2.jpg','',NULL,'afeba2b7278d0a27f904531e12e27874'),(63,'2024-02-27 06:38:11','iblock',600,400,19375,'image/jpeg','iblock/78d','13hg0k7o68hxlzv7xprynjo5xx6u9ky7.jpg','2.jpg','',NULL,'c8c6426719d8add541eb2a7420fde428'),(64,'2024-02-27 06:38:03','iblock',2551,1920,681764,'image/jpeg','iblock/f41','5ln4nfpizuwok23ia25rtb747pzoiqoe.jpg','3-w.jpg','',NULL,'485061e8203df58a1a59d879b622fd77'),(65,'2024-02-27 06:38:03','iblock',2551,1920,681764,'image/jpeg','iblock/f41','5ln4nfpizuwok23ia25rtb747pzoiqoe.jpg','3-w.jpg','',NULL,'a42abbf7a8662e7bfd7b60275259952b'),(66,'2024-02-27 06:38:40','iblock',408,612,26216,'image/jpeg','iblock/16d','che2avz1ok120uf3uhmv722y79gbqj0v.jpg','3.jpg','',NULL,'ffbaf9c987e091bb51fcec82e5123d58'),(67,'2024-02-27 06:38:40','iblock',408,612,26216,'image/jpeg','iblock/16d','che2avz1ok120uf3uhmv722y79gbqj0v.jpg','3.jpg','',NULL,'8c0691109138a5ef070c3e1579d4d3a9'),(71,'2024-02-27 07:27:04','iblock',250,250,16907,'image/png','iblock/6af','0yc0swqy243690f3kzgu5og9gemyy5lo.png','акция3.png','',NULL,'1aee36601ba0ffa9b47d0c8bb6dec9f3'),(72,'2024-02-27 07:27:14','iblock',250,250,12817,'image/png','iblock/37f','5eqp5h6xuqb4qpep5kftsuoznlc8krbj.png','акция2.png','',NULL,'0b28c7bb0940b16bc4d62b884b105803'),(73,'2024-02-27 07:27:26','iblock',250,250,11430,'image/png','iblock/d0c','c0txrhjnjs16jn7npdes9e0q3ufrfglh.png','акция1.png','',NULL,'5052bd153d8e9cea565b3f360d335cfd'),(74,'2024-02-27 13:03:46','iblock',59,80,8284,'image/png','iblock/f36','mo8u0p9762f65t65xccmvtn6ngzv0rr3.png','13.png','',NULL,'5836ccbf8d40d895c7c9f2547f579fe2'),(75,'2024-02-27 13:03:46','iblock',136,184,32924,'image/png','iblock/e72','ybwhn8sv600m1p3tekqnwl7ylamxdl4a.png','13.png','',NULL,'7ab4cab8a85ac8ce9b96698b3113bcfd'),(76,'2024-02-27 13:04:14','iblock',60,38,5002,'image/png','iblock/5b8','d7x0f631bgfmdhn7ds0npdcor76b0baq.png','10.png','',NULL,'5a2a3e9b152dfce83251e86349cf247b'),(77,'2024-02-27 13:04:14','iblock',390,250,99996,'image/png','iblock/a97','r4x2a0g6pmp330dkyyu1f2w4kd5fdqkx.png','10.png','',NULL,'7d769bb7e10e021baf7b23933078edc5'),(78,'2024-02-27 13:04:50','iblock',59,80,8341,'image/png','iblock/11a','aik087tmesg8pn317spu39k2oybbrfab.png','5.png','',NULL,'3cc4d516c10b48a9bc00c1fa785ee6dd'),(79,'2024-02-27 13:04:50','iblock',96,130,19799,'image/png','iblock/11b','dnq2239x4yuaiamqhh69e7pm1kobc2wu.png','5.png','',NULL,'b152549b58743af91443384f3334eb0d');
/*!40000 ALTER TABLE `b_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file_duplicate`
--

DROP TABLE IF EXISTS `b_file_duplicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file_duplicate` (
  `DUPLICATE_ID` int(11) NOT NULL,
  `ORIGINAL_ID` int(11) NOT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT 1,
  `ORIGINAL_DELETED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  KEY `ix_file_duplicate_duplicate` (`ORIGINAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file_duplicate`
--

LOCK TABLES `b_file_duplicate` WRITE;
/*!40000 ALTER TABLE `b_file_duplicate` DISABLE KEYS */;
INSERT INTO `b_file_duplicate` VALUES (57,56,1,'N'),(59,58,1,'N'),(61,60,1,'N'),(63,62,1,'N'),(65,64,1,'N'),(67,66,1,'N');
/*!40000 ALTER TABLE `b_file_duplicate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file_hash`
--

DROP TABLE IF EXISTS `b_file_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file_hash` (
  `FILE_ID` int(11) NOT NULL,
  `FILE_SIZE` bigint(20) NOT NULL,
  `FILE_HASH` varchar(50) NOT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file_hash`
--

LOCK TABLES `b_file_hash` WRITE;
/*!40000 ALTER TABLE `b_file_hash` DISABLE KEYS */;
INSERT INTO `b_file_hash` VALUES (51,2250,'972d9a244f1afd1287890b87c5108bcc'),(25,2529,'e67f86ea4e543d6c55b1efc8658a3768'),(39,2666,'e8f8432f3db3efdfa34ecc7ef1055421'),(13,2766,'ebed23f646d3caa94be2ecc8f120f348'),(49,3030,'d42b550c90b4ba257d2450e71fdc9af9'),(11,3038,'ebae70f5b8e0b7f32491e8cb3d4a5fe0'),(41,3069,'6f6f636ab86802825d54b2e63af234d3'),(9,3075,'4d4dba83eefeca5ee297bf001f2ebe49'),(43,3403,'22c0571db1dffa96bfec36af3491686c'),(27,3543,'6faa1cc2118271dbaa0b8b7c91be083d'),(37,3564,'b2d9df531428c9c4ab2069ff3cccb396'),(47,3571,'0f0567a0fd983b832defa9457aeb86e8'),(35,3651,'b8503c324cc4791770600cfe02502338'),(17,3877,'3cc3d123dcb0e2e2b9c0b132c6899377'),(45,3941,'0e1ba47356d2ed06dda95fd165c84f91'),(19,4223,'d013802d4eaacb22d3b191ae9336acfc'),(23,4281,'f6c5cb158fc20b08bc19783594d2c2c6'),(31,4430,'6a57320a23c83b68513de2d1dffd7c45'),(7,4431,'8d9db9b5c7256a0a2e0665c9a0ce717b'),(21,4454,'c38c571f461f73d6603f6f9899bfb38f'),(29,4545,'bf7b6806fd8fb5744524cccdbd6d20c1'),(15,4604,'4b638ea72e35801d725467ea6a6b22d0'),(76,5002,'06ad12262f2ef21961c14ebbd792953a'),(33,5105,'b69f3c2e6f93afbbafd0593bcef0014a'),(53,5781,'af2dd12dfa0512b48f07ce860ffc0f22'),(5,6081,'1dd24849a140831fa3bfdf9216cfa324'),(2,6154,'801fd67c05feb823f41dc1b04bccb28b'),(3,7024,'8871eb4e30bee10042b94bdf6ba4c9de'),(1,7208,'f555d211cdbc1813d85fc86510b71271'),(54,7345,'9d10c04d9d1b5a2a1ce108bdece71968'),(4,8177,'b3e1ec608ed05b955679e36f3f880f3a'),(74,8284,'ad6e39985787fc8058d04a766b9c1956'),(78,8341,'5b93b68fcdbde0d217302f5e99b0c1f7'),(73,11430,'a88bcbba2a68a761b09bdd261bf55e92'),(72,12817,'d2685d2d6f29823c585dad08ceac93f8'),(71,16907,'14e1e9c8f4d76e76368648a1e38d0f25'),(62,19375,'9ce583222213b0a6f5ecb70478066d88'),(79,19799,'6d288635f99412a29fdf10d09b6ed7c9'),(52,22919,'fa5c8a0c1e9ebab00250255146321cb7'),(66,26216,'aca04cf2f8aa4a4d2e4597c46a182a5e'),(14,26265,'e1a3c91f8b61bdf554d6a633cb571a13'),(40,26842,'f71ebe462284fe3d9885752584df5e00'),(55,28599,'a47faa0c61e35bd7be4356827295844c'),(50,29503,'7580a6e3dfda932dec8a33062627b4c5'),(10,29739,'55812c054f5b27968d6368c1f6ff99e3'),(75,32924,'af864f18f96a30498b9543a3472e4adf'),(48,34110,'36e2ccccd3ea42d4f257082efb638c24'),(44,34322,'1513b2aa8569e46de71ced35c75191c0'),(42,36150,'a6de9198d6dc111b0ed5b90021e08994'),(12,36309,'80348b430472b21300d07843d2243298'),(46,37746,'8a6b1bea0c2382f33c9e9daad1e3d81f'),(36,40331,'42670164f8c6df757777de5a505383a6'),(38,42306,'b913419ba9bc395b68eaadcf43f307e7'),(26,43694,'8935ffe5360ab7107aa9fa4dce5db83a'),(60,44689,'0194a7557341476b630f64e03243e70d'),(28,45830,'8d315ab23919cfe7bc8a27b17d3263bd'),(30,50389,'a4b82c4ad062e9db9393d2c36e57f4b0'),(16,57378,'9f0b948952c923c8f2681ec0a676ecda'),(32,60160,'970e21ce3dd16e5f086362ec16a2991b'),(24,62994,'867d262b3a87bffa5ccdbf263892237a'),(20,65934,'4a6d61200c65c5fae1edb3257f139814'),(34,67705,'c46e5cbe534fca3f80c16e28f392b871'),(22,78028,'566d3ca01a911209d725af6acf7fe2e2'),(8,82283,'d72d6689e017a5df9d4e934c33368a28'),(56,83310,'d91c126fb30926fc4bec63f573248ce9'),(6,93204,'7cd11330a85f6a33a965e556765e8377'),(18,96792,'c0ddb17f88c8774c49152597151bc889'),(77,99996,'240bf3d7816103878e4efa03dbea5f32'),(58,106981,'c924646cb8af2be5b72c20bb274d52c4'),(64,681764,'089317b710e1486bfe974f2439cc6068');
/*!40000 ALTER TABLE `b_file_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file_preview`
--

DROP TABLE IF EXISTS `b_file_preview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file_preview` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL,
  `PREVIEW_ID` int(11) DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int(11) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file_preview`
--

LOCK TABLES `b_file_preview` WRITE;
/*!40000 ALTER TABLE `b_file_preview` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_preview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file_search`
--

DROP TABLE IF EXISTS `b_file_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `F_PATH` varchar(255) DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT 0,
  `F_SIZE` int(11) NOT NULL DEFAULT 0,
  `F_TIME` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file_search`
--

LOCK TABLES `b_file_search` WRITE;
/*!40000 ALTER TABLE `b_file_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_file_version`
--

DROP TABLE IF EXISTS `b_file_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_file_version` (
  `ORIGINAL_ID` int(11) NOT NULL,
  `VERSION_ID` int(11) NOT NULL,
  `META` text DEFAULT NULL,
  PRIMARY KEY (`ORIGINAL_ID`),
  UNIQUE KEY `ux_file_version_version` (`VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_file_version`
--

LOCK TABLES `b_file_version` WRITE;
/*!40000 ALTER TABLE `b_file_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_filters`
--

DROP TABLE IF EXISTS `b_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_filters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FILTER_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FIELDS` text NOT NULL,
  `COMMON` char(1) DEFAULT NULL,
  `PRESET` char(1) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `PRESET_ID` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `SORT_FIELD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_filters`
--

LOCK TABLES `b_filters` WRITE;
/*!40000 ALTER TABLE `b_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_finder_dest`
--

DROP TABLE IF EXISTS `b_finder_dest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) DEFAULT NULL,
  `CONTEXT` varchar(50) NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_finder_dest`
--

LOCK TABLES `b_finder_dest` WRITE;
/*!40000 ALTER TABLE `b_finder_dest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_finder_dest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form`
--

DROP TABLE IF EXISTS `b_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SID` varchar(50) NOT NULL,
  `BUTTON` varchar(255) DEFAULT NULL,
  `C_SORT` int(18) DEFAULT 100,
  `FIRST_SITE_ID` char(2) DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) DEFAULT 'N',
  `DESCRIPTION` text DEFAULT NULL,
  `DESCRIPTION_TYPE` varchar(4) NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text DEFAULT NULL,
  `USE_DEFAULT_TEMPLATE` char(1) DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text DEFAULT NULL,
  `TABLE_RESULT_TEMPLATE` text DEFAULT NULL,
  `USE_RESTRICTIONS` char(1) DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT 0,
  `RESTRICT_TIME` int(10) DEFAULT 0,
  `RESTRICT_STATUS` varchar(255) DEFAULT NULL,
  `STAT_EVENT1` varchar(255) DEFAULT NULL,
  `STAT_EVENT2` varchar(255) DEFAULT NULL,
  `STAT_EVENT3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form`
--

LOCK TABLES `b_form` WRITE;
/*!40000 ALTER TABLE `b_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_group`
--

DROP TABLE IF EXISTS `b_form_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_group`
--

LOCK TABLES `b_form_2_group` WRITE;
/*!40000 ALTER TABLE `b_form_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_mail_template`
--

DROP TABLE IF EXISTS `b_form_2_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_mail_template`
--

LOCK TABLES `b_form_2_mail_template` WRITE;
/*!40000 ALTER TABLE `b_form_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_2_site`
--

DROP TABLE IF EXISTS `b_form_2_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_2_site`
--

LOCK TABLES `b_form_2_site` WRITE;
/*!40000 ALTER TABLE `b_form_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_answer`
--

DROP TABLE IF EXISTS `b_form_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) DEFAULT NULL,
  `FIELD_TYPE` varchar(255) NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_answer`
--

LOCK TABLES `b_form_answer` WRITE;
/*!40000 ALTER TABLE `b_form_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm`
--

DROP TABLE IF EXISTS `b_form_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL DEFAULT '',
  `ACTIVE` char(1) DEFAULT 'Y',
  `URL` varchar(255) NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm`
--

LOCK TABLES `b_form_crm` WRITE;
/*!40000 ALTER TABLE `b_form_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm_field`
--

DROP TABLE IF EXISTS `b_form_crm_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) DEFAULT 0,
  `FIELD_ALT` varchar(100) DEFAULT '',
  `CRM_FIELD` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm_field`
--

LOCK TABLES `b_form_crm_field` WRITE;
/*!40000 ALTER TABLE `b_form_crm_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_crm_link`
--

DROP TABLE IF EXISTS `b_form_crm_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `CRM_ID` int(18) NOT NULL DEFAULT 0,
  `LINK_TYPE` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_crm_link`
--

LOCK TABLES `b_form_crm_link` WRITE;
/*!40000 ALTER TABLE `b_form_crm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field`
--

DROP TABLE IF EXISTS `b_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TITLE` text DEFAULT NULL,
  `TITLE_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `SID` varchar(50) DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ADDITIONAL` char(1) NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text DEFAULT NULL,
  `FILTER_TITLE` text DEFAULT NULL,
  `RESULTS_TABLE_TITLE` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field`
--

LOCK TABLES `b_form_field` WRITE;
/*!40000 ALTER TABLE `b_form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field_filter`
--

DROP TABLE IF EXISTS `b_form_field_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `PARAMETER_NAME` varchar(50) NOT NULL,
  `FILTER_TYPE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field_filter`
--

LOCK TABLES `b_form_field_filter` WRITE;
/*!40000 ALTER TABLE `b_form_field_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_field_validator`
--

DROP TABLE IF EXISTS `b_form_field_validator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) DEFAULT 'y',
  `C_SORT` int(18) DEFAULT 100,
  `VALIDATOR_SID` varchar(255) NOT NULL DEFAULT '',
  `PARAMS` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_field_validator`
--

LOCK TABLES `b_form_field_validator` WRITE;
/*!40000 ALTER TABLE `b_form_field_validator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_validator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_menu`
--

DROP TABLE IF EXISTS `b_form_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `LID` char(2) NOT NULL,
  `MENU` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_menu`
--

LOCK TABLES `b_form_menu` WRITE;
/*!40000 ALTER TABLE `b_form_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_result`
--

DROP TABLE IF EXISTS `b_form_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_result`
--

LOCK TABLES `b_form_result` WRITE;
/*!40000 ALTER TABLE `b_form_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_result_answer`
--

DROP TABLE IF EXISTS `b_form_result_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT 0,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text DEFAULT NULL,
  `ANSWER_TEXT_SEARCH` longtext DEFAULT NULL,
  `ANSWER_VALUE` varchar(255) DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext DEFAULT NULL,
  `USER_TEXT` longtext DEFAULT NULL,
  `USER_TEXT_SEARCH` longtext DEFAULT NULL,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_result_answer`
--

LOCK TABLES `b_form_result_answer` WRITE;
/*!40000 ALTER TABLE `b_form_result_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status`
--

DROP TABLE IF EXISTS `b_form_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `DEFAULT_VALUE` char(1) NOT NULL DEFAULT 'N',
  `CSS` varchar(255) DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) DEFAULT NULL,
  `HANDLER_IN` varchar(255) DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status`
--

LOCK TABLES `b_form_status` WRITE;
/*!40000 ALTER TABLE `b_form_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status_2_group`
--

DROP TABLE IF EXISTS `b_form_status_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status_2_group`
--

LOCK TABLES `b_form_status_2_group` WRITE;
/*!40000 ALTER TABLE `b_form_status_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_form_status_2_mail_template`
--

DROP TABLE IF EXISTS `b_form_status_2_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_form_status_2_mail_template`
--

LOCK TABLES `b_form_status_2_mail_template` WRITE;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum`
--

DROP TABLE IF EXISTS `b_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT 150,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) NOT NULL DEFAULT 'DESC',
  `LID` char(2) NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT 0,
  `POSTS` int(11) NOT NULL DEFAULT 0,
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT 0,
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) DEFAULT 'forum',
  `EVENT2` varchar(255) DEFAULT 'message',
  `EVENT3` varchar(255) DEFAULT NULL,
  `HTML` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum`
--

LOCK TABLES `b_forum` WRITE;
/*!40000 ALTER TABLE `b_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum2site`
--

DROP TABLE IF EXISTS `b_forum2site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum2site`
--

LOCK TABLES `b_forum2site` WRITE;
/*!40000 ALTER TABLE `b_forum2site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum2site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_dictionary`
--

DROP TABLE IF EXISTS `b_forum_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) DEFAULT NULL,
  `TYPE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_dictionary`
--

LOCK TABLES `b_forum_dictionary` WRITE;
/*!40000 ALTER TABLE `b_forum_dictionary` DISABLE KEYS */;
INSERT INTO `b_forum_dictionary` VALUES (1,'[ru] Словарь слов','W'),(2,'[ru] Словарь транслита','T'),(3,'[en] Bad words','W'),(4,'[en] Transliteration','T');
/*!40000 ALTER TABLE `b_forum_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_email`
--

DROP TABLE IF EXISTS `b_forum_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `USE_EMAIL` char(1) DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) DEFAULT NULL,
  `USE_SUBJECT` char(1) DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_email`
--

LOCK TABLES `b_forum_email` WRITE;
/*!40000 ALTER TABLE `b_forum_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_file`
--

DROP TABLE IF EXISTS `b_forum_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`),
  CONSTRAINT `b_forum_file_ibfk_1` FOREIGN KEY (`FILE_ID`) REFERENCES `b_file` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_file`
--

LOCK TABLES `b_forum_file` WRITE;
/*!40000 ALTER TABLE `b_forum_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_filter`
--

DROP TABLE IF EXISTS `b_forum_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) DEFAULT NULL,
  `PATTERN` text DEFAULT NULL,
  `REPLACEMENT` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `USE_IT` varchar(50) DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_filter`
--

LOCK TABLES `b_forum_filter` WRITE;
/*!40000 ALTER TABLE `b_forum_filter` DISABLE KEYS */;
INSERT INTO `b_forum_filter` VALUES (1,1,'*пизд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(2,1,'*пизж*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(3,1,'*сра%','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(4,1,'анобляд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(5,1,'взъеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(6,1,'бля','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(7,1,'долбоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(8,1,'дуроеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(9,1,'еби','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(10,1,'ебисти*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(11,1,'ебическ*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(12,1,'еблив*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(13,1,'ебло*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(14,1,'еблыс*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(15,1,'ебля','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(16,1,'ебс','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(17,1,'ебукент*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(18,1,'ебурген*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(19,1,'коноебит*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(20,1,'мозгоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(21,1,'мудоеб*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(22,1,'однохуйствен*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(23,1,'охуе*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(24,1,'охуи*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(25,1,'охуя*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(26,1,'разъеба*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(27,1,'распиздон*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(28,1,'расхуюж*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(29,1,'худоебин*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(30,1,'хуе','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(31,1,'хуебрат*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(32,1,'хуеглот*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(33,1,'хуеплёт*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(34,1,'хует*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(35,1,'хуила','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(36,1,'хул?','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(37,1,'хуя','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(38,1,'^бляд*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(39,1,'^пидор*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(40,1,'^хуев*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(41,1,'^хуем*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(42,1,'^хуй*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(43,1,'^хуяк*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(44,1,'^хуям*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(45,1,'^хуяр*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(46,1,'^хуяч*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(47,1,'^ъебал*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(48,1,'^ъебан*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(49,1,'^ъебар*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(50,1,'^ъебат*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(51,1,'^ъебен*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(52,1,'^ъеби','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(53,1,'^ъебис*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(54,1,'^ъебит*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(55,1,'^ъёбля*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(56,1,'^ъёбну*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(57,1,'^ъебу','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(58,1,'^ъебуч*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(59,1,'^ъебыв*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(60,1,'/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is','','','','Y','PTTRN'),(61,3,'angry','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(62,3,'ass','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(63,3,'asshole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(64,3,'banger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(65,3,'bastard','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(66,3,'batter','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(67,3,'bicho','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(68,3,'bisexual','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(69,3,'bitch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(70,3,'blumpkin','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(71,3,'booger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(72,3,'bugger*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(73,3,'bukakke','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(74,3,'bull','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(75,3,'bulldyke','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(76,3,'bullshit','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(77,3,'bunny','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(78,3,'bunnyfuck','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(79,3,'chocha','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(80,3,'chode','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(81,3,'clap','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(82,3,'coconuts','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(83,3,'cohones','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(84,3,'cojones','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(85,3,'coon','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(86,3,'cootch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(87,3,'cooter','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(88,3,'cornhole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(89,3,'cracka','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(90,3,'crap','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(91,3,'cum','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(92,3,'cunnilingus','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(93,3,'cunt*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(94,3,'damn*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(95,3,'dark*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(96,3,'dick','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(97,3,'dickhead','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(98,3,'diddle','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(99,3,'dildo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(100,3,'dilhole','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(101,3,'dingleberry','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(102,3,'doodle','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(103,3,'dork','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(104,3,'dumpster','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(105,3,'faggot','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(106,3,'fart','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(107,3,'frig','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(108,3,'fuck*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(109,3,'fucker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(110,3,'giz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(111,3,'goatse','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(112,3,'gook','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(113,3,'gringo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(114,3,'hobo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(115,3,'honky','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(116,3,'jackass','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(117,3,'jackoff','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(118,3,'jerkoff','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(119,3,'jiggaboo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(120,3,'jizz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(121,3,'kike','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(122,3,'mayo','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(123,3,'moose','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(124,3,'nigg*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(125,3,'paki','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(126,3,'pecker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(127,3,'piss','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(128,3,'poonanni','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(129,3,'poontang','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(130,3,'prick','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(131,3,'punch','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(132,3,'queef','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(133,3,'rogue','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(134,3,'sanchez','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(135,3,'schlong','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(136,3,'shit','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(137,3,'skank','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(138,3,'spaz','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(139,3,'spic','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(140,3,'teabag*','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(141,3,'tits','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(142,3,'twat','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(143,3,'twot','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(144,3,'vart','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(145,3,'wanker','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(146,3,'waste','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(147,3,'wetback','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(148,3,'whore','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(149,3,'wigger','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(150,3,'wog','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL'),(151,3,'wop','/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu','','','Y','TRNSL');
/*!40000 ALTER TABLE `b_forum_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_group`
--

DROP TABLE IF EXISTS `b_forum_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 150,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_group`
--

LOCK TABLES `b_forum_group` WRITE;
/*!40000 ALTER TABLE `b_forum_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_group_lang`
--

DROP TABLE IF EXISTS `b_forum_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_group_lang`
--

LOCK TABLES `b_forum_group_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_group_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_letter`
--

DROP TABLE IF EXISTS `b_forum_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT 0,
  `LETTER` varchar(50) DEFAULT NULL,
  `REPLACEMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_letter`
--

LOCK TABLES `b_forum_letter` WRITE;
/*!40000 ALTER TABLE `b_forum_letter` DISABLE KEYS */;
INSERT INTO `b_forum_letter` VALUES (1,2,'а','АаAa'),(2,2,'б','БбBb'),(3,2,'в','ВвVv'),(4,2,'г','Гг'),(5,2,'д','ДдDd'),(6,2,'е','ЁёЕеEe'),(7,2,'ё','ЁёЕеEe, [Йй]+[Оо]+'),(8,2,'ж','ЖжGg'),(9,2,'з','ЗзZz3'),(10,2,'и','ИиIi'),(11,2,'й','ЙйИиYy'),(12,2,'к','КкKk'),(13,2,'л','ЛлLl'),(14,2,'м','МмMm'),(15,2,'н','НнNn'),(16,2,'о','ОоOo'),(17,2,'п','ПпPp'),(18,2,'р','РрPpRr'),(19,2,'с','СсCc'),(20,2,'т','ТтTt'),(21,2,'у','УуUu'),(22,2,'ф','ФфFf'),(23,2,'х','ХхXx'),(24,2,'ц','ЦцCc'),(25,2,'ч','Чч'),(26,2,'ш','Шш'),(27,2,'щ','Щщ'),(28,2,'ь','ЪъЬь\"\','),(29,2,'ы','Ыы'),(30,2,'ъ','ЪъЬь\"\','),(31,2,'э','Ээ'),(32,2,'ю','Юю, [Йй]+[Оо]+'),(33,2,'я','Яя'),(34,2,'%','[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),(35,2,'^',',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),(36,2,'тся','%'),(37,2,'ться','%');
/*!40000 ALTER TABLE `b_forum_letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_message`
--

DROP TABLE IF EXISTS `b_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) NOT NULL DEFAULT 'N',
  `APPROVED` char(1) NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text DEFAULT NULL,
  `POST_MESSAGE_HTML` text DEFAULT NULL,
  `POST_MESSAGE_FILTER` text DEFAULT NULL,
  `POST_MESSAGE_CHECK` char(32) DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) DEFAULT NULL,
  `AUTHOR_IP` varchar(255) DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) DEFAULT NULL,
  `EDIT_REASON` text DEFAULT NULL,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `HTML` text DEFAULT NULL,
  `MAIL_HEADER` text DEFAULT NULL,
  `SERVICE_TYPE` tinyint(4) DEFAULT NULL,
  `SERVICE_DATA` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_FORUM_TOPIC` (`FORUM_ID`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_SERVICE_TYPE` (`SERVICE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_message`
--

LOCK TABLES `b_forum_message` WRITE;
/*!40000 ALTER TABLE `b_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_perms`
--

DROP TABLE IF EXISTS `b_forum_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_perms`
--

LOCK TABLES `b_forum_perms` WRITE;
/*!40000 ALTER TABLE `b_forum_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_pm_folder`
--

DROP TABLE IF EXISTS `b_forum_pm_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_pm_folder`
--

LOCK TABLES `b_forum_pm_folder` WRITE;
/*!40000 ALTER TABLE `b_forum_pm_folder` DISABLE KEYS */;
INSERT INTO `b_forum_pm_folder` VALUES (1,'SYSTEM_FOLDER_1',0,0),(2,'SYSTEM_FOLDER_2',0,0),(3,'SYSTEM_FOLDER_3',0,0),(4,'SYSTEM_FOLDER_4',0,0);
/*!40000 ALTER TABLE `b_forum_pm_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points`
--

DROP TABLE IF EXISTS `b_forum_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points`
--

LOCK TABLES `b_forum_points` WRITE;
/*!40000 ALTER TABLE `b_forum_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points2post`
--

DROP TABLE IF EXISTS `b_forum_points2post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points2post`
--

LOCK TABLES `b_forum_points2post` WRITE;
/*!40000 ALTER TABLE `b_forum_points2post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points2post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_points_lang`
--

DROP TABLE IF EXISTS `b_forum_points_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_points_lang`
--

LOCK TABLES `b_forum_points_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_points_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_private_message`
--

DROP TABLE IF EXISTS `b_forum_private_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT 0,
  `RECIPIENT_ID` int(11) DEFAULT 0,
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) DEFAULT NULL,
  `POST_MESSAGE` text NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` char(1) DEFAULT NULL,
  `REQUEST_IS_READ` char(1) DEFAULT NULL,
  `USE_SMILES` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_private_message`
--

LOCK TABLES `b_forum_private_message` WRITE;
/*!40000 ALTER TABLE `b_forum_private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_private_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_rank`
--

DROP TABLE IF EXISTS `b_forum_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_rank`
--

LOCK TABLES `b_forum_rank` WRITE;
/*!40000 ALTER TABLE `b_forum_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_rank_lang`
--

DROP TABLE IF EXISTS `b_forum_rank_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_rank_lang`
--

LOCK TABLES `b_forum_rank_lang` WRITE;
/*!40000 ALTER TABLE `b_forum_rank_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_service_deleted_message`
--

DROP TABLE IF EXISTS `b_forum_service_deleted_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_service_deleted_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  `NEW_TOPIC` char(1) NOT NULL DEFAULT 'N',
  `APPROVED` char(1) NOT NULL DEFAULT 'Y',
  `PARAM1` varchar(2) DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_MESSAGE_DELETED_ID` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_service_deleted_message`
--

LOCK TABLES `b_forum_service_deleted_message` WRITE;
/*!40000 ALTER TABLE `b_forum_service_deleted_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_service_deleted_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_service_statistic_queue`
--

DROP TABLE IF EXISTS `b_forum_service_statistic_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_service_statistic_queue` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(20) DEFAULT NULL,
  `ENTITY_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SERVICE_STATISTIC` (`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_service_statistic_queue`
--

LOCK TABLES `b_forum_service_statistic_queue` WRITE;
/*!40000 ALTER TABLE `b_forum_service_statistic_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_service_statistic_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_stat`
--

DROP TABLE IF EXISTS `b_forum_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) DEFAULT NULL,
  `PHPSESSID` varchar(255) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT 0,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_stat`
--

LOCK TABLES `b_forum_stat` WRITE;
/*!40000 ALTER TABLE `b_forum_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_subscribe`
--

DROP TABLE IF EXISTS `b_forum_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_subscribe`
--

LOCK TABLES `b_forum_subscribe` WRITE;
/*!40000 ALTER TABLE `b_forum_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_topic`
--

DROP TABLE IF EXISTS `b_forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `TITLE_SEO` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `STATE` char(1) NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT 150,
  `VIEWS` int(10) NOT NULL DEFAULT 0,
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT 0,
  `POSTS_SERVICE` int(10) NOT NULL DEFAULT 0,
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT 0,
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `HTML` text DEFAULT NULL,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_LAST_POSTER_ID` (`LAST_POSTER_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`),
  KEY `IX_FORUM_OWNER_ID` (`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_topic`
--

LOCK TABLES `b_forum_topic` WRITE;
/*!40000 ALTER TABLE `b_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user`
--

DROP TABLE IF EXISTS `b_forum_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT 0,
  `INTERESTS` text DEFAULT NULL,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) DEFAULT NULL,
  `SIGNATURE` varchar(255) DEFAULT NULL,
  `SHOW_NAME` char(1) NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT 0,
  `HIDE_FROM_ONLINE` char(1) NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user`
--

LOCK TABLES `b_forum_user` WRITE;
/*!40000 ALTER TABLE `b_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_forum`
--

DROP TABLE IF EXISTS `b_forum_user_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_forum`
--

LOCK TABLES `b_forum_user_forum` WRITE;
/*!40000 ALTER TABLE `b_forum_user_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_points`
--

DROP TABLE IF EXISTS `b_forum_user_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT 0,
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_points`
--

LOCK TABLES `b_forum_user_points` WRITE;
/*!40000 ALTER TABLE `b_forum_user_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_forum_user_topic`
--

DROP TABLE IF EXISTS `b_forum_user_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID3` (`FORUM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_forum_user_topic`
--

LOCK TABLES `b_forum_user_topic` WRITE;
/*!40000 ALTER TABLE `b_forum_user_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_geoip_handlers`
--

DROP TABLE IF EXISTS `b_geoip_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) NOT NULL,
  `CONFIG` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_geoip_handlers`
--

LOCK TABLES `b_geoip_handlers` WRITE;
/*!40000 ALTER TABLE `b_geoip_handlers` DISABLE KEYS */;
INSERT INTO `b_geoip_handlers` VALUES (1,100,'Y','\\Bitrix\\Main\\Service\\GeoIp\\GeoIP2',NULL),(2,110,'N','\\Bitrix\\Main\\Service\\GeoIp\\MaxMind',NULL),(3,120,'N','\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo',NULL);
/*!40000 ALTER TABLE `b_geoip_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_geoname`
--

DROP TABLE IF EXISTS `b_geoname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_geoname` (
  `ID` bigint(20) unsigned NOT NULL,
  `LANGUAGE_CODE` varchar(35) NOT NULL,
  `NAME` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`ID`,`LANGUAGE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_geoname`
--

LOCK TABLES `b_geoname` WRITE;
/*!40000 ALTER TABLE `b_geoname` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_geoname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group`
--

DROP TABLE IF EXISTS `b_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `C_SORT` int(11) NOT NULL DEFAULT 100,
  `ANONYMOUS` char(1) NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SECURITY_POLICY` text DEFAULT NULL,
  `STRING_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group`
--

LOCK TABLES `b_group` WRITE;
/*!40000 ALTER TABLE `b_group` DISABLE KEYS */;
INSERT INTO `b_group` VALUES (1,'2024-02-07 11:14:39','Y',1,'N','Y','Администраторы','Полный доступ к управлению сайтом.',NULL,NULL),(2,'2024-02-07 11:14:39','Y',2,'Y','Y','Все пользователи (в том числе неавторизованные)','Все пользователи, включая неавторизованных.',NULL,NULL),(3,'2024-02-07 11:14:39','Y',3,'N','Y','Пользователи, имеющие право голосовать за рейтинг','В эту группу пользователи добавляются автоматически.',NULL,'RATING_VOTE'),(4,'2024-02-07 11:14:39','Y',4,'N','Y','Пользователи имеющие право голосовать за авторитет','В эту группу пользователи добавляются автоматически.',NULL,'RATING_VOTE_AUTHORITY'),(5,'2024-02-07 11:20:20','Y',300,'N','Y','Контент-редакторы',NULL,NULL,'content_editor');
/*!40000 ALTER TABLE `b_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_collection_task`
--

DROP TABLE IF EXISTS `b_group_collection_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_collection_task`
--

LOCK TABLES `b_group_collection_task` WRITE;
/*!40000 ALTER TABLE `b_group_collection_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_collection_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_subordinate`
--

DROP TABLE IF EXISTS `b_group_subordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_subordinate` (
  `ID` int(11) NOT NULL,
  `AR_SUBGROUP_ID` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_subordinate`
--

LOCK TABLES `b_group_subordinate` WRITE;
/*!40000 ALTER TABLE `b_group_subordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_subordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_group_task`
--

DROP TABLE IF EXISTS `b_group_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `EXTERNAL_ID` varchar(50) DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_group_task`
--

LOCK TABLES `b_group_task` WRITE;
/*!40000 ALTER TABLE `b_group_task` DISABLE KEYS */;
INSERT INTO `b_group_task` VALUES (5,19,''),(5,55,'');
/*!40000 ALTER TABLE `b_group_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity`
--

DROP TABLE IF EXISTS `b_hlblock_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity`
--

LOCK TABLES `b_hlblock_entity` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity_lang`
--

DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity_lang`
--

LOCK TABLES `b_hlblock_entity_lang` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hlblock_entity_rights`
--

DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hlblock_entity_rights`
--

LOCK TABLES `b_hlblock_entity_rights` WRITE;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hot_keys`
--

DROP TABLE IF EXISTS `b_hot_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hot_keys` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) NOT NULL,
  `CODE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hot_keys`
--

LOCK TABLES `b_hot_keys` WRITE;
/*!40000 ALTER TABLE `b_hot_keys` DISABLE KEYS */;
INSERT INTO `b_hot_keys` VALUES (1,'Ctrl+Alt+85',139,0),(2,'Ctrl+Alt+80',17,0),(3,'Ctrl+Alt+70',120,0),(4,'Ctrl+Alt+68',117,0),(5,'Ctrl+Alt+81',3,0),(6,'Ctrl+Alt+75',106,0),(7,'Ctrl+Alt+79',133,0),(8,'Ctrl+Alt+70',121,0),(9,'Ctrl+Alt+69',118,0),(10,'Ctrl+Shift+83',87,0),(11,'Ctrl+Shift+88',88,0),(12,'Ctrl+Shift+76',89,0),(13,'Ctrl+Alt+85',139,1),(14,'Ctrl+Alt+80',17,1),(15,'Ctrl+Alt+70',120,1),(16,'Ctrl+Alt+68',117,1),(17,'Ctrl+Alt+81',3,1),(18,'Ctrl+Alt+75',106,1),(19,'Ctrl+Alt+79',133,1),(20,'Ctrl+Alt+70',121,1),(21,'Ctrl+Alt+69',118,1),(22,'Ctrl+Shift+83',87,1),(23,'Ctrl+Shift+88',88,1),(24,'Ctrl+Shift+76',89,1);
/*!40000 ALTER TABLE `b_hot_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_hot_keys_code`
--

DROP TABLE IF EXISTS `b_hot_keys_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TITLE_OBJ` varchar(50) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `IS_CUSTOM` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_hot_keys_code`
--

LOCK TABLES `b_hot_keys_code` WRITE;
/*!40000 ALTER TABLE `b_hot_keys_code` DISABLE KEYS */;
INSERT INTO `b_hot_keys_code` VALUES (3,'CAdminTabControl','NextTab();','HK_DB_CADMINTC','HK_DB_CADMINTC_C','tab-container','',0),(5,'btn_new','var d=BX (\'btn_new\'); if (d) location.href = d.href;','HK_DB_BUT_ADD','HK_DB_BUT_ADD_C','btn_new','',0),(6,'btn_excel','var d=BX(\'btn_excel\'); if (d) location.href = d.href;','HK_DB_BUT_EXL','HK_DB_BUT_EXL_C','btn_excel','',0),(7,'btn_settings','var d=BX(\'btn_settings\'); if (d) location.href = d.href;','HK_DB_BUT_OPT','HK_DB_BUT_OPT_C','btn_settings','',0),(8,'btn_list','var d=BX(\'btn_list\'); if (d) location.href = d.href;','HK_DB_BUT_LST','HK_DB_BUT_LST_C','btn_list','',0),(9,'Edit_Save_Button','var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();','HK_DB_BUT_SAVE','HK_DB_BUT_SAVE_C','Edit_Save_Button','',0),(10,'btn_delete','var d=BX(\'btn_delete\'); if (d) location.href = d.href;','HK_DB_BUT_DEL','HK_DB_BUT_DEL_C','btn_delete','',0),(12,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();','HK_DB_FLT_FND','HK_DB_FLT_FND_C','find','',0),(13,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();','HK_DB_FLT_BUT_F','HK_DB_FLT_BUT_F_C','set_filter','',0),(14,'CAdminFilter','var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();','HK_DB_FLT_BUT_CNL','HK_DB_FLT_BUT_CNL_C','del_filter','',0),(15,'bx-panel-admin-button-help-icon-id','var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;','HK_DB_BUT_HLP','HK_DB_BUT_HLP_C','bx-panel-admin-button-help-icon-id','',0),(17,'Global','BXHotKeys.ShowSettings();','HK_DB_SHW_L','HK_DB_SHW_L_C','bx-panel-hotkeys','',0),(19,'Edit_Apply_Button','var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();','HK_DB_BUT_APPL','HK_DB_BUT_APPL_C','Edit_Apply_Button','',0),(20,'Edit_Cancel_Button','var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();','HK_DB_BUT_CANCEL','HK_DB_BUT_CANCEL_C','Edit_Cancel_Button','',0),(54,'top_panel_org_fav','','-=AUTONAME=-',NULL,'top_panel_org_fav',NULL,0),(55,'top_panel_module_settings','','-=AUTONAME=-',NULL,'top_panel_module_settings','',0),(56,'top_panel_interface_settings','','-=AUTONAME=-',NULL,'top_panel_interface_settings','',0),(57,'top_panel_help','','-=AUTONAME=-',NULL,'top_panel_help','',0),(58,'top_panel_bizproc_tasks','','-=AUTONAME=-',NULL,'top_panel_bizproc_tasks','',0),(59,'top_panel_add_fav','','-=AUTONAME=-',NULL,'top_panel_add_fav',NULL,0),(60,'top_panel_create_page','','-=AUTONAME=-',NULL,'top_panel_create_page','',0),(62,'top_panel_create_folder','','-=AUTONAME=-',NULL,'top_panel_create_folder','',0),(63,'top_panel_edit_page','','-=AUTONAME=-',NULL,'top_panel_edit_page','',0),(64,'top_panel_page_prop','','-=AUTONAME=-',NULL,'top_panel_page_prop','',0),(65,'top_panel_edit_page_html','','-=AUTONAME=-',NULL,'top_panel_edit_page_html','',0),(67,'top_panel_edit_page_php','','-=AUTONAME=-',NULL,'top_panel_edit_page_php','',0),(68,'top_panel_del_page','','-=AUTONAME=-',NULL,'top_panel_del_page','',0),(69,'top_panel_folder_prop','','-=AUTONAME=-',NULL,'top_panel_folder_prop','',0),(70,'top_panel_access_folder_new','','-=AUTONAME=-',NULL,'top_panel_access_folder_new','',0),(71,'main_top_panel_struct_panel','','-=AUTONAME=-',NULL,'main_top_panel_struct_panel','',0),(72,'top_panel_cache_page','','-=AUTONAME=-',NULL,'top_panel_cache_page','',0),(73,'top_panel_cache_comp','','-=AUTONAME=-',NULL,'top_panel_cache_comp','',0),(74,'top_panel_cache_not','','-=AUTONAME=-',NULL,'top_panel_cache_not','',0),(75,'top_panel_edit_mode','','-=AUTONAME=-',NULL,'top_panel_edit_mode','',0),(76,'top_panel_templ_site_css','','-=AUTONAME=-',NULL,'top_panel_templ_site_css','',0),(77,'top_panel_templ_templ_css','','-=AUTONAME=-',NULL,'top_panel_templ_templ_css','',0),(78,'top_panel_templ_site','','-=AUTONAME=-',NULL,'top_panel_templ_site','',0),(81,'top_panel_debug_time','','-=AUTONAME=-',NULL,'top_panel_debug_time','',0),(82,'top_panel_debug_incl','','-=AUTONAME=-',NULL,'top_panel_debug_incl','',0),(83,'top_panel_debug_sql','','-=AUTONAME=-',NULL,'top_panel_debug_sql',NULL,0),(84,'top_panel_debug_compr','','-=AUTONAME=-',NULL,'top_panel_debug_compr','',0),(85,'MTP_SHORT_URI1','','-=AUTONAME=-',NULL,'MTP_SHORT_URI1','',0),(86,'MTP_SHORT_URI_LIST','','-=AUTONAME=-',NULL,'MTP_SHORT_URI_LIST','',0),(87,'FMST_PANEL_STICKER_ADD','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKER_ADD','',0),(88,'FMST_PANEL_STICKERS_SHOW','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKERS_SHOW','',0),(89,'FMST_PANEL_CUR_STICKER_LIST','','-=AUTONAME=-',NULL,'FMST_PANEL_CUR_STICKER_LIST','',0),(90,'FMST_PANEL_ALL_STICKER_LIST','','-=AUTONAME=-',NULL,'FMST_PANEL_ALL_STICKER_LIST','',0),(91,'top_panel_menu','var d=BX(\"bx-panel-menu\"); if (d) d.click();','-=AUTONAME=-',NULL,'bx-panel-menu','',0),(92,'top_panel_admin','var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-admin-tab','',0),(93,'admin_panel_site','var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-view-tab','',0),(94,'admin_panel_admin','var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;','-=AUTONAME=-',NULL,'bx-panel-admin-tab','',0),(96,'top_panel_folder_prop_new','','-=AUTONAME=-',NULL,'top_panel_folder_prop_new','',0),(97,'main_top_panel_structure','','-=AUTONAME=-',NULL,'main_top_panel_structure','',0),(98,'top_panel_clear_cache','','-=AUTONAME=-',NULL,'top_panel_clear_cache','',0),(99,'top_panel_templ','','-=AUTONAME=-',NULL,'top_panel_templ','',0),(100,'top_panel_debug','','-=AUTONAME=-',NULL,'top_panel_debug','',0),(101,'MTP_SHORT_URI','','-=AUTONAME=-',NULL,'MTP_SHORT_URI','',0),(102,'FMST_PANEL_STICKERS','','-=AUTONAME=-',NULL,'FMST_PANEL_STICKERS','',0),(103,'top_panel_settings','','-=AUTONAME=-',NULL,'top_panel_settings','',0),(104,'top_panel_fav','','-=AUTONAME=-',NULL,'top_panel_fav','',0),(106,'Global','location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';','HK_DB_SHW_HK','','','',0),(107,'top_panel_edit_new','','-=AUTONAME=-',NULL,'top_panel_edit_new','',0),(108,'FLOW_PANEL_CREATE_WITH_WF','','-=AUTONAME=-',NULL,'FLOW_PANEL_CREATE_WITH_WF','',0),(109,'FLOW_PANEL_EDIT_WITH_WF','','-=AUTONAME=-',NULL,'FLOW_PANEL_EDIT_WITH_WF','',0),(110,'FLOW_PANEL_HISTORY','','-=AUTONAME=-',NULL,'FLOW_PANEL_HISTORY','',0),(111,'top_panel_create_new','','-=AUTONAME=-',NULL,'top_panel_create_new','',0),(112,'top_panel_create_folder_new','','-=AUTONAME=-',NULL,'top_panel_create_folder_new','',0),(116,'bx-panel-toggle','','-=AUTONAME=-',NULL,'bx-panel-toggle','',0),(117,'bx-panel-small-toggle','','-=AUTONAME=-',NULL,'bx-panel-small-toggle','',0),(118,'bx-panel-expander','var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');','-=AUTONAME=-',NULL,'bx-panel-expander','',0),(119,'bx-panel-hider','var d=BX(\'bx-panel-hider\'); if (d) d.click();','-=AUTONAME=-',NULL,'bx-panel-hider','',0),(120,'search-textbox-input','var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}','-=AUTONAME=-','','search','',0),(121,'bx-search-input','var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }','-=AUTONAME=-','','bx-search-input','',0),(133,'bx-panel-logout','var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;','-=AUTONAME=-','','bx-panel-logout','',0),(135,'CDialog','var d=BX(\'cancel\'); if (d) d.click();','HK_DB_D_CANCEL','','cancel','',0),(136,'CDialog','var d=BX(\'close\'); if (d) d.click();','HK_DB_D_CLOSE','','close','',0),(137,'CDialog','var d=BX(\'savebtn\'); if (d) d.click();','HK_DB_D_SAVE','','savebtn','',0),(138,'CDialog','var d=BX(\'btn_popup_save\'); if (d) d.click();','HK_DB_D_EDIT_SAVE','','btn_popup_save','',0),(139,'Global','location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;','HK_DB_SHW_U','','','',0);
/*!40000 ALTER TABLE `b_hot_keys_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock`
--

DROP TABLE IF EXISTS `b_iblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IBLOCK_TYPE_ID` varchar(50) NOT NULL,
  `LID` char(2) NOT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `API_CODE` varchar(50) DEFAULT NULL,
  `REST_ON` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIST_PAGE_URL` varchar(255) DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `DESCRIPTION_TYPE` char(4) NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT 24,
  `RSS_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `INDEX_ELEMENT` char(1) NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) DEFAULT NULL,
  `LIST_MODE` char(1) DEFAULT NULL,
  `RIGHTS_MODE` char(1) DEFAULT NULL,
  `SECTION_PROPERTY` char(1) DEFAULT NULL,
  `PROPERTY_INDEX` char(1) DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT 1,
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT 0,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) DEFAULT NULL,
  `SECTION_NAME` varchar(100) DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock`
--

LOCK TABLES `b_iblock` WRITE;
/*!40000 ALTER TABLE `b_iblock` DISABLE KEYS */;
INSERT INTO `b_iblock` VALUES (1,'2024-02-27 12:40:58','news','s1','furniture_news_s1',NULL,'N','Новости','Y',500,'#SITE_DIR#/news/','#SITE_DIR#/news/#ID#/',NULL,'',NULL,'','text',24,'Y','N',NULL,NULL,'N','furniture_news_s1','7eea761a2de9a3f712eb2c4f497c0486','Y','N','N','N','L','','S','N','N',1,0,NULL,'','','Разделы','Раздел','Новости','Новость'),(2,'2024-02-28 08:57:20','products','s1','furniture_products_s1',NULL,'N','[s1] Продукция','Y',500,'#SITE_DIR#/products/','#CODE##SITE_DIR#/products/#SECTION_ID#/#ID#/','#SITE_DIR#/products/#ID#/','',NULL,'','text',24,'Y','N',NULL,NULL,'N','furniture_products_s1','5d8f4d3feaa87e91cb140a1029860344','Y','Y','N','N','L','','S','Y','I',1,0,NULL,'','','Разделы','Раздел','Товары','Элемент'),(3,'2024-02-07 11:20:22','products','s1','furniture_services_s1',NULL,'N','[s1] Услуги','Y',500,'#SITE_DIR#/services/','#SITE_DIR#/services/#ID#/',NULL,NULL,NULL,NULL,'text',24,'Y','N',NULL,NULL,'N','furniture_services_s1','3d45c25d3a0b9385a0e4f275b9d2cfec','Y','Y','N','N','L',NULL,'S',NULL,NULL,1,0,NULL,NULL,NULL,'Разделы','Раздел','Услуги','Услуга'),(4,'2024-02-07 11:20:23','vacancies','s1','furniture_vacancies_s1',NULL,'N','Вакансии','Y',500,'#SITE_DIR#/company/vacancies.php','#SITE_DIR#/company/vacancies.php##ID#',NULL,NULL,NULL,NULL,'text',24,'Y','N',NULL,NULL,'N','furniture_vacancies_s1','45980bda5e87d40cbba8da7b5792bd34','Y','N','N','N','L',NULL,'S',NULL,NULL,1,0,NULL,NULL,NULL,'Разделы','Раздел','Вакансии','Вакансия'),(17,'2024-02-26 11:53:49','comments','s1','surname_author',NULL,'N','Фамилия автора','Y',500,'#SITE_DIR#/comments/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/comments/detail.php?ID=#ELEMENT_ID#','#SITE_DIR#/comments/list.php?SECTION_ID=#SECTION_ID#','',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','Y','N','N','L','','S','N','N',1,0,NULL,'','','Разделы','Раздел','Элементы','Элемент'),(18,'2024-02-27 07:13:26','action','s1','action',NULL,'N','Акции','Y',500,'#SITE_DIR#/action/index.php?ID=#IBLOCK_ID#','#SITE_DIR#/action/detail.php?ID=#ELEMENT_ID#','#SITE_DIR#/action/list.php?SECTION_ID=#SECTION_ID#','',NULL,'','text',24,'Y','N',NULL,NULL,'N',NULL,NULL,'Y','Y','N','N','L','','S','N','N',1,0,NULL,'','','Разделы','Раздел','Элементы','Элемент');
/*!40000 ALTER TABLE `b_iblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_cache`
--

DROP TABLE IF EXISTS `b_iblock_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) NOT NULL,
  `CACHE` longtext NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_cache`
--

LOCK TABLES `b_iblock_cache` WRITE;
/*!40000 ALTER TABLE `b_iblock_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element`
--

DROP TABLE IF EXISTS `b_iblock_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT 0,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `NAME` varchar(255) NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text DEFAULT NULL,
  `PREVIEW_TEXT_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext DEFAULT NULL,
  `DETAIL_TEXT_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text DEFAULT NULL,
  `WF_STATUS_ID` int(18) DEFAULT 1,
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text DEFAULT NULL,
  `IN_SECTIONS` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element`
--

LOCK TABLES `b_iblock_element` WRITE;
/*!40000 ALTER TABLE `b_iblock_element` DISABLE KEYS */;
INSERT INTO `b_iblock_element` VALUES (1,'2024-02-27 16:03:46',1,'2024-02-07 14:20:20',1,1,NULL,'Y','2010-05-25 00:00:00',NULL,500,'Мебельный форум Беларуси',74,'С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году.','html',75,'<p>С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из <em>Беларуси, Австрии, Латвии, Литвы, России, Польши </em>и<em> Украины</em>. В составе форума состоится пять выставок:&quot;Минский мебельный салон&quot;, &quot;Мебельные технологии&quot;, &quot;ОфисКомфорт&quot;, &quot;Кухня&quot; и &quot;Домотех&quot;. Экспозиция будет строиться по принципу двух тематических секторов:<em> готовой мебели</em> и <em>материалов для ее производства</em>.\r\n \r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе готовой мебели будут представлены:</p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<ul>\r\n \r\n \r\n \r\n  <li>корпусная и мягкая мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для детей и молодежи;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>предметы интерьера;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>кухонная мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для офиса и административных зданий.</li>\r\n\r\n \r\n \r\n </ul>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n<p>Помимо расширенной экспозиции пяти тематических выставок &quot;Экспофорум&quot; подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума &quot;<strong>Народное признание</strong>&quot;. В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n <strong>Мебельный Форум</strong> предоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок <strong>Мебельного Форума</strong>.\r\n \r\n \r\n  <br />\r\n\r\n \r\n </p>\r\n\r\n<p><em>Прием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.</em></p>\r\n\r\n \r\n \r\n \r\n \r\n<ul>\r\n </ul>\r\n\r\n \r\n \r\n \r\n ','html','МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ УЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ БЕЛАРУСИ, АВСТРИИ, ЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ И УКРАИНЫ. В СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ МЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ БУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ СЕКТОРОВ: ГОТОВОЙ МЕБЕЛИ И МАТЕРИАЛОВ ДЛЯ ЕЕ ПРОИЗВОДСТВА. \r\n \r\n\r\nВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ: \r\n\r\n- КОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ; \r\n- ПРЕДМЕТЫ ИНТЕРЬЕРА; \r\n- КУХОННАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ. \r\n\r\nВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА \r\nМЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ РЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, ОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ. \r\n \r\n\r\nПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ \r\nВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ ДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В РАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. И ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ СТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"НАРОДНОЕ ПРИЗНАНИЕ\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ ВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ СМОТРОМ ОБРАЗЦОВ МЕБЕЛИ. \r\nМЕБЕЛЬНЫЙ ФОРУМ ПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ \r\nВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ МЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ ПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ ПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ ПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА БУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ ПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК МЕБЕЛЬНОГО ФОРУМА. \r\n \r\n\r\nПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ \r\nДО 12 АПРЕЛЯ 2010 ГОДА.',1,NULL,NULL,NULL,NULL,NULL,'N','1','','','0',NULL,1,'2024-02-21 12:20:21'),(2,'2024-02-27 16:04:14',1,'2024-02-07 14:20:20',1,1,NULL,'Y','2010-05-26 00:00:00',NULL,500,'Международная мебельная выставка SALON DEL MOBILE',76,'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. ','html',77,'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.','text','МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ \r\nЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ.\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.',1,NULL,NULL,NULL,NULL,NULL,'N','8','','','0',NULL,NULL,NULL),(3,'2024-02-27 16:04:50',1,'2024-02-07 14:20:20',1,1,NULL,'Y','2010-05-27 00:00:00',NULL,500,'Получено прочное водостойкое соединение',78,'Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. ','html',79,'<b>Авторы изобретения</b>: Разиньков Егор Михайлович  и Мещерякова Анна Анатольевна </br>\r\n              Патент Российской Федерации RU2277566</br>\r\n              <h3>Описание изобретения</h3>\r\n              <p>Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\r\n              Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. </p>\r\n\r\n              <p>Изобретение решает задачу по получению прочного и водостойкого клеевого соединения.\r\n              Это достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\r\n              </p>\r\n              <table cellspacing=\"10\">\r\n              <tr>\r\n              <td>Карбамидомеламиноформальдегидная смола</td><td>64,5-79,2</td>\r\n              </tr>	\r\n              <tr>\r\n              <td>10%-ный Раствор щавелевой кислоты</td><td>4,4-20,5</td>\r\n\r\n              </tr>\r\n              <tr>\r\n              <td> Отвердитель для карбамидомеламиноформальдегидной </td><td>0,6-2,0</td>\r\n              </tr>\r\n              <tr>\r\n              <td> смолы 2542</td><td>13,0-15,8</td>\r\n\r\n              </tr>	\r\n              </table>\r\n','html','ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ \r\nСОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ.\r\nАВТОРЫ ИЗОБРЕТЕНИЯ: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ \r\nИ МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА ПАТЕНТ РОССИЙСКОЙ ФЕДЕРАЦИИ RU2277566 ОПИСАНИЕ ИЗОБРЕТЕНИЯ \r\n\r\nИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ \r\nИ ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ ЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ СМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ И ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ ХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \r\n\r\nИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ \r\nПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ. ЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, ВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, СОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ МОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ СМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ СМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА - КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ ПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, МАС.Ч.: \r\n КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА \r\n   64,5-79,2     \r\n 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ    4,4-20,5 \r\n    \r\n ОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r\n    0,6-2,0     \r\n СМОЛЫ 2542    13,0-15,8',1,NULL,NULL,NULL,NULL,NULL,'N','9','','','0',NULL,2,'2024-02-27 15:44:19'),(4,'2024-02-28 12:01:21',1,'2024-02-07 14:20:22',1,2,1,'Y',NULL,NULL,500,'Герцог',5,'<p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>','html',6,'        <p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>','html','ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.',1,NULL,NULL,NULL,NULL,NULL,'Y','10','','','0',NULL,NULL,NULL),(5,'2024-02-28 12:01:38',1,'2024-02-07 14:20:22',1,2,1,'Y',NULL,NULL,500,'Монализа',7,'        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ','html',8,'        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ','html','МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.',1,NULL,NULL,NULL,NULL,NULL,'Y','11','','','0',NULL,NULL,NULL),(6,'2024-02-28 12:01:59',1,'2024-02-07 14:20:22',1,2,2,'Y',NULL,NULL,500,'Министр',9,'        <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n      ','html',10,'          <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n        ','html','МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. С ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. С ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','12','','','0',NULL,1,'2024-03-01 16:07:08'),(7,'2024-02-28 12:01:47',1,'2024-02-07 14:20:22',1,2,2,'Y',NULL,NULL,500,'Хром',11,'        \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n      ','html',12,'          \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n        ','html','ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. ТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. ТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.',1,NULL,NULL,NULL,NULL,NULL,'Y','13','','','0',NULL,NULL,NULL),(8,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,3,'Y',NULL,NULL,500,'Ливерпуль',13,'        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n      ','html',14,'        \r\n        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n        \r\n      ','html','ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','14','','','1081715374',NULL,NULL,NULL),(9,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,1,'Y',NULL,NULL,500,'Изабелла',15,'        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ','html',16,'        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ','html','ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','15','','','-1320392841',NULL,1,'2024-03-17 10:24:48'),(10,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,1,'Y',NULL,NULL,500,'Аладдин',17,'        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ','html',18,'        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ','html','АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»',1,NULL,NULL,NULL,NULL,NULL,'Y','16','','','1053250178',NULL,NULL,NULL),(11,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,1,'Y',NULL,NULL,500,'Джоконда',19,'          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ','html',20,'          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ','html','ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','17','','','-106709740',NULL,NULL,NULL),(12,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,1,'Y',NULL,NULL,500,'Флора',21,'        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ','html',22,'        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ','html','ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.',1,NULL,NULL,NULL,NULL,NULL,'Y','18','','','-1053944437',NULL,NULL,NULL),(13,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,1,'Y',NULL,NULL,500,'Престиж',23,'          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ','html',24,'          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ','html','ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.',1,NULL,NULL,NULL,NULL,NULL,'Y','19','','','273423738',NULL,NULL,NULL),(14,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,1,'Y',NULL,NULL,500,'Лаура',25,'        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ','html',26,'        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ','html','ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.',1,NULL,NULL,NULL,NULL,NULL,'Y','20','','','-281088768',NULL,1,'2024-03-03 19:51:12'),(15,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,2,'Y',NULL,NULL,500,'Модерн',27,'         <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ','html',28,'          <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ','html','МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. ДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. ДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','21','','','-1185689438',NULL,NULL,NULL),(16,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,2,'Y',NULL,NULL,500,'Оптима',29,'         <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \r\n          Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</p><p>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \r\n          обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать \r\n          пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</p><p>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.</p>\r\n        </p>\r\n      ','html',30,'            \r\n        <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</br>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</br>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\n        </p>\r\n      ','html','ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\r\n\r\nСЕРИЯ «ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ \r\nДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\r\n\r\nМЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ \r\nРЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ. СЕРИЯ «ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ. МЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','22','','','1945328005',NULL,NULL,NULL),(17,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,2,'Y',NULL,NULL,500,'Собрание',31,'        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ','html',32,'        \r\n        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ','html','СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','23','','','1523163777',NULL,NULL,NULL),(18,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,2,'Y',NULL,NULL,500,'Лидер',33,'        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n      ','html',34,'        \r\n        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n        \r\n      ','html','ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. СЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ ОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. СЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ ОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','24','','','-1927682590',NULL,NULL,NULL),(19,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,2,'Y',NULL,NULL,500,'Президент',35,'        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.</p> \r\n      ','html',36,'        \r\n        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \r\n        Дизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \r\n        Производится ограниченными партиями - не более 10 кресел в год.</p>\r\n        \r\n      ','html','ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ ПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ ПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. ДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ СТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА ВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. ПРОИЗВОДИТСЯ ОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ В ГОД.',1,NULL,NULL,NULL,NULL,NULL,'Y','25','','','-1836002422',NULL,NULL,NULL),(20,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,2,'Y',NULL,NULL,500,'Плутон',37,'        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n      ','html',38,'        \r\n        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n        \r\n      ','html','ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','26','','','1990779533',NULL,NULL,NULL),(21,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,3,'Y',NULL,NULL,500,'Парма',39,'        <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r\n        Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r\n        Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>\r\n      ','html',40,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.&lt;/p&gt;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;','html','ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ \r\nЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. СТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. ТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&LT;P&GT;СТУЛЬЯ ПАРМА \r\nВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;СТУЛ ПРАКТИЧЕСКИ \r\nЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;ТОНИРОВКА ДЕРЕВЯННЫХ \r\nДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.&LT;/P&GT;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;',1,NULL,NULL,NULL,NULL,NULL,'Y','27','','','964589627',NULL,NULL,NULL),(22,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,3,'Y',NULL,NULL,500,'Палермо',41,'        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n      ','html',42,'        \r\n        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n        \r\n      ','html','ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, И В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, И В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.',1,NULL,NULL,NULL,NULL,NULL,'Y','28','','','-1151185156',NULL,NULL,NULL),(23,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,3,'Y',NULL,NULL,500,'Валенсия',43,'        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n      ','html',44,'        \r\n        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n        \r\n      ','html','ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.',1,NULL,NULL,NULL,NULL,NULL,'Y','29','','','589017098',NULL,NULL,NULL),(24,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,4,'Y',NULL,NULL,500,'Фазенда',45,'        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n      ','html',46,'        \r\n        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n        \r\n      ','html','ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.',1,NULL,NULL,NULL,NULL,NULL,'Y','30','','','-1288812514',NULL,NULL,NULL),(25,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,4,'Y',NULL,NULL,500,'Эра',47,'        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n      ','html',48,'        \r\n        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n        \r\n      ','html','ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.',1,NULL,NULL,NULL,NULL,NULL,'Y','31','','','858154825',NULL,NULL,NULL),(26,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,4,'Y',NULL,NULL,500,'Сити',49,'        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n      ','html',50,'        \r\n        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n        \r\n      ','html','СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.',1,NULL,NULL,NULL,NULL,NULL,'Y','32','','','-252178488',NULL,1,'2024-02-28 11:30:35'),(27,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,2,4,'Y',NULL,NULL,500,'Изопласт Хром',51,'        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n      ','html',52,'        \r\n        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n        \r\n      ','html','ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.',1,NULL,NULL,NULL,NULL,NULL,'Y','33','','','2001037389',NULL,3,'2024-03-01 11:21:28'),(28,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,3,NULL,'Y',NULL,NULL,500,'Мебель на заказ',53,'Наша компания занимается разработкой мебели на заказ.','html',NULL,'        <p>Наша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\r\n        гардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.</p>\r\n        <p>Мы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\r\n        По Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\r\n        произведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.</p>\r\n        <p>После заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\r\n        где опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\r\n        непосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\r\n        сотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\r\n        вносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.</p>\r\n        \r\n      ','html','МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ.\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ И КОРПУСНЫЕ ШКАФЫ КУПЕ, ГАРДЕРОБНЫЕ КОМНАТЫ, ПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ И ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ. \r\n\r\nМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ \r\nИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, МАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ. ПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ СО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ МЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ И ПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ ВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, СОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ. \r\n\r\nПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ \r\nСРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ ПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО, ГДЕ ОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ В ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. ПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ НЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ РАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ НЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ СОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ С ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ ДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ ВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ ЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА ОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.',1,NULL,NULL,NULL,NULL,NULL,'N','5','','','841280321',NULL,NULL,NULL),(29,'2024-02-07 14:20:22',1,'2024-02-07 14:20:22',1,3,NULL,'Y',NULL,NULL,500,'Услуги дизайнера',54,'Мы предлагаем широкий спектр услуг по дизайну мебели.','html',NULL,'        \r\n        <ul>\r\n          <li>Диагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.</li>\r\n          <li>Разработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.</li>\r\n          <li>Разработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие,  рассмотреть его в деталях.</li>\r\n          <li>Подбор и расстановка мебели.</li>\r\n          <li>Декорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.</li>\r\n        </ul>\r\n        \r\n      ','html','УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ \r\nМЕБЕЛИ.\r\n- ДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ \r\nПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, ОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, ОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, РАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ ЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ ЖИЗНИ. \r\n- РАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ \r\nРАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ ПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ ЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ ВАРИАНТ. \r\n- РАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ \r\nМОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, ИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ ПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ ИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ. \r\n- ПОДБОР И РАССТАНОВКА МЕБЕЛИ. \r\n- ДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ \r\nИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ ПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ ЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.',1,NULL,NULL,NULL,NULL,NULL,'N','6','','','-1080381355',NULL,NULL,NULL),(30,'2024-02-07 14:20:23',1,'2024-02-07 14:20:23',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,200,'Продавец-дизайнер (кухни)',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ','html','ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\n\r\nТРЕБОВАНИЯ \r\n\r\nУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ \r\nОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ В МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ ОБЯЗАННОСТИ \r\n\r\nКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ \r\nМЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ ПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ. УСЛОВИЯ \r\n\r\nЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + \r\nПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ СОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ',1,NULL,NULL,NULL,NULL,NULL,'N','2','','','1704140047',NULL,NULL,NULL),(31,'2024-02-07 14:20:23',1,'2024-02-07 14:20:23',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,300,'Директор магазина',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ','html','ДИРЕКТОР МАГАЗИНА\r\n\r\nТРЕБОВАНИЯ \r\n\r\nВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ \r\nРАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ ПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ УПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ ЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ ОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ. ОБЯЗАННОСТИ \r\n\r\nРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ \r\nЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ ФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И ОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ ОТЧЕТНОСТЬ. УСЛОВИЯ \r\n\r\nТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ \r\nГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: ОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 35000 РУБ',1,NULL,NULL,NULL,NULL,NULL,'N','3','','','192768702',NULL,NULL,NULL),(32,'2024-02-07 14:20:23',1,'2024-02-07 14:20:23',1,4,NULL,'Y','2010-05-01 00:00:00',NULL,400,'Бухгалтер отдела учета готовой продукции',NULL,'','html',NULL,'<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ','html','БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\n\r\nТРЕБОВАНИЯ \r\n\r\nЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ \r\nРАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ БУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), САМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, БЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ. ОБЯЗАННОСТИ \r\n\r\nРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ \r\nМПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ СЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ ПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ ФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ УСЛОВИЯ \r\n\r\nГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ \r\nГ. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД 10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.',1,NULL,NULL,NULL,NULL,NULL,'N','4','','','790068583',NULL,NULL,NULL),(34,'2024-02-27 09:38:40',1,'2024-02-26 14:54:34',1,17,NULL,'Y',NULL,NULL,500,'Иванов ',66,'Круто, наверное это полезно...','text',67,'','text','ИВАНОВ \r\nКРУТО, НАВЕРНОЕ ЭТО ПОЛЕЗНО...\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','34','ivanov','','0',NULL,NULL,NULL),(35,'2024-02-27 09:38:03',1,'2024-02-26 14:55:35',1,17,NULL,'Y',NULL,NULL,500,'Сидорова ',64,'Невероятная вёрстка','text',65,'','text','СИДОРОВА \r\nНЕВЕРОЯТНАЯ ВЁРСТКА\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','35','sidorova','','0',NULL,NULL,NULL),(36,'2024-02-27 09:38:11',1,'2024-02-26 14:56:02',1,17,NULL,'Y',NULL,NULL,500,'Петров ',62,'Да','text',63,'','text','ПЕТРОВ \r\nДА\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','36','petrov','','0',NULL,NULL,NULL),(37,'2024-02-27 09:38:30',1,'2024-02-26 14:56:49',1,17,NULL,'Y',NULL,NULL,500,'Смирнова',60,'','text',61,'Что с хлебными крошками\r\n','text','СМИРНОВА\r\n\r\nЧТО С ХЛЕБНЫМИ КРОШКАМИ\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','37','smirnova','','0',NULL,NULL,NULL),(38,'2024-02-27 09:38:50',1,'2024-02-26 14:57:15',1,17,NULL,'Y',NULL,NULL,500,'Козлов ',58,'Анонс это как?','text',59,'','text','КОЗЛОВ \r\nАНОНС ЭТО КАК?\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','38','kozlov','','0',NULL,NULL,NULL),(39,'2024-02-27 09:39:14',1,'2024-02-26 14:57:39',1,17,NULL,'Y',NULL,NULL,500,'Никитина ',56,'Козлов создан нейросетью?','text',57,'','text','НИКИТИНА \r\nКОЗЛОВ СОЗДАН НЕЙРОСЕТЬЮ?\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','39','nikitina','','0',NULL,NULL,NULL),(40,'2024-02-27 10:27:26',1,'2024-02-27 10:14:01',1,18,NULL,'Y',NULL,NULL,500,'Акция_1',73,'','text',NULL,'','text','АКЦИЯ_1\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','40','','','0',NULL,NULL,NULL),(41,'2024-02-27 10:27:14',1,'2024-02-27 10:14:17',1,18,NULL,'Y',NULL,NULL,500,'Акция_2',72,'','text',NULL,'','text','АКЦИЯ_2\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','41','','','0',NULL,NULL,NULL),(42,'2024-02-27 10:27:04',1,'2024-02-27 10:14:33',1,18,NULL,'Y',NULL,NULL,500,'Акция_3',71,'','text',NULL,'','text','АКЦИЯ_3\r\n\r\n',1,NULL,NULL,NULL,NULL,NULL,'N','42','','','0',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_iblock_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_iprop`
--

DROP TABLE IF EXISTS `b_iblock_element_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_iprop`
--

LOCK TABLES `b_iblock_element_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_lock`
--

DROP TABLE IF EXISTS `b_iblock_element_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`),
  CONSTRAINT `b_iblock_element_lock_ibfk_1` FOREIGN KEY (`IBLOCK_ELEMENT_ID`) REFERENCES `b_iblock_element` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_lock`
--

LOCK TABLES `b_iblock_element_lock` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_property`
--

DROP TABLE IF EXISTS `b_iblock_element_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text NOT NULL,
  `VALUE_TYPE` char(4) NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_val` (`VALUE`(50),`IBLOCK_PROPERTY_ID`,`IBLOCK_ELEMENT_ID`),
  CONSTRAINT `b_iblock_element_property_ibfk_1` FOREIGN KEY (`IBLOCK_PROPERTY_ID`) REFERENCES `b_iblock_property` (`ID`),
  CONSTRAINT `b_iblock_element_property_ibfk_2` FOREIGN KEY (`IBLOCK_ELEMENT_ID`) REFERENCES `b_iblock_element` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_property`
--

LOCK TABLES `b_iblock_element_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_property` DISABLE KEYS */;
INSERT INTO `b_iblock_element_property` VALUES (1,2,4,'10000','text',NULL,10000.0000,''),(3,4,4,'195x95x125','text',NULL,195.0000,''),(4,6,4,'40324А','text',NULL,40324.0000,''),(5,7,4,'Кожа, ткань','text',NULL,0.0000,''),(6,8,4,'Россия','text',NULL,0.0000,''),(7,2,5,'12000','text',NULL,12000.0000,''),(9,4,5,'175x95x115','text',NULL,175.0000,''),(10,6,5,'56830Е','text',NULL,56830.0000,''),(11,7,5,'Кожа, ткань','text',NULL,0.0000,''),(12,8,5,'Россия','text',NULL,0.0000,''),(14,2,6,'7899','text',NULL,7899.0000,''),(16,4,6,'54x49x120','text',NULL,54.0000,''),(17,6,6,'435245','text',NULL,435245.0000,''),(18,7,6,'Кожа, ткань','text',NULL,0.0000,''),(19,8,6,'Россия','text',NULL,0.0000,''),(20,2,7,'8999','text',NULL,8999.0000,''),(22,4,7,'66x60x36','text',NULL,66.0000,''),(23,6,7,'234523','text',NULL,234523.0000,''),(24,7,7,'Кожа, ткань','text',NULL,0.0000,''),(25,8,7,'Россия','text',NULL,0.0000,''),(26,2,8,'1500','text',NULL,1500.0000,''),(27,3,8,'2','text',2,NULL,NULL),(28,4,8,'51x43x85','text',NULL,51.0000,''),(29,6,8,'234011','text',NULL,234011.0000,''),(30,7,8,'Дерево, ткань','text',NULL,0.0000,''),(31,8,8,'Россия','text',NULL,0.0000,''),(32,1,9,'1','text',1,NULL,NULL),(33,2,9,'11899','text',NULL,11899.0000,''),(34,3,9,'2','text',2,NULL,NULL),(35,4,9,'155x90x95','text',NULL,155.0000,''),(36,6,9,'47539Р','text',NULL,47539.0000,''),(37,7,9,'Кожа, ткань','text',NULL,0.0000,''),(38,8,9,'Россия','text',NULL,0.0000,''),(39,2,10,'12500','text',NULL,12500.0000,''),(40,3,10,'2','text',2,NULL,NULL),(41,4,10,'165x90x115','text',NULL,165.0000,''),(42,6,10,'00549Е','text',NULL,549.0000,''),(43,7,10,'Кожа, ткань','text',NULL,0.0000,''),(44,8,10,'Россия','text',NULL,0.0000,''),(45,2,11,'8000','text',NULL,8000.0000,''),(46,3,11,'2','text',2,NULL,NULL),(47,4,11,'155x95x105','text',NULL,155.0000,''),(48,6,11,'98922К','text',NULL,98922.0000,''),(49,7,11,'Кожа, ткань','text',NULL,0.0000,''),(50,8,11,'Россия','text',NULL,0.0000,''),(51,1,12,'1','text',1,NULL,NULL),(52,2,12,'10999','text',NULL,10999.0000,''),(53,3,12,'2','text',2,NULL,NULL),(54,4,12,'165x90x115','text',NULL,165.0000,''),(55,6,12,'64512Т','text',NULL,64512.0000,''),(56,7,12,'Кожа, ткань','text',NULL,0.0000,''),(57,8,12,'Россия','text',NULL,0.0000,''),(58,2,13,'9999','text',NULL,9999.0000,''),(59,3,13,'2','text',2,NULL,NULL),(60,4,13,'210x105x135','text',NULL,210.0000,''),(61,6,13,'96395Т','text',NULL,96395.0000,''),(62,7,13,'Кожа, ткань','text',NULL,0.0000,''),(63,8,13,'Россия','text',NULL,0.0000,''),(64,2,14,'1499','text',NULL,1499.0000,''),(65,3,14,'2','text',2,NULL,NULL),(66,4,14,'175x110x115','text',NULL,175.0000,''),(67,5,14,'200x100','text',NULL,200.0000,''),(68,6,14,'38263Е','text',NULL,38263.0000,''),(69,7,14,'Кожа, ткань','text',NULL,0.0000,''),(70,8,14,'Россия','text',NULL,0.0000,''),(71,2,15,'9999','text',NULL,9999.0000,''),(72,3,15,'2','text',2,NULL,NULL),(73,6,15,'634645','text',NULL,634645.0000,''),(74,7,15,'Кожа, ткань','text',NULL,0.0000,''),(75,8,15,'Россия','text',NULL,0.0000,''),(76,2,16,'7799','text',NULL,7799.0000,''),(77,3,16,'2','text',2,NULL,NULL),(78,6,16,'634045','text',NULL,634045.0000,''),(79,7,16,'Кожа, ткань','text',NULL,0.0000,''),(80,8,16,'Россия','text',NULL,0.0000,''),(81,2,17,'6779','text',NULL,6779.0000,''),(82,3,17,'2','text',2,NULL,NULL),(83,4,17,'220x140x120','text',NULL,220.0000,''),(84,6,17,'634043','text',NULL,634043.0000,''),(85,7,17,'Кожа, ткань','text',NULL,0.0000,''),(86,8,17,'Россия','text',NULL,0.0000,''),(87,2,18,'4579','text',NULL,4579.0000,''),(88,3,18,'2','text',2,NULL,NULL),(89,4,18,'200x150x120','text',NULL,200.0000,''),(90,6,18,'634023','text',NULL,634023.0000,''),(91,7,18,'Кожа, ткань','text',NULL,0.0000,''),(92,8,18,'Россия','text',NULL,0.0000,''),(93,1,19,'1','text',1,NULL,NULL),(94,2,19,'14999','text',NULL,14999.0000,''),(95,3,19,'2','text',2,NULL,NULL),(96,4,19,'50x69x130','text',NULL,50.0000,''),(97,6,19,'634023','text',NULL,634023.0000,''),(98,7,19,'Кожа, ткань','text',NULL,0.0000,''),(99,8,19,'Россия','text',NULL,0.0000,''),(100,2,20,'12999','text',NULL,12999.0000,''),(101,3,20,'2','text',2,NULL,NULL),(102,4,20,'58x48x86','text',NULL,58.0000,''),(103,6,20,'634011','text',NULL,634011.0000,''),(104,7,20,'Кожа, металл, ткань','text',NULL,0.0000,''),(105,8,20,'Россия','text',NULL,0.0000,''),(106,2,21,'1700','text',NULL,1700.0000,''),(107,3,21,'2','text',2,NULL,NULL),(108,4,21,'52x42x88','text',NULL,52.0000,''),(109,6,21,'234012','text',NULL,234012.0000,''),(110,7,21,'Дерево, ткань','text',NULL,0.0000,''),(111,8,21,'Россия','text',NULL,0.0000,''),(112,2,22,'1000','text',NULL,1000.0000,''),(113,3,22,'2','text',2,NULL,NULL),(114,4,22,'52x42x88','text',NULL,52.0000,''),(115,6,22,'234014','text',NULL,234014.0000,''),(116,7,22,'Дерево, ткань','text',NULL,0.0000,''),(117,8,22,'Россия','text',NULL,0.0000,''),(118,2,23,'1399','text',NULL,1399.0000,''),(119,3,23,'2','text',2,NULL,NULL),(120,4,23,'55x39x90','text',NULL,55.0000,''),(121,6,23,'234017','text',NULL,234017.0000,''),(122,7,23,'Дерево, ткань','text',NULL,0.0000,''),(123,8,23,'Россия','text',NULL,0.0000,''),(124,2,24,'1000','text',NULL,1000.0000,''),(125,3,24,'2','text',2,NULL,NULL),(126,4,24,'56x48x80','text',NULL,56.0000,''),(127,6,24,'234013','text',NULL,234013.0000,''),(128,7,24,'Дерево, ткань','text',NULL,0.0000,''),(129,8,24,'Россия','text',NULL,0.0000,''),(130,2,25,'1300','text',NULL,1300.0000,''),(131,3,25,'2','text',2,NULL,NULL),(132,4,25,'52x42x88','text',NULL,52.0000,''),(133,6,25,'234015','text',NULL,234015.0000,''),(134,7,25,'Металл, пластик','text',NULL,0.0000,''),(135,8,25,'Россия','text',NULL,0.0000,''),(136,2,26,'1699','text',NULL,1699.0000,''),(137,3,26,'2','text',2,NULL,NULL),(138,4,26,'52x45x65','text',NULL,52.0000,''),(139,6,26,'234016','text',NULL,234016.0000,''),(140,7,26,'Металл, пластик, кожа','text',NULL,0.0000,''),(141,8,26,'Россия','text',NULL,0.0000,''),(142,2,27,'1679','text',NULL,1679.0000,''),(143,3,27,'2','text',2,NULL,NULL),(144,4,27,'54x43x82','text',NULL,54.0000,''),(145,6,27,'234017','text',NULL,234017.0000,''),(146,7,27,'Металл, пластик','text',NULL,0.0000,''),(147,8,27,'Россия','text',NULL,0.0000,''),(150,33,34,' Генеральный директор','text',NULL,0.0000,''),(151,34,34,'ООО \"Прогресс\"','text',NULL,0.0000,''),(152,33,35,'Главный бухгалтер','text',NULL,0.0000,''),(153,34,35,' ЗАО \"Финансы и Ко\"','text',NULL,0.0000,''),(154,33,36,'Руководитель отдела продаж','text',NULL,0.0000,''),(155,34,36,'ООО \"Мегапродукт\"','text',NULL,0.0000,''),(156,33,37,'HR-менеджер','text',NULL,0.0000,''),(157,34,37,'ООО \"Топ Ресурс\"','text',NULL,0.0000,''),(158,33,38,'Ведущий инженер-программист','text',NULL,0.0000,''),(159,34,38,'ИП \"СофтСервис\"','text',NULL,0.0000,''),(160,33,39,'Маркетинговый менеджер','text',NULL,0.0000,''),(161,34,39,'ООО \"МаркетПро\"','text',NULL,0.0000,''),(162,35,40,'500','text',NULL,500.0000,''),(163,35,41,'400','text',NULL,400.0000,''),(164,35,42,'600','text',NULL,600.0000,''),(165,36,1,'Google','text',NULL,0.0000,''),(166,37,1,'Мебель, Беларусь','text',NULL,0.0000,''),(167,1,4,'1','text',1,NULL,NULL),(168,3,4,'2','text',2,NULL,NULL),(169,38,4,'7','text',7,NULL,NULL),(170,1,5,'1','text',1,NULL,NULL),(171,3,5,'2','text',2,NULL,NULL),(172,38,5,'8','text',8,NULL,NULL),(173,1,7,'1','text',1,NULL,NULL),(174,3,7,'2','text',2,NULL,NULL),(175,38,7,'7','text',7,NULL,NULL),(176,1,6,'1','text',1,NULL,NULL),(177,3,6,'2','text',2,NULL,NULL),(178,38,6,'8','text',8,NULL,NULL);
/*!40000 ALTER TABLE `b_iblock_element_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_element_right`
--

DROP TABLE IF EXISTS `b_iblock_element_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`),
  CONSTRAINT `b_iblock_element_right_ibfk_1` FOREIGN KEY (`IBLOCK_ID`) REFERENCES `b_iblock` (`ID`),
  CONSTRAINT `b_iblock_element_right_ibfk_2` FOREIGN KEY (`RIGHT_ID`) REFERENCES `b_iblock_right` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_element_right`
--

LOCK TABLES `b_iblock_element_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_element_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_fields`
--

DROP TABLE IF EXISTS `b_iblock_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) NOT NULL,
  `IS_REQUIRED` char(1) DEFAULT NULL,
  `DEFAULT_VALUE` longtext DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_fields`
--

LOCK TABLES `b_iblock_fields` WRITE;
/*!40000 ALTER TABLE `b_iblock_fields` DISABLE KEYS */;
INSERT INTO `b_iblock_fields` VALUES (1,'ACTIVE','Y','Y'),(1,'ACTIVE_FROM','N','=today'),(1,'ACTIVE_TO','N',''),(1,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(1,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"Y\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(1,'DETAIL_TEXT','N',''),(1,'DETAIL_TEXT_TYPE','Y','text'),(1,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(1,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(1,'LOG_ELEMENT_ADD','N',NULL),(1,'LOG_ELEMENT_DELETE','N',NULL),(1,'LOG_ELEMENT_EDIT','N',NULL),(1,'LOG_SECTION_ADD','N',NULL),(1,'LOG_SECTION_DELETE','N',NULL),(1,'LOG_SECTION_EDIT','N',NULL),(1,'NAME','Y',''),(1,'PREVIEW_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"Y\";s:5:\"WIDTH\";i:80;s:6:\"HEIGHT\";i:60;s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"Y\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"Y\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"Y\";}'),(1,'PREVIEW_TEXT','N',''),(1,'PREVIEW_TEXT_TYPE','Y','text'),(1,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(1,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(1,'SECTION_DESCRIPTION','N',''),(1,'SECTION_DESCRIPTION_TYPE','Y','text'),(1,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(1,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(1,'SECTION_NAME','Y',''),(1,'SECTION_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(1,'SECTION_XML_ID','N',''),(1,'SORT','N','0'),(1,'TAGS','N',''),(1,'XML_ID','Y',''),(1,'XML_IMPORT_START_TIME','N','2024-02-07 14:20:20'),(2,'ACTIVE','Y','Y'),(2,'ACTIVE_FROM','N',''),(2,'ACTIVE_TO','N',''),(2,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"Y\";}'),(2,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(2,'DETAIL_TEXT','N',''),(2,'DETAIL_TEXT_TYPE','Y','text'),(2,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(2,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(2,'LOG_ELEMENT_ADD','N',NULL),(2,'LOG_ELEMENT_DELETE','N',NULL),(2,'LOG_ELEMENT_EDIT','N',NULL),(2,'LOG_SECTION_ADD','N',NULL),(2,'LOG_SECTION_DELETE','N',NULL),(2,'LOG_SECTION_EDIT','N',NULL),(2,'NAME','Y',''),(2,'PREVIEW_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(2,'PREVIEW_TEXT','N',''),(2,'PREVIEW_TEXT_TYPE','Y','text'),(2,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(2,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(2,'SECTION_DESCRIPTION','N',''),(2,'SECTION_DESCRIPTION_TYPE','Y','text'),(2,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(2,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(2,'SECTION_NAME','Y',''),(2,'SECTION_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(2,'SECTION_XML_ID','N',''),(2,'SORT','N','0'),(2,'TAGS','N',''),(2,'XML_ID','Y',''),(2,'XML_IMPORT_START_TIME','N','2024-02-07 14:20:21'),(3,'ACTIVE','Y','Y'),(3,'ACTIVE_FROM','N',''),(3,'ACTIVE_TO','N',''),(3,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(3,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(3,'DETAIL_TEXT','N',''),(3,'DETAIL_TEXT_TYPE','Y','text'),(3,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(3,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(3,'LOG_ELEMENT_ADD','N',NULL),(3,'LOG_ELEMENT_DELETE','N',NULL),(3,'LOG_ELEMENT_EDIT','N',NULL),(3,'LOG_SECTION_ADD','N',NULL),(3,'LOG_SECTION_DELETE','N',NULL),(3,'LOG_SECTION_EDIT','N',NULL),(3,'NAME','Y',''),(3,'PREVIEW_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(3,'PREVIEW_TEXT','N',''),(3,'PREVIEW_TEXT_TYPE','Y','text'),(3,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(3,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(3,'SECTION_DESCRIPTION','N',''),(3,'SECTION_DESCRIPTION_TYPE','Y','text'),(3,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(3,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(3,'SECTION_NAME','Y',''),(3,'SECTION_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(3,'SECTION_XML_ID','N',''),(3,'SORT','N','0'),(3,'TAGS','N',''),(3,'XML_ID','Y',''),(3,'XML_IMPORT_START_TIME','N','2024-02-07 14:20:22'),(4,'ACTIVE','Y','Y'),(4,'ACTIVE_FROM','N',''),(4,'ACTIVE_TO','N',''),(4,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(4,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(4,'DETAIL_TEXT','N',''),(4,'DETAIL_TEXT_TYPE','Y','text'),(4,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(4,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(4,'LOG_ELEMENT_ADD','N',NULL),(4,'LOG_ELEMENT_DELETE','N',NULL),(4,'LOG_ELEMENT_EDIT','N',NULL),(4,'LOG_SECTION_ADD','N',NULL),(4,'LOG_SECTION_DELETE','N',NULL),(4,'LOG_SECTION_EDIT','N',NULL),(4,'NAME','Y',''),(4,'PREVIEW_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(4,'PREVIEW_TEXT','N',''),(4,'PREVIEW_TEXT_TYPE','Y','text'),(4,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(4,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(4,'SECTION_DESCRIPTION','N',''),(4,'SECTION_DESCRIPTION_TYPE','Y','text'),(4,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(4,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(4,'SECTION_NAME','Y',''),(4,'SECTION_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:0:\"\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:0:\"\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(4,'SECTION_XML_ID','N',''),(4,'SORT','N','0'),(4,'TAGS','N',''),(4,'XML_ID','Y',''),(4,'XML_IMPORT_START_TIME','N','2024-02-07 14:20:23'),(17,'ACTIVE','Y','Y'),(17,'ACTIVE_FROM','N',''),(17,'ACTIVE_TO','N',''),(17,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(17,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(17,'DETAIL_TEXT','N',''),(17,'DETAIL_TEXT_TYPE','Y','text'),(17,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(17,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(17,'LOG_ELEMENT_ADD','Y',NULL),(17,'LOG_ELEMENT_DELETE','Y',NULL),(17,'LOG_ELEMENT_EDIT','Y',NULL),(17,'LOG_SECTION_ADD','N',NULL),(17,'LOG_SECTION_DELETE','N',NULL),(17,'LOG_SECTION_EDIT','N',NULL),(17,'NAME','Y',''),(17,'PREVIEW_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(17,'PREVIEW_TEXT','N',''),(17,'PREVIEW_TEXT_TYPE','Y','text'),(17,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(17,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(17,'SECTION_DESCRIPTION','N',''),(17,'SECTION_DESCRIPTION_TYPE','Y','text'),(17,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(17,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(17,'SECTION_NAME','Y',''),(17,'SECTION_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(17,'SECTION_XML_ID','N',''),(17,'SORT','N','500'),(17,'TAGS','N',''),(17,'XML_ID','Y',''),(17,'XML_IMPORT_START_TIME','N',NULL),(18,'ACTIVE','Y','Y'),(18,'ACTIVE_FROM','N',''),(18,'ACTIVE_TO','N',''),(18,'CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(18,'DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(18,'DETAIL_TEXT','N',''),(18,'DETAIL_TEXT_TYPE','Y','text'),(18,'DETAIL_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(18,'IBLOCK_SECTION','N','a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),(18,'LOG_ELEMENT_ADD','Y',NULL),(18,'LOG_ELEMENT_DELETE','Y',NULL),(18,'LOG_ELEMENT_EDIT','Y',NULL),(18,'LOG_SECTION_ADD','N',NULL),(18,'LOG_SECTION_DELETE','N',NULL),(18,'LOG_SECTION_EDIT','N',NULL),(18,'NAME','Y',''),(18,'PREVIEW_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(18,'PREVIEW_TEXT','N',''),(18,'PREVIEW_TEXT_TYPE','Y','text'),(18,'PREVIEW_TEXT_TYPE_ALLOW_CHANGE','N','Y'),(18,'SECTION_CODE','N','a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),(18,'SECTION_DESCRIPTION','N',''),(18,'SECTION_DESCRIPTION_TYPE','Y','text'),(18,'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE','N','Y'),(18,'SECTION_DETAIL_PICTURE','N','a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),(18,'SECTION_NAME','Y',''),(18,'SECTION_PICTURE','N','a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),(18,'SECTION_XML_ID','N',''),(18,'SORT','N','500'),(18,'TAGS','N',''),(18,'XML_ID','Y',''),(18,'XML_IMPORT_START_TIME','N',NULL);
/*!40000 ALTER TABLE `b_iblock_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_group`
--

DROP TABLE IF EXISTS `b_iblock_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`),
  KEY `GROUP_ID` (`GROUP_ID`),
  CONSTRAINT `b_iblock_group_ibfk_1` FOREIGN KEY (`IBLOCK_ID`) REFERENCES `b_iblock` (`ID`),
  CONSTRAINT `b_iblock_group_ibfk_2` FOREIGN KEY (`GROUP_ID`) REFERENCES `b_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_group`
--

LOCK TABLES `b_iblock_group` WRITE;
/*!40000 ALTER TABLE `b_iblock_group` DISABLE KEYS */;
INSERT INTO `b_iblock_group` VALUES (1,1,'X'),(1,2,'R'),(1,5,'W'),(2,1,'X'),(2,2,'R'),(2,5,'W'),(3,1,'X'),(3,2,'R'),(3,5,'W'),(4,1,'X'),(4,2,'R'),(4,5,'W'),(17,1,'X'),(17,2,'R'),(18,1,'X'),(18,2,'R');
/*!40000 ALTER TABLE `b_iblock_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_iblock_iprop`
--

DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_iblock_iprop`
--

LOCK TABLES `b_iblock_iblock_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_iproperty`
--

DROP TABLE IF EXISTS `b_iblock_iproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_iproperty`
--

LOCK TABLES `b_iblock_iproperty` WRITE;
/*!40000 ALTER TABLE `b_iblock_iproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_messages`
--

DROP TABLE IF EXISTS `b_iblock_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) NOT NULL,
  `MESSAGE_TEXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_messages`
--

LOCK TABLES `b_iblock_messages` WRITE;
/*!40000 ALTER TABLE `b_iblock_messages` DISABLE KEYS */;
INSERT INTO `b_iblock_messages` VALUES (1,'ELEMENT_ADD','Добавить новость'),(1,'ELEMENT_DELETE','Удалить новость'),(1,'ELEMENT_EDIT','Изменить новость'),(1,'ELEMENT_NAME','Новость'),(1,'ELEMENTS_NAME','Новости'),(1,'SECTION_ADD','Добавить раздел'),(1,'SECTION_DELETE','Удалить раздел'),(1,'SECTION_EDIT','Изменить раздел'),(1,'SECTION_NAME','Раздел'),(1,'SECTIONS_NAME','Разделы'),(2,'ELEMENT_ADD','Добавить товар'),(2,'ELEMENT_DELETE','Удалить товар'),(2,'ELEMENT_EDIT','Изменить товар'),(2,'ELEMENT_NAME','Элемент'),(2,'ELEMENTS_NAME','Товары'),(2,'SECTION_ADD','Добавить раздел'),(2,'SECTION_DELETE','Удалить раздел'),(2,'SECTION_EDIT','Изменить раздел'),(2,'SECTION_NAME','Раздел'),(2,'SECTIONS_NAME','Разделы'),(3,'ELEMENT_ADD','Добавить услугу'),(3,'ELEMENT_DELETE','Удалить услугу'),(3,'ELEMENT_EDIT','Изменить услугу'),(3,'ELEMENT_NAME','Услуга'),(3,'ELEMENTS_NAME','Услуги'),(3,'SECTION_ADD','Добавить раздел'),(3,'SECTION_DELETE','Удалить раздел'),(3,'SECTION_EDIT','Изменить раздел'),(3,'SECTION_NAME','Раздел'),(3,'SECTIONS_NAME','Разделы'),(4,'ELEMENT_ADD','Добавить вакансию'),(4,'ELEMENT_DELETE','Удалить вакансию'),(4,'ELEMENT_EDIT','Изменить вакансию'),(4,'ELEMENT_NAME','Вакансия'),(4,'ELEMENTS_NAME','Вакансии'),(4,'SECTION_ADD','Добавить раздел'),(4,'SECTION_DELETE','Удалить раздел'),(4,'SECTION_EDIT','Изменить раздел'),(4,'SECTION_NAME','Раздел'),(4,'SECTIONS_NAME','Разделы'),(17,'ELEMENT_ADD','Добавить элемент'),(17,'ELEMENT_DELETE','Удалить элемент'),(17,'ELEMENT_EDIT','Изменить элемент'),(17,'ELEMENT_NAME','Элемент'),(17,'ELEMENTS_NAME','Элементы'),(17,'SECTION_ADD','Добавить раздел'),(17,'SECTION_DELETE','Удалить раздел'),(17,'SECTION_EDIT','Изменить раздел'),(17,'SECTION_NAME','Раздел'),(17,'SECTIONS_NAME','Разделы'),(18,'ELEMENT_ADD','Добавить элемент'),(18,'ELEMENT_DELETE','Удалить элемент'),(18,'ELEMENT_EDIT','Изменить элемент'),(18,'ELEMENT_NAME','Элемент'),(18,'ELEMENTS_NAME','Элементы'),(18,'SECTION_ADD','Добавить раздел'),(18,'SECTION_DELETE','Удалить раздел'),(18,'SECTION_EDIT','Изменить раздел'),(18,'SECTION_NAME','Раздел'),(18,'SECTIONS_NAME','Разделы');
/*!40000 ALTER TABLE `b_iblock_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_offers_tmp`
--

DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_offers_tmp`
--

LOCK TABLES `b_iblock_offers_tmp` WRITE;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property`
--

DROP TABLE IF EXISTS `b_iblock_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `CODE` varchar(50) DEFAULT NULL,
  `DEFAULT_VALUE` text DEFAULT NULL,
  `PROPERTY_TYPE` char(1) NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT 1,
  `COL_COUNT` int(11) NOT NULL DEFAULT 30,
  `LIST_TYPE` char(1) NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) DEFAULT NULL,
  `FILE_TYPE` varchar(200) DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) DEFAULT NULL,
  `SEARCHABLE` char(1) NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT 1,
  `USER_TYPE` varchar(255) DEFAULT NULL,
  `USER_TYPE_SETTINGS` text DEFAULT NULL,
  `HINT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`),
  CONSTRAINT `b_iblock_property_ibfk_1` FOREIGN KEY (`IBLOCK_ID`) REFERENCES `b_iblock` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property`
--

LOCK TABLES `b_iblock_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_property` DISABLE KEYS */;
INSERT INTO `b_iblock_property` VALUES (1,'2024-02-28 07:57:52',2,'Специальное предложение','Y',100,'SPECIALOFFER','','L',1,30,'C','N','5','',5,NULL,0,'N','N','N','Y',1,NULL,'a:0:{}',''),(2,'2024-02-28 07:38:45',2,'Цена','Y',200,'PRICE','','N',1,30,'L','N','6','',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(3,'2024-02-28 07:38:45',2,'Валюта цены (подпись)','Y',300,'PRICECURRENCY','','L',1,30,'C','N','7','',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(4,'2024-02-28 07:38:45',2,'Габариты (Д х Ш х В)','Y',400,'SIZE','','S',1,30,'L','N','8','',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(5,'2024-02-28 07:38:45',2,'Размеры спального места','Y',500,'S_SIZE','','S',1,30,'L','N','9','',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(6,'2024-02-28 07:38:45',2,'Артикул','Y',600,'ARTNUMBER','','S',1,30,'L','N','10','',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(7,'2024-02-28 07:38:45',2,'Материал','Y',700,'MATERIAL','','S',1,30,'L','N','11','',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(8,'2024-02-28 07:38:45',2,'Производитель','Y',800,'MANUFACTURER','','S',1,30,'L','N','12','',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(33,'2024-02-26 12:06:25',17,'Должность','Y',500,'JOB_TITLE','','S',1,30,'L','N',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(34,'2024-02-26 12:06:25',17,'Название компании','Y',500,'NAME_COMPANY','','S',1,30,'L','N',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(35,'2024-02-27 07:13:31',18,'Цена','Y',500,'PRICE','','S',1,30,'L','N',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(36,'2024-02-27 12:42:05',1,'Заголовок браузера','Y',500,'NAME_BROWSER','','S',1,30,'L','N',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(37,'2024-02-27 12:42:05',1,'Ключевые слова','Y',500,'KEY_WORD','','S',1,30,'L','N',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,'a:0:{}',''),(38,'2024-02-28 08:57:20',2,'Наличие','Y',500,'AVAILABILITY','','L',1,30,'L','N',NULL,'',5,NULL,0,'N','N','N','N',1,NULL,NULL,'');
/*!40000 ALTER TABLE `b_iblock_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property_enum`
--

DROP TABLE IF EXISTS `b_iblock_property_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `XML_ID` varchar(200) NOT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property_enum`
--

LOCK TABLES `b_iblock_property_enum` WRITE;
/*!40000 ALTER TABLE `b_iblock_property_enum` DISABLE KEYS */;
INSERT INTO `b_iblock_property_enum` VALUES (1,1,'да','N',500,'Y',NULL),(2,3,'руб.','Y',10,'corp_cf_cur_1',NULL),(3,3,'$','N',20,'corp_cf_cur_3',NULL),(4,3,'€','N',30,'corp_cf_cur_2',NULL),(7,38,'В наличие','N',500,'8e64d06f51aa637686c98d054eb9ba10',NULL),(8,38,'Нет в наличие','N',500,'6b499e2423905f8bbb8675b47f314e9c',NULL);
/*!40000 ALTER TABLE `b_iblock_property_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_property_feature`
--

DROP TABLE IF EXISTS `b_iblock_property_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_property_feature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `FEATURE_ID` varchar(100) NOT NULL,
  `IS_ENABLED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_property_feature`
--

LOCK TABLES `b_iblock_property_feature` WRITE;
/*!40000 ALTER TABLE `b_iblock_property_feature` DISABLE KEYS */;
INSERT INTO `b_iblock_property_feature` VALUES (29,1,'iblock','LIST_PAGE_SHOW','N'),(30,1,'iblock','DETAIL_PAGE_SHOW','N'),(31,38,'iblock','LIST_PAGE_SHOW','N'),(32,38,'iblock','DETAIL_PAGE_SHOW','N');
/*!40000 ALTER TABLE `b_iblock_property_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_right`
--

DROP TABLE IF EXISTS `b_iblock_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) NOT NULL,
  `ENTITY_TYPE` varchar(32) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) NOT NULL,
  `OP_EREAD` char(1) NOT NULL,
  `XML_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`),
  CONSTRAINT `b_iblock_right_ibfk_1` FOREIGN KEY (`IBLOCK_ID`) REFERENCES `b_iblock` (`ID`),
  CONSTRAINT `b_iblock_right_ibfk_2` FOREIGN KEY (`TASK_ID`) REFERENCES `b_task` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_right`
--

LOCK TABLES `b_iblock_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_rss`
--

DROP TABLE IF EXISTS `b_iblock_rss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) NOT NULL,
  `NODE_VALUE` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_rss`
--

LOCK TABLES `b_iblock_rss` WRITE;
/*!40000 ALTER TABLE `b_iblock_rss` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_rss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section`
--

DROP TABLE IF EXISTS `b_iblock_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `NAME` varchar(255) NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `DESCRIPTION_TYPE` char(4) NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `TMP_ID` varchar(40) DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IBLOCK_SECTION_ID` (`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`),
  KEY `ix_iblock_section_left_margin2` (`IBLOCK_ID`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_right_margin2` (`IBLOCK_ID`,`RIGHT_MARGIN`),
  CONSTRAINT `b_iblock_section_ibfk_1` FOREIGN KEY (`IBLOCK_ID`) REFERENCES `b_iblock` (`ID`),
  CONSTRAINT `b_iblock_section_ibfk_2` FOREIGN KEY (`IBLOCK_SECTION_ID`) REFERENCES `b_iblock_section` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section`
--

LOCK TABLES `b_iblock_section` WRITE;
/*!40000 ALTER TABLE `b_iblock_section` DISABLE KEYS */;
INSERT INTO `b_iblock_section` VALUES (1,'2024-02-07 11:20:21',1,'2024-02-07 14:20:21',1,2,NULL,'Y','Y',100,'Мягкая мебель',1,1,2,1,'Диваны, кресла и прочая мягкая мебель','html','МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ',NULL,'2',NULL,NULL,NULL),(2,'2024-02-07 11:20:21',1,'2024-02-07 14:20:21',1,2,NULL,'Y','Y',200,'Офисная мебель',2,3,4,1,'Диваны, столы, стулья','html','ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ',NULL,'3',NULL,NULL,NULL),(3,'2024-02-07 11:20:22',1,'2024-02-07 14:20:22',1,2,NULL,'Y','Y',300,'Мебель для кухни',3,5,6,1,'Полки, ящики, столы и стулья','html','МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ',NULL,'4',NULL,NULL,NULL),(4,'2024-02-07 11:20:22',1,'2024-02-07 14:20:22',1,2,NULL,'Y','Y',400,'Детская мебель',4,7,8,1,'Кровати, стулья, мягкая детская мебель','html','ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ',NULL,'5',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_iblock_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_element`
--

DROP TABLE IF EXISTS `b_iblock_section_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_element`
--

LOCK TABLES `b_iblock_section_element` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_element` DISABLE KEYS */;
INSERT INTO `b_iblock_section_element` VALUES (1,4,NULL),(1,5,NULL),(1,9,NULL),(1,10,NULL),(1,11,NULL),(1,12,NULL),(1,13,NULL),(1,14,NULL),(2,6,NULL),(2,7,NULL),(2,15,NULL),(2,16,NULL),(2,17,NULL),(2,18,NULL),(2,19,NULL),(2,20,NULL),(3,8,NULL),(3,21,NULL),(3,22,NULL),(3,23,NULL),(4,24,NULL),(4,25,NULL),(4,26,NULL),(4,27,NULL);
/*!40000 ALTER TABLE `b_iblock_section_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_iprop`
--

DROP TABLE IF EXISTS `b_iblock_section_iprop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_iprop`
--

LOCK TABLES `b_iblock_section_iprop` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_iprop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_property`
--

DROP TABLE IF EXISTS `b_iblock_section_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) DEFAULT NULL,
  `DISPLAY_TYPE` char(1) DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) DEFAULT NULL,
  `FILTER_HINT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_property`
--

LOCK TABLES `b_iblock_section_property` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_property` DISABLE KEYS */;
INSERT INTO `b_iblock_section_property` VALUES (2,0,1,'N','F','N',''),(2,0,2,'N','A','N',''),(2,0,3,'N','F','N',''),(2,0,4,'N','F','N',''),(2,0,5,'N','F','N',''),(2,0,6,'N','F','N',''),(2,0,7,'N','F','N',''),(2,0,8,'N','F','N',''),(2,0,38,'Y','F','N','');
/*!40000 ALTER TABLE `b_iblock_section_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_section_right`
--

DROP TABLE IF EXISTS `b_iblock_section_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`),
  CONSTRAINT `b_iblock_section_right_ibfk_1` FOREIGN KEY (`IBLOCK_ID`) REFERENCES `b_iblock` (`ID`),
  CONSTRAINT `b_iblock_section_right_ibfk_2` FOREIGN KEY (`RIGHT_ID`) REFERENCES `b_iblock_right` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_section_right`
--

LOCK TABLES `b_iblock_section_right` WRITE;
/*!40000 ALTER TABLE `b_iblock_section_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_sequence`
--

DROP TABLE IF EXISTS `b_iblock_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_sequence`
--

LOCK TABLES `b_iblock_sequence` WRITE;
/*!40000 ALTER TABLE `b_iblock_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_site`
--

DROP TABLE IF EXISTS `b_iblock_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_site`
--

LOCK TABLES `b_iblock_site` WRITE;
/*!40000 ALTER TABLE `b_iblock_site` DISABLE KEYS */;
INSERT INTO `b_iblock_site` VALUES (1,'s1'),(2,'s1'),(3,'s1'),(4,'s1'),(17,'s1'),(18,'s1');
/*!40000 ALTER TABLE `b_iblock_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_type`
--

DROP TABLE IF EXISTS `b_iblock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) NOT NULL,
  `SECTIONS` char(1) NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) DEFAULT NULL,
  `IN_RSS` char(1) NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT 500,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_type`
--

LOCK TABLES `b_iblock_type` WRITE;
/*!40000 ALTER TABLE `b_iblock_type` DISABLE KEYS */;
INSERT INTO `b_iblock_type` VALUES ('action','Y','','','N',500),('comments','Y','','','N',500),('news','N',NULL,NULL,'Y',50),('products','Y',NULL,NULL,'N',100),('rest_entity','Y',NULL,NULL,'N',1000),('vacancies','Y',NULL,NULL,'N',150);
/*!40000 ALTER TABLE `b_iblock_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_iblock_type_lang`
--

DROP TABLE IF EXISTS `b_iblock_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SECTION_NAME` varchar(100) DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_iblock_type_lang`
--

LOCK TABLES `b_iblock_type_lang` WRITE;
/*!40000 ALTER TABLE `b_iblock_type_lang` DISABLE KEYS */;
INSERT INTO `b_iblock_type_lang` VALUES ('rest_entity','ru','Хранилище данных для приложений','Разделы','Элементы'),('news','ru','Новости','','Новости'),('news','en','News','','News'),('products','ru','Товары и услуги','Разделы','Товары и услуги'),('products','en','Products and services','Sections','Products and services'),('vacancies','ru','Вакансии','Разделы','Вакансии'),('vacancies','en','Job','Categories','Vacancies'),('comments','ru','Отзывы','Да','Да'),('comments','en','Comments','Yes','Yes'),('action','ru','Акции','',''),('action','en','Action','','');
/*!40000 ALTER TABLE `b_iblock_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing`
--

DROP TABLE IF EXISTS `b_landing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) DEFAULT NULL,
  `RULE` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) NOT NULL DEFAULT 'Y',
  `SYS` char(1) NOT NULL DEFAULT 'N',
  `VIEWS` int(18) NOT NULL DEFAULT 0,
  `TITLE` varchar(255) NOT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `SITEMAP` char(1) NOT NULL DEFAULT 'N',
  `FOLDER` char(1) NOT NULL DEFAULT 'N',
  `FOLDER_ID` int(18) DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext DEFAULT NULL,
  `VERSION` int(18) NOT NULL DEFAULT 1,
  `HISTORY_STEP` int(18) NOT NULL DEFAULT 0,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_SYS` (`SYS`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITE_ID` (`SITE_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`),
  FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing`
--

LOCK TABLES `b_landing` WRITE;
/*!40000 ALTER TABLE `b_landing` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_binding`
--

DROP TABLE IF EXISTS `b_landing_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `BINDING_ID` varchar(50) NOT NULL,
  `BINDING_TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_binding`
--

LOCK TABLES `b_landing_binding` WRITE;
/*!40000 ALTER TABLE `b_landing_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_block`
--

DROP TABLE IF EXISTS `b_landing_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `LID` int(18) NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `CODE_ORIGINAL` varchar(255) DEFAULT NULL,
  `TPL_CODE` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) NOT NULL,
  `ANCHOR` varchar(255) DEFAULT NULL,
  `SORT` int(18) DEFAULT 500,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) NOT NULL DEFAULT 'Y',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `DESIGNED` char(1) NOT NULL DEFAULT 'N',
  `ACCESS` char(1) NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext DEFAULT NULL,
  `CONTENT` mediumtext NOT NULL,
  `SEARCH_CONTENT` mediumtext DEFAULT NULL,
  `ASSETS` text DEFAULT NULL,
  `FAVORITE_META` text DEFAULT NULL,
  `HISTORY_STEP_DESIGNER` int(18) NOT NULL DEFAULT 0,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_LID_PUBLIC` (`LID`,`PUBLIC`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`,`DATE_CREATE`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`),
  FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_block`
--

LOCK TABLES `b_landing_block` WRITE;
/*!40000 ALTER TABLE `b_landing_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_block_last_used`
--

DROP TABLE IF EXISTS `b_landing_block_last_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_block_last_used` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LU_USER` (`USER_ID`),
  KEY `IX_B_BLOCK_LU_CODE` (`CODE`),
  KEY `IX_B_BLOCK_LU_USER_CODE` (`USER_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_block_last_used`
--

LOCK TABLES `b_landing_block_last_used` WRITE;
/*!40000 ALTER TABLE `b_landing_block_last_used` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_block_last_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_chat`
--

DROP TABLE IF EXISTS `b_landing_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_chat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHAT_ID` int(18) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `AVATAR` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`CHAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_chat`
--

LOCK TABLES `b_landing_chat` WRITE;
/*!40000 ALTER TABLE `b_landing_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_chat_binding`
--

DROP TABLE IF EXISTS `b_landing_chat_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_chat_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `INTERNAL_CHAT_ID` int(18) NOT NULL,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_chat_binding`
--

LOCK TABLES `b_landing_chat_binding` WRITE;
/*!40000 ALTER TABLE `b_landing_chat_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_chat_binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_cookies_agreement`
--

DROP TABLE IF EXISTS `b_landing_cookies_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_cookies_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SITE_ID` int(18) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `CONTENT` mediumtext NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE` (`SITE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_cookies_agreement`
--

LOCK TABLES `b_landing_cookies_agreement` WRITE;
/*!40000 ALTER TABLE `b_landing_cookies_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_cookies_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_demo`
--

DROP TABLE IF EXISTS `b_landing_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_demo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) NOT NULL,
  `APP_CODE` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) NOT NULL,
  `TPL_TYPE` char(1) NOT NULL,
  `SHOW_IN_LIST` char(1) NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PREVIEW_URL` varchar(255) DEFAULT NULL,
  `PREVIEW` varchar(255) DEFAULT NULL,
  `PREVIEW2X` varchar(255) DEFAULT NULL,
  `PREVIEW3X` varchar(255) DEFAULT NULL,
  `MANIFEST` mediumtext DEFAULT NULL,
  `LANG` text DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_demo`
--

LOCK TABLES `b_landing_demo` WRITE;
/*!40000 ALTER TABLE `b_landing_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_designer_repo`
--

DROP TABLE IF EXISTS `b_landing_designer_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_designer_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `SORT` int(18) DEFAULT 100,
  `HTML` text NOT NULL,
  `MANIFEST` text NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_designer_repo`
--

LOCK TABLES `b_landing_designer_repo` WRITE;
/*!40000 ALTER TABLE `b_landing_designer_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_designer_repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_domain`
--

DROP TABLE IF EXISTS `b_landing_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_domain` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) NOT NULL,
  `PREV_DOMAIN` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `PROTOCOL` varchar(10) NOT NULL,
  `PROVIDER` varchar(50) DEFAULT NULL,
  `FAIL_COUNT` int(2) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_domain`
--

LOCK TABLES `b_landing_domain` WRITE;
/*!40000 ALTER TABLE `b_landing_domain` DISABLE KEYS */;
INSERT INTO `b_landing_domain` VALUES (1,'Y','sevostjanov.45-86-181-97.ip.dev.2204535.ru','',NULL,'https',NULL,NULL,1,1,'2024-02-08 06:08:27','2024-02-08 06:08:27');
/*!40000 ALTER TABLE `b_landing_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_entity_lock`
--

DROP TABLE IF EXISTS `b_landing_entity_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_entity_lock` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `LOCK_TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_TYPE` (`LOCK_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_entity_lock`
--

LOCK TABLES `b_landing_entity_lock` WRITE;
/*!40000 ALTER TABLE `b_landing_entity_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_entity_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_entity_rights`
--

DROP TABLE IF EXISTS `b_landing_entity_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_entity_rights` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) NOT NULL,
  `ROLE_ID` int(18) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_entity_rights`
--

LOCK TABLES `b_landing_entity_rights` WRITE;
/*!40000 ALTER TABLE `b_landing_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_entity_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_file`
--

DROP TABLE IF EXISTS `b_landing_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `TEMP` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`),
  KEY `IX_TEMP` (`TEMP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_file`
--

LOCK TABLES `b_landing_file` WRITE;
/*!40000 ALTER TABLE `b_landing_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_filter_block`
--

DROP TABLE IF EXISTS `b_landing_filter_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_filter_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILTER_ID` int(18) NOT NULL,
  `BLOCK_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_filter_block`
--

LOCK TABLES `b_landing_filter_block` WRITE;
/*!40000 ALTER TABLE `b_landing_filter_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_filter_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_filter_entity`
--

DROP TABLE IF EXISTS `b_landing_filter_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_filter_entity` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) NOT NULL,
  `FILTER_HASH` char(32) NOT NULL,
  `FILTER` text DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_filter_entity`
--

LOCK TABLES `b_landing_filter_entity` WRITE;
/*!40000 ALTER TABLE `b_landing_filter_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_filter_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_folder`
--

DROP TABLE IF EXISTS `b_landing_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_folder` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `INDEX_ID` int(18) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_FOLDER_SITE_ID` (`SITE_ID`),
  KEY `IX_B_FOLDER_ACTIVE` (`ACTIVE`),
  KEY `IX_B_FOLDER_DELETED` (`DELETED`),
  KEY `IX_B_FOLDER_PARENT_ID` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_folder`
--

LOCK TABLES `b_landing_folder` WRITE;
/*!40000 ALTER TABLE `b_landing_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_history`
--

DROP TABLE IF EXISTS `b_landing_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) NOT NULL DEFAULT 'L',
  `ENTITY_ID` int(18) NOT NULL,
  `ACTION` text NOT NULL,
  `ACTION_PARAMS` text NOT NULL,
  `MULTIPLY_ID` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_HISTORY_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_history`
--

LOCK TABLES `b_landing_history` WRITE;
/*!40000 ALTER TABLE `b_landing_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_hook_data`
--

DROP TABLE IF EXISTS `b_landing_hook_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_hook_data` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `HOOK` varchar(50) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `PUBLIC` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `K_HOOK_CODE` (`HOOK`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_hook_data`
--

LOCK TABLES `b_landing_hook_data` WRITE;
/*!40000 ALTER TABLE `b_landing_hook_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_hook_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_placement`
--

DROP TABLE IF EXISTS `b_landing_placement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_placement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) DEFAULT NULL,
  `PLACEMENT` varchar(255) NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) NOT NULL,
  `TITLE` varchar(255) DEFAULT '',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_placement`
--

LOCK TABLES `b_landing_placement` WRITE;
/*!40000 ALTER TABLE `b_landing_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_placement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_repo`
--

DROP TABLE IF EXISTS `b_landing_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) NOT NULL,
  `APP_CODE` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SECTIONS` varchar(255) DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) DEFAULT NULL,
  `PREVIEW` varchar(255) DEFAULT NULL,
  `MANIFEST` text DEFAULT NULL,
  `CONTENT` text NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_repo`
--

LOCK TABLES `b_landing_repo` WRITE;
/*!40000 ALTER TABLE `b_landing_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_role`
--

DROP TABLE IF EXISTS `b_landing_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_role` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ACCESS_CODES` text DEFAULT NULL,
  `ADDITIONAL_RIGHTS` text DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_ROLE_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_role`
--

LOCK TABLES `b_landing_role` WRITE;
/*!40000 ALTER TABLE `b_landing_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_site`
--

DROP TABLE IF EXISTS `b_landing_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_site` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) NOT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(50) NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) DEFAULT NULL,
  `DOMAIN_ID` int(18) NOT NULL,
  `SMN_SITE_ID` char(2) DEFAULT NULL,
  `LANDING_ID_INDEX` int(18) DEFAULT NULL,
  `LANDING_ID_404` int(18) DEFAULT NULL,
  `LANDING_ID_503` int(18) DEFAULT NULL,
  `LANG` char(2) DEFAULT NULL,
  `SPECIAL` char(1) NOT NULL DEFAULT 'N',
  `VERSION` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  KEY `IX_B_SITE_SPECIAL` (`SPECIAL`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_site`
--

LOCK TABLES `b_landing_site` WRITE;
/*!40000 ALTER TABLE `b_landing_site` DISABLE KEYS */;
INSERT INTO `b_landing_site` VALUES (1,'/fgjzrlsitb/','Y','N','Cайт производства (Сайт по умолчанию)',NULL,NULL,'SMN',0,NULL,1,'s1',NULL,NULL,NULL,NULL,'N',2,1,1,'2024-02-08 06:08:27','2024-02-08 06:08:27'),(2,'/jtkkbu7ebc/','Y','N','kv',NULL,NULL,'SMN',0,NULL,1,'kv',NULL,NULL,NULL,NULL,'N',2,1,1,'2024-02-08 06:08:30','2024-02-08 06:08:30');
/*!40000 ALTER TABLE `b_landing_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_syspage`
--

DROP TABLE IF EXISTS `b_landing_syspage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_syspage` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_syspage`
--

LOCK TABLES `b_landing_syspage` WRITE;
/*!40000 ALTER TABLE `b_landing_syspage` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_syspage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_template`
--

DROP TABLE IF EXISTS `b_landing_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_template` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) NOT NULL,
  `SORT` int(18) DEFAULT 100,
  `XML_ID` varchar(255) DEFAULT NULL,
  `CONTENT` text NOT NULL,
  `AREA_COUNT` int(2) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_template`
--

LOCK TABLES `b_landing_template` WRITE;
/*!40000 ALTER TABLE `b_landing_template` DISABLE KEYS */;
INSERT INTO `b_landing_template` VALUES (1,'Y','#EMPTY#',100,'empty','#CONTENT#',0,1,1,'2024-02-07 11:14:48','2024-02-07 11:14:48'),(2,'Y','#SIDEBAR_LEFT#',200,'sidebar_left','<div class=\"landing-layout-flex\">\n								<div class=\"landing-sidebar g-max-width-100x g-overflow-hidden\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>',1,1,1,'2024-02-07 11:14:48','2024-02-07 11:14:48'),(3,'Y','#SIDEBAR_RIGHT#',300,'sidebar_right','<div class=\"landing-layout-flex sidebar-right\">\n								<div class=\"landing-sidebar g-max-width-100x\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>',1,1,1,'2024-02-07 11:14:48','2024-02-07 11:14:48'),(4,'Y','#HEADER_ONLY#',400,'header_only','<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div>',1,1,1,'2024-02-07 11:14:48','2024-02-07 11:14:48'),(5,'Y','#HEADER_FOOTER#',500,'header_footer','<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div> \n							<div class=\"landing-footer\">#AREA_2#</div>',2,1,1,'2024-02-07 11:14:48','2024-02-07 11:14:48'),(6,'Y','#WITHOUT_LEFT#',600,'without_left','<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex without-left\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>',3,1,1,'2024-02-07 11:14:48','2024-02-07 11:14:48'),(7,'Y','#WITHOUT_RIGHT#',700,'without_right','<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>',3,1,1,'2024-02-07 11:14:48','2024-02-07 11:14:48');
/*!40000 ALTER TABLE `b_landing_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_template_ref`
--

DROP TABLE IF EXISTS `b_landing_template_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_template_ref` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) NOT NULL,
  `AREA` int(2) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_template_ref`
--

LOCK TABLES `b_landing_template_ref` WRITE;
/*!40000 ALTER TABLE `b_landing_template_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_template_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_update_block`
--

DROP TABLE IF EXISTS `b_landing_update_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_update_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) NOT NULL,
  `LAST_BLOCK_ID` int(18) DEFAULT 0,
  `PARAMS` text DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_update_block`
--

LOCK TABLES `b_landing_update_block` WRITE;
/*!40000 ALTER TABLE `b_landing_update_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_update_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_urlchecker_host`
--

DROP TABLE IF EXISTS `b_landing_urlchecker_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_urlchecker_host` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL,
  `HOST` varchar(255) NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_STATUS_HOST` (`STATUS_ID`,`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_urlchecker_host`
--

LOCK TABLES `b_landing_urlchecker_host` WRITE;
/*!40000 ALTER TABLE `b_landing_urlchecker_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_urlchecker_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_urlchecker_status`
--

DROP TABLE IF EXISTS `b_landing_urlchecker_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_urlchecker_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) NOT NULL,
  `HASH` char(32) NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_HASH` (`HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_urlchecker_status`
--

LOCK TABLES `b_landing_urlchecker_status` WRITE;
/*!40000 ALTER TABLE `b_landing_urlchecker_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_urlchecker_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_urlchecker_whitelist`
--

DROP TABLE IF EXISTS `b_landing_urlchecker_whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_urlchecker_whitelist` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DOMAIN` varchar(255) NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_DOMAIN` (`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_urlchecker_whitelist`
--

LOCK TABLES `b_landing_urlchecker_whitelist` WRITE;
/*!40000 ALTER TABLE `b_landing_urlchecker_whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_urlchecker_whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_urlrewrite`
--

DROP TABLE IF EXISTS `b_landing_urlrewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_urlrewrite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `RULE` varchar(255) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_urlrewrite`
--

LOCK TABLES `b_landing_urlrewrite` WRITE;
/*!40000 ALTER TABLE `b_landing_urlrewrite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_urlrewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_landing_view`
--

DROP TABLE IF EXISTS `b_landing_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_landing_view` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `VIEWS` int(18) NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_landing_view`
--

LOCK TABLES `b_landing_view` WRITE;
/*!40000 ALTER TABLE `b_landing_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_lang`
--

DROP TABLE IF EXISTS `b_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_lang` (
  `LID` char(2) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) NOT NULL,
  `DIR` varchar(50) NOT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `DOC_ROOT` varchar(255) DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) DEFAULT NULL,
  `SITE_NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_lang`
--

LOCK TABLES `b_lang` WRITE;
/*!40000 ALTER TABLE `b_lang` DISABLE KEYS */;
INSERT INTO `b_lang` VALUES ('kv',100,'N','Y','kv','/site_kv/',NULL,NULL,NULL,NULL,NULL,'ru','','N','sevostjanov.45-86-181-97.ip.dev.2204535.ru','kv','enot07142004@gmail.com',1),('s1',1,'Y','Y','Cайт производства (Сайт по умолчанию)','/',NULL,NULL,NULL,NULL,NULL,'ru','','N','','Cайт производства','',1);
/*!40000 ALTER TABLE `b_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_lang_domain`
--

DROP TABLE IF EXISTS `b_lang_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) NOT NULL,
  `DOMAIN` varchar(255) NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_lang_domain`
--

LOCK TABLES `b_lang_domain` WRITE;
/*!40000 ALTER TABLE `b_lang_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_lang_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_language`
--

DROP TABLE IF EXISTS `b_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_language` (
  `LID` char(2) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) NOT NULL,
  `FORMAT_DATE` varchar(50) DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) DEFAULT NULL,
  `FORMAT_NAME` varchar(255) DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) DEFAULT NULL,
  `DIRECTION` char(1) DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  `CODE` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_language`
--

LOCK TABLES `b_language` WRITE;
/*!40000 ALTER TABLE `b_language` DISABLE KEYS */;
INSERT INTO `b_language` VALUES ('en',2,'N','Y','English',NULL,NULL,NULL,NULL,NULL,NULL,2,'en'),('ru',1,'Y','Y','Russian',NULL,NULL,NULL,NULL,NULL,NULL,1,'ru');
/*!40000 ALTER TABLE `b_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_list_rubric`
--

DROP TABLE IF EXISTS `b_list_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `AUTO` char(1) NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) DEFAULT NULL,
  `TEMPLATE` varchar(100) DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LID` (`LID`),
  CONSTRAINT `b_list_rubric_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `b_lang` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_list_rubric`
--

LOCK TABLES `b_list_rubric` WRITE;
/*!40000 ALTER TABLE `b_list_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_list_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location`
--

DROP TABLE IF EXISTS `b_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) NOT NULL,
  `EXTERNAL_ID` varchar(255) DEFAULT NULL,
  `SOURCE_CODE` varchar(15) DEFAULT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TYPE` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODE` (`CODE`),
  UNIQUE KEY `IX_LOC_SE` (`EXTERNAL_ID`,`SOURCE_CODE`),
  KEY `IX_LOC_LAT` (`LATITUDE`),
  KEY `IX_LOC_LON` (`LONGITUDE`),
  KEY `IX_LOC_T` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location`
--

LOCK TABLES `b_location` WRITE;
/*!40000 ALTER TABLE `b_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location_addr_fld`
--

DROP TABLE IF EXISTS `b_location_addr_fld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location_addr_fld` (
  `ADDRESS_ID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `VALUE` varchar(1024) DEFAULT NULL,
  `VALUE_NORMALIZED` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location_addr_fld`
--

LOCK TABLES `b_location_addr_fld` WRITE;
/*!40000 ALTER TABLE `b_location_addr_fld` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_location_addr_fld` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location_addr_link`
--

DROP TABLE IF EXISTS `b_location_addr_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location_addr_link` (
  `ADDRESS_ID` int(11) NOT NULL,
  `ENTITY_ID` varchar(100) NOT NULL,
  `ENTITY_TYPE` varchar(50) NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`,`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IDX_BLAL_EI_ET` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location_addr_link`
--

LOCK TABLES `b_location_addr_link` WRITE;
/*!40000 ALTER TABLE `b_location_addr_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_location_addr_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location_address`
--

DROP TABLE IF EXISTS `b_location_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location_address` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` int(11) DEFAULT 0,
  `LANGUAGE_ID` char(2) NOT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_LOC_BLA_LOC` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location_address`
--

LOCK TABLES `b_location_address` WRITE;
/*!40000 ALTER TABLE `b_location_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_location_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location_area`
--

DROP TABLE IF EXISTS `b_location_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location_area` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(100) NOT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `SORT` int(11) NOT NULL,
  `GEOMETRY` longtext DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TYPE` (`TYPE`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location_area`
--

LOCK TABLES `b_location_area` WRITE;
/*!40000 ALTER TABLE `b_location_area` DISABLE KEYS */;
INSERT INTO `b_location_area` VALUES (1,'DISPUTED','CRIMEA',0,'{\"type\":\"Polygon\",\"coordinates\":[[[32.201579,45.396892],[32.2052178,45.3690507],[32.2090567,45.3553206],[32.2172905,45.3355145],[32.2240585,45.3025866],[32.235686,45.2758033],[32.2434204,45.2628881],[32.2625503,45.2383126],[32.2738567,45.2267674],[32.2996887,45.2054331],[32.329404,45.1867687],[32.3624492,45.1711247],[32.3982085,45.1587952],[32.4168995,45.1539484],[32.4554687,45.1470047],[32.4878048,45.1442331],[32.5164102,45.1327887],[32.5532795,45.1222016],[32.5918488,45.115254],[32.6313994,45.1120768],[32.6711947,45.1127297],[32.729727,45.1208441],[32.8314558,45.1507864],[32.853076,45.1219934],[32.8767811,45.0994253],[32.8902144,45.0890467],[32.9199297,45.0703442],[32.9451894,45.0580954],[32.9796287,45.0321305],[33.0110823,45.0148866],[33.0279839,45.0074406],[33.0637432,44.9950757],[33.0879643,44.989073],[33.1342119,44.9689946],[33.192902,44.9506562],[33.2511697,44.9416162],[33.2951871,44.9405202],[33.5542562,44.8402319],[33.5621787,44.8410979],[33.5671526,44.838601],[33.5736666,44.8238183],[33.5866523,44.807848],[33.6044231,44.8103433],[33.6586481,44.7965631],[33.6693271,44.7918226],[33.6774224,44.7858657],[33.6827993,44.7703386],[33.6355485,44.7529449],[33.6136625,44.7497551],[33.6148368,44.7391957],[33.6111957,44.738286],[33.6105707,44.7329396],[33.611606,44.7296545],[33.6146258,44.729927],[33.6161203,44.711976],[33.6589663,44.7142533],[33.6708014,44.7097439],[33.7006932,44.7148119],[33.7072434,44.7105734],[33.7051533,44.7086069],[33.7050933,44.7049158],[33.7145084,44.705868],[33.715643,44.715848],[33.7265921,44.716636],[33.7348624,44.7075832],[33.7462868,44.7010307],[33.7518027,44.6987863],[33.7615132,44.7009902],[33.7769711,44.690265],[33.7674787,44.6820761],[33.754625,44.6753399],[33.7518666,44.6637439],[33.7300323,44.6470751],[33.7254762,44.6401041],[33.7176817,44.6375914],[33.7168675,44.6332156],[33.7218757,44.631584],[33.7162703,44.6204383],[33.7272166,44.6085501],[33.7286926,44.6046812],[33.735653,44.6009246],[33.7419126,44.6053835],[33.7496197,44.60791],[33.7651672,44.6091022],[33.7795796,44.6131096],[33.7828306,44.6059825],[33.781845,44.5971035],[33.7872108,44.5856602],[33.7920091,44.5848619],[33.7951987,44.5802969],[33.8004378,44.5814222],[33.8056839,44.5753186],[33.8093847,44.5769972],[33.8114458,44.5738111],[33.8139036,44.5771175],[33.8173303,44.577274],[33.8272108,44.5712636],[33.8273394,44.563316],[33.8310821,44.5548411],[33.8345552,44.5499395],[33.8372152,44.548782],[33.8337314,44.5416787],[33.8394649,44.5384748],[33.8401482,44.5304315],[33.8494976,44.5306195],[33.8572702,44.5258757],[33.8456566,44.519124],[33.85315,44.5154015],[33.8603572,44.5067568],[33.868911,44.5073968],[33.8707581,44.5054113],[33.8673484,44.5025419],[33.8672494,44.5003522],[33.8736292,44.4926938],[33.8869091,44.4822103],[33.8971535,44.4787873],[33.8934902,44.4732254],[33.8972198,44.4692246],[33.9262025,44.4213251],[33.9094099,44.4188846],[33.9024805,44.4193681],[33.8980569,44.4214726],[33.8828051,44.4210572],[33.8706281,44.4188467],[33.8591887,44.4199143],[33.8469623,44.4171293],[33.8292787,44.4089158],[33.8245729,44.411664],[33.8140922,44.4100258],[33.797829,44.4041246],[33.781585,44.4057444],[33.7840022,44.402866],[33.7855572,44.3968776],[33.7623083,44.3900862],[33.696591,44.1910397],[33.7357422,44.1858835],[33.7755079,44.184598],[33.8151473,44.1872073],[33.8567133,44.1943491],[33.9116725,44.1858835],[33.9514382,44.184598],[33.9910776,44.1872073],[34.0298524,44.1936623],[34.0670401,44.2038415],[34.0927335,44.2136353],[34.1417952,44.2137713],[34.2003274,44.2220125],[34.2375152,44.2321868],[34.2552959,44.2386127],[34.2888171,44.2539909],[34.3191029,44.2724903],[34.3328536,44.282804],[34.3551268,44.3032135],[34.3834932,44.3128241],[34.4170144,44.3281829],[34.4325985,44.3370516],[34.4579166,44.3546118],[34.4947227,44.3688605],[34.5111166,44.3769423],[34.5414024,44.3954029],[34.5678887,44.4166315],[34.590082,44.4402299],[34.607569,44.4657558],[34.6144422,44.4790935],[34.6220858,44.4994412],[34.6450122,44.5206113],[34.6661359,44.547163],[34.7006849,44.5628297],[34.735755,44.5848013],[34.7764494,44.5934492],[34.8085382,44.6038903],[34.8324881,44.6023351],[34.8722834,44.6029938],[34.9291911,44.6108698],[34.963432,44.598995],[35.0012394,44.590126],[35.0602428,44.5838827],[35.1197957,44.5863196],[35.1774068,44.5973337],[35.1957581,44.6028408],[35.2306662,44.6164595],[35.2586785,44.6310857],[35.2852182,44.6416945],[35.3171962,44.6585585],[35.3318979,44.668113],[35.3583842,44.6892424],[35.3805775,44.7127305],[35.3975542,44.7373268],[35.4116276,44.7442895],[35.4626979,44.7517865],[35.4998857,44.7618689],[35.5176664,44.7682366],[35.5511876,44.7834757],[35.5667717,44.7922754],[35.5952241,44.8120281],[35.6196208,44.8343376],[35.6322493,44.8491155],[35.670408,44.8272773],[35.7048906,44.8131714],[35.7230689,44.8074017],[35.7803291,44.7955387],[35.8397932,44.7921897],[35.8794326,44.7947719],[35.9241291,44.8026019],[35.9742343,44.8026778],[36.013533,44.8071728],[36.051603,44.8154218],[36.1028199,44.8336163],[36.1372853,44.8256548],[36.1764365,44.8205545],[36.2162022,44.8192829],[36.2558416,44.821864],[36.3134527,44.8328333],[36.3630225,44.8503296],[36.4154063,44.8528108],[36.454181,44.8591924],[36.4913688,44.869256],[36.5262768,44.8828121],[36.5426707,44.8908227],[36.5729565,44.9091205],[36.5994428,44.9301619],[36.6097225,44.9406672],[36.5679872,45.0506562],[36.5428648,45.1340402],[36.5338353,45.1751824],[36.530486,45.1992024],[36.5542469,45.2216309],[36.5859391,45.2441721],[36.5941742,45.252542],[36.5937019,45.2823897],[36.6030245,45.3093876],[36.6227602,45.3280113],[36.6635019,45.3599397],[36.6815681,45.4566115],[36.6684499,45.6266206],[36.583205,45.635158],[36.3387005,45.6715002],[36.1353542,45.6476547],[36.1034835,45.638376],[36.0723795,45.6256431],[36.028427,45.6242237],[35.9817734,45.6167329],[35.9534794,45.6280572],[35.9215589,45.6372534],[35.8711492,45.6454011],[35.8366954,45.6469342],[35.8022501,45.6453103],[35.7518847,45.6370298],[35.7200141,45.6277494],[35.6901483,45.6156372],[35.6627986,45.6008987],[35.6384328,45.5837842],[35.6174678,45.5645842],[35.6002625,45.5436256],[35.587111,45.5212652],[35.5764936,45.4903874],[35.5747509,45.4895333],[35.5487365,45.5142538],[35.5242787,45.5313252],[35.4968497,45.5460096],[35.459695,45.5603381],[35.4555162,45.5730522],[35.4443574,45.5959169],[35.4290297,45.6175579],[35.4198817,45.6278035],[35.3869834,45.6557223],[35.3609843,45.6715964],[35.3373014,45.6827713],[35.3237297,45.7127561],[35.3165721,45.7237303],[35.299254,45.7445762],[35.2663557,45.7724368],[35.2334204,45.7917299],[34.9750748,45.7619919],[34.9597746,45.7565682],[34.9411705,45.7658247],[34.876163,45.7904304],[34.7990874,45.8104643],[34.8021689,45.9006479],[34.7540112,45.9088363],[34.6699108,45.9676437],[34.628541,45.9864034],[34.6011392,45.9941699],[34.5816123,45.9956678],[34.5611691,45.9943843],[34.5542176,45.9904652],[34.5448398,45.9790277],[34.5443875,45.9761218],[34.5269998,45.9590021],[34.5109022,45.9480281],[34.4985264,45.9425606],[34.4762212,45.9441393],[34.459176,45.9512094],[34.4430184,45.9618096],[34.4233801,45.9786713],[34.4131796,45.9897359],[34.4107666,45.9992636],[34.4049875,46.0092864],[34.3471695,46.0549489],[34.3326403,46.0598467],[34.320021,46.0682092],[34.2648618,46.0548851],[34.2521968,46.0531749],[34.1843736,46.0668628],[34.1450093,46.0866862],[34.1359107,46.0966617],[34.1218931,46.1057194],[34.0809285,46.117556],[34.0695052,46.1166994],[34.0526389,46.1091293],[33.9982336,46.1264504],[33.971714,46.1411991],[33.9405553,46.1546515],[33.8973358,46.1706248],[33.86133,46.1945116],[33.8486859,46.1996667],[33.811324,46.203796],[33.7968936,46.2030156],[33.7726027,46.1976249],[33.7503231,46.18772],[33.7399776,46.1852474],[33.6995994,46.2028553],[33.6892658,46.2047794],[33.670864,46.2117939],[33.6661371,46.2207141],[33.6467708,46.22958],[33.6152408,46.2262179],[33.6177993,46.215981],[33.6135506,46.2139172],[33.6185932,46.213932],[33.6355706,46.1463365],[33.6412746,46.1424429],[33.6147111,46.1346624],[33.5870932,46.1191796],[33.5721329,46.1025643],[33.5911874,46.0612472],[33.5407189,46.0120312],[32.7727018,45.8266419],[32.7396744,45.8073204],[32.7259238,45.7972779],[32.7026395,45.7764183],[32.6659033,45.7625368],[32.6339252,45.7459969],[32.6054729,45.7265666],[32.5890615,45.7123247],[32.5685226,45.7063996],[32.5336146,45.6930389],[32.5016366,45.6764785],[32.4779329,45.660501],[32.4354921,45.6517736],[32.39936,45.6400966],[32.3822327,45.6329918],[32.3502547,45.6164136],[32.3218024,45.5969383],[32.2974057,45.5749258],[32.2868735,45.5630938],[32.2775192,45.5507836],[32.2643049,45.5283722],[32.2405042,45.5038633],[32.2230173,45.4787954],[32.2105624,45.4522796],[32.2062983,45.4386318],[32.2017961,45.4108733],[32.201579,45.396892]]]}'),(2,'DISPUTED','SEVASTOPOL',0,'{\"type\":\"Polygon\",\"coordinates\":[[[33.3779569,44.5838462],[33.3930152,44.5681987],[33.3996503,44.5643423],[33.4016594,44.5610614],[33.4004612,44.5592715],[33.4071732,44.5565894],[33.4100748,44.5535486],[33.414671,44.5526219],[33.4163465,44.5493377],[33.4274077,44.5457891],[33.4284008,44.543313],[33.4350539,44.5419983],[33.4348217,44.5409146],[33.4497224,44.5320144],[33.4573813,44.5290313],[33.464198,44.5233092],[33.4788113,44.5192613],[33.4788555,44.5174026],[33.4814623,44.5157171],[33.4897719,44.5122984],[33.4927974,44.5125433],[33.4930381,44.5174183],[33.4889039,44.5249823],[33.5078625,44.5311455],[33.5264968,44.5459033],[33.5395687,44.539262],[33.542912,44.5395173],[33.5372403,44.5484954],[33.5389717,44.5502823],[33.5485239,44.554409],[33.5500686,44.5525636],[33.5478351,44.5516093],[33.5487427,44.5497441],[33.5539774,44.5515491],[33.562927,44.5488265],[33.5684734,44.5559147],[33.5608581,44.55859],[33.563492,44.5617802],[33.5728005,44.5610282],[33.5747846,44.5592686],[33.5792988,44.5620965],[33.5702383,44.5724854],[33.578923,44.5730758],[33.5847547,44.5754084],[33.5895307,44.5805367],[33.5923472,44.5877529],[33.5923331,44.5924807],[33.5842788,44.5996505],[33.576377,44.6033141],[33.5738875,44.606603],[33.5673845,44.6074099],[33.5672286,44.6088974],[33.5706902,44.6149581],[33.5828279,44.6132154],[33.5835438,44.6150882],[33.5782058,44.6192201],[33.5859866,44.6374677],[33.5960725,44.6407591],[33.6034952,44.651651],[33.5993199,44.6632008],[33.6103428,44.6726833],[33.5991785,44.6709085],[33.5935735,44.67909],[33.5975627,44.6990734],[33.5945586,44.7071473],[33.5873092,44.7054915],[33.5868975,44.7004837],[33.5518827,44.711301],[33.5560938,44.7201787],[33.5554076,44.7221413],[33.5466985,44.7220158],[33.5474959,44.6897199],[33.5424577,44.6576964],[33.5313548,44.6400224],[33.5168858,44.636586],[33.5105038,44.6309138],[33.5075866,44.6209989],[33.5047582,44.6165579],[33.5013126,44.6151564],[33.5019782,44.6118966],[33.4973069,44.6098852],[33.5001394,44.6082374],[33.5007351,44.603576],[33.4993233,44.6074879],[33.4978317,44.607504],[33.4957525,44.6109471],[33.4981029,44.6121538],[33.4952779,44.6148727],[33.4864865,44.612926],[33.4843169,44.6092739],[33.4812423,44.6085388],[33.4805395,44.6110345],[33.4739853,44.6119977],[33.4730492,44.6057619],[33.4706817,44.6050402],[33.4746431,44.6017974],[33.4707787,44.6005913],[33.4714544,44.5926046],[33.4684703,44.5946123],[33.4680171,44.6001056],[33.4662354,44.6009409],[33.4662572,44.6065902],[33.468789,44.6078146],[33.4681762,44.6119631],[33.4636229,44.6117513],[33.4602628,44.6093012],[33.4571182,44.6105217],[33.4482092,44.6078374],[33.4475432,44.6041441],[33.4498455,44.6016442],[33.4468175,44.5979061],[33.4481208,44.5973543],[33.4476833,44.5948093],[33.4441644,44.5987997],[33.4404307,44.599419],[33.4413997,44.6015135],[33.4400636,44.605054],[33.4339409,44.6038632],[33.4313517,44.5969346],[33.4262966,44.5989669],[33.4198732,44.5924681],[33.4241188,44.5947288],[33.4264939,44.5934479],[33.4248662,44.581237],[33.4314365,44.574999],[33.4359306,44.5745808],[33.4376948,44.572334],[33.4353869,44.571057],[33.4344226,44.5719787],[33.4366416,44.5730618],[33.4356493,44.573903],[33.4267301,44.5733978],[33.428097,44.5756042],[33.419624,44.5838806],[33.4191592,44.5871545],[33.4170871,44.5878755],[33.4168157,44.5928239],[33.4161384,44.587998],[33.4136207,44.5857566],[33.412809,44.5782986],[33.4143867,44.5766282],[33.4119291,44.572169],[33.4136588,44.5699718],[33.4122288,44.564404],[33.4110539,44.5650361],[33.4098393,44.5712544],[33.4107359,44.575972],[33.4094392,44.5779911],[33.4065798,44.5767197],[33.4024217,44.5708259],[33.4043875,44.5825173],[33.4024193,44.5834106],[33.4030967,44.5911368],[33.3984799,44.5914294],[33.395001,44.5875713],[33.383653,44.5863156],[33.3779569,44.5838462]]]}');
/*!40000 ALTER TABLE `b_location_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location_field`
--

DROP TABLE IF EXISTS `b_location_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location_field` (
  `LOCATION_ID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`,`TYPE`),
  KEY `IDX_BLLFL_VAL` (`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location_field`
--

LOCK TABLES `b_location_field` WRITE;
/*!40000 ALTER TABLE `b_location_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_location_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location_hierarchy`
--

DROP TABLE IF EXISTS `b_location_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location_hierarchy` (
  `ANCESTOR_ID` int(11) NOT NULL,
  `DESCENDANT_ID` int(11) NOT NULL,
  `LEVEL` int(11) NOT NULL,
  PRIMARY KEY (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `IX_LOC_LH_D` (`DESCENDANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location_hierarchy`
--

LOCK TABLES `b_location_hierarchy` WRITE;
/*!40000 ALTER TABLE `b_location_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_location_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location_name`
--

DROP TABLE IF EXISTS `b_location_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location_name` (
  `LOCATION_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `NAME` varchar(1000) NOT NULL,
  `NAME_NORMALIZED` varchar(1000) NOT NULL,
  PRIMARY KEY (`LOCATION_ID`,`LANGUAGE_ID`),
  KEY `IX_LOC_LNN` (`NAME_NORMALIZED`(200),`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location_name`
--

LOCK TABLES `b_location_name` WRITE;
/*!40000 ALTER TABLE `b_location_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_location_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_location_source`
--

DROP TABLE IF EXISTS `b_location_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_location_source` (
  `CODE` varchar(15) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `CONFIG` longtext DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_location_source`
--

LOCK TABLES `b_location_source` WRITE;
/*!40000 ALTER TABLE `b_location_source` DISABLE KEYS */;
INSERT INTO `b_location_source` VALUES ('GOOGLE','Google','a:4:{i:0;a:4:{s:4:\"code\";s:16:\"API_KEY_FRONTEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:10;s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"code\";s:15:\"API_KEY_BACKEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:20;s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"code\";s:18:\"SHOW_PHOTOS_ON_MAP\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:30;s:5:\"value\";b:1;}i:3;a:4:{s:4:\"code\";s:21:\"USE_GEOCODING_SERVICE\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:40;s:5:\"value\";b:1;}}'),('OSM','OpenStreetMap','a:3:{i:0;a:5:{s:4:\"code\";s:11:\"SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:1;s:4:\"sort\";i:10;s:5:\"value\";s:30:\"https://osm-ru-002.bitrix.info\";}i:1;a:5:{s:4:\"code\";s:15:\"MAP_SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:1;s:4:\"sort\";i:15;s:5:\"value\";s:30:\"https://osm-ru-001.bitrix.info\";}i:2;a:5:{s:4:\"code\";s:5:\"TOKEN\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:0;s:4:\"sort\";i:20;s:5:\"value\";N;}}');
/*!40000 ALTER TABLE `b_location_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_log_notification`
--

DROP TABLE IF EXISTS `b_log_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_log_notification` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` varchar(1000) DEFAULT NULL,
  `REQUEST_URI` varchar(1000) DEFAULT NULL,
  `CHECK_INTERVAL` int(11) DEFAULT NULL,
  `ALERT_COUNT` int(11) DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_log_notification`
--

LOCK TABLES `b_log_notification` WRITE;
/*!40000 ALTER TABLE `b_log_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_log_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_log_notification_action`
--

DROP TABLE IF EXISTS `b_log_notification_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_log_notification_action` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_ID` int(10) unsigned NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) NOT NULL,
  `RECIPIENT` varchar(50) DEFAULT NULL,
  `ADDITIONAL_TEXT` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_log_notification_action`
--

LOCK TABLES `b_log_notification_action` WRITE;
/*!40000 ALTER TABLE `b_log_notification_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_log_notification_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_main_mail_blacklist`
--

DROP TABLE IF EXISTS `b_main_mail_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_main_mail_blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_main_mail_blacklist`
--

LOCK TABLES `b_main_mail_blacklist` WRITE;
/*!40000 ALTER TABLE `b_main_mail_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_main_mail_sender`
--

DROP TABLE IF EXISTS `b_main_mail_sender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_main_mail_sender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL DEFAULT '',
  `EMAIL` varchar(255) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL DEFAULT 0,
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT 0,
  `OPTIONS` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_main_mail_sender`
--

LOCK TABLES `b_main_mail_sender` WRITE;
/*!40000 ALTER TABLE `b_main_mail_sender` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_sender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_main_mail_sender_send_counter`
--

DROP TABLE IF EXISTS `b_main_mail_sender_send_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_main_mail_sender_send_counter` (
  `DATE_STAT` date NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `CNT` int(11) NOT NULL,
  PRIMARY KEY (`DATE_STAT`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_main_mail_sender_send_counter`
--

LOCK TABLES `b_main_mail_sender_send_counter` WRITE;
/*!40000 ALTER TABLE `b_main_mail_sender_send_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_sender_send_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_collection`
--

DROP TABLE IF EXISTS `b_medialib_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_collection`
--

LOCK TABLES `b_medialib_collection` WRITE;
/*!40000 ALTER TABLE `b_medialib_collection` DISABLE KEYS */;
INSERT INTO `b_medialib_collection` VALUES (1,'Коллекция','','Y','2024-02-09 09:25:15',1,0,NULL,'',NULL,1);
/*!40000 ALTER TABLE `b_medialib_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_collection_item`
--

DROP TABLE IF EXISTS `b_medialib_collection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_collection_item`
--

LOCK TABLES `b_medialib_collection_item` WRITE;
/*!40000 ALTER TABLE `b_medialib_collection_item` DISABLE KEYS */;
INSERT INTO `b_medialib_collection_item` VALUES (1,1);
/*!40000 ALTER TABLE `b_medialib_collection_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_item`
--

DROP TABLE IF EXISTS `b_medialib_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `ITEM_TYPE` char(30) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `SEARCHABLE_CONTENT` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_item`
--

LOCK TABLES `b_medialib_item` WRITE;
/*!40000 ALTER TABLE `b_medialib_item` DISABLE KEYS */;
INSERT INTO `b_medialib_item` VALUES (1,'paint1.jpg','','','2024-02-09 09:26:16','2024-02-09 09:26:16',55,'','{PAINT1}{JPG}');
/*!40000 ALTER TABLE `b_medialib_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_medialib_type`
--

DROP TABLE IF EXISTS `b_medialib_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) NOT NULL,
  `EXT` varchar(255) NOT NULL,
  `SYSTEM` char(1) NOT NULL DEFAULT 'N',
  `DESCRIPTION` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_medialib_type`
--

LOCK TABLES `b_medialib_type` WRITE;
/*!40000 ALTER TABLE `b_medialib_type` DISABLE KEYS */;
INSERT INTO `b_medialib_type` VALUES (1,'image_name','image','jpg,jpeg,gif,png','Y','image_desc'),(2,'video_name','video','flv,mp4,wmv','Y','video_desc'),(3,'sound_name','sound','mp3,wma,aac','Y','sound_desc');
/*!40000 ALTER TABLE `b_medialib_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_messageservice_incoming_message`
--

DROP TABLE IF EXISTS `b_messageservice_incoming_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_messageservice_incoming_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REQUEST_BODY` longtext DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SENDER_ID` varchar(50) NOT NULL,
  `EXTERNAL_ID` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_MS_INCOMING_MESSAGE_1` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_messageservice_incoming_message`
--

LOCK TABLES `b_messageservice_incoming_message` WRITE;
/*!40000 ALTER TABLE `b_messageservice_incoming_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_incoming_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_messageservice_message`
--

DROP TABLE IF EXISTS `b_messageservice_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_messageservice_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) NOT NULL,
  `SENDER_ID` varchar(50) NOT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT 0,
  `MESSAGE_FROM` varchar(260) DEFAULT NULL,
  `MESSAGE_TO` varchar(50) NOT NULL,
  `MESSAGE_HEADERS` longtext DEFAULT NULL,
  `MESSAGE_BODY` longtext NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `EXTERNAL_ID` varchar(128) DEFAULT NULL,
  `EXTERNAL_STATUS` varchar(128) DEFAULT NULL,
  `CLUSTER_GROUP` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`,`CLUSTER_GROUP`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_messageservice_message`
--

LOCK TABLES `b_messageservice_message` WRITE;
/*!40000 ALTER TABLE `b_messageservice_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_messageservice_rest_app`
--

DROP TABLE IF EXISTS `b_messageservice_rest_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_messageservice_rest_app` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `HANDLER` varchar(1000) NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_messageservice_rest_app`
--

LOCK TABLES `b_messageservice_rest_app` WRITE;
/*!40000 ALTER TABLE `b_messageservice_rest_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_rest_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_messageservice_rest_app_lang`
--

DROP TABLE IF EXISTS `b_messageservice_rest_app_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_messageservice_rest_app_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `NAME` varchar(500) DEFAULT NULL,
  `APP_NAME` varchar(500) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_messageservice_rest_app_lang`
--

LOCK TABLES `b_messageservice_rest_app_lang` WRITE;
/*!40000 ALTER TABLE `b_messageservice_rest_app_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_rest_app_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_mobileapp_app`
--

DROP TABLE IF EXISTS `b_mobileapp_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_mobileapp_app` (
  `CODE` varchar(50) NOT NULL,
  `SHORT_NAME` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` text NOT NULL,
  `FILES` text NOT NULL,
  `LAUNCH_ICONS` text NOT NULL,
  `LAUNCH_SCREENS` text NOT NULL,
  `FOLDER` varchar(50) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_mobileapp_app`
--

LOCK TABLES `b_mobileapp_app` WRITE;
/*!40000 ALTER TABLE `b_mobileapp_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_mobileapp_config`
--

DROP TABLE IF EXISTS `b_mobileapp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_mobileapp_config` (
  `APP_CODE` varchar(150) NOT NULL,
  `PLATFORM` varchar(150) NOT NULL,
  `PARAMS` text NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_mobileapp_config`
--

LOCK TABLES `b_mobileapp_config` WRITE;
/*!40000 ALTER TABLE `b_mobileapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module`
--

DROP TABLE IF EXISTS `b_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module` (
  `ID` varchar(50) NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module`
--

LOCK TABLES `b_module` WRITE;
/*!40000 ALTER TABLE `b_module` DISABLE KEYS */;
INSERT INTO `b_module` VALUES ('b24connector','2024-02-07 11:14:42'),('bitrix.sitecorporate','2024-02-07 11:14:42'),('bitrix.siteinfoportal','2024-02-07 11:14:43'),('bitrix.sitepersonal','2024-02-07 11:14:43'),('bitrixcloud','2024-02-07 11:14:43'),('blog','2024-02-07 11:14:43'),('clouds','2024-02-07 11:14:44'),('fileman','2024-02-07 11:14:44'),('form','2024-02-07 11:14:45'),('forum','2024-02-07 11:14:45'),('highloadblock','2024-02-07 11:14:46'),('iblock','2024-02-07 11:14:46'),('landing','2024-02-07 11:14:48'),('location','2024-02-07 11:14:50'),('ls.codegeneratorfree','2024-02-28 08:14:03'),('main','2024-02-07 11:14:39'),('messageservice','2024-02-07 11:14:51'),('mobileapp','2024-02-07 11:14:51'),('perfmon','2024-02-07 11:14:51'),('photogallery','2024-02-07 11:14:51'),('rest','2024-02-07 11:14:52'),('scale','2024-02-07 11:14:52'),('search','2024-02-07 11:14:52'),('security','2024-02-07 11:14:53'),('seo','2024-02-07 11:14:53'),('socialservices','2024-02-07 11:14:53'),('subscribe','2024-02-07 11:14:54'),('translate','2024-02-07 11:14:54'),('ui','2024-02-07 11:14:55'),('vote','2024-02-07 11:14:56');
/*!40000 ALTER TABLE `b_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module_group`
--

DROP TABLE IF EXISTS `b_module_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module_group`
--

LOCK TABLES `b_module_group` WRITE;
/*!40000 ALTER TABLE `b_module_group` DISABLE KEYS */;
INSERT INTO `b_module_group` VALUES (1,'main',5,'Q',NULL),(2,'fileman',5,'F',NULL);
/*!40000 ALTER TABLE `b_module_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_module_to_module`
--

DROP TABLE IF EXISTS `b_module_to_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SORT` int(11) NOT NULL DEFAULT 100,
  `FROM_MODULE_ID` varchar(50) NOT NULL,
  `MESSAGE_ID` varchar(255) NOT NULL,
  `TO_MODULE_ID` varchar(50) NOT NULL,
  `TO_PATH` varchar(255) DEFAULT NULL,
  `TO_CLASS` varchar(255) DEFAULT NULL,
  `TO_METHOD` varchar(255) DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `UNIQUE_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_module_to_module`
--

LOCK TABLES `b_module_to_module` WRITE;
/*!40000 ALTER TABLE `b_module_to_module` DISABLE KEYS */;
INSERT INTO `b_module_to_module` VALUES (1,'2024-02-07 11:14:39',100,'iblock','OnIBlockPropertyBuildList','main','/modules/main/tools/prop_userid.php','CIBlockPropertyUserID','GetUserTypeDescription','',1,'2b30c309bf87645959b9bfbed51b49c6'),(2,'2024-02-07 11:14:39',100,'main','OnUserDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnUserDelete','',1,'f437e170e4daf957766b0b0579f08fb4'),(3,'2024-02-07 11:14:39',100,'main','OnLanguageDelete','main','/modules/main/classes/mysql/favorites.php','CFavorites','OnLanguageDelete','',1,'9211999c5cfc3a4d374e4f957d5079f6'),(4,'2024-02-07 11:14:39',100,'main','OnUserDelete','main','','CUserOptions','OnUserDelete','',1,'9ef4e969f975b6425c7113444d210a90'),(5,'2024-02-07 11:14:39',100,'main','OnChangeFile','main','','CMain','OnChangeFileComponent','',1,'332179402f77c4d41c6c2e524acde4d0'),(6,'2024-02-07 11:14:39',100,'main','OnUserTypeRightsCheck','main','','CUser','UserTypeRightsCheck','',1,'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),(7,'2024-02-07 11:14:39',100,'main','OnUserLogin','main','','UpdateTools','CheckUpdates','',1,'a2986b9f6e9a99c0351c2ba858dafc85'),(8,'2024-02-07 11:14:39',100,'main','OnModuleUpdate','main','','UpdateTools','SetUpdateResult','',1,'f9b70c6a75b6341063b23bde5d32e582'),(9,'2024-02-07 11:14:39',100,'main','OnUpdateCheck','main','','UpdateTools','SetUpdateError','',1,'a0aecef95a192ec3dd134f71f0f4f175'),(10,'2024-02-07 11:14:39',100,'main','OnPanelCreate','main','','CUndo','CheckNotifyMessage','',1,'6476f96ffba6ab2b4a7dbe644f42edf6'),(11,'2024-02-07 11:14:39',100,'main','OnAfterAddRating','main','','CRatingsComponentsMain','OnAfterAddRating','',1,'6122bee2ad083f8f72e35655cee48859'),(12,'2024-02-07 11:14:39',100,'main','OnAfterUpdateRating','main','','CRatingsComponentsMain','OnAfterUpdateRating','',1,'f8f806e33dc35737bdbe6b9bc42626a4'),(13,'2024-02-07 11:14:39',100,'main','OnSetRatingsConfigs','main','','CRatingsComponentsMain','OnSetRatingConfigs','',1,'9244ca7fd6964757ca191c9407cb1218'),(14,'2024-02-07 11:14:39',100,'main','OnGetRatingsConfigs','main','','CRatingsComponentsMain','OnGetRatingConfigs','',1,'d8ae8e1f8889b1fbb6af276fb14c8411'),(15,'2024-02-07 11:14:39',100,'main','OnGetRatingsObjects','main','','CRatingsComponentsMain','OnGetRatingObject','',1,'129315715250c195ee115002b445a156'),(16,'2024-02-07 11:14:39',100,'main','OnGetRatingContentOwner','main','','CRatingsComponentsMain','OnGetRatingContentOwner','',1,'bf1f5deaa1532fe9a28acd6d19d23a80'),(17,'2024-02-07 11:14:39',100,'main','OnAfterAddRatingRule','main','','CRatingRulesMain','OnAfterAddRatingRule','',1,'298e763431f7f7d6c3af9798663f410d'),(18,'2024-02-07 11:14:39',100,'main','OnAfterUpdateRatingRule','main','','CRatingRulesMain','OnAfterUpdateRatingRule','',1,'4ecdc4a15e24c49f0fa8f44064bf1511'),(19,'2024-02-07 11:14:39',100,'main','OnGetRatingRuleObjects','main','','CRatingRulesMain','OnGetRatingRuleObjects','',1,'6ac10928b76183004ba0e88ace0a1b5b'),(20,'2024-02-07 11:14:39',100,'main','OnGetRatingRuleConfigs','main','','CRatingRulesMain','OnGetRatingRuleConfigs','',1,'06769c4f6bbba4fad79c1619a874ee97'),(21,'2024-02-07 11:14:39',100,'main','OnAfterUserAdd','main','','CRatings','OnAfterUserRegister','',1,'ecb9ae0476db69da6c95b06bcb3aebbb'),(22,'2024-02-07 11:14:39',100,'main','OnUserDelete','main','','CRatings','OnUserDelete','',1,'9fe6984fd29b7ab9508ac02c23690094'),(23,'2024-02-07 11:14:39',100,'main','OnAfterGroupAdd','main','','CGroupAuthProvider','OnAfterGroupAdd','',1,'02f2fe70b9068a6b307192321fe74430'),(24,'2024-02-07 11:14:39',100,'main','OnBeforeGroupUpdate','main','','CGroupAuthProvider','OnBeforeGroupUpdate','',1,'ef0f2e4d0ae7bbf59d0798e8078143f9'),(25,'2024-02-07 11:14:39',100,'main','OnBeforeGroupDelete','main','','CGroupAuthProvider','OnBeforeGroupDelete','',1,'d3ec9527c0e77709402a05ae4249afca'),(26,'2024-02-07 11:14:39',100,'main','OnAfterSetUserGroup','main','','CGroupAuthProvider','OnAfterSetUserGroup','',1,'0de6c5b48e9382f6e857d79f76d95f25'),(27,'2024-02-07 11:14:39',100,'main','OnEventLogGetAuditTypes','main','','CEventMain','GetAuditTypes','',1,'ac0b8b7a5e703131a3bd41b4399bc032'),(28,'2024-02-07 11:14:39',100,'main','OnEventLogGetAuditHandlers','main','','CEventMain','MakeMainObject','',1,'1ddb38ccf35a8a9da5d3b2bc80591ad6'),(29,'2024-02-07 11:14:39',100,'perfmon','OnGetTableSchema','main','','CTableSchema','OnGetTableSchema','',1,'c1f65f88d449e8b8a3b7af9d54ef3f50'),(30,'2024-02-07 11:14:39',100,'sender','OnConnectorList','main','','\\Bitrix\\Main\\SenderEventHandler','onConnectorListUser','',1,'8af99568465a1ccdb6a84e868cf5aad8'),(31,'2024-02-07 11:14:39',110,'main','OnUserTypeBuildList','main','','CUserTypeString','GetUserTypeDescription','',1,'09f8200652932044934bd3c522e920c5'),(32,'2024-02-07 11:14:39',120,'main','OnUserTypeBuildList','main','','CUserTypeInteger','GetUserTypeDescription','',1,'71ef247b3eb3b07e4bd6940791b89497'),(33,'2024-02-07 11:14:39',130,'main','OnUserTypeBuildList','main','','CUserTypeDouble','GetUserTypeDescription','',1,'4fe2008255fe567423cc0c2f080ca741'),(34,'2024-02-07 11:14:39',140,'main','OnUserTypeBuildList','main','','CUserTypeDateTime','GetUserTypeDescription','',1,'686c0679e60bee52dbcc27f5502277b6'),(35,'2024-02-07 11:14:39',145,'main','OnUserTypeBuildList','main','','CUserTypeDate','GetUserTypeDescription','',1,'7e19b5fc5fc48b1cd317a6ac44d84236'),(36,'2024-02-07 11:14:39',150,'main','OnUserTypeBuildList','main','','CUserTypeBoolean','GetUserTypeDescription','',1,'4d5e1dd2369089f2db9480549241205f'),(37,'2024-02-07 11:14:39',155,'main','OnUserTypeBuildList','main','','CUserTypeUrl','GetUserTypeDescription','',1,'79fcd650625b296abf13216cd5af2428'),(38,'2024-02-07 11:14:39',160,'main','OnUserTypeBuildList','main','','CUserTypeFile','GetUserTypeDescription','',1,'67b9a4fbc45240a7887b73e3a246eba0'),(39,'2024-02-07 11:14:39',170,'main','OnUserTypeBuildList','main','','CUserTypeEnum','GetUserTypeDescription','',1,'fbebdb289fe38c1fbfeda4d3d8ee43ef'),(40,'2024-02-07 11:14:39',180,'main','OnUserTypeBuildList','main','','CUserTypeIBlockSection','GetUserTypeDescription','',1,'2065f8305645790970bac0b99f127f47'),(41,'2024-02-07 11:14:39',190,'main','OnUserTypeBuildList','main','','CUserTypeIBlockElement','GetUserTypeDescription','',1,'65bda5818e3545f1683a3ff5271cc891'),(42,'2024-02-07 11:14:39',200,'main','OnUserTypeBuildList','main','','CUserTypeStringFormatted','GetUserTypeDescription','',1,'47e3cf1c280e01dbaed43f9989a6747b'),(43,'2024-02-07 11:14:39',210,'main','OnUserTypeBuildList','main','','\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType','getUserTypeDescription','',1,'719d15ee5f60f6348d2bd6a8911aeed1'),(44,'2024-02-07 11:14:39',100,'main','OnBeforeEndBufferContent','main','','\\Bitrix\\Main\\Analytics\\Counter','onBeforeEndBufferContent','',1,'ff5eb984fe6ce3e8d769bf3ba646b902'),(45,'2024-02-07 11:14:39',100,'main','OnBeforeRestartBuffer','main','','\\Bitrix\\Main\\Analytics\\Counter','onBeforeRestartBuffer','',1,'0782f5a6df6dd52d834caea88c3ba3a7'),(46,'2024-02-07 11:14:39',100,'main','OnFileDelete','main','','\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable','onFileDelete','',1,'54c80cd94412db221338aeb59902f059'),(47,'2024-02-07 11:14:39',100,'socialnetwork','OnSocNetLogDelete','main','','CUserCounter','OnSocNetLogDelete','',1,'33e603755a0bc07abd51a1f8ed52966e'),(48,'2024-02-07 11:14:39',100,'socialnetwork','OnSocNetLogCommentDelete','main','','CUserCounter','OnSocNetLogCommentDelete','',1,'51ee2214895be904a880046f43e84138'),(49,'2024-02-07 11:14:39',100,'main','OnAdminInformerInsertItems','main','','CMpNotifications','OnAdminInformerInsertItemsHandlerMP','',1,'c89c0e94ac1110c334a24c70e1773daa'),(50,'2024-02-07 11:14:39',100,'rest','OnRestServiceBuildDescription','main','','\\Bitrix\\Main\\Rest\\Handlers','onRestServiceBuildDescription','',1,'c0b0c358a21b648d4f9c5d29d17a5ab2'),(51,'2024-02-07 11:14:39',100,'main','OnBeforeUserTypeAdd','main','','\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper','OnBeforeUserTypeAdd','',1,'e204684efc0764af9431ca94b950619a'),(52,'2024-02-07 11:14:39',100,'main','OnAfterUserTypeAdd','main','','\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper','onAfterUserTypeAdd','',1,'50932fb244caf7af686fac906caf3e73'),(53,'2024-02-07 11:14:39',100,'main','OnBeforeUserTypeDelete','main','','\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper','OnBeforeUserTypeDelete','',1,'d22a86deba0ff4bd031d022e331033b4'),(54,'2024-02-07 11:14:39',100,'main','OnAuthProvidersBuildList','main','','\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider','getProviders','',1,'3a2839dac113bf47bce01812903e768a'),(55,'2024-02-07 11:14:39',100,'iblock','OnBeforeIBlockSectionUpdate','main','','\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler','onBeforeIBlockSectionUpdate','',1,'dde505dba68c59bd4661b7680c329485'),(56,'2024-02-07 11:14:39',100,'iblock','OnBeforeIBlockSectionAdd','main','','\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler','onBeforeIBlockSectionAdd','',1,'d3a665b1890dabbba32ff01e3e46ec57'),(57,'2024-02-07 11:14:39',100,'iblock','OnBeforeIBlockSectionDelete','main','','\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler','onBeforeIBlockSectionDelete','',1,'157add4b02621a60fabf1369c3e7ea9b'),(58,'2024-02-07 11:14:39',100,'sale','OnSaleBasketItemSaved','main','','\\Bitrix\\Main\\Analytics\\Catalog','catchCatalogBasket','',2,'fa4fc3924ff2585e92f8bdabaf287864'),(59,'2024-02-07 11:14:39',100,'sale','OnSaleOrderSaved','main','','\\Bitrix\\Main\\Analytics\\Catalog','catchCatalogOrder','',2,'6b358bb17b30da91b105fb1451ed9aaa'),(60,'2024-02-07 11:14:39',100,'sale','OnSaleOrderPaid','main','','\\Bitrix\\Main\\Analytics\\Catalog','catchCatalogOrderPayment','',2,'8f5ca6e1c5136cb4bbf30474f0ff4183'),(61,'2024-02-07 11:14:39',1000,'sale','onBuildDiscountConditionInterfaceControls','main','','\\Bitrix\\Main\\Discount\\UserConditionControl','onBuildDiscountConditionInterfaceControls','',1,'9f0d91c081704e52b52f540b3acaf52e'),(62,'2024-02-07 11:14:39',100,'main','OnBeforePhpMail','main','','\\Bitrix\\Main\\Mail\\Sender','applyCustomSmtp','',2,'10fbf5b8dec05a02d8d7010e594f16ec'),(63,'2024-02-07 11:14:39',100,'main','OnBuildFilterFactoryMethods','main','','\\Bitrix\\Main\\Filter\\FactoryMain','onBuildFilterFactoryMethods','',2,'19f10c2686a955bd8b8116ea1f1ad829'),(64,'2024-02-07 11:14:39',100,'main','onGetUserFieldValues','main','','\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper','onGetUserFieldValues','',2,'7f9a5e25d638a6bff29f0bf4666da1a9'),(65,'2024-02-07 11:14:39',100,'main','onUpdateUserFieldValues','main','','\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper','onUpdateUserFieldValues','',2,'d78761f994d74258421d271810f03ebf'),(66,'2024-02-07 11:14:39',100,'main','onDeleteUserFieldValues','main','','\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper','onDeleteUserFieldValues','',2,'074b2e25238a00ffc809ad12b609db2c'),(67,'2024-02-07 11:14:39',100,'main','OnAfterUserTypeAdd','main','','\\Bitrix\\Main\\ORM\\Entity','onUserTypeChange','',2,'37b1b1538fa6a6c5f41c9ce4afbf2789'),(68,'2024-02-07 11:14:39',100,'main','OnAfterUserTypeUpdate','main','','\\Bitrix\\Main\\ORM\\Entity','onUserTypeChange','',2,'6a53bbd6e85686f4aa8a69d3d75f7e37'),(69,'2024-02-07 11:14:39',100,'main','OnAfterUserTypeDelete','main','','\\Bitrix\\Main\\ORM\\Entity','onUserTypeChange','',2,'010cc1e3107418a1fd9f9a4cde7d93b9'),(70,'2024-02-07 11:14:42',100,'main','OnBuildGlobalMenu','b24connector','','\\Bitrix\\B24Connector\\Helper','onBuildGlobalMenu','',1,'9c4452a442bacc2d4d70635962485be1'),(71,'2024-02-07 11:14:42',100,'main','OnBeforeProlog','b24connector','','\\Bitrix\\B24Connector\\Helper','onBeforeProlog','',1,'641053ff6ee8ff57518d7c30724530e5'),(72,'2024-02-07 11:14:42',100,'main','OnBeforeProlog','bitrix.sitecorporate','','CSiteCorporate','ShowPanel','',1,'bc7c322534797a9ed3493c40e1b8fdac'),(73,'2024-02-07 11:14:43',100,'main','OnBeforeProlog','bitrix.siteinfoportal','','CSiteInfoportal','ShowPanel','',1,'7ffb3da30f1bec7fe0c7456a8ec3b8d7'),(74,'2024-02-07 11:14:43',100,'main','OnBeforeProlog','bitrix.sitepersonal','','CSitePersonal','ShowPanel','',1,'5a8bf3ea4b17f8d011b8f398c05ac89b'),(75,'2024-02-07 11:14:43',100,'main','OnAdminInformerInsertItems','bitrixcloud','','CBitrixCloudBackup','OnAdminInformerInsertItems','',1,'5499039afdd0fdb38d4b245c8b886dcb'),(76,'2024-02-07 11:14:43',100,'mobileapp','OnBeforeAdminMobileMenuBuild','bitrixcloud','','CBitrixCloudMobile','OnBeforeAdminMobileMenuBuild','',1,'5828a8cdb2cc45e2724ef1c76139df88'),(77,'2024-02-07 11:14:43',100,'search','OnReindex','blog','','CBlogSearch','OnSearchReindex','',1,'6c23ebfcdfc99d14541ad083b0ee7430'),(78,'2024-02-07 11:14:43',100,'main','OnUserDelete','blog','','\\Bitrix\\Blog\\BlogUser','onUserDelete','',1,'470dc0caadb6eee3cf6bd32a89d2aa38'),(79,'2024-02-07 11:14:43',100,'main','OnSiteDelete','blog','','CBlogSitePath','DeleteBySiteID','',1,'33b1b3449b56990b745b251f3976521d'),(80,'2024-02-07 11:14:43',100,'socialnetwork','OnSocNetGroupDelete','blog','','CBlogSoNetPost','OnGroupDelete','',1,'4fa06723b7108652d8f6846f17c4bfda'),(81,'2024-02-07 11:14:43',100,'socialnetwork','OnSocNetFeaturesAdd','blog','','CBlogSearch','SetSoNetFeatureIndexSearch','',1,'5e642b195637a47eda278a2f769d72ae'),(82,'2024-02-07 11:14:43',100,'socialnetwork','OnSocNetFeaturesUpdate','blog','','CBlogSearch','SetSoNetFeatureIndexSearch','',1,'94116bd773c35830e32cabd264e1deac'),(83,'2024-02-07 11:14:43',100,'socialnetwork','OnBeforeSocNetFeaturesPermsAdd','blog','','CBlogSearch','OnBeforeSocNetFeaturesPermsAdd','',1,'ef99702762ccf8958b3bd05a0bc2bd21'),(84,'2024-02-07 11:14:43',100,'socialnetwork','OnSocNetFeaturesPermsAdd','blog','','CBlogSearch','SetSoNetFeaturePermIndexSearch','',1,'7e78a43487928787ac0665eb1eade0d5'),(85,'2024-02-07 11:14:43',100,'socialnetwork','OnBeforeSocNetFeaturesPermsUpdate','blog','','CBlogSearch','OnBeforeSocNetFeaturesPermsUpdate','',1,'13116dc44040b680c93a2b7f60ff2845'),(86,'2024-02-07 11:14:43',100,'socialnetwork','OnSocNetFeaturesPermsUpdate','blog','','CBlogSearch','SetSoNetFeaturePermIndexSearch','',1,'06ae1cde11216c73393f8720c0f31ea9'),(87,'2024-02-07 11:14:43',200,'main','OnAfterAddRating','blog','','CRatingsComponentsBlog','OnAfterAddRating','',1,'6dd70a97fa5c2f15e619721007813bd0'),(88,'2024-02-07 11:14:43',200,'main','OnAfterUpdateRating','blog','','CRatingsComponentsBlog','OnAfterUpdateRating','',1,'a2f4b906bc5e1e984c28ef37728d7007'),(89,'2024-02-07 11:14:43',200,'main','OnSetRatingsConfigs','blog','','CRatingsComponentsBlog','OnSetRatingConfigs','',1,'4461c77de3ca9dec12cd66c9554555a0'),(90,'2024-02-07 11:14:43',200,'main','OnGetRatingsConfigs','blog','','CRatingsComponentsBlog','OnGetRatingConfigs','',1,'6708964800c60ed28bb3ac095494d0f8'),(91,'2024-02-07 11:14:43',200,'main','OnGetRatingsObjects','blog','','CRatingsComponentsBlog','OnGetRatingObject','',1,'29df09132203259924e883921fed0971'),(92,'2024-02-07 11:14:43',200,'main','OnGetRatingContentOwner','blog','','CRatingsComponentsBlog','OnGetRatingContentOwner','',1,'a47b921e59710bdca16e2284d11e8aa0'),(93,'2024-02-07 11:14:43',100,'im','OnGetNotifySchema','blog','','CBlogNotifySchema','OnGetNotifySchema','',1,'cd6910b2ee2dd66f257a68a6406b9f79'),(94,'2024-02-07 11:14:43',100,'im','OnAnswerNotify','blog','','CBlogNotifySchema','CBlogEventsIMCallback','',1,'890d3be770eab6025cc54e120d3b51f5'),(95,'2024-02-07 11:14:43',100,'main','OnAfterRegisterModule','main','/modules/blog/install/index.php','blog','installUserFields','',1,'bfd07861166a9d51c1d21d18b291a1dc'),(96,'2024-02-07 11:14:43',100,'conversion','OnGetCounterTypes','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onGetCounterTypes','',1,'e5df84e19828b3b95901e7b2a5d55cb1'),(97,'2024-02-07 11:14:43',100,'conversion','OnGetRateTypes','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onGetRateTypes','',1,'75028a7a2551f7c677c09c367ed1a54c'),(98,'2024-02-07 11:14:43',100,'blog','OnPostAdd','blog','','\\Bitrix\\Blog\\Internals\\ConversionHandlers','onPostAdd','',1,'a3b637f0c0945089c95d5c08e1166938'),(99,'2024-02-07 11:14:43',100,'mail','onReplyReceivedBLOG_POST','blog','','\\Bitrix\\Blog\\Internals\\MailHandler','handleReplyReceivedBlogPost','',2,'5e3d8ad3f14c5b994981074e43a02cd7'),(100,'2024-02-07 11:14:43',100,'mail','onForwardReceivedBLOG_POST','blog','','\\Bitrix\\Blog\\Internals\\MailHandler','handleForwardReceivedBlogPost','',2,'6002badd4ffa13790a43d45c5c29fca3'),(101,'2024-02-07 11:14:43',100,'socialnetwork','onLogIndexGetContent','blog','','\\Bitrix\\Blog\\Integration\\Socialnetwork\\Log','onIndexGetContent','',2,'3fba13b74a731f896448388c082c24a4'),(102,'2024-02-07 11:14:43',100,'socialnetwork','onLogCommentIndexGetContent','blog','','\\Bitrix\\Blog\\Integration\\Socialnetwork\\LogComment','onIndexGetContent','',2,'57ce8e76c004b1447554d8ec64c48783'),(103,'2024-02-07 11:14:43',100,'socialnetwork','onContentViewed','blog','','\\Bitrix\\Blog\\Integration\\Socialnetwork\\ContentViewHandler','onContentViewed','',2,'d33a4b2ae579a2c9b5ddcea17bc62806'),(104,'2024-02-07 11:14:44',100,'main','OnEventLogGetAuditTypes','clouds','','CCloudStorage','GetAuditTypes','',1,'da69722ba95497cf263381b46e24df40'),(105,'2024-02-07 11:14:44',90,'main','OnBeforeProlog','clouds','','CCloudStorage','OnBeforeProlog','',1,'f8c39ff182ad873715f10a7091f928a4'),(106,'2024-02-07 11:14:44',100,'main','OnAdminListDisplay','clouds','','CCloudStorage','OnAdminListDisplay','',1,'8ddf4f578e7229a63cba4d2124c7643c'),(107,'2024-02-07 11:14:44',100,'main','OnBuildGlobalMenu','clouds','','CCloudStorage','OnBuildGlobalMenu','',1,'d6d308843a6521ad50bfa230a2fcef8f'),(108,'2024-02-07 11:14:44',100,'main','OnFileSave','clouds','','CCloudStorage','OnFileSave','',1,'1e4f94a842d6166359ed1789a6f21245'),(109,'2024-02-07 11:14:44',100,'main','OnAfterFileSave','clouds','','CCloudStorage','OnAfterFileSave','',1,'c36bae07a3080f9b5bc5d422ec96933f'),(110,'2024-02-07 11:14:44',100,'main','OnGetFileSRC','clouds','','CCloudStorage','OnGetFileSRC','',1,'7ec03b3b7ad3f2f54c1e438a1172e5a8'),(111,'2024-02-07 11:14:44',100,'main','OnFileCopy','clouds','','CCloudStorage','OnFileCopy','',1,'6880b56c76f7d3c5d09f887fca6341ca'),(112,'2024-02-07 11:14:44',100,'main','OnPhysicalFileDelete','clouds','','CCloudStorage','OnFileDelete','',1,'3151c487c747a57d7817f68e97fd1c94'),(113,'2024-02-07 11:14:44',100,'main','OnMakeFileArray','clouds','','CCloudStorage','OnMakeFileArray','',1,'713ea8a7a25764b1af60f7a1ec3032d5'),(114,'2024-02-07 11:14:44',100,'main','OnBeforeResizeImage','clouds','','CCloudStorage','OnBeforeResizeImage','',1,'705cd310c52f9c7e8e0c8a0578a22667'),(115,'2024-02-07 11:14:44',100,'main','OnAfterResizeImage','clouds','','CCloudStorage','OnAfterResizeImage','',1,'a403ad2328227153475df0c478a465cc'),(116,'2024-02-07 11:14:44',100,'main','OnAfterFileDeleteDuplicate','clouds','','CCloudStorage','OnAfterFileDeleteDuplicate','',1,'c5f3eb3991b50d4f80c2ccbdc94f8656'),(117,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_AmazonS3','GetObjectInstance','',1,'a4eb7ed1f50b5931474c565f448a4069'),(118,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_GoogleStorage','GetObjectInstance','',1,'1e559e2225608e8d40eeede5b7526f2a'),(119,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_OpenStackStorage','GetObjectInstance','',1,'5ad09feff5dab28ab571ad034ccdf2ea'),(120,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_RackSpaceCloudFiles','GetObjectInstance','',1,'cc976773610cf809bb56871ac7dd9f01'),(121,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_ClodoRU','GetObjectInstance','',1,'faadad31436e94c420ed787e4424714b'),(122,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_Selectel','GetObjectInstance','',1,'5e63a8eebed42bd099b4a9ef62e8d52b'),(123,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_HotBox','GetObjectInstance','',1,'1913169adcd6d6f3b7fb5f3b70ba1fd8'),(124,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_Yandex','GetObjectInstance','',1,'12bd1d4f0d145d5b1681955612fe61c8'),(125,'2024-02-07 11:14:44',100,'clouds','OnGetStorageService','clouds','','CCloudStorageService_S3','GetObjectInstance','',1,'4af3f0ba1f50ed9be6efcdb55dfbee4e'),(126,'2024-02-07 11:14:44',100,'perfmon','OnGetTableSchema','clouds','','clouds','OnGetTableSchema','',1,'d31a1f80f07441976eb1711db4902a71'),(127,'2024-02-07 11:14:44',100,'main','OnGroupDelete','fileman','','CFileman','OnGroupDelete','',1,'d10f791d422ba0e7551ab267db50404c'),(128,'2024-02-07 11:14:44',100,'main','OnPanelCreate','fileman','','CFileman','OnPanelCreate','',1,'b00a6174fb1763684c299ccf5e054c65'),(129,'2024-02-07 11:14:44',100,'main','OnModuleUpdate','fileman','','CFileman','OnModuleUpdate','',1,'58ae853e2b7c230b5cdb51129efd8a05'),(130,'2024-02-07 11:14:44',100,'main','OnModuleInstalled','fileman','','CFileman','ClearComponentsListCache','',1,'7bdbd354eab11f376fa257a998587277'),(131,'2024-02-07 11:14:44',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapGoogle','GetUserTypeDescription','',1,'d9d06fd05f80b33379359ebd8e36e655'),(132,'2024-02-07 11:14:44',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyMapYandex','GetUserTypeDescription','',1,'20ca1d02998884b5abec68b32fdb561d'),(133,'2024-02-07 11:14:44',100,'iblock','OnIBlockPropertyBuildList','fileman','','CIBlockPropertyVideo','GetUserTypeDescription','',1,'991c32062e05844708a5cf7aba37bf9a'),(134,'2024-02-07 11:14:44',100,'main','OnUserTypeBuildList','fileman','','CUserTypeVideo','GetUserTypeDescription','',1,'41bc5efb49ebf8d165acd4e4d556f60c'),(135,'2024-02-07 11:14:44',100,'main','OnEventLogGetAuditTypes','fileman','','CEventFileman','GetAuditTypes','',1,'e0a610651ffec1fbddb2f261223fb2e9'),(136,'2024-02-07 11:14:44',100,'main','OnEventLogGetAuditHandlers','fileman','','CEventFileman','MakeFilemanObject','',1,'fbfef1ef99530f6eae191da293f9566c'),(137,'2024-02-07 11:14:44',154,'main','OnUserTypeBuildList','fileman','','\\Bitrix\\Fileman\\UserField\\Address','getUserTypeDescription','',1,'f0583a376e38d3d2675513b1a367ed3c'),(138,'2024-02-07 11:14:45',100,'sender','OnConnectorList','form','','\\Bitrix\\Form\\SenderEventHandler','onConnectorListForm','',1,'182217f1803d20e2899086e379ada21c'),(139,'2024-02-07 11:14:45',100,'main','OnAfterUserUpdate','forum','','CForumUser','OnAfterUserUpdate','',1,'18ca0a9757a229b6290603235dfff0d1'),(140,'2024-02-07 11:14:45',100,'main','OnGroupDelete','forum','','CForumNew','OnGroupDelete','',1,'63f10ce39f269a9f1add6a0600aa05b9'),(141,'2024-02-07 11:14:45',100,'main','OnBeforeLangDelete','forum','','CForumNew','OnBeforeLangDelete','',1,'201c2a343960654a90382521e253328f'),(142,'2024-02-07 11:14:45',100,'main','OnFileDelete','forum','','CForumFiles','OnFileDelete','',1,'a00aa95408b2665018cb63e21cef4684'),(143,'2024-02-07 11:14:45',100,'search','OnReindex','forum','','CForumNew','OnReindex','',1,'3fe2c3077963069fee2360611d840816'),(144,'2024-02-07 11:14:45',100,'main','OnUserDelete','forum','','CForumUser','OnUserDelete','',1,'eb0cb7958d708be629eba740bcabd8c4'),(145,'2024-02-07 11:14:45',100,'iblock','OnIBlockPropertyBuildList','main','/modules/forum/tools/prop_topicid.php','CIBlockPropertyTopicID','GetUserTypeDescription','',1,'d5b04b52654500981293dbcf10ca1ef9'),(146,'2024-02-07 11:14:45',100,'iblock','OnBeforeIBlockElementDelete','forum','','CForumTopic','OnBeforeIBlockElementDelete','',1,'929cf569dd703b922e4a96a0a023f120'),(147,'2024-02-07 11:14:45',100,'main','OnEventLogGetAuditTypes','forum','','CForumEventLog','GetAuditTypes','',1,'30a759001702af8052ea65e700c519c7'),(148,'2024-02-07 11:14:45',100,'main','OnEventLogGetAuditHandlers','forum','','CEventForum','MakeForumObject','',1,'78ecc0524ac5d4fb0545c8a3fa28b3bd'),(149,'2024-02-07 11:14:45',100,'socialnetwork','OnSocNetGroupDelete','forum','','CForumUser','OnSocNetGroupDelete','',1,'94cfb4cf5460746b7b31a5b93a3805f6'),(150,'2024-02-07 11:14:45',100,'socialnetwork','OnSocNetLogFormatEvent','forum','','CForumMessage','OnSocNetLogFormatEvent','',1,'28c7a91a467c1190a064f597487abd5c'),(151,'2024-02-07 11:14:45',100,'mail','OnGetFilterList','forum','','CForumEMail','OnGetSocNetFilterList','',1,'e42fc61795fed0c5f397259bb6f1f6b9'),(152,'2024-02-07 11:14:45',100,'main','OnAfterAddRating','forum','','CRatingsComponentsForum','OnAfterAddRating','',1,'db966e6ee1f8b98f83e57411f4757858'),(153,'2024-02-07 11:14:45',100,'main','OnAfterUpdateRating','forum','','CRatingsComponentsForum','OnAfterUpdateRating','',1,'f5f6a93c1fe6d7dc61fbb5bf25f9965f'),(154,'2024-02-07 11:14:45',100,'main','OnSetRatingsConfigs','forum','','CRatingsComponentsForum','OnSetRatingConfigs','',1,'84556c2f1f7f23189f90603f45ad3942'),(155,'2024-02-07 11:14:45',100,'main','OnGetRatingsConfigs','forum','','CRatingsComponentsForum','OnGetRatingConfigs','',1,'7ead6be47d7bb2e297a2af57f85dc7ee'),(156,'2024-02-07 11:14:45',100,'main','OnGetRatingsObjects','forum','','CRatingsComponentsForum','OnGetRatingObject','',1,'99f4b68c8e6c1598377e0016b31234bb'),(157,'2024-02-07 11:14:45',100,'main','OnGetRatingContentOwner','forum','','CRatingsComponentsForum','OnGetRatingContentOwner','',1,'5ef51ecf36931b3a32f4fea00dc49c8c'),(158,'2024-02-07 11:14:45',100,'im','OnGetNotifySchema','forum','','CForumNotifySchema','OnGetNotifySchema','',1,'ad425ff862192078c050ea34d60f8d63'),(159,'2024-02-07 11:14:45',100,'main','OnAfterRegisterModule','main','/modules/forum/install/index.php','forum','InstallUserFields','',1,'205fd3e33648d7e1ed6f4b7f0298f603'),(160,'2024-02-07 11:14:45',100,'rest','OnRestServiceBuildDescription','forum','','CForumRestService','OnRestServiceBuildDescription','',1,'506b2a93cea64d73c9e7c187fdde2840'),(161,'2024-02-07 11:14:45',100,'conversion','OnGetCounterTypes','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onGetCounterTypes','',1,'fa69bf6ff10a0fb9b2e91098f0c0bab3'),(162,'2024-02-07 11:14:45',100,'conversion','OnGetRateTypes','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onGetRateTypes','',1,'9eb2b6d8edde63385655c1001d9e0c31'),(163,'2024-02-07 11:14:45',100,'forum','onAfterTopicAdd','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onTopicAdd','',1,'ea61a319e93c2c3a9bfc9a63840b2155'),(164,'2024-02-07 11:14:45',100,'forum','onAfterMessageAdd','forum','','\\Bitrix\\Forum\\Internals\\ConversionHandlers','onMessageAdd','',1,'3cc5f27501dad77acdecb1c8a4e978de'),(165,'2024-02-07 11:14:45',100,'socialnetwork','onLogIndexGetContent','forum','','\\Bitrix\\Forum\\Integration\\Socialnetwork\\Log','onIndexGetContent','',2,'909a8b84bf80774a6a89bfbbd2258ce8'),(166,'2024-02-07 11:14:45',100,'socialnetwork','onLogCommentIndexGetContent','forum','','\\Bitrix\\Forum\\Integration\\Socialnetwork\\LogComment','onIndexGetContent','',2,'e6aaa86c7daeae2bc002e513f06ccffa'),(167,'2024-02-07 11:14:45',100,'socialnetwork','onContentViewed','forum','','\\Bitrix\\Forum\\Integration\\Socialnetwork\\ContentViewHandler','onContentViewed','',2,'5db6b373f6612f36c2ff6783dd4d6154'),(168,'2024-02-07 11:14:46',100,'main','OnBeforeUserTypeAdd','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','OnBeforeUserTypeAdd','',1,'f9dcff287cf7753e5c56974d37975507'),(169,'2024-02-07 11:14:46',100,'main','OnAfterUserTypeAdd','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','onAfterUserTypeAdd','',1,'d1fa2865e72eca144b964b6fb1eefc15'),(170,'2024-02-07 11:14:46',100,'main','OnBeforeUserTypeDelete','highloadblock','','\\Bitrix\\Highloadblock\\HighloadBlockTable','OnBeforeUserTypeDelete','',1,'1bf13707e1a45b8320c2ecd35534cbb4'),(171,'2024-02-07 11:14:46',100,'main','OnUserTypeBuildList','highloadblock','','CUserTypeHlblock','GetUserTypeDescription','',1,'2ac4a2154f4fd85d67b50f412ed5ed48'),(172,'2024-02-07 11:14:46',100,'iblock','OnIBlockPropertyBuildList','highloadblock','','CIBlockPropertyDirectory','GetUserTypeDescription','',1,'a6f7df502db8a04590e43188d7cbfc99'),(173,'2024-02-07 11:14:46',100,'main','OnGroupDelete','iblock','','CIBlock','OnGroupDelete','',1,'f2320df213f38adf32364d3169d5b197'),(174,'2024-02-07 11:14:46',100,'main','OnBeforeLangDelete','iblock','','CIBlock','OnBeforeLangDelete','',1,'46aef774958db327c1170a12d3a70ee5'),(175,'2024-02-07 11:14:46',100,'main','OnLangDelete','iblock','','CIBlock','OnLangDelete','',1,'861f6ee2ca56bf63c3af07db0553606b'),(176,'2024-02-07 11:14:46',100,'main','OnUserTypeRightsCheck','iblock','','CIBlockSection','UserTypeRightsCheck','',1,'2a6d446893d46f04f2c151f458d2908c'),(177,'2024-02-07 11:14:46',100,'search','OnReindex','iblock','','CIBlock','OnSearchReindex','',1,'c6c8111f129e0eb19e558106e354e6f6'),(178,'2024-02-07 11:14:46',100,'search','OnSearchGetURL','iblock','','CIBlock','OnSearchGetURL','',1,'0ae9fc756bfb1273309240cd8f535672'),(179,'2024-02-07 11:14:46',100,'main','OnEventLogGetAuditTypes','iblock','','CIBlock','GetAuditTypes','',1,'182d19c163e3a5a965bca170c3fb0e83'),(180,'2024-02-07 11:14:46',100,'main','OnEventLogGetAuditHandlers','iblock','','CEventIBlock','MakeIBlockObject','',1,'f7a182e8d9b204970d111e4703b9f523'),(181,'2024-02-07 11:14:46',200,'main','OnGetRatingContentOwner','iblock','','CRatingsComponentsIBlock','OnGetRatingContentOwner','',1,'6da245944e376d586a3fa2aaee02c70b'),(182,'2024-02-07 11:14:46',100,'main','OnTaskOperationsChanged','iblock','','CIBlockRightsStorage','OnTaskOperationsChanged','',1,'01b3f9984fa07b1dfb4bc35d107d5672'),(183,'2024-02-07 11:14:46',100,'main','OnGroupDelete','iblock','','CIBlockRightsStorage','OnGroupDelete','',1,'2dbbccdee3f2e7bd86446bec02be1d54'),(184,'2024-02-07 11:14:46',100,'main','OnUserDelete','iblock','','CIBlockRightsStorage','OnUserDelete','',1,'78f090ee29030c54788098b0782d28f9'),(185,'2024-02-07 11:14:46',100,'perfmon','OnGetTableSchema','iblock','','iblock','OnGetTableSchema','',1,'4b71a345c136beed338aa7137943d80b'),(186,'2024-02-07 11:14:46',100,'sender','OnConnectorList','iblock','','\\Bitrix\\Iblock\\SenderEventHandler','onConnectorListIblock','',1,'3de75587a47352dd3cb6d10866f69385'),(187,'2024-02-07 11:14:46',10,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyDate','GetUserTypeDescription','',1,'fa608e2c397b6793c54ad296619a22e2'),(188,'2024-02-07 11:14:46',20,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyDateTime','GetUserTypeDescription','',1,'78554c9e3c38ac383d51f0ee4d013120'),(189,'2024-02-07 11:14:46',30,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyXmlID','GetUserTypeDescription','',1,'952fe5f2ea67493fb9f9b924ce1b992b'),(190,'2024-02-07 11:14:46',40,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyFileMan','GetUserTypeDescription','',1,'fd688441d5e8203751fb47374931e011'),(191,'2024-02-07 11:14:46',50,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyHTML','GetUserTypeDescription','',1,'27645f81ce5d6d9f19a47cc171860beb'),(192,'2024-02-07 11:14:46',60,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyElementList','GetUserTypeDescription','',1,'c53e9314ae43c30267b32310a02d7df4'),(193,'2024-02-07 11:14:46',70,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySequence','GetUserTypeDescription','',1,'3ff9528d1264fc77697248957aafdab5'),(194,'2024-02-07 11:14:46',80,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertyElementAutoComplete','GetUserTypeDescription','',1,'0d233a1e7a0d6a52a52e13df88291024'),(195,'2024-02-07 11:14:46',90,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySKU','GetUserTypeDescription','',1,'8678bc826ced4f66640fba3775b18516'),(196,'2024-02-07 11:14:46',100,'iblock','OnIBlockPropertyBuildList','iblock','','CIBlockPropertySectionAutoComplete','GetUserTypeDescription','',1,'26ff6f651cb94a1fe4ce9827566f0730'),(197,'2024-02-07 11:14:46',100,'main','onVirtualClassBuildList','iblock','','Bitrix\\Iblock\\IblockTable','compileAllEntities','',2,'8a4e85071d25e6ba7f9ed315874c411b'),(198,'2024-02-07 11:14:48',100,'ai','onTuningLoad','landing','','\\Bitrix\\Landing\\Connector\\Ai','onTuningLoad','',2,'64d7f5f3d8a372fb0d441d82a49f369b'),(199,'2024-02-07 11:14:48',100,'ai','onBeforeCompletions','landing','','\\Bitrix\\Landing\\Connector\\Ai','onBeforeCompletions','',2,'9192985f1e2da4ddd7a3328eb95a975e'),(200,'2024-02-07 11:14:48',100,'crm','onAfterCrmCompanyAdd','landing','','\\Bitrix\\Landing\\Connector\\Crm','onAfterCompanyChange','',2,'7e8fed841380d8075d45525f328e8940'),(201,'2024-02-07 11:14:48',100,'crm','onAfterCrmCompanyUpdate','landing','','\\Bitrix\\Landing\\Connector\\Crm','onAfterCompanyChange','',2,'688027a0f389137b02ac0a834f0a8495'),(202,'2024-02-07 11:14:48',100,'iblock','onAfterIBlockSectionDelete','landing','','\\Bitrix\\Landing\\Connector\\Iblock','onAfterIBlockSectionDelete','',2,'ffe8a984ae7ff50064ac74e788a80118'),(203,'2024-02-07 11:14:48',100,'intranet','onBuildBindingMenu','landing','','\\Bitrix\\Landing\\Connector\\Intranet','onBuildBindingMenu','',2,'d5464da9aea2308d3d5f13c2387c4c40'),(204,'2024-02-07 11:14:48',100,'landing','onBuildSourceList','landing','','\\Bitrix\\Landing\\Connector\\Landing','onSourceBuildHandler','',2,'fc391addc82a816df68510b0ae3363a5'),(205,'2024-02-07 11:14:48',100,'main','onBeforeSiteDelete','landing','','\\Bitrix\\Landing\\Site','onBeforeMainSiteDelete','',2,'5faa9b5de931dbb101e2e0aef6fc594b'),(206,'2024-02-07 11:14:48',100,'main','onSiteDelete','landing','','\\Bitrix\\Landing\\Site','onMainSiteDelete','',2,'af029bceca7ea9cc809515e95bd3a710'),(207,'2024-02-07 11:14:48',100,'main','onUserConsentProviderList','landing','','\\Bitrix\\Landing\\Site\\Cookies','onUserConsentProviderList','',2,'f59a96e272348f934d62ba5d3ee79f21'),(208,'2024-02-07 11:14:48',100,'main','OnAfterFileDeleteDuplicate','landing','','\\Bitrix\\Landing\\Update\\Block\\DuplicateImages','onAfterFileDeleteDuplicate','',2,'b80f7597db6200591a0e0e41c14e0ee0'),(209,'2024-02-07 11:14:48',100,'mobile','onMobileMenuStructureBuilt','landing','','\\Bitrix\\Landing\\Connector\\Mobile','onMobileMenuStructureBuilt','',2,'01fd8a44b83b5f7fcd2f36a626657ad0'),(210,'2024-02-07 11:14:48',100,'rest','onRestServiceBuildDescription','landing','','\\Bitrix\\Landing\\Publicaction','restBase','',2,'9af99ddecf2dd8c3c5b14721f23e8fef'),(211,'2024-02-07 11:14:48',100,'rest','onBeforeApplicationUninstall','landing','','\\Bitrix\\Landing\\Publicaction','beforeRestApplicationDelete','',2,'ef1f080a088ad54298a4ba9bf2896313'),(212,'2024-02-07 11:14:48',100,'rest','onRestAppDelete','landing','','\\Bitrix\\Landing\\Publicaction','restApplicationDelete','',2,'031cfc016e3be91368376a391c351dea'),(213,'2024-02-07 11:14:48',100,'rest','onRestApplicationConfigurationGetManifest','landing','','\\Bitrix\\Landing\\Transfer\\AppConfiguration','getManifestList','',2,'b88124aac7c2c8ddecf2ce127a9c6ef8'),(214,'2024-02-07 11:14:48',100,'rest','onRestApplicationConfigurationExport','landing','','\\Bitrix\\Landing\\Transfer\\AppConfiguration','onEventExportController','',2,'917b00a9f82e6b8f7899a6e8c3b22236'),(215,'2024-02-07 11:14:48',100,'rest','onRestApplicationConfigurationGetManifestSetting','landing','','\\Bitrix\\Landing\\Transfer\\AppConfiguration','onInitManifest','',2,'99fa9aa37a23a371cca0153c840c7802'),(216,'2024-02-07 11:14:48',100,'rest','onRestApplicationConfigurationEntity','landing','','\\Bitrix\\Landing\\Transfer\\AppConfiguration','getEntityList','',2,'820df699b9abf22ce0356fc9957be794'),(217,'2024-02-07 11:14:48',100,'rest','onRestApplicationConfigurationImport','landing','','\\Bitrix\\Landing\\Transfer\\AppConfiguration','onEventImportController','',2,'e65daaed01b2c52e6098ee47ddb7f07a'),(218,'2024-02-07 11:14:48',100,'rest','onRestApplicationConfigurationFinish','landing','','\\Bitrix\\Landing\\Transfer\\AppConfiguration','onFinish','',2,'45343e5617dca2ad06a5d13050232caf'),(219,'2024-02-07 11:14:48',100,'seo','onExtensionInstall','landing','','\\Bitrix\\Landing\\Hook\\Page\\PixelFb','changeBusinessPixel','',2,'27bf01f04349ff82ede423de62df5384'),(220,'2024-02-07 11:14:48',100,'socialnetwork','onFillSocNetFeaturesList','landing','','\\Bitrix\\Landing\\Connector\\SocialNetwork','onFillSocNetFeaturesList','',2,'9825d91c89b53b69655aa98ea4f3a6cf'),(221,'2024-02-07 11:14:48',100,'socialnetwork','onFillSocNetMenu','landing','','\\Bitrix\\Landing\\Connector\\SocialNetwork','onFillSocNetMenu','',2,'14ecfb8fb4fc20f22ddb5ac64783461d'),(222,'2024-02-07 11:14:48',100,'socialnetwork','onSocNetGroupDelete','landing','','\\Bitrix\\Landing\\Connector\\SocialNetwork','onSocNetGroupDelete','',2,'78202f1461a8822a105a19f45502c327'),(223,'2024-02-07 11:14:48',100,'socialnetwork','onSocNetFeaturesUpdate','landing','','\\Bitrix\\Landing\\Connector\\SocialNetwork','onSocNetFeaturesUpdate','',2,'d385df085957d9e418b63017d75630fe'),(224,'2024-02-07 11:14:50',100,'ui','onUIFormInitialize','location','','\\Bitrix\\Location\\Infrastructure\\EventHandler','onUIFormInitialize','',2,'462272192a150e16b28f1e1bd33ed62b'),(225,'2024-02-07 11:14:51',100,'main','OnAfterEpilog','messageservice','','\\Bitrix\\MessageService\\Queue','run','',1,'6bcb21b0ccc5ac89d9531ddf8b94683c'),(226,'2024-02-07 11:14:51',100,'rest','OnRestServiceBuildDescription','messageservice','','\\Bitrix\\MessageService\\RestService','onRestServiceBuildDescription','',1,'7524628243223e572590eea87cc03f73'),(227,'2024-02-07 11:14:51',100,'rest','OnRestAppDelete','messageservice','','\\Bitrix\\MessageService\\RestService','onRestAppDelete','',1,'5febc41cd526ecba95dbb4843dd9c134'),(228,'2024-02-07 11:14:51',100,'rest','OnRestAppUpdate','messageservice','','\\Bitrix\\MessageService\\RestService','onRestAppUpdate','',1,'7e77b4d550c200a4ec06872af7857ee6'),(229,'2024-02-07 11:14:51',100,'pull','OnGetDependentModule','mobileapp','','CMobileAppPullSchema','OnGetDependentModule','',1,'4833278dbe60d476fbccbaa54545cffa'),(230,'2024-02-07 11:14:51',100,'perfmon','OnGetTableSchema','perfmon','','perfmon','OnGetTableSchema','',1,'3a4da255b44f05899b64e66a40c12662'),(231,'2024-02-07 11:14:51',100,'iblock','OnBeforeIBlockElementDelete','photogallery','','CPhotogalleryElement','OnBeforeIBlockElementDelete','',1,'dc9ea0b8411dfa54929a022d44bc5b1a'),(232,'2024-02-07 11:14:51',100,'iblock','OnAfterIBlockElementAdd','photogallery','','CPhotogalleryElement','OnAfterIBlockElementAdd','',1,'7fc7f3cc71ad3188022388365d446ed2'),(233,'2024-02-07 11:14:51',100,'search','BeforeIndex','photogallery','','CRatingsComponentsPhotogallery','BeforeIndex','',1,'06e2330d56c3b972e67707d665383704'),(234,'2024-02-07 11:14:51',100,'im','OnGetNotifySchema','photogallery','','CPhotogalleryNotifySchema','OnGetNotifySchema','',1,'7ca75249042a033e858d90dc2473adac'),(235,'2024-02-07 11:14:51',100,'socialnetwork','OnSocNetGroupDelete','photogallery','','\\Bitrix\\Photogallery\\Integration\\Socialnetwork\\Group','onSocNetGroupDelete','',1,'bded61c39d768685fa7dd112c63c702b'),(236,'2024-02-07 11:14:52',49,'main','OnBeforeProlog','rest','','CRestEventHandlers','OnBeforeProlog','',2,'395c9c42c3cc9392de1e5887617afe6d'),(237,'2024-02-07 11:14:52',100,'rest','OnRestServiceBuildDescription','rest','','CBitrixRestEntity','OnRestServiceBuildDescription','',2,'f63068b1eb62c36219518206e1e2827c'),(238,'2024-02-07 11:14:52',100,'rest','OnRestServiceBuildDescription','rest','','\\Bitrix\\Rest\\Api\\User','onRestServiceBuildDescription','',2,'c9a03e9019564649e55f5409b661e050'),(239,'2024-02-07 11:14:52',100,'rest','OnRestServiceBuildDescription','rest','','\\Bitrix\\Rest\\Api\\Placement','onRestServiceBuildDescription','',2,'9751a266c2b6f6be5c34b1541bf7c194'),(240,'2024-02-07 11:14:52',100,'rest','OnRestServiceBuildDescription','rest','','\\Bitrix\\Rest\\Api\\Event','onRestServiceBuildDescription','',2,'842ad63f19aff6d810059c7e56739aae'),(241,'2024-02-07 11:14:52',100,'rest','OnRestServiceBuildDescription','rest','','\\Bitrix\\Rest\\Api\\UserFieldType','onRestServiceBuildDescription','',2,'4caf68a5256aabe4abef37f24562e59b'),(242,'2024-02-07 11:14:52',100,'rest','onFindMethodDescription','rest','','\\Bitrix\\Rest\\Engine\\RestManager','onFindMethodDescription','',2,'4d0614f880674af333326dd5ba9b2828'),(243,'2024-02-07 11:14:52',100,'main','OnApplicationsBuildList','main','modules/rest/lib/apauth/application.php','\\Bitrix\\Rest\\APAuth\\Application','onApplicationsBuildList','',2,'9c39129872987f8dcc8baacc0c446ed7'),(244,'2024-02-07 11:14:52',100,'im','OnAfterConfirmNotify','rest','','\\Bitrix\\Rest\\NotifyIm','receive','',2,'2ac9c19fe69d4e106deaa6f4a7a4371b'),(245,'2024-02-07 11:14:52',100,'rest','\\Bitrix\\Rest\\APAuth\\Password::OnDelete','rest','','\\Bitrix\\Rest\\APAuth\\PermissionTable','onPasswordDelete','',2,'f04447ca635f045ec1a64e593964fc90'),(246,'2024-02-07 11:14:52',100,'perfmon','OnGetTableSchema','rest','','rest','OnGetTableSchema','',2,'47a76003c8f9f2d8c820f446e084ff39'),(247,'2024-02-07 11:14:52',100,'rest','OnRestApplicationConfigurationImport','rest','','\\Bitrix\\Rest\\Configuration\\AppConfiguration','onEventImportController','',2,'3fc1dd7e523b33f9d76c19e54d45c2fb'),(248,'2024-02-07 11:14:52',100,'rest','OnRestApplicationConfigurationExport','rest','','\\Bitrix\\Rest\\Configuration\\AppConfiguration','onEventExportController','',2,'b90a349060c693506b740c4d36f75f5f'),(249,'2024-02-07 11:14:52',100,'rest','OnRestApplicationConfigurationClear','rest','','\\Bitrix\\Rest\\Configuration\\AppConfiguration','onEventClearController','',2,'75dccda637a740c033b2d014a84a8009'),(250,'2024-02-07 11:14:52',100,'rest','OnRestApplicationConfigurationEntity','rest','','\\Bitrix\\Rest\\Configuration\\AppConfiguration','getEntityList','',2,'8d83d219eaf2f415d55fb67e221b7c3d'),(251,'2024-02-07 11:14:52',100,'rest','OnRestApplicationConfigurationGetManifest','rest','','\\Bitrix\\Rest\\Configuration\\AppConfiguration','getManifestList','',2,'6ba35b1f4b01d1e358e1b3a79ac437d6'),(252,'2024-02-07 11:14:52',100,'main','OnAfterSetOption_~mp24_paid_date','rest','','\\Bitrix\\Rest\\Marketplace\\Client','onChangeSubscriptionDate','',2,'b6ab5bafe2befd82726761f5a8b38a0b'),(253,'2024-02-07 11:14:52',100,'rest','onRestCheckAuth','rest','','\\Bitrix\\Rest\\OAuth\\Auth','onRestCheckAuth','',2,'70e923729089b8cba69bb3b4311da11e'),(254,'2024-02-07 11:14:52',100,'rest','onRestCheckAuth','rest','','\\Bitrix\\Rest\\APAuth\\Auth','onRestCheckAuth','',2,'3550e6c95772564101770e0c9cb54470'),(255,'2024-02-07 11:14:52',100,'rest','onRestCheckAuth','rest','','\\Bitrix\\Rest\\SessionAuth\\Auth','onRestCheckAuth','',2,'8e33ae5a47b59d21df7d26f916d19e38'),(256,'2024-02-07 11:14:52',100,'main','OnAfterRegisterModule','rest','','\\Bitrix\\Rest\\Engine\\ScopeManager','onChangeRegisterModule','',2,'900fb8bbf0d59d1924bedae5da1b6eb1'),(257,'2024-02-07 11:14:52',100,'main','OnAfterUnRegisterModule','rest','','\\Bitrix\\Rest\\Engine\\ScopeManager','onChangeRegisterModule','',2,'e97e569fe3fc7775aa4ece09cdf209bc'),(258,'2024-02-07 11:14:52',100,'main','OnAfterRegisterModule','rest','','\\Bitrix\\Rest\\Marketplace\\TagTable','onAfterRegisterModule','',2,'80afec537db1eeda99462f0676dbb835'),(259,'2024-02-07 11:14:52',100,'main','OnAfterUnRegisterModule','rest','','\\Bitrix\\Rest\\Marketplace\\TagTable','onAfterUnRegisterModule','',2,'fe9cb5af7e8ca277ca29b4a5423bd08b'),(260,'2024-02-07 11:14:52',100,'main','OnEventLogGetAuditTypes','scale','','\\Bitrix\\Scale\\Logger','onEventLogGetAuditTypes','',1,'d8192b7113f1652bdf8a37bcd4e38dea'),(261,'2024-02-07 11:14:52',100,'main','OnChangePermissions','search','','CSearch','OnChangeFilePermissions','',1,'1c37aedc2ec89f94624291d097fe7adf'),(262,'2024-02-07 11:14:52',100,'main','OnChangeFile','search','','CSearch','OnChangeFile','',1,'d51170fc3433fde7eab8edc1c2b933a0'),(263,'2024-02-07 11:14:52',100,'main','OnGroupDelete','search','','CSearch','OnGroupDelete','',1,'05382d7448b1ba259b89bf9e87e4eb44'),(264,'2024-02-07 11:14:52',100,'main','OnLangDelete','search','','CSearch','OnLangDelete','',1,'15ebda82514af5a966b3466cd26992a4'),(265,'2024-02-07 11:14:52',100,'main','OnAfterUserUpdate','search','','CSearchUser','OnAfterUserUpdate','',1,'9e0cea5039973193afc706ec8978d674'),(266,'2024-02-07 11:14:52',100,'main','OnUserDelete','search','','CSearchUser','DeleteByUserID','',1,'524a910f381ba144bf50caa152222ed6'),(267,'2024-02-07 11:14:52',100,'cluster','OnGetTableList','search','','search','OnGetTableList','',1,'a40ffd36df151e2c0294b5639e81d665'),(268,'2024-02-07 11:14:52',100,'perfmon','OnGetTableSchema','search','','search','OnGetTableSchema','',1,'9c8df2577e0cb80c68afa2030e193efb'),(269,'2024-02-07 11:14:52',90,'main','OnEpilog','search','','CSearchStatistic','OnEpilog','',1,'6b3591ad78ac2a3ce6ad411f0aff47fe'),(270,'2024-02-07 11:14:53',100,'main','OnUserDelete','security','','CSecurityUser','OnUserDelete','',1,'450a1c7509f5363a9bf7d1472f22f9cf'),(271,'2024-02-07 11:14:53',100,'main','OnEventLogGetAuditTypes','security','','CSecurityFilter','GetAuditTypes','',1,'893bc94df887141b4f3579561ea37454'),(272,'2024-02-07 11:14:53',100,'main','OnEventLogGetAuditTypes','security','','CSecurityAntiVirus','GetAuditTypes','',1,'9ba919b0537aa25fe47e438c2428b4d9'),(273,'2024-02-07 11:14:53',100,'main','OnAdminInformerInsertItems','security','','CSecurityFilter','OnAdminInformerInsertItems','',1,'c751923f396ccc4e102ed17e97cb8afb'),(274,'2024-02-07 11:14:53',100,'main','OnAdminInformerInsertItems','security','','CSecuritySiteChecker','OnAdminInformerInsertItems','',1,'0c7cea553d58a72f7c5521d282898bc7'),(275,'2024-02-07 11:14:53',5,'main','OnBeforeProlog','security','','CSecurityFilter','OnBeforeProlog','',1,'bb70fedd18267b1c5290068ae80dbc4d'),(276,'2024-02-07 11:14:53',9999,'main','OnEndBufferContent','security','','CSecurityXSSDetect','OnEndBufferContent','',1,'d1886589ecd51b020420e6c1415edeaf'),(277,'2024-02-07 11:14:53',1,'main','OnBeforeLocalRedirect','security','','CSecurityRedirect','BeforeLocalRedirect','',1,'2dbeb7fa7a8bec4d90e8940616976b3d'),(278,'2024-02-07 11:14:53',1,'main','OnEndBufferContent','security','','CSecurityRedirect','EndBufferContent','',1,'099871646b4df8c1263e26f9bd91f3bd'),(279,'2024-02-07 11:14:53',100,'main','OnPanelCreate','seo','','CSeoEventHandlers','SeoOnPanelCreate','',2,'79688b0b4a106b805d09e63ffe88f580'),(280,'2024-02-07 11:14:53',100,'fileman','OnIncludeHTMLEditorScript','seo','','CSeoEventHandlers','OnIncludeHTMLEditorScript','',2,'7995eac5813e40f6b3e82b146631397e'),(281,'2024-02-07 11:14:53',100,'fileman','OnBeforeHTMLEditorScriptRuns','seo','','CSeoEventHandlers','OnBeforeHTMLEditorScriptRuns','',2,'313b34609f1fa34d34cde1c2103c09ff'),(282,'2024-02-07 11:14:53',100,'iblock','OnAfterIBlockSectionAdd','seo','','\\Bitrix\\Seo\\SitemapIblock','addSection','',2,'c61de21b0b0873525fa5c39427324664'),(283,'2024-02-07 11:14:53',100,'iblock','OnAfterIBlockElementAdd','seo','','\\Bitrix\\Seo\\SitemapIblock','addElement','',2,'1b167ab85d6d744bba456e559546f13e'),(284,'2024-02-07 11:14:53',100,'iblock','OnBeforeIBlockSectionDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeDeleteSection','',2,'148ce014df9dd9f99f17ebfc5d766e8a'),(285,'2024-02-07 11:14:53',100,'iblock','OnBeforeIBlockElementDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeDeleteElement','',2,'4b1e9896d9f0aa37a7039a321f25f9a5'),(286,'2024-02-07 11:14:53',100,'iblock','OnAfterIBlockSectionDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','deleteSection','',2,'b699c1c0d6665f9cffe7ff76ab108a24'),(287,'2024-02-07 11:14:53',100,'iblock','OnAfterIBlockElementDelete','seo','','\\Bitrix\\Seo\\SitemapIblock','deleteElement','',2,'ff3a36654015c53890f4cf2204b030c4'),(288,'2024-02-07 11:14:53',100,'iblock','OnBeforeIBlockSectionUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeUpdateSection','',2,'aa5f8c360ed88eb5e2884c57b6f1f2f3'),(289,'2024-02-07 11:14:53',100,'iblock','OnBeforeIBlockElementUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','beforeUpdateElement','',2,'a1022e0619263c0e91139fb3f9837085'),(290,'2024-02-07 11:14:53',100,'iblock','OnAfterIBlockSectionUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','updateSection','',2,'27930cffcd40b84666d0a22e1a953c41'),(291,'2024-02-07 11:14:53',100,'iblock','OnAfterIBlockElementUpdate','seo','','\\Bitrix\\Seo\\SitemapIblock','updateElement','',2,'f0151e07363564774d45acba4100aebe'),(292,'2024-02-07 11:14:53',100,'forum','onAfterTopicAdd','seo','','\\Bitrix\\Seo\\SitemapForum','addTopic','',2,'d4d54756116942c9ee0bda9b31e9d0e7'),(293,'2024-02-07 11:14:53',100,'forum','onAfterTopicUpdate','seo','','\\Bitrix\\Seo\\SitemapForum','updateTopic','',2,'3e0a8569016a4c941f3eb4aa9fca6e8b'),(294,'2024-02-07 11:14:53',100,'forum','onAfterTopicDelete','seo','','\\Bitrix\\Seo\\SitemapForum','deleteTopic','',2,'7f4379c818231561b41589d3de41e36b'),(295,'2024-02-07 11:14:53',100,'main','OnAdminIBlockElementEdit','seo','','\\Bitrix\\Seo\\AdvTabEngine','eventHandler','',2,'c894d167ef03c35375b8eb8f2551a798'),(296,'2024-02-07 11:14:53',100,'main','OnBeforeProlog','seo','','\\Bitrix\\Seo\\AdvSession','checkSession','',2,'5fdf8dd9fd70719e442efcb589175bf0'),(297,'2024-02-07 11:14:53',100,'sale','OnOrderSave','seo','','\\Bitrix\\Seo\\AdvSession','onOrderSave','',2,'07d4ab0b1aa0aa130a0cbc06403f6eae'),(298,'2024-02-07 11:14:53',100,'sale','OnBasketOrder','seo','','\\Bitrix\\Seo\\AdvSession','onBasketOrder','',2,'cf6298b090e92e955b32c358c1d14b25'),(299,'2024-02-07 11:14:53',100,'sale','onSalePayOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSalePayOrder','',2,'745afed820778e33d5cd3e91cbd622f1'),(300,'2024-02-07 11:14:53',100,'sale','onSaleDeductOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleDeductOrder','',2,'12861bd5c6c27ffa2abe5cac90ea58d8'),(301,'2024-02-07 11:14:53',100,'sale','onSaleDeliveryOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleDeliveryOrder','',2,'ead8fb64fece572d1fabd3d6fd27af27'),(302,'2024-02-07 11:14:53',100,'sale','onSaleStatusOrder','seo','','\\Bitrix\\Seo\\AdvSession','onSaleStatusOrder','',2,'b7b9ac4bbf458d433e1cf3835ff4cb6c'),(303,'2024-02-07 11:14:53',100,'conversion','OnSetDayContextAttributes','seo','','\\Bitrix\\Seo\\ConversionHandler','onSetDayContextAttributes','',2,'c19eb7659342fabc34b953f69e8b9eee'),(304,'2024-02-07 11:14:53',100,'conversion','OnGetAttributeTypes','seo','','\\Bitrix\\Seo\\ConversionHandler','onGetAttributeTypes','',2,'379294eefad289e474bf0c5ce2a281d8'),(305,'2024-02-07 11:14:53',100,'catalog','OnProductUpdate','seo','','\\Bitrix\\Seo\\Adv\\Auto','checkQuantity','',2,'0f4deda4d57adb4389d85a19e5bbcf2b'),(306,'2024-02-07 11:14:53',100,'catalog','OnProductSetAvailableUpdate','seo','','\\Bitrix\\Seo\\Adv\\Auto','checkQuantity','',2,'3d040ae51f0f6a4b2a08be0e6e1494d4'),(307,'2024-02-07 11:14:53',100,'bitrix24','onDomainChange','seo','','\\Bitrix\\Seo\\Service','changeRegisteredDomain','',2,'fcb2dadb8b7ff1863c0ad86320e9e521'),(308,'2024-02-07 11:14:53',100,'main','OnUserDelete','socialservices','','CSocServAuthDB','OnUserDelete','',1,'1f5b8fc024dfdf83952d6c723466cdf5'),(309,'2024-02-07 11:14:53',100,'main','OnAfterUserLogout','socialservices','','CSocServEventHandlers','OnUserLogout','',1,'7e4c40a3ff7cd102879cef10653f97ac'),(310,'2024-02-07 11:14:53',100,'timeman','OnAfterTMReportDailyAdd','socialservices','','CSocServAuthDB','OnAfterTMReportDailyAdd','',1,'a16159f6a90f1b67cb9ec15b0c1bab3a'),(311,'2024-02-07 11:14:53',100,'timeman','OnAfterTMDayStart','socialservices','','CSocServAuthDB','OnAfterTMDayStart','',1,'9567feb38890d6581a3204dc5e65e8b6'),(312,'2024-02-07 11:14:53',100,'timeman','OnTimeManShow','socialservices','','CSocServEventHandlers','OnTimeManShow','',1,'b728f3cea11d374f7638c29f84e8e15e'),(313,'2024-02-07 11:14:53',100,'main','OnFindExternalUser','socialservices','','CSocServAuthDB','OnFindExternalUser','',1,'1ab251d15efc87c5b5cfe6396f5dec1b'),(314,'2024-02-07 11:14:53',100,'perfmon','OnGetTableSchema','socialservices','','socialservices','OnGetTableSchema','',1,'56107bf1a0dcee0db660c0ec27c31c6c'),(315,'2024-02-07 11:14:53',100,'socialservices','OnFindSocialservicesUser','socialservices','','CSocServAuthManager','checkOldUser','',1,'c3d7460e4ef694f5bc53b6a6ad902407'),(316,'2024-02-07 11:14:53',100,'socialservices','OnFindSocialservicesUser','socialservices','','CSocServAuthManager','checkAbandonedUser','',1,'331f99f0b265544c33777c299eab16f6'),(317,'2024-02-07 11:14:54',100,'main','OnBeforeLangDelete','subscribe','','CRubric','OnBeforeLangDelete','',1,'ee539731a3e52fe65cb52596ce0856d2'),(318,'2024-02-07 11:14:54',100,'main','OnUserDelete','subscribe','','CSubscription','OnUserDelete','',1,'88c6e57a6f0f18341332db1879c0005b'),(319,'2024-02-07 11:14:54',100,'main','OnUserLogout','subscribe','','CSubscription','OnUserLogout','',1,'f4fa3b156b00fb4415c8612f8439f278'),(320,'2024-02-07 11:14:54',100,'main','OnGroupDelete','subscribe','','CPosting','OnGroupDelete','',1,'990d63845f75e93e670ed85f1aa15152'),(321,'2024-02-07 11:14:54',100,'sender','OnConnectorList','subscribe','','Bitrix\\Subscribe\\SenderEventHandler','onConnectorListSubscriber','',1,'8a1cffe1bd46a72108e48656a1bae99b'),(322,'2024-02-07 11:14:54',100,'perfmon','OnGetTableSchema','subscribe','','subscribe','OnGetTableSchema','',1,'320b1fb657ce46ad23992d00b2f54916'),(323,'2024-02-07 11:14:54',100,'main','OnPanelCreate','translate','','\\Bitrix\\Translate\\Ui\\Panel','onPanelCreate','',1,'88ecb95eac2e28b80f234bfc8c1cd597'),(324,'2024-02-07 11:14:54',100,'perfmon','OnGetTableSchema','translate','','translate','onGetTableSchema','',1,'00347f45b2f48480b1a521c32036beb5'),(327,'2024-02-07 11:14:55',100,'main','OnUserDelete','ui','','\\Bitrix\\UI\\Integration\\Main\\User','onDelete','',2,'5e748ff204d0dac471be127b136eeb1d'),(328,'2024-02-07 11:14:55',100,'main','OnFileDelete','ui','','\\Bitrix\\UI\\Avatar\\Mask\\Item','onFileDelete','',2,'bdf678d45b7e9f3ce906099a5e4fc975'),(329,'2024-02-07 11:14:55',100,'rest','onRestAppDelete','ui','','\\Bitrix\\UI\\Integration\\Rest\\App','onRestAppDelete','',2,'b213605cfa38675d5e4b60f257f6acce'),(330,'2024-02-07 11:14:55',100,'rest','OnRestAppInstall','ui','','\\Bitrix\\UI\\Integration\\Rest\\App','OnRestAppInstall','',2,'206ce4eafe25cc4b5fbaddfa36eaba47'),(331,'2024-02-07 11:14:55',100,'rest','onRestApplicationConfigurationGetManifest','ui','','\\Bitrix\\UI\\Integration\\Rest\\MaskManifest','onRestApplicationConfigurationGetManifest','',2,'daad84620a1a84daef4884f1162e2099'),(332,'2024-02-07 11:14:55',100,'rest','onRestApplicationConfigurationGetManifestSetting','ui','','\\Bitrix\\UI\\Integration\\Rest\\MaskManifest','onRestApplicationConfigurationGetManifestSetting','',2,'b3290d964ad532e24a892bae6001146c'),(333,'2024-02-07 11:14:55',100,'rest','onRestApplicationConfigurationExport','ui','','\\Bitrix\\UI\\Integration\\Rest\\MaskManifest','onRestApplicationConfigurationExport','',2,'ac9b60f1d69d98c3980413800a3524f7'),(334,'2024-02-07 11:14:55',100,'rest','onRestApplicationConfigurationEntity','ui','','\\Bitrix\\UI\\Integration\\Rest\\MaskManifest','onRestApplicationConfigurationEntity','',2,'8d609b415b9bfa097d137ab69ba6903f'),(335,'2024-02-07 11:14:55',100,'rest','onRestApplicationConfigurationImport','ui','','\\Bitrix\\UI\\Integration\\Rest\\MaskManifest','onRestApplicationConfigurationImport','',2,'b1a5ce1bd868f8c86462c5b60eec1307'),(336,'2024-02-07 11:14:56',10,'main','OnBeforeProlog','main','/modules/vote/keepvoting.php','','','',1,'251d4d100c1545ca5847d8d6d626dea9'),(337,'2024-02-07 11:14:56',200,'main','OnUserTypeBuildList','vote','','Bitrix\\Vote\\Uf\\VoteUserType','getUserTypeDescription','',1,'e30dd2d26df22ce2dcffef84256cf160'),(338,'2024-02-07 11:14:56',200,'main','OnUserLogin','vote','','Bitrix\\Vote\\User','onUserLogin','',1,'5047b245af7aede3f2474b40dfbc65be'),(339,'2024-02-07 11:14:56',100,'im','OnGetNotifySchema','vote','','CVoteNotifySchema','OnGetNotifySchema','',1,'97ffe9642e64dc7d68f9ec9bc789be47'),(340,'2024-02-07 11:18:54',100,'main','OnBeforeProlog','main','/modules/main/install/wizard_sol/panel_button.php','CWizardSolPanel','ShowPanel','',1,'bbd7b8c1e518a0b3eae815eb91a95c11');
/*!40000 ALTER TABLE `b_module_to_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_numerator`
--

DROP TABLE IF EXISTS `b_numerator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_numerator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `TEMPLATE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `SETTINGS` text DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_numerator_code` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_numerator`
--

LOCK TABLES `b_numerator` WRITE;
/*!40000 ALTER TABLE `b_numerator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_numerator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_numerator_sequence`
--

DROP TABLE IF EXISTS `b_numerator_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_numerator_sequence` (
  `NUMERATOR_ID` int(11) NOT NULL DEFAULT 0,
  `KEY` varchar(32) NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) DEFAULT NULL,
  `NEXT_NUMBER` int(11) DEFAULT NULL,
  `LAST_INVOCATION_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_numerator_sequence`
--

LOCK TABLES `b_numerator_sequence` WRITE;
/*!40000 ALTER TABLE `b_numerator_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_numerator_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_operation`
--

DROP TABLE IF EXISTS `b_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_operation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BINDING` varchar(50) DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_operation`
--

LOCK TABLES `b_operation` WRITE;
/*!40000 ALTER TABLE `b_operation` DISABLE KEYS */;
INSERT INTO `b_operation` VALUES (1,'edit_php','main',NULL,'module'),(2,'view_own_profile','main',NULL,'module'),(3,'edit_own_profile','main',NULL,'module'),(4,'view_all_users','main',NULL,'module'),(5,'view_groups','main',NULL,'module'),(6,'view_tasks','main',NULL,'module'),(7,'view_other_settings','main',NULL,'module'),(8,'view_subordinate_users','main',NULL,'module'),(9,'edit_subordinate_users','main',NULL,'module'),(10,'edit_all_users','main',NULL,'module'),(11,'edit_groups','main',NULL,'module'),(12,'edit_tasks','main',NULL,'module'),(13,'edit_other_settings','main',NULL,'module'),(14,'cache_control','main',NULL,'module'),(15,'lpa_template_edit','main',NULL,'module'),(16,'view_event_log','main',NULL,'module'),(17,'edit_ratings','main',NULL,'module'),(18,'manage_short_uri','main',NULL,'module'),(19,'fm_view_permission','main',NULL,'file'),(20,'fm_view_file','main',NULL,'file'),(21,'fm_view_listing','main',NULL,'file'),(22,'fm_edit_existent_folder','main',NULL,'file'),(23,'fm_create_new_file','main',NULL,'file'),(24,'fm_edit_existent_file','main',NULL,'file'),(25,'fm_create_new_folder','main',NULL,'file'),(26,'fm_delete_file','main',NULL,'file'),(27,'fm_delete_folder','main',NULL,'file'),(28,'fm_edit_in_workflow','main',NULL,'file'),(29,'fm_rename_file','main',NULL,'file'),(30,'fm_rename_folder','main',NULL,'file'),(31,'fm_upload_file','main',NULL,'file'),(32,'fm_add_to_menu','main',NULL,'file'),(33,'fm_download_file','main',NULL,'file'),(34,'fm_lpa','main',NULL,'file'),(35,'fm_edit_permission','main',NULL,'file'),(36,'bitrixcloud_monitoring','bitrixcloud',NULL,'module'),(37,'bitrixcloud_backup','bitrixcloud',NULL,'module'),(38,'clouds_browse','clouds',NULL,'module'),(39,'clouds_upload','clouds',NULL,'module'),(40,'clouds_config','clouds',NULL,'module'),(41,'fileman_view_all_settings','fileman','','module'),(42,'fileman_edit_menu_types','fileman','','module'),(43,'fileman_add_element_to_menu','fileman','','module'),(44,'fileman_edit_menu_elements','fileman','','module'),(45,'fileman_edit_existent_files','fileman','','module'),(46,'fileman_edit_existent_folders','fileman','','module'),(47,'fileman_admin_files','fileman','','module'),(48,'fileman_admin_folders','fileman','','module'),(49,'fileman_view_permissions','fileman','','module'),(50,'fileman_edit_all_settings','fileman','','module'),(51,'fileman_upload_files','fileman','','module'),(52,'fileman_view_file_structure','fileman','','module'),(53,'fileman_install_control','fileman','','module'),(54,'medialib_view_collection','fileman','','medialib'),(55,'medialib_new_collection','fileman','','medialib'),(56,'medialib_edit_collection','fileman','','medialib'),(57,'medialib_del_collection','fileman','','medialib'),(58,'medialib_access','fileman','','medialib'),(59,'medialib_new_item','fileman','','medialib'),(60,'medialib_edit_item','fileman','','medialib'),(61,'medialib_del_item','fileman','','medialib'),(62,'sticker_view','fileman','','stickers'),(63,'sticker_edit','fileman','','stickers'),(64,'sticker_new','fileman','','stickers'),(65,'sticker_del','fileman','','stickers'),(66,'hl_element_read','highloadblock',NULL,'module'),(67,'hl_element_write','highloadblock',NULL,'module'),(68,'hl_element_delete','highloadblock',NULL,'module'),(69,'section_read','iblock',NULL,'iblock'),(70,'element_read','iblock',NULL,'iblock'),(71,'section_element_bind','iblock',NULL,'iblock'),(72,'iblock_admin_display','iblock',NULL,'iblock'),(73,'element_edit','iblock',NULL,'iblock'),(74,'element_edit_price','iblock',NULL,'iblock'),(75,'element_delete','iblock',NULL,'iblock'),(76,'element_bizproc_start','iblock',NULL,'iblock'),(77,'section_edit','iblock',NULL,'iblock'),(78,'section_delete','iblock',NULL,'iblock'),(79,'section_section_bind','iblock',NULL,'iblock'),(80,'element_edit_any_wf_status','iblock',NULL,'iblock'),(81,'iblock_edit','iblock',NULL,'iblock'),(82,'iblock_delete','iblock',NULL,'iblock'),(83,'iblock_rights_edit','iblock',NULL,'iblock'),(84,'iblock_export','iblock',NULL,'iblock'),(85,'section_rights_edit','iblock',NULL,'iblock'),(86,'element_rights_edit','iblock',NULL,'iblock'),(87,'landing_read','landing',NULL,'module'),(88,'landing_edit','landing',NULL,'module'),(89,'landing_sett','landing',NULL,'module'),(90,'landing_public','landing',NULL,'module'),(91,'landing_delete','landing',NULL,'module'),(92,'security_filter_bypass','security',NULL,'module'),(93,'security_edit_user_otp','security',NULL,'module'),(94,'security_module_settings_read','security',NULL,'module'),(95,'security_panel_view','security',NULL,'module'),(96,'security_filter_settings_read','security',NULL,'module'),(97,'security_otp_settings_read','security',NULL,'module'),(98,'security_iprule_admin_settings_read','security',NULL,'module'),(99,'security_session_settings_read','security',NULL,'module'),(100,'security_redirect_settings_read','security',NULL,'module'),(101,'security_stat_activity_settings_read','security',NULL,'module'),(102,'security_iprule_settings_read','security',NULL,'module'),(103,'security_antivirus_settings_read','security',NULL,'module'),(104,'security_frame_settings_read','security',NULL,'module'),(105,'security_module_settings_write','security',NULL,'module'),(106,'security_filter_settings_write','security',NULL,'module'),(107,'security_otp_settings_write','security',NULL,'module'),(108,'security_iprule_admin_settings_write','security',NULL,'module'),(109,'security_session_settings_write','security',NULL,'module'),(110,'security_redirect_settings_write','security',NULL,'module'),(111,'security_stat_activity_settings_write','security',NULL,'module'),(112,'security_iprule_settings_write','security',NULL,'module'),(113,'security_file_verifier_sign','security',NULL,'module'),(114,'security_file_verifier_collect','security',NULL,'module'),(115,'security_file_verifier_verify','security',NULL,'module'),(116,'security_antivirus_settings_write','security',NULL,'module'),(117,'security_frame_settings_write','security',NULL,'module'),(118,'seo_settings','seo','','module'),(119,'seo_tools','seo','','module');
/*!40000 ALTER TABLE `b_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_option`
--

DROP TABLE IF EXISTS `b_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `VALUE` mediumtext DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_option`
--

LOCK TABLES `b_option` WRITE;
/*!40000 ALTER TABLE `b_option` DISABLE KEYS */;
INSERT INTO `b_option` VALUES ('blog','socNetNewPerms','Y',NULL,NULL),('fileman','different_set','Y',NULL,NULL),('fileman','GROUP_DEFAULT_TASK','18',NULL,NULL),('fileman','stickers_use_hotkeys','N',NULL,NULL),('fileman','use_editor_3','Y',NULL,NULL),('fileman','use_pspell','N',NULL,NULL),('forum','FILTER','N',NULL,NULL),('iblock','use_htmledit','Y',NULL,NULL),('landing','pub_path_s1','/lp/',NULL,NULL),('location','address_format_code','RU',NULL,NULL),('main','~crypto_b_socialservices_user','a:2:{s:7:\"OATOKEN\";b:1;s:13:\"REFRESH_TOKEN\";b:1;}',NULL,NULL),('main','~crypto_b_user_auth_code','a:1:{s:10:\"OTP_SECRET\";b:1;}',NULL,NULL),('main','~crypto_b_user_phone_auth','a:1:{s:10:\"OTP_SECRET\";b:1;}',NULL,NULL),('main','~mp24_paid','',NULL,NULL),('main','~mp24_paid_date','',NULL,NULL),('main','~new_license18_0_sign','Y',NULL,NULL),('main','~PARAM_CLIENT_LANG','ru',NULL,NULL),('main','~PARAM_COMPOSITE','N',NULL,NULL),('main','~PARAM_FINISH_DATE','dd73f0c71642411ac980e6dd147b0f281025ee86d1c4306c6e064c665918297e.2024-03-07',NULL,NULL),('main','~PARAM_MAX_SERVERS','2',NULL,NULL),('main','~PARAM_MAX_USERS','9430b56725461dbdcfa6038218c14218b8aef8503d547b2556f50b173b62ec19.0',NULL,NULL),('main','~PARAM_PARTNER_ID','',NULL,NULL),('main','~PARAM_PHONE_SIP','N',NULL,NULL),('main','~support_finish_date','2024-03-07',NULL,NULL),('main','~update_autocheck_result','a:4:{s:10:\"check_date\";i:1709108040;s:6:\"result\";b:0;s:5:\"error\";s:0:\"\";s:7:\"modules\";a:0:{}}',NULL,NULL),('main','admin_lid','ru',NULL,NULL),('main','admin_passwordh','FVgQe2YUBgUtCUVcAxcPCgsTAQ==',NULL,NULL),('main','component_cache_on','Y',NULL,NULL),('main','control_file_duplicates','Y',NULL,NULL),('main','email_from','enot07142004@gmail.com',NULL,NULL),('main','GROUP_DEFAULT_TASK','1',NULL,NULL),('main','last_mp_modules_result','a:4:{s:10:\"check_date\";i:1711002312;s:13:\"update_module\";a:0:{}s:10:\"end_update\";a:0:{}s:10:\"new_module\";a:0:{}}',NULL,NULL),('main','optimize_css_files','Y',NULL,NULL),('main','optimize_js_files','Y',NULL,NULL),('main','PARAM_MAX_SITES','0',NULL,NULL),('main','PARAM_MAX_USERS','0',NULL,NULL),('main','rating_assign_authority_group','4',NULL,NULL),('main','rating_assign_authority_group_add','2',NULL,NULL),('main','rating_assign_authority_group_delete','2',NULL,NULL),('main','rating_assign_rating_group','3',NULL,NULL),('main','rating_assign_rating_group_add','1',NULL,NULL),('main','rating_assign_rating_group_delete','1',NULL,NULL),('main','rating_assign_type','auto',NULL,NULL),('main','rating_authority_rating','2',NULL,NULL),('main','rating_authority_weight_formula','Y',NULL,NULL),('main','rating_community_authority','30',NULL,NULL),('main','rating_community_last_visit','90',NULL,NULL),('main','rating_community_size','1',NULL,NULL),('main','rating_count_vote','10',NULL,NULL),('main','rating_normalization','10',NULL,NULL),('main','rating_normalization_type','auto',NULL,NULL),('main','rating_self_vote','Y',NULL,NULL),('main','rating_start_authority','3',NULL,NULL),('main','rating_text_like_d','Это нравится',NULL,NULL),('main','rating_text_like_n','Не нравится',NULL,NULL),('main','rating_text_like_y','Нравится',NULL,NULL),('main','rating_vote_show','Y',NULL,NULL),('main','rating_vote_template','like',NULL,NULL),('main','rating_vote_type','like',NULL,NULL),('main','rating_vote_weight','10',NULL,NULL),('main','secure_logout','Y',NULL,NULL),('main','server_uniq_id','speo5fr0qhcdkjn3fm16cryrk9v60nht',NULL,NULL),('main','signer_default_key','2955f086765ec019eb593834bf4373d57ab51da9c8c2ed2d2e39d003936a9dfba4598757ef10c0242d7fa155761faaf0587ad330b35df096462b70101c3ba64a',NULL,NULL),('main','site_checker_success','N',NULL,NULL),('main','smile_last_update','1707304479',NULL,NULL),('main','update_site','www.1c-bitrix.ru',NULL,NULL),('main','update_site_ns','Y',NULL,NULL),('main','update_system_check','28.02.2024 11:17:29',NULL,NULL),('main','update_system_update','28.02.2024 11:14:00',NULL,NULL),('main','vendor','1c_bitrix',NULL,NULL),('main','wizard_firstcorp_furniture_s1','Y',NULL,NULL),('messageservice','clean_up_period','14',NULL,NULL),('rest','app_immune','[\"infoservice.migrator_amocrm\",\"informunity.excel\",\"integrations24ru.pipedrive\",\"integrations24ru.asana\",\"integrations24ru.sugar\",\"bitrix.eshop\",\"bitrix.1cdoc\",\"bitrix.assistant\",\"bitrix.denominationby\",\"bitrix.propertiesbot\",\"bitrix.giphybot\",\"bitrix.1c\",\"bitrix.restapi\",\"bitrix.partnerlandingexport\",\"bitrix.partnerapplication\",\"bitrix.partnerlanding\",\"bitrix.1ctotal\",\"integrations24.pipedrive\",\"integrations24ru.pipedrive\",\"integrations24.zoho\",\"integrations24.asana\",\"integrations24ru.asana\",\"integrations24.sugar\",\"integrations24ru.sugar\",\"integrations24.jira_migration\",\"integrations24.qbinventory\",\"integrations24.zohoinventory\",\"integrations24.trello\",\"integrations24ru.slack_migration\",\"SEVERCODE.trello_migrator\",\"htmls.ms_migrator\",\"integrations24.mns_kazakhstan_poisk_po_bin\",\"integrations24.portal_nalog_gov_by\",\"integrations24ru.microsoft_teams_migration\",\"bitrix.pbi_all\",\"bitrix.pbi_company\",\"bitrix.pbi_company_uf\",\"bitrix.pbi_contact\",\"bitrix.pbi_contact_uf\",\"bitrix.pbi_crm_activity\",\"bitrix.pbi_deal_product_row\",\"bitrix.pbi_deal_stage_history\",\"bitrix.pbi_deals_ru\",\"bitrix.pbi_lead\",\"bitrix.pbi_lead_product_row\",\"bitrix.pbi_lead_uf\",\"bitrix.pbi_leads_ru\",\"bitrix.pbi_socialnetwork_group\",\"bitrix.pbi_telephony\",\"bitrix.pbi_user\",\"bitrix.gds_all\",\"bitrix.gds_company\",\"bitrix.gds_company_uf\",\"bitrix.gds_contact\",\"bitrix.gds_contact_uf\",\"bitrix.gds_crm_activity\",\"bitrix.gds_deal_product_row\",\"bitrix.gds_deal_stage_history\",\"bitrix.gds_deals_ru\",\"bitrix.gds_lead\",\"bitrix.gds_lead_product_row\",\"bitrix.gds_lead_uf\",\"bitrix.gds_leads_ru\",\"bitrix.gds_socialnetwork_group\",\"bitrix.gds_telephony\",\"bitrix.gds_user\",\"bitrix.gds_activity\",\"bitrix.gds_deal_uf\",\"bitrix.gds_telephony_call\",\"itsolutionru.gptconnector\",\"asmo.ai\",\"bitrix.bic_datasets_en\",\"bitrix.bic_datasets_kz\",\"bitrix.bic_datasets_ru\",\"bitrix.bic_deals_en\",\"bitrix.bic_deals_kz\",\"bitrix.bic_deals_ru\",\"bitrix.bic_leads_en\",\"bitrix.bic_leads_kz\",\"bitrix.bic_leads_ru\",\"bitrix.bic_sales_en\",\"bitrix.bic_sales_kz\",\"bitrix.bic_sales_ru\",\"bitrix.bic_sales_struct_en\",\"bitrix.bic_sales_struct_kz\",\"bitrix.bic_sales_struct_ru\",\"bitrix.bic_telephony_en\",\"bitrix.bic_telephony_kz\",\"bitrix.bic_telephony_ru\",\"bitrix.bic_deals_complex\",\"bitrix.bic_general_stat\",\"bitrix.bic_lead_generation\",\"bitrix.kompleksnaya_analitika_sdelok\",\"bitrix.bic_telephony_ru\",\"bitrix.bic_sales_struct_ru\",\"bitrix.bic_sales_ru\",\"bitrix.bic_leads_ru\",\"bitrix.bic_deals_ru\",\"bitrix.bic_datasets_ru\",\"bitrix.bic_datasets_en\",\"bitrix.bic_deals_en\",\"bitrix.bic_leads_en\",\"bitrix.bic_sales_en\",\"bitrix.bic_sales_struct_en\",\"bitrix.bic_telephony_en\",\"bitrix.bic_datasets_kz\",\"bitrix.bic_deals_kz\",\"bitrix.bic_leads_kz\",\"bitrix.bic_sales_kz\",\"bitrix.bic_sales_struct_kz\",\"bitrix.bic_telephony_kz\",\"bitrix.bic_deals_complex\",\"bitrix.bic_general_stat\",\"bitrix.bic_lead_generation\",\"bitrix.bic_retention\",\"bitrix.bic_abcanalysis\",\"bitrix.khellouin_ru\",\"bitrix.den_zashchitnika_otechestva_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ua\",\"bitrix.den_smekha_ua\",\"bitrix.den_svyatogo_valentina_ua\",\"bitrix.den_vsekh_vlyublyennykh_ua\",\"bitrix.katolicheskaya_paskha_ua\",\"bitrix.novyy_god_ua\",\"bitrix.rozhdestvo_ua\",\"bitrix.valentinov_den_ua\",\"bitrix.pravoslavnaya_paskha_ua\",\"bitrix.chernaya_pyatnitsa_ua\",\"bitrix.khellouin_ua\",\"bitrix.den_zashchitnika_otechestva_3_ru\",\"bitrix.den_zashchitnika_otechestva_ru\",\"bitrix.den_zashchitnika_otechestva_by\",\"bitrix.den_zashchitnika_otechestva_2_by\",\"bitrix.den_zashchitnika_otechestva_3_by\",\"bitrix.den_zashchitnika_otechestva_kz\",\"bitrix.den_zashchitnika_otechestva_2_kz\",\"bitrix.den_zashchitnika_otechestva_3_kz\",\"bitrix.pravoslavnaya_paskha_ru\",\"bitrix.pravoslavnaya_paskha_by\",\"bitrix.pravoslavnaya_paskha_kz\",\"bitrix.den_smekha_ru\",\"bitrix.den_smekha_by\",\"bitrix.den_smekha_kz\",\"bitrix.valentinov_den_ru\",\"bitrix.valentinov_den_by\",\"bitrix.valentinov_den_kz\",\"bitrix.rozhdestvo_ru\",\"bitrix.rozhdestvo_by\",\"bitrix.rozhdestvo_kz\",\"bitrix.novyy_god_ru\",\"bitrix.novyy_god_by\",\"bitrix.novyy_god_kz\",\"bitrix.katolicheskaya_paskha_ru\",\"bitrix.katolicheskaya_paskha_by\",\"bitrix.katolicheskaya_paskha_kz\",\"bitrix.den_vsekh_vlyublyennykh_ru\",\"bitrix.den_vsekh_vlyublyennykh_by\",\"bitrix.den_vsekh_vlyublyennykh_kz\",\"bitrix.den_svyatogo_valentina_ru\",\"bitrix.den_svyatogo_valentina_by\",\"bitrix.den_svyatogo_valentina_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_kz\",\"bitrix.thanksgiving_day_en\",\"bitrix.april_fools_day_en\",\"bitrix.valentine_s_day_en\",\"bitrix.valentine_s_day_2_en\",\"bitrix.valentine_s_day_3_en\",\"bitrix.chernaya_pyatnitsa_ru\",\"bitrix.chernaya_pyatnitsa_by\",\"bitrix.chernaya_pyatnitsa_kz\",\"bitrix.khellouin_by\",\"bitrix.khellouin_kz\",\"bitrix.easter_en\",\"bitrix.halloween_en\",\"bitrix.christmas_en\",\"bitrix.new_year_en\",\"bitrix.black_friday_en\",\"bitrix.kraytvirtualtravel_ru\",\"bitrix.kraytvirtualtravel_by\",\"bitrix.kraytvirtualtravel_kz\",\"bitrix.kraytvirtualtravel_ua\",\"bitrix.kraytnutritionist_ru\",\"bitrix.kraytnutritionist_by\",\"bitrix.delobotcorporatetraining_en\",\"bitrix.delobotblackfriday_en\",\"bitrix.delobotcleaningcompany_en\",\"bitrix.delobotfitness_en\",\"bitrix.delobotfooddelivery_en\",\"bitrix.delobotvisagiste_en\",\"bitrix.delobotpsychologist_en\",\"bitrix.delobotflorist_en\",\"bitrix.delobotdecoration_en\",\"bitrix.delobotcarservice_en\",\"bitrix.kraytagency_en\",\"bitrix.kraytagriculture_en\",\"bitrix.kraytarchitecture_en\",\"bitrix.kraytbusiness_en\",\"bitrix.kraytdelivery_en\",\"bitrix.kraytevents_en\",\"bitrix.kraythalloween_en\",\"bitrix.kraytvetclinic_en\",\"bitrix.kraytmasterforhour_en\",\"bitrix.kraytinstagramcontacts_en\",\"bitrix.kraytinstagramstock_en\",\"bitrix.kraytinstagramtarget_en\",\"bitrix.kraytonlinebabysitter_en\",\"bitrix.kraytpetservice_en\",\"bitrix.kraytsolarenergy_en\",\"bitrix.kraytsportonline_en\",\"bitrix.kraytsummersale_en\",\"bitrix.krayttravelblog_en\",\"bitrix.kraytvebinar_en\",\"bitrix.kraytartificialintelligence_en\",\"bitrix.kraytbakeryproducts_en\",\"bitrix.kraytchildrensschool_en\",\"bitrix.kraytfooddelivery_en\",\"bitrix.kraytfurniture_en\",\"bitrix.kraytvirtualtravel_en\",\"bitrix.kraytyoutubechannel_en\",\"bitrix.kraytknitting_en\",\"bitrix.kraytnutritionist_en\",\"bitrix.kraytnailservice_en\",\"bitrix.kraytmedicine_en\",\"bitrix.kraytprofipage_en\",\"bitrix.kraytsale11_en\",\"bitrix.delobotblackfriday_ua\",\"bitrix.delobotcleaning_ua\",\"bitrix.delobotcorporatetraining_ua\",\"bitrix.delobotfitness_ua\",\"bitrix.delobotfooddelivery_ua\",\"bitrix.delobotvisagiste_ua\",\"bitrix.kraytagency_ua\",\"bitrix.kraytagriculture_ua\",\"bitrix.kraytarchitecture_ua\",\"bitrix.kraytbusiness_ua\",\"bitrix.kraytevents_ua\",\"bitrix.kraythalloween_ua\",\"bitrix.kraytinstagramcontacts_ua\",\"bitrix.kraytinstagramstock_ua\",\"bitrix.kraytinstagramtarget_ua\",\"bitrix.kraytpetservice_ua\",\"bitrix.kraytsolarenergy_ua\",\"bitrix.kraytsummersale_ua\",\"bitrix.krayttravelblog_ua\",\"bitrix.kraytvebinar_ua\",\"bitrix.kraytvetclinic_ua\",\"bitrix.kraytnutritionist_ua\",\"bitrix.kraytnutritionist_kz\",\"bitrix.kraytfurniture_by\",\"bitrix.kraytfurniture_ru\",\"bitrix.kraytfurniture_kz\",\"bitrix.kraytfurniture_ua\",\"bitrix.kraytmedicine_ru\",\"bitrix.kraytmedicine_by\",\"bitrix.kraytmedicine_kz\",\"bitrix.kraytmedicine_ua\",\"bitrix.kraytsale11_ru\",\"bitrix.kraytsale11_by\",\"bitrix.kraytsale11_kz\",\"bitrix.kraytsale11_ua\",\"bitrix.kraytnailservice_ru\",\"bitrix.kraytnailservice_by\",\"bitrix.kraytnailservice_kz\",\"bitrix.kraytnailservice_ua\",\"bitrix.kraytknitting_ru\",\"bitrix.kraytknitting_by\",\"bitrix.kraytknitting_kz\",\"bitrix.kraytknitting_ua\",\"bitrix.kraytfooddelivery_ru\",\"bitrix.kraytfooddelivery_by\",\"bitrix.kraytfooddelivery_kz\",\"bitrix.kraytfooddelivery_ua\",\"bitrix.kraytbakeryproducts_ru\",\"bitrix.kraytbakeryproducts_by\",\"bitrix.kraytbakeryproducts_kz\",\"bitrix.kraytbakeryproducts_ua\",\"bitrix.kraytschoolmusic_ru\",\"bitrix.kraytschoolmusic_by\",\"bitrix.kraytschoolmusic_kz\",\"bitrix.kraytschoolmusic_ua\",\"bitrix.kraytautomechanic_ru\",\"bitrix.kraytautomechanic_by\",\"bitrix.kraytautomechanic_kz\",\"bitrix.kraytautomechanic_ua\",\"bitrix.kraytpresents_ru\",\"bitrix.kraytpresents_by\",\"bitrix.kraytpresents_kz\",\"bitrix.kraytpresents_ua\",\"bitrix.kraytportfoliophotographer_ru\",\"bitrix.kraytportfoliophotographer_by\",\"bitrix.kraytportfoliophotographer_kz\",\"bitrix.kraytportfoliophotographer_ua\",\"bitrix.kraytcrm_ru\",\"bitrix.delobotcleaningcompany_ru\",\"bitrix.delobotblackfriday_ru\",\"bitrix.delobotblackfriday_by\",\"bitrix.delobotblackfriday_kz\",\"bitrix.delobotcleaningcompany_by\",\"bitrix.delobotcleaningcompany_kz\",\"bitrix.delobotcorporatetraining_ru\",\"bitrix.delobotcorporatetraining_by\",\"bitrix.delobotcorporatetraining_kz\",\"bitrix.delobotfitness_ru\",\"bitrix.delobotfitness_by\",\"bitrix.delobotfitness_kz\",\"bitrix.delobotfooddelivery_ru\",\"bitrix.delobotfooddelivery_by\",\"bitrix.delobotfooddelivery_kz\",\"bitrix.delobotvisagiste_ru\",\"bitrix.delobotvisagiste_by\",\"bitrix.delobotvisagiste_kz\",\"bitrix.delobotgiftsforwomensday_ru\",\"bitrix.delobotgiftsforwomensday_by\",\"bitrix.delobotgiftsforwomensday_kz\",\"bitrix.delobotgiftsforwomensday_ua\",\"bitrix.delobotwebdesigner_ru\",\"bitrix.delobotwebdesigner_by\",\"bitrix.delobotwebdesigner_kz\",\"bitrix.delobotwebdesigner_ua\",\"bitrix.delobotatelier_ru\",\"bitrix.delobotatelier_by\",\"bitrix.delobotatelier_kz\",\"bitrix.delobotatelier_ua\",\"bitrix.delobotconstructioncompany_ru\",\"bitrix.delobotconstructioncompany_by\",\"bitrix.delobotconstructioncompany_ua\",\"bitrix.delobotlanguageschool_ru\",\"bitrix.delobotlanguageschool_by\",\"bitrix.delobotlanguageschool_kz\",\"bitrix.delobotlanguageschool_ua\",\"bitrix.delobotcoffee_ru\",\"bitrix.delobotcoffee_by\",\"bitrix.delobotcoffee_kz\",\"bitrix.delobotcoffee_ua\",\"bitrix.kraytcrm_by\",\"bitrix.kraytcrm_kz\",\"bitrix.kraytcrm_ua\",\"bitrix.kraytonlinebabysitter_ru\",\"bitrix.kraytonlinebabysitter_by\",\"bitrix.kraytonlinebabysitter_kz\",\"bitrix.kraytonlinebabysitter_uaa\",\"bitrix.kraytsportonline_ru\",\"bitrix.kraytsportonline_by\",\"bitrix.kraytsportonline_kz\",\"bitrix.kraytsportonline_ua\",\"bitrix.kraytmasterforhour_ru\",\"bitrix.kraytmasterforhour_by\",\"bitrix.kraytmasterforhour_kz\",\"bitrix.kraytmasterforhour_ua\",\"bitrix.kraytdelivery_ru\",\"bitrix.kraytdelivery_by\",\"bitrix.kraytdelivery_kz\",\"bitrix.kraytdelivery_ua\",\"bitrix.kraytrepairservice_ru\",\"bitrix.kraytrepairservice_by\",\"bitrix.kraytrepairservice_kz\",\"bitrix.kraytrepairservice_ua\",\"bitrix.kraytprofipage_ru\",\"bitrix.kraytprofipage_by\",\"bitrix.kraytprofipage_kz\",\"bitrix.kraytprofipage_ua\",\"bitrix.krayttutor_ru\",\"bitrix.krayttutor_by\",\"bitrix.krayttutor_kz\",\"bitrix.krayttutor_ua\",\"bitrix.kraytartificialintelligence_ru\",\"bitrix.kraytartificialintelligence_by\",\"bitrix.kraytartificialintelligence_kz\",\"bitrix.kraytartificialintelligence_ua\",\"bitrix.kraytyoutubechannel_ru\",\"bitrix.kraytyoutubechannel_by\",\"bitrix.kraytyoutubechannel_kz\",\"bitrix.kraytyoutubechannel_ua\",\"bitrix.kraytchildrensschool_ru\",\"bitrix.kraytchildrensschool_by\",\"bitrix.kraytchildrensschool_kz\",\"bitrix.kraytchildrensschool_ua\",\"bitrix.krayttravelagency_ru\",\"bitrix.krayttravelagency_by\",\"bitrix.krayttravelagency_kz\",\"bitrix.krayttravelagency_ua\",\"bitrix.krayttranslator_ru\",\"bitrix.krayttranslator_by\",\"bitrix.krayttranslator_kz\",\"bitrix.krayttranslator_ua\",\"bitrix.kraytstylist_ru\",\"bitrix.kraytstylist_by\",\"bitrix.kraytstylist_kz\",\"bitrix.kraytstylist_ua\",\"bitrix.kraytstretchingstudio_ru\",\"bitrix.kraytstretchingstudio_by\",\"bitrix.kraytstretchingstudio_kz\",\"bitrix.kraytstretchingstudio_ua\",\"bitrix.kraytsportschool_ru\",\"bitrix.kraytsportschool_by\",\"bitrix.kraytsportschool_kz\",\"bitrix.kraytsportschool_ua\",\"bitrix.kraytsitedesigner_ru\",\"bitrix.kraytsitedesigner_by\",\"bitrix.kraytsitedesigner_kz\",\"bitrix.kraytsitedesigner_ua\",\"bitrix.kraytsport_ru\",\"bitrix.kraytsport_by\",\"bitrix.kraytsport_kz\",\"bitrix.kraytsport_ua\",\"bitrix.kraytmobileapp_ru\",\"bitrix.kraytmobileapp_by\",\"bitrix.kraytmobileapp_kz\",\"bitrix.kraytmobileapp_ua\",\"bitrix.kraytrealestate_ru\",\"bitrix.kraytrealestate_by\",\"bitrix.kraytrealestate_kz\",\"bitrix.kraytrealestate_ua\",\"bitrix.delobotnewyearsale_ru\",\"bitrix.delobotnewyearsale_by\",\"bitrix.delobotnewyearsale_kz\",\"bitrix.delobotnewyearsale_ua\",\"bitrix.delobotyoga_ru\",\"bitrix.delobotyoga_by\",\"bitrix.delobotyoga_kz\",\"bitrix.delobotyoga_ua\",\"bitrix.delobotcake_ru\",\"bitrix.delobotcake_by\",\"bitrix.delobotcake_kz\",\"bitrix.delobotcake_ua\",\"bitrix.delobotveterinarian_ru\",\"bitrix.delobotveterinarian_by\",\"bitrix.delobotveterinarian_kz\",\"bitrix.delobotveterinarian_ua\",\"bitrix.delobotpsychologist_ru\",\"bitrix.delobotpsychologist_by\",\"bitrix.delobotpsychologist_kz\",\"bitrix.delobotpsychologist_ua\",\"bitrix.delobotdecoration_ru\",\"bitrix.delobotdecoration_by\",\"bitrix.delobotdecoration_kz\",\"bitrix.delobotdecoration_ua\",\"bitrix.delobotflorist_ru\",\"bitrix.delobotflorist_by\",\"bitrix.delobotflorist_kz\",\"bitrix.delobotflorist_ua\",\"bitrix.delobotcarservice_ru\",\"bitrix.delobotcarservice_by\",\"bitrix.delobotcarservice_kz\",\"bitrix.delobotcarservice_ua\",\"bitrix.delobotcargotransportation_ru\",\"bitrix.delobotcargotransportation_by\",\"bitrix.delobotcargotransportation_kz\",\"bitrix.delobotcargotransportation_ua\",\"bitrix.delobotrealtor_ru\",\"bitrix.delobotrealtor_by\",\"bitrix.delobotrealtor_kz\",\"bitrix.delobotrealtor_ua\",\"bitrix.delobotfurnituremanufacturing_ru\",\"bitrix.delobotfurnituremanufacturing_by\",\"bitrix.delobotfurnituremanufacturing_kz\",\"bitrix.delobotfurnituremanufacturing_ua\",\"bitrix.delobotorganizationofholidays_ru\",\"bitrix.delobotorganizationofholidays_by\",\"bitrix.delobotorganizationofholidays_kz\",\"bitrix.delobotorganizationofholidays_ua\",\"bitrix.delobotconcertannounce_ru\",\"bitrix.delobotconcertannounce_by\",\"bitrix.delobotconcertannounce_kz\",\"bitrix.delobotconcertannounce_ua\",\"bitrix.delobotphotographersservice_ru\",\"bitrix.delobotphotographersservice_by\",\"bitrix.delobotphotographersservice_kz\",\"bitrix.delobotphotographersservice_ua\",\"bitrix.kraytsecurityagency_ru\",\"bitrix.kraytsecurityagency_by\",\"bitrix.kraytsecurityagency_kz\",\"bitrix.kraytsecurityagency_ua\",\"bitrix.kraytrecordingstudio_ru\",\"bitrix.kraytrecordingstudio_by\",\"bitrix.kraytrecordingstudio_kz\",\"bitrix.kraytrecordingstudio_ua\",\"bitrix.kraytrealestateagent_ru\",\"bitrix.kraytrealestateagent_by\",\"bitrix.kraytrealestateagent_kz\",\"bitrix.kraytrealestateagent_ua\",\"bitrix.delobotdecorationhouses_ru\",\"bitrix.delobotdecorationhouses_by\",\"bitrix.delobotdecorationhouses_kz\",\"bitrix.delobotdecorationhouses_ua\",\"bitrix.delobotairconditioners_ru\",\"bitrix.delobotairconditioners_by\",\"bitrix.delobotairconditioners_kz\",\"bitrix.delobotairconditioners_ua\",\"bitrix.delobotdesignworkshop_ru\",\"bitrix.delobotdesignworkshop_by\",\"bitrix.delobotdesignworkshop_kz\",\"bitrix.delobotdesignworkshop_ua\",\"bitrix.delobotcitygreeningproject_ru\",\"bitrix.delobotcitygreeningproject_by\",\"bitrix.delobotcitygreeningproject_kz\",\"bitrix.delobotcitygreeningproject_ua\",\"bitrix.delobotecoproducts_ru\",\"bitrix.delobotecoproducts_by\",\"bitrix.delobotecoproducts_kz\",\"bitrix.delobotecoproducts_ua\",\"bitrix.delobotsoundrecordingservices_ru\",\"bitrix.delobotsoundrecordingservices_by\",\"bitrix.delobotsoundrecordingservices_kz\",\"bitrix.delobotsoundrecordingservices_ua\",\"bitrix.delobotsecurityservice_ru\",\"bitrix.delobotsecurityservice_by\",\"bitrix.delobotsecurityservice_kz\",\"bitrix.delobotsecurityservice_ua\",\"bitrix.delobotsportschool_ru\",\"bitrix.delobotsportschool_by\",\"bitrix.delobotsportschool_kz\",\"bitrix.delobotsportschool_ua\",\"bitrix.delobotfamilyleisure_ru\",\"bitrix.delobotfamilyleisure_by\",\"bitrix.delobotfamilyleisure_kz\",\"bitrix.delobotfamilyleisure_ua\",\"bitrix.delobotdoctortherapist_ru\",\"bitrix.delobotdoctortherapist_by\",\"bitrix.delobotdoctortherapist_kz\",\"bitrix.delobotdoctortherapist_ua\",\"bitrix.kraytagency_ru\",\"bitrix.kraytagency_by\",\"bitrix.kraytagency_kz\",\"bitrix.kraytarchitecture_ru\",\"bitrix.kraytarchitecture_by\",\"bitrix.kraytarchitecture_kz\",\"bitrix.kraytagriculture_ru\",\"bitrix.kraytagriculture_by\",\"bitrix.kraytagriculture_kz\",\"bitrix.kraytbusiness_ru\",\"bitrix.kraytbusiness_by\",\"bitrix.kraytbusiness_kz\",\"bitrix.kraytevents_ru\",\"bitrix.kraytevents_by\",\"bitrix.kraytevents_kz\",\"bitrix.kraythalloween_ru\",\"bitrix.kraythalloween_by\",\"bitrix.kraythalloween_kz\",\"bitrix.kraytinstagramtarget_ru\",\"bitrix.kraytinstagramtarget_by\",\"bitrix.kraytinstagramtarget_kz\",\"bitrix.kraytinstagramcontacts_ru\",\"bitrix.kraytinstagramcontacts_by\",\"bitrix.kraytinstagramcontacts_kz\",\"bitrix.kraytinstagramstock_ru\",\"bitrix.kraytinstagramstock_by\",\"bitrix.kraytinstagramstock_kz\",\"bitrix.kraytpetservice_ru\",\"bitrix.kraytpetservice_by\",\"bitrix.kraytpetservice_kz\",\"bitrix.kraytsolarenergy_ru\",\"bitrix.kraytsolarenergy_by\",\"bitrix.kraytsolarenergy_kz\",\"bitrix.kraytsummersale_ru\",\"bitrix.kraytsummersale_by\",\"bitrix.kraytsummersale_kz\",\"bitrix.krayttravelblog_ru\",\"bitrix.krayttravelblog_by\",\"bitrix.krayttravelblog_kz\",\"bitrix.kraytvebinar_ru\",\"bitrix.kraytvebinar_by\",\"bitrix.kraytvebinar_kz\",\"bitrix.kraytvetclinic_ru\",\"bitrix.kraytvetclinic_by\",\"bitrix.kraytvetclinic_kz\",\"bitrix.kraytrestaurant_ru\",\"bitrix.kraytrestaurant_by\",\"bitrix.kraytrestaurant_kz\",\"bitrix.kraytrestaurant_ua\",\"bitrix.kraytweddingservices_ru\",\"bitrix.kraytweddingservices_by\",\"bitrix.kraytweddingservices_kz\",\"bitrix.kraytweddingservices_ua\",\"bitrix.kraytoptics_ru\",\"bitrix.kraytoptics_by\",\"bitrix.kraytoptics_kz\",\"bitrix.kraytoptics_ua\",\"bitrix.krayt3dprint_ru\",\"bitrix.krayt3dprint_by\",\"bitrix.krayt3dprint_kz\",\"bitrix.krayt3dprint_ua\",\"bitrix.kraytbusinesspremisesdesign_ru\",\"bitrix.kraytbusinesspremisesdesign_by\",\"bitrix.kraytbusinesspremisesdesign_kz\",\"bitrix.kraytbusinesspremisesdesign_ua\",\"bitrix.kraytcentersproject_ru\",\"bitrix.kraytcentersproject_by\",\"bitrix.kraytcentersproject_kz\",\"bitrix.kraytcentersproject_ua\",\"bitrix.kraytcitygreening_ru\",\"bitrix.kraytcitygreening_by\",\"bitrix.kraytcitygreening_kz\",\"bitrix.kraytcitygreening_ua\",\"bitrix.kraytclimatesystems_ru\",\"bitrix.kraytclimatesystems_by\",\"bitrix.kraytclimatesystems_kz\",\"bitrix.kraytclimatesystems_ua\",\"bitrix.kraytclinicmomandbaby_ru\",\"bitrix.kraytclinicmomandbaby_by\",\"bitrix.kraytclinicmomandbaby_kz\",\"bitrix.kraytclinicmomandbaby_ua\",\"bitrix.kraytdesignerclothing_ru\",\"bitrix.kraytdesignerclothing_by\",\"bitrix.kraytdesignerclothing_kz\",\"bitrix.kraytdesignerclothing_ua\",\"bitrix.kraytprivatedoctor_ru\",\"bitrix.kraytprivatedoctor_by\",\"bitrix.kraytprivatedoctor_kz\",\"bitrix.kraytprivatedoctor_ua\",\"bitrix.kraytprintinghouse_ru\",\"bitrix.kraytprintinghouse_by\",\"bitrix.kraytprintinghouse_kz\",\"bitrix.kraytprintinghouse_ua\",\"bitrix.kraytpersonalcoach_ru\",\"bitrix.kraytpersonalcoach_by\",\"bitrix.kraytpersonalcoach_kz\",\"bitrix.kraytpersonalcoach_ua\",\"bitrix.kraytperfumer_ru\",\"bitrix.kraytperfumer_by\",\"bitrix.kraytperfumer_kz\",\"bitrix.kraytperfumer_ua\",\"bitrix.kraytnewsblog_ru\",\"bitrix.kraytnewsblog_by\",\"bitrix.kraytnewsblog_kz\",\"bitrix.kraytnewsblog_ua\",\"bitrix.kraytmakeupstudio_ru\",\"bitrix.kraytmakeupstudio_by\",\"bitrix.kraytmakeupstudio_kz\",\"bitrix.kraytmakeupstudio_ua\",\"bitrix.kraytlawyer_ru\",\"bitrix.kraytlawyer_by\",\"bitrix.kraytlawyer_kz\",\"bitrix.kraytlawyer_ua\",\"bitrix.kraytlandscapedesign_ru\",\"bitrix.kraytlandscapedesign_by\",\"bitrix.kraytlandscapedesign_kz\",\"bitrix.kraytlandscapedesign_ua\",\"bitrix.kraytjewelryrepairshop_ru\",\"bitrix.kraytjewelryrepairshop_by\",\"bitrix.kraytjewelryrepairshop_kz\",\"bitrix.kraytjewelryrepairshop_ua\",\"bitrix.kraytinteriordesign_ru\",\"bitrix.kraytinteriordesign_by\",\"bitrix.kraytinteriordesign_kz\",\"bitrix.kraytinsurancecompany_ru\",\"bitrix.kraytinsurancecompany_kz\",\"bitrix.kraytinsurancecompany_ua\",\"bitrix.kraytillustrator_ru\",\"bitrix.kraytillustrator_by\",\"bitrix.kraytillustrator_kz\",\"bitrix.kraytillustrator_ua\",\"bitrix.kraytgiftsvalentineday_ru\",\"bitrix.kraytgiftsvalentineday_by\",\"bitrix.kraytgiftsvalentineday_kz\",\"bitrix.kraytgiftsvalentineday_ua\",\"bitrix.kraytfebruary23_ru\",\"bitrix.kraytfebruary23_by\",\"bitrix.kraytfebruary23_kz\",\"bitrix.kraytfebruary23_ua\",\"bitrix.kraytequipmentrepair_ru\",\"bitrix.kraytequipmentrepair_by\",\"bitrix.kraytequipmentrepair_kz\",\"bitrix.kraytequipmentrepair_ua\",\"bitrix.kraytdentistry_ru\",\"bitrix.kraytdentistry_by\",\"bitrix.kraytdentistry_kz\",\"bitrix.kraytdentistry_ua\",\"bitrix.kraytdancemarathon_ru\",\"bitrix.kraytdancemarathon_by\",\"bitrix.kraytdancemarathon_kz\",\"bitrix.kraytdancemarathon_ua\",\"bitrix.kraytcourseformothers_ru\",\"bitrix.kraytcourseformothers_by\",\"bitrix.kraytcourseformothers_kz\",\"bitrix.kraytcourseformothers_ua\",\"bitrix.kraytcosmetologist_ru\",\"bitrix.kraytcosmetologist_by\",\"bitrix.kraytcosmetologist_kz\",\"bitrix.kraytcosmetologist_ua\",\"bitrix.kraytconstructionofprivatehouses_ru\",\"bitrix.kraytconstructionofprivatehouses_by\",\"bitrix.kraytconstructionofprivatehouses_kz\",\"bitrix.kraytconstructionofprivatehouses_ua\",\"bitrix.kraytconfectionery_ru\",\"bitrix.kraytconfectionery_by\",\"bitrix.kraytconfectionery_kz\",\"bitrix.kraytconfectionery_ua\",\"bitrix.kraytcoffeehouse_ru\",\"bitrix.kraytcoffeehouse_by\",\"bitrix.kraytcoffeehouse_kz\",\"bitrix.kraytcoffeehouse_ua\",\"bitrix.kraytcleaningservice_ru\",\"bitrix.kraytcleaningservice_by\",\"bitrix.kraytcleaningservice_kz\",\"bitrix.kraytcleaningservice_ua\",\"bitrix.kraytbeautystudio_ru\",\"bitrix.kraytbeautystudio_by\",\"bitrix.kraytbeautystudio_kz\",\"bitrix.kraytbeautystudio_ua\",\"bitrix.kraytbarbershop_ru\",\"bitrix.kraytbarbershop_by\",\"bitrix.kraytartworkshop_by\",\"bitrix.kraytbarbershop_kz\",\"bitrix.kraytbarbershop_ua\",\"bitrix.kraytartworkshop_ru\",\"bitrix.kraytartworkshop_kz\",\"bitrix.kraytartworkshop_ua\",\"bitrix.kraytaprilfoolsdaygifts_ru\",\"bitrix.kraytaprilfoolsdaygifts_by\",\"bitrix.kraytaprilfoolsdaygifts_kz\",\"bitrix.kraytaprilfoolsdaygifts_ua\",\"bitrix.kraytwindowinstallation_ru\",\"bitrix.kraytwindowinstallation_by\",\"bitrix.kraytwindowinstallation_kz\",\"bitrix.kraytwindowinstallation_ua\",\"bitrix.kraytwindowdesign_ru\",\"bitrix.kraytwindowdesign_by\",\"bitrix.kraytwindowdesign_kz\",\"bitrix.kraytwindowdesign_ua\",\"bitrix.krayttelecommunications_ru\",\"bitrix.krayttelecommunications_by\",\"bitrix.krayttelecommunications_kz\",\"bitrix.krayttelecommunications_ua\",\"bitrix.kraytsportsnutritionorder_ru\",\"bitrix.kraytsportsnutritionorder_by\",\"bitrix.kraytsportsnutritionorder_kz\",\"bitrix.kraytsportsnutritionorder_ua\",\"bitrix.kraytreconstructionoffices_ru\",\"bitrix.kraytreconstructionoffices_by\",\"bitrix.kraytreconstructionoffices_kz\",\"bitrix.kraytreconstructionoffices_ua\",\"bitrix.kraytpremisestrade_ru\",\"bitrix.kraytpremisestrade_by\",\"bitrix.kraytpremisestrade_ua\",\"bitrix.kraytinsulationhouses_ru\",\"bitrix.kraytinsulationhouses_by\",\"bitrix.kraytinsulationhouses_kz\",\"bitrix.kraytinsulationhouses_ua\",\"bitrix.kraytinstallsecuritysystems_ru\",\"bitrix.kraytinstallsecuritysystems_by\",\"bitrix.kraytinstallsecuritysystems_kz\",\"bitrix.kraytinstallsecuritysystems_ua\",\"bitrix.kraytinstallbathrooms_ru\",\"bitrix.kraytinstallbathrooms_by\",\"bitrix.kraytinstallbathrooms_kz\",\"bitrix.kraytinstallbathrooms_ua\",\"bitrix.kraythousedesign_ru\",\"bitrix.kraythousedesign_by\",\"bitrix.kraythousedesign_kz\",\"bitrix.kraythousedesign_ua\",\"bitrix.kraythospitalforfamily_ru\",\"bitrix.kraythospitalforfamily_by\",\"bitrix.kraythospitalforfamily_kz\",\"bitrix.kraythospitalforfamily_ua\",\"bitrix.kraythomedecoration_ru\",\"bitrix.kraythomedecoration_by\",\"bitrix.kraythomedecoration_kz\",\"bitrix.kraythomedecoration_ua\",\"bitrix.kraytfurniturettransformer_ru\",\"bitrix.kraytfurniturettransformer_by\",\"bitrix.kraytfurniturettransformer_kz\",\"bitrix.kraytfurniturettransformer_ua\",\"bitrix.kraytfloristics_ru\",\"bitrix.kraytfloristics_by\",\"bitrix.kraytfloristics_kz\",\"bitrix.kraytfloristics_ua\",\"bitrix.kraytfestiveevents_ru\",\"bitrix.kraytfestiveevents_by\",\"bitrix.kraytfestiveevents_kz\",\"bitrix.kraytfestiveevents_ua\",\"bitrix.kraytecogreen_ru\",\"bitrix.kraytecogreen_by\",\"bitrix.kraytecogreen_kz\",\"bitrix.kraytecogreen_ua\",\"bitrix.kraytdoorinstallation_ru\",\"bitrix.kraytdoorinstallation_by\",\"bitrix.kraytdoorinstallation_kz\",\"bitrix.kraytdoorinstallation_ua\",\"bitrix.kraytdoordesign_ru\",\"bitrix.kraytdoordesign_by\",\"bitrix.kraytdoordesign_kz\",\"bitrix.kraytdoordesign_ua\",\"bitrix.kraytdesigningpeopledisabilities_ru\",\"bitrix.kraytdesigningpeopledisabilities_by\",\"bitrix.kraytdesigningpeopledisabilities_kz\",\"bitrix.kraytdesigningpeopledisabilities_ua\",\"bitrix.delobotkindergarten_ru\",\"bitrix.kraytvideostudio_ru\",\"bitrix.kraytlegalservices_ru\",\"bitrix.kraytaccountingservices_ru\",\"bitrix.kraytbookannouncement_ru\",\"bitrix.kraytcharity_ru\",\"bitrix.kraytspa_ru\",\"bitrix.kraythandmadecosmetics_ru\",\"bitrix.delobotmusic_ru\",\"bitrix.kraythotelforanimals_ru\",\"bitrix.kraytcityguide_ru\",\"bitrix.delobotfoodblog_ru\",\"bitrix.delobotgamedeveloper_ru\",\"bitrix.delobotrenovationoffices_ru\",\"bitrix.delobotcourses_ru\",\"bitrix.delobotcityb__beautification_ru\",\"bitrix.delobotaidfund_ru\",\"bitrix.delobotnewsblog_ru\",\"bitrix.delobottransportservices_ru\",\"bitrix.delobotguide_ru\",\"bitrix.delobotnnturalcosmetic_ru\",\"bitrix.delobotboutiqueforsale_ru\",\"bitrix.delobotorganizationweddings_ru\",\"bitrix.delobotbeautyandrecreationcenter_ru\",\"bitrix.delobotwriter_ru\",\"bitrix.kraytotel\",\"bitrix.kraytigrovoyklub\",\"bitrix.kraytbazaotdykha\",\"bitrix.kraytkurspotiktoku\",\"bitrix.kraytkadrovoeagenstvo\",\"bitrix.kraytportfoliomodeli\",\"bitrix.kraytminecraftserver\",\"bitrix.kraytigrovayakompaniya\",\"bitrix.delobotuslugivideoproizvodstva\",\"bitrix.delobotportfolioaktera\",\"bitrix.delobotpub\",\"bitrix.delobotminihotel\",\"bitrix.delobotcamping\",\"bitrix.delobotcafe\",\"bitrix.delobotizgotovlenieduxov\",\"bitrix.delobotbuhgalterskoeobslujivanie\",\"bitrix.delobotarendanedvizimosti\",\"bitrix.delobotalternativnayaenergetika\",\"bitrix.delobotagentstvoponaimy\",\"bitrix.kraytpodarkikjenskomydny\",\"bitrix.kraytinstagramcontacts_ru1\",\"bitrix.kraytinstagramstock_ru1\",\"bitrix.kraytinstagramtarget_ru1\",\"bitrix.kraytkhimchistka\",\"bitrix.krayt_detskaya_odezhda_na_zakaz\",\"bitrix.krayt_retsepty_blyud\",\"bitrix.krayt_detskaya_mebel\",\"bitrix.krayt_biblioteka\",\"bitrix.krayt_pitomnik_rasteniy\",\"bitrix.delobot_lawyer\",\"bitrix.delobot_oformlenie_dverey\",\"bitrix.delobot_montaj_dverey\",\"bitrix.delobot_manicure_and_pedicure\",\"bitrix.delobot_printing_services\",\"bitrix.delobot_plants\",\"bitrix.delobot_nutritionist\",\"bitrix.delobot_designer_tableware\",\"bitrix.delobot_montaj_okon\",\"bitrix.delobot_oformlenie_okon\",\"bitrix.krayt_zhurnalist\",\"bitrix.krayt_tato_salon\",\"bitrix.krayt_massajist\",\"bitrix.krayt_consulting\",\"bitrix.krayt_elektromontazh\",\"bitrix.krayt_rezyume_spetsialista\",\"bitrix.kraytportfoliophotographer\",\"bitrix.kraytbeautystudio_en\",\"bitrix.kraytautomechanic_en\",\"bitrix.kraytequipmentrepair_en\",\"bitrix.delobot_furniture_for_children\",\"bitrix.delobot_architectural_projects\",\"bitrix.delobot_scientists_page\",\"bitrix.delobot_tatoo_studio\",\"bitrix.delobot_journalist_resume\",\"bitrix.delobot_leather_goods\",\"bitrix.delobot_dance_marathon\",\"bitrix.krayt_art_gallery\",\"bitrix.krayt_leather_products\",\"bitrix.krayt_scientific_researcher\",\"bitrix.krayt_bureau_of_architecture\",\"bitrix.krayt_jewelry_designer\",\"bitrix.krayt_food_photographer\",\"bitrix.krayt_acting_studio\",\"bitrix.krayt_farm\",\"bitrix.krayt_fashion_blog\",\"bitrix.krayt_birthday_cakes\",\"bitrix.krayt_plussize_fashion\",\"bitrix.krayt_diving\",\"bitrix.krayt_it_services\",\"bitrix.krayt_beauty_blog\",\"bitrix.krayt_aquarium\",\"bitrix.krayt_sport_blog\",\"bitrix.delobot_online_library\",\"bitrix.delobot_diving_center\",\"bitrix.delobot_designer_jewelry\",\"bitrix.delobot_nail_art_course\",\"bitrix.delobot_art_galery\",\"bitrix.delobot_fashion_for_everyone\",\"bitrix.delobot_handmade_chocolate\",\"bitrix.krayt_chocolate_shop\",\"bitrix.krayt_advertising_agency\",\"bitrix.krayt_asian_food\",\"bitrix.krayt_avtorskiy_master_klass\",\"bitrix.krayt_utilizatsiya_otkhodov\",\"bitrix.krayt_italyanskaya_kukhnya\",\"bitrix.krayt_kurs_po_nogtevomu_servisu\",\"bitrix.krayt_begovoy_klub\",\"bitrix.krayt_gornyy_turizm\",\"bitrix.krayt_biznes_prostranstvo\",\"bitrix.krayt_shkola_iskusstv\",\"bitrix.krayt_onlayn_intensiv_inostrannogo_yazyka\",\"bitrix.delobot_reklama_brenda\",\"bitrix.delobot_italyanskiy_restoran\",\"bitrix.delobot_modnaya_stranichka\",\"bitrix.delobot_fotografiya_edy\",\"bitrix.krayt_pishchevoe_proizvodstvo\",\"bitrix.krayt_appetitnyy_blog\",\"bitrix.krayt_uslugi_remonta\",\"bitrix.krayt_onlayn_kurs_kreativnogo_prodyusera\",\"bitrix.krayt_detskie_prazdniki\",\"bitrix.krayt_svetotekhnika\",\"bitrix.krayt_urbanistika\",\"bitrix.krayt_otdykh_na_prirode\",\"bitrix.krayt_sportivnye_ploshchadki\",\"bitrix.krayt_oborudovanie_dlya_turizma\",\"bitrix.krayt_meksikanskaya_kukhnya\",\"bitrix.delobot_sports_blog_20\",\"bitrix.delobot_aziatskie_blyuda\",\"bitrix.delobot_beauty_blog\",\"bitrix.delobot_meksikanskiy_restoran_2_0\",\"bitrix.delobot_urban_project\",\"bitrix.delobot_drawing_school\",\"bitrix.delobot_tourism\",\"bitrix.delobot_runnig_club\",\"bitrix.delobot_lighting_company\",\"bitrix.delobot_garbage_disposal\",\"bitrix.delobot_master_class\",\"bitrix.delobot_it_outsourcing\",\"bitrix.krayt_rent_car\",\"bitrix.krayt_aviation\",\"bitrix.krayt_street_sport_club\",\"bitrix.krayt_kofemaniya\",\"bitrix.krayt_corporate_events\",\"bitrix.krayt_cooking_school\",\"bitrix.krayt_blacksmith_craft\",\"bitrix.krayt_med_lab\",\"bitrix.krayt_music_studio\",\"bitrix.krayt_web_application_development\",\"bitrix.krayt_tennis_club\",\"bitrix.krayt_bank_services\",\"bitrix.krayt_smart_furniture\",\"bitrix.krayt_dom_pod_klyuch\",\"bitrix.krayt_uslugi_mediatora\",\"bitrix.krayt_child_club\",\"bitrix.delobot_custom_made_cakes\",\"bitrix.delobot_online_yoga_classes\",\"bitrix.krayt_pevitsa\",\"bitrix.krayt_ozelenenie_pomeshcheniy\",\"bitrix.krayt_internet_agentstvo\",\"bitrix.krayt_kinolog\",\"bitrix.krayt_poleznye_sneki\",\"bitrix.krayt_oformlenie_interera\",\"bitrix.delobot_tourist_equipment\",\"bitrix.delobot_creative_producer\",\"bitrix.delobot_aviation_services\",\"bitrix.delobot_blacksmith_services\",\"bitrix.delobot_coffee_subscription\",\"bitrix.delobot_construction_company\",\"bitrix.delobot_business_premises\",\"bitrix.delobot_pet_hotel\",\"bitrix.delobot_food_industry\",\"bitrix.delobot_cars_for_rent\",\"bitrix.krayt_klub_dlya_geymerov\",\"bitrix.krayt_relaks_uslugi\",\"bitrix.krayt_sportivnyy_inventar\",\"bitrix.krayt_universitet\",\"bitrix.delobot_uslugi_kinologa\",\"bitrix.delobot_business_training\",\"bitrix.krayt_vebinar\",\"bitrix.krayt_kurs_po_iskusstvennomu_intellektu\",\"bitrix.delobot_vypechka_na_zakaz\",\"bitrix.delobot_osennaya_rasprodazh\",\"bitrix.krayt_onlayn_shkola_dlya_detey\",\"bitrix.krayt_arkhitekturnaya_kompaniya\",\"bitrix.krayt_den_blagodareniya\",\"bitrix.krayt_uslugi_nyani\",\"bitrix.krayt_uslugi_repetitora\",\"bitrix.krayt_logoped\",\"bitrix.krayt_chyernaya_pyatnitsa\",\"bitrix.krayt_sladosti_na_rozhdestvo\",\"bitrix.krayt_podarki_na_novyy_god\",\"bitrix.delobot_laboratory\",\"bitrix.delobot_street_sports_grounds\",\"bitrix.delobot_about_webinar\",\"bitrix.krayt_dostavka_gruza\",\"bitrix.delobot_online_travel\",\"bitrix.delobot_youtube_channel\",\"bitrix.delobot_interior_design\",\"bitrix.krayt_kursy_po_interesam\",\"bitrix.krayt_zimnyaya_rasprodazha\",\"bitrix.krayt_tsifrovye_kommunikatsii\",\"bitrix.krayt_avtosalon\",\"bitrix.krayt_uslugi_stroitelnoy_kompanii\",\"bitrix.krayt_vysshee_uchebnoe_zavedenie\",\"bitrix.krayt_veterinar\",\"bitrix.krayt_akademiya_iskusstv\",\"bitrix.krayt_master_po_domu\",\"bitrix.krayt_onlayn_trenirovki\",\"bitrix.krayt_apart_otel\",\"bitrix.krayt_tsvety_i_bukety_na_zakaz\",\"bitrix.krayt_biznes_forum\",\"bitrix.krayt_uslugi_stomatologii\",\"bitrix.krayt_uslugi_avtoservisa\",\"bitrix.delobot_winter_sale\",\"bitrix.krayt_christmas_treats\",\"bitrix.krayt_eksperty_tochnogo_zemledeliya\",\"bitrix.krayt_servis_ukhoda_za_domom\",\"bitrix.delobot_repetitor\",\"bitrix.delobot_babysitter_for_children\",\"bitrix.delobot_speech_therapist_services\",\"bitrix.empty_template\",\"bitrix.krayt_gift_wrapping\",\"bitrix.delobot_fitness_clothes\",\"bitrix.delobot_bathroom_renovation\",\"bitrix.delobot_travel_arrangements\",\"bitrix.krayt_music_classes\",\"bitrix.delobot_klinika_dlya_mam_i_detok\",\"bitrix.delobot_bankovskie_uslugi\",\"bitrix.krayt_videoproizvodstvo\",\"bitrix.krayt_manikyur\",\"bitrix.krayt_meditsinskaya_pomoshch_onlayn\",\"bitrix.krayt_oblagorazhivanie_goroda\",\"bitrix.krayt_uslugi_barbershopa\",\"bitrix.krayt_taksi\",\"bitrix.delobot_optika\",\"bitrix.delobot_klinika_stomatologii\",\"bitrix.delobot_konditer\",\"bitrix.delobot_3d_print_services\",\"bitrix.delobot_uslugi_khimchistki\",\"bitrix.delobot_obuchenie_po_iskusstvennomu_intellektu\",\"bitrix.krayt_nutritsiologiya\",\"bitrix.krayt_salon_krasoty\",\"bitrix.krayt_uslugi_perevoda\",\"bitrix.krayt_landshaftnyy_dizayner\",\"bitrix.krayt_mebel_gotovaya_i_na_zakaz\",\"bitrix.krayt_uslugi_yurista\",\"bitrix.krayt_uslugi_po_bukhgalterii\",\"bitrix.krayt_yuvelir\",\"bitrix.krayt_stranichka_s_aktsiey\",\"bitrix.krayt_den_vsekh_vlyublennykh\",\"bitrix.krayt_stranichka_kontaktov\",\"bitrix.krayt_uslugi_massazhista\",\"bitrix.krayt_dostavka_edy_i_napitkov\",\"bitrix.krayt_podarki_na_zhenskiy_den\",\"bitrix.krayt_ekskursii\",\"bitrix.krayt_proizvodstvo_kosmetiki\",\"bitrix.krayt_logistika\",\"bitrix.krayt_fotograf\",\"bitrix.krayt_arenda_zhilya\",\"bitrix.krayt_kliningovye_uslugi\",\"bitrix.krayt_agentstvo_po_naymu\",\"bitrix.krayt_dukhi_na_zakaz\",\"bitrix.delobot_event_anounce\",\"bitrix.delobot_barbershop\",\"bitrix.delobot_italian_cafe\",\"bitrix.delobot_application_development\",\"bitrix.delobot_construction\",\"bitrix.delobot_uslugi_khudozhnika\",\"bitrix.krayt_prepodavatel\",\"bitrix.krayt_dveri_na_zakaz\",\"bitrix.krayt_kursy_po_gotovke\",\"bitrix.krayt_interernyy_dizayn\",\"bitrix.krayt_konsultatsii_po_zdorovyu\",\"bitrix.krayt_uslugi_atele\",\"bitrix.krayt_vizitka\",\"bitrix.krayt_remont_zhilya\",\"bitrix.krayt_voskhozhdenie_s_alpinistami\",\"bitrix.krayt_vesennyaya_rasprodazha\",\"bitrix.krayt_svadebnyy_salon\",\"bitrix.kraytlawyer_en\",\"bitrix.kraytinsurancecompany_en\",\"bitrix.krayt_interior_designer\",\"bitrix.delobot_bank\",\"bitrix.delobot_custom_made_clothes\",\"bitrix.delobot_telemedicine\",\"bitrix.krayt_spetsialist_po_nedvizhimosti\",\"bitrix.krayt_sportzal\",\"bitrix.krayt_mebel\",\"bitrix.krayt_tvorcheskie_kursy\",\"bitrix.krayt_kosmetologiya\",\"bitrix.krayt_remont_bytovoy_tekhniki\",\"bitrix.delobot_stylist_services\",\"bitrix.delobot_holidays_for_children\",\"bitrix.delobot_logistics_services\",\"bitrix.krayt_remont_avto\",\"bitrix.krayt_torgovoe_oborudovanie\",\"bitrix.krayt_rasteniya_i_zhivye_izgorodi\",\"bitrix.krayt_organizatsiya_meropriyatiy\",\"bitrix.krayt_o_psikhologe\",\"bitrix.krayt_prozhivanie_v_otele\",\"bitrix.krayt_dental_clinic\",\"bitrix.krayt_barbershop\",\"bitrix.krayt_personal_stylist\",\"bitrix.delobot_muzykalnaya_shkola\",\"bitrix.delobot_parfumer_services\",\"bitrix.delobot_uslugi_po_upakovke_podarkov\",\"bitrix.delobot_insurance\",\"bitrix.delobot_zabota_o_zhivotnyh\",\"bitrix.delobot_landscape_studio\",\"bitrix.krayt_dizayn_saytov\",\"bitrix.krayt_arenda_tekhniki\",\"bitrix.krayt_kursy_dlya_sotrudnikov\",\"bitrix.krayt_konditsionery_v_dom\",\"bitrix.krayt_promyshlennost\",\"bitrix.krayt_tantsy\",\"bitrix.krayt_pechat_3d_figur\",\"bitrix.krayt_o_biblioteke\",\"bitrix.krayt_vyrashchivanie_zeleni\",\"bitrix.krayt_okhrannye_sistemy\",\"bitrix.krayt_zvukozapis\",\"bitrix.krayt_rasprodazha\",\"bitrix.form_template_with_product_galery_for_social_media\",\"bitrix.form_template_with_offer\",\"bitrix.facebook_form_template_with_offer\",\"bitrix.facebook_form_template_with_product_images\",\"bitrix.facebook_form_template_with_extra_communication_channels\",\"bitrix.shablon_dlya_formy_v_vk_s_kartinkami_tovarov\",\"bitrix.shablon_dlya_formy_v_vk_s_kanalami_svyazi\",\"bitrix.shablon_dlya_formy_v_vk_s_promo_aktsiey\",\"bitrix.form_template_with_offer_for_social_media\",\"bitrix.form_template_with_contacts_for_social_media\",\"bitrix.form_template_with_product_images_for_social_media\",\"bitrix.form_template_with_communication_channels_for_social_media\",\"bitrix.krayt_vypechka\",\"bitrix.krayt_it_spetsialisty\",\"bitrix.krayt_modnyy_konsultant\",\"bitrix.krayt_agentstvo_po_turizmu\",\"bitrix.krayt_uslugi_vizazhista\",\"bitrix.krayt_fotostudiya\",\"bitrix.krayt_vyazanie\",\"bitrix.krayt_blagotvoritelnaya_organizatsiya\",\"bitrix.krayt_uslugi_illyustratora\",\"bitrix.delobot_intensiv_po_inostrannomu_yazyku\",\"bitrix.delobot_uslugi_po_remontu_tekhniki\",\"bitrix.delobot_stranichka_mobilnogo_prilozheniya\",\"bitrix.delobot_kreativnaya_mebel\",\"bitrix.delobot_klub_tsifrovykh_igr\",\"bitrix.delobot_dizayn_dlya_doma\",\"bitrix.krayt_studiya_spa\",\"bitrix.krayt_proekt_po_utepleniyu_doma\",\"bitrix.krayt_klining_kompaniya\",\"bitrix.krayt_arkhitektor\",\"bitrix.krayt_sladosti_na_zakaz\",\"bitrix.krayt_fotografiya\",\"bitrix.krayt_poligraficheskie_uslugi\",\"bitrix.krayt_manikyur_i_pedikyur\",\"bitrix.krayt_vyazanie_2\",\"bitrix.krayt_kofe\",\"bitrix.krayt_obuchenie_muzyke\",\"bitrix.krayt_novosti\",\"bitrix.delobot_spetsialist_po_tekstam\",\"bitrix.delobot_uslugi_elektrika\",\"bitrix.delobot_otslezhivanie_zdorovya\",\"bitrix.delobot_studiya_dlya_aktyerov\",\"bitrix.delobot_uslugi_kosmetologa\",\"bitrix.delobot_kottedzhnyy_posyelok\",\"bitrix.delobot_izdeliya_ot_yuvelira\",\"bitrix.krayt_montazh_panelnykh_domov\",\"bitrix.krayt_masterskaya_tekstilya\",\"bitrix.krayt_razrabotka_igr\",\"bitrix.krayt_organizatsiya_prazdnika\",\"bitrix.krayt_stilnaya_odezhda_na_zakaz\",\"bitrix.krayt_posuda_ot_dizaynera\",\"bitrix.krayt_pomeshchenie_dlya_kovorkinga\",\"bitrix.krayt_shokoladnaya_masterskaya\",\"bitrix.krayt_podbor_personala\",\"bitrix.krayt_uslugi_po_massazhu\",\"bitrix.krayt_prirodnyy_otdykh\",\"bitrix.krayt_agentstvo_po_reklame\",\"bitrix.krayt_stomatolog\",\"bitrix.krayt_povar_konditer\",\"bitrix.krayt_uslugi_po_strakhovaniyu\",\"bitrix.krayt_rasprodazha_osenyu\",\"bitrix.krayt_kukhni_na_zakaz\",\"bitrix.krayt_avtorskie_puteshestviya\",\"bitrix.krayt_remont_gadzhetov\",\"bitrix.krayt_proizvodstvo_produktsii\",\"bitrix.krayt_mezhdunarodnaya_biznes_konferentsiya\",\"bitrix.krayt_studiya_gibkosti\",\"bitrix.krayt_biznes_konsultatsii\",\"bitrix.krayt_brendingovoe_agentstvo\",\"bitrix.krayt_thanksgiving_day\",\"bitrix.krayt_architectural_company\",\"bitrix.krayt_online_school_for_children\",\"bitrix.krayt_ai_course\",\"bitrix.krayt_it_services_2\",\"bitrix.krayt_accounting_services\",\"bitrix.krayt_gaming_club\",\"bitrix.krayt_architectural_company_ru\",\"bitrix.delobot_beauty_blog_en\",\"bitrix.delobot_sladkoe_na_halloween\",\"bitrix.krayt_biznes_ru\",\"bitrix.krayt_business_en\",\"bitrix.krayt_vebinar_ru\",\"bitrix.delobot_music_band\",\"bitrix.delobot_courses\",\"bitrix.delobot_tours\",\"bitrix.krayt_uslugi_okhrany\",\"bitrix.krayt_agentstvo_nedvizhimosti\",\"bitrix.krayt_didzhital_illyustrator\",\"bitrix.krayt_landshaftnyy_dizayn\",\"bitrix.krayt_ochki_i_linzy_na_zakaz\",\"bitrix.krayt_organizatsiya_svadeb\",\"bitrix.krayt_pitanie_s_dietologom\",\"bitrix.krayt_uslugi_logistiki\",\"bitrix.krayt_uslugi_pekarya\",\"bitrix.krayt_uslugi_videostudii\",\"bitrix.krayt_home_construction_company\",\"bitrix.delobot_natural_cosmetics\",\"bitrix.krayt_real_estate_agent\",\"bitrix.krayt_spa_salon\",\"bitrix.krayt_yoga\",\"bitrix.krayt_uslugi_po_makiyajy\",\"bitrix.krayt_uslugi_psikhoterapevta\",\"bitrix.krayt_uslugi_advokat\",\"bitrix.krayt_uchitel_matematiki\",\"bitrix.krayt_portfolio_aktrisy\",\"bitrix.krayt_online_shkola_dlya_detey\",\"bitrix.krayt_odezhda_dlya_fitnesa\",\"bitrix.krayt_obuchenie_sotrudnikov\",\"bitrix.krayt_nabory_pravilnogo_pitaniya\",\"bitrix.krayt_kurs_po_ii\",\"bitrix.krayt_kontsert_gruppy\",\"bitrix.krayt_kokteylnyy_bar\",\"bitrix.krayt_khudozhnik\",\"bitrix.delobot_arenduemaya_tekhnika\",\"bitrix.delobot_franshiza_sportivnykh_zalov\",\"bitrix.delobot_massazh\",\"bitrix.delobot_oborudovanie_dlya_torgovli\",\"bitrix.delobot_remontnye_raboty\",\"bitrix.delobot_uslugi_po_remontu_avto\",\"bitrix.delobot_yuridicheskaya_kompaniya\",\"bitrix.delobot_yuridicheskiy_universitet\",\"bitrix.krayt_kiberponedelnik\",\"bitrix.krayt_koncert_gruppy\",\"bitrix.krayt_kurs_po_neyrosetyam\",\"bitrix.krayt_arenda_nedvizhimosti\",\"bitrix.krayt_nyanya_dlya_detok\",\"bitrix.krayt_uslugi_bukhgalterii\",\"bitrix.krayt_ozelenenie_goroda\",\"bitrix.krayt_proektirovanie_domov\",\"bitrix.krayt_ustanovka_konditsionerov\",\"bitrix.krayt_posuda\",\"bitrix.krayt_furniture_manufacturer\",\"bitrix.krayt_logistics\",\"bitrix.krayt_renovations\",\"bitrix.krayt_travel_agency\",\"bitrix.krayt_electrical_services\",\"bitrix.krayt_home_design_and_construction\",\"bitrix.krayt_legal_services\",\"bitrix.delobot_bathroom_renovations\",\"bitrix.delobot_it_services\",\"bitrix.delobot_konsaltingovaya_kompaniya\",\"bitrix.delobot_branding\",\"bitrix.delobot_mebel_dlya_rabochego_prostranstva\",\"bitrix.delobot_stroitelstvo_zhilya\",\"bitrix.delobot_zubnoy_vrach\",\"bitrix.delobot_furnituremanufacturing_en\",\"bitrix.krayt_university_en\",\"bitrix.delobot_newsblog_en\",\"bitrix.krayt_mobileapp_en\",\"bitrix.krayt_hotel_en\",\"bitrix.krayt_realestate_en\",\"bitrix.delobot_banking_services\",\"bitrix.krayt_website_designer\",\"bitrix.delobot_transport_services\",\"bitrix.krayt_recruitment_agency\",\"bitrix.krayt_camping_retreat\"]',NULL,NULL),('rest','entity_iblock_type','rest_entity',NULL,NULL),('rest','server_path','/rest',NULL,NULL),('search','dbnode_id','N',NULL,NULL),('search','dbnode_status','ok',NULL,NULL),('search','suggest_save_days','250',NULL,NULL),('search','use_social_rating','Y',NULL,NULL),('search','use_tf_cache','Y',NULL,NULL),('search','use_word_distance','Y',NULL,NULL),('search','version','v2.0',NULL,NULL),('security','ipcheck_disable_file','/bitrix/modules/ipcheck_disable_aa194332c7829f34cb43c9d79a88eb25',NULL,NULL),('security','redirect_sid','6nzsm7lism6wwfcxisexflewhmb79hoe',NULL,NULL),('socialnetwork','allow_tooltip','N',NULL,NULL),('socialservices','allow_encrypted_tokens','1',NULL,NULL),('socialservices','auth_services','a:12:{s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"YandexOpenID\";s:1:\"Y\";s:7:\"Rambler\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";s:6:\"LiveID\";s:1:\"N\";}',NULL,NULL),('socialservices','bitrix24net_domain','https://sevostjanov.45-86-181-97.ip.dev.2204535.ru',NULL,NULL),('socialservices','bitrix24net_id','ext.65c3662e3b18f9.04879100',NULL,NULL),('socialservices','bitrix24net_secret','4L1qum8zEArSDyYo5v3WMogUZYyj0nbt9Tol9HO3WqAbtyS4IO',NULL,NULL),('socialservices','google_api_key','AIzaSyA7puwZwGDJgOjcAWsFsY7hQcrioC13A18',NULL,NULL),('socialservices','google_appid','798910771106.apps.googleusercontent.com',NULL,NULL),('vote','VOTE_COMPATIBLE_OLD_TEMPLATE','N',NULL,NULL),('vote','VOTE_DIR','',NULL,NULL);
/*!40000 ALTER TABLE `b_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_option_site`
--

DROP TABLE IF EXISTS `b_option_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_option_site` (
  `MODULE_ID` varchar(50) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `VALUE` mediumtext DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_option_site`
--

LOCK TABLES `b_option_site` WRITE;
/*!40000 ALTER TABLE `b_option_site` DISABLE KEYS */;
INSERT INTO `b_option_site` VALUES ('fileman','menutypes','s1','a:3:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";}'),('fileman','propstypes','s1','a:4:{s:11:\"description\";s:33:\"Описание страницы\";s:8:\"keywords\";s:27:\"Ключевые слова\";s:5:\"title\";s:44:\"Заголовок окна браузера\";s:14:\"keywords_inner\";s:35:\"Продвигаемые слова\";}'),('forum','FILTER_DICT_T','en','4'),('forum','FILTER_DICT_T','ru','2'),('forum','FILTER_DICT_W','en','3'),('forum','FILTER_DICT_W','ru','1'),('main','wizard_furniture_theme_id','s1','blue'),('main','wizard_site_logo','s1','0'),('main','wizard_solution','s1','corp_furniture'),('main','wizard_template_id','s1','furniture');
/*!40000 ALTER TABLE `b_option_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_cache`
--

DROP TABLE IF EXISTS `b_perf_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) DEFAULT NULL,
  `MODULE_NAME` text DEFAULT NULL,
  `COMPONENT_NAME` text DEFAULT NULL,
  `BASE_DIR` text DEFAULT NULL,
  `INIT_DIR` text DEFAULT NULL,
  `FILE_NAME` text DEFAULT NULL,
  `FILE_PATH` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_cache`
--

LOCK TABLES `b_perf_cache` WRITE;
/*!40000 ALTER TABLE `b_perf_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_cluster`
--

DROP TABLE IF EXISTS `b_perf_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_cluster`
--

LOCK TABLES `b_perf_cluster` WRITE;
/*!40000 ALTER TABLE `b_perf_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_component`
--

DROP TABLE IF EXISTS `b_perf_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_component`
--

LOCK TABLES `b_perf_component` WRITE;
/*!40000 ALTER TABLE `b_perf_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_error`
--

DROP TABLE IF EXISTS `b_perf_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text DEFAULT NULL,
  `ERRFILE` text DEFAULT NULL,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_error`
--

LOCK TABLES `b_perf_error` WRITE;
/*!40000 ALTER TABLE `b_perf_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_history`
--

DROP TABLE IF EXISTS `b_perf_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_history`
--

LOCK TABLES `b_perf_history` WRITE;
/*!40000 ALTER TABLE `b_perf_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_hit`
--

DROP TABLE IF EXISTS `b_perf_hit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) DEFAULT NULL,
  `SERVER_NAME` varchar(50) DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text DEFAULT NULL,
  `REQUEST_URI` text DEFAULT NULL,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_hit`
--

LOCK TABLES `b_perf_hit` WRITE;
/*!40000 ALTER TABLE `b_perf_hit` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_hit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_ban`
--

DROP TABLE IF EXISTS `b_perf_index_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_ban`
--

LOCK TABLES `b_perf_index_ban` WRITE;
/*!40000 ALTER TABLE `b_perf_index_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_complete`
--

DROP TABLE IF EXISTS `b_perf_index_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  `INDEX_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_complete`
--

LOCK TABLES `b_perf_index_complete` WRITE;
/*!40000 ALTER TABLE `b_perf_index_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_complete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_suggest`
--

DROP TABLE IF EXISTS `b_perf_index_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) DEFAULT NULL,
  `SQL_TEXT` text DEFAULT NULL,
  `SQL_EXPLAIN` longtext DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_suggest`
--

LOCK TABLES `b_perf_index_suggest` WRITE;
/*!40000 ALTER TABLE `b_perf_index_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_index_suggest_sql`
--

DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_index_suggest_sql`
--

LOCK TABLES `b_perf_index_suggest_sql` WRITE;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_sql`
--

DROP TABLE IF EXISTS `b_perf_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text DEFAULT NULL,
  `COMPONENT_NAME` text DEFAULT NULL,
  `SQL_TEXT` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_sql`
--

LOCK TABLES `b_perf_sql` WRITE;
/*!40000 ALTER TABLE `b_perf_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_sql_backtrace`
--

DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_sql_backtrace`
--

LOCK TABLES `b_perf_sql_backtrace` WRITE;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_tab_column_stat`
--

DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) DEFAULT NULL,
  `COLUMN_NAME` varchar(50) DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_tab_column_stat`
--

LOCK TABLES `b_perf_tab_column_stat` WRITE;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_tab_stat`
--

DROP TABLE IF EXISTS `b_perf_tab_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_tab_stat`
--

LOCK TABLES `b_perf_tab_stat` WRITE;
/*!40000 ALTER TABLE `b_perf_tab_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_perf_test`
--

DROP TABLE IF EXISTS `b_perf_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_perf_test`
--

LOCK TABLES `b_perf_test` WRITE;
/*!40000 ALTER TABLE `b_perf_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting`
--

DROP TABLE IF EXISTS `b_posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `STATUS` char(1) NOT NULL DEFAULT 'D',
  `VERSION` char(1) DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext DEFAULT NULL,
  `FROM_FIELD` varchar(255) NOT NULL,
  `TO_FIELD` varchar(255) DEFAULT NULL,
  `BCC_FIELD` mediumtext DEFAULT NULL,
  `EMAIL_FILTER` varchar(255) DEFAULT NULL,
  `SUBJECT` varchar(255) NOT NULL,
  `BODY_TYPE` varchar(4) NOT NULL DEFAULT 'text',
  `BODY` mediumtext NOT NULL,
  `DIRECT_SEND` char(1) NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) DEFAULT NULL,
  `MSG_CHARSET` varchar(255) DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) DEFAULT NULL,
  `ERROR_EMAIL` mediumtext DEFAULT NULL,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting`
--

LOCK TABLES `b_posting` WRITE;
/*!40000 ALTER TABLE `b_posting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_email`
--

DROP TABLE IF EXISTS `b_posting_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_email`
--

LOCK TABLES `b_posting_email` WRITE;
/*!40000 ALTER TABLE `b_posting_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_file`
--

DROP TABLE IF EXISTS `b_posting_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`),
  KEY `FILE_ID` (`FILE_ID`),
  CONSTRAINT `b_posting_file_ibfk_1` FOREIGN KEY (`POSTING_ID`) REFERENCES `b_posting` (`ID`),
  CONSTRAINT `b_posting_file_ibfk_2` FOREIGN KEY (`FILE_ID`) REFERENCES `b_file` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_file`
--

LOCK TABLES `b_posting_file` WRITE;
/*!40000 ALTER TABLE `b_posting_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_group`
--

DROP TABLE IF EXISTS `b_posting_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`),
  KEY `GROUP_ID` (`GROUP_ID`),
  CONSTRAINT `b_posting_group_ibfk_1` FOREIGN KEY (`POSTING_ID`) REFERENCES `b_posting` (`ID`),
  CONSTRAINT `b_posting_group_ibfk_2` FOREIGN KEY (`GROUP_ID`) REFERENCES `b_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_group`
--

LOCK TABLES `b_posting_group` WRITE;
/*!40000 ALTER TABLE `b_posting_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_posting_rubric`
--

DROP TABLE IF EXISTS `b_posting_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`),
  KEY `LIST_RUBRIC_ID` (`LIST_RUBRIC_ID`),
  CONSTRAINT `b_posting_rubric_ibfk_1` FOREIGN KEY (`POSTING_ID`) REFERENCES `b_posting` (`ID`),
  CONSTRAINT `b_posting_rubric_ibfk_2` FOREIGN KEY (`LIST_RUBRIC_ID`) REFERENCES `b_list_rubric` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_posting_rubric`
--

LOCK TABLES `b_posting_rubric` WRITE;
/*!40000 ALTER TABLE `b_posting_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating`
--

DROP TABLE IF EXISTS `b_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL,
  `NAME` varchar(512) NOT NULL,
  `ENTITY_ID` varchar(50) NOT NULL,
  `CALCULATION_METHOD` varchar(3) NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) DEFAULT 'N',
  `AUTHORITY` char(1) DEFAULT 'N',
  `CALCULATED` char(1) NOT NULL DEFAULT 'N',
  `CONFIGS` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating`
--

LOCK TABLES `b_rating` WRITE;
/*!40000 ALTER TABLE `b_rating` DISABLE KEYS */;
INSERT INTO `b_rating` VALUES (1,'N','Рейтинг','USER','SUM','2024-02-07 14:14:39',NULL,NULL,'Y','N','N','a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),(2,'N','Авторитет','USER','SUM','2024-02-07 14:14:39',NULL,NULL,'Y','Y','N','a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
/*!40000 ALTER TABLE `b_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_component`
--

DROP TABLE IF EXISTS `b_rating_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `RATING_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `COMPLEX_NAME` varchar(200) NOT NULL,
  `CLASS` varchar(255) NOT NULL,
  `CALC_METHOD` varchar(255) NOT NULL,
  `EXCEPTION_METHOD` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_component`
--

LOCK TABLES `b_rating_component` WRITE;
/*!40000 ALTER TABLE `b_rating_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_component_results`
--

DROP TABLE IF EXISTS `b_rating_component_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `RATING_TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `COMPLEX_NAME` varchar(200) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_component_results`
--

LOCK TABLES `b_rating_component_results` WRITE;
/*!40000 ALTER TABLE `b_rating_component_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_prepare`
--

DROP TABLE IF EXISTS `b_rating_prepare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_prepare`
--

LOCK TABLES `b_rating_prepare` WRITE;
/*!40000 ALTER TABLE `b_rating_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_prepare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_results`
--

DROP TABLE IF EXISTS `b_rating_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT 0,
  `PREVIOUS_POSITION` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_results`
--

LOCK TABLES `b_rating_results` WRITE;
/*!40000 ALTER TABLE `b_rating_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_rule`
--

DROP TABLE IF EXISTS `b_rating_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `NAME` varchar(256) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `CONDITION_NAME` varchar(200) NOT NULL,
  `CONDITION_MODULE` varchar(50) DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) NOT NULL,
  `CONDITION_METHOD` varchar(255) NOT NULL,
  `CONDITION_CONFIG` text DEFAULT NULL,
  `ACTION_NAME` varchar(200) NOT NULL,
  `ACTION_CONFIG` text DEFAULT NULL,
  `ACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) NOT NULL,
  `ACTIVATE_METHOD` varchar(255) NOT NULL,
  `DEACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_rule`
--

LOCK TABLES `b_rating_rule` WRITE;
/*!40000 ALTER TABLE `b_rating_rule` DISABLE KEYS */;
INSERT INTO `b_rating_rule` VALUES (1,'N','Добавление в группу пользователей, имеющих право голосовать за рейтинг','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}','ADD_TO_GROUP','a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}','N','CRatingRulesMain','addToGroup','N','CRatingRulesMain ','addToGroup','2024-02-07 14:14:39','2024-02-07 14:14:39',NULL),(2,'N','Удаление из группы пользователей, не имеющих права голосовать за рейтинг','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}','REMOVE_FROM_GROUP','a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}','N','CRatingRulesMain','removeFromGroup','N','CRatingRulesMain ','removeFromGroup','2024-02-07 14:14:39','2024-02-07 14:14:39',NULL),(3,'N','Добавление в группу пользователей, имеющих право голосовать за авторитет','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}','ADD_TO_GROUP','a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}','N','CRatingRulesMain','addToGroup','N','CRatingRulesMain ','addToGroup','2024-02-07 14:14:39','2024-02-07 14:14:39',NULL),(4,'N','Удаление из группы пользователей, не имеющих права голосовать за авторитет','USER','AUTHORITY',NULL,'CRatingRulesMain','ratingCheck','a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}','REMOVE_FROM_GROUP','a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}','N','CRatingRulesMain','removeFromGroup','N','CRatingRulesMain ','removeFromGroup','2024-02-07 14:14:39','2024-02-07 14:14:39',NULL),(5,'Y','Автоматическое голосование за авторитет пользователя','USER','VOTE',NULL,'CRatingRulesMain','voteCheck','a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1;}}','empty','a:0:{}','N','empty','empty','N','empty ','empty','2024-02-07 14:14:39','2024-02-07 14:14:39',NULL);
/*!40000 ALTER TABLE `b_rating_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_rule_vetting`
--

DROP TABLE IF EXISTS `b_rating_rule_vetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) NOT NULL DEFAULT 'N',
  `APPLIED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_rule_vetting`
--

LOCK TABLES `b_rating_rule_vetting` WRITE;
/*!40000 ALTER TABLE `b_rating_rule_vetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_rule_vetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_user`
--

DROP TABLE IF EXISTS `b_rating_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT 0.0000,
  `VOTE_WEIGHT` decimal(18,4) DEFAULT 0.0000,
  `VOTE_COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_user`
--

LOCK TABLES `b_rating_user` WRITE;
/*!40000 ALTER TABLE `b_rating_user` DISABLE KEYS */;
INSERT INTO `b_rating_user` VALUES (1,2,1,3.0000,30.0000,13);
/*!40000 ALTER TABLE `b_rating_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_vote`
--

DROP TABLE IF EXISTS `b_rating_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) NOT NULL,
  `REACTION` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_10` (`USER_ID`,`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_vote`
--

LOCK TABLES `b_rating_vote` WRITE;
/*!40000 ALTER TABLE `b_rating_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_vote_group`
--

DROP TABLE IF EXISTS `b_rating_vote_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_vote_group`
--

LOCK TABLES `b_rating_vote_group` WRITE;
/*!40000 ALTER TABLE `b_rating_vote_group` DISABLE KEYS */;
INSERT INTO `b_rating_vote_group` VALUES (5,1,'A'),(1,1,'R'),(3,1,'R'),(2,3,'R'),(4,3,'R'),(6,4,'A');
/*!40000 ALTER TABLE `b_rating_vote_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_voting`
--

DROP TABLE IF EXISTS `b_rating_voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_voting`
--

LOCK TABLES `b_rating_voting` WRITE;
/*!40000 ALTER TABLE `b_rating_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_voting_prepare`
--

DROP TABLE IF EXISTS `b_rating_voting_prepare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_voting_prepare`
--

LOCK TABLES `b_rating_voting_prepare` WRITE;
/*!40000 ALTER TABLE `b_rating_voting_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_prepare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_voting_reaction`
--

DROP TABLE IF EXISTS `b_rating_voting_reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `REACTION` varchar(8) NOT NULL DEFAULT '',
  `TOTAL_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_voting_reaction`
--

LOCK TABLES `b_rating_voting_reaction` WRITE;
/*!40000 ALTER TABLE `b_rating_voting_reaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rating_weight`
--

DROP TABLE IF EXISTS `b_rating_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT 0.0000,
  `COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rating_weight`
--

LOCK TABLES `b_rating_weight` WRITE;
/*!40000 ALTER TABLE `b_rating_weight` DISABLE KEYS */;
INSERT INTO `b_rating_weight` VALUES (1,-1000000.0000,1000000.0000,1.0000,10);
/*!40000 ALTER TABLE `b_rating_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_ap`
--

DROP TABLE IF EXISTS `b_rest_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `TITLE` varchar(255) DEFAULT '',
  `COMMENT` varchar(255) DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_ap`
--

LOCK TABLES `b_rest_ap` WRITE;
/*!40000 ALTER TABLE `b_rest_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_ap_permission`
--

DROP TABLE IF EXISTS `b_rest_ap_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_ap_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int(11) NOT NULL,
  `PERM` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_ap_permission`
--

LOCK TABLES `b_rest_ap_permission` WRITE;
/*!40000 ALTER TABLE `b_rest_ap_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_ap_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_app`
--

DROP TABLE IF EXISTS `b_rest_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) NOT NULL,
  `CODE` varchar(128) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) NOT NULL DEFAULT 'N',
  `URL` varchar(1000) NOT NULL,
  `URL_DEMO` varchar(1000) DEFAULT NULL,
  `URL_INSTALL` varchar(1000) DEFAULT NULL,
  `VERSION` varchar(4) DEFAULT '1',
  `SCOPE` varchar(2000) NOT NULL,
  `STATUS` char(1) NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) DEFAULT 'N',
  `SHARED_KEY` varchar(32) DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) DEFAULT NULL,
  `APP_NAME` varchar(1000) DEFAULT NULL,
  `ACCESS` varchar(2000) DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) DEFAULT '',
  `MOBILE` char(1) DEFAULT 'N',
  `USER_INSTALL` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_app`
--

LOCK TABLES `b_rest_app` WRITE;
/*!40000 ALTER TABLE `b_rest_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_app_lang`
--

DROP TABLE IF EXISTS `b_rest_app_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_app_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `MENU_NAME` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_app_lang`
--

LOCK TABLES `b_rest_app_lang` WRITE;
/*!40000 ALTER TABLE `b_rest_app_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_app_log`
--

DROP TABLE IF EXISTS `b_rest_app_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_app_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp(),
  `APP_ID` int(11) NOT NULL,
  `ACTION_TYPE` varchar(50) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ADMIN` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_app_log`
--

LOCK TABLES `b_rest_app_log` WRITE;
/*!40000 ALTER TABLE `b_rest_app_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_configuration_storage`
--

DROP TABLE IF EXISTS `b_rest_configuration_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_configuration_storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CONTEXT` varchar(128) NOT NULL,
  `CODE` varchar(32) NOT NULL,
  `DATA` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_configuration_storage`
--

LOCK TABLES `b_rest_configuration_storage` WRITE;
/*!40000 ALTER TABLE `b_rest_configuration_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_configuration_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_event`
--

DROP TABLE IF EXISTS `b_rest_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `EVENT_HANDLER` varchar(255) NOT NULL,
  `USER_ID` int(11) DEFAULT 0,
  `TITLE` varchar(255) DEFAULT '',
  `COMMENT` varchar(255) DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) DEFAULT '',
  `CONNECTOR_ID` varchar(255) DEFAULT '',
  `INTEGRATION_ID` int(11) DEFAULT NULL,
  `OPTIONS` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_event`
--

LOCK TABLES `b_rest_event` WRITE;
/*!40000 ALTER TABLE `b_rest_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_event_offline`
--

DROP TABLE IF EXISTS `b_rest_event_offline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_event_offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `MESSAGE_ID` varchar(100) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `EVENT_DATA` text DEFAULT NULL,
  `EVENT_ADDITIONAL` text DEFAULT NULL,
  `PROCESS_ID` varchar(255) DEFAULT '',
  `CONNECTOR_ID` varchar(255) DEFAULT '',
  `ERROR` int(3) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`),
  KEY `ix_b_rest_event_offline3` (`APP_ID`,`CONNECTOR_ID`),
  KEY `ix_b_rest_event_offline4` (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_event_offline`
--

LOCK TABLES `b_rest_event_offline` WRITE;
/*!40000 ALTER TABLE `b_rest_event_offline` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_event_offline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_integration`
--

DROP TABLE IF EXISTS `b_rest_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_integration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) NOT NULL,
  `TITLE` varchar(256) NOT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `SCOPE` text DEFAULT NULL,
  `QUERY` text DEFAULT NULL,
  `OUTGOING_EVENTS` text DEFAULT NULL,
  `OUTGOING_NEEDED` char(1) DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) DEFAULT NULL,
  `WIDGET_NEEDED` char(1) DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) DEFAULT NULL,
  `WIDGET_LIST` text DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) DEFAULT NULL,
  `BOT_ID` int(11) DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_integration`
--

LOCK TABLES `b_rest_integration` WRITE;
/*!40000 ALTER TABLE `b_rest_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_log`
--

DROP TABLE IF EXISTS `b_rest_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp(),
  `CLIENT_ID` varchar(45) DEFAULT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(50) DEFAULT NULL,
  `METHOD` varchar(255) DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) DEFAULT NULL,
  `REQUEST_URI` varchar(255) DEFAULT NULL,
  `REQUEST_AUTH` text DEFAULT NULL,
  `REQUEST_DATA` text DEFAULT NULL,
  `RESPONSE_STATUS` varchar(20) DEFAULT NULL,
  `RESPONSE_DATA` longtext DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_log`
--

LOCK TABLES `b_rest_log` WRITE;
/*!40000 ALTER TABLE `b_rest_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_owner_entity`
--

DROP TABLE IF EXISTS `b_rest_owner_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_owner_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` char(1) NOT NULL,
  `OWNER` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(32) NOT NULL,
  `ENTITY` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_owner_entity`
--

LOCK TABLES `b_rest_owner_entity` WRITE;
/*!40000 ALTER TABLE `b_rest_owner_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_owner_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_placement`
--

DROP TABLE IF EXISTS `b_rest_placement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_placement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `USER_ID` int(18) DEFAULT 0,
  `PLACEMENT` varchar(255) NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) NOT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT '',
  `GROUP_NAME` varchar(255) DEFAULT '',
  `COMMENT` varchar(255) DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) DEFAULT NULL,
  `OPTIONS` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100)),
  KEY `ix_b_rest_placement4` (`PLACEMENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_placement`
--

LOCK TABLES `b_rest_placement` WRITE;
/*!40000 ALTER TABLE `b_rest_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_placement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_placement_lang`
--

DROP TABLE IF EXISTS `b_rest_placement_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_placement_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLACEMENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` varchar(2) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GROUP_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `b_rest_placement_lang_unique` (`PLACEMENT_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_placement_lang`
--

LOCK TABLES `b_rest_placement_lang` WRITE;
/*!40000 ALTER TABLE `b_rest_placement_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_placement_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_stat`
--

DROP TABLE IF EXISTS `b_rest_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `HOUR_0` int(11) NOT NULL DEFAULT 0,
  `HOUR_1` int(11) NOT NULL DEFAULT 0,
  `HOUR_2` int(11) NOT NULL DEFAULT 0,
  `HOUR_3` int(11) NOT NULL DEFAULT 0,
  `HOUR_4` int(11) NOT NULL DEFAULT 0,
  `HOUR_5` int(11) NOT NULL DEFAULT 0,
  `HOUR_6` int(11) NOT NULL DEFAULT 0,
  `HOUR_7` int(11) NOT NULL DEFAULT 0,
  `HOUR_8` int(11) NOT NULL DEFAULT 0,
  `HOUR_9` int(11) NOT NULL DEFAULT 0,
  `HOUR_10` int(11) NOT NULL DEFAULT 0,
  `HOUR_11` int(11) NOT NULL DEFAULT 0,
  `HOUR_12` int(11) NOT NULL DEFAULT 0,
  `HOUR_13` int(11) NOT NULL DEFAULT 0,
  `HOUR_14` int(11) NOT NULL DEFAULT 0,
  `HOUR_15` int(11) NOT NULL DEFAULT 0,
  `HOUR_16` int(11) NOT NULL DEFAULT 0,
  `HOUR_17` int(11) NOT NULL DEFAULT 0,
  `HOUR_18` int(11) NOT NULL DEFAULT 0,
  `HOUR_19` int(11) NOT NULL DEFAULT 0,
  `HOUR_20` int(11) NOT NULL DEFAULT 0,
  `HOUR_21` int(11) NOT NULL DEFAULT 0,
  `HOUR_22` int(11) NOT NULL DEFAULT 0,
  `HOUR_23` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_stat`
--

LOCK TABLES `b_rest_stat` WRITE;
/*!40000 ALTER TABLE `b_rest_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_stat_app`
--

DROP TABLE IF EXISTS `b_rest_stat_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_stat_app` (
  `APP_ID` int(11) NOT NULL,
  `APP_CODE` varchar(128) NOT NULL,
  PRIMARY KEY (`APP_ID`),
  KEY `ix_b_rest_stat_app_code` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_stat_app`
--

LOCK TABLES `b_rest_stat_app` WRITE;
/*!40000 ALTER TABLE `b_rest_stat_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_stat_method`
--

DROP TABLE IF EXISTS `b_rest_stat_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_stat_method` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `METHOD_TYPE` char(1) DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_stat_method`
--

LOCK TABLES `b_rest_stat_method` WRITE;
/*!40000 ALTER TABLE `b_rest_stat_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_usage_entity`
--

DROP TABLE IF EXISTS `b_rest_usage_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_usage_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY_CODE` varchar(255) DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_usage_entity`
--

LOCK TABLES `b_rest_usage_entity` WRITE;
/*!40000 ALTER TABLE `b_rest_usage_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_usage_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_rest_usage_stat`
--

DROP TABLE IF EXISTS `b_rest_usage_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int(11) NOT NULL DEFAULT 0,
  `IS_SENT` char(1) NOT NULL DEFAULT 'N',
  `HOUR_0` int(11) NOT NULL DEFAULT 0,
  `HOUR_1` int(11) NOT NULL DEFAULT 0,
  `HOUR_2` int(11) NOT NULL DEFAULT 0,
  `HOUR_3` int(11) NOT NULL DEFAULT 0,
  `HOUR_4` int(11) NOT NULL DEFAULT 0,
  `HOUR_5` int(11) NOT NULL DEFAULT 0,
  `HOUR_6` int(11) NOT NULL DEFAULT 0,
  `HOUR_7` int(11) NOT NULL DEFAULT 0,
  `HOUR_8` int(11) NOT NULL DEFAULT 0,
  `HOUR_9` int(11) NOT NULL DEFAULT 0,
  `HOUR_10` int(11) NOT NULL DEFAULT 0,
  `HOUR_11` int(11) NOT NULL DEFAULT 0,
  `HOUR_12` int(11) NOT NULL DEFAULT 0,
  `HOUR_13` int(11) NOT NULL DEFAULT 0,
  `HOUR_14` int(11) NOT NULL DEFAULT 0,
  `HOUR_15` int(11) NOT NULL DEFAULT 0,
  `HOUR_16` int(11) NOT NULL DEFAULT 0,
  `HOUR_17` int(11) NOT NULL DEFAULT 0,
  `HOUR_18` int(11) NOT NULL DEFAULT 0,
  `HOUR_19` int(11) NOT NULL DEFAULT 0,
  `HOUR_20` int(11) NOT NULL DEFAULT 0,
  `HOUR_21` int(11) NOT NULL DEFAULT 0,
  `HOUR_22` int(11) NOT NULL DEFAULT 0,
  `HOUR_23` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_rest_usage_stat`
--

LOCK TABLES `b_rest_usage_stat` WRITE;
/*!40000 ALTER TABLE `b_rest_usage_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_usage_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content`
--

DROP TABLE IF EXISTS `b_search_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT 0,
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) DEFAULT NULL,
  `ENTITY_ID` varchar(255) DEFAULT NULL,
  `URL` text DEFAULT NULL,
  `TITLE` text DEFAULT NULL,
  `BODY` longtext DEFAULT NULL,
  `TAGS` text DEFAULT NULL,
  `PARAM1` text DEFAULT NULL,
  `PARAM2` text DEFAULT NULL,
  `UPD` varchar(32) DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content`
--

LOCK TABLES `b_search_content` WRITE;
/*!40000 ALTER TABLE `b_search_content` DISABLE KEYS */;
INSERT INTO `b_search_content` VALUES (1,'2024-02-07 14:20:20','main','s1|/search/map.php',0,NULL,NULL,NULL,'/search/map.php','Карта сайта','','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(2,'2024-02-07 14:20:20','main','s1|/search/index.php',0,NULL,NULL,NULL,'/search/index.php','Поиск','','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(4,'2024-02-07 14:20:20','main','s1|/_index.php',0,NULL,NULL,NULL,'/_index.php','Мебельная компания','Наша компания существует на Российском рынке с 1992 года. За это время «Мебельная компания» прошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России.\n«Мебельная компания» осуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход – с другой.\nНаша продукция\rНаши услуги','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(5,'2024-02-28 11:30:04','main','s1|/products/index.php',0,NULL,NULL,NULL,'/products/index.php','Каталог','','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(6,'2024-02-25 13:49:09','main','s1|/contacts/index.php',0,NULL,NULL,NULL,'/contacts/index.php','Контакты','Обратитесь к нашим специалистам и получите профессиональную консультацию по вопросам создания и покупки мебели (от дизайна, разработки технического задания до доставки мебели к Вам домой).\nВы можете обратиться к нам по телефону, по электронной почте или договориться о встрече в нашем офисе. Будем рады помочь вам и ответить на все ваши вопросы.\nТелефоны\rТелефон/факс:\n(495) 212-85-06\rТелефоны:\n(495) 212-85-07\r(495) 212-85-08\rEmail\rinfo@example.ru\r— общие вопросы\rsales@example.ru\r— приобретение продукции\rmarketing@example.ru\r— маркетинг/мероприятия/PR\rФорма обратной связи\rОфис в Москве','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(7,'2024-02-07 14:20:20','main','s1|/login/index.php',0,NULL,NULL,NULL,'/login/index.php','Вход на сайт','Вы зарегистрированы и успешно авторизовались.\rВернуться на главную страницу','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(8,'2024-02-07 14:20:20','main','s1|/company/management.php',0,NULL,NULL,NULL,'/company/management.php','Руководство','Успешное развитие бизнеса &ndash; во многом результат квалифицированной работы руководства. 							\r&laquo;Мебельная компания&raquo;\rна мебельном рынке уже 18 лет. За это время Компания 							не только сохранила, но и упрочила лидирующие позиции среди ведущих игроков мебельного 							рынка. 						\r&laquo;Мебельная компания&raquo;\rиз года в год расширяет ассортимент выпускаемой продукции, 							наращивает темпы и объемы производства, увеличивает производственные и складские 							площади, развивает отношения с партнерами со всех регионов страны и налаживает связи 							с зарубежными партнерами. В большой степени это заслуга хорошо подготовленного руководящего 							состава и его грамотной политики. 						\rСобственник Компании &laquo;Мебельная компания&raquo;\rКолесников Виктор Федорович 								\rРодился 3 сентября 1964 года.\nОбразование: закончил авиационный факультет Воронежского 									государственного политехнического института. В 1994 году прошел обучение по программе 									&laquo;Подготовка малого и среднего бизнеса&raquo; в США.\nВ настоящее время Виктор Федорович 									возглавляет Управляющую компанию, которая координирует деятельность предприятий, 									входящих в Группу Компаний \r&laquo;Мебельная компания&raquo;\r. 								\rГенеральный директор &laquo;Мебельной компании&raquo;\rРатченко Александр Петрович 								\rРодился 5 июня 1962 года.\nОбразование: Воронежский политехнический институт 									по специальности инженер-технолог; программа &laquo;Эффективное развитие производства&raquo; 									(США).\nВ \r&laquo;Мебельной компании&raquo;\rСергей Фомич с 1994 года. За это время прошел 									путь от начальника цеха до генерального директора предприятия. 								\rЗаместитель генерального директора Управляющей компании\rРоговой Андрей Владимирович 								\rОбразование: факультет радиотехники Воронежского государственного технического университета.\nВ Компании с 1 июня 2000 года.','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(9,'2024-02-07 14:20:20','main','s1|/company/history.php',0,NULL,NULL,NULL,'/company/history.php','История','1992г. 								\r&laquo;Мебельная компания&raquo;\rначиналась с изготовления мебели для школ и офисов. Первое 									производство мебели располагалось в арендуемой мастерской, площадью 400 м2 с одним 									деревообрабатывающим станком. В компании работало двадцать человек. Все заработанные 									средства вкладывались в развитие, что позволило молодой Компании расти быстрыми 									темпами. 								\r1993г. 								\rВведен в эксплуатацию новый цех площадью 700 м2, ставший первой собственностью 									\r&laquo;Мебельной компании&raquo;\r. Модернизация производственной базы предприятия стала хорошей 									традицией. Компания постепенно перешла к более совершенному оборудованию, что позволило 									повысить уровень качества выпускаемой продукции и значительно увеличить объемы производства. 								\r1998г. 								\rВ Воронеже открыт первый фирменный магазин-салон \r&laquo;Мебельная компания&raquo;\r. Шаг за шагом 									продукция предприятия завоевывала регионы Сибири и Урала, Москвы и Подмосковья, 									Юга и Северо-Запада России. Производственные площади компании увеличены до 5000 									м2. 								\r1999г. 								\r&laquo;Мебельная компания&raquo;\rстала дипломантом одной из самых престижных международных 									выставок \r&laquo;ЕвроЭкспоМебель-99&raquo;\r- первое официальное признание мебельной продукции 									&laquo;Мебельной компании&raquo;. В этом же году компания выходит на мировой рынок. Был заключен 									ряд контрактов на поставку мебели в страны СНГ и Ближнего Зарубежья. 								\r2000г. 								\rКоллектив компании насчитывает более 500 сотрудников. Заключаются новые контракт 									на поставку мебели в европейские страны. 								\r2002г. 								\r&laquo;Мебельная компания&raquo;\rвошла в десятку лучших производителей мебели по данным ведущих 									мебельных салонов России, а также в число лидеров организационного развития. 								\r2003г. 								\rПриступили к строительству склада материалов. В Москве открыт филиал компании. \nПроведена первая конференция партнеров, результатом которой стало укрепление взаимовыгодных 									отношений и заключение дилерских договоров. 								\r2004г. 								\rЗавершено строительство и оснащение нового производственного корпуса и склада материалов. \nРасширено представительство компании на российском рынке и за рубежом. \nОткрыто 									региональное представительство \r&laquo;Мебельной компании&raquo;\rв Екатеринбурге. 								\r2005г. 								\rКомпания приобретает новое производственное оборудование концерна - угловую линию 									раскроя материалов и линию загрузки выгрузки. \nНачинается выпуск продукции в 									натуральном шпоне. Формируется отдельный склад материалов и комплектующих. \nВ этом же году открывается Фабрика мягкой мебели \r&laquo;МебельПлюс&raquo;\r2006г. 								\rОткрыты региональные представительства \r&laquo;Мебельной компании&raquo;\rв Санкт-Петербурге 									и Нижнем Новгороде. \nРазвивается собственная розничная сеть фирменных магазинов-салонов 									на территории России. 								\r2007г. 								\rЗавершено строительство второй фабрики. Общая площадь производсвенно-складских корпусов 									Компании составляет уже более 30000 м2. \nПроведена вторая конференция партнеров 									компании \r\"Технология успешного бизнеса\"\r. 								\r2008г. 								\rОткрыто новое предприятие для производства мебели по индивидуальным проектам \r&laquo;Комфорт&raquo;\r. \n&laquo;Мебельная компания&raquo;\rпродолжает обновление оборудования. 								\r2008г. 								\rНовейшим оборудованием укомплектована вторая фабрика. Запущена вторая производственная 									линия. \nПроведена третья конференция \r&laquo;Партнерство - бизнес сегодня&raquo;\rПринято решение о строительстве третьей фабрики. Площадь производственно &mdash; складских 									корпусов составит более 70000м2. \nПо всей стране и зарубежом открыто 37 мебельных 									салонов. \nВ Компании работает более полутора тысяч сотрудников.','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(10,'2024-02-07 14:20:20','main','s1|/company/mission.php',0,NULL,NULL,NULL,'/company/mission.php','Миссия и стратегия','&laquo;Мебельная компания&raquo;\r- динамично развивающееся производственное 							предприятие, которое имеет перед собой \nясно выраженные цели и инструменты для 							их достижени.Мы предоставляем каждому лучшую возможность обустроить свое жизненное \nи рабочее пространство.Мы работаем на долгосрочную перспективу и предлагаем оптимальные 							решения. Компания \r&laquo;Мебельная компания&raquo;\r- \nнадежный, технологичный, гибкий поставщик 							с большими мощностями. 						\rЦели и задачи\rОправдывать ожидания заказчика: &ldquo;Клиент всегда прав&rdquo;. Только Потребитель формирует 									единую систему взглядов на качество \nвыпускаемой продукции и работ.\rДобиться от работников компании понимания их личной ответственности за качество 									работ.\rПутем повышения качества продукции и работ постоянно увеличивать объемы производства 									с целью последующего реинвестирования \nприбыли в развитие компании.\rОбеспечивать строгое соответствие производимой продукции требованиям потребителей, 									нормам и правилам \nбезопасности, требованиям защиты окружающей среды.\rПолитика компании\rПостоянное совершенствование системы качества. Своевременное и эффективное принятие 									корректирующих мер .\rЗабота о работниках компании. Создание условий труда и оснащение рабочих мест, соответствующих 									всем санитарным \nи гигиеническим нормам.\rПовышение благосостояния сотрудников. Обеспечение морального и материального удовлетворения 									работников компании.\rСистематическое обучение работников всех уровней с целью постоянного повышения их 									профессионального мастерства.\rВнедрение высокопроизводительного оборудования и новейших технологий для повышения 									производительности труда, \nоптимизации затрат и, как результат, снижения цен 									на выпускаемую продукцию.\rСоздание новых рабочих мест. Привлечение на работу специалистов высокой квалификации.\rВыход на международный рынок.\rМы развиваем доверительные взаимовыгодные отношения со своими партнерами в долгосрочных 							интересах нашего бизнеса. \n&laquo;Мебельная компания&raquo;\rответственно относится 							к выполнению взятых на себя обязательств и ждет такого же \nподхода к делу от 							своих партнеров по бизнесу. Эта требовательность &ndash; залог нашей долгосрочной прибыльности. 						\rСо дня своего основания \r&laquo;Мебельная компания&raquo;\rсодействует росту благосостояния 							регионов России. Мы понимаем важность \nсоциальной ответственности нашей Компании 							и останемся примером в вопросах социальной защищенности наших сотрудников.','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(11,'2024-02-07 14:20:20','main','s1|/company/index.php',0,NULL,NULL,NULL,'/company/index.php','О компании','Наша компания существует на Российском рынке с 1992 года. За это время \r&laquo;Мебельная компания&raquo;\rпрошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России. 						 \rГлавное правило - индивидуальный подход к каждому клиенту\rНа сегодняшний день нами разработано более пятисот моделей для офиса и дома. Вместе с тем мы стремимся обеспечить неповторимость своей продукции. Мы изготовим мебель для кухни, детской, гостиной, спальной или ванной комнаты, мебель для офиса особого дизайна и нестандартного размера. \rНаши дизайнеры произведут замеры помещения и вместе с вами разработают дизайн-проект мебели для вашего интерьера, подобрав с высокой точностью размеры, модели, цвета, помогут оптимально расположить мебель. \rВаш проект будет создан с учетом всех нюансов и прорисовкой мельчайших деталей. Результаты совместного творчества вы сможете посмотреть в объемном представлении. Вам наглядно продемонстрируют, как будут выглядеть в жизни выбранные элементы интерьера при разном освещении, в конкретном помещении, сделанные из определенных материалов. В ваше распоряжение будет предоставлено много различных вариантов, из которых Вы сможете выбрать наиболее подходящий именно Вам. 						 					\rЗаказ будет выполнен и доставлен точно в срок. Все работы по сборке и установке мебели осуществляют сотрудники нашей компании. Строгий контроль качества осуществляется на всех этапах работ: от момента оформления заказа до момента приема выполненных работ. \rПередовые технологии и бесценный опыт\rИспользование передовых компьютерных технологий, многолетний опыт наших специалистов позволяют произвести грамотные расчеты и снизить расход материалов и себестоимость продукции, избежать ошибок при проектировании и оптимизировать дизайн комплексных интерьеров. Гарантия на нашу продукцию составляет 18 месяцев, а на отдельную продукцию 36 месяцев. \rМы гордимся нашими сотрудниками прошедшими профессиональное обучение в лучших учебных заведениях России и зарубежья. У нас трудятся высококлассные специалисты разных возрастов. Мы ценим энтузиазм молодежи и бесценный опыт старшего поколения. Все мы разные, но нас объединяет преданность своему делу и вера в идеи нашей компании. \rВысочайшие стандарты качества - залог нашего успеха\r&laquo;Мебельная компания&raquo;\rосуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход &ndash; с другой. \rЕжегодно наша продукция проходит сертификационные испытания в специализированных лабораториях России и имеет сертификаты соответствия продукции нормам безопасности и качества. Кроме того, \r&laquo;Мебельная компания&raquo;\rодной из первых среди мебельных производителей России в 2003 году прошла аудит на соответствие требованиям системы менеджмента качества &laquo;ИСО 9000&raquo; и получила сертификат соответствия системы качества на предприятии нормам международного стандарта.','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(12,'2024-02-07 14:20:20','main','s1|/company/vacancies.php',0,NULL,NULL,NULL,'/company/vacancies.php','Вакансии','','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(13,'2024-02-28 08:36:46','main','s1|/news/index.php',0,NULL,NULL,NULL,'/news/index.php','Новости','','','','','55ffe002a09ff5415231888d15deafea',NULL,NULL),(14,'2010-05-25 00:00:00','iblock','1',0,NULL,NULL,NULL,'=ID=1&EXTERNAL_ID=1&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Мебельный форум Беларуси','С 20 по 23 апреля 2010 года состоится \rМебельный Форум Беларуси\r&ndash; важнейшее мероприятии отрасли в текущем году.\r\n\rС 20 по 23 апреля 2010 года состоится \rМебельный Форум Беларуси\r&ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из \rБеларуси, Австрии, Латвии, Литвы, России, Польши \rи\rУкраины\r. В составе форума состоится пять выставок:\"Минский мебельный салон\", \"Мебельные технологии\", \"ОфисКомфорт\", \"Кухня\" и \"Домотех\". Экспозиция будет строиться по принципу двух тематических секторов:\rготовой мебели\rи \rматериалов для ее производства\r.\rВ секторе готовой мебели будут представлены:\rкорпусная и мягкая мебель;\rмебель для детей и молодежи;\rпредметы интерьера;\rкухонная мебель;\rмебель для офиса и административных зданий.\rВ секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\rПомимо расширенной экспозиции пяти тематических выставок \"Экспофорум\" подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума \"\rНародное признание\r\". В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\rМебельный Форум\rпредоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок \rМебельного Форума\r.\rПрием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.','','news','1',NULL,'2010-05-25 00:00:00',NULL),(15,'2010-05-26 00:00:00','iblock','2',0,NULL,NULL,NULL,'=ID=2&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Международная мебельная выставка SALON DEL MOBILE','В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. \r\nВ 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.','','news','1',NULL,'2010-05-26 00:00:00',NULL),(16,'2010-05-27 00:00:00','iblock','3',0,NULL,NULL,NULL,'=ID=3&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=','Получено прочное водостойкое соединение','Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. \r\n\rАвторы изобретения\r: Разиньков Егор Михайлович и Мещерякова Анна Анатольевна \rПатент Российской Федерации RU2277566\rОписание изобретения\rИзобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\rДанная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. \rИзобретение решает задачу по получению прочного и водостойкого клеевого соединения.\rЭто достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\rКарбамидомеламиноформальдегидная смола\r64,5-79,2\r10%-ный Раствор щавелевой кислоты\r4,4-20,5\rОтвердитель для карбамидомеламиноформальдегидной \r0,6-2,0\rсмолы 2542\r13,0-15,8','','news','1',NULL,'2010-05-27 00:00:00',NULL),(17,'2024-02-07 14:20:21','iblock','S1',0,NULL,NULL,NULL,'=ID=1&EXTERNAL_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Мягкая мебель','Диваны, кресла и прочая мягкая мебель',NULL,'products','2',NULL,NULL,NULL),(18,'2024-02-07 14:20:21','iblock','S2',0,NULL,NULL,NULL,'=ID=2&EXTERNAL_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Офисная мебель','Диваны, столы, стулья',NULL,'products','2',NULL,NULL,NULL),(19,'2024-02-07 14:20:22','iblock','S3',0,NULL,NULL,NULL,'=ID=3&EXTERNAL_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Мебель для кухни','Полки, ящики, столы и стулья',NULL,'products','2',NULL,NULL,NULL),(20,'2024-02-07 14:20:22','iblock','S4',0,NULL,NULL,NULL,'=ID=4&EXTERNAL_ID=5&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Детская мебель','Кровати, стулья, мягкая детская мебель',NULL,'products','2',NULL,NULL,NULL),(21,'2024-02-28 12:01:21','iblock','4',0,NULL,NULL,NULL,'=ID=4&EXTERNAL_ID=10&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Герцог','Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.\r\r\n \rИзящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.','','products','2',NULL,NULL,NULL),(22,'2024-02-28 12:01:38','iblock','5',0,NULL,NULL,NULL,'=ID=5&EXTERNAL_ID=11&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Монализа','Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\rПо желанию клиента возможна простежка на спинке и подлокотниках.\r\r\n \rБогатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\rПо желанию клиента возможна простежка на спинке и подлокотниках.','','products','2',NULL,NULL,NULL),(23,'2024-02-28 12:01:59','iblock','6',0,NULL,NULL,NULL,'=ID=6&EXTERNAL_ID=12&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Министр','Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \rС его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.\r\r\n \rКресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \rС его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.','','products','2',NULL,NULL,NULL),(24,'2024-02-28 12:01:47','iblock','7',0,NULL,NULL,NULL,'=ID=7&EXTERNAL_ID=13&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=','Хром','Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \rсчет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \rТвердая спинка жестко поддерживает позвоночник.\r\r\n \rДинамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \rсчет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \rТвердая спинка жестко поддерживает позвоночник.','','products','2',NULL,NULL,NULL),(25,'2024-02-07 14:20:22','iblock','8',0,NULL,NULL,NULL,'=ID=8&EXTERNAL_ID=14&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Ливерпуль','Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \rсоздают особую атмосферу в кухне.\r\r\n \rДеревянные стулья Ливерпуль, выполненные в классическом английском стиле, \rсоздают особую атмосферу в кухне.','','products','2',NULL,NULL,NULL),(26,'2024-02-07 14:20:22','iblock','9',0,NULL,NULL,NULL,'=ID=9&EXTERNAL_ID=15&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Изабелла','Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.\r\r\n \rИзящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.','','products','2',NULL,NULL,NULL),(27,'2024-02-07 14:20:22','iblock','10',0,NULL,NULL,NULL,'=ID=10&EXTERNAL_ID=16&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Аладдин','Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \rпридают изделию необыкновенный шарм и элегантную роскошь. \rПо желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»\r\r\n \rКомфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \rпридают изделию необыкновенный шарм и элегантную роскошь. \rПо желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»','','products','2',NULL,NULL,NULL),(28,'2024-02-07 14:20:22','iblock','11',0,NULL,NULL,NULL,'=ID=11&EXTERNAL_ID=17&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Джоконда','Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \rОбивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.\r\r\n \rИзящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \rОбивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.','','products','2',NULL,NULL,NULL),(29,'2024-02-07 14:20:22','iblock','12',0,NULL,NULL,NULL,'=ID=12&EXTERNAL_ID=18&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Флора','Классическая модель создана для украшения роскошных интерьеров. \rЭлегантность и колоритность модели придают накладки из натурального дерева.\r\r\n \rКлассическая модель создана для украшения роскошных интерьеров. \rЭлегантность и колоритность модели придают накладки из натурального дерева.','','products','2',NULL,NULL,NULL),(30,'2024-02-07 14:20:22','iblock','13',0,NULL,NULL,NULL,'=ID=13&EXTERNAL_ID=19&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Престиж','Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.\r\r\n \rТахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.','','products','2',NULL,NULL,NULL),(31,'2024-02-07 14:20:22','iblock','14',0,NULL,NULL,NULL,'=ID=14&EXTERNAL_ID=20&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Лаура','Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \rЭлитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.\r\r\n \rДвухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \rЭлитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.','','products','2',NULL,NULL,NULL),(32,'2024-02-07 14:20:22','iblock','15',0,NULL,NULL,NULL,'=ID=15&EXTERNAL_ID=21&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Модерн','Основными характеристиками данной серии является новизна дизайнерской мысли, \rкоторая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \rкоторая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \rЧто в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \rДанная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \rно и самого времени.\r\r\n \rОсновными характеристиками данной серии является новизна дизайнерской мысли, \rкоторая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \rкоторая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \rЧто в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \rДанная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \rно и самого времени.','','products','2',NULL,NULL,NULL),(33,'2024-02-07 14:20:22','iblock','16',0,NULL,NULL,NULL,'=ID=16&EXTERNAL_ID=22&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Оптима','Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \rПравильно организовать рабочее пространство - значит помочь коллегам выполнять свои функции быстрее и эффективнее.\rСерия \r«Оптима»\rпозволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \rобязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы помогут рационально использовать \rпространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.\rМебель \r«Оптима»\r- это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\r\n \rУдачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство - значит помочь коллегам выполнять свои функции быстрее и эффективнее.\rСерия \r«Оптима»\rпозволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.\rМебель \r«Оптима»\r- это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.','','products','2',NULL,NULL,NULL),(34,'2024-02-07 14:20:22','iblock','17',0,NULL,NULL,NULL,'=ID=17&EXTERNAL_ID=23&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Собрание','Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\rУдивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\r\n \rЗаходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\rУдивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.','','products','2',NULL,NULL,NULL),(35,'2024-02-07 14:20:22','iblock','18',0,NULL,NULL,NULL,'=ID=18&EXTERNAL_ID=24&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Лидер','Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \rСлева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \rСправа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \rосновными достоинствами данной серии.\r\r\n \rЭтот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \rСлева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \rСправа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \rосновными достоинствами данной серии.','','products','2',NULL,NULL,NULL),(36,'2024-02-07 14:20:22','iblock','19',0,NULL,NULL,NULL,'=ID=19&EXTERNAL_ID=25&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Президент','Кресло руководителя Президент\rво главе большого круглого стола поможет создать в вашем кабинете\rобстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \rпоможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.\r\r\n \rКресло руководителя Президент\rво главе большого круглого стола поможет создать в вашем кабинете\rобстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \rпоможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \rДизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \rПроизводится ограниченными партиями - не более 10 кресел в год.','','products','2',NULL,NULL,NULL),(37,'2024-02-07 14:20:22','iblock','20',0,NULL,NULL,NULL,'=ID=20&EXTERNAL_ID=26&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Плутон','Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \rДанная модель будет незаменима для тех, кто много работает за компьютером.\r\r\n \rОфисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \rДанная модель будет незаменима для тех, кто много работает за компьютером.','','products','2',NULL,NULL,NULL),(38,'2024-02-07 14:20:22','iblock','21',0,NULL,NULL,NULL,'=ID=21&EXTERNAL_ID=27&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Парма','Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \rСтул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \rТонировка деревянных деталей может быть выполнена в любой цветовой палитре.\r\r\n \r <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>','','products','2',NULL,NULL,NULL),(39,'2024-02-07 14:20:22','iblock','22',0,NULL,NULL,NULL,'=ID=22&EXTERNAL_ID=28&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Палермо','Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \rи в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \rорганично сольются с его стилем.\r\r\n \rУниверсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \rи в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \rорганично сольются с его стилем.','','products','2',NULL,NULL,NULL),(40,'2024-02-07 14:20:22','iblock','23',0,NULL,NULL,NULL,'=ID=23&EXTERNAL_ID=29&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Валенсия','Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \rмягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \rперсонала.\r\r\n \rСтильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \rмягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \rперсонала.','','products','2',NULL,NULL,NULL),(41,'2024-02-07 14:20:22','iblock','24',0,NULL,NULL,NULL,'=ID=24&EXTERNAL_ID=30&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Фазенда','Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \rТкань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.\r\r\n \rСкладной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \rТкань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.','','products','2',NULL,NULL,NULL),(42,'2024-02-07 14:20:22','iblock','25',0,NULL,NULL,NULL,'=ID=25&EXTERNAL_ID=31&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Эра','Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \rчто можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \rк компьютерной стойке, также ее можно использовать как мебель для кафе и баров.\r\r\n \rСтильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \rчто можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \rк компьютерной стойке, также ее можно использовать как мебель для кафе и баров.','','products','2',NULL,NULL,NULL),(43,'2024-02-07 14:20:22','iblock','26',0,NULL,NULL,NULL,'=ID=26&EXTERNAL_ID=32&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Сити','Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \rсвоей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \rлюбой компьютерной мебелью.\r\r\n \rСтильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \rсвоей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \rлюбой компьютерной мебелью.','','products','2',NULL,NULL,NULL),(44,'2024-02-07 14:20:22','iblock','27',0,NULL,NULL,NULL,'=ID=27&EXTERNAL_ID=33&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=','Изопласт Хром','Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \rсиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \rв качестве аудиторных конференц-кресел, кроме того, их легко хранить.\r\r\n \rПопулярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \rсиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \rв качестве аудиторных конференц-кресел, кроме того, их легко хранить.','','products','2',NULL,NULL,NULL),(45,'2024-02-07 14:20:22','iblock','28',0,NULL,NULL,NULL,'=ID=28&EXTERNAL_ID=5&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=3&IBLOCK_CODE=furniture_services&IBLOCK_EXTERNAL_ID=furniture_services&CODE=','Мебель на заказ','Наша компания занимается разработкой мебели на заказ.\r\n \rНаша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\rгардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.\rМы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\rПо Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\rпроизведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.\rПосле заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\rгде опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\rнепосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\rсотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\rвносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.','','products','3',NULL,NULL,NULL),(46,'2024-02-07 14:20:22','iblock','29',0,NULL,NULL,NULL,'=ID=29&EXTERNAL_ID=6&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=3&IBLOCK_CODE=furniture_services&IBLOCK_EXTERNAL_ID=furniture_services&CODE=','Услуги дизайнера','Мы предлагаем широкий спектр услуг по дизайну мебели.\r\n \rДиагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.\rРазработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.\rРазработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие, рассмотреть его в деталях.\rПодбор и расстановка мебели.\rДекорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.','','products','3',NULL,NULL,NULL),(47,'2010-05-01 00:00:00','iblock','30',0,NULL,NULL,NULL,'=ID=30&EXTERNAL_ID=2&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=','Продавец-дизайнер (кухни)','Требования\rУверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения\rОбязанности\rКонсультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.\rУсловия\rЗарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(48,'2010-05-01 00:00:00','iblock','31',0,NULL,NULL,NULL,'=ID=31&EXTERNAL_ID=3&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=','Директор магазина','Требования\rВысшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.\rОбязанности\rРуководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.\rУсловия\rТрудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(49,'2010-05-01 00:00:00','iblock','32',0,NULL,NULL,NULL,'=ID=32&EXTERNAL_ID=4&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=','Бухгалтер отдела учета готовой продукции','Требования\rЖен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.\rОбязанности\rРабота с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя\rУсловия\rГрафик работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.','','vacancies','4',NULL,'2010-05-01 00:00:00',NULL),(51,'2024-02-28 11:35:58','main','s1|/company/otzyvy/index.php',0,NULL,NULL,NULL,'/company/otzyvy/index.php','Отзывы','','','','',NULL,NULL,NULL),(52,'2024-02-27 10:25:21','main','s1|/aktsii/index.php',0,NULL,NULL,NULL,'/aktsii/index.php','Акции','','','','',NULL,NULL,NULL),(53,'2024-02-09 09:27:17','main','s1|/partnyeram/index.php',0,NULL,NULL,NULL,'/partnyeram/index.php','Условия сотрудничества','Участие в партнерской программе выводит бизнес веб-разработчиков на новый уровень, позволяет: \nРаботать с крупными корпоративными заказчиками\rТакие заказчики тщательно подходят к вопросу снижения рисков и выбирают стандартную, распространенную, отчуждаемую от разработчика и функциональную платформу «1С-Битрикс: Управление сайтом».\nПовысить сложность проектов \rГотовые функциональные возможности платформы позволяют работать над более функциональными и сложными, но и более дорогими и интересными проектами.\rПовысить качество проектов\rПлатформа тщательно тестируется, всегда доступна служба технической поддержки. Это дает партнерам возможность добиваться высокого качества реализуемых проектов.\n \n \nКак стать партнером\r1. Зарегистрироваться на сайте\nРегистрируясь на сайте, вы получаете свой аккаунт (логин), под которым в дальнейшем будете управлять карточкой партнера, оформлять заказы с партнерской скидкой, получите доступ к закрытым разделам партнерского сайта и форуму.\nАвторизуясь на сайте как партнер, вы получите возможность обращаться в нашу техническую поддержку с повышенным приоритетом.\n \n2. Заполнить анкету партнера\nНа основании данных из анкеты партнера мы принимаем решение о возможности установления партнерских отношений. Мы так же хотели бы видеть ваш полноценный работающий корпоративный сайт с указанием ваших контактов и перечнем предлагаемых услуг. Партнерская программа предназначена для студий дизайна, разработчиков сайтов, интеграторов и всех тех, кто профессионально занимается разработкой веб-решений для конечных клиентов.\nПосле проверки анкеты с нашей стороны вы сразу получаете возможность оформлять заказы с партнерской скидкой\n \n3. Выслать подписанный бумажный договор по почте\n \nПосле того как ваша анкета будет одобрена, вам придет уведомление на ваш e-mail о начале сотрудничества. После этого вам нужно подписать бумажный договор с нашей компанией. Вам потребуется заполнить реквизиты, распечатать два экземпляра договора, подписать со своей стороны и выслать на адрес нашей компании. Мы, со своей стороны, подпишем договор и отправим один экземпляр вам.','','','',NULL,NULL,NULL),(54,'2024-02-09 08:34:54','main','s1|/partnyeram/usloviya-sotrudnichestva/index.php',0,NULL,NULL,NULL,'/partnyeram/usloviya-sotrudnichestva/index.php','Условия сотрудничества','Text here....','','','',NULL,NULL,NULL),(55,'2024-02-09 08:35:28','main','s1|/partnyeram/usloviya-sotrudnichestva/raspisanie-meropriyatiy/index.php',0,NULL,NULL,NULL,'/partnyeram/usloviya-sotrudnichestva/raspisanie-meropriyatiy/index.php','Расписание мероприятий','Text here....','','','',NULL,NULL,NULL),(56,'2024-02-09 08:58:41','main','s1|/partnyeram/usloviya-sotrudnichestva.php',0,NULL,NULL,NULL,'/partnyeram/usloviya-sotrudnichestva.php','Условия сотрудничества','Text here....','','','',NULL,NULL,NULL),(57,'2024-02-09 08:43:04','main','s1|/partnyeram/raspisanie-meropriyatiy.php',0,NULL,NULL,NULL,'/partnyeram/raspisanie-meropriyatiy.php','Расписание мероприятий','Text here....','','','',NULL,NULL,NULL),(58,'2024-02-09 09:09:58','main','s1|/partnyeram/raspisanie-meropriyatiy/index.php',0,NULL,NULL,NULL,'/partnyeram/raspisanie-meropriyatiy/index.php','Расписание мероприятий','Text here....','','','',NULL,NULL,NULL),(59,'2024-02-09 09:10:41','main','s1|/partnyeram/raspisanie-meropriyatiy/kak-stat-partnerom.php',0,NULL,NULL,NULL,'/partnyeram/raspisanie-meropriyatiy/kak-stat-partnerom.php','Как стать партнером','Text here....','','','',NULL,NULL,NULL),(60,'2024-02-09 09:20:25','main','s1|/partnyeram/kak-stat-partnerom.php',0,NULL,NULL,NULL,'/partnyeram/kak-stat-partnerom.php','Как стать партнером','Text here....','','','',NULL,NULL,NULL),(61,'2024-02-21 09:45:55','main','s1|/index.php',0,NULL,NULL,NULL,'/index.php','Мебельная компания','','','','',NULL,NULL,NULL),(64,'2024-02-22 10:46:58','main','s1|/otzyvy.php',0,NULL,NULL,NULL,'/otzyvy.php','Отзывы','Отзывы','','','',NULL,NULL,NULL),(65,'2024-02-28 12:41:56','main','s1|/company/test.php',0,NULL,NULL,NULL,'/company/test.php','test','','','','',NULL,NULL,NULL),(66,'2024-02-23 14:15:54','main','s1|/company/spalni.php',0,NULL,NULL,NULL,'/company/spalni.php','Спальни','Text here....','','','',NULL,NULL,NULL),(67,'2024-02-24 16:42:27','main','s1|/company/polzovatel/index.php',0,NULL,NULL,NULL,'/company/polzovatel/index.php','Пользователь','Text here....','','','',NULL,NULL,NULL),(68,'2024-02-25 10:23:48','main','s1|/company/polzovatel/registraitsya.php',0,NULL,NULL,NULL,'/company/polzovatel/registraitsya.php','Регистраиця','','','','',NULL,NULL,NULL),(69,'2024-02-24 16:46:03','main','s1|/company/polzovatel/polzovatel.php',0,NULL,NULL,NULL,'/company/polzovatel/polzovatel.php','Пользователь','','','','',NULL,NULL,NULL),(71,'2024-02-27 09:38:40','iblock','34',0,NULL,NULL,NULL,'=ID=34&EXTERNAL_ID=34&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=comments&IBLOCK_ID=17&IBLOCK_CODE=surname_author&IBLOCK_EXTERNAL_ID=&CODE=ivanov','Иванов','Круто, наверное это полезно...','','comments','17',NULL,NULL,NULL),(72,'2024-02-27 09:38:03','iblock','35',0,NULL,NULL,NULL,'=ID=35&EXTERNAL_ID=35&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=comments&IBLOCK_ID=17&IBLOCK_CODE=surname_author&IBLOCK_EXTERNAL_ID=&CODE=sidorova','Сидорова','Невероятная вёрстка','','comments','17',NULL,NULL,NULL),(73,'2024-02-27 09:38:11','iblock','36',0,NULL,NULL,NULL,'=ID=36&EXTERNAL_ID=36&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=comments&IBLOCK_ID=17&IBLOCK_CODE=surname_author&IBLOCK_EXTERNAL_ID=&CODE=petrov','Петров','Да','','comments','17',NULL,NULL,NULL),(74,'2024-02-27 09:38:30','iblock','37',0,NULL,NULL,NULL,'=ID=37&EXTERNAL_ID=37&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=comments&IBLOCK_ID=17&IBLOCK_CODE=surname_author&IBLOCK_EXTERNAL_ID=&CODE=smirnova','Смирнова','Что с хлебными крошками','','comments','17',NULL,NULL,NULL),(75,'2024-02-27 09:38:50','iblock','38',0,NULL,NULL,NULL,'=ID=38&EXTERNAL_ID=38&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=comments&IBLOCK_ID=17&IBLOCK_CODE=surname_author&IBLOCK_EXTERNAL_ID=&CODE=kozlov','Козлов','Анонс это как?','','comments','17',NULL,NULL,NULL),(76,'2024-02-27 09:39:14','iblock','39',0,NULL,NULL,NULL,'=ID=39&EXTERNAL_ID=39&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=comments&IBLOCK_ID=17&IBLOCK_CODE=surname_author&IBLOCK_EXTERNAL_ID=&CODE=nikitina','Никитина','Козлов создан нейросетью?','','comments','17',NULL,NULL,NULL),(77,'2024-02-27 10:27:26','iblock','40',0,NULL,NULL,NULL,'=ID=40&EXTERNAL_ID=40&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=action&IBLOCK_ID=18&IBLOCK_CODE=action&IBLOCK_EXTERNAL_ID=&CODE=','Акция_1','','','action','18',NULL,NULL,NULL),(78,'2024-02-27 10:27:14','iblock','41',0,NULL,NULL,NULL,'=ID=41&EXTERNAL_ID=41&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=action&IBLOCK_ID=18&IBLOCK_CODE=action&IBLOCK_EXTERNAL_ID=&CODE=','Акция_2','','','action','18',NULL,NULL,NULL),(79,'2024-02-27 10:27:04','iblock','42',0,NULL,NULL,NULL,'=ID=42&EXTERNAL_ID=42&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=action&IBLOCK_ID=18&IBLOCK_CODE=action&IBLOCK_EXTERNAL_ID=&CODE=','Акция_3','','','action','18',NULL,NULL,NULL);
/*!40000 ALTER TABLE `b_search_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_freq`
--

DROP TABLE IF EXISTS `b_search_content_freq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT 0,
  `LANGUAGE_ID` char(2) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_freq`
--

LOCK TABLES `b_search_content_freq` WRITE;
/*!40000 ALTER TABLE `b_search_content_freq` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_freq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_param`
--

DROP TABLE IF EXISTS `b_search_content_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) NOT NULL,
  `PARAM_VALUE` varchar(100) NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_param`
--

LOCK TABLES `b_search_content_param` WRITE;
/*!40000 ALTER TABLE `b_search_content_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_right`
--

DROP TABLE IF EXISTS `b_search_content_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_right`
--

LOCK TABLES `b_search_content_right` WRITE;
/*!40000 ALTER TABLE `b_search_content_right` DISABLE KEYS */;
INSERT INTO `b_search_content_right` VALUES (1,'G2'),(2,'G2'),(4,'G2'),(5,'G2'),(6,'G2'),(7,'G2'),(8,'G2'),(9,'G2'),(10,'G2'),(11,'G2'),(12,'G2'),(13,'G2'),(14,'G1'),(14,'G2'),(15,'G1'),(15,'G2'),(16,'G1'),(16,'G2'),(17,'G2'),(18,'G2'),(19,'G2'),(20,'G2'),(21,'G1'),(21,'G2'),(22,'G1'),(22,'G2'),(23,'G1'),(23,'G2'),(24,'G1'),(24,'G2'),(25,'G2'),(26,'G2'),(27,'G2'),(28,'G2'),(29,'G2'),(30,'G2'),(31,'G2'),(32,'G2'),(33,'G2'),(34,'G2'),(35,'G2'),(36,'G2'),(37,'G2'),(38,'G2'),(39,'G2'),(40,'G2'),(41,'G2'),(42,'G2'),(43,'G2'),(44,'G2'),(45,'G2'),(46,'G2'),(47,'G2'),(48,'G2'),(49,'G2'),(51,'G2'),(52,'G2'),(53,'G2'),(54,'G2'),(55,'G2'),(56,'G2'),(57,'G2'),(58,'G2'),(59,'G2'),(60,'G2'),(61,'G2'),(64,'G2'),(65,'G2'),(66,'G2'),(67,'G2'),(68,'G2'),(69,'G2'),(71,'G1'),(71,'G2'),(72,'G1'),(72,'G2'),(73,'G1'),(73,'G2'),(74,'G1'),(74,'G2'),(75,'G1'),(75,'G2'),(76,'G1'),(76,'G2'),(77,'G1'),(77,'G2'),(78,'G1'),(78,'G2'),(79,'G1'),(79,'G2');
/*!40000 ALTER TABLE `b_search_content_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_site`
--

DROP TABLE IF EXISTS `b_search_content_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `URL` text DEFAULT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_site`
--

LOCK TABLES `b_search_content_site` WRITE;
/*!40000 ALTER TABLE `b_search_content_site` DISABLE KEYS */;
INSERT INTO `b_search_content_site` VALUES (1,'s1',''),(2,'s1',''),(4,'s1',''),(5,'s1',''),(6,'s1',''),(7,'s1',''),(8,'s1',''),(9,'s1',''),(10,'s1',''),(11,'s1',''),(12,'s1',''),(13,'s1',''),(14,'s1',''),(15,'s1',''),(16,'s1',''),(17,'s1',''),(18,'s1',''),(19,'s1',''),(20,'s1',''),(21,'s1',''),(22,'s1',''),(23,'s1',''),(24,'s1',''),(25,'s1',''),(26,'s1',''),(27,'s1',''),(28,'s1',''),(29,'s1',''),(30,'s1',''),(31,'s1',''),(32,'s1',''),(33,'s1',''),(34,'s1',''),(35,'s1',''),(36,'s1',''),(37,'s1',''),(38,'s1',''),(39,'s1',''),(40,'s1',''),(41,'s1',''),(42,'s1',''),(43,'s1',''),(44,'s1',''),(45,'s1',''),(46,'s1',''),(47,'s1',''),(48,'s1',''),(49,'s1',''),(51,'s1',''),(52,'s1',''),(53,'s1',''),(54,'s1',''),(55,'s1',''),(56,'s1',''),(57,'s1',''),(58,'s1',''),(59,'s1',''),(60,'s1',''),(61,'s1',''),(64,'s1',''),(65,'s1',''),(66,'s1',''),(67,'s1',''),(68,'s1',''),(69,'s1',''),(71,'s1',''),(72,'s1',''),(73,'s1',''),(74,'s1',''),(75,'s1',''),(76,'s1',''),(77,'s1',''),(78,'s1',''),(79,'s1','');
/*!40000 ALTER TABLE `b_search_content_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_stem`
--

DROP TABLE IF EXISTS `b_search_content_stem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_stem`
--

LOCK TABLES `b_search_content_stem` WRITE;
/*!40000 ALTER TABLE `b_search_content_stem` DISABLE KEYS */;
INSERT INTO `b_search_content_stem` VALUES (1,'ru',1,0.2314,1),(1,'ru',2,0.2314,2),(7,'ru',2,0.2314,3),(53,'ru',2,0.4081,152.375),(2,'ru',3,0.2314,1),(53,'ru',4,0.1287,215),(45,'ru',4,0.1417,173),(4,'ru',4,0.1679,99),(46,'ru',4,0.2424,4),(15,'ru',5,0.1573,2),(47,'ru',5,0.1738,19),(16,'ru',5,0.2165,56),(61,'ru',5,0.2314,1),(11,'ru',5,0.2784,342.25),(10,'ru',5,0.2953,187.25),(4,'ru',5,0.3359,21.3333),(8,'ru',5,0.4288,101.25),(9,'ru',5,0.4356,287.667),(14,'ru',5,0.4526,127.1),(14,'ru',6,0.1308,54),(15,'ru',6,0.1573,85),(53,'ru',6,0.204,314.5),(33,'ru',6,0.2233,68),(45,'ru',6,0.2246,11),(61,'ru',6,0.2314,2),(11,'ru',6,0.3597,217),(4,'ru',6,0.39,17.75),(10,'ru',6,0.4559,183.636),(8,'ru',6,0.5006,145.25),(9,'ru',6,0.5249,284.333),(6,'ru',7,0.2662,25.5),(45,'ru',7,0.2835,30.3333),(10,'ru',7,0.2953,359.5),(53,'ru',7,0.2989,258.75),(4,'ru',7,0.39,64.75),(11,'ru',7,0.4148,289.4),(11,'ru',8,0.1199,5),(4,'ru',8,0.1679,5),(9,'ru',9,0.1177,378),(11,'ru',9,0.1199,7),(16,'ru',9,0.1366,67),(4,'ru',9,0.1679,7),(9,'ru',10,0.1177,379),(11,'ru',10,0.1199,8),(4,'ru',10,0.1679,8),(14,'ru',10,0.2074,197.5),(8,'ru',10,0.2144,32.5),(11,'ru',11,0.1199,10),(4,'ru',11,0.1679,10),(36,'ru',12,0.1577,133),(4,'ru',12,0.1679,11),(9,'ru',12,0.1866,333.5),(11,'ru',12,0.19,248),(15,'ru',12,0.3146,57),(14,'ru',12,0.3925,115.714),(8,'ru',12,0.4058,150.143),(11,'ru',13,0.1199,19),(15,'ru',13,0.1573,97),(4,'ru',13,0.1679,19),(45,'ru',13,0.2246,134),(8,'ru',13,0.2706,139.667),(4,'ru',14,0.1679,22),(11,'ru',14,0.19,254),(11,'ru',15,0.1199,23),(10,'ru',15,0.1272,67),(8,'ru',15,0.1353,91),(4,'ru',15,0.1679,23),(36,'ru',15,0.25,31),(11,'ru',16,0.1199,24),(10,'ru',16,0.1272,121),(8,'ru',16,0.1353,231),(4,'ru',16,0.1679,24),(11,'ru',17,0.1199,26),(4,'ru',17,0.1679,26),(11,'ru',18,0.1199,27),(48,'ru',18,0.1626,28),(4,'ru',18,0.1679,27),(11,'ru',19,0.1199,28),(4,'ru',19,0.1679,28),(33,'ru',19,0.2233,138),(9,'ru',20,0.1866,113.5),(11,'ru',20,0.2398,312.333),(4,'ru',20,0.2662,54.5),(11,'ru',21,0.1199,32),(53,'ru',21,0.1287,16),(4,'ru',21,0.1679,32),(9,'ru',22,0.1177,288),(4,'ru',22,0.1679,33),(11,'ru',22,0.19,257),(11,'ru',23,0.1199,34),(14,'ru',23,0.1308,115),(45,'ru',23,0.1417,28),(4,'ru',23,0.1679,34),(47,'ru',24,0.1738,29),(19,'ru',24,0.2314,1),(18,'ru',24,0.2314,2),(32,'ru',24,0.2351,58),(15,'ru',24,0.2493,62.5),(36,'ru',24,0.25,52),(42,'ru',24,0.2613,68.5),(6,'ru',24,0.2662,19),(4,'ru',24,0.2662,41),(40,'ru',24,0.2823,51),(43,'ru',24,0.2921,50),(33,'ru',24,0.3271,102.5),(34,'ru',24,0.3281,125.5),(9,'ru',24,0.3531,261.143),(46,'ru',24,0.3551,57),(11,'ru',24,0.3597,156.286),(20,'ru',24,0.3667,4.5),(17,'ru',24,0.3667,5),(45,'ru',24,0.3979,67),(14,'ru',24,0.4346,136.778),(10,'ru',25,0.1272,370),(14,'ru',25,0.1308,60),(4,'ru',25,0.1679,37),(9,'ru',25,0.2354,315.333),(11,'ru',25,0.2784,327.5),(14,'ru',26,0.1308,286),(4,'ru',26,0.1679,45),(11,'ru',26,0.2398,293.667),(11,'ru',27,0.1199,398),(10,'ru',27,0.1272,130),(4,'ru',27,0.1679,46),(8,'ru',27,0.2144,136),(45,'ru',27,0.2246,139.5),(9,'ru',27,0.2354,231),(14,'ru',27,0.2616,134.667),(4,'ru',28,0.1679,49),(11,'ru',28,0.19,373),(11,'ru',29,0.1199,402),(10,'ru',29,0.1272,252),(15,'ru',29,0.1573,66),(4,'ru',29,0.1679,50),(9,'ru',29,0.2733,413.75),(11,'ru',30,0.1199,404),(4,'ru',30,0.1679,52),(16,'ru',30,0.2165,50),(11,'ru',31,0.1199,405),(4,'ru',31,0.1679,53),(11,'ru',32,0.1199,406),(4,'ru',32,0.1679,54),(11,'ru',33,0.1199,407),(4,'ru',33,0.1679,55),(27,'ru',33,0.2823,33.5),(28,'ru',33,0.2853,28),(4,'ru',34,0.1679,56),(11,'ru',34,0.19,376),(10,'ru',34,0.2015,228),(46,'ru',35,0.1529,91),(53,'ru',35,0.204,32.5),(34,'ru',35,0.224,134),(11,'ru',35,0.2398,374.333),(4,'ru',35,0.2662,69.5),(43,'ru',35,0.2921,43),(11,'ru',36,0.2398,306),(4,'ru',36,0.2662,70.5),(10,'ru',37,0.1272,288),(53,'ru',37,0.1287,92),(46,'ru',37,0.1529,87),(4,'ru',37,0.1679,60),(11,'ru',37,0.19,267.5),(35,'ru',37,0.2577,87.5),(23,'ru',37,0.2886,45.5),(9,'ru',38,0.1177,117),(4,'ru',38,0.1679,61),(53,'ru',38,0.204,82.5),(34,'ru',38,0.224,113),(44,'ru',38,0.2754,57.5),(10,'ru',38,0.2953,125.25),(16,'ru',38,0.3171,176.25),(11,'ru',38,0.3366,418.333),(8,'ru',39,0.1353,60),(49,'ru',39,0.1626,5),(6,'ru',39,0.1679,99),(4,'ru',39,0.2662,80),(9,'ru',39,0.2733,226),(10,'ru',39,0.2953,159.5),(11,'ru',39,0.3597,330.857),(11,'ru',40,0.1199,421),(4,'ru',40,0.1679,69),(11,'ru',41,0.1199,422),(10,'ru',41,0.1272,9),(8,'ru',41,0.1353,67),(49,'ru',41,0.1626,49),(4,'ru',41,0.1679,70),(9,'ru',41,0.3304,372.167),(11,'ru',42,0.1199,423),(4,'ru',42,0.1679,71),(11,'ru',43,0.1199,425),(4,'ru',43,0.1679,73),(9,'ru',44,0.1177,548),(46,'ru',44,0.1529,138),(45,'ru',44,0.2246,43),(32,'ru',44,0.2351,97),(11,'ru',44,0.2398,304),(4,'ru',44,0.2662,81),(11,'ru',45,0.1199,428),(4,'ru',45,0.1679,76),(11,'ru',46,0.1199,432),(4,'ru',46,0.1679,80),(53,'ru',46,0.2575,302),(11,'ru',47,0.1199,435),(4,'ru',47,0.1679,83),(10,'ru',47,0.2543,177.667),(11,'ru',48,0.1199,436),(4,'ru',48,0.1679,84),(11,'ru',49,0.1199,437),(46,'ru',49,0.1529,97),(4,'ru',49,0.1679,85),(27,'ru',49,0.2823,36.5),(28,'ru',49,0.2853,31),(10,'ru',50,0.1272,336),(53,'ru',50,0.1287,22),(4,'ru',50,0.1679,88),(11,'ru',50,0.19,243.5),(11,'ru',51,0.1199,442),(45,'ru',51,0.1417,39),(4,'ru',51,0.1679,90),(6,'ru',52,0.1679,1),(53,'ru',52,0.204,211),(6,'ru',53,0.2662,18),(14,'ru',54,0.1308,235),(6,'ru',54,0.1679,5),(10,'ru',54,0.2015,287),(45,'ru',54,0.2246,101.5),(11,'ru',54,0.2398,301.333),(11,'ru',55,0.1199,497),(14,'ru',55,0.1308,244),(6,'ru',55,0.1679,7),(53,'ru',55,0.204,144),(16,'ru',55,0.2165,3),(11,'ru',56,0.1199,328),(10,'ru',56,0.1272,243),(53,'ru',56,0.1287,234),(6,'ru',56,0.1679,8),(6,'ru',57,0.1679,9),(10,'ru',58,0.1272,387),(53,'ru',58,0.1287,24),(36,'ru',58,0.25,62),(34,'ru',58,0.3281,89),(6,'ru',58,0.3359,54.3333),(6,'ru',59,0.1679,12),(10,'ru',59,0.2015,235),(46,'ru',59,0.2424,95),(6,'ru',60,0.1679,14),(53,'ru',61,0.1287,226),(46,'ru',61,0.1529,9),(36,'ru',61,0.1577,98),(6,'ru',61,0.1679,17),(11,'ru',61,0.19,197),(35,'ru',61,0.2577,85.5),(40,'ru',61,0.2823,22),(39,'ru',61,0.2823,25),(53,'ru',62,0.1287,236),(6,'ru',62,0.1679,18),(45,'ru',62,0.2246,13),(46,'ru',62,0.3551,44.5),(8,'ru',63,0.1353,257),(6,'ru',63,0.1679,19),(53,'ru',63,0.204,119.5),(6,'ru',64,0.1679,20),(6,'ru',65,0.1679,22),(45,'ru',65,0.3291,170.75),(11,'ru',66,0.1199,62),(45,'ru',66,0.1417,55),(15,'ru',66,0.1573,58),(6,'ru',66,0.1679,26),(6,'ru',67,0.1679,33),(38,'ru',67,0.2694,62.5),(28,'ru',67,0.2853,44),(30,'ru',67,0.3413,39),(26,'ru',67,0.3608,26),(11,'ru',68,0.1199,54),(6,'ru',68,0.1679,36),(6,'ru',69,0.39,62.75),(6,'ru',70,0.1679,40),(53,'ru',71,0.1287,272),(6,'ru',71,0.1679,41),(6,'ru',72,0.1679,43),(9,'ru',72,0.1866,347),(45,'ru',72,0.2246,152.5),(48,'ru',72,0.2577,25),(53,'ru',72,0.2989,305.75),(6,'ru',73,0.1679,45),(14,'ru',74,0.1308,130),(45,'ru',74,0.1417,57),(15,'ru',74,0.1573,56),(9,'ru',74,0.1866,17),(11,'ru',74,0.19,77.5),(33,'ru',74,0.2233,158),(32,'ru',74,0.2351,94),(6,'ru',74,0.2662,81),(6,'ru',75,0.1679,54),(6,'ru',76,0.1679,55),(6,'ru',77,0.1679,56),(33,'ru',77,0.2233,80),(6,'ru',78,0.1679,59),(6,'ru',79,0.1679,71),(6,'ru',80,0.3359,74.6667),(6,'ru',81,0.1679,73),(6,'ru',82,0.1679,76),(6,'ru',83,0.1679,78),(6,'ru',84,0.1679,79),(6,'ru',85,0.1679,80),(6,'ru',86,0.3359,91),(9,'ru',87,0.1177,507),(15,'ru',87,0.1573,116),(6,'ru',87,0.1679,88),(6,'ru',88,0.1679,90),(6,'ru',89,0.1679,98),(6,'ru',90,0.1679,100),(6,'ru',91,0.1679,108),(6,'ru',92,0.1679,109),(14,'ru',92,0.2074,27),(55,'ru',92,0.2314,2),(57,'ru',92,0.2314,2),(58,'ru',92,0.2314,2),(6,'ru',93,0.1679,110),(6,'ru',94,0.1679,116),(9,'ru',94,0.1866,242),(7,'ru',95,0.2314,1),(53,'ru',96,0.1287,110),(7,'ru',96,0.2314,5),(9,'ru',97,0.1177,528),(8,'ru',97,0.1353,2),(33,'ru',97,0.2233,65),(7,'ru',97,0.2314,7),(7,'ru',98,0.2314,8),(7,'ru',99,0.2314,14),(11,'ru',100,0.1199,43),(7,'ru',100,0.2314,16),(7,'ru',101,0.2314,17),(48,'ru',102,0.1626,41),(8,'ru',102,0.2144,5.5),(10,'ru',103,0.1272,137),(14,'ru',103,0.1308,250),(9,'ru',103,0.1866,179.5),(8,'ru',103,0.2144,104.5),(53,'ru',104,0.1287,8),(9,'ru',104,0.1866,562.5),(10,'ru',104,0.2015,329.5),(8,'ru',104,0.2144,76.5),(11,'ru',105,0.1199,199),(8,'ru',105,0.1353,6),(33,'ru',105,0.2233,63),(37,'ru',105,0.3042,45.5),(9,'ru',106,0.1177,338),(11,'ru',106,0.1199,154),(10,'ru',106,0.1272,264),(14,'ru',106,0.1308,269),(8,'ru',106,0.1353,7),(8,'ru',107,0.1353,8),(8,'ru',108,0.1353,9),(47,'ru',108,0.1738,15),(11,'ru',108,0.2398,247.667),(10,'ru',108,0.2953,156.5),(48,'ru',108,0.3252,43.3333),(49,'ru',108,0.3776,47.25),(11,'ru',109,0.1199,310),(8,'ru',109,0.1353,22),(8,'ru',110,0.1353,23),(48,'ru',110,0.1626,13),(8,'ru',111,0.1353,35),(8,'ru',112,0.1353,38),(8,'ru',113,0.1353,39),(8,'ru',114,0.1353,40),(11,'ru',115,0.1199,479),(10,'ru',115,0.1272,158),(8,'ru',115,0.1353,41),(9,'ru',116,0.1177,292),(8,'ru',116,0.1353,42),(8,'ru',117,0.1353,43),(8,'ru',118,0.2144,43),(8,'ru',119,0.1353,57),(8,'ru',120,0.1353,58),(9,'ru',121,0.1177,118),(8,'ru',121,0.1353,59),(10,'ru',121,0.2015,182),(8,'ru',122,0.1353,61),(9,'ru',123,0.1177,64),(8,'ru',123,0.1353,62),(9,'ru',124,0.1177,123),(10,'ru',124,0.1272,129),(8,'ru',124,0.1353,64),(10,'ru',125,0.1272,128),(8,'ru',125,0.1353,66),(9,'ru',126,0.1177,611),(8,'ru',126,0.1353,69),(8,'ru',127,0.1353,70),(15,'ru',127,0.1573,117),(9,'ru',127,0.3043,280),(9,'ru',128,0.1177,478),(8,'ru',128,0.1353,71),(10,'ru',128,0.2015,156.5),(9,'ru',129,0.1177,343),(10,'ru',129,0.1272,308),(53,'ru',129,0.1287,191),(8,'ru',129,0.1353,72),(8,'ru',130,0.2144,79),(59,'ru',130,0.2314,3),(60,'ru',130,0.2314,3),(10,'ru',130,0.2543,331),(9,'ru',130,0.2733,431),(53,'ru',130,0.3614,138.667),(8,'ru',131,0.1353,75),(45,'ru',131,0.1417,74),(15,'ru',131,0.1573,86),(10,'ru',131,0.2015,334.5),(53,'ru',131,0.204,325.5),(10,'ru',132,0.1272,236),(53,'ru',132,0.1287,231),(8,'ru',132,0.1353,76),(45,'ru',132,0.1417,144),(11,'ru',132,0.19,196.5),(33,'ru',132,0.2233,108),(32,'ru',132,0.2351,70),(10,'ru',133,0.1272,369),(8,'ru',133,0.1353,77),(9,'ru',134,0.1177,155),(10,'ru',134,0.2015,369),(8,'ru',134,0.2144,77),(8,'ru',135,0.1353,78),(34,'ru',135,0.224,69),(9,'ru',135,0.2354,376),(8,'ru',136,0.1353,80),(8,'ru',137,0.1353,81),(6,'ru',137,0.1679,113),(8,'ru',138,0.1353,83),(8,'ru',139,0.1353,92),(8,'ru',140,0.1353,94),(9,'ru',141,0.1177,99),(8,'ru',141,0.1353,95),(44,'ru',141,0.2754,38.5),(40,'ru',141,0.2823,46),(8,'ru',142,0.1353,96),(8,'ru',143,0.1353,97),(48,'ru',143,0.1626,7),(9,'ru',144,0.1177,613),(14,'ru',144,0.1308,70),(8,'ru',144,0.1353,98),(16,'ru',144,0.3171,64.5),(11,'ru',145,0.1199,282),(8,'ru',145,0.1353,101),(10,'ru',146,0.1272,164),(8,'ru',146,0.1353,102),(8,'ru',147,0.1353,108),(8,'ru',148,0.1353,112),(8,'ru',149,0.2144,112),(8,'ru',150,0.2144,136.5),(8,'ru',151,0.2144,137.5),(8,'ru',152,0.2144,151),(8,'ru',153,0.1353,117),(8,'ru',154,0.1353,118),(48,'ru',155,0.1626,5),(8,'ru',155,0.2706,191.333),(8,'ru',156,0.1353,126),(8,'ru',157,0.1353,127),(8,'ru',158,0.2144,190.5),(8,'ru',159,0.2706,194),(8,'ru',160,0.2144,193),(8,'ru',161,0.2144,165),(8,'ru',162,0.2144,166),(8,'ru',163,0.2144,179.5),(8,'ru',164,0.2144,185.5),(11,'ru',165,0.1199,329),(10,'ru',165,0.1272,234),(8,'ru',165,0.1353,142),(14,'ru',166,0.1308,175),(45,'ru',166,0.1417,135),(47,'ru',166,0.1738,13),(53,'ru',166,0.204,114),(8,'ru',166,0.2144,174),(8,'ru',167,0.1353,145),(8,'ru',168,0.1353,146),(8,'ru',169,0.1353,148),(8,'ru',170,0.2144,179.5),(8,'ru',171,0.1353,158),(36,'ru',171,0.25,55),(8,'ru',172,0.1353,162),(53,'ru',173,0.1287,126),(8,'ru',173,0.2144,205),(9,'ru',174,0.1177,339),(11,'ru',174,0.1199,203),(10,'ru',174,0.1272,11),(53,'ru',174,0.1287,122),(8,'ru',174,0.1353,165),(45,'ru',174,0.2246,98),(36,'ru',174,0.25,57),(24,'ru',174,0.2823,27),(32,'ru',174,0.4164,75),(8,'ru',175,0.1353,166),(8,'ru',176,0.1353,167),(33,'ru',176,0.2233,66),(48,'ru',176,0.2577,46),(11,'ru',177,0.1199,503),(10,'ru',177,0.1272,10),(8,'ru',177,0.2144,203),(9,'ru',177,0.2354,264.333),(8,'ru',178,0.1353,169),(8,'ru',179,0.1353,171),(8,'ru',180,0.2706,220.333),(48,'ru',181,0.1626,1),(8,'ru',181,0.2706,221.333),(8,'ru',182,0.1353,184),(8,'ru',183,0.1353,185),(8,'ru',184,0.1353,186),(8,'ru',185,0.2144,228.5),(8,'ru',186,0.1353,190),(8,'ru',187,0.1353,202),(46,'ru',187,0.1529,34),(8,'ru',188,0.1353,203),(10,'ru',189,0.1272,177),(8,'ru',189,0.1353,205),(48,'ru',189,0.1626,45),(33,'ru',189,0.2233,87),(8,'ru',190,0.1353,217),(8,'ru',191,0.1353,218),(8,'ru',192,0.1353,233),(9,'ru',193,0.1177,80),(8,'ru',193,0.1353,234),(8,'ru',194,0.1353,244),(8,'ru',195,0.1353,249),(8,'ru',196,0.1353,250),(8,'ru',197,0.1353,251),(8,'ru',198,0.1353,254),(8,'ru',199,0.1353,258),(8,'ru',200,0.1353,269),(9,'ru',201,0.1177,1),(9,'ru',202,0.1177,2),(9,'ru',203,0.1866,218),(9,'ru',204,0.1177,12),(41,'ru',204,0.2742,38.5),(9,'ru',205,0.1177,15),(9,'ru',206,0.1177,17),(11,'ru',207,0.1199,478),(9,'ru',207,0.3043,156.6),(9,'ru',208,0.1177,26),(9,'ru',209,0.1177,28),(9,'ru',210,0.1177,29),(9,'ru',211,0.1177,31),(9,'ru',212,0.2733,202),(9,'ru',213,0.1177,35),(16,'ru',213,0.2165,55),(9,'ru',214,0.1177,36),(10,'ru',215,0.1272,45),(45,'ru',215,0.1417,81),(49,'ru',215,0.1626,32),(9,'ru',215,0.1866,340.5),(53,'ru',215,0.2575,90.6667),(23,'ru',215,0.2886,58.5),(37,'ru',215,0.3042,46.5),(9,'ru',216,0.1177,45),(9,'ru',217,0.1177,46),(15,'ru',217,0.1573,106),(9,'ru',218,0.1177,53),(9,'ru',219,0.1177,54),(9,'ru',220,0.1177,55),(9,'ru',221,0.1866,86.5),(33,'ru',221,0.2233,95),(39,'ru',221,0.2823,28),(9,'ru',222,0.1177,60),(9,'ru',223,0.1177,62),(9,'ru',224,0.1177,63),(49,'ru',224,0.1626,29),(33,'ru',224,0.2233,85),(9,'ru',225,0.1177,70),(9,'ru',226,0.1177,76),(9,'ru',227,0.1177,78),(53,'ru',228,0.1287,11),(14,'ru',228,0.1308,252),(16,'ru',228,0.1366,6),(46,'ru',228,0.1529,25),(10,'ru',228,0.2015,265),(9,'ru',228,0.3304,371.167),(9,'ru',229,0.1177,82),(9,'ru',230,0.1177,84),(9,'ru',231,0.1866,282.5),(9,'ru',232,0.1177,94),(9,'ru',233,0.1177,96),(9,'ru',234,0.2354,209.667),(38,'ru',234,0.2694,50.5),(9,'ru',235,0.1177,100),(9,'ru',236,0.1177,107),(9,'ru',237,0.1177,108),(11,'ru',238,0.1199,56),(45,'ru',238,0.1417,178),(36,'ru',238,0.1577,129),(53,'ru',238,0.204,58),(34,'ru',238,0.224,127),(9,'ru',238,0.3043,426),(15,'ru',238,0.3652,59),(9,'ru',239,0.1177,111),(9,'ru',240,0.1177,115),(53,'ru',240,0.204,58),(9,'ru',241,0.1177,116),(53,'ru',241,0.1287,12),(49,'ru',241,0.1626,25),(9,'ru',242,0.1177,121),(9,'ru',243,0.1866,148),(9,'ru',244,0.1177,130),(9,'ru',245,0.1177,137),(9,'ru',246,0.1866,232),(9,'ru',247,0.1866,311),(9,'ru',248,0.1177,141),(9,'ru',249,0.1866,150),(32,'ru',249,0.2351,113),(9,'ru',250,0.1177,154),(9,'ru',251,0.1177,156),(9,'ru',252,0.1177,158),(9,'ru',253,0.1177,161),(9,'ru',254,0.1177,162),(9,'ru',255,0.1177,164),(9,'ru',256,0.1177,176),(9,'ru',257,0.1177,183),(9,'ru',258,0.1177,192),(9,'ru',259,0.1177,196),(9,'ru',260,0.1177,197),(11,'ru',260,0.1199,505),(10,'ru',260,0.1272,297),(15,'ru',260,0.1573,1),(9,'ru',261,0.1177,198),(14,'ru',261,0.2616,172),(9,'ru',262,0.1177,199),(9,'ru',263,0.1177,202),(9,'ru',264,0.1177,203),(14,'ru',264,0.1308,207),(9,'ru',265,0.1177,218),(10,'ru',265,0.1272,295),(14,'ru',265,0.1308,217),(9,'ru',266,0.1177,220),(9,'ru',267,0.1177,221),(10,'ru',267,0.1272,298),(9,'ru',268,0.1177,228),(9,'ru',269,0.1177,229),(9,'ru',270,0.1177,230),(9,'ru',271,0.2354,241.333),(9,'ru',272,0.1866,249),(9,'ru',273,0.1177,236),(9,'ru',274,0.1177,238),(11,'ru',275,0.1199,336),(9,'ru',275,0.1866,432),(9,'ru',276,0.1177,245),(9,'ru',277,0.1177,251),(9,'ru',278,0.1177,253),(9,'ru',279,0.1177,255),(15,'ru',279,0.1573,84),(9,'ru',280,0.1866,448.5),(10,'ru',280,0.2015,303),(33,'ru',280,0.2233,110),(45,'ru',281,0.1417,170),(11,'ru',281,0.19,281.5),(9,'ru',281,0.2733,448.5),(10,'ru',281,0.2953,303),(33,'ru',281,0.3271,110),(9,'ru',282,0.1177,262),(9,'ru',283,0.1177,269),(9,'ru',284,0.1177,276),(9,'ru',285,0.1177,284),(9,'ru',286,0.1177,286),(9,'ru',287,0.1177,287),(11,'ru',287,0.1199,331),(10,'ru',287,0.1272,31),(9,'ru',288,0.1177,291),(53,'ru',288,0.1287,180),(16,'ru',288,0.2165,65),(35,'ru',288,0.2577,92.5),(37,'ru',288,0.3042,38.5),(22,'ru',288,0.3199,24.5),(32,'ru',288,0.3444,74.5),(9,'ru',289,0.1866,461.5),(14,'ru',290,0.1308,77),(9,'ru',290,0.2733,461.5),(9,'ru',291,0.1177,297),(42,'ru',291,0.2613,63.5),(28,'ru',291,0.2853,43),(9,'ru',292,0.1177,299),(9,'ru',293,0.1177,300),(35,'ru',294,0.1626,1),(9,'ru',294,0.1866,300),(9,'ru',295,0.1177,301),(9,'ru',296,0.1177,308),(9,'ru',297,0.1177,314),(9,'ru',298,0.2733,444),(9,'ru',299,0.2354,374.333),(45,'ru',300,0.1417,77),(11,'ru',300,0.19,237.5),(34,'ru',300,0.224,129),(14,'ru',300,0.2616,130.667),(9,'ru',300,0.2733,385.5),(41,'ru',300,0.2742,42.5),(45,'ru',301,0.1417,77),(11,'ru',301,0.19,237.5),(34,'ru',301,0.224,129),(14,'ru',301,0.2616,130.667),(9,'ru',301,0.2733,385.5),(41,'ru',301,0.4016,48),(45,'ru',302,0.1417,77),(11,'ru',302,0.19,237.5),(34,'ru',302,0.224,129),(14,'ru',302,0.2616,130.667),(38,'ru',302,0.2694,36.5),(9,'ru',302,0.2733,385.5),(41,'ru',302,0.2742,42.5),(9,'ru',303,0.1177,327),(9,'ru',304,0.2354,482.333),(9,'ru',305,0.2354,484.333),(10,'ru',306,0.1272,341),(9,'ru',306,0.1866,431),(9,'ru',307,0.1177,341),(9,'ru',308,0.1177,342),(10,'ru',308,0.1272,307),(9,'ru',309,0.1177,345),(48,'ru',309,0.1626,24),(45,'ru',309,0.2246,151.5),(9,'ru',310,0.1177,346),(9,'ru',311,0.1177,347),(48,'ru',311,0.1626,25),(9,'ru',312,0.1177,353),(9,'ru',313,0.1866,428.5),(9,'ru',314,0.1177,362),(10,'ru',314,0.1272,199),(9,'ru',315,0.3043,521.8),(9,'ru',316,0.1177,374),(9,'ru',317,0.2354,410),(9,'ru',318,0.1177,382),(9,'ru',319,0.2733,504.5),(9,'ru',320,0.1866,426.5),(9,'ru',321,0.1177,394),(9,'ru',322,0.1177,400),(9,'ru',323,0.1177,407),(9,'ru',324,0.1177,411),(9,'ru',325,0.1177,413),(33,'ru',325,0.2233,117),(34,'ru',326,0.224,103),(9,'ru',326,0.2354,472.333),(35,'ru',326,0.2577,83.5),(9,'ru',327,0.1177,415),(9,'ru',328,0.1177,419),(9,'ru',329,0.1177,420),(9,'ru',330,0.1177,427),(9,'ru',331,0.1177,430),(41,'ru',331,0.2742,40.5),(29,'ru',331,0.3142,34),(9,'ru',332,0.1177,431),(9,'ru',333,0.1177,437),(10,'ru',333,0.1272,90),(9,'ru',334,0.1177,438),(11,'ru',334,0.1199,314),(9,'ru',335,0.1177,442),(9,'ru',336,0.1177,452),(9,'ru',337,0.2733,533.25),(9,'ru',338,0.1177,454),(14,'ru',338,0.1308,117),(20,'ru',338,0.2314,5),(38,'ru',338,0.2694,52.5),(40,'ru',338,0.2823,33),(17,'ru',338,0.3667,4),(9,'ru',339,0.1177,456),(9,'ru',340,0.1177,457),(9,'ru',341,0.1177,469),(9,'ru',342,0.1177,471),(9,'ru',343,0.1177,472),(9,'ru',344,0.1177,480),(9,'ru',345,0.1177,481),(9,'ru',346,0.1177,483),(9,'ru',347,0.1866,483),(9,'ru',348,0.1177,485),(9,'ru',349,0.1177,492),(9,'ru',350,0.2733,545.25),(9,'ru',351,0.1177,509),(9,'ru',352,0.1866,561),(9,'ru',353,0.1177,512),(11,'ru',353,0.1199,309),(45,'ru',353,0.1417,105),(37,'ru',353,0.3042,29.5),(9,'ru',354,0.1177,515),(9,'ru',355,0.1177,527),(10,'ru',355,0.1272,255),(14,'ru',355,0.1308,79),(11,'ru',355,0.19,271.5),(9,'ru',356,0.1866,550.5),(9,'ru',357,0.1177,549),(11,'ru',357,0.1199,138),(47,'ru',357,0.2754,32),(45,'ru',357,0.3291,101),(53,'ru',357,0.3862,70.7143),(9,'ru',358,0.1177,550),(23,'ru',358,0.2886,60.5),(9,'ru',359,0.1177,558),(9,'ru',360,0.1177,559),(9,'ru',361,0.1177,574),(9,'ru',362,0.1177,582),(9,'ru',363,0.1866,597),(9,'ru',364,0.1177,594),(9,'ru',365,0.1177,597),(9,'ru',366,0.1177,598),(10,'ru',366,0.1272,178),(9,'ru',367,0.1177,599),(10,'ru',367,0.1272,52),(53,'ru',367,0.1287,186),(46,'ru',367,0.1529,26),(41,'ru',367,0.2742,73.5),(33,'ru',367,0.3271,125.5),(32,'ru',367,0.4164,90.3333),(9,'ru',368,0.1177,615),(9,'ru',369,0.1177,627),(49,'ru',369,0.1626,79),(9,'ru',370,0.1177,639),(9,'ru',371,0.1177,640),(15,'ru',371,0.1573,105),(10,'ru',372,0.1272,1),(10,'ru',373,0.1272,3),(10,'ru',374,0.1272,7),(24,'ru',374,0.2823,19),(11,'ru',375,0.1199,459),(10,'ru',375,0.1272,12),(16,'ru',375,0.2165,74),(10,'ru',376,0.1272,13),(10,'ru',377,0.1272,14),(10,'ru',378,0.1272,15),(10,'ru',379,0.1272,16),(33,'ru',380,0.2233,140),(10,'ru',380,0.2953,115.5),(10,'ru',381,0.1272,19),(10,'ru',382,0.1272,22),(10,'ru',383,0.1272,29),(14,'ru',383,0.1308,234),(11,'ru',384,0.1199,49),(10,'ru',384,0.1272,30),(33,'ru',384,0.2233,134),(39,'ru',384,0.2823,55),(10,'ru',385,0.1272,32),(14,'ru',385,0.1308,236),(46,'ru',385,0.2424,76),(28,'ru',385,0.2853,51),(22,'ru',385,0.3199,43.5),(53,'ru',385,0.3328,147.6),(10,'ru',386,0.1272,33),(10,'ru',387,0.1272,35),(10,'ru',388,0.2543,171.333),(33,'ru',388,0.3955,102),(10,'ru',389,0.1272,38),(35,'ru',389,0.2577,59.5),(33,'ru',389,0.3955,119.667),(10,'ru',390,0.2543,237.667),(10,'ru',391,0.1272,48),(14,'ru',391,0.1308,249),(10,'ru',392,0.1272,50),(53,'ru',392,0.1287,214),(46,'ru',392,0.1529,4),(11,'ru',393,0.1199,129),(10,'ru',393,0.1272,51),(46,'ru',393,0.1529,66),(32,'ru',393,0.2351,68),(10,'ru',394,0.1272,62),(10,'ru',395,0.1272,63),(10,'ru',396,0.1272,64),(10,'ru',397,0.1272,65),(10,'ru',398,0.1272,68),(10,'ru',399,0.1272,76),(16,'ru',399,0.1366,149),(10,'ru',400,0.1272,77),(10,'ru',401,0.1272,78),(10,'ru',402,0.1272,79),(53,'ru',402,0.204,19),(11,'ru',403,0.1199,50),(10,'ru',403,0.1272,80),(46,'ru',403,0.1529,62),(53,'ru',403,0.204,240),(47,'ru',403,0.2754,26),(27,'ru',403,0.2823,49.5),(28,'ru',403,0.2853,50),(22,'ru',403,0.3199,42.5),(10,'ru',404,0.1272,81),(53,'ru',404,0.1287,77),(11,'ru',405,0.1199,44),(10,'ru',405,0.1272,82),(10,'ru',406,0.2015,119.5),(10,'ru',407,0.1272,91),(10,'ru',408,0.1272,92),(10,'ru',409,0.1272,93),(10,'ru',410,0.2015,93),(10,'ru',411,0.1272,105),(10,'ru',412,0.2543,189.333),(33,'ru',413,0.2233,135),(10,'ru',413,0.3815,189.143),(10,'ru',414,0.1272,109),(10,'ru',415,0.1272,111),(47,'ru',415,0.1738,47),(49,'ru',416,0.1626,27),(48,'ru',416,0.1626,32),(10,'ru',416,0.2543,272),(53,'ru',417,0.1287,162),(10,'ru',417,0.2953,208.25),(10,'ru',418,0.1272,133),(10,'ru',419,0.1272,134),(10,'ru',420,0.1272,135),(10,'ru',421,0.1272,144),(11,'ru',422,0.1199,245),(10,'ru',422,0.1272,145),(36,'ru',422,0.1577,102),(46,'ru',423,0.1529,124),(10,'ru',423,0.2015,174),(11,'ru',423,0.2398,483),(10,'ru',424,0.1272,147),(11,'ru',425,0.1199,490),(48,'ru',425,0.1626,3),(49,'ru',425,0.1626,6),(47,'ru',425,0.1738,3),(10,'ru',425,0.2015,152),(11,'ru',426,0.19,483.5),(10,'ru',426,0.2015,179),(10,'ru',427,0.1272,153),(11,'ru',428,0.1199,464),(10,'ru',428,0.1272,154),(10,'ru',429,0.1272,156),(10,'ru',430,0.1272,157),(10,'ru',431,0.1272,167),(10,'ru',432,0.1272,168),(11,'ru',432,0.19,495.5),(10,'ru',433,0.1272,175),(10,'ru',434,0.1272,179),(10,'ru',435,0.1272,180),(10,'ru',436,0.1272,186),(10,'ru',437,0.1272,196),(53,'ru',437,0.1287,1),(49,'ru',437,0.1626,61),(48,'ru',437,0.1626,62),(47,'ru',437,0.1738,42),(54,'ru',437,0.2314,1),(56,'ru',437,0.2314,1),(10,'ru',438,0.2015,239.5),(33,'ru',438,0.2233,130),(10,'ru',439,0.1272,203),(45,'ru',439,0.1417,75),(10,'ru',440,0.1272,204),(10,'ru',441,0.1272,206),(10,'ru',442,0.2015,291),(10,'ru',443,0.1272,221),(10,'ru',444,0.1272,222),(10,'ru',445,0.1272,224),(49,'ru',445,0.1626,52),(10,'ru',446,0.1272,225),(10,'ru',447,0.1272,233),(10,'ru',448,0.1272,237),(23,'ru',448,0.2886,46.5),(10,'ru',449,0.1272,244),(10,'ru',450,0.1272,250),(10,'ru',451,0.1272,251),(10,'ru',452,0.1272,258),(10,'ru',453,0.1272,260),(10,'ru',454,0.1272,261),(10,'ru',455,0.1272,265),(53,'ru',455,0.1287,25),(11,'ru',456,0.1199,355),(10,'ru',456,0.1272,266),(34,'ru',456,0.224,108),(10,'ru',457,0.1272,284),(11,'ru',458,0.1199,279),(10,'ru',458,0.1272,287),(10,'ru',459,0.1272,289),(10,'ru',460,0.1272,306),(10,'ru',461,0.1272,314),(10,'ru',462,0.1272,325),(16,'ru',462,0.2165,45),(11,'ru',463,0.1199,260),(10,'ru',463,0.1272,327),(48,'ru',463,0.1626,53),(25,'ru',463,0.3504,14),(10,'ru',464,0.1272,328),(10,'ru',465,0.1272,331),(10,'ru',466,0.1272,333),(11,'ru',467,0.1199,376),(10,'ru',467,0.1272,338),(10,'ru',468,0.1272,350),(11,'ru',469,0.1199,392),(10,'ru',469,0.1272,351),(10,'ru',470,0.1272,354),(10,'ru',471,0.1272,361),(45,'ru',471,0.1417,168),(10,'ru',472,0.1272,363),(53,'ru',472,0.1287,179),(35,'ru',472,0.2577,71.5),(43,'ru',472,0.2921,27),(10,'ru',473,0.1272,366),(10,'ru',474,0.1272,367),(10,'ru',475,0.1272,377),(10,'ru',476,0.1272,378),(10,'ru',477,0.2015,383.5),(10,'ru',478,0.1272,384),(10,'ru',479,0.1272,385),(10,'ru',480,0.1272,389),(11,'ru',481,0.1199,52),(11,'ru',482,0.1199,53),(11,'ru',483,0.19,85),(11,'ru',484,0.1199,57),(46,'ru',485,0.1529,77),(11,'ru',485,0.19,92),(42,'ru',485,0.2613,57.5),(44,'ru',485,0.2754,26.5),(24,'ru',485,0.2823,20),(27,'ru',485,0.2823,23.5),(31,'ru',485,0.2853,45),(37,'ru',485,0.3042,39.5),(22,'ru',485,0.3199,25.5),(29,'ru',485,0.4603,23),(11,'ru',486,0.19,90),(11,'ru',487,0.1199,70),(16,'ru',487,0.1366,164),(42,'ru',487,0.2613,38.5),(11,'ru',488,0.1199,72),(11,'ru',489,0.1199,74),(32,'ru',489,0.2351,96),(11,'ru',490,0.1199,83),(11,'ru',491,0.1199,86),(14,'ru',491,0.1308,81),(47,'ru',491,0.1738,2),(19,'ru',491,0.2314,3),(38,'ru',491,0.2694,30.5),(25,'ru',491,0.3504,23),(11,'ru',492,0.1199,87),(15,'ru',492,0.1573,70),(20,'ru',492,0.3667,3.5),(11,'ru',493,0.1199,88),(15,'ru',493,0.1573,62),(11,'ru',494,0.1199,89),(66,'ru',494,0.2314,1),(11,'ru',495,0.1199,91),(11,'ru',496,0.1199,92),(45,'ru',496,0.1417,32),(34,'ru',496,0.224,81),(36,'ru',496,0.25,42),(11,'ru',497,0.1199,96),(25,'ru',497,0.3504,20),(11,'ru',498,0.1199,99),(45,'ru',499,0.1417,195),(11,'ru',499,0.19,112.5),(11,'ru',500,0.1199,107),(46,'ru',500,0.1529,2),(47,'ru',500,0.1738,16),(11,'ru',501,0.1199,108),(11,'ru',502,0.1199,109),(45,'ru',502,0.1417,92),(45,'ru',503,0.1417,104),(11,'ru',503,0.19,147),(34,'ru',503,0.224,52),(46,'ru',503,0.2424,74),(39,'ru',503,0.4135,46),(11,'ru',504,0.1199,116),(14,'ru',505,0.1308,125),(45,'ru',505,0.1417,58),(46,'ru',505,0.1529,122),(33,'ru',505,0.2233,104),(44,'ru',505,0.2754,42.5),(11,'ru',505,0.2784,224),(39,'ru',505,0.2823,39),(23,'ru',505,0.2886,44.5),(29,'ru',505,0.4603,21),(11,'ru',506,0.1199,121),(43,'ru',506,0.2921,44),(37,'ru',506,0.3042,21.5),(11,'ru',507,0.1199,124),(11,'ru',508,0.1199,127),(46,'ru',508,0.1529,58),(21,'ru',508,0.3504,21.5),(11,'ru',509,0.1199,128),(33,'ru',509,0.2233,123),(11,'ru',510,0.1199,130),(46,'ru',511,0.1529,94),(15,'ru',511,0.1573,139),(53,'ru',511,0.204,201.5),(14,'ru',511,0.2074,177),(11,'ru',511,0.2398,184.333),(37,'ru',511,0.3042,40.5),(11,'ru',512,0.1199,140),(45,'ru',512,0.1417,48),(76,'ru',512,0.2314,3),(36,'ru',512,0.25,35),(23,'ru',512,0.2886,42.5),(29,'ru',512,0.3142,17),(25,'ru',512,0.3504,19),(11,'ru',513,0.1199,142),(37,'ru',513,0.3042,23.5),(49,'ru',513,0.3252,23.3333),(11,'ru',514,0.1199,144),(11,'ru',515,0.19,144),(11,'ru',516,0.1199,146),(11,'ru',517,0.1199,147),(11,'ru',518,0.1199,148),(45,'ru',518,0.1417,155),(46,'ru',518,0.1529,101),(38,'ru',518,0.2694,61.5),(11,'ru',519,0.1199,155),(11,'ru',520,0.1199,156),(11,'ru',521,0.19,181.5),(11,'ru',522,0.1199,159),(11,'ru',523,0.1199,161),(11,'ru',524,0.1199,162),(11,'ru',525,0.1199,169),(11,'ru',526,0.1199,170),(11,'ru',527,0.1199,172),(15,'ru',527,0.1573,50),(14,'ru',527,0.2074,129),(11,'ru',528,0.1199,173),(46,'ru',528,0.1529,95),(11,'ru',529,0.1199,175),(46,'ru',529,0.1529,42),(11,'ru',530,0.19,191),(11,'ru',531,0.1199,177),(14,'ru',531,0.2074,154),(45,'ru',531,0.2246,161),(32,'ru',531,0.3444,72),(21,'ru',531,0.3504,14.5),(26,'ru',531,0.3608,17),(11,'ru',532,0.2398,299),(11,'ru',533,0.1199,181),(46,'ru',533,0.1529,28),(11,'ru',534,0.1199,183),(45,'ru',534,0.1417,179),(11,'ru',535,0.1199,185),(38,'ru',535,0.2694,45.5),(11,'ru',536,0.1199,187),(46,'ru',536,0.1529,20),(11,'ru',537,0.1199,196),(11,'ru',538,0.1199,198),(11,'ru',539,0.1199,200),(46,'ru',539,0.1529,40),(11,'ru',540,0.1199,201),(46,'ru',540,0.1529,21),(11,'ru',541,0.19,201),(43,'ru',541,0.2921,41),(46,'ru',541,0.3058,36.3333),(11,'ru',542,0.1199,207),(11,'ru',543,0.1199,208),(45,'ru',543,0.1417,51),(11,'ru',544,0.1199,209),(45,'ru',544,0.1417,52),(11,'ru',545,0.19,236),(53,'ru',545,0.204,193.5),(47,'ru',545,0.2754,36),(45,'ru',545,0.2835,11.6667),(11,'ru',546,0.1199,218),(36,'ru',546,0.1577,100),(38,'ru',546,0.2694,64.5),(11,'ru',547,0.1199,220),(11,'ru',548,0.1199,221),(11,'ru',549,0.1199,223),(45,'ru',549,0.1417,119),(11,'ru',550,0.1199,232),(45,'ru',550,0.1417,159),(11,'ru',551,0.1199,234),(11,'ru',552,0.1199,246),(11,'ru',553,0.1199,251),(11,'ru',554,0.19,256),(11,'ru',555,0.1199,255),(47,'ru',555,0.2754,49),(11,'ru',556,0.1199,259),(14,'ru',556,0.1308,280),(47,'ru',556,0.1738,33),(11,'ru',557,0.19,270),(11,'ru',558,0.19,314.5),(48,'ru',559,0.1626,6),(49,'ru',559,0.1626,17),(47,'ru',559,0.1738,14),(11,'ru',559,0.2398,302.667),(11,'ru',560,0.1199,272),(34,'ru',560,0.224,126),(44,'ru',560,0.2754,55.5),(27,'ru',560,0.2823,56.5),(11,'ru',561,0.1199,274),(46,'ru',561,0.1529,74),(42,'ru',561,0.2613,61.5),(43,'ru',561,0.2921,49),(11,'ru',562,0.1199,276),(11,'ru',563,0.1199,281),(11,'ru',564,0.1199,283),(46,'ru',564,0.2424,52),(45,'ru',564,0.2835,141),(11,'ru',565,0.1199,285),(11,'ru',566,0.1199,286),(11,'ru',567,0.1199,289),(34,'ru',567,0.224,122),(11,'ru',568,0.1199,291),(11,'ru',569,0.1199,292),(11,'ru',570,0.1199,294),(11,'ru',571,0.1199,296),(11,'ru',572,0.1199,298),(11,'ru',573,0.1199,299),(29,'ru',573,0.3142,21),(11,'ru',574,0.1199,305),(11,'ru',575,0.19,314),(11,'ru',576,0.2784,314),(11,'ru',577,0.1199,316),(11,'ru',578,0.1199,324),(11,'ru',579,0.1199,327),(11,'ru',580,0.1199,332),(11,'ru',581,0.1199,333),(11,'ru',582,0.19,357.5),(11,'ru',583,0.1199,348),(11,'ru',584,0.19,348),(11,'ru',585,0.1199,356),(11,'ru',586,0.1199,357),(14,'ru',586,0.1308,123),(11,'ru',587,0.1199,361),(11,'ru',588,0.1199,362),(11,'ru',589,0.1199,373),(11,'ru',590,0.1199,374),(11,'ru',591,0.1199,378),(11,'ru',592,0.1199,380),(11,'ru',593,0.1199,388),(11,'ru',594,0.19,447.5),(33,'ru',594,0.2233,161),(30,'ru',594,0.3413,32),(11,'ru',595,0.1199,394),(39,'ru',595,0.2823,30),(11,'ru',596,0.1199,448),(11,'ru',597,0.1199,451),(11,'ru',598,0.1199,452),(11,'ru',599,0.1199,453),(11,'ru',600,0.1199,455),(11,'ru',601,0.1199,456),(11,'ru',602,0.19,479),(11,'ru',603,0.1199,472),(44,'ru',603,0.2754,60.5),(11,'ru',604,0.1199,473),(53,'ru',604,0.1287,274),(44,'ru',604,0.2754,61.5),(11,'ru',605,0.1199,484),(11,'ru',606,0.1199,487),(11,'ru',607,0.1199,492),(11,'ru',608,0.1199,494),(11,'ru',609,0.1199,495),(12,'ru',610,0.2314,1),(13,'ru',611,0.2314,1),(53,'ru',612,0.1287,142),(14,'ru',612,0.4147,126.25),(14,'ru',613,0.3038,27.25),(14,'ru',614,0.2074,16),(14,'ru',615,0.2074,18),(14,'ru',616,0.2616,109),(14,'ru',617,0.2616,110),(15,'ru',617,0.3146,56),(14,'ru',618,0.3038,75.5),(14,'ru',619,0.2074,26),(37,'ru',619,0.3042,28.5),(14,'ru',620,0.2074,28),(14,'ru',621,0.2074,30),(15,'ru',622,0.1573,112),(14,'ru',622,0.2616,101.667),(53,'ru',623,0.1287,185),(14,'ru',623,0.1308,50),(53,'ru',624,0.1287,3),(15,'ru',624,0.1573,79),(14,'ru',624,0.2074,167),(14,'ru',625,0.1308,52),(14,'ru',626,0.1308,53),(14,'ru',627,0.1308,57),(14,'ru',628,0.1308,58),(14,'ru',629,0.1308,59),(14,'ru',630,0.1308,61),(14,'ru',631,0.1308,63),(14,'ru',632,0.2074,120.5),(14,'ru',633,0.1308,75),(14,'ru',634,0.1308,80),(14,'ru',635,0.1308,83),(14,'ru',636,0.1308,91),(14,'ru',637,0.1308,93),(14,'ru',638,0.1308,94),(14,'ru',639,0.2074,132),(14,'ru',640,0.1308,96),(14,'ru',641,0.3038,110.5),(53,'ru',642,0.1287,48),(45,'ru',642,0.1417,146),(46,'ru',642,0.1529,96),(49,'ru',642,0.1626,4),(14,'ru',642,0.2074,104),(14,'ru',643,0.1308,114),(15,'ru',643,0.1573,51),(26,'ru',643,0.3608,28),(14,'ru',644,0.1308,121),(14,'ru',645,0.1308,124),(14,'ru',646,0.1308,126),(47,'ru',646,0.1738,28),(14,'ru',647,0.1308,132),(14,'ru',648,0.1308,133),(14,'ru',649,0.1308,146),(14,'ru',650,0.1308,147),(14,'ru',651,0.1308,150),(14,'ru',652,0.1308,152),(14,'ru',653,0.1308,153),(41,'ru',653,0.2742,48.5),(27,'ru',653,0.2823,32.5),(28,'ru',653,0.2853,25),(31,'ru',653,0.2853,41),(30,'ru',653,0.3413,43),(21,'ru',653,0.3504,17.5),(26,'ru',653,0.3608,30),(14,'ru',654,0.1308,154),(45,'ru',654,0.1417,161),(32,'ru',654,0.2351,72),(14,'ru',655,0.1308,156),(46,'ru',655,0.1529,121),(14,'ru',656,0.2074,156),(46,'ru',656,0.2424,121),(14,'ru',657,0.1308,165),(14,'ru',658,0.1308,166),(15,'ru',658,0.2493,27.5),(14,'ru',659,0.1308,171),(14,'ru',660,0.1308,172),(14,'ru',661,0.1308,173),(43,'ru',661,0.2921,40),(14,'ru',662,0.1308,174),(48,'ru',662,0.1626,18),(47,'ru',662,0.1738,22),(14,'ru',663,0.2074,201.5),(14,'ru',664,0.2074,202.5),(15,'ru',664,0.4719,62.5714),(14,'ru',665,0.1308,187),(14,'ru',666,0.1308,189),(14,'ru',667,0.1308,196),(15,'ru',667,0.1573,136),(14,'ru',668,0.1308,197),(14,'ru',669,0.1308,201),(15,'ru',669,0.2493,23.5),(53,'ru',670,0.1287,102),(14,'ru',670,0.1308,202),(59,'ru',670,0.2314,2),(60,'ru',670,0.2314,2),(14,'ru',671,0.2074,213),(14,'ru',672,0.2616,250.667),(14,'ru',673,0.1308,206),(14,'ru',674,0.1308,222),(14,'ru',675,0.1308,224),(14,'ru',676,0.1308,225),(45,'ru',677,0.1417,76),(14,'ru',677,0.2074,225),(14,'ru',678,0.1308,237),(14,'ru',679,0.1308,239),(14,'ru',680,0.1308,241),(14,'ru',681,0.1308,242),(14,'ru',682,0.1308,243),(34,'ru',682,0.3281,57),(14,'ru',683,0.1308,245),(38,'ru',683,0.2694,43.5),(14,'ru',684,0.1308,246),(14,'ru',685,0.1308,248),(14,'ru',686,0.1308,253),(14,'ru',687,0.1308,254),(14,'ru',688,0.1308,260),(14,'ru',689,0.1308,262),(14,'ru',690,0.2074,262),(14,'ru',691,0.1308,265),(14,'ru',692,0.1308,266),(14,'ru',693,0.1308,267),(49,'ru',693,0.2577,53),(14,'ru',694,0.1308,270),(14,'ru',695,0.1308,271),(14,'ru',696,0.1308,281),(14,'ru',697,0.1308,288),(15,'ru',698,0.3652,23),(15,'ru',699,0.3652,24),(15,'ru',700,0.3652,25),(53,'ru',701,0.1287,64),(15,'ru',701,0.2493,29.5),(15,'ru',702,0.1573,53),(15,'ru',703,0.1573,60),(15,'ru',704,0.1573,64),(15,'ru',705,0.2493,64),(15,'ru',706,0.1573,65),(15,'ru',707,0.1573,68),(45,'ru',708,0.1417,70),(15,'ru',708,0.1573,77),(15,'ru',709,0.1573,80),(15,'ru',710,0.1573,87),(15,'ru',711,0.1573,88),(15,'ru',712,0.1573,94),(46,'ru',713,0.1529,50),(15,'ru',713,0.1573,98),(15,'ru',714,0.1573,101),(15,'ru',715,0.1573,103),(15,'ru',716,0.1573,104),(15,'ru',717,0.1573,114),(15,'ru',718,0.1573,118),(15,'ru',719,0.1573,119),(15,'ru',720,0.1573,120),(15,'ru',721,0.1573,137),(15,'ru',722,0.1573,140),(15,'ru',723,0.1573,143),(15,'ru',724,0.1573,144),(42,'ru',725,0.2613,56.5),(16,'ru',725,0.2732,53.6667),(44,'ru',725,0.2754,48.5),(16,'ru',726,0.2732,55),(16,'ru',727,0.2732,56.6667),(16,'ru',728,0.4097,108.429),(16,'ru',729,0.3834,89.6667),(16,'ru',730,0.2165,47),(16,'ru',731,0.2732,82.3333),(16,'ru',732,0.2165,51),(16,'ru',733,0.2165,52),(16,'ru',734,0.2165,52),(16,'ru',735,0.2165,53),(16,'ru',736,0.2165,58),(16,'ru',737,0.2165,59),(16,'ru',738,0.353,120),(53,'ru',739,0.1287,223),(16,'ru',739,0.2165,68),(16,'ru',740,0.2165,71),(16,'ru',741,0.2165,72),(16,'ru',742,0.2165,78),(16,'ru',743,0.4329,152.125),(16,'ru',744,0.1366,57),(16,'ru',745,0.1366,59),(16,'ru',746,0.2165,59),(16,'ru',747,0.1366,60),(16,'ru',748,0.1366,61),(16,'ru',749,0.1366,63),(16,'ru',750,0.1366,63),(16,'ru',751,0.1366,64),(16,'ru',752,0.1366,65),(16,'ru',753,0.1366,66),(16,'ru',754,0.1366,68),(16,'ru',755,0.1366,69),(16,'ru',756,0.1366,70),(16,'ru',757,0.1366,113),(16,'ru',758,0.1366,116),(32,'ru',758,0.2351,48),(35,'ru',758,0.2577,89.5),(16,'ru',759,0.1366,117),(16,'ru',760,0.1366,118),(16,'ru',761,0.2165,157.5),(16,'ru',762,0.4097,188.857),(16,'ru',763,0.1366,122),(16,'ru',764,0.1366,123),(16,'ru',765,0.1366,125),(16,'ru',766,0.1366,136),(16,'ru',767,0.1366,137),(16,'ru',768,0.1366,138),(16,'ru',769,0.1366,140),(16,'ru',770,0.2732,193),(16,'ru',771,0.1366,148),(36,'ru',771,0.25,60),(16,'ru',772,0.1366,163),(16,'ru',773,0.2165,176.5),(16,'ru',774,0.2165,175),(16,'ru',775,0.1366,173),(47,'ru',775,0.1738,64),(16,'ru',776,0.1366,175),(49,'ru',776,0.1626,56),(22,'ru',776,0.3199,32.5),(16,'ru',777,0.1366,176),(16,'ru',778,0.2165,185),(16,'ru',779,0.1366,178),(16,'ru',780,0.2732,215.667),(16,'ru',781,0.2165,216.5),(36,'ru',782,0.1577,130),(49,'ru',782,0.1626,87),(16,'ru',782,0.2165,215),(16,'ru',783,0.2165,216),(16,'ru',784,0.2165,217),(16,'ru',785,0.2165,218),(16,'ru',786,0.1366,208),(16,'ru',787,0.1366,209),(16,'ru',788,0.1366,210),(16,'ru',789,0.2165,210),(16,'ru',790,0.1366,211),(16,'ru',791,0.1366,225),(16,'ru',792,0.1366,226),(16,'ru',793,0.1366,234),(16,'ru',794,0.1366,240),(16,'ru',795,0.1366,244),(16,'ru',796,0.1366,245),(17,'ru',797,0.2314,3),(18,'ru',797,0.2314,3),(17,'ru',798,0.2314,4),(24,'ru',798,0.2823,22),(23,'ru',798,0.2886,24.5),(37,'ru',798,0.3042,20.5),(36,'ru',798,0.3662,66),(17,'ru',799,0.2314,6),(34,'ru',800,0.224,135),(18,'ru',800,0.2314,1),(36,'ru',800,0.25,53),(44,'ru',800,0.2754,27.5),(24,'ru',800,0.2823,21),(39,'ru',800,0.2823,35),(40,'ru',800,0.2823,50),(23,'ru',800,0.2886,43.5),(37,'ru',800,0.3042,19.5),(33,'ru',801,0.2233,118),(18,'ru',801,0.2314,4),(19,'ru',801,0.2314,6),(36,'ru',801,0.25,33),(35,'ru',801,0.2577,36.5),(34,'ru',801,0.3967,87.6667),(20,'ru',802,0.2314,4),(18,'ru',802,0.2314,5),(19,'ru',802,0.2314,8),(41,'ru',802,0.2742,30.5),(43,'ru',802,0.2921,24),(25,'ru',802,0.3504,12),(38,'ru',802,0.3947,34.5),(44,'ru',802,0.4035,40.5),(42,'ru',802,0.4628,41.8333),(40,'ru',802,0.5,30.3333),(39,'ru',802,0.5,34),(19,'ru',803,0.2314,4),(19,'ru',804,0.2314,5),(20,'ru',805,0.2314,3),(21,'ru',806,0.2211,1),(35,'ru',807,0.2577,44.5),(28,'ru',807,0.2853,22),(21,'ru',807,0.3504,11.5),(26,'ru',807,0.3608,14),(42,'ru',808,0.2613,36.5),(44,'ru',808,0.2754,32.5),(28,'ru',808,0.2853,23),(22,'ru',808,0.3199,31.5),(21,'ru',808,0.3504,12.5),(26,'ru',808,0.3608,15),(21,'ru',809,0.3504,15.5),(26,'ru',809,0.3608,18),(29,'ru',810,0.3142,20),(21,'ru',810,0.3504,16.5),(27,'ru',811,0.2823,29.5),(31,'ru',811,0.2853,43),(43,'ru',811,0.2921,42),(30,'ru',811,0.3413,38),(21,'ru',811,0.3504,19.5),(26,'ru',811,0.3608,25),(28,'ru',811,0.418,34.5),(21,'ru',812,0.3504,20.5),(21,'ru',813,0.3504,23.5),(46,'ru',814,0.2424,75.5),(21,'ru',814,0.3504,24.5),(22,'ru',815,0.2018,1),(22,'ru',816,0.3199,19.5),(22,'ru',817,0.3199,21.5),(22,'ru',818,0.3199,22.5),(22,'ru',819,0.3199,33.5),(22,'ru',820,0.3199,34.5),(26,'ru',820,0.3608,19),(49,'ru',821,0.1626,31),(27,'ru',821,0.2823,48.5),(31,'ru',821,0.2853,34),(28,'ru',821,0.2853,49),(22,'ru',821,0.3199,41.5),(28,'ru',822,0.2853,52),(22,'ru',822,0.3199,44.5),(41,'ru',823,0.2742,34.5),(44,'ru',823,0.2754,35.5),(40,'ru',823,0.2823,31),(24,'ru',823,0.2823,44),(28,'ru',823,0.2853,56),(22,'ru',823,0.3199,46.5),(36,'ru',824,0.1577,112),(28,'ru',824,0.2853,54),(22,'ru',824,0.3199,48.5),(30,'ru',824,0.3413,28),(24,'ru',824,0.4135,34),(23,'ru',825,0.3642,18),(49,'ru',826,0.1626,60),(36,'ru',826,0.25,27),(23,'ru',826,0.2886,25.5),(23,'ru',827,0.2886,27.5),(23,'ru',828,0.2886,29.5),(23,'ru',829,0.2886,30.5),(23,'ru',830,0.2886,31.5),(23,'ru',831,0.2886,32.5),(23,'ru',832,0.2886,40.5),(27,'ru',833,0.2823,50.5),(42,'ru',833,0.3828,53),(23,'ru',833,0.4228,49.5),(23,'ru',834,0.2886,53.5),(23,'ru',835,0.2886,56.5),(23,'ru',836,0.2886,62.5),(23,'ru',837,0.2886,63.5),(44,'ru',838,0.1738,2),(24,'ru',838,0.1781,1),(24,'ru',839,0.2823,23),(32,'ru',840,0.2351,60),(35,'ru',840,0.2577,46.5),(24,'ru',840,0.2823,24),(32,'ru',841,0.2351,55),(24,'ru',841,0.2823,25),(24,'ru',842,0.2823,26),(24,'ru',843,0.2823,28),(49,'ru',844,0.1626,50),(34,'ru',844,0.224,125),(24,'ru',844,0.2823,30),(44,'ru',845,0.2754,30.5),(24,'ru',845,0.2823,31),(43,'ru',845,0.2921,26),(24,'ru',846,0.2823,32),(42,'ru',847,0.2613,29.5),(24,'ru',847,0.2823,33),(43,'ru',847,0.2921,32),(24,'ru',848,0.2823,34),(24,'ru',849,0.2823,36),(24,'ru',850,0.2823,37),(24,'ru',851,0.2823,43),(42,'ru',852,0.2613,32.5),(24,'ru',852,0.2823,45),(24,'ru',853,0.2823,46),(24,'ru',854,0.2823,47),(25,'ru',855,0.4421,9),(38,'ru',856,0.2694,60.5),(41,'ru',856,0.2742,29.5),(25,'ru',856,0.3504,11),(36,'ru',857,0.1577,103),(34,'ru',857,0.224,102),(32,'ru',857,0.2351,62),(29,'ru',857,0.3142,15),(30,'ru',857,0.3413,21),(25,'ru',857,0.3504,16),(25,'ru',858,0.3504,17),(46,'ru',859,0.1529,128),(36,'ru',859,0.1577,104),(34,'ru',859,0.224,99),(39,'ru',859,0.2823,62),(25,'ru',859,0.3504,18),(32,'ru',860,0.2351,95),(25,'ru',860,0.3504,21),(26,'ru',861,0.2277,1),(28,'ru',862,0.2853,47),(30,'ru',862,0.3413,47),(26,'ru',862,0.3608,32),(27,'ru',863,0.1781,1),(41,'ru',864,0.2742,60.5),(27,'ru',864,0.2823,21.5),(27,'ru',865,0.2823,22.5),(27,'ru',866,0.2823,31.5),(28,'ru',866,0.2853,24),(31,'ru',866,0.2853,40),(27,'ru',867,0.2823,34.5),(28,'ru',867,0.2853,29),(35,'ru',868,0.2577,42.5),(27,'ru',868,0.2823,35.5),(28,'ru',868,0.2853,30),(31,'ru',868,0.2853,44),(29,'ru',868,0.3142,31),(27,'ru',869,0.2823,37.5),(28,'ru',869,0.2853,32),(31,'ru',869,0.2853,46),(27,'ru',870,0.2823,38.5),(28,'ru',870,0.2853,33),(31,'ru',870,0.2853,47),(27,'ru',871,0.2823,40.5),(28,'ru',871,0.2853,35),(31,'ru',871,0.2853,49),(29,'ru',871,0.3142,27),(34,'ru',872,0.224,98),(27,'ru',872,0.2823,41.5),(28,'ru',872,0.2853,36),(31,'ru',872,0.2853,50),(27,'ru',873,0.2823,51.5),(27,'ru',874,0.2823,52.5),(27,'ru',875,0.2823,53.5),(27,'ru',876,0.2823,55.5),(27,'ru',877,0.2823,58.5),(27,'ru',878,0.2823,59.5),(28,'ru',879,0.18,1),(29,'ru',880,0.1982,1),(29,'ru',881,0.3142,19),(29,'ru',882,0.3142,29),(29,'ru',883,0.3142,32),(41,'ru',884,0.2742,50.5),(29,'ru',884,0.3142,35),(29,'ru',885,0.3142,35),(30,'ru',886,0.2153,1),(30,'ru',887,0.3413,19),(49,'ru',888,0.1626,55),(32,'ru',888,0.2351,61),(30,'ru',888,0.3413,22),(34,'ru',889,0.3281,58.5),(30,'ru',889,0.3413,29),(35,'ru',890,0.3776,52.5),(30,'ru',890,0.5,30),(31,'ru',891,0.18,1),(31,'ru',892,0.2853,20),(31,'ru',893,0.2853,21),(31,'ru',894,0.418,25.5),(31,'ru',895,0.418,25.5),(31,'ru',896,0.2853,24),(31,'ru',897,0.2853,25),(31,'ru',898,0.2853,29),(41,'ru',899,0.2742,36.5),(31,'ru',899,0.2853,30),(31,'ru',900,0.2853,31),(31,'ru',901,0.418,31),(32,'ru',902,0.1483,1),(32,'ru',903,0.2351,44),(35,'ru',903,0.2577,90.5),(34,'ru',904,0.224,140),(32,'ru',904,0.2351,45),(33,'ru',905,0.2233,93),(35,'ru',905,0.2577,93.5),(32,'ru',905,0.3444,75.5),(32,'ru',906,0.2351,49),(32,'ru',907,0.2351,50),(32,'ru',908,0.2351,51),(32,'ru',909,0.2351,53),(32,'ru',910,0.2351,56),(32,'ru',911,0.2351,63),(32,'ru',912,0.2351,65),(33,'ru',913,0.2233,151),(32,'ru',913,0.2351,69),(45,'ru',914,0.1417,91),(32,'ru',914,0.2351,71),(32,'ru',915,0.2351,74),(48,'ru',916,0.1626,44),(32,'ru',916,0.2351,78),(34,'ru',917,0.224,96),(32,'ru',917,0.2351,86),(43,'ru',917,0.2921,46),(33,'ru',918,0.2233,57),(32,'ru',918,0.2351,88),(32,'ru',919,0.2351,89),(38,'ru',919,0.2694,67.5),(32,'ru',920,0.2351,91),(32,'ru',921,0.2351,105),(43,'ru',921,0.2921,45),(32,'ru',922,0.2351,108),(32,'ru',923,0.2351,108),(32,'ru',924,0.2351,108),(32,'ru',925,0.2351,110),(32,'ru',926,0.2351,114),(32,'ru',927,0.2351,118),(32,'ru',928,0.3444,118),(32,'ru',929,0.2351,122),(33,'ru',930,0.3642,96.6),(33,'ru',931,0.2233,58),(48,'ru',932,0.1626,47),(33,'ru',932,0.2233,61),(40,'ru',932,0.2823,53),(33,'ru',933,0.2233,64),(33,'ru',934,0.2233,74),(33,'ru',935,0.2233,75),(33,'ru',936,0.2233,79),(33,'ru',937,0.2233,81),(33,'ru',938,0.2233,82),(49,'ru',939,0.1626,57),(33,'ru',939,0.2233,84),(33,'ru',940,0.2233,96),(33,'ru',941,0.2233,97),(33,'ru',942,0.3271,127.5),(46,'ru',943,0.1529,36),(33,'ru',943,0.2233,102),(33,'ru',944,0.2233,103),(33,'ru',945,0.2233,106),(49,'ru',946,0.1626,38),(48,'ru',946,0.1626,40),(47,'ru',946,0.1738,24),(33,'ru',946,0.2233,107),(33,'ru',947,0.2233,109),(33,'ru',948,0.2233,116),(35,'ru',948,0.2577,88.5),(40,'ru',948,0.2823,29),(33,'ru',949,0.2233,119),(33,'ru',950,0.2233,120),(45,'ru',950,0.2246,32.5),(33,'ru',951,0.2233,122),(35,'ru',951,0.2577,76.5),(33,'ru',952,0.2233,124),(33,'ru',953,0.2233,125),(42,'ru',953,0.2613,66.5),(39,'ru',953,0.2823,31),(36,'ru',954,0.1577,118),(33,'ru',954,0.2233,128),(33,'ru',955,0.2233,131),(33,'ru',956,0.2233,133),(48,'ru',957,0.1626,67),(49,'ru',957,0.1626,99),(47,'ru',957,0.1738,55),(33,'ru',957,0.2233,150),(33,'ru',958,0.2233,152),(33,'ru',959,0.2233,160),(34,'ru',960,0.3653,65.4),(34,'ru',961,0.224,50),(34,'ru',962,0.224,57),(34,'ru',963,0.224,59),(34,'ru',964,0.224,60),(42,'ru',964,0.2613,62.5),(34,'ru',965,0.224,61),(34,'ru',966,0.224,65),(36,'ru',966,0.25,38),(34,'ru',967,0.224,68),(36,'ru',967,0.3155,19),(34,'ru',968,0.224,71),(34,'ru',969,0.224,73),(34,'ru',970,0.224,79),(34,'ru',971,0.224,82),(34,'ru',972,0.224,83),(34,'ru',973,0.224,84),(34,'ru',974,0.224,86),(34,'ru',975,0.224,87),(34,'ru',976,0.224,88),(34,'ru',977,0.224,89),(34,'ru',978,0.224,95),(34,'ru',979,0.224,97),(34,'ru',980,0.224,101),(34,'ru',981,0.224,104),(34,'ru',982,0.224,107),(34,'ru',983,0.224,109),(34,'ru',984,0.224,110),(34,'ru',985,0.224,111),(34,'ru',986,0.3281,121),(34,'ru',987,0.224,121),(34,'ru',988,0.224,123),(34,'ru',989,0.224,130),(34,'ru',990,0.224,132),(34,'ru',991,0.224,137),(34,'ru',992,0.224,138),(34,'ru',993,0.224,139),(42,'ru',994,0.2613,27.5),(40,'ru',994,0.2823,21),(43,'ru',994,0.2921,20),(35,'ru',994,0.3776,60),(35,'ru',995,0.2577,37.5),(35,'ru',996,0.2577,39.5),(35,'ru',997,0.2577,43.5),(35,'ru',998,0.2577,54.5),(35,'ru',999,0.2577,56.5),(35,'ru',1000,0.2577,57.5),(71,'ru',1001,0.2314,5),(35,'ru',1001,0.2577,58.5),(35,'ru',1002,0.2577,61.5),(35,'ru',1003,0.2577,62.5),(35,'ru',1004,0.2577,64.5),(35,'ru',1005,0.2577,70.5),(35,'ru',1006,0.2577,72.5),(45,'ru',1007,0.1417,84),(35,'ru',1007,0.2577,73.5),(44,'ru',1007,0.2754,53.5),(40,'ru',1007,0.2823,38),(43,'ru',1007,0.2921,23),(35,'ru',1008,0.2577,75.5),(35,'ru',1009,0.2577,82.5),(35,'ru',1010,0.2577,91.5),(36,'ru',1011,0.25,30),(36,'ru',1012,0.25,32),(36,'ru',1013,0.3662,46),(36,'ru',1014,0.25,39),(39,'ru',1014,0.2823,44),(36,'ru',1015,0.25,40),(36,'ru',1016,0.25,41),(36,'ru',1017,0.25,48),(36,'ru',1018,0.25,51),(36,'ru',1019,0.25,56),(36,'ru',1020,0.25,59),(45,'ru',1021,0.1417,83),(36,'ru',1021,0.25,61),(38,'ru',1021,0.2694,66.5),(44,'ru',1021,0.2754,41.5),(40,'ru',1021,0.2823,49),(43,'ru',1021,0.2921,48),(36,'ru',1022,0.25,63),(36,'ru',1023,0.25,65),(36,'ru',1024,0.25,66),(36,'ru',1025,0.25,68),(36,'ru',1026,0.1577,110),(36,'ru',1027,0.1577,114),(36,'ru',1028,0.1577,115),(36,'ru',1029,0.1577,117),(36,'ru',1030,0.1577,124),(45,'ru',1030,0.2246,142.5),(36,'ru',1031,0.1577,125),(36,'ru',1032,0.1577,126),(36,'ru',1033,0.1577,131),(37,'ru',1034,0.192,1),(37,'ru',1035,0.3042,25.5),(45,'ru',1036,0.1417,103),(37,'ru',1036,0.3042,26.5),(37,'ru',1037,0.3042,30.5),(37,'ru',1038,0.3042,32.5),(37,'ru',1039,0.3042,41.5),(53,'ru',1040,0.1287,232),(37,'ru',1040,0.3042,43.5),(37,'ru',1041,0.3042,48.5),(38,'ru',1042,0.34,18.6667),(38,'ru',1043,0.2694,28.5),(38,'ru',1044,0.2694,31.5),(38,'ru',1045,0.2694,32.5),(38,'ru',1046,0.2694,33.5),(38,'ru',1047,0.2694,34.5),(38,'ru',1048,0.2694,35.5),(38,'ru',1049,0.2694,44.5),(38,'ru',1050,0.2694,47.5),(38,'ru',1051,0.2694,48.5),(38,'ru',1052,0.2694,49.5),(38,'ru',1053,0.2694,51.5),(42,'ru',1054,0.2613,33.5),(38,'ru',1054,0.2694,53.5),(41,'ru',1054,0.2742,32.5),(44,'ru',1054,0.2754,37.5),(40,'ru',1054,0.2823,34),(38,'ru',1055,0.2694,59.5),(38,'ru',1056,0.2694,68.5),(39,'ru',1057,0.4604,31.4),(39,'ru',1058,0.2823,24),(42,'ru',1059,0.2613,48.5),(40,'ru',1059,0.2823,23),(39,'ru',1059,0.2823,26),(42,'ru',1060,0.2613,70.5),(39,'ru',1060,0.2823,40),(39,'ru',1061,0.2823,43),(39,'ru',1062,0.2823,52),(39,'ru',1063,0.2823,53),(39,'ru',1064,0.2823,58),(39,'ru',1065,0.2823,59),(40,'ru',1066,0.3562,16.3333),(53,'ru',1067,0.1287,253),(40,'ru',1067,0.2823,25),(43,'ru',1067,0.2921,28),(40,'ru',1068,0.2823,26),(43,'ru',1068,0.2921,29),(40,'ru',1069,0.2823,27),(43,'ru',1069,0.2921,30),(6,'ru',1070,0.1679,111),(42,'ru',1070,0.2613,30.5),(40,'ru',1070,0.2823,30),(43,'ru',1070,0.2921,33),(40,'ru',1071,0.2823,35),(40,'ru',1072,0.2823,37),(40,'ru',1073,0.2823,47),(41,'ru',1074,0.173,1),(41,'ru',1075,0.2742,28.5),(41,'ru',1076,0.2742,37.5),(41,'ru',1077,0.2742,41.5),(41,'ru',1078,0.2742,51.5),(41,'ru',1079,0.2742,52.5),(41,'ru',1080,0.2742,56.5),(41,'ru',1081,0.2742,57.5),(41,'ru',1082,0.2742,59.5),(41,'ru',1083,0.2742,63.5),(41,'ru',1084,0.2742,65.5),(41,'ru',1085,0.2742,72.5),(41,'ru',1086,0.2742,75.5),(42,'ru',1087,0.1649,1),(42,'ru',1088,0.2613,35.5),(44,'ru',1088,0.2754,31.5),(42,'ru',1089,0.2613,37.5),(42,'ru',1090,0.2613,41.5),(42,'ru',1091,0.2613,42.5),(42,'ru',1092,0.2613,44.5),(42,'ru',1093,0.2613,46.5),(42,'ru',1094,0.2613,54.5),(44,'ru',1094,0.2754,63.5),(43,'ru',1094,0.2921,21),(48,'ru',1095,0.1626,26),(42,'ru',1095,0.2613,58.5),(42,'ru',1096,0.2613,59.5),(42,'ru',1097,0.2613,72.5),(42,'ru',1098,0.3828,72.5),(43,'ru',1099,0.1843,1),(44,'ru',1100,0.1738,1),(44,'ru',1101,0.2754,25.5),(44,'ru',1102,0.2754,34.5),(44,'ru',1103,0.2754,39.5),(44,'ru',1104,0.2754,50.5),(44,'ru',1105,0.2754,58.5),(44,'ru',1106,0.2754,59.5),(44,'ru',1107,0.2754,64.5),(53,'ru',1108,0.1287,235),(45,'ru',1108,0.2246,12),(45,'ru',1109,0.1417,26),(45,'ru',1110,0.1417,30),(45,'ru',1111,0.1417,31),(45,'ru',1112,0.1417,33),(45,'ru',1113,0.1417,34),(45,'ru',1114,0.1417,35),(45,'ru',1115,0.1417,37),(53,'ru',1116,0.1287,58),(45,'ru',1116,0.1417,40),(45,'ru',1117,0.1417,41),(45,'ru',1118,0.1417,50),(45,'ru',1119,0.1417,59),(45,'ru',1120,0.1417,60),(45,'ru',1121,0.1417,73),(45,'ru',1122,0.1417,86),(45,'ru',1123,0.1417,89),(45,'ru',1124,0.1417,98),(45,'ru',1125,0.1417,101),(45,'ru',1126,0.2246,115),(53,'ru',1127,0.2575,271),(45,'ru',1127,0.2835,148),(45,'ru',1128,0.1417,118),(45,'ru',1129,0.1417,122),(45,'ru',1130,0.1417,126),(46,'ru',1130,0.1529,57),(45,'ru',1131,0.1417,130),(48,'ru',1131,0.1626,14),(45,'ru',1132,0.1417,136),(46,'ru',1132,0.1529,76),(45,'ru',1133,0.1417,137),(45,'ru',1134,0.1417,145),(46,'ru',1134,0.1529,52),(45,'ru',1135,0.1417,148),(45,'ru',1136,0.1417,149),(45,'ru',1137,0.1417,154),(45,'ru',1138,0.1417,157),(45,'ru',1139,0.1417,160),(45,'ru',1140,0.1417,167),(45,'ru',1141,0.1417,171),(49,'ru',1141,0.1626,2),(45,'ru',1142,0.1417,172),(45,'ru',1143,0.1417,174),(45,'ru',1144,0.1417,180),(45,'ru',1145,0.1417,192),(45,'ru',1146,0.1417,193),(45,'ru',1147,0.1417,196),(45,'ru',1148,0.2246,203),(45,'ru',1149,0.1417,199),(45,'ru',1150,0.1417,207),(45,'ru',1151,0.1417,209),(46,'ru',1152,0.1529,5),(46,'ru',1153,0.1529,6),(46,'ru',1154,0.1529,16),(46,'ru',1155,0.1529,18),(46,'ru',1156,0.1529,22),(46,'ru',1157,0.1529,23),(46,'ru',1158,0.1529,27),(46,'ru',1159,0.1529,29),(46,'ru',1160,0.1529,35),(53,'ru',1160,0.2575,46.6667),(46,'ru',1161,0.1529,38),(46,'ru',1162,0.1529,41),(46,'ru',1163,0.1529,49),(46,'ru',1164,0.1529,51),(46,'ru',1165,0.1529,55),(46,'ru',1166,0.2424,70.5),(46,'ru',1167,0.1529,60),(46,'ru',1168,0.1529,61),(46,'ru',1169,0.1529,63),(46,'ru',1170,0.1529,65),(46,'ru',1171,0.1529,75),(46,'ru',1172,0.1529,84),(46,'ru',1173,0.1529,88),(46,'ru',1174,0.1529,90),(46,'ru',1175,0.1529,92),(46,'ru',1176,0.1529,98),(46,'ru',1177,0.2424,112.5),(46,'ru',1178,0.1529,109),(46,'ru',1179,0.1529,116),(46,'ru',1180,0.1529,126),(46,'ru',1181,0.1529,139),(46,'ru',1182,0.1529,140),(46,'ru',1183,0.1529,141),(46,'ru',1184,0.1529,142),(47,'ru',1185,0.1738,1),(49,'ru',1186,0.1626,14),(47,'ru',1186,0.1738,4),(48,'ru',1187,0.1626,15),(49,'ru',1187,0.1626,15),(47,'ru',1187,0.1738,5),(67,'ru',1187,0.2314,1),(69,'ru',1187,0.2314,1),(48,'ru',1188,0.1626,16),(49,'ru',1188,0.1626,16),(47,'ru',1188,0.1738,6),(47,'ru',1189,0.1738,7),(47,'ru',1190,0.1738,8),(47,'ru',1191,0.1738,10),(47,'ru',1192,0.1738,17),(47,'ru',1193,0.1738,20),(48,'ru',1194,0.1626,17),(47,'ru',1194,0.1738,21),(48,'ru',1195,0.1626,19),(47,'ru',1195,0.1738,23),(47,'ru',1196,0.1738,25),(53,'ru',1197,0.1287,240),(47,'ru',1197,0.1738,26),(47,'ru',1198,0.1738,30),(47,'ru',1199,0.1738,31),(47,'ru',1200,0.1738,32),(53,'ru',1200,0.2575,71.6667),(47,'ru',1201,0.1738,36),(48,'ru',1202,0.1626,83),(49,'ru',1202,0.1626,85),(47,'ru',1202,0.1738,43),(47,'ru',1203,0.1738,44),(48,'ru',1204,0.1626,84),(47,'ru',1204,0.1738,45),(49,'ru',1204,0.2577,92),(48,'ru',1205,0.1626,55),(47,'ru',1205,0.1738,48),(48,'ru',1206,0.1626,88),(49,'ru',1206,0.1626,95),(47,'ru',1206,0.1738,49),(48,'ru',1207,0.1626,89),(47,'ru',1207,0.1738,50),(48,'ru',1208,0.1626,90),(47,'ru',1208,0.1738,51),(47,'ru',1209,0.1738,53),(48,'ru',1210,0.1626,93),(47,'ru',1210,0.1738,54),(48,'ru',1211,0.1626,68),(49,'ru',1211,0.1626,100),(47,'ru',1211,0.1738,56),(48,'ru',1212,0.1626,74),(49,'ru',1212,0.1626,106),(47,'ru',1212,0.1738,62),(48,'ru',1213,0.1626,65),(47,'ru',1213,0.1738,65),(48,'ru',1214,0.1626,66),(47,'ru',1214,0.1738,66),(48,'ru',1215,0.3252,31),(48,'ru',1216,0.1626,4),(48,'ru',1217,0.1626,10),(49,'ru',1218,0.1626,21),(48,'ru',1218,0.2577,23.5),(48,'ru',1219,0.1626,21),(48,'ru',1220,0.2577,21),(53,'ru',1221,0.1287,38),(48,'ru',1221,0.1626,22),(48,'ru',1222,0.1626,30),(48,'ru',1223,0.1626,31),(48,'ru',1224,0.1626,33),(48,'ru',1225,0.1626,34),(48,'ru',1226,0.1626,49),(48,'ru',1227,0.2577,54),(48,'ru',1228,0.1626,54),(48,'ru',1229,0.1626,63),(49,'ru',1230,0.1626,62),(48,'ru',1230,0.1626,75),(48,'ru',1231,0.1626,78),(48,'ru',1232,0.1626,80),(48,'ru',1233,0.1626,81),(48,'ru',1234,0.1626,82),(48,'ru',1235,0.1626,85),(48,'ru',1236,0.1626,87),(48,'ru',1237,0.1626,92),(49,'ru',1238,0.2577,10),(49,'ru',1239,0.1626,7),(49,'ru',1240,0.1626,13),(49,'ru',1241,0.1626,20),(49,'ru',1242,0.1626,22),(49,'ru',1243,0.1626,24),(49,'ru',1244,0.1626,26),(49,'ru',1245,0.1626,28),(49,'ru',1246,0.1626,30),(49,'ru',1247,0.1626,41),(49,'ru',1248,0.1626,42),(49,'ru',1249,0.1626,45),(49,'ru',1250,0.1626,46),(49,'ru',1251,0.1626,47),(49,'ru',1252,0.2577,47),(49,'ru',1253,0.1626,51),(49,'ru',1254,0.1626,53),(49,'ru',1255,0.1626,54),(53,'ru',1256,0.1287,209),(49,'ru',1256,0.1626,59),(49,'ru',1257,0.1626,65),(49,'ru',1258,0.1626,67),(53,'ru',1259,0.1287,324),(49,'ru',1259,0.1626,68),(49,'ru',1260,0.1626,76),(49,'ru',1261,0.1626,77),(49,'ru',1262,0.1626,78),(49,'ru',1263,0.1626,88),(49,'ru',1264,0.1626,96),(51,'ru',1265,0.2314,1),(64,'ru',1265,0.3667,1.5),(66,'ru',1266,0.2314,2),(67,'ru',1266,0.2314,2),(54,'ru',1266,0.2314,3),(55,'ru',1266,0.2314,3),(56,'ru',1266,0.2314,3),(57,'ru',1266,0.2314,3),(58,'ru',1266,0.2314,3),(59,'ru',1266,0.2314,4),(60,'ru',1266,0.2314,4),(66,'ru',1267,0.2314,3),(67,'ru',1267,0.2314,3),(54,'ru',1267,0.2314,4),(55,'ru',1267,0.2314,4),(56,'ru',1267,0.2314,4),(57,'ru',1267,0.2314,4),(58,'ru',1267,0.2314,4),(59,'ru',1267,0.2314,5),(60,'ru',1267,0.2314,5),(5,'ru',1268,0.2314,1),(52,'ru',1269,0.2314,1),(53,'ru',1270,0.204,145),(54,'ru',1270,0.2314,2),(56,'ru',1270,0.2314,2),(55,'ru',1271,0.2314,1),(57,'ru',1271,0.2314,1),(58,'ru',1271,0.2314,1),(53,'ru',1272,0.3614,157.667),(53,'ru',1273,0.1287,7),(53,'ru',1274,0.1287,9),(53,'ru',1275,0.204,9),(53,'ru',1276,0.204,111.5),(53,'ru',1277,0.204,48),(53,'ru',1278,0.1287,26),(53,'ru',1279,0.204,26),(53,'ru',1280,0.1287,28),(53,'ru',1281,0.1287,29),(53,'ru',1282,0.1287,30),(53,'ru',1283,0.1287,31),(53,'ru',1284,0.2575,162.333),(53,'ru',1285,0.2575,53.6667),(53,'ru',1286,0.1287,37),(53,'ru',1287,0.1287,46),(53,'ru',1288,0.1287,62),(53,'ru',1289,0.1287,76),(53,'ru',1290,0.1287,78),(53,'ru',1291,0.1287,79),(53,'ru',1292,0.204,120.5),(53,'ru',1293,0.1287,88),(53,'ru',1294,0.1287,91),(53,'ru',1295,0.1287,94),(53,'ru',1296,0.1287,113),(53,'ru',1297,0.204,185.5),(53,'ru',1298,0.1287,119),(53,'ru',1299,0.1287,120),(53,'ru',1300,0.1287,124),(53,'ru',1301,0.1287,127),(53,'ru',1302,0.204,192.5),(53,'ru',1303,0.204,196.5),(53,'ru',1304,0.1287,135),(53,'ru',1305,0.1287,137),(53,'ru',1306,0.1287,138),(53,'ru',1307,0.1287,148),(53,'ru',1308,0.1287,156),(53,'ru',1309,0.1287,163),(53,'ru',1310,0.204,243),(53,'ru',1311,0.2989,220.75),(53,'ru',1312,0.1287,189),(53,'ru',1313,0.1287,200),(53,'ru',1314,0.1287,202),(53,'ru',1315,0.1287,204),(53,'ru',1316,0.1287,211),(53,'ru',1317,0.1287,213),(53,'ru',1318,0.1287,225),(53,'ru',1319,0.1287,227),(53,'ru',1320,0.1287,228),(53,'ru',1321,0.1287,229),(53,'ru',1322,0.204,229),(53,'ru',1323,0.1287,237),(53,'ru',1324,0.1287,239),(53,'ru',1325,0.1287,247),(53,'ru',1326,0.204,294.5),(53,'ru',1327,0.2575,294.333),(53,'ru',1328,0.204,284),(53,'ru',1329,0.1287,279),(53,'ru',1330,0.1287,281),(53,'ru',1331,0.1287,282),(53,'ru',1332,0.1287,285),(53,'ru',1333,0.1287,287),(53,'ru',1334,0.1287,297),(53,'ru',1335,0.1287,310),(53,'ru',1336,0.1287,312),(53,'ru',1337,0.1287,313),(53,'ru',1338,0.1287,314),(53,'ru',1339,0.204,328),(53,'ru',1340,0.1287,336),(53,'ru',1341,0.1287,339),(53,'ru',1342,0.1287,340),(65,'ru',1344,0.2314,1),(68,'ru',1345,0.2314,1),(6,'ru',1346,0.1679,112),(71,'ru',1347,0.2314,1),(71,'ru',1348,0.2314,1),(71,'ru',1349,0.2314,1),(72,'ru',1350,0.2314,1),(72,'ru',1351,0.2314,1),(73,'ru',1352,0.2314,1),(73,'ru',1353,0.3667,1),(74,'ru',1354,0.2314,1),(74,'ru',1355,0.2314,1),(75,'ru',1356,0.2314,1),(76,'ru',1356,0.2314,2),(75,'ru',1357,0.3667,1),(76,'ru',1357,0.3667,2),(76,'ru',1358,0.2314,1),(71,'ru',1359,0.2314,2),(71,'ru',1360,0.2314,3),(72,'ru',1361,0.2314,2),(72,'ru',1362,0.2314,3),(74,'ru',1363,0.2314,4),(74,'ru',1364,0.2314,5),(75,'ru',1365,0.2314,2),(76,'ru',1366,0.2314,4),(77,'ru',1367,0.2314,1),(78,'ru',1368,0.2314,1),(79,'ru',1369,0.2314,1);
/*!40000 ALTER TABLE `b_search_content_stem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_text`
--

DROP TABLE IF EXISTS `b_search_content_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) NOT NULL,
  `SEARCHABLE_CONTENT` longtext DEFAULT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_text`
--

LOCK TABLES `b_search_content_text` WRITE;
/*!40000 ALTER TABLE `b_search_content_text` DISABLE KEYS */;
INSERT INTO `b_search_content_text` VALUES (1,'be3fe2336ca014ea48484837a6379cf7','КАРТА САЙТА\r\n\r\n'),(2,'f58e028735b5d07233c4a161c9231405','ПОИСК\r\n\r\n'),(4,'9dc81310e5f6940cd74425623ed50b52','МЕБЕЛЬНАЯ КОМПАНИЯ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ «МЕБЕЛЬНАЯ КОМПАНИЯ» ПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ.\n«МЕБЕЛЬНАЯ КОМПАНИЯ» ОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД – С ДРУГОЙ.\nНАША ПРОДУКЦИЯ\rНАШИ УСЛУГИ\r\n'),(5,'ae140dbbe0ea9a5e58b583d317d3f28d','КАТАЛОГ\r\n\r\n'),(6,'613d7160d9a217a3a6c1ebb04225cd65','КОНТАКТЫ\r\nОБРАТИТЕСЬ К НАШИМ СПЕЦИАЛИСТАМ И ПОЛУЧИТЕ ПРОФЕССИОНАЛЬНУЮ КОНСУЛЬТАЦИЮ ПО ВОПРОСАМ СОЗДАНИЯ И ПОКУПКИ МЕБЕЛИ (ОТ ДИЗАЙНА, РАЗРАБОТКИ ТЕХНИЧЕСКОГО ЗАДАНИЯ ДО ДОСТАВКИ МЕБЕЛИ К ВАМ ДОМОЙ).\nВЫ МОЖЕТЕ ОБРАТИТЬСЯ К НАМ ПО ТЕЛЕФОНУ, ПО ЭЛЕКТРОННОЙ ПОЧТЕ ИЛИ ДОГОВОРИТЬСЯ О ВСТРЕЧЕ В НАШЕМ ОФИСЕ. БУДЕМ РАДЫ ПОМОЧЬ ВАМ И ОТВЕТИТЬ НА ВСЕ ВАШИ ВОПРОСЫ.\nТЕЛЕФОНЫ\rТЕЛЕФОН/ФАКС:\n(495) 212-85-06\rТЕЛЕФОНЫ:\n(495) 212-85-07\r(495) 212-85-08\rEMAIL\rINFO@EXAMPLE.RU\r— ОБЩИЕ ВОПРОСЫ\rSALES@EXAMPLE.RU\r— ПРИОБРЕТЕНИЕ ПРОДУКЦИИ\rMARKETING@EXAMPLE.RU\r— МАРКЕТИНГ/МЕРОПРИЯТИЯ/PR\rФОРМА ОБРАТНОЙ СВЯЗИ\rОФИС В МОСКВЕ\r\n'),(7,'7c285f6a61d238a340b43f0ef846a536','ВХОД НА САЙТ\r\nВЫ ЗАРЕГИСТРИРОВАНЫ И УСПЕШНО АВТОРИЗОВАЛИСЬ.\rВЕРНУТЬСЯ НА ГЛАВНУЮ СТРАНИЦУ\r\n'),(8,'c501a4fb29fd5bc92bc4babebf160ed9','РУКОВОДСТВО\r\nУСПЕШНОЕ РАЗВИТИЕ БИЗНЕСА  ВО МНОГОМ РЕЗУЛЬТАТ КВАЛИФИЦИРОВАННОЙ РАБОТЫ РУКОВОДСТВА. 							\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНА МЕБЕЛЬНОМ РЫНКЕ УЖЕ 18 ЛЕТ. ЗА ЭТО ВРЕМЯ КОМПАНИЯ 							НЕ ТОЛЬКО СОХРАНИЛА, НО И УПРОЧИЛА ЛИДИРУЮЩИЕ ПОЗИЦИИ СРЕДИ ВЕДУЩИХ ИГРОКОВ МЕБЕЛЬНОГО 							РЫНКА. 						\rМЕБЕЛЬНАЯ КОМПАНИЯ\rИЗ ГОДА В ГОД РАСШИРЯЕТ АССОРТИМЕНТ ВЫПУСКАЕМОЙ ПРОДУКЦИИ, 							НАРАЩИВАЕТ ТЕМПЫ И ОБЪЕМЫ ПРОИЗВОДСТВА, УВЕЛИЧИВАЕТ ПРОИЗВОДСТВЕННЫЕ И СКЛАДСКИЕ 							ПЛОЩАДИ, РАЗВИВАЕТ ОТНОШЕНИЯ С ПАРТНЕРАМИ СО ВСЕХ РЕГИОНОВ СТРАНЫ И НАЛАЖИВАЕТ СВЯЗИ 							С ЗАРУБЕЖНЫМИ ПАРТНЕРАМИ. В БОЛЬШОЙ СТЕПЕНИ ЭТО ЗАСЛУГА ХОРОШО ПОДГОТОВЛЕННОГО РУКОВОДЯЩЕГО 							СОСТАВА И ЕГО ГРАМОТНОЙ ПОЛИТИКИ. 						\rСОБСТВЕННИК КОМПАНИИ МЕБЕЛЬНАЯ КОМПАНИЯ\rКОЛЕСНИКОВ ВИКТОР ФЕДОРОВИЧ 								\rРОДИЛСЯ 3 СЕНТЯБРЯ 1964 ГОДА.\nОБРАЗОВАНИЕ: ЗАКОНЧИЛ АВИАЦИОННЫЙ ФАКУЛЬТЕТ ВОРОНЕЖСКОГО 									ГОСУДАРСТВЕННОГО ПОЛИТЕХНИЧЕСКОГО ИНСТИТУТА. В 1994 ГОДУ ПРОШЕЛ ОБУЧЕНИЕ ПО ПРОГРАММЕ 									ПОДГОТОВКА МАЛОГО И СРЕДНЕГО БИЗНЕСА В США.\nВ НАСТОЯЩЕЕ ВРЕМЯ ВИКТОР ФЕДОРОВИЧ 									ВОЗГЛАВЛЯЕТ УПРАВЛЯЮЩУЮ КОМПАНИЮ, КОТОРАЯ КООРДИНИРУЕТ ДЕЯТЕЛЬНОСТЬ ПРЕДПРИЯТИЙ, 									ВХОДЯЩИХ В ГРУППУ КОМПАНИЙ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. 								\rГЕНЕРАЛЬНЫЙ ДИРЕКТОР МЕБЕЛЬНОЙ КОМПАНИИ\rРАТЧЕНКО АЛЕКСАНДР ПЕТРОВИЧ 								\rРОДИЛСЯ 5 ИЮНЯ 1962 ГОДА.\nОБРАЗОВАНИЕ: ВОРОНЕЖСКИЙ ПОЛИТЕХНИЧЕСКИЙ ИНСТИТУТ 									ПО СПЕЦИАЛЬНОСТИ ИНЖЕНЕР-ТЕХНОЛОГ; ПРОГРАММА ЭФФЕКТИВНОЕ РАЗВИТИЕ ПРОИЗВОДСТВА 									(США).\nВ \rМЕБЕЛЬНОЙ КОМПАНИИ\rСЕРГЕЙ ФОМИЧ С 1994 ГОДА. ЗА ЭТО ВРЕМЯ ПРОШЕЛ 									ПУТЬ ОТ НАЧАЛЬНИКА ЦЕХА ДО ГЕНЕРАЛЬНОГО ДИРЕКТОРА ПРЕДПРИЯТИЯ. 								\rЗАМЕСТИТЕЛЬ ГЕНЕРАЛЬНОГО ДИРЕКТОРА УПРАВЛЯЮЩЕЙ КОМПАНИИ\rРОГОВОЙ АНДРЕЙ ВЛАДИМИРОВИЧ 								\rОБРАЗОВАНИЕ: ФАКУЛЬТЕТ РАДИОТЕХНИКИ ВОРОНЕЖСКОГО ГОСУДАРСТВЕННОГО ТЕХНИЧЕСКОГО УНИВЕРСИТЕТА.\nВ КОМПАНИИ С 1 ИЮНЯ 2000 ГОДА.\r\n'),(9,'55171aa121806afa21b564e0af9ed46f','ИСТОРИЯ\r\n1992Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНАЧИНАЛАСЬ С ИЗГОТОВЛЕНИЯ МЕБЕЛИ ДЛЯ ШКОЛ И ОФИСОВ. ПЕРВОЕ 									ПРОИЗВОДСТВО МЕБЕЛИ РАСПОЛАГАЛОСЬ В АРЕНДУЕМОЙ МАСТЕРСКОЙ, ПЛОЩАДЬЮ 400 М2 С ОДНИМ 									ДЕРЕВООБРАБАТЫВАЮЩИМ СТАНКОМ. В КОМПАНИИ РАБОТАЛО ДВАДЦАТЬ ЧЕЛОВЕК. ВСЕ ЗАРАБОТАННЫЕ 									СРЕДСТВА ВКЛАДЫВАЛИСЬ В РАЗВИТИЕ, ЧТО ПОЗВОЛИЛО МОЛОДОЙ КОМПАНИИ РАСТИ БЫСТРЫМИ 									ТЕМПАМИ. 								\r1993Г. 								\rВВЕДЕН В ЭКСПЛУАТАЦИЮ НОВЫЙ ЦЕХ ПЛОЩАДЬЮ 700 М2, СТАВШИЙ ПЕРВОЙ СОБСТВЕННОСТЬЮ 									\rМЕБЕЛЬНОЙ КОМПАНИИ\r. МОДЕРНИЗАЦИЯ ПРОИЗВОДСТВЕННОЙ БАЗЫ ПРЕДПРИЯТИЯ СТАЛА ХОРОШЕЙ 									ТРАДИЦИЕЙ. КОМПАНИЯ ПОСТЕПЕННО ПЕРЕШЛА К БОЛЕЕ СОВЕРШЕННОМУ ОБОРУДОВАНИЮ, ЧТО ПОЗВОЛИЛО 									ПОВЫСИТЬ УРОВЕНЬ КАЧЕСТВА ВЫПУСКАЕМОЙ ПРОДУКЦИИ И ЗНАЧИТЕЛЬНО УВЕЛИЧИТЬ ОБЪЕМЫ ПРОИЗВОДСТВА. 								\r1998Г. 								\rВ ВОРОНЕЖЕ ОТКРЫТ ПЕРВЫЙ ФИРМЕННЫЙ МАГАЗИН-САЛОН \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. ШАГ ЗА ШАГОМ 									ПРОДУКЦИЯ ПРЕДПРИЯТИЯ ЗАВОЕВЫВАЛА РЕГИОНЫ СИБИРИ И УРАЛА, МОСКВЫ И ПОДМОСКОВЬЯ, 									ЮГА И СЕВЕРО-ЗАПАДА РОССИИ. ПРОИЗВОДСТВЕННЫЕ ПЛОЩАДИ КОМПАНИИ УВЕЛИЧЕНЫ ДО 5000 									М2. 								\r1999Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rСТАЛА ДИПЛОМАНТОМ ОДНОЙ ИЗ САМЫХ ПРЕСТИЖНЫХ МЕЖДУНАРОДНЫХ 									ВЫСТАВОК \rЕВРОЭКСПОМЕБЕЛЬ-99\r- ПЕРВОЕ ОФИЦИАЛЬНОЕ ПРИЗНАНИЕ МЕБЕЛЬНОЙ ПРОДУКЦИИ 									МЕБЕЛЬНОЙ КОМПАНИИ. В ЭТОМ ЖЕ ГОДУ КОМПАНИЯ ВЫХОДИТ НА МИРОВОЙ РЫНОК. БЫЛ ЗАКЛЮЧЕН 									РЯД КОНТРАКТОВ НА ПОСТАВКУ МЕБЕЛИ В СТРАНЫ СНГ И БЛИЖНЕГО ЗАРУБЕЖЬЯ. 								\r2000Г. 								\rКОЛЛЕКТИВ КОМПАНИИ НАСЧИТЫВАЕТ БОЛЕЕ 500 СОТРУДНИКОВ. ЗАКЛЮЧАЮТСЯ НОВЫЕ КОНТРАКТ 									НА ПОСТАВКУ МЕБЕЛИ В ЕВРОПЕЙСКИЕ СТРАНЫ. 								\r2002Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rВОШЛА В ДЕСЯТКУ ЛУЧШИХ ПРОИЗВОДИТЕЛЕЙ МЕБЕЛИ ПО ДАННЫМ ВЕДУЩИХ 									МЕБЕЛЬНЫХ САЛОНОВ РОССИИ, А ТАКЖЕ В ЧИСЛО ЛИДЕРОВ ОРГАНИЗАЦИОННОГО РАЗВИТИЯ. 								\r2003Г. 								\rПРИСТУПИЛИ К СТРОИТЕЛЬСТВУ СКЛАДА МАТЕРИАЛОВ. В МОСКВЕ ОТКРЫТ ФИЛИАЛ КОМПАНИИ. \nПРОВЕДЕНА ПЕРВАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ, РЕЗУЛЬТАТОМ КОТОРОЙ СТАЛО УКРЕПЛЕНИЕ ВЗАИМОВЫГОДНЫХ 									ОТНОШЕНИЙ И ЗАКЛЮЧЕНИЕ ДИЛЕРСКИХ ДОГОВОРОВ. 								\r2004Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО И ОСНАЩЕНИЕ НОВОГО ПРОИЗВОДСТВЕННОГО КОРПУСА И СКЛАДА МАТЕРИАЛОВ. \nРАСШИРЕНО ПРЕДСТАВИТЕЛЬСТВО КОМПАНИИ НА РОССИЙСКОМ РЫНКЕ И ЗА РУБЕЖОМ. \nОТКРЫТО 									РЕГИОНАЛЬНОЕ ПРЕДСТАВИТЕЛЬСТВО \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ ЕКАТЕРИНБУРГЕ. 								\r2005Г. 								\rКОМПАНИЯ ПРИОБРЕТАЕТ НОВОЕ ПРОИЗВОДСТВЕННОЕ ОБОРУДОВАНИЕ КОНЦЕРНА - УГЛОВУЮ ЛИНИЮ 									РАСКРОЯ МАТЕРИАЛОВ И ЛИНИЮ ЗАГРУЗКИ ВЫГРУЗКИ. \nНАЧИНАЕТСЯ ВЫПУСК ПРОДУКЦИИ В 									НАТУРАЛЬНОМ ШПОНЕ. ФОРМИРУЕТСЯ ОТДЕЛЬНЫЙ СКЛАД МАТЕРИАЛОВ И КОМПЛЕКТУЮЩИХ. \nВ ЭТОМ ЖЕ ГОДУ ОТКРЫВАЕТСЯ ФАБРИКА МЯГКОЙ МЕБЕЛИ \rМЕБЕЛЬПЛЮС\r2006Г. 								\rОТКРЫТЫ РЕГИОНАЛЬНЫЕ ПРЕДСТАВИТЕЛЬСТВА \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ САНКТ-ПЕТЕРБУРГЕ 									И НИЖНЕМ НОВГОРОДЕ. \nРАЗВИВАЕТСЯ СОБСТВЕННАЯ РОЗНИЧНАЯ СЕТЬ ФИРМЕННЫХ МАГАЗИНОВ-САЛОНОВ 									НА ТЕРРИТОРИИ РОССИИ. 								\r2007Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО ВТОРОЙ ФАБРИКИ. ОБЩАЯ ПЛОЩАДЬ ПРОИЗВОДСВЕННО-СКЛАДСКИХ КОРПУСОВ 									КОМПАНИИ СОСТАВЛЯЕТ УЖЕ БОЛЕЕ 30000 М2. \nПРОВЕДЕНА ВТОРАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ 									КОМПАНИИ \r\"ТЕХНОЛОГИЯ УСПЕШНОГО БИЗНЕСА\"\r. 								\r2008Г. 								\rОТКРЫТО НОВОЕ ПРЕДПРИЯТИЕ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ \rКОМФОРТ\r. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОДОЛЖАЕТ ОБНОВЛЕНИЕ ОБОРУДОВАНИЯ. 								\r2008Г. 								\rНОВЕЙШИМ ОБОРУДОВАНИЕМ УКОМПЛЕКТОВАНА ВТОРАЯ ФАБРИКА. ЗАПУЩЕНА ВТОРАЯ ПРОИЗВОДСТВЕННАЯ 									ЛИНИЯ. \nПРОВЕДЕНА ТРЕТЬЯ КОНФЕРЕНЦИЯ \rПАРТНЕРСТВО - БИЗНЕС СЕГОДНЯ\rПРИНЯТО РЕШЕНИЕ О СТРОИТЕЛЬСТВЕ ТРЕТЬЕЙ ФАБРИКИ. ПЛОЩАДЬ ПРОИЗВОДСТВЕННО  СКЛАДСКИХ 									КОРПУСОВ СОСТАВИТ БОЛЕЕ 70000М2. \nПО ВСЕЙ СТРАНЕ И ЗАРУБЕЖОМ ОТКРЫТО 37 МЕБЕЛЬНЫХ 									САЛОНОВ. \nВ КОМПАНИИ РАБОТАЕТ БОЛЕЕ ПОЛУТОРА ТЫСЯЧ СОТРУДНИКОВ.\r\n'),(10,'17e08217818f62561b1d2f0f3a016a1f','МИССИЯ И СТРАТЕГИЯ\r\nМЕБЕЛЬНАЯ КОМПАНИЯ\r- ДИНАМИЧНО РАЗВИВАЮЩЕЕСЯ ПРОИЗВОДСТВЕННОЕ 							ПРЕДПРИЯТИЕ, КОТОРОЕ ИМЕЕТ ПЕРЕД СОБОЙ \nЯСНО ВЫРАЖЕННЫЕ ЦЕЛИ И ИНСТРУМЕНТЫ ДЛЯ 							ИХ ДОСТИЖЕНИ.МЫ ПРЕДОСТАВЛЯЕМ КАЖДОМУ ЛУЧШУЮ ВОЗМОЖНОСТЬ ОБУСТРОИТЬ СВОЕ ЖИЗНЕННОЕ \nИ РАБОЧЕЕ ПРОСТРАНСТВО.МЫ РАБОТАЕМ НА ДОЛГОСРОЧНУЮ ПЕРСПЕКТИВУ И ПРЕДЛАГАЕМ ОПТИМАЛЬНЫЕ 							РЕШЕНИЯ. КОМПАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r- \nНАДЕЖНЫЙ, ТЕХНОЛОГИЧНЫЙ, ГИБКИЙ ПОСТАВЩИК 							С БОЛЬШИМИ МОЩНОСТЯМИ. 						\rЦЕЛИ И ЗАДАЧИ\rОПРАВДЫВАТЬ ОЖИДАНИЯ ЗАКАЗЧИКА: КЛИЕНТ ВСЕГДА ПРАВ. ТОЛЬКО ПОТРЕБИТЕЛЬ ФОРМИРУЕТ 									ЕДИНУЮ СИСТЕМУ ВЗГЛЯДОВ НА КАЧЕСТВО \nВЫПУСКАЕМОЙ ПРОДУКЦИИ И РАБОТ.\rДОБИТЬСЯ ОТ РАБОТНИКОВ КОМПАНИИ ПОНИМАНИЯ ИХ ЛИЧНОЙ ОТВЕТСТВЕННОСТИ ЗА КАЧЕСТВО 									РАБОТ.\rПУТЕМ ПОВЫШЕНИЯ КАЧЕСТВА ПРОДУКЦИИ И РАБОТ ПОСТОЯННО УВЕЛИЧИВАТЬ ОБЪЕМЫ ПРОИЗВОДСТВА 									С ЦЕЛЬЮ ПОСЛЕДУЮЩЕГО РЕИНВЕСТИРОВАНИЯ \nПРИБЫЛИ В РАЗВИТИЕ КОМПАНИИ.\rОБЕСПЕЧИВАТЬ СТРОГОЕ СООТВЕТСТВИЕ ПРОИЗВОДИМОЙ ПРОДУКЦИИ ТРЕБОВАНИЯМ ПОТРЕБИТЕЛЕЙ, 									НОРМАМ И ПРАВИЛАМ \nБЕЗОПАСНОСТИ, ТРЕБОВАНИЯМ ЗАЩИТЫ ОКРУЖАЮЩЕЙ СРЕДЫ.\rПОЛИТИКА КОМПАНИИ\rПОСТОЯННОЕ СОВЕРШЕНСТВОВАНИЕ СИСТЕМЫ КАЧЕСТВА. СВОЕВРЕМЕННОЕ И ЭФФЕКТИВНОЕ ПРИНЯТИЕ 									КОРРЕКТИРУЮЩИХ МЕР .\rЗАБОТА О РАБОТНИКАХ КОМПАНИИ. СОЗДАНИЕ УСЛОВИЙ ТРУДА И ОСНАЩЕНИЕ РАБОЧИХ МЕСТ, СООТВЕТСТВУЮЩИХ 									ВСЕМ САНИТАРНЫМ \nИ ГИГИЕНИЧЕСКИМ НОРМАМ.\rПОВЫШЕНИЕ БЛАГОСОСТОЯНИЯ СОТРУДНИКОВ. ОБЕСПЕЧЕНИЕ МОРАЛЬНОГО И МАТЕРИАЛЬНОГО УДОВЛЕТВОРЕНИЯ 									РАБОТНИКОВ КОМПАНИИ.\rСИСТЕМАТИЧЕСКОЕ ОБУЧЕНИЕ РАБОТНИКОВ ВСЕХ УРОВНЕЙ С ЦЕЛЬЮ ПОСТОЯННОГО ПОВЫШЕНИЯ ИХ 									ПРОФЕССИОНАЛЬНОГО МАСТЕРСТВА.\rВНЕДРЕНИЕ ВЫСОКОПРОИЗВОДИТЕЛЬНОГО ОБОРУДОВАНИЯ И НОВЕЙШИХ ТЕХНОЛОГИЙ ДЛЯ ПОВЫШЕНИЯ 									ПРОИЗВОДИТЕЛЬНОСТИ ТРУДА, \nОПТИМИЗАЦИИ ЗАТРАТ И, КАК РЕЗУЛЬТАТ, СНИЖЕНИЯ ЦЕН 									НА ВЫПУСКАЕМУЮ ПРОДУКЦИЮ.\rСОЗДАНИЕ НОВЫХ РАБОЧИХ МЕСТ. ПРИВЛЕЧЕНИЕ НА РАБОТУ СПЕЦИАЛИСТОВ ВЫСОКОЙ КВАЛИФИКАЦИИ.\rВЫХОД НА МЕЖДУНАРОДНЫЙ РЫНОК.\rМЫ РАЗВИВАЕМ ДОВЕРИТЕЛЬНЫЕ ВЗАИМОВЫГОДНЫЕ ОТНОШЕНИЯ СО СВОИМИ ПАРТНЕРАМИ В ДОЛГОСРОЧНЫХ 							ИНТЕРЕСАХ НАШЕГО БИЗНЕСА. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rОТВЕТСТВЕННО ОТНОСИТСЯ 							К ВЫПОЛНЕНИЮ ВЗЯТЫХ НА СЕБЯ ОБЯЗАТЕЛЬСТВ И ЖДЕТ ТАКОГО ЖЕ \nПОДХОДА К ДЕЛУ ОТ 							СВОИХ ПАРТНЕРОВ ПО БИЗНЕСУ. ЭТА ТРЕБОВАТЕЛЬНОСТЬ  ЗАЛОГ НАШЕЙ ДОЛГОСРОЧНОЙ ПРИБЫЛЬНОСТИ. 						\rСО ДНЯ СВОЕГО ОСНОВАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rСОДЕЙСТВУЕТ РОСТУ БЛАГОСОСТОЯНИЯ 							РЕГИОНОВ РОССИИ. МЫ ПОНИМАЕМ ВАЖНОСТЬ \nСОЦИАЛЬНОЙ ОТВЕТСТВЕННОСТИ НАШЕЙ КОМПАНИИ 							И ОСТАНЕМСЯ ПРИМЕРОМ В ВОПРОСАХ СОЦИАЛЬНОЙ ЗАЩИЩЕННОСТИ НАШИХ СОТРУДНИКОВ.\r\n'),(11,'b535d9cb75c64e695d6ebad33b22d99c','О КОМПАНИИ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ. 						 \rГЛАВНОЕ ПРАВИЛО - ИНДИВИДУАЛЬНЫЙ ПОДХОД К КАЖДОМУ КЛИЕНТУ\rНА СЕГОДНЯШНИЙ ДЕНЬ НАМИ РАЗРАБОТАНО БОЛЕЕ ПЯТИСОТ МОДЕЛЕЙ ДЛЯ ОФИСА И ДОМА. ВМЕСТЕ С ТЕМ МЫ СТРЕМИМСЯ ОБЕСПЕЧИТЬ НЕПОВТОРИМОСТЬ СВОЕЙ ПРОДУКЦИИ. МЫ ИЗГОТОВИМ МЕБЕЛЬ ДЛЯ КУХНИ, ДЕТСКОЙ, ГОСТИНОЙ, СПАЛЬНОЙ ИЛИ ВАННОЙ КОМНАТЫ, МЕБЕЛЬ ДЛЯ ОФИСА ОСОБОГО ДИЗАЙНА И НЕСТАНДАРТНОГО РАЗМЕРА. \rНАШИ ДИЗАЙНЕРЫ ПРОИЗВЕДУТ ЗАМЕРЫ ПОМЕЩЕНИЯ И ВМЕСТЕ С ВАМИ РАЗРАБОТАЮТ ДИЗАЙН-ПРОЕКТ МЕБЕЛИ ДЛЯ ВАШЕГО ИНТЕРЬЕРА, ПОДОБРАВ С ВЫСОКОЙ ТОЧНОСТЬЮ РАЗМЕРЫ, МОДЕЛИ, ЦВЕТА, ПОМОГУТ ОПТИМАЛЬНО РАСПОЛОЖИТЬ МЕБЕЛЬ. \rВАШ ПРОЕКТ БУДЕТ СОЗДАН С УЧЕТОМ ВСЕХ НЮАНСОВ И ПРОРИСОВКОЙ МЕЛЬЧАЙШИХ ДЕТАЛЕЙ. РЕЗУЛЬТАТЫ СОВМЕСТНОГО ТВОРЧЕСТВА ВЫ СМОЖЕТЕ ПОСМОТРЕТЬ В ОБЪЕМНОМ ПРЕДСТАВЛЕНИИ. ВАМ НАГЛЯДНО ПРОДЕМОНСТРИРУЮТ, КАК БУДУТ ВЫГЛЯДЕТЬ В ЖИЗНИ ВЫБРАННЫЕ ЭЛЕМЕНТЫ ИНТЕРЬЕРА ПРИ РАЗНОМ ОСВЕЩЕНИИ, В КОНКРЕТНОМ ПОМЕЩЕНИИ, СДЕЛАННЫЕ ИЗ ОПРЕДЕЛЕННЫХ МАТЕРИАЛОВ. В ВАШЕ РАСПОРЯЖЕНИЕ БУДЕТ ПРЕДОСТАВЛЕНО МНОГО РАЗЛИЧНЫХ ВАРИАНТОВ, ИЗ КОТОРЫХ ВЫ СМОЖЕТЕ ВЫБРАТЬ НАИБОЛЕЕ ПОДХОДЯЩИЙ ИМЕННО ВАМ. 						 					\rЗАКАЗ БУДЕТ ВЫПОЛНЕН И ДОСТАВЛЕН ТОЧНО В СРОК. ВСЕ РАБОТЫ ПО СБОРКЕ И УСТАНОВКЕ МЕБЕЛИ ОСУЩЕСТВЛЯЮТ СОТРУДНИКИ НАШЕЙ КОМПАНИИ. СТРОГИЙ КОНТРОЛЬ КАЧЕСТВА ОСУЩЕСТВЛЯЕТСЯ НА ВСЕХ ЭТАПАХ РАБОТ: ОТ МОМЕНТА ОФОРМЛЕНИЯ ЗАКАЗА ДО МОМЕНТА ПРИЕМА ВЫПОЛНЕННЫХ РАБОТ. \rПЕРЕДОВЫЕ ТЕХНОЛОГИИ И БЕСЦЕННЫЙ ОПЫТ\rИСПОЛЬЗОВАНИЕ ПЕРЕДОВЫХ КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ, МНОГОЛЕТНИЙ ОПЫТ НАШИХ СПЕЦИАЛИСТОВ ПОЗВОЛЯЮТ ПРОИЗВЕСТИ ГРАМОТНЫЕ РАСЧЕТЫ И СНИЗИТЬ РАСХОД МАТЕРИАЛОВ И СЕБЕСТОИМОСТЬ ПРОДУКЦИИ, ИЗБЕЖАТЬ ОШИБОК ПРИ ПРОЕКТИРОВАНИИ И ОПТИМИЗИРОВАТЬ ДИЗАЙН КОМПЛЕКСНЫХ ИНТЕРЬЕРОВ. ГАРАНТИЯ НА НАШУ ПРОДУКЦИЮ СОСТАВЛЯЕТ 18 МЕСЯЦЕВ, А НА ОТДЕЛЬНУЮ ПРОДУКЦИЮ 36 МЕСЯЦЕВ. \rМЫ ГОРДИМСЯ НАШИМИ СОТРУДНИКАМИ ПРОШЕДШИМИ ПРОФЕССИОНАЛЬНОЕ ОБУЧЕНИЕ В ЛУЧШИХ УЧЕБНЫХ ЗАВЕДЕНИЯХ РОССИИ И ЗАРУБЕЖЬЯ. У НАС ТРУДЯТСЯ ВЫСОКОКЛАССНЫЕ СПЕЦИАЛИСТЫ РАЗНЫХ ВОЗРАСТОВ. МЫ ЦЕНИМ ЭНТУЗИАЗМ МОЛОДЕЖИ И БЕСЦЕННЫЙ ОПЫТ СТАРШЕГО ПОКОЛЕНИЯ. ВСЕ МЫ РАЗНЫЕ, НО НАС ОБЪЕДИНЯЕТ ПРЕДАННОСТЬ СВОЕМУ ДЕЛУ И ВЕРА В ИДЕИ НАШЕЙ КОМПАНИИ. \rВЫСОЧАЙШИЕ СТАНДАРТЫ КАЧЕСТВА - ЗАЛОГ НАШЕГО УСПЕХА\rМЕБЕЛЬНАЯ КОМПАНИЯ\rОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД  С ДРУГОЙ. \rЕЖЕГОДНО НАША ПРОДУКЦИЯ ПРОХОДИТ СЕРТИФИКАЦИОННЫЕ ИСПЫТАНИЯ В СПЕЦИАЛИЗИРОВАННЫХ ЛАБОРАТОРИЯХ РОССИИ И ИМЕЕТ СЕРТИФИКАТЫ СООТВЕТСТВИЯ ПРОДУКЦИИ НОРМАМ БЕЗОПАСНОСТИ И КАЧЕСТВА. КРОМЕ ТОГО, \rМЕБЕЛЬНАЯ КОМПАНИЯ\rОДНОЙ ИЗ ПЕРВЫХ СРЕДИ МЕБЕЛЬНЫХ ПРОИЗВОДИТЕЛЕЙ РОССИИ В 2003 ГОДУ ПРОШЛА АУДИТ НА СООТВЕТСТВИЕ ТРЕБОВАНИЯМ СИСТЕМЫ МЕНЕДЖМЕНТА КАЧЕСТВА ИСО 9000 И ПОЛУЧИЛА СЕРТИФИКАТ СООТВЕТСТВИЯ СИСТЕМЫ КАЧЕСТВА НА ПРЕДПРИЯТИИ НОРМАМ МЕЖДУНАРОДНОГО СТАНДАРТА.\r\n'),(12,'d6ae18283686e0f65091531174c8b418','ВАКАНСИИ\r\n\r\n'),(13,'626a5d1bd18fcc622fbe4e4e3619a88a','НОВОСТИ\r\n\r\n'),(14,'92742420ff489208277435770b2dba28','МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ \rМЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\n\rС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ \rМЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ УЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ \rБЕЛАРУСИ, АВСТРИИ, ЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ \rИ\rУКРАИНЫ\r. В СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ МЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ БУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ СЕКТОРОВ:\rГОТОВОЙ МЕБЕЛИ\rИ \rМАТЕРИАЛОВ ДЛЯ ЕЕ ПРОИЗВОДСТВА\r.\rВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ:\rКОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ;\rМЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ;\rПРЕДМЕТЫ ИНТЕРЬЕРА;\rКУХОННАЯ МЕБЕЛЬ;\rМЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ.\rВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ РЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, ОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ.\rПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ ВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ ДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В РАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. И ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ СТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"\rНАРОДНОЕ ПРИЗНАНИЕ\r\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ ВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ СМОТРОМ ОБРАЗЦОВ МЕБЕЛИ.\rМЕБЕЛЬНЫЙ ФОРУМ\rПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ ВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ МЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ ПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ ПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ ПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА БУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ ПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК \rМЕБЕЛЬНОГО ФОРУМА\r.\rПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ ДО 12 АПРЕЛЯ 2010 ГОДА.\r\n'),(15,'d28b14fc723b19c85e2a5f17daa89898','МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. \r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.\r\n'),(16,'6e9c53b4377c8bda27a391c004332b06','ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ СОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. \r\n\rАВТОРЫ ИЗОБРЕТЕНИЯ\r: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ И МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА \rПАТЕНТ РОССИЙСКОЙ ФЕДЕРАЦИИ RU2277566\rОПИСАНИЕ ИЗОБРЕТЕНИЯ\rИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ.\rДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ ЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ СМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ И ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ ХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \rИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ ПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ.\rЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, ВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, СОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ МОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ СМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ СМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА - КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ ПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, МАС.Ч.:\rКАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА\r64,5-79,2\r10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ\r4,4-20,5\rОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r0,6-2,0\rСМОЛЫ 2542\r13,0-15,8\r\n'),(17,'2efa39d6fa529b12dd51fd7139adec0e','МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ\r\n'),(18,'2c9244e9e768ea36f0bb298526f21402','ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ\r\n'),(19,'acd32268f26f878af2a96d753ccbc9c8','МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ\r\n'),(20,'e986498f11e924c98c57e35939cf927f','ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ\r\n'),(21,'f86144adfc89dc75855e25d200a5e333','ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ ТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\r\n \rИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ ТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\n'),(22,'3a7ce138fe31e4cc12b2809a04e0db25','МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. КАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ.\rПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\r\n \rБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. КАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ.\rПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\n'),(23,'df6d1da3eabe6c40954a796579d554cb','МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ НА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \rС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\r\n \rКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ НА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \rС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\n'),(24,'bc3cb6280475204c00312b331b7c2fa9','ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА ОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА \rСЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \rТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\r\n \rДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА ОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА \rСЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \rТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\n'),(25,'5c32b6f62c6126843cbd44b1a593d952','ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ В КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, \rСОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\r\n \rДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ В КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, \rСОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\n'),(26,'7955bfe502463895d32a336f267421a8','ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. ОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\r\n \rИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. ОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\n'),(27,'00e3040c167611cbe598003e6d5427ae','АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ ТКАНИ, РУЧНАЯ СТРОЧКА, \rПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\r\n \rКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ ТКАНИ, РУЧНАЯ СТРОЧКА, \rПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\n'),(28,'f5e7877d0bc889cce24427c1d1e8d96f','ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\r\n \rИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\n'),(29,'13ffbc270cbe931d486a5511fd6da896','ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ РОСКОШНЫХ ИНТЕРЬЕРОВ. \rЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\r\n \rКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ РОСКОШНЫХ ИНТЕРЬЕРОВ. \rЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\n'),(30,'81fb3b3fcb9358b5de6446706e8e132c','ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК НАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\r\n \rТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК НАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\n'),(31,'fee2bd8c63d03b8452efa69f751e6fb2','ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН ИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. \rЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\r\n \rДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН ИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. \rЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\n'),(32,'e980bf84fb99998e698762a99222ea9a','МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ ЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, \rКОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, \rКОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. \rЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \rДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, \rНО И САМОГО ВРЕМЕНИ.\r\r\n \rОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ ЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, \rКОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, \rКОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. \rЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \rДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, \rНО И САМОГО ВРЕМЕНИ.\r\n'),(33,'286e9f6fd660a7a29d1c58fd03b7cbfa','ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ ОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. \rПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\rСЕРИЯ \r«ОПТИМА»\rПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ \rОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ \rПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\rМЕБЕЛЬ \r«ОПТИМА»\r- ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\r\n \rУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ ОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\rСЕРИЯ \r«ОПТИМА»\rПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\rМЕБЕЛЬ \r«ОПТИМА»\r- ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\n'),(34,'37c339b919a986e466960961039e1d6a','СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ ДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ.\rУДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\r\n \rЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ ДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ.\rУДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\n'),(35,'cae6ed5ad18b5af81c184a7d384f6dd3','ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, И ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \rСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. \rСПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \rОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\r\n \rЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, И ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \rСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. \rСПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \rОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\n'),(36,'07e40b7ee85f6e0586e6b7dca7071207','ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ\rВО ГЛАВЕ БОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ\rОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \rПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\r\n \rКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ\rВО ГЛАВЕ БОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ\rОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \rПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. \rДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ СТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА ВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. \rПРОИЗВОДИТСЯ ОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ В ГОД.\r\n'),(37,'eafc4c3a71f8b67e539a59cd7f90eeda','ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ ФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. \rДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\r\n \rОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ ФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. \rДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\n'),(38,'d9c1fcdf56ed763d069672a51edaf886','ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \rСТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \rТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\r\n \r <P>СТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r СТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r ТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.</P>\r\n'),(39,'6b34dc50a2008617635888607e22f36c','ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ С УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \rИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И \rОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\r\n \rУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ С УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \rИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И \rОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\n'),(40,'dde02b9a7017c12f3635df242d7fec2d','ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И \rМЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ \rПЕРСОНАЛА.\r\r\n \rСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И \rМЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ \rПЕРСОНАЛА.\r\n'),(41,'e8afd744f2236f58877667738872c313','ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ ИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. \rТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\r\n \rСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ ИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. \rТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\n'),(42,'fc9d38eebe941fe855bc8731bfa026c1','ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ СИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, \rЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ \rК КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\r\n \rСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ СИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, \rЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ \rК КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\n'),(43,'3485e5d80bb6fbae95a83915c4aca23f','СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ ОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ \rСВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С \rЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\r\n \rСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ ОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ \rСВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С \rЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\n'),(44,'53dd08f5b5b2624b7521c7f382c7f9f6','ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ МЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И \rСИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ \rВ КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\r\n \rПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ МЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И \rСИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ \rВ КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\n'),(45,'da430218f51fdea19711a3806fb7a3c4','МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ НА ЗАКАЗ.\r\n \rНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ НА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ И КОРПУСНЫЕ ШКАФЫ КУПЕ,\rГАРДЕРОБНЫЕ КОМНАТЫ, ПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ И ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ.\rМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ ИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, МАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ.\rПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ СО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ МЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ И\rПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ ВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, СОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ.\rПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ СРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ ПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО,\rГДЕ ОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ В ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. ПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ\rНЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ РАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ НЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ\rСОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ С ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ ДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ\rВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ ЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА ОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.\r\n'),(46,'6ae9d8e3d86f6edc36947e4e39db948b','УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ МЕБЕЛИ.\r\n \rДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ ПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, ОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, ОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, РАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ ЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ ЖИЗНИ.\rРАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ РАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ ПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ ЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ ВАРИАНТ.\rРАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ МОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, ИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ ПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ ИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ.\rПОДБОР И РАССТАНОВКА МЕБЕЛИ.\rДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ ИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ ПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ ЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.\r\n'),(47,'73b0737b640ddf58dcbdd46d5175e414','ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\nТРЕБОВАНИЯ\rУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ ОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ В МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ\rОБЯЗАННОСТИ\rКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ МЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ ПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ.\rУСЛОВИЯ\rЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ СОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ\r\n'),(48,'fa5c9c5ac99f37b001a1a0421af4b144','ДИРЕКТОР МАГАЗИНА\r\nТРЕБОВАНИЯ\rВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ РАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ ПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ УПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ ЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ ОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ.\rОБЯЗАННОСТИ\rРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ ЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ ФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И ОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ ОТЧЕТНОСТЬ.\rУСЛОВИЯ\rТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ ГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: ОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 35000 РУБ\r\n'),(49,'3187d1b1ae8eb650d8851807a7ab248b','БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\nТРЕБОВАНИЯ\rЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ РАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ БУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), САМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, БЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ.\rОБЯЗАННОСТИ\rРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ МПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ СЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ ПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ ФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ\rУСЛОВИЯ\rГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ Г. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД 10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.\r\n'),(51,'85c3cf0e7e15755e89b334085eb959c0','ОТЗЫВЫ\r\n\r\n'),(52,'ea6126fb7955e8b046b0e0ff4efc24fd','АКЦИИ\r\n\r\n'),(53,'841f65e384b9ae5372ba7a626ad4d67d','УСЛОВИЯ СОТРУДНИЧЕСТВА\r\nУЧАСТИЕ В ПАРТНЕРСКОЙ ПРОГРАММЕ ВЫВОДИТ БИЗНЕС ВЕБ-РАЗРАБОТЧИКОВ НА НОВЫЙ УРОВЕНЬ, ПОЗВОЛЯЕТ: \nРАБОТАТЬ С КРУПНЫМИ КОРПОРАТИВНЫМИ ЗАКАЗЧИКАМИ\rТАКИЕ ЗАКАЗЧИКИ ТЩАТЕЛЬНО ПОДХОДЯТ К ВОПРОСУ СНИЖЕНИЯ РИСКОВ И ВЫБИРАЮТ СТАНДАРТНУЮ, РАСПРОСТРАНЕННУЮ, ОТЧУЖДАЕМУЮ ОТ РАЗРАБОТЧИКА И ФУНКЦИОНАЛЬНУЮ ПЛАТФОРМУ «1С-БИТРИКС: УПРАВЛЕНИЕ САЙТОМ».\nПОВЫСИТЬ СЛОЖНОСТЬ ПРОЕКТОВ \rГОТОВЫЕ ФУНКЦИОНАЛЬНЫЕ ВОЗМОЖНОСТИ ПЛАТФОРМЫ ПОЗВОЛЯЮТ РАБОТАТЬ НАД БОЛЕЕ ФУНКЦИОНАЛЬНЫМИ И СЛОЖНЫМИ, НО И БОЛЕЕ ДОРОГИМИ И ИНТЕРЕСНЫМИ ПРОЕКТАМИ.\rПОВЫСИТЬ КАЧЕСТВО ПРОЕКТОВ\rПЛАТФОРМА ТЩАТЕЛЬНО ТЕСТИРУЕТСЯ, ВСЕГДА ДОСТУПНА СЛУЖБА ТЕХНИЧЕСКОЙ ПОДДЕРЖКИ. ЭТО ДАЕТ ПАРТНЕРАМ ВОЗМОЖНОСТЬ ДОБИВАТЬСЯ ВЫСОКОГО КАЧЕСТВА РЕАЛИЗУЕМЫХ ПРОЕКТОВ.\n \n \nКАК СТАТЬ ПАРТНЕРОМ\r1. ЗАРЕГИСТРИРОВАТЬСЯ НА САЙТЕ\nРЕГИСТРИРУЯСЬ НА САЙТЕ, ВЫ ПОЛУЧАЕТЕ СВОЙ АККАУНТ (ЛОГИН), ПОД КОТОРЫМ В ДАЛЬНЕЙШЕМ БУДЕТЕ УПРАВЛЯТЬ КАРТОЧКОЙ ПАРТНЕРА, ОФОРМЛЯТЬ ЗАКАЗЫ С ПАРТНЕРСКОЙ СКИДКОЙ, ПОЛУЧИТЕ ДОСТУП К ЗАКРЫТЫМ РАЗДЕЛАМ ПАРТНЕРСКОГО САЙТА И ФОРУМУ.\nАВТОРИЗУЯСЬ НА САЙТЕ КАК ПАРТНЕР, ВЫ ПОЛУЧИТЕ ВОЗМОЖНОСТЬ ОБРАЩАТЬСЯ В НАШУ ТЕХНИЧЕСКУЮ ПОДДЕРЖКУ С ПОВЫШЕННЫМ ПРИОРИТЕТОМ.\n \n2. ЗАПОЛНИТЬ АНКЕТУ ПАРТНЕРА\nНА ОСНОВАНИИ ДАННЫХ ИЗ АНКЕТЫ ПАРТНЕРА МЫ ПРИНИМАЕМ РЕШЕНИЕ О ВОЗМОЖНОСТИ УСТАНОВЛЕНИЯ ПАРТНЕРСКИХ ОТНОШЕНИЙ. МЫ ТАК ЖЕ ХОТЕЛИ БЫ ВИДЕТЬ ВАШ ПОЛНОЦЕННЫЙ РАБОТАЮЩИЙ КОРПОРАТИВНЫЙ САЙТ С УКАЗАНИЕМ ВАШИХ КОНТАКТОВ И ПЕРЕЧНЕМ ПРЕДЛАГАЕМЫХ УСЛУГ. ПАРТНЕРСКАЯ ПРОГРАММА ПРЕДНАЗНАЧЕНА ДЛЯ СТУДИЙ ДИЗАЙНА, РАЗРАБОТЧИКОВ САЙТОВ, ИНТЕГРАТОРОВ И ВСЕХ ТЕХ, КТО ПРОФЕССИОНАЛЬНО ЗАНИМАЕТСЯ РАЗРАБОТКОЙ ВЕБ-РЕШЕНИЙ ДЛЯ КОНЕЧНЫХ КЛИЕНТОВ.\nПОСЛЕ ПРОВЕРКИ АНКЕТЫ С НАШЕЙ СТОРОНЫ ВЫ СРАЗУ ПОЛУЧАЕТЕ ВОЗМОЖНОСТЬ ОФОРМЛЯТЬ ЗАКАЗЫ С ПАРТНЕРСКОЙ СКИДКОЙ\n \n3. ВЫСЛАТЬ ПОДПИСАННЫЙ БУМАЖНЫЙ ДОГОВОР ПО ПОЧТЕ\n \nПОСЛЕ ТОГО КАК ВАША АНКЕТА БУДЕТ ОДОБРЕНА, ВАМ ПРИДЕТ УВЕДОМЛЕНИЕ НА ВАШ E-MAIL О НАЧАЛЕ СОТРУДНИЧЕСТВА. ПОСЛЕ ЭТОГО ВАМ НУЖНО ПОДПИСАТЬ БУМАЖНЫЙ ДОГОВОР С НАШЕЙ КОМПАНИЕЙ. ВАМ ПОТРЕБУЕТСЯ ЗАПОЛНИТЬ РЕКВИЗИТЫ, РАСПЕЧАТАТЬ ДВА ЭКЗЕМПЛЯРА ДОГОВОРА, ПОДПИСАТЬ СО СВОЕЙ СТОРОНЫ И ВЫСЛАТЬ НА АДРЕС НАШЕЙ КОМПАНИИ. МЫ, СО СВОЕЙ СТОРОНЫ, ПОДПИШЕМ ДОГОВОР И ОТПРАВИМ ОДИН ЭКЗЕМПЛЯР ВАМ.\r\n'),(54,'b66de5e1b964c2265988a4a021b6ef95','УСЛОВИЯ СОТРУДНИЧЕСТВА\r\nTEXT HERE....\r\n'),(55,'54a2127dacc2b9d06d831885954c04fa','РАСПИСАНИЕ МЕРОПРИЯТИЙ\r\nTEXT HERE....\r\n'),(56,'b66de5e1b964c2265988a4a021b6ef95','УСЛОВИЯ СОТРУДНИЧЕСТВА\r\nTEXT HERE....\r\n'),(57,'54a2127dacc2b9d06d831885954c04fa','РАСПИСАНИЕ МЕРОПРИЯТИЙ\r\nTEXT HERE....\r\n'),(58,'54a2127dacc2b9d06d831885954c04fa','РАСПИСАНИЕ МЕРОПРИЯТИЙ\r\nTEXT HERE....\r\n'),(59,'fd87c2afd5f3de8b42cd7d5ed211d189','КАК СТАТЬ ПАРТНЕРОМ\r\nTEXT HERE....\r\n'),(60,'fd87c2afd5f3de8b42cd7d5ed211d189','КАК СТАТЬ ПАРТНЕРОМ\r\nTEXT HERE....\r\n'),(61,'01b241f580eb7d284dd883218ecccdaf','МЕБЕЛЬНАЯ КОМПАНИЯ\r\n\r\n'),(64,'144b2978aebaa3617747adb2e5f1d28f','ОТЗЫВЫ\r\nОТЗЫВЫ\r\n'),(65,'4ca200ee516256f67fa334608bb550d9','TEST\r\n\r\n'),(66,'4c660a07952f10288e979d0f14f71fa6','СПАЛЬНИ\r\nTEXT HERE....\r\n'),(67,'28f2b9c8d479fa1c8cb7a79e66bc197e','ПОЛЬЗОВАТЕЛЬ\r\nTEXT HERE....\r\n'),(68,'f4738b5f097a1138c2ddfff6785443d9','РЕГИСТРАИЦЯ\r\n\r\n'),(69,'6ce3f7ace93208c9b1d84b8a7e69578a','ПОЛЬЗОВАТЕЛЬ\r\n\r\n'),(71,'1b9b013d5653d5b3e6aa79e3b2748c9b','ИВАНОВ\r\nКРУТО, НАВЕРНОЕ ЭТО ПОЛЕЗНО...\r\n'),(72,'67ac68da146ab5d897d872eabda05bf9','СИДОРОВА\r\nНЕВЕРОЯТНАЯ ВЁРСТКА\r\n'),(73,'6590c8a4cc7fd371c7aac236388f4812','ПЕТРОВ\r\nДА\r\n'),(74,'93f261c0c13b7867e778b52358c69b0c','СМИРНОВА\r\nЧТО С ХЛЕБНЫМИ КРОШКАМИ\r\n'),(75,'0e1c0a05803073b1bbf1995274929160','КОЗЛОВ\r\nАНОНС ЭТО КАК?\r\n'),(76,'2943862b16c413a4d3c24386cce39ae1','НИКИТИНА\r\nКОЗЛОВ СОЗДАН НЕЙРОСЕТЬЮ?\r\n'),(77,'98d528b81470115c93d5a063c4924e88','АКЦИЯ_1\r\n\r\n'),(78,'45f69d7505990882f982dd19743d84f3','АКЦИЯ_2\r\n\r\n'),(79,'0e5722d0b9685ee7c26fcebae2f752b2','АКЦИЯ_3\r\n\r\n');
/*!40000 ALTER TABLE `b_search_content_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_content_title`
--

DROP TABLE IF EXISTS `b_search_content_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_content_title`
--

LOCK TABLES `b_search_content_title` WRITE;
/*!40000 ALTER TABLE `b_search_content_title` DISABLE KEYS */;
INSERT INTO `b_search_content_title` VALUES (15,'s1',39,'DEL'),(15,'s1',43,'MOBILE'),(15,'s1',33,'SALON'),(65,'s1',0,'TEST'),(52,'s1',0,'АКЦИИ'),(77,'s1',0,'АКЦИЯ_1'),(78,'s1',0,'АКЦИЯ_2'),(79,'s1',0,'АКЦИЯ_3'),(27,'s1',0,'АЛАДДИН'),(14,'s1',16,'БЕЛАРУСИ'),(49,'s1',0,'БУХГАЛТЕР'),(12,'s1',0,'ВАКАНСИИ'),(40,'s1',0,'ВАЛЕНСИЯ'),(16,'s1',17,'ВОДОСТОЙКОЕ'),(7,'s1',0,'ВХОД'),(15,'s1',24,'ВЫСТАВКА'),(21,'s1',0,'ГЕРЦОГ'),(49,'s1',23,'ГОТОВОЙ'),(20,'s1',0,'ДЕТСКАЯ'),(28,'s1',0,'ДЖОКОНДА'),(46,'s1',7,'ДИЗАЙНЕРА'),(48,'s1',0,'ДИРЕКТОР'),(19,'s1',7,'ДЛЯ'),(45,'s1',10,'ЗАКАЗ'),(10,'s1',1,'И'),(71,'s1',0,'ИВАНОВ'),(26,'s1',0,'ИЗАБЕЛЛА'),(44,'s1',0,'ИЗОПЛАСТ'),(9,'s1',0,'ИСТОРИЯ'),(59,'s1',0,'КАК'),(60,'s1',0,'КАК'),(1,'s1',0,'КАРТА'),(5,'s1',0,'КАТАЛОГ'),(75,'s1',0,'КОЗЛОВ'),(11,'s1',2,'КОМПАНИИ'),(4,'s1',10,'КОМПАНИЯ'),(61,'s1',10,'КОМПАНИЯ'),(6,'s1',0,'КОНТАКТЫ'),(19,'s1',11,'КУХНИ'),(47,'s1',19,'КУХНИ'),(31,'s1',0,'ЛАУРА'),(25,'s1',0,'ЛИВЕРПУЛЬ'),(35,'s1',0,'ЛИДЕР'),(48,'s1',9,'МАГАЗИНА'),(17,'s1',7,'МЕБЕЛЬ'),(18,'s1',8,'МЕБЕЛЬ'),(19,'s1',0,'МЕБЕЛЬ'),(20,'s1',8,'МЕБЕЛЬ'),(45,'s1',0,'МЕБЕЛЬ'),(4,'s1',0,'МЕБЕЛЬНАЯ'),(15,'s1',14,'МЕБЕЛЬНАЯ'),(61,'s1',0,'МЕБЕЛЬНАЯ'),(14,'s1',0,'МЕБЕЛЬНЫЙ'),(15,'s1',0,'МЕЖДУНАРОДНАЯ'),(55,'s1',11,'МЕРОПРИЯТИЙ'),(57,'s1',11,'МЕРОПРИЯТИЙ'),(58,'s1',11,'МЕРОПРИЯТИЙ'),(23,'s1',0,'МИНИСТР'),(10,'s1',0,'МИССИЯ'),(32,'s1',0,'МОДЕРН'),(22,'s1',0,'МОНАЛИЗА'),(17,'s1',0,'МЯГКАЯ'),(7,'s1',5,'НА'),(45,'s1',7,'НА'),(76,'s1',0,'НИКИТИНА'),(13,'s1',0,'НОВОСТИ'),(11,'s1',0,'О'),(33,'s1',0,'ОПТИМА'),(49,'s1',10,'ОТДЕЛА'),(51,'s1',0,'ОТЗЫВЫ'),(64,'s1',0,'ОТЗЫВЫ'),(18,'s1',0,'ОФИСНАЯ'),(39,'s1',0,'ПАЛЕРМО'),(38,'s1',0,'ПАРМА'),(59,'s1',10,'ПАРТНЕРОМ'),(60,'s1',10,'ПАРТНЕРОМ'),(73,'s1',0,'ПЕТРОВ'),(37,'s1',0,'ПЛУТОН'),(2,'s1',0,'ПОИСК'),(16,'s1',0,'ПОЛУЧЕНО'),(67,'s1',0,'ПОЛЬЗОВАТЕЛЬ'),(69,'s1',0,'ПОЛЬЗОВАТЕЛЬ'),(36,'s1',0,'ПРЕЗИДЕНТ'),(30,'s1',0,'ПРЕСТИЖ'),(47,'s1',0,'ПРОДАВЕЦ-ДИЗАЙНЕР'),(49,'s1',31,'ПРОДУКЦИИ'),(16,'s1',9,'ПРОЧНОЕ'),(55,'s1',0,'РАСПИСАНИЕ'),(57,'s1',0,'РАСПИСАНИЕ'),(58,'s1',0,'РАСПИСАНИЕ'),(68,'s1',0,'РЕГИСТРАИЦЯ'),(8,'s1',0,'РУКОВОДСТВО'),(7,'s1',8,'САЙТ'),(1,'s1',6,'САЙТА'),(72,'s1',0,'СИДОРОВА'),(43,'s1',0,'СИТИ'),(74,'s1',0,'СМИРНОВА'),(34,'s1',0,'СОБРАНИЕ'),(16,'s1',29,'СОЕДИНЕНИЕ'),(53,'s1',8,'СОТРУДНИЧЕСТВА'),(54,'s1',8,'СОТРУДНИЧЕСТВА'),(56,'s1',8,'СОТРУДНИЧЕСТВА'),(66,'s1',0,'СПАЛЬНИ'),(59,'s1',4,'СТАТЬ'),(60,'s1',4,'СТАТЬ'),(10,'s1',9,'СТРАТЕГИЯ'),(53,'s1',0,'УСЛОВИЯ'),(54,'s1',0,'УСЛОВИЯ'),(56,'s1',0,'УСЛОВИЯ'),(46,'s1',0,'УСЛУГИ'),(49,'s1',17,'УЧЕТА'),(41,'s1',0,'ФАЗЕНДА'),(29,'s1',0,'ФЛОРА'),(14,'s1',10,'ФОРУМ'),(24,'s1',0,'ХРОМ'),(44,'s1',9,'ХРОМ'),(42,'s1',0,'ЭРА');
/*!40000 ALTER TABLE `b_search_content_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_custom_rank`
--

DROP TABLE IF EXISTS `b_search_custom_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) NOT NULL,
  `MODULE_ID` varchar(200) NOT NULL,
  `PARAM1` text DEFAULT NULL,
  `PARAM2` text DEFAULT NULL,
  `ITEM_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_custom_rank`
--

LOCK TABLES `b_search_custom_rank` WRITE;
/*!40000 ALTER TABLE `b_search_custom_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_custom_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_phrase`
--

DROP TABLE IF EXISTS `b_search_phrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) NOT NULL,
  `PHRASE` varchar(250) DEFAULT NULL,
  `TAGS` varchar(250) DEFAULT NULL,
  `URL_TO` text DEFAULT NULL,
  `URL_TO_404` char(1) DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_phrase`
--

LOCK TABLES `b_search_phrase` WRITE;
/*!40000 ALTER TABLE `b_search_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_phrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_stem`
--

DROP TABLE IF EXISTS `b_search_stem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=1370 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_stem`
--

LOCK TABLES `b_search_stem` WRITE;
/*!40000 ALTER TABLE `b_search_stem` DISABLE KEYS */;
INSERT INTO `b_search_stem` VALUES (783,'-НЫ'),(796,'0-15'),(716,'000'),(782,'10'),(723,'10-Й'),(697,'12'),(795,'13'),(1203,'13500'),(718,'149'),(626,'160'),(1232,'168'),(109,'18'),(186,'1962'),(154,'1964'),(11,'1992'),(202,'1992Г'),(225,'1993Г'),(163,'1994'),(244,'1998Г'),(257,'1999Г'),(1286,'1С-БИТРИКС'),(614,'20'),(200,'2000'),(1209,'20000'),(276,'2000Г'),(284,'2002Г'),(605,'2003'),(296,'2003Г'),(312,'2004Г'),(322,'2005Г'),(340,'2006Г'),(349,'2007Г'),(356,'2008Г'),(617,'2010'),(81,'212-85-06'),(82,'212-85-07'),(83,'212-85-08'),(1240,'22-45'),(615,'23'),(781,'2542'),(1235,'28000'),(1147,'30'),(715,'300'),(354,'30000'),(1237,'35000'),(577,'36'),(369,'37'),(1165,'3D-МОДЕЛ'),(793,'4-20'),(1264,'40'),(211,'400'),(1093,'45'),(80,'495'),(792,'5-79'),(279,'500'),(256,'5000'),(794,'6-2'),(791,'64'),(229,'700'),(368,'70000М2'),(1263,'800'),(719,'871'),(609,'9000'),(699,'DEL'),(1332,'E-MAIL'),(84,'EMAIL'),(86,'EXAMPLE'),(1267,'HERE'),(85,'INFO'),(90,'MARKETING'),(700,'MOBILE'),(765,'N-ВИНИЛКАПРОЛАКТАМ'),(93,'PR'),(755,'RU2277566'),(88,'SALES'),(698,'SALON'),(1344,'TEST'),(1266,'TEXT'),(705,'VIP-КАБИНЕТ'),(704,'VIP-КАБИНЕТОВ'),(995,'АБСОЛЮТН'),(157,'АВИАЦИОН'),(627,'АВСТР'),(744,'АВТОР'),(98,'АВТОРИЗОВА'),(1307,'АВТОРИЗУ'),(1183,'АВТОРСК'),(647,'АДМИНИСТРАТИВН'),(1259,'АДРЕС'),(1298,'АККАУНТ'),(769,'АКРИЛОВ'),(764,'АКРИЛОНИТР'),(656,'АКСЕССУАР'),(655,'АКСЕССУАРОВ'),(1225,'АКТИВН'),(1269,'АКЦ'),(1367,'АКЦИЯ_1'),(1368,'АКЦИЯ_2'),(1369,'АКЦИЯ_3'),(863,'АЛАДДИН'),(183,'АЛЕКСАНДР'),(768,'АММОН'),(751,'АН'),(752,'АНАТОЛЬЕВН'),(858,'АНГЛИЙСК'),(196,'АНДР'),(1311,'АНКЕТ'),(1365,'АНОНС'),(616,'АПРЕЛ'),(209,'АРЕНДУЕМ'),(120,'АССОРТИМЕНТ'),(860,'АТМОСФЕР'),(606,'АУД'),(1105,'АУДИТОРН'),(233,'БАЗ'),(1243,'БАЗОВ'),(1098,'БАР'),(1097,'БАРОВ'),(428,'БЕЗОПАСН'),(613,'БЕЛАРУС'),(558,'БЕСЦЕН'),(1113,'БИБЛИОТЕК'),(104,'БИЗНЕС'),(924,'БИЗНЕСМ'),(923,'БИЗНЕСМЕН'),(922,'БИЗНЕСМЕНОВ'),(442,'БЛАГОСОСТОЯН'),(274,'БЛИЖН'),(1003,'БЛОК'),(813,'БОГАТ'),(816,'БОГАТСТВ'),(238,'БОЛ'),(15,'БОЛЬШ'),(1261,'БОТИНСК'),(75,'БУД'),(511,'БУДЕТ'),(527,'БУДУТ'),(1051,'БУК'),(1328,'БУМАЖН'),(1238,'БУХГАЛТЕР'),(1242,'БУХГАЛТЕРСК'),(224,'БЫСТР'),(619,'ВАЖН'),(476,'ВАЖНОСТ'),(610,'ВАКАНС'),(1066,'ВАЛЕНС'),(495,'ВАН'),(541,'ВАРИАНТ'),(540,'ВАРИАНТОВ'),(1122,'ВАС'),(226,'ВВЕД'),(1275,'ВЕБ-РАЗРАБОТЧИК'),(1274,'ВЕБ-РАЗРАБОТЧИКОВ'),(1323,'ВЕБ-РЕШЕН'),(1017,'ВЕД'),(1250,'ВЕДЕН'),(116,'ВЕДУЩ'),(992,'ВЕЛИКОЛЕПН'),(591,'ВЕР'),(99,'ВЕРНУТ'),(1362,'ВЕРСТК'),(308,'ВЗАИМОВЫГОДН'),(410,'ВЗГЛЯД'),(409,'ВЗГЛЯДОВ'),(464,'ВЗЯТ'),(842,'ВИД'),(1314,'ВИДЕТ'),(150,'ВИКТОР'),(220,'ВКЛАДЫВА'),(706,'ВКЛЮЧ'),(773,'ВКЛЮЧА'),(197,'ВЛАДИМИРОВИЧ'),(486,'ВМЕСТ'),(1008,'ВМЕСТИТЕЛЬН'),(450,'ВНЕДРЕН'),(1043,'ВНЕСУТ'),(841,'ВНЕШН'),(1069,'ВНИМАН'),(1145,'ВНОС'),(726,'ВОДОСТОЙК'),(172,'ВОЗГЛАВЛЯ'),(385,'ВОЗМОЖН'),(963,'ВОЗНИКА'),(584,'ВОЗРАСТ'),(583,'ВОЗРАСТОВ'),(971,'ВОЙДЕТ'),(909,'ВОПЛОЩ'),(58,'ВОПРОС'),(977,'ВОПРОСОВ'),(245,'ВОРОНЕЖ'),(159,'ВОРОНЕЖСК'),(970,'ВОТ-ВОТ'),(285,'ВОШЛ'),(688,'ВПЕРВ'),(926,'ВПЕРЕД'),(830,'ВПЕЧАТЛЯЮЩ'),(1103,'ВПИСЫВА'),(13,'ВРЕМ'),(929,'ВРЕМЕН'),(1028,'ВРУЧН'),(710,'ВСЕГ'),(404,'ВСЕГД'),(439,'ВСЕМ'),(132,'ВСЕХ'),(73,'ВСТРЕЧ'),(1109,'ВСТРОЕН'),(350,'ВТОР'),(95,'ВХОД'),(178,'ВХОДЯ'),(1280,'ВЫБИРА'),(931,'ВЫБОР'),(530,'ВЫБРА'),(1273,'ВЫВОД'),(831,'ВЫГЛЯД'),(528,'ВЫГЛЯДЕТ'),(329,'ВЫГРУЗК'),(546,'ВЫПОЛН'),(463,'ВЫПОЛНЕН'),(938,'ВЫПОЛНЯ'),(330,'ВЫПУСК'),(121,'ВЫПУСКА'),(818,'ВЫРАЖ'),(379,'ВЫРАЖЕН'),(1326,'ВЫСЛА'),(37,'ВЫСОК'),(28,'ВЫСОКОКЛАССН'),(972,'ВЫСОКОПОСТАВЛЕН'),(451,'ВЫСОКОПРОИЗВОДИТЕЛЬН'),(593,'ВЫСОЧАЙШ'),(664,'ВЫСТАВК'),(261,'ВЫСТАВОК'),(1216,'ВЫСШ'),(1027,'ВЫТОЧ'),(265,'ВЫХОД'),(574,'ГАРАНТ'),(1111,'ГАРДЕРОБН'),(180,'ГЕНЕРАЛЬН'),(806,'ГЕРЦОГ'),(396,'ГИБК'),(441,'ГИГИЕНИЧЕСК'),(1011,'ГЛАВ'),(100,'ГЛАВН'),(976,'ГЛОБАЛЬН'),(12,'ГОД'),(578,'ГОРД'),(740,'ГОРЯЧ'),(877,'ГОСТЕВ'),(493,'ГОСТИН'),(160,'ГОСУДАРСТВЕН'),(642,'ГОТОВ'),(145,'ГРАМОТН'),(721,'ГРАНДИОЗН'),(1230,'ГРАФИК'),(179,'ГРУПП'),(1293,'ДАЕТ'),(1300,'ДАЛЬН'),(288,'ДАН'),(1086,'ДАЧ'),(1338,'ДВА'),(216,'ДВАДЦА'),(990,'ДВП'),(638,'ДВУХ'),(892,'ДВУХМЕСТН'),(814,'ДЕКОР'),(1179,'ДЕКОРИРОВАН'),(467,'ДЕЛ'),(1071,'ДЕЛА'),(662,'ДЕЛОВ'),(649,'ДЕМОНСТРИРОВА'),(482,'ДЕН'),(885,'ДЕР'),(884,'ДЕРЕВ'),(213,'ДЕРЕВООБРАБАТЫВА'),(856,'ДЕРЕВЯ'),(286,'ДЕСЯТК'),(644,'ДЕТ'),(518,'ДЕТАЛ'),(492,'ДЕТСК'),(986,'ДЕШЕВ'),(176,'ДЕЯТЕЛЬН'),(879,'ДЖОКОНД'),(1154,'ДИАГНОСТИК'),(797,'ДИВА'),(61,'ДИЗАЙН'),(504,'ДИЗАЙН-ПРОЕКТ'),(500,'ДИЗАЙНЕР'),(907,'ДИЗАЙНЕРСК'),(310,'ДИЛЕРСК'),(374,'ДИНАМИЧН'),(258,'ДИПЛОМАНТ'),(181,'ДИРЕКТОР'),(1257,'ДНЕ'),(471,'ДНЯ'),(411,'ДОБ'),(1062,'ДОБАВ'),(1294,'ДОБИВА'),(460,'ДОВЕРИТЕЛЬН'),(72,'ДОГОВОР'),(311,'ДОГОВОРОВ'),(1248,'ДОКУМЕНТ'),(32,'ДОЛ'),(1104,'ДОЛГОВЕЧН'),(390,'ДОЛГОСРОЧН'),(945,'ДОЛЖНОСТН'),(66,'ДОМ'),(1061,'ДОМАШН'),(635,'ДОМОТЕХ'),(776,'ДОПОЛНИТЕЛЬН'),(1288,'ДОРОГ'),(65,'ДОСТАВК'),(547,'ДОСТАВЛ'),(772,'ДОСТИГА'),(843,'ДОСТИГНУТ'),(382,'ДОСТИЖЕН'),(1010,'ДОСТОИНСТВ'),(1304,'ДОСТУП'),(1290,'ДОСТУПН'),(1208,'ДОХОД'),(1048,'ДРЕВЕСН'),(51,'ДРУГ'),(989,'ДСП'),(283,'ЕВРОПЕЙСК'),(262,'ЕВРОЭКСПОМЕБЕЛЬ-99'),(747,'ЕГОР'),(407,'ЕДИН'),(596,'ЕЖЕГОДН'),(876,'ЕЖЕДНЕВН'),(321,'ЕКАТЕРИНБУРГ'),(997,'ЕМ'),(466,'ЖДЕТ'),(821,'ЖЕЛАН'),(1083,'ЖЕЛЕЗ'),(1239,'ЖЕН'),(852,'ЖЕСТК'),(529,'ЖИЗН'),(387,'ЖИЗНЕН'),(1252,'ЖУРНАЛОВ-ОРДЕР'),(1251,'ЖУРНАЛОВ-ОРДЕРОВ'),(436,'ЗАБОТ'),(581,'ЗАВЕДЕН'),(313,'ЗАВЕРШ'),(250,'ЗАВОЕВЫВА'),(328,'ЗАГРУЗК'),(64,'ЗАДАН'),(399,'ЗАДАЧ'),(545,'ЗАКАЗ'),(1149,'ЗАКАЗА'),(1201,'ЗАКАЗОВ'),(402,'ЗАКАЗЧИК'),(268,'ЗАКЛЮЧ'),(282,'ЗАКЛЮЧА'),(309,'ЗАКЛЮЧЕН'),(1223,'ЗАКОНОДАТЕЛЬСТВ'),(156,'ЗАКОНЧ'),(1305,'ЗАКРЫТ'),(469,'ЗАЛОГ'),(502,'ЗАМЕР'),(194,'ЗАМЕСТИТЕЛ'),(1108,'ЗАНИМА'),(1310,'ЗАПОЛН'),(1181,'ЗАПРОС'),(362,'ЗАПУЩ'),(218,'ЗАРАБОТА'),(96,'ЗАРЕГИСТРИРОВА'),(1202,'ЗАРПЛАТ'),(275,'ЗАРУБЕЖ'),(138,'ЗАРУБЕЖН'),(140,'ЗАСЛУГ'),(454,'ЗАТРАТ'),(961,'ЗАХОД'),(429,'ЗАЩИТ'),(480,'ЗАЩИЩЕН'),(708,'ЗАЯВК'),(696,'ЗАЯВОК'),(648,'ЗДАН'),(1038,'ЗДОРОВ'),(1080,'ЗИМ'),(1218,'ЗНАН'),(936,'ЗНАЧ'),(242,'ЗНАЧИТЕЛЬН'),(820,'ЗОЛОТ'),(943,'ЗОН'),(1349,'ИВА'),(1348,'ИВАН'),(1347,'ИВАНОВ'),(118,'ИГРОК'),(117,'ИГРОКОВ'),(592,'ИД'),(1118,'ИДЕАЛЬН'),(1163,'ИДЕИ-ОБРАЗ'),(861,'ИЗАБЕЛЛ'),(568,'ИЗБЕЖА'),(490,'ИЗГОТОВ'),(204,'ИЗГОТОВЛЕН'),(49,'ИЗДЕЛ'),(1166,'ИЗОБРАЖЕН'),(729,'ИЗОБРЕТЕН'),(1100,'ИЗОПЛАСТ'),(817,'ИЗЫСК'),(979,'ИЗЫСКА'),(807,'ИЗЯЩН'),(375,'ИМЕЕТ'),(544,'ИМЕН'),(44,'ИНДИВИДУАЛЬН'),(188,'ИНЖЕНЕР-ТЕХНОЛОГ'),(1224,'ИНИЦИАТИВН'),(162,'ИНСТИТУТ'),(381,'ИНСТРУМЕНТ'),(1322,'ИНТЕГРАТОР'),(1321,'ИНТЕГРАТОРОВ'),(461,'ИНТЕРЕС'),(701,'ИНТЕРЕСН'),(505,'ИНТЕРЬЕР'),(958,'ИНТЕРЬЕРН'),(573,'ИНТЕРЬЕРОВ'),(608,'ИС'),(1052,'ИСКЛЮЧЕН'),(888,'ИСПОЛНЕН'),(953,'ИСПОЛЬЗОВА'),(560,'ИСПОЛЬЗОВАН'),(735,'ИСПОЛЬЗУЕМ'),(599,'ИСПЫТАН'),(201,'ИСТОР'),(185,'ИЮН'),(966,'КАБИНЕТ'),(384,'КАЖД'),(780,'КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДН'),(761,'КАРБАМИДОФОРМАЛЬДЕГИДН'),(808,'КАРКАС'),(1,'КАРТ'),(1301,'КАРТОЧК'),(1268,'КАТАЛОГ'),(947,'КАТЕГОР'),(1060,'КАФ'),(38,'КАЧЕСТВ'),(720,'КВ'),(459,'КВАЛИФИКАЦ'),(107,'КВАЛИФИЦИРОВА'),(770,'КИСЛОТ'),(857,'КЛАССИЧЕСК'),(759,'КЛЕ'),(728,'КЛЕЕВ'),(732,'КЛЕЯ'),(403,'КЛИЕНТ'),(1197,'КЛИЕНТОВ'),(862,'КОЖ'),(1357,'КОЗЛ'),(1356,'КОЗЛОВ'),(149,'КОЛЕСНИК'),(148,'КОЛЕСНИКОВ'),(937,'КОЛЛЕГ'),(277,'КОЛЛЕКТ'),(1184,'КОЛЛЕКЦ'),(1158,'КОЛОРИСТК'),(882,'КОЛОРИТН'),(898,'КОМБИНАЦ'),(1245,'КОММУНИКАБЕЛЬН'),(496,'КОМНАТ'),(1115,'КОМОД'),(1090,'КОМПАКТН'),(6,'КОМПАН'),(572,'КОМПЛЕКСН'),(335,'КОМПЛЕКТ'),(738,'КОМПОЗИЦ'),(789,'КОМПОНЕНТ'),(788,'КОМПОНЕНТОВ'),(911,'КОМПОНОВК'),(1041,'КОМПЬЮТЕР'),(561,'КОМПЬЮТЕРН'),(358,'КОМФОРТ'),(864,'КОМФОРТН'),(1324,'КОНЕЧН'),(534,'КОНКРЕТН'),(928,'КОНКУРЕНТ'),(686,'КОНКУРЕНТН'),(927,'КОНКУРЕНТОВ'),(672,'КОНКУРС'),(1192,'КОНСТРУКТОР'),(1117,'КОНСТРУКЦ'),(57,'КОНСУЛЬТАЦ'),(1196,'КОНСУЛЬТИРОВАН'),(52,'КОНТАКТ'),(1316,'КОНТАКТОВ'),(271,'КОНТРАКТ'),(270,'КОНТРАКТОВ'),(552,'КОНТРОЛ'),(896,'КОНУСН'),(305,'КОНФЕРЕНЦ'),(1106,'КОНФЕРЕНЦ-КРЕСЕЛ'),(324,'КОНЦЕРН'),(175,'КООРДИНИР'),(1276,'КОРПОРАТИВН'),(315,'КОРПУС'),(23,'КОРПУСН'),(352,'КОРПУСОВ'),(434,'КОРРЕКТИР'),(174,'КОТОР'),(980,'КРАСОТ'),(1033,'КРЕСЕЛ'),(798,'КРЕСЛ'),(846,'КРЕСТОВИН'),(805,'КРОВАТ'),(603,'КРОМ'),(1364,'КРОШК'),(1012,'КРУГЛ'),(21,'КРУПН'),(1359,'КРУТ'),(1110,'КУП'),(491,'КУХН'),(646,'КУХОН'),(601,'ЛАБОРАТОР'),(628,'ЛАТВ'),(891,'ЛАУР'),(1015,'ЛЕГЕНДАРН'),(1094,'ЛЕГК'),(110,'ЛЕТ'),(855,'ЛИВЕРПУЛ'),(294,'ЛИДЕР'),(293,'ЛИДЕРОВ'),(113,'ЛИДИР'),(326,'ЛИН'),(629,'ЛИТВ'),(415,'ЛИЧН'),(1053,'ЛИШ'),(1299,'ЛОГИН'),(287,'ЛУЧШ'),(1021,'ЛЮБ'),(212,'М2'),(1215,'МАГАЗИН'),(248,'МАГАЗИН-САЛОН'),(347,'МАГАЗИНОВ-САЛОН'),(346,'МАГАЗИНОВ-САЛОНОВ'),(1119,'МАКСИМАЛЬН'),(168,'МАЛ'),(17,'МАЛЕНЬК'),(91,'МАРКЕТИНГ'),(692,'МАРКЕТИНГОВ'),(790,'МАС'),(941,'МАСС'),(1050,'МАССИВ'),(865,'МАССИВН'),(43,'МАССОВ'),(666,'МАСТЕР-КЛАСС'),(210,'МАСТЕРСК'),(449,'МАСТЕРСТВ'),(668,'МАСШТАБН'),(302,'МАТЕРИА'),(301,'МАТЕРИАЛ'),(300,'МАТЕРИАЛОВ'),(445,'МАТЕРИАЛЬН'),(24,'МЕБЕЛ'),(5,'МЕБЕЛЬН'),(339,'МЕБЕЛЬПЛЮС'),(260,'МЕЖДУНАРОДН'),(517,'МЕЛЬЧАЙШ'),(607,'МЕНЕДЖМЕНТ'),(435,'МЕР'),(92,'МЕРОПРИЯТ'),(1234,'МЕС'),(438,'МЕСТ'),(576,'МЕСЯЦ'),(575,'МЕСЯЦЕВ'),(1088,'МЕТАЛЛИЧЕСК'),(1220,'МЕТОД'),(1219,'МЕТОДОВ'),(874,'МЕХАНИЗМ'),(750,'МЕЩЕРЯК'),(749,'МЕЩЕРЯКОВ'),(31,'МИНИМАЛЬН'),(969,'МИНИМУМ'),(825,'МИНИСТР'),(633,'МИНСК'),(711,'МИР'),(266,'МИРОВ'),(372,'МИСС'),(748,'МИХАЙЛОВИЧ'),(105,'МНОГ'),(742,'МНОГОКОМПОНЕНТН'),(562,'МНОГОЛЕТН'),(680,'МОД'),(485,'МОДЕЛ'),(1133,'МОДЕЛИРОВАН'),(902,'МОДЕРН'),(232,'МОДЕРНИЗАЦ'),(778,'МОДИФИКАТОР'),(67,'МОЖЕТ'),(833,'МОЖН'),(222,'МОЛОД'),(586,'МОЛОДЕЖ'),(554,'МОМЕНТ'),(815,'МОНАЛИЗ'),(1129,'МОНТАЖ'),(444,'МОРАЛЬН'),(94,'МОСКВ'),(398,'МОЩНОСТ'),(1249,'МПЗ'),(908,'МЫСЛ'),(338,'МЯГК'),(913,'НАБОР'),(1360,'НАВЕРН'),(1189,'НАВЫК'),(525,'НАГЛЯДН'),(394,'НАДЕЖН'),(542,'НАИБОЛ'),(921,'НАИЛУЧШ'),(940,'НАЙТ'),(1140,'НАКАНУН'),(883,'НАКЛАДК'),(40,'НАЛАЖ'),(136,'НАЛАЖИВА'),(68,'НАМ'),(122,'НАРАЩИВА'),(673,'НАРОДН'),(582,'НАС'),(171,'НАСТОЯ'),(278,'НАСЧИТЫВА'),(1172,'НАТУРАЛИСТИЧН'),(331,'НАТУРАЛЬН'),(889,'НАХОД'),(1333,'НАЧАЛ'),(192,'НАЧАЛЬНИК'),(203,'НАЧИНА'),(974,'НАЧНЕТ'),(7,'НАШ'),(1361,'НЕВЕРОЯТН'),(1258,'НЕДЕЛ'),(1039,'НЕЗАМЕНИМ'),(1366,'НЕЙРОСЕТ'),(1139,'НЕКОТОР'),(835,'НЕМ'),(914,'НЕОБХОДИМ'),(869,'НЕОБЫКНОВЕН'),(1072,'НЕОБЫЧАЙН'),(847,'НЕОБЫЧН'),(489,'НЕПОВТОРИМ'),(1136,'НЕПОСРЕДСТВЕН'),(827,'НЕСМОТР'),(498,'НЕСТАНДАРТН'),(342,'НИЖН'),(828,'НИЗК'),(1358,'НИКИТИН'),(1082,'НИХ'),(228,'НОВ'),(343,'НОВГОРОД'),(906,'НОВИЗН'),(650,'НОВИНК'),(611,'НОВОСТ'),(1004,'НОГ'),(999,'НОЖК'),(48,'НОМЕНКЛАТУР'),(426,'НОРМ'),(1334,'НУЖН'),(515,'НЮАНС'),(514,'НЮАНСОВ'),(1045,'ОБАЯН'),(36,'ОБЕСПЕЧ'),(443,'ОБЕСПЕЧЕН'),(421,'ОБЕСПЕЧИВА'),(669,'ОБЕЩА'),(811,'ОБИВК'),(652,'ОБИВОЧН'),(730,'ОБЛАСТ'),(910,'ОБЛИК'),(360,'ОБНОВЛЕН'),(1236,'ОБОРОТ'),(29,'ОБОРУДОВАН'),(1138,'ОБРАБОТК'),(1180,'ОБРАЗ'),(155,'ОБРАЗОВАН'),(677,'ОБРАЗЦ'),(676,'ОБРАЗЦОВ'),(53,'ОБРАТ'),(1346,'ОБРАТН'),(1308,'ОБРАЩА'),(1014,'ОБСТАНОВК'),(975,'ОБСУЖДЕН'),(386,'ОБУСТРО'),(942,'ОБУСТРОЙСТВ'),(1246,'ОБУЧАЕМ'),(165,'ОБУЧЕН'),(87,'ОБЩ'),(1195,'ОБЩЕН'),(589,'ОБЪЕДИНЯ'),(124,'ОБЪЕМ'),(523,'ОБЪЕМН'),(946,'ОБЯЗАН'),(465,'ОБЯЗАТЕЛЬСТВ'),(1128,'ОГОВАРИВА'),(1144,'ОГОВОР'),(1031,'ОГРАНИЧЕН'),(1342,'ОДИН'),(20,'ОДН'),(1329,'ОДОБР'),(401,'ОЖИДАН'),(1026,'ОКАНТОВК'),(1204,'ОКЛАД'),(430,'ОКРУЖА'),(559,'ОП'),(998,'ОПИРА'),(756,'ОПИСАН'),(1151,'ОПЛАЧИВА'),(400,'ОПРАВДЫВА'),(536,'ОПРЕДЕЛЕН'),(933,'ОПРЕДЕЛЯ'),(983,'ОПРОВЕРГА'),(694,'ОПРОС'),(930,'ОПТИМ'),(393,'ОПТИМАЛЬН'),(453,'ОПТИМИЗАЦ'),(571,'ОПТИМИЗИРОВА'),(1131,'ОПЫТН'),(916,'ОРГАНИЗАЦ'),(295,'ОРГАНИЗАЦИОН'),(935,'ОРГАНИЗОВА'),(1064,'ОРГАНИЧН'),(1174,'ОРИГИНАЛ'),(840,'ОРИГИНАЛЬН'),(533,'ОСВЕЩЕН'),(1000,'ОСВОБОЖД'),(895,'ОСН'),(314,'ОСНАЩЕН'),(894,'ОСНОВ'),(472,'ОСНОВАН'),(903,'ОСНОВН'),(497,'ОСОБ'),(1036,'ОСОБЕН'),(1198,'ОСТАВЛЕН'),(1150,'ОСТАЛЬН'),(478,'ОСТАН'),(26,'ОСУЩЕСТВЛЯ'),(743,'ОТВЕРДИТЕЛ'),(78,'ОТВЕТ'),(416,'ОТВЕТСТВЕН'),(1141,'ОТДЕЛ'),(1157,'ОТДЕЛК'),(334,'ОТДЕЛЬН'),(1265,'ОТЗЫВ'),(246,'ОТКР'),(336,'ОТКРЫВА'),(319,'ОТКРЫТ'),(1095,'ОТЛИЧН'),(462,'ОТНОС'),(129,'ОТНОШЕН'),(1120,'ОТОБРАЖА'),(1341,'ОТПРАВ'),(620,'ОТРАСЛ'),(693,'ОТЧЕТ'),(1227,'ОТЧЕТН'),(1254,'ОТЧЕТОВ'),(1283,'ОТЧУЖДА'),(74,'ОФИС'),(634,'ОФИСКОМФОРТ'),(800,'ОФИСН'),(206,'ОФИСОВ'),(263,'ОФИЦИАЛЬН'),(555,'ОФОРМЛЕН'),(1302,'ОФОРМЛЯ'),(569,'ОШИБОК'),(965,'ОЩУЩЕН'),(1212,'ПАКЕТ'),(1057,'ПАЛЕРМ'),(1056,'ПАЛИТР'),(1042,'ПАРМ'),(1032,'ПАРТ'),(130,'ПАРТНЕР'),(306,'ПАРТНЕРОВ'),(1272,'ПАРТНЕРСК'),(364,'ПАРТНЕРСТВ'),(753,'ПАТЕНТ'),(207,'ПЕРВ'),(1247,'ПЕРВИЧН'),(682,'ПЕРЕГОВОР'),(962,'ПЕРЕГОВОРОВ'),(949,'ПЕРЕГОРОДК'),(376,'ПЕРЕД'),(1130,'ПЕРЕДА'),(557,'ПЕРЕДОВ'),(1161,'ПЕРЕКЛЮЧЕН'),(1156,'ПЕРЕПЛАНИРОВК'),(1159,'ПЕРЕСТАНОВК'),(1317,'ПЕРЕЧН'),(237,'ПЕРЕШЛ'),(932,'ПЕРСОНА'),(391,'ПЕРСПЕКТИВ'),(1353,'ПЕТР'),(1352,'ПЕТРОВ'),(184,'ПЕТРОВИЧ'),(1188,'ПК'),(1009,'ПЛАВН'),(1228,'ПЛАН'),(1084,'ПЛАСТИК'),(1102,'ПЛАСТИКОВ'),(1285,'ПЛАТФОРМ'),(1114,'ПЛАТЯН'),(899,'ПЛОТН'),(127,'ПЛОЩАД'),(1034,'ПЛУТОН'),(240,'ПОВЫС'),(417,'ПОВЫШЕН'),(709,'ПОДА'),(1170,'ПОДБИРА'),(1177,'ПОДБОР'),(660,'ПОДГОТОВ'),(167,'ПОДГОТОВК'),(691,'ПОДГОТОВЛ'),(142,'ПОДГОТОВЛЕН'),(853,'ПОДДЕРЖИВА'),(1292,'ПОДДЕРЖК'),(824,'ПОДЛОКОТНИК'),(848,'ПОДЛОКОТНИКОВ'),(253,'ПОДМОСКОВ'),(506,'ПОДОБРА'),(1096,'ПОДОЙДЕТ'),(1073,'ПОДОЙДУТ'),(1327,'ПОДПИСА'),(1340,'ПОДПИШ'),(1255,'ПОДРАЗДЕЛЕН'),(50,'ПОДХОД'),(543,'ПОДХОДЯ'),(1125,'ПОЖЕЛАН'),(221,'ПОЗВОЛ'),(35,'ПОЗВОЛЯ'),(854,'ПОЗВОНОЧНИК'),(114,'ПОЗИЦ'),(678,'ПОЗНАКОМ'),(3,'ПОИСК'),(667,'ПОИСТИН'),(588,'ПОКОЛЕН'),(60,'ПОКУПК'),(1001,'ПОЛЕЗН'),(161,'ПОЛИТЕХНИЧЕСК'),(146,'ПОЛИТИК'),(803,'ПОЛК'),(957,'ПОЛН'),(1315,'ПОЛНОЦЕН'),(370,'ПОЛУТОР'),(55,'ПОЛУЧ'),(1297,'ПОЛУЧА'),(731,'ПОЛУЧЕН'),(1187,'ПОЛЬЗОВАТЕЛ'),(630,'ПОЛЬШ'),(503,'ПОМЕЩЕН'),(657,'ПОМИМ'),(509,'ПОМОГУТ'),(1013,'ПОМОЖЕТ'),(77,'ПОМОЧ'),(832,'ПОМОЩ'),(475,'ПОНИМА'),(414,'ПОНИМАН'),(1023,'ПОНЯТ'),(1101,'ПОПУЛЯРН'),(901,'ПОРОЛОН'),(900,'ПОРОЛОНОВ'),(714,'ПОСЕТ'),(695,'ПОСЕТИТЕЛ'),(1127,'ПОСЛ'),(418,'ПОСЛЕД'),(522,'ПОСМОТРЕТ'),(272,'ПОСТАВК'),(397,'ПОСТАВЩИК'),(236,'ПОСТЕПЕН'),(47,'ПОСТОЯ'),(1135,'ПОСТУПА'),(1029,'ПОТ'),(1335,'ПОТРЕБ'),(406,'ПОТРЕБИТЕЛ'),(956,'ПОТРЕБН'),(849,'ПОТРЯСА'),(71,'ПОЧТ'),(1262,'ПР-Д'),(405,'ПРАВ'),(427,'ПРАВИЛ'),(934,'ПРАВИЛЬН'),(683,'ПРАКТИЧЕСК'),(590,'ПРЕДАН'),(1164,'ПРЕДВАРИТЕЛЬН'),(1168,'ПРЕДЛАГ'),(392,'ПРЕДЛАГА'),(684,'ПРЕДЛОЖЕН'),(645,'ПРЕДМЕТ'),(739,'ПРЕДНАЗНАЧ'),(1146,'ПРЕДОПЛАТ'),(538,'ПРЕДОСТАВЛ'),(383,'ПРЕДОСТАВЛЯ'),(712,'ПРЕДПОЛАГА'),(177,'ПРЕДПРИЯТ'),(1175,'ПРЕДСТАВ'),(317,'ПРЕДСТАВИТЕЛЬСТВ'),(643,'ПРЕДСТАВЛ'),(524,'ПРЕДСТАВЛЕН'),(967,'ПРЕЗИДЕНТ'),(687,'ПРЕИМУЩЕСТВ'),(1085,'ПРЕКРАСН'),(1206,'ПРЕМ'),(968,'ПРЕМЬЕР-МИНИСТР'),(1155,'ПРЕОБРАЗОВАН'),(741,'ПРЕССОВАН'),(886,'ПРЕСТИЖ'),(259,'ПРЕСТИЖН'),(420,'ПРИБ'),(470,'ПРИБЫЛЬН'),(1241,'ПРИВЕТСВ'),(1068,'ПРИВЛЕКА'),(982,'ПРИВЛЕКАТЕЛЬН'),(457,'ПРИВЛЕЧЕН'),(925,'ПРИВЫКЛ'),(868,'ПРИДА'),(1330,'ПРИДЕТ'),(1121,'ПРИЕЗЖА'),(556,'ПРИЕМ'),(264,'ПРИЗНАН'),(30,'ПРИМЕНЕН'),(766,'ПРИМЕНЯ'),(479,'ПРИМЕР'),(839,'ПРИМЕЧАТЕЛЬН'),(623,'ПРИНИМА'),(637,'ПРИНЦИП'),(366,'ПРИНЯТ'),(323,'ПРИОБРЕТА'),(89,'ПРИОБРЕТЕН'),(1309,'ПРИОРИТЕТ'),(1077,'ПРИРОДН'),(944,'ПРИСПОСОБ'),(955,'ПРИСПОСОБЛЕН'),(297,'ПРИСТУП'),(1112,'ПРИХОЖ'),(779,'ПРИЧ'),(304,'ПРОВЕД'),(713,'ПРОВЕДЕН'),(1325,'ПРОВЕРК'),(681,'ПРОВЕСТ'),(722,'ПРОВОД'),(166,'ПРОГРАММ'),(1185,'ПРОДАВЕЦ-ДИЗАЙНЕР'),(1205,'ПРОДАЖ'),(526,'ПРОДЕМОНСТРИР'),(359,'ПРОДОЛЖА'),(39,'ПРОДУКЦ'),(357,'ПРОЕКТ'),(570,'ПРОЕКТИРОВАН'),(1200,'ПРОЕКТОВ'),(1123,'ПРОИЗВЕДЕТ'),(501,'ПРОИЗВЕДУТ'),(563,'ПРОИЗВЕСТ'),(1030,'ПРОИЗВОД'),(424,'ПРОИЗВОДИМ'),(22,'ПРОИЗВОДИТЕЛ'),(452,'ПРОИЗВОДИТЕЛЬН'),(351,'ПРОИЗВОДСВЕННО-СКЛАДСК'),(27,'ПРОИЗВОДСТВ'),(41,'ПРОИЗВОДСТВЕН'),(988,'ПРОИСХОД'),(737,'ПРОМЫШЛЕН'),(516,'ПРОРИСОВК'),(1018,'ПРОСТ'),(822,'ПРОСТЕЖК'),(389,'ПРОСТРАНСТВ'),(757,'ПРОТОТИП'),(56,'ПРОФЕССИОНАЛЬН'),(597,'ПРОХОД'),(42,'ПРОЦЕСС'),(799,'ПРОЧ'),(725,'ПРОЧН'),(579,'ПРОШЕДШ'),(164,'ПРОШЕЛ'),(14,'ПРОШЛ'),(897,'ПРУЖИН'),(16,'ПУТ'),(632,'ПЯТ'),(484,'ПЯТИСОТ'),(108,'РАБОТ'),(215,'РАБОТА'),(413,'РАБОТНИК'),(412,'РАБОТНИКОВ'),(1037,'РАБОТОСПОСОБН'),(388,'РАБОЧ'),(76,'РАД'),(198,'РАДИОТЕХНИК'),(724,'РАЗ'),(128,'РАЗВИВА'),(103,'РАЗВИТ'),(1306,'РАЗДЕЛ'),(746,'РАЗИНЬК'),(745,'РАЗИНЬКОВ'),(539,'РАЗЛИЧН'),(499,'РАЗМЕР'),(717,'РАЗМЕСТ'),(532,'РАЗН'),(661,'РАЗНООБРАЗН'),(483,'РАЗРАБОТА'),(62,'РАЗРАБОТК'),(1284,'РАЗРАБОТЧИК'),(1319,'РАЗРАБОТЧИКОВ'),(663,'РАМК'),(878,'РАСКЛАДУШК'),(1137,'РАСКР'),(327,'РАСКРО'),(1337,'РАСПЕЧАТА'),(1271,'РАСПИСАН'),(819,'РАСПИСЫВА'),(208,'РАСПОЛАГА'),(510,'РАСПОЛОЖ'),(537,'РАСПОРЯЖЕН'),(1282,'РАСПРОСТРАНЕН'),(1176,'РАССМОТРЕТ'),(1178,'РАССТАНОВК'),(223,'РАСТ'),(784,'РАСТВОР'),(566,'РАСХОД'),(564,'РАСЧЕТ'),(1134,'РАСЧЕТОВ'),(316,'РАСШИР'),(658,'РАСШИРЕН'),(119,'РАСШИРЯ'),(182,'РАТЧЕНК'),(952,'РАЦИОНАЛЬН'),(1295,'РЕАЛИЗУЕМ'),(134,'РЕГИОН'),(320,'РЕГИОНАЛЬН'),(133,'РЕГИОНОВ'),(1345,'РЕГИСТРАИЦ'),(1296,'РЕГИСТРИРУ'),(1162,'РЕЖИМ'),(106,'РЕЗУЛЬТАТ'),(419,'РЕИНВЕСТИРОВАН'),(1336,'РЕКВИЗИТ'),(671,'РЕСПУБЛИКАНСК'),(771,'РЕША'),(367,'РЕШЕН'),(1279,'РИСК'),(1278,'РИСКОВ'),(195,'РОГОВ'),(152,'РОД'),(1217,'РОЗНИЦ'),(344,'РОЗНИЧН'),(872,'РОСКОШ'),(810,'РОСКОШН'),(809,'РОСПИС'),(25,'РОСС'),(9,'РОССИЙСК'),(474,'РОСТ'),(1210,'РУБ'),(318,'РУБЕЖ'),(1191,'РУК'),(826,'РУКОВОДИТЕЛ'),(102,'РУКОВОДСТВ'),(143,'РУКОВОДЯ'),(33,'РУЧН'),(1214,'РФ'),(10,'РЫНК'),(267,'РЫНОК'),(269,'РЯД'),(707,'САД'),(2,'САЙТ'),(1320,'САЙТОВ'),(290,'САЛОН'),(289,'САЛОНОВ'),(1244,'САМОСТОЯТЕЛЬН'),(440,'САНИТАРН'),(341,'САНКТ-ПЕТЕРБУРГ'),(550,'СБОРК'),(915,'СВЕЖ'),(433,'СВОЕВРЕМЕН'),(625,'СВЫШ'),(1143,'СВЯЖУТ'),(137,'СВЯЗ'),(535,'СДЕЛА'),(567,'СЕБЕСТОИМ'),(255,'СЕВЕРО-ЗАПАД'),(365,'СЕГОДН'),(481,'СЕГОДНЯШН'),(641,'СЕКТОР'),(640,'СЕКТОРОВ'),(665,'СЕМИНАР'),(153,'СЕНТЯБР'),(905,'СЕР'),(190,'СЕРГ'),(602,'СЕРТИФИКАТ'),(598,'СЕРТИФИКАЦИОН'),(345,'СЕТ'),(251,'СИБИР'),(1054,'СИДЕН'),(1081,'СИДЕТ'),(1351,'СИДОР'),(1350,'СИДОРОВ'),(996,'СИММЕТРИЧ'),(774,'СИНТЕТИЧЕСК'),(408,'СИСТ'),(432,'СИСТЕМ'),(447,'СИСТЕМАТИЧЕСК'),(1002,'СИСТЕМН'),(1099,'СИТ'),(1303,'СКИДК'),(299,'СКЛАД'),(1075,'СКЛАДН'),(126,'СКЛАДСК'),(890,'СЛЕВ'),(786,'СЛЕД'),(1091,'СЛОЖ'),(1116,'СЛОЖН'),(1287,'СЛОЖНОСТ'),(1006,'СЛУЖ'),(1291,'СЛУЖБ'),(1355,'СМИРН'),(1354,'СМИРНОВ'),(521,'СМОЖЕТ'),(762,'СМОЛ'),(675,'СМОТР'),(273,'СНГ'),(455,'СНИЖЕН'),(565,'СНИЗ'),(131,'СО'),(377,'СОБ'),(960,'СОБРАН'),(231,'СОБСТВЕН'),(147,'СОБСТВЕННИК'),(239,'СОВЕРШЕН'),(431,'СОВЕРШЕНСТВОВАН'),(1025,'СОВЕСТ'),(1016,'СОВЕЩАТЕЛЬН'),(519,'СОВМЕСТН'),(1207,'СОВОКУПН'),(959,'СОВРЕМЕН'),(775,'СОГЛАСН'),(1022,'СОГЛАСУ'),(473,'СОДЕЙСТВ'),(777,'СОДЕРЖ'),(727,'СОЕДИНЕН'),(512,'СОЗДА'),(59,'СОЗДАН'),(920,'СОЗДАСТ'),(1065,'СОЛЬЮТ'),(423,'СООТВЕТСТВ'),(787,'СООТНОШЕН'),(763,'СОПОЛИМЕР'),(734,'СОСТА'),(144,'СОСТАВ'),(353,'СОСТАВЛЯ'),(733,'СОСТАВОВ'),(618,'СОСТО'),(760,'СОСТОЯ'),(281,'СОТРУДНИК'),(280,'СОТРУДНИКОВ'),(1270,'СОТРУДНИЧЕСТВ'),(893,'СОФ'),(111,'СОХРАН'),(991,'СОХРАНЯ'),(1211,'СОЦ'),(477,'СОЦИАЛЬН'),(912,'СОЧЕТА'),(917,'СОЧЕТАН'),(703,'СПАЛ'),(494,'СПАЛЬН'),(1153,'СПЕКТР'),(600,'СПЕЦИАЛИЗИРОВА'),(54,'СПЕЦИАЛИСТ'),(458,'СПЕЦИАЛИСТОВ'),(187,'СПЕЦИАЛЬН'),(823,'СПИНК'),(1005,'СПРАВ'),(1067,'СРАЗ'),(115,'СРЕД'),(169,'СРЕДН'),(219,'СРЕДСТВ'),(549,'СРОК'),(230,'СТАВШ'),(234,'СТАЛ'),(594,'СТАНДАРТ'),(1281,'СТАНДАРТН'),(214,'СТАНК'),(674,'СТАНОВ'),(587,'СТАРШ'),(670,'СТАТ'),(139,'СТЕПЕН'),(859,'СТИЛ'),(994,'СТИЛЬН'),(829,'СТОИМОСТ'),(964,'СТОЙК'),(801,'СТОЛ'),(981,'СТОЛОВ'),(46,'СТОРОН'),(135,'СТРАН'),(101,'СТРАНИЦ'),(373,'СТРАТЕГ'),(488,'СТРЕМ'),(636,'СТРО'),(422,'СТРОГ'),(736,'СТРОИТЕЛЬН'),(298,'СТРОИТЕЛЬСТВ'),(867,'СТРОЧК'),(1318,'СТУД'),(802,'СТУЛ'),(1059,'СТУЛЬЕВ'),(1148,'СУММ'),(8,'СУЩЕСТВ'),(1193,'СФЕР'),(1173,'СХОЖЕСТ'),(844,'СЧЕТ'),(1078,'СЧИТА'),(170,'США'),(291,'ТАКЖ'),(887,'ТАХТ'),(851,'ТВЕРД'),(520,'ТВОРЧЕСТВ'),(621,'ТЕКУЩ'),(69,'ТЕЛЕФОН'),(487,'ТЕМ'),(639,'ТЕМАТИЧЕСК'),(123,'ТЕМП'),(679,'ТЕНДЕНЦ'),(1079,'ТЕПЛ'),(348,'ТЕРРИТОР'),(1343,'ТЕСТ'),(1289,'ТЕСТИР'),(1040,'ТЕХ'),(63,'ТЕХНИЧЕСК'),(355,'ТЕХНОЛОГ'),(395,'ТЕХНОЛОГИЧН'),(702,'ТИП'),(1213,'ТК'),(653,'ТКАН'),(604,'ТОГ'),(834,'ТОМ'),(1055,'ТОНИРОВК'),(18,'ТОРГОВ'),(548,'ТОЧН'),(507,'ТОЧНОСТ'),(235,'ТРАДИЦ'),(1142,'ТРАНСПОРТН'),(875,'ТРАНСФОРМАЦ'),(425,'ТРЕБОВАН'),(468,'ТРЕБОВАТЕЛЬН'),(363,'ТРЕТ'),(1132,'ТРЕХМЕРН'),(1019,'ТРОН'),(34,'ТРУД'),(1222,'ТРУДОВ'),(1229,'ТРУДОУСТРОЙСТВ'),(951,'ТУМБ'),(1277,'ТЩАТЕЛЬН'),(371,'ТЫСЯЧ'),(1331,'УВЕДОМЛЕН'),(243,'УВЕЛИЧ'),(125,'УВЕЛИЧИВА'),(1186,'УВЕРЕН'),(685,'УВИДЕТ'),(325,'УГЛОВ'),(918,'УДАЧН'),(978,'УДИВИТЕЛЬН'),(1089,'УДОБ'),(1007,'УДОБН'),(446,'УДОВЛЕТВОРЕН'),(1256,'УКАЗАН'),(361,'УКОМПЛЕКТОВА'),(631,'УКРАИН'),(881,'УКРАШЕН'),(307,'УКРЕПЛЕН'),(987,'УМЕНЬШЕН'),(1058,'УНИВЕРСАЛЬН'),(199,'УНИВЕРСИТЕТ'),(954,'УНИКАЛЬН'),(1221,'УПРАВЛЕН'),(1020,'УПРАВЛЕНЦ'),(173,'УПРАВЛЯ'),(112,'УПРОЧ'),(252,'УРА'),(241,'УРОВЕН'),(448,'УРОВН'),(437,'УСЛОВ'),(4,'УСЛУГ'),(595,'УСПЕХ'),(97,'УСПЕШН'),(837,'УСТАЛ'),(873,'УСТАНОВ'),(551,'УСТАНОВК'),(1312,'УСТАНОВЛЕН'),(984,'УСТОЯ'),(985,'УТВЕРЖДЕН'),(624,'УЧАСТ'),(690,'УЧАСТНИК'),(689,'УЧАСТНИКОВ'),(580,'УЧЕБН'),(513,'УЧЕТ'),(1124,'УЧИТЫВ'),(1063,'УЮТ'),(1044,'УЮТН'),(337,'ФАБРИК'),(1074,'ФАЗЕНД'),(79,'ФАКС'),(1167,'ФАКТУР'),(158,'ФАКУЛЬТЕТ'),(754,'ФЕДЕРАЦ'),(151,'ФЕДОРОВИЧ'),(1035,'ФИЗИОЛОГИЧЕСК'),(303,'ФИЛИА'),(1226,'ФИНАНСОВО-ХОЗЯЙСТВЕН'),(19,'ФИРМ'),(247,'ФИРМЕН'),(880,'ФЛОР'),(191,'ФОМИЧ'),(1070,'ФОРМ'),(333,'ФОРМИР'),(1253,'ФОРМИРОВАН'),(612,'ФОРУМ'),(939,'ФУНКЦ'),(1160,'ФУНКЦИОНАЛЬН'),(651,'ФУРНИТУР'),(45,'ХАРАКТЕР'),(904,'ХАРАКТЕРИСТИК'),(1363,'ХЛЕБН'),(1076,'ХЛОПК'),(767,'ХЛОРИСТ'),(141,'ХОРОШ'),(1313,'ХОТЕЛ'),(1107,'ХРАН'),(1092,'ХРАНЕН'),(838,'ХРОМ'),(845,'ХРОМИРОВА'),(1199,'ХУДОЖЕСТВЕННО-КОНСТРУКТОРСК'),(508,'ЦВЕТ'),(1171,'ЦВЕТН'),(919,'ЦВЕТОВ'),(380,'ЦЕЛ'),(1049,'ЦЕЛИК'),(456,'ЦЕН'),(193,'ЦЕХ'),(1233,'ЧАС'),(217,'ЧЕЛОВЕК'),(1231,'ЧЕР'),(1190,'ЧЕРЧЕН'),(1024,'ЧЕСТ'),(973,'ЧИНОВНИК'),(292,'ЧИСЛ'),(1047,'ЧИСТ'),(836,'ЧУВСТВУ'),(249,'ШАГ'),(870,'ШАРМ'),(1260,'ШАТУР'),(1152,'ШИРОК'),(950,'ШКАФ'),(205,'ШКОЛ'),(332,'ШПОН'),(785,'ЩАВЕЛЕВ'),(1339,'ЭКЗЕМПЛЯР'),(1046,'ЭКОЛОГИЧЕСК'),(1182,'ЭКСКЛЮЗИВН'),(1169,'ЭКСПЕРИМЕНТИРОВА'),(227,'ЭКСПЛУАТАЦ'),(993,'ЭКСПЛУАТАЦИОН'),(622,'ЭКСПОЗИЦ'),(659,'ЭКСПОФОРУМ'),(871,'ЭЛЕГАНТН'),(70,'ЭЛЕКТРОН'),(531,'ЭЛЕМЕНТ'),(654,'ЭЛЕМЕНТОВ'),(866,'ЭЛИТН'),(585,'ЭНТУЗИАЗМ'),(1087,'ЭР'),(850,'ЭРГОНОМИК'),(948,'ЭРГОНОМИЧН'),(1126,'ЭСКИЗН'),(553,'ЭТАП'),(1194,'ЭТИК'),(189,'ЭФФЕКТИВН'),(254,'ЮГ'),(758,'ЯВЛЯ'),(812,'ЯРК'),(378,'ЯСН'),(804,'ЯЩИК');
/*!40000 ALTER TABLE `b_search_stem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_suggest`
--

DROP TABLE IF EXISTS `b_search_suggest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `FILTER_MD5` varchar(32) NOT NULL,
  `PHRASE` varchar(250) NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_suggest`
--

LOCK TABLES `b_search_suggest` WRITE;
/*!40000 ALTER TABLE `b_search_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_suggest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_tags`
--

DROP TABLE IF EXISTS `b_search_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_tags`
--

LOCK TABLES `b_search_tags` WRITE;
/*!40000 ALTER TABLE `b_search_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_search_user_right`
--

DROP TABLE IF EXISTS `b_search_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_search_user_right`
--

LOCK TABLES `b_search_user_right` WRITE;
/*!40000 ALTER TABLE `b_search_user_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_user_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_filter_mask`
--

DROP TABLE IF EXISTS `b_sec_filter_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 10,
  `SITE_ID` char(2) DEFAULT NULL,
  `FILTER_MASK` varchar(250) DEFAULT NULL,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_filter_mask`
--

LOCK TABLES `b_sec_filter_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_filter_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_filter_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_frame_mask`
--

DROP TABLE IF EXISTS `b_sec_frame_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 10,
  `SITE_ID` char(2) DEFAULT NULL,
  `FRAME_MASK` varchar(250) DEFAULT NULL,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_frame_mask`
--

LOCK TABLES `b_sec_frame_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_frame_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_frame_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule`
--

DROP TABLE IF EXISTS `b_sec_iprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule`
--

LOCK TABLES `b_sec_iprule` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_excl_ip`
--

DROP TABLE IF EXISTS `b_sec_iprule_excl_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`),
  CONSTRAINT `b_sec_iprule_excl_ip_ibfk_1` FOREIGN KEY (`IPRULE_ID`) REFERENCES `b_sec_iprule` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_excl_ip`
--

LOCK TABLES `b_sec_iprule_excl_ip` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_excl_mask`
--

DROP TABLE IF EXISTS `b_sec_iprule_excl_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`),
  CONSTRAINT `b_sec_iprule_excl_mask_ibfk_1` FOREIGN KEY (`IPRULE_ID`) REFERENCES `b_sec_iprule` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_excl_mask`
--

LOCK TABLES `b_sec_iprule_excl_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_incl_ip`
--

DROP TABLE IF EXISTS `b_sec_iprule_incl_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`),
  CONSTRAINT `b_sec_iprule_incl_ip_ibfk_1` FOREIGN KEY (`IPRULE_ID`) REFERENCES `b_sec_iprule` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_incl_ip`
--

LOCK TABLES `b_sec_iprule_incl_ip` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_iprule_incl_mask`
--

DROP TABLE IF EXISTS `b_sec_iprule_incl_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIKE_MASK` varchar(250) DEFAULT NULL,
  `PREG_MASK` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`),
  CONSTRAINT `b_sec_iprule_incl_mask_ibfk_1` FOREIGN KEY (`IPRULE_ID`) REFERENCES `b_sec_iprule` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_iprule_incl_mask`
--

LOCK TABLES `b_sec_iprule_incl_mask` WRITE;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_recovery_codes`
--

DROP TABLE IF EXISTS `b_sec_recovery_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `USED` varchar(1) NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_recovery_codes`
--

LOCK TABLES `b_sec_recovery_codes` WRITE;
/*!40000 ALTER TABLE `b_sec_recovery_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_recovery_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_redirect_url`
--

DROP TABLE IF EXISTS `b_sec_redirect_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `URL` varchar(250) NOT NULL,
  `PARAMETER_NAME` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_redirect_url`
--

LOCK TABLES `b_sec_redirect_url` WRITE;
/*!40000 ALTER TABLE `b_sec_redirect_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_redirect_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_session`
--

DROP TABLE IF EXISTS `b_sec_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_session` (
  `SESSION_ID` varchar(250) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SESSION_DATA` longtext DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_session`
--

LOCK TABLES `b_sec_session` WRITE;
/*!40000 ALTER TABLE `b_sec_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_user`
--

DROP TABLE IF EXISTS `b_sec_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) DEFAULT NULL,
  `TYPE` varchar(16) NOT NULL,
  `PARAMS` text DEFAULT NULL,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `b_sec_user_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `b_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_user`
--

LOCK TABLES `b_sec_user` WRITE;
/*!40000 ALTER TABLE `b_sec_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_virus`
--

DROP TABLE IF EXISTS `b_sec_virus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_virus` (
  `ID` varchar(32) NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `SENT` char(1) NOT NULL DEFAULT 'N',
  `INFO` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_virus`
--

LOCK TABLES `b_sec_virus` WRITE;
/*!40000 ALTER TABLE `b_sec_virus` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_virus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sec_white_list`
--

DROP TABLE IF EXISTS `b_sec_white_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sec_white_list`
--

LOCK TABLES `b_sec_white_list` WRITE;
/*!40000 ALTER TABLE `b_sec_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_white_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_security_sitecheck`
--

DROP TABLE IF EXISTS `b_security_sitecheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_security_sitecheck`
--

LOCK TABLES `b_security_sitecheck` WRITE;
/*!40000 ALTER TABLE `b_security_sitecheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_security_sitecheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_autolog`
--

DROP TABLE IF EXISTS `b_seo_adv_autolog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT 0,
  `SUCCESS` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_autolog`
--

LOCK TABLES `b_seo_adv_autolog` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_autolog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_autolog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_banner`
--

DROP TABLE IF EXISTS `b_seo_adv_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` mediumtext DEFAULT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_banner`
--

LOCK TABLES `b_seo_adv_banner` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_campaign`
--

DROP TABLE IF EXISTS `b_seo_adv_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `XML_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_campaign`
--

LOCK TABLES `b_seo_adv_campaign` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_group`
--

DROP TABLE IF EXISTS `b_seo_adv_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` text DEFAULT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_group`
--

LOCK TABLES `b_seo_adv_group` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_link`
--

DROP TABLE IF EXISTS `b_seo_adv_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_link`
--

LOCK TABLES `b_seo_adv_link` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_log`
--

DROP TABLE IF EXISTS `b_seo_adv_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `REQUEST_URI` varchar(100) NOT NULL,
  `REQUEST_DATA` text DEFAULT NULL,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_log`
--

LOCK TABLES `b_seo_adv_log` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_order`
--

DROP TABLE IF EXISTS `b_seo_adv_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT 0,
  `PROCESSED` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_order`
--

LOCK TABLES `b_seo_adv_order` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_adv_region`
--

DROP TABLE IF EXISTS `b_seo_adv_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) NOT NULL,
  `OWNER_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `XML_ID` varchar(255) NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SETTINGS` text DEFAULT NULL,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_adv_region`
--

LOCK TABLES `b_seo_adv_region` WRITE;
/*!40000 ALTER TABLE `b_seo_adv_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_keywords`
--

DROP TABLE IF EXISTS `b_seo_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `KEYWORDS` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_keywords`
--

LOCK TABLES `b_seo_keywords` WRITE;
/*!40000 ALTER TABLE `b_seo_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_search_engine`
--

DROP TABLE IF EXISTS `b_seo_search_engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `SORT` int(5) DEFAULT 100,
  `NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `SETTINGS` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_search_engine`
--

LOCK TABLES `b_seo_search_engine` WRITE;
/*!40000 ALTER TABLE `b_seo_search_engine` DISABLE KEYS */;
INSERT INTO `b_seo_search_engine` VALUES (1,'google','Y',200,'Google','868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com','EItMlJpZLC2WRPKB6QsA5bV9','urn:ietf:wg:oauth:2.0:oob',NULL),(2,'yandex','Y',300,'Yandex','f848c7bfc1d34a94ba6d05439f81bbd7','da0e73b2d9cc4e809f3170e49cb9df01','https://oauth.yandex.ru/verification_code',NULL),(3,'yandex_direct','Y',400,'Yandex.Direct','','','https://oauth.yandex.ru/verification_code',NULL);
/*!40000 ALTER TABLE `b_seo_search_engine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_log`
--

DROP TABLE IF EXISTS `b_seo_service_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `CODE` varchar(20) DEFAULT NULL,
  `MESSAGE` varchar(1000) NOT NULL,
  `GROUP_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_log`
--

LOCK TABLES `b_seo_service_log` WRITE;
/*!40000 ALTER TABLE `b_seo_service_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_queue`
--

DROP TABLE IF EXISTS `b_seo_service_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(20) NOT NULL,
  `SERVICE_TYPE` varchar(20) NOT NULL,
  `CLIENT_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_QUEUE_TYPE` (`TYPE`),
  KEY `IX_B_SEO_SERVICE_SERVICE_TYPE_CLIENT_ID` (`SERVICE_TYPE`,`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_queue`
--

LOCK TABLES `b_seo_service_queue` WRITE;
/*!40000 ALTER TABLE `b_seo_service_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_rtg_queue`
--

DROP TABLE IF EXISTS `b_seo_service_rtg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL,
  `CLIENT_ID` varchar(50) DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) NOT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `CONTACT_TYPE` varchar(15) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ACTION` char(3) NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_rtg_queue`
--

LOCK TABLES `b_seo_service_rtg_queue` WRITE;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_subscription`
--

DROP TABLE IF EXISTS `b_seo_service_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL,
  `GROUP_ID` varchar(50) NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) DEFAULT NULL,
  `HAS_AUTH` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_subscription`
--

LOCK TABLES `b_seo_service_subscription` WRITE;
/*!40000 ALTER TABLE `b_seo_service_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_service_webhook`
--

DROP TABLE IF EXISTS `b_seo_service_webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_service_webhook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL,
  `EXTERNAL_ID` varchar(50) NOT NULL,
  `SECURITY_CODE` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_service_webhook`
--

LOCK TABLES `b_seo_service_webhook` WRITE;
/*!40000 ALTER TABLE `b_seo_service_webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_webhook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap`
--

DROP TABLE IF EXISTS `b_seo_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SITE_ID` char(2) NOT NULL,
  `ACTIVE` char(1) DEFAULT 'Y',
  `NAME` varchar(255) DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap`
--

LOCK TABLES `b_seo_sitemap` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_entity`
--

DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_entity`
--

LOCK TABLES `b_seo_sitemap_entity` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_iblock`
--

DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_iblock`
--

LOCK TABLES `b_seo_sitemap_iblock` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_sitemap_runtime`
--

DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_sitemap_runtime`
--

LOCK TABLES `b_seo_sitemap_runtime` WRITE;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_seo_yandex_direct_stat`
--

DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) DEFAULT NULL,
  `SUM` float DEFAULT 0,
  `SUM_SEARCH` float DEFAULT 0,
  `SUM_CONTEXT` float DEFAULT 0,
  `CLICKS` int(7) DEFAULT 0,
  `CLICKS_SEARCH` int(7) DEFAULT 0,
  `CLICKS_CONTEXT` int(7) DEFAULT 0,
  `SHOWS` int(7) DEFAULT 0,
  `SHOWS_SEARCH` int(7) DEFAULT 0,
  `SHOWS_CONTEXT` int(7) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_seo_yandex_direct_stat`
--

LOCK TABLES `b_seo_yandex_direct_stat` WRITE;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_short_uri`
--

DROP TABLE IF EXISTS `b_short_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_short_uri` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) NOT NULL,
  `URI_CRC` int(11) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT 301,
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_short_uri`
--

LOCK TABLES `b_short_uri` WRITE;
/*!40000 ALTER TABLE `b_short_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_short_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_site_template`
--

DROP TABLE IF EXISTS `b_site_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) NOT NULL,
  `CONDITION` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `TEMPLATE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_site_template`
--

LOCK TABLES `b_site_template` WRITE;
/*!40000 ALTER TABLE `b_site_template` DISABLE KEYS */;
INSERT INTO `b_site_template` VALUES (5,'kv','CSite::InDir(\'/index.php\')',1,'main'),(6,'kv','',2,'inner'),(11,'s1','CSite::InDir(\'/index.php\')',150,'main'),(12,'s1','',151,'inner');
/*!40000 ALTER TABLE `b_site_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sm_version_history`
--

DROP TABLE IF EXISTS `b_sm_version_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sm_version_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sm_version_history`
--

LOCK TABLES `b_sm_version_history` WRITE;
/*!40000 ALTER TABLE `b_sm_version_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sm_version_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile`
--

DROP TABLE IF EXISTS `b_smile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `SET_ID` int(11) NOT NULL DEFAULT 0,
  `SORT` int(11) NOT NULL DEFAULT 150,
  `TYPING` varchar(100) DEFAULT NULL,
  `CLICKABLE` char(1) NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) NOT NULL,
  `IMAGE_DEFINITION` varchar(10) NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT 0,
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile`
--

LOCK TABLES `b_smile` WRITE;
/*!40000 ALTER TABLE `b_smile` DISABLE KEYS */;
INSERT INTO `b_smile` VALUES (1,'S',2,100,':) :-)','Y','N','bx_smile_smile.png','UHD',20,20),(2,'S',2,105,';) ;-)','Y','N','bx_smile_wink.png','UHD',20,20),(3,'S',2,110,':D :-D','Y','N','bx_smile_biggrin.png','UHD',20,20),(4,'S',2,115,'8-)','Y','N','bx_smile_cool.png','UHD',20,20),(5,'S',2,120,':facepalm:','Y','N','bx_smile_facepalm.png','UHD',20,20),(6,'S',2,125,':{} :-{}','Y','N','bx_smile_kiss.png','UHD',20,20),(7,'S',2,130,':( :-(','Y','N','bx_smile_sad.png','UHD',20,20),(8,'S',2,135,':| :-|','Y','N','bx_smile_neutral.png','UHD',20,20),(9,'S',2,140,':oops:','Y','N','bx_smile_redface.png','UHD',20,20),(10,'S',2,145,':cry: :~(','Y','N','bx_smile_cry.png','UHD',20,20),(11,'S',2,150,':evil: >:-<','Y','N','bx_smile_evil.png','UHD',20,20),(12,'S',2,155,':o :-o :shock:','Y','N','bx_smile_eek.png','UHD',20,20),(13,'S',2,160,':/ :-/','Y','N','bx_smile_confuse.png','UHD',20,20),(14,'S',2,165,':idea:','Y','N','bx_smile_idea.png','UHD',20,20),(15,'S',2,170,':?:','Y','N','bx_smile_question.png','UHD',20,20),(16,'S',2,175,':!:','Y','N','bx_smile_exclaim.png','UHD',20,20),(17,'S',2,180,':like:','Y','N','bx_smile_like.png','UHD',20,20),(18,'I',2,175,'ICON_NOTE','Y','N','bx_icon_1.gif','SD',15,15),(19,'I',2,180,'ICON_DIRRECTION','Y','N','bx_icon_2.gif','SD',15,15),(20,'I',2,185,'ICON_IDEA','Y','N','bx_icon_3.gif','SD',15,15),(21,'I',2,190,'ICON_ATTANSION','Y','N','bx_icon_4.gif','SD',15,15),(22,'I',2,195,'ICON_QUESTION','Y','N','bx_icon_5.gif','SD',15,15),(23,'I',2,200,'ICON_BAD','Y','N','bx_icon_6.gif','SD',15,15),(24,'I',2,205,'ICON_GOOD','Y','N','bx_icon_7.gif','SD',15,15);
/*!40000 ALTER TABLE `b_smile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile_lang`
--

DROP TABLE IF EXISTS `b_smile_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile_lang`
--

LOCK TABLES `b_smile_lang` WRITE;
/*!40000 ALTER TABLE `b_smile_lang` DISABLE KEYS */;
INSERT INTO `b_smile_lang` VALUES (1,'P',1,'ru','Стандартная галерея'),(2,'P',1,'en','Standard gallery'),(3,'G',2,'ru','Основной набор'),(4,'G',2,'en','Default pack'),(5,'S',1,'ru','С улыбкой'),(6,'S',1,'en','Smile'),(7,'S',2,'ru','Шутливо'),(8,'S',2,'en','Wink'),(9,'S',3,'ru','Широкая улыбка'),(10,'S',3,'en','Big grin'),(11,'S',4,'ru','Здорово'),(12,'S',4,'en','Cool'),(13,'S',5,'ru','Разочарование'),(14,'S',5,'en','Facepalm'),(15,'S',6,'ru','Поцелуй'),(16,'S',6,'en','Kiss'),(17,'S',7,'ru','Печально'),(18,'S',7,'en','Sad'),(19,'S',8,'ru','Скептически'),(20,'S',8,'en','Skeptic'),(21,'S',9,'ru','Смущенный'),(22,'S',9,'en','Embarrassed'),(23,'S',10,'ru','Очень грустно'),(24,'S',10,'en','Crying'),(25,'S',11,'ru','Со злостью'),(26,'S',11,'en','Angry'),(27,'S',12,'ru','Удивленно'),(28,'S',12,'en','Surprised'),(29,'S',13,'ru','Смущенно'),(30,'S',13,'en','Confused'),(31,'S',14,'ru','Идея'),(32,'S',14,'en','Idea'),(33,'S',15,'ru','Вопрос'),(34,'S',15,'en','Question'),(35,'S',16,'ru','Восклицание'),(36,'S',16,'en','Exclamation'),(37,'S',17,'ru','Нравится'),(38,'S',17,'en','Like');
/*!40000 ALTER TABLE `b_smile_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_smile_set`
--

DROP TABLE IF EXISTS `b_smile_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_smile_set` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) NOT NULL DEFAULT 'G',
  `PARENT_ID` int(11) NOT NULL DEFAULT 0,
  `STRING_ID` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 150,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_smile_set`
--

LOCK TABLES `b_smile_set` WRITE;
/*!40000 ALTER TABLE `b_smile_set` DISABLE KEYS */;
INSERT INTO `b_smile_set` VALUES (1,'P',0,'bitrix',150),(2,'G',1,'bitrix_main',150);
/*!40000 ALTER TABLE `b_smile_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sms_template`
--

DROP TABLE IF EXISTS `b_sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sms_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) NOT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) DEFAULT NULL,
  `RECEIVER` varchar(50) DEFAULT NULL,
  `MESSAGE` text DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_sms_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sms_template`
--

LOCK TABLES `b_sms_template` WRITE;
/*!40000 ALTER TABLE `b_sms_template` DISABLE KEYS */;
INSERT INTO `b_sms_template` VALUES (1,'SMS_USER_CONFIRM_NUMBER','Y','#DEFAULT_SENDER#','#USER_PHONE#','Код подтверждения #CODE#',NULL),(2,'SMS_USER_RESTORE_PASSWORD','Y','#DEFAULT_SENDER#','#USER_PHONE#','Код для восстановления пароля #CODE#',NULL),(3,'SMS_EVENT_LOG_NOTIFICATION','Y','#DEFAULT_SENDER#','#PHONE_NUMBER#','#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)',NULL);
/*!40000 ALTER TABLE `b_sms_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sms_template_site`
--

DROP TABLE IF EXISTS `b_sms_template_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sms_template_site` (
  `TEMPLATE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sms_template_site`
--

LOCK TABLES `b_sms_template_site` WRITE;
/*!40000 ALTER TABLE `b_sms_template_site` DISABLE KEYS */;
INSERT INTO `b_sms_template_site` VALUES (1,'s1'),(2,'s1'),(3,'s1');
/*!40000 ALTER TABLE `b_sms_template_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_ap`
--

DROP TABLE IF EXISTS `b_socialservices_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) NOT NULL,
  `ENDPOINT` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_ap`
--

LOCK TABLES `b_socialservices_ap` WRITE;
/*!40000 ALTER TABLE `b_socialservices_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_contact`
--

DROP TABLE IF EXISTS `b_socialservices_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_contact`
--

LOCK TABLES `b_socialservices_contact` WRITE;
/*!40000 ALTER TABLE `b_socialservices_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_contact_connect`
--

DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) NOT NULL,
  `CONNECT_TYPE` char(1) DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_contact_connect`
--

LOCK TABLES `b_socialservices_contact_connect` WRITE;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_message`
--

DROP TABLE IF EXISTS `b_socialservices_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) NOT NULL,
  `MESSAGE` varchar(1000) DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_message`
--

LOCK TABLES `b_socialservices_message` WRITE;
/*!40000 ALTER TABLE `b_socialservices_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_user`
--

DROP TABLE IF EXISTS `b_socialservices_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) NOT NULL,
  `CAN_DELETE` char(1) NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) DEFAULT NULL,
  `PERMISSIONS` varchar(555) DEFAULT NULL,
  `OATOKEN` text DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` text DEFAULT NULL,
  `REFRESH_TOKEN` text DEFAULT NULL,
  `SEND_ACTIVITY` char(1) DEFAULT 'Y',
  `SITE_ID` varchar(50) DEFAULT NULL,
  `INITIALIZED` char(1) DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`),
  KEY `IX_B_SOCIALSERVICES_US_4` (`USER_ID`,`EXTERNAL_AUTH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_user`
--

LOCK TABLES `b_socialservices_user` WRITE;
/*!40000 ALTER TABLE `b_socialservices_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_user_link`
--

DROP TABLE IF EXISTS `b_socialservices_user_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) NOT NULL,
  `LINK_NAME` varchar(255) DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) DEFAULT NULL,
  `LINK_PICTURE` varchar(255) DEFAULT NULL,
  `LINK_EMAIL` varchar(255) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_user_link`
--

LOCK TABLES `b_socialservices_user_link` WRITE;
/*!40000 ALTER TABLE `b_socialservices_user_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_zoom_meeting`
--

DROP TABLE IF EXISTS `b_socialservices_zoom_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_zoom_meeting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(10) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CONFERENCE_URL` varchar(255) NOT NULL,
  `CONFERENCE_EXTERNAL_ID` bigint(20) unsigned NOT NULL,
  `CONFERENCE_PASSWORD` text DEFAULT NULL,
  `JOINED` char(1) DEFAULT NULL,
  `CONFERENCE_CREATED` datetime DEFAULT NULL,
  `CONFERENCE_STARTED` datetime DEFAULT NULL,
  `CONFERENCE_ENDED` datetime DEFAULT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `TITLE` text DEFAULT NULL,
  `SHORT_LINK` varchar(255) DEFAULT NULL,
  `HAS_RECORDING` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_1` (`CONFERENCE_EXTERNAL_ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_zoom_meeting`
--

LOCK TABLES `b_socialservices_zoom_meeting` WRITE;
/*!40000 ALTER TABLE `b_socialservices_zoom_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_zoom_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_socialservices_zoom_meeting_recording`
--

DROP TABLE IF EXISTS `b_socialservices_zoom_meeting_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_socialservices_zoom_meeting_recording` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXTERNAL_ID` varchar(64) NOT NULL,
  `MEETING_ID` int(11) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) NOT NULL,
  `FILE_SIZE` int(11) NOT NULL,
  `PLAY_URL` varchar(500) DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) NOT NULL,
  `DOWNLOAD_TOKEN` text DEFAULT NULL,
  `PASSWORD` text DEFAULT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_socialservices_zoom_meeting_recording`
--

LOCK TABLES `b_socialservices_zoom_meeting_recording` WRITE;
/*!40000 ALTER TABLE `b_socialservices_zoom_meeting_recording` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_zoom_meeting_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sticker`
--

DROP TABLE IF EXISTS `b_sticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) DEFAULT NULL,
  `PAGE_URL` varchar(255) NOT NULL,
  `PAGE_TITLE` varchar(255) NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) NOT NULL DEFAULT 'N',
  `CONTENT` text DEFAULT NULL,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) NOT NULL DEFAULT 'N',
  `CLOSED` char(1) NOT NULL DEFAULT 'N',
  `DELETED` char(1) NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sticker`
--

LOCK TABLES `b_sticker` WRITE;
/*!40000 ALTER TABLE `b_sticker` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_sticker_group_task`
--

DROP TABLE IF EXISTS `b_sticker_group_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_sticker_group_task`
--

LOCK TABLES `b_sticker_group_task` WRITE;
/*!40000 ALTER TABLE `b_sticker_group_task` DISABLE KEYS */;
INSERT INTO `b_sticker_group_task` VALUES (5,29);
/*!40000 ALTER TABLE `b_sticker_group_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_subscription`
--

DROP TABLE IF EXISTS `b_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) NOT NULL,
  `FORMAT` varchar(4) NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) DEFAULT NULL,
  `CONFIRMED` char(1) NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`),
  CONSTRAINT `b_subscription_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `b_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_subscription`
--

LOCK TABLES `b_subscription` WRITE;
/*!40000 ALTER TABLE `b_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_subscription_rubric`
--

DROP TABLE IF EXISTS `b_subscription_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`),
  KEY `LIST_RUBRIC_ID` (`LIST_RUBRIC_ID`),
  CONSTRAINT `b_subscription_rubric_ibfk_1` FOREIGN KEY (`SUBSCRIPTION_ID`) REFERENCES `b_subscription` (`ID`),
  CONSTRAINT `b_subscription_rubric_ibfk_2` FOREIGN KEY (`LIST_RUBRIC_ID`) REFERENCES `b_list_rubric` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_subscription_rubric`
--

LOCK TABLES `b_subscription_rubric` WRITE;
/*!40000 ALTER TABLE `b_subscription_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_task`
--

DROP TABLE IF EXISTS `b_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `LETTER` char(1) DEFAULT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `SYS` char(1) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BINDING` varchar(50) DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_task`
--

LOCK TABLES `b_task` WRITE;
/*!40000 ALTER TABLE `b_task` DISABLE KEYS */;
INSERT INTO `b_task` VALUES (1,'main_denied','D','main','Y',NULL,'module'),(2,'main_change_profile','P','main','Y',NULL,'module'),(3,'main_view_all_settings','R','main','Y',NULL,'module'),(4,'main_view_all_settings_change_profile','T','main','Y',NULL,'module'),(5,'main_edit_subordinate_users','V','main','Y',NULL,'module'),(6,'main_full_access','W','main','Y',NULL,'module'),(7,'fm_folder_access_denied','D','main','Y',NULL,'file'),(8,'fm_folder_access_read','R','main','Y',NULL,'file'),(9,'fm_folder_access_write','W','main','Y',NULL,'file'),(10,'fm_folder_access_full','X','main','Y',NULL,'file'),(11,'fm_folder_access_workflow','U','main','Y',NULL,'file'),(12,'bitrixcloud_deny','D','bitrixcloud','Y',NULL,'module'),(13,'bitrixcloud_control','W','bitrixcloud','Y',NULL,'module'),(14,'clouds_denied','D','clouds','Y',NULL,'module'),(15,'clouds_browse','F','clouds','Y',NULL,'module'),(16,'clouds_upload','U','clouds','Y',NULL,'module'),(17,'clouds_full_access','W','clouds','Y',NULL,'module'),(18,'fileman_denied','D','fileman','Y','','module'),(19,'fileman_allowed_folders','F','fileman','Y','','module'),(20,'fileman_full_access','W','fileman','Y','','module'),(21,'medialib_denied','D','fileman','Y','','medialib'),(22,'medialib_view','F','fileman','Y','','medialib'),(23,'medialib_only_new','R','fileman','Y','','medialib'),(24,'medialib_edit_items','V','fileman','Y','','medialib'),(25,'medialib_editor','W','fileman','Y','','medialib'),(26,'medialib_full','X','fileman','Y','','medialib'),(27,'stickers_denied','D','fileman','Y','','stickers'),(28,'stickers_read','R','fileman','Y','','stickers'),(29,'stickers_edit','W','fileman','Y','','stickers'),(30,'hblock_denied','D','highloadblock','Y',NULL,'module'),(31,'hblock_read','R','highloadblock','Y',NULL,'module'),(32,'hblock_write','W','highloadblock','Y',NULL,'module'),(33,'iblock_deny','D','iblock','Y',NULL,'iblock'),(34,'iblock_read','R','iblock','Y',NULL,'iblock'),(35,'iblock_element_add','E','iblock','Y',NULL,'iblock'),(36,'iblock_admin_read','S','iblock','Y',NULL,'iblock'),(37,'iblock_admin_add','T','iblock','Y',NULL,'iblock'),(38,'iblock_limited_edit','U','iblock','Y',NULL,'iblock'),(39,'iblock_full_edit','W','iblock','Y',NULL,'iblock'),(40,'iblock_full','X','iblock','Y',NULL,'iblock'),(41,'landing_right_denied','D','landing','Y',NULL,'module'),(42,'landing_right_read','R','landing','Y',NULL,'module'),(43,'landing_right_edit','U','landing','Y',NULL,'module'),(44,'landing_right_sett','V','landing','Y',NULL,'module'),(45,'landing_right_public','W','landing','Y',NULL,'module'),(46,'landing_right_delete','X','landing','Y',NULL,'module'),(47,'security_denied','D','security','Y',NULL,'module'),(48,'security_filter','F','security','Y',NULL,'module'),(49,'security_otp','S','security','Y',NULL,'module'),(50,'security_view_all_settings','T','security','Y',NULL,'module'),(51,'security_full_access','W','security','Y',NULL,'module'),(52,'seo_denied','D','seo','Y','','module'),(53,'seo_edit','F','seo','Y','','module'),(54,'seo_full_access','W','seo','Y','','module'),(55,'Контент-редакторы','Q','main','N','Разрешено изменять информацию в своем профайле. Управление кешем','module');
/*!40000 ALTER TABLE `b_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_task_operation`
--

DROP TABLE IF EXISTS `b_task_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_task_operation`
--

LOCK TABLES `b_task_operation` WRITE;
/*!40000 ALTER TABLE `b_task_operation` DISABLE KEYS */;
INSERT INTO `b_task_operation` VALUES (2,2),(2,3),(3,2),(3,4),(3,5),(3,6),(3,7),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(5,2),(5,3),(5,5),(5,6),(5,7),(5,8),(5,9),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,10),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(8,19),(8,20),(8,21),(9,19),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30),(9,31),(9,32),(9,33),(9,34),(10,19),(10,20),(10,21),(10,22),(10,23),(10,24),(10,25),(10,26),(10,27),(10,28),(10,29),(10,30),(10,31),(10,32),(10,33),(10,34),(10,35),(11,19),(11,20),(11,21),(11,24),(11,28),(13,36),(13,37),(15,38),(16,38),(16,39),(17,38),(17,39),(17,40),(19,43),(19,44),(19,45),(19,46),(19,47),(19,48),(19,49),(19,51),(19,52),(20,41),(20,42),(20,43),(20,44),(20,45),(20,46),(20,47),(20,48),(20,49),(20,50),(20,51),(20,52),(20,53),(22,54),(23,54),(23,55),(23,59),(24,54),(24,59),(24,60),(24,61),(25,54),(25,55),(25,56),(25,57),(25,59),(25,60),(25,61),(26,54),(26,55),(26,56),(26,57),(26,58),(26,59),(26,60),(26,61),(28,62),(29,62),(29,63),(29,64),(29,65),(31,66),(32,67),(32,68),(34,69),(34,70),(35,71),(36,69),(36,70),(36,72),(37,69),(37,70),(37,71),(37,72),(38,69),(38,70),(38,71),(38,72),(38,73),(38,74),(38,75),(38,76),(39,69),(39,70),(39,71),(39,72),(39,73),(39,74),(39,75),(39,76),(39,77),(39,78),(39,79),(39,80),(40,69),(40,70),(40,71),(40,72),(40,73),(40,74),(40,75),(40,76),(40,77),(40,78),(40,79),(40,80),(40,81),(40,82),(40,83),(40,84),(40,85),(40,86),(42,87),(43,88),(44,89),(45,90),(46,91),(48,92),(49,93),(50,94),(50,95),(50,96),(50,97),(50,98),(50,99),(50,100),(50,101),(50,102),(50,103),(50,104),(51,92),(51,93),(51,94),(51,95),(51,96),(51,97),(51,98),(51,99),(51,100),(51,101),(51,102),(51,103),(51,104),(51,105),(51,106),(51,107),(51,108),(51,109),(51,110),(51,111),(51,112),(51,113),(51,114),(51,115),(51,116),(51,117),(53,119),(54,118),(54,119),(55,2),(55,3),(55,14);
/*!40000 ALTER TABLE `b_task_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_translate_diff`
--

DROP TABLE IF EXISTS `b_translate_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_translate_diff` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) NOT NULL,
  `AGAINST_LANG_ID` char(2) NOT NULL,
  `EXCESS_COUNT` int(18) NOT NULL DEFAULT 0,
  `DEFICIENCY_COUNT` int(18) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_DIFF` (`FILE_ID`,`LANG_ID`,`AGAINST_LANG_ID`),
  KEY `IX_TRNSL_DIFF_PATH` (`PATH_ID`,`LANG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_translate_diff`
--

LOCK TABLES `b_translate_diff` WRITE;
/*!40000 ALTER TABLE `b_translate_diff` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_diff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_translate_file`
--

DROP TABLE IF EXISTS `b_translate_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_translate_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) NOT NULL,
  `FULL_PATH` varchar(500) NOT NULL,
  `PHRASE_COUNT` int(18) NOT NULL DEFAULT 0,
  `INDEXED` enum('Y','N') NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_FL_PATH` (`PATH_ID`,`LANG_ID`),
  KEY `IX_TRNSL_FULL_PATH` (`FULL_PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_translate_file`
--

LOCK TABLES `b_translate_file` WRITE;
/*!40000 ALTER TABLE `b_translate_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_translate_path`
--

DROP TABLE IF EXISTS `b_translate_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_translate_path` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL DEFAULT 0,
  `DEPTH_LEVEL` int(18) NOT NULL DEFAULT 0,
  `SORT` int(18) NOT NULL DEFAULT 0,
  `PATH` varchar(500) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `IS_LANG` enum('Y','N') NOT NULL DEFAULT 'N',
  `IS_DIR` enum('Y','N') NOT NULL DEFAULT 'N',
  `OBLIGATORY_LANGS` char(50) DEFAULT NULL,
  `INDEXED` enum('Y','N') NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `ASSIGNMENT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_PTH_NAME` (`PARENT_ID`,`NAME`),
  KEY `IX_TRNSL_PTH_PARENT` (`PARENT_ID`,`IS_DIR`,`IS_LANG`),
  KEY `IX_TRNSL_PTH_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_translate_path`
--

LOCK TABLES `b_translate_path` WRITE;
/*!40000 ALTER TABLE `b_translate_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_translate_path_lang`
--

DROP TABLE IF EXISTS `b_translate_path_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_translate_path_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_TRNSL_LNG_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_translate_path_lang`
--

LOCK TABLES `b_translate_path_lang` WRITE;
/*!40000 ALTER TABLE `b_translate_path_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_path_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_translate_path_tree`
--

DROP TABLE IF EXISTS `b_translate_path_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_translate_path_tree` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_ANCESTOR` (`PARENT_ID`,`DEPTH_LEVEL`,`PATH_ID`),
  UNIQUE KEY `IX_TRNSL_DESCENDANT` (`PATH_ID`,`PARENT_ID`,`DEPTH_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_translate_path_tree`
--

LOCK TABLES `b_translate_path_tree` WRITE;
/*!40000 ALTER TABLE `b_translate_path_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_path_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_translate_phrase`
--

DROP TABLE IF EXISTS `b_translate_phrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_translate_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `PHRASE` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_PHR_PATH_CODE` (`PATH_ID`,`LANG_ID`,`CODE`),
  KEY `IX_TRNSL_PHR_PATH` (`PATH_ID`,`CODE`),
  KEY `IX_TRNSL_FILE` (`FILE_ID`),
  FULLTEXT KEY `IXF_TRNSL_PHR` (`PHRASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_translate_phrase`
--

LOCK TABLES `b_translate_phrase` WRITE;
/*!40000 ALTER TABLE `b_translate_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_translate_phrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_avatar_mask_access`
--

DROP TABLE IF EXISTS `b_ui_avatar_mask_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_avatar_mask_access` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_UI_AVATAR_MASK_RIGHT_3` (`ITEM_ID`,`ACCESS_CODE`),
  KEY `B_UI_AVATAR_MASK_RIGHT_1` (`ITEM_ID`),
  KEY `B_UI_AVATAR_MASK_RIGHT_2` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_avatar_mask_access`
--

LOCK TABLES `b_ui_avatar_mask_access` WRITE;
/*!40000 ALTER TABLE `b_ui_avatar_mask_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_avatar_mask_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_avatar_mask_file_deleted`
--

DROP TABLE IF EXISTS `b_ui_avatar_mask_file_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_avatar_mask_file_deleted` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ENTITY` varchar(50) NOT NULL,
  `ORIGINAL_FILE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_1` (`ENTITY`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_2` (`ITEM_ID`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_3` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_avatar_mask_file_deleted`
--

LOCK TABLES `b_ui_avatar_mask_file_deleted` WRITE;
/*!40000 ALTER TABLE `b_ui_avatar_mask_file_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_avatar_mask_file_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_avatar_mask_group`
--

DROP TABLE IF EXISTS `b_ui_avatar_mask_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_avatar_mask_group` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` varchar(100) NOT NULL,
  `OWNER_ID` varchar(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_UI_AVATAR_MASK_GROUP_OWNER` (`OWNER_ID`,`OWNER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_avatar_mask_group`
--

LOCK TABLES `b_ui_avatar_mask_group` WRITE;
/*!40000 ALTER TABLE `b_ui_avatar_mask_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_avatar_mask_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_avatar_mask_item`
--

DROP TABLE IF EXISTS `b_ui_avatar_mask_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_avatar_mask_item` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` varchar(100) NOT NULL,
  `OWNER_ID` varchar(20) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `GROUP_ID` int(10) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `B_UI_AVATAR_MASK_ITEM_OWNER` (`OWNER_TYPE`,`OWNER_ID`),
  KEY `B_UI_AVATAR_MASK_ITEM_FILE_ID` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_avatar_mask_item`
--

LOCK TABLES `b_ui_avatar_mask_item` WRITE;
/*!40000 ALTER TABLE `b_ui_avatar_mask_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_avatar_mask_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_avatar_mask_item_applied_to`
--

DROP TABLE IF EXISTS `b_ui_avatar_mask_item_applied_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_avatar_mask_item_applied_to` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ORIGINAL_FILE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `b_ui_avatar_mask_item_applied1` (`FILE_ID`,`ITEM_ID`),
  KEY `b_ui_avatar_mask_item_applied2` (`ITEM_ID`),
  KEY `b_ui_avatar_mask_item_applied3` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_avatar_mask_item_applied_to`
--

LOCK TABLES `b_ui_avatar_mask_item_applied_to` WRITE;
/*!40000 ALTER TABLE `b_ui_avatar_mask_item_applied_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_avatar_mask_item_applied_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_avatar_mask_recently_used`
--

DROP TABLE IF EXISTS `b_ui_avatar_mask_recently_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_avatar_mask_recently_used` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_UI_AVATAR_MASK_ITEM_R_OWNER` (`ITEM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_avatar_mask_recently_used`
--

LOCK TABLES `b_ui_avatar_mask_recently_used` WRITE;
/*!40000 ALTER TABLE `b_ui_avatar_mask_recently_used` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_avatar_mask_recently_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_entity_editor_config`
--

DROP TABLE IF EXISTS `b_ui_entity_editor_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_entity_editor_config` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(20) NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `CONFIG` text NOT NULL,
  `COMMON` varchar(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `CATEGORY` (`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_entity_editor_config`
--

LOCK TABLES `b_ui_entity_editor_config` WRITE;
/*!40000 ALTER TABLE `b_ui_entity_editor_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_entity_editor_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_entity_editor_config_ac`
--

DROP TABLE IF EXISTS `b_ui_entity_editor_config_ac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_entity_editor_config_ac` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACCESS_CODE` varchar(10) NOT NULL,
  `CONFIG_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACCESS_CODE` (`ACCESS_CODE`),
  KEY `CONFIG_ID` (`CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_entity_editor_config_ac`
--

LOCK TABLES `b_ui_entity_editor_config_ac` WRITE;
/*!40000 ALTER TABLE `b_ui_entity_editor_config_ac` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_entity_editor_config_ac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_ui_file_uploader_temp_file`
--

DROP TABLE IF EXISTS `b_ui_file_uploader_temp_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_ui_file_uploader_temp_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GUID` char(36) NOT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `SIZE` bigint(20) NOT NULL,
  `PATH` varchar(255) NOT NULL,
  `MIMETYPE` varchar(255) NOT NULL,
  `RECEIVED_SIZE` bigint(20) NOT NULL DEFAULT 0,
  `WIDTH` int(11) NOT NULL DEFAULT 0,
  `HEIGHT` int(11) NOT NULL DEFAULT 0,
  `BUCKET_ID` int(11) DEFAULT NULL,
  `MODULE_ID` varchar(50) NOT NULL,
  `CONTROLLER` varchar(255) NOT NULL,
  `CLOUD` tinyint(1) NOT NULL DEFAULT 0,
  `UPLOADED` tinyint(1) NOT NULL DEFAULT 0,
  `DELETED` tinyint(1) NOT NULL DEFAULT 0,
  `CREATED_BY` int(11) NOT NULL DEFAULT 0,
  `CREATED_AT` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_UI_UPLOADER_GUID` (`GUID`),
  KEY `IX_B_UI_UPLOADER_FILE_ID` (`FILE_ID`),
  KEY `IX_B_UI_UPLOADER_CREATED_AT` (`CREATED_AT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_ui_file_uploader_temp_file`
--

LOCK TABLES `b_ui_file_uploader_temp_file` WRITE;
/*!40000 ALTER TABLE `b_ui_file_uploader_temp_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_ui_file_uploader_temp_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_undo`
--

DROP TABLE IF EXISTS `b_undo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_undo` (
  `ID` varchar(255) NOT NULL,
  `MODULE_ID` varchar(50) DEFAULT NULL,
  `UNDO_TYPE` varchar(50) DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) DEFAULT NULL,
  `CONTENT` mediumtext DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_undo`
--

LOCK TABLES `b_undo` WRITE;
/*!40000 ALTER TABLE `b_undo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_undo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_urlpreview_metadata`
--

DROP TABLE IF EXISTS `b_urlpreview_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) NOT NULL,
  `TYPE` char(1) NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) DEFAULT NULL,
  `EMBED` mediumtext DEFAULT NULL,
  `EXTRA` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_urlpreview_metadata`
--

LOCK TABLES `b_urlpreview_metadata` WRITE;
/*!40000 ALTER TABLE `b_urlpreview_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_urlpreview_route`
--

DROP TABLE IF EXISTS `b_urlpreview_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) NOT NULL,
  `MODULE` varchar(50) NOT NULL,
  `CLASS` varchar(150) NOT NULL,
  `PARAMETERS` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_urlpreview_route`
--

LOCK TABLES `b_urlpreview_route` WRITE;
/*!40000 ALTER TABLE `b_urlpreview_route` DISABLE KEYS */;
INSERT INTO `b_urlpreview_route` VALUES (1,'/knowledge/#knowledgeCode#/','landing','\\Bitrix\\Landing\\Landing\\UrlPreview','a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:9:\"knowledge\";s:12:\"allowSlashes\";s:1:\"N\";}'),(2,'/knowledge/group/#knowledgeCode#/','landing','\\Bitrix\\Landing\\Landing\\UrlPreview','a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:5:\"group\";s:12:\"allowSlashes\";s:1:\"N\";}');
/*!40000 ALTER TABLE `b_urlpreview_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user`
--

DROP TABLE IF EXISTS `b_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `LOGIN` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `CHECKWORD` varchar(255) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) DEFAULT NULL,
  `PERSONAL_GENDER` char(1) DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) DEFAULT NULL,
  `PERSONAL_STREET` text DEFAULT NULL,
  `PERSONAL_MAILBOX` varchar(255) DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) DEFAULT NULL,
  `PERSONAL_NOTES` text DEFAULT NULL,
  `WORK_COMPANY` varchar(255) DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) DEFAULT NULL,
  `WORK_POSITION` varchar(255) DEFAULT NULL,
  `WORK_WWW` varchar(255) DEFAULT NULL,
  `WORK_PHONE` varchar(255) DEFAULT NULL,
  `WORK_FAX` varchar(255) DEFAULT NULL,
  `WORK_PAGER` varchar(255) DEFAULT NULL,
  `WORK_STREET` text DEFAULT NULL,
  `WORK_MAILBOX` varchar(255) DEFAULT NULL,
  `WORK_CITY` varchar(255) DEFAULT NULL,
  `WORK_STATE` varchar(255) DEFAULT NULL,
  `WORK_ZIP` varchar(255) DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) DEFAULT NULL,
  `WORK_PROFILE` text DEFAULT NULL,
  `WORK_LOGO` int(11) DEFAULT NULL,
  `WORK_NOTES` text DEFAULT NULL,
  `ADMIN_NOTES` text DEFAULT NULL,
  `STORED_HASH` varchar(32) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(11) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) DEFAULT NULL,
  `TIME_ZONE` varchar(50) DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `BX_USER_ID` varchar(32) DEFAULT NULL,
  `LANGUAGE_ID` char(2) DEFAULT NULL,
  `BLOCKED` char(1) NOT NULL DEFAULT 'N',
  `PASSWORD_EXPIRED` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`),
  KEY `ix_user_last_login` (`LAST_LOGIN`),
  KEY `ix_user_date_register` (`DATE_REGISTER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user`
--

LOCK TABLES `b_user` WRITE;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` VALUES (1,'2024-02-07 11:18:54','admin','$6$vNmeEsSFQigMwTc2$LtmRV/OLQHkUPBrn4UxJDrXAZsUP74VgGDcXHAnhagjTqVV.qFKl1TrzLtJx4uiuxd8DTrnavkWdDjLT.2/Pw0','$6$cmMJjOMptb7cUi7z$nN0rh9LF8DN9lfzDN8f7bK02xYaVxSnDugBIGme4y/rBs/v0LhJU09sZzhfzeLOKt6hKO/5tFE0EsB6TgGd.V.','Y','Максим','Севастьянов','enot07142004@gmail.com','2024-03-21 11:58:04','2024-02-07 14:18:54',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-07 14:18:54',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'c1479594e2f706a301b401cb0c533b0d',NULL,'N','N');
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_access`
--

DROP TABLE IF EXISTS `b_user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_access` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) DEFAULT NULL,
  `ACCESS_CODE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`),
  KEY `ix_ua_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_access`
--

LOCK TABLES `b_user_access` WRITE;
/*!40000 ALTER TABLE `b_user_access` DISABLE KEYS */;
INSERT INTO `b_user_access` VALUES (1,0,'group','G2'),(2,1,'group','G1'),(3,1,'group','G3'),(4,1,'group','G4'),(5,1,'group','G2'),(9,1,'user','U1');
/*!40000 ALTER TABLE `b_user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_access_check`
--

DROP TABLE IF EXISTS `b_user_access_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) DEFAULT NULL,
  UNIQUE KEY `ux_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_access_check`
--

LOCK TABLES `b_user_access_check` WRITE;
/*!40000 ALTER TABLE `b_user_access_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_access_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_auth_action`
--

DROP TABLE IF EXISTS `b_user_auth_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT 100,
  `ACTION` varchar(20) DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_auth_action`
--

LOCK TABLES `b_user_auth_action` WRITE;
/*!40000 ALTER TABLE `b_user_auth_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_auth_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_auth_code`
--

DROP TABLE IF EXISTS `b_user_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_auth_code` (
  `USER_ID` int(11) NOT NULL,
  `CODE_TYPE` varchar(20) NOT NULL DEFAULT 'email',
  `OTP_SECRET` text DEFAULT NULL,
  `ATTEMPTS` int(11) DEFAULT 0,
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_auth_code`
--

LOCK TABLES `b_user_auth_code` WRITE;
/*!40000 ALTER TABLE `b_user_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_counter`
--

DROP TABLE IF EXISTS `b_user_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_counter` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SITE_ID` char(2) NOT NULL DEFAULT '**',
  `CODE` varchar(50) NOT NULL,
  `CNT` int(11) NOT NULL DEFAULT 0,
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) DEFAULT NULL,
  `PARAMS` text DEFAULT NULL,
  `SENT` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_counter_user_site_code` (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_counter`
--

LOCK TABLES `b_user_counter` WRITE;
/*!40000 ALTER TABLE `b_user_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_device`
--

DROP TABLE IF EXISTS `b_user_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_device` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) unsigned NOT NULL,
  `DEVICE_UID` varchar(50) NOT NULL,
  `DEVICE_TYPE` int(10) unsigned NOT NULL DEFAULT 0,
  `BROWSER` varchar(100) DEFAULT NULL,
  `PLATFORM` varchar(25) DEFAULT NULL,
  `USER_AGENT` varchar(1000) DEFAULT NULL,
  `COOKABLE` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_device_user` (`USER_ID`,`DEVICE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_device`
--

LOCK TABLES `b_user_device` WRITE;
/*!40000 ALTER TABLE `b_user_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_device_login`
--

DROP TABLE IF EXISTS `b_user_device_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_device_login` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` bigint(20) unsigned NOT NULL,
  `LOGIN_DATE` datetime DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `CITY_GEOID` bigint(20) DEFAULT NULL,
  `REGION_GEOID` bigint(20) DEFAULT NULL,
  `COUNTRY_ISO_CODE` varchar(10) DEFAULT NULL,
  `APP_PASSWORD_ID` bigint(20) unsigned DEFAULT NULL,
  `STORED_AUTH_ID` bigint(20) unsigned DEFAULT NULL,
  `HIT_AUTH_ID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_device_login_device` (`DEVICE_ID`),
  KEY `ix_user_device_login_date` (`LOGIN_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_device_login`
--

LOCK TABLES `b_user_device_login` WRITE;
/*!40000 ALTER TABLE `b_user_device_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_device_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_digest`
--

DROP TABLE IF EXISTS `b_user_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_digest`
--

LOCK TABLES `b_user_digest` WRITE;
/*!40000 ALTER TABLE `b_user_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field`
--

DROP TABLE IF EXISTS `b_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(50) DEFAULT NULL,
  `FIELD_NAME` varchar(50) DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) DEFAULT NULL,
  `XML_ID` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) NOT NULL DEFAULT 'N',
  `SETTINGS` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field`
--

LOCK TABLES `b_user_field` WRITE;
/*!40000 ALTER TABLE `b_user_field` DISABLE KEYS */;
INSERT INTO `b_user_field` VALUES (1,'BLOG_POST','UF_BLOG_POST_DOC','file','UF_BLOG_POST_DOC',100,'Y','N','N','N','Y','Y','a:0:{}'),(2,'BLOG_COMMENT','UF_BLOG_COMMENT_DOC','file','UF_BLOG_COMMENT_DOC',100,'Y','N','N','N','Y','Y','a:0:{}'),(3,'BLOG_POST','UF_BLOG_POST_URL_PRV','url_preview','UF_BLOG_POST_URL_PRV',100,'N','N','N','N','Y','Y','a:0:{}'),(4,'BLOG_COMMENT','UF_BLOG_COMM_URL_PRV','url_preview','UF_BLOG_COMM_URL_PRV',100,'N','N','N','N','Y','Y','a:0:{}'),(5,'BLOG_POST','UF_GRATITUDE','integer','UF_GRATITUDE',100,'N','N','N','N','Y','N','a:0:{}'),(6,'FORUM_MESSAGE','UF_FORUM_MES_URL_PRV','url_preview','UF_FORUM_MES_URL_PRV',100,'N','N','N','N','Y','N','a:0:{}'),(7,'FORUM_MESSAGE','UF_TASK_COMMENT_TYPE','integer','UF_TASK_COMMENT_TYPE',100,'N','N','N','N','Y','N','a:0:{}');
/*!40000 ALTER TABLE `b_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_confirm`
--

DROP TABLE IF EXISTS `b_user_field_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FIELD` varchar(255) NOT NULL,
  `FIELD_VALUE` varchar(255) NOT NULL,
  `CONFIRM_CODE` varchar(32) NOT NULL,
  `ATTEMPTS` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_confirm`
--

LOCK TABLES `b_user_field_confirm` WRITE;
/*!40000 ALTER TABLE `b_user_field_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_enum`
--

DROP TABLE IF EXISTS `b_user_field_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DEF` char(1) NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `XML_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_enum`
--

LOCK TABLES `b_user_field_enum` WRITE;
/*!40000 ALTER TABLE `b_user_field_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_lang`
--

DROP TABLE IF EXISTS `b_user_field_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_lang`
--

LOCK TABLES `b_user_field_lang` WRITE;
/*!40000 ALTER TABLE `b_user_field_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_field_permission`
--

DROP TABLE IF EXISTS `b_user_field_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_field_permission` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` tinyint(3) unsigned NOT NULL,
  `USER_FIELD_ID` int(10) unsigned NOT NULL,
  `ACCESS_CODE` varchar(8) NOT NULL,
  `PERMISSION_ID` varchar(32) NOT NULL,
  `VALUE` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  KEY `GROUP_ID` (`USER_FIELD_ID`),
  KEY `PERMISSION_ID` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_field_permission`
--

LOCK TABLES `b_user_field_permission` WRITE;
/*!40000 ALTER TABLE `b_user_field_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_group`
--

DROP TABLE IF EXISTS `b_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_group` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_group`
--

LOCK TABLES `b_user_group` WRITE;
/*!40000 ALTER TABLE `b_user_group` DISABLE KEYS */;
INSERT INTO `b_user_group` VALUES (1,1,NULL,NULL),(1,3,NULL,NULL),(1,4,NULL,NULL);
/*!40000 ALTER TABLE `b_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_hit_auth`
--

DROP TABLE IF EXISTS `b_user_hit_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `HASH` varchar(32) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `SITE_ID` char(2) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `VALID_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_hit_auth`
--

LOCK TABLES `b_user_hit_auth` WRITE;
/*!40000 ALTER TABLE `b_user_hit_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_hit_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_index`
--

DROP TABLE IF EXISTS `b_user_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text DEFAULT NULL,
  `SEARCH_DEPARTMENT_CONTENT` text DEFAULT NULL,
  `SEARCH_ADMIN_CONTENT` text DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `SECOND_NAME` varchar(50) DEFAULT NULL,
  `WORK_POSITION` varchar(255) DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_index`
--

LOCK TABLES `b_user_index` WRITE;
/*!40000 ALTER TABLE `b_user_index` DISABLE KEYS */;
INSERT INTO `b_user_index` VALUES (1,'001 Максим Севастьянов ','','001 Максим Севастьянов rabg07142004 tznvy pbz rabg07142004@tznvy.pbz nqzva','Максим','Севастьянов','','','');
/*!40000 ALTER TABLE `b_user_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_option`
--

DROP TABLE IF EXISTS `b_user_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` mediumtext DEFAULT NULL,
  `COMMON` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=769 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_option`
--

LOCK TABLES `b_user_option` WRITE;
/*!40000 ALTER TABLE `b_user_option` DISABLE KEYS */;
INSERT INTO `b_user_option` VALUES (1,0,'intranet','~gadgets_admin_index','a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}','Y'),(2,0,'main.interface','global','a:1:{s:5:\"theme\";s:4:\"blue\";}','Y'),(3,1,'admin_panel','settings','a:2:{s:4:\"edit\";s:3:\"off\";s:9:\"collapsed\";s:3:\"off\";}','N'),(4,1,'hot_keys','user_defined','b:1;','N'),(5,1,'favorite','favorite_menu','a:1:{s:5:\"stick\";s:1:\"N\";}','N'),(6,1,'socialservices','networkPopup','a:2:{s:9:\"showcount\";s:1:\"4\";s:8:\"dontshow\";s:1:\"Y\";}','N'),(11,1,'admin_menu','pos','a:1:{s:8:\"sections\";s:244:\"menu_landing,menu_system,menu_fileman,menu_fileman_file_s1_,menu_iblock,iblock_redirect,iblock_admin,menu_iblock_%2Fcomments%2F5,menu_iblock_/comments,menu_iblock_%2Fcomments%2F17,menu_iblock_%2Fproducts%2F3,menu_iblock_%2Faction%2F18,menu_site\";}','N'),(24,1,'fileman','file_dialog_config','s:32:\"s1;/company/otzyvy;list;type;asc\";','N'),(29,1,'intranet','~gadgets_admin_index','a:1:{i:0;a:1:{s:7:\"GADGETS\";a:2:{s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}}}}','N'),(63,1,'html_editor','user_settings_','a:10:{s:4:\"view\";s:5:\"split\";s:14:\"split_vertical\";s:1:\"0\";s:16:\"link_dialog_type\";s:8:\"internal\";s:17:\"clean_empty_spans\";s:1:\"Y\";s:18:\"paste_clear_colors\";s:1:\"Y\";s:19:\"paste_clear_borders\";s:1:\"Y\";s:17:\"paste_clear_decor\";s:1:\"Y\";s:23:\"paste_clear_table_dimen\";s:1:\"Y\";s:13:\"show_snippets\";s:1:\"Y\";s:13:\"taskbar_shown\";s:1:\"1\";}','N'),(64,1,'fileman','medialib_user_set','s:9:\"600,450,1\";','N'),(81,1,'fileman','code_editor','a:1:{s:5:\"theme\";s:5:\"light\";}','N'),(214,1,'bx.windowmanager.9.5','options_bf8a714c8e51606ec2a1d8273528c22d','a:4:{s:3:\"pin\";s:5:\"false\";s:9:\"transform\";s:5:\"false\";s:3:\"top\";s:5:\"false\";s:4:\"left\";s:5:\"false\";}','N'),(265,1,'main.interface.grid','tbl_iblock_admin_a5d491060952aa8ad5fdee071be752de','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:4:{s:7:\"columns\";s:73:\"NAME,SORT,ACTIVE,ELEMENT_CNT,SECTION_CNT,LID,INDEX_ELEMENT,TIMESTAMP_X,ID\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}s:12:\"custom_names\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(277,1,'main.interface.grid','tbl_iblock_admin_86024cad1e83101d97359d7351051156','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(278,1,'main.interface.grid','tbl_iblock_admin_508c75c8507a2ae5223dfd2faeb98122','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(281,1,'main.ui.filter','tbl_iblock_element_5c0681f8ed0bce9142bc000670b61a05','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:2:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}s:14:\"default_filter\";a:0:{}}}','N'),(286,1,'main.interface.grid','tbl_iblock_element_5c0681f8ed0bce9142bc000670b61a05','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:5:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}s:12:\"last_sort_by\";s:4:\"name\";s:15:\"last_sort_order\";s:3:\"asc\";}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(292,1,'main.ui.filter','tbl_iblock_section_5c0681f8ed0bce9142bc000670b61a05','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}','N'),(298,1,'main.interface.grid','tbl_iblock_section_5c0681f8ed0bce9142bc000670b61a05','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(323,1,'main.interface.grid','tbl_iblock_a5d491060952aa8ad5fdee071be752de','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:6:{s:7:\"columns\";s:73:\"NAME,SORT,ACTIVE,ELEMENT_CNT,SECTION_CNT,LID,INDEX_ELEMENT,TIMESTAMP_X,ID\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}s:12:\"last_sort_by\";s:4:\"name\";s:15:\"last_sort_order\";s:4:\"desc\";s:12:\"custom_names\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(404,1,'main.ui.filter','tbl_iblock_element_129f0fb7e05f8569addcc69fdfedaa63','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:2:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}s:14:\"default_filter\";a:0:{}}}','N'),(409,1,'main.interface.grid','tbl_iblock_element_129f0fb7e05f8569addcc69fdfedaa63','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(410,1,'main.ui.filter','tbl_iblock_section_129f0fb7e05f8569addcc69fdfedaa63','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}','N'),(416,1,'main.interface.grid','tbl_iblock_section_129f0fb7e05f8569addcc69fdfedaa63','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:4:{s:7:\"columns\";s:54:\"NAME,ACTIVE,SORT,ELEMENT_CNT,TIMESTAMP_X,CREATED_BY,ID\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}s:12:\"custom_names\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(511,1,'main.ui.filter','tbl_iblock_element_c94f0c83c29e83ac5368795bd39d64bf','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:14:\"default_filter\";a:0:{}}}','N'),(516,1,'main.interface.grid','tbl_iblock_element_c94f0c83c29e83ac5368795bd39d64bf','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(517,1,'main.ui.filter','tbl_iblock_section_c94f0c83c29e83ac5368795bd39d64bf','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}','N'),(523,1,'main.interface.grid','tbl_iblock_section_c94f0c83c29e83ac5368795bd39d64bf','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(524,1,'main.interface.grid','tbl_iblock_86024cad1e83101d97359d7351051156','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(525,1,'main.ui.filter','tbl_iblock_section_83282f8abe10dba1648858eafb93e3f2','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}','N'),(531,1,'main.interface.grid','tbl_iblock_section_83282f8abe10dba1648858eafb93e3f2','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(566,1,'main.interface.grid','tbl_iblock_admin_418c5509e2171d55b0aee5c2ea4442b5','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(567,1,'main.ui.filter','tbl_iblock_element_ebcbe6f907d0023032b76fafc8f79140','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:2:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}s:14:\"default_filter\";a:0:{}}}','N'),(572,1,'main.interface.grid','tbl_iblock_element_ebcbe6f907d0023032b76fafc8f79140','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(573,1,'main.ui.filter','tbl_iblock_section_ebcbe6f907d0023032b76fafc8f79140','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}','N'),(579,1,'main.interface.grid','tbl_iblock_section_ebcbe6f907d0023032b76fafc8f79140','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(580,1,'main.interface.grid','tbl_iblock_418c5509e2171d55b0aee5c2ea4442b5','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(586,1,'main.interface.grid','tbl_iblock_f4145c86ca60004968b7b2900161d03e','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(616,1,'main.interface.grid','tbl_iblock_element_d1cb75b5aaf00401fd4a48cc75b13ebc','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(617,1,'main.interface.grid','tbl_iblock_508c75c8507a2ae5223dfd2faeb98122','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(620,1,'bx.windowmanager.9.5','options_undefined','a:4:{s:3:\"pin\";s:9:\"undefined\";s:3:\"top\";s:5:\"false\";s:4:\"left\";s:5:\"false\";s:9:\"transform\";s:5:\"false\";}','N'),(643,1,'main.interface.grid','tbl_iblock_property_admin_2','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(658,1,'bx.windowmanager.9.5','size_/bitrix/admin/component_props.php','a:2:{s:5:\"width\";s:3:\"986\";s:6:\"height\";s:3:\"466\";}','N'),(698,1,'main.ui.filter','tbl_iblock_element_83282f8abe10dba1648858eafb93e3f2','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:14:\"default_filter\";a:0:{}}}','N'),(703,1,'main.interface.grid','tbl_iblock_element_83282f8abe10dba1648858eafb93e3f2','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(738,1,'main.ui.filter','translate_filter','a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:1:{s:6:\"fields\";a:0:{}}}}','N'),(739,1,'main.interface.grid','translate_list','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:5:{i:0;s:5:\"TITLE\";i:1;s:4:\"PATH\";i:2;s:11:\"PHRASE_CODE\";i:3;s:7:\"RU_LANG\";i:4;s:7:\"EN_LANG\";}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N'),(746,1,'start_menu','recent','a:1:{i:0;a:4:{s:3:\"url\";s:57:\"/bitrix/admin/translate_list.php?lang=ru&back_url_pub=%2F\";s:4:\"text\";s:29:\"Просмотр файлов\";s:5:\"title\";s:84:\"Интерфейс для редактирования языковых файлов\";s:4:\"icon\";s:9:\"undefined\";}}','N'),(757,1,'list','tbl_language','a:4:{s:7:\"columns\";s:28:\"ID,ACTIVE,SORT,NAME,CODE,DEF\";s:2:\"by\";s:4:\"sort\";s:5:\"order\";s:3:\"asc\";s:9:\"page_size\";s:2:\"10\";}','N'),(758,0,'list','tbl_language','a:4:{s:7:\"columns\";s:28:\"ID,ACTIVE,SORT,NAME,CODE,DEF\";s:2:\"by\";s:4:\"sort\";s:5:\"order\";s:3:\"asc\";s:9:\"page_size\";s:2:\"10\";}','Y'),(763,1,'filter','tbl_hk_codes_filter','a:1:{s:4:\"rows\";s:1:\"0\";}','N'),(766,1,'main.interface.grid','MAIN_USER_CONSENT_AGREEMENT_GRID','a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}','N');
/*!40000 ALTER TABLE `b_user_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_password`
--

DROP TABLE IF EXISTS `b_user_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_password` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_password`
--

LOCK TABLES `b_user_password` WRITE;
/*!40000 ALTER TABLE `b_user_password` DISABLE KEYS */;
INSERT INTO `b_user_password` VALUES (1,1,'$6$vNmeEsSFQigMwTc2$LtmRV/OLQHkUPBrn4UxJDrXAZsUP74VgGDcXHAnhagjTqVV.qFKl1TrzLtJx4uiuxd8DTrnavkWdDjLT.2/Pw0','2024-02-07 14:18:54');
/*!40000 ALTER TABLE `b_user_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_phone_auth`
--

DROP TABLE IF EXISTS `b_user_phone_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_phone_auth` (
  `USER_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(25) NOT NULL,
  `OTP_SECRET` text DEFAULT NULL,
  `ATTEMPTS` int(11) DEFAULT 0,
  `CONFIRMED` char(1) DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_phone_auth`
--

LOCK TABLES `b_user_phone_auth` WRITE;
/*!40000 ALTER TABLE `b_user_phone_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_phone_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_profile_history`
--

DROP TABLE IF EXISTS `b_user_profile_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_profile_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) DEFAULT NULL,
  `USER_AGENT` text DEFAULT NULL,
  `REQUEST_URI` text DEFAULT NULL,
  `UPDATED_BY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`),
  KEY `ix_profile_history_date` (`DATE_INSERT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_profile_history`
--

LOCK TABLES `b_user_profile_history` WRITE;
/*!40000 ALTER TABLE `b_user_profile_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_profile_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_profile_record`
--

DROP TABLE IF EXISTS `b_user_profile_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_profile_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int(11) NOT NULL,
  `FIELD` varchar(40) DEFAULT NULL,
  `DATA` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_profile_record`
--

LOCK TABLES `b_user_profile_record` WRITE;
/*!40000 ALTER TABLE `b_user_profile_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_profile_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_session`
--

DROP TABLE IF EXISTS `b_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_session` (
  `SESSION_ID` varchar(250) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SESSION_DATA` longtext DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_user_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_session`
--

LOCK TABLES `b_user_session` WRITE;
/*!40000 ALTER TABLE `b_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_user_stored_auth`
--

DROP TABLE IF EXISTS `b_user_stored_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) NOT NULL,
  `TEMP_HASH` char(1) NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_user_stored_auth`
--

LOCK TABLES `b_user_stored_auth` WRITE;
/*!40000 ALTER TABLE `b_user_stored_auth` DISABLE KEYS */;
INSERT INTO `b_user_stored_auth` VALUES (1,1,'2024-02-07 14:18:54','2024-02-07 14:18:54','gFPNOXV6aY3ttrGQJHh05lrzVFJ6XSbs','N',1306427194),(2,1,'2024-02-13 08:01:45','2024-02-18 18:25:02','OxLjfqY0S26AXN7bYTZU5nLEhplYS4JW','N',1306427194);
/*!40000 ALTER TABLE `b_user_stored_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_blog_comment`
--

DROP TABLE IF EXISTS `b_utm_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`),
  KEY `ix_utm_BLOG_COMMENT_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_blog_comment`
--

LOCK TABLES `b_utm_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_utm_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_blog_post`
--

DROP TABLE IF EXISTS `b_utm_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`),
  KEY `ix_utm_BLOG_POST_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_blog_post`
--

LOCK TABLES `b_utm_blog_post` WRITE;
/*!40000 ALTER TABLE `b_utm_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_utm_forum_message`
--

DROP TABLE IF EXISTS `b_utm_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_utm_forum_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`),
  KEY `ix_utm_FORUM_MESSAGE_4` (`FIELD_ID`,`VALUE_ID`,`VALUE_INT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_utm_forum_message`
--

LOCK TABLES `b_utm_forum_message` WRITE;
/*!40000 ALTER TABLE `b_utm_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_blog_comment`
--

DROP TABLE IF EXISTS `b_uts_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text DEFAULT NULL,
  `UF_BLOG_COMM_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_blog_comment`
--

LOCK TABLES `b_uts_blog_comment` WRITE;
/*!40000 ALTER TABLE `b_uts_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_blog_post`
--

DROP TABLE IF EXISTS `b_uts_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text DEFAULT NULL,
  `UF_BLOG_POST_URL_PRV` int(11) DEFAULT NULL,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_blog_post`
--

LOCK TABLES `b_uts_blog_post` WRITE;
/*!40000 ALTER TABLE `b_uts_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_uts_forum_message`
--

DROP TABLE IF EXISTS `b_uts_forum_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_uts_forum_message` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_FORUM_MES_URL_PRV` int(11) DEFAULT NULL,
  `UF_TASK_COMMENT_TYPE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_uts_forum_message`
--

LOCK TABLES `b_uts_forum_message` WRITE;
/*!40000 ALTER TABLE `b_uts_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_forum_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote`
--

DROP TABLE IF EXISTS `b_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `ANONYMITY` int(11) NOT NULL DEFAULT 0,
  `NOTIFY` char(1) NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `DATE_START` datetime NOT NULL,
  `DATE_END` datetime NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `DESCRIPTION_TYPE` varchar(4) NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) DEFAULT NULL,
  `EVENT2` varchar(255) DEFAULT NULL,
  `EVENT3` varchar(255) DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT 2,
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `OPTIONS` int(18) DEFAULT 1,
  `TEMPLATE` varchar(255) DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote`
--

LOCK TABLES `b_vote` WRITE;
/*!40000 ALTER TABLE `b_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_answer`
--

DROP TABLE IF EXISTS `b_vote_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `MESSAGE` text DEFAULT NULL,
  `MESSAGE_TYPE` varchar(4) NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT 0,
  `FIELD_TYPE` int(5) NOT NULL DEFAULT 0,
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) DEFAULT NULL,
  `COLOR` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_answer`
--

LOCK TABLES `b_vote_answer` WRITE;
/*!40000 ALTER TABLE `b_vote_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_attached_object`
--

DROP TABLE IF EXISTS `b_vote_attached_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_attached_object` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(32) NOT NULL,
  `ENTITY_TYPE` varchar(100) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_AO_1` (`OBJECT_ID`),
  KEY `IX_VOTE_AO_2` (`MODULE_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_attached_object`
--

LOCK TABLES `b_vote_attached_object` WRITE;
/*!40000 ALTER TABLE `b_vote_attached_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_attached_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel`
--

DROP TABLE IF EXISTS `b_vote_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) NOT NULL,
  `C_SORT` int(18) DEFAULT 100,
  `FIRST_SITE_ID` char(2) DEFAULT NULL,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `VOTE_SINGLE` char(1) NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel`
--

LOCK TABLES `b_vote_channel` WRITE;
/*!40000 ALTER TABLE `b_vote_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel_2_group`
--

DROP TABLE IF EXISTS `b_vote_channel_2_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel_2_group`
--

LOCK TABLES `b_vote_channel_2_group` WRITE;
/*!40000 ALTER TABLE `b_vote_channel_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_channel_2_site`
--

DROP TABLE IF EXISTS `b_vote_channel_2_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_channel_2_site`
--

LOCK TABLES `b_vote_channel_2_site` WRITE;
/*!40000 ALTER TABLE `b_vote_channel_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event`
--

DROP TABLE IF EXISTS `b_vote_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT 0,
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT 0,
  `DATE_VOTE` datetime NOT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `VALID` char(1) NOT NULL DEFAULT 'Y',
  `VISIBLE` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event`
--

LOCK TABLES `b_vote_event` WRITE;
/*!40000 ALTER TABLE `b_vote_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event_answer`
--

DROP TABLE IF EXISTS `b_vote_event_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  `ANSWER_ID` int(18) NOT NULL DEFAULT 0,
  `MESSAGE` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event_answer`
--

LOCK TABLES `b_vote_event_answer` WRITE;
/*!40000 ALTER TABLE `b_vote_event_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_event_question`
--

DROP TABLE IF EXISTS `b_vote_event_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT 0,
  `QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_event_question`
--

LOCK TABLES `b_vote_event_question` WRITE;
/*!40000 ALTER TABLE `b_vote_event_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_question`
--

DROP TABLE IF EXISTS `b_vote_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `VOTE_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `QUESTION` text NOT NULL,
  `QUESTION_TYPE` varchar(4) NOT NULL DEFAULT 'html',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT 0,
  `REQUIRED` char(1) NOT NULL DEFAULT 'N',
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `DIAGRAM` char(1) NOT NULL DEFAULT 'Y',
  `DIAGRAM_TYPE` varchar(10) NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_question`
--

LOCK TABLES `b_vote_question` WRITE;
/*!40000 ALTER TABLE `b_vote_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_vote_user`
--

DROP TABLE IF EXISTS `b_vote_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `COOKIE_ID` int(18) NOT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT 0,
  `DATE_FIRST` datetime NOT NULL,
  `DATE_LAST` datetime NOT NULL,
  `LAST_IP` varchar(15) DEFAULT NULL,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_VOTE_COOKIE_USER` (`COOKIE_ID`,`AUTH_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_vote_user`
--

LOCK TABLES `b_vote_user` WRITE;
/*!40000 ALTER TABLE `b_vote_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_xml_tree`
--

DROP TABLE IF EXISTS `b_xml_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `b_xml_tree` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUE` longtext DEFAULT NULL,
  `ATTRIBUTES` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_xml_tree`
--

LOCK TABLES `b_xml_tree` WRITE;
/*!40000 ALTER TABLE `b_xml_tree` DISABLE KEYS */;
INSERT INTO `b_xml_tree` VALUES (1,0,1,320,0,'КоммерческаяИнформация',NULL,'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2010-06-22T12:53:42\";}'),(2,1,2,67,1,'Классификатор',NULL,NULL),(3,2,3,4,2,'Ид','2',NULL),(4,2,5,6,2,'Наименование','Вакансии',NULL),(5,2,7,64,2,'Свойства',NULL,NULL),(6,5,8,15,3,'Свойство',NULL,NULL),(7,6,9,10,4,'Ид','CML2_ACTIVE',NULL),(8,6,11,12,4,'Наименование','БитриксАктивность',NULL),(9,6,13,14,4,'Множественное','false',NULL),(10,5,16,23,3,'Свойство',NULL,NULL),(11,10,17,18,4,'Ид','CML2_CODE',NULL),(12,10,19,20,4,'Наименование','Символьный код',NULL),(13,10,21,22,4,'Множественное','false',NULL),(14,5,24,31,3,'Свойство',NULL,NULL),(15,14,25,26,4,'Ид','CML2_SORT',NULL),(16,14,27,28,4,'Наименование','Сортировка',NULL),(17,14,29,30,4,'Множественное','false',NULL),(18,5,32,39,3,'Свойство',NULL,NULL),(19,18,33,34,4,'Ид','CML2_ACTIVE_FROM',NULL),(20,18,35,36,4,'Наименование','Начало активности',NULL),(21,18,37,38,4,'Множественное','false',NULL),(22,5,40,47,3,'Свойство',NULL,NULL),(23,22,41,42,4,'Ид','CML2_ACTIVE_TO',NULL),(24,22,43,44,4,'Наименование','Окончание активности',NULL),(25,22,45,46,4,'Множественное','false',NULL),(26,5,48,55,3,'Свойство',NULL,NULL),(27,26,49,50,4,'Ид','CML2_PREVIEW_TEXT',NULL),(28,26,51,52,4,'Наименование','Анонс',NULL),(29,26,53,54,4,'Множественное','false',NULL),(30,5,56,63,3,'Свойство',NULL,NULL),(31,30,57,58,4,'Ид','CML2_PREVIEW_PICTURE',NULL),(32,30,59,60,4,'Наименование','Картинка анонса',NULL),(33,30,61,62,4,'Множественное','false',NULL),(34,2,65,66,2,'Группы',NULL,NULL),(35,1,68,319,1,'Каталог',NULL,NULL),(36,35,69,70,2,'Ид','furniture_vacancies',NULL),(37,35,71,72,2,'ИдКлассификатора','2',NULL),(38,35,73,74,2,'Наименование','Вакансии',NULL),(39,35,75,76,2,'БитриксКод','furniture_vacancies',NULL),(40,35,77,78,2,'БитриксСортировка','500',NULL),(41,35,79,80,2,'БитриксURLСписок','#SITE_DIR#/company/vacancies.php',NULL),(42,35,81,82,2,'БитриксURLДеталь','#SITE_DIR#/company/vacancies.php##ID#',NULL),(43,35,83,84,2,'БитриксURLРаздел',NULL,NULL),(44,35,85,86,2,'БитриксКартинка',NULL,NULL),(45,35,87,88,2,'БитриксИндексироватьЭлементы','true',NULL),(46,35,89,90,2,'БитриксИндексироватьРазделы','false',NULL),(47,35,91,92,2,'БитриксДокументооборот','false',NULL),(48,35,93,154,2,'БитриксПодписи',NULL,NULL),(49,48,94,99,3,'БитриксПодпись',NULL,NULL),(50,49,95,96,4,'Ид','ELEMENT_NAME',NULL),(51,49,97,98,4,'Значение','Вакансия',NULL),(52,48,100,105,3,'БитриксПодпись',NULL,NULL),(53,52,101,102,4,'Ид','ELEMENTS_NAME',NULL),(54,52,103,104,4,'Значение','Вакансии',NULL),(55,48,106,111,3,'БитриксПодпись',NULL,NULL),(56,55,107,108,4,'Ид','ELEMENT_ADD',NULL),(57,55,109,110,4,'Значение','Добавить вакансию',NULL),(58,48,112,117,3,'БитриксПодпись',NULL,NULL),(59,58,113,114,4,'Ид','ELEMENT_EDIT',NULL),(60,58,115,116,4,'Значение','Изменить вакансию',NULL),(61,48,118,123,3,'БитриксПодпись',NULL,NULL),(62,61,119,120,4,'Ид','ELEMENT_DELETE',NULL),(63,61,121,122,4,'Значение','Удалить вакансию',NULL),(64,48,124,129,3,'БитриксПодпись',NULL,NULL),(65,64,125,126,4,'Ид','SECTION_NAME',NULL),(66,64,127,128,4,'Значение','Раздел',NULL),(67,48,130,135,3,'БитриксПодпись',NULL,NULL),(68,67,131,132,4,'Ид','SECTIONS_NAME',NULL),(69,67,133,134,4,'Значение','Разделы',NULL),(70,48,136,141,3,'БитриксПодпись',NULL,NULL),(71,70,137,138,4,'Ид','SECTION_ADD',NULL),(72,70,139,140,4,'Значение','Добавить раздел',NULL),(73,48,142,147,3,'БитриксПодпись',NULL,NULL),(74,73,143,144,4,'Ид','SECTION_EDIT',NULL),(75,73,145,146,4,'Значение','Изменить раздел',NULL),(76,48,148,153,3,'БитриксПодпись',NULL,NULL),(77,76,149,150,4,'Ид','SECTION_DELETE',NULL),(78,76,151,152,4,'Значение','Удалить раздел',NULL),(79,35,155,318,2,'Товары',NULL,NULL),(80,79,156,209,3,'Товар',NULL,NULL),(81,80,157,158,4,'Ид','2',NULL),(82,80,159,160,4,'Наименование','Продавец-дизайнер (кухни)',NULL),(83,80,161,162,4,'БитриксТеги',NULL,NULL),(84,80,163,164,4,'Описание','<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ',NULL),(85,80,165,208,4,'ЗначенияСвойств',NULL,NULL),(86,85,166,171,5,'ЗначенияСвойства',NULL,NULL),(87,86,167,168,6,'Ид','CML2_ACTIVE',NULL),(88,86,169,170,6,'Значение','true',NULL),(89,85,172,177,5,'ЗначенияСвойства',NULL,NULL),(90,89,173,174,6,'Ид','CML2_CODE',NULL),(91,89,175,176,6,'Значение',NULL,NULL),(92,85,178,183,5,'ЗначенияСвойства',NULL,NULL),(93,92,179,180,6,'Ид','CML2_SORT',NULL),(94,92,181,182,6,'Значение','200',NULL),(95,85,184,189,5,'ЗначенияСвойства',NULL,NULL),(96,95,185,186,6,'Ид','CML2_ACTIVE_FROM',NULL),(97,95,187,188,6,'Значение','2010-05-01 00:00:00',NULL),(98,85,190,195,5,'ЗначенияСвойства',NULL,NULL),(99,98,191,192,6,'Ид','CML2_ACTIVE_TO',NULL),(100,98,193,194,6,'Значение',NULL,NULL),(101,85,196,201,5,'ЗначенияСвойства',NULL,NULL),(102,101,197,198,6,'Ид','CML2_PREVIEW_TEXT',NULL),(103,101,199,200,6,'Значение',NULL,NULL),(104,85,202,207,5,'ЗначенияСвойства',NULL,NULL),(105,104,203,204,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(106,104,205,206,6,'Значение',NULL,NULL),(107,79,210,263,3,'Товар',NULL,NULL),(108,107,211,212,4,'Ид','3',NULL),(109,107,213,214,4,'Наименование','Директор магазина',NULL),(110,107,215,216,4,'БитриксТеги',NULL,NULL),(111,107,217,218,4,'Описание','<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ',NULL),(112,107,219,262,4,'ЗначенияСвойств',NULL,NULL),(113,112,220,225,5,'ЗначенияСвойства',NULL,NULL),(114,113,221,222,6,'Ид','CML2_ACTIVE',NULL),(115,113,223,224,6,'Значение','true',NULL),(116,112,226,231,5,'ЗначенияСвойства',NULL,NULL),(117,116,227,228,6,'Ид','CML2_CODE',NULL),(118,116,229,230,6,'Значение',NULL,NULL),(119,112,232,237,5,'ЗначенияСвойства',NULL,NULL),(120,119,233,234,6,'Ид','CML2_SORT',NULL),(121,119,235,236,6,'Значение','300',NULL),(122,112,238,243,5,'ЗначенияСвойства',NULL,NULL),(123,122,239,240,6,'Ид','CML2_ACTIVE_FROM',NULL),(124,122,241,242,6,'Значение','2010-05-01 00:00:00',NULL),(125,112,244,249,5,'ЗначенияСвойства',NULL,NULL),(126,125,245,246,6,'Ид','CML2_ACTIVE_TO',NULL),(127,125,247,248,6,'Значение',NULL,NULL),(128,112,250,255,5,'ЗначенияСвойства',NULL,NULL),(129,128,251,252,6,'Ид','CML2_PREVIEW_TEXT',NULL),(130,128,253,254,6,'Значение',NULL,NULL),(131,112,256,261,5,'ЗначенияСвойства',NULL,NULL),(132,131,257,258,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(133,131,259,260,6,'Значение',NULL,NULL),(134,79,264,317,3,'Товар',NULL,NULL),(135,134,265,266,4,'Ид','4',NULL),(136,134,267,268,4,'Наименование','Бухгалтер отдела учета готовой продукции',NULL),(137,134,269,270,4,'БитриксТеги',NULL,NULL),(138,134,271,272,4,'Описание','<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ',NULL),(139,134,273,316,4,'ЗначенияСвойств',NULL,NULL),(140,139,274,279,5,'ЗначенияСвойства',NULL,NULL),(141,140,275,276,6,'Ид','CML2_ACTIVE',NULL),(142,140,277,278,6,'Значение','true',NULL),(143,139,280,285,5,'ЗначенияСвойства',NULL,NULL),(144,143,281,282,6,'Ид','CML2_CODE',NULL),(145,143,283,284,6,'Значение',NULL,NULL),(146,139,286,291,5,'ЗначенияСвойства',NULL,NULL),(147,146,287,288,6,'Ид','CML2_SORT',NULL),(148,146,289,290,6,'Значение','400',NULL),(149,139,292,297,5,'ЗначенияСвойства',NULL,NULL),(150,149,293,294,6,'Ид','CML2_ACTIVE_FROM',NULL),(151,149,295,296,6,'Значение','2010-05-01 00:00:00',NULL),(152,139,298,303,5,'ЗначенияСвойства',NULL,NULL),(153,152,299,300,6,'Ид','CML2_ACTIVE_TO',NULL),(154,152,301,302,6,'Значение',NULL,NULL),(155,139,304,309,5,'ЗначенияСвойства',NULL,NULL),(156,155,305,306,6,'Ид','CML2_PREVIEW_TEXT',NULL),(157,155,307,308,6,'Значение',NULL,NULL),(158,139,310,315,5,'ЗначенияСвойства',NULL,NULL),(159,158,311,312,6,'Ид','CML2_PREVIEW_PICTURE',NULL),(160,158,313,314,6,'Значение',NULL,NULL),(161,0,30,0,0,'',NULL,NULL),(162,0,31,0,0,'',NULL,NULL),(163,0,32,0,0,'',NULL,NULL);
/*!40000 ALTER TABLE `b_xml_tree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-08 17:31:13
