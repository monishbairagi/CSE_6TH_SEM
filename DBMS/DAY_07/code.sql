-- structure
Declare
    -- declare all variables here
    x number(3);
    Begin
        -- code
        exception
        -- code
    end;

-- hello world program
Declare
    Begin
        dbms_output.put_line('hello world');
    end;

-- printing value
Declare
    x number(2);
    Begin
        x:=10;
        dbms_output.put_line(x);
    end;

-- adding two numbers
Declare
    x number(2);
    y number(2);
    z number(4);
    Begin
        x:=10;
        y:=5;
        z:=x+y;
        dbms_output.put_line('The sum is '||z);
    end;

-- bigger among two number
Declare
    x number(2);
    y number(2);
    z number(4);
    Begin
        x:=15;
        y:=15;
        if x>y then
            dbms_output.put_line(x);
        elsif x=y then
            dbms_output.put_line('same');
        else
            dbms_output.put_line(y);
        end if;
    end;

-- check odd or even
declare
    x number(2);
    begin
        x := 10;
        if mod(x,2)=0 then
            dbms_output.put_line('Even');
        else
            dbms_output.put_line('Odd');
        end if;
    end;

-- for loop
declare
    x number(2);
    y number(3);
    begin
        x:=10;
        for y in <reverse> 0..x loop
             dbms_output.put_line(y);
        end loop;
    end;

-- factorial
declare
    x number(2);
    y number(2);
    fac number(8);
    begin
        x:=2;
        fac:=1;
        for y in 2..x loop
            fac:=fac*y;
        end loop;
        dbms_output.put_line(fac);
    end;