-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2014 at 06:26 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `quicktestpro_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `answer_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(200) NOT NULL,
  `description` text,
  `question_id` bigint(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `modified_by` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `answers_question_id` (`question_id`),
  KEY `answers_created_by` (`created_by`),
  KEY `answers_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `multiple_answer` tinyint(1) NOT NULL,
  `subject` bigint(11) NOT NULL,
  `marks` float NOT NULL,
  `negative` tinyint(1) DEFAULT NULL,
  `section_id` bigint(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `modified_by` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `questions_section_id` (`section_id`),
  KEY `questions_creted_by` (`created_by`),
  KEY `questions_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `result_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `test_id` bigint(11) NOT NULL,
  `total_score` float NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `total_attempt` int(11) NOT NULL,
  `total_correct` int(11) NOT NULL,
  `percentage` float NOT NULL,
  `taken_duration` int(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `modified_by` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `results_test_id` (`test_id`),
  KEY `results_user_id` (`user_id`),
  KEY `results_created_by` (`created_by`),
  KEY `results_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by` bigint(11) NOT NULL,
  `modified_by` bigint(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `roles_created_by` (`created_by`),
  KEY `roles_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `section_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `modified_by` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_created_by` (`created_by`),
  KEY `sections_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
  `test_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `duration` datetime NOT NULL,
  `state` tinyint(1) NOT NULL,
  `questions` int(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `modified_by` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`test_id`),
  KEY `tests_created_by` (`created_by`),
  KEY `tests_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_assign`
--

CREATE TABLE IF NOT EXISTS `test_assign` (
  `test_assign_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `test_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `role_id` bigint(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_on` timestamp NOT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `modified_by` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`test_assign_id`),
  KEY `test_assign_test_id` (`test_id`),
  KEY `test_assign_user_id` (`user_id`),
  KEY `test_assign_created_by` (`created_by`),
  KEY `test_assign_modified_by` (`modified_by`),
  KEY `test_assign_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `ip_address` float DEFAULT NULL,
  `role_id` bigint(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `modified_by` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `users_role_id` (`role_id`),
  KEY `user_created_by` (`created_by`),
  KEY `users_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE IF NOT EXISTS `user_answers` (
  `user_answer_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `test_id` bigint(11) NOT NULL,
  `question_id` bigint(11) NOT NULL,
  `answer_id` bigint(11) NOT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `modified_by` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`user_answer_id`),
  KEY `user_answers_test_id` (`test_id`),
  KEY `user_answers_created_by` (`created_by`),
  KEY `user_answers_modified_by` (`modified_by`),
  KEY `user_answers_question_id` (`question_id`),
  KEY `user_answers_answer_id` (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `answers_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_creted_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `questions_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `questions_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `results_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `results_test_id` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`),
  ADD CONSTRAINT `results_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `roles_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `sections_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tests_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `test_assign`
--
ALTER TABLE `test_assign`
  ADD CONSTRAINT `test_assign_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `test_assign_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `test_assign_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `test_assign_test_id` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`),
  ADD CONSTRAINT `test_assign_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `user_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`),
  ADD CONSTRAINT `user_answers_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_answers_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `user_answers_test_id` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
