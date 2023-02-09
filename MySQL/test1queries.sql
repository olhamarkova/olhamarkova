ALTER TABLE `HotelsDB`.`clients` 
ADD COLUMN `age` INT NULL AFTER `clientNumber`,
ADD COLUMN `salary` DECIMAL(10,0) NULL AFTER `age`;
use HotelsDB;
select * from clients;

UPDATE `HotelsDB`.`clients` SET `clientName` = 'Andrew', `clientNumber` = '0666666666', `age` = '34', `salary` = '30000' WHERE (`clientId` = '9');
UPDATE `HotelsDB`.`clients` SET `age` = '23', `salary` = '20000' WHERE (`clientId` = '1');
UPDATE `HotelsDB`.`clients` SET `age` = '34', `salary` = '10000' WHERE (`clientId` = '2');
UPDATE `HotelsDB`.`clients` SET `age` = '33', `salary` = '15000' WHERE (`clientId` = '3');
UPDATE `HotelsDB`.`clients` SET `age` = '45', `salary` = '12000' WHERE (`clientId` = '4');
UPDATE `HotelsDB`.`clients` SET `age` = '56', `salary` = '9000' WHERE (`clientId` = '5');
UPDATE `HotelsDB`.`clients` SET `age` = '21', `salary` = '2000' WHERE (`clientId` = '6');
UPDATE `HotelsDB`.`clients` SET `age` = '33', `salary` = '40000' WHERE (`clientId` = '7');
UPDATE `HotelsDB`.`clients` SET `age` = '21', `salary` = '12000' WHERE (`clientId` = '8');

select avg(salary) from clients;

select max(salary) from clients;

select min(salary) from clients;

select count(salary), salary from clients group by salary;
select count(age), age from clients group by age having age > 30;
select count(age), age, clientName from clients group by age having clientName like "%a%";

select * from clients order by clientName;
select * from clients order by age desc;

select * from clients order by salary desc limit 5;

select * from clients order by salary desc limit 5 offset 2;

desc hotels;

select * from cities inner join hotels on cities.cityId = hotels.cityId;
select * from cities right join hotels on cities.cityId = hotels.cityId
union all
select * from cities left join hotels on cities.cityId = hotels.cityId;

select * from cities;
select * from hotels;

update hotels set cityId = 5 where hotelId = 1;

update hotels set hotelName = "Rizor" where hotelid = 1;

alter table cities add column district varchar(5) after cityName;
update cities set district = "Zhyt" where cityId = 1;
update cities set district = "Kyiv" where cityId = 2;
update cities set cityName = "Lutsk" where cityId = 24;
insert into cities values (4, "Luhansk");
alter table cities drop column district;
delete from cities cityName where cityId = 4;