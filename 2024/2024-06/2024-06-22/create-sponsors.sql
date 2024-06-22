CREATE TABLE sponsors (
  `id` int NOT NULL AUTO_INCREMENT,
  `sponsorname` varchar(25) NOT NULL,
  `primaryphone` varchar(10) DEFAULT NULL,
  `primaryemail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);