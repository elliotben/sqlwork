CREATE DATABASE  IF NOT EXISTS `nba` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nba`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: nba
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `a_name` (`a_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (8,'Aaron Mintz'),(5,'Andy Miller'),(2,'Bill Duffy'),(9,'Dan Fegan'),(1,'Jeff Schwartz'),(4,'Leon Rose'),(3,'Mark Bartelstein'),(6,'Rich Paul'),(7,'Rob Pelinka'),(10,'Sam Goldefer');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agentsplayers`
--

DROP TABLE IF EXISTS `agentsplayers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentsplayers` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(45) DEFAULT NULL,
  `a_pid` int(11) NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `agents_fkpid` (`a_pid`),
  KEY `agents_fkaname` (`a_name`),
  CONSTRAINT `agents_fkaname` FOREIGN KEY (`a_name`) REFERENCES `agents` (`a_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `agents_fkpid` FOREIGN KEY (`a_pid`) REFERENCES `players` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentsplayers`
--

LOCK TABLES `agentsplayers` WRITE;
/*!40000 ALTER TABLE `agentsplayers` DISABLE KEYS */;
INSERT INTO `agentsplayers` VALUES (1,'Jeff Schwartz',109),(2,'Jeff Schwartz',193),(3,'Jeff Schwartz',100),(4,'Jeff Schwartz',142),(5,'Jeff Schwartz',177),(6,'Jeff Schwartz',148),(7,'Jeff Schwartz',126),(8,'Jeff Schwartz',46),(9,'Jeff Schwartz',15),(10,'Jeff Schwartz',174),(11,'Jeff Schwartz',13),(12,'Jeff Schwartz',167),(13,'Jeff Schwartz',67),(14,'Jeff Schwartz',117),(15,'Jeff Schwartz',180),(16,'Jeff Schwartz',158),(17,'Jeff Schwartz',35),(18,'Jeff Schwartz',78),(19,'Jeff Schwartz',97),(20,'Jeff Schwartz',150),(21,'Bill Duffy',39),(22,'Bill Duffy',183),(23,'Bill Duffy',87),(24,'Bill Duffy',8),(25,'Bill Duffy',207),(26,'Bill Duffy',139),(27,'Bill Duffy',189),(28,'Bill Duffy',7),(29,'Bill Duffy',55),(30,'Bill Duffy',199),(31,'Bill Duffy',115),(32,'Bill Duffy',220),(33,'Bill Duffy',4),(34,'Bill Duffy',181),(35,'Bill Duffy',191),(36,'Mark Bartelstein',211),(37,'Mark Bartelstein',62),(38,'Mark Bartelstein',146),(39,'Mark Bartelstein',116),(40,'Mark Bartelstein',80),(41,'Mark Bartelstein',218),(42,'Mark Bartelstein',176),(43,'Mark Bartelstein',223),(44,'Mark Bartelstein',186),(45,'Mark Bartelstein',59),(46,'Mark Bartelstein',84),(47,'Mark Bartelstein',144),(48,'Mark Bartelstein',6),(49,'Mark Bartelstein',77),(50,'Mark Bartelstein',41),(51,'Leon Rose',31),(52,'Leon Rose',73),(53,'Leon Rose',173),(54,'Leon Rose',217),(55,'Leon Rose',48),(56,'Leon Rose',118),(57,'Leon Rose',122),(58,'Leon Rose',14),(59,'Andy Miller',202),(60,'Andy Miller',65),(61,'Andy Miller',51),(62,'Andy Miller',132),(63,'Andy Miller',54),(64,'Andy Miller',40),(65,'Andy Miller',121),(66,'Andy Miller',133),(67,'Andy Miller',33),(68,'Andy Miller',175),(69,'Rich Paul',96),(70,'Rich Paul',225),(71,'Rich Paul',104),(72,'Rich Paul',64),(73,'Rich Paul',58),(74,'Rich Paul',108),(75,'Rob Pelinka',182),(76,'Rob Pelinka',1),(77,'Rob Pelinka',94),(78,'Rob Pelinka',194),(79,'Rob Pelinka',192),(80,'Aaron Mintz',125),(81,'Aaron Mintz',114),(82,'Aaron Mintz',70),(83,'Aaron Mintz',163),(84,'Aaron Mintz',205),(85,'Aaron Mintz',86),(86,'Dan Fegan',37),(87,'Dan Fegan',85),(88,'Dan Fegan',92),(89,'Sam Goldefer',15),(90,'Sam Goldefer',13),(91,'Sam Goldefer',167),(92,'Sam Goldefer',67),(93,'Sam Goldefer',180);
/*!40000 ALTER TABLE `agentsplayers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(45) NOT NULL,
  `d_conference` varchar(1) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'Atlantic','E'),(2,'Central','E'),(3,'Southeast','E'),(4,'Northwest','W'),(5,'Pacific','W'),(6,'Southwest','W');
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franchises`
--

DROP TABLE IF EXISTS `franchises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `franchises` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(128) NOT NULL,
  `f_arena` varchar(128) DEFAULT NULL,
  `f_city` varchar(45) DEFAULT NULL,
  `f_state` varchar(2) DEFAULT NULL,
  `f_did` int(11) NOT NULL,
  `cur_coach` varchar(64) DEFAULT NULL,
  `championships` int(11) DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `f_name` (`f_name`),
  KEY `franchises_fkdid` (`f_did`),
  CONSTRAINT `franchises_fkdid` FOREIGN KEY (`f_did`) REFERENCES `divisions` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franchises`
--

LOCK TABLES `franchises` WRITE;
/*!40000 ALTER TABLE `franchises` DISABLE KEYS */;
INSERT INTO `franchises` VALUES (1,'Boston Celtics','TD Garden','Boston','MA',1,'Brad Stevens',17),(2,'Brooklyn Nets','Barclays Center','New York','NY',1,'Kenny Atkinson',0),(3,'New York Knicks','Madison Square Garden','New York','NY',1,'Jeff Hornacek',2),(4,'Philadelphia 76ers','Wells Fargo Center','Philadelphia','PA',1,'Brett Brown',3),(5,'Toronto Raptors','Air Canada Centre','Toronto','ON',1,'Dwane Casey',0),(6,'Chicago Bulls','United Center','Chicago','IL',2,'Fred Hoiberg',6),(7,'Cleveland Cavaliers','Quicken Loans Arena','Cleveland','OH',2,'Tyronn Lue',1),(8,'Detroit Pistons','The Palace of Auburn Hills','Auburn Hills','MI',2,'Stan Van Gundy',3),(9,'Indiana Pacers','Bankers Life Fieldhouse','Indianapolis','IN',2,'Nate McMillan',0),(10,'Milwaukee Bucks','BMO Harris Bradley Center','Milwaukee','WI',2,'Jason Kidd',1),(11,'Atlanta Hawks','Philips Arena','Atlanta','GA',3,'Mike Budenholzer',1),(12,'Charlotte Hornets','Spectrum Center','Charlotte','NC',3,'Steve Clifford',0),(13,'Miami Heat','American Airlines Arena','Miami','FL',3,'Erik Spoelstra',3),(14,'Orlando Magic','Amway Center','Orlando','FL',3,'Frank Vogel',0),(15,'Washington Wizards','Verizon Center','Washington','DC',3,'Scott Brooks',1),(16,'Denver Nuggets','Pepsi Center','Denver','CO',4,'Michael Malone',0),(17,'Minnesota Timberwolves','Target Center','Minneapolis','MN',4,'Tom Thibodeau',0),(18,'Oklahoma City Thunder','Chesapeake Energy Arena','Oklahoma City','OK',4,'Billy Donovan',1),(19,'Portland Trail Blazers','Moda Center','Portland','OR',4,'Terry Stotts',1),(20,'Utah Jazz','Vivint Smart Home Arena','Salt Lake City','UT',4,'Quin Snyder',0),(21,'Golden State Warriors','Oracle Arena','Oakland','CA',5,'Steve Kerr',4),(22,'Los Angeles Clippers','Staples Center','Los Angeles','CA',5,'Doc Rivers',0),(23,'Los Angeles Lakers','Staples Center','Los Angeles','CA',5,'Luke Walton',16),(24,'Phoenix Suns','Talking Stick Resort Arena','Phoenix','AZ',5,'Earl Watson',0),(25,'Sacramento Kings','Golden 1 Center','Sacramento','CA',5,'Dave Joerger',0),(26,'Dallas Mavericks','American Airlines Center','Dallas','TX',6,'Rick Carlisle',1),(27,'Houston Rockets','Toyota Center','Houston','TX',6,'Mike D\'Antoni',2),(28,'Memphis Grizzlies','FedExForum','Memphis','TN',6,'David Fizdale',0),(29,'New Orleans Pelicans','Smoothie King Center','New Orleans','LA',6,'Alvin Gentry',0),(30,'San Antonio Spurs','AT&T Center','San Antonio','TX',6,'Gregg Popovich',5);
/*!40000 ALTER TABLE `franchises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerfranchiseseason`
--

DROP TABLE IF EXISTS `playerfranchiseseason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerfranchiseseason` (
  `pfs_pid` int(11) NOT NULL,
  `pfs_fid` int(11) NOT NULL,
  `pfs_starty` int(11) NOT NULL,
  KEY `pfs_fkpid` (`pfs_pid`),
  KEY `pfs_fkfid` (`pfs_fid`),
  KEY `pfs_fkstarty` (`pfs_starty`),
  CONSTRAINT `pfs_fkfid` FOREIGN KEY (`pfs_fid`) REFERENCES `franchises` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pfs_fkpid` FOREIGN KEY (`pfs_pid`) REFERENCES `players` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pfs_fkstarty` FOREIGN KEY (`pfs_starty`) REFERENCES `seasons` (`s_starty`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerfranchiseseason`
--

LOCK TABLES `playerfranchiseseason` WRITE;
/*!40000 ALTER TABLE `playerfranchiseseason` DISABLE KEYS */;
INSERT INTO `playerfranchiseseason` VALUES (89,13,2003),(89,13,2004),(89,13,2005),(89,13,2006),(89,13,2007),(89,13,2008),(89,13,2009),(89,13,2010),(89,13,2011),(89,13,2012),(89,13,2013),(89,13,2014),(89,13,2015),(96,7,2003),(96,7,2004),(96,7,2005),(96,7,2006),(96,7,2007),(96,7,2008),(96,7,2009),(96,13,2010),(96,13,2011),(96,13,2012),(96,13,2013),(96,7,2014),(96,7,2015),(31,16,2003),(31,16,2004),(31,16,2005),(31,16,2006),(31,16,2007),(31,16,2008),(31,16,2009),(31,16,2010),(31,3,2011),(31,3,2012),(31,3,2013),(31,3,2014),(31,3,2015),(182,5,2003),(182,5,2004),(182,5,2005),(182,5,2006),(182,5,2007),(182,5,2008),(182,5,2009),(182,13,2010),(182,13,2011),(182,13,2012),(182,13,2013),(182,13,2014),(182,13,2015),(155,14,2004),(155,14,2005),(155,14,2006),(155,14,2007),(155,14,2008),(155,14,2009),(155,14,2010),(155,14,2011),(155,23,2012),(155,27,2013),(155,27,2014),(155,27,2015);
/*!40000 ALTER TABLE `playerfranchiseseason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `p_fid` int(11) NOT NULL,
  `p_fname` varchar(45) NOT NULL,
  `p_lname` varchar(45) NOT NULL,
  `p_position` varchar(5) DEFAULT NULL,
  `p_jerseynb` int(11) DEFAULT NULL,
  `p_height` float DEFAULT NULL,
  `p_weight` float DEFAULT NULL,
  `p_dob` date DEFAULT NULL,
  `p_from` varchar(45) DEFAULT NULL,
  `p_all_stars` int(11) DEFAULT '0',
  `p_mvps` int(11) DEFAULT '0',
  `p_rings` int(11) DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `players_fkfid` (`p_fid`),
  CONSTRAINT `players_fkfid` FOREIGN KEY (`p_fid`) REFERENCES `franchises` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,1,'Avery','Bradley','G',0,1.88,82,'1990-11-26','Texas',0,0,0),(2,1,'Jaylen','Brown','G/F',7,2.01,102,'1996-10-24','UC Berkeley',0,0,0),(3,1,'Jae','Crowder','F',99,1.98,107,'1990-07-06','Marquette',0,0,0),(4,1,'Gerald','Green','G/F',30,2.01,93,'1986-01-26','Gulf Shores Academy HS (TX)',0,0,0),(5,1,'Al','Horford','F/C',42,2.08,111,'1986-06-03','Florida',4,0,0),(6,1,'Demetrius','Jackson','G',9,1.85,91,'1994-09-07','Notre Dame',0,0,0),(7,1,'Jonas','Jerebko','F',8,2.08,105,'1987-03-02','Sweden',0,0,0),(8,1,'Amir','Johnson','F/C',90,2.06,109,'1987-05-01','Westchester HS (CA)',0,0,0),(9,1,'Jordan','Mickey','F/C',55,2.03,107,'1994-07-09','LSU',0,0,0),(10,1,'Kelly','Olynyk','F/C',41,2.13,108,'1991-04-19','Gonzaga',0,0,0),(11,1,'Terry','Rozier','G',12,1.88,86,'1994-03-17','Louisville',0,0,0),(12,1,'Marcus','Smart','G',36,1.93,100,'1994-03-06','Oklahoma State',0,0,0),(13,1,'Isaiah','Thomas','G',4,1.75,84,'1989-02-07','Washington',1,0,0),(14,1,'James','Young','G/F',13,1.98,98,'1995-08-16','Kentucky',0,0,0),(15,1,'Tyler','Zeller','C',44,2.13,115,'1990-01-17','North Carolina',0,0,0),(16,2,'Anthony','Bennett','F',13,2.03,107,'1993-03-14','UNLV',0,0,0),(17,2,'Bojan','Bogdanovic','G/F',44,2.03,102,'1989-04-18','Croatia',0,0,0),(18,2,'Trevor','Booker','F',35,2.03,103,'1987-11-25','Clemson',0,0,0),(19,2,'Yogi','Ferrell','G',10,1.83,82,'1993-05-09','Indiana',0,0,0),(20,2,'Randy','Foye','G',2,1.93,99,'1983-09-24','Villanova',0,0,0),(21,2,'Justin','Hamilton','C',41,2.13,116,'1990-04-01','LSU',0,0,0),(22,2,'Joe','Harris','G',12,1.98,99,'1991-09-07','Virginia',0,0,0),(23,2,'Rondae','Hollis-Jefferson','F',24,2.01,97,'1995-01-03','Arizona',0,0,0),(24,2,'Sean','Kilpatric','G',6,1.93,99,'1990-01-06','Cincinnati',0,0,0),(25,2,'Caris','LeVert','G',22,2.01,92,'1994-08-25','Michigan',0,0,0),(26,2,'Jeremy','Lin','G',7,1.91,91,'1988-08-23','Harvard',0,0,0),(27,2,'Brook','Lopez','C',11,2.13,122,'1988-04-01','Stanford',3,0,0),(28,2,'Chris','McCullough','F',1,2.06,98,'1995-02-05','Syracuse',0,0,0),(29,2,'Luis','Scola','F',4,2.06,109,'1980-04-30','Argentina',0,0,0),(30,2,'Isaiah','Whitehead','G',15,1.96,97,'1995-03-08','Seton Hall',0,0,0),(31,3,'Carmelo','Anthony','F',7,2.03,109,'1984-05-29','Syracuse',9,0,0),(32,3,'Ron','Baker','G',31,1.93,100,'1993-03-30','Wichita State',0,0,0),(33,3,'Willy','Hernangomez','C',14,2.11,109,'1994-05-27','Spain',0,0,0),(34,3,'Justin','Holiday','G/F',8,1.98,84,'1989-04-05','Washington',0,0,1),(35,3,'Brandon','Jennings','G',3,1.85,77,'1989-09-23','Oak Hill Academy (VA)',0,0,0),(36,3,'Mindaugas','Kuzminskas','F',91,2.06,98,'1989-10-19','Lithuania',0,0,0),(37,3,'Courtney','Lee','G',5,1.96,91,'1985-10-03','Western Kentucky',0,0,0),(38,3,'Maurice','Ndour','F',2,2.06,91,'1992-06-18','Ohio',0,0,0),(39,3,'Joakim','Noah','C',13,2.11,104,'1985-02-25','Florida',2,0,0),(40,3,'Kyle','O\'Quinn','F/C',9,2.08,113,'1990-03-26','Norfolk State',0,0,0),(41,3,'Marshall','Plumlee','C',40,2.13,113,'1992-06-14','Duke',0,0,0),(42,3,'Kristaps','Porzingis','F/C',6,2.21,109,'1995-08-02','Latvia',0,0,0),(43,3,'Derrick','Rose','G',25,1.91,86,'1988-10-04','Memphis',3,1,0),(44,3,'Lance','Thomas','F',42,2.03,107,'1988-04-24','Duke',0,0,0),(45,3,'Sasha','Vujacic','G',18,2.01,88,'1984-03-08','Slovenia',0,0,2),(46,4,'Jerryd','Bayless','G',0,1.91,91,'1988-08-20','Arizona',0,0,0),(47,4,'Robert','Covington','F',33,2.06,98,'1990-12-14','Tennessee State',0,0,0),(48,4,'Joel','Embiid','C',21,2.13,113,'1994-03-16','Kansas',0,0,0),(49,4,'Gerald','Henderson','G',12,1.96,98,'1987-12-09','Duke',0,0,0),(50,4,'Richaun','Holmes','F',22,2.08,111,'1993-10-15','Bowling Green',0,0,0),(51,4,'Ersan','Ilyasova','F',7,2.08,107,'1987-05-15','Turkey',0,0,0),(52,4,'Timothe','Luwawu-Cabarrot','G/F',20,1.98,93,'1995-05-09','France',0,0,0),(53,4,'TJ','McConnell','G',1,1.88,91,'1992-03-25','Arizona',0,0,0),(54,4,'Nerlens','Noel','F/C',4,2.11,103,'1994-04-10','Kentucky',0,0,0),(55,4,'Jahlil','Okafor','C',8,2.11,125,'1995-12-15','Duke',0,0,0),(56,4,'Sergio','Rodriguez','G',14,1.91,80,'1986-06-12','Spain',0,0,0),(57,4,'Dario','Saric','F',9,2.08,101,'1994-04-08','Croatia',0,0,0),(58,4,'Ben','Simmons','F',25,2.08,109,'1996-07-20','LSU',0,0,0),(59,4,'Nik','Stauskas','G',11,1.98,93,'1993-10-07','Michigan',0,0,0),(60,4,'Hollis','Thompson','G/F',31,2.03,93,'1991-04-03','Georgetown',0,0,0),(61,5,'Bruno','Caboclo','F',20,2.06,93,'1995-09-21','Brazil',0,0,0),(62,5,'DeMarre','Carroll','F',5,2.03,96,'1986-07-27','Missouri',0,0,0),(63,5,'DeMar','DeRozan','G',10,2.01,100,'1989-08-07','Southern California',2,0,0),(64,5,'Cory','Joseph','G',6,1.91,86,'1991-08-20','Texas',0,0,1),(65,5,'Kyle','Lowry','G',7,1.83,93,'1986-03-25','Villanova',2,0,0),(66,5,'Lucas','Nogueira','C',92,2.13,100,'1992-07-26','Brazil',0,0,0),(67,5,'Patrick','Patterson','F/C',54,2.06,107,'1989-03-14','Kentucky',0,0,0),(68,5,'Jakob','Poltl','F/C',42,2.13,104,'1995-10-15','Utah',0,0,0),(69,5,'Norman','Powell','G',24,1.93,98,'1993-05-25','UCLA',0,0,0),(70,5,'Terrence','Ross','G/F',31,2.01,88,'1991-02-05','Washington',0,0,0),(71,5,'Pascal','Siakam','F',43,2.06,104,'1994-02-04','New Mexico State',0,0,0),(72,5,'Jared','Sullinger','F',0,2.06,118,'1992-03-04','Ohio State',0,0,0),(73,5,'Jonas','Valanciunas','C',17,2.13,116,'1992-05-06','Lithuania',0,0,0),(74,5,'Fred','VanVleet','G',23,1.83,88,'1994-02-25','Wichita State',0,0,0),(75,5,'Delon','Wright','G',55,1.96,86,'1992-04-26','Utah',0,0,0),(76,6,'Jimmy','Butler','G/F',21,2.01,105,'1989-09-14','Marquette',2,0,0),(77,6,'Isaiah','Canaan','G',0,1.83,91,'1991-05-21','Murray State',0,0,0),(78,6,'Michael','Carter-Williams','G',7,1.98,86,'1991-10-10','Syracuse',0,0,0),(79,6,'Cristiano','Felicio','C',6,2.06,121,'1992-07-07','CCSE Prep (CA)',0,0,0),(80,6,'Taj','Gibson','F',22,2.06,107,'1985-06-24','Southern California',0,0,0),(81,6,'Jerian','Grant','G',2,1.93,90,'1992-10-09','Notre Dame',0,0,0),(82,6,'RJ','Hunter','G',31,1.96,84,'1993-10-24','Georgia State',0,0,0),(83,6,'Robin','Lopez','C',8,2.13,116,'1988-04-01','Stanford',0,0,0),(84,6,'Doug','McDermott','F',11,2.03,99,'1992-01-03','Creighton',0,0,0),(85,6,'Nikola','Mirotic','F',44,2.08,108,'1991-02-11','Spain',0,0,0),(86,6,'Bobby','Portis','F',5,2.11,112,'1995-02-10','Arkansas',0,0,0),(87,6,'Rajon','Rondo','G',9,1.85,84,'1986-02-22','Kentucky',4,0,1),(88,6,'Denzel','Valentine','G',45,1.96,96,'1993-11-16','Michigan State',0,0,0),(89,6,'Dwyane','Wade','G',3,1.93,100,'1982-01-17','Marquette',12,0,3),(90,6,'Paul','Zipser','G/F',16,2.03,95,'1994-02-18','Germany',0,0,0),(91,7,'Chris','Andersen','F/C',0,2.08,111,'1978-07-07','Blinn',0,0,1),(92,7,'Mike','Dunleavy','G/F',3,2.06,104,'1980-09-25','Duke',0,0,0),(93,7,'Kay','Felder','G',20,1.75,80,'1995-03-29','Oakland',0,0,0),(94,7,'Channing','Frye','F/C',8,2.11,116,'1983-05-17','Arizona',0,0,1),(95,7,'Kyrie','Irving','G',2,1.91,88,'1992-03-23','Duke',3,0,1),(96,7,'LeBron','James','F',23,2.03,113,'1984-12-30','St. Vincent/St. Mary HS (OH)',12,4,3),(97,7,'Richard','Jefferson','F',24,2.01,106,'1980-06-21','Arizona',0,0,1),(98,7,'James','Jones','G/F',1,2.03,99,'1980-10-04','Miami (FL)',0,0,3),(99,7,'DeAndre','Liggins','G',14,1.98,95,'1988-03-31','Kentucky',3,0,1),(100,7,'Kevin','Love','F/C',0,2.08,114,'1988-09-07','UCLA',0,0,1),(101,7,'Jordan','McRae','G',12,1.96,81,'1991-03-28','Tennessee',0,0,1),(102,7,'Iman','Shumpert','G',4,1.96,100,'1990-06-26','Georgia Tech',0,0,1),(103,7,'JR','Smith','G',5,1.98,102,'1985-09-09','Saint Benedict\'s Preparatory (NJ)',0,0,1),(104,7,'Tristan','Thompson','F/C',13,2.06,108,'1991-03-13','Texas',0,0,1),(105,7,'Mo','Williams','G',52,1.85,90,'1982-12-19','Alabama',1,0,1),(106,8,'Aron','Baynes','F/C',12,2.08,118,'1986-12-09','Washington State',0,0,1),(107,8,'Reggie','Bullock','F',25,2.01,93,'1991-03-16','North Carolina',0,0,0),(108,8,'Kentavious','Caldwell-Pope','G',5,1.96,93,'1993-02-18','Georgia',0,0,0),(109,8,'Andre','Drummond','C',0,2.11,127,'1993-08-10','Connecticut',1,0,0),(110,8,'Henry','Ellenson','F',8,2.11,111,'1997-01-13','Marquette',0,0,0),(111,8,'Michael','Gbinije','G/F',9,2.01,91,'1992-06-05','Syracuse',0,0,0),(112,8,'Tobias','Harris','F',34,2.06,107,'1992-07-15','Tennessee',0,0,0),(113,8,'Darrun','Hilliard','G/F',6,1.98,93,'1993-04-13','Villanova',0,0,0),(114,8,'Reggie','Jackson','G',1,1.91,94,'1990-04-16','Boston C',0,0,0),(115,8,'Stanley','Johnson','F',7,2.01,111,'1996-05-29','Arizona',0,0,0),(116,8,'Jon','Leuer','F',30,2.08,103,'1989-05-14','Wisconsin',0,0,0),(117,8,'Boban','Marjanovic','C',51,2.21,132,'1988-08-15','Serbia',0,0,0),(118,8,'Marcus','Morris','F',13,2.06,107,'1989-09-02','Kansas',0,0,0),(119,8,'Ish','Smith','G',14,1.83,79,'1988-07-05','Wake Forest',0,0,0),(120,8,'Beno','Udrih','G',19,1.91,93,'1982-07-05','Slovenia',0,0,2),(121,9,'Lavoy','Allen','F',5,2.06,118,'1989-02-04','Temple',0,0,0),(122,9,'Aaron','Brooks','G',0,1.83,73,'1985-01-14','Oregon',0,0,0),(123,9,'Rakeem','Christmas','F',25,2.06,113,'1991-12-01','Syracuse',0,0,0),(124,9,'Monta','Ellis','G',11,1.91,84,'1985-10-26','Lanier HS (MS)',0,0,0),(125,9,'Paul','George','F',13,2.06,100,'1990-05-02','Fresno State',3,0,0),(126,9,'Al','Jefferson','C',7,2.08,131,'1985-01-04','Prentiss HS (MS)',0,0,0),(127,9,'CJ','Miles','G/F',0,1.98,102,'1987-03-18','Skyline HS (TX)',0,0,0),(128,9,'Georges','Niang','F',32,2.03,104,'1993-06-17','Iowa State',0,0,0),(129,9,'Glenn','Robinson','F',40,1.98,101,'1994-01-08','Michigan',0,0,0),(130,9,'Kevin','Seraphin','F/C',1,2.08,126,'1989-12-07','France',0,0,0),(131,9,'Rodney','Stuckey','G',2,1.96,93,'1986-04-21','Eastern Washington',0,0,0),(132,9,'Jeff','Teague','G',44,1.88,84,'1988-06-10','Wake Forest',1,0,0),(133,9,'Myles','Turner','C',33,2.11,110,'1996-03-24','Texas',0,0,0),(134,9,'Joseph','Young','G',3,1.88,82,'1992-06-27','Oregon',0,0,0),(135,9,'Thaddeus','Young','F',21,2.03,100,'1988-06-21','Georgia Tech',0,0,0),(136,10,'Giannis','Antetokounmpo','G/F',34,2.11,101,'1994-12-06','Greece',0,0,0),(137,10,'Michael','Beasley','F',9,2.08,107,'1989-01-09','Kansas State',0,0,0),(138,10,'Malcolm','Brogdon','G',13,1.96,98,'1992-12-11','Virginia',0,0,0),(139,10,'Matthew','Dellavedova','G',8,1.93,90,'1990-09-08','Saint Mary\'s',0,0,1),(140,10,'John','Henson','F/C',31,2.11,104,'1990-12-28','North Carolina',0,0,0),(141,10,'Thon','Maker','F/C',7,2.16,101,'1997-02-25','Orangeville Prep (CAN)',0,0,0),(142,10,'Khris','Middleton','G/F',22,2.03,106,'1991-08-12','Texas A&M',0,0,0),(143,10,'Greg','Monroe','F/C',15,2.11,120,'1990-06-04','Georgetown',0,0,0),(144,10,'Steve','Novak','F',6,2.08,102,'1983-06-13','Marquette',0,0,0),(145,10,'Jabari','Parker','F',12,2.03,113,'1995-03-15','Duke',0,0,0),(146,10,'Miles','Plumlee','F/C',18,2.11,113,'1988-09-01','Duke',0,0,0),(147,10,'Tony','Snell','G/F',21,2.01,98,'1991-11-10','New Mexico',0,0,0),(148,10,'Mirza','Teletovic','F',35,2.06,111,'1985-09-17','Bosnia and Herzegovina',0,0,0),(149,10,'Jason','Terry','G',3,1.88,84,'1977-09-15','Arizona',0,0,1),(150,10,'Rashad','Vaughn','G',20,1.98,92,'1996-08-16','UNLV',0,0,0),(151,11,'Kent','Bazemore','G/F',24,1.96,91,'1989-07-01','Old Dominion',0,0,0),(152,11,'DeAndre','Bembry','F',95,1.98,95,'1994-07-04','Saint Joseph\'s',0,0,0),(153,11,'Malcolm','Delaney','G',5,1.91,86,'1989-03-11','Virginia Tech',0,0,0),(154,11,'Tim','Hardaway','G',10,1.98,93,'1992-03-16','Michigan',0,0,0),(155,11,'Dwight','Howard','C',8,2.11,120,'1985-12-08','SW Atlanta Academy (GA)',8,0,0),(156,11,'Kris','Humphries','F/C',43,2.06,107,'1985-02-06','Minnesota',0,0,0),(157,11,'Ryan','Kelly','F',30,2.11,104,'1991-04-09','Duke',0,0,0),(158,11,'Kyle','Korver','G/F',26,2.01,96,'1981-03-17','Creighton',1,0,0),(159,11,'Paul','Millsap','F',4,2.03,112,'1985-02-10','Louisiana Tech',3,0,0),(160,11,'Mike','Muscala','F/C',31,2.11,109,'1991-07-01','Bucknell',0,0,0),(161,11,'Taurean','Prince','F',12,2.03,100,'1994-03-22','Baylor',0,0,0),(162,11,'Dennis','Schroder','G',17,1.85,78,'1993-09-15','Germany',0,0,0),(163,11,'Mike','Scott','F',32,2.03,108,'1988-07-16','Virginia',0,0,0),(164,11,'Thabo','Sefolosha','G/F',25,2.01,100,'1984-05-02','Switzerland',0,0,0),(165,11,'Tiago','Splitter','C',11,2.11,111,'1985-01-01','Brazil',0,0,1),(166,12,'Nicolas','Batum','G/F',5,2.03,91,'1988-12-14','France',0,0,0),(167,12,'Marco','Belinelli','G',21,1.96,95,'1986-03-25','Italy',0,0,1),(168,12,'Treveon','Graham','G/F',12,1.98,103,'1993-10-28','Virginia Commonwealth',0,0,0),(169,12,'Aaron','Harrison','G/F',9,1.98,95,'1994-10-28','Kentucky',0,0,0),(170,12,'Spencer','Hawes','F/C',0,2.16,111,'1988-04-28','Washington',0,0,0),(171,12,'Roy','Hibbert','C',55,2.18,122,'1986-12-11','Georgetown',2,0,0),(172,12,'Frank','Kaminsky','F/C',44,2.13,109,'1993-04-04','Wisconsin',0,0,0),(173,12,'Michael','Kidd-Gilchrist','F',14,2.01,105,'1993-09-26','Kentucky',0,0,0),(174,12,'Jeremy','Lamb','G',3,1.96,84,'1992-05-30','Connecticut',0,0,0),(175,12,'Brian','Roberts','G',22,1.85,78,'1985-12-03','Dayton',0,0,0),(176,12,'Ramon','Sessions','G',7,1.91,86,'1986-04-11','Nevada',0,0,0),(177,12,'Kemba','Walker','G',15,1.85,83,'1990-05-08','Connecticut',0,0,0),(178,12,'Marvin','Williams','F',2,2.06,108,'1986-06-19','North Carolina',0,0,0),(179,12,'Christian','Wood','F',35,2.11,100,'1995-09-27','UNLV',0,0,0),(180,12,'Cody','Zeller','F/C',40,2.13,109,'1992-10-05','Indiana',0,0,0),(181,13,'Luke','Babbitt','F',5,2.06,102,'1989-06-20','Nevada',0,0,0),(182,13,'Chris','Bosh','F/C',1,2.11,107,'1984-03-24','Georgia Tech',11,0,2),(183,13,'Goran','Dragic','G',7,1.91,86,'1986-05-06','Slovenia',0,0,0),(184,13,'Wayne','Ellington','G',2,1.93,91,'1987-11-29','North Carolina',0,0,0),(185,13,'Udonis','Haslem','F/C',40,2.03,107,'1980-06-09','Florida',0,0,3),(186,13,'James','Johnson','F',16,2.06,113,'1987-02-20','Wake Forest',0,0,0),(187,13,'Tyler','Johnson','G',8,1.93,84,'1992-05-07','Fresno State',0,0,0),(188,13,'Rodney','McGruder','G',17,1.93,93,'1991-07-29','Kansas State',0,0,0),(189,13,'Josh','McRoberts','F',4,2.08,109,'1987-02-28','Duke',0,0,0),(190,13,'Willie','Reed','F/C',35,2.08,100,'1990-05-16','Saint Louis',0,0,0),(191,13,'Josh','Richardson','G',0,1.98,91,'1993-09-15','Tennessee',0,0,0),(192,13,'Dion','Waiters','G',11,1.93,100,'1991-12-10','Syracuse',0,0,0),(193,13,'Hassan','Whiteside','C',21,2.13,120,'1989-06-13','Marshall',0,0,0),(194,13,'Derrick','Williams','F',22,2.03,109,'1991-05-25','Arizona',0,0,0),(195,13,'Justise','Winslow','G/F',20,2.01,102,'1996-03-26','Duke',0,0,0),(196,14,'DJ','Augustin','G',14,1.83,83,'1987-11-10','Texas',0,0,0),(197,14,'Bismack','Biyombo','C',11,2.06,116,'1992-08-28','DR Congo',0,0,0),(198,14,'Evan','Fournier','G',10,2.01,93,'1992-10-29','France',0,0,0),(199,14,'Aaron','Gordon','F',0,2.06,100,'1995-09-16','Arizona',0,0,0),(200,14,'Jeff','Green','F',34,2.06,107,'1986-08-28','Georgetown',0,0,0),(201,14,'Mario','Hezonja','G/F',8,2.03,99,'1995-02-25','Croatia',0,0,0),(202,14,'Serge','Ibaka','F',7,2.08,107,'1989-09-18','Spain',0,0,0),(203,14,'Jodie','Meeks','G',20,1.93,95,'1987-08-21','Kentucky',0,0,0),(204,14,'Arinze','Onuaku','C',21,2.06,116,'1987-07-13','Syracuse',0,0,0),(205,14,'Elfrid','Payton','G',4,1.93,84,'1994-02-22','Louisiana/Lafayette',0,0,0),(206,14,'Damjan','Rudez','F',3,2.08,103,'1986-06-17','Croatia',0,0,0),(207,14,'Nikola','Vucevic','C',9,2.13,118,'1990-10-24','Southern California',0,0,0),(208,14,'CJ','Watson','G',32,1.88,79,'1984-04-17','Tennessee',0,0,0),(209,14,'CJ','Wilcox','G',23,1.96,88,'1990-12-30','Washington',0,0,0),(210,14,'Stephen','Zimmerman','C',33,2.13,109,'1996-09-09','UNLV',0,0,0),(211,15,'Bradley','Beal','G',3,1.96,94,'1993-06-28','Florida',0,0,0),(212,15,'Trey','Burke','G',33,1.85,87,'1992-11-12','Michigan',0,0,0),(213,15,'Marcin','Gortat','C',13,2.11,109,'1984-02-17','Poland',0,0,0),(214,15,'Danuel','House','G',4,2.01,98,'1993-06-07','Texas A&M',0,0,0),(215,15,'Ian','Mahinmi','C',28,2.11,119,'1986-11-05','France',0,0,1),(216,15,'Sheldon','McClellan','G',9,1.98,91,'1992-12-21','Miami (FL)',0,0,0),(217,15,'Markieff','Morris','F',5,2.08,111,'1989-09-02','Kansas',0,0,0),(218,15,'Andrew','Nicholson','F',44,2.06,113,'1989-12-08','St. Bonaventure',0,0,0),(219,15,'Daniel','Ochefu','F',32,2.11,111,'1993-12-15','Villanova',0,0,0),(220,15,'Kelly','Oubre','G/F',12,2.01,93,'1995-12-09','Kansas',0,0,0),(221,15,'Otto','Porter','F',22,2.03,90,'1993-06-03','Georgetown',0,0,0),(222,15,'Tomas','Satoransky','G',31,2.01,95,'1991-10-30','Czech Republic',0,0,0),(223,15,'Jason','Smith','F/C',14,2.13,109,'1986-03-02','Colorado State',0,0,0),(224,15,'Marcus','Thornton','G',15,1.93,93,'1987-06-05','LSU',0,0,0),(225,15,'John','Wall','G',2,1.93,95,'1990-09-06','Kentucky',3,0,0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `s_starty` int(11) NOT NULL,
  `s_endy` int(11) NOT NULL,
  `s_top_seed` varchar(128) DEFAULT NULL,
  `s_east_champ` varchar(128) DEFAULT NULL,
  `s_west_champ` varchar(128) DEFAULT NULL,
  `s_champ` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`s_starty`),
  KEY `seasons_fkechamp` (`s_east_champ`),
  KEY `seasons_fkwchamp` (`s_west_champ`),
  KEY `seasons_fkchamp` (`s_champ`),
  CONSTRAINT `seasons_fkchamp` FOREIGN KEY (`s_champ`) REFERENCES `franchises` (`f_name`),
  CONSTRAINT `seasons_fkechamp` FOREIGN KEY (`s_east_champ`) REFERENCES `franchises` (`f_name`),
  CONSTRAINT `seasons_fkwchamp` FOREIGN KEY (`s_west_champ`) REFERENCES `franchises` (`f_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1956,1957,'Boston Celtics','Boston Celtics','Atlanta Hawks','Boston Celtics'),(1957,1958,'Boston Celtics','Boston Celtics','Atlanta Hawks','Atlanta Hawks'),(1958,1959,'Boston Celtics','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(1959,1960,'Boston Celtics','Boston Celtics','Atlanta Hawks','Boston Celtics'),(1960,1961,'Boston Celtics','Boston Celtics','Atlanta Hawks','Boston Celtics'),(1961,1962,'Boston Celtics','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(1962,1963,'Boston Celtics','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(1963,1964,'Boston Celtics','Boston Celtics','Golden State Warriors','Boston Celtics'),(1964,1965,'Boston Celtics','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(1965,1966,'Philadelphia 76ers','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(1966,1967,'Philadelphia 76ers','Philadelphia 76ers','Golden State Warriors','Philadelphia 76ers'),(1967,1968,'Philadelphia 76ers','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(1968,1969,'Washington Wizards','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(1969,1970,'New York Knicks','New York Knicks','Los Angeles Lakers','New York Knicks'),(1970,1971,'Milwaukee Bucks','Washington Wizards','Milwaukee Bucks','Milwaukee Bucks'),(1971,1972,'Los Angeles Lakers','New York Knicks','Los Angeles Lakers','Los Angeles Lakers'),(1972,1973,'Boston Celtics','New York Knicks','Los Angeles Lakers','New York Knicks'),(1973,1974,'Milwaukee Bucks','Boston Celtics','Milwaukee Bucks','Boston Celtics'),(1974,1975,'Boston Celtics','Washington Wizards','Golden State Warriors','Golden State Warriors'),(1975,1976,'Golden State Warriors','Boston Celtics','Phoenix Suns','Boston Celtics'),(1976,1977,'Los Angeles Lakers','Philadelphia 76ers','Portland Trail Blazers','Portland Trail Blazers'),(1977,1978,'Portland Trail Blazers','Washington Wizards','Oklahoma City Thunder','Washington Wizards'),(1978,1979,'Washington Wizards','Washington Wizards','Oklahoma City Thunder','Oklahoma City Thunder'),(1979,1980,'Boston Celtics','Philadelphia 76ers','Los Angeles Lakers','Los Angeles Lakers'),(1980,1981,'Boston Celtics','Boston Celtics','Houston Rockets','Boston Celtics'),(1981,1982,'Boston Celtics','Philadelphia 76ers','Los Angeles Lakers','Los Angeles Lakers'),(1982,1983,'Philadelphia 76ers','Philadelphia 76ers','Los Angeles Lakers','Philadelphia 76ers'),(1983,1984,'Boston Celtics','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(1984,1985,'Boston Celtics','Boston Celtics','Los Angeles Lakers','Los Angeles Lakers'),(1985,1986,'Boston Celtics','Boston Celtics','Houston Rockets','Boston Celtics'),(1986,1987,'Los Angeles Lakers','Boston Celtics','Los Angeles Lakers','Los Angeles Lakers'),(1987,1988,'Los Angeles Lakers','Detroit Pistons','Los Angeles Lakers','Los Angeles Lakers'),(1988,1989,'Detroit Pistons','Detroit Pistons','Los Angeles Lakers','Detroit Pistons'),(1989,1990,'Los Angeles Lakers','Detroit Pistons','Portland Trail Blazers','Detroit Pistons'),(1990,1991,'Portland Trail Blazers','Chicago Bulls','Los Angeles Lakers','Chicago Bulls'),(1991,1992,'Chicago Bulls','Chicago Bulls','Portland Trail Blazers','Chicago Bulls'),(1992,1993,'Phoenix Suns','Chicago Bulls','Phoenix Suns','Chicago Bulls'),(1993,1994,'Oklahoma City Thunder','New York Knicks','Houston Rockets','Houston Rockets'),(1994,1995,'San Antonio Spurs','Orlando Magic','Houston Rockets','Houston Rockets'),(1995,1996,'Chicago Bulls','Chicago Bulls','Oklahoma City Thunder','Chicago Bulls'),(1996,1997,'Chicago Bulls','Chicago Bulls','Utah Jazz','Chicago Bulls'),(1997,1998,'Utah Jazz','Chicago Bulls','Utah Jazz','Chicago Bulls'),(1998,1999,'San Antonio Spurs','New York Knicks','San Antonio Spurs','San Antonio Spurs'),(1999,2000,'Los Angeles Lakers','Indiana Pacers','Los Angeles Lakers','Los Angeles Lakers'),(2000,2001,'San Antonio Spurs','Philadelphia 76ers','Los Angeles Lakers','Los Angeles Lakers'),(2001,2002,'Sacramento Kings','Brooklyn Nets','Los Angeles Lakers','Los Angeles Lakers'),(2002,2003,'San Antonio Spurs','Brooklyn Nets','San Antonio Spurs','San Antonio Spurs'),(2003,2004,'Indiana Pacers','Detroit Pistons','Los Angeles Lakers','Detroit Pistons'),(2004,2005,'Phoenix Suns','Detroit Pistons','San Antonio Spurs','San Antonio Spurs'),(2005,2006,'Detroit Pistons','Miami Heat','Dallas Mavericks','Miami Heat'),(2006,2007,'Dallas Mavericks','Cleveland Cavaliers','San Antonio Spurs','San Antonio Spurs'),(2007,2008,'Boston Celtics','Boston Celtics','Los Angeles Lakers','Boston Celtics'),(2008,2009,'Cleveland Cavaliers','Orlando Magic','Los Angeles Lakers','Los Angeles Lakers'),(2009,2010,'Cleveland Cavaliers','Boston Celtics','Los Angeles Lakers','Los Angeles Lakers'),(2010,2011,'Chicago Bulls','Miami Heat','Dallas Mavericks','Dallas Mavericks'),(2011,2012,'Chicago Bulls','Miami Heat','Oklahoma City Thunder','Miami Heat'),(2012,2013,'Miami Heat','Miami Heat','San Antonio Spurs','Miami Heat'),(2013,2014,'San Antonio Spurs','Miami Heat','San Antonio Spurs','San Antonio Spurs'),(2014,2015,'Golden State Warriors','Cleveland Cavaliers','Golden State Warriors','Golden State Warriors'),(2015,2016,'Golden State Warriors','Cleveland Cavaliers','Golden State Warriors','Cleveland Cavaliers');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'nba'
--
/*!50003 DROP FUNCTION IF EXISTS `add_to_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_to_record`(
record_param VARCHAR(45),
p_fname_param 	VARCHAR(45),
p_lname_param 	VARCHAR(45)
) RETURNS int(11)
BEGIN
	DECLARE record_var INT;
    SET record_var = -9999;

	SELECT record_param into record_var
	FROM nba.players
	WHERE name_pid(p_fname_param, p_lname_param)=pid;
    
    RETURN(record_var);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fid_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fid_name`(
fid_param INT
) RETURNS varchar(128) CHARSET latin1
BEGIN
	DECLARE name_var VARCHAR(128);
    SET name_var = '';

	SELECT f_name into name_var
	FROM nba.franchises
	WHERE fid_param = fid;
    
    RETURN(name_var);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_allstars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_allstars`(
p_fname_param 	VARCHAR(45),
p_lname_param 	VARCHAR(45)
) RETURNS int(11)
BEGIN
	DECLARE record_var INT;
    SET record_var = -9999;

	SELECT p_all_stars into record_var
	FROM nba.players
	WHERE name_pid(p_fname_param, p_lname_param)=pid;
    
    RETURN(record_var);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_championships` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_championships`(
fname_param 	VARCHAR(128)
) RETURNS int(11)
BEGIN
	DECLARE champ_var INT;
    SET champ_var = -9999;

	SELECT championships into champ_var
	FROM nba.franchises
	WHERE name_fid(fname_param)=fid;
    
    RETURN(champ_var);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_mvps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_mvps`(
p_fname_param 	VARCHAR(45),
p_lname_param 	VARCHAR(45)
) RETURNS int(11)
BEGIN
	DECLARE record_var INT;
    SET record_var = -9999;

	SELECT p_mvps into record_var
	FROM nba.players
	WHERE name_pid(p_fname_param, p_lname_param)=pid;
    
    RETURN(record_var);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_rings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_rings`(
p_fname_param 	VARCHAR(45),
p_lname_param 	VARCHAR(45)
) RETURNS int(11)
BEGIN
	DECLARE record_var INT;
    SET record_var = -9999;

	SELECT p_rings into record_var
	FROM nba.players
	WHERE name_pid(p_fname_param, p_lname_param)=pid;
    
    RETURN(record_var);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `name_fid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `name_fid`(
name_param VARCHAR(128)
) RETURNS int(11)
BEGIN
	DECLARE fid_var INT;
    SET fid_var = -9999;

	SELECT fid into fid_var
	FROM nba.franchises
	WHERE name_param = f_name;
    
    RETURN(fid_var);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `name_pid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `name_pid`(
fname_param VARCHAR(45),
lname_param VARCHAR(45)
) RETURNS int(11)
BEGIN
	DECLARE pid_var INT;
    SET pid_var = -9999;

	SELECT pid into pid_var
	FROM nba.players
	WHERE fname_param = p_fname AND lname_param = p_lname;
    
    RETURN(pid_var);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_agent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_agent`(
IN a_name_param			VARCHAR(128)
)
BEGIN 

	INSERT INTO nba.agents (a_name)
    VALUES (a_name_param);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_agentsplayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_agentsplayers`(
IN a_name_param			VARCHAR(45),
IN p_fname				VARCHAR(45),
IN p_lname				VARCHAR(45)
)
BEGIN 

	INSERT INTO nba.agentsplayers (a_name, a_pid)
    VALUES (a_name_param, name_pid(p_fname, p_lname));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_allstar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_allstar`(
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
)
BEGIN 

	UPDATE players
	SET p_all_stars=get_allstars(p_fname_param, p_lname_param) + 1
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_champ` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_champ`(
IN fname_param 	VARCHAR(128)
)
BEGIN 

	UPDATE franchises
	SET championships=get_championships(fname_param) + 1
	WHERE name_fid(fname_param)=fid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_franchise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_franchise`(
IN f_name_param			VARCHAR(128),
IN f_arena_param		 	VARCHAR(128),
IN f_city_param	 		VARCHAR(45),
IN f_state_param	 		VARCHAR(2),
IN f_did_param			INT,
IN coach_param			VARCHAR(64)
)
BEGIN 

	INSERT INTO nba.franchises (f_name, f_arena, f_city, f_state, f_did, cur_coach)
    VALUES (f_name_param, f_arena_param, f_city_param, f_state_param, f_did_param,
    coach_param);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_mvp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_mvp`(
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
)
BEGIN 

	UPDATE players
	SET p_mvps=get_mvps(p_fname_param, p_lname_param) + 1
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_player` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_player`(
IN franchise_name_param 	VARCHAR(128),
IN p_fname_param 			VARCHAR(45),
IN p_lname_param 			VARCHAR(45),
IN p_position_param 		VARCHAR(5),
IN p_jerseynb_param			INT,
IN p_height_param			FLOAT, #in meters
IN p_weight_param			FLOAT, #in kg
IN p_dob_param				DATE,
IN p_from_param 			VARCHAR(45), #college if in the US, country if not
IN p_all_stars_param		INT,
IN p_mvps_param				INT,
IN p_rings_param			INT
)
BEGIN 

	INSERT INTO nba.players (p_fid, p_fname, p_lname, p_position, p_jerseynb, p_height,
    p_weight, p_dob, p_from, p_all_stars, p_mvps, p_rings)
    VALUES (name_fid(franchise_name_param), p_fname_param, p_lname_param, 
    p_position_param, p_jerseynb_param, p_height_param, p_weight_param, 
    p_dob_param, p_from_param, p_all_stars_param, p_mvps_param, p_rings_param);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_ring` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_ring`(
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
)
BEGIN 

	UPDATE players
	SET p_rings=get_rings(p_fname_param, p_lname_param) + 1
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `drop_playerofagent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `drop_playerofagent`(
IN a_name_param			VARCHAR(45),
IN p_fname				VARCHAR(45),
IN p_lname				VARCHAR(45)
)
BEGIN 

	DELETE FROM agentsplayers
	WHERE name_pid(p_fname, p_lname)=a_pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modify_agentofplayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_agentofplayer`(
IN a_name_param			VARCHAR(45),
IN p_fname				VARCHAR(45),
IN p_lname				VARCHAR(45)
)
BEGIN 

	UPDATE agentsplayers
    SET a_name=a_name_param
	WHERE name_pid(p_fname, p_lname)=a_pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modify_arena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_arena`(
IN f_arena_param 		VARCHAR(128),
IN f_name_param 		VARCHAR(128)
)
BEGIN 

	UPDATE franchises
    SET f_arena=f_arena_param
	WHERE name_fid(f_name_param)=fid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modify_coach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_coach`(
IN f_coach_param 		VARCHAR(128),
IN f_name_param 		VARCHAR(128)
)
BEGIN 

	UPDATE franchises
    SET cur_coach=f_coach_param
	WHERE name_fid(f_name_param)=fid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modify_jerseynb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_jerseynb`(
IN jerseynb_param 	VARCHAR(5),
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
)
BEGIN 

	UPDATE players
	SET p_jerseynb=jerseynb_param
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modify_position` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_position`(
IN position_param 	VARCHAR(5),
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
)
BEGIN 

	UPDATE players
	SET p_position=position_param
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modify_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_team`(
IN fname_param 		VARCHAR(128),
IN p_fname_param 	VARCHAR(45),
IN p_lname_param 	VARCHAR(45)
)
BEGIN 

	UPDATE players
	SET p_fid=name_fid(fname_param)
	WHERE name_pid(p_fname_param, p_lname_param)=pid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-07 19:26:07
