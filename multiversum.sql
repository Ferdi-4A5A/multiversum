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

-- Dumping data for table multiversum.orders: ~2 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderID`, `emailID`, `invoiceID`, `userID`, `orderCode`, `orderTitle`, `orderIsOnline`, `orderType`) VALUES
	(18, NULL, NULL, NULL, '64', NULL, NULL, NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table multiversum.ordersProducts
CREATE TABLE IF NOT EXISTS `ordersProducts` (
  `orderProductID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `productAmount` int(11) NOT NULL,
  PRIMARY KEY (`orderProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- Dumping data for table multiversum.ordersProducts: ~4 rows (approximately)
/*!40000 ALTER TABLE `ordersProducts` DISABLE KEYS */;
INSERT INTO `ordersProducts` (`orderProductID`, `orderID`, `productID`, `productAmount`) VALUES
	(251, 8, 2, 2),
	(252, 8, 1, 5),
	(253, 8, 3, 2),
	(254, 9, 3, 8),
	(256, 9, 6, 5),
	(257, 9, 4, 6),
	(258, 10, 4, 3),
	(259, 10, 4, 3),
	(260, 10, 3, 1),
	(262, 12, 2, 2),
	(263, 12, 5, 4),
	(264, 13, 3, 3),
	(265, 14, 4, 3),
	(266, 15, 3, 1),
	(267, 16, 3, 1),
	(268, 17, 4, 3),
	(269, 17, 33, 1),
	(270, 18, 64, 4);
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

-- Dumping data for table multiversum.products: ~37 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`productID`, `productEAN`, `productTitle`, `productHighlight1`, `productHighlight2`, `productHighlight3`, `productDetails`, `productImage`, `productStock`, `productExpectedDeliveryDays`, `productPrice`, `productAfmeting`, `productGewicht`, `productKleur`, `productSequence`, `productIsOnline`, `productIsSale`, `productSalePrice`) VALUES
	(1, '0471848768757, 4718487687572, 4718487689491, 4718487689507, 4718487693696, 4718487694723', 'HTC Vive', 'Een Vive Link Box', 'Twee draadloze controllers', 'oordopjes en twee Vive-basisstations', '', 'HTC_Vive.jpeg', '11', '', 929.00, '', '', '', '', '', '', ''),
	(2, '4047865190398', 'Zeiss VR One Plus', 'Verstelbare lenzen', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis dolor ut ante rhoncus pulvinar sit amet rhoncus risus. Etiam sagittis neque at eros tincidunt, eget convallis diam eleifend. Aliquam laoreet molestie lacus sit amet molestie. Nunc dapibus sed arcu ac iaculis. Curabitur maximus euismod urna, ac vehicula neque tempus varius. Sed orci orci, convallis ac laoreet a, rutrum eget lorem. Donec enim lectus, feugiat et massa vitae, condimentum dignissim ipsum. Pellentesque viverra, metus vel luctus dapibus, arcu urna pharetra diam, vitae condimentum leo est nec metus. Proin quis magna nec lectus molestie varius. In pellentesque tristique tortor sed feugiat. Morbi tempor mi eu augue accumsan, sodales scelerisque mauris pharetra. Duis nec cursus eros, eget scelerisque erat. Phasellus consectetur tempor sem, et luctus nibh auctor et. Donec ut aliquet arcu, quis lobortis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus et leo arcu. Proin dignissim neque eget eleifend sagittis. Ut sollicitudin sapien non tellus dictum, at luctus dolor finibus. Fusce ac cursus purus. Cras eleifend lectus vehicula, ornare tellus quis, varius erat. Nam in sapien ex. Sed eget ipsum non magna auctor accumsan. Proin dignissim vehicula urna, nec tincidunt lectus condimentum tincidunt. Vestibulum lorem metus, lacinia et sodales id, condimentum eget tellus. In hac habitasse platea dictumst. Vestibulum vehicula porttitor sem. Nam ipsum leo, porta nec mattis id, porta vel tortor. Cras sollicitudin metus ipsum, eu varius neque dignissim nec. Ut nec nisi odio. Praesent molestie egestas urna, sed molestie dolor ullamcorper ullamcorper. Etiam commodo tincidunt erat. Ut sollicitudin sollicitudin tristique. Vestibulum varius enim nec justo posuere rutrum. Suspendisse lobortis vel nisl vitae mattis. Sed ac pharetra lacus. Integer tincidunt, dolor eget maximus efficitur, justo purus fermentum massa, eget iaculis ipsum sem a nisi. Nunc ullamcorper augue in dolor gravida, id bibendum eros rutrum. Praesent ac nunc vel augue ultrices gravida. Nam congue vehicula dolor et consectetur. Sed cursus, nulla ut rhoncus sodales, leo felis hendrerit ipsum, eget porta nisi leo et quam. Suspendisse consequat in metus et bibendum. Nulla nibh orci, imperdiet vitae dignissim in, viverra sodales ex. Nam ligula enim, hendrerit placerat ultrices at, facilisis egestas diam. Proin eleifend auctor purus, tristique fringilla eros iaculis eget. Sed commodo condimentum risus, ut elementum sapien pharetra a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi scelerisque nunc non risus maximus, ac accumsan tortor rutrum. Pellentesque sed dictum magna. Mauris congue nisl nulla, et aliquet nulla fringilla eget. Aliquam a metus odio. Nam condimentum consequat ipsum ac eleifend. Suspendisse faucibus dui lacus, sit amet sagittis ligula malesuada et.', 'Zeiss_VR.jpeg', '23', '2', 97.50, '', '', '', '', '', '', ''),
	(3, '0711719843757, 2750057115988', 'Sony PlayStation VR', 'Accelerometer, Gyroscoop', 'HDMI, USB 2.0', 'Headset bedraad, Kabels', '', 'Sony_Playstation.png', '4', '', 378.00, '', '', '', '', '', '', ''),
	(4, '0780437918016, 8806088150192, 8806088150208, 8806088150239, 8806088157931', 'Samsung Galaxy Gear VR (v2)', 'Accelerometer, Gyroscoop', 'Wit', '318g', '', 'Samsung_Galaxy_Gear.jpeg', '14', '', 75.00, '', '', '', '', '', '', ''),
	(5, '8806088503141, 8806088503240, 8806088503929, 8806088503936, 8806088504049, 8806088516585', 'Samsung Gear VR 2', 'Accelerometer, Gyroscoop', 'Zwart', '345g', '', 'Samsung_Gear_VR2.jpeg', '18', '', 65.00, '', '', '', '', '', '', ''),
	(6, '4718487692866', 'HTC Vive Business Edition', 'Een Vive Link Box', 'Oordopjes en twee Vive-basisstations', 'Dedicated Business Edition customer support line', '', 'HTC_Vive_Business_Edition.jpeg', '2', '', 1399.00, '', '', '', '', '', '', ''),
	(64, '8886419329022', 'OSVR Hacker Development Kit 2', 'New Dual Display 2160x1200 low persistence OLED silver screen with 441 PPI running at 90 fps.', 'High performance dual lens system for ultra-sharp images', 'Enlarged eye-box for fuss-free setup, right out-of-box', 'Faceplate Module  Default for v1.4 IR Faceplate providing positional tracking  Comes with an IR Camera operating at 100hz.  Other variations include: OSVR Faceplate with Leap Motion offering embedded Leap Motion technology to support natural interaction using physical hands. Mainboard  Sensor hub with integrated accelerometer, gyroscope and compass  External USB 3.0 connection for additional accessories  Additional 2 x USB 3.0 connectors for internal expansion  Re-programmable for additional functionality. Display Module  * new Dual Display 2160x1200 low persistence OLED silver screen with 441 PPI running at 90 fps.  IQE (Image Quality Enhancement) technology for reduced screendoor effect. Optics Module  High performance dual lens system for ultra-sharp images  Enlarged eye-box for fuss-free setup, right out-of-box  Low geometric distortion and colour corrected image for faster rendering  Individual eye focus for personalized use without glasses.  *diopters cover +4.5 to -2 adjustments to cater to majority of users. HMD Mechanical Module Removable face mask with a bamboo charcoal microfibre foam layer, additional foam padding for cheekbones and nose bridge featuring rubber nose inserts for additional comfort. Belt Box Module  Additional USB 3.0 connectivity  Surround Sound Audio codec integrated  Easier cable management and ergonomics  Signal boosters', 'OSVR.png', '3', '2', 379.99, '', '', '', '', '', '', ''),
	(65, '3760071190020, 3760071190075', 'Homido Smartphone Virtual Reality Headset - Specif', '1 paar lenzen', '3 paar lenshouders', 'opbergtas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis dolor ut ante rhoncus pulvinar sit amet rhoncus risus. Etiam sagittis neque at eros tincidunt, eget convallis diam eleifend. Aliquam laoreet molestie lacus sit amet molestie. Nunc dapibus sed arcu ac iaculis. Curabitur maximus euismod urna, ac vehicula neque tempus varius. Sed orci orci, convallis ac laoreet a, rutrum eget lorem. Donec enim lectus, feugiat et massa vitae, condimentum dignissim ipsum. Pellentesque viverra, metus vel luctus dapibus, arcu urna pharetra diam, vitae condimentum leo est nec metus. Proin quis magna nec lectus molestie varius.\r\n\r\nIn pellentesque tristique tortor sed feugiat. Morbi tempor mi eu augue accumsan, sodales scelerisque mauris pharetra. Duis nec cursus eros, eget scelerisque erat. Phasellus consectetur tempor sem, et luctus nibh auctor et. Donec ut aliquet arcu, quis lobortis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus et leo arcu. Proin dignissim neque eget eleifend sagittis. Ut sollicitudin sapien non tellus dictum, at luctus dolor finibus. Fusce ac cursus purus. Cras eleifend lectus vehicula, ornare tellus quis, varius erat. Nam in sapien ex.\r\n\r\nSed eget ipsum non magna auctor accumsan. Proin dignissim vehicula urna, nec tincidunt lectus condimentum tincidunt. Vestibulum lorem metus, lacinia et sodales id, condimentum eget tellus. In hac habitasse platea dictumst. Vestibulum vehicula porttitor sem. Nam ipsum leo, porta nec mattis id, porta vel tortor. Cras sollicitudin metus ipsum, eu varius neque dignissim nec. Ut nec nisi odio. Praesent molestie egestas urna, sed molestie dolor ullamcorper ullamcorper. Etiam commodo tincidunt erat. Ut sollicitudin sollicitudin tristique. Vestibulum varius enim nec justo posuere rutrum.\r\n\r\nSuspendisse lobortis vel nisl vitae mattis. Sed ac pharetra lacus. Integer tincidunt, dolor eget maximus efficitur, justo purus fermentum massa, eget iaculis ipsum sem a nisi. Nunc ullamcorper augue in dolor gravida, id bibendum eros rutrum. Praesent ac nunc vel augue ultrices gravida. Nam congue vehicula dolor et consectetur. Sed cursus, nulla ut rhoncus sodales, leo felis hendrerit ipsum, eget porta nisi leo et quam.\r\n\r\nSuspendisse consequat in metus et bibendum. Nulla nibh orci, imperdiet vitae dignissim in, viverra sodales ex. Nam ligula enim, hendrerit placerat ultrices at, facilisis egestas diam. Proin eleifend auctor purus, tristique fringilla eros iaculis eget. Sed commodo condimentum risus, ut elementum sapien pharetra a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi scelerisque nunc non risus maximus, ac accumsan tortor rutrum. Pellentesque sed dictum magna. Mauris congue nisl nulla, et aliquet nulla fringilla eget. Aliquam a metus odio. Nam condimentum consequat ipsum ac eleifend. Suspendisse faucibus dui lacus, sit amet sagittis ligula malesuada et.', 'Homido_Smartphone_VR.png', '17', '2', 31.00, '', '', '', '', '', '', ''),
	(66, '8718924811184', 'Wonky Monkey 3D VR Glasses', 'Verstelbare lenzen', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis dolor ut ante rhoncus pulvinar sit amet rhoncus risus. Etiam sagittis neque at eros tincidunt, eget convallis diam eleifend. Aliquam laoreet molestie lacus sit amet molestie. Nunc dapibus sed arcu ac iaculis. Curabitur maximus euismod urna, ac vehicula neque tempus varius. Sed orci orci, convallis ac laoreet a, rutrum eget lorem. Donec enim lectus, feugiat et massa vitae, condimentum dignissim ipsum. Pellentesque viverra, metus vel luctus dapibus, arcu urna pharetra diam, vitae condimentum leo est nec metus. Proin quis magna nec lectus molestie varius. In pellentesque tristique tortor sed feugiat. Morbi tempor mi eu augue accumsan, sodales scelerisque mauris pharetra. Duis nec cursus eros, eget scelerisque erat. Phasellus consectetur tempor sem, et luctus nibh auctor et. Donec ut aliquet arcu, quis lobortis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus et leo arcu. Proin dignissim neque eget eleifend sagittis. Ut sollicitudin sapien non tellus dictum, at luctus dolor finibus. Fusce ac cursus purus. Cras eleifend lectus vehicula, ornare tellus quis, varius erat. Nam in sapien ex. Sed eget ipsum non magna auctor accumsan. Proin dignissim vehicula urna, nec tincidunt lectus condimentum tincidunt. Vestibulum lorem metus, lacinia et sodales id, condimentum eget tellus. In hac habitasse platea dictumst. Vestibulum vehicula porttitor sem. Nam ipsum leo, porta nec mattis id, porta vel tortor. Cras sollicitudin metus ipsum, eu varius neque dignissim nec. Ut nec nisi odio. Praesent molestie egestas urna, sed molestie dolor ullamcorper ullamcorper. Etiam commodo tincidunt erat. Ut sollicitudin sollicitudin tristique. Vestibulum varius enim nec justo posuere rutrum. Suspendisse lobortis vel nisl vitae mattis. Sed ac pharetra lacus. Integer tincidunt, dolor eget maximus efficitur, justo purus fermentum massa, eget iaculis ipsum sem a nisi. Nunc ullamcorper augue in dolor gravida, id bibendum eros rutrum. Praesent ac nunc vel augue ultrices gravida. Nam congue vehicula dolor et consectetur. Sed cursus, nulla ut rhoncus sodales, leo felis hendrerit ipsum, eget porta nisi leo et quam. Suspendisse consequat in metus et bibendum. Nulla nibh orci, imperdiet vitae dignissim in, viverra sodales ex. Nam ligula enim, hendrerit placerat ultrices at, facilisis egestas diam. Proin eleifend auctor purus, tristique fringilla eros iaculis eget. Sed commodo condimentum risus, ut elementum sapien pharetra a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi scelerisque nunc non risus maximus, ac accumsan tortor rutrum. Pellentesque sed dictum magna. Mauris congue nisl nulla, et aliquet nulla fringilla eget. Aliquam a metus odio. Nam condimentum consequat ipsum ac eleifend. Suspendisse faucibus dui lacus, sit amet sagittis ligula malesuada et.', 'Wonky_Monky_3D_VR_Glasses.jpeg', '23', '2', 10.00, '', '', '', '', '', '', ''),
	(68, '0187774000891', 'Vuzix iWear Video Headphones', 'Accelerometer', 'Gyroscoop', 'Koptelefoon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis dolor ut ante rhoncus pulvinar sit amet rhoncus risus. Etiam sagittis neque at eros tincidunt, eget convallis diam eleifend. Aliquam laoreet molestie lacus sit amet molestie. Nunc dapibus sed arcu ac iaculis. Curabitur maximus euismod urna, ac vehicula neque tempus varius. Sed orci orci, convallis ac laoreet a, rutrum eget lorem. Donec enim lectus, feugiat et massa vitae, condimentum dignissim ipsum. Pellentesque viverra, metus vel luctus dapibus, arcu urna pharetra diam, vitae condimentum leo est nec metus. Proin quis magna nec lectus molestie varius. In pellentesque tristique tortor sed feugiat. Morbi tempor mi eu augue accumsan, sodales scelerisque mauris pharetra. Duis nec cursus eros, eget scelerisque erat. Phasellus consectetur tempor sem, et luctus nibh auctor et. Donec ut aliquet arcu, quis lobortis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus et leo arcu. Proin dignissim neque eget eleifend sagittis. Ut sollicitudin sapien non tellus dictum, at luctus dolor finibus. Fusce ac cursus purus. Cras eleifend lectus vehicula, ornare tellus quis, varius erat. Nam in sapien ex. Sed eget ipsum non magna auctor accumsan. Proin dignissim vehicula urna, nec tincidunt lectus condimentum tincidunt. Vestibulum lorem metus, lacinia et sodales id, condimentum eget tellus. In hac habitasse platea dictumst. Vestibulum vehicula porttitor sem. Nam ipsum leo, porta nec mattis id, porta vel tortor. Cras sollicitudin metus ipsum, eu varius neque dignissim nec. Ut nec nisi odio. Praesent molestie egestas urna, sed molestie dolor ullamcorper ullamcorper. Etiam commodo tincidunt erat. Ut sollicitudin sollicitudin tristique. Vestibulum varius enim nec justo posuere rutrum. Suspendisse lobortis vel nisl vitae mattis. Sed ac pharetra lacus. Integer tincidunt, dolor eget maximus efficitur, justo purus fermentum massa, eget iaculis ipsum sem a nisi. Nunc ullamcorper augue in dolor gravida, id bibendum eros rutrum. Praesent ac nunc vel augue ultrices gravida. Nam congue vehicula dolor et consectetur. Sed cursus, nulla ut rhoncus sodales, leo felis hendrerit ipsum, eget porta nisi leo et quam. Suspendisse consequat in metus et bibendum. Nulla nibh orci, imperdiet vitae dignissim in, viverra sodales ex. Nam ligula enim, hendrerit placerat ultrices at, facilisis egestas diam. Proin eleifend auctor purus, tristique fringilla eros iaculis eget. Sed commodo condimentum risus, ut elementum sapien pharetra a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi scelerisque nunc non risus maximus, ac accumsan tortor rutrum. Pellentesque sed dictum magna. Mauris congue nisl nulla, et aliquet nulla fringilla eget. Aliquam a metus odio. Nam condimentum consequat ipsum ac eleifend. Suspendisse faucibus dui lacus, sit amet sagittis ligula malesuada et.', 'Vuzix_Vuzix.png', '4', '2', 655.21, '', '', '', '', '', '', ''),
	(69, '8713439213225', 'Trust GXT 720 3D Virtual Reality Glasses', 'Smartphone', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis dolor ut ante rhoncus pulvinar sit amet rhoncus risus. Etiam sagittis neque at eros tincidunt, eget convallis diam eleifend. Aliquam laoreet molestie lacus sit amet molestie. Nunc dapibus sed arcu ac iaculis. Curabitur maximus euismod urna, ac vehicula neque tempus varius. Sed orci orci, convallis ac laoreet a, rutrum eget lorem. Donec enim lectus, feugiat et massa vitae, condimentum dignissim ipsum. Pellentesque viverra, metus vel luctus dapibus, arcu urna pharetra diam, vitae condimentum leo est nec metus. Proin quis magna nec lectus molestie varius. In pellentesque tristique tortor sed feugiat. Morbi tempor mi eu augue accumsan, sodales scelerisque mauris pharetra. Duis nec cursus eros, eget scelerisque erat. Phasellus consectetur tempor sem, et luctus nibh auctor et. Donec ut aliquet arcu, quis lobortis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus et leo arcu. Proin dignissim neque eget eleifend sagittis. Ut sollicitudin sapien non tellus dictum, at luctus dolor finibus. Fusce ac cursus purus. Cras eleifend lectus vehicula, ornare tellus quis, varius erat. Nam in sapien ex. Sed eget ipsum non magna auctor accumsan. Proin dignissim vehicula urna, nec tincidunt lectus condimentum tincidunt. Vestibulum lorem metus, lacinia et sodales id, condimentum eget tellus. In hac habitasse platea dictumst. Vestibulum vehicula porttitor sem. Nam ipsum leo, porta nec mattis id, porta vel tortor. Cras sollicitudin metus ipsum, eu varius neque dignissim nec. Ut nec nisi odio. Praesent molestie egestas urna, sed molestie dolor ullamcorper ullamcorper. Etiam commodo tincidunt erat. Ut sollicitudin sollicitudin tristique. Vestibulum varius enim nec justo posuere rutrum. Suspendisse lobortis vel nisl vitae mattis. Sed ac pharetra lacus. Integer tincidunt, dolor eget maximus efficitur, justo purus fermentum massa, eget iaculis ipsum sem a nisi. Nunc ullamcorper augue in dolor gravida, id bibendum eros rutrum. Praesent ac nunc vel augue ultrices gravida. Nam congue vehicula dolor et consectetur. Sed cursus, nulla ut rhoncus sodales, leo felis hendrerit ipsum, eget porta nisi leo et quam. Suspendisse consequat in metus et bibendum. Nulla nibh orci, imperdiet vitae dignissim in, viverra sodales ex. Nam ligula enim, hendrerit placerat ultrices at, facilisis egestas diam. Proin eleifend auctor purus, tristique fringilla eros iaculis eget. Sed commodo condimentum risus, ut elementum sapien pharetra a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi scelerisque nunc non risus maximus, ac accumsan tortor rutrum. Pellentesque sed dictum magna. Mauris congue nisl nulla, et aliquet nulla fringilla eget. Aliquam a metus odio. Nam condimentum consequat ipsum ac eleifend. Suspendisse faucibus dui lacus, sit amet sagittis ligula malesuada et.', 'Trust_GXT_720_3D_VR.png', '3', '2', 32.99, '', '', '', '', '', '', ''),
	(70, '8718722141605', 'VR Shinecon VR Bril Zwart', 'Verstelbare lenzen', 'Afstandbediening', 'Controller(s)', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis dolor ut ante rhoncus pulvinar sit amet rhoncus risus. Etiam sagittis neque at eros tincidunt, eget convallis diam eleifend. Aliquam laoreet molestie lacus sit amet molestie. Nunc dapibus sed arcu ac iaculis. Curabitur maximus euismod urna, ac vehicula neque tempus varius. Sed orci orci, convallis ac laoreet a, rutrum eget lorem. Donec enim lectus, feugiat et massa vitae, condimentum dignissim ipsum. Pellentesque viverra, metus vel luctus dapibus, arcu urna pharetra diam, vitae condimentum leo est nec metus. Proin quis magna nec lectus molestie varius. In pellentesque tristique tortor sed feugiat. Morbi tempor mi eu augue accumsan, sodales scelerisque mauris pharetra. Duis nec cursus eros, eget scelerisque erat. Phasellus consectetur tempor sem, et luctus nibh auctor et. Donec ut aliquet arcu, quis lobortis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus et leo arcu. Proin dignissim neque eget eleifend sagittis. Ut sollicitudin sapien non tellus dictum, at luctus dolor finibus. Fusce ac cursus purus. Cras eleifend lectus vehicula, ornare tellus quis, varius erat. Nam in sapien ex. Sed eget ipsum non magna auctor accumsan. Proin dignissim vehicula urna, nec tincidunt lectus condimentum tincidunt. Vestibulum lorem metus, lacinia et sodales id, condimentum eget tellus. In hac habitasse platea dictumst. Vestibulum vehicula porttitor sem. Nam ipsum leo, porta nec mattis id, porta vel tortor. Cras sollicitudin metus ipsum, eu varius neque dignissim nec. Ut nec nisi odio. Praesent molestie egestas urna, sed molestie dolor ullamcorper ullamcorper. Etiam commodo tincidunt erat. Ut sollicitudin sollicitudin tristique. Vestibulum varius enim nec justo posuere rutrum. Suspendisse lobortis vel nisl vitae mattis. Sed ac pharetra lacus. Integer tincidunt, dolor eget maximus efficitur, justo purus fermentum massa, eget iaculis ipsum sem a nisi. Nunc ullamcorper augue in dolor gravida, id bibendum eros rutrum. Praesent ac nunc vel augue ultrices gravida. Nam congue vehicula dolor et consectetur. Sed cursus, nulla ut rhoncus sodales, leo felis hendrerit ipsum, eget porta nisi leo et quam. Suspendisse consequat in metus et bibendum. Nulla nibh orci, imperdiet vitae dignissim in, viverra sodales ex. Nam ligula enim, hendrerit placerat ultrices at, facilisis egestas diam. Proin eleifend auctor purus, tristique fringilla eros iaculis eget. Sed commodo condimentum risus, ut elementum sapien pharetra a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi scelerisque nunc non risus maximus, ac accumsan tortor rutrum. Pellentesque sed dictum magna. Mauris congue nisl nulla, et aliquet nulla fringilla eget. Aliquam a metus odio. Nam condimentum consequat ipsum ac eleifend. Suspendisse faucibus dui lacus, sit amet sagittis ligula malesuada et.', 'Shinecon_Bril_Zwart_VR.jpeg', '3', '2', 26.95, '', '', '', '', '', '', ''),
	(72, '', 'Aukey Cortex 4K VR Headset', 'Gyroscoop', 'Koptelefoon', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis dolor ut ante rhoncus pulvinar sit amet rhoncus risus. Etiam sagittis neque at eros tincidunt, eget convallis diam eleifend. Aliquam laoreet molestie lacus sit amet molestie. Nunc dapibus sed arcu ac iaculis. Curabitur maximus euismod urna, ac vehicula neque tempus varius. Sed orci orci, convallis ac laoreet a, rutrum eget lorem. Donec enim lectus, feugiat et massa vitae, condimentum dignissim ipsum. Pellentesque viverra, metus vel luctus dapibus, arcu urna pharetra diam, vitae condimentum leo est nec metus. Proin quis magna nec lectus molestie varius. In pellentesque tristique tortor sed feugiat. Morbi tempor mi eu augue accumsan, sodales scelerisque mauris pharetra. Duis nec cursus eros, eget scelerisque erat. Phasellus consectetur tempor sem, et luctus nibh auctor et. Donec ut aliquet arcu, quis lobortis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus et leo arcu. Proin dignissim neque eget eleifend sagittis. Ut sollicitudin sapien non tellus dictum, at luctus dolor finibus. Fusce ac cursus purus. Cras eleifend lectus vehicula, ornare tellus quis, varius erat. Nam in sapien ex. Sed eget ipsum non magna auctor accumsan. Proin dignissim vehicula urna, nec tincidunt lectus condimentum tincidunt. Vestibulum lorem metus, lacinia et sodales id, condimentum eget tellus. In hac habitasse platea dictumst. Vestibulum vehicula porttitor sem. Nam ipsum leo, porta nec mattis id, porta vel tortor. Cras sollicitudin metus ipsum, eu varius neque dignissim nec. Ut nec nisi odio. Praesent molestie egestas urna, sed molestie dolor ullamcorper ullamcorper. Etiam commodo tincidunt erat. Ut sollicitudin sollicitudin tristique. Vestibulum varius enim nec justo posuere rutrum. Suspendisse lobortis vel nisl vitae mattis. Sed ac pharetra lacus. Integer tincidunt, dolor eget maximus efficitur, justo purus fermentum massa, eget iaculis ipsum sem a nisi. Nunc ullamcorper augue in dolor gravida, id bibendum eros rutrum. Praesent ac nunc vel augue ultrices gravida. Nam congue vehicula dolor et consectetur. Sed cursus, nulla ut rhoncus sodales, leo felis hendrerit ipsum, eget porta nisi leo et quam. Suspendisse consequat in metus et bibendum. Nulla nibh orci, imperdiet vitae dignissim in, viverra sodales ex. Nam ligula enim, hendrerit placerat ultrices at, facilisis egestas diam. Proin eleifend auctor purus, tristique fringilla eros iaculis eget. Sed commodo condimentum risus, ut elementum sapien pharetra a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi scelerisque nunc non risus maximus, ac accumsan tortor rutrum. Pellentesque sed dictum magna. Mauris congue nisl nulla, et aliquet nulla fringilla eget. Aliquam a metus odio. Nam condimentum consequat ipsum ac eleifend. Suspendisse faucibus dui lacus, sit amet sagittis ligula malesuada et.', 'Aukey_Cortex_4K_VR.jpeg', '4', '2', 399.99, '', '', '', '', '', '', '');
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
