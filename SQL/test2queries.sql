
select clientName, clientNumber from clients where clientNumber < 0999999999 and clientNumber > 1;

select clientName, clientNumber from clients where clientNumber = 0999999999 or clientNumber > 1;

select clientName, clientNumber from clients where clientNumber <> 0999999999;

select count(*) from clients;

select count(clientName) from clients;

select count(clientName) from clients where clientName like "%a";

select min(starCounts) from hotels;
select min(hotelName) from hotels;
select min(creationDate) from hotels;

select max(comfortLevel) from rooms;
select max(starCounts) from hotels;

select avg(clientNumber) from clients;

select sum(clientNumber) from clients;

select min(starCounts) from hotels where starCounts = 2;


select count(hotelId) as mincount from rooms;