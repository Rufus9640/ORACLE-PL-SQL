/*********************** Basic Loops ************************/
DECLARE
  v_counter NUMBER(2) := 1;
BEGIN
  LOOP
    dbms_output.put_line('My counter is : '|| v_counter);
    v_counter := v_counter + 1;
    --IF v_counter = 10 THEN
    --  dbms_output.put_line('Now I reached : '|| v_counter);
    --  EXIT;
    --END IF;
    EXIT WHEN v_counter > 10;
  END LOOP;
END;

/********************** WHILE LOOP **************************/
DECLARE
  v_counter NUMBER(2) := 1;
BEGIN
  WHILE v_counter <= 10 LOOP
    dbms_output.put_line('My counter is : '|| v_counter);
    v_counter := v_counter + 1;
   -- EXIT WHEN v_counter > 3;
  END LOOP;
END;
/************************************************************/


/************************ FOR LOOP **************************/
BEGIN
  FOR i IN REVERSE 1..3 LOOP
    dbms_output.put_line('My counter is : ' || i);
  END LOOP;
END;
/************************************************************/