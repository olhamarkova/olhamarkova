

select * from hogwards.characters;

use hogwards;
select char_id, fname, lname, patronus from characters where patronus is not null;

select lname from characters where lname like "%e";
select sum(age) from hogwards.characters;
select fname, lname, age from characters order by age desc;
select fname, age from characters where age between 50 and 100;
select distinct age from characters; 
select * from characters where faculty = "Gryffindor" and age >= 30; 
select distinct faculty from characters limit 3; 
select fname from characters where fname like "H____" or "L%";
select avg(age) from hogwards.characters;
delete from characters where char_id = 11;
select * from characters where char_id = 11;
select lname from characters where lname like "%a%";
select fname as "Half-Blood Prince" from characters where fname = "Severus";
select char_id, patronus from characters where patronus is not null order by patronus;
select fname, lname 
from characters
where lname in ("Crabbe", "Granger", "Diggory");
select min(age) from characters;
select fname from characters
union
select book_name from library;
select count(char_id), faculty 
from characters
group by faculty
having count(char_id) > 1;
select fname, lname, 
case 
when faculty = "Gryffindor" then "Godric"
when faculty = "Slytherin" then "Salazar"
when faculty = "Ravenclaw" then "Rowena"
when faculty = "Hufflepuff" then "Helga"
else "Muggle"
end
from characters;

select * from characters where lname not regexp "^h" and "^l" and "^s";

use hogwards;
show tables;
select * from library;
select characters.fname, characters.lname, library.book_name 
from characters
inner join library on characters.char_id=library.char_id;
select characters.fname, characters.lname, library.book_name 
from characters
left join library on characters.char_id=library.char_id;
select characters.patronus, library.book_name 
from characters
right join library on characters.char_id=library.char_id;
select characters.fname, characters.lname, characters.age, library.book_name 
from characters
inner join library on characters.char_id=library.char_id
where age in(select age where age > 15);
select characters.fname, library.book_name, library.start_date, library.end_date 
from characters
inner join library on characters.char_id=library.char_id
where age in(select age where age < 15) and patronus is null;
select * from library;
select library.end_date
from characters
inner join library on characters.char_id=library.char_id
where fname = "Hermione"; 
select count(book_name) from library where end_date > "2022-12-20";
use hogwards;
select patronus from characters 
where age > any 
(select age from characters where patronus = "Unknown");
create database HotelsDB;
use HotelsDB;
create table cities
(
cityId int primary key not null auto_increment,
cityName varchar(20)
);

create table hotels
(
hotelId int primary key not null auto_increment,
hotelName varchar(20),
starCounts int not null,
creationDate date,
cityId int,
foreign key (cityId) references cities(cityId)
);

create table rooms
(
roomId int primary key not null auto_increment,
comfortLevel varchar(20),
hotelId int,
foreign key (hotelId) references hotels(hotelId)
);

create table clients
(
clientId int primary key not null auto_increment,
clientName varchar(20),
clientNumber long
);

create table orders
(
orderId int primary key not null auto_increment,
clientId int,
roomId int,
foreign key (clientId) references clients(clientId),
foreign key (roomId) references rooms(roomId)
);

select * from cities;
select * from orders;
use HotelsDB;

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