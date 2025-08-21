--�׷��Լ�: sum(), count(), avg(), max(), min()..... 
select sum(salary) �޿�����
,count(*) �����
,count(department_id) "�μ��� ���� �����"
,count(commission_pct) "������ �޴� �����"
,avg(salary) "�޿� ���"
,max(salary) "�ִ� �޿�"
,min(salary) "�ּ� �޿�"
from employees;

------------------------------------------------------------------
--GROUP BY������ ����� �÷��� SELECT������ �׷��Լ��� �Բ� ����� ���ִ�.
--�μ��� ������� ����Ͻÿ�.
select department_id,count(*) --EMPLOYEE_ID, DEPARTMENT_ID,COUNT(*) �Ұ�
from employees
group by department_id
ORDER BY 2 desc;

--2007�⿡ �Ի��� ������� ��ձ޿� 
select count(*) "2007�� �Ի��ڼ�",avg(salary) "�⵵���Ի��ڱ޿����"
from employees
where to_char(hire_date,'YYYY') = '2007';

--�⵵�� �Ի��� ������� ��ձ޿��� ����Ͻÿ�, �� �ֱٿ������� ����Ͻÿ�.
select to_char(hire_date,'YYYY') �⵵, count(*) "�⵵�� �Ի��ڼ�",avg(salary) "�⵵���Ի��ڱ޿����" 
from employees
group by to_char(hire_date,'YYYY')
order by to_char(hire_date,'YYYY') desc;

--���� �Ի��� ������� ��ձ޿��� ����Ͻÿ�, �� 1������ ����Ͻÿ�.
select to_number(to_char(hire_date,'MM')) ��, count(*) "���� �Ի��ڼ�",avg(salary) "�����Ի��ڱ޿����" 
from employees
group by to_char(hire_date,'MM')
order by 1;

select to_number(to_char(hire_date,'FMMM')) ��, count(*) "���� �Ի��ڼ�",avg(salary) "�����Ի��ڱ޿����" 
from employees
group by to_char(hire_date,'FMMM')
order by 1;

--����
select location_id, city
from locations;

--�μ�
select department_id, location_id
from departments;

--������ ������ȣ, �μ����� ����Ͻÿ�.
select location_id, count(department_id)
from departments
group by location_id;

--������ ������ȣ, ,���ø�, �μ����� ����Ͻÿ�. --�ȵ�., �ذ��Ϸ��� join�Ǵ� subquery�� �ذ�.
select location_id, city,count(*)
from departments
group by location_id;

--�Ϲݱ�(7��~12��) ���� �Ի��ڼ��� ����Ͻÿ�. 
select to_number(to_char(hire_date,'MM')) �Ի��, count(*) "���� �Ի��ڼ�"
from employees
where to_number(to_char(hire_date,'MM')) between '7' and '12' 
group by to_number(to_char(hire_date,'MM'))
order by 1;

--having : �׷쿡 ���� ������
--�Ϲݱ�(7��~12��) ���� �Ի��ڼ��� ����Ͻÿ�. 
--��, �Ի��ڼ��� 7���̻��� ���� ����Ͻÿ�.

select to_number(to_char(hire_date,'MM')) �Ի��, count(*) "���� �Ի��ڼ�"
from employees
where to_number(to_char(hire_date,'MM')) between '7' and '12' 
group by to_number(to_char(hire_date,'MM'))
having count(*)>=7 
order by 1;

--�޿��� 5000�̻��� ������� �μ��� ��ձ޿��� ����Ͻÿ�. ��, ��ձ޿��� 10000�̻��� �μ��� ����Ͻÿ�.
select department_id,avg(salary)
from employees
where salary>=5000
group by department_id
having avg(salary)>=10000;

--�μ��� ������� ����Ͻÿ�.
select department_id,count(*)
from employees
group by department_id;

--�μ��� ������� ����Ͻÿ�. ��� ���յ� ����Ͻÿ�.
select department_id,count(*)
from employees
group by rollup(department_id);

--�μ���,������ ������� ����Ͻÿ�.
select department_id,job_id,count(*)
from employees
group by department_id,job_id
order by department_id,job_id;

--�μ���, ������ ������� ����Ͻÿ�. �ѻ����, �μ��� ������� ����Ͻÿ�. ��� �μ��� ���� ����� �����Ѵ�.
select nvl(to_char(department_id),'�ѻ����')
      ,nvl(job_id,'�μ��� �����')
      ,count(*)
from employees
where department_id is not null
group by rollup(department_id,job_id)
order by department_id,job_id;

--cube
select nvl(to_char(department_id),'�ѻ����')
      ,nvl(job_id,'�μ��� �����')
      ,count(*)
from employees
where department_id is not null
group by cube(department_id,job_id)
order by department_id,job_id;