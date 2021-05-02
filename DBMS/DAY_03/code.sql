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
INSERT INTO EMP VALUES(7369,'Smith','Clerk',7902,'17/12/18',8000,NULL,20);
INSERT INTO EMP VALUES(7499,'Allen','Salesman',7698,'20/02/19',16000,300,30);
INSERT INTO EMP VALUES(7521,'Ward','Salesman',7698,'22/02/19',12500,500,30);
INSERT INTO EMP VALUES(7566,'Jones','Manager',7839,'02/04/19',29750,NULL,20);
INSERT INTO EMP VALUES(7654,'Martin','Salesman',7698,'28/09/19',12500,1400,30);
INSERT INTO EMP VALUES(7698,'Blake','Manager',7839,'01/05/19',28500,NULL,30);

-- Selecting Data
SELECT * FROM EMP WHERE 1;
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE EMPNO=7566;
SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE JOB='Manager';
SELECT * FROM EMP WHERE SAL>=9000 AND SAL<=29000;
SELECT * FROM EMP WHERE JOB='Manager' OR JOB='Clerk';