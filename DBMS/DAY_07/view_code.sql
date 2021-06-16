// view -> 	1.UPDATABLE 		(if not violets any constraints)
//		2.NOT-UPDATABLE 	(if violets any constraints)

// creating view
create view studentview as select sname,marks from student;
select * from studentview;
insert into studentview values("nnk",12.32);
select * from studentview;

// deleting
delete from studentview where sname="nnk";

insert into studentview values("nnk",12.32);
update studentview set sname="Temp" where sname="nnk";

delete from studentview where sname="Temp";
insert into studentview(sname,marks) values("nnk",12.32);

delete from studentview where sname="nnk";
insert into studentview(sname) values("nnk1");

delete from studentview where sname="nnk1";
insert into studentview(marks,sname) values(12.5,"nnk2");

SELECT STU.SID,STU.SNAME,STU.MARKS,STU.DID,DEP.DNAME FROM STU LEFT OUTER JOIN DEP ON STU.DID=DEP.DID 
UNION 
SELECT STU.SID,STU.SNAME,STU.MARKS,STU.DID,DEP.DNAME FROM STU RIGHT OUTER JOIN DEP ON STU.DID=DEP.DID;

select sname from sports intersect select sname from quiz group by sname asc;