-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.41-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sopnovubon
--

CREATE DATABASE IF NOT EXISTS sopnovubon;
USE sopnovubon;

--
-- Definition of table `admin_registration`
--

DROP TABLE IF EXISTS `admin_registration`;
CREATE TABLE `admin_registration` (
  `admin_id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_registration`
--

/*!40000 ALTER TABLE `admin_registration` DISABLE KEYS */;
INSERT INTO `admin_registration` (`admin_id`,`first_name`,`last_name`,`mobile`,`email`,`user_name`,`password`) VALUES 
 (1,'Rakib','Hossain','01812870119','rakib.mishu1990@gmail.com','rakibhossain','1234'),
 (5,'Mohsin','kabir','01640506272','mohsinkabir@gmail.com','mohsinkabir','1234'),
 (6,'golam','Mostafa','01640506272','golammostafa@gmail.com','golammostafa','123');
/*!40000 ALTER TABLE `admin_registration` ENABLE KEYS */;


--
-- Definition of table `cencel_booking`
--

DROP TABLE IF EXISTS `cencel_booking`;
CREATE TABLE `cencel_booking` (
  `cencel_booking_id` int(10) unsigned NOT NULL auto_increment,
  `cust_id` int(10) unsigned NOT NULL,
  `booking_id` int(10) unsigned NOT NULL,
  `cenceletion_date` date NOT NULL,
  PRIMARY KEY  (`cencel_booking_id`),
  KEY `FK_cencel_booking_cust_id` (`cust_id`),
  KEY `FK_cencel_booking_booking_id` (`booking_id`),
  CONSTRAINT `FK_cencel_booking_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `confirm_booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cencel_booking_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer_registration` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cencel_booking`
--

/*!40000 ALTER TABLE `cencel_booking` DISABLE KEYS */;
INSERT INTO `cencel_booking` (`cencel_booking_id`,`cust_id`,`booking_id`,`cenceletion_date`) VALUES 
 (1,1,1,'2018-07-10'),
 (2,5,2,'2018-08-05'),
 (3,6,3,'2018-07-21');
/*!40000 ALTER TABLE `cencel_booking` ENABLE KEYS */;


--
-- Definition of table `confirm_booking`
--

DROP TABLE IF EXISTS `confirm_booking`;
CREATE TABLE `confirm_booking` (
  `booking_id` int(10) unsigned NOT NULL auto_increment,
  `pack_id` int(10) unsigned NOT NULL,
  `cust_id` int(10) unsigned NOT NULL,
  `confirm_Date` date NOT NULL,
  PRIMARY KEY  (`booking_id`),
  KEY `FK_confirm_booking_pack_id` (`pack_id`),
  KEY `FK_confirm_booking_cust_id` (`cust_id`),
  CONSTRAINT `FK_confirm_booking_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer_registration` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_confirm_booking_pack_id` FOREIGN KEY (`pack_id`) REFERENCES `pack` (`pack_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `confirm_booking`
--

/*!40000 ALTER TABLE `confirm_booking` DISABLE KEYS */;
INSERT INTO `confirm_booking` (`booking_id`,`pack_id`,`cust_id`,`confirm_Date`) VALUES 
 (1,2,1,'2018-07-09'),
 (2,1,5,'2018-07-15'),
 (3,4,6,'2018-07-20'),
 (5,3,7,'2018-07-21');
/*!40000 ALTER TABLE `confirm_booking` ENABLE KEYS */;


--
-- Definition of table `confirm_hotel_reservation`
--

DROP TABLE IF EXISTS `confirm_hotel_reservation`;
CREATE TABLE `confirm_hotel_reservation` (
  `hotel_reservation_id` int(10) unsigned NOT NULL auto_increment,
  `hotel_id` int(10) unsigned NOT NULL,
  `cust_id` int(10) unsigned NOT NULL,
  `reservation_Date` date NOT NULL,
  `check_In` date NOT NULL,
  `check_Out` date NOT NULL,
  PRIMARY KEY  (`hotel_reservation_id`),
  KEY `FK_confirm_hotel_reservation_hotel_id` (`hotel_id`),
  KEY `FK_confirm_hotel_reservation_cust_id` (`cust_id`),
  CONSTRAINT `FK_confirm_hotel_reservation_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer_registration` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_confirm_hotel_reservation_hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_reservation` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `confirm_hotel_reservation`
--

/*!40000 ALTER TABLE `confirm_hotel_reservation` DISABLE KEYS */;
INSERT INTO `confirm_hotel_reservation` (`hotel_reservation_id`,`hotel_id`,`cust_id`,`reservation_Date`,`check_In`,`check_Out`) VALUES 
 (1,1,1,'2018-07-11','2018-07-12','2018-07-14'),
 (2,2,5,'2018-07-18','2018-07-20','2018-07-23');
/*!40000 ALTER TABLE `confirm_hotel_reservation` ENABLE KEYS */;


--
-- Definition of table `customer_feedback`
--

DROP TABLE IF EXISTS `customer_feedback`;
CREATE TABLE `customer_feedback` (
  `feedback_id` int(10) unsigned NOT NULL auto_increment,
  `pack_id` int(10) unsigned NOT NULL,
  `cust_id` int(10) unsigned NOT NULL,
  `comment` varchar(500) NOT NULL,
  `feedback_Date` date NOT NULL,
  PRIMARY KEY  (`feedback_id`),
  KEY `FK_customer_feedback_pack_id` (`pack_id`),
  KEY `FK_customer_feedback_cust_id` (`cust_id`),
  CONSTRAINT `FK_customer_feedback_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer_registration` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_customer_feedback_pack_id` FOREIGN KEY (`pack_id`) REFERENCES `pack` (`pack_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_feedback`
--

/*!40000 ALTER TABLE `customer_feedback` DISABLE KEYS */;
INSERT INTO `customer_feedback` (`feedback_id`,`pack_id`,`cust_id`,`comment`,`feedback_Date`) VALUES 
 (1,1,1,'It is awasome package with reasonable price.Thank you.','2018-07-11'),
 (2,2,5,'This was an woderful package.','2018-07-30'),
 (3,4,7,'It Is awesome','2018-07-31');
/*!40000 ALTER TABLE `customer_feedback` ENABLE KEYS */;


--
-- Definition of table `customer_registration`
--

DROP TABLE IF EXISTS `customer_registration`;
CREATE TABLE `customer_registration` (
  `cust_id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY  (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_registration`
--

/*!40000 ALTER TABLE `customer_registration` DISABLE KEYS */;
INSERT INTO `customer_registration` (`cust_id`,`first_name`,`last_name`,`address`,`mobile`,`email`,`user_name`,`password`) VALUES 
 (1,'Rehnuma','Tabassum','Mugda','01818834853','rehnumaupoma2001@gmail.com','rehnumaupoma','123'),
 (5,'abdul','Bari','Rajshahi','01711111111111','abdulbari@gmail.com','abdulbari','12456'),
 (6,'Reajul','Islam','Barishal','0168975482','reajulislam','reajulislam','reajul123'),
 (7,'Nora','Fate','India','+65625458','norafatehi@gmail.com','norafatehi','new');
/*!40000 ALTER TABLE `customer_registration` ENABLE KEYS */;


--
-- Definition of table `hotel_reservation`
--

DROP TABLE IF EXISTS `hotel_reservation`;
CREATE TABLE `hotel_reservation` (
  `hotel_id` int(10) unsigned NOT NULL auto_increment,
  `hotel_place` varchar(50) NOT NULL,
  `hotel_name` varchar(50) NOT NULL,
  `room_type_cost` double NOT NULL,
  `facilities_cost` double default NULL,
  `Available_room` int(10) unsigned NOT NULL,
  `imageURL` varchar(200) NOT NULL,
  PRIMARY KEY  (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel_reservation`
--

/*!40000 ALTER TABLE `hotel_reservation` DISABLE KEYS */;
INSERT INTO `hotel_reservation` (`hotel_id`,`hotel_place`,`hotel_name`,`room_type_cost`,`facilities_cost`,`Available_room`,`imageURL`) VALUES 
 (1,'Cox\'s Bazar','Hotel Sea-gull',2000,500,10,''),
 (2,'Saint Martin\'s','Neel Kuthi',1600,1000,12,''),
 (4,'Sylhet','Grand Sultan',20000,10000,5,''),
 (5,'Kuakata','Hotel palace',2000,3000,10,'');
/*!40000 ALTER TABLE `hotel_reservation` ENABLE KEYS */;


--
-- Definition of table `pack`
--

DROP TABLE IF EXISTS `pack`;
CREATE TABLE `pack` (
  `pack_id` int(10) unsigned NOT NULL auto_increment,
  `pack_cat_id` int(10) unsigned NOT NULL,
  `pack_sub_cat_id` int(10) unsigned NOT NULL,
  `place` varchar(200) NOT NULL,
  `numberOfDay` int(10) unsigned NOT NULL,
  `numberOfNight` int(10) unsigned NOT NULL,
  `numberOfAdult` int(10) unsigned default NULL,
  `numberOfChild` int(10) unsigned default NULL,
  `accommodationCost` double NOT NULL,
  `busCost` double default NULL,
  `trainCost` double default NULL,
  `airCost` double default NULL,
  `guideServiceCost` double default NULL,
  `departureDate` date NOT NULL,
  `returnDate` date NOT NULL,
  `extraService` double default NULL,
  `total` double NOT NULL,
  `availablePackage` int(10) unsigned NOT NULL,
  `hotelName` varchar(100) NOT NULL,
  `imageURL` varchar(200) NOT NULL,
  PRIMARY KEY  USING BTREE (`pack_id`),
  KEY `FK_family_package_pack_cat_id` USING BTREE (`pack_cat_id`),
  KEY `FK_family_package_pack_sub_cat_id` USING BTREE (`pack_sub_cat_id`),
  CONSTRAINT `FK_pack_pack_cat_id` FOREIGN KEY (`pack_cat_id`) REFERENCES `package_category` (`pack_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pack_pack_sub_cat_id` FOREIGN KEY (`pack_sub_cat_id`) REFERENCES `package_sub_category` (`pack_sub_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pack`
--

/*!40000 ALTER TABLE `pack` DISABLE KEYS */;
INSERT INTO `pack` (`pack_id`,`pack_cat_id`,`pack_sub_cat_id`,`place`,`numberOfDay`,`numberOfNight`,`numberOfAdult`,`numberOfChild`,`accommodationCost`,`busCost`,`trainCost`,`airCost`,`guideServiceCost`,`departureDate`,`returnDate`,`extraService`,`total`,`availablePackage`,`hotelName`,`imageURL`) VALUES 
 (1,1,1,'Cox\'s Bazar',2,3,2,2,3000,2000,2000,10000,2000,'2018-07-18','2018-07-27',2000,6000,25,'Neel Kuthi','http:hjkkjjhhhghtredfghjnbgggg'),
 (2,1,1,'Saint Martins',2,3,2,2,4000,3000,2000,10000,3000,'2018-07-10','2018-07-12',3000,20000,20,'',''),
 (3,2,1,'Sylhet',2,3,2,3,10000,5000,2000,10000,3000,'2018-07-15','2018-07-18',2000,32000,10,'',''),
 (4,3,2,'Kuakata',2,3,2,2,2000,3000,2000,10000,2000,'2018-07-24','2018-07-28',2000,42000,10,'Neel Kuthi',''),
 (5,1,1,'Hill Tracks',2,3,2,3,5000,5000,NULL,NULL,NULL,'2018-07-24','2018-07-28',NULL,80000,10,'Pahari','');
/*!40000 ALTER TABLE `pack` ENABLE KEYS */;


--
-- Definition of table `package_category`
--

DROP TABLE IF EXISTS `package_category`;
CREATE TABLE `package_category` (
  `pack_cat_id` int(10) unsigned NOT NULL auto_increment,
  `pack_cat_name` varchar(45) NOT NULL,
  PRIMARY KEY  (`pack_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package_category`
--

/*!40000 ALTER TABLE `package_category` DISABLE KEYS */;
INSERT INTO `package_category` (`pack_cat_id`,`pack_cat_name`) VALUES 
 (1,'Diamond'),
 (2,'Gold'),
 (3,'Plutinum'),
 (4,'Silver');
/*!40000 ALTER TABLE `package_category` ENABLE KEYS */;


--
-- Definition of table `package_sub_category`
--

DROP TABLE IF EXISTS `package_sub_category`;
CREATE TABLE `package_sub_category` (
  `pack_sub_cat_id` int(10) unsigned NOT NULL auto_increment,
  `pack_cat_id` int(10) unsigned NOT NULL,
  `pack_sub_cat_name` varchar(45) NOT NULL,
  PRIMARY KEY  (`pack_sub_cat_id`),
  KEY `FK_pack_cat_id` (`pack_cat_id`),
  CONSTRAINT `FK_pack_cat_id` FOREIGN KEY (`pack_cat_id`) REFERENCES `package_category` (`pack_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package_sub_category`
--

/*!40000 ALTER TABLE `package_sub_category` DISABLE KEYS */;
INSERT INTO `package_sub_category` (`pack_sub_cat_id`,`pack_cat_id`,`pack_sub_cat_name`) VALUES 
 (1,2,'family_package'),
 (2,1,'couple_package'),
 (4,2,'family_package'),
 (5,2,'couple_package'),
 (6,4,'couple_package'),
 (7,1,'family_package');
/*!40000 ALTER TABLE `package_sub_category` ENABLE KEYS */;


--
-- Definition of table `payment_system`
--

DROP TABLE IF EXISTS `payment_system`;
CREATE TABLE `payment_system` (
  `payment_id` int(10) unsigned NOT NULL auto_increment,
  `cust_id` int(10) unsigned NOT NULL,
  `booking_id` int(10) unsigned NOT NULL,
  `card_no` varchar(30) NOT NULL,
  `cvv_no` varchar(30) NOT NULL,
  `expire_Date` date NOT NULL,
  PRIMARY KEY  (`payment_id`),
  KEY `FK_payment_system_cust_id` (`cust_id`),
  KEY `FK_payment_system_booking_id` (`booking_id`),
  CONSTRAINT `FK_payment_system_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `confirm_booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_payment_system_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer_registration` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_system`
--

/*!40000 ALTER TABLE `payment_system` DISABLE KEYS */;
INSERT INTO `payment_system` (`payment_id`,`cust_id`,`booking_id`,`card_no`,`cvv_no`,`expire_Date`) VALUES 
 (1,1,1,'123e458','6785-ra-256','2018-10-20'),
 (2,6,2,'k2458','45876k0','2018-07-17'),
 (3,5,3,'2145kh','kl-21-l8','2018-07-20');
/*!40000 ALTER TABLE `payment_system` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
