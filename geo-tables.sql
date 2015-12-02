DROP TABLE IF EXISTS `Taxi_associations`;
CREATE TABLE Taxi_associations (
    id int not null auto_increment,
    taxiAssociation_name varchar(100),
    primary key(id)    
)ENGINE=InnoDB;

DROP TABLE IF EXISTS 'Ranks';
CREATE TABLE Ranks (
	id int not null auto_increment,
	Rank_name varchar(100),
	primary key(id),
	association_id int(100),
	FOREIGN KEY(association_id) REFERENCES Taxi_associations(id)

)ENGINE=InnoDB;

DROP TABLE IF EXISTS 'Issues';
CREATE TABLE Issues(
	id int not null auto_increment,
	primary key(id),
	description varchar(100),
	date DATE,
	association_id int(100),
	FOREIGN KEY(association_id) REFERENCES Taxi_associations(id),
	rank_id int(100),
	FOREIGN KEY(rank_id) REFERENCES Ranks(id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS 'ini_Location';
CREATE TABLE ini_Location(
	id int not null auto_increment,
	primary key(id),
	latitudes int(100),
	longitudes int(100),
	locOne_time time,
    date DATE
	
)ENGINE=InnoDB;
DROP TABLE IF EXISTS 'fin_Location';
CREATE TABLE fin_Location(
	id int not null auto_increment,
	primary key(id),
	latitudes int(100),
	longitudes int(100),
	locTwo_time time,
    date DATE
	
)ENGINE=InnoDB;

INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('Uncedo');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('CATA');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('SANTAGO');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('PENINSULA TAXI ');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('WESTERN CAPE METERED');
INSERT INTO Taxi_associations (taxiAssociation_name) VALUES ('GARDEN ROUTE');


INSERT INTO Ranks (Rank_name) VALUES ('Langa');
INSERT INTO Ranks (Rank_name) VALUES ('Khayelitsha');
INSERT INTO Ranks (Rank_name) VALUES ('Cape Town');
INSERT INTO Ranks (Rank_name) VALUES ('Gugulethu ');
INSERT INTO Ranks (Rank_name) VALUES ('BELLVILLE');
INSERT INTO Ranks (Rank_name) VALUES ('DUNOON');
