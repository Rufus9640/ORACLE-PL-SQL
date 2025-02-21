declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  loop
    fetch c_emps into v_emps;
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
  end loop;
  close c_emps;
end; 
---------------%notfound example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  loop
    fetch c_emps into v_emps;
    exit when c_emps%notfound;
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
  end loop;
  close c_emps;
end;
---------------while loop example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  fetch c_emps into v_emps;
  while c_emps%found loop
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
    fetch c_emps into v_emps;
    --exit when c_emps%notfound;
  end loop;
  close c_emps;
end;
---------------for loop with cursor example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  for i in 1..6 loop
    fetch c_emps into v_emps;
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
  end loop;
  close c_emps;
end;
---------------FOR..IN clause example
declare
  cursor c_emps is select * from employees where department_id = 30;
begin
  for i in c_emps loop
    dbms_output.put_line(i.employee_id|| ' ' ||i.first_name|| ' ' ||i.last_name);
  end loop;
end;
---------------FOR..IN with select example
begin
  for i in (select * from employees where department_id = 30) loop
    dbms_output.put_line(i.employee_id|| ' ' ||i.first_name|| ' ' ||i.last_name);
  end loop;
end;


declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(20);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(20);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
--------------- bind variables as parameters
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_emp);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_emp);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
---------------cursors with two different parameters
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_dept_id);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
  
  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id2);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
--------------- cursor with parameters - for in loops
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_dept_id);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
  
  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
    
    for i in c_emps(:b_dept_id2) loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name);
    end loop;
end;
---------------cursors with multiple parameters
declare
  cursor c_emps (p_dept_id number , p_job_id varchar2) is select first_name,last_name,job_id,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id
                    and job_id = p_job_id;
  v_emps c_emps%rowtype;
begin
    for i in c_emps(50,'ST_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
    dbms_output.put_line(' - ');
    for i in c_emps(80,'SA_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
end;
--------------- An error example of using parameter name with the column name
declare
  cursor c_emps (p_dept_id number , job_id varchar2) is select first_name,last_name,job_id,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id
                    and job_id = job_id;
  v_emps c_emps%rowtype;
begin
    for i in c_emps(50,'ST_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
    dbms_output.put_line(' - ');
    for i in c_emps(80,'SA_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
end;
