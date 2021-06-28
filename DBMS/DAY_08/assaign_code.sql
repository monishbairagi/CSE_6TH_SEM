-- 1) Write a PL/SQL code to calculate the sum of first 'n' odd numbers
declare
	n number(2);
	s number(3);
	i number(3);
	begin
		n:=5;
		s:=0;
		i:=1;
		while(i<2*n) loop
			s:=s+i;
			dbms_output.put_line(i);
			i:=i+2;
		end loop;
		dbms_output.put_line('Sum: '||s);
	end;
	
-- 2) Write a PL/SQL code to display the salary of an employee based on his/her employeeID
declare
	s emp.sal%type;
	i emp.empno%type;
	begin
		i:=7521;
		SELECT sal INTO s FROM emp WHERE empno=i;
		dbms_output.put_line('Salary of Emp. No-'||i||' is '||s);
	end;

-- 3) Write a PL/SQL code to display the name of the employee, Department number of the employee, Job of the employee as well as salary based on employeeID [ Hints use %rowtype]	
declare
	tuple emp%rowtype;
	i emp.empno%type; 
	begin
		i:=7521;
		SELECT * INTO tuple FROM emp WHERE empno=i;
		dbms_output.put_line('Name:      '||tuple.ename);
		dbms_output.put_line('Dept No:   '||tuple.deptno);
		dbms_output.put_line('Job:       '||tuple.job);
		dbms_output.put_line('Salary:    '||tuple.sal);
	end;
