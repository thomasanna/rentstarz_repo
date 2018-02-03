-- MySQL dump 10.15  Distrib 10.0.20-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: suitecon_selic
-- ------------------------------------------------------
-- Server version	10.0.20-MariaDB-cll-lve

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
-- Table structure for table `engine4_activity_actions`
--

DROP TABLE IF EXISTS `engine4_activity_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_actions` (
  `action_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) unsigned NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL,
  `attachment_count` smallint(3) unsigned NOT NULL DEFAULT '0',
  `comment_count` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `like_count` mediumint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `SUBJECT` (`subject_type`,`subject_id`),
  KEY `OBJECT` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_actions`
--

LOCK TABLES `engine4_activity_actions` WRITE;
/*!40000 ALTER TABLE `engine4_activity_actions` DISABLE KEYS */;
INSERT INTO `engine4_activity_actions` VALUES (1,'signup','user',2,'user',2,'','[]','2016-03-07 15:07:41',0,0,0),(2,'status','user',2,'user',2,'Hello All','[]','2016-03-07 15:08:25',0,0,0),(3,'profile_photo_update','user',1,'user',1,'{item:$subject} added a new profile photo.','[]','2016-03-29 17:16:37',1,0,0),(5,'signup','user',4,'user',4,'','[]','2016-04-05 17:24:12',0,0,0),(6,'status','user',1,'user',1,'How is everyone¬†','[]','2016-04-25 04:12:25',0,0,0),(7,'signup','user',6,'user',6,'','[]','2016-04-25 18:08:03',0,0,1),(8,'status','user',6,'user',6,'Brooklyn is getting crazy everybody. Apartments are so expensive','[]','2016-04-25 18:14:58',0,0,0),(9,'signup','user',7,'user',7,'','[]','2016-04-26 16:43:08',0,0,0),(10,'status','user',1,'user',1,'What\'s up everybody¬†','[]','2016-04-26 22:13:27',0,0,0),(11,'friends','user',6,'user',1,'{item:$object} is now friends with {item:$subject}.','[]','2016-04-26 22:30:53',0,0,0),(12,'friends','user',1,'user',6,'{item:$object} is now friends with {item:$subject}.','[]','2016-04-26 22:30:53',0,0,0);
/*!40000 ALTER TABLE `engine4_activity_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_actionsettings`
--

DROP TABLE IF EXISTS `engine4_activity_actionsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_actionsettings` (
  `user_id` int(11) unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_actionsettings`
--

LOCK TABLES `engine4_activity_actionsettings` WRITE;
/*!40000 ALTER TABLE `engine4_activity_actionsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_activity_actionsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_actiontypes`
--

DROP TABLE IF EXISTS `engine4_activity_actiontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_actiontypes` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `displayable` tinyint(1) NOT NULL DEFAULT '3',
  `attachable` tinyint(1) NOT NULL DEFAULT '1',
  `commentable` tinyint(1) NOT NULL DEFAULT '1',
  `shareable` tinyint(1) NOT NULL DEFAULT '1',
  `is_generated` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_actiontypes`
--

LOCK TABLES `engine4_activity_actiontypes` WRITE;
/*!40000 ALTER TABLE `engine4_activity_actiontypes` DISABLE KEYS */;
INSERT INTO `engine4_activity_actiontypes` VALUES ('album_photo_new','album','{item:$subject} added {var:$count} photo(s) to the album {item:$object}:',1,5,1,3,1,1),('comment_album','album','{item:$subject} commented on {item:$owner}\'s {item:$object:album}: {body:$body}',1,1,1,1,1,0),('comment_album_photo','album','{item:$subject} commented on {item:$owner}\'s {item:$object:photo}: {body:$body}',1,1,1,1,1,0),('friends','user','{item:$subject} is now friends with {item:$object}.',1,3,0,1,1,1),('friends_follow','user','{item:$subject} is now following {item:$object}.',1,3,0,1,1,1),('group_create','group','{item:$subject} created a new group:',1,5,1,1,1,1),('group_join','group','{item:$subject} joined the group {item:$object}',1,3,1,1,1,1),('group_photo_upload','group','{item:$subject} added {var:$count} photo(s).',1,3,2,1,1,1),('group_promote','group','{item:$subject} has been made an officer for the group {item:$object}',1,3,1,1,1,1),('group_topic_create','group','{item:$subject} posted a {itemChild:$object:topic:$child_id} in the group {item:$object}: {body:$body}',1,3,1,1,1,1),('group_topic_reply','group','{item:$subject} replied to a {itemChild:$object:topic:$child_id} in the group {item:$object}: {body:$body}',1,3,1,1,1,1),('login','user','{item:$subject} has signed in.',0,1,0,1,1,1),('logout','user','{item:$subject} has signed out.',0,1,0,1,1,1),('network_join','network','{item:$subject} joined the network {item:$object}',1,3,1,1,1,1),('post','user','{actors:$subject:$object}: {body:$body}',1,7,1,4,1,0),('post_self','user','{item:$subject} {body:$body}',1,5,1,4,1,0),('profile_photo_update','user','{item:$subject} has added a new profile photo.',1,5,1,4,1,1),('share','activity','{item:$subject} shared {item:$object}\'s {var:$type}. {body:$body}',1,5,1,1,0,1),('signup','user','{item:$subject} has just signed up. Say hello!',1,5,0,1,1,1),('status','user','{item:$subject} {body:$body}',1,5,0,1,4,0),('tagged','user','{item:$subject} tagged {item:$object} in a {var:$label}:',1,7,1,1,0,1);
/*!40000 ALTER TABLE `engine4_activity_actiontypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_attachments`
--

DROP TABLE IF EXISTS `engine4_activity_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_attachments` (
  `attachment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` int(11) unsigned NOT NULL,
  `type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) unsigned NOT NULL,
  `mode` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attachment_id`),
  KEY `action_id` (`action_id`),
  KEY `type_id` (`type`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_attachments`
--

LOCK TABLES `engine4_activity_attachments` WRITE;
/*!40000 ALTER TABLE `engine4_activity_attachments` DISABLE KEYS */;
INSERT INTO `engine4_activity_attachments` VALUES (1,3,'album_photo',1,1);
/*!40000 ALTER TABLE `engine4_activity_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_comments`
--

DROP TABLE IF EXISTS `engine4_activity_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_comments` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) unsigned NOT NULL,
  `poster_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `like_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `resource_type` (`resource_id`),
  KEY `poster_type` (`poster_type`,`poster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_comments`
--

LOCK TABLES `engine4_activity_comments` WRITE;
/*!40000 ALTER TABLE `engine4_activity_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_activity_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_likes`
--

DROP TABLE IF EXISTS `engine4_activity_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_likes` (
  `like_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) unsigned NOT NULL,
  `poster_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `resource_id` (`resource_id`),
  KEY `poster_type` (`poster_type`,`poster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_likes`
--

LOCK TABLES `engine4_activity_likes` WRITE;
/*!40000 ALTER TABLE `engine4_activity_likes` DISABLE KEYS */;
INSERT INTO `engine4_activity_likes` VALUES (1,7,'user',1);
/*!40000 ALTER TABLE `engine4_activity_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_notifications`
--

DROP TABLE IF EXISTS `engine4_activity_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_notifications` (
  `notification_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) unsigned NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `mitigated` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `LOOKUP` (`user_id`,`date`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_notifications`
--

LOCK TABLES `engine4_activity_notifications` WRITE;
/*!40000 ALTER TABLE `engine4_activity_notifications` DISABLE KEYS */;
INSERT INTO `engine4_activity_notifications` VALUES (1,1,'user',6,'activity_action',3,'liked','{\"label\":\"post\"}',1,1,'2016-04-25 18:12:40'),(2,6,'user',1,'activity_action',7,'liked','{\"label\":\"post\"}',0,1,'2016-04-26 22:21:23'),(3,2,'user',6,'user',2,'friend_request',NULL,0,0,'2016-04-26 22:28:14'),(4,1,'user',6,'user',1,'friend_request',NULL,1,1,'2016-04-26 22:28:31'),(5,6,'user',1,'user',6,'friend_accepted',NULL,0,1,'2016-04-26 22:30:53'),(6,6,'user',1,'messages_conversation',1,'message_new',NULL,0,1,'2016-04-26 23:09:52'),(7,1,'user',6,'messages_conversation',1,'message_new',NULL,0,1,'2016-04-26 23:14:22');
/*!40000 ALTER TABLE `engine4_activity_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_notificationsettings`
--

DROP TABLE IF EXISTS `engine4_activity_notificationsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_notificationsettings` (
  `user_id` int(11) unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_notificationsettings`
--

LOCK TABLES `engine4_activity_notificationsettings` WRITE;
/*!40000 ALTER TABLE `engine4_activity_notificationsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_activity_notificationsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_notificationtypes`
--

DROP TABLE IF EXISTS `engine4_activity_notificationtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_notificationtypes` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `is_request` tinyint(1) NOT NULL DEFAULT '0',
  `handler` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_notificationtypes`
--

LOCK TABLES `engine4_activity_notificationtypes` WRITE;
/*!40000 ALTER TABLE `engine4_activity_notificationtypes` DISABLE KEYS */;
INSERT INTO `engine4_activity_notificationtypes` VALUES ('commented','activity','{item:$subject} has commented on your {item:$object:$label}.',0,'',1),('commented_commented','activity','{item:$subject} has commented on a {item:$object:$label} you commented on.',0,'',1),('friend_accepted','user','You and {item:$subject} are now friends.',0,'',1),('friend_follow','user','{item:$subject} is now following you.',0,'',1),('friend_follow_accepted','user','You are now following {item:$subject}.',0,'',1),('friend_follow_request','user','{item:$subject} has requested to follow you.',1,'user.friends.request-follow',1),('friend_request','user','{item:$subject} has requested to be your friend.',1,'user.friends.request-friend',1),('group_accepted','group','Your request to join the group {item:$object} has been approved.',0,'',1),('group_approve','group','{item:$subject} has requested to join the group {item:$object}.',0,'',1),('group_discussion_reply','group','{item:$subject} has {item:$object:posted} on a {itemParent:$object::group topic} you posted on.',0,'',1),('group_discussion_response','group','{item:$subject} has {item:$object:posted} on a {itemParent:$object::group topic} you created.',0,'',1),('group_invite','group','{item:$subject} has invited you to the group {item:$object}.',1,'group.widget.request-group',1),('group_promote','group','You were promoted to officer in the group {item:$object}.',0,'',1),('liked','activity','{item:$subject} likes your {item:$object:$label}.',0,'',1),('liked_commented','activity','{item:$subject} has commented on a {item:$object:$label} you liked.',0,'',1),('message_new','messages','{item:$subject} has sent you a {item:$object:message}.',0,'',1),('post_user','user','{item:$subject} has posted on your {item:$object:profile}.',0,'',1),('shared','activity','{item:$subject} has shared your {item:$object:$label}.',0,'',1),('tagged','user','{item:$subject} tagged you in a {item:$object:$label}.',0,'',1);
/*!40000 ALTER TABLE `engine4_activity_notificationtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_activity_stream`
--

DROP TABLE IF EXISTS `engine4_activity_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_activity_stream` (
  `target_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `target_id` int(11) unsigned NOT NULL,
  `subject_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) unsigned NOT NULL,
  `object_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `action_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`target_type`,`target_id`,`action_id`),
  KEY `SUBJECT` (`subject_type`,`subject_id`,`action_id`),
  KEY `OBJECT` (`object_type`,`object_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_activity_stream`
--

LOCK TABLES `engine4_activity_stream` WRITE;
/*!40000 ALTER TABLE `engine4_activity_stream` DISABLE KEYS */;
INSERT INTO `engine4_activity_stream` VALUES ('everyone',0,'user',2,'user',2,'signup',1),('everyone',0,'user',2,'user',2,'status',2),('everyone',0,'user',1,'user',1,'profile_photo_update',3),('everyone',0,'user',4,'user',4,'signup',5),('everyone',0,'user',1,'user',1,'status',6),('everyone',0,'user',6,'user',6,'signup',7),('everyone',0,'user',6,'user',6,'status',8),('everyone',0,'user',7,'user',7,'signup',9),('everyone',0,'user',1,'user',1,'status',10),('everyone',0,'user',6,'user',1,'friends',11),('everyone',0,'user',1,'user',6,'friends',12),('members',1,'user',1,'user',1,'profile_photo_update',3),('members',1,'user',1,'user',1,'status',6),('members',1,'user',1,'user',1,'status',10),('members',1,'user',6,'user',1,'friends',11),('members',2,'user',2,'user',2,'signup',1),('members',2,'user',2,'user',2,'status',2),('members',4,'user',4,'user',4,'signup',5),('members',6,'user',6,'user',6,'signup',7),('members',6,'user',6,'user',6,'status',8),('members',6,'user',1,'user',6,'friends',12),('members',7,'user',7,'user',7,'signup',9),('owner',1,'user',1,'user',1,'profile_photo_update',3),('owner',1,'user',1,'user',1,'status',6),('owner',1,'user',1,'user',1,'status',10),('owner',1,'user',1,'user',6,'friends',12),('owner',2,'user',2,'user',2,'signup',1),('owner',2,'user',2,'user',2,'status',2),('owner',4,'user',4,'user',4,'signup',5),('owner',6,'user',6,'user',6,'signup',7),('owner',6,'user',6,'user',6,'status',8),('owner',6,'user',6,'user',1,'friends',11),('owner',7,'user',7,'user',7,'signup',9),('parent',1,'user',1,'user',1,'profile_photo_update',3),('parent',1,'user',1,'user',1,'status',6),('parent',1,'user',1,'user',1,'status',10),('parent',1,'user',6,'user',1,'friends',11),('parent',2,'user',2,'user',2,'signup',1),('parent',2,'user',2,'user',2,'status',2),('parent',4,'user',4,'user',4,'signup',5),('parent',6,'user',6,'user',6,'signup',7),('parent',6,'user',6,'user',6,'status',8),('parent',6,'user',1,'user',6,'friends',12),('parent',7,'user',7,'user',7,'signup',9),('registered',0,'user',2,'user',2,'signup',1),('registered',0,'user',2,'user',2,'status',2),('registered',0,'user',1,'user',1,'profile_photo_update',3),('registered',0,'user',4,'user',4,'signup',5),('registered',0,'user',1,'user',1,'status',6),('registered',0,'user',6,'user',6,'signup',7),('registered',0,'user',6,'user',6,'status',8),('registered',0,'user',7,'user',7,'signup',9),('registered',0,'user',1,'user',1,'status',10),('registered',0,'user',6,'user',1,'friends',11),('registered',0,'user',1,'user',6,'friends',12);
/*!40000 ALTER TABLE `engine4_activity_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_album_albums`
--

DROP TABLE IF EXISTS `engine4_album_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_album_albums` (
  `album_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `owner_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `photo_id` int(11) unsigned NOT NULL DEFAULT '0',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0',
  `comment_count` int(11) unsigned NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('wall','profile','message','blog') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `owner_type` (`owner_type`,`owner_id`),
  KEY `category_id` (`category_id`),
  KEY `search` (`search`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_album_albums`
--

LOCK TABLES `engine4_album_albums` WRITE;
/*!40000 ALTER TABLE `engine4_album_albums` DISABLE KEYS */;
INSERT INTO `engine4_album_albums` VALUES (1,'Profile Photos','','user',1,0,'2016-03-29 17:16:37','2016-03-29 17:16:37',1,11,0,1,'profile');
/*!40000 ALTER TABLE `engine4_album_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_album_categories`
--

DROP TABLE IF EXISTS `engine4_album_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_album_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `category_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_album_categories`
--

LOCK TABLES `engine4_album_categories` WRITE;
/*!40000 ALTER TABLE `engine4_album_categories` DISABLE KEYS */;
INSERT INTO `engine4_album_categories` VALUES (0,1,'All Categories'),(1,1,'Arts & Culture'),(2,1,'Business'),(3,1,'Entertainment'),(5,1,'Family & Home'),(6,1,'Health'),(7,1,'Recreation'),(8,1,'Personal'),(9,1,'Shopping'),(10,1,'Society'),(11,1,'Sports'),(12,1,'Technology'),(13,1,'Other');
/*!40000 ALTER TABLE `engine4_album_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_album_photos`
--

DROP TABLE IF EXISTS `engine4_album_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_album_photos` (
  `photo_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(11) unsigned NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `order` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `view_count` int(11) unsigned NOT NULL DEFAULT '0',
  `comment_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  KEY `album_id` (`album_id`),
  KEY `owner_type` (`owner_type`,`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_album_photos`
--

LOCK TABLES `engine4_album_photos` WRITE;
/*!40000 ALTER TABLE `engine4_album_photos` DISABLE KEYS */;
INSERT INTO `engine4_album_photos` VALUES (1,1,'','','2016-03-29 17:16:37','2016-03-29 17:16:37',0,'user',1,5,22,0);
/*!40000 ALTER TABLE `engine4_album_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_announcement_announcements`
--

DROP TABLE IF EXISTS `engine4_announcement_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_announcement_announcements` (
  `announcement_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `networks` text COLLATE utf8_unicode_ci,
  `member_levels` text COLLATE utf8_unicode_ci,
  `profile_types` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`announcement_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_announcement_announcements`
--

LOCK TABLES `engine4_announcement_announcements` WRITE;
/*!40000 ALTER TABLE `engine4_announcement_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_announcement_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_authorization_allow`
--

DROP TABLE IF EXISTS `engine4_authorization_allow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_authorization_allow` (
  `resource_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) unsigned NOT NULL,
  `action` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `role` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `role_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` tinyint(1) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`resource_type`,`resource_id`,`action`,`role`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_authorization_allow`
--

LOCK TABLES `engine4_authorization_allow` WRITE;
/*!40000 ALTER TABLE `engine4_authorization_allow` DISABLE KEYS */;
INSERT INTO `engine4_authorization_allow` VALUES ('album',1,'comment','everyone',0,1,NULL),('album',1,'view','everyone',0,1,NULL),('album_photo',1,'comment','everyone',0,1,NULL),('album_photo',1,'view','everyone',0,1,NULL),('user',1,'comment','everyone',0,1,NULL),('user',1,'comment','member',0,1,NULL),('user',1,'comment','network',0,1,NULL),('user',1,'comment','registered',0,1,NULL),('user',1,'view','everyone',0,1,NULL),('user',1,'view','member',0,1,NULL),('user',1,'view','network',0,1,NULL),('user',1,'view','registered',0,1,NULL),('user',2,'comment','everyone',0,1,NULL),('user',2,'comment','member',0,1,NULL),('user',2,'comment','network',0,1,NULL),('user',2,'comment','registered',0,1,NULL),('user',2,'view','everyone',0,1,NULL),('user',2,'view','member',0,1,NULL),('user',2,'view','network',0,1,NULL),('user',2,'view','registered',0,1,NULL),('user',4,'comment','everyone',0,1,NULL),('user',4,'comment','member',0,1,NULL),('user',4,'comment','network',0,1,NULL),('user',4,'comment','registered',0,1,NULL),('user',4,'view','everyone',0,1,NULL),('user',4,'view','member',0,1,NULL),('user',4,'view','network',0,1,NULL),('user',4,'view','registered',0,1,NULL),('user',6,'comment','everyone',0,1,NULL),('user',6,'comment','member',0,1,NULL),('user',6,'comment','network',0,1,NULL),('user',6,'comment','registered',0,1,NULL),('user',6,'view','everyone',0,1,NULL),('user',6,'view','member',0,1,NULL),('user',6,'view','network',0,1,NULL),('user',6,'view','registered',0,1,NULL),('user',7,'comment','everyone',0,1,NULL),('user',7,'comment','member',0,1,NULL),('user',7,'comment','network',0,1,NULL),('user',7,'comment','registered',0,1,NULL),('user',7,'view','everyone',0,1,NULL),('user',7,'view','member',0,1,NULL),('user',7,'view','network',0,1,NULL),('user',7,'view','registered',0,1,NULL);
/*!40000 ALTER TABLE `engine4_authorization_allow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_authorization_levels`
--

DROP TABLE IF EXISTS `engine4_authorization_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_authorization_levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('public','user','moderator','admin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `flag` enum('default','superadmin','public') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_authorization_levels`
--

LOCK TABLES `engine4_authorization_levels` WRITE;
/*!40000 ALTER TABLE `engine4_authorization_levels` DISABLE KEYS */;
INSERT INTO `engine4_authorization_levels` VALUES (1,'Superadmins','Users of this level can modify all of your settings and data.  This level cannot be modified or deleted.','admin','superadmin'),(3,'Moderators','Users of this level may edit user-side content.','moderator',''),(4,'Default Level','This is the default user level.  New users are assigned to it automatically.','user','default'),(5,'Public','Settings for this level apply to users who have not logged in.','public','public');
/*!40000 ALTER TABLE `engine4_authorization_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_authorization_permissions`
--

DROP TABLE IF EXISTS `engine4_authorization_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_authorization_permissions` (
  `level_id` int(11) unsigned NOT NULL,
  `type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` tinyint(3) NOT NULL DEFAULT '0',
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`level_id`,`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_authorization_permissions`
--

LOCK TABLES `engine4_authorization_permissions` WRITE;
/*!40000 ALTER TABLE `engine4_authorization_permissions` DISABLE KEYS */;
INSERT INTO `engine4_authorization_permissions` VALUES (1,'admin','view',1,NULL),(1,'album','auth_comment',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(1,'album','auth_tag',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(1,'album','auth_view',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(1,'album','comment',2,NULL),(1,'album','create',1,NULL),(1,'album','delete',2,NULL),(1,'album','edit',2,NULL),(1,'album','tag',2,NULL),(1,'album','view',2,NULL),(1,'announcement','create',1,NULL),(1,'announcement','delete',2,NULL),(1,'announcement','edit',2,NULL),(1,'announcement','view',2,NULL),(1,'core_link','create',1,NULL),(1,'core_link','delete',2,NULL),(1,'core_link','view',2,NULL),(1,'general','activity',2,NULL),(1,'general','style',2,NULL),(1,'group','auth_comment',5,'[\"registered\", \"member\", \"officer\"]'),(1,'group','auth_event',5,'[\"registered\", \"member\", \"officer\"]'),(1,'group','auth_photo',5,'[\"registered\", \"member\", \"officer\"]'),(1,'group','auth_view',5,'[\"everyone\", \"registered\", \"member\"]'),(1,'group','comment',2,NULL),(1,'group','commentHtml',3,'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),(1,'group','create',1,NULL),(1,'group','delete',2,NULL),(1,'group','edit',2,NULL),(1,'group','event',1,NULL),(1,'group','invite',1,NULL),(1,'group','photo',1,NULL),(1,'group','photo.edit',2,NULL),(1,'group','style',1,NULL),(1,'group','topic.edit',2,NULL),(1,'group','view',2,NULL),(1,'messages','auth',3,'friends'),(1,'messages','create',1,NULL),(1,'messages','editor',3,'plaintext'),(1,'user','activity',1,NULL),(1,'user','auth_comment',5,'[\"registered\",\"network\",\"member\",\"owner\"]'),(1,'user','auth_view',5,'[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),(1,'user','block',1,NULL),(1,'user','comment',2,NULL),(1,'user','commenthtml',3,''),(1,'user','create',1,NULL),(1,'user','delete',2,NULL),(1,'user','description',3,'Users of this level can modify all of your settings and data.  This level cannot be modified or deleted.'),(1,'user','edit',2,NULL),(1,'user','messages_editor',3,'plaintext'),(1,'user','quota',0,NULL),(1,'user','search',1,NULL),(1,'user','status',1,NULL),(1,'user','style',2,NULL),(1,'user','title',3,'Superadmins'),(1,'user','username',0,NULL),(1,'user','view',2,NULL),(3,'album','auth_comment',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(3,'album','auth_tag',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(3,'album','auth_view',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(3,'album','comment',2,NULL),(3,'album','create',1,NULL),(3,'album','delete',2,NULL),(3,'album','edit',2,NULL),(3,'album','tag',2,NULL),(3,'album','view',2,NULL),(3,'announcement','view',1,NULL),(3,'core_link','create',1,NULL),(3,'core_link','delete',2,NULL),(3,'core_link','view',2,NULL),(3,'general','activity',2,NULL),(3,'general','style',2,NULL),(3,'group','auth_comment',5,'[\"registered\", \"member\", \"officer\"]'),(3,'group','auth_event',5,'[\"registered\", \"member\", \"officer\"]'),(3,'group','auth_photo',5,'[\"registered\", \"member\", \"officer\"]'),(3,'group','auth_view',5,'[\"everyone\", \"registered\", \"member\"]'),(3,'group','comment',2,NULL),(3,'group','commentHtml',3,'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),(3,'group','create',1,NULL),(3,'group','delete',2,NULL),(3,'group','edit',2,NULL),(3,'group','event',1,NULL),(3,'group','invite',1,NULL),(3,'group','photo',1,NULL),(3,'group','photo.edit',2,NULL),(3,'group','style',1,NULL),(3,'group','topic.edit',2,NULL),(3,'group','view',2,NULL),(3,'messages','auth',3,'friends'),(3,'messages','create',1,NULL),(3,'messages','editor',3,'plaintext'),(3,'user','activity',1,NULL),(3,'user','auth_comment',5,'[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),(3,'user','auth_view',5,'[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),(3,'user','block',1,NULL),(3,'user','comment',2,NULL),(3,'user','create',1,NULL),(3,'user','delete',2,NULL),(3,'user','edit',2,NULL),(3,'user','search',1,NULL),(3,'user','status',1,NULL),(3,'user','style',2,NULL),(3,'user','username',2,NULL),(3,'user','view',2,NULL),(4,'album','auth_comment',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(4,'album','auth_tag',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(4,'album','auth_view',5,'[\"everyone\",\"owner_network\",\"owner_member_member\",\"owner_member\",\"owner\"]'),(4,'album','comment',1,NULL),(4,'album','create',1,NULL),(4,'album','delete',1,NULL),(4,'album','edit',1,NULL),(4,'album','tag',1,NULL),(4,'album','view',1,NULL),(4,'announcement','view',1,NULL),(4,'core_link','create',1,NULL),(4,'core_link','delete',1,NULL),(4,'core_link','view',1,NULL),(4,'general','style',1,NULL),(4,'group','auth_comment',5,'[\"registered\", \"member\", \"officer\"]'),(4,'group','auth_event',5,'[\"registered\", \"member\", \"officer\"]'),(4,'group','auth_photo',5,'[\"registered\", \"member\", \"officer\"]'),(4,'group','auth_view',5,'[\"everyone\", \"registered\", \"member\"]'),(4,'group','comment',1,NULL),(4,'group','commentHtml',3,'blockquote, strong, b, em, i, u, strike, sub, sup, p, div, pre, address, h1, h2, h3, h4, h5, h6, span, ol, li, ul, a, img, embed, br, hr, iframe'),(4,'group','create',1,NULL),(4,'group','delete',1,NULL),(4,'group','edit',1,NULL),(4,'group','event',1,NULL),(4,'group','invite',1,NULL),(4,'group','photo',1,NULL),(4,'group','photo.edit',1,NULL),(4,'group','style',1,NULL),(4,'group','topic.edit',1,NULL),(4,'group','view',1,NULL),(4,'messages','auth',3,'friends'),(4,'messages','create',1,NULL),(4,'messages','editor',3,'plaintext'),(4,'user','auth_comment',5,'[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),(4,'user','auth_view',5,'[\"everyone\",\"registered\",\"network\",\"member\",\"owner\"]'),(4,'user','block',1,NULL),(4,'user','comment',1,NULL),(4,'user','create',1,NULL),(4,'user','delete',1,NULL),(4,'user','edit',1,NULL),(4,'user','search',1,NULL),(4,'user','status',1,NULL),(4,'user','style',1,NULL),(4,'user','username',1,NULL),(4,'user','view',1,NULL),(5,'album','tag',0,NULL),(5,'album','view',1,NULL),(5,'announcement','view',1,NULL),(5,'core_link','view',1,NULL),(5,'group','view',1,NULL),(5,'messages','auth',0,NULL),(5,'messages','create',0,NULL),(5,'messages','editor',0,NULL),(5,'user','description',3,'Settings for this level apply to users who have not logged in.'),(5,'user','title',3,'Public'),(5,'user','view',0,NULL);
/*!40000 ALTER TABLE `engine4_authorization_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_adcampaigns`
--

DROP TABLE IF EXISTS `engine4_core_adcampaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_adcampaigns` (
  `adcampaign_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `end_settings` tinyint(4) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `limit_view` int(11) unsigned NOT NULL DEFAULT '0',
  `limit_click` int(11) unsigned NOT NULL DEFAULT '0',
  `limit_ctr` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `network` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `clicks` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adcampaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_adcampaigns`
--

LOCK TABLES `engine4_core_adcampaigns` WRITE;
/*!40000 ALTER TABLE `engine4_core_adcampaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_adcampaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_adphotos`
--

DROP TABLE IF EXISTS `engine4_core_adphotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_adphotos` (
  `adphoto_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) unsigned NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`adphoto_id`),
  KEY `ad_id` (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_adphotos`
--

LOCK TABLES `engine4_core_adphotos` WRITE;
/*!40000 ALTER TABLE `engine4_core_adphotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_adphotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_ads`
--

DROP TABLE IF EXISTS `engine4_core_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_ads` (
  `ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ad_campaign` int(11) unsigned NOT NULL,
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `clicks` int(11) unsigned NOT NULL DEFAULT '0',
  `media_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html_code` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ad_id`),
  KEY `ad_campaign` (`ad_campaign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_ads`
--

LOCK TABLES `engine4_core_ads` WRITE;
/*!40000 ALTER TABLE `engine4_core_ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_auth`
--

DROP TABLE IF EXISTS `engine4_core_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_auth` (
  `id` varchar(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `expires` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`user_id`),
  KEY `expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_auth`
--

LOCK TABLES `engine4_core_auth` WRITE;
/*!40000 ALTER TABLE `engine4_core_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_bannedemails`
--

DROP TABLE IF EXISTS `engine4_core_bannedemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_bannedemails` (
  `bannedemail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bannedemail_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_bannedemails`
--

LOCK TABLES `engine4_core_bannedemails` WRITE;
/*!40000 ALTER TABLE `engine4_core_bannedemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_bannedemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_bannedips`
--

DROP TABLE IF EXISTS `engine4_core_bannedips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_bannedips` (
  `bannedip_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start` varbinary(16) NOT NULL,
  `stop` varbinary(16) NOT NULL,
  PRIMARY KEY (`bannedip_id`),
  UNIQUE KEY `start` (`start`,`stop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_bannedips`
--

LOCK TABLES `engine4_core_bannedips` WRITE;
/*!40000 ALTER TABLE `engine4_core_bannedips` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_bannedips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_bannedusernames`
--

DROP TABLE IF EXISTS `engine4_core_bannedusernames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_bannedusernames` (
  `bannedusername_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bannedusername_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_bannedusernames`
--

LOCK TABLES `engine4_core_bannedusernames` WRITE;
/*!40000 ALTER TABLE `engine4_core_bannedusernames` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_bannedusernames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_bannedwords`
--

DROP TABLE IF EXISTS `engine4_core_bannedwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_bannedwords` (
  `bannedword_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bannedword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_bannedwords`
--

LOCK TABLES `engine4_core_bannedwords` WRITE;
/*!40000 ALTER TABLE `engine4_core_bannedwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_bannedwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_comments`
--

DROP TABLE IF EXISTS `engine4_core_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_comments` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) unsigned NOT NULL,
  `poster_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `like_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `resource_type` (`resource_type`,`resource_id`),
  KEY `poster_type` (`poster_type`,`poster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_comments`
--

LOCK TABLES `engine4_core_comments` WRITE;
/*!40000 ALTER TABLE `engine4_core_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_content`
--

DROP TABLE IF EXISTS `engine4_core_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_content` (
  `content_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'widget',
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_content_id` int(11) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `params` text COLLATE utf8_unicode_ci,
  `attribs` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`content_id`),
  KEY `page_id` (`page_id`,`order`)
) ENGINE=InnoDB AUTO_INCREMENT=100000959 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_content`
--

LOCK TABLES `engine4_core_content` WRITE;
/*!40000 ALTER TABLE `engine4_core_content` DISABLE KEYS */;
INSERT INTO `engine4_core_content` VALUES (500,5,'container','main',NULL,1,'',NULL),(510,5,'container','left',500,1,'',NULL),(511,5,'container','middle',500,3,'',NULL),(520,5,'widget','user.profile-photo',510,1,'',NULL),(521,5,'widget','user.profile-options',510,2,'',NULL),(522,5,'widget','user.profile-friends-common',510,3,'{\"title\":\"Mutual Friends\"}',NULL),(523,5,'widget','user.profile-info',510,4,'{\"title\":\"Member Info\"}',NULL),(530,5,'widget','user.profile-status',511,1,'',NULL),(531,5,'widget','core.container-tabs',511,2,'{\"max\":\"6\"}',NULL),(540,5,'widget','activity.feed',531,1,'{\"title\":\"Updates\"}',NULL),(541,5,'widget','user.profile-fields',531,2,'{\"title\":\"Info\"}',NULL),(542,5,'widget','user.profile-friends',531,3,'{\"title\":\"Friends\",\"titleCount\":true}',NULL),(546,5,'widget','core.profile-links',531,7,'{\"title\":\"Links\",\"titleCount\":true}',NULL),(547,6,'container','main',NULL,1,NULL,NULL),(548,6,'container','middle',547,2,NULL,NULL),(549,6,'widget','core.content',548,1,NULL,NULL),(550,7,'container','main',NULL,1,NULL,NULL),(551,7,'container','middle',550,2,NULL,NULL),(552,7,'widget','core.content',551,1,NULL,NULL),(553,8,'container','main',NULL,1,NULL,NULL),(554,8,'container','middle',553,2,NULL,NULL),(555,8,'widget','core.content',554,1,NULL,NULL),(556,9,'container','main',NULL,1,NULL,NULL),(557,9,'container','middle',556,1,NULL,NULL),(558,9,'widget','core.content',557,1,NULL,NULL),(559,10,'container','main',NULL,1,NULL,NULL),(560,10,'container','middle',559,1,NULL,NULL),(561,10,'widget','core.content',560,1,NULL,NULL),(562,11,'container','main',NULL,1,NULL,NULL),(563,11,'container','middle',562,1,NULL,NULL),(564,11,'widget','core.content',563,1,NULL,NULL),(565,12,'container','main',NULL,1,NULL,NULL),(566,12,'container','middle',565,1,NULL,NULL),(567,12,'widget','core.content',566,1,NULL,NULL),(568,13,'container','main',NULL,1,NULL,NULL),(569,13,'container','middle',568,1,NULL,NULL),(570,13,'widget','core.content',569,1,NULL,NULL),(571,14,'container','top',NULL,1,NULL,NULL),(572,14,'container','main',NULL,2,NULL,NULL),(573,14,'container','middle',571,1,NULL,NULL),(574,14,'container','middle',572,2,NULL,NULL),(575,14,'widget','user.settings-menu',573,1,NULL,NULL),(576,14,'widget','core.content',574,1,NULL,NULL),(577,15,'container','top',NULL,1,NULL,NULL),(578,15,'container','main',NULL,2,NULL,NULL),(579,15,'container','middle',577,1,NULL,NULL),(580,15,'container','middle',578,2,NULL,NULL),(581,15,'widget','user.settings-menu',579,1,NULL,NULL),(582,15,'widget','core.content',580,1,NULL,NULL),(583,16,'container','top',NULL,1,NULL,NULL),(584,16,'container','main',NULL,2,NULL,NULL),(585,16,'container','middle',583,1,NULL,NULL),(586,16,'container','middle',584,2,NULL,NULL),(587,16,'widget','user.settings-menu',585,1,NULL,NULL),(588,16,'widget','core.content',586,1,NULL,NULL),(589,17,'container','top',NULL,1,NULL,NULL),(590,17,'container','main',NULL,2,NULL,NULL),(591,17,'container','middle',589,1,NULL,NULL),(592,17,'container','middle',590,2,NULL,NULL),(593,17,'widget','user.settings-menu',591,1,NULL,NULL),(594,17,'widget','core.content',592,1,NULL,NULL),(595,18,'container','top',NULL,1,NULL,NULL),(596,18,'container','main',NULL,2,NULL,NULL),(597,18,'container','middle',595,1,NULL,NULL),(598,18,'container','middle',596,2,NULL,NULL),(599,18,'widget','user.settings-menu',597,1,NULL,NULL),(600,18,'widget','core.content',598,1,NULL,NULL),(601,19,'container','top',NULL,1,NULL,NULL),(602,19,'container','main',NULL,2,NULL,NULL),(603,19,'container','middle',601,1,NULL,NULL),(604,19,'container','middle',602,2,NULL,NULL),(605,19,'widget','user.settings-menu',603,1,NULL,NULL),(606,19,'widget','core.content',604,1,NULL,NULL),(607,20,'container','top',NULL,1,NULL,NULL),(608,20,'container','main',NULL,2,NULL,NULL),(609,20,'container','middle',607,1,NULL,NULL),(610,20,'container','middle',608,2,NULL,NULL),(611,20,'container','left',608,1,NULL,NULL),(612,20,'widget','user.browse-menu',609,1,NULL,NULL),(613,20,'widget','core.content',610,1,NULL,NULL),(614,20,'widget','user.browse-search',611,1,NULL,NULL),(615,21,'container','main',NULL,1,NULL,NULL),(616,21,'container','middle',615,1,NULL,NULL),(617,21,'widget','core.content',616,1,NULL,NULL),(618,22,'container','main',NULL,1,NULL,NULL),(619,22,'container','middle',618,1,NULL,NULL),(620,22,'widget','core.content',619,2,NULL,NULL),(621,22,'widget','messages.menu',619,1,NULL,NULL),(622,23,'container','main',NULL,1,NULL,NULL),(623,23,'container','middle',622,1,NULL,NULL),(624,23,'widget','core.content',623,2,NULL,NULL),(625,23,'widget','messages.menu',623,1,NULL,NULL),(626,24,'container','main',NULL,1,NULL,NULL),(627,24,'container','middle',626,1,NULL,NULL),(628,24,'widget','core.content',627,2,NULL,NULL),(629,24,'widget','messages.menu',627,1,NULL,NULL),(630,25,'container','main',NULL,1,NULL,NULL),(631,25,'container','middle',630,1,NULL,NULL),(632,25,'widget','core.content',631,2,NULL,NULL),(633,25,'widget','messages.menu',631,1,NULL,NULL),(634,26,'container','main',NULL,1,NULL,NULL),(635,26,'container','middle',634,1,NULL,NULL),(636,26,'widget','core.content',635,2,NULL,NULL),(637,26,'widget','messages.menu',635,1,NULL,NULL),(638,27,'container','main',NULL,1,NULL,NULL),(639,27,'container','middle',638,2,NULL,NULL),(640,27,'widget','core.content',639,1,NULL,NULL),(641,27,'widget','core.comments',639,2,NULL,NULL),(642,28,'container','main',NULL,1,NULL,NULL),(643,28,'container','middle',642,2,NULL,NULL),(644,28,'widget','core.content',643,1,NULL,NULL),(645,28,'widget','core.comments',643,2,NULL,NULL),(646,29,'container','top',NULL,1,NULL,NULL),(647,29,'container','main',NULL,2,NULL,NULL),(648,29,'container','middle',646,1,NULL,NULL),(649,29,'container','middle',647,2,NULL,NULL),(650,29,'container','right',647,1,NULL,NULL),(651,29,'widget','album.browse-menu',648,1,NULL,NULL),(652,29,'widget','core.content',649,1,NULL,NULL),(653,29,'widget','album.browse-search',650,1,NULL,NULL),(654,29,'widget','album.browse-menu-quick',650,2,NULL,NULL),(655,5,'widget','album.profile-albums',531,4,'{\"title\":\"Albums\",\"titleCount\":true}',NULL),(656,30,'container','top',NULL,1,NULL,NULL),(657,30,'container','main',NULL,2,NULL,NULL),(658,30,'container','middle',656,1,NULL,NULL),(659,30,'container','middle',657,2,NULL,NULL),(660,30,'widget','album.browse-menu',658,1,NULL,NULL),(661,30,'widget','core.content',659,1,NULL,NULL),(662,31,'container','top',NULL,1,NULL,NULL),(663,31,'container','main',NULL,2,NULL,NULL),(664,31,'container','middle',662,1,NULL,NULL),(665,31,'container','middle',663,2,NULL,NULL),(666,31,'container','right',663,1,NULL,NULL),(667,31,'widget','album.browse-menu',664,1,NULL,NULL),(668,31,'widget','core.content',665,1,NULL,NULL),(669,31,'widget','album.browse-search',666,1,NULL,NULL),(670,31,'widget','album.browse-menu-quick',666,2,NULL,NULL),(671,5,'widget','group.profile-groups',531,9,'{\"title\":\"Groups\",\"titleCount\":true}',NULL),(672,32,'container','main',NULL,1,'',NULL),(673,32,'container','middle',672,3,'',NULL),(674,32,'container','left',672,1,'',NULL),(675,32,'widget','core.container-tabs',673,2,'{\"max\":\"6\"}',NULL),(676,32,'widget','group.profile-status',673,1,'',NULL),(677,32,'widget','group.profile-photo',674,1,'',NULL),(678,32,'widget','group.profile-options',674,2,'',NULL),(679,32,'widget','group.profile-info',674,3,'',NULL),(680,32,'widget','activity.feed',675,1,'{\"title\":\"Updates\"}',NULL),(681,32,'widget','group.profile-members',675,2,'{\"title\":\"Members\",\"titleCount\":true}',NULL),(682,32,'widget','group.profile-photos',675,3,'{\"title\":\"Photos\",\"titleCount\":true}',NULL),(683,32,'widget','group.profile-discussions',675,4,'{\"title\":\"Discussions\",\"titleCount\":true}',NULL),(684,32,'widget','core.profile-links',675,5,'{\"title\":\"Links\",\"titleCount\":true}',NULL),(685,32,'widget','group.profile-events',675,6,'{\"title\":\"Events\",\"titleCount\":true}',NULL),(686,33,'container','main',NULL,1,'',NULL),(687,33,'container','middle',686,2,'',NULL),(688,33,'widget','group.profile-status',687,3,'',NULL),(689,33,'widget','group.profile-photo',687,4,'',NULL),(690,33,'widget','group.profile-info',687,5,'',NULL),(691,33,'widget','core.container-tabs',687,6,'{\"max\":6}',NULL),(692,33,'widget','activity.feed',691,7,'{\"title\":\"What\'s New\"}',NULL),(693,33,'widget','group.profile-members',691,8,'{\"title\":\"Members\",\"titleCount\":true}',NULL),(694,34,'container','top',NULL,1,NULL,NULL),(695,34,'container','main',NULL,2,NULL,NULL),(696,34,'container','middle',694,1,NULL,NULL),(697,34,'container','middle',695,2,NULL,NULL),(698,34,'container','right',695,1,NULL,NULL),(699,34,'widget','group.browse-menu',696,1,NULL,NULL),(700,34,'widget','core.content',697,1,NULL,NULL),(701,34,'widget','group.browse-search',698,1,NULL,NULL),(702,34,'widget','group.browse-menu-quick',698,2,NULL,NULL),(703,35,'container','top',NULL,1,NULL,NULL),(704,35,'container','main',NULL,2,NULL,NULL),(705,35,'container','middle',703,1,NULL,NULL),(706,35,'container','middle',704,2,NULL,NULL),(707,35,'widget','group.browse-menu',705,1,NULL,NULL),(708,35,'widget','core.content',706,1,NULL,NULL),(709,36,'container','top',NULL,1,NULL,NULL),(710,36,'container','main',NULL,2,NULL,NULL),(711,36,'container','middle',709,1,NULL,NULL),(712,36,'container','middle',710,2,NULL,NULL),(713,36,'container','right',710,1,NULL,NULL),(714,36,'widget','group.browse-menu',711,1,NULL,NULL),(715,36,'widget','core.content',712,1,NULL,NULL),(716,36,'widget','group.browse-search',713,1,NULL,NULL),(717,36,'widget','group.browse-menu-quick',713,2,NULL,NULL),(746,39,'container','main',NULL,2,'[]',NULL),(747,39,'container','middle',746,6,'[]',NULL),(756,41,'container','top',NULL,1,'[\"[]\"]',NULL),(757,41,'container','main',NULL,2,'[\"[]\"]',NULL),(758,41,'container','middle',756,6,'[\"[]\"]',NULL),(759,41,'container','middle',757,6,'[\"[]\"]',NULL),(760,41,'container','left',757,4,'[\"[]\"]',NULL),(761,41,'widget','user.browse-menu',758,3,'[\"[]\"]',NULL),(762,41,'widget','core.content',759,8,'[\"[]\"]',NULL),(763,41,'widget','user.browse-search',760,6,'[\"[]\"]',NULL),(934,1,'container','main',NULL,2,'[\"\"]',''),(935,1,'widget','ynresponsivepurity.mini-menu',934,2,'{\"title\":\"Rentstarz \",\"name\":\"ynresponsivepurity.mini-menu\",\"logo\":\"\",\"logo_link\":\"\",\"site_name\":\"\",\"site_link\":\"\",\"nomobile\":\"0\",\"notablet\":\"0\",\"nofullsite\":\"0\"}',''),(936,1,'widget','ynresponsivepurity.main-menu',934,3,'{\"title\":\"\",\"limit\":\"12\",\"name\":\"ynresponsivepurity.main-menu\",\"nomobile\":\"0\"}',''),(937,2,'container','main',NULL,2,'[\"\"]',''),(938,2,'widget','ynresponsivepurity.footer-menu',937,2,'[\"[]\"]',''),(939,3,'container','main',NULL,2,'[\"\"]',''),(940,3,'container','middle',939,6,'[\"\"]',''),(943,42,'container','main',NULL,2,'[\"\"]',''),(944,42,'container','left',943,4,'[\"\"]',''),(945,42,'widget','user.home-photo',944,3,'[\"\"]',''),(946,42,'widget','user.home-links',944,4,'[\"\"]',''),(947,42,'widget','user.list-online',944,5,'{\"title\":\"%s Members Online\"}',''),(948,42,'widget','core.statistics',944,6,'{\"title\":\"Statistics\"}',''),(949,42,'container','right',943,5,'[\"\"]',''),(950,42,'widget','activity.list-requests',949,1,'{\"title\":\"Requests\"}',''),(951,42,'widget','user.list-signups',949,2,'{\"title\":\"Newest Members\"}',''),(952,42,'widget','user.list-popular',949,3,'{\"title\":\"Popular Members\"}',''),(953,42,'container','middle',943,6,'[\"\"]',''),(954,42,'widget','announcement.list-announcements',953,1,'',''),(955,42,'widget','activity.feed',953,9,'{\"title\":\"What\'s New\"}',''),(956,3,'widget','ynresponsivepurity.slider',940,3,'{\"background_image\":\"\",\"show_title\":\"1\",\"show_description\":\"1\",\"title\":\"\",\"name\":\"ynresponsivepurity.slider\",\"nomobile\":\"0\",\"notablet\":\"0\",\"nofullsite\":\"0\"}',NULL),(100000939,4,'container','main',NULL,2,'[\"\"]',''),(100000940,4,'container','middle',100000939,6,'[\"\"]',''),(100000956,4,'widget','ynresponsivepurity.slider',100000940,3,'{\"background_image\":\"\",\"show_title\":\"0\",\"show_description\":\"0\",\"title\":\"\",\"name\":\"ynresponsivepurity.slider\",\"nomobile\":\"0\",\"notablet\":\"0\",\"nofullsite\":\"0\"}',NULL),(100000958,3,'widget','announcement.list-announcements',940,4,'{\"title\":\"Renting in NewYork city\",\"nomobile\":\"0\",\"notablet\":\"0\",\"nofullsite\":\"0\",\"name\":\"announcement.list-announcements\",\"itemCountPerPage\":\"4\"}',NULL);
/*!40000 ALTER TABLE `engine4_core_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_geotags`
--

DROP TABLE IF EXISTS `engine4_core_geotags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_geotags` (
  `geotag_id` int(11) unsigned NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  PRIMARY KEY (`geotag_id`),
  KEY `latitude` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_geotags`
--

LOCK TABLES `engine4_core_geotags` WRITE;
/*!40000 ALTER TABLE `engine4_core_geotags` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_geotags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_jobs`
--

DROP TABLE IF EXISTS `engine4_core_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_jobs` (
  `job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jobtype_id` int(10) unsigned NOT NULL,
  `state` enum('pending','active','sleeping','failed','cancelled','completed','timeout') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `is_complete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `progress` decimal(5,4) unsigned NOT NULL DEFAULT '0.0000',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `started_date` datetime DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `priority` mediumint(9) NOT NULL DEFAULT '100',
  `data` text COLLATE utf8_unicode_ci,
  `messages` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`job_id`),
  KEY `jobtype_id` (`jobtype_id`),
  KEY `state` (`state`),
  KEY `is_complete` (`is_complete`,`priority`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_jobs`
--

LOCK TABLES `engine4_core_jobs` WRITE;
/*!40000 ALTER TABLE `engine4_core_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_jobtypes`
--

DROP TABLE IF EXISTS `engine4_core_jobtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_jobtypes` (
  `jobtype_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `form` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `priority` mediumint(9) NOT NULL DEFAULT '100',
  `multi` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`jobtype_id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_jobtypes`
--

LOCK TABLES `engine4_core_jobtypes` WRITE;
/*!40000 ALTER TABLE `engine4_core_jobtypes` DISABLE KEYS */;
INSERT INTO `engine4_core_jobtypes` VALUES (1,'Download File','file_download','core','Core_Plugin_Job_FileDownload','Core_Form_Admin_Job_FileDownload',1,100,1),(2,'Upload File','file_upload','core','Core_Plugin_Job_FileUpload','Core_Form_Admin_Job_FileUpload',1,100,1),(3,'Rebuild Activity Privacy','activity_maintenance_rebuild_privacy','activity','Activity_Plugin_Job_Maintenance_RebuildPrivacy',NULL,1,50,1),(4,'Rebuild Member Privacy','user_maintenance_rebuild_privacy','user','User_Plugin_Job_Maintenance_RebuildPrivacy',NULL,1,50,1),(5,'Rebuild Network Membership','network_maintenance_rebuild_membership','network','Network_Plugin_Job_Maintenance_RebuildMembership',NULL,1,50,1),(6,'Storage Transfer','storage_transfer','core','Storage_Plugin_Job_Transfer','Core_Form_Admin_Job_Generic',1,100,1),(7,'Storage Cleanup','storage_cleanup','core','Storage_Plugin_Job_Cleanup','Core_Form_Admin_Job_Generic',1,100,1),(8,'Rebuild Album Privacy','album_maintenance_rebuild_privacy','album','Album_Plugin_Job_Maintenance_RebuildPrivacy',NULL,1,50,1),(9,'Rebuild Group Privacy','group_maintenance_rebuild_privacy','group','Group_Plugin_Job_Maintenance_RebuildPrivacy',NULL,1,50,1);
/*!40000 ALTER TABLE `engine4_core_jobtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_languages`
--

DROP TABLE IF EXISTS `engine4_core_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_languages` (
  `language_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fallback` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_languages`
--

LOCK TABLES `engine4_core_languages` WRITE;
/*!40000 ALTER TABLE `engine4_core_languages` DISABLE KEYS */;
INSERT INTO `engine4_core_languages` VALUES (1,'en','English','en',1);
/*!40000 ALTER TABLE `engine4_core_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_likes`
--

DROP TABLE IF EXISTS `engine4_core_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_likes` (
  `like_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) unsigned NOT NULL,
  `poster_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `poster_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `resource_type` (`resource_type`,`resource_id`),
  KEY `poster_type` (`poster_type`,`poster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_likes`
--

LOCK TABLES `engine4_core_likes` WRITE;
/*!40000 ALTER TABLE `engine4_core_likes` DISABLE KEYS */;
INSERT INTO `engine4_core_likes` VALUES (1,'album_photo',1,'user',1),(2,'album_photo',1,'user',6);
/*!40000 ALTER TABLE `engine4_core_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_links`
--

DROP TABLE IF EXISTS `engine4_core_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_links` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(11) unsigned NOT NULL,
  `owner_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `view_count` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`link_id`),
  KEY `owner` (`owner_type`,`owner_id`),
  KEY `parent` (`parent_type`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_links`
--

LOCK TABLES `engine4_core_links` WRITE;
/*!40000 ALTER TABLE `engine4_core_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_listitems`
--

DROP TABLE IF EXISTS `engine4_core_listitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_listitems` (
  `listitem_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) unsigned NOT NULL,
  `child_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`listitem_id`),
  KEY `list_id` (`list_id`),
  KEY `child_id` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_listitems`
--

LOCK TABLES `engine4_core_listitems` WRITE;
/*!40000 ALTER TABLE `engine4_core_listitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_listitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_lists`
--

DROP TABLE IF EXISTS `engine4_core_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_lists` (
  `list_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  `child_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `child_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_id`),
  KEY `owner_type` (`owner_type`,`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_lists`
--

LOCK TABLES `engine4_core_lists` WRITE;
/*!40000 ALTER TABLE `engine4_core_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_log`
--

DROP TABLE IF EXISTS `engine4_core_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_log` (
  `message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `plugin` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(2) NOT NULL DEFAULT '6',
  `priorityName` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INFO',
  PRIMARY KEY (`message_id`),
  KEY `domain` (`domain`,`timestamp`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_log`
--

LOCK TABLES `engine4_core_log` WRITE;
/*!40000 ALTER TABLE `engine4_core_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_mail`
--

DROP TABLE IF EXISTS `engine4_core_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_mail` (
  `mail_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('system','zend') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(3) DEFAULT '100',
  `recipient_count` int(11) unsigned DEFAULT '0',
  `recipient_total` int(10) NOT NULL DEFAULT '0',
  `creation_time` datetime NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_mail`
--

LOCK TABLES `engine4_core_mail` WRITE;
/*!40000 ALTER TABLE `engine4_core_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_mailrecipients`
--

DROP TABLE IF EXISTS `engine4_core_mailrecipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_mailrecipients` (
  `recipient_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mail_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `email` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`recipient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_mailrecipients`
--

LOCK TABLES `engine4_core_mailrecipients` WRITE;
/*!40000 ALTER TABLE `engine4_core_mailrecipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_mailrecipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_mailtemplates`
--

DROP TABLE IF EXISTS `engine4_core_mailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_mailtemplates` (
  `mailtemplate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vars` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mailtemplate_id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_mailtemplates`
--

LOCK TABLES `engine4_core_mailtemplates` WRITE;
/*!40000 ALTER TABLE `engine4_core_mailtemplates` DISABLE KEYS */;
INSERT INTO `engine4_core_mailtemplates` VALUES (1,'header','core',''),(2,'footer','core',''),(3,'header_member','core',''),(4,'footer_member','core',''),(5,'core_contact','core','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_name],[sender_email],[sender_link],[sender_photo],[message]'),(6,'core_verification','core','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),(7,'core_verification_password','core','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link],[password]'),(8,'core_welcome','core','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),(9,'core_welcome_password','core','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link],[password]'),(10,'notify_admin_user_signup','core','[host],[email],[date],[recipient_title],[object_title],[object_link]'),(11,'core_lostpassword','core','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[object_link]'),(12,'notify_commented','activity','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(13,'notify_commented_commented','activity','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(14,'notify_liked','activity','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(15,'notify_liked_commented','activity','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(16,'user_account_approved','user','[host],[email],[recipient_title],[recipient_link],[recipient_photo]'),(17,'notify_friend_accepted','user','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(18,'notify_friend_request','user','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(19,'notify_friend_follow_request','user','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(20,'notify_friend_follow_accepted','user','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(21,'notify_friend_follow','user','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(22,'notify_post_user','user','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(23,'notify_tagged','user','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(24,'notify_message_new','messages','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(25,'invite','invite','[host],[email],[sender_email],[sender_title],[sender_link],[sender_photo],[message],[object_link],[code]'),(26,'invite_code','invite','[host],[email],[sender_email],[sender_title],[sender_link],[sender_photo],[message],[object_link],[code]'),(27,'payment_subscription_active','payment','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),(28,'payment_subscription_cancelled','payment','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),(29,'payment_subscription_expired','payment','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),(30,'payment_subscription_overdue','payment','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),(31,'payment_subscription_pending','payment','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),(32,'payment_subscription_recurrence','payment','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),(33,'payment_subscription_refunded','payment','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[subscription_title],[subscription_description],[object_link]'),(34,'notify_group_accepted','group','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(35,'notify_group_approve','group','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(36,'notify_group_discussion_reply','group','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(37,'notify_group_discussion_response','group','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(38,'notify_group_invite','group','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]'),(39,'notify_group_promote','group','[host],[email],[recipient_title],[recipient_link],[recipient_photo],[sender_title],[sender_link],[sender_photo],[object_title],[object_link],[object_photo],[object_description]');
/*!40000 ALTER TABLE `engine4_core_mailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_menuitems`
--

DROP TABLE IF EXISTS `engine4_core_menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_menuitems` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `module` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `label` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `params` text COLLATE utf8_unicode_ci NOT NULL,
  `menu` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `submenu` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `custom` tinyint(1) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `LOOKUP` (`name`,`order`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_menuitems`
--

LOCK TABLES `engine4_core_menuitems` WRITE;
/*!40000 ALTER TABLE `engine4_core_menuitems` DISABLE KEYS */;
INSERT INTO `engine4_core_menuitems` VALUES (1,'core_main_home','core','Home','User_Plugin_Menus','','core_main','',1,0,1),(2,'core_sitemap_home','core','Home','','{\"route\":\"default\"}','core_sitemap','',1,0,1),(3,'core_footer_privacy','core','Privacy','','{\"route\":\"default\",\"module\":\"core\",\"controller\":\"help\",\"action\":\"privacy\"}','core_footer','',1,0,1),(4,'core_footer_terms','core','Terms of Service','','{\"route\":\"default\",\"module\":\"core\",\"controller\":\"help\",\"action\":\"terms\"}','core_footer','',1,0,2),(5,'core_footer_contact','core','Contact','','{\"route\":\"default\",\"module\":\"core\",\"controller\":\"help\",\"action\":\"contact\"}','core_footer','',1,0,3),(6,'core_mini_admin','core','Admin','User_Plugin_Menus','','core_mini','',1,0,5),(7,'core_mini_profile','user','My Profile','User_Plugin_Menus','','core_mini','',1,0,2),(8,'core_mini_settings','user','Settings','User_Plugin_Menus','','core_mini','',1,0,4),(9,'core_mini_auth','user','Auth','User_Plugin_Menus','','core_mini','',1,0,6),(10,'core_mini_signup','user','Signup','User_Plugin_Menus','','core_mini','',1,0,1),(11,'core_admin_main_home','core','Home','','{\"route\":\"admin_default\"}','core_admin_main','',1,0,1),(12,'core_admin_main_manage','core','Manage','','{\"uri\":\"javascript:void(0);this.blur();\"}','core_admin_main','core_admin_main_manage',1,0,2),(13,'core_admin_main_settings','core','Settings','','{\"uri\":\"javascript:void(0);this.blur();\"}','core_admin_main','core_admin_main_settings',1,0,3),(14,'core_admin_main_plugins','core','Plugins','','{\"uri\":\"javascript:void(0);this.blur();\"}','core_admin_main','core_admin_main_plugins',1,0,4),(15,'core_admin_main_layout','core','Layout','','{\"uri\":\"javascript:void(0);this.blur();\"}','core_admin_main','core_admin_main_layout',1,0,5),(16,'core_admin_main_ads','core','Ads','','{\"uri\":\"javascript:void(0);this.blur();\"}','core_admin_main','core_admin_main_ads',1,0,6),(17,'core_admin_main_stats','core','Stats','','{\"uri\":\"javascript:void(0);this.blur();\"}','core_admin_main','core_admin_main_stats',1,0,8),(18,'core_admin_main_manage_levels','core','Member Levels','','{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\"}','core_admin_main_manage','',1,0,2),(19,'core_admin_main_manage_networks','network','Networks','','{\"route\":\"admin_default\",\"module\":\"network\",\"controller\":\"manage\"}','core_admin_main_manage','',1,0,3),(20,'core_admin_main_manage_announcements','announcement','Announcements','','{\"route\":\"admin_default\",\"module\":\"announcement\",\"controller\":\"manage\"}','core_admin_main_manage','',1,0,4),(21,'core_admin_message_mail','core','Email All Members','','{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"message\",\"action\":\"mail\"}','core_admin_main_manage','',1,0,5),(22,'core_admin_main_manage_reports','core','Abuse Reports','','{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"report\"}','core_admin_main_manage','',1,0,6),(23,'core_admin_main_manage_packages','core','Packages & Plugins','','{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"packages\"}','core_admin_main_manage','',1,0,7),(24,'core_admin_main_settings_general','core','General Settings','','{\"route\":\"core_admin_settings\",\"action\":\"general\"}','core_admin_main_settings','',1,0,1),(25,'core_admin_main_settings_locale','core','Locale Settings','','{\"route\":\"core_admin_settings\",\"action\":\"locale\"}','core_admin_main_settings','',1,0,1),(26,'core_admin_main_settings_fields','fields','Profile Questions','','{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"fields\"}','core_admin_main_settings','',1,0,2),(27,'core_admin_main_wibiya','core','Wibiya Integration','','{\"route\":\"admin_default\", \"action\":\"wibiya\", \"controller\":\"settings\", \"module\":\"core\"}','core_admin_main_settings','',1,0,4),(28,'core_admin_main_settings_spam','core','Spam & Banning Tools','','{\"route\":\"core_admin_settings\",\"action\":\"spam\"}','core_admin_main_settings','',1,0,5),(29,'core_admin_main_settings_mailtemplates','core','Mail Templates','','{\"route\":\"admin_default\",\"controller\":\"mail\",\"action\":\"templates\"}','core_admin_main_settings','',1,0,6),(30,'core_admin_main_settings_mailsettings','core','Mail Settings','','{\"route\":\"admin_default\",\"controller\":\"mail\",\"action\":\"settings\"}','core_admin_main_settings','',1,0,7),(31,'core_admin_main_settings_performance','core','Performance & Caching','','{\"route\":\"core_admin_settings\",\"action\":\"performance\"}','core_admin_main_settings','',1,0,8),(32,'core_admin_main_settings_password','core','Admin Password','','{\"route\":\"core_admin_settings\",\"action\":\"password\"}','core_admin_main_settings','',1,0,9),(33,'core_admin_main_settings_tasks','core','Task Scheduler','','{\"route\":\"admin_default\",\"controller\":\"tasks\"}','core_admin_main_settings','',1,0,10),(34,'core_admin_main_layout_content','core','Layout Editor','','{\"route\":\"admin_default\",\"controller\":\"content\"}','core_admin_main_layout','',1,0,1),(35,'core_admin_main_layout_themes','core','Theme Editor','','{\"route\":\"admin_default\",\"controller\":\"themes\"}','core_admin_main_layout','',1,0,2),(36,'core_admin_main_layout_files','core','File & Media Manager','','{\"route\":\"admin_default\",\"controller\":\"files\"}','core_admin_main_layout','',1,0,3),(37,'core_admin_main_layout_language','core','Language Manager','','{\"route\":\"admin_default\",\"controller\":\"language\"}','core_admin_main_layout','',1,0,4),(38,'core_admin_main_layout_menus','core','Menu Editor','','{\"route\":\"admin_default\",\"controller\":\"menus\"}','core_admin_main_layout','',1,0,5),(39,'core_admin_main_ads_manage','core','Manage Ad Campaigns','','{\"route\":\"admin_default\",\"controller\":\"ads\"}','core_admin_main_ads','',1,0,1),(40,'core_admin_main_ads_create','core','Create New Campaign','','{\"route\":\"admin_default\",\"controller\":\"ads\",\"action\":\"create\"}','core_admin_main_ads','',1,0,2),(41,'core_admin_main_ads_affiliate','core','SE Affiliate Program','','{\"route\":\"admin_default\",\"controller\":\"settings\",\"action\":\"affiliate\"}','core_admin_main_ads','',1,0,3),(42,'core_admin_main_ads_viglink','core','VigLink','','{\"route\":\"admin_default\",\"controller\":\"settings\",\"action\":\"viglink\"}','core_admin_main_ads','',1,0,4),(43,'core_admin_main_stats_statistics','core','Site-wide Statistics','','{\"route\":\"admin_default\",\"controller\":\"stats\"}','core_admin_main_stats','',1,0,1),(44,'core_admin_main_stats_url','core','Referring URLs','','{\"route\":\"admin_default\",\"controller\":\"stats\",\"action\":\"referrers\"}','core_admin_main_stats','',1,0,2),(45,'core_admin_main_stats_resources','core','Server Information','','{\"route\":\"admin_default\",\"controller\":\"system\"}','core_admin_main_stats','',1,0,3),(46,'core_admin_main_stats_logs','core','Log Browser','','{\"route\":\"admin_default\",\"controller\":\"log\",\"action\":\"index\"}','core_admin_main_stats','',1,0,3),(47,'core_admin_banning_general','core','Spam & Banning Tools','','{\"route\":\"core_admin_settings\",\"action\":\"spam\"}','core_admin_banning','',1,0,1),(48,'adcampaign_admin_main_edit','core','Edit Settings','','{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"ads\",\"action\":\"edit\"}','adcampaign_admin_main','',1,0,1),(49,'adcampaign_admin_main_manageads','core','Manage Advertisements','','{\"route\":\"admin_default\",\"module\":\"core\",\"controller\":\"ads\",\"action\":\"manageads\"}','adcampaign_admin_main','',1,0,2),(50,'core_admin_main_settings_activity','activity','Activity Feed Settings','','{\"route\":\"admin_default\",\"module\":\"activity\",\"controller\":\"settings\",\"action\":\"index\"}','core_admin_main_settings','',1,0,4),(51,'core_admin_main_settings_notifications','activity','Default Email Notifications','','{\"route\":\"admin_default\",\"module\":\"activity\",\"controller\":\"settings\",\"action\":\"notifications\"}','core_admin_main_settings','',1,0,11),(52,'authorization_admin_main_manage','authorization','View Member Levels','','{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\"}','authorization_admin_main','',1,0,1),(53,'authorization_admin_main_level','authorization','Member Level Settings','','{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\",\"action\":\"edit\"}','authorization_admin_main','',1,0,3),(54,'authorization_admin_level_main','authorization','Level Info','','{\"route\":\"admin_default\",\"module\":\"authorization\",\"controller\":\"level\",\"action\":\"edit\"}','authorization_admin_level','',1,0,1),(55,'core_main_user','user','Landlord','','{\"route\":\"user_general\",\"action\":\"browse\"}','core_main','',1,0,3),(56,'core_sitemap_user','user','Members','','{\"route\":\"user_general\",\"action\":\"browse\"}','core_sitemap','',1,0,2),(57,'user_home_updates','user','View Recent Updates','','{\"route\":\"recent_activity\",\"icon\":\"application/modules/User/externals/images/links/updates.png\"}','user_home','',1,0,5),(58,'user_home_view','user','View My Profile','User_Plugin_Menus','{\"route\":\"user_profile_self\",\"icon\":\"application/modules/User/externals/images/links/profile.png\"}','user_home','',1,0,2),(59,'user_home_edit','user','Edit My Profile','User_Plugin_Menus','{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"edit\",\"action\":\"profile\",\"icon\":\"application/modules/User/externals/images/links/edit.png\"}','user_home','',1,0,1),(60,'user_home_friends','user','Browse Members','','{\"route\":\"user_general\",\"controller\":\"index\",\"action\":\"browse\",\"icon\":\"application/modules/User/externals/images/links/search.png\"}','user_home','',1,0,3),(61,'user_profile_edit','user','Edit Profile','User_Plugin_Menus','','user_profile','',1,0,1),(62,'user_profile_friend','user','Friends','User_Plugin_Menus','','user_profile','',1,0,3),(63,'user_profile_block','user','Block','User_Plugin_Menus','','user_profile','',1,0,4),(64,'user_profile_report','user','Report User','User_Plugin_Menus','','user_profile','',1,0,5),(65,'user_profile_admin','user','Admin Settings','User_Plugin_Menus','','user_profile','',1,0,6),(66,'user_edit_profile','user','Personal Info','','{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"edit\",\"action\":\"profile\"}','user_edit','',1,0,1),(67,'user_edit_photo','user','Edit My Photo','','{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"edit\",\"action\":\"photo\"}','user_edit','',1,0,2),(68,'user_edit_style','user','Profile Style','User_Plugin_Menus','{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"edit\",\"action\":\"style\"}','user_edit','',1,0,3),(69,'user_settings_general','user','General','','{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"general\"}','user_settings','',1,0,1),(70,'user_settings_privacy','user','Privacy','','{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"privacy\"}','user_settings','',1,0,2),(71,'user_settings_notifications','user','Notifications','','{\"route\":\"user_extended\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"notifications\"}','user_settings','',1,0,3),(72,'user_settings_password','user','Change Password','','{\"route\":\"user_extended\", \"module\":\"user\", \"controller\":\"settings\", \"action\":\"password\"}','user_settings','',1,0,5),(73,'user_settings_delete','user','Delete Account','User_Plugin_Menus::canDelete','{\"route\":\"user_extended\", \"module\":\"user\", \"controller\":\"settings\", \"action\":\"delete\"}','user_settings','',1,0,6),(74,'core_admin_main_manage_members','user','Members','','{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"manage\"}','core_admin_main_manage','',1,0,1),(75,'core_admin_main_signup','user','Signup Process','','{\"route\":\"admin_default\", \"controller\":\"signup\", \"module\":\"user\"}','core_admin_main_settings','',1,0,3),(76,'core_admin_main_facebook','user','Facebook Integration','','{\"route\":\"admin_default\", \"action\":\"facebook\", \"controller\":\"settings\", \"module\":\"user\"}','core_admin_main_settings','',1,0,4),(77,'core_admin_main_twitter','user','Twitter Integration','','{\"route\":\"admin_default\", \"action\":\"twitter\", \"controller\":\"settings\", \"module\":\"user\"}','core_admin_main_settings','',1,0,4),(78,'core_admin_main_janrain','user','Janrain Integration','','{\"route\":\"admin_default\", \"action\":\"janrain\", \"controller\":\"settings\", \"module\":\"user\"}','core_admin_main_settings','',1,0,4),(79,'core_admin_main_settings_friends','user','Friendship Settings','','{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"friends\"}','core_admin_main_settings','',1,0,6),(80,'user_admin_banning_logins','user','Login History','','{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"logins\",\"action\":\"index\"}','core_admin_banning','',1,0,2),(81,'authorization_admin_level_user','user','Members','','{\"route\":\"admin_default\",\"module\":\"user\",\"controller\":\"settings\",\"action\":\"level\"}','authorization_admin_level','',1,0,2),(82,'core_mini_messages','messages','Messages','Messages_Plugin_Menus','','core_mini','',1,0,3),(83,'user_profile_message','messages','Send Message','Messages_Plugin_Menus','','user_profile','',1,0,2),(84,'authorization_admin_level_messages','messages','Messages','','{\"route\":\"admin_default\",\"module\":\"messages\",\"controller\":\"settings\",\"action\":\"level\"}','authorization_admin_level','',1,0,3),(85,'messages_main_inbox','messages','Inbox','','{\"route\":\"messages_general\",\"action\":\"inbox\"}','messages_main','',1,0,1),(86,'messages_main_outbox','messages','Sent Messages','','{\"route\":\"messages_general\",\"action\":\"outbox\"}','messages_main','',1,0,2),(87,'messages_main_compose','messages','Compose Message','','{\"route\":\"messages_general\",\"action\":\"compose\"}','messages_main','',1,0,3),(88,'user_settings_network','network','Networks','','{\"route\":\"user_extended\", \"module\":\"user\", \"controller\":\"settings\", \"action\":\"network\"}','user_settings','',1,0,3),(89,'core_main_invite','invite','Invite','Invite_Plugin_Menus::canInvite','{\"route\":\"default\",\"module\":\"invite\"}','core_main','',1,0,7),(90,'user_home_invite','invite','Invite Your Friends','Invite_Plugin_Menus::canInvite','{\"route\":\"default\",\"module\":\"invite\",\"icon\":\"application/modules/Invite/externals/images/invite.png\"}','user_home','',1,0,4),(91,'core_admin_main_settings_storage','core','Storage System','','{\"route\":\"admin_default\",\"module\":\"storage\",\"controller\":\"services\",\"action\":\"index\"}','core_admin_main_settings','',1,0,11),(92,'user_settings_payment','user','Subscription','Payment_Plugin_Menus','{\"route\":\"default\", \"module\":\"payment\", \"controller\":\"settings\", \"action\":\"index\"}','user_settings','',1,0,4),(93,'core_admin_main_payment','payment','Billing','','{\"uri\":\"javascript:void(0);this.blur();\"}','core_admin_main','core_admin_main_payment',1,0,7),(94,'core_admin_main_payment_transactions','payment','Transactions','','{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"index\",\"action\":\"index\"}','core_admin_main_payment','',1,0,1),(95,'core_admin_main_payment_settings','payment','Settings','','{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"settings\",\"action\":\"index\"}','core_admin_main_payment','',1,0,2),(96,'core_admin_main_payment_gateways','payment','Gateways','','{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"gateway\",\"action\":\"index\"}','core_admin_main_payment','',1,0,3),(97,'core_admin_main_payment_packages','payment','Plans','','{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"package\",\"action\":\"index\"}','core_admin_main_payment','',1,0,4),(98,'core_admin_main_payment_subscriptions','payment','Subscriptions','','{\"route\":\"admin_default\",\"module\":\"payment\",\"controller\":\"subscription\",\"action\":\"index\"}','core_admin_main_payment','',1,0,5),(99,'core_main_album','album','Gallery','','{\"route\":\"album_general\",\"action\":\"browse\"}','core_main','',1,0,6),(100,'core_sitemap_album','album','Gallery','','{\"route\":\"album_general\",\"action\":\"browse\"}','core_sitemap','',1,0,4),(101,'album_main_browse','album','Browse Albums','Album_Plugin_Menus::canViewAlbums','{\"route\":\"album_general\",\"action\":\"browse\"}','album_main','',1,0,1),(102,'album_main_manage','album','My Albums','Album_Plugin_Menus::canCreateAlbums','{\"route\":\"album_general\",\"action\":\"manage\"}','album_main','',1,0,2),(103,'album_main_upload','album','Add New Photos','Album_Plugin_Menus::canCreateAlbums','{\"route\":\"album_general\",\"action\":\"upload\"}','album_main','',1,0,3),(104,'album_quick_upload','album','Add New Photos','Album_Plugin_Menus::canCreateAlbums','{\"route\":\"album_general\",\"action\":\"upload\",\"class\":\"buttonlink icon_photos_new\"}','album_quick','',1,0,1),(105,'core_admin_main_plugins_album','album','Photo Albums','','{\"route\":\"admin_default\",\"module\":\"album\",\"controller\":\"manage\",\"action\":\"index\"}','core_admin_main_plugins','',1,0,999),(106,'album_admin_main_manage','album','View Albums','','{\"route\":\"admin_default\",\"module\":\"album\",\"controller\":\"manage\"}','album_admin_main','',1,0,1),(107,'album_admin_main_settings','album','Global Settings','','{\"route\":\"admin_default\",\"module\":\"album\",\"controller\":\"settings\"}','album_admin_main','',1,0,2),(108,'album_admin_main_level','album','Member Level Settings','','{\"route\":\"admin_default\",\"module\":\"album\",\"controller\":\"level\"}','album_admin_main','',1,0,3),(109,'album_admin_main_categories','album','Categories','','{\"route\":\"admin_default\",\"module\":\"album\",\"controller\":\"settings\", \"action\":\"categories\"}','album_admin_main','',1,0,4),(110,'authorization_admin_level_album','album','Photo Albums','','{\"route\":\"admin_default\",\"module\":\"album\",\"controller\":\"level\",\"action\":\"index\"}','authorization_admin_level','',1,0,999),(111,'mobi_browse_album','album','Albums','','{\"route\":\"album_general\",\"action\":\"browse\"}','mobi_browse','',1,0,2),(112,'core_main_group','group','Associations','','{\"route\":\"group_general\"}','core_main','',1,0,5),(113,'core_sitemap_group','group','Associations','','{\"route\":\"group_general\"}','core_sitemap','',1,0,3),(114,'group_main_browse','group','Browse Groups','','{\"route\":\"group_general\",\"action\":\"browse\"}','group_main','',1,0,1),(115,'group_main_manage','group','My Groups','Group_Plugin_Menus','{\"route\":\"group_general\",\"action\":\"manage\"}','group_main','',1,0,2),(116,'group_main_create','group','Create New Group','Group_Plugin_Menus','{\"route\":\"group_general\",\"action\":\"create\"}','group_main','',1,0,3),(117,'group_quick_create','group','Create New Group','Group_Plugin_Menus::canCreateGroups','{\"route\":\"group_general\",\"action\":\"create\",\"class\":\"buttonlink icon_group_new\"}','group_quick','',1,0,1),(118,'group_profile_edit','group','Edit Profile','Group_Plugin_Menus','','group_profile','',1,0,1),(119,'group_profile_style','group','Edit Styles','Group_Plugin_Menus','','group_profile','',1,0,2),(120,'group_profile_member','group','Member','Group_Plugin_Menus','','group_profile','',1,0,3),(121,'group_profile_report','group','Report Group','Group_Plugin_Menus','','group_profile','',1,0,4),(122,'group_profile_share','group','Share','Group_Plugin_Menus','','group_profile','',1,0,5),(123,'group_profile_invite','group','Invite','Group_Plugin_Menus','','group_profile','',1,0,6),(124,'group_profile_message','group','Message Members','Group_Plugin_Menus','','group_profile','',1,0,7),(125,'core_admin_main_plugins_group','group','Groups','','{\"route\":\"admin_default\",\"module\":\"group\",\"controller\":\"manage\"}','core_admin_main_plugins','',1,0,999),(126,'group_admin_main_manage','group','Manage Groups','','{\"route\":\"admin_default\",\"module\":\"group\",\"controller\":\"manage\"}','group_admin_main','',1,0,1),(127,'group_admin_main_settings','group','Global Settings','','{\"route\":\"admin_default\",\"module\":\"group\",\"controller\":\"settings\"}','group_admin_main','',1,0,2),(128,'group_admin_main_level','group','Member Level Settings','','{\"route\":\"admin_default\",\"module\":\"group\",\"controller\":\"settings\",\"action\":\"level\"}','group_admin_main','',1,0,3),(129,'group_admin_main_categories','group','Categories','','{\"route\":\"admin_default\",\"module\":\"group\",\"controller\":\"settings\",\"action\":\"categories\"}','group_admin_main','',1,0,4),(130,'authorization_admin_level_group','group','Groups','','{\"route\":\"admin_default\",\"module\":\"group\",\"controller\":\"settings\",\"action\":\"level\"}','authorization_admin_level','',1,0,999),(131,'mobi_browse_group','group','Groups','','{\"route\":\"group_general\"}','mobi_browse','',1,0,8),(133,'custom_133','core','Tenants','','{\"uri\":\"www.rentstarz.com\\/pages\\/tenant\",\"icon\":\"\"}','core_main','',1,1,4),(134,'core_admin_plugins_younet_core','younet-core','YouNet Core','','{\"route\":\"admin_default\",\"module\":\"younet-core\",\"controller\":\"settings\",\"action\":\"yours\"}','core_admin_main_plugins','',1,0,1),(135,'younet_core_admin_main_yours','younet-core','Your Plugins','','{\"route\":\"admin_default\",\"module\":\"younet-core\",\"controller\":\"settings\",\"action\":\"yours\"}','younet_core_admin_main','',1,0,2),(136,'younet_core_admin_main_younet','younet-core','YouNet Plugins','','{\"route\":\"admin_default\",\"module\":\"younet-core\",\"controller\":\"settings\",\"action\":\"younet\"}','younet_core_admin_main','',1,0,1),(137,'younet_core_admin_main_info','younet-core','License Term','','{\"route\":\"admin_default\",\"module\":\"younet-core\",\"controller\":\"settings\",\"action\":\"information\"}','younet_core_admin_main','',1,0,3),(138,'core_admin_main_plugins_ynresponsive1','ynresponsive1','YN - Responsive','','{\"route\":\"admin_default\",\"module\":\"ynresponsive1\",\"controller\":\"settings\"}','core_admin_main_plugins','',1,0,999),(139,'ynresponsive1_admin_main_settings','ynresponsive1','Global Settings','','{\"route\":\"admin_default\",\"module\":\"ynresponsive1\",\"controller\":\"settings\"}','ynresponsive1_admin_main','',1,0,1),(140,'yntheme_admin_main_settings','yntheme','Global Settings',NULL,'{\"route\":\"admin_default\",\"module\":\"yntheme\",\"controller\":\"settings\"}','yntheme_admin_main',NULL,1,0,999),(141,'yntheme_admin_main_themes','yntheme','Themes',NULL,'{\"route\":\"admin_default\",\"module\":\"yntheme\",\"controller\":\"themes\"}','yntheme_admin_main',NULL,1,0,999),(142,'core_admin_main_plugins_yntheme','yntheme','YouNet Themes',NULL,'{\"route\":\"admin_default\",\"module\":\"yntheme\",\"controller\":\"themes\"}','core_admin_main_plugins',NULL,0,0,999),(143,'core_admin_main_plugins_ynresponsivepurity','ynresponsivepurity','YN - Responsive Purity','','{\"route\":\"admin_default\",\"module\":\"ynresponsivepurity\",\"controller\":\"manage-slider\"}','core_admin_main_plugins','',1,0,999),(144,'ynresponsivepurity_admin_main_manage_slider','ynresponsivepurity','Manage Slider','','{\"route\":\"admin_default\",\"module\":\"ynresponsivepurity\",\"controller\":\"manage-slider\"}','ynresponsivepurity_admin_main','',1,0,1),(145,'ynresponsivepurity_admin_main_manage_welcome','ynresponsivepurity','Manage Welcome Blocks','','{\"route\":\"admin_default\",\"module\":\"ynresponsivepurity\",\"controller\":\"manage-welcome\"}','ynresponsivepurity_admin_main','',1,0,2),(146,'ynresponsivepurity_admin_main_manage_module','ynresponsivepurity','Manage Modules','','{\"route\":\"admin_default\",\"module\":\"ynresponsivepurity\",\"controller\":\"manage-module\"}','ynresponsivepurity_admin_main','',1,0,3),(147,'core_main_dashboard','core','Profile','Ynresponsive1_Plugin_Menus','{\"route\":\"dashboard_general\"}','core_main','',1,0,2);
/*!40000 ALTER TABLE `engine4_core_menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_menus`
--

DROP TABLE IF EXISTS `engine4_core_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `type` enum('standard','hidden','custom') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'standard',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(3) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_menus`
--

LOCK TABLES `engine4_core_menus` WRITE;
/*!40000 ALTER TABLE `engine4_core_menus` DISABLE KEYS */;
INSERT INTO `engine4_core_menus` VALUES (1,'core_main','standard','Main Navigation Menu',1),(2,'core_mini','standard','Mini Navigation Menu',2),(3,'core_footer','standard','Footer Menu',3),(4,'core_sitemap','standard','Sitemap',4),(5,'user_home','standard','Member Home Quick Links Menu',999),(6,'user_profile','standard','Member Profile Options Menu',999),(7,'user_edit','standard','Member Edit Profile Navigation Menu',999),(8,'user_browse','standard','Member Browse Navigation Menu',999),(9,'user_settings','standard','Member Settings Navigation Menu',999),(10,'messages_main','standard','Messages Main Navigation Menu',999),(11,'album_main','standard','Album Main Navigation Menu',999),(12,'album_quick','standard','Album Quick Navigation Menu',999),(13,'group_main','standard','Group Main Navigation Menu',999),(14,'group_profile','standard','Group Profile Options Menu',999);
/*!40000 ALTER TABLE `engine4_core_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_migrations`
--

DROP TABLE IF EXISTS `engine4_core_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_migrations` (
  `package` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `current` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`package`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_migrations`
--

LOCK TABLES `engine4_core_migrations` WRITE;
/*!40000 ALTER TABLE `engine4_core_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_modules`
--

DROP TABLE IF EXISTS `engine4_core_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_modules` (
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `version` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('core','standard','extra') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'extra',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_modules`
--

LOCK TABLES `engine4_core_modules` WRITE;
/*!40000 ALTER TABLE `engine4_core_modules` DISABLE KEYS */;
INSERT INTO `engine4_core_modules` VALUES ('activity','Activity','Activity','4.8.10',1,'core'),('album','Albums','Albums','4.8.9',1,'extra'),('announcement','Announcements','Announcements','4.8.0',1,'standard'),('authorization','Authorization','Authorization','4.7.0',1,'core'),('core','Core','Core','4.8.10',1,'core'),('fields','Fields','Fields','4.8.10',1,'core'),('group','Groups','Groups','4.8.10',1,'extra'),('invite','Invite','Invite','4.8.7',1,'standard'),('messages','Messages','Messages','4.8.7',1,'standard'),('network','Networks','Networks','4.8.6',1,'standard'),('payment','Payment','Payment','4.8.10',1,'standard'),('storage','Storage','Storage','4.8.9',1,'core'),('user','Members','Members','4.8.10',1,'core'),('ynresponsive1','YN - Responsive Core','YouNet Responsive Module','4.05',1,'extra'),('ynresponsivepurity','YN - Responsive Purity Template','Responsive Purity Template','4.01',1,'extra'),('yntheme','YN - Themes Core','Manage YouNet Themes','4.04p1',1,'extra'),('younet-core','YN - Core Module','YouNet Core Module','4.02p9',1,'extra');
/*!40000 ALTER TABLE `engine4_core_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_nodes`
--

DROP TABLE IF EXISTS `engine4_core_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_nodes` (
  `node_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `signature` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `first_seen` datetime NOT NULL,
  `last_seen` datetime NOT NULL,
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `signature` (`signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_nodes`
--

LOCK TABLES `engine4_core_nodes` WRITE;
/*!40000 ALTER TABLE `engine4_core_nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_pages`
--

DROP TABLE IF EXISTS `engine4_core_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_pages` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `displayname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `custom` tinyint(1) NOT NULL DEFAULT '1',
  `fragment` tinyint(1) NOT NULL DEFAULT '0',
  `layout` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `levels` text COLLATE utf8_unicode_ci,
  `provides` text COLLATE utf8_unicode_ci,
  `view_count` int(11) unsigned NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_pages`
--

LOCK TABLES `engine4_core_pages` WRITE;
/*!40000 ALTER TABLE `engine4_core_pages` DISABLE KEYS */;
INSERT INTO `engine4_core_pages` VALUES (1,'header','Site Header',NULL,'','','',0,1,'',NULL,'header-footer',0,0),(2,'footer','Site Footer',NULL,'','','',0,1,'',NULL,'header-footer',0,0),(3,'core_index_index','Landing Page',NULL,'Landing Page','This is your site\'s landing page.','rentstarz',0,0,'default',NULL,'no-viewer;no-subject',0,1),(4,'user_index_home','Member Home Page',NULL,'Member Home Page','This is the home page for members.','',0,0,'',NULL,'viewer;no-subject',0,0),(5,'user_profile_index','Member Profile',NULL,'Member Profile','This is a member\'s profile.','',0,0,'',NULL,'subject=user',0,0),(6,'core_help_contact','Contact Page',NULL,'Contact Us','This is the contact page','',0,0,'',NULL,'no-viewer;no-subject',0,0),(7,'core_help_privacy','Privacy Page',NULL,'Privacy Policy','This is the privacy policy page','',0,0,'',NULL,'no-viewer;no-subject',0,0),(8,'core_help_terms','Terms of Service Page',NULL,'Terms of Service','This is the terms of service page','',0,0,'',NULL,'no-viewer;no-subject',0,0),(9,'core_error_requireuser','Sign-in Required Page',NULL,'Sign-in Required','','',0,0,'',NULL,NULL,0,0),(10,'core_search_index','Search Page',NULL,'Search Results','','',0,0,'',NULL,NULL,0,0),(11,'user_auth_login','Sign-in Page',NULL,'Sign-in','This is the site sign-in page.','',0,0,'',NULL,NULL,0,0),(12,'user_signup_index','Sign-up Page',NULL,'Sign-up','This is the site sign-up page.','',0,0,'',NULL,NULL,0,0),(13,'user_auth_forgot','Forgot Password Page',NULL,'Forgot Password','This is the site forgot password page.','',0,0,'',NULL,NULL,0,0),(14,'user_settings_general','User General Settings Page',NULL,'General','This page is the user general settings page.','',0,0,'',NULL,NULL,0,0),(15,'user_settings_privacy','User Privacy Settings Page',NULL,'Privacy','This page is the user privacy settings page.','',0,0,'',NULL,NULL,0,0),(16,'user_settings_network','User Networks Settings Page',NULL,'Networks','This page is the user networks settings page.','',0,0,'',NULL,NULL,0,0),(17,'user_settings_notifications','User Notifications Settings Page',NULL,'Notifications','This page is the user notification settings page.','',0,0,'',NULL,NULL,0,0),(18,'user_settings_password','User Change Password Settings Page',NULL,'Change Password','This page is the change password page.','',0,0,'',NULL,NULL,0,0),(19,'user_settings_delete','User Delete Account Settings Page',NULL,'Delete Account','This page is the delete accout page.','',0,0,'',NULL,NULL,0,0),(20,'user_index_browse','Member Browse Page',NULL,'Member Browse','This page show member lists.','',0,0,'',NULL,NULL,0,0),(21,'invite_index_index','Invite Page',NULL,'Invite','','',0,0,'',NULL,NULL,0,0),(22,'messages_messages_compose','Messages Compose Page',NULL,'Compose','','',0,0,'',NULL,NULL,0,0),(23,'messages_messages_inbox','Messages Inbox Page',NULL,'Inbox','','',0,0,'',NULL,NULL,0,0),(24,'messages_messages_outbox','Messages Outbox Page',NULL,'Inbox','','',0,0,'',NULL,NULL,0,0),(25,'messages_messages_search','Messages Search Page',NULL,'Search','','',0,0,'',NULL,NULL,0,0),(26,'messages_messages_view','Messages View Page',NULL,'My Message','','',0,0,'',NULL,NULL,0,0),(27,'album_photo_view','Album Photo View Page',NULL,'Album Photo View','This page displays an album\'s photo.','',0,0,'',NULL,'subject=album_photo',0,0),(28,'album_album_view','Album View Page',NULL,'Album View','This page displays an album\'s photos.','',0,0,'',NULL,'subject=album',0,0),(29,'album_index_browse','Album Browse Page',NULL,'Album Browse','This page lists album entries.','',0,0,'',NULL,NULL,0,0),(30,'album_index_upload','Album Create Page',NULL,'Add New Photos','This page is the album create page.','',0,0,'',NULL,NULL,0,0),(31,'album_index_manage','Album Manage Page',NULL,'My Albums','This page lists album a user\'s albums.','',0,0,'',NULL,NULL,0,0),(32,'group_profile_index','Group Profile',NULL,'Group Profile','This is the profile for an group.','',0,0,'',NULL,'subject=group',0,0),(33,'mobi_group_profile','Mobile Group Profile',NULL,'Mobile Group Profile','This is the mobile verison of a group profile.','',0,0,'',NULL,NULL,0,0),(34,'group_index_browse','Group Browse Page',NULL,'Group Browse','This page lists groups.','',0,0,'',NULL,NULL,0,0),(35,'group_index_create','Group Create Page',NULL,'Group Create','This page allows users to create groups.','',0,0,'',NULL,NULL,0,0),(36,'group_index_manage','Group Manage Page',NULL,'My Groups','This page lists a user\'s groups.','',0,0,'',NULL,NULL,0,0),(39,NULL,'Documents','documents','Documents','','',1,0,'','[\"5\"]','no-subject',0,1),(41,NULL,'Tenants','www-rentstarz-com-pages-tenant','Tenant','this is the tenant browse page','tenants, landlord, for rent apartment',1,0,'','[\"4\"]','no-subject',0,1),(42,'ynresponsive1_index_dashboard','Dashboard Page',NULL,'Dashboard Page','This is your site\'s dashboard page.','',1,0,'',NULL,NULL,0,0);
/*!40000 ALTER TABLE `engine4_core_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_processes`
--

DROP TABLE IF EXISTS `engine4_core_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_processes` (
  `pid` int(10) unsigned NOT NULL,
  `parent_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `system_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `started` int(10) unsigned NOT NULL,
  `timeout` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_processes`
--

LOCK TABLES `engine4_core_processes` WRITE;
/*!40000 ALTER TABLE `engine4_core_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_referrers`
--

DROP TABLE IF EXISTS `engine4_core_referrers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_referrers` (
  `host` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `query` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) unsigned NOT NULL,
  PRIMARY KEY (`host`,`path`,`query`),
  KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_referrers`
--

LOCK TABLES `engine4_core_referrers` WRITE;
/*!40000 ALTER TABLE `engine4_core_referrers` DISABLE KEYS */;
INSERT INTO `engine4_core_referrers` VALUES ('','rentstarz.com','',1),('59900546.responsive-test.net','/','',1),('avid.force.com','/pkb/articles/en_us/faq/lost-stolen-or-broken-ilok-policy','',1),('baidu.com','/s','wd=rentstarz-landingpage',1),('bing.com','','',1),('domainsigma.com','/whois/rentstarz.com','',1),('domainsigma.com','/whois/suitecontact.com','',1),('google.com.my','/search','q=anything&ie=utf-8',1),('my.tmdhosting.com','/admin/tickets/view/647430/ccname/virgin','',1),('my.tmdhosting.com','/admin/tickets/view/926569/ccname/active','',1),('my.tmdhosting.com','/admin/tickets/view/926569/ccname/virgin','',1),('whois.domaintools.com','/rentstarz.com','',1),('whois.domaintools.com','/suitecontact.com','',1),('','blank','',2),('','suitecontact.com','',2),('buttons-for-website.com','','',2),('google.com','','',2),('google.com','/search','q=rent%20starz.com&aq=f&aqi=g147&aql=&oq=&gs_rfai=',2),('m.baidu.com','/s','wd=rentstarz-landingpage',2),('search.yahoo.com','/','',2),('burger-imperia.com','/','',3),('','suitecontact.com/store','',4),('top1-seo-service.com','/try.php','u=http://suitecontact.com',6),('google.com','/search','q=bulletproof&rlz=1cdgoyi_enus649us649&oq=bullet&aqs=chrome.1.69i57j0l3.5540j0j9&hl=en-us&sourceid=chrome-mobile&ie=utf-8',13),('google.com','/','',15);
/*!40000 ALTER TABLE `engine4_core_referrers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_reports`
--

DROP TABLE IF EXISTS `engine4_core_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `subject_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subject_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`report_id`),
  KEY `category` (`category`),
  KEY `user_id` (`user_id`),
  KEY `read` (`read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_reports`
--

LOCK TABLES `engine4_core_reports` WRITE;
/*!40000 ALTER TABLE `engine4_core_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_routes`
--

DROP TABLE IF EXISTS `engine4_core_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_routes` (
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`),
  KEY `order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_routes`
--

LOCK TABLES `engine4_core_routes` WRITE;
/*!40000 ALTER TABLE `engine4_core_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_search`
--

DROP TABLE IF EXISTS `engine4_core_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_search` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hidden` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type`,`id`),
  FULLTEXT KEY `LOOKUP` (`title`,`description`,`keywords`,`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_search`
--

LOCK TABLES `engine4_core_search` WRITE;
/*!40000 ALTER TABLE `engine4_core_search` DISABLE KEYS */;
INSERT INTO `engine4_core_search` VALUES ('user',2,'Xavier Dor','','',''),('user',7,'jithesh pk','','',''),('album',1,'Profile Photos','','',''),('user',1,'mic b','','',''),('user',4,'Manish Jha','','',''),('user',6,'Judith Hinds','','','');
/*!40000 ALTER TABLE `engine4_core_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_serviceproviders`
--

DROP TABLE IF EXISTS `engine4_core_serviceproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_serviceproviders` (
  `serviceprovider_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `class` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceprovider_id`),
  UNIQUE KEY `type` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_serviceproviders`
--

LOCK TABLES `engine4_core_serviceproviders` WRITE;
/*!40000 ALTER TABLE `engine4_core_serviceproviders` DISABLE KEYS */;
INSERT INTO `engine4_core_serviceproviders` VALUES (1,'MySQL','database','mysql','Engine_ServiceLocator_Plugin_Database_Mysql',1),(2,'PDO MySQL','database','mysql_pdo','Engine_ServiceLocator_Plugin_Database_MysqlPdo',1),(3,'MySQLi','database','mysqli','Engine_ServiceLocator_Plugin_Database_Mysqli',1),(4,'File','cache','file','Engine_ServiceLocator_Plugin_Cache_File',1),(5,'APC','cache','apc','Engine_ServiceLocator_Plugin_Cache_Apc',1),(6,'Memcache','cache','memcached','Engine_ServiceLocator_Plugin_Cache_Memcached',1),(7,'Simple','captcha','image','Engine_ServiceLocator_Plugin_Captcha_Image',1),(8,'ReCaptcha','captcha','recaptcha','Engine_ServiceLocator_Plugin_Captcha_Recaptcha',1),(9,'SMTP','mail','smtp','Engine_ServiceLocator_Plugin_Mail_Smtp',1),(10,'Sendmail','mail','sendmail','Engine_ServiceLocator_Plugin_Mail_Sendmail',1),(11,'GD','image','gd','Engine_ServiceLocator_Plugin_Image_Gd',1),(12,'Imagick','image','imagick','Engine_ServiceLocator_Plugin_Image_Imagick',1),(13,'Akismet','akismet','standard','Engine_ServiceLocator_Plugin_Akismet',1);
/*!40000 ALTER TABLE `engine4_core_serviceproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_services`
--

DROP TABLE IF EXISTS `engine4_core_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_services` (
  `service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `profile` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'default',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `type` (`type`,`profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_services`
--

LOCK TABLES `engine4_core_services` WRITE;
/*!40000 ALTER TABLE `engine4_core_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_servicetypes`
--

DROP TABLE IF EXISTS `engine4_core_servicetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_servicetypes` (
  `servicetype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `interface` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicetype_id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_servicetypes`
--

LOCK TABLES `engine4_core_servicetypes` WRITE;
/*!40000 ALTER TABLE `engine4_core_servicetypes` DISABLE KEYS */;
INSERT INTO `engine4_core_servicetypes` VALUES (1,'Database','database','Zend_Db_Adapter_Abstract',1),(2,'Cache','cache','Zend_Cache_Backend',1),(3,'Captcha','captcha','Zend_Captcha_Adapter',1),(4,'Mail Transport','mail','Zend_Mail_Transport_Abstract',1),(5,'Image','image','Engine_Image_Adapter_Abstract',1),(6,'Akismet','akismet','Zend_Service_Akismet',1);
/*!40000 ALTER TABLE `engine4_core_servicetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_session`
--

DROP TABLE IF EXISTS `engine4_core_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_session` (
  `id` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_session`
--

LOCK TABLES `engine4_core_session` WRITE;
/*!40000 ALTER TABLE `engine4_core_session` DISABLE KEYS */;
INSERT INTO `engine4_core_session` VALUES ('0017660a06daa0f8f32e46dc246f8525',1461785856,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('004303ffe43cbe757a53affa08a0ff4a',1461784276,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('00538d03054d5e5db9637a4425aa3420',1461709054,1209600,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}redirectURL|s:6:\"/login\";Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:3:\"143\";twitter_lock|i:1;twitter_uid|b:0;ActivityFormToken|a:1:{s:5:\"token\";s:32:\"4bca9b99144aa10d68a88589447b6b21\";}',1),('070c4d04510af4c7956d8bafe13aaa1c',1461824337,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('07fd4f1de9039a48cd0f4a519030eee1',1461785296,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('08c2c35e59428b0e245c2cfcd7e1ea9b',1461821753,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('0c551e660014faef6914a20b8b7d52b5',1461764121,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('0cc57f879d7544d62aa41faae2359b94',1461814526,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('0ce5e0d277669885c335e64bd97c1811',1461821544,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('0d2a98dcf8ac26135de3c97f40412810',1461820996,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('0faf9b55bf0398f4ac8df605d7f7efa9',1461787002,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('17b2929810aabc32ee9e553f668a1f1f',1461821144,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('1a6fb5f55472d318185ddd9a682258a9',1461824012,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('1d20b06209ca873cebf909791a58ab79',1461784336,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('206b3e74ea2fa461777adf03b8ca7de0',1461192260,1209600,'redirectURL|s:6:\"/login\";ActivityFormToken|a:1:{s:5:\"token\";s:32:\"7f8ce5fe05ec299f15e8dded0bd73a05\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"71\";twitter_lock|i:1;twitter_uid|b:0;',1),('208ad5e4ee7ae9ea7aeaa2b727c68ce7',1461782910,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('24e4aa01bc27265cef613e0958be16b5',1461815532,1209600,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}redirectURL|s:6:\"/login\";twitter_uid|b:0;ActivityFormToken|a:1:{s:5:\"token\";s:32:\"e41c7b7d3517acccc809f1098b370fa8\";}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:3:\"161\";twitter_lock|i:1;',1),('2b06df6ccea809e81f5fe82c529fdb9b',1461791445,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('2dda2c0dd3f61190a52e9eed8c58cfd1',1461813925,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('2e074bb26862fdb9af3530a19b4b73ee',1461785451,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('2e86610ee228e35bc208a3ce5bb04066',1461785795,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('3353bdea4264fa1a2420d17bb4583efb',1461759560,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('3543e5ebd278127756df371f4fb83bc2',1461824496,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('359a58e04d6dc8d57275e3c19c191bac',1461820638,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('3bb9f2fdd14ad3f3af5990531314c403',1461736060,1209600,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}redirectURL|s:6:\"/login\";',1),('3bfc684f226db6db07368331d23a122d',1461791093,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('3cbb7c0f0e7ec6d91d2b06167035f5e0',1461773573,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('3e47d2ab48770dc42e2e33cd13161e00',1461806259,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('406721698d01330452c45a23c5613739',1461827307,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('410783bd1bf1e0a7cee8dc89aff2d882',1461820778,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('4147f008b75bb61cb177982a885b4531',1461821475,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('41d184101549f51a74b4dc6e2f9f5bb7',1461791701,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('44f572f6a84d494c9ec627769541c023',1461820178,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('459448e5a5205a17f2c644f430ae33da',1461803913,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('4bb491fcbb577e76e304a984f5e9db5c',1461783973,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('4d141975c07701712fb1b79a9703e417',1461766435,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('4e2803e6950572d7d02c8687e8989a6b',1461829728,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('4f962d325c7444bf933180c17dfaff90',1461780801,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('523e1b3f2b3fce0adbc32325be56a76e',1461821924,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('52b1d4cff010396b8aabe1653c10d25a',1461823527,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('55915a6db9dd70f8a42237998d579093',1461798938,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('55abecd6923a7287cc61c985868eb93a',1461787685,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('58fb5791e33c4187f8968a62974c1a3c',1461802645,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('5af07ae66c9ee6f7b39c6004c20d93cc',1461798939,1209600,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}Signup_Confirm|a:3:{s:8:\"approved\";i:1;s:8:\"verified\";i:0;s:7:\"enabled\";i:0;}redirectURL|s:6:\"/login\";twitter_uid|b:0;ActivityFormToken|a:1:{s:5:\"token\";s:32:\"da1f5c211129251fc10d0b33ba26c285\";}Zend_Auth|a:1:{s:7:\"storage\";i:6;}login_id|s:3:\"157\";twitter_lock|i:6;',6),('62d9037be1eaf3d1b8291cefd336cbf8',1461787786,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('644d82c1e8502f7343cafbbcf252fcab',1461810717,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('64846a28c0072ec19d37522dcf0f9a39',1461820179,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('6869ea74bb39dea5b1a778dbc51f1339',1461829727,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('69ebec5f0497402618e00b36241cdddd',1461787685,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('6a5338a0554804f8fcc22ea43b97be2c',1461785520,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('6ba3b41ec463abae020f4250f5dae5ec',1461758391,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('6e3385e74ccf41deafb5956b7130c4ac',1461787141,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('6e8adfd620bd5a0c6eacfd60faf880ff',1461814467,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('765270d7dba990315a4ad439efa95e91',1461815738,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('76726a0049dfb630fc3c423ee3345775',1461829856,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('76c7c2da7b44ac422edbd09789f71939',1461796471,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('784f0a83315e4fb337f55780cd53e701',1461784167,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('7a837a3930efb1b2b56ba2e25a501493',1461814268,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('7aaf82804ad8e21d8b6cc142b6c7c078',1461823894,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('7d8f22a14a20ad5e51453c0f7e07ca35',1461789893,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('819baf095c0892077452112b505c68f4',1461791640,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('82a308314caaa73d95143657d65f58bf',1461821080,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('83b05cd77f1440031af91e8770adbe90',1461815413,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('8452468e27a9b6624b35352039592f5a',1461824072,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('8b4121fecc30618b2b02d54f59317c64',1461787435,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('8b6f0622b5ec8e180822b4adba4afe8e',1461814467,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('8d1ab8cbf9974b9a2c99e8b958f61c7a',1461791369,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('8d66b6a65c499d23c264d7d2670fbd6c',1461762925,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Fields|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Photo|a:1:{s:6:\"active\";b:1;}User_Plugin_Signup_Invite|a:1:{s:6:\"active\";b:1;}',NULL),('8f46d069562885ffe89e454cbd40f0a2',1461810713,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('8f7c744fa4346d2801618ab26c4d6b06',1461814586,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('8fd6eea190ebb85420f6938da84bc6df',1461820900,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('9179b8fc021b7b1d582829ba09b5c804',1461791242,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('957c775ed35471f1d6ffd186d29ce487',1461798714,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('97e553baf30dc1cb1b3d42cb98ab1ac3',1461762392,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('988ef647d7ee82d10eb58ec5ebc917e7',1461796814,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('99f7c7c3cc136aebdc3ff9a5d051795d',1461787205,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('a0d6baa384ce21b7dd5c39d848d147fe',1461786024,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('a1494e81c58ea0775668ba5744491068',1461766435,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('a3a8a99790035acc6898a23cc8d6d5a5',1461824133,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('a3cf65bfc30901d3e7cf2b040b812b7f',1461821860,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('a3da28d852ebcb455be5a96e69f15b70',1461823383,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('a41108a972936c264c86eb1ec2fb054c',1461784636,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('a52e52cd2601adda36542180509e1cf2',1461786091,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('a7508ed7cb47c93ade70155eca3271d3',1461803914,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('ac434a821587f8df0796e1dd02f9412d',1461785730,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('acfe2e70f3b0310f290230d8ffc926a0',1461829232,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('ada73611c91a4aeecffc205d70927882',1461782803,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('ae7daaf4cd49cb2313f1732658b3beff',1461762392,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b04052a98a8a3aac0f7e98e584c791e1',1461815737,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b13be5a8e5af5ac599c686a2726a6a7f',1461758391,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b2b1f57a62eeee8ee96b254ba3da0b1f',1461814071,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b4c23a537dcdf864fd357d432689c8dc',1461821391,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b63aea683c00d7ec7446ad1b200a8219',1461758182,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b7975125d8c6b02e1fa66612d1c1c017',1461783849,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b86c464dd3f3b10a4f9302d7ba8a4759',1461784919,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b931d2c4bdb816fb35f25628b54c3912',1461824264,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('b93b146526634834e3dd1a0a76a3c857',1461791165,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('bb1a0776dbf1e532647ff3c4bf6422bf',1461823196,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('bbf57f2d23dc9d90e5a603e1eb8a5397',1461814567,1209600,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}redirectURL|s:6:\"/login\";ActivityFormToken|a:1:{s:5:\"token\";s:32:\"f70c830b64c558b7445986c71f022864\";}twitter_uid|b:0;',1),('bcc025a8951dbe586dcc98fc45018fb4',1461787579,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('bf20553250c2c4d8357850b0891322f7',1461805975,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('c4568099e1f3d16851f3e07fa32fe01c',1461762923,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('c5e0b8a65d283fc914ff4e7eea24d081',1461785664,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('ce7f5d30830cedae363f0d0443e574b6',1461823309,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('cffffbf65b020d77775098469e3cc4b4',1461785021,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('d113e6f7fa122f9a764529e43aded242',1461786663,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('d226548153d885defac751cead591ac2',1461802645,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('d79ad26fe73ef92c19e70fbfc73973a7',1461783702,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('d7a793b516729809c11896bd45f8cd7f',1461788457,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('d914312a54fb35adb820185bc9345c76',1461786856,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('db546dc3bce89945a60393aa285525f3',1461798791,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('db5b2c0719fecf64e1e549a8d6055297',1461783943,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('db775cf7c39788045d7680aad79721e8',1461821638,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('dbb393ffc089f6a6b301d1ce830f09ce',1461784036,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('dc1c3dae415d950a76be3092c05943ae',1461784473,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('dc97e0e2662a7ae5f223967c10116631',1461792857,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('dd8730b36db5d70864222fb4b2d979b3',1461783789,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('df4f9a7b936c03586baa071188a9615b',1461791309,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('df533dc9ffd03d06adf05d2e86cfd57f',1461786929,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('e0447fb94337970d2d9a0483cf8c310c',1461821296,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('e0ff5d54895548757b5e33d7b7bfbb91',1461758109,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('e17f938a2b9789864b3dae4b2ca1ea09',1461782471,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('e3299b254242b95079b80a6a27e3f3d5',1461773573,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}',NULL),('e37126e44814e7008c95d6bd733619bf',1461793043,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('e3f155cc7b84fcbd28a5e22c025d6817',1461791515,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('e6c8449ed93e1192200d0a7dad9dff4c',1461787435,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('eaec431f1904f5ebdef0ec431b2456e6',1461830914,1209600,'redirectURL|s:6:\"/login\";ActivityFormToken|a:1:{s:5:\"token\";s:32:\"209ca081bd6945aa9589c68450fc187c\";}twitter_uid|b:0;mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}Payment_Plugin_Signup_Subscription|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:0;s:4:\"data\";a:10:{s:4:\"name\";s:0:\"\";s:10:\"9hUGTMTyvN\";s:17:\"ju11236@yahoo.com\";s:5:\"email\";s:17:\"ju11236@yahoo.com\";s:11:\"email_field\";s:16:\"OWhVR1RNVHl2Tg==\";s:8:\"password\";s:8:\"Ma281030\";s:8:\"passconf\";s:8:\"Ma281030\";s:12:\"profile_type\";s:1:\"1\";s:8:\"timezone\";s:10:\"US/Eastern\";s:8:\"language\";s:7:\"English\";s:5:\"terms\";s:1:\"1\";}}User_Plugin_Signup_Fields|a:2:{s:6:\"active\";b:0;s:4:\"data\";a:13:{i:1;s:1:\"1\";i:3;s:6:\"judith\";i:4;s:5:\"hinds\";i:5;s:1:\"3\";i:6;a:3:{s:5:\"month\";s:2:\"11\";s:3:\"day\";s:2:\"17\";s:4:\"year\";s:4:\"1980\";}i:8;s:0:\"\";i:9;s:0:\"\";i:10;s:0:\"\";i:11;s:0:\"\";i:13;s:73:\"looking for 2 bedroom apartment. maximum 1800 per month. 1 child, no pets\";i:14;s:3:\"BSN\";i:15;s:5:\"80000\";i:16;s:3:\"720\";}}User_Plugin_Signup_Photo|a:4:{s:6:\"active\";b:0;s:4:\"data\";N;s:11:\"coordinates\";s:0:\"\";s:4:\"skip\";b:1;}User_Plugin_Signup_Invite|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:3:\"156\";twitter_lock|i:1;',1),('ed63606da1356d02cd71f2c49f1f511f',1461790025,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('eece2d6d17099697583fd39d73ce8e49',1461821212,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('f0c0e809d19ee56a92a180772c425080',1461784106,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('f31052aa4179752b991e78386e366fba',1461782727,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('f6149ddfea4e3af7f15bc5bb4f9505b2',1461824409,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('f7036091f79b058f4218179a8bec6180',1461791576,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('f7878ba65c07ed66316c8c50795c1b23',1461796688,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('f7ba6135bb2bf1a5233377e8d4eda7dc',1461278619,1209600,'redirectURL|s:6:\"/login\";Zend_Auth|a:1:{s:7:\"storage\";i:1;}login_id|s:2:\"84\";ActivityFormToken|a:1:{s:5:\"token\";s:32:\"a3ff7fac0257727b9179d5a3e8c2dfea\";}twitter_lock|i:1;twitter_uid|b:0;',1),('f8f2d444d7ef6f8448eca7d747ba5b26',1461764142,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}User_Plugin_Signup_Account|a:2:{s:6:\"active\";b:0;s:4:\"data\";a:10:{s:4:\"name\";s:0:\"\";s:10:\"Ctr6uM3XiQ\";s:33:\"bindiya.prakash@titechnologies.in\";s:5:\"email\";s:33:\"bindiya.prakash@titechnologies.in\";s:11:\"email_field\";s:16:\"Q3RyNnVNM1hpUQ==\";s:8:\"password\";s:6:\"123456\";s:8:\"passconf\";s:6:\"123456\";s:12:\"profile_type\";s:1:\"1\";s:8:\"timezone\";s:13:\"Asia/Calcutta\";s:8:\"language\";s:7:\"English\";s:5:\"terms\";s:1:\"1\";}}User_Plugin_Signup_Fields|a:2:{s:6:\"active\";b:0;s:4:\"data\";a:13:{i:1;s:1:\"1\";i:3;s:7:\"Bindiya\";i:4;s:7:\"Prakash\";i:5;s:1:\"3\";i:6;a:3:{s:5:\"month\";s:1:\"8\";s:3:\"day\";s:1:\"1\";s:4:\"year\";s:4:\"1989\";}i:8;s:0:\"\";i:9;s:0:\"\";i:10;s:0:\"\";i:11;s:0:\"\";i:13;s:0:\"\";i:14;s:0:\"\";i:15;s:0:\"\";i:16;s:0:\"\";}}User_Plugin_Signup_Photo|a:4:{s:6:\"active\";b:0;s:4:\"data\";N;s:11:\"coordinates\";s:0:\"\";s:4:\"skip\";b:1;}User_Plugin_Signup_Invite|a:2:{s:6:\"active\";b:1;s:4:\"data\";N;}',NULL),('fd7a1c3108e164075331720e8b6caf86',1461829862,86400,'mobile|a:1:{s:6:\"mobile\";N;}ynbusinesspages_business|a:1:{s:10:\"businessId\";N;}redirectURL|s:37:\"/login/return_url/64-L2FsYnVtcw%3D%3D\";',NULL),('fdd163e0640e20cf7f5944ed897d2ad8',1461785201,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('ff8c235404d5166e573b5653000f3a39',1461784430,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL),('ffdb06b16f6d34cd6f2ac96daef956b7',1461788446,86400,'mobile|a:1:{s:6:\"mobile\";N;}',NULL);
/*!40000 ALTER TABLE `engine4_core_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_settings`
--

DROP TABLE IF EXISTS `engine4_core_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_settings` (
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_settings`
--

LOCK TABLES `engine4_core_settings` WRITE;
/*!40000 ALTER TABLE `engine4_core_settings` DISABLE KEYS */;
INSERT INTO `engine4_core_settings` VALUES ('activity.content','everyone'),('activity.disallowed','N'),('activity.filter','1'),('activity.length','15'),('activity.liveupdate','120000'),('activity.publish','1'),('activity.userdelete','1'),('activity.userlength','5'),('core.admin.mode','none'),('core.admin.password','f7af4a471ebecf0daf7dd73f42ae9272'),('core.admin.reauthenticate','0'),('core.admin.timeout','600'),('core.analytics.code',''),('core.doctype','XHTML1_STRICT'),('core.facebook.enable','none'),('core.facebook.key',''),('core.facebook.secret',''),('core.general.analytics',''),('core.general.browse','0'),('core.general.commenthtml',''),('core.general.includes',''),('core.general.notificationupdate','120000'),('core.general.portal','1'),('core.general.profile','0'),('core.general.quota','0'),('core.general.search','1'),('core.general.site.description','Rentstarz is a social network company that focuses on connecting landlords, tenants and Legal Aids for the purposes of  renting, leasing and educating. Our objective is to provide a medium for both landlords and tenants to connect. Rentstarz is a social hub for the renting and leasing market. '),('core.general.site.keywords','rentstarz, rent, starz, landlord, tenant, legal aide, process server, lease, sublet,real estate, apartment, room,'),('core.general.site.title','rentstarz'),('core.general.staticBaseUrl',''),('core.license.email','email@domain.com'),('core.license.key','9860-6577-1950-0000'),('core.license.statistics','0'),('core.locale.locale','auto'),('core.locale.timezone','US/Pacific'),('core.log.adapter','file'),('core.mail.contact','monob245@gmail.com'),('core.mail.count','25'),('core.mail.enabled','1'),('core.mail.from','rentstarz.com'),('core.mail.name','Site Admin'),('core.mail.queueing','1'),('core.secret','30b8039f6799b7229900ba61f9d843b9380694f9'),('core.site.counter','60'),('core.site.creation','2016-03-06 01:10:13'),('core.site.title','Social Network'),('core.spam.censor',''),('core.spam.comment','0'),('core.spam.contact','0'),('core.spam.email.antispam.login','1'),('core.spam.email.antispam.signup','1'),('core.spam.invite','0'),('core.spam.ipbans',''),('core.spam.login','0'),('core.spam.signup','0'),('core.static.baseurl',''),('core.tasks.count','1'),('core.tasks.interval','60'),('core.tasks.jobs','3'),('core.tasks.key','41cc05fc'),('core.tasks.last','1461829856'),('core.tasks.mode','curl'),('core.tasks.pid',''),('core.tasks.processes','2'),('core.tasks.time','120'),('core.tasks.timeout','900'),('core.thumbnails.icon.height','48'),('core.thumbnails.icon.mode','crop'),('core.thumbnails.icon.width','48'),('core.thumbnails.main.height','720'),('core.thumbnails.main.mode','resize'),('core.thumbnails.main.width','720'),('core.thumbnails.normal.height','160'),('core.thumbnails.normal.mode','resize'),('core.thumbnails.normal.width','140'),('core.thumbnails.profile.height','400'),('core.thumbnails.profile.mode','resize'),('core.thumbnails.profile.width','200'),('core.translate.adapter','csv'),('core.twitter.enable','none'),('core.twitter.key',''),('core.twitter.secret',''),('form.mode','1'),('group.bbcode','1'),('group.html','1'),('invite.allowCustomMessage','1'),('invite.fromEmail',''),('invite.fromName',''),('invite.max','10'),('invite.message','You are being invited to join our social network.'),('invite.subject','Join Us'),('payment.benefit','all'),('payment.currency','USD'),('payment.secret','f4e0f541493c5013b5fbb7e6c264861b'),('storage.service.mirrored.counter','0'),('storage.service.mirrored.index','0'),('storage.service.roundrobin.counter','0'),('user.friends.direction','1'),('user.friends.eligible','2'),('user.friends.lists','1'),('user.friends.verification','1'),('user.signup.adminemail','1'),('user.signup.approve','1'),('user.signup.checkemail','0'),('user.signup.inviteonly','0'),('user.signup.random','0'),('user.signup.terms','1'),('user.signup.username','0'),('user.signup.verifyemail','1'),('user.support.links','1'),('ynresponsive1.setuphomepage','1'),('yntheme.enabled','0');
/*!40000 ALTER TABLE `engine4_core_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_statistics`
--

DROP TABLE IF EXISTS `engine4_core_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_statistics` (
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_statistics`
--

LOCK TABLES `engine4_core_statistics` WRITE;
/*!40000 ALTER TABLE `engine4_core_statistics` DISABLE KEYS */;
INSERT INTO `engine4_core_statistics` VALUES ('core.emails','2016-03-07 15:00:00',1),('core.emails','2016-03-30 14:00:00',1),('core.emails','2016-04-05 17:00:00',1),('core.emails','2016-04-18 21:00:00',1),('core.emails','2016-04-25 17:00:00',4),('core.emails','2016-04-25 18:00:00',5),('core.emails','2016-04-26 16:00:00',3),('core.emails','2016-04-26 19:00:00',1),('core.emails','2016-04-26 22:00:00',4),('core.emails','2016-04-26 23:00:00',2),('core.likes','2016-03-29 17:00:00',1),('core.likes','2016-04-25 18:00:00',1),('core.likes','2016-04-26 22:00:00',1),('core.views','2016-03-06 01:00:00',37),('core.views','2016-03-06 02:00:00',9),('core.views','2016-03-06 03:00:00',4),('core.views','2016-03-06 04:00:00',10),('core.views','2016-03-06 05:00:00',12),('core.views','2016-03-06 10:00:00',3),('core.views','2016-03-06 11:00:00',5),('core.views','2016-03-06 16:00:00',1),('core.views','2016-03-06 17:00:00',10),('core.views','2016-03-06 18:00:00',12),('core.views','2016-03-06 19:00:00',1),('core.views','2016-03-06 23:00:00',15),('core.views','2016-03-07 01:00:00',6),('core.views','2016-03-07 04:00:00',1),('core.views','2016-03-07 05:00:00',5),('core.views','2016-03-07 06:00:00',1),('core.views','2016-03-07 09:00:00',2),('core.views','2016-03-07 10:00:00',1),('core.views','2016-03-07 14:00:00',1),('core.views','2016-03-07 15:00:00',11),('core.views','2016-03-07 16:00:00',17),('core.views','2016-03-07 19:00:00',2),('core.views','2016-03-07 20:00:00',24),('core.views','2016-03-07 21:00:00',10),('core.views','2016-03-07 22:00:00',11),('core.views','2016-03-07 23:00:00',1),('core.views','2016-03-08 02:00:00',11),('core.views','2016-03-08 03:00:00',9),('core.views','2016-03-08 04:00:00',10),('core.views','2016-03-08 05:00:00',3),('core.views','2016-03-08 06:00:00',5),('core.views','2016-03-08 07:00:00',3),('core.views','2016-03-08 10:00:00',1),('core.views','2016-03-08 13:00:00',1),('core.views','2016-03-08 14:00:00',3),('core.views','2016-03-08 17:00:00',34),('core.views','2016-03-08 18:00:00',26),('core.views','2016-03-08 19:00:00',5),('core.views','2016-03-08 20:00:00',4),('core.views','2016-03-09 01:00:00',2),('core.views','2016-03-09 09:00:00',9),('core.views','2016-03-09 12:00:00',1),('core.views','2016-03-09 16:00:00',11),('core.views','2016-03-09 21:00:00',1),('core.views','2016-03-10 01:00:00',3),('core.views','2016-03-10 04:00:00',2),('core.views','2016-03-10 05:00:00',2),('core.views','2016-03-10 08:00:00',1),('core.views','2016-03-10 09:00:00',4),('core.views','2016-03-10 11:00:00',37),('core.views','2016-03-10 12:00:00',1),('core.views','2016-03-10 14:00:00',1),('core.views','2016-03-10 20:00:00',2),('core.views','2016-03-10 21:00:00',12),('core.views','2016-03-10 22:00:00',3),('core.views','2016-03-10 23:00:00',1),('core.views','2016-03-11 02:00:00',1),('core.views','2016-03-11 07:00:00',24),('core.views','2016-03-11 10:00:00',4),('core.views','2016-03-11 11:00:00',4),('core.views','2016-03-11 12:00:00',1),('core.views','2016-03-11 13:00:00',2),('core.views','2016-03-11 17:00:00',2),('core.views','2016-03-11 19:00:00',2),('core.views','2016-03-11 22:00:00',2),('core.views','2016-03-11 23:00:00',2),('core.views','2016-03-12 00:00:00',3),('core.views','2016-03-12 01:00:00',4),('core.views','2016-03-12 02:00:00',1),('core.views','2016-03-12 03:00:00',6),('core.views','2016-03-12 06:00:00',2),('core.views','2016-03-12 10:00:00',4),('core.views','2016-03-12 11:00:00',2),('core.views','2016-03-12 12:00:00',16),('core.views','2016-03-12 14:00:00',2),('core.views','2016-03-12 16:00:00',18),('core.views','2016-03-12 22:00:00',2),('core.views','2016-03-12 23:00:00',1),('core.views','2016-03-13 01:00:00',1),('core.views','2016-03-13 02:00:00',1),('core.views','2016-03-13 05:00:00',1),('core.views','2016-03-13 07:00:00',2),('core.views','2016-03-13 08:00:00',1),('core.views','2016-03-13 13:00:00',2),('core.views','2016-03-13 19:00:00',1),('core.views','2016-03-13 20:00:00',1),('core.views','2016-03-13 23:00:00',1),('core.views','2016-03-14 04:00:00',2),('core.views','2016-03-14 06:00:00',1),('core.views','2016-03-14 07:00:00',7),('core.views','2016-03-14 09:00:00',1),('core.views','2016-03-14 11:00:00',2),('core.views','2016-03-14 12:00:00',1),('core.views','2016-03-14 17:00:00',3),('core.views','2016-03-14 18:00:00',1),('core.views','2016-03-14 19:00:00',47),('core.views','2016-03-14 20:00:00',130),('core.views','2016-03-14 21:00:00',37),('core.views','2016-03-14 23:00:00',1),('core.views','2016-03-15 00:00:00',2),('core.views','2016-03-15 03:00:00',4),('core.views','2016-03-15 04:00:00',9),('core.views','2016-03-15 05:00:00',19),('core.views','2016-03-15 07:00:00',2),('core.views','2016-03-15 10:00:00',5),('core.views','2016-03-15 11:00:00',1),('core.views','2016-03-15 12:00:00',2),('core.views','2016-03-15 13:00:00',1),('core.views','2016-03-15 14:00:00',25),('core.views','2016-03-15 15:00:00',27),('core.views','2016-03-15 16:00:00',83),('core.views','2016-03-15 17:00:00',31),('core.views','2016-03-15 18:00:00',1),('core.views','2016-03-15 19:00:00',13),('core.views','2016-03-15 21:00:00',13),('core.views','2016-03-15 22:00:00',7),('core.views','2016-03-15 23:00:00',3),('core.views','2016-03-16 01:00:00',5),('core.views','2016-03-16 03:00:00',1),('core.views','2016-03-16 05:00:00',2),('core.views','2016-03-16 06:00:00',3),('core.views','2016-03-16 08:00:00',2),('core.views','2016-03-16 09:00:00',2),('core.views','2016-03-16 10:00:00',2),('core.views','2016-03-16 12:00:00',1),('core.views','2016-03-16 13:00:00',19),('core.views','2016-03-16 14:00:00',25),('core.views','2016-03-16 17:00:00',1),('core.views','2016-03-16 20:00:00',5),('core.views','2016-03-16 22:00:00',1),('core.views','2016-03-16 23:00:00',30),('core.views','2016-03-17 01:00:00',2),('core.views','2016-03-17 02:00:00',2),('core.views','2016-03-17 04:00:00',1),('core.views','2016-03-17 05:00:00',3),('core.views','2016-03-17 08:00:00',5),('core.views','2016-03-17 09:00:00',1),('core.views','2016-03-17 10:00:00',1),('core.views','2016-03-17 11:00:00',3),('core.views','2016-03-17 13:00:00',15),('core.views','2016-03-17 15:00:00',1),('core.views','2016-03-17 20:00:00',2),('core.views','2016-03-17 21:00:00',2),('core.views','2016-03-17 23:00:00',4),('core.views','2016-03-18 02:00:00',1),('core.views','2016-03-18 03:00:00',2),('core.views','2016-03-18 04:00:00',1),('core.views','2016-03-18 06:00:00',3),('core.views','2016-03-18 07:00:00',2),('core.views','2016-03-18 08:00:00',1),('core.views','2016-03-18 11:00:00',2),('core.views','2016-03-18 12:00:00',2),('core.views','2016-03-18 13:00:00',4),('core.views','2016-03-18 14:00:00',1),('core.views','2016-03-18 15:00:00',6),('core.views','2016-03-18 16:00:00',3),('core.views','2016-03-18 17:00:00',3),('core.views','2016-03-18 20:00:00',1),('core.views','2016-03-18 23:00:00',2),('core.views','2016-03-19 00:00:00',5),('core.views','2016-03-19 01:00:00',2),('core.views','2016-03-19 03:00:00',1),('core.views','2016-03-19 04:00:00',3),('core.views','2016-03-19 06:00:00',2),('core.views','2016-03-19 09:00:00',1),('core.views','2016-03-19 19:00:00',1),('core.views','2016-03-19 20:00:00',1),('core.views','2016-03-19 22:00:00',1),('core.views','2016-03-19 23:00:00',2),('core.views','2016-03-20 00:00:00',4),('core.views','2016-03-20 01:00:00',1),('core.views','2016-03-20 03:00:00',1),('core.views','2016-03-20 05:00:00',1),('core.views','2016-03-20 06:00:00',1),('core.views','2016-03-20 07:00:00',1),('core.views','2016-03-20 09:00:00',3),('core.views','2016-03-20 12:00:00',1),('core.views','2016-03-20 15:00:00',1),('core.views','2016-03-20 16:00:00',1),('core.views','2016-03-20 17:00:00',1),('core.views','2016-03-20 22:00:00',2),('core.views','2016-03-21 01:00:00',1),('core.views','2016-03-21 03:00:00',1),('core.views','2016-03-21 08:00:00',1),('core.views','2016-03-21 21:00:00',1),('core.views','2016-03-22 05:00:00',1),('core.views','2016-03-24 14:00:00',1),('core.views','2016-03-24 19:00:00',1),('core.views','2016-03-24 23:00:00',2),('core.views','2016-03-26 01:00:00',1),('core.views','2016-03-26 20:00:00',1),('core.views','2016-03-26 21:00:00',1),('core.views','2016-03-27 21:00:00',1),('core.views','2016-03-28 01:00:00',1),('core.views','2016-03-28 02:00:00',1),('core.views','2016-03-28 03:00:00',2),('core.views','2016-03-28 04:00:00',5),('core.views','2016-03-28 05:00:00',3),('core.views','2016-03-28 08:00:00',1),('core.views','2016-03-28 09:00:00',2),('core.views','2016-03-28 13:00:00',19),('core.views','2016-03-28 14:00:00',13),('core.views','2016-03-28 17:00:00',13),('core.views','2016-03-28 18:00:00',5),('core.views','2016-03-28 19:00:00',30),('core.views','2016-03-28 20:00:00',5),('core.views','2016-03-28 21:00:00',11),('core.views','2016-03-28 22:00:00',11),('core.views','2016-03-29 02:00:00',9),('core.views','2016-03-29 05:00:00',14),('core.views','2016-03-29 10:00:00',1),('core.views','2016-03-29 13:00:00',1),('core.views','2016-03-29 14:00:00',10),('core.views','2016-03-29 15:00:00',55),('core.views','2016-03-29 16:00:00',15),('core.views','2016-03-29 17:00:00',34),('core.views','2016-03-29 19:00:00',16),('core.views','2016-03-29 20:00:00',5),('core.views','2016-03-29 21:00:00',4),('core.views','2016-03-29 23:00:00',1),('core.views','2016-03-30 02:00:00',1),('core.views','2016-03-30 04:00:00',5),('core.views','2016-03-30 05:00:00',2),('core.views','2016-03-30 06:00:00',2),('core.views','2016-03-30 08:00:00',1),('core.views','2016-03-30 09:00:00',5),('core.views','2016-03-30 13:00:00',26),('core.views','2016-03-30 14:00:00',25),('core.views','2016-03-30 15:00:00',1),('core.views','2016-03-30 16:00:00',5),('core.views','2016-03-30 17:00:00',10),('core.views','2016-03-30 21:00:00',8),('core.views','2016-03-30 22:00:00',3),('core.views','2016-03-30 23:00:00',4),('core.views','2016-03-31 04:00:00',1),('core.views','2016-03-31 11:00:00',1),('core.views','2016-03-31 13:00:00',10),('core.views','2016-03-31 14:00:00',1),('core.views','2016-03-31 16:00:00',10),('core.views','2016-03-31 17:00:00',9),('core.views','2016-03-31 19:00:00',10),('core.views','2016-03-31 20:00:00',1),('core.views','2016-03-31 21:00:00',6),('core.views','2016-03-31 22:00:00',1),('core.views','2016-03-31 23:00:00',25),('core.views','2016-04-01 00:00:00',9),('core.views','2016-04-01 01:00:00',13),('core.views','2016-04-01 11:00:00',1),('core.views','2016-04-01 16:00:00',1),('core.views','2016-04-01 19:00:00',2),('core.views','2016-04-01 20:00:00',2),('core.views','2016-04-01 22:00:00',8),('core.views','2016-04-01 23:00:00',7),('core.views','2016-04-02 00:00:00',1),('core.views','2016-04-02 01:00:00',2),('core.views','2016-04-02 02:00:00',3),('core.views','2016-04-02 03:00:00',7),('core.views','2016-04-02 06:00:00',2),('core.views','2016-04-02 09:00:00',2),('core.views','2016-04-02 10:00:00',6),('core.views','2016-04-02 12:00:00',1),('core.views','2016-04-02 14:00:00',20),('core.views','2016-04-02 16:00:00',1),('core.views','2016-04-02 19:00:00',15),('core.views','2016-04-02 20:00:00',2),('core.views','2016-04-02 21:00:00',4),('core.views','2016-04-02 22:00:00',1),('core.views','2016-04-03 00:00:00',22),('core.views','2016-04-03 02:00:00',3),('core.views','2016-04-03 03:00:00',1),('core.views','2016-04-03 05:00:00',1),('core.views','2016-04-03 07:00:00',2),('core.views','2016-04-03 08:00:00',5),('core.views','2016-04-03 09:00:00',3),('core.views','2016-04-03 10:00:00',4),('core.views','2016-04-03 11:00:00',4),('core.views','2016-04-03 12:00:00',5),('core.views','2016-04-03 13:00:00',1),('core.views','2016-04-03 14:00:00',1),('core.views','2016-04-03 16:00:00',2),('core.views','2016-04-03 18:00:00',1),('core.views','2016-04-03 19:00:00',5),('core.views','2016-04-03 20:00:00',6),('core.views','2016-04-03 22:00:00',10),('core.views','2016-04-03 23:00:00',2),('core.views','2016-04-04 01:00:00',4),('core.views','2016-04-04 02:00:00',3),('core.views','2016-04-04 03:00:00',5),('core.views','2016-04-04 05:00:00',1),('core.views','2016-04-04 06:00:00',2),('core.views','2016-04-04 07:00:00',1),('core.views','2016-04-04 08:00:00',1),('core.views','2016-04-04 09:00:00',2),('core.views','2016-04-04 11:00:00',3),('core.views','2016-04-04 12:00:00',2),('core.views','2016-04-04 13:00:00',5),('core.views','2016-04-04 14:00:00',1),('core.views','2016-04-04 15:00:00',1),('core.views','2016-04-04 16:00:00',6),('core.views','2016-04-04 17:00:00',9),('core.views','2016-04-04 18:00:00',21),('core.views','2016-04-04 19:00:00',6),('core.views','2016-04-04 20:00:00',6),('core.views','2016-04-04 21:00:00',11),('core.views','2016-04-04 22:00:00',2),('core.views','2016-04-04 23:00:00',3),('core.views','2016-04-05 02:00:00',6),('core.views','2016-04-05 03:00:00',1),('core.views','2016-04-05 06:00:00',1),('core.views','2016-04-05 07:00:00',4),('core.views','2016-04-05 10:00:00',2),('core.views','2016-04-05 11:00:00',1),('core.views','2016-04-05 13:00:00',7),('core.views','2016-04-05 14:00:00',2),('core.views','2016-04-05 15:00:00',6),('core.views','2016-04-05 16:00:00',11),('core.views','2016-04-05 17:00:00',22),('core.views','2016-04-05 18:00:00',6),('core.views','2016-04-05 21:00:00',4),('core.views','2016-04-05 23:00:00',1),('core.views','2016-04-06 00:00:00',3),('core.views','2016-04-06 01:00:00',3),('core.views','2016-04-06 03:00:00',1),('core.views','2016-04-06 05:00:00',2),('core.views','2016-04-06 07:00:00',20),('core.views','2016-04-06 08:00:00',11),('core.views','2016-04-06 09:00:00',11),('core.views','2016-04-06 10:00:00',10),('core.views','2016-04-06 11:00:00',18),('core.views','2016-04-06 12:00:00',21),('core.views','2016-04-06 14:00:00',2),('core.views','2016-04-06 15:00:00',3),('core.views','2016-04-06 16:00:00',14),('core.views','2016-04-06 17:00:00',9),('core.views','2016-04-06 18:00:00',2),('core.views','2016-04-06 19:00:00',18),('core.views','2016-04-06 20:00:00',3),('core.views','2016-04-06 21:00:00',1),('core.views','2016-04-06 22:00:00',19),('core.views','2016-04-06 23:00:00',3),('core.views','2016-04-07 00:00:00',18),('core.views','2016-04-07 01:00:00',6),('core.views','2016-04-07 02:00:00',3),('core.views','2016-04-07 03:00:00',13),('core.views','2016-04-07 05:00:00',7),('core.views','2016-04-07 08:00:00',4),('core.views','2016-04-07 10:00:00',2),('core.views','2016-04-07 12:00:00',2),('core.views','2016-04-07 13:00:00',47),('core.views','2016-04-07 14:00:00',5),('core.views','2016-04-07 15:00:00',1),('core.views','2016-04-07 16:00:00',4),('core.views','2016-04-07 20:00:00',1),('core.views','2016-04-07 21:00:00',1),('core.views','2016-04-07 23:00:00',1),('core.views','2016-04-08 00:00:00',1),('core.views','2016-04-08 01:00:00',1),('core.views','2016-04-08 02:00:00',35),('core.views','2016-04-08 04:00:00',1),('core.views','2016-04-08 05:00:00',1),('core.views','2016-04-08 07:00:00',1),('core.views','2016-04-08 09:00:00',1),('core.views','2016-04-08 10:00:00',1),('core.views','2016-04-08 11:00:00',1),('core.views','2016-04-08 13:00:00',1),('core.views','2016-04-08 14:00:00',2),('core.views','2016-04-08 16:00:00',1),('core.views','2016-04-08 18:00:00',1),('core.views','2016-04-08 19:00:00',2),('core.views','2016-04-08 20:00:00',1),('core.views','2016-04-08 22:00:00',3),('core.views','2016-04-09 00:00:00',2),('core.views','2016-04-09 01:00:00',1),('core.views','2016-04-09 04:00:00',1),('core.views','2016-04-09 05:00:00',2),('core.views','2016-04-09 07:00:00',3),('core.views','2016-04-09 10:00:00',1),('core.views','2016-04-09 11:00:00',1),('core.views','2016-04-09 12:00:00',1),('core.views','2016-04-09 13:00:00',1),('core.views','2016-04-09 16:00:00',2),('core.views','2016-04-09 17:00:00',2),('core.views','2016-04-09 19:00:00',1),('core.views','2016-04-09 20:00:00',1),('core.views','2016-04-09 22:00:00',2),('core.views','2016-04-09 23:00:00',5),('core.views','2016-04-10 00:00:00',1),('core.views','2016-04-10 03:00:00',7),('core.views','2016-04-10 05:00:00',1),('core.views','2016-04-10 09:00:00',2),('core.views','2016-04-10 10:00:00',2),('core.views','2016-04-10 12:00:00',1),('core.views','2016-04-10 13:00:00',2),('core.views','2016-04-10 18:00:00',1),('core.views','2016-04-10 20:00:00',1),('core.views','2016-04-10 22:00:00',1),('core.views','2016-04-10 23:00:00',5),('core.views','2016-04-11 00:00:00',3),('core.views','2016-04-11 03:00:00',2),('core.views','2016-04-11 04:00:00',1),('core.views','2016-04-11 06:00:00',3),('core.views','2016-04-11 07:00:00',1),('core.views','2016-04-11 10:00:00',1),('core.views','2016-04-11 12:00:00',1),('core.views','2016-04-11 14:00:00',4),('core.views','2016-04-11 15:00:00',1),('core.views','2016-04-11 18:00:00',1),('core.views','2016-04-11 19:00:00',2),('core.views','2016-04-11 21:00:00',3),('core.views','2016-04-11 22:00:00',1),('core.views','2016-04-12 01:00:00',4),('core.views','2016-04-12 02:00:00',5),('core.views','2016-04-12 04:00:00',2),('core.views','2016-04-12 05:00:00',1),('core.views','2016-04-12 06:00:00',1),('core.views','2016-04-12 07:00:00',1),('core.views','2016-04-12 08:00:00',3),('core.views','2016-04-12 11:00:00',3),('core.views','2016-04-12 12:00:00',1),('core.views','2016-04-12 13:00:00',1),('core.views','2016-04-12 16:00:00',1),('core.views','2016-04-12 17:00:00',1),('core.views','2016-04-12 18:00:00',1),('core.views','2016-04-12 19:00:00',1),('core.views','2016-04-12 23:00:00',1),('core.views','2016-04-13 00:00:00',6),('core.views','2016-04-13 01:00:00',3),('core.views','2016-04-13 03:00:00',1),('core.views','2016-04-13 05:00:00',1),('core.views','2016-04-13 08:00:00',1),('core.views','2016-04-13 09:00:00',1),('core.views','2016-04-13 12:00:00',3),('core.views','2016-04-13 13:00:00',2),('core.views','2016-04-13 16:00:00',1),('core.views','2016-04-13 17:00:00',4),('core.views','2016-04-13 18:00:00',3),('core.views','2016-04-13 19:00:00',4),('core.views','2016-04-13 20:00:00',3),('core.views','2016-04-13 21:00:00',3),('core.views','2016-04-14 00:00:00',1),('core.views','2016-04-14 01:00:00',10),('core.views','2016-04-14 03:00:00',1),('core.views','2016-04-14 04:00:00',6),('core.views','2016-04-14 07:00:00',1),('core.views','2016-04-14 09:00:00',1),('core.views','2016-04-14 10:00:00',2),('core.views','2016-04-14 12:00:00',3),('core.views','2016-04-14 16:00:00',14),('core.views','2016-04-14 18:00:00',4),('core.views','2016-04-14 20:00:00',1),('core.views','2016-04-14 21:00:00',1),('core.views','2016-04-14 22:00:00',2),('core.views','2016-04-14 23:00:00',3),('core.views','2016-04-15 00:00:00',1),('core.views','2016-04-15 01:00:00',1),('core.views','2016-04-15 02:00:00',1),('core.views','2016-04-15 03:00:00',1),('core.views','2016-04-15 04:00:00',3),('core.views','2016-04-15 05:00:00',1),('core.views','2016-04-15 08:00:00',1),('core.views','2016-04-15 09:00:00',3),('core.views','2016-04-15 12:00:00',1),('core.views','2016-04-15 13:00:00',16),('core.views','2016-04-15 15:00:00',1),('core.views','2016-04-15 16:00:00',9),('core.views','2016-04-15 18:00:00',1),('core.views','2016-04-15 19:00:00',5),('core.views','2016-04-15 20:00:00',4),('core.views','2016-04-15 21:00:00',1),('core.views','2016-04-15 23:00:00',1),('core.views','2016-04-16 01:00:00',1),('core.views','2016-04-16 02:00:00',5),('core.views','2016-04-16 09:00:00',1),('core.views','2016-04-16 11:00:00',1),('core.views','2016-04-16 13:00:00',15),('core.views','2016-04-16 15:00:00',1),('core.views','2016-04-16 16:00:00',3),('core.views','2016-04-16 19:00:00',4),('core.views','2016-04-16 21:00:00',1),('core.views','2016-04-16 23:00:00',3),('core.views','2016-04-17 00:00:00',2),('core.views','2016-04-17 01:00:00',2),('core.views','2016-04-17 03:00:00',7),('core.views','2016-04-17 06:00:00',1),('core.views','2016-04-17 11:00:00',1),('core.views','2016-04-17 13:00:00',1),('core.views','2016-04-17 14:00:00',3),('core.views','2016-04-17 15:00:00',3),('core.views','2016-04-17 16:00:00',13),('core.views','2016-04-17 17:00:00',13),('core.views','2016-04-17 18:00:00',3),('core.views','2016-04-17 19:00:00',1),('core.views','2016-04-17 20:00:00',3),('core.views','2016-04-17 21:00:00',12),('core.views','2016-04-17 22:00:00',3),('core.views','2016-04-17 23:00:00',1),('core.views','2016-04-18 01:00:00',1),('core.views','2016-04-18 02:00:00',1),('core.views','2016-04-18 03:00:00',1),('core.views','2016-04-18 07:00:00',1),('core.views','2016-04-18 08:00:00',1),('core.views','2016-04-18 11:00:00',3),('core.views','2016-04-18 12:00:00',4),('core.views','2016-04-18 15:00:00',11),('core.views','2016-04-18 16:00:00',1),('core.views','2016-04-18 17:00:00',1),('core.views','2016-04-18 19:00:00',7),('core.views','2016-04-18 21:00:00',19),('core.views','2016-04-18 22:00:00',3),('core.views','2016-04-18 23:00:00',1),('core.views','2016-04-19 01:00:00',1),('core.views','2016-04-19 06:00:00',3),('core.views','2016-04-19 07:00:00',1),('core.views','2016-04-19 09:00:00',1),('core.views','2016-04-19 13:00:00',2),('core.views','2016-04-19 15:00:00',1),('core.views','2016-04-19 16:00:00',2),('core.views','2016-04-19 17:00:00',3),('core.views','2016-04-19 18:00:00',22),('core.views','2016-04-19 19:00:00',1),('core.views','2016-04-19 21:00:00',1),('core.views','2016-04-19 22:00:00',9),('core.views','2016-04-19 23:00:00',1),('core.views','2016-04-20 03:00:00',1),('core.views','2016-04-20 05:00:00',8),('core.views','2016-04-20 09:00:00',3),('core.views','2016-04-20 11:00:00',1),('core.views','2016-04-20 13:00:00',1),('core.views','2016-04-20 14:00:00',1),('core.views','2016-04-20 16:00:00',1),('core.views','2016-04-20 17:00:00',6),('core.views','2016-04-20 18:00:00',2),('core.views','2016-04-20 19:00:00',2),('core.views','2016-04-20 20:00:00',2),('core.views','2016-04-20 22:00:00',3),('core.views','2016-04-21 00:00:00',1),('core.views','2016-04-21 02:00:00',2),('core.views','2016-04-21 03:00:00',2),('core.views','2016-04-21 05:00:00',1),('core.views','2016-04-21 06:00:00',1),('core.views','2016-04-21 07:00:00',1),('core.views','2016-04-21 09:00:00',2),('core.views','2016-04-21 12:00:00',3),('core.views','2016-04-21 16:00:00',2),('core.views','2016-04-21 19:00:00',1),('core.views','2016-04-21 20:00:00',1),('core.views','2016-04-21 22:00:00',5),('core.views','2016-04-22 00:00:00',2),('core.views','2016-04-22 04:00:00',2),('core.views','2016-04-22 06:00:00',2),('core.views','2016-04-22 07:00:00',13),('core.views','2016-04-22 12:00:00',6),('core.views','2016-04-22 14:00:00',13),('core.views','2016-04-22 16:00:00',3),('core.views','2016-04-22 17:00:00',7),('core.views','2016-04-22 18:00:00',8),('core.views','2016-04-22 19:00:00',21),('core.views','2016-04-22 21:00:00',1),('core.views','2016-04-22 23:00:00',3),('core.views','2016-04-23 05:00:00',1),('core.views','2016-04-23 06:00:00',11),('core.views','2016-04-23 08:00:00',6),('core.views','2016-04-23 09:00:00',1),('core.views','2016-04-23 11:00:00',2),('core.views','2016-04-23 13:00:00',2),('core.views','2016-04-23 22:00:00',2),('core.views','2016-04-23 23:00:00',6),('core.views','2016-04-24 00:00:00',1),('core.views','2016-04-24 06:00:00',1),('core.views','2016-04-24 11:00:00',7),('core.views','2016-04-24 13:00:00',3),('core.views','2016-04-24 14:00:00',1),('core.views','2016-04-24 18:00:00',6),('core.views','2016-04-24 19:00:00',5),('core.views','2016-04-24 20:00:00',12),('core.views','2016-04-24 21:00:00',22),('core.views','2016-04-24 22:00:00',23),('core.views','2016-04-25 00:00:00',1),('core.views','2016-04-25 01:00:00',2),('core.views','2016-04-25 02:00:00',1),('core.views','2016-04-25 04:00:00',10),('core.views','2016-04-25 05:00:00',7),('core.views','2016-04-25 07:00:00',12),('core.views','2016-04-25 08:00:00',1),('core.views','2016-04-25 11:00:00',3),('core.views','2016-04-25 13:00:00',16),('core.views','2016-04-25 14:00:00',4),('core.views','2016-04-25 15:00:00',7),('core.views','2016-04-25 16:00:00',1),('core.views','2016-04-25 17:00:00',58),('core.views','2016-04-25 18:00:00',50),('core.views','2016-04-25 19:00:00',51),('core.views','2016-04-25 20:00:00',76),('core.views','2016-04-25 21:00:00',33),('core.views','2016-04-25 23:00:00',40),('core.views','2016-04-26 00:00:00',32),('core.views','2016-04-26 01:00:00',68),('core.views','2016-04-26 02:00:00',8),('core.views','2016-04-26 03:00:00',2),('core.views','2016-04-26 06:00:00',3),('core.views','2016-04-26 12:00:00',19),('core.views','2016-04-26 13:00:00',42),('core.views','2016-04-26 14:00:00',43),('core.views','2016-04-26 15:00:00',11),('core.views','2016-04-26 16:00:00',58),('core.views','2016-04-26 17:00:00',40),('core.views','2016-04-26 18:00:00',19),('core.views','2016-04-26 19:00:00',58),('core.views','2016-04-26 21:00:00',13),('core.views','2016-04-26 22:00:00',102),('core.views','2016-04-26 23:00:00',75),('core.views','2016-04-27 00:00:00',6),('core.views','2016-04-27 01:00:00',16),('core.views','2016-04-27 02:00:00',29),('core.views','2016-04-27 05:00:00',11),('core.views','2016-04-27 07:00:00',9),('core.views','2016-04-27 11:00:00',16),('core.views','2016-04-27 12:00:00',1),('core.views','2016-04-27 13:00:00',12),('core.views','2016-04-27 14:00:00',18),('core.views','2016-04-27 16:00:00',1),('core.views','2016-04-27 18:00:00',7),('core.views','2016-04-27 19:00:00',40),('core.views','2016-04-27 20:00:00',14),('core.views','2016-04-27 21:00:00',29),('core.views','2016-04-27 23:00:00',12),('core.views','2016-04-28 00:00:00',3),('core.views','2016-04-28 01:00:00',2),('core.views','2016-04-28 02:00:00',6),('core.views','2016-04-28 03:00:00',27),('core.views','2016-04-28 05:00:00',2),('core.views','2016-04-28 07:00:00',22),('messages.creations','2016-04-26 23:00:00',2),('user.creations','2016-03-07 15:00:00',1),('user.creations','2016-03-30 14:00:00',1),('user.creations','2016-04-05 17:00:00',1),('user.creations','2016-04-25 17:00:00',1),('user.creations','2016-04-25 18:00:00',1),('user.creations','2016-04-26 16:00:00',1),('user.logins','2016-03-06 03:00:00',1),('user.logins','2016-03-14 19:00:00',2),('user.logins','2016-03-15 17:00:00',1),('user.logins','2016-03-28 22:00:00',1),('user.logins','2016-03-29 14:00:00',2),('user.logins','2016-03-29 15:00:00',1),('user.logins','2016-03-30 06:00:00',1),('user.logins','2016-03-30 09:00:00',1),('user.logins','2016-03-30 13:00:00',2),('user.logins','2016-03-30 14:00:00',1),('user.logins','2016-04-06 11:00:00',1),('user.logins','2016-04-06 19:00:00',3),('user.logins','2016-04-07 01:00:00',1),('user.logins','2016-04-07 05:00:00',1),('user.logins','2016-04-13 21:00:00',1),('user.logins','2016-04-17 15:00:00',1),('user.logins','2016-04-18 21:00:00',1),('user.logins','2016-04-21 22:00:00',1),('user.logins','2016-04-24 11:00:00',1),('user.logins','2016-04-24 20:00:00',1),('user.logins','2016-04-24 22:00:00',1),('user.logins','2016-04-25 17:00:00',3),('user.logins','2016-04-25 18:00:00',2),('user.logins','2016-04-25 19:00:00',8),('user.logins','2016-04-25 20:00:00',9),('user.logins','2016-04-25 21:00:00',3),('user.logins','2016-04-26 01:00:00',3),('user.logins','2016-04-26 02:00:00',1),('user.logins','2016-04-26 12:00:00',2),('user.logins','2016-04-26 19:00:00',2),('user.logins','2016-04-26 22:00:00',3),('user.logins','2016-04-26 23:00:00',3),('user.logins','2016-04-27 01:00:00',2),('user.logins','2016-04-27 02:00:00',1),('user.logins','2016-04-27 05:00:00',1),('user.logins','2016-04-27 19:00:00',2),('user.logins','2016-04-27 23:00:00',1),('user.logins','2016-04-28 03:00:00',2);
/*!40000 ALTER TABLE `engine4_core_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_status`
--

DROP TABLE IF EXISTS `engine4_core_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_status` (
  `status_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_status`
--

LOCK TABLES `engine4_core_status` WRITE;
/*!40000 ALTER TABLE `engine4_core_status` DISABLE KEYS */;
INSERT INTO `engine4_core_status` VALUES (1,'user',2,'Hello All','2016-03-07 15:08:25'),(2,'user',1,'How is everyone¬†','2016-04-25 04:12:25'),(3,'user',6,'Brooklyn is getting crazy everybody. Apartments are so expensive','2016-04-25 18:14:58'),(4,'user',1,'What\'s up everybody¬†','2016-04-26 22:13:27');
/*!40000 ALTER TABLE `engine4_core_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_styles`
--

DROP TABLE IF EXISTS `engine4_core_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_styles` (
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id` int(11) unsigned NOT NULL,
  `style` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_styles`
--

LOCK TABLES `engine4_core_styles` WRITE;
/*!40000 ALTER TABLE `engine4_core_styles` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_tagmaps`
--

DROP TABLE IF EXISTS `engine4_core_tagmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_tagmaps` (
  `tagmap_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `resource_id` int(11) unsigned NOT NULL,
  `tagger_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tagger_id` int(11) unsigned NOT NULL,
  `tag_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `extra` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`tagmap_id`),
  KEY `resource_type` (`resource_type`,`resource_id`),
  KEY `tagger_type` (`tagger_type`,`tagger_id`),
  KEY `tag_type` (`tag_type`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_tagmaps`
--

LOCK TABLES `engine4_core_tagmaps` WRITE;
/*!40000 ALTER TABLE `engine4_core_tagmaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_tagmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_tags`
--

DROP TABLE IF EXISTS `engine4_core_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_tags` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_tags`
--

LOCK TABLES `engine4_core_tags` WRITE;
/*!40000 ALTER TABLE `engine4_core_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_core_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_tasks`
--

DROP TABLE IF EXISTS `engine4_core_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_tasks` (
  `task_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `timeout` int(11) unsigned NOT NULL DEFAULT '60',
  `processes` smallint(3) unsigned NOT NULL DEFAULT '1',
  `semaphore` smallint(3) NOT NULL DEFAULT '0',
  `started_last` int(11) NOT NULL DEFAULT '0',
  `started_count` int(11) unsigned NOT NULL DEFAULT '0',
  `completed_last` int(11) NOT NULL DEFAULT '0',
  `completed_count` int(11) unsigned NOT NULL DEFAULT '0',
  `failure_last` int(11) NOT NULL DEFAULT '0',
  `failure_count` int(11) unsigned NOT NULL DEFAULT '0',
  `success_last` int(11) NOT NULL DEFAULT '0',
  `success_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `plugin` (`plugin`),
  KEY `module` (`module`),
  KEY `started_last` (`started_last`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_tasks`
--

LOCK TABLES `engine4_core_tasks` WRITE;
/*!40000 ALTER TABLE `engine4_core_tasks` DISABLE KEYS */;
INSERT INTO `engine4_core_tasks` VALUES (1,'Job Queue','core','Core_Plugin_Task_Jobs',5,1,0,1461829856,2791,1461829856,2791,0,0,1461829856,2791),(2,'Background Mailer','core','Core_Plugin_Task_Mail',15,1,0,1461829856,2789,1461829856,2789,0,0,1461829856,2789),(3,'Cache Prefetch','core','Core_Plugin_Task_Prefetch',300,1,0,1461829727,1457,1461829727,1457,0,0,1461829727,1457),(4,'Statistics','core','Core_Plugin_Task_Statistics',43200,1,0,1461829856,61,1461829856,61,0,0,1461829856,61),(5,'Log Rotation','core','Core_Plugin_Task_LogRotation',7200,1,0,1461829856,159,1461829856,159,0,0,1461829856,159),(6,'Member Data Maintenance','user','User_Plugin_Task_Cleanup',60,1,0,1461824496,1144,1461824496,1144,0,0,1461824496,1144),(7,'Payment Maintenance','user','Payment_Plugin_Task_Cleanup',43200,1,0,1461814467,50,1461814467,50,0,0,1461814467,50);
/*!40000 ALTER TABLE `engine4_core_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_core_themes`
--

DROP TABLE IF EXISTS `engine4_core_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_core_themes` (
  `theme_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`theme_id`),
  UNIQUE KEY `name` (`name`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_core_themes`
--

LOCK TABLES `engine4_core_themes` WRITE;
/*!40000 ALTER TABLE `engine4_core_themes` DISABLE KEYS */;
INSERT INTO `engine4_core_themes` VALUES (1,'default','Default','',0),(2,'midnight','Midnight','',0),(3,'clean','Clean','',0),(4,'modern','Modern','',0),(5,'bamboo','Bamboo','',0),(6,'digita','Digita','',0),(7,'grid-blue','Grid Blue','',0),(8,'grid-brown','Grid Brown','',0),(9,'grid-dark','Grid Dark','',0),(10,'grid-gray','Grid Gray','',0),(11,'grid-green','Grid Green','',0),(12,'grid-pink','Grid Pink','',0),(13,'grid-purple','Grid Purple','',0),(14,'grid-red','Grid Red','',0),(15,'kandy-cappuccino','Kandy Cappuccino','',0),(16,'kandy-limeorange','Kandy Limeorange','',0),(17,'kandy-mangoberry','Kandy Mangoberry','',0),(18,'kandy-watermelon','Kandy Watermelon','',0),(19,'musicbox-blue','Musicbox Blue','',0),(20,'musicbox-brown','Musicbox Brown','',0),(21,'musicbox-gray','Musicbox Gray','',0),(22,'musicbox-green','Musicbox Green','',0),(23,'musicbox-pink','Musicbox Pink','',0),(24,'musicbox-purple','Musicbox Purple','',0),(25,'musicbox-red','Musicbox Red','',0),(26,'musicbox-yellow','Musicbox Yellow','',0),(27,'quantum-beige','Quantum Beige','',0),(28,'quantum-blue','Quantum Blue','',0),(29,'quantum-gray','Quantum Gray','',0),(30,'quantum-green','Quantum Green','',0),(31,'quantum-orange','Quantum Orange','',0),(32,'quantum-pink','Quantum Pink','',0),(33,'quantum-purple','Quantum Purple','',0),(34,'quantum-red','Quantum Red','',0),(35,'slipstream','Slipstream','',0),(36,'snowbot','Snowbot','',0),(37,'ynresponsivepurity-green','YN - Responsive Purity Template - Green','Responsive Purity Template - Green',0),(38,'ynresponsivepurity-blue','YN - Responsive Purity Template - Blue','Responsive Purity Template - Blue',0),(39,'ynresponsivepurity-navy','YN - Responsive Purity Template - Navy','Responsive Purity Template - Blue',0),(40,'ynresponsivepurity-orange','YN - Responsive Purity Template - Orange','Responsive Purity Template - Blue',1),(41,'ynresponsivepurity-red','YN - Responsive Purity Template - Red','Responsive Purity Template - Red',0),(42,'ynresponsivepurity-purple','YN - Responsive Purity Template - Purple','Responsive Purity Template - Blue',0),(43,'ynresponsivepurity-yellow','YN - Responsive Purity Template - Yellow','Responsive Purity Template - Blue',0);
/*!40000 ALTER TABLE `engine4_core_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_albums`
--

DROP TABLE IF EXISTS `engine4_group_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_albums` (
  `album_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `photo_id` int(11) unsigned NOT NULL DEFAULT '0',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0',
  `comment_count` int(11) unsigned NOT NULL DEFAULT '0',
  `collectible_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`album_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_albums`
--

LOCK TABLES `engine4_group_albums` WRITE;
/*!40000 ALTER TABLE `engine4_group_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_categories`
--

DROP TABLE IF EXISTS `engine4_group_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_categories` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_categories`
--

LOCK TABLES `engine4_group_categories` WRITE;
/*!40000 ALTER TABLE `engine4_group_categories` DISABLE KEYS */;
INSERT INTO `engine4_group_categories` VALUES (3,'Computers & Internet'),(7,'Family & Home'),(10,'Health & Wellness'),(18,'Neighborhood Watch'),(19,'Process Server'),(20,'Legal');
/*!40000 ALTER TABLE `engine4_group_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_groups`
--

DROP TABLE IF EXISTS `engine4_group_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_groups` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `invite` tinyint(1) NOT NULL DEFAULT '1',
  `approval` tinyint(1) NOT NULL DEFAULT '0',
  `photo_id` int(11) unsigned NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `member_count` smallint(6) unsigned NOT NULL,
  `view_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `search` (`search`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_groups`
--

LOCK TABLES `engine4_group_groups` WRITE;
/*!40000 ALTER TABLE `engine4_group_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_listitems`
--

DROP TABLE IF EXISTS `engine4_group_listitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_listitems` (
  `listitem_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) unsigned NOT NULL,
  `child_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`listitem_id`),
  KEY `list_id` (`list_id`),
  KEY `child_id` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_listitems`
--

LOCK TABLES `engine4_group_listitems` WRITE;
/*!40000 ALTER TABLE `engine4_group_listitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_listitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_lists`
--

DROP TABLE IF EXISTS `engine4_group_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_lists` (
  `list_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int(11) unsigned NOT NULL,
  `child_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_lists`
--

LOCK TABLES `engine4_group_lists` WRITE;
/*!40000 ALTER TABLE `engine4_group_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_membership`
--

DROP TABLE IF EXISTS `engine4_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_membership` (
  `resource_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `resource_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_approved` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`resource_id`,`user_id`),
  KEY `REVERSE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_membership`
--

LOCK TABLES `engine4_group_membership` WRITE;
/*!40000 ALTER TABLE `engine4_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_photos`
--

DROP TABLE IF EXISTS `engine4_group_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_photos` (
  `photo_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection_id` int(11) unsigned NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `view_count` int(11) unsigned NOT NULL DEFAULT '0',
  `comment_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  KEY `album_id` (`album_id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_photos`
--

LOCK TABLES `engine4_group_photos` WRITE;
/*!40000 ALTER TABLE `engine4_group_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_posts`
--

DROP TABLE IF EXISTS `engine4_group_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_posts` (
  `post_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_posts`
--

LOCK TABLES `engine4_group_posts` WRITE;
/*!40000 ALTER TABLE `engine4_group_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_topics`
--

DROP TABLE IF EXISTS `engine4_group_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_topics` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `post_count` int(11) unsigned NOT NULL DEFAULT '0',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastpost_id` int(11) unsigned NOT NULL DEFAULT '0',
  `lastposter_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_topics`
--

LOCK TABLES `engine4_group_topics` WRITE;
/*!40000 ALTER TABLE `engine4_group_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_group_topicwatches`
--

DROP TABLE IF EXISTS `engine4_group_topicwatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_group_topicwatches` (
  `resource_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `watch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`resource_id`,`topic_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_group_topicwatches`
--

LOCK TABLES `engine4_group_topicwatches` WRITE;
/*!40000 ALTER TABLE `engine4_group_topicwatches` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_group_topicwatches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_invites`
--

DROP TABLE IF EXISTS `engine4_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `send_request` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `new_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `user_id` (`user_id`),
  KEY `recipient` (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_invites`
--

LOCK TABLES `engine4_invites` WRITE;
/*!40000 ALTER TABLE `engine4_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_messages_conversations`
--

DROP TABLE IF EXISTS `engine4_messages_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_messages_conversations` (
  `conversation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) unsigned NOT NULL,
  `recipients` int(11) unsigned NOT NULL,
  `modified` datetime NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `resource_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `resource_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_messages_conversations`
--

LOCK TABLES `engine4_messages_conversations` WRITE;
/*!40000 ALTER TABLE `engine4_messages_conversations` DISABLE KEYS */;
INSERT INTO `engine4_messages_conversations` VALUES (1,'website',1,1,'2016-04-26 23:14:22',0,NULL,0);
/*!40000 ALTER TABLE `engine4_messages_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_messages_messages`
--

DROP TABLE IF EXISTS `engine4_messages_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_messages_messages` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `attachment_type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `attachment_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `CONVERSATIONS` (`conversation_id`,`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_messages_messages`
--

LOCK TABLES `engine4_messages_messages` WRITE;
/*!40000 ALTER TABLE `engine4_messages_messages` DISABLE KEYS */;
INSERT INTO `engine4_messages_messages` VALUES (1,1,1,'website','are u working on the ste','2016-04-26 23:09:52','',0),(2,1,6,'','yes','2016-04-26 23:14:22','',0);
/*!40000 ALTER TABLE `engine4_messages_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_messages_recipients`
--

DROP TABLE IF EXISTS `engine4_messages_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_messages_recipients` (
  `user_id` int(11) unsigned NOT NULL,
  `conversation_id` int(11) unsigned NOT NULL,
  `inbox_message_id` int(11) unsigned DEFAULT NULL,
  `inbox_updated` datetime DEFAULT NULL,
  `inbox_read` tinyint(1) DEFAULT NULL,
  `inbox_deleted` tinyint(1) DEFAULT NULL,
  `outbox_message_id` int(11) unsigned DEFAULT NULL,
  `outbox_updated` datetime DEFAULT NULL,
  `outbox_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`conversation_id`),
  KEY `INBOX_UPDATED` (`user_id`,`conversation_id`,`inbox_updated`),
  KEY `OUTBOX_UPDATED` (`user_id`,`conversation_id`,`outbox_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_messages_recipients`
--

LOCK TABLES `engine4_messages_recipients` WRITE;
/*!40000 ALTER TABLE `engine4_messages_recipients` DISABLE KEYS */;
INSERT INTO `engine4_messages_recipients` VALUES (1,1,2,'2016-04-26 23:14:22',0,0,1,'2016-04-26 23:09:52',0),(6,1,1,'2016-04-26 23:09:52',1,0,2,'2016-04-26 23:14:22',0);
/*!40000 ALTER TABLE `engine4_messages_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_network_membership`
--

DROP TABLE IF EXISTS `engine4_network_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_network_membership` (
  `resource_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `resource_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resource_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_network_membership`
--

LOCK TABLES `engine4_network_membership` WRITE;
/*!40000 ALTER TABLE `engine4_network_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_network_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_network_networks`
--

DROP TABLE IF EXISTS `engine4_network_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_network_networks` (
  `network_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `pattern` text COLLATE utf8_unicode_ci,
  `member_count` int(11) unsigned NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `assignment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`network_id`),
  KEY `assignment` (`assignment`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_network_networks`
--

LOCK TABLES `engine4_network_networks` WRITE;
/*!40000 ALTER TABLE `engine4_network_networks` DISABLE KEYS */;
INSERT INTO `engine4_network_networks` VALUES (1,'North America','',0,NULL,0,0,0),(2,'South America','',0,NULL,0,0,0),(3,'Europe','',0,NULL,0,0,0),(4,'Asia','',0,NULL,0,0,0),(5,'Africa','',0,NULL,0,0,0),(6,'Australia','',0,NULL,0,0,0),(7,'Antarctica','',0,NULL,0,0,0);
/*!40000 ALTER TABLE `engine4_network_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_payment_gateways`
--

DROP TABLE IF EXISTS `engine4_payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_payment_gateways` (
  `gateway_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `config` mediumblob,
  `test_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gateway_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_payment_gateways`
--

LOCK TABLES `engine4_payment_gateways` WRITE;
/*!40000 ALTER TABLE `engine4_payment_gateways` DISABLE KEYS */;
INSERT INTO `engine4_payment_gateways` VALUES (1,'2Checkout',NULL,0,'Payment_Plugin_Gateway_2Checkout',NULL,0),(2,'PayPal',NULL,0,'Payment_Plugin_Gateway_PayPal',NULL,0),(3,'Testing',NULL,0,'Payment_Plugin_Gateway_Testing',NULL,1);
/*!40000 ALTER TABLE `engine4_payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_payment_orders`
--

DROP TABLE IF EXISTS `engine4_payment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_payment_orders` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `gateway_id` int(10) unsigned NOT NULL,
  `gateway_order_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `state` enum('pending','cancelled','failed','incomplete','complete') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'pending',
  `creation_date` datetime NOT NULL,
  `source_type` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `source_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `gateway_id` (`gateway_id`,`gateway_order_id`),
  KEY `state` (`state`),
  KEY `source_type` (`source_type`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_payment_orders`
--

LOCK TABLES `engine4_payment_orders` WRITE;
/*!40000 ALTER TABLE `engine4_payment_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_payment_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_payment_packages`
--

DROP TABLE IF EXISTS `engine4_payment_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_payment_packages` (
  `package_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `downgrade_level_id` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(16,2) unsigned NOT NULL,
  `recurrence` int(11) unsigned NOT NULL,
  `recurrence_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) unsigned NOT NULL,
  `duration_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci NOT NULL,
  `trial_duration` int(11) unsigned NOT NULL DEFAULT '0',
  `trial_duration_type` enum('day','week','month','year','forever') COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `signup` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `after_signup` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`package_id`),
  KEY `level_id` (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_payment_packages`
--

LOCK TABLES `engine4_payment_packages` WRITE;
/*!40000 ALTER TABLE `engine4_payment_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_payment_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_payment_products`
--

DROP TABLE IF EXISTS `engine4_payment_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_payment_products` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extension_type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `extension_id` int(10) unsigned DEFAULT NULL,
  `sku` bigint(20) unsigned NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(16,2) unsigned NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `extension_type` (`extension_type`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_payment_products`
--

LOCK TABLES `engine4_payment_products` WRITE;
/*!40000 ALTER TABLE `engine4_payment_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_payment_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_payment_subscriptions`
--

DROP TABLE IF EXISTS `engine4_payment_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_payment_subscriptions` (
  `subscription_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `package_id` int(11) unsigned NOT NULL,
  `status` enum('initial','trial','pending','active','cancelled','expired','overdue','refunded') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'initial',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `gateway_id` int(10) unsigned DEFAULT NULL,
  `gateway_profile_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  UNIQUE KEY `gateway_id` (`gateway_id`,`gateway_profile_id`),
  KEY `user_id` (`user_id`),
  KEY `package_id` (`package_id`),
  KEY `status` (`status`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_payment_subscriptions`
--

LOCK TABLES `engine4_payment_subscriptions` WRITE;
/*!40000 ALTER TABLE `engine4_payment_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_payment_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_payment_transactions`
--

DROP TABLE IF EXISTS `engine4_payment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_payment_transactions` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway_id` int(10) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `state` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `gateway_parent_transaction_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gateway_order_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `currency` char(3) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`transaction_id`),
  KEY `user_id` (`user_id`),
  KEY `gateway_id` (`gateway_id`),
  KEY `type` (`type`),
  KEY `state` (`state`),
  KEY `gateway_transaction_id` (`gateway_transaction_id`),
  KEY `gateway_parent_transaction_id` (`gateway_parent_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_payment_transactions`
--

LOCK TABLES `engine4_payment_transactions` WRITE;
/*!40000 ALTER TABLE `engine4_payment_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_payment_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_storage_chunks`
--

DROP TABLE IF EXISTS `engine4_storage_chunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_storage_chunks` (
  `chunk_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(11) unsigned NOT NULL,
  `data` blob NOT NULL,
  PRIMARY KEY (`chunk_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_storage_chunks`
--

LOCK TABLES `engine4_storage_chunks` WRITE;
/*!40000 ALTER TABLE `engine4_storage_chunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_storage_chunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_storage_files`
--

DROP TABLE IF EXISTS `engine4_storage_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_storage_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_file_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `parent_type` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `service_id` int(10) unsigned NOT NULL DEFAULT '1',
  `storage_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_major` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mime_minor` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `hash` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `parent_file_id` (`parent_file_id`,`type`),
  KEY `PARENT` (`parent_type`,`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_storage_files`
--

LOCK TABLES `engine4_storage_files` WRITE;
/*!40000 ALTER TABLE `engine4_storage_files` DISABLE KEYS */;
INSERT INTO `engine4_storage_files` VALUES (1,NULL,NULL,'user',1,1,'2016-03-29 17:16:37','2016-03-29 17:16:37',1,'public/user/01/0001_9bd7.jpg','jpg','FullSizeRender_m.jpg','image','jpeg',30145,'293a9bd7fd08d6c8405b74e43565ba66'),(2,1,'thumb.profile','user',1,1,'2016-03-29 17:16:37','2016-03-29 17:16:37',1,'public/user/02/0002_a5fc.jpg','jpg','FullSizeRender_p.jpg','image','jpeg',3720,'9200a5fcb6a4864c8a0ef982a4ac12c9'),(3,1,'thumb.normal','user',1,1,'2016-03-29 17:16:37','2016-03-29 17:16:37',1,'public/user/03/0003_fffc.jpg','jpg','FullSizeRender_in.jpg','image','jpeg',2395,'a964fffc2bccf8e423ca0658772665bb'),(4,1,'thumb.icon','user',1,1,'2016-03-29 17:16:37','2016-03-29 17:16:37',1,'public/user/04/0004_e209.jpg','jpg','FullSizeRender_is.jpg','image','jpeg',1152,'f18ae20970af188b5009a476295357ac'),(5,NULL,NULL,'album_photo',1,1,'2016-03-29 17:16:37','2016-03-29 17:16:37',1,'public/album_photo/05/0005_1c11.jpg','jpg','FullSizeRender_m_m.jpg','image','jpeg',30085,'21b71c1141efd1a3c105c28291c47bef'),(6,5,'thumb.normal','album_photo',1,1,'2016-03-29 17:16:37','2016-03-29 17:16:37',1,'public/album_photo/06/0006_06f5.jpg','jpg','FullSizeRender_m_in.jpg','image','jpeg',2396,'171706f52a1c43b3e008aa2bf86e180b'),(7,NULL,NULL,'user',4,NULL,'2016-04-05 17:20:50','2016-04-05 17:20:50',1,'public/user/07/0007_fe0e.png','png','m_TWG (1).png','image','png',43997,'8eadfe0eb154e404f50cd6462f5a0bc1'),(8,7,'thumb.profile','user',4,NULL,'2016-04-05 17:20:51','2016-04-05 17:20:51',1,'public/user/08/0008_13f5.png','png','p_TWG (1).png','image','png',31302,'f64e13f554a38aee499f0a546e6a0e85'),(9,7,'thumb.normal','user',4,NULL,'2016-04-05 17:20:51','2016-04-05 17:20:51',1,'public/user/09/0009_2411.png','png','n_TWG (1).png','image','png',3090,'6fc72411dba65ecb9c06c1f744b69c63'),(10,7,'thumb.icon','user',4,NULL,'2016-04-05 17:20:51','2016-04-05 17:20:51',1,'public/user/0a/000a_f08c.png','png','s_TWG (1).png','image','png',3999,'33f4f08c8df7f846710d474f631c6ad6'),(15,NULL,NULL,'user',6,NULL,'2016-04-25 18:07:52','2016-04-25 18:07:52',1,'public/user/0f/000f_d9ab.jpeg','jpeg','m_image.jpeg','image','jpeg',51162,'d7f4d9ab88b961d4e6a6549c2e8a4c48'),(16,15,'thumb.profile','user',6,NULL,'2016-04-25 18:07:52','2016-04-25 18:07:52',1,'public/user/10/0010_2527.jpeg','jpeg','p_image.jpeg','image','jpeg',10005,'afad2527e28503097b45cb8116b7bcd9'),(17,15,'thumb.normal','user',6,NULL,'2016-04-25 18:07:52','2016-04-25 18:07:52',1,'public/user/11/0011_b509.jpeg','jpeg','n_image.jpeg','image','jpeg',1555,'0f0eb509bcf042a77dd58e41692af7f4'),(18,15,'thumb.icon','user',6,NULL,'2016-04-25 18:07:52','2016-04-25 18:07:52',1,'public/user/12/0012_f982.jpeg','jpeg','s_image.jpeg','image','jpeg',1373,'c9a0f982198c06d1b3620bfc37f5fadf'),(19,NULL,NULL,'ynresponsivepurity_slider',1,1,'2016-04-26 13:04:42','2016-04-26 13:04:42',1,'public/ynresponsivepurity_slider/13/0013_05ea.jpeg','jpeg','m_d26a1d_16a5dddb8bc040e997019cbed058968a.jpeg','image','jpeg',71422,'1b7205eadac5552a2452e6c68e995650'),(20,19,'thumb.icon','ynresponsivepurity_slider',1,1,'2016-04-26 13:04:42','2016-04-26 13:04:42',1,'public/ynresponsivepurity_slider/14/0014_4d27.jpeg','jpeg','is_d26a1d_16a5dddb8bc040e997019cbed058968a.jpeg','image','jpeg',4606,'f2794d278a13464daf3dcef1a8f7d3c3'),(21,NULL,NULL,'ynresponsivepurity_slider',2,1,'2016-04-26 13:10:03','2016-04-26 13:10:03',1,'public/ynresponsivepurity_slider/15/0015_681e.jpg','jpg','m_d26a1d_6953ae6ef2014530ab7bf00ba8a61856.jpg','image','jpeg',179190,'e995681ef8689892bc574b0745b311a7'),(22,21,'thumb.icon','ynresponsivepurity_slider',2,1,'2016-04-26 13:10:03','2016-04-26 13:10:03',1,'public/ynresponsivepurity_slider/16/0016_46a9.jpg','jpg','is_d26a1d_6953ae6ef2014530ab7bf00ba8a61856.jpg','image','jpeg',3641,'eaaf46a95ada1ef028be34469d6db969'),(27,NULL,NULL,'ynresponsivepurity_slider',4,1,'2016-04-26 13:42:19','2016-04-26 13:42:19',1,'public/ynresponsivepurity_slider/1b/001b_f64b.jpg','jpg','m_d26a1d_ea3c5029ed1d45b89533fddd574ef1e1.jpg','image','jpeg',129943,'875ef64b07f3f22fd091e0d0e8fed43f'),(28,27,'thumb.icon','ynresponsivepurity_slider',4,1,'2016-04-26 13:42:19','2016-04-26 13:42:19',1,'public/ynresponsivepurity_slider/1c/001c_3014.jpg','jpg','is_d26a1d_ea3c5029ed1d45b89533fddd574ef1e1.jpg','image','jpeg',3726,'3aaa30146738dca41ceb963a5f2e0a51');
/*!40000 ALTER TABLE `engine4_storage_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_storage_mirrors`
--

DROP TABLE IF EXISTS `engine4_storage_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_storage_mirrors` (
  `file_id` bigint(20) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`file_id`,`service_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_storage_mirrors`
--

LOCK TABLES `engine4_storage_mirrors` WRITE;
/*!40000 ALTER TABLE `engine4_storage_mirrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_storage_mirrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_storage_services`
--

DROP TABLE IF EXISTS `engine4_storage_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_storage_services` (
  `service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `servicetype_id` int(10) unsigned NOT NULL,
  `config` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_storage_services`
--

LOCK TABLES `engine4_storage_services` WRITE;
/*!40000 ALTER TABLE `engine4_storage_services` DISABLE KEYS */;
INSERT INTO `engine4_storage_services` VALUES (1,1,NULL,1,1);
/*!40000 ALTER TABLE `engine4_storage_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_storage_servicetypes`
--

DROP TABLE IF EXISTS `engine4_storage_servicetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_storage_servicetypes` (
  `servicetype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `plugin` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `form` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`servicetype_id`),
  UNIQUE KEY `plugin` (`plugin`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_storage_servicetypes`
--

LOCK TABLES `engine4_storage_servicetypes` WRITE;
/*!40000 ALTER TABLE `engine4_storage_servicetypes` DISABLE KEYS */;
INSERT INTO `engine4_storage_servicetypes` VALUES (1,'Local Storage','Storage_Service_Local','Storage_Form_Admin_Service_Local',1),(2,'Database Storage','Storage_Service_Db','Storage_Form_Admin_Service_Db',0),(3,'Amazon S3','Storage_Service_S3','Storage_Form_Admin_Service_S3',1),(4,'Virtual File System','Storage_Service_Vfs','Storage_Form_Admin_Service_Vfs',1),(5,'Round-Robin','Storage_Service_RoundRobin','Storage_Form_Admin_Service_RoundRobin',0),(6,'Mirrored','Storage_Service_Mirrored','Storage_Form_Admin_Service_Mirrored',0);
/*!40000 ALTER TABLE `engine4_storage_servicetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_block`
--

DROP TABLE IF EXISTS `engine4_user_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_block` (
  `user_id` int(11) unsigned NOT NULL,
  `blocked_user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`blocked_user_id`),
  KEY `REVERSE` (`blocked_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_block`
--

LOCK TABLES `engine4_user_block` WRITE;
/*!40000 ALTER TABLE `engine4_user_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_facebook`
--

DROP TABLE IF EXISTS `engine4_user_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_facebook` (
  `user_id` int(11) unsigned NOT NULL,
  `facebook_uid` bigint(20) unsigned NOT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `facebook_uid` (`facebook_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_facebook`
--

LOCK TABLES `engine4_user_facebook` WRITE;
/*!40000 ALTER TABLE `engine4_user_facebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_fields_maps`
--

DROP TABLE IF EXISTS `engine4_user_fields_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_fields_maps` (
  `field_id` int(11) unsigned NOT NULL,
  `option_id` int(11) unsigned NOT NULL,
  `child_id` int(11) unsigned NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`field_id`,`option_id`,`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_fields_maps`
--

LOCK TABLES `engine4_user_fields_maps` WRITE;
/*!40000 ALTER TABLE `engine4_user_fields_maps` DISABLE KEYS */;
INSERT INTO `engine4_user_fields_maps` VALUES (0,0,1,1),(1,1,2,1),(1,1,3,2),(1,1,4,3),(1,1,5,4),(1,1,6,5),(1,1,7,6),(1,1,8,7),(1,1,9,8),(1,1,10,9),(1,1,11,10),(1,1,12,11),(1,1,13,12),(1,1,14,13),(1,1,15,14),(1,1,16,15),(1,4,17,2),(1,4,18,3),(1,4,19,4),(1,4,20,5),(1,4,21,1),(1,4,22,10),(1,4,23,12),(1,4,25,13),(1,4,30,8),(1,4,31,7),(1,4,33,6),(1,4,34,9),(1,5,35,2),(1,5,36,3),(1,5,37,4),(1,5,39,1),(1,5,40,10),(1,5,41,12),(1,5,42,13),(1,5,43,8),(1,5,44,7),(1,5,45,6),(1,5,46,9),(1,5,47,9999);
/*!40000 ALTER TABLE `engine4_user_fields_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_fields_meta`
--

DROP TABLE IF EXISTS `engine4_user_fields_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_fields_meta` (
  `field_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `label` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `display` tinyint(1) unsigned NOT NULL,
  `publish` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `search` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `order` smallint(3) unsigned NOT NULL DEFAULT '999',
  `config` text COLLATE utf8_unicode_ci,
  `validators` text COLLATE utf8_unicode_ci,
  `filters` text COLLATE utf8_unicode_ci,
  `style` text COLLATE utf8_unicode_ci,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_fields_meta`
--

LOCK TABLES `engine4_user_fields_meta` WRITE;
/*!40000 ALTER TABLE `engine4_user_fields_meta` DISABLE KEYS */;
INSERT INTO `engine4_user_fields_meta` VALUES (1,'profile_type','Profile Type','','profile_type',1,0,0,2,1,999,'',NULL,NULL,NULL,NULL),(2,'heading','Personal Information','','',0,1,0,0,1,999,'',NULL,NULL,NULL,NULL),(3,'first_name','First Name','','first_name',1,1,0,2,1,999,'','[[\"StringLength\",false,[1,32]]]',NULL,NULL,NULL),(4,'last_name','Last Name','','last_name',1,1,0,2,1,999,'','[[\"StringLength\",false,[1,32]]]',NULL,NULL,NULL),(5,'gender','Gender','','gender',0,1,0,1,1,999,'',NULL,NULL,NULL,NULL),(6,'birthdate','Birthday','','birthdate',0,1,0,1,1,999,'',NULL,NULL,NULL,NULL),(7,'heading','Contact Information','','',0,1,0,0,1,999,'',NULL,NULL,NULL,NULL),(8,'website','Website','','',0,1,0,0,1,999,'',NULL,NULL,NULL,NULL),(9,'twitter','Twitter','','',0,1,0,0,1,999,'',NULL,NULL,NULL,NULL),(10,'facebook','Facebook','','',0,1,0,0,1,999,'',NULL,NULL,NULL,NULL),(11,'aim','AIM','','',0,1,0,0,1,999,'',NULL,NULL,NULL,NULL),(12,'heading','Personal Details','','',0,1,0,0,1,999,'',NULL,NULL,NULL,NULL),(13,'about_me','Bio','','about_me',0,1,0,1,1,999,'[]',NULL,NULL,'',''),(14,'text','Education','','',0,1,0,1,1,999,'[]',NULL,NULL,'',''),(15,'text','Income','','',0,1,0,1,1,999,'[]',NULL,NULL,'',''),(16,'text','credit score','','',0,1,0,1,1,999,'[]',NULL,NULL,'',''),(17,'text','First Name','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(18,'text','Last Name','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(19,'text','Gender','','',0,1,0,1,1,999,'[]',NULL,NULL,'',''),(20,'text','Birthday','','',0,1,0,1,1,999,'[]',NULL,NULL,'',''),(21,'heading','Personal information','','',0,1,0,0,1,999,'[]',NULL,NULL,NULL,NULL),(22,'heading','Rental','','',0,1,0,0,1,999,'[]',NULL,NULL,NULL,NULL),(23,'text','Rental type','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(25,'text','Rental Condition','','',1,1,0,0,1,999,'[]',NULL,NULL,'',''),(30,'text','State','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(31,'text','City','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(33,'text','County','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(34,'text','Zip code ','','',0,1,0,0,1,999,'[]',NULL,NULL,'',''),(35,'text','First Name','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(36,'text','Last Name','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(37,'text','Gender','','',0,1,0,1,1,999,'[]',NULL,NULL,'',''),(39,'heading','Business Profile','','',0,1,0,0,1,999,'[]',NULL,NULL,NULL,NULL),(40,'heading','Business info','','',0,1,0,0,1,999,'[]',NULL,NULL,NULL,NULL),(41,'text','Service Provided','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(42,'text','How long in business','','',1,1,0,0,1,999,'[]',NULL,NULL,'',''),(43,'text','State','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(44,'text','City','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(45,'text','County','','',1,1,0,1,1,999,'[]',NULL,NULL,'',''),(46,'text','Zip code ','','',0,1,0,0,1,999,'[]',NULL,NULL,'',''),(47,'about_me','Cover Letter','','about_me',1,1,0,1,1,999,'[]',NULL,NULL,'','');
/*!40000 ALTER TABLE `engine4_user_fields_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_fields_options`
--

DROP TABLE IF EXISTS `engine4_user_fields_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_fields_options` (
  `option_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '999',
  PRIMARY KEY (`option_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_fields_options`
--

LOCK TABLES `engine4_user_fields_options` WRITE;
/*!40000 ALTER TABLE `engine4_user_fields_options` DISABLE KEYS */;
INSERT INTO `engine4_user_fields_options` VALUES (1,1,'Tenant',1),(2,5,'Male',1),(3,5,'Female',2),(4,1,'Landlord',999),(5,1,'Legal Aide',999);
/*!40000 ALTER TABLE `engine4_user_fields_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_fields_search`
--

DROP TABLE IF EXISTS `engine4_user_fields_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_fields_search` (
  `item_id` int(11) unsigned NOT NULL,
  `profile_type` enum('1','4','5') COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` smallint(6) unsigned DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `field_15` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_14` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_16` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_18` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_17` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_19` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_20` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_me` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_23` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_30` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_31` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_33` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_41` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_35` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `profile_type` (`profile_type`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `gender` (`gender`),
  KEY `birthdate` (`birthdate`),
  KEY `field_15` (`field_15`),
  KEY `field_14` (`field_14`),
  KEY `field_16` (`field_16`),
  KEY `field_18` (`field_18`),
  KEY `field_17` (`field_17`),
  KEY `field_19` (`field_19`),
  KEY `field_20` (`field_20`),
  KEY `about_me` (`about_me`),
  KEY `field_23` (`field_23`),
  KEY `field_30` (`field_30`),
  KEY `field_31` (`field_31`),
  KEY `field_33` (`field_33`),
  KEY `field_41` (`field_41`),
  KEY `field_35` (`field_35`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_fields_search`
--

LOCK TABLES `engine4_user_fields_search` WRITE;
/*!40000 ALTER TABLE `engine4_user_fields_search` DISABLE KEYS */;
INSERT INTO `engine4_user_fields_search` VALUES (1,'1','mic','b',2,'1991-03-03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'1','Xavier','Dor',2,'1985-05-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'1','Manish','Jha',2,'1990-12-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'1','Judith','Hinds',3,'1977-11-17','80000','BSN','720',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),(7,'1','jithesh','pk',2,'2004-01-01','','','',NULL,NULL,NULL,NULL,'bio',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `engine4_user_fields_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_fields_values`
--

DROP TABLE IF EXISTS `engine4_user_fields_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_fields_values` (
  `item_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `index` smallint(3) unsigned NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `privacy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`item_id`,`field_id`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_fields_values`
--

LOCK TABLES `engine4_user_fields_values` WRITE;
/*!40000 ALTER TABLE `engine4_user_fields_values` DISABLE KEYS */;
INSERT INTO `engine4_user_fields_values` VALUES (1,1,0,'1',NULL),(1,3,0,'mic','everyone'),(1,4,0,'b','everyone'),(1,5,0,'2','everyone'),(1,6,0,'1991-3-3','everyone'),(1,8,0,'','everyone'),(1,9,0,'','everyone'),(1,10,0,'','everyone'),(1,11,0,'','everyone'),(1,13,0,'top landlord','everyone'),(2,1,0,'1',NULL),(2,3,0,'Xavier',NULL),(2,4,0,'Dor',NULL),(2,5,0,'2',NULL),(2,6,0,'1985-5-5',NULL),(2,8,0,'',NULL),(2,9,0,'',NULL),(2,10,0,'',NULL),(2,11,0,'',NULL),(2,13,0,'',NULL),(4,1,0,'1',NULL),(4,3,0,'Manish',NULL),(4,4,0,'Jha',NULL),(4,5,0,'2',NULL),(4,6,0,'1990-12-7',NULL),(4,8,0,'e-development.co.in',NULL),(4,9,0,'',NULL),(4,10,0,'',NULL),(4,11,0,'',NULL),(4,13,0,'I am Manish',NULL),(6,1,0,'1',NULL),(6,3,0,'Judith',NULL),(6,4,0,'Hinds',NULL),(6,5,0,'3',NULL),(6,6,0,'1977-11-17',NULL),(6,8,0,'',NULL),(6,9,0,'',NULL),(6,10,0,'',NULL),(6,11,0,'',NULL),(6,13,0,'',NULL),(6,14,0,'BSN',NULL),(6,15,0,'80000',NULL),(6,16,0,'720',NULL),(7,1,0,'1',NULL),(7,3,0,'jithesh',NULL),(7,4,0,'pk',NULL),(7,5,0,'2',NULL),(7,6,0,'2004-1-1',NULL),(7,8,0,'',NULL),(7,9,0,'',NULL),(7,10,0,'',NULL),(7,11,0,'',NULL),(7,13,0,'bio',NULL),(7,14,0,'',NULL),(7,15,0,'',NULL),(7,16,0,'',NULL);
/*!40000 ALTER TABLE `engine4_user_fields_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_forgot`
--

DROP TABLE IF EXISTS `engine4_user_forgot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_forgot` (
  `user_id` int(11) unsigned NOT NULL,
  `code` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_forgot`
--

LOCK TABLES `engine4_user_forgot` WRITE;
/*!40000 ALTER TABLE `engine4_user_forgot` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_forgot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_janrain`
--

DROP TABLE IF EXISTS `engine4_user_janrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_janrain` (
  `user_id` int(11) unsigned NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_janrain`
--

LOCK TABLES `engine4_user_janrain` WRITE;
/*!40000 ALTER TABLE `engine4_user_janrain` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_janrain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_listitems`
--

DROP TABLE IF EXISTS `engine4_user_listitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_listitems` (
  `listitem_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) unsigned NOT NULL,
  `child_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`listitem_id`),
  KEY `list_id` (`list_id`),
  KEY `child_id` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_listitems`
--

LOCK TABLES `engine4_user_listitems` WRITE;
/*!40000 ALTER TABLE `engine4_user_listitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_listitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_lists`
--

DROP TABLE IF EXISTS `engine4_user_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_lists` (
  `list_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner_id` int(11) unsigned NOT NULL,
  `child_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_lists`
--

LOCK TABLES `engine4_user_lists` WRITE;
/*!40000 ALTER TABLE `engine4_user_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_logins`
--

DROP TABLE IF EXISTS `engine4_user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_logins` (
  `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varbinary(16) NOT NULL,
  `timestamp` datetime NOT NULL,
  `state` enum('success','no-member','bad-password','disabled','unpaid','third-party','v3-migration','unknown') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'unknown',
  `source` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login_id`),
  KEY `user_id` (`user_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_logins`
--

LOCK TABLES `engine4_user_logins` WRITE;
/*!40000 ALTER TABLE `engine4_user_logins` DISABLE KEYS */;
INSERT INTO `engine4_user_logins` VALUES (1,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-06 01:42:49','no-member',NULL,0),(2,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-06 01:43:04','no-member',NULL,0),(3,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-06 01:44:40','no-member',NULL,0),(4,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-06 01:44:54','no-member',NULL,0),(5,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-06 01:49:25','no-member',NULL,0),(6,1,'admin@suitecontact.com','D¡\\ú','2016-03-06 03:54:52','success',NULL,0),(7,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-14 19:51:52','no-member',NULL,0),(8,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-14 19:52:05','no-member',NULL,0),(9,1,'admin@suitecontact.com','D¡\\ú','2016-03-14 19:58:15','success',NULL,1),(10,1,'admin@suitecontact.com','D¡\\ú','2016-03-14 19:58:46','success',NULL,0),(11,1,'admin@suitecontact.com','D¡\\ú','2016-03-15 17:24:29','success',NULL,1),(12,NULL,'michael-bertrand@hotmail.com','Uªa2','2016-03-15 21:35:32','no-member',NULL,0),(13,NULL,'michael-bertrand@hotmail.com','Uªa2','2016-03-15 21:35:41','no-member',NULL,0),(14,NULL,'michael-bertrand@hotmail.com','Uªa2','2016-03-15 21:35:57','no-member',NULL,0),(15,NULL,'michael-bertrand@hotmail.com','Uªa2','2016-03-15 21:49:00','no-member',NULL,0),(16,NULL,'michael-bertrand@hotmail.com','Uªa2','2016-03-15 21:49:09','no-member',NULL,0),(17,NULL,'michael-bertrand@hotmail.com','Uªa2','2016-03-15 21:49:26','no-member',NULL,0),(18,NULL,'michael-bertrand@hotmail.com','Uªa2','2016-03-15 21:49:35','no-member',NULL,0),(19,NULL,'Fjhinds@live.com','çpK','2016-03-17 08:57:22','no-member',NULL,0),(20,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:30:41','no-member',NULL,0),(21,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:30:53','no-member',NULL,0),(22,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:31:06','no-member',NULL,0),(23,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:31:18','no-member',NULL,0),(24,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:35:55','no-member',NULL,0),(25,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:36:45','no-member',NULL,0),(26,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:40:56','no-member',NULL,0),(27,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:41:10','no-member',NULL,0),(28,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 19:48:00','no-member',NULL,0),(29,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 21:50:48','no-member',NULL,0),(30,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 21:54:41','no-member',NULL,0),(31,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 21:56:27','no-member',NULL,0),(32,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-28 22:04:04','no-member',NULL,0),(33,1,'admin@suitecontact.com','Uªa2','2016-03-28 22:30:14','success',NULL,1),(34,NULL,'michael-bertrand@hotmail.com','¨82','2016-03-28 22:50:34','no-member',NULL,0),(35,NULL,'michael-bertrand@hotmail.com','–6$ı','2016-03-29 02:36:15','no-member',NULL,0),(36,NULL,'michael-bertrand@hotmail.com','–6$ı','2016-03-29 02:36:45','no-member',NULL,0),(37,NULL,'michael-bertrand@hotmail.com','–6$ı','2016-03-29 02:42:11','no-member',NULL,0),(38,NULL,'ju11236@yahoo.com','D¡\\ú','2016-03-29 05:15:54','no-member',NULL,0),(39,NULL,'ju11236@yahoo.com','D¡\\ú','2016-03-29 05:16:39','no-member',NULL,0),(40,NULL,'ju11236@yahoo.com','D¡\\ú','2016-03-29 05:18:30','no-member',NULL,0),(41,NULL,'ju11236@yahoo.com','D¡\\ú','2016-03-29 05:18:53','no-member',NULL,0),(42,1,'admin@suitecontact.com','NS_','2016-03-29 14:40:16','success',NULL,0),(43,1,'admin@suitecontact.com','NS_','2016-03-29 14:46:29','success',NULL,1),(44,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:14:18','no-member',NULL,0),(45,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:15:37','no-member',NULL,0),(46,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:15:38','no-member',NULL,0),(47,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:15:48','no-member',NULL,0),(48,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:15:56','no-member',NULL,0),(49,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:16:04','no-member',NULL,0),(50,NULL,'fjhinds@live.com','D¡\\ú','2016-03-29 15:16:25','no-member',NULL,0),(51,NULL,'ju11236@yahoo.com','D¡\\ú','2016-03-29 15:16:50','no-member',NULL,0),(52,NULL,'ju11236@yahoo.com','D¡\\ú','2016-03-29 15:17:05','no-member',NULL,0),(53,NULL,'ju11236@yahoo.com','D¡\\ú','2016-03-29 15:17:28','no-member',NULL,0),(54,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:18:25','no-member',NULL,0),(55,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:18:53','no-member',NULL,0),(56,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:21:48','no-member',NULL,0),(57,NULL,'michael-bertrand@hotmail.com','D¡\\ú','2016-03-29 15:22:22','no-member',NULL,0),(58,NULL,'ju11236@yahoo.com','D¡\\ú','2016-03-29 15:22:48','no-member',NULL,0),(59,1,'admin@suitecontact.com','D¡\\ú','2016-03-29 15:27:26','success',NULL,0),(60,1,'admin@suitecontact.com','çpK','2016-03-30 06:08:17','success',NULL,0),(61,1,'admin@suitecontact.com','çpK','2016-03-30 09:38:56','success',NULL,1),(62,1,'admin@suitecontact.com','—å §','2016-03-30 13:14:30','success',NULL,0),(63,1,'admin@suitecontact.com','D¡\\ú','2016-03-30 13:49:32','success',NULL,0),(64,1,'admin@suitecontact.com','D¡\\ú','2016-03-30 14:40:40','success',NULL,1),(65,NULL,'mmanishjha@gmail.com','tÀ”','2016-04-05 17:19:06','no-member',NULL,0),(66,4,'mmanishjha@gmail.com','sª?‘','2016-04-06 11:14:21','success',NULL,0),(67,1,'admin@suitecontact.com','D¡WU','2016-04-06 19:44:30','success',NULL,1),(68,4,'mmanishjha@gmail.com','tÀÿ¿','2016-04-06 19:48:24','success',NULL,1),(69,4,'mmanishjha@gmail.com','tÀÿ¿','2016-04-06 19:48:52','bad-password',NULL,0),(70,4,'mmanishjha@gmail.com','tÀÿ¿','2016-04-06 19:49:00','success',NULL,0),(71,1,'admin@suitecontact.com','¨8#)','2016-04-07 01:42:47','success',NULL,1),(72,4,'mmanishjha@gmail.com','sª?‘','2016-04-07 05:39:39','bad-password',NULL,0),(73,4,'mmanishjha@gmail.com','sª?‘','2016-04-07 05:39:44','success',NULL,1),(74,1,'admin@suitecontact.com','—å#','2016-04-13 21:36:03','success',NULL,1),(75,1,'admin@suitecontact.com','D¡WU','2016-04-17 15:59:07','success',NULL,0),(76,1,'admin@suitecontact.com','D¡WU','2016-04-18 21:24:29','bad-password',NULL,0),(77,1,'admin@suitecontact.com','D¡WU','2016-04-18 21:24:42','bad-password',NULL,0),(78,1,'admin@suitecontact.com','D¡WU','2016-04-18 21:24:55','bad-password',NULL,0),(79,1,'admin@suitecontact.com','D¡WU','2016-04-18 21:25:14','bad-password',NULL,0),(80,1,'admin@suitecontact.com','D¡WU','2016-04-18 21:31:49','success',NULL,0),(81,1,'admin@suitecontact.com','¨8\n7','2016-04-19 22:46:44','bad-password',NULL,0),(82,1,'admin@suitecontact.com','¨8\n7','2016-04-19 22:47:09','bad-password',NULL,0),(83,1,'admin@suitecontact.com','¨8\n7','2016-04-19 22:47:21','bad-password',NULL,0),(84,1,'admin@suitecontact.com','¨:ê$','2016-04-21 22:42:18','success',NULL,1),(85,1,'admin@suitecontact.com','çpK','2016-04-22 14:32:56','bad-password',NULL,0),(86,1,'admin@suitecontact.com','çpK','2016-04-22 14:33:14','bad-password',NULL,0),(87,1,'admin@suitecontact.com','çpK','2016-04-22 14:33:43','bad-password',NULL,0),(88,1,'admin@suitecontact.com','çpK','2016-04-22 14:33:48','bad-password',NULL,0),(89,1,'admin@suitecontact.com','çpK','2016-04-22 14:33:53','bad-password',NULL,0),(90,1,'admin@suitecontact.com','çpK','2016-04-22 14:33:59','bad-password',NULL,0),(91,1,'admin@suitecontact.com','çpK','2016-04-22 14:34:26','bad-password',NULL,0),(92,1,'admin@suitecontact.com','D¡WU','2016-04-24 11:08:08','success',NULL,0),(93,NULL,'michael-bertrand@hotmail.com','NS_','2016-04-24 18:07:45','no-member',NULL,0),(94,NULL,'michael-bertrand@hotmail.com','NS_','2016-04-24 18:08:08','no-member',NULL,0),(95,NULL,'admin@suitcontact.com','NS_','2016-04-24 19:18:03','no-member',NULL,0),(96,NULL,'admin@suitcontact.com','NS_','2016-04-24 19:20:42','no-member',NULL,0),(97,1,'admin@suitecontact.com','NS_','2016-04-24 20:38:59','success',NULL,1),(98,1,'admin@suitecontact.com','¨8\"+','2016-04-24 22:37:16','success',NULL,0),(99,1,'admin@suitecontact.com','∂D3','2016-04-25 17:27:41','bad-password',NULL,0),(100,1,'admin@suitecontact.com','∂D3','2016-04-25 17:28:08','bad-password',NULL,0),(101,1,'admin@suitecontact.com','—å!®','2016-04-25 17:30:02','success',NULL,0),(102,1,'admin@suitecontact.com','—å!®','2016-04-25 17:35:08','success',NULL,0),(103,5,'ju11236@yahoo.com','D¡WU','2016-04-25 17:55:22','disabled',NULL,0),(104,5,'ju11236@yahoo.com','D¡WU','2016-04-25 17:58:23','disabled',NULL,0),(105,1,'admin@suitecontact.com','D¡WU','2016-04-25 17:59:04','success',NULL,0),(106,5,'ju11236@yahoo.com','D¡WU','2016-04-25 18:00:33','disabled',NULL,0),(107,5,'ju11236@yahoo.com','D¡WU','2016-04-25 18:01:54','disabled',NULL,0),(108,5,'ju11236@yahoo.com','D¡WU','2016-04-25 18:01:58','disabled',NULL,0),(109,5,'ju11236@yahoo.com','D¡WU','2016-04-25 18:04:52','disabled',NULL,0),(110,1,'admin@suitecontact.com','D¡WU','2016-04-25 18:53:26','success',NULL,0),(111,1,'admin@suitecontact.com','D¡WU','2016-04-25 18:57:48','success',NULL,0),(112,1,'admin@suitecontact.com','D¡WU','2016-04-25 19:17:00','success',NULL,0),(113,1,'admin@suitecontact.com','D¡WU','2016-04-25 19:21:31','success',NULL,0),(114,1,'admin@suitecontact.com','D¡WU','2016-04-25 19:25:07','success',NULL,0),(115,1,'admin@suitecontact.com','D¡WU','2016-04-25 19:27:04','success',NULL,0),(116,1,'admin@suitecontact.com','D¡WU','2016-04-25 19:28:29','success',NULL,0),(117,1,'admin@suitecontact.com','D¡WU','2016-04-25 19:30:02','success',NULL,0),(118,1,'admin@suitecontact.com','D¡WU','2016-04-25 19:32:12','success',NULL,0),(119,1,'admin@suitecontact.com','D¡WU','2016-04-25 19:44:25','success',NULL,0),(120,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:02:09','success',NULL,0),(121,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:06:08','success',NULL,0),(122,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:07:35','success',NULL,0),(123,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:09:37','success',NULL,0),(124,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:16:59','success',NULL,0),(125,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:18:04','success',NULL,0),(126,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:20:51','success',NULL,0),(127,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:23:17','success',NULL,0),(128,1,'admin@suitecontact.com','D¡WU','2016-04-25 20:25:41','success',NULL,0),(129,1,'admin@suitecontact.com','D¡WU','2016-04-25 21:02:37','success',NULL,0),(130,1,'admin@suitecontact.com','D¡WU','2016-04-25 21:03:56','success',NULL,0),(131,1,'admin@suitecontact.com','D¡WU','2016-04-25 21:10:40','success',NULL,0),(132,1,'admin@suitecontact.com','¨8{','2016-04-26 01:06:30','bad-password',NULL,0),(133,1,'admin@suitecontact.com','¨8{','2016-04-26 01:07:12','bad-password',NULL,0),(134,1,'admin@suitecontact.com','¨8{','2016-04-26 01:16:04','success',NULL,0),(135,1,'admin@suitecontact.com','D¡WU','2016-04-26 01:35:16','success',NULL,0),(136,1,'admin@suitecontact.com','D¡WU','2016-04-26 01:39:13','success',NULL,0),(137,1,'admin@suitecontact.com','D¡WU','2016-04-26 02:31:04','success',NULL,0),(138,1,'admin@suitecontact.com','D¡WU','2016-04-26 12:08:50','success',NULL,0),(139,6,'ju11236@yahoo.com','D¡WU','2016-04-26 12:11:01','success',NULL,0),(140,6,'ju11236@yahoo.com','D¡WU','2016-04-26 19:00:25','success',NULL,0),(141,1,'admin@suitecontact.com','D¡WU','2016-04-26 19:22:31','bad-password',NULL,0),(142,1,'admin@suitecontact.com','D¡WU','2016-04-26 19:24:09','success',NULL,0),(143,1,'admin@suitecontact.com','¨8\"‘','2016-04-26 22:11:27','success',NULL,1),(144,6,'ju11236@yahoo.com','D¡WU','2016-04-26 22:26:01','success',NULL,0),(145,1,'admin@suitecontact.com','D¡WU','2016-04-26 22:30:39','success',NULL,0),(146,6,'ju11236@yahoo.com','D¡WU','2016-04-26 23:13:47','success',NULL,0),(147,1,'admin@suitecontact.com','D¡WU','2016-04-26 23:26:35','success',NULL,0),(148,1,'admin@suitecontact.com','D¡WU','2016-04-26 23:46:13','success',NULL,0),(149,1,'admin@suitecontact.com','¨8##','2016-04-27 01:06:10','bad-password',NULL,0),(150,1,'admin@suitecontact.com','¨8##','2016-04-27 01:06:46','bad-password',NULL,0),(151,1,'admin@suitecontact.com','¨8##','2016-04-27 01:08:00','success',NULL,0),(152,1,'admin@suitecontact.com','–6,≥','2016-04-27 01:47:59','success',NULL,0),(153,1,'admin@suitecontact.com','–6,≥','2016-04-27 02:58:33','success',NULL,0),(154,1,'admin@suitecontact.com','D¡WU','2016-04-27 05:30:08','success',NULL,0),(155,1,'admin@suitecontact.com','D¡WU','2016-04-27 19:01:46','success',NULL,0),(156,1,'admin@suitecontact.com','D¡WU','2016-04-27 19:28:46','success',NULL,1),(157,6,'ju11236@yahoo.com','?è…Î','2016-04-27 23:12:42','success',NULL,1),(158,1,'admin@suitecontact.com','¨:êÑ','2016-04-28 03:25:32','success',NULL,0),(159,NULL,'michael-bertrand@hotmail.com','¨:êÑ','2016-04-28 03:35:49','no-member',NULL,0),(160,NULL,'michael-bertrand@hotmail.com','¨:êÑ','2016-04-28 03:36:07','no-member',NULL,0),(161,1,'admin@suitecontact.com','¨:êÑ','2016-04-28 03:36:25','success',NULL,1);
/*!40000 ALTER TABLE `engine4_user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_membership`
--

DROP TABLE IF EXISTS `engine4_user_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_membership` (
  `resource_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `resource_approved` tinyint(1) NOT NULL DEFAULT '0',
  `user_approved` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`resource_id`,`user_id`),
  KEY `REVERSE` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_membership`
--

LOCK TABLES `engine4_user_membership` WRITE;
/*!40000 ALTER TABLE `engine4_user_membership` DISABLE KEYS */;
INSERT INTO `engine4_user_membership` VALUES (1,6,1,1,1,NULL,NULL),(2,6,0,0,1,NULL,NULL),(6,1,1,1,1,NULL,NULL),(6,2,0,1,0,NULL,NULL);
/*!40000 ALTER TABLE `engine4_user_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_online`
--

DROP TABLE IF EXISTS `engine4_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_online` (
  `ip` varbinary(16) NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `active` datetime NOT NULL,
  PRIMARY KEY (`ip`,`user_id`),
  KEY `LOOKUP` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_online`
--

LOCK TABLES `engine4_user_online` WRITE;
/*!40000 ALTER TABLE `engine4_user_online` DISABLE KEYS */;
INSERT INTO `engine4_user_online` VALUES ('EØ)Ã',0,'2016-04-28 06:21:36'),('{?|∫',0,'2016-04-28 07:48:48'),('u˜∫',0,'2016-04-28 07:51:02'),('D¡WU',1,'2016-04-28 08:08:34');
/*!40000 ALTER TABLE `engine4_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_settings`
--

DROP TABLE IF EXISTS `engine4_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_settings` (
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_settings`
--

LOCK TABLES `engine4_user_settings` WRITE;
/*!40000 ALTER TABLE `engine4_user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_signup`
--

DROP TABLE IF EXISTS `engine4_user_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_signup` (
  `signup_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '999',
  `enable` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`signup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_signup`
--

LOCK TABLES `engine4_user_signup` WRITE;
/*!40000 ALTER TABLE `engine4_user_signup` DISABLE KEYS */;
INSERT INTO `engine4_user_signup` VALUES (1,'User_Plugin_Signup_Account',2,1),(2,'User_Plugin_Signup_Fields',3,1),(3,'User_Plugin_Signup_Photo',4,1),(4,'User_Plugin_Signup_Invite',5,1),(5,'Payment_Plugin_Signup_Subscription',1,0);
/*!40000 ALTER TABLE `engine4_user_signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_twitter`
--

DROP TABLE IF EXISTS `engine4_user_twitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_twitter` (
  `user_id` int(10) unsigned NOT NULL,
  `twitter_uid` bigint(20) unsigned NOT NULL,
  `twitter_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `twitter_uid` (`twitter_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_twitter`
--

LOCK TABLES `engine4_user_twitter` WRITE;
/*!40000 ALTER TABLE `engine4_user_twitter` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_twitter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_user_verify`
--

DROP TABLE IF EXISTS `engine4_user_verify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_user_verify` (
  `user_id` int(11) unsigned NOT NULL,
  `code` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_user_verify`
--

LOCK TABLES `engine4_user_verify` WRITE;
/*!40000 ALTER TABLE `engine4_user_verify` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_user_verify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_users`
--

DROP TABLE IF EXISTS `engine4_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `photo_id` int(11) unsigned NOT NULL DEFAULT '0',
  `status` text COLLATE utf8_unicode_ci,
  `status_date` datetime DEFAULT NULL,
  `password` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `salt` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'auto',
  `language` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'en_US',
  `timezone` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'America/Los_Angeles',
  `search` tinyint(1) NOT NULL DEFAULT '1',
  `show_profileviewers` tinyint(1) NOT NULL DEFAULT '1',
  `level_id` int(11) unsigned NOT NULL,
  `invites_used` int(11) unsigned NOT NULL DEFAULT '0',
  `extra_invites` int(11) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL,
  `creation_ip` varbinary(16) NOT NULL,
  `modified_date` datetime NOT NULL,
  `lastlogin_date` datetime DEFAULT NULL,
  `lastlogin_ip` varbinary(16) DEFAULT NULL,
  `update_date` int(11) DEFAULT NULL,
  `member_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `EMAIL` (`email`),
  UNIQUE KEY `USERNAME` (`username`),
  KEY `MEMBER_COUNT` (`member_count`),
  KEY `CREATION_DATE` (`creation_date`),
  KEY `search` (`search`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_users`
--

LOCK TABLES `engine4_users` WRITE;
/*!40000 ALTER TABLE `engine4_users` DISABLE KEYS */;
INSERT INTO `engine4_users` VALUES (1,'admin@suitecontact.com','admin','mic b',1,'What\'s up everybody¬†','2016-04-26 22:13:27','c63e29eefc77248748c6ccc5b0facb75','2164831','auto','en_US','US/Pacific',1,1,1,0,0,1,1,1,'2016-03-06 01:11:44','1314086686','2016-04-26 22:30:53','2016-04-28 03:36:25','¨:êÑ',NULL,0,8),(2,'fdor85@gmail.com','fdor85','Xavier Dor',0,'Hello All','2016-03-07 15:08:25','ed05279aeb447861928e0f53f9ee2128','2869599','English','English','US/Eastern',1,1,4,0,0,1,1,1,'2016-03-07 15:07:41','bt5)','2016-03-07 15:08:25','2016-03-07 15:07:41','bt5)',NULL,0,11),(4,'mmanishjha@gmail.com','mmanishjha','Manish Jha',7,NULL,NULL,'08bce63a333204abf94a66985c1cdb1b','1067975','English','English','US/Pacific',1,1,4,0,0,1,1,1,'2016-04-05 17:24:12','tÀ”','2016-04-05 17:24:12','2016-04-07 05:39:44','sª?‘',NULL,0,8),(6,'ju11236@yahoo.com',NULL,'Judith Hinds',15,'Brooklyn is getting crazy everybody. Apartments are so expensive','2016-04-25 18:14:58','b27c30ff5a321f845477038f7901055f','7172922','English','English','US/Eastern',1,1,4,0,0,1,1,1,'2016-04-25 18:08:02','D¡WU','2016-04-26 22:30:53','2016-04-27 23:12:42','?è…Î',NULL,0,4),(7,'jithesh.pk@titechnologies.in',NULL,'jithesh pk',0,NULL,NULL,'3bfaa068a45f7ff650aa65c5bba0e04e','7093624','English','English','US/Pacific',1,1,1,0,0,1,1,1,'2016-04-26 16:43:07','√Ï^','2016-04-26 16:43:08','2016-04-26 16:43:08','√Ï^',NULL,0,0);
/*!40000 ALTER TABLE `engine4_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_ynresponsivepurity_modules`
--

DROP TABLE IF EXISTS `engine4_ynresponsivepurity_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_ynresponsivepurity_modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(256) DEFAULT NULL,
  `icon_id` int(11) NOT NULL DEFAULT '0',
  `hover_icon_id` int(11) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '999',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_ynresponsivepurity_modules`
--

LOCK TABLES `engine4_ynresponsivepurity_modules` WRITE;
/*!40000 ALTER TABLE `engine4_ynresponsivepurity_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_ynresponsivepurity_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_ynresponsivepurity_sliders`
--

DROP TABLE IF EXISTS `engine4_ynresponsivepurity_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_ynresponsivepurity_sliders` (
  `slider_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(256) DEFAULT NULL,
  `photo_id` int(11) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '999',
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_ynresponsivepurity_sliders`
--

LOCK TABLES `engine4_ynresponsivepurity_sliders` WRITE;
/*!40000 ALTER TABLE `engine4_ynresponsivepurity_sliders` DISABLE KEYS */;
INSERT INTO `engine4_ynresponsivepurity_sliders` VALUES (1,'Find your match ','Browse for tenants and landlords that meet your requirement. ','',19,0),(2,'Rent anywhere in the world','Meet your landlord, view your apartment before you move.\r\n','',21,3),(4,'No brokers fee','connect directly with landlords. Meet interesting interesting and start talking.','',27,1);
/*!40000 ALTER TABLE `engine4_ynresponsivepurity_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_ynresponsivepurity_welcomes`
--

DROP TABLE IF EXISTS `engine4_ynresponsivepurity_welcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_ynresponsivepurity_welcomes` (
  `welcome_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(220) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_link` varchar(256) DEFAULT NULL,
  `link` varchar(256) DEFAULT NULL,
  `photo_id` int(11) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '999',
  PRIMARY KEY (`welcome_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_ynresponsivepurity_welcomes`
--

LOCK TABLES `engine4_ynresponsivepurity_welcomes` WRITE;
/*!40000 ALTER TABLE `engine4_ynresponsivepurity_welcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_ynresponsivepurity_welcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_younetcore_apisettings`
--

DROP TABLE IF EXISTS `engine4_younetcore_apisettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_younetcore_apisettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_younetcore_apisettings`
--

LOCK TABLES `engine4_younetcore_apisettings` WRITE;
/*!40000 ALTER TABLE `engine4_younetcore_apisettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine4_younetcore_apisettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_younetcore_install`
--

DROP TABLE IF EXISTS `engine4_younetcore_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_younetcore_install` (
  `token` text NOT NULL,
  `params` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_younetcore_install`
--

LOCK TABLES `engine4_younetcore_install` WRITE;
/*!40000 ALTER TABLE `engine4_younetcore_install` DISABLE KEYS */;
INSERT INTO `engine4_younetcore_install` VALUES ('e4e4191ae43fd8d2bec15711143efeea','1461533898',1);
/*!40000 ALTER TABLE `engine4_younetcore_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine4_younetcore_license`
--

DROP TABLE IF EXISTS `engine4_younetcore_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine4_younetcore_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` text NOT NULL,
  `descriptions` text,
  `type` varchar(50) NOT NULL,
  `current_version` varchar(50) NOT NULL,
  `lasted_version` varchar(50) NOT NULL,
  `is_active` int(1) DEFAULT '0',
  `date_active` int(11) DEFAULT NULL,
  `params` text,
  `download_link` varchar(500) DEFAULT NULL,
  `demo_link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine4_younetcore_license`
--

LOCK TABLES `engine4_younetcore_license` WRITE;
/*!40000 ALTER TABLE `engine4_younetcore_license` DISABLE KEYS */;
INSERT INTO `engine4_younetcore_license` VALUES (1,'ynresponsivepurity','YN - Responsive Purity Template','','module','4.01','4.01',1,NULL,'a:8:{s:1:\"m\";s:18:\"ynresponsivepurity\";s:2:\"tk\";s:32:\"e4e4191ae43fd8d2bec15711143efeea\";s:1:\"d\";s:20:\"cmVudHN0YXJ6LmNvbQ==\";s:2:\"ep\";s:10:\"1461533898\";s:4:\"time\";s:10:\"1461533898\";s:2:\"ls\";s:19:\"JCPZ-MFDF-ZKLD-QEZG\";s:1:\"t\";s:7:\"license\";s:3:\"svl\";s:300:\"YTo2OntzOjU6ImVtYWlsIjtzOjI4OiJtaWNoYWVsLWJlcnRyYW5kQGhvdG1haWwuY29tIjtzOjY6ImRvbWFpbiI7TjtzOjExOiJtb2R1bGVfbmFtZSI7czoxODoieW5yZXNwb25zaXZlcHVyaXR5IjtzOjg6Imhhc2hfa2V5IjtzOjE5OiJKQ1BaLU1GREYtWktMRC1RRVpHIjtzOjg6InBsYXRmb3JtIjtzOjEyOiJzb2NpYWxlbmdpbmUiO3M6MTY6InBsYXRmb3JtX3ZlcnNpb24iO3M6MToiNCI7fQ==\";}',NULL,NULL);
/*!40000 ALTER TABLE `engine4_younetcore_license` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-28  5:24:49
