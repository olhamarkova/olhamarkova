CREATE DATABASE HotelsDB;

USE HotelsDB;
CREATE TABLE cities
(
cityId int primary key not null auto_increment,
cityName varchar(20)
);

CREATE TABLE hotels
(
hotelId int primary key not null auto_increment,
hotelName varchar(20),
starCounts int not null,
creationDate date,
cityId int,
foreign key (cityId) references cities(cityId)
);

CREATE TABLE rooms
(
roomId int primary key not null auto_increment,
comfortLevel varchar(20),
hotelId int,
foreign key (hotelId) references hotels(hotelId)
);

CREATE TABLE clients
(
clientId int primary key not null auto_increment,
clientName varchar(20),
clientNumber long
);

CREATE TABLE orders
(
orderId int primary key not null auto_increment,
clientId int,
roomId int,
foreign key (clientId) references clients(clientId),
foreign key (roomId) references rooms(roomId)
);

SELECT * FROM cities;
SELECT * FROM orders;

USE HotelsDB;

INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('1', 'lux', '5');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('2', 'lux', '1');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('3', 'comfort', '3');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('4', 'cheap', '4');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('5', 'cheap', '2');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('6', 'comfort', '7');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('7', 'lux', '5');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('8', 'lux', '3');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('9', 'lux', '1');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('10', 'comfort', '6');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('11', 'cheap', '4');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('12', 'cheap', '2');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('13', 'comfort', '7');
INSERT INTO `HotelsDB`.`rooms` (`roomId`, `comfortLevel`, `hotelId`) VALUES ('14', 'lux', '5');

INSERT INTO `HotelsDB`.`clients` (`clientId`, `clientName`, `clientNumber`) VALUES ('1', 'Natasha', '0999999999');
INSERT INTO `HotelsDB`.`clients` (`clientId`, `clientName`, `clientNumber`) VALUES ('2', 'Karina', '0996999999');
INSERT INTO `HotelsDB`.`clients` (`clientId`, `clientName`, `clientNumber`) VALUES ('3', 'Vasya', '0999559999');
INSERT INTO `HotelsDB`.`clients` (`clientId`, `clientName`, `clientNumber`) VALUES ('4', 'Olha', '0999998899');
INSERT INTO `HotelsDB`.`clients` (`clientId`, `clientName`, `clientNumber`) VALUES ('5', 'Mykola', '0994499999');
INSERT INTO `HotelsDB`.`clients` (`clientId`, `clientName`, `clientNumber`) VALUES ('6', 'Ira', '0999991299');
INSERT INTO `HotelsDB`.`clients` (`clientId`, `clientName`, `clientNumber`) VALUES ('7', 'Katya', '0993459999');
INSERT INTO `HotelsDB`.`clients` (`clientId`, `clientName`, `clientNumber`) VALUES ('8', 'Marina', '0997889999');
ALTER TABLE `HotelsDB`.`clients` 

ADD COLUMN `age` INT NULL AFTER `clientNumber`,
ADD COLUMN `salary` DECIMAL(10,0) NULL AFTER `age`;

USE HotelsDB;
SELECT * FROM clients;

UPDATE `HotelsDB`.`clients` SET `clientName` = 'Andrew', `clientNumber` = '0666666666', `age` = '34', `salary` = '30000' WHERE (`clientId` = '9');
UPDATE `HotelsDB`.`clients` SET `age` = '23', `salary` = '20000' WHERE (`clientId` = '1');
UPDATE `HotelsDB`.`clients` SET `age` = '34', `salary` = '10000' WHERE (`clientId` = '2');
UPDATE `HotelsDB`.`clients` SET `age` = '33', `salary` = '15000' WHERE (`clientId` = '3');
UPDATE `HotelsDB`.`clients` SET `age` = '45', `salary` = '12000' WHERE (`clientId` = '4');
UPDATE `HotelsDB`.`clients` SET `age` = '56', `salary` = '9000' WHERE (`clientId` = '5');
UPDATE `HotelsDB`.`clients` SET `age` = '21', `salary` = '2000' WHERE (`clientId` = '6');
UPDATE `HotelsDB`.`clients` SET `age` = '33', `salary` = '40000' WHERE (`clientId` = '7');
UPDATE `HotelsDB`.`clients` SET `age` = '21', `salary` = '12000' WHERE (`clientId` = '8');

SELECT AVG(salary) FROM clients;

SELECT max(salary) FROM clients;

SELECT min(salary) FROM clients;

SELECT count(salary), salary FROM clients GROUP BY salary;

SELECT count(age), age FROM clients GROUP BY age HAVING age > 30;

SELECT * FROM clients ORDER BY clientName;
SELECT * FROM clients ORDER BY age desc;

SELECT * FROM clients ORDER BY salary desc limit 5;

DESC hotels;

SELECT * FROM cities INNER JOIN hotels on cities.cityId = hotels.cityId;

SELECT * FROM cities RIGHT JOIN hotels on cities.cityId = hotels.cityId;

SELECT * FROM cities LEFT JOIN hotels on cities.cityId = hotels.cityId;

SELECT * FROM cities;
SELECT * FROM hotels;

UPDATE hotels SET cityId = 5 WHERE hotelId = 1;

UPDATE hotels SET hotelName = "Rizor" WHERE hotelid = 1;

ALTER TABLE cities ADD COLUMN district VARCHAR(5) AFTER cityName;

UPDATE cities SET district = "Zhyt" WHERE cityId = 1;
UPDATE cities SET district = "Kyiv" WHERE cityId = 2;
UPDATE cities SET cityName = "Lutsk" WHERE cityId = 24;

INSERT INTO cities values (4, "Luhansk");

ALTER TABLE cities DROP COLUMN district;

DELETE FROM cities cityName WHERE cityId = 4;

SELECT clientName, clientNumber FROM clients WHERE clientNumber < 0999999999 AND clientNumber > 1;

SELECT clientName, clientNumber FROM clients WHERE clientNumber = 0999999999 OR clientNumber > 1;

SELECT clientName, clientNumber FROM clients WHERE clientNumber <> 0999999999;

SELECT count(*) FROM clients;

SELECT count(clientName) FROM clients;

SELECT count(clientName) FROM clients WHERE clientName like "%a";

SELECT min(starCounts) FROM hotels;
SELECT min(hotelName) FROM hotels;
SELECT min(creationDate) FROM hotels;

SELECT max(comfortLevel) FROM rooms;
SELECT max(starCounts) FROM hotels;

SELECT avg(clientNumber) FROM clients;

SELECT sum(clientNumber) FROM clients;

SELECT min(starCounts) FROM hotels WHERE starCounts = 2;

SELECT count(hotelId) as mincount FROM rooms;