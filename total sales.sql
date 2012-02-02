-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2011 at 05:01 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `total sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(3) NOT NULL AUTO_INCREMENT,
  `category_label` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` VALUES(1, 'fruit');
INSERT INTO `category` VALUES(2, 'vegetable');
INSERT INTO `category` VALUES(3, 'herbs');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(4) NOT NULL AUTO_INCREMENT,
  `item_label` varchar(50) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` VALUES(1, 'apple');
INSERT INTO `item` VALUES(2, 'orange');
INSERT INTO `item` VALUES(3, 'banana');
INSERT INTO `item` VALUES(4, 'grape');
INSERT INTO `item` VALUES(5, 'melon');
INSERT INTO `item` VALUES(6, 'tomatoes');
INSERT INTO `item` VALUES(7, 'brocoli');
INSERT INTO `item` VALUES(8, 'cabbage');
INSERT INTO `item` VALUES(9, 'lettuce');
INSERT INTO `item` VALUES(10, 'potatoes');
INSERT INTO `item` VALUES(11, 'onion');
INSERT INTO `item` VALUES(12, 'garlic');
INSERT INTO `item` VALUES(13, 'ginger');
INSERT INTO `item` VALUES(14, 'corriander');
INSERT INTO `item` VALUES(15, 'basil');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(7) NOT NULL AUTO_INCREMENT,
  `item_id` int(4) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `log`
--

INSERT INTO `log` VALUES(1, 1, '2011-10-19 21:52:27');
INSERT INTO `log` VALUES(2, 2, '2011-10-19 21:53:06');
INSERT INTO `log` VALUES(3, 3, '2011-10-19 21:53:06');
INSERT INTO `log` VALUES(4, 3, '2011-10-17 22:16:43');
INSERT INTO `log` VALUES(5, 4, '2011-10-18 22:16:53');
INSERT INTO `log` VALUES(6, 5, '2011-10-20 22:17:01');
INSERT INTO `log` VALUES(7, 9, '2011-10-20 22:24:07');
INSERT INTO `log` VALUES(8, 6, '2011-10-21 22:24:17');
INSERT INTO `log` VALUES(14, 9, '2011-10-20 03:43:06');
INSERT INTO `log` VALUES(15, 6, '2011-10-20 03:43:06');
INSERT INTO `log` VALUES(16, 1, '2011-10-20 03:43:06');
INSERT INTO `log` VALUES(17, 1, '2011-10-20 03:43:06');
INSERT INTO `log` VALUES(18, 2, '2011-10-20 03:43:06');
INSERT INTO `log` VALUES(19, 8, '2011-10-19 03:52:17');
INSERT INTO `log` VALUES(20, 8, '2011-10-19 03:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `mapping`
--

CREATE TABLE `mapping` (
  `mapping_id` int(4) NOT NULL AUTO_INCREMENT,
  `item_id` int(4) NOT NULL,
  `category_id` int(3) NOT NULL,
  PRIMARY KEY (`mapping_id`),
  KEY `item_id` (`item_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `mapping`
--

INSERT INTO `mapping` VALUES(1, 1, 1);
INSERT INTO `mapping` VALUES(2, 2, 1);
INSERT INTO `mapping` VALUES(3, 3, 1);
INSERT INTO `mapping` VALUES(4, 4, 1);
INSERT INTO `mapping` VALUES(5, 5, 1);
INSERT INTO `mapping` VALUES(6, 6, 2);
INSERT INTO `mapping` VALUES(7, 7, 2);
INSERT INTO `mapping` VALUES(16, 8, 2);
INSERT INTO `mapping` VALUES(17, 9, 2);
INSERT INTO `mapping` VALUES(9, 10, 2);
INSERT INTO `mapping` VALUES(10, 10, 2);
INSERT INTO `mapping` VALUES(8, 11, 2);
INSERT INTO `mapping` VALUES(15, 14, 3);
INSERT INTO `mapping` VALUES(14, 15, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `mapping`
--
ALTER TABLE `mapping`
  ADD CONSTRAINT `mapping_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mapping_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
