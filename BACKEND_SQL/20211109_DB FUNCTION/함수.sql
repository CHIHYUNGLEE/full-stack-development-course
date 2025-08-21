--�������Լ�
--����:LENGTH()
SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ') FROM dual;
SELECT employee_id, first_name, LENGTH(first_name)
FROM employees;
--�̸��� 8�ڸ��̻��� ������� ���, �̸��� ����Ͻÿ�
SELECT employee_id, first_name
FROM employees
WHERE LENGTH(first_name)>=8;

--�빮�ڷ� ��ȯ: UPPER(), �ҹ��ڷ� ��ȯ: LOWER(), ù���ڸ� �빮�ڷ� ��ȯ: INITCAP()
SELECT UPPER('heLLo'), LOWER('heLLo'), INITCAP('heLLo')
FROM dual;

--Ư�������� ��ġ��ȯ : INSTR()
SELECT INSTR('hellojava', 'a') --7
      ,INSTR('hellojava', 'a', 8) --9
      ,INSTR('hellojava', 'b') --0
      ,INSTR('hellojava', 'a', -1)  --9
      ,INSTR('hellojava', 'a', -1, 2) --7
FROM dual;

--�κй��ڿ� ��ȯ : SUBSTR()
SELECT SUBSTR('hellojava', 2, 6) --elloja
    , SUBSTR('hellojava', 2) --ellojava
FROM dual;

--���ڿ� ���� : TRIM()
SELECT TRIM( LEADING 'a' FROM 'aABCaDEFaHa') --���� ���� 'a'����
      ,TRIM( TRAILING 'a' FROM 'aABCaDEFaHa') --������ ���� 'a'����
      ,TRIM( BOTH 'a' FROM 'aABCaDEFaHa') --���ʿ����� ���� 'a'����
      ,TRIM( BOTH 'a' FROM 'aaaABCaaDEFaaa')
FROM dual;

--���ڿ� ���̱� : LPAD, RPAD
SELECT LPAD('abc', 5, '*')
      ,RPAD('abc', 5, '*')
      ,RPAD(LPAD('abc', 5, '*'), 7, '*')
FROM dual;

--���ڿ� ġȯ�Լ� : REPLACE(), TRANSLATE()
SELECT REPLACE('JACK and JUE', 'J', 'BL') --J�� BL�� ��ȯ
      ,TRANSLATE('JACK and JUE', 'J', 'BL') --J�� B��  ��ȯ
      ,REPLACE('BCCARD', 'BC', 'KB')
      ,TRANSLATE('BCCARD', 'BC', 'KB')
FROM dual;
-----------------------------------------------------------------
--�������Լ�
--�������� ��ȯ : MOD()
SELECT 3+4, 3-4, 3*4, 3/4, MOD(3, 4)  --7	-1	12	0.75	3
FROM dual;
--�ݿø��� �� ��ȯ : ROUND()
SELECT ROUND(45.923) --46
      ,ROUND(45.923, 0) --46 :���� �ڸ������� ǥ��
      ,ROUND(45.923, 2) --45.92 : �Ҽ�������2�ڸ����� ǥ�� 
      ,ROUND(45.923, -1) --50 : ���� �ڸ������� ǥ��
FROM dual;

--������ �� ��ȯ : TRUNC()
SELECT TRUNC(45.923) -- 45
      ,TRUNC(45.923, 0) -- :45 ���� �ڸ������� ǥ��
      ,TRUNC(45.923, 2) -- : 45.92 �Ҽ�������2�ڸ����� ǥ�� 
      ,TRUNC(45.923, -1) -- : 40 ���� �ڸ������� ǥ��
FROM dual;

--1. �̸��� ��ҹ��ڱ��о��� 'e'�� ������ ������� ���, �̸��� ����Ͻÿ�. (OR������ ������)
select employee_id,first_name
from employees
where lower(first_name) like '%e%';

select employee_id,first_name
from employees
where instr(lower(first_name),'e') <> 0;

--2. �Ǳ޿�(�޿�+(�޿�*�����)�� 10000���� ���� �Ǳ޿��� �޴� ������� ���, �޿�, �����, �Ǳ޿��� ����Ͻÿ�
--��, �Ǳ޿��� ���� �ڸ����� �ݿø��ϰ� �Ǳ޿��� ���� �޴� �������� ����Ѵ�
SELECT employee_id ���, salary �޿�, commission_pct ������, round(salary+(salary*NVL(commission_pct, 0)),-1) �Ǳ޿�
FROM employees
where salary+(salary*NVL(commission_pct, 0))>10000
order by �Ǳ޿� desc;
---------------------------------------------
--��¥���Լ�
--����ð��� ��ȯ : sysdate �Լ�(�����)
select sysdate
from dual;
--��¥ + ����
--sysdate + 1�� ���ϳ�¥�� ��ȯ
--sysdate + 2�� �𷹳�¥�� ��ȯ
--sysdate - 1�� ������¥�� ��ȯ
select sysdate + 1
      ,sysdate + 2
      ,sysdate - 1 
from dual;
--��¥-��¥�� �ϼ��� ��ȯ
select (sysdate+3)-sysdate
from dual;
--������ ���Ѵ� add_months()
select sysdate, add_months(sysdate ,5),add_months(sysdate,-2)
from dual;

--�������� ��ȯ�Ѵ� : months_between()
select sysdate ,months_between('22/03/04',sysdate)
               ,months_between('20220304',sysdate) --�������.    
from dual;
--3.����� ���, �Ի�����, �ٹ��ϼ�, �ٹ� ������, �ٹ������ ����Ͻÿ�
select employee_id ��� ,hire_date 
      ,sysdate-hire_date �ٹ��ϼ� 
      ,trunc(months_between(sysdate,hire_date),0) �ٹ�������
      ,round(months_between(sysdate,hire_date)/12,1) �ٹ��ƽ�
from employees
order by �ٹ��ϼ� desc;
--���ڱ������� �������Ͽ� �ش糯¥�� ��ȯ�Ѵ� : nextday()
--�������� �������� ��������Ͽ� �ش��ϴ� ��¥�� ����Ͻÿ�
select sysdate, next_day(sysdate, '��') from dual;

--22�� 1��1�� �������� ���������Ͽ� �ش��ϴ� ��¥�� ����Ͻÿ�
select next_day('22/01/01','��') from dual;
--------------------------------------------------------------------------
--����ȯ�Լ�
--�������� ���������� to_number()
--�������� ��¥������ to_date()
--�������� ���������� to_char()
--��¥���� ���������� to_char()
--�������� ��¥������ �ٲܼ��� �����Ƿ� ����-����-��¥������ �ٲ۴�.

--�ڵ�����ȯ
select '1'||2 from dual; --���� '12'
select '1'+2 from dual; --���� 3
select '21/12/25', months_between('21/12/25',sysdate) from dual; --'12/12/25'�������� ��¥������ �ڵ�����ȯ��.
select employee_id, hire_date
from employees
where hire_date >= '08/01/01'; -- ��¥��>=������ -> �������� ��¥������ �ڵ�����ȯ��.
select '�Ի����� - '||hire_date from employees; -- ��� ��¥���� ���������� �ڵ�����ȯ��.

--��������ȯ
select '1'|| to_char(2) from dual; --���� '12'
select to_number('1')+2 from dual; --���� 3
select '21/12/25', months_between('21/12/25',sysdate) from dual; --'12/12/25'�������� ��¥������ �ڵ�����ȯ��.
select employee_id, hire_date
from employees
where hire_date >= '08/01/01'; -- ��¥��>=������ -> �������� ��¥������ �ڵ�����ȯ��.
select '�Ի����� - '||hire_date from employees; -- ��� ��¥���� ���������� �ڵ�����ȯ��.
select '�Ի����� - '||hire_date, '�Ի����� - '||to_char(hire_date) from employees;

--����->���� : to_char()  ���� : 9 0 , . L
select 24000, to_char(24000,'9,999,999') , to_char(24000,'9,999')
            , to_char(24000,'00000000.00'), to_char(24000,'L9,999,999')
from dual;
--����� ���,�޿��� ����Ͻÿ�.
select employee_id, to_char(salary,'9,999,999') �޿�
from employees;

--��¥->���� : to_char() ���� - Y M D HH MI SS DAY
select sysdate, to_char(sysdate,'YYYYMMDD HH:MI:SS')
              , to_char(sysdate,'YYYYMMDD HH24:MI:SS')
              , to_char(sysdate,'YYYYMMDD HH24:MI:SS DAY')
from dual;
--���� -> ���� : to_number()
select 12345,'1,234.5',to_number('1,234.5','9,999.0')+1
from dual;
--���� -> ��¥ :to_date()
select '21/11/12',to_date('21/11/12')+1,sysdate - to_date('21-10-06 ���� 09:00','YY-MM-DD am HH:MI') �����ϼ�
from dual;
--��¥�� ������ : �ú������� ����
select hire_date
from employees
--where hire_date>'08/01/01'; --2008�� 1�� 1�Ϻ��� ū ��¥�� �ƴ� 2008�� 1�� 1�� 0�� 0�� 0�� ���� �� ����.
where to_date(hire_date,'yy/mm/dd')>to_date('08/01/01','yy/mm/dd');

--------------------------------------------------------------------------------------------
--NULL�����Լ�
--nvl()
--nvl2( , , )
--������߿� �����ڰ� ���� ����� ����Ͻÿ�.
select *
from employees
where manager_id is null;
--�����ڰ� ���� ����� 0, �մ� ����� �״�� ����Ͻÿ�.
select employee_id,nvl(manager_id,0)
from employees;
--�����ڰ� ���� ����� '������ ����', �մ� ����� �״�� ����Ͻÿ�.
select employee_id,nvl(to_char(manager_id),'������ ����') ������
from employees;
--�����ڰ� ���� ����� '������ ����', �մ� ����� '������ ����'���� ����Ͻÿ�.
select employee_id,nvl2(manager_id,'������ ����','������ ����') ������
from employees;
--nullif: ����1�� ����2�� ����� ���� ������� null��ȯ, �ٸ��� ����1���� ��ȯ
select employee_id,nullif(salary,24000)
from employees;
----------------------------------------------------------------------------
--sql�� �������,���ǹ�ó��,�ݺ���ó�� ����.
--���� �Լ� : decode()
--�����ڰ� ���� ����� '������ ����', �մ� ����� '������ ����'���� ����Ͻÿ�.
select employee_id, decode(manager_id,null,'�����ھ���','����������')--if(manager_id==null){�����ھ��� ���} else{���������� ���}
from employees;

--�μ���ȣ�� 80�̸� '������', 60�̸� 'IT��', �׿��ǰ��̸� '�׿��� �μ�' ����Ͻÿ�.
select decode(department_id,80,'������',60,'IT��','�׿��Ǻμ�')
from employees;
--������ : case
--case when then
--     when then
--     else 
--end  
select employee_id, case when manager_id is null then '�����ھ���'
                         else'����������'
                    end
from employees;

select employee_id, case department_id when 80 then '������'
                                      when 60 then 'IT��'
                                      else'�׿��Ǻμ�'
                                      end
from employees;
--����� ���,�޿�,�޿������ ����Ͻÿ�
--����� �޿��� 10000�̻��� ��� 'A',5000�̻��� ��� 'B',5000�̸��̸� 'C'����̴�.
select employee_id,salary, case when salary>=10000 then 'A'
                                when salary>=5000 then 'B'
                                else 'C'
                                end as �޿����
from employees;