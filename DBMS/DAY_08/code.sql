create table student (   
  SId     number(2) ,   
  name    varchar2(50) not null,   
  marks   number(5,2),   
  constraint pk_student primary key (SId)   
);

insert into student values(1,'Monish',50);
insert into student values(2,'Mohibul',40);
insert into student values(3,'Shaswata',50);

select * from student;

declare
	n student.name%type;
	m student.marks%type;
	r student.SID%type;
	begin
		r:=1;
		select name, marks into n, m from student where SID=r;
		dbms_output.put_line(n||' got '||m||' marks.');
	end;
	
declare
	r student.SID%type;
	rw student%rowtype;
	begin
		r:=1;
		select * into rw from student where SID=r;
		dbms_output.put_line(rw.name||' got '||rw.marks||' marks.');
	end;