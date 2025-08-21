set serveroutput on

create or replace procedure pro1(score number)
is 
    msg varchar2(100);
begin
    msg := '������ '|| score ||'�Դϴ�';
    dbms_output.put_line(msg);
    
    if score>=70 then 
    dbms_output.put_line('�հ�');
    else 
        dbms_output.put_line('���հ�');
    end if;
end;

--���ν��� ����
execute pro1(100);
execute pro1(65);
-----------------------------------------------------
--��������, ��������, ���������� ������ ����� ����Ͽ� ����ϴ� ���ν����� �����.
--����� 90���̻��̸� 'A',80���̻��̸� 'B', 70���̻��̸� 'C' ,60���̻��̸� 'D', 60���̸��̸� 'F' ����ϱ�.
--hint : if then
--       elsif then
--       else
--       end if
create or replace procedure pro2(ko number,en number, ma number)
is 
   msg varchar(100);
   totalscore number;
   avgscore number;
begin 
    totalscore := ko+en+ma;
    avgscore := totalscore/3;
    msg := '������ '||totalscore||'�̸� ����� '||avgscore||'�Դϴ�.';
    dbms_output.put_line(msg);
    if avgscore >=90 then
    dbms_output.put_line('A');
    elsif avgscore>=80 then
    dbms_output.put_line('B');
    elsif avgscore>=70 then
    dbms_output.put_line('C');
    elsif avgscore>=60 then
    dbms_output.put_line('D');
    else
    dbms_output.put_line('F');
    end if;
end;


--���ν��� ���
execute pro2(10,20,30); --f
execute pro2(60,70,100); --c
---------------------------------------------------------------------------
--�ݺ��� : loop, while, for
create or replace procedure pro3(start_num number,end_num number)
is
    total_num number := 0;
    i number;
    msg varchar2(100);
begin
     i := start_num;
     loop
--      if i > end_num then
--            exit;
--        end if;
        exit when i>end_num;   
        total_num := total_num+i;
        i := i+1;
    end loop;
    msg := start_num||'�� '||end_num||'�� ���� '|| total_num||'�Դϴ�.';
    dbms_output.put_line(msg);
end;

--���ν��� ���
execute pro3(1,10); 
execute pro3(11,20);
---------------------------------------------------------------------------
create or replace procedure pro4(start_num number,end_num number)
is
    total_num number := 0;
    i number;
    msg varchar2(100);
begin
     i := start_num;
--     loop
--      if i > end_num then
--            exit;
--        end if;
--        exit when i>end_num;   
    while i<=end_num loop
        total_num := total_num+i;
        i := i+1;
    end loop;
    msg := start_num||'�� '||end_num||'�� ���� '|| total_num||'�Դϴ�.';
    dbms_output.put_line(msg);
end;

--���ν��� ���
execute pro4(1,10); 
execute pro4(11,20);
------------------------------------------------------------------------------
create or replace procedure pro5(start_num number,end_num number)
is
   
begin
    for i in start_num..end_num loop
         dbms_output.put_line(i);
    end loop;
--    msg := start_num||'�� '||end_num||'�� ���� '|| total_num||'�Դϴ�.';
--    dbms_output.put_line(msg);
end;

--���ν��� ���
execute pro5(1,5); 
-----------------------------------------------------------------------------------
--into
create or replace procedure pro6(emp_id number)
is
    full_name varchar2(100);
begin
    select first_name||' '||last_name into full_name
    from employees
    where employee_id = emp_id;
    dbms_output.put_line('�̸��� '||full_name);
end;

--���ν��� ���
execute pro6(100);
-------------------------------------------------------------------------------
--�ڷ��� emp_id number
--      emp_id employees���̺��� employee_id �÷��ڷ��� : employees.employee_id%type
--      emp_id employees���̺��� �����ڷ��� : emp employees%rowtype
create or replace procedure pro7(emp_id employees.employee_id%type)
is
    full_name varchar2(100);
begin
    select first_name||' '||last_name into full_name
    from employees
    where employee_id = emp_id;
    dbms_output.put_line('�̸��� '||full_name);
end;

execute pro7(100);

create or replace procedure pro8(emp_id employees.employee_id%type)
is
    full_name varchar2(100);
    emp employees%rowtype;
begin
    --select first_name||' '||last_name into full_name
    select * into emp
    from employees
    where employee_id = emp_id;
    --dbms_output.put_line('�̸��� '||full_name);
    dbms_output.put_line(emp.employee_id||', '||emp.first_name||', '||emp.salary||', '||emp.department_id);
end;

execute pro8(100);
-----------------------------------------------------------------------------
--cursor
create or replace procedure pro9(dept_id departments.department_id%type)
is
    dept_name departments.department_name%type;
    emp employees%rowtype;
    cursor c1
    is
        select *
        from employees
        where department_id = dept_id;
begin
    select department_name into dept_name
    from departments
    where department_id = dept_id;
    dbms_output.put_line('�μ��� : '||dept_name);
    
    --�μ���ȣ�� �ش��ϴ� ������� ������ ����Ѵ�
    for emp in c1 loop
        dbms_output.put_line(emp.employee_id||', '||emp.first_name||', '||emp.salary||', '||emp.department_id);
    end loop;
end;

execute pro9(90);
---------------------------------------------------------------------------------------------------
--�Լ�
create or replace function cal_sal(emp_id employees.employee_id%type)
return number -- ��ȯ��
is
 real_sal number;
begin
    select salary + salary*nvl(commission_pct,0) into real_sal 
    from employees
    where employee_id = emp_id;
    return real_sal;
end;

select cal_sal(100),cal_sal(178) from dual;
-----------------------------------------------------------------------------------------
--�������� page_row�Ǿ� �����ָ鼭 page_num�������� �������� ��ȯ�Ѵ�.
create or replace function start_row(page_num number,page_row number)
return number
is
    start_row number;
begin
    start_row := page_row*(page_num-1)+1; 
    return start_row; 
end;
  
create or replace function end_row(page_num number,page_row number)
return number
is
    end_row number;
begin
    end_row := page_num*page_row;
    return end_row;   
end; 

select start_row(1,10),end_row(1,10) from dual; --1
select start_row(2,10),end_row(2,10) from dual; --11
select start_row(3,10),end_row(3,10) from dual; --21
select start_row(2,5),end_row(2,5) from dual; --6
select start_row(3,5),end_row(3,5) from dual; --11