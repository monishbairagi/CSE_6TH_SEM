select * from Tables; -- select all from tables

show Tables;

CREATE TABLE Student (Roll int(2),Name varchar(20));

SELECT * FROM student;

insert into `student` VALUES(36,'Mritunjay');
insert into `student` VALUES(37,'Monish');
insert into `student` VALUES(38,'Mohibul');

SELECT * FROM `student` WHERE roll=37;

SELECT name,roll FROM `student` WHERE roll=37;

SELECT name FROM `student` WHERE roll=37;

