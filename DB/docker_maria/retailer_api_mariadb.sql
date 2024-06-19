-- MariaDB dump 10.19-11.3.2-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: retailer_api
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB-1:11.3.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE retailer_api;

--
-- Table structure for table `retailers`
--

DROP TABLE IF EXISTS `retailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailers` (
  `id` int(11) DEFAULT NULL,
  `GSTIN` varchar(50) DEFAULT NULL,
  `Business_name` varchar(50) DEFAULT NULL,
  `Contact_person` varchar(50) DEFAULT NULL,
  `Contact_number` int(11) DEFAULT NULL,
  `Contact_address` varchar(64) DEFAULT NULL,
  `Contact_emailId` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Outlet_limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
-- CREATE INDEX retailers_id_idx ON retailers (id);
-- CREATE INDEX retailers_id_Business_name ON retailers (Business_name);
-- CREATE INDEX retailers_id_Contact_person ON retailers (Contact_person);
CREATE UNIQUE INDEX retailers_id_Contact_emailId ON retailers (Contact_emailId);

--
-- Dumping data for table `retailers`
--

LOCK TABLES `retailers` WRITE;
/*!40000 ALTER TABLE `retailers` DISABLE KEYS */;
INSERT INTO `retailers` VALUES
(1,'u7iZhX6bWwQosJM','Aaron Haney','Daniel Gillespie',27355,'912 Kathy Rest Apt. 281\nWigginstown, AZ 25488','orivera@yahoo.com','active',3),
(2,'TUHVNryQBJvghhg','Jackie Rocha','Madeline Jones',88854,'11721 Kylie Common Suite 069\nDonaldberg, AK 61656','haroldhoffman@hopkins.info','active',5),
(3,'EkBD7mZB6OuZudV','Breanna Barrett','Daniel Clements',60000,'227 Brandt Mission\nPort Daniel, MA 97234','davisashley@cunningham-watson.com','active',5),
(4,'p6PzHJnfTpHAYSr','Linda Miller','Reginald Becker',16929,'USNV Valdez\nFPO AA 84448','brandivillegas@patterson.com','inactive',9),
(5,'uE6Glosu57SaWzw','Robert Sutton','Pamela Schultz',46409,'553 Hill Spurs\nWileyburgh, CT 06101','yorozco@austin.com','active',6),
(6,'avEXpd3oJJ85TEz','Eric Gillespie','Jessica Price',57273,'679 Jennifer Field\nLake Kristen, FL 54965','melissa45@smith-cook.com','active',5),
(7,'XHFpNd55Bl64z5F','Karen Richardson','Elizabeth Steele',85350,'5648 Ann Mall Apt. 262\nEricaport, CO 73362','rogerfox@yahoo.com','active',5),
(8,'gtjxQQGI6tFkhMB','David Burns','Angela Simmons',29676,'68453 West Way\nNew Lisa, CA 59018','garciaandrea@stone.com','active',3),
(9,'6NOEgZUbW6jNKmx','Jamie Grant','Gary Rice',57656,'PSC 5713, Box 4161\nAPO AE 87942','jwatts@gmail.com','inactive',4),
(10,'6CFlHEvrl9ZgEdU','Ashley Dyer','Emily Bentley',35997,'4161 Hines Camp\nMarkland, TN 73166','penningtondenise@yahoo.com','active',6),
(11,'dvYbm5Mzqt4ohtr','Catherine Bell','Paul Daniels',36997,'507 Sims Grove Suite 190\nMarksside, MA 24425','allenjoshua@yahoo.com','active',2),
(12,'na8t20qmgrgWr7S','Brandon Black','Sonya Pierce',55072,'USS Henry\nFPO AP 89982','ryan76@gmail.com','active',7),
(13,'H9fFIUgiKCuqXPz','Carlos Mckee','Eric Alvarez',52362,'64989 Christopher Isle Apt. 593\nBrianfort, AL 57769','emilywilson@adams.com','active',8),
(14,'BprlCQydUniTP5C','Jamie Martin','David Reid',4731,'027 Butler Canyon Suite 406\nSouth Heatherfurt, UT 38368','hortoncassandra@lopez.com','inactive',8),
(15,'TWd5Ikcg0XuvJb0','Patricia Curtis','Marie Banks',85880,'475 Peterson Roads\nWest Todd, NY 90078','kellydaniel@robertson.com','inactive',2),
(16,'OAbIU4q0AerPdFk','Susan Bowers','Peter Griffin',57322,'746 Chapman Extension Suite 416\nLake Kenneth, NV 12782','andrewvelasquez@gmail.com','active',10),
(17,'6Kr9O8YAI5o94mP','Dalton Gray','Stacy Williams MD',57827,'7342 Gary Mills\nWest Vincent, IN 97325','kristingarcia@gmail.com','inactive',3),
(18,'fMlu6Y0tt7rVPFE','Jennifer Rodriguez','Hailey Reed',75794,'6011 Donna Meadows Apt. 286\nLake Robert, OK 37149','hreyes@hotmail.com','active',7),
(19,'zxxLLDTIyl6yGe9','Mr. Thomas Vasquez','Christina Lawrence',2713,'04918 Taylor Shore Suite 383\nLake Elizabethhaven, PA 97737','matthewarmstrong@hopkins.info','active',6),
(20,'1xbqOaIMRa37tVE','Leah Green','Melissa Johnson',66409,'1309 Bennett Cove\nNorth Robert, CT 69456','shawn76@hotmail.com','inactive',6),
(21,'h8J0zO46XY9SEpA','David Sullivan','Michael Lawson',91807,'748 Ellis Plains\nThomaston, UT 69785','heather91@jones-sanchez.net','active',10),
(22,'5OxXxQjSzTFzAAp','Caitlin Carter','Lawrence Silva',90070,'416 Randall Crescent\nEast Christopher, WY 67447','melanie10@fisher.com','active',10),
(23,'gvgUGEb64FRMxzM','Barbara Horton','Charles Farmer',84890,'067 Jennifer Ferry Apt. 566\nEast Lisamouth, KY 13257','isaiahfleming@miller.com','active',8),
(24,'RSbrJVrQUOGprjT','Casey Calderon','Kimberly Garcia',48216,'94900 Carr Rue Suite 928\nMarybury, CO 87518','michaelhunt@wallace.com','active',10),
(25,'tqbj4vH7zsSRRNL','Katherine Reilly','Nicole Pierce',5279,'398 Douglas Ferry Suite 385\nVasquezland, SC 00579','shawn09@white.info','active',2),
(26,'AWgP2adz7VFoe1w','Charles Lyons','Rachel Clements',65022,'4920 Hall Alley\nStevenfurt, IL 25657','danielgordon@hotmail.com','inactive',4),
(27,'QxmwYdB1ZHxUrxG','Brett Wilson','Danny Williams',98473,'822 Ayala Corner\nNew William, MI 95726','laurie36@ortiz.com','inactive',8),
(28,'rhUfqVQ46Y0HVl5','Mark Henderson','Chloe Moss',46212,'7300 Chen Glens\nWest John, CT 72664','kathleenmcbride@warren-johnson.net','active',6),
(29,'umqYs9dayIzfq7H','Arthur West','Grace Hansen',72810,'6358 Jackson Curve\nNorth William, SD 12855','ariasjoseph@porter.com','active',5),
(30,'YayHo349ZwQ05BY','Charles Fitzpatrick','Jerome Brooks',10574,'71158 James Forest Apt. 826\nSouth Regina, PA 05084','ytorres@hotmail.com','active',5),
(31,'wKKQNFiepHwd2pY','Pamela Dickerson','Melissa Turner',38907,'Unit 8230 Box 6506\nDPO AE 13515','marshallphillip@brown.com','active',7),
(32,'v5juaX4DZPnXyK9','Adrienne Salas','Cody Richardson',46986,'573 Brian Orchard\nLake David, FL 39359','gibsonjordan@rodriguez-campbell.net','active',4),
(33,'AP90W6ZRXOqRV3r','Amanda Garcia','Donna Schneider',41872,'268 Mills Course\nTorresmouth, KS 12966','gbeasley@roach.com','inactive',3),
(34,'JmJuQrPaviophz1','Ethan Wright','Ronald Lawrence',20255,'Unit 2521 Box 8794\nDPO AP 67586','kellyeverett@yahoo.com','active',5),
(35,'B5Zyrtu0Pt3E8mt','Beth Robinson','Thomas Thompson',12513,'Unit 8420 Box 0055\nDPO AP 59793','awilliamson@freeman.com','inactive',7),
(36,'DOQMG5J9fdxp9JR','Christine Walsh','Nancy Riggs',213,'690 Underwood Crossing\nBrittanyview, KY 61690','malik00@gmail.com','inactive',4),
(37,'a4og67N3HmaIc63','Dr. Troy Mcbride MD','Juan Pierce',12472,'1367 William Camp\nNew Julia, VT 74986','amanda95@gmail.com','inactive',7),
(38,'TBhDHjyVmCSFBkc','Matthew Scott','Kimberly Martinez',45803,'328 Kevin Gardens Apt. 654\nLake Anna, NV 26042','oliverzachary@hall.com','inactive',9),
(39,'MBJU6EiWbHnKMFE','Michael Yoder','Kimberly Martin',63294,'204 Sanchez Stravenue\nStephensonport, NJ 77757','freemanhunter@kim-howard.biz','inactive',10),
(40,'OMNnZnrk5QhNm2B','Michelle Lewis','Chelsea Hudson',95593,'60257 Mario Ports Suite 315\nLake Brian, KS 17086','thomas52@yahoo.com','active',5),
(41,'LqsjJOiiPCzzRiT','Elizabeth Rogers','Tammy Clay',60019,'1754 Little Mission Suite 655\nJeannestad, NV 17599','allenmichael@buck-davis.com','inactive',3),
(42,'Fh3xaLTlvxqPMKw','Ashley Donovan','Jordan Silva',59153,'5672 Whitaker Fork\nMichaelborough, WY 75951','danielwarner@gmail.com','active',2),
(43,'BXbBfeSPW1NyVRp','Jacqueline Ellison','Scott Knight',12450,'3204 Sloan Parkway\nDavidside, TN 25306','michael70@norris-hill.net','inactive',4),
(44,'qtWTmxt13QZ2GGu','Richard Stewart','Taylor Jordan',11367,'USS Cole\nFPO AA 13962','jenniferyoung@chen.com','active',6),
(45,'JTyq4BGTm08C9KU','Gregory Wagner','Amanda Hart',1426,'2435 Haynes Groves\nEast Deborah, WI 34854','trevor78@elliott.com','inactive',3),
(46,'xKFcCYiyPEyUMk1','Robert Turner','Edgar Miller',80181,'02090 Wilson Flat Suite 437\nJameschester, KS 34917','michellenguyen@gmail.com','active',7),
(47,'6GjHmRXW0bmeQqD','Patrick Alexander','Anthony Wilson',58602,'4550 Robert Rapids\nTinaburgh, DC 07496','shannon32@hotmail.com','active',3),
(48,'HLRYyYwwbdx48jC','Natasha Wilson','Samantha Mann',29508,'44076 Brown Summit\nWalshmouth, PA 23257','aingram@bullock-reid.net','inactive',7),
(49,'Ymno9puCNf1LA5o','Mark House','Jasmine Dean',46686,'USNS Harris\nFPO AA 55711','donovanzachary@hotmail.com','inactive',3),
(50,'pNb12v5CqfzvbpO','Randy Burns','Michael Wright',30815,'13196 Julie Trace Apt. 297\nPort Kimberly, NV 09839','eatkins@phelps.com','active',7),
(51,'sOhqBlPJEGgannw','Sharon Perez','Danny Crawford',98965,'37592 Kayla Route Suite 949\nKathleenhaven, CA 72935','laurieday@decker-austin.org','active',5),
(52,'w3FLi52JZsGTweu','Bobby Daniel','Paul Taylor Jr.',90236,'12946 Chavez Island\nEast Jodybury, NH 56696','manuelcook@gmail.com','active',4),
(53,'8MfRqvGFFKsWWyO','Julie Brown','Michael Friedman',92325,'15649 Mckenzie Shoals\nNicolemouth, CT 55198','jamespatel@hotmail.com','inactive',3),
(54,'xdLvYFxrYmymGh7','William Adkins','Tracy Mendoza',7367,'337 Lisa Mountains\nEast Dan, VT 40553','phillipsmary@gmail.com','active',3),
(55,'J5ZmpkHHgxMjYxL','Michael Parks','Rachel Cook',90370,'4933 Melissa Cliffs Apt. 607\nMarkland, MI 81113','erichayden@moore-moreno.net','active',3),
(56,'sTlXX0gAvR997xU','Brandon Dunlap','Rita Fletcher',55733,'9212 Vincent Summit Apt. 802\nNorth Timothychester, NV 19957','melissaolsen@ray-gill.net','active',3),
(57,'FeiKTEYQWPIgjaP','Dale Henderson','Sandra Mitchell',37595,'883 Harris Rest Suite 860\nThomasville, WY 64892','joshua04@gmail.com','active',4),
(58,'lVXZjoVlZi4hvQl','Sarah Torres','April Black',55376,'17685 Cristina Greens Suite 876\nTomborough, WV 34270','danielsrebecca@yahoo.com','inactive',6),
(59,'WSuoDs1sgx4B93b','Abigail Chapman','Heather Mitchell',33244,'31117 Alvarez Lights\nTravisfort, OK 30810','brendan99@hotmail.com','active',7),
(60,'JmhA55qK7mEOmWY','Lindsey Flores','Cheryl Poole',29293,'070 Campbell Route Apt. 190\nJessicaview, NH 51669','cooperlaura@yahoo.com','active',4),
(61,'haaY8IkCHT6AKos','Mark Conley','Daniel Johnson',39888,'108 Lopez Hill\nAntoniofurt, TN 60588','colekari@hotmail.com','active',9),
(62,'eZfI7GrwJB4Vl4t','Jennifer Colon','Tammy Ellis',26025,'38648 Jones Squares\nLangchester, DC 07246','onealhaley@gonzalez.org','inactive',5),
(63,'FhWySOVEQ8c34JC','Philip White','Gregory Guerra',77311,'1312 Jake Pines\nEast Meganburgh, IL 89985','anthonyjohns@hotmail.com','inactive',8),
(64,'VVle3TVCHw7jOcD','James Martinez','David Fields',38034,'321 Wilkinson Course\nEast Dustinborough, OH 99071','thall@gmail.com','active',4),
(65,'7QO09ZQVdVa03QT','Katie Benson','Mark Carr',64979,'940 Taylor Vista\nEast Shannon, OR 53343','heatherlopez@yahoo.com','active',1),
(66,'VDuhyaFJXK9Qeoq','Jonathon Nelson','Megan Chandler',53439,'109 Turner Park\nPort Manuelton, OR 46213','elizabeth55@johnson.com','inactive',10),
(67,'fVmgfl62J39ZOIs','Brian Campbell','Marie Elliott',9081,'983 Elizabeth Forges\nColeside, KY 53153','bethfarmer@hotmail.com','active',2),
(68,'GjRZCB0w8qQaxsT','Amy Austin','Jason Miller',35514,'8756 Kimberly Shoals Apt. 988\nPierceshire, MD 06904','woodsmargaret@combs.com','inactive',1),
(69,'uCJB1I8vB1etUI8','James Taylor','Lauren Snyder',18119,'5954 Joseph Extensions\nEvanport, MD 66256','jameslisa@townsend-long.com','active',4),
(70,'SlPE7TDNRuX4Em3','Sarah Wright','Daniel Rowland',3161,'41864 Autumn Forge\nPort Christopher, DE 70430','amccarty@gmail.com','active',4),
(71,'PK7Cx8h6UzXdSex','Matthew Fields','Michael Alvarado',19464,'4110 Joy Circles\nPadillaberg, VA 19224','smithtamara@oliver.org','inactive',7),
(72,'PTDexVr9O4HhulG','Jennifer Bell','Charles Owens',80091,'2645 Knight Land\nPort Sandra, NV 95207','tapiachristopher@kelly.info','inactive',7),
(73,'6xvzyVkXlOVK3PN','Lisa Brown','Erica Mays',72712,'07797 Walton Parks\nGrantburgh, DE 53864','hmartin@orozco.net','inactive',7),
(74,'dqwbDt1HODi0eNA','Amy Martin','Craig Stokes',59370,'50276 Patrick Meadows Suite 501\nWest Benjaminhaven, IN 79529','esmith@doyle-ford.net','active',8),
(75,'HBIyd4v2eYiUQxl','Tracy Haynes','Javier Fuentes',48496,'035 Melanie Corners\nLake Sarah, IL 60872','zoe28@gmail.com','active',1),
(76,'EDEGfNEwR6oNsjU','Nicholas Hampton','Chelsea Lee',17910,'382 Gibson Throughway\nCrystalshire, MA 21494','cobbjulian@yahoo.com','inactive',2),
(77,'XQMlOJjqampGc0V','Nathan Calhoun','Blake Thomas',71169,'044 Rodriguez Square Suite 970\nRobertview, NC 42924','johnsonjessica@martinez.com','active',5),
(78,'BurltvRs281ghK5','Brad Burke','Cameron Davis',44948,'31501 Jessica Expressway\nNorth Ericfort, HI 32168','jackwatkins@robertson.org','inactive',10),
(79,'LhSoCAMx7LIXXg7','Jeffrey Berry','James Lawson',25239,'943 Matthew Valleys Suite 549\nPort William, CO 85272','melindamiller@wright-turner.biz','active',4),
(80,'34OY2wXdGBWxNYB','Lindsay Thompson','Deanna Taylor',93311,'40212 Scott Estate\nLynntown, AR 00898','maddenangela@hotmail.com','active',9),
(81,'kRyssPLsd7CI1dk','Lee Shah','Kimberly Brown',65414,'40994 Nelson Orchard\nNew Joan, DE 05607','vhernandez@tran.com','active',2),
(82,'bv7edSRWY5BNseK','Elizabeth Caldwell','Michael Pierce',25525,'PSC 8730, Box 1452\nAPO AA 25722','michellediaz@gmail.com','active',2),
(83,'3yuScZPrxjvYYwW','Regina Sutton','Kristina Walker',97255,'1666 Frost Knolls Apt. 394\nJustinchester, OR 83015','gail86@gmail.com','active',10),
(84,'w1iJeuEs4EozU3Y','Paul Navarro','Rachel Davis',83621,'8860 Kevin Drive Apt. 194\nJessicaside, AR 19953','katrina70@hood.info','active',1),
(85,'rLAwLE618zhLvHc','Nathaniel Nolan','Karina Williams',21605,'800 James Spurs\nPenaburgh, UT 89908','griffitherica@ross.org','active',8),
(86,'TIlemH2AsZdifHR','Matthew Gomez','Raymond Mills',41857,'8955 Keith Lodge\nWhiteville, AL 15337','christopherfrancis@gmail.com','active',9),
(87,'VMBvzTIb2irpHO3','Andrea Bentley','Rachel Wood',78305,'8911 Ward Land Suite 903\nMeganhaven, CA 83846','ajohnson@smith.com','active',3),
(88,'7xwpfnaX0Lcdh5Q','Amanda Jones','Hannah Wood',79382,'318 Sparks Rue\nHeatherberg, NY 67434','kenneth17@brown.com','active',8),
(89,'KXwRUoaZeTFmWSL','Jasmine Gregory','Melissa Mcbride',64814,'27237 Hannah Park Suite 513\nNew Claudia, MT 71469','alexandermartin@hotmail.com','active',7),
(90,'iBORrKM8tN3kT2e','Mrs. Toni Logan MD','Laura Reynolds',5555,'766 Martinez Rue\nWest Mark, MO 55420','melissa57@miller.com','active',7),
(91,'dEvbBuxrgdazeLi','Charlotte May','Paul Kennedy',70276,'032 Meyers Mall\nPort Kathrynville, NJ 94178','hensonanthony@hotmail.com','active',9),
(92,'NeYI5ESEXFqwJut','Jodi Sexton','Jamie Allen',49045,'64480 Green Union Apt. 365\nPort Nathan, AR 01305','rodrigueztravis@gomez-anderson.com','active',10),
(93,'4PBChQICfE5Xwrf','Andre Hutchinson','James Hunter',58912,'103 Snyder Valleys\nNorth Rodneyland, PA 52241','imorrison@lang.org','inactive',5),
(94,'FnwPJSAh2uomshe','Victoria Clark DDS','Todd Cantu',48053,'USNS Cummings\nFPO AA 36467','lochoa@farrell.com','inactive',9),
(95,'BR3Cw8oZso5OC1i','Kristin Clark','Paul Anderson',20343,'90491 Michael Field\nPort Christinatown, CA 21980','mariah32@hotmail.com','active',8),
(96,'th90okMy8xCdqad','Jennifer Gutierrez','Joseph Grant',8569,'182 Haley Prairie\nGordonbury, ME 37618','jenniferthompson@hotmail.com','active',9),
(97,'7iOU2qjJqwzLH9o','Benjamin Edwards','Jessica Sullivan',25556,'3117 Vazquez Walks\nNorth Robert, UT 36673','sharithomas@kline.com','active',8),
(98,'weDTDDUAyHxX9NE','Antonio Henry','Jessica Jones',60475,'61616 Cunningham Squares Suite 160\nLopezview, IN 52091','cartergreg@jenkins-griffin.com','active',6),
(99,'pDWKJ1Wq4DuVNLh','Jennifer Myers','Kimberly Camacho',30755,'USNV Estrada\nFPO AP 51797','gabriellabell@barton.com','inactive',2),
(100,'GWnvYpYPnSnLF8X','Margaret Rodriguez','Courtney Rivera',77719,'22391 Melinda Spurs\nShanemouth, CO 98478','melinda06@gmail.com','active',9);
/*!40000 ALTER TABLE `retailers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 12:50:36
