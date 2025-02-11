/*********************** Example 1 **************************/
DECLARE
 v_inner NUMBER := 1;
BEGIN
 FOR v_outer IN 1..10 LOOP
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    WHILE v_inner * v_outer < 15 LOOP
      v_inner := v_inner + 1;
      CONTINUE WHEN MOD(v_inner * v_outer,3) = 0;
      dbms_output.put_line('  My inner value is : ' || v_inner );
    END LOOP;
 END LOOP;
END;
/************************************************************/
 
 
/*********************** Example 2 **************************/
DECLARE
 v_inner NUMBER := 1;
BEGIN
<<outer_loop>>
 FOR v_outer IN 1..10 LOOP
  dbms_output.put_line('My outer value is : ' || v_outer );
    v_inner := 1;
    <<inner_loop>>
    LOOP
      v_inner := v_inner + 1;
      CONTINUE outer_loop WHEN v_inner = 10;
      dbms_output.put_line('  My inner value is : ' || v_inner );
    END LOOP inner_loop;
 END LOOP outer_loop;
end;
/************************************************************/

/******** Finding Prime Numbers Using GOTO Statement ********/
DECLARE
  v_searched_number NUMBER  := 22;
  v_is_prime        BOOLEAN := true;
BEGIN
  FOR x IN 2..v_searched_number-1 LOOP
    IF v_searched_number MOD x = 0 THEN
      dbms_output.put_line(v_searched_number|| ' is not a prime number..');
      v_is_prime := false;
      GOTO end_point;
    END IF;
  END LOOP;
  IF v_is_prime THEN 
    dbms_output.put_line(v_searched_number|| ' is a prime number..');
  END IF;
<<end_point>>
  dbms_output.put_line('Check complete..');
END;
 
/************************************************************/
DECLARE
  v_searched_number NUMBER  := 32457;
  v_is_prime        BOOLEAN := TRUE;
  x                 NUMBER  := 2;
BEGIN
  <<start_point>>
    IF v_searched_number MOD x = 0 THEN
      dbms_output.put_line(v_searched_number|| ' is not a prime number..');
      v_is_prime := FALSE;
      GOTO end_point;
    END IF;
  x := x+1;
  IF x = v_searched_number THEN
    GOTO prime_point;
  END IF;
  GOTO start_point;
  <<prime_point>>
  IF v_is_prime THEN
    dbms_output.put_line(v_searched_number || ' is a prime number..');
  END IF;
<<end_point>>
  dbms_output.put_line('Check complete..');
END;
/************************************************************/