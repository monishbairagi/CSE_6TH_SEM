-- creating Dept table
CREATE TABLE Dept (
	DID INT(3), 
	DName VARCHAR(10),
	PRIMARY KEY(DID)
);

-- creating Student table
CREATE TABLE Student (
	SID INT(3), 
	SName VARCHAR(30),  
	Marks DOUBLE(5,2),
	DID INT(3),
	PRIMARY KEY(SID),
	FOREIGN KEY(DID) REFERENCES Dept(DID)
);

-- creating ExtraCurricularDetail table
CREATE TABLE ExtraCurricularDetail (
	EID INT(3), 
	EName VARCHAR(10),
	PRIMARY KEY(EID)
);

-- creating ExtraCurricularParticipation table
CREATE TABLE ExtraCurricularParticipation (
	SID INT(3),
	EID INT(3),
	FOREIGN KEY(SID) REFERENCES Student(SID),
	FOREIGN KEY(EID) REFERENCES ExtraCurricularDetail(EID)
);

-- inserting data into Dept table
INSERT INTO Dept VALUES(1,"CSE");
INSERT INTO Dept VALUES(2,"CE");
INSERT INTO Dept VALUES(3,"ECE");
INSERT INTO Dept VALUES(4,"EE");
INSERT INTO Dept VALUES(5,"ME");

-- inserting data into Student table
INSERT INTO Student VALUES(1,"Oindrila Datta",75.32,1);
INSERT INTO Student VALUES(2,"Mritunjay Giri",79.66,1);
INSERT INTO Student VALUES(3,"Monish Kumar Bairagi",87.51,1);
INSERT INTO Student VALUES(4,"Mohibul Aktar Mollah",86.74,1);
INSERT INTO Student VALUES(5,"Mehuli Das",98.42,1);

-- inserting data into ExtraCurricularDetail table
INSERT INTO ExtraCurricularDetail VALUES(1,'CHESS');
INSERT INTO ExtraCurricularDetail VALUES(2,'KABADDI');
INSERT INTO ExtraCurricularDetail VALUES(3,'BADMINTON');
INSERT INTO ExtraCurricularDetail VALUES(4,'TENNIS');
INSERT INTO ExtraCurricularDetail VALUES(5,'CRICKET');
INSERT INTO ExtraCurricularDetail VALUES(6,'FOOTBALL');

-- inserting data into ExtraCurricularParticipation table
INSERT INTO ExtraCurricularParticipation VALUES(2,1);
INSERT INTO ExtraCurricularParticipation VALUES(2,2);
INSERT INTO ExtraCurricularParticipation VALUES(2,5);
INSERT INTO ExtraCurricularParticipation VALUES(2,6);
INSERT INTO ExtraCurricularParticipation VALUES(3,1);
INSERT INTO ExtraCurricularParticipation VALUES(3,2);
INSERT INTO ExtraCurricularParticipation VALUES(3,5);
INSERT INTO ExtraCurricularParticipation VALUES(4,2);
INSERT INTO ExtraCurricularParticipation VALUES(4,3);
INSERT INTO ExtraCurricularParticipation VALUES(4,5);
INSERT INTO ExtraCurricularParticipation VALUES(4,6);
INSERT INTO ExtraCurricularParticipation VALUES(5,1);
INSERT INTO ExtraCurricularParticipation VALUES(5,3);
INSERT INTO ExtraCurricularParticipation VALUES(5,4);

-- SHOWING ALL TABLES
SELECT * FROM Dept;
SELECT * FROM Student;
SELECT * FROM ExtraCurricularDetail;
SELECT * FROM ExtraCurricularParticipation;

-- a. Find the average marks of all those whose name starts with a letter similar to your name and also belongs to the CSE dept.
SELECT AVG(Marks) FROM student WHERE SName LIKE 'M%' AND DID=1;

-- b. List names of all who have participated in at least three Extra-Curricular Activities.
SELECT Student.SName, COUNT(Extracurricularparticipation.EID) FROM Student LEFT JOIN Extracurricularparticipation ON Student.SID = Extracurricularparticipation.SID GROUP BY Student.SID HAVING COUNT(Extracurricularparticipation.EID) >=3;

-- c. List name and department of all who have not participated in any Extra-Curricular Activities.
SELECT DISTINCT Student.SName, Dept.DName FROM Student,Dept,ExtraCurricularParticipation WHERE Student.SID NOT IN (SELECT ExtraCurricularParticipation.SID FROM ExtraCurricularParticipation) AND Student.DID=Dept.DID;

-- d. List names of all students and their corresponding count of participation in Extra-Curricular Activities. Those who have no participation, must be shown zero or blank.
SELECT Student.SName, COUNT(ExtraCurricularParticipation.EID) FROM Student LEFT JOIN ExtraCurricularParticipation ON Student.SID=ExtraCurricularParticipation.SID GROUP BY Student.SID;

-- e. Show the use of logical operator OR.
SELECT * FROM Student WHERE SName LIKE "M%" OR  SName LIKE "%i"; 

-- f. Show the use of BETWEEN.
SELECT * FROM Student WHERE Marks BETWEEN 80 AND 100;

-- g. Make use of the AND logical operator in your query
SELECT * FROM Student WHERE SName LIKE "M%" AND  SName LIKE "%i"; 