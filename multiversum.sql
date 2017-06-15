-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for multiversum
CREATE DATABASE IF NOT EXISTS `multiversum` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `multiversum`;


-- Dumping structure for table multiversum.emails
CREATE TABLE IF NOT EXISTS `emails` (
  `emailID` int(11) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(50) NOT NULL DEFAULT '0',
  `emailTimestamp` date NOT NULL,
  `emailTitle` varchar(50) NOT NULL DEFAULT '0',
  `emailDetails` varchar(50) NOT NULL DEFAULT '0',
  `emailAttachment` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.emails: ~0 rows (approximately)
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;


-- Dumping structure for table multiversum.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `invoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `orderID` int(11) NOT NULL DEFAULT '0',
  `invoiceDate` date NOT NULL,
  `invoiceExpirationDate` date NOT NULL,
  PRIMARY KEY (`invoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.invoices: ~0 rows (approximately)
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;


-- Dumping structure for table multiversum.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `emailID` int(11) DEFAULT NULL,
  `invoiceID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `orderCode` varchar(50) DEFAULT NULL,
  `orderTitle` varchar(50) DEFAULT NULL,
  `orderIsOnline` varchar(50) DEFAULT NULL,
  `orderType` int(11) DEFAULT NULL COMMENT '0=shipping 1=payment',
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.orders: ~1 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderID`, `emailID`, `invoiceID`, `userID`, `orderCode`, `orderTitle`, `orderIsOnline`, `orderType`) VALUES
	(8, NULL, NULL, NULL, '2', NULL, NULL, NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table multiversum.ordersProducts
CREATE TABLE IF NOT EXISTS `ordersProducts` (
  `orderProductID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `productAmount` int(11) NOT NULL,
  PRIMARY KEY (`orderProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.ordersProducts: ~1 rows (approximately)
/*!40000 ALTER TABLE `ordersProducts` DISABLE KEYS */;
INSERT INTO `ordersProducts` (`orderProductID`, `orderID`, `productID`, `productAmount`) VALUES
	(251, 8, 2, 1);
/*!40000 ALTER TABLE `ordersProducts` ENABLE KEYS */;


-- Dumping structure for table multiversum.products
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productEAN` varchar(50) NOT NULL,
  `productTitle` varchar(50) NOT NULL,
  `productHighlight1` varchar(50) NOT NULL,
  `productHighlight2` varchar(50) NOT NULL,
  `productHighlight3` varchar(50) NOT NULL,
  `productDetails` text NOT NULL,
  `productImage` varchar(50) NOT NULL,
  `productStock` varchar(50) NOT NULL,
  `productExpectedDeliveryDays` varchar(50) NOT NULL,
  `productPrice` varchar(50) NOT NULL,
  `productAfmeting` varchar(50) NOT NULL,
  `productGewicht` varchar(50) NOT NULL,
  `productKleur` varchar(50) NOT NULL,
  `productSequence` varchar(50) NOT NULL,
  `productIsOnline` varchar(50) NOT NULL,
  `productIsSale` varchar(50) NOT NULL,
  `productSalePrice` varchar(50) NOT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.products: ~3 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`productID`, `productEAN`, `productTitle`, `productHighlight1`, `productHighlight2`, `productHighlight3`, `productDetails`, `productImage`, `productStock`, `productExpectedDeliveryDays`, `productPrice`, `productAfmeting`, `productGewicht`, `productKleur`, `productSequence`, `productIsOnline`, `productIsSale`, `productSalePrice`) VALUES
	(1, '0815820020004', 'Oculus Rift', 'Goede bril', 'Mooie kleur', 'Zit goed', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla. nulla.', 'img/example.jpg', '2', '2', '588.73', '70x50x10cm', '2kg', 'Zwart', '1', '1', '', ''),
	(2, '322334', 'rere', 'ere', 'rsthrts', 'rstbrstb', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.', 'img/example.jpg', '3', '1', '324.43', '70x50x10cm', '4kg', 'Blauw', '2', '1', '', ''),
	(3, '', 'hh', '', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet neque vitae justo bibendum lacinia. Curabitur sit amet est vestibulum, malesuada magna ac, iaculis ante. Nullam scelerisque purus a tortor blandit sodales. Mauris at dolor orci. Ut maximus lorem sed malesuada dictum. Phasellus et dictum diam. Sed sollicitudin nisi nec nunc finibus pulvinar. Vivamus condimentum diam vestibulum, auctor neque id, pharetra nulla.', 'img/example.jpg', '7', '', '123.55', '', '', '', '', '', '', '');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- Dumping structure for table multiversum.users
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  `userStreetName` varchar(50) NOT NULL,
  `userStreetNumber` varchar(50) NOT NULL,
  `userPostcode` varchar(50) NOT NULL,
  `userPhoneNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
