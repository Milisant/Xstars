CREATE TABLE Taxi_associations (
    id int not null auto_increment,
    taxiAssociation_name varchar(100),
    primary key(id)    
);

CREATE TABLE Ranks (
	id int not null auto_increment,
	Rank_name varchar(100),
	primary key(id),
	association_id int(100),
	FOREIGN KEY(association_id) REFERENCES Taxi_associations(id)
);

CREATE TABLE IF NOT EXISTS `Issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `association_id` int(100) DEFAULT NULL,
  `reg_number` varchar(100) NOT NULL,
  `rank_id` int(100) DEFAULT NULL,
  `speed` decimal(20,0) DEFAULT NULL,
  `rank_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `association_id` (`association_id`),
  KEY `rank_id` (`rank_id`)
);



INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('Uncedo');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('CATA');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('SANTAGO');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('PENINSULA TAXI ');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('WESTERN CAPE METERED');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('GARDEN ROUTE');

INSERT INTO Issues (description,date,association_id,rank_id,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed) VALUES ('accident',2015-11-20,2,3,-33.9069597,18.418938,-23.9069597,17.418938,0.23);
INSERT INTO Issues (description,date,association_id,rank_id,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed) VALUES ('accident',2015-11-20,2,3,-33.9069597,18.418938,-23.9069597,17.418938,0.23);
INSERT INTO Issues (description,date,association_id,rank_id,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed) VALUES ('accident',2015-11-20,2,3,-33.9069597,18.418938,-23.9069597,17.418938,0.23);
INSERT INTO Issues (description,date,association_id,rank_id,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed) VALUES ('accident',2015-11-20,2,3,-33.9069597,18.418938,-23.9069597,17.418938,0.23);
INSERT INTO Issues (description,date,association_id,rank_id,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed) VALUES ('accident',2015-11-20,2,3,-33.9069597,18.418938,-23.9069597,17.418938,0.23);
INSERT INTO Issues (description,date,association_id,rank_id,start_location_latitude,start_location_longitude,start_location_time,end_location_latitude,end_location_longitude,end_location_time,speed) VALUES ('accident',2015-11-20,2,3,-33.9069597,18.418938,-23.9069597,17.418938,0.23);


INSERT INTO Ranks (Rank_name) VALUES ('Langa');
INSERT INTO Ranks (Rank_name) VALUES ('Khayelitsha');
INSERT INTO Ranks (Rank_name) VALUES ('Cape Town');
INSERT INTO Ranks (Rank_name) VALUES ('Gugulethu ');
INSERT INTO Ranks (Rank_name) VALUES ('BELLVILLE');
INSERT INTO Ranks (Rank_name) VALUES ('DUNOON');
