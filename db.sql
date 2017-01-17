-- Adminer 4.2.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2017_01_17_060809_create_user_collision_table',	2);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id`, `user_name`, `password`, `mobile`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'cc',	'202cb962ac59075b964b07152d234b70',	'0',	'a',	'2017-01-16 00:00:00',	'2017-01-16 00:00:00',	NULL),
(2,	'chathura',	'202cb962ac59075b964b07152d234b70',	'0',	'a',	'2017-01-16 17:36:34',	'2017-01-16 17:36:34',	NULL);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Lahiru Chaminda',	'lahiruchaminda88@gmail.com',	'$2y$10$Z3EUfT2S8CutiWN34DXqYOaf5dLrMZSW9FC61wuVFJFmYIUfysQmO',	'Jos9Qg6IavNEDHMVvBdfVONGFn1dJiCLPfOBc556yTwAUkS3Q4qhXEWcgVu5',	'2016-11-02 05:19:15',	'2017-01-17 17:36:34');

DROP TABLE IF EXISTS `user_collision`;
CREATE TABLE `user_collision` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lat` int(11) NOT NULL,
  `lon` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `user_tracking`;
CREATE TABLE `user_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `lon` varchar(50) NOT NULL,
  `gps_type` varchar(10) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_tracking` (`id`, `user_id`, `lat`, `lon`, `gps_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15,	1,	'6.9271',	'79.8612',	'GPS',	'2017-01-17 18:23:12',	'2017-01-17 18:23:12',	NULL),
(16,	1,	'6.9497',	'80.7891',	'GPS',	'2017-01-17 18:23:12',	'2017-01-17 18:23:12',	NULL),
(17,	1,	'7.0745',	'79.9137',	'GPS',	'2017-01-17 18:23:12',	'2017-01-17 18:23:12',	NULL);

DROP TABLE IF EXISTS `user_vehicle`;
CREATE TABLE `user_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `vehicle_no` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `vehicle_model`;
CREATE TABLE `vehicle_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `vehicle_model` (`id`, `model`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'car',	'2017-01-16 00:00:00',	'2017-01-16 00:00:00',	NULL);

DROP VIEW IF EXISTS `view_user_travel`;
CREATE TABLE `view_user_travel` (`id` int(11), `user_id` int(11), `lat` varchar(50), `lon` varchar(50), `gps_type` varchar(10), `created_at` datetime, `updated_at` datetime, `deleted_at` datetime, `user_name` varchar(100), `mobile` varchar(15), `email` varchar(50));


DROP TABLE IF EXISTS `view_user_travel`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_user_travel` AS select `ut`.`id` AS `id`,`ut`.`user_id` AS `user_id`,`ut`.`lat` AS `lat`,`ut`.`lon` AS `lon`,`ut`.`gps_type` AS `gps_type`,`ut`.`created_at` AS `created_at`,`ut`.`updated_at` AS `updated_at`,`ut`.`deleted_at` AS `deleted_at`,`usr`.`user_name` AS `user_name`,`usr`.`mobile` AS `mobile`,`usr`.`email` AS `email` from (`user_tracking` `ut` join `user` `usr` on((`ut`.`user_id` = `usr`.`id`)));

-- 2017-01-17 18:34:19