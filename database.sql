-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: estateadvance
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignmentbuilding`
--

DROP TABLE IF EXISTS `assignmentbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentbuilding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `buildingid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_building` (`staffid`),
  KEY `fk_building_user` (`buildingid`),
  CONSTRAINT `fk_building_user` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_user_building` FOREIGN KEY (`staffid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignmentbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcustomer`
--

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentcustomer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_customer` (`staffid`),
  KEY `fk_customer_user` (`customerid`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`staffid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
INSERT INTO `assignmentcustomer` VALUES (35,2,9,NULL,NULL,NULL,NULL),(36,4,10,NULL,NULL,NULL,NULL),(37,3,11,NULL,NULL,NULL,NULL),(38,4,11,NULL,NULL,NULL,NULL),(39,2,12,NULL,NULL,NULL,NULL),(40,4,12,NULL,NULL,NULL,NULL),(41,2,13,NULL,NULL,NULL,NULL),(42,3,14,NULL,NULL,NULL,NULL),(43,4,14,NULL,NULL,NULL,NULL),(44,2,15,NULL,NULL,NULL,NULL),(45,3,16,NULL,NULL,NULL,NULL),(46,4,16,NULL,NULL,NULL,NULL),(47,2,17,NULL,NULL,NULL,NULL),(48,4,18,NULL,NULL,NULL,NULL),(49,2,19,NULL,NULL,NULL,NULL),(50,2,21,NULL,NULL,NULL,NULL),(51,4,21,NULL,NULL,NULL,NULL),(52,3,20,NULL,NULL,NULL,NULL),(53,2,30,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignmentcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `numberofbasement` int DEFAULT NULL,
  `floorarea` int DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rentprice` int DEFAULT NULL,
  `rentpricedescription` text,
  `servicefee` varchar(255) DEFAULT NULL,
  `carfee` varchar(255) DEFAULT NULL,
  `motorbikefee` varchar(255) DEFAULT NULL,
  `overtimefee` varchar(255) DEFAULT NULL,
  `waterfee` varchar(255) DEFAULT NULL,
  `electricityfee` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `renttime` varchar(255) DEFAULT NULL,
  `decorationtime` varchar(255) DEFAULT NULL,
  `brokeragefee` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `linkofbuilding` varchar(255) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `describearea` varchar(255) DEFAULT NULL,
  `managername` varchar(255) DEFAULT NULL,
  `managerphone` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Nam Giao Building Tower','59 phan xích long','Phường 2','QUAN_3',NULL,2,500,'tây','1',15,NULL,'450',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'100','TANG_TRET,NGUYEN_CAN,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nguyễn Văn Minh',327821824),(2,'ACM Tower','96 cao thắng','Phường 4','QUAN_2',NULL,2,650,NULL,NULL,18,NULL,'150',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6000','TANG_TRET,NGUYEN_CAN,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đinh Trung Hiếu',662345783),(3,'Alpha 2 Building Tower','153 nguyễn đình chiểu','Phường 6','QUAN_1',NULL,1,200,NULL,NULL,20,'20 triệu/m2','215',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4500','TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bình Văn Tới',995632632),(4,'IDD 1 Building','111 Lý Chính Thắng','Phường 7','QUAN_4',NULL,1,200,NULL,NULL,12,NULL,'470',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'20','TANG_TRET,NGUYEN_CAN,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hoàng Anh Vũ',377667667),(56,' Landmark 81','720A Điện Biên Phủ','Bình Thạnh','QUAN_1',NULL,NULL,300000,NULL,NULL,NULL,NULL,'715',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'500000000','TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,'/building/Landmark-81-o-quan-may-1.jpg',NULL,NULL,NULL,NULL,NULL,'Đinh Hoàng Anh Vũ',355662132),(57,'Saigon One Tower',' Đường Hàm nghi','quận 1','QUAN_4',NULL,NULL,3000,NULL,NULL,NULL,NULL,'100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'300','TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Trần Mạc Anh Khoa',952678324),(58,'Discovery Complex A','Trần Hưng Đạo',' Cầu Giấy','QUAN_2',NULL,NULL,450,NULL,NULL,NULL,NULL,'650',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5000','TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Văn Liển',677437231),(59,'Saigon Center 2','Đường 30/4','Lê Lợi','QUAN_2',NULL,NULL,500,NULL,NULL,NULL,NULL,'333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7000','TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Phan',366786132),(60,'HPC Landmark 105   ','Tiến Vũ','Hồng Quân','QUAN_3',NULL,NULL,650,NULL,NULL,NULL,NULL,'250',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3000','TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Đinh Ngũ Anh',32785332),(61,'Phương Trạch Tower','Trần Thành','Đông Anh','QUAN_4',NULL,NULL,2000,NULL,NULL,NULL,NULL,'300',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'600','TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hoàng Anh',325642842),(62,'Empire Sunshine',' Khu đô thị Ciputra','Phường Trảnh Đông','QUAN_3',NULL,NULL,600,NULL,NULL,NULL,NULL,'200',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'300','TANG_TRET,NOI_THAT',NULL,NULL,NULL,NULL,'2023-04-16 15:57:13',NULL,'nguyen van a',NULL,NULL,'Lý Anh Tài',327821824);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `demand` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (9,'Đinh Trung Hiếu','327821824','hieu@gmail.com','2023-04-13 00:00:00',NULL,'Nguyễn Văn A',NULL,'Cần 1 căn phòng 105m2','VIP','ABZ Company',NULL),(10,'Đinh Thị Như Ý','255247652','nhuy@gmail.com','2023-04-22 00:00:00',NULL,'Nguyễn Văn D',NULL,'Cần một căn hộ cao cấp','VIP','ZAM@gmail.com',NULL),(11,'Phan Nguyễn','355662142','nguyen2@gmail.com','2023-04-11 00:00:00',NULL,'Nguyễn Văn B',NULL,'Tìm một tòa nhà full nội thất sang trọng','VIP','AFT ',NULL),(12,'Nguyễn Nhất Trường','326462752','nhattruong@gmail.com','2023-04-10 00:00:00',NULL,'Nguyễn Văn A',NULL,'Cần một tòa nhà làm văn phòng','VIP','AWT Company','chi phí dưới 15 triệu'),(13,'Trần Ngọc Khánh','357882132','ngocckhanhz@gmail.com','2023-04-25 00:00:00',NULL,'Nguyễn Văn C',NULL,'Cần một căn chung cư 3 phòng ngủ','VIP','ACB','chi phí dưới 10 triệu'),(14,'Trần Ngọc Thiện','333753813','thien@gmail.com','2023-04-01 00:00:00',NULL,'Nguyễn Văn B',NULL,'nhà nguyên căn','VIP','abc@gmail.com','giá dưới 5 triệu'),(15,'Nguyễn Hoàng Anh Tuấn','995662132','hoanganh@gmail.com','2023-04-06 00:00:00',NULL,'Nguyễn Văn B',NULL,'cần một tòa nhà 3 tầng','VIP','HA ACB','giá dưới 10 triệu'),(16,'Đinh Hà Anh Tuấn ','968742352','tuananh@gmail.com','2023-04-25 00:00:00',NULL,'Nguyễn Văn A',NULL,'Nhà một tầng','VIP','Azz WTW','gần trung tâm'),(17,'Nguyễn Văn Sang','377689689','sangnguyen@gmail.com','2023-04-25 00:00:00',NULL,'Nguyễn Văn C',NULL,'Văn phòng công ty','VIP','Công ty TNHH Sang Nguyễn','Dưới 20 triệu/ tháng'),(18,'Hoàng Anh Vũ','355662132','aratadz.h2r@gmail.com','2023-04-07 00:00:00',NULL,'Nguyễn Văn D',NULL,'Nhà nguyên căn có nội thất','VIP','03289219823','dưới 7 triệu'),(19,'Hồ Anh Tài','379132132','aratadz.h2r@gmail.com','2023-04-25 00:00:00',NULL,'Nguyễn Văn D',NULL,'cần nhà nguyên căn 4 tầng có hầm','VIP','Công ty TNHH công nghệ HAT','dưới 15 triệu/ tháng'),(20,'Hoàng Nguyễn Anh Tú','328823123','h2@gmail.com','2023-04-25 00:00:00',NULL,'Nguyễn Văn C',NULL,'nhà nguyên căn full nội thất','VIP','Anh Tú Company','gần chợ, trường học'),(21,'Hoàng Văn Khách','132132423','Khach@gmail.com','2023-04-25 00:00:00',NULL,'Nguyễn Văn B',NULL,'kho','VIP','khachnguyen@gmail.com','tầm 100m2'),(30,'Đinh Trung Hiếu','327821824','aratadz.h2r@gmail.com','2023-04-25 00:00:00',NULL,'Nguyễn Văn A',NULL,'cần một tòa nhà 155m2',NULL,'IT Company','K.O');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_transaction`
--

DROP TABLE IF EXISTS `customer_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint NOT NULL,
  `transaction_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_transaction`
--

LOCK TABLES `customer_transaction` WRITE;
/*!40000 ALTER TABLE `customer_transaction` DISABLE KEYS */;
INSERT INTO `customer_transaction` VALUES (1,1,17),(2,1,18),(3,1,19),(4,1,20),(5,2,21),(6,2,22),(7,3,23),(8,3,24),(9,3,25),(10,3,26);
/*!40000 ALTER TABLE `customer_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentarea`
--

DROP TABLE IF EXISTS `rentarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentarea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `buildingid` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rentarea_building` (`buildingid`),
  CONSTRAINT `rentarea_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (266,100,1,NULL,NULL,NULL,NULL),(267,3000,57,NULL,NULL,NULL,NULL),(268,300,3,NULL,NULL,NULL,NULL),(269,400,3,NULL,NULL,NULL,NULL),(270,500,3,NULL,NULL,NULL,NULL),(271,100,4,NULL,NULL,NULL,NULL),(272,200,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rentarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản lý','MANAGER',NULL,NULL,NULL,NULL),(2,'Nhân viên','STAFF',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `staffid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (17,'CSKH','Gọi điện hỏi thăm sức khỏe','2023-03-11 17:28:15',NULL,NULL,NULL,1),(18,'DDX','đi xem nhà đẹp cùng anh Hiếu','2023-03-11 17:28:52',NULL,NULL,NULL,1),(20,'CSKH','Gọi điện hỏi thăm tình hình','2023-03-12 12:43:43',NULL,NULL,NULL,1),(21,'CSKH','ádas','2023-04-01 13:24:55',NULL,NULL,NULL,1),(22,'DDX','aaa','2023-04-01 13:25:02',NULL,NULL,NULL,1),(23,'CSKH','aaa','2023-04-02 22:03:20',NULL,NULL,NULL,1),(24,'CSKH','aaa','2023-04-02 22:03:20',NULL,NULL,NULL,1),(25,'CSKH','avz','2023-04-02 22:05:41',NULL,NULL,NULL,1),(26,'DDX','zzz','2023-04-02 22:05:58',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`userid`),
  KEY `fk_role_user` (`roleid`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL,NULL),(3,2,3,NULL,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Nguyễn Văn A',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,'nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Nguyễn Văn B',NULL,NULL,1,NULL,NULL,NULL,NULL),(3,'nguyenvanc','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Nguyễn Văn C',NULL,NULL,1,NULL,NULL,NULL,NULL),(4,'nguyenvand','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','Nguyễn Văn D',NULL,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-25 17:52:04
