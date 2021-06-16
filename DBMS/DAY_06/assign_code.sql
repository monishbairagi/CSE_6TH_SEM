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
INSERT INTO EMP VALUES(7369,'Smith','Clerk',7902,'2018-12-17',8000,NULL,20);
INSERT INTO EMP VALUES(7499,'Allen','Salesman',7698,'2019-02-20',16000,300,30);
INSERT INTO EMP VALUES(7521,'Ward','Salesman',7698,'2019-02-22',12500,500,30);
INSERT INTO EMP VALUES(7566,'Jones','Manager',7839,'2019-04-02',29750,NULL,20);
INSERT INTO EMP VALUES(7654,'Martin','Salesman',7698,'2019-09-28',12500,1400,30);
INSERT INTO EMP VALUES(7698,'Blake','Manager',7839,'2019-05-01',28500,NULL,30);
INSERT INTO EMP VALUES(7782,'Clark','Manager',7839,'2019-06-09',24500,250,10);
INSERT INTO EMP VALUES(7788,'Scott','Analyst',7566,'2019-12-09',30000,NULL,20);
INSERT INTO EMP VALUES(7839,'King','President',7802,'2018-09-08',50000,NULL,10);
INSERT INTO EMP VALUES(7844,'Turner','Salesman',7698,'2018-09-08',15000,0,30);
INSERT INTO EMP VALUES(7876,'Adams','Clark',7788,'2017-01-12',11000,150,20);
INSERT INTO EMP VALUES(7900,'James','Clark',7698,'2018-12-03',9500,NULL,30);
INSERT INTO EMP VALUES(7902,'Ford','Analyst',7566,'2018-12-04',30000,300,20);
INSERT INTO EMP VALUES(7934,'Miller','Clark',7782,'2019-01-23',13000,NULL,10);

-- i. List the number of employees and the average salary for employees in department 20.
SELECT COUNT(EMPNO) AS TOTAL_EMP, AVG(SAL) AS AVG_SAL FROM EMP WHERE DEPTNO=20;

-- ii. List the name, salary, and PF amount of all employees. (PF is calculated as 10% of basic salary)
SELECT ENAME,SAL,SAL*0.1 AS PF FROM EMP;

-- iii. List names of employees who are more than 2 years old in the company.
SELECT ENAME FROM EMP WHERE DATEDIFF(CURDATE(),HIREDATE)/365>2;

-- iv. List the employee details in the ascending order of their basic salary.
SELECT * FROM EMP ORDER BY SAL ASC;

-- v. List the employee name and hire date in descending order of the hire date.
SELECT ENAME, HIREDATE FROM EMP ORDER BY HIREDATE DESC;

-- vi. List employee name, salary, PF, HRA, DA, and gross; order the results in the Ascending order of gross. HRA is 50% of the salary and DA is 30% of the salary.
SELECT ENAME, SAL, SAL*0.1 AS PF, SAL*0.5 AS HRA, SAL*0.3 AS DA, SAL*0.1+SAL*0.5+SAL*0.3+SAL AS GROSS FROM EMP;

-- vii. List the department numbers and number of employees in each department.
SELECT DEPTNO, COUNT(EMPNO) AS TOTAL_EMP FROM EMP GROUP BY DEPTNO;

-- viii. List the department number and total salary payable in each department.
SELECT DEPTNO, SUM(SAL) AS TOTAL_SAL FROM EMP GROUP BY DEPTNO;

-- ix. List the jobs and number of employees in each job. The result should be in the Descending order of the number of employees.
SELECT JOB, COUNT(EMPNO) AS TOTAL_EMP FROM EMP GROUP BY JOB ORDER BY COUNT(EMPNO) DESC;

-- x. List the total salary, maximum and minimum salary, and average salary of the Employees job-wise.
SELECT JOB, SUM(SAL) AS TOTAL_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, AVG(SAL) AS AVG_SAL FROM EMP GROUP BY JOB;

-- xi. List the total salary, maximum and minimum salary, and average salary of the Employees for the department 20.
SELECT JOB, SUM(SAL) AS TOTAL_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, AVG(SAL) AS AVG_SAL FROM EMP WHERE DEPTNO=20;

-- xii. List the total salary, maximum and minimum salary, and average salary of the Employees job-wise, for department 20 and display only those rows where average salary > 1000
SELECT JOB, SUM(SAL) AS TOTAL_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, AVG(SAL) AS AVG_SAL FROM EMP WHERE DEPTNO=20 GROUP BY JOB HAVING AVG(SAL)>1000;