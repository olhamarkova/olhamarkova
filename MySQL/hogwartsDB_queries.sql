USE hogwards;

SELECT char_id, fname, lname, patronus FROM characters WHERE patronus IS NOT null;

SELECT lname FROM characters WHERE lname like "%e";

SELECT sum(age) FROM hogwards.characters;

SELECT fname, lname, age FROM characters ORDER BY age desc;

SELECT fname, age FROM characters WHERE age between 50 and 100;

SELECT distinct age FROM characters; 

SELECT * FROM characters WHERE faculty = "Gryffindor" and age >= 30; 

SELECT distinct faculty FROM characters limit 3; 

SELECT fname FROM characters WHERE fname like "H____" or "L%";

SELECT avg(age) FROM hogwards.characters;

DELETE FROM characters WHERE char_id = 11;

SELECT * FROM characters WHERE char_id = 11;

SELECT lname FROM characters WHERE lname like "%a%";

SELECT fname as "Half-Blood Prince" FROM characters WHERE fname = "Severus";
SELECT char_id, patronus FROM characters WHERE patronus IS NOT null ORDER BY patronus;

SELECT fname, lname 
FROM characters
WHERE lname in ("Crabbe", "Granger", "Diggory");

SELECT min(age) FROM characters;

SELECT fname FROM characters
union
SELECT book_name FROM library;

SELECT count(char_id), faculty 
FROM characters
GROUP BY faculty
having count(char_id) > 1;

SELECT fname, lname, 
case 
when faculty = "Gryffindor" then "Godric"
when faculty = "Slytherin" then "Salazar"
when faculty = "Ravenclaw" then "Rowena"
when faculty = "Hufflepuff" then "Helga"
else "Muggle"
end
FROM characters;

SELECT * FROM characters WHERE lname not regexp "^h" and "^l" and "^s";

USE hogwards;

SHOW TABLES;

SELECT * FROM library;

SELECT characters.fname, characters.lname, library.book_name 
FROM characters
inner join library on characters.char_id=library.char_id;

SELECT characters.fname, characters.lname, library.book_name 
FROM characters
LEFT JOIN library on characters.char_id=library.char_id;

SELECT characters.patronus, library.book_name 
FROM characters
RIGHT JOIN library on characters.char_id=library.char_id;

SELECT characters.fname, characters.lname, characters.age, library.book_name 
FROM characters
INNER JOIN library on characters.char_id=library.char_id
WHERE age in(select age WHERE age > 15);

SELECT characters.fname, library.book_name, library.start_date, library.end_date 
FROM characters
INNER JOIN library on characters.char_id=library.char_id
WHERE age in(select age where age < 15) AND patronus is null;

SELECT * FROM library;

SELECT library.end_date
FROM characters
INNER JOIN library on characters.char_id=library.char_id
WHERE fname = "Hermione"; 

SELECT count(book_name) FROM library WHERE end_date > "2022-12-20";

USE hogwards;

SELECT patronus FROM characters 
WHERE age > any 
(select age FROM characters WHERE patronus = "Unknown");

