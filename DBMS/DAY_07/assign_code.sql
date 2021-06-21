-- 1) Display your name and Mobile number
Declare
    Begin
        dbms_output.put_line('Name: Monish Kr. Bairagi');
		dbms_output.put_line('Mobile Number: 9038741205');
    end;

-- 2) Calculate the average of three numbers and classify the average into three classes 'A', 'B', and 'C; respectively, use your own assumption.
declare
	a number(2);
	b number(2);
	c number(2);
	average number(2);
	begin
		a:=67;
		b:=96;
		c:=59;
		average:=(a+b+c)/3;
		if average>=80 then
			dbms_output.put_line('Class A, Marks:'||average);
		elsif average>=60 and average<80 then
			dbms_output.put_line('Class B, Marks:'||average);
		else
			dbms_output.put_line('Class C, Marks:'||average);
		end if;
	end;

-- 3) Find whether a given number is ODD or Even 
declare
    x number(2);
    begin
        x := 10;
        if mod(x,2)=0 then
            dbms_output.put_line(x||' is Even');
        else
            dbms_output.put_line(x||' is Odd');
        end if;
    end;
	
-- 4) Display ur name for 'n' times using for and while loop.
declare
	n number(2);
	i number(2);
	begin
		n:=3;
		dbms_output.put_line('Using For loop:-');
		for i in 1..n loop
			dbms_output.put_line(i||') Monish Kr. Bairagi');
		end loop;
		i:=1;
		dbms_output.put_line('Using While loop:-');
		while i<=n loop
			dbms_output.put_line(i||') Monish Kr. Bairagi');
			i:=i+1;
		end loop;
	end;
	

-- 5) Print the first 'n' natural number in descending order. use your own assumption.
declare
	n number(2);
	i number(2);
	begin
		n:=5;
		for i in reverse 1..n loop
			dbms_output.put_line(i);
		end loop;
	end;

-- 6) Find the factorial of 'n' number
declare
    n number(2);
    i number(2);
    f number(8);
    begin
        n:=5;
        f:=1;
        for i in 2..n loop
            f:=f*i;
        end loop;
        dbms_output.put_line('Factorial of '||n||' is '||f);
    end;