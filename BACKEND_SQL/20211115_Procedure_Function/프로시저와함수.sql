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
    msg := start_num||'�� '||end_num||'�� ���� '|| total_num||'�Դϴ�.';
    dbms_output.put_line(msg);
end;

--���ν��� ���
execute pro3(1,10); 
execute pro3(11,20);