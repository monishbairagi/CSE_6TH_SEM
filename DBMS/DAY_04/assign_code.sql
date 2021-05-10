-- Creating DEPT table
CREATE TABLE DEPT (
	DEPTNO INT(3) NOT NULL,
	DNAME VARCHAR(12) NOT NULL,
	LOC VARCHAR(15) NOT NULL,
	PRIMARY KEY(DEPTNO)
);

-- Creating EMP table
CREATE TABLE EMP (
	EMPNO INT(4) NOT NULL,
	ENAME VARCHAR(10) NOT NULL,
	JOB VARCHAR(10) NOT NULL,
	MGR INT(4) NOT NULL,
	HIREDATE DATE NOT NULL,
	SAL DOUBLE(7,1) NOT NULL,
	COMM DOUBLE(6,1),
	DEPTNO INT(3) NOT NULL,
	PRIMARY KEY(EMPNO),
	FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);

-- Inserting data to the DEPT table
INSERT INTO DEPT VALUES(10,'Accounting','New Delhi');
INSERT INTO DEPT VALUES(20,'Research','Dhanbad');
INSERT INTO DEPT VALUES(30,'Sales','Pune');
INSERT INTO DEPT VALUES(40,'Operations','Boroda');

-- Inserting data to the EMP table
INSERT INTO EMP VALUES(7369,'Smith','Clerk',7902,'18/12/17',8000,NULL,20);
INSERT INTO EMP VALUES(7499,'Allen','Salesman',7698,'19/02/20',16000,300,30);
INSERT INTO EMP VALUES(7521,'Ward','Salesman',7698,'19/02/22',12500,500,30);
INSERT INTO EMP VALUES(7566,'Jones','Manager',7839,'19/04/02',29750,NULL,20);
INSERT INTO EMP VALUES(7654,'Martin','Salesman',7698,'19/09/28',12500,1400,30);
INSERT INTO EMP VALUES(7698,'Blake','Manager',7839,'19/05/01',28500,NULL,30);
INSERT INTO EMP VALUES(7782,'Clark','Manager',7839,'19/06/09',24500,250,10);
INSERT INTO EMP VALUES(7788,'Scott','Analyst',7566,'19/12/09',30000,NULL,20);
INSERT INTO EMP VALUES(7839,'King','President',7802,'18/09/08',50000,NULL,10);
INSERT INTO EMP VALUES(7844,'Turner','Salesman',7698,'18/09/08',15000,0,30);
INSERT INTO EMP VALUES(7876,'Adams','Clark',7788,'17/01/12',11000,150,20);
INSERT INTO EMP VALUES(7900,'James','Clark',7698,'18/12/03',9500,NULL,30);
INSERT INTO EMP VALUES(7902,'Ford','Analyst',7566,'18/12/04',30000,300,20);
INSERT INTO EMP VALUES(7934,'Miller','Clark',7782,'19/01/23',13000,NULL,10);

-- 1. List names of those employees whose job is analysts or salesmen.
SELECT ENAME FROM EMP WHERE JOB='Analyst' OR JOB='Salesman';

-- 2. List details of those employees whose joined date is before 30 March 19
SELECT * FROM EMP WHERE HIREDATE<'2019-03-30';

-- 3. List names of those employees whose designation are not Managers.
SELECT ENAME FROM EMP WHERE JOB<>'Manager';

-- 4. List the names of employees whose employee numbers are 7839, 7934, 7788 7369.
SELECT ENAME FROM EMP WHERE EMPNO=7839 OR EMPNO=7934 OR EMPNO=7788 OR EMPNO=7369;

-- 5. List employees not belonging to department 30, 40, or 20.
SELECT * FROM EMP WHERE DEPTNO NOT IN (30,40,20);

-- 6. List employee details who have joined between ‘31’ Jan and ‘31’ Dec. ‘19’.
SELECT * FROM EMP WHERE HIREDATE BETWEEN '2019-01-31' AND '2019-12-31';

-- 7. List the different designation that exists in the company.
SELECT DISTINCT JOB FROM EMP;

-- 8. List the names of employees who are not eligible for commission.
SELECT ENAME FROM EMP WHERE COMM IS NULL;

-- 9. List the name and designation of the employee who’s Name begins with S.
SELECT ENAME, JOB FROM EMP WHERE ENAME LIKE 'S%';

-- 10. List the employees not assigned to any department.
SELECT * FROM EMP WHERE DEPTNO NOT IN (SELECT DEPTNO FROM DEPT);

-- 11. List the employees who are eligible for commission.
SELECT ENAME FROM EMP WHERE COMM IS NOT NULL;

-- 12. List employee’s whose names either start or end with “S”.
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S%' OR ENAME LIKE '%s';

-- 13. List names of employees whose names have “i” as the second character.
SELECT ENAME FROM EMP WHERE ENAME LIKE '_i%';

-- 14. List the number of employees working with the company.
SELECT COUNT(ENAME) FROM EMP;

-- 15. Display the total salaries paid to the employees.
SELECT SUM(SAL) FROM EMP;

-- 16. Display the maximum, minimum and average salary in the company.
SELECT MAX(SAL), MIN(SAL), AVG(SAL) FROM EMP;

-- 17. List the maximum salary paid to a salesman.
SELECT MAX(SAL) FROM EMP WHERE JOB='salesman';

-- 18. Add one more column to the DEPT Table (Country varchar2 (15));
ALTER TABLE DEPT ADD COUNTRY VARCHAR(15);

-- 19. Set the name of the country as ‘USA’ for those whose DEPTNO=10
UPDATE DEPT SET COUNTRY='USA' WHERE DEPTNO=10;

-- 20. Set the name of the country as ‘INDIA’ where DEPTNO >10
UPDATE DEPT SET COUNTRY='INDIA' WHERE DEPTNO>10;

-- 21. Set the column size of salary as (8, 2) in EMP Table.
ALTER TABLE EMP MODIFY SAL DOUBLE(8,2);

-- 22. Set the column size of DNAME as varchar2 (20) in DEPT Table.
ALTER TABLE DEPT MODIFY DNAME VARCHAR(20);

-- 23. Drop the Column Country from DEPT Table.
ALTER TABLE DEPT DROP COUNTRY;

-- 24. Update all salary of the employees by 10% in EMP Table.
UPDATE EMP SET SAL=SAL+SAL*0.1;