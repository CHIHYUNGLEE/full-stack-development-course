set serveroutput on

create or replace procedure pro1(score number)
is 
    msg varchar2(100);
begin
    msg := '점수는 '|| score ||'입니다';
    dbms_output.put_line(msg);
    
    if score>=70 then 
    dbms_output.put_line('합격');
    else 
        dbms_output.put_line('불합격');
    end if;
end;

--프로시저 실행
execute pro1(100);
execute pro1(65);
-----------------------------------------------------
--국어점수, 영어점수, 수학점수의 총점과 평균을 계산하여 출력하는 프로시저를 만들기.
--평균이 90점이상이면 'A',80점이상이면 'B', 70점이상이면 'C' ,60점이상이면 'D', 60점미만이면 'F' 출력하기.
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
    msg := '총점은 '||totalscore||'이며 평균은 '||avgscore||'입니다.';
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


--프로시저 출력
execute pro2(10,20,30); --f
execute pro2(60,70,100); --c
---------------------------------------------------------------------------
--반복문 : loop, while, for
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
    msg := start_num||'과 '||end_num||'의 합은 '|| total_num||'입니다.';
    dbms_output.put_line(msg);
end;

--프로시저 출력
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
    msg := start_num||'과 '||end_num||'의 합은 '|| total_num||'입니다.';
    dbms_output.put_line(msg);
end;

--프로시저 출력
execute pro4(1,10); 
execute pro4(11,20);
------------------------------------------------------------------------------
create or replace procedure pro5(start_num number,end_num number)
is
   
begin
    for i in start_num..end_num loop
         dbms_output.put_line(i);
    end loop;
--    msg := start_num||'과 '||end_num||'의 합은 '|| total_num||'입니다.';
--    dbms_output.put_line(msg);
end;

--프로시저 출력
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
    dbms_output.put_line('이름은 '||full_name);
end;

--프로시저 출력
execute pro6(100);
-------------------------------------------------------------------------------
--자료형 emp_id number
--      emp_id employees테이블의 employee_id 컬럼자료형 : employees.employee_id%type
--      emp_id employees테이블의 한행자료형 : emp employees%rowtype
create or replace procedure pro7(emp_id employees.employee_id%type)
is
    full_name varchar2(100);
begin
    select first_name||' '||last_name into full_name
    from employees
    where employee_id = emp_id;
    dbms_output.put_line('이름은 '||full_name);
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
    --dbms_output.put_line('이름은 '||full_name);
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
    dbms_output.put_line('부서명 : '||dept_name);
    
    --부서번호에 해당하는 사원들의 정보를 출력한다
    for emp in c1 loop
        dbms_output.put_line(emp.employee_id||', '||emp.first_name||', '||emp.salary||', '||emp.department_id);
    end loop;
end;

execute pro9(90);
---------------------------------------------------------------------------------------------------
--함수
create or replace function cal_sal(emp_id employees.employee_id%type)
return number -- 반환형
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
--페이지당 page_row건씩 보여주면서 page_num페이지의 시작행을 반환한다.
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