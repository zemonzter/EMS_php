-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2025 at 07:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems_db`
--
CREATE DATABASE IF NOT EXISTS `ems_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ems_db`;

-- --------------------------------------------------------

--
-- Table structure for table `budget_table`
--

CREATE TABLE IF NOT EXISTS `budget_table` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_name` varchar(255) NOT NULL,
  `budget_amount` int(11) NOT NULL,
  `budget_year` varchar(255) NOT NULL,
  `budget_type` varchar(255) NOT NULL,
  PRIMARY KEY (`budget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_table`
--

INSERT INTO `budget_table` (`budget_id`, `budget_name`, `budget_amount`, `budget_year`, `budget_type`) VALUES
(1, 'งบประมาณ ไตรมาสที่ 3', 30000, '2567', 'ครุภัณฑ์'),
(2, 'งบประมาณ ไตรมาสที่ 3', 15000, '2567', 'วัสดุ'),
(3, 'งบประมาณ ไตรมาสที่ 3', 15000, '2567', 'วัสดุ'),
(4, 'งบประมาณไตรมาสที่ 1', 25000, '2566', 'ครุภัณฑ์'),
(5, 'งบประมาณไตรมาสที่ 2', 50000, '2568', 'ครุภัณฑ์');

-- --------------------------------------------------------

--
-- Table structure for table `eq_chaeckout`
--

CREATE TABLE IF NOT EXISTS `eq_chaeckout` (
  `checkout_id` int(11) NOT NULL AUTO_INCREMENT,
  `eq_id` int(11) DEFAULT NULL,
  `checkout_date` varchar(255) DEFAULT NULL,
  `due_date` varchar(255) DEFAULT NULL,
  `return_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`checkout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eq_table`
--

CREATE TABLE IF NOT EXISTS `eq_table` (
  `eq_id` int(11) NOT NULL AUTO_INCREMENT,
  `eqt_id` int(11) NOT NULL,
  `eq_type` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `eq_model` varchar(255) DEFAULT NULL,
  `eq_brand` varchar(255) DEFAULT NULL,
  `eq_serial` varchar(255) DEFAULT NULL,
  `eq_status` varchar(255) DEFAULT NULL,
  `eq_price` varchar(255) NOT NULL,
  `eq_date` varchar(255) DEFAULT NULL,
  `eq_warran` varchar(255) DEFAULT NULL,
  `eq_img` varchar(255) NOT NULL,
  PRIMARY KEY (`eq_id`),
  KEY `eq_id` (`eq_id`,`eqt_id`),
  KEY `eq_id_2` (`eq_id`,`eqt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eq_table`
--

INSERT INTO `eq_table` (`eq_id`, `eqt_id`, `eq_type`, `user_id`, `eq_model`, `eq_brand`, `eq_serial`, `eq_status`, `eq_price`, `eq_date`, `eq_warran`, `eq_img`) VALUES
(1, 1, 'เครื่องคอมพิวเตอร์', 'นายซาลาโก้ โมซินโย่', 'OptiPlex SFF 7010', 'Dell', '357573g1421', 'Active', '30,281', '03-09-2024', '2 ปี', 'upload/34.jpg'),
(2, 1, 'เครื่องคอมพิวเตอร์', 'นายโซลาก้า เมซินยู้', 'Pro Tower 285 G8', 'HP', '24464656', 'Inactive', '26,215', '04-09-2024', '2 ปี', 'upload/33.jpg'),
(3, 2, 'จอมอนิเตอร์', 'Antonio', 'Monitor 24\"', 'MSI', '34654309', 'Active', '12,500', '07-09-2024', '3 Y', 'upload/33.jpg'),
(4, 4, 'คีย์บอร์ด', 'Uncle Nuay', 'ATK 68 Magnetic Switch', 'ATK', '7767854687', 'Active', '3,500', '09-09-2024', '2 Y', 'upload/34.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `eq_type`
--

CREATE TABLE IF NOT EXISTS `eq_type` (
  `eqt_id` int(11) NOT NULL AUTO_INCREMENT,
  `eqt_name` varchar(255) DEFAULT NULL,
  `eqt_img` varchar(255) NOT NULL,
  PRIMARY KEY (`eqt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eq_type`
--

INSERT INTO `eq_type` (`eqt_id`, `eqt_name`, `eqt_img`) VALUES
(1, '', 'upload/33.jpg'),
(2, '', 'upload/33.jpg'),
(3, '', 'upload/default.jpg'),
(4, '', 'upload/default.jpg'),
(5, '', 'upload/34.jpg'),
(6, '', 'upload/default.jpg'),
(7, '', 'upload/default.jpg'),
(8, '', 'upload/default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `home_tb`
--

CREATE TABLE IF NOT EXISTS `home_tb` (
  `home_id` int(11) NOT NULL AUTO_INCREMENT,
  `home_name` varchar(255) NOT NULL,
  `home_img` varchar(255) NOT NULL,
  PRIMARY KEY (`home_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_tb`
--

INSERT INTO `home_tb` (`home_id`, `home_name`, `home_img`) VALUES
(1, 'จัดการครุภัณฑ์', 'home_img/desk.png'),
(2, 'จัดการวัสดุ', 'home_img/material.png'),
(3, 'ระบบแจ้งซ่อม', 'home_img/troubleshooting.png'),
(4, 'ข้อมูลงบประมาณ', 'home_img/allocation.png');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_tb`
--

CREATE TABLE IF NOT EXISTS `maintenance_tb` (
  `mainten_id` int(11) NOT NULL AUTO_INCREMENT,
  `eq_id` varchar(255) NOT NULL,
  `mainten_date` varchar(255) NOT NULL,
  `mainten_detail` varchar(255) NOT NULL,
  `user_mainten` varchar(255) NOT NULL,
  `mainten_img` varchar(255) NOT NULL,
  PRIMARY KEY (`mainten_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance_tb`
--

INSERT INTO `maintenance_tb` (`mainten_id`, `eq_id`, `mainten_date`, `mainten_detail`, `user_mainten`, `mainten_img`) VALUES
(1, '1', '09-09-2024', 'error', 'ญาณวรุตม์ เลิศบุญประเสริฐ', 'upload/37.jpg'),
(2, '122334', '21-09-2024', 'error404', 'บุณยานุช ขาวแจ้ง', 'upload/default.jpg'),
(9, '342543dsfe', '21-09-2024', 'dfgf', 'บุณยานุช ขาวแจ้ง', 'upload/default.jpg'),
(10, '43667sdg', '21-09-2024', 'sdgfsdg', 'บุณยานุช ขาวแจ้ง', 'upload/default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mt_checkout`
--

CREATE TABLE IF NOT EXISTS `mt_checkout` (
  `mtcheck_id` int(11) NOT NULL AUTO_INCREMENT,
  `mt_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mtcheck_date` varchar(255) DEFAULT NULL,
  `mtcheck_qty` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `mt_duedate` varchar(255) DEFAULT NULL,
  `mt_turndate` varchar(255) DEFAULT NULL,
  `mt_note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mtcheck_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mt_table`
--

CREATE TABLE IF NOT EXISTS `mt_table` (
  `mt_id` int(11) NOT NULL AUTO_INCREMENT,
  `mt_type` varchar(255) NOT NULL,
  `mt_name` varchar(255) DEFAULT NULL,
  `unit_id` varchar(255) DEFAULT NULL,
  `mt_stock` int(11) DEFAULT NULL,
  `unit_price` int(11) NOT NULL,
  `mt_price` int(11) DEFAULT NULL,
  `mt_date` varchar(255) NOT NULL,
  `mt_img` varchar(255) NOT NULL,
  `mt_url` varchar(255) NOT NULL,
  PRIMARY KEY (`mt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mt_table`
--

INSERT INTO `mt_table` (`mt_id`, `mt_type`, `mt_name`, `unit_id`, `mt_stock`, `unit_price`, `mt_price`, `mt_date`, `mt_img`, `mt_url`) VALUES
(1, 'วัสดุสิ้นเปลือง', 'สายยาง สำหรับปั๊มน้ำขนาดเล็ก ขนาดยาว 1 เมตร\r\n', 'ชิ้น', 10, 25, 250, '08-09-2024', 'upload/tube.jpg', 'https://www.allnewstep.com/product/4454/'),
(2, 'วัสดุสิ้นเปลือง', 'ปั๊มน้ำขนาดเล็ก\r\n', 'ชิ้น', 10, 40, 400, '08-09-2024', 'upload/pump.png', 'https://www.allnewstep.com/product/2250/'),
(3, 'วัสดุสิ้นเปลือง', 'โมดูลใช้ในการตรวจจับความสว่างและความเข้มของแสง LDR Photoresistor Sensor', 'ชิ้น', 10, 15, 150, '19-09-2024', 'upload/ldr.jpg', ''),
(4, 'วัสดุสิ้นเปลือง', 'เซนเซอร์น้ำฝน ความชื้น Rain / Water Detection Sensor Module พร้อมสายไฟ', 'ชิ้น', 10, 18, 180, '19-09-2024', 'upload/rain_detect.jpg', ''),
(18, 'วัสดุสิ้นเปลือง', 'Soil Moisture Sensor V2 for Arduino Red PCB KEYS', 'ชิ้น', 10, 25, 250, '22-09-2024', 'upload/Soil Moisture Sensor V2.png', 'https://www.allnewstep.com/product/1836/soil-moisture-sensor-v2-for-arduino-red-pcb-keys'),
(19, 'วัสดุสิ้นเปลือง', 'LED สีเขียว ขนาด 8mm ', 'ชิ้น', 10, 3, 30, '29-01-2025', 'upload/green_led.jpg', 'https://www.allnewstep.com/product/3900/led-%E0%B8%AA%E0%B8%B5%E0%B9%80%E0%B8%82%E0%B8%B5%E0%B8%A2%E0%B8%A7-%E0%B8%82%E0%B8%99%E0%B8%B2%E0%B8%94-8mm-led-8-mm');

-- --------------------------------------------------------

--
-- Table structure for table `mt_type`
--

CREATE TABLE IF NOT EXISTS `mt_type` (
  `mttype_id` int(11) NOT NULL AUTO_INCREMENT,
  `mttype_name` varchar(255) DEFAULT NULL,
  `mttype_img` varchar(255) NOT NULL,
  PRIMARY KEY (`mttype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mt_type`
--

INSERT INTO `mt_type` (`mttype_id`, `mttype_name`, `mttype_img`) VALUES
(1, 'วัสดุสิ้นเปลือง', 'upload/default.jpg'),
(2, 'วัสดุถาวร', 'upload/default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `role_table`
--

CREATE TABLE IF NOT EXISTS `role_table` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_table`
--

INSERT INTO `role_table` (`role_id`, `role`, `description`) VALUES
(1, 'Admin', 'ผู้ดูแลระบบ'),
(2, 'User', 'ผู้ใช้งาน'),
(3, 'Engineer', 'วิศวกร'),
(4, 'Officer', 'เจ้าหน้าที่');

-- --------------------------------------------------------

--
-- Table structure for table `status_tb`
--

CREATE TABLE IF NOT EXISTS `status_tb` (
  `status_id` int(255) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status_tb`
--

INSERT INTO `status_tb` (`status_id`, `status`) VALUES
(1, 'Active'),
(2, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `unit_table`
--

CREATE TABLE IF NOT EXISTS `unit_table` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit_table`
--

INSERT INTO `unit_table` (`unit_id`, `unit_name`) VALUES
(1, 'ชิ้น'),
(2, 'แท่ง'),
(3, 'เล่ม'),
(4, 'แผ่น'),
(5, 'แพ็ค'),
(6, 'กล่อง'),
(7, 'ลัง'),
(8, 'ตัว'),
(9, 'ชุด'),
(10, 'ขวด'),
(11, 'ล้อ'),
(12, 'บอร์ด'),
(13, 'เส้น'),
(14, 'แถว'),
(15, 'ม้วน'),
(16, 'แผง'),
(17, 'ก้อน'),
(18, 'แพ'),
(19, 'ตู้'),
(20, 'ตลับ'),
(21, 'อัน'),
(22, 'แถว'),
(23, 'EA');

-- --------------------------------------------------------

--
-- Table structure for table `usertb`
--

CREATE TABLE IF NOT EXISTS `usertb` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_epass` varchar(255) DEFAULT NULL,
  `user_imgpath` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usertb` (`user_id`, `user_name`, `user_email`, `user_epass`, `user_imgpath`, `user_role`) VALUES 
(NULL, 'นงนาฎ ระวังวงศ์', 'nongnard.r@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'ณัฐพล หนูฤทธิ', 'nattapon.n@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'ชนมภัทร รุณปักษ์', 'chonmaphat.r@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'ปิยะพร มูลทองชุน', 'piyaporn.m@rmutsv.ac.th\r\n', NULL, 'home_img/user.png', 'User'), 
(NULL, 'กีรติ อินทวิเศษ', 'keerati.i@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'สุวิพล มหศักดิสกุล', 'suwipol.m@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'นราธร สังข์ประเสริฐ', 'naratorn.s@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'สิทธิโชค อุ่นแก้ว', 'sittichok.a@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'เกสรา เพชรกระจ่าง', 'ketsara.p@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'สันติ สถิตวรรธนะ', 'santi.s@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'อรรถพล คงหวาน', 'authapon.k@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'ชัยสิทธิ์ ชูสงค์', 'chaisit.c@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'พงศกร เจริญเนตรกุล', 'pongsagorn.ch@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'กิติศักดิ์ วัฒนกุล', 'kitisak.w@rmutsv.ac.th', NULL, 'home_img/user.png', 'User'), 
(NULL, 'ชัยชุมพล ชูราษฎร์', 'chaichumpon.c@rmutsv.ac.th', NULL, 'home_img/user.png', 'Engineer'), 
(NULL, 'นภาพร สมบูรณ์', 'napaporn.s@rmutsv.ac.th', NULL, 'home_img/user.png', 'Officer');
--
-- Database: `fix_db`
--
CREATE DATABASE IF NOT EXISTS `fix_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fix_db`;

-- --------------------------------------------------------

--
-- Table structure for table `fix_category`
--

CREATE TABLE IF NOT EXISTS `fix_category` (
  `type` varchar(20) NOT NULL,
  `category_id` varchar(10) DEFAULT '0',
  `language` varchar(2) DEFAULT '',
  `topic` varchar(150) NOT NULL,
  `color` varchar(16) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  KEY `type` (`type`),
  KEY `category_id` (`category_id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_category`
--

INSERT INTO `fix_category` (`type`, `category_id`, `language`, `topic`, `color`, `published`) VALUES
('repairstatus', '1', '', 'แจ้งซ่อม', '#660000', 1),
('repairstatus', '2', '', 'กำลังดำเนินการ', '#120eeb', 1),
('repairstatus', '3', '', 'รออะไหล่', '#d940ff', 1),
('repairstatus', '5', '', 'ซ่อมไม่สำเร็จ', '#FF0000', 1),
('repairstatus', '6', '', 'ยกเลิกการซ่อม', '#FF6F00', 1),
('repairstatus', '7', '', 'ส่งมอบเรียบร้อย', '#000000', 1),
('type_id', '4', '', 'จอมอนิเตอร์', NULL, 1),
('type_id', '3', '', 'โปรเจ็คเตอร์', NULL, 1),
('model_id', '4', '', 'ACER', NULL, 1),
('type_id', '2', '', 'เครื่องพิมพ์', NULL, 1),
('model_id', '3', '', 'Cannon', NULL, 1),
('model_id', '2', '', 'Asus', NULL, 1),
('type_id', '1', '', 'เครื่องคอมพิวเตอร์', NULL, 1),
('model_id', '1', '', 'Apple', NULL, 1),
('unit', 'อัน', '', 'อัน', NULL, 1),
('unit', 'กล่อง', '', 'กล่อง', NULL, 1),
('unit', 'เครื่อง', '', 'เครื่อง', NULL, 1),
('category_id', '1', '', 'ครุภัณฑ์', NULL, 1),
('category_id', '2', '', 'วัสดุสำนักงาน', NULL, 1),
('category_id', '3', '', 'Ram', NULL, 1),
('repairstatus', '8', '', 'ดำเนินการเสร็จเรียบร้อย', '#7DB368', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fix_inventory`
--

CREATE TABLE IF NOT EXISTS `fix_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(10) DEFAULT NULL,
  `model_id` varchar(10) DEFAULT NULL,
  `type_id` varchar(10) DEFAULT NULL,
  `topic` varchar(64) NOT NULL,
  `inuse` tinyint(1) DEFAULT 1,
  `count_stock` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `model_id` (`model_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_inventory`
--

INSERT INTO `fix_inventory` (`id`, `category_id`, `model_id`, `type_id`, `topic`, `inuse`, `count_stock`) VALUES
(1, '1', '4', '4', 'จอมอนิเตอร์ ACER S220HQLEBD', 1, 1),
(2, '1', '2', '1', 'ASUS A550JX', 1, 1),
(3, '3', '4', '1', 'Crucial 4GB DDR3L&amp;1600 SODIMM', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fix_inventory_items`
--

CREATE TABLE IF NOT EXISTS `fix_inventory_items` (
  `product_no` varchar(150) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `stock` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_no`),
  KEY `inventory_id` (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_inventory_items`
--

INSERT INTO `fix_inventory_items` (`product_no`, `inventory_id`, `unit`, `stock`) VALUES
('1108-365D', 1, 'กล่อง', 5),
('IF111/036/1', 3, 'อัน', 5),
('IF111/036/2', 3, 'อัน', 4),
('P87-0057', 2, 'เครื่อง', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fix_inventory_meta`
--

CREATE TABLE IF NOT EXISTS `fix_inventory_meta` (
  `inventory_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` text NOT NULL,
  KEY `inventory_id` (`inventory_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fix_language`
--

CREATE TABLE IF NOT EXISTS `fix_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` text NOT NULL,
  `type` varchar(5) NOT NULL,
  `owner` varchar(20) NOT NULL,
  `js` tinyint(1) NOT NULL,
  `th` text DEFAULT NULL,
  `en` text DEFAULT NULL,
  `la` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_language`
--

INSERT INTO `fix_language` (`id`, `key`, `type`, `owner`, `js`, `th`, `en`, `la`) VALUES
(1, 'ACCEPT_ALL', 'text', 'index', 1, 'ยอมรับทั้งหมด', 'Accept all', 'ຍອມຮັບທັງຫມົດ'),
(2, 'CANCEL', 'text', 'index', 1, 'ยกเลิก', 'Cancel', 'ຍົກເລີກ'),
(3, 'CHANGE_COLOR', 'text', 'index', 1, 'เปลี่ยนสี', 'change color', 'ປ່ຽນສີ'),
(4, 'CHECK', 'text', 'index', 1, 'เลือก', 'check', 'ເລືອກ'),
(5, 'CHECKBOX', 'text', 'index', 1, 'ตัวเลือก', 'Checkbox', 'ກ່ອງກາເຄື່ອງໝາຍ'),
(6, 'COOKIES_SETTINGS', 'text', 'index', 1, 'ตั้งค่าคุกกี้', 'Cookies settings', 'ຕັ້ງຄ່າຄຸກກີ'),
(7, 'DELETE', 'text', 'index', 1, 'ลบ', 'delete', 'ລຶບ'),
(8, 'DISABLE', 'text', 'index', 1, 'ปิดใช้งาน', 'Disable', 'ປິດໃຊ້ການ'),
(9, 'ENABLE', 'text', 'index', 1, 'เปิดใช้งาน', 'Enable', 'ເປີດໃຊ້ການ'),
(10, 'INVALID_DATA', 'text', 'index', 1, 'ข้อมูล XXX ไม่ถูกต้อง', 'XXX Invalid data', 'ຂໍ້ມູນ XXX ບໍ່ຖືກຕ້ອງ'),
(11, 'ITEM', 'text', 'index', 1, 'รายการ', 'item', 'ລາຍການ'),
(12, 'ITEMS', 'text', 'index', 1, 'รายการ', 'items', 'ລາຍການ'),
(13, 'PLEASE_BROWSE_FILE', 'text', 'index', 1, 'กรุณาเลือกไฟล์', 'Please browse file', 'ກະລຸນາເລືອກແຟ້ມຂໍ້ມູນ'),
(14, 'PLEASE_FILL_IN', 'text', 'index', 1, 'กรุณากรอก', 'Please fill in', 'ກະລຸນາພີ່ມ'),
(15, 'PLEASE_SAVE_BEFORE_CONTINUING', 'text', 'index', 1, 'กรุณาบันทึก ก่อนดำเนินการต่อ', 'Please save before continuing', 'ກະລຸນາບັນທຶກກ່ອນດຳເນີນການຕໍ່'),
(16, 'PLEASE_SELECT', 'text', 'index', 1, 'กรุณาเลือก', 'Please select', 'ກະລຸນາເລືອກ'),
(17, 'PLEASE_SELECT_AT_LEAST_ONE_ITEM', 'text', 'index', 1, 'กรุณาเลือก XXX อย่างน้อย 1 รายการ', 'Please select XXX at least one item', 'ກະລຸນາເລືອກ XXX ຢ່າງໜ້ອຍໜຶ່ງລາຍການ'),
(18, 'SELECT_ALL', 'text', 'index', 1, 'เลือกทั้งหมด', 'select all', 'ເລືອກທັງໝົດ'),
(19, 'SELECT_NONE', 'text', 'index', 1, 'ไม่เลือกรายการใดเลย', 'select none', 'ບໍ່ເລືອກລາຍການໃດເລີຍ'),
(20, 'SORRY_XXX_NOT_FOUND', 'text', 'index', 1, 'ขออภัย ไม่พบ XXX ที่ต้องการ', 'Sorry XXX not found', 'ຂໍອະໄພບໍ່ພົບ XXX ທີ່ຕ້ອງການ'),
(21, 'SUCCESSFULLY_COPIED_TO_CLIPBOARD', 'text', 'index', 1, 'สำเนาไปยังคลิปบอร์ดเรียบร้อย', 'Successfully copied to clipboard', 'ສຳເນົາໄປຍັງຄິບບອດຮຽບຮ້ອຍ'),
(22, 'SUCCESSFULLY_UPLOADED_XXX_FILES', 'text', 'index', 1, 'อัปโหลดเรียบร้อย XXX ไฟล์', 'Successfully uploaded XXX files', 'ອັບໂຫຼດຮຽບຮ້ອຍ XXX ແຟ້ມ'),
(23, 'THE_TYPE_OF_FILE_IS_INVALID', 'text', 'index', 1, 'ชนิดของไฟล์ไม่ถูกต้อง', 'The type of file is invalid', 'ຊະນິດຂອງແຟ້ມບໍ່ຖືກຕ້ອງ'),
(24, 'UNCHECK', 'text', 'index', 1, 'ไม่เลือก', 'uncheck', 'ບໍ່ເລືອກ'),
(25, 'YOU_WANT_TO_XXX', 'text', 'index', 1, 'คุณต้องการ XXX ?', 'You want to XXX ?', 'ທ່ານບໍ່ຕ້ອງການ XXX ?'),
(26, 'YOU_WANT_TO_XXX_THE_SELECTED_ITEMS', 'text', 'index', 1, 'คุณต้องการ XXX รายการที่เลือก ?', 'You want to XXX the selected items ?', 'ທ່ານຕ້ອງການ XXX ລາຍການທີ່ເລືອກ?'),
(27, 'BOOLEANS', 'array', 'index', 0, 'a:2:{i:0;s:27:\"ปิดใช้งาน\";i:1;s:30:\"เปิดใช้งาน\";}', 'a:2:{i:0;s:7:\"Disable\";i:1;s:7:\"Enabled\";}', 'a:2:{i:0;s:27:\"ປິດໃຊ້ວຽກ\";i:1;s:30:\"ເປີດໃຊ້ວຽກ\";}'),
(28, 'DATE_FORMAT', 'text', 'index', 0, 'd M Y เวลา H:i น.', 'd M Y, H:i', 'd M Y ເວລາ H:i'),
(29, 'DATE_LONG', 'array', 'index', 0, 'a:7:{i:0;s:21:\"อาทิตย์\";i:1;s:18:\"จันทร์\";i:2;s:18:\"อังคาร\";i:3;s:9:\"พุธ\";i:4;s:24:\"พฤหัสบดี\";i:5;s:15:\"ศุกร์\";i:6;s:15:\"เสาร์\";}', 'a:7:{i:0;s:6:\"Sunday\";i:1;s:6:\"Monday\";i:2;s:7:\"Tuesday\";i:3;s:9:\"Wednesday\";i:4;s:8:\"Thursday\";i:5;s:6:\"Friday\";i:6;s:8:\"Saturday\";}', 'a:7:{i:0;s:15:\"ອາທິດ\";i:1;s:9:\"ຈັນ\";i:2;s:18:\"ອັງຄານ\";i:3;s:9:\"ພຸດ\";i:4;s:15:\"ພະຫັດ\";i:5;s:9:\"ສຸກ\";i:6;s:12:\"ເສົາ\";}'),
(30, 'DATE_SHORT', 'array', 'index', 0, 'a:7:{i:0;s:7:\"อา.\";i:1;s:4:\"จ.\";i:2;s:4:\"อ.\";i:3;s:4:\"พ.\";i:4;s:7:\"พฤ.\";i:5;s:4:\"ศ.\";i:6;s:4:\"ส.\";}', 'a:7:{i:0;s:2:\"Su\";i:1;s:2:\"Mo\";i:2;s:2:\"Tu\";i:3;s:2:\"We\";i:4;s:2:\"Th\";i:5;s:2:\"Fr\";i:6;s:2:\"Sa\";}', 'a:7:{i:0;s:4:\"ທ.\";i:1;s:4:\"ຈ.\";i:2;s:4:\"ຄ.\";i:3;s:4:\"ພ.\";i:4;s:4:\"ພ.\";i:5;s:4:\"ສ.\";i:6;s:4:\"ສ.\";}'),
(31, 'Inventory', 'text', 'index', 0, 'คลังสินค้า', 'Inventory', 'ຄັງສິນຄ້າ'),
(32, 'INVENTORY_CATEGORIES', 'array', 'index', 0, 'a:3:{s:11:\"category_id\";s:24:\"หมวดหมู่\";s:7:\"type_id\";s:18:\"ประเภท\";s:8:\"model_id\";s:18:\"ยี่ห้อ\";}', 'a:3:{s:11:\"category_id\";s:8:\"Category\";s:7:\"type_id\";s:4:\"Type\";s:8:\"model_id\";s:5:\"Model\";}', 'a:3:{s:11:\"category_id\";s:24:\"ຫມວດຫມູ່\";s:7:\"type_id\";s:15:\"ປະເພດ\";s:8:\"model_id\";s:18:\"ຍີ່ຫໍ້\";}'),
(33, 'INVENTORY_METAS', 'array', 'index', 0, 'a:1:{s:6:\"detail\";s:30:\"รายละเอียด\";}', 'a:1:{s:6:\"detail\";s:6:\"Detail\";}', 'a:1:{s:6:\"detail\";s:27:\"ລາຍະລະອຽດ\";}'),
(34, 'INVENTORY_STATUS', 'array', 'index', 0, 'a:2:{i:0;s:42:\"เลิกใช้งานแล้ว\";i:1;s:30:\"ใช้งานอยู่\";}', 'a:2:{i:0;s:8:\"Inactive\";i:1;s:6:\"Active\";}', 'a:2:{i:0;s:36:\"ປິດການໃຊ້ວຽກ\";i:1;s:30:\"ຍັງເຮັດວຽກ\";}'),
(35, 'LINE_FOLLOW_MESSAGE', 'text', 'index', 0, 'สวัสดี คุณ :name นี่คือบัญชีทางการของ :title เราจะส่งข่าวสารถึงคุณผ่านช่องทางนี้', 'Hello, :name This is :title official account. We will send you news via this channel.', 'ສະບາຍດີ, :name ນີ້ແມ່ນບັນຊີທາງການຂອງ :title ພວກເຮົາຈະສົ່ງຂ່າວໃຫ້ທ່ານຜ່ານຊ່ອງທາງນີ້.'),
(36, 'LINE_REPLY_MESSAGE', 'text', 'index', 0, 'ขออภัยไม่สามารถตอบกลับข้อความนี้ได้', 'Sorry, can&#039;t reply to this message.', 'ຂໍອະໄພ, ບໍ່ສາມາດຕອບກັບຂໍ້ຄວາມນີ້ໄດ້.'),
(37, 'LOGIN_FIELDS', 'array', 'index', 0, 'a:4:{s:8:\"username\";s:30:\"ชื่อผู้ใช้\";s:5:\"email\";s:15:\"อีเมล\";s:5:\"phone\";s:39:\"เบอร์โทรศัพท์\";s:7:\"id_card\";s:30:\"เลขประชาชน\";}', 'a:4:{s:8:\"username\";s:8:\"Username\";s:5:\"email\";s:5:\"Email\";s:5:\"phone\";s:5:\"Phone\";s:7:\"id_card\";s:18:\"Identification No.\";}', 'a:4:{s:8:\"username\";s:27:\"ຊື່ຜູ້ໃຊ້\";s:5:\"email\";s:15:\"ອີເມວ\";s:5:\"phone\";s:30:\"ເບີໂທລະສັບ\";s:7:\"id_card\";s:39:\"ເລກບັດປະຈຳຕົວ\";}'),
(38, 'LOGIN_TYPIES', 'array', 'index', 0, 'a:2:{i:0;s:45:\"ไม่ต้องเข้าระบบ\";i:1;s:51:\"เมื่อเข้าระบบแล้ว\";}', 'a:2:{i:0;s:17:\"No need to log in\";i:1;s:16:\"After logging in\";}', 'a:2:{i:0;s:66:\"ສາມາດອ່ານເຂົ້າສູ່ລະບົບ\";i:1;s:99:\"ສາມາດອ່ານເຂົ້າສູ່ລະບົບຮຽບຮ້ອຍແລ້ວ\";}'),
(39, 'MAIL_PROGRAMS', 'array', 'index', 0, 'a:3:{i:0;s:43:\"ส่งจดหมายด้วย PHP\";i:1;s:72:\"ส่งจดหมายด้วย PHPMailer+SMTP (แนะนำ)\";i:2;s:58:\"ส่งจดหมายด้วย PHPMailer+PHP Mail\";}', 'a:3:{i:0;s:13:\"Send with PHP\";i:1;s:38:\"Send with PHPMailer+SMTP (recommended)\";i:2;s:28:\"Send with PHPMailer+PHP Mail\";}', 'a:3:{i:0;s:46:\"ສົ່ງຈົດໝາຍດ້ວຍ PHP\";i:1;s:75:\"ສົ່ງຈົດໝາຍດ້ວຍ PHPMailer+SMTP (ແນະນຳ)\";i:2;s:61:\"ສົ່ງຈົດໝາຍດ້ວຍ PHPMailer+PHP Mail\";}'),
(40, 'MONTH_LONG', 'array', 'index', 0, 'a:12:{i:1;s:18:\"มกราคม\";i:2;s:30:\"กุมภาพันธ์\";i:3;s:18:\"มีนาคม\";i:4;s:18:\"เมษายน\";i:5;s:21:\"พฤษภาคม\";i:6;s:24:\"มิถุนายน\";i:7;s:21:\"กรกฎาคม\";i:8;s:21:\"สิงหาคม\";i:9;s:21:\"กันยายน\";i:10;s:18:\"ตุลาคม\";i:11;s:27:\"พฤศจิกายน\";i:12;s:21:\"ธันวาคม\";}', 'a:12:{i:1;s:7:\"January\";i:2;s:8:\"February\";i:3;s:5:\"March\";i:4;s:5:\"April\";i:5;s:3:\"May\";i:6;s:4:\"June\";i:7;s:4:\"July\";i:8;s:6:\"August\";i:9;s:9:\"September\";i:10;s:7:\"October\";i:11;s:8:\"November\";i:12;s:8:\"December\";}', 'a:12:{i:1;s:18:\"ມັງກອນ\";i:2;s:15:\"ກຸມພາ\";i:3;s:12:\"ມີນາ\";i:4;s:12:\"ເມສາ\";i:5;s:21:\"ພຶດສະພາ\";i:6;s:18:\"ມິຖຸນາ\";i:7;s:21:\"ກໍລະກົດ\";i:8;s:15:\"ສິງຫາ\";i:9;s:15:\"ກັນຍາ\";i:10;s:12:\"ຕຸລາ\";i:11;s:15:\"ພະຈິກ\";i:12;s:15:\"ທັນວາ\";}'),
(41, 'MONTH_SHORT', 'array', 'index', 0, 'a:12:{i:1;s:8:\"ม.ค.\";i:2;s:8:\"ก.พ.\";i:3;s:11:\"มี.ค.\";i:4;s:11:\"เม.ย.\";i:5;s:8:\"พ.ค.\";i:6;s:11:\"มิ.ย.\";i:7;s:8:\"ก.ค.\";i:8;s:8:\"ส.ค.\";i:9;s:8:\"ก.ย.\";i:10;s:8:\"ต.ค.\";i:11;s:8:\"พ.ย.\";i:12;s:8:\"ธ.ค.\";}', 'a:12:{i:1;s:3:\"Jan\";i:2;s:3:\"Feb\";i:3;s:3:\"Mar\";i:4;s:3:\"Apr\";i:5;s:3:\"May\";i:6;s:3:\"Jun\";i:7;s:3:\"Jul\";i:8;s:3:\"Aug\";i:9;s:3:\"Sep\";i:10;s:3:\"Oct\";i:11;s:3:\"Nov\";i:12;s:3:\"Dec\";}', 'a:12:{i:1;s:8:\"ມ.ກ.\";i:2;s:8:\"ກ.ພ.\";i:3;s:11:\"ມີ.ນ.\";i:4;s:11:\"ເມ.ສ.\";i:5;s:8:\"ພ.ພ.\";i:6;s:11:\"ມິ.ນ.\";i:7;s:8:\"ກ.ກ.\";i:8;s:8:\"ສ.ຫ.\";i:9;s:8:\"ກ.ຍ.\";i:10;s:8:\"ຕ.ລ.\";i:11;s:8:\"ພ.ຈ.\";i:12;s:8:\"ທ.ວ.\";}'),
(42, 'Name', 'text', 'index', 0, 'ชื่อ นามสกุล', 'Name Surname', 'ຊື່ ນາມສະກຸນ'),
(43, 'PERMISSIONS', 'array', 'index', 0, 'a:2:{s:10:\"can_config\";s:60:\"สามารถตั้งค่าระบบได้\";s:22:\"can_view_usage_history\";s:93:\"สามารถดูประวัติการใช้งานระบบได้\";}', 'a:2:{s:10:\"can_config\";s:24:\"Can configure the system\";s:22:\"can_view_usage_history\";s:33:\"Able to view system usage history\";}', 'a:2:{s:10:\"can_config\";s:60:\"ສາມາດຕັ້ງຄ່າລະບົບໄດ້\";s:22:\"can_view_usage_history\";s:90:\"ສາມາດເບິ່ງປະຫວັດການນໍາໃຊ້ລະບົບ\";}'),
(44, 'PUBLISHEDS', 'array', 'index', 0, 'a:2:{i:0;s:45:\"ระงับการเผยแพร่\";i:1;s:21:\"เผยแพร่\";}', 'a:2:{i:0;s:11:\"Unpublished\";i:1;s:9:\"Published\";}', 'a:2:{i:0;s:45:\"ລະງັບການເຜີຍແຜ່\";i:1;s:21:\"ເຜີຍແຜ່\";}'),
(45, 'SEXES', 'array', 'index', 0, 'a:3:{s:1:\"u\";s:21:\"ไม่ระบุ\";s:1:\"f\";s:12:\"หญิง\";s:1:\"m\";s:9:\"ชาย\";}', 'a:3:{s:1:\"u\";s:13:\"Not specified\";s:1:\"f\";s:6:\"Female\";s:1:\"m\";s:4:\"Male\";}', 'a:3:{s:1:\"u\";s:30:\"ບໍ່ໄດ້ລະບຸ\";s:1:\"f\";s:9:\"ຍິງ\";s:1:\"m\";s:9:\"ຊາຍ\";}'),
(46, 'SMTPSECURIES', 'array', 'index', 0, 'a:2:{s:0:\"\";s:57:\"การเชื่อมต่อแบบปกติ\";s:3:\"ssl\";s:72:\"การเชื่อมต่อที่ปลอดภัย (SSL)\";}', 'a:2:{s:0:\"\";s:10:\"Clear Text\";s:3:\"ssl\";s:38:\"Server using a secure connection (SSL)\";}', 'a:2:{s:0:\"\";s:66:\"ການເຊື່ອມຕໍ່ແບບປົກກະຕິ\";s:3:\"ssl\";s:66:\"ການເຊື່ອມຕໍ່ທີ່ປອດໄຟ (SSL)\";}'),
(47, 'THEME_WIDTH', 'array', 'index', 0, 'a:3:{s:7:\"default\";s:33:\"ค่าเริ่มต้น\";s:4:\"wide\";s:15:\"กว้าง\";s:9:\"fullwidth\";s:30:\"กว้างพิเศษ\";}', 'a:3:{s:7:\"default\";s:7:\"Default\";s:4:\"wide\";s:4:\"Wide\";s:9:\"fullwidth\";s:10:\"Extra wide\";}', 'a:3:{s:7:\"default\";s:36:\"ຄ່າເລີ່ມຕົ້ນ\";s:4:\"wide\";s:15:\"ກວ້າງ\";s:9:\"fullwidth\";s:30:\"ກວ້າງພິເສດ\";}'),
(48, 'TIME_FORMAT', 'text', 'index', 0, 'H:i น.', 'H:i', 'H:i'),
(49, 'YEAR_OFFSET', 'int', 'index', 0, '543', '0', '0'),
(50, ':name for new members Used when members need to specify', 'text', 'index', 0, ':name เริ่มต้นสำหรับสมาชิกใหม่ ใช้ในกรณีที่สมาชิกจำเป็นต้องระบุ', NULL, ':name ສໍາລັບສະມາຊິກໃຫມ່ ໃຊ້ໃນເວລາທີ່ສະມາຊິກຕ້ອງການກໍານົດ'),
(51, '0.0.0.0 mean all IP addresses', 'text', 'index', 0, '0.0.0.0 หมายถึงอนุญาตทั้งหมด', NULL, '0.0.0.0 ຫມາຍຄວາມວ່າອະນຸຍາດໃຫ້ທັງຫມົດ'),
(52, 'Accept all', 'text', 'index', 0, 'ยอมรับทั้งหมด', NULL, 'ຍອມຮັບທັງຫມົດ'),
(53, 'Accept this agreement', 'text', 'index', 0, 'ยอมรับข้อตกลง', NULL, 'ຍອມຮັບຂໍ້ຕົກລົງ'),
(54, 'Add', 'text', 'index', 0, 'เพิ่ม', NULL, 'ເພີ່ມ'),
(55, 'Add friend', 'text', 'index', 0, 'เพิ่มเพื่อน', NULL, 'ເພີ່ມເພື່ອນ'),
(56, 'Address', 'text', 'index', 0, 'ที่อยู่', NULL, 'ທີ່ຢູ່'),
(57, 'Address details', 'text', 'index', 0, 'รายละเอียดที่อยู่', NULL, 'ລາຍລະອຽດທີ່ຢູ່'),
(58, 'Administrator status It is of utmost importance to do everything', 'text', 'index', 0, 'สถานะผู้ดูแลระบบ มีความสำคัญสูงสุดสามารถทำได้ทุกอย่าง', NULL, 'ສະຖານະຜູ້ເບິ່ງແຍງລະບົບມີຄວາມສຳຄັນສຸງທີ່ສຸດສາມາດເຮັດໄດ້ທຸກຢ່າງ'),
(59, 'All :count entries, displayed :start to :end, page :page of :total pages', 'text', 'index', 0, 'ทั้งหมด :count รายการ, แสดง :start ถึง :end, หน้าที่ :page จากทั้งหมด :total หน้า', NULL, 'ທັງໝົດ :count ລາຍການ, ສະແດງ :start ເຖິງ :end, ໜ້າທີ່ :page ຈາກທັງໝົດ:total ໜ້າ'),
(60, 'all items', 'text', 'index', 0, 'ทั้งหมด', NULL, 'ທັງໝົດ'),
(61, 'Always enabled', 'text', 'index', 0, 'เปิดใช้งานตลอดเวลา', NULL, 'ເປີດສະເໝີ'),
(62, 'API settings', 'text', 'index', 0, 'ตั้งค่า API', NULL, 'ຕັ້ງຄ່າ API'),
(63, 'Appointment date', 'text', 'index', 0, 'วันนัดรับ', NULL, 'ວັນນັດຫມາຍ'),
(64, 'Appraiser', 'text', 'index', 0, 'ประเมินราคา', NULL, 'ຕີລາຄາ'),
(65, 'Authentication require', 'text', 'index', 0, 'การตรวจสอบความถูกต้อง', NULL, 'ການກວດກາຄວາມຖືກຕ້ອງ'),
(66, 'Avatar', 'text', 'index', 0, 'รูปสมาชิก', NULL, 'ຮູບແທນຕົວ'),
(67, 'Background color', 'text', 'index', 0, 'สีพื้นหลัง', NULL, 'ສີພື້ນຫລັງ'),
(68, 'Background image', 'text', 'index', 0, 'รูปภาพพื้นหลัง', NULL, 'ພາບພື້ນຫລັງ'),
(69, 'Browse file', 'text', 'index', 0, 'เลือกไฟล์', NULL, 'ເລືອກໄຟລ໌'),
(70, 'Browse image uploaded, type :type', 'text', 'index', 0, 'เลือกรูปภาพอัปโหลด ชนิด :type', NULL, 'ເລືອກຮູບພາບອັບໂຫຼດຊະນິດ :type'),
(71, 'Can login', 'text', 'index', 0, 'สามารถเข้าระบบได้', NULL, 'ສາມາດເຂົ້າສູ່ລະບົບ'),
(72, 'Can manage repair', 'text', 'index', 0, 'สามารถจัดการเครื่องซ่อมได้', NULL, 'ສາມາດຈັດການເຄື່ອງຊ່ອມໄດ້'),
(73, 'Can manage the', 'text', 'index', 0, 'สามารถจัดการ', NULL, 'ສາມາດຈັດການ'),
(74, 'Can manage the inventory', 'text', 'index', 0, 'สามารถจัดการคลังสินค้าได้', NULL, 'ສາມາດຈັດການຄັງສິນຄ້າໄດ້'),
(75, 'Can not be performed this request. Because they do not find the information you need or you are not allowed', 'text', 'index', 0, 'ไม่สามารถดำเนินการตามที่ร้องขอได้ เนื่องจากไม่พบข้อมูลที่ต้องการ หรือ คุณไม่มีสิทธิ์', NULL, 'ບໍ່ສາມາດດຳເນີນການຕາມທີ່ຮ້ອງຂໍໄດ້ເນື່ອງຈາກບໍ່ພົບຂໍ້ມູນທີ່ຕ້ອງການ ຫຼື ທ່ານບໍ່ມີສິດ'),
(76, 'Can&#039;t login', 'text', 'index', 0, 'ไม่สามารถเข้าระบบได้', NULL, 'ບໍ່ສາມາດເຂົ້າສູ່ລະບົບໄດ້'),
(77, 'Change language', 'text', 'index', 0, 'สลับภาษา', NULL, 'ປ່ຽນພາສາ'),
(78, 'Click to edit', 'text', 'index', 0, 'คลิกเพื่อแก้ไข', NULL, 'ກົດເພື່ອແກ້ໄຂ'),
(79, 'Comment', 'text', 'index', 0, 'หมายเหตุ', NULL, 'ຫມາຍ​ເຫດ​'),
(80, 'Confirm password', 'text', 'index', 0, 'ยืนยันรหัสผ่าน', NULL, 'ຢືນຢັນລະຫັດຜ່ານ'),
(81, 'Congratulations, your email address has been verified. please login', 'text', 'index', 0, 'ยินดีด้วย ที่อยู่อีเมลของคุณได้รับการยืนยันเรียบร้อยแล้ว กรุณาเข้าสู่ระบบ', NULL, 'ຂໍສະແດງຄວາມຍິນດີ, ທີ່ຢູ່ອີເມວຂອງທ່ານໄດ້ຮັບການຢັ້ງຢືນແລ້ວ. ກະລຸນາເຂົ້າສູ່ລະບົບ'),
(82, 'Cookie Policy', 'text', 'index', 0, 'นโยบายคุกกี้', NULL, 'ນະໂຍບາຍຄຸກກີ'),
(83, 'COOKIE_NECESSARY_DETAILS', 'text', 'index', 0, 'คุกกี้พื้นฐาน จำเป็นต่อการใช้งานเว็บไซต์ ใช้เพื่อการรักษาความปลอดภัยและให้เว็บไซต์สามารถทำงานได้อย่างถูกต้อง', NULL, 'ຄຸກກີພື້ນຖານ ມີຄວາມຈໍາເປັນໃນການນໍາໃຊ້ເວັບໄຊທ໌ ມັນຖືກນໍາໃຊ້ເພື່ອຈຸດປະສົງຄວາມປອດໄພແລະເພື່ອໃຫ້ເວັບໄຊທ໌ເຮັດວຽກຢ່າງຖືກຕ້ອງ.'),
(84, 'COOKIE_POLICY_DETAILS', 'text', 'index', 0, 'เราใช้คุกกี้ (Cookies) หรือเทคโนโลยีที่คล้ายคลึงกันเท่าที่จำเป็น เพื่อใช้ในการเข้าถึงสินค้าหรือบริการ และติดตามการใช้งานของคุณเท่านั้น หากคุณไม่ต้องการให้มีคุกกี้ไว้ในคอมพิวเตอร์ของคุณ คุณสามารถตั้งค่าบราวเซอร์เพื่อปฏิเสธการจัดเก็บคุกกี้ก่อนที่จะใช้งานเว็บไซต์ หรือใช้โหมดไม่ระบุตัวตนเพื่อเข้าใช้งานเว็บไซต์ก็ได้', NULL, 'ພວກເຮົາໃຊ້ຄຸກກີ (Cookies) ຫຼືເຕັກໂນໂລຢີທີ່ຄ້າຍຄືກັນໃນຂອບເຂດທີ່ຈໍາເປັນ. ສໍາລັບການນໍາໃຊ້ໃນການເຂົ້າເຖິງສິນຄ້າຫຼືການບໍລິການ ແລະພຽງແຕ່ຕິດຕາມການນໍາໃຊ້ຂອງທ່ານ ຖ້າ​ຫາກ​ວ່າ​ທ່ານ​ບໍ່​ຕ້ອງ​ການ cookies ໃນ​ຄອມ​ພິວ​ເຕີ​ຂອງ​ທ່ານ​ ທ່ານສາມາດຕັ້ງຕົວທ່ອງເວັບຂອງທ່ານເພື່ອປະຕິເສດການເກັບຮັກສາ cookies. ກ່ອນທີ່ຈະນໍາໃຊ້ເວັບໄຊທ໌ ທ່ານຍັງສາມາດໃຊ້ໂໝດບໍ່ເປີດເຜີຍຕົວຕົນເພື່ອເຂົ້າຫາເວັບໄຊທ໌ໄດ້.'),
(85, 'Cost', 'text', 'index', 0, 'ค่าใช้จ่าย', NULL, 'ຄ່າໃຊ້ຈ່າຍ'),
(86, 'Country', 'text', 'index', 0, 'ประเทศ', NULL, 'ປະເທດ'),
(87, 'Create', 'text', 'index', 0, 'สร้าง', NULL, 'ສ້າງ'),
(88, 'Create new account', 'text', 'index', 0, 'สร้างบัญชีใหม่', NULL, 'ສ້າງບັນຊີໃໝ່'),
(89, 'Created', 'text', 'index', 0, 'สร้างเมื่อ', NULL, 'ສ້າງເມື່ອ'),
(90, 'Customer', 'text', 'index', 0, 'ลูกค้า', NULL, 'ລູກຄ້າ'),
(91, 'Customer Name', 'text', 'index', 0, 'ชื่อลูกค้า', NULL, 'ຊື່ລູກຄ້າ'),
(92, 'Dark mode', 'text', 'index', 0, 'โหมดมืด', NULL, 'ໂໝດມືດ'),
(93, 'Data controller', 'text', 'index', 0, 'ผู้ควบคุม/ใช้ ข้อมูล', NULL, 'ຜູ້​ຄວບ​ຄຸມຂໍ້ມູນ'),
(94, 'Date', 'text', 'index', 0, 'วันที่', NULL, 'ວັນທີ'),
(95, 'Delete', 'text', 'index', 0, 'ลบ', NULL, 'ລືບ'),
(96, 'Demo Mode', 'text', 'index', 0, 'โหมดตัวอย่าง', NULL, 'ຕົວຢ່າງ'),
(97, 'Description', 'text', 'index', 0, 'คำอธิบาย', NULL, 'ຄຳອະທິບາຍ'),
(98, 'Detail', 'text', 'index', 0, 'รายละเอียด', NULL, 'ລາຍະລະອຽດ'),
(99, 'Details of', 'text', 'index', 0, 'รายละเอียดของ', NULL, 'ລາຍລະອຽດຂອງ'),
(100, 'Drag and drop to reorder', 'text', 'index', 0, 'ลากและวางเพื่อจัดลำดับใหม่', NULL, 'ລາກແລ້ວວາງລົງເພື່ອຈັດຮຽງໃໝ່'),
(101, 'Edit', 'text', 'index', 0, 'แก้ไข', NULL, 'ແກ້ໄຂ'),
(102, 'Editing your account', 'text', 'index', 0, 'แก้ไขข้อมูลส่วนตัว', NULL, 'ແກ້ໄຂຂໍ້ມູນສ່ວນຕົວສະມາຊິກ'),
(103, 'Email', 'text', 'index', 0, 'อีเมล', NULL, 'ອີເມວ'),
(104, 'Email address used for login or request a new password', 'text', 'index', 0, 'ที่อยู่อีเมล ใช้สำหรับการเข้าระบบหรือการขอรหัสผ่านใหม่', NULL, 'ທີ່ຢູ່ອີເມວໃຊ້ສຳລັບການເຂົ້າລະບົບຫຼືການຂໍລະຫັດໃໝ່'),
(105, 'Email address verification', 'text', 'index', 0, 'ยืนยันที่อยู่อีเมล', NULL, 'ຢືນຢັນທີ່ຢູ່ອີເມວ'),
(106, 'Email addresses for sender and do not reply such as no-reply@domain.tld', 'text', 'index', 0, 'ทีอยู่อีเมลใช้เป็นผู้ส่งจดหมาย สำหรับจดหมายที่ไม่ต้องการตอบกลับ เช่น no-reply@domain.tld', NULL, 'ທີ່ຢູ່ອີເມວໃຊ້ເປັນຜູ້ສົ່ງຈົດໝາຍ ສຳລັບຈົດໝາຍທີ່ບໍ່ຕ້ອງການຕອບກັບເຊັ່ນ no-reply@domain.tld'),
(107, 'Email encoding', 'text', 'index', 0, 'รหัสภาษาของจดหมาย', NULL, 'ລະຫັດພາສາຂອງຈົດໝາຍ'),
(108, 'Email settings', 'text', 'index', 0, 'ตั้งค่าอีเมล', NULL, 'ຕັ້ງຄ່າອີເມວ'),
(109, 'Email was not verified', 'text', 'index', 0, 'ยังไม่ได้ยืนยันอีเมล', NULL, 'ອີເມວບໍ່ໄດ້ຖືກຢືນຢັນ'),
(110, 'Enable SSL encryption for sending email', 'text', 'index', 0, 'เปิดใช้งานการเข้ารหัส SSL สำหรับการส่งอีเมล', NULL, 'ເປີດໃຊ້ການເຂົ້າລະຫັດ SSL ສຳລັບການສົ່ງອີເມວ'),
(111, 'English lowercase letters and numbers, not less than 6 digits', 'text', 'index', 0, 'ภาษาอังกฤษตัวพิมพ์เล็กและตัวเลข ไม่น้อยกว่า 6 หลัก', NULL, 'ໂຕພິມນ້ອຍພາສາອັງກິດ ແລະຕົວເລກ, ບໍ່ຕໍ່າກວ່າ 6 ຕົວເລກ'),
(112, 'Enter the domain name you want to allow or enter * for all domains. or leave it blank if you want to use it on this domain only', 'text', 'index', 0, 'กรอกชื่อโดเมนที่ต้องการอนุญาต หรือกรอก * สำหรับทุกโดเมน หรือเว้นว่างไว้ถ้าต้องการให้ใช้งานได้บนโดเมนนี้เท่านั้น', NULL, 'ໃສ່ຊື່ໂດເມນທີ່ທ່ານຕ້ອງການທີ່ຈະອະນຸຍາດໃຫ້ຫຼືໃສ່ * ສໍາລັບໂດເມນທັງຫມົດ. ຫຼືປ່ອຍໃຫ້ມັນຫວ່າງຖ້າທ່ານຕ້ອງການໃຊ້ມັນຢູ່ໃນໂດເມນນີ້ເທົ່ານັ້ນ'),
(113, 'Enter the email address registered. A new password will be sent to this email address.', 'text', 'index', 0, 'กรอกที่อยู่อีเมลที่ลงทะเบียนไว้ ระบบจะส่งรหัสผ่านใหม่ไปยังที่อยู่อีเมลนี้', NULL, 'ເພີ່ມທີ່ຢູ່ອີເມວທີ່ລົງທະບຽນໄວ້ ລະບົບຈະສົ່ງລະຫັດຜ່ານໃໝ່ໄປຍັງທີ່ຢູ່ອີເມວນີ້'),
(114, 'Enter the LINE user ID you received when adding friends. Or type userId sent to the official account to request a new user ID. This information is used for receiving private messages from the system via LINE.', 'text', 'index', 0, 'กรอก user ID ของไลน์ที่ได้ตอนเพิ่มเพื่อน หรือพิมพ์คำว่า userId ส่งไปยังบัญชีทางการเพื่อขอ user ID ใหม่ ข้อมูลนี้ใช้สำหรับการรับข้อความส่วนตัวที่มาจากระบบผ่านไลน์', NULL, 'ໃສ່ user ID ຂອງ LINE ທີ່ທ່ານໄດ້ຮັບໃນເວລາເພີ່ມເພື່ອນ. ຫຼືພິມ userId ທີ່ຖືກສົ່ງໄປຫາບັນຊີທາງການເພື່ອຮ້ອງຂໍ user ID ໃຫມ່. ຂໍ້ມູນນີ້ແມ່ນໃຊ້ສໍາລັບການຮັບຂໍ້ຄວາມສ່ວນຕົວຈາກລະບົບຜ່ານ LINE.'),
(115, 'Enter your password again', 'text', 'index', 0, 'กรอกรหัสผ่านของคุณอีกครั้ง', NULL, 'ໃສ່ລະຫັດຜ່ານຂອງທ່ານອີກຄັ້ງ'),
(116, 'entries', 'text', 'index', 0, 'รายการ', NULL, 'ລາຍການ'),
(117, 'Equipment', 'text', 'index', 0, 'พัสดุ', NULL, 'ພັສດຸ'),
(118, 'Expiration date', 'text', 'index', 0, 'วันหมดอายุ', NULL, 'ວັນໝົດອາຍຸ'),
(119, 'Fax', 'text', 'index', 0, 'โทรสาร', NULL, 'ແຟັກ'),
(120, 'File', 'text', 'index', 0, 'ไฟล์', NULL, 'ແຟ້ມ'),
(121, 'Find equipment by', 'text', 'index', 0, 'ค้นหาพัสดุโดย', NULL, 'ຄົ້ນຫາພັສດຸຈາກ'),
(122, 'Footer', 'text', 'index', 0, 'ส่วนท้าย', NULL, 'ສ່ວນທ້າຍ'),
(123, 'for login by LINE account', 'text', 'index', 0, 'สำหรับการเข้าระบบโดยบัญชีไลน์', NULL, 'ສໍາລັບການເຂົ້າສູ່ລະບົບດ້ວຍບັນຊີ LINE'),
(124, 'Forgot', 'text', 'index', 0, 'ลืมรหัสผ่าน', NULL, 'ລືມລະຫັດຜ່ານ'),
(125, 'from', 'text', 'index', 0, 'จาก', NULL, 'ຈາກ'),
(126, 'General', 'text', 'index', 0, 'ทั่วไป', NULL, 'ທົ່ວໄປ'),
(127, 'General site settings', 'text', 'index', 0, 'ตั้งค่าพื้นฐานของเว็บไซต์', NULL, 'ຕັ້ງຄ່າພື້ນຖານຂອງເວັບໄຊ'),
(128, 'Get a repair', 'text', 'index', 0, 'แจ้งซ่อม', NULL, 'ແຈ້ງຊ່ອມ'),
(129, 'Get new password', 'text', 'index', 0, 'ขอรหัสผ่าน', NULL, 'ຂໍລະຫັດຜ່ານ'),
(130, 'go to page', 'text', 'index', 0, 'ไปหน้าที่', NULL, 'ໄປທີ່ໜ້າ'),
(131, 'Header', 'text', 'index', 0, 'ส่วนหัว', NULL, 'ສ່ວນຫົວ'),
(132, 'Home', 'text', 'index', 0, 'หน้าหลัก', NULL, 'ໜ້າຫຼັກ'),
(133, 'How to define user authentication for mail servers. If you enable it, you must configure below correctly.', 'text', 'index', 0, 'กำหนดวิธีการตรวจสอบผู้ใช้สำหรับเมล์เซิร์ฟเวอร์ หากคุณเปิดใช้งานคุณต้องกำหนดค่าต่างๆด้านล่างถูกต้อง', NULL, 'ກຳນົດວິທີການກວດສອບຜູ້ໃຊ້ສຳລັບເມນເຊິບເວີຫາກທ່ານເປີດໃຊ້ການທ່ານຕ້ອງກຳນົດຄ່າຕ່າງໆດ້ານລຸ່ມຖືກຕ້ອງ'),
(134, 'Identification No.', 'text', 'index', 0, 'เลขประชาชน', NULL, 'ເລກບັດປະຈຳຕົວ'),
(135, 'Image', 'text', 'index', 0, 'รูปภาพ', NULL, 'ຮູບພາບ'),
(136, 'Image size is in pixels', 'text', 'index', 0, 'ขนาดของรูปภาพเป็นพิกเซล', NULL, 'ຂະໜາດຂອງຮູບພາບເປັນພິກເຊວ'),
(137, 'Import', 'text', 'index', 0, 'นำเข้า', NULL, 'ນຳເຂົ້າ'),
(138, 'Informer', 'text', 'index', 0, 'ผู้แจ้งซ่อม', NULL, 'ຜູ້ແຈ້ງຊ່ອມ'),
(139, 'Initial repair status', 'text', 'index', 0, 'สถานะซ่อมเริ่มต้น', NULL, 'ສະຖານະຊ່ອມເລີ່ມຕົ້ນ'),
(140, 'Installed modules', 'text', 'index', 0, 'โมดูลที่ติดตั้งแล้ว', NULL, 'ໂມດູນທີ່ຕິດຕັ້ງ'),
(141, 'Invalid :name', 'text', 'index', 0, ':name ไม่ถูกต้อง', NULL, ':name ບໍ່ຖືກຕ້ອງ'),
(142, 'Job No.', 'text', 'index', 0, 'เลขที่ใบแจ้งซ่อม', NULL, 'ໝາຍເລກຮັບ'),
(143, 'Job today', 'text', 'index', 0, 'งานซ่อมวันนี้', NULL, 'ວຽກຊ່ອມວັນນີ້'),
(144, 'Key', 'text', 'index', 0, 'คีย์', NULL, 'ແປ້ນພີມ'),
(145, 'Language', 'text', 'index', 0, 'ภาษา', NULL, 'ພາສາ'),
(146, 'Leave empty for generate auto', 'text', 'index', 0, 'เว้นว่างไว้เพื่อสร้างโดยอัตโนมัติ', NULL, 'ປ່ອຍຫວ່າງໄວ້ເພື່ອສ້າງອັດໂນມັດ'),
(147, 'LINE official account (with @ prefix, e.g. @xxxx)', 'text', 'index', 0, 'บัญชีทางการของไลน์ (มี @ นำหน้า เช่น @xxxx)', NULL, 'ບັນຊີທາງການຂອງ LINE (ມີ @ ຄໍານໍາຫນ້າ, ເຊັ່ນ: @xxxx)'),
(148, 'LINE settings', 'text', 'index', 0, 'ตั้งค่าไลน์', NULL, 'ຕັ້ງ​ຄ່າ LINE'),
(149, 'List of', 'text', 'index', 0, 'รายการ', NULL, 'ລາຍການ'),
(150, 'List of IPs that allow connection 1 line per 1 IP', 'text', 'index', 0, 'รายการไอพีแอดเดรสทั้งหมดที่อนุญาต 1 บรรทัดต่อ 1 ไอพี', NULL, 'ລາຍຊື່ IP ທີ່ອະນຸຍາດໃຫ້ເຊື່ອມຕໍ່ 1 ເສັ້ນຕໍ່ 1 IP'),
(151, 'Local time', 'text', 'index', 0, 'เวลาท้องถิ่น', NULL, 'ເວລາທ້ອງຖິ່ນ'),
(152, 'Login', 'text', 'index', 0, 'เข้าสู่ระบบ', NULL, 'ເຂົ້າສູ່ລະບົບ'),
(153, 'Login as', 'text', 'index', 0, 'เข้าระบบเป็น', NULL, 'ເຂົ້າ​ສູ່​ລະ​ບົບ​ເປັນ'),
(154, 'Login by', 'text', 'index', 0, 'เข้าระบบโดย', NULL, 'ເຂົ້າສູ່ລະບົບໂດຍ'),
(155, 'Login information', 'text', 'index', 0, 'ข้อมูลการเข้าระบบ', NULL, 'ຂໍ້ມູນການເຂົ້າລະບົບ'),
(156, 'Login page', 'text', 'index', 0, 'หน้าเข้าสู่ระบบ', NULL, 'ໜ້າເຂົ້າສູ່ລະບົບ'),
(157, 'Login with an existing account', 'text', 'index', 0, 'เข้าระบบด้วยบัญชีสมาชิกที่มีอยู่แล้ว', NULL, 'ເຂົ້າລະບົບດ້ວຍບັນຊີສະມາຊິກທີ່ມີຢູ່ແລ້ວ'),
(158, 'Logo', 'text', 'index', 0, 'โลโก', NULL, 'ໂລໂກ'),
(159, 'Logout', 'text', 'index', 0, 'ออกจากระบบ', NULL, 'ອອກຈາກລະບົບ'),
(160, 'Logout successful', 'text', 'index', 0, 'ออกจากระบบเรียบร้อย', NULL, 'ອອກຈາກລະບົບຮຽບຮ້ອຍ'),
(161, 'Mail program', 'text', 'index', 0, 'โปรแกรมส่งอีเมล', NULL, 'ໂປຮແກຮມສົ່ງອີເມວ'),
(162, 'Mail server', 'text', 'index', 0, 'เซิร์ฟเวอร์อีเมล', NULL, 'ເຊີບເວີອີເມວ'),
(163, 'Mail server port number (default is 25, for GMail used 465, 587 for DirectAdmin).', 'text', 'index', 0, 'หมายเลขพอร์ตของเมล์เซิร์ฟเวอร์ (ค่าปกติคือ 25, สำหรับ gmail ใช้ 465, 587 สำหรับ DirectAdmin)', NULL, 'ໝາຍເລກພອດຂອງເມວເຊີບເວີ(ຄ່າປົກກະຕິຄື 25, ສຳລັບ gmail ໃຊ້ 465, 587 ສຳລັບ DirectAdmin)'),
(164, 'Mail server settings', 'text', 'index', 0, 'ค่ากำหนดของเมล์เซิร์ฟเวอร์', NULL, 'ຄ່າກຳນົດຂອງເມວເຊີບເວີ'),
(165, 'Manage languages', 'text', 'index', 0, 'จัดการภาษา', NULL, 'ຈັດການພາສາ'),
(166, 'Member list', 'text', 'index', 0, 'รายชื่อสมาชิก', NULL, 'ລາຍຊື່ສະມາຊິກ'),
(167, 'Member status', 'text', 'index', 0, 'สถานะสมาชิก', NULL, 'ສະຖານະສະມາຊິກ'),
(168, 'Message', 'text', 'index', 0, 'ข้อความ', NULL, 'ຂໍ້ຄວາມ'),
(169, 'Message displayed on login page', 'text', 'index', 0, 'ข้อความแสดงในหน้าเข้าสู่ระบบ', NULL, 'ຂໍ້ຄວາມສະແດງຢູ່ໃນຫນ້າເຂົ້າສູ່ລະບົບ'),
(170, 'Module', 'text', 'index', 0, 'โมดูล', NULL, 'ໂມດູນ'),
(171, 'Module settings', 'text', 'index', 0, 'ตั้งค่าโมดูล', NULL, 'ຕັ້ງຄ່າໂມດູນ'),
(172, 'Necessary cookies', 'text', 'index', 0, 'คุกกี้พื้นฐานที่จำเป็น', NULL, 'ຄຸກກີພື້ນຖານທີ່ຈໍາເປັນ'),
(173, 'New members', 'text', 'index', 0, 'สมาชิกใหม่', NULL, 'ສະມາຊິກໃໝ່'),
(174, 'no larger than :size', 'text', 'index', 0, 'ขนาดไม่เกิน :size', NULL, 'ຂະໜາດບໍ່ເກີນ :size'),
(175, 'No need to fill in English text. If the English text matches the Key', 'text', 'index', 0, 'ไม่จำเป็นต้องกรอกข้อความในภาษาอังกฤษ หากข้อความในภาษาอังกฤษตรงกับคีย์', NULL, 'ບໍ່ຈຳເປັນເພີ່ມຂໍ້ຄວາມໃນພາສາອັງກິດຫາກຂໍ້ຄວາມໃນພາສານອັງກົງກັບແປ້ນພີມ'),
(176, 'not a registered user', 'text', 'index', 0, 'ไม่พบสมาชิกนี้ลงทะเบียนไว้', NULL, 'ບໍ່ພົບສະມາຊິກນີ້ລົງທະບຽນໄວ້'),
(177, 'Not specified', 'text', 'index', 0, 'ไม่ระบุ', NULL, 'ບໍ່ໄດ້ກໍານົດ'),
(178, 'Note or additional notes', 'text', 'index', 0, 'คำอธิบายหรือหมายเหตุเพิ่มเติม', NULL, 'ຄໍາອະທິບາຍຫລືຫມາຍເຫດເພີ່ມເຕີມ'),
(179, 'Number such as %04d (%04d means 4 digits, maximum 11 digits)', 'text', 'index', 0, 'เลขที่ เช่น %04d (%04d หมายถึง ตัวเลข 4 หลัก สูงสุด 11 หลัก)', NULL, 'ຕົວເລກເຊັ່ນ %04d (%04d ຫມາຍຄວາມວ່າ 4 ຕົວເລກ, ສູງສຸດ 11 ຕົວເລກ)'),
(180, 'Operator', 'text', 'index', 0, 'ผู้ปฏิบัติงาน', NULL, 'ຜູ້ປະຕິບັດວຽກ'),
(181, 'Other', 'text', 'index', 0, 'อื่นๆ', NULL, 'ອື່ນໆ'),
(182, 'Page details', 'text', 'index', 0, 'รายละเอียดของหน้า', NULL, 'ລາຍລະອຽດຂອງໜ້າ'),
(183, 'Password', 'text', 'index', 0, 'รหัสผ่าน', NULL, 'ລະຫັດຜ່ານ'),
(184, 'Password of the mail server. (To change the fill.)', 'text', 'index', 0, 'รหัสผ่านของเมล์เซิร์ฟเวอร์ (ต้องการเปลี่ยน ให้กรอก)', NULL, 'ລະຫັດຜ່ານຂອງເມວເຊີບເວີ (ຕ້ອງການປ່ຽນ ໃຫ້ເພີ່ມ)'),
(185, 'Passwords must be at least four characters', 'text', 'index', 0, 'รหัสผ่านต้องไม่น้อยกว่า 4 ตัวอักษร', NULL, 'ລະຫັດຜ່ານຕ້ອງບໍ່ຕ່ຳກວ່າ 4 ຕົວອັກສອນ'),
(186, 'Permission', 'text', 'index', 0, 'สิทธิ์การใช้งาน', NULL, 'ສິດໃນການໃຊ້ວຽກ'),
(187, 'Phone', 'text', 'index', 0, 'โทรศัพท์', NULL, 'ເບີໂທລະສັບ'),
(188, 'Please check the new member registration.', 'text', 'index', 0, 'กรุณาตรวจสอบการลงทะเบียนสมาชิกใหม่', NULL, 'ກະລຸນາກວດສອບການລົງທະບຽນສະມາຊິກໃໝ່.'),
(189, 'Please click the link to verify your email address.', 'text', 'index', 0, 'กรุณาคลิกลิงค์เพื่อยืนยันที่อยู่อีเมล', NULL, 'ກະລຸນາຄລິກທີ່ລິ້ງເພື່ອຢືນຢັນທີ່ຢູ່ອີເມວຂອງທ່ານ'),
(190, 'Please fill in', 'text', 'index', 0, 'กรุณากรอก', NULL, 'ກະລຸນາຕື່ມຂໍ້ມູນໃສ່'),
(191, 'Please fill up this form', 'text', 'index', 0, 'กรุณากรอกแบบฟอร์มนี้', NULL, 'ກະລຸນາຕື່ມແບບຟອມນີ້'),
(192, 'Please login', 'text', 'index', 0, 'กรุณาเข้าระบบ', NULL, 'ກະລຸນາເຂົ້າສູ່ລະບົບ'),
(193, 'Please select', 'text', 'index', 0, 'กรุณาเลือก', NULL, 'ກະລຸນາເລືອກ'),
(194, 'Please select :name at least one item', 'text', 'index', 0, 'กรุณาเลือก :name อย่างน้อย 1 รายการ', NULL, 'ກະລຸນາເລືອກ :name ຢ່າງໜ້ອຍ 1 ລາຍການ'),
(195, 'Please select from the search results', 'text', 'index', 0, 'กรุณาเลือกจากผลการค้นหา', NULL, 'ກະລຸນາເລືອກຈາກຜົນການຄົ້ນຫາ'),
(196, 'Port', 'text', 'index', 0, 'พอร์ต', NULL, 'ພອດ'),
(197, 'Prefix', 'text', 'index', 0, 'คำนำหน้า', NULL, 'ຄຳນຳໜ້າ'),
(198, 'Prefix, if changed The number will be counted again. You can enter %Y%M (year, month).', 'text', 'index', 0, 'คำนำหน้า ถ้ามีการเปลี่ยนแปลง เลขที่จะนับหนึ่งใหม่ สามารถใส่ %Y%M (ปี, เดือน) ได้', NULL, 'ຄໍານໍາຫນ້າ, ຖ້າມີການປ່ຽນແປງ ຕົວເລກທີ່ຈະນັບອີກຄັ້ງສາມາດໃສ່ເປັນ %Y%M (ປີ, ເດືອນ).'),
(199, 'Print', 'text', 'index', 0, 'พิมพ์', NULL, 'ພິມ'),
(200, 'Privacy Policy', 'text', 'index', 0, 'นโยบายความเป็นส่วนตัว', NULL, 'ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ'),
(201, 'Problems and repairs details', 'text', 'index', 0, 'รายละเอียดการซ่อม/ปัญหา', NULL, 'ລາຍະລະອຽດການຊ່ອມ/ບັນຫາ'),
(202, 'Profile', 'text', 'index', 0, 'ข้อมูลส่วนตัว', NULL, 'ຂໍ້ມູນສ່ວນຕົວ'),
(203, 'Province', 'text', 'index', 0, 'จังหวัด', NULL, 'ແຂວງ'),
(204, 'Received date', 'text', 'index', 0, 'วันที่แจ้งซ่อม', NULL, 'ວັນທີ່ແຈ້ງຊ່ອມ'),
(205, 'Register', 'text', 'index', 0, 'สมัครสมาชิก', NULL, 'ສະໝັກສະມາຊິກ'),
(206, 'Register successfully Please log in', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อยแล้วกรุณาเข้าสู่ระบบ', NULL, 'ລົງທະບຽນຢ່າງສຳເລັດຜົນກະລຸນາເຂົ້າສູ່ລະບົບ'),
(207, 'Register successfully, We have sent complete registration information to :email', 'text', 'index', 0, 'ลงทะเบียนสมาชิกใหม่เรียบร้อย เราได้ส่งข้อมูลการลงทะเบียนไปยัง :email', NULL, 'ລົງທະບຽນສຳເລັດແລ້ວ ເຮົາໄດ້ສົ່ງຂໍ້ມູນການລົງທະບຽນໄປທີ່ :email'),
(208, 'Registered successfully Please check your email :email and click the link to verify your email.', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อย กรุณาตรวจสอบอีเมล์ :email และคลิงลิงค์ยืนยันอีเมล', NULL, 'ລົງທະບຽນສົບຜົນສໍາເລັດ ກະ​ລຸ​ນາ​ກວດ​ສອບ​ອີ​ເມວ​ຂອງ​ທ່ານ :email ແລະ​ຄລິກ​ໃສ່​ການ​ເຊື່ອມ​ຕໍ່​ເພື່ອ​ກວດ​ສອບ​ອີ​ເມວ​ຂອງ​ທ່ານ​.'),
(209, 'Remember me', 'text', 'index', 0, 'จำการเข้าระบบ', NULL, 'ຈົດຈຳການເຂົ້າລະບົບ'),
(210, 'Remove', 'text', 'index', 0, 'ลบ', NULL, 'ລຶບ'),
(211, 'Repair', 'text', 'index', 0, 'แจ้งซ่อม', NULL, 'ວຽກຊ່ອມ'),
(212, 'Repair details', 'text', 'index', 0, 'รายละเอียดใบรับซ่อม', NULL, 'ສ້ອມແປງລາຍລະອຽດ'),
(213, 'Repair history', 'text', 'index', 0, 'ติดตามการสั่งซ่อมของฉัน', NULL, 'ຕິດຕາມການສັ່ງຊ່ອມຂອງຂ້ອຍ'),
(214, 'Repair job description', 'text', 'index', 0, 'รายละเอียดการซ่อม', NULL, 'ລາຍະລະອຽດການຊ່ອມ'),
(215, 'Repair jobs', 'text', 'index', 0, 'งานซ่อม', NULL, 'ວຽກຊ່ອມ'),
(216, 'Repair list', 'text', 'index', 0, 'รายการซ่อม', NULL, 'ລາຍະການຊ່ອມ'),
(217, 'Repair note', 'text', 'index', 0, 'หมายเหตุการซ่อม', NULL, 'ຫມາຍເຫດການຊ່ອມ'),
(218, 'Repair process', 'text', 'index', 0, 'สถานะการซ่อมปัจจุบัน', NULL, 'ສະຖານະພາບການສ້ອມແປງໃນປະຈຸບັນ'),
(219, 'Repair status', 'text', 'index', 0, 'สถานะการซ่อม', NULL, 'ສະຖານະການຊ່ອມ'),
(220, 'Repair system', 'text', 'index', 0, 'ระบบแจ้งซ่อม', NULL, 'ລະບົບແຈ້ງຊ່ອມ'),
(221, 'Repairman', 'text', 'index', 0, 'ช่างซ่อม', NULL, 'ຜູ້ຊ່ອມແຊມ'),
(222, 'resized automatically', 'text', 'index', 0, 'ปรับขนาดอัตโนมัติ', NULL, 'ປັບຂະໜາດອັດຕະໂນມັດ'),
(223, 'Save', 'text', 'index', 0, 'บันทึก', NULL, 'ບັນທຶກ'),
(224, 'Saved successfully', 'text', 'index', 0, 'บันทึกเรียบร้อย', NULL, 'ບັນທຶກຮຽບຮ້ອຍ'),
(225, 'scroll to top', 'text', 'index', 0, 'เลื่อนขึ้นด้านบน', NULL, 'ເລື່ອນຂື້ນດ້ານເທິງ'),
(226, 'Search', 'text', 'index', 0, 'ค้นหา', NULL, 'ຄົ້ນຫາ'),
(227, 'Search <strong>:search</strong> found :count entries, displayed :start to :end, page :page of :total pages', 'text', 'index', 0, 'ค้นหา <strong>:search</strong> พบ :count รายการ แสดงรายการที่ :start - :end หน้าที่ :page จากทั้งหมด :total หน้า', NULL, 'ຄົ້ນຫາ <strong>:search</strong> ພົບ :count ລາຍການ ສະແດງລາຍການທີ່:start - :end ໜ້າທີ່:page ຈາກທັງໝົດ :total ໜ້າ'),
(228, 'Send a welcome email to new members', 'text', 'index', 0, 'ส่งข้อความต้อนรับสมาชิกใหม่', NULL, 'ສົ່ງອີເມວຕ້ອນຮັບກັບສະມາຊິກໃຫມ່'),
(229, 'Send login authorization email', 'text', 'index', 0, 'ส่งอีเมลอนุมัติการเข้าระบบ', NULL, 'ສົ່ງອີເມວການອະນຸຍາດເຂົ້າສູ່ລະບົບ'),
(230, 'Send member confirmation email', 'text', 'index', 0, 'ส่งอีเมลยืนยันสมาชิก', NULL, 'ສົ່ງອີເມລ໌ຢືນຢັນສະມາຊິກ'),
(231, 'send message to user When a user adds LINE&#039;s official account as a friend', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ใช้ เมื่อผู้ใช้เพิ่มบัญชีทางการของไลน์เป็นเพื่อน', NULL, 'ສົ່ງຂໍ້ຄວາມຫາຜູ້ໃຊ້ ເມື່ອຜູ້ໃຊ້ເພີ່ມບັນຊີທາງການຂອງ LINE ເປັນໝູ່'),
(232, 'Send notification messages When making a transaction', 'text', 'index', 0, 'ส่งข้อความแจ้งเตือนเมื่อมีการทำรายการ', NULL, 'ສົ່ງຂໍ້ຄວາມແຈ້ງເຕືອນເມື່ອມີການເຮັດທຸລະກຳ'),
(233, 'Serial/Registration No.', 'text', 'index', 0, 'หมายเลขเครื่อง/เลขทะเบียน', NULL, 'ຫມາຍເລກເຄື່ອງ/ເລກທະບຽນ'),
(234, 'Server time', 'text', 'index', 0, 'เวลาเซิร์ฟเวอร์', NULL, 'ເວລາຂອງເຊີບເວີ'),
(235, 'Set the application for send an email', 'text', 'index', 0, 'เลือกโปรแกรมที่ใช้ในการส่งอีเมล', NULL, 'ເລືອກໂປຮແກຮມທີ່ໃຊ້ໃນການສົ່ງອີເມວ'),
(236, 'Setting up the email system', 'text', 'index', 0, 'การตั้งค่าเกี่ยวกับระบบอีเมล', NULL, 'ການຕັ້ງຄ່າກ່ຽວກັບລະບົບອີເມວ'),
(237, 'Settings', 'text', 'index', 0, 'ตั้งค่า', NULL, 'ຕັ້ງຄ່າ'),
(238, 'Settings the conditions for member login', 'text', 'index', 0, 'ตั้งค่าเงื่อนไขในการตรวจสอบการเข้าสู่ระบบ', NULL, 'ຕັ້ງເງື່ອນໄຂການກວດສອບການເຂົ້າລະບົບ'),
(239, 'Settings the timing of the server to match the local time', 'text', 'index', 0, 'ตั้งค่าเขตเวลาของเซิร์ฟเวอร์ ให้ตรงกันกับเวลาท้องถิ่น', NULL, 'ຕັ້ງຄ່າເຂດເວລາຂອງເຊີບເວີ ໃຫ້ກົງກັບເວລາທ້ອງຖີ່ນ'),
(240, 'Sex', 'text', 'index', 0, 'เพศ', NULL, 'ເພດ'),
(241, 'Short description about your website', 'text', 'index', 0, 'ข้อความสั้นๆอธิบายว่าเป็นเว็บไซต์เกี่ยวกับอะไร', NULL, 'ຂໍ້ຄວາມສັ້ນໆ ອະທິບາຍວ່າເປັນເວັບໄຊກ່ຽວກັບຫຍັງ'),
(242, 'Show', 'text', 'index', 0, 'แสดง', NULL, 'ສະແດງ'),
(243, 'Show web title with logo', 'text', 'index', 0, 'แสดงชื่อเว็บและโลโก', NULL, 'ສະແດງຊື່ເວັບແລະໂລໂກ້'),
(244, 'Site Name', 'text', 'index', 0, 'ชื่อของเว็บไซต์', NULL, 'ຊື່ຂອງເວັບໄຊ'),
(245, 'Site settings', 'text', 'index', 0, 'ตั้งค่าเว็บไซต์', NULL, 'ຕັ້ງຄ່າເວັບໄຊ'),
(246, 'size :width*:height pixel', 'text', 'index', 0, 'ขนาด :width*:height พิกเซล', NULL, 'ຂະໜາດ :width*:height ຟິດເຊວล'),
(247, 'Size of', 'text', 'index', 0, 'ขนาดของ', NULL, 'ຂະໜາດຂອງ'),
(248, 'skip to content', 'text', 'index', 0, 'ข้ามไปยังเนื้อหา', NULL, 'ຂ້າມໄປຍັງເນື້ອຫາ'),
(249, 'Sorry', 'text', 'index', 0, 'ขออภัย', NULL, 'ຂໍໂທດ'),
(250, 'Sorry, cannot find a page called Please check the URL or try the call again.', 'text', 'index', 0, 'ขออภัย ไม่พบหน้าที่เรียก โปรดตรวจสอบ URL หรือลองเรียกอีกครั้ง', NULL, 'ຂໍ​ອະ​ໄພ, ບໍ່​ສາ​ມາດ​ຊອກ​ຫາ​ຫນ້າ​ທີ່​ຮ້ອງ​ຂໍ. ກະ​ລຸ​ນາ​ກວດ​ສອບ URL ຫຼື​ພະ​ຍາ​ຍາມ​ດຶງ​ຂໍ້​ມູນ​ອີກ​ເທື່ອ​ຫນຶ່ງ.'),
(251, 'Sorry, Item not found It&#39;s may be deleted', 'text', 'index', 0, 'ขออภัย ไม่พบรายการที่เลือก รายการนี้อาจถูกลบไปแล้ว', NULL, 'ຂໍໂທດ ບໍ່ພົບລາຍການທີ່ເລືອກ ລາຍການນີ້ອາດຖືກລຶບໄປແລ້ວ'),
(252, 'Specify the language code of the email, as utf-8', 'text', 'index', 0, 'ระบุรหัสภาษาของอีเมลที่ส่ง เช่น utf-8', NULL, 'ລະບຸລະຫັດພາສາຂອງອີເມວທີ່ສົ່ງເຊັ່ນ utf-8'),
(253, 'Start a new line with the web name', 'text', 'index', 0, 'ขึ้นบรรทัดใหม่ชื่อเว็บ', NULL, 'ເລີ່ມແຖວໃໝ່ຊື່ເວັບ'),
(254, 'Status', 'text', 'index', 0, 'สถานะ', NULL, 'ສະຖານະ'),
(255, 'Status for general members', 'text', 'index', 0, 'สถานะสำหรับสมาชิกทั่วไป', NULL, 'ສະຖານະສຳລັບສະມາຊິກທົ່ວໄປ'),
(256, 'Stock', 'text', 'index', 0, 'คงเหลือ', NULL, 'ທີ່ຍັງເຫຼືອ'),
(257, 'Style', 'text', 'index', 0, 'รูปแบบ', NULL, 'ຮູບແບບ'),
(258, 'Text color', 'text', 'index', 0, 'สีตัวอักษร', NULL, 'ສີຕົວອັກສອນ'),
(259, 'The e-mail address of the person or entity that has the authority to make decisions about the collection, use or dissemination of personal data.', 'text', 'index', 0, 'ที่อยู่อีเมลของบุคคลหรือนิติบุคคลที่มีอำนาจตัดสินใจเกี่ยวกับการเก็บรวบรวม ใช้ หรือเผยแพร่ข้อมูลส่วนบุคคล', NULL, 'ທີ່ຢູ່ອີເມລ໌ຂອງບຸກຄົນຫຼືຫນ່ວຍງານທີ່ມີອໍານາດໃນການຕັດສິນໃຈກ່ຽວກັບການລວບລວມ, ການນໍາໃຊ້ຫຼືການເຜີຍແຜ່ຂໍ້ມູນສ່ວນບຸກຄົນ.'),
(260, 'The members status of the site', 'text', 'index', 0, 'สถานะของสมาชิกของเว็บไซต์', NULL, 'ສະຖານະຂອງສະມາຂິກຂອງເວັບໄຊ'),
(261, 'The message has been sent to the admin successfully. Please wait a moment for the admin to approve the registration. You can log back in later if approved.', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ดูแลระบบเรียบร้อยแล้ว กรุณารอสักครู่เพื่อให้ผู้ดูแลระบบอนุมัติการลงทะเบียน คุณสามารถกลับมาเข้าระบบได้ในภายหลังหากได้รับการอนุมัติแล้ว', NULL, 'ຂໍ້ຄວາມດັ່ງກ່າວໄດ້ຖືກສົ່ງໄປຫາຜູ້ເບິ່ງແຍງຢ່າງສໍາເລັດຜົນ. ກະລຸນາລໍຖ້າໃຫ້ຜູ້ເບິ່ງແຍງລະບົບອະນຸມັດການລົງທະບຽນ. ທ່ານສາມາດເຂົ້າສູ່ລະບົບຄືນໄດ້ໃນພາຍຫຼັງຖ້າໄດ້ຮັບການອະນຸມັດ.'),
(262, 'The name of the mail server as localhost or smtp.gmail.com (To change the settings of your email is the default. To remove this box entirely.)', 'text', 'index', 0, 'ชื่อของเมล์เซิร์ฟเวอร์ เช่น localhost หรือ smtp.gmail.com (ต้องการเปลี่ยนค่ากำหนดของอีเมลทั้งหมดเป็นค่าเริ่มต้น ให้ลบข้อความในช่องนี้ออกทั้งหมด)', NULL, 'ຊື່ຂອງເມວເຊີບເວີເຊັ່ນ localhost หรือ chitdpt@gmail.com (ຕ້ອງປ່ຽນຄ່າກຳນົດຂອງອີເມວທັງໝົດເປັນຄ່າເລີ່ມຕົ້ນ ໃຫ້ລຶບຂໍ້ຄວາມໃນຊ່ອງນີ້ອອກທັງໝົດ)'),
(263, 'The name of the repairs, eg Computers', 'text', 'index', 0, 'ชื่อของที่นำมาซ่อม เช่น คอมพิวเตอร์', NULL, 'ຊື່ຂອງສິ່ງທີ່ໄດ້ຮັບການສ້ອມແປງ, ເຊັ່ນ: ຄອມພິວເຕີ້'),
(264, 'Theme', 'text', 'index', 0, 'ธีม', NULL, 'ຮູບແບບສີສັນ'),
(265, 'This :name already exist', 'text', 'index', 0, 'มี :name นี้อยู่ก่อนแล้ว', NULL, 'ມີ :name ນີ້ຢູ່ກ່ອນແລ້ວ'),
(266, 'This website uses cookies to provide our services. To find out more about our use of cookies, please see our :privacy.', 'text', 'index', 0, 'เว็บไซต์นี้มีการใช้คุกกี้เพื่อปรับปรุงการให้บริการ หากต้องการข้อมูลเพิ่มเติมเกี่ยวกับการใช้คุกกี้ของเรา โปรดดู :privacy', NULL, 'ເວັບໄຊທ໌ນີ້ໃຊ້ຄຸກກີເພື່ອປັບປຸງການບໍລິການ. ສໍາລັບຂໍ້ມູນເພີ່ມເຕີມກ່ຽວກັບການນໍາໃຊ້ຄຸກກີຂອງພວກເຮົາ, ເບິ່ງ :privacy'),
(267, 'Time zone', 'text', 'index', 0, 'เขตเวลา', NULL, 'ເຂດເວລາ'),
(268, 'times', 'text', 'index', 0, 'ครั้ง', NULL, 'ຄັ້ງ'),
(269, 'to', 'text', 'index', 0, 'ถึง', NULL, 'ເຖິງ'),
(270, 'To change your password, enter your password to match the two inputs', 'text', 'index', 0, 'ถ้าต้องการเปลี่ยนรหัสผ่าน กรุณากรอกรหัสผ่านสองช่องให้ตรงกัน', NULL, 'ຖ້າຕ້ອງການປ່ຽນລະຫັດຜ່ານກະລຸນາເພີ່ມລະຫັດຜ່ານສອງຊ່ອງໃຫ້ກົງກັນ'),
(271, 'Transaction date', 'text', 'index', 0, 'วันที่ทำรายการ', NULL, 'ວັນທີ່ເຮັດລາຍະການ'),
(272, 'Transaction history', 'text', 'index', 0, 'ประวัติการทำรายการ', NULL, 'ປະວັດການເຮັດລາຍະການ'),
(273, 'Type', 'text', 'index', 0, 'ประเภท', NULL, 'ປະເພດ'),
(274, 'Unable to complete the transaction', 'text', 'index', 0, 'ไม่สามารถทำรายการนี้ได้', NULL, 'ບໍ່ສາມາດເຮັດລາຍການນີ້ໄດ້'),
(275, 'Unit', 'text', 'index', 0, 'หน่วย', NULL, 'ໜ່ວຍ'),
(276, 'Update repair status', 'text', 'index', 0, 'ปรับปรุงสถานะการซ่อม', NULL, 'ປັບປຸງສະຖານະການສ້ອມແປງ'),
(277, 'URL must begin with http:// or https://', 'text', 'index', 0, 'URL ต้องขึ้นต้นด้วย http:// หรือ https://', NULL, 'URL ຕ້ອງເລີ່ມຕົ້ນດ້ວຍ http:// ຫຼື https://'),
(278, 'Usage history', 'text', 'index', 0, 'ประวัติการใช้งาน', NULL, 'ປະ​ຫວັດ​ການ​ນໍາ​ໃຊ້​'),
(279, 'Use the theme&#039;s default settings.', 'text', 'index', 0, 'ใช้การตั้งค่าเริ่มต้นของธีม', NULL, 'ໃຊ້ການຕັ້ງຄ່າເລີ່ມຕົ້ນຂອງຮູບແບບສີສັນ.'),
(280, 'User', 'text', 'index', 0, 'สมาชิก', NULL, 'ສະມາຊິກ'),
(281, 'Username', 'text', 'index', 0, 'ชื่อผู้ใช้', NULL, 'ຊື່ຜູ້ໃຊ້'),
(282, 'Username for the mail server. (To change, enter a new value.)', 'text', 'index', 0, 'ชื่อผู้ใช้ของเมล์เซิร์ฟเวอร์ (ต้องการเปลี่ยน ให้กรอก)', NULL, 'ຊື່ຜູ້ໃຊ້ຂອງເມວເຊີບເວີ (ຕ້ອງການປ່ຽນ ໃຫ້ເພີ່ມ)'),
(283, 'Users', 'text', 'index', 0, 'สมาชิก', NULL, 'ສະມາຊິກ'),
(284, 'Version', 'text', 'index', 0, 'รุ่น', NULL, 'ຮຸ່ນ'),
(285, 'Waiting list', 'text', 'index', 0, 'รายการรอตรวจสอบ', NULL, 'ລາຍຊື່ລໍຖ້າ'),
(286, 'Waiting to check from the staff', 'text', 'index', 0, 'รอตรวจสอบจากเจ้าหน้าที่', NULL, 'ລໍຖ້າການກວດສອບຈາກພະນັກງານ'),
(287, 'Website template', 'text', 'index', 0, 'แม่แบบเว็บไซต์', NULL, 'ແມ່ແບບເວັບໄຊທ໌'),
(288, 'Website title', 'text', 'index', 0, 'ชื่อเว็บ', NULL, 'ຊື່ເວັບ'),
(289, 'Welcome', 'text', 'index', 0, 'สวัสดี', NULL, 'ສະບາຍດີ'),
(290, 'Welcome %s, login complete', 'text', 'index', 0, 'สวัสดี คุณ %s ยินดีต้อนรับเข้าสู่ระบบ', NULL, 'ສະບາຍດີທ່ານ %s ຍິນດີຕ້ອນຮັບເຂົ້າສູ່ລະບົບ'),
(291, 'Welcome new members', 'text', 'index', 0, 'ยินดีต้อนรับสมาชิกใหม่', NULL, 'ຍິນດີຕ້ອນຮັບສະມາຊິກໃໝ່'),
(292, 'When enabled Social accounts can be logged in as an administrator. (Some abilities will not be available)', 'text', 'index', 0, 'เมื่อเปิดใช้งาน บัญชีโซเชียลจะสามารถเข้าระบบเป็นผู้ดูแลได้ (ความสามารถบางอย่างจะไม่สามารถใช้งานได้)', NULL, 'ເມື່ອເປີດໃຊ້ງານ ບັນຊີສັງຄົມສາມາດເຂົ້າສູ່ລະບົບເປັນຜູ້ບໍລິຫານ. (ຄວາມສາມາດບາງຢ່າງຈະບໍ່ມີ)'),
(293, 'When enabled, a cookies consent banner will be displayed.', 'text', 'index', 0, 'เมื่อเปิดใช้งานระบบจะแสดงแบนเนอร์ขออนุญาตใช้งานคุ้กกี้', NULL, 'ເມື່ອເປີດໃຊ້ງານແລ້ວ, ປ້າຍໂຄສະນາການຍິນຍອມຂອງ cookies ຈະສະແດງຂຶ້ນ.'),
(294, 'When enabled, Members registered with email must also verify their email address. It is not recommended to use in conjunction with other login methods.', 'text', 'index', 0, 'เมื่อเปิดใช้งาน สมาชิกที่ลงทะเบียนด้วยอีเมลจะต้องยืนยันที่อยู่อีเมลด้วย ไม่แนะนำให้ใช้ร่วมกับการเข้าระบบด้วยช่องทางอื่นๆ', NULL, 'ເມື່ອເປີດໃຊ້ ສະມາຊິກທີ່ລົງທະບຽນກັບອີເມລ໌ຈະຕ້ອງຢືນຢັນທີ່ຢູ່ອີເມວຂອງເຂົາເຈົ້າ. ມັນບໍ່ໄດ້ຖືກແນະນໍາໃຫ້ໃຊ້ຮ່ວມກັບວິທີການເຂົ້າສູ່ລະບົບອື່ນໆ.'),
(295, 'Width', 'text', 'index', 0, 'กว้าง', NULL, 'ກວ້າງ'),
(296, 'With selected', 'text', 'index', 0, 'ทำกับที่เลือก', NULL, 'ເຮັດກັບທີ່ເລືອກ'),
(297, 'You can enter your LINE user ID below on your personal information page. to link your account to this official account', 'text', 'index', 0, 'คุณสามารถกรอก LINE user ID ด้านล่างในหน้าข้อมูลส่วนตัวของคุณ เพื่อผูกบัญชีของคุณเข้ากับบัญชีทางการนี้ได้', NULL, 'ທ່ານສາມາດໃສ່ LINE user ID ຂອງທ່ານຂ້າງລຸ່ມນີ້ຢູ່ໃນຫນ້າຂໍ້ມູນສ່ວນຕົວຂອງທ່ານ. ເພື່ອເຊື່ອມຕໍ່ບັນຊີຂອງທ່ານກັບບັນຊີທາງການນີ້'),
(298, 'You can login at', 'text', 'index', 0, 'คุณสามารถเข้าระบบได้ที่', NULL, 'ທ່ານສາມາດເຂົ້າສູ່ລະບົບໄດ້ທີ່'),
(299, 'You haven&#039;t verified your email address. Please check your email. and click the link in the email', 'text', 'index', 0, 'คุณยังไม่ได้ยืนยันที่อยู่อีเมล กรุณาตรวจสอบอีเมลของคุณ และคลิกลิงค์ในอีเมล', NULL, 'ທ່ານຍັງບໍ່ໄດ້ຢືນຢັນທີ່ຢູ່ອີເມວຂອງທ່ານ. ກະລຸນາກວດເບິ່ງອີເມວຂອງທ່ານ. ແລະຄລິກໃສ່ການເຊື່ອມຕໍ່ໃນອີເມລ໌'),
(300, 'You want to', 'text', 'index', 0, 'คุณต้องการ', NULL, 'ທ່ານຕ້ອງການ'),
(301, 'Your account has been approved.', 'text', 'index', 0, 'บัญชีของท่านได้รับการอนุมัติเรียบร้อยแล้ว', NULL, 'ບັນຊີຂອງທ່ານໄດ້ຮັບການອະນຸມັດແລ້ວ.'),
(302, 'Your account has not been approved, please wait or contact the administrator.', 'text', 'index', 0, 'บัญชีของท่านยังไม่ได้รับการอนุมัติ กรุณารอ หรือติดต่อสอบถามไปยังผู้ดูแล', NULL, 'ບັນຊີຂອງທ່ານບໍ່ໄດ້ຮັບການອະນຸມັດ, ກະລຸນາລໍຖ້າ ຫຼືຕິດຕໍ່ຜູ້ເບິ່ງແຍງລະບົບ.'),
(303, 'Your message was sent successfully', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ที่เกี่ยวข้องเรียบร้อยแล้ว', NULL, 'ສົ່ງຂໍ້ຄວາມໄປຍັງຜູ້ຮັບຮຽບຮ້ອຍແລ້ວ'),
(304, 'Your new password is', 'text', 'index', 0, 'รหัสผ่านใหม่ของคุณคือ', NULL, 'ລະຫັດຜ່ານໃໝ່ຂອງທ່ານຄື'),
(305, 'Your registration information', 'text', 'index', 0, 'ข้อมูลการลงทะเบียนของคุณ', NULL, 'ຂໍ້ມູນການລົງທະບຽນຂອງທ່ານ'),
(306, 'Zipcode', 'text', 'index', 0, 'รหัสไปรษณีย์', NULL, 'ລະຫັດໄປສະນີ');

-- --------------------------------------------------------

--
-- Table structure for table `fix_logs`
--

CREATE TABLE IF NOT EXISTS `fix_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src_id` int(11) NOT NULL,
  `module` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `reason` text DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `topic` text NOT NULL,
  `datas` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `src_id` (`src_id`),
  KEY `module` (`module`),
  KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_logs`
--

INSERT INTO `fix_logs` (`id`, `src_id`, `module`, `action`, `create_date`, `reason`, `member_id`, `topic`, `datas`) VALUES
(1, 1, 'index', 'User', '2025-01-27 12:17:02', NULL, 1, '{LNG_Login} IP ::1', NULL),
(2, 0, 'index', 'Save', '2025-01-27 12:18:16', NULL, 1, '{LNG_The members status of the site}', NULL),
(3, 0, 'inventory', 'Save', '2025-01-27 12:20:00', NULL, 1, 'หมวดหมู่', NULL),
(4, 1, 'index', 'User', '2025-01-27 13:36:10', NULL, 1, '{LNG_Login} IP ::1', NULL),
(5, 0, 'index', 'Save', '2025-01-27 13:46:12', NULL, 1, '{LNG_LINE settings}', NULL),
(6, 0, 'index', 'Save', '2025-01-27 13:48:44', NULL, 1, '{LNG_General site settings}', NULL),
(7, 0, 'repair', 'Save', '2025-01-27 13:49:29', NULL, 1, '{LNG_Add} {LNG_Repair status} ID : 8', NULL),
(8, 0, 'repair', 'Save', '2025-01-27 13:49:40', NULL, 1, 'Name {LNG_Repair status} ID : 8', NULL),
(9, 0, 'repair', 'Save', '2025-01-27 13:49:51', NULL, 1, 'Color {LNG_Repair status} ID : 8', NULL),
(10, 0, 'repair', 'Save', '2025-01-27 13:50:00', NULL, 1, 'Name {LNG_Repair status} ID : 8', NULL),
(11, 0, 'repair', 'Delete', '2025-01-27 13:50:06', NULL, 1, '{LNG_Delete} {LNG_Repair status} ID : 4', NULL),
(12, 0, 'repair', 'Save', '2025-01-27 13:50:19', NULL, 1, '{LNG_Add} {LNG_Repair status} ID : 9', NULL),
(13, 0, 'repair', 'Delete', '2025-01-27 13:50:23', NULL, 1, '{LNG_Delete} {LNG_Repair status} ID : 9', NULL),
(14, 3, 'inventory', 'Status', '2025-01-27 13:50:40', NULL, 1, 'เลิกใช้งานแล้ว ID : 3', NULL),
(15, 3, 'inventory', 'Status', '2025-01-27 13:50:41', NULL, 1, 'ใช้งานอยู่ ID : 3', NULL),
(16, 2, 'inventory', 'Status', '2025-01-27 13:50:41', NULL, 1, 'เลิกใช้งานแล้ว ID : 2', NULL),
(17, 0, 'index', 'Save', '2025-01-27 13:53:40', NULL, 1, '{LNG_LINE settings}', NULL),
(18, 1, 'repair', 'Save', '2025-01-27 13:57:13', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(19, 1, 'index', 'User', '2025-01-27 13:57:49', NULL, 1, '{LNG_Editing your account} ID : 1', NULL),
(20, 1, 'repair', 'Save', '2025-01-27 13:58:07', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(21, 0, 'index', 'Save', '2025-01-27 13:58:54', NULL, 1, '{LNG_General site settings}', NULL),
(22, 0, 'index', 'Save', '2025-01-27 13:59:48', NULL, 1, '{LNG_General site settings}', NULL),
(23, 0, 'index', 'Save', '2025-01-27 13:59:55', NULL, 1, '{LNG_General site settings}', NULL),
(24, 0, 'index', 'Save', '2025-01-27 14:09:31', NULL, 1, '{LNG_Settings} {LNG_Login page}', NULL),
(25, 1, 'index', 'User', '2025-01-27 14:10:33', NULL, 1, '{LNG_Create new account} ID : 3', NULL),
(26, 1, 'index', 'User', '2025-01-27 14:10:57', NULL, 1, '{LNG_Editing your account} ID : 3', NULL),
(27, 1, 'repair', 'Save', '2025-01-27 14:11:15', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(28, 0, 'repair', 'Delete', '2025-01-27 14:11:24', NULL, 1, '{LNG_Delete} {LNG_Transaction history} ID : 2', NULL),
(29, 3, 'index', 'User', '2025-01-27 14:12:15', NULL, 3, '{LNG_Login} IP ::1', NULL),
(30, 1, 'index', 'User', '2025-01-27 14:14:04', NULL, 1, '{LNG_Login} IP ::1', NULL),
(31, 1, 'index', 'User', '2025-01-27 14:14:14', NULL, 1, '{LNG_Login} IP ::1', NULL),
(32, 0, 'index', 'Save', '2025-01-27 14:14:24', NULL, 1, '{LNG_LINE settings}', NULL),
(33, 1, 'index', 'User', '2025-01-27 14:14:35', NULL, 1, '{LNG_Login} IP ::1', NULL),
(34, 1, 'index', 'User', '2025-02-07 17:22:38', NULL, 1, '{LNG_Login} IP 127.0.0.1', NULL),
(35, 1, 'index', 'User', '2025-02-07 18:53:20', NULL, 1, '{LNG_Login} IP 127.0.0.1', NULL),
(36, 1, 'index', 'User', '2025-02-07 20:19:00', NULL, 1, '{LNG_Login} IP 127.0.0.1', NULL),
(37, 1, 'index', 'User', '2025-02-17 14:29:53', NULL, 1, '{LNG_Login} IP 127.0.0.1', NULL),
(38, 0, 'index', 'Save', '2025-02-17 14:50:14', NULL, 1, '{LNG_LINE settings}', NULL),
(39, 0, 'index', 'Save', '2025-02-17 14:52:27', NULL, 1, '{LNG_LINE settings}', NULL),
(40, 1, 'repair', 'Save', '2025-02-17 14:53:09', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(41, 1, 'index', 'User', '2025-02-17 14:53:45', NULL, 1, '{LNG_Login} IP ::1', NULL),
(42, 0, 'index', 'Save', '2025-02-17 14:53:55', NULL, 1, '{LNG_LINE settings}', NULL),
(43, 1, 'repair', 'Save', '2025-02-17 14:54:04', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(44, 0, 'index', 'Save', '2025-02-17 15:09:42', NULL, 1, '{LNG_LINE settings}', NULL),
(45, 1, 'repair', 'Save', '2025-02-17 15:09:52', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(46, 1, 'repair', 'Save', '2025-02-17 15:12:31', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(47, 1, 'repair', 'Save', '2025-02-17 15:33:27', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(48, 1, 'repair', 'Save', '2025-02-17 15:33:52', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(49, 1, 'index', 'User', '2025-02-17 15:34:14', NULL, 1, '{LNG_Login} IP 127.0.0.1', NULL),
(50, 0, 'index', 'Save', '2025-02-17 15:47:30', NULL, 1, '{LNG_LINE settings}', NULL),
(51, 1, 'repair', 'Save', '2025-02-17 15:47:43', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(52, 1, 'repair', 'Save', '2025-02-17 15:48:06', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(53, 1, 'index', 'User', '2025-02-17 16:00:00', NULL, 1, '{LNG_Login} IP ::1', NULL),
(54, 0, 'index', 'Save', '2025-02-17 16:06:04', NULL, 1, '{LNG_LINE settings}', NULL),
(55, 0, 'repair', 'Delete', '2025-02-17 16:06:22', NULL, 1, '{LNG_Delete} {LNG_Transaction history} ID : 5', NULL),
(56, 0, 'repair', 'Delete', '2025-02-17 16:06:24', NULL, 1, '{LNG_Delete} {LNG_Transaction history} ID : 12', NULL),
(57, 0, 'repair', 'Delete', '2025-02-17 16:06:26', NULL, 1, '{LNG_Delete} {LNG_Transaction history} ID : 11', NULL),
(58, 0, 'repair', 'Delete', '2025-02-17 16:06:28', NULL, 1, '{LNG_Delete} {LNG_Transaction history} ID : 10', NULL),
(59, 0, 'repair', 'Delete', '2025-02-17 16:06:31', NULL, 1, '{LNG_Delete} {LNG_Transaction history} ID : 9', NULL),
(60, 1, 'repair', 'Save', '2025-02-17 16:09:35', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(61, 0, 'index', 'Save', '2025-02-17 16:56:43', NULL, 1, '{LNG_LINE settings}', NULL),
(62, 1, 'index', 'User', '2025-02-17 17:00:54', NULL, 1, '{LNG_Login} IP ::1', NULL),
(63, 1, 'repair', 'Save', '2025-02-17 17:01:01', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(64, 1, 'index', 'User', '2025-02-19 13:08:56', NULL, 1, '{LNG_Login} IP ::1', NULL),
(65, 1, 'index', 'User', '2025-02-21 09:59:38', NULL, 1, '{LNG_Login} IP ::1', NULL),
(66, 0, 'index', 'Save', '2025-02-21 10:00:53', NULL, 1, '{LNG_LINE settings}', NULL),
(67, 0, 'index', 'Save', '2025-02-21 10:14:29', NULL, 1, '{LNG_LINE settings}', NULL),
(68, 1, 'index', 'User', '2025-02-21 11:27:15', NULL, 1, '{LNG_Login} IP ::1', NULL),
(69, 1, 'index', 'User', '2025-02-23 21:50:02', NULL, 1, '{LNG_Login} IP ::1', NULL),
(70, 1, 'index', 'User', '2025-02-23 22:02:43', NULL, 1, '{LNG_Login} IP ::1', NULL),
(71, 0, 'index', 'Save', '2025-02-23 22:14:11', NULL, 1, '{LNG_LINE settings}', NULL),
(72, 0, 'index', 'Save', '2025-02-23 22:18:38', NULL, 1, '{LNG_LINE settings}', NULL),
(73, 1, 'repair', 'Save', '2025-02-23 22:21:24', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(74, 1, 'repair', 'Save', '2025-02-23 22:39:39', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(75, 0, 'index', 'Save', '2025-02-23 22:43:52', NULL, 1, '{LNG_LINE settings}', NULL),
(76, 1, 'repair', 'Save', '2025-02-23 22:44:27', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(77, 1, 'index', 'User', '2025-02-23 23:12:35', NULL, 1, '{LNG_Login} IP ::1', NULL),
(78, 0, 'repair', 'Delete', '2025-02-23 23:13:27', NULL, 1, '{LNG_Delete} {LNG_Transaction history} ID : 41', NULL),
(79, 3, 'repair', 'Save', '2025-02-23 23:19:44', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(80, 3, 'repair', 'Save', '2025-02-23 23:20:32', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(81, 3, 'repair', 'Save', '2025-02-23 23:26:28', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(82, 3, 'repair', 'Save', '2025-02-23 23:29:44', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(83, 3, 'repair', 'Save', '2025-02-23 23:34:04', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(84, 3, 'repair', 'Save', '2025-02-23 23:35:45', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(85, 3, 'repair', 'Save', '2025-02-23 23:37:45', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(86, 3, 'repair', 'Save', '2025-02-23 23:40:05', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(87, 3, 'repair', 'Save', '2025-02-23 23:41:58', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(88, 3, 'repair', 'Save', '2025-02-23 23:55:12', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(89, 3, 'repair', 'Save', '2025-02-23 23:55:27', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(90, 3, 'repair', 'Save', '2025-02-23 23:58:40', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(91, 3, 'repair', 'Save', '2025-02-23 23:59:30', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(92, 3, 'repair', 'Save', '2025-02-24 00:06:35', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(93, 3, 'repair', 'Save', '2025-02-24 00:12:09', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(94, 1, 'index', 'User', '2025-02-24 00:14:36', NULL, 1, '{LNG_Login} IP ::1', NULL),
(95, 3, 'repair', 'Save', '2025-02-24 00:14:47', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(96, 0, 'index', 'Save', '2025-02-24 00:19:07', NULL, 1, '{LNG_LINE settings}', NULL),
(97, 3, 'repair', 'Save', '2025-02-24 00:32:54', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(98, 0, 'index', 'Save', '2025-02-24 00:35:00', NULL, 1, '{LNG_LINE settings}', NULL),
(99, 0, 'index', 'Save', '2025-02-24 00:35:10', NULL, 1, '{LNG_LINE settings}', NULL),
(100, 1, 'index', 'User', '2025-02-24 00:37:18', NULL, 1, '{LNG_Login} IP ::1', NULL),
(101, 1, 'index', 'User', '2025-02-24 00:50:15', NULL, 1, '{LNG_Login} IP ::1', NULL),
(102, 0, 'index', 'Save', '2025-02-24 00:50:33', NULL, 1, '{LNG_LINE settings}', NULL),
(103, 0, 'index', 'Save', '2025-02-24 00:52:28', NULL, 1, '{LNG_LINE settings}', NULL),
(104, 0, 'index', 'Save', '2025-02-24 00:52:53', NULL, 1, '{LNG_LINE settings}', NULL),
(105, 3, 'repair', 'Save', '2025-02-24 00:53:09', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(106, 3, 'repair', 'Save', '2025-02-24 00:54:29', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(107, 1, 'repair', 'Save', '2025-02-24 00:54:34', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(108, 1, 'index', 'User', '2025-02-24 09:12:01', NULL, 1, '{LNG_Login} IP ::1', NULL),
(109, 4, 'repair', 'Save', '2025-02-24 10:09:17', NULL, 1, '{LNG_Update repair status} ID : 4', NULL),
(110, 4, 'repair', 'Save', '2025-02-24 10:09:28', NULL, 1, '{LNG_Update repair status} ID : 4', NULL),
(111, 4, 'repair', 'Save', '2025-02-24 10:09:47', NULL, 1, '{LNG_Update repair status} ID : 4', NULL),
(112, 0, 'repair', 'Delete', '2025-02-24 10:10:13', NULL, 1, '{LNG_Delete} {LNG_Transaction history} ID : 69', NULL),
(113, 1, 'index', 'User', '2025-02-24 10:25:05', NULL, 1, '{LNG_Login} IP ::1', NULL),
(114, 3, 'repair', 'Save', '2025-02-24 11:01:59', NULL, 1, '{LNG_Update repair status} ID : 3', NULL),
(115, 1, 'repair', 'Save', '2025-02-24 11:02:12', NULL, 1, '{LNG_Update repair status} ID : 1', NULL),
(116, 1, 'index', 'User', '2025-02-24 14:17:31', NULL, 1, '{LNG_Login} IP ::1', NULL),
(117, 1, 'index', 'User', '2025-02-27 14:45:21', NULL, 1, '{LNG_Login} IP ::1', NULL),
(118, 0, 'index', 'Save', '2025-02-27 14:51:26', NULL, 1, '{LNG_LINE settings}', NULL),
(119, 2, 'inventory', 'Status', '2025-02-27 14:52:56', NULL, 1, 'ใช้งานอยู่ ID : 2', NULL),
(120, 2, 'inventory', 'Save', '2025-02-27 14:53:08', NULL, 1, '{LNG_Equipment} ID : 2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fix_number`
--

CREATE TABLE IF NOT EXISTS `fix_number` (
  `type` varchar(20) NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `auto_increment` int(11) NOT NULL,
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`type`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_number`
--

INSERT INTO `fix_number` (`type`, `prefix`, `auto_increment`, `last_update`) VALUES
('repair_job_no', 'JOB6801-', 1, '2025-01-27'),
('repair_job_no', 'JOB6802-', 3, '2025-02-23');

-- --------------------------------------------------------

--
-- Table structure for table `fix_repair`
--

CREATE TABLE IF NOT EXISTS `fix_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_no` varchar(150) NOT NULL,
  `job_id` varchar(20) NOT NULL,
  `job_description` varchar(1000) NOT NULL,
  `create_date` datetime NOT NULL,
  `appointment_date` date DEFAULT NULL,
  `repair_no` varchar(50) DEFAULT NULL,
  `informer` varchar(150) DEFAULT NULL,
  `appraiser` float DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_repair`
--

INSERT INTO `fix_repair` (`id`, `customer_id`, `product_no`, `job_id`, `job_description`, `create_date`, `appointment_date`, `repair_no`, `informer`, `appraiser`) VALUES
(1, 1, '1108-365D', 'JOB6801-0001', 'แจ้งซ่อมจอมอนิเตอร์', '2025-01-27 13:55:56', NULL, NULL, NULL, 0),
(3, 1, 'IF111/036/2', 'JOB6802-0002', 'เปิดไม่ติดจ้า', '2025-02-23 23:13:15', NULL, NULL, NULL, 0),
(4, 1, '1108-365D', 'JOB6802-0003', 'อาการจอกระพริบมีเส้น', '2025-02-24 10:08:28', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fix_repair_status`
--

CREATE TABLE IF NOT EXISTS `fix_repair_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `cost` float DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `operator_id` (`operator_id`),
  KEY `repair_id` (`repair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_repair_status`
--

INSERT INTO `fix_repair_status` (`id`, `repair_id`, `status`, `operator_id`, `comment`, `member_id`, `create_date`, `cost`) VALUES
(66, 3, 1, 1, '', 1, '2025-02-24 00:54:28', 0),
(67, 1, 1, 1, '', 1, '2025-02-24 00:54:34', 0),
(68, 4, 1, 0, 'anydesk 465785678265789 tel191', 1, '2025-02-24 10:08:28', 0),
(70, 4, 2, 3, '', 1, '2025-02-24 10:09:28', 0),
(71, 4, 8, 3, '', 1, '2025-02-24 10:09:47', 0),
(72, 3, 2, 1, '', 1, '2025-02-24 11:01:59', 0),
(73, 1, 8, 1, '', 1, '2025-02-24 11:02:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fix_user`
--

CREATE TABLE IF NOT EXISTS `fix_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `salt` varchar(32) DEFAULT '',
  `password` varchar(50) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `permission` text DEFAULT '',
  `name` varchar(150) NOT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `id_card` varchar(13) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `provinceID` varchar(3) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `country` varchar(2) DEFAULT 'TH',
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `social` tinyint(1) DEFAULT 0,
  `line_uid` varchar(33) DEFAULT NULL,
  `activatecode` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `line_uid` (`line_uid`),
  KEY `username` (`username`),
  KEY `token` (`token`),
  KEY `phone` (`phone`),
  KEY `id_card` (`id_card`),
  KEY `activatecode` (`activatecode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fix_user`
--

INSERT INTO `fix_user` (`id`, `username`, `salt`, `password`, `token`, `status`, `permission`, `name`, `sex`, `id_card`, `address`, `phone`, `provinceID`, `province`, `zipcode`, `country`, `create_date`, `active`, `social`, `line_uid`, `activatecode`) VALUES
(1, 'admin', 'aaec57c22ba8f', '8e38002329083a59a3d85561d98aa1cccb1baf15', 'ca63bee52af8d11b23eef0daa1fc8bf967dc1083', 1, ',can_config,can_view_usage_history,can_manage_inventory,can_manage_repair,can_repair,', 'แอดมิน', 'u', NULL, '', NULL, '', '', '', 'TH', '2025-01-27 06:07:54', 1, 0, NULL, ''),
(2, 'demo', '679714aa9d940', 'b88d7518e6d3202c769a304db59dc508a0ae60ac', NULL, 0, '', 'ตัวอย่าง', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2025-01-27 06:07:54', 1, 0, NULL, ''),
(3, 'coe', 'e90fa9dcd6c1a', '955477a0d793de8d31c7c98ae5ff5468781251fd', '4886962660157dfea3823179a60fb1a36d195fb5', 2, ',can_manage_repair,can_repair,', 'ช่าง', 'u', NULL, '', NULL, '', '', '', 'TH', '2025-01-27 14:10:33', 1, 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `fix_user_meta`
--

CREATE TABLE IF NOT EXISTS `fix_user_meta` (
  `value` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `member_id` int(11) NOT NULL,
  KEY `member_id` (`member_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
--
-- Database: `repair`
--
CREATE DATABASE IF NOT EXISTS `repair` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `repair`;

-- --------------------------------------------------------

--
-- Table structure for table `rp_category`
--
-- Error reading structure for table repair.rp_category: #1932 - Table &#039;repair.rp_category&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_category: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_category`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_inventory`
--
-- Error reading structure for table repair.rp_inventory: #1932 - Table &#039;repair.rp_inventory&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_inventory: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_inventory`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_inventory_items`
--
-- Error reading structure for table repair.rp_inventory_items: #1932 - Table &#039;repair.rp_inventory_items&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_inventory_items: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_inventory_items`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_inventory_meta`
--
-- Error reading structure for table repair.rp_inventory_meta: #1932 - Table &#039;repair.rp_inventory_meta&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_inventory_meta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_inventory_meta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_language`
--
-- Error reading structure for table repair.rp_language: #1932 - Table &#039;repair.rp_language&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_language: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_language`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_logs`
--
-- Error reading structure for table repair.rp_logs: #1932 - Table &#039;repair.rp_logs&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_logs: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_logs`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_number`
--
-- Error reading structure for table repair.rp_number: #1932 - Table &#039;repair.rp_number&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_number: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_number`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_repair`
--
-- Error reading structure for table repair.rp_repair: #1932 - Table &#039;repair.rp_repair&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_repair: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_repair`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_repair_status`
--
-- Error reading structure for table repair.rp_repair_status: #1932 - Table &#039;repair.rp_repair_status&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_repair_status: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_repair_status`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_user`
--
-- Error reading structure for table repair.rp_user: #1932 - Table &#039;repair.rp_user&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_user: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_user`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `rp_user_meta`
--
-- Error reading structure for table repair.rp_user_meta: #1932 - Table &#039;repair.rp_user_meta&#039; doesn&#039;t exist in engine
-- Error reading data for table repair.rp_user_meta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `repair`.`rp_user_meta`&#039; at line 1
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
