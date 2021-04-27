--------------------------------------------------------------------------------------------------
-- creating table with collum
CREATE TABLE DEPT (DEPTNO INT(3),DNAME VARCHAR(12),LOC VARCHAR(15));

-- inserting data to the table
INSERT INTO DEPT VALUES(101,'CSE','KOLKATA');
INSERT INTO DEPT VALUES(102,'ECE','MUMBAI');
INSERT INTO DEPT VALUES(103,'EE','CHENNAI');

--------------------------------------------------------------------------------------------------
-- creating table with collum
CREATE TABLE STUDENT (ROLL INT(3),NAME VARCHAR(20)); 

-- inserting data to the table
INSERT INTO STUDENT VALUES(1,'MONISH');
INSERT INTO STUDENT VALUES(2,'ANIKET');
INSERT INTO STUDENT VALUES(3,'AISHIK');
INSERT INTO STUDENT VALUES(4,'ANINDYA');
INSERT INTO STUDENT VALUES(5,'KOULIK');
INSERT INTO STUDENT VALUES(6,'KOUSHIK');
INSERT INTO STUDENT VALUES(7,'SHASWATA');
INSERT INTO STUDENT VALUES(8,'DEBAEGHYA');

DESC STUDENT; -- describe table;

--selecting data with condition
SELECT * FROM STUDENT WHERE NAME='MONISH'; 
SELECT * FROM STUDENT WHERE ROLL>=2 AND ROLL<=7;
SELECT * FROM STUDENT WHERE ROLL=2 OR ROLL=7;

-- delete data with condition
DELETE FROM STUDENT WHERE NAME='MONISH';

ROLLBACK; -- undo

--------------------------------------------------------------------------------------------------
-- creating table with collum having primary key
CREATE TABLE STUDENT (
	ROLL INT(3) NOT NULL, 
	NAME VARCHAR(20) NOT NULL,
	PRIMARY KEY (ROLL)
);

-- update data with condition
UPDATE STUDENT SET ROLL=10,NAME='RABI' WHERE ROLL=1;

--------------------------------------------------------------------------------------------------
-- creating table with collum having foreign key
CREATE TABLE MARKS (
	ROLL INT(3) NOT NULL, 
	MARK DOUBLE(3,2),
	FOREIGN KEY (ROLL) REFERENCES STUDENT(ROLL)
);
--------------------------------------------------------------------------------------------------