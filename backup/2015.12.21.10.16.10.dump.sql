-- MySQL dump 10.13  Distrib 5.6.27, for Linux (x86_64)
--
-- Host: localhost    Database: mysql-1
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignments_project_field`
--

DROP TABLE IF EXISTS `assignments_project_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments_project_field` (
  `project_id` bigint(20) NOT NULL,
  `field_id` bigint(20) NOT NULL,
  `label` varchar(32) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`project_id`,`field_id`,`label`,`value`),
  KEY `FK_field_id` (`field_id`),
  CONSTRAINT `FK_fields` FOREIGN KEY (`field_id`) REFERENCES `fields` (`field_id`),
  CONSTRAINT `FK_project_field` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments_project_field`
--

LOCK TABLES `assignments_project_field` WRITE;
/*!40000 ALTER TABLE `assignments_project_field` DISABLE KEYS */;
INSERT INTO `assignments_project_field` (`project_id`, `field_id`, `label`, `value`) VALUES (75,5,'Building Permit','000-111-222-333ABC'),(76,5,'Building Permit','000-111-222-333ABC Testtt');
/*!40000 ALTER TABLE `assignments_project_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments_project_staff`
--

DROP TABLE IF EXISTS `assignments_project_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments_project_staff` (
  `project_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  PRIMARY KEY (`project_id`,`staff_id`),
  KEY `FK_assignments_project_staff_stf` (`staff_id`),
  CONSTRAINT `FK_assignments_project_staff` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `FK_assignments_project_staff_stf` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments_project_staff`
--

LOCK TABLES `assignments_project_staff` WRITE;
/*!40000 ALTER TABLE `assignments_project_staff` DISABLE KEYS */;
INSERT INTO `assignments_project_staff` (`project_id`, `staff_id`) VALUES (74,301),(74,302),(74,303),(74,305),(74,306),(74,309),(74,311),(74,313),(74,314),(74,315),(74,316),(74,318),(74,319),(74,320),(74,321),(74,322),(74,323),(74,324),(74,325),(74,326),(75,327),(75,330),(75,331),(75,333),(75,335),(75,337),(75,338),(75,340),(75,341),(75,342),(75,343),(75,344),(75,345),(75,346),(75,347),(75,348),(75,349),(75,350),(75,351),(75,352),(76,353),(76,354),(76,355),(76,356),(76,358),(76,359),(76,360),(76,361),(76,362),(76,363),(76,364),(76,365),(76,366),(76,367),(76,368),(76,369),(76,370),(76,372),(76,374),(76,375),(76,376);
/*!40000 ALTER TABLE `assignments_project_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments_task_staff`
--

DROP TABLE IF EXISTS `assignments_task_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments_task_staff` (
  `task_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  PRIMARY KEY (`task_id`,`staff_id`),
  KEY `FK_assignments_task_staff` (`staff_id`),
  CONSTRAINT `FK_assignments_task_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `FK_tasks_task` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments_task_staff`
--

LOCK TABLES `assignments_task_staff` WRITE;
/*!40000 ALTER TABLE `assignments_task_staff` DISABLE KEYS */;
INSERT INTO `assignments_task_staff` (`task_id`, `staff_id`) VALUES (108,343),(124,353),(135,372),(135,375);
/*!40000 ALTER TABLE `assignments_task_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_logs` (
  `auditlog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_executed` datetime NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `action` int(4) NOT NULL,
  `object_name` varchar(64) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `object_key` varchar(255) DEFAULT NULL,
  `assoc_object_name` varchar(64) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `assoc_object_key` varchar(255) DEFAULT NULL,
  `entry_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auditlog_id`),
  KEY `FK_audit_logs_users` (`user_id`),
  KEY `FK_audit_logs_project_id` (`project_id`),
  KEY `FK_audit_logs_company_id` (`company_id`),
  CONSTRAINT `FK_audit_logs_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `FK_audit_logs_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` (`auditlog_id`, `date_executed`, `ip_address`, `user_id`, `company_id`, `project_id`, `action`, `object_name`, `object_id`, `object_key`, `assoc_object_name`, `assoc_object_id`, `assoc_object_key`, `entry_name`) VALUES (725,'2015-12-15 10:06:50','122.3.168.18',4,NULL,NULL,109,'company',0,NULL,'',NULL,'','auditlog'),(726,'2015-12-15 10:06:59','122.3.168.18',4,NULL,NULL,107,'company',27,NULL,'',NULL,'','Future Build Incorporated'),(727,'2015-12-15 10:47:12','122.3.168.18',4,NULL,NULL,105,'auxcompany',30,NULL,'',NULL,'','Power Builders Corporation'),(728,'2015-12-15 10:48:08','122.3.168.18',4,NULL,NULL,105,'auxcompany',29,NULL,'',NULL,'','RC ProBuilders Corporation'),(729,'2015-12-15 13:46:23','122.3.168.18',72,30,75,116,'project',75,NULL,'field',NULL,'Building Permit','Building Permit'),(730,'2015-12-15 13:51:11','122.3.168.18',72,30,75,105,'project',75,NULL,'cost',NULL,'company.fk:30:project.fk:75:cost:74631d2a-fe44-4cd1-89c5-1e827265dac8','Quality Control'),(731,'2015-12-15 13:51:29','122.3.168.18',72,30,75,105,'project',75,NULL,'cost',NULL,'company.fk:30:project.fk:75:cost:ba9a03a4-e5e6-4d08-ab98-dd04b1dab9c1','Safety Requirements'),(732,'2015-12-15 13:51:43','122.3.168.18',72,30,75,105,'project',75,NULL,'cost',NULL,'company.fk:30:project.fk:75:cost:7ca12831-e56d-4bb3-8ab1-0b967968f5c5','Administrative Expenses'),(733,'2015-12-15 13:59:52','122.3.168.18',72,30,75,116,'task',108,NULL,'staff',343,NULL,'Terrence P. Contreras Sr.'),(734,'2015-12-15 14:14:56','122.3.168.18',72,30,75,100,'project',75,NULL,'pullout',NULL,'company.fk:30:project.fk:75:delivery.fk:1f0b071a-9f0a-4530-9ad6-17920cbb926b:material.fk:304fb88a-2007-4ae2-8dcf-70f631b74868:pullout:6f2e047f-283e-42bb-8528-597bd1659e87','# 4 CWN'),(735,'2015-12-15 17:14:43','122.3.168.18',72,30,75,107,'project',75,NULL,'material',NULL,'company.fk:30:project.fk:75:delivery.fk:1f0b071a-9f0a-4530-9ad6-17920cbb926b:material:f1b1fd2e-1a80-4c1a-a6cf-d27ce14c3e98','Portland Cement'),(736,'2015-12-17 14:21:54','122.3.168.18',81,31,76,105,'project',76,NULL,'',NULL,'','Test'),(737,'2015-12-17 14:22:06','122.3.168.18',81,31,76,105,'project',76,NULL,'field',NULL,'Building Permit','Building Permit'),(738,'2015-12-17 14:23:06','122.3.168.18',81,31,76,116,'task',135,NULL,'staff',372,NULL,'Irvin P. Arango'),(739,'2015-12-17 14:23:10','122.3.168.18',81,31,76,116,'task',135,NULL,'staff',375,NULL,'Fred S. Tejada'),(740,'2015-12-17 14:23:47','122.3.168.18',81,31,76,116,'project',76,NULL,'staff',360,NULL,'Ezra D. Encarnacion II');
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_started` datetime NOT NULL,
  `date_expiration` datetime NOT NULL,
  `beta_tester` tinyint(4) NOT NULL DEFAULT '0',
  `theme` varchar(32) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`company_id`, `name`, `description`, `date_started`, `date_expiration`, `beta_tester`, `theme`) VALUES (29,'RC ProBuilders Corporation','This is a demo company.','2015-11-01 00:00:00','2025-11-01 00:00:00',0,'orange'),(30,'Power Builders Corporation','This is a demo company.','2015-11-01 00:00:00','2025-11-01 00:00:00',0,'orange'),(31,'Test','This is a demo company.','2015-11-01 00:00:00','2025-11-01 00:00:00',0,'orange');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `field_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` (`field_id`, `name`) VALUES (5,'Textfield');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` int(2) NOT NULL,
  `location` varchar(108) DEFAULT NULL,
  `notes` text,
  `company_id` bigint(20) DEFAULT NULL,
  `physical_target` double DEFAULT '0',
  `date_start` date DEFAULT NULL,
  `date_completion_target` date DEFAULT NULL,
  `date_completion_actual` date DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FK_projects_company` (`company_id`),
  CONSTRAINT `FK_projects_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`project_id`, `name`, `status`, `location`, `notes`, `company_id`, `physical_target`, `date_start`, `date_completion_target`, `date_completion_actual`) VALUES (74,'Motorbike Shop',2,'Escario Street, Cebu City, Cebu, Philippines','',29,48,'2015-10-01','2015-11-15','2015-11-11'),(75,'Motorbike Shop',2,'Escario Street, Cebu City, Cebu, Philippines','',30,48,'2015-10-01','2015-11-15','2015-11-11'),(76,'Test',2,'Escario Street, Cebu City, Cebu, Philippines','',31,48,'2015-10-01','2015-11-15','2015-11-11');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_prefix` varchar(8) NOT NULL,
  `name_first` varchar(32) NOT NULL,
  `name_middle` varchar(16) NOT NULL,
  `name_last` varchar(16) NOT NULL,
  `name_suffix` varchar(8) NOT NULL,
  `position` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `contact_number` varchar(32) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `wage` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`staff_id`),
  KEY `FK_staff_company` (`company_id`),
  CONSTRAINT `FK_staff_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`staff_id`, `name_prefix`, `name_first`, `name_middle`, `name_last`, `name_suffix`, `position`, `email`, `contact_number`, `company_id`, `wage`) VALUES (156,'','Gabriel','','Razo','','System Administrator','razo@gmail.com','09221112222',NULL,0),(301,'','Rod','Cooper','Montanez','','Manpower','cebedo.vii@gmail.com','9226110429',29,350),(302,'','Kurt','Santamaria','Saldana','','Manpower','cebedo.vii@gmail.com','9226110429',29,350),(303,'','Josh','Escalera','Cervantez','','Manpower','cebedo.vii@gmail.com','9226110429',29,400),(304,'','Irving','Carrasquillo','Lopes','','Staffing and Payroll Officer','demo_sescon@gmail.com','09229654182',29,600),(305,'','Buster','Toscano','Tavarez','','Manpower','cebedo.vii@gmail.com','9226110429',29,500),(306,'','Stevie','Barrientos','Bennett','','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(307,'','Jesse','Alegria','Cotto','','Contract and Estimation Officer','demo_nazario@gmail.com','09224445656',29,800),(308,'','Wilburn','Rascon','Mitchell','','Liaison Officer','caranyao@gmail.com','09221414222',29,400),(309,'','Eusebio','Rios','Carlos','','Foreman','cebedo.vii@gmail.com','9226110429',29,300),(310,'','Gary','Covarrubias','Pina','','Bookkeeper','olayvar@gmail.com','09224447777',29,400),(311,'','Bill','Kelly','Hermosillo','','Manpower','cebedo.vii@gmail.com','9226110429',29,500),(312,'','Andre','Soria','Valadez','II','Company Administrator','cebedo.vii@gmail.com','09226110429',29,350),(313,'','Milo','Guzman','Magdaleno','','Manpower','cebedo.vii@gmail.com','9226110429',29,500),(314,'','Vicente','Sauceda','Tobar','','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(315,'','Lupe','Huerta','Desantiago','','Engineer','cebedo.vii@gmail.com','9226110429',29,400),(316,'','Jarred','Correa','Avina','','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(317,'','Peter','Escamilla','Mateo','','Company Administrator','razo@gmail.com','09228656856',29,350),(318,'','Lacy','Valencia','Escalante','Jr.','Manpower','cebedo.vii@gmail.com','9226110429',29,500),(319,'','Rod','Renteria','Gomez','','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(320,'','Devin','Veliz','Estrella','','Manpower','cebedo.vii@gmail.com','9226110429',29,350),(321,'','Renato','Rosas','Melgar','','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(322,'','Sal','Agosto','Marquez','','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(323,'','Daron','Bernal','Olivo','','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(324,'','Eldon','Laboy','Young','','Manpower','cebedo.vii@gmail.com','9226110429',29,400),(325,'','Darryl','Stewart','Macias','','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(326,'','Alex','Altamirano','Clark','Sr.','Manpower','cebedo.vii@gmail.com','9226110429',29,300),(327,'','Maxwell','Palomo','Andino','','Manpower','cebedo.vii@gmail.com','9226110429',30,500),(328,'','Charles','Bustamante','Palomo','','Staffing and Payroll Officer','demo_sescon@gmail.com','09229654182',30,600),(329,'','Roosevelt','Franco','Orosco','','Contract and Estimation Officer','demo_nazario@gmail.com','09224445656',30,800),(330,'','Hobert','Delgadillo','Gonzales','','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(331,'','Leif','Sotelo','Aguilar','','Foreman','cebedo.vii@gmail.com','9226110429',30,300),(332,'','Cliff','Camarena','Zuniga','','Liaison Officer','caranyao@gmail.com','09221414222',30,400),(333,'','Albert','Arce','Berrios','','Manpower','cebedo.vii@gmail.com','9226110429',30,500),(334,'','Lane','Cisneros','Aleman','','Bookkeeper','olayvar@gmail.com','09224447777',30,400),(335,'','Hoyt','Harris','Esquibel','','Manpower','cebedo.vii@gmail.com','9226110429',30,500),(336,'','Tobias','Pena','Rolon','II','Company Administrator','cebedo.vii@gmail.com','09226110429',30,350),(337,'','Wendell','Cortez','Sepulveda','','Engineer','cebedo.vii@gmail.com','9226110429',30,400),(338,'','Gene','Cota','Carlos','','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(339,'','Erin','Brito','Gonzales','','Company Administrator','razo@gmail.com','09228656856',30,350),(340,'','Beau','Ocampo','Pulido','','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(341,'','Moses','Collazo','Garces','','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(342,'','Levi','Terrazas','Pizano','Jr.','Manpower','cebedo.vii@gmail.com','9226110429',30,500),(343,'','Terrence','Pabon','Contreras','Sr.','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(344,'','Elwood','Castanon','Perez','','Manpower','cebedo.vii@gmail.com','9226110429',30,400),(345,'','Billie','Sanches','Iniguez','','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(346,'','Leigh','Pelaez','Limon','','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(347,'','Cyrus','Parker','Monge','','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(348,'','Jacinto','Coronado','Vela','','Manpower','cebedo.vii@gmail.com','9226110429',30,350),(349,'','Quinton','Bello','Valverde','','Manpower','cebedo.vii@gmail.com','9226110429',30,300),(350,'','Sheldon','Godinez','Sorto','','Manpower','cebedo.vii@gmail.com','9226110429',30,350),(351,'','Brain','Pantoja','Covarrubias','','Manpower','cebedo.vii@gmail.com','9226110429',30,350),(352,'','Valentin','Medina','Zuniga','','Manpower','cebedo.vii@gmail.com','9226110429',30,400),(353,'','Kim','Barrientos','Viera','Sr.','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(354,'','Pat','Navarrete','Sigala','Jr.','Manpower','cebedo.vii@gmail.com','9226110429',31,500),(355,'','Drew','Renteria','Sotelo','','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(356,'','Brandon','Salas','Espinosa','','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(357,'','Maurice','Araiza','Arguello','','Company Administrator','razo@gmail.com','09228656856',31,350),(358,'','Sol','Zamora','Manriquez','','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(359,'','Lloyd','Anguiano','Borges','','Engineer','cebedo.vii@gmail.com','9226110429',31,400),(360,'','Ezra','Delgadillo','Encarnacion','II','Company Administrator','cebedo.vii@gmail.com','09226110429',31,350),(361,'','Emil','Moralez','Carrillo','','Manpower','cebedo.vii@gmail.com','9226110429',31,350),(362,'','Sterling','Ornelas','Arreguin','','Manpower','cebedo.vii@gmail.com','9226110429',31,350),(363,'','Tobias','Robinson','Hill','','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(364,'','Marcus','Ochoa','Archuleta','','Manpower','cebedo.vii@gmail.com','9226110429',31,350),(365,'','Omar','Antonio','Deanda','','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(366,'','Dario','Estevez','Ruvalcaba','','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(367,'','Walton','Borges','Sarmiento','','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(368,'','Boyce','Alegria','Quinonez','','Manpower','cebedo.vii@gmail.com','9226110429',31,400),(369,'','Houston','Valencia','Montoya','','Manpower','cebedo.vii@gmail.com','9226110429',31,500),(370,'','Sanford','Montemayor','Balderas','','Manpower','cebedo.vii@gmail.com','9226110429',31,400),(371,'','Sammie','Aguilera','Lucero','','Bookkeeper','olayvar@gmail.com','09224447777',31,400),(372,'','Irvin','Phillips','Arango','','Manpower','cebedo.vii@gmail.com','9226110429',31,500),(373,'','Rogelio','Escalante','Sauceda','','Liaison Officer','caranyao@gmail.com','09221414222',31,400),(374,'','Fritz','Machado','Pacheco','','Manpower','cebedo.vii@gmail.com','9226110429',31,500),(375,'','Fred','Soliz','Tejada','','Manpower','cebedo.vii@gmail.com','9226110429',31,300),(376,'','Johnson','Pedroza','Cox','','Foreman','cebedo.vii@gmail.com','9226110429',31,300),(377,'','Mickey','Casanova','Medellin','','Staffing and Payroll Officer','demo_sescon@gmail.com','09229654182',31,600),(378,'','Rene','Sarabia','Macedo','','Contract and Estimation Officer','demo_nazario@gmail.com','09224445656',31,800);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configuration`
--

DROP TABLE IF EXISTS `system_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_configuration` (
  `sysconf_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sysconf_id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_system_configuration_company` (`company_id`),
  CONSTRAINT `FK_system_configuration_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configuration`
--

LOCK TABLES `system_configuration` WRITE;
/*!40000 ALTER TABLE `system_configuration` DISABLE KEYS */;
INSERT INTO `system_configuration` (`sysconf_id`, `name`, `value`, `company_id`) VALUES (2,'ROOT_INIT','1',NULL);
/*!40000 ALTER TABLE `system_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_users`
--

DROP TABLE IF EXISTS `system_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `super_admin` tinyint(1) NOT NULL DEFAULT '0',
  `company_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `company_admin` tinyint(1) NOT NULL DEFAULT '0',
  `login_attempts` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `FK_system_users_company` (`company_id`),
  KEY `FK_system_users_staff` (`staff_id`),
  CONSTRAINT `FK_system_users_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `FK_system_users_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_users`
--

LOCK TABLES `system_users` WRITE;
/*!40000 ALTER TABLE `system_users` DISABLE KEYS */;
INSERT INTO `system_users` (`user_id`, `username`, `password`, `super_admin`, `company_id`, `staff_id`, `company_admin`, `login_attempts`) VALUES (4,'root_098','f0f9e1a458bfa1d4c8484d60d448e479',1,NULL,NULL,0,0),(7,'root_razo','4ea0c7af86204653b9de606f66678ff7',1,NULL,156,0,0),(66,'gary_pina','cf157423dd6c284d2dcc6feea8cd70a8',0,29,310,0,0),(67,'jesse_cotto','5e3ff102773c6f36c38387f133fa5e69',0,29,307,0,0),(68,'peter_mateo','9ea8d4b8ad3f161b0887eb2594c2d709',0,29,317,1,0),(69,'andre_valadez','94d342cdce3278ea43023acf52373a0e',0,29,312,1,0),(70,'irving_lopes','2a6a13e0ee5ff194ac3c7cfc7a8cf833',0,29,304,0,0),(71,'wilburn_mitchell','54da8b7d32478993e26356a71b54458d',0,29,308,0,0),(72,'erin_gonzales','7ff105f2894363c16c02044d590e54b1',0,30,339,1,0),(73,'roosevelt_orosco','f38fe281e11ca8841beef6932c98d2a7',0,30,329,0,0),(74,'lane_aleman','89d7cc383d22f8de8dba8d9d90a309b3',0,30,334,0,0),(75,'charles_palomo','9efb56e22a22ddd8b168607046f306f8',0,30,328,0,0),(76,'cliff_zuniga','fab4045897e195a2d5411face0dde375',0,30,332,0,0),(77,'tobias_rolon','2f3d814baeaaef294362aa54e5b66049',0,30,336,1,0),(78,'mickey_medellin','475a821a3d3d24206ddb0325add7324c',0,31,377,0,0),(79,'maurice_arguello','ba7a2f546c57277a5a10b679c30169b9',0,31,357,1,0),(80,'rogelio_sauceda','22738429885bedaaef76fd98aa7cdbfe',0,31,373,0,0),(81,'ezra_encarnacion','9b8ed437975a81667293075d466727e2',0,31,360,1,0),(82,'sammie_lucero','9ff87aebed7f66db023b33e17e93f54f',0,31,371,0,0),(83,'rene_macedo','1977e216f57c746bf4c1a6d11973ded6',0,31,378,0,0);
/*!40000 ALTER TABLE `system_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date_start` date NOT NULL,
  `actual_date_start` date DEFAULT NULL,
  `duration` double NOT NULL DEFAULT '0',
  `actual_duration` double NOT NULL DEFAULT '0',
  `project_id` bigint(20) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK_tasks_project` (`project_id`),
  KEY `FK_tasks_company` (`company_id`),
  CONSTRAINT `FK_tasks_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `FK_tasks_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`task_id`, `title`, `content`, `date_start`, `actual_date_start`, `duration`, `actual_duration`, `project_id`, `status`, `company_id`) VALUES (91,'Site Works 1','Clearing, excavation, bedding, etc.','2015-10-01','2015-10-01',5,5,74,2,29),(92,'Reinforcing Steel Bars','Wall, columns, floor slab, beams, etc.','2015-10-01','2015-10-01',10,10,74,2,29),(93,'Signage','Installation of signages.','2015-10-01','2015-10-01',1,1,74,2,29),(94,'Formworks & Scaffoldings','Creation of forms and scaffolds','2015-10-05','2015-10-05',2,2,74,2,29),(95,'Concrete Works 1','Concrete-related tasks','2015-10-07','2015-10-07',4,4,74,2,29),(96,'Roofing Works','Installation of roof and related materials.','2015-10-11','2015-10-11',13,13,74,2,29),(97,'Site Works 2','Clearing, excavation, bedding, etc.','2015-10-12','2015-10-12',6,6,74,2,29),(98,'Metal Works','Metal-related tasks.','2015-10-17','2015-10-17',6,6,74,2,29),(99,'Plumbing Works','Plumbing tasks.','2015-10-23','2015-10-23',8,8,74,2,29),(100,'Tile Works','Tile tasks.','2015-10-23','2015-10-23',3,3,74,2,29),(101,'Masonry Works','CHB, plastering, etc.','2015-10-24','2015-10-24',8,6,74,2,29),(102,'Electrical Works','Electrical fixtures and wirings.','2015-10-26','2015-10-26',5,5,74,2,29),(103,'Concrete Works 2','Concrete-related tasks','2015-10-27','2015-10-27',3,3,74,2,29),(104,'Facilities / Amenities','Installation of facilities and amenities.','2015-10-30','2015-10-30',1,1,74,2,29),(105,'Painting Works','Painting and exterior.','2015-11-01','2015-11-01',5,3,74,2,29),(106,'Doors And Windows','Installation of doors and windows.','2015-11-07','2015-11-07',4,4,74,2,29),(107,'Site Works 1','Clearing, excavation, bedding, etc.','2015-10-01','2015-10-01',5,5,75,2,30),(108,'Reinforcing Steel Bars','Wall, columns, floor slab, beams, etc.','2015-10-01','2015-10-01',10,10,75,2,30),(109,'Signage','Installation of signages.','2015-10-01','2015-10-01',1,1,75,2,30),(110,'Formworks & Scaffoldings','Creation of forms and scaffolds','2015-10-05','2015-10-05',2,2,75,2,30),(111,'Concrete Works 1','Concrete-related tasks','2015-10-07','2015-10-07',4,4,75,2,30),(112,'Roofing Works','Installation of roof and related materials.','2015-10-11','2015-10-11',13,13,75,2,30),(113,'Site Works 2','Clearing, excavation, bedding, etc.','2015-10-12','2015-10-12',6,6,75,2,30),(114,'Metal Works','Metal-related tasks.','2015-10-17','2015-10-17',6,6,75,2,30),(115,'Plumbing Works','Plumbing tasks.','2015-10-23','2015-10-23',8,8,75,2,30),(116,'Tile Works','Tile tasks.','2015-10-23','2015-10-23',3,3,75,2,30),(117,'Masonry Works','CHB, plastering, etc.','2015-10-24','2015-10-24',8,6,75,2,30),(118,'Electrical Works','Electrical fixtures and wirings.','2015-10-26','2015-10-26',5,5,75,2,30),(119,'Concrete Works 2','Concrete-related tasks','2015-10-27','2015-10-27',3,3,75,2,30),(120,'Facilities / Amenities','Installation of facilities and amenities.','2015-10-30','2015-10-30',1,1,75,2,30),(121,'Painting Works','Painting and exterior.','2015-11-01','2015-11-01',5,3,75,2,30),(122,'Doors And Windows','Installation of doors and windows.','2015-11-07','2015-11-07',4,4,75,2,30),(123,'Site Works 1','Clearing, excavation, bedding, etc.','2015-10-01','2015-10-01',5,5,76,2,31),(124,'Reinforcing Steel Bars','Wall, columns, floor slab, beams, etc.','2015-10-01','2015-10-01',10,10,76,2,31),(125,'Signage','Installation of signages.','2015-10-01','2015-10-01',1,1,76,2,31),(126,'Formworks & Scaffoldings','Creation of forms and scaffolds','2015-10-05','2015-10-05',2,2,76,2,31),(127,'Concrete Works 1','Concrete-related tasks','2015-10-07','2015-10-07',4,4,76,2,31),(128,'Roofing Works','Installation of roof and related materials.','2015-10-11','2015-10-11',13,13,76,2,31),(129,'Site Works 2','Clearing, excavation, bedding, etc.','2015-10-12','2015-10-12',6,6,76,2,31),(130,'Metal Works','Metal-related tasks.','2015-10-17','2015-10-17',6,6,76,2,31),(131,'Plumbing Works','Plumbing tasks.','2015-10-23','2015-10-23',8,8,76,2,31),(132,'Tile Works','Tile tasks.','2015-10-23','2015-10-23',3,3,76,2,31),(133,'Masonry Works','CHB, plastering, etc.','2015-10-24','2015-10-24',8,6,76,2,31),(134,'Electrical Works','Electrical fixtures and wirings.','2015-10-26','2015-10-26',5,5,76,2,31),(135,'Concrete Works 2','Concrete-related tasks','2015-10-27','2015-10-27',3,3,76,2,31),(136,'Facilities / Amenities','Installation of facilities and amenities.','2015-10-30','2015-10-30',1,1,76,2,31),(137,'Painting Works','Painting and exterior.','2015-11-01','2015-11-01',5,3,76,2,31),(138,'Doors And Windows','Installation of doors and windows.','2015-11-07','2015-11-07',4,4,76,2,31);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-21 10:16:10
