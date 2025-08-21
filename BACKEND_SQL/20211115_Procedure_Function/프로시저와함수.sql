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
create or replace procedure pro3(start_num number,end_num number)
is
    total_num number := 0;
    i number;
    msg varchar2(100);
begin
     i := start_num;
    loop
        total_num := total_num+i;
        i := i+1;
        if i > end_num then
            exit;
        end if;    
    end loop;
    msg := start_num||'과 '||end_num||'의 합은 '|| total_num||'입니다.';
    dbms_output.put_line(msg);
end;

--프로시저 출력
execute pro3(1,10); 
execute pro3(11,20);