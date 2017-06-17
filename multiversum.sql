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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderID`, `emailID`, `invoiceID`, `userID`, `orderCode`, `orderTitle`, `orderIsOnline`, `orderType`) VALUES
	(8, NULL, NULL, NULL, '2', NULL, NULL, NULL),
	(9, NULL, NULL, NULL, '3', NULL, NULL, NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table multiversum.ordersProducts
CREATE TABLE IF NOT EXISTS `ordersProducts` (
  `orderProductID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `productAmount` int(11) NOT NULL,
  PRIMARY KEY (`orderProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.ordersProducts: ~2 rows (approximately)
/*!40000 ALTER TABLE `ordersProducts` DISABLE KEYS */;
INSERT INTO `ordersProducts` (`orderProductID`, `orderID`, `productID`, `productAmount`) VALUES
	(251, 8, 2, 2),
	(252, 8, 1, 5),
	(253, 8, 3, 2),
	(254, 9, 3, 6);
/*!40000 ALTER TABLE `ordersProducts` ENABLE KEYS */;


-- Dumping structure for table multiversum.products
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productEAN` varchar(255) NOT NULL,
  `productTitle` varchar(50) NOT NULL,
  `productHighlight1` varchar(255) NOT NULL,
  `productHighlight2` varchar(255) NOT NULL,
  `productHighlight3` varchar(255) NOT NULL,
  `productDetails` text NOT NULL,
  `productImage` varchar(255) NOT NULL,
  `productStock` varchar(10) NOT NULL,
  `productExpectedDeliveryDays` varchar(50) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productAfmeting` varchar(50) NOT NULL,
  `productGewicht` varchar(50) NOT NULL,
  `productKleur` varchar(50) NOT NULL,
  `productSequence` varchar(50) NOT NULL,
  `productIsOnline` varchar(50) NOT NULL,
  `productIsSale` varchar(50) NOT NULL,
  `productSalePrice` varchar(50) NOT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.products: ~34 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`productID`, `productEAN`, `productTitle`, `productHighlight1`, `productHighlight2`, `productHighlight3`, `productDetails`, `productImage`, `productStock`, `productExpectedDeliveryDays`, `productPrice`, `productAfmeting`, `productGewicht`, `productKleur`, `productSequence`, `productIsOnline`, `productIsSale`, `productSalePrice`) VALUES
	(1, '0471848768757, 4718487687572, 4718487689491, 4718487689507, 4718487693696, 4718487694723', 'HTC Vive', 'Een Vive Link Box', 'Twee draadloze controllers', 'oordopjes en twee Vive-basisstations', '', 'HTC_Vive.jpeg', '11', '', 929.00, '', '', '', '', '', '', ''),
	(2, '0815820020004, 0815820020011, 0815820020066, 8158200200118', 'Oculus Rift', 'Voor en achterkant bevat sensoren zodat er 360 graden positionele tracking is', 'Geïntegreerde over je oren audio headset met 3D positionele geluidsweergave', 'Geïntegreerde hoge kwaliteit microfoon', 'Dankzij kartonnen brilletjes kan iedereen met een smartphone al een paar jaar eenvoudig een eerste blik in de virtuele wereld werpen. Met de introductie van de Oculus Rift, de HTC Vive en de PlayStation VR, is er sinds 2016 echter ook serieuze virtualrealityhardware voor consumenten beschikbaar. Microsoft werkt nog altijd aan zijn HoloLens voor augmented reality en bracht die bril dit jaar uit voor  ontwikkelaars. Daarnaast maakte de Windows 10-maker bekend dat computerfabrikanten volgend jaar vr-headsets gaan uitbrengen voor het Windows Holographic Platform. Dat is de omgeving binnen Windows 10 voor apps en toepassingen die gebruikmaken van virtual of augmented reality.', 'Oculus_Rift.png', '9', '', 599.00, '', '', '', '', '', '', ''),
	(3, '0711719843757, 2750057115988', 'Sony PlayStation VR', 'Accelerometer, Gyroscoop', 'HDMI, USB 2.0', 'Headset bedraad, Kabels', '', 'Sony_Playstation.png', '4', '', 378.00, '', '', '', '', '', '', ''),
	(4, '0780437918016, 8806088150192, 8806088150208, 8806088150239, 8806088157931', 'Samsung Galaxy Gear VR (v2)', 'Accelerometer, Gyroscoop', 'Wit', '318g', '', 'Samsung_Galaxy_Gear.jpeg', '14', '', 75.00, '', '', '', '', '', '', ''),
	(5, '8806088503141, 8806088503240, 8806088503929, 8806088503936, 8806088504049, 8806088516585', 'Samsung Gear VR 2', 'Accelerometer, Gyroscoop', 'Zwart', '345g', '', 'Samsung_Gear_VR2.jpeg', '18', '', 65.00, '', '', '', '', '', '', ''),
	(6, '4718487692866', 'HTC Vive Business Edition', 'Een Vive Link Box', 'Oordopjes en twee Vive-basisstations', 'Dedicated Business Edition customer support line', '', 'HTC_Vive_Business_Edition.jpeg', '2', '', 1399.00, '', '', '', '', '', '', ''),
	(33, '', '', '', '', '', '', 'bscap048.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(34, '', '', '', '', '', '', 'bscap019.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(35, '', '', '', '', '', '', 'bscap019.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(36, '', '', '', '', '', '', 'bscap019.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(37, '', '', '', '', '', '', 'bscap019.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(38, '', '', '', '', '', '', 'bscap030.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(39, '', '', '', '', '', '', 'bscap030.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(40, '', '', '', '', '', '', 'bscap030.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(41, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(42, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(43, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(44, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(45, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(46, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(47, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(48, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(49, '', '', '', '', '', '', 'bscap009.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(50, '', '', '', '', '', '', 'bscap021.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(51, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(52, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(53, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(54, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(55, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(56, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(57, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(58, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(59, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(60, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(61, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(62, '', '', '', '', '', '', 'bscap000.jpg', '', '', 0.00, '', '', '', '', '', '', ''),
	(63, '', '', '', '', '', '', 'bscap025.jpg', '', '', 0.00, '', '', '', '', '', '', '');
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
