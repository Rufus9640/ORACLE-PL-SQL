DECLARE
  message varchar2(100) NOT NULL ; 
BEGIN 
  dbms_output.put_line(message); 
END;
/

-- error occurs cuz of not null constraint
--message varchar2(100) NOT NULL ;
--        *
--ERROR at line 2:
--ORA-06550: line 2, column 11:
--PLS-00218: a variable declared NOT NULL must have an initialization assignment




DECLARE
  message varchar2(100) NOT NULL default 'hello world';
BEGIN 
  dbms_output.put_line(message); 
END;
/

--assigning an default value to an variable


DECLARE
  message varchar2(100) NOT NULL default 'hello world'; 
BEGIN 
message:= 'hii';
  dbms_output.put_line(message); 
END;
/

--Output:
--hii
-- the updated value will be printed in the output

DECLARE
  message varchar2(100) NOT NULL default 'hello world'; 
BEGIN 
message:= 'hii' || ' hello';
  dbms_output.put_line(message ||' namate'); 
END;
/

--Output:

--hii hello namate
-- || is used for concatinaton, it can be used in output line as well as the initialization

---------------------------------------------------------------------------
--number keyword usage

DECLARE
  eg number:= 10.2;
BEGIN 
  dbms_output.put_line(eg ||' namaste'); 
END;
/

--Output:

--10.2 namaste
--since there is no preision everything will print

DECLARE
  eg number(7,2):= 10.2345; --here 7 is the total number length and 2 is the required numbers after the value in the output
--in the braket the first number should be greater than or equal to the total number of digits 
--and the second number should be the numbers required after the dots
BEGIN 
  dbms_output.put_line(eg ||' namaste'); 
END;
/

--Output:

--10.23 namaste
-----------------------------------------------------------------------------------
--pls integer

DECLARE
  eg pls_integer:= 10;
BEGIN 
  dbms_output.put_line(eg ||' namaste'); 
END;
/

-Output:

--10 namaste

--same as number but it takes only integer values performance will be better in complex programmes
---------------------------------------------------------------------------------------
binary_int

DECLARE
  eg binary_int:= 10;
BEGIN 
  dbms_output.put_line(eg ||' namaste'); 
END;
/

-Output:

--10 namaste
--------------------------------------------------------------------------------------
binary_float

DECLARE
  eg binary_float:= 10.42f; --f should be added at the end of the number
BEGIN 
  dbms_output.put_line(eg ||' namaste'); 
END;
/

-Output:

--10.42f namaste
----------------------------------------------------------------
date

DECLARE
  eg date:= sysdate; --using sysdate
BEGIN 
  dbms_output.put_line(eg ||' namaste'); 
END;
/

--Output:

--10-FEB-25 namaste


DECLARE
  eg date:= '23-MAY-22';--ORDER Should not be changed while declaring
BEGIN 
  dbms_output.put_line(eg || ' IS THE DATE '); 
END;
/

--Output:

--23-MAY-22 IS THE DATE
-------------------------------------------------------------
Timestamp

DECLARE
  eg timestamp:= systimestamp;
BEGIN 
  dbms_output.put_line(eg || ' IS THE DATE '); 
END;
/

--Output:

--10-FEB-25 06.05.13.592438 PM IS THE DATE


DECLARE
  eg timestamp(3) with time zone:= systimestamp;--with timezone precision can be changed based on the timezone
BEGIN 
  dbms_output.put_line(eg || ' IS THE DATE '); 
END;
/


--Output:

--10-FEB-25 06.07.00.295 PM +00:00 IS THE DATE

-----------------------------------------------------------
boolean

DECLARE
  eg boolean:= true;
BEGIN 
  dbms_output.put_line(eg || ' IS THE DATE '); 
END;
/


-- Output:

--   dbms_output.put_line(eg || ' IS THE DATE ');
--                       *
-- ERROR at line 4:
-- ORA-06550: line 4, column 24:
-- PLS-00306: wrong number or types of arguments in call to '||'
-- ORA-06550: line 4, column 3:
-- PL/SQL: Statement ignored

--boolean cannot be printed it can only be used in if and all


----------------------------------------------------

--Declaring & Initializing & Using Variables (Code Samples)


-----------------------===================-----------------------
-----------------------DECLARING VARIABLES-----------------------
-----------------------===================-----------------------
SET SERVEROUTPUT ON;
DECLARE 
    v varchar2(20) := 2 + 25 * 3;
BEGIN
    dbms_output.put_line(v);
END;
-----------------------===================-----------------------
DECLARE 
    v_text varchar2(50) NOT NULL DEFAULT 'Hello';
    v_number1 number := 50;
    v_number2 number(2) := 50.42;
    v_number3 number(10,2) := 50.42;
    v_number4 PLS_INTEGER := 50;
    v_number5 BINARY_float := 50.42;
    v_DATE1 DATE := '22-NOV-18 12:01:32';
    v_DATE2 timestamp := systimestamp;
    v_DATE3 timestamp(9) WITH TIME ZONE := systimestamp;
    v_DATE4 interval day(4) to second (3) := '124 02:05:21.012 ';
    v_DATE5 interval year to month := '12-3';
BEGIN
    V_TEXT := 'PL/SQL' || 'Course';
    DBMS_OUTPUT.PUT_LINE(V_TEXT);
    DBMS_OUTPUT.PUT_LINE(v_number1);
    DBMS_OUTPUT.PUT_LINE(v_number2);
    DBMS_OUTPUT.PUT_LINE(v_number3);
    DBMS_OUTPUT.PUT_LINE(v_number4);
    DBMS_OUTPUT.PUT_LINE(v_number5);
    DBMS_OUTPUT.PUT_LINE(v_DATE1);
    DBMS_OUTPUT.PUT_LINE(v_DATE2);
    DBMS_OUTPUT.PUT_LINE(v_DATE3);
    DBMS_OUTPUT.PUT_LINE(v_DATE4);
    DBMS_OUTPUT.PUT_LINE(v_DATE5);
    END;
----------------==================================---------------
----------------USING BOOLEAN DATA TYPE in PL/SQL----------------
----------------==================================---------------
DECLARE
    v_boolean boolean := true;
BEGIN
    dbms_output.put_line(sys.diutil.bool_to_int(v_boolean));
END;
----------------==================================---------------

















