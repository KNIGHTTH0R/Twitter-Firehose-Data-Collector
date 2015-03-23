-- phpMiniAdmin dump 1.9.140405
-- Datetime: 2015-03-23 11:25:55
-- Host: 
-- Database: newscraper_db

/*!40030 SET NAMES utf8 */;
/*!40030 SET GLOBAL max_allowed_packet=16777216 */;

DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns` (
  `campaign_id` varchar(160) DEFAULT NULL,
  `command` varchar(20) DEFAULT NULL,
  `campaign_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `campaign_id` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `json_cache`;
CREATE TABLE `json_cache` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `cache_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `raw_tweet` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `campaign_id` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`cache_id`),
  KEY `tweet_id` (`tweet_id`),
  KEY `cache_date` (`cache_date`)
) ENGINE=MyISAM AUTO_INCREMENT=902180 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tweet_mentions`;
CREATE TABLE `tweet_mentions` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `source_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  KEY `tweet_id` (`tweet_id`),
  KEY `source` (`source_user_id`),
  KEY `target` (`target_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tweet_tags`;
CREATE TABLE `tweet_tags` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `tag` varchar(100) NOT NULL,
  KEY `tweet_id` (`tweet_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tweet_urls`;
CREATE TABLE `tweet_urls` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `url` varchar(140) NOT NULL,
  KEY `tweet_id` (`tweet_id`),
  KEY `url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tweets`;
CREATE TABLE `tweets` (
  `tweet_id` bigint(20) unsigned NOT NULL,
  `tweet_text` varchar(160) NOT NULL,
  `created_at` datetime NOT NULL,
  `geo_lat` decimal(10,5) DEFAULT NULL,
  `geo_long` decimal(10,5) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `screen_name` char(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `profile_image_url` varchar(200) DEFAULT NULL,
  `is_rt` tinyint(1) NOT NULL,
  `campaign_id` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`tweet_id`),
  KEY `created_at` (`created_at`),
  KEY `user_id` (`user_id`),
  KEY `screen_name` (`screen_name`),
  KEY `name` (`name`),
  FULLTEXT KEY `tweet_text` (`tweet_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint(20) unsigned NOT NULL,
  `screen_name` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `profile_image_url` varchar(200) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `followers_count` int(10) unsigned DEFAULT NULL,
  `friends_count` int(10) unsigned DEFAULT NULL,
  `statuses_count` int(10) unsigned DEFAULT NULL,
  `time_zone` varchar(40) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`name`),
  KEY `last_update` (`last_update`),
  KEY `screen_name` (`screen_name`),
  FULLTEXT KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- phpMiniAdmin dump end
