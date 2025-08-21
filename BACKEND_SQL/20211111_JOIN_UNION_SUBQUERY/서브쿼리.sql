--��������
--���� ������ ��ġ�� ����
--��Į�� ���� : select(select~~)
--�ζ��� �� : from(select~~)
--���� ���� : where �÷� �񱳿���(=select~~)

--���������� ��ȯ����� ����
--�����༭������ - �Ϲ� �񱳿����� ��밡��(=,<>,>,>=,<=,<)
--�����༭������ - in, any, all

--����߿��� �ִ� �޿��� �޴� ����� �޿��� ����Ͻÿ�.

select max(salary)
from employees;

--����߿��� �ִ� �޿��� �޴� ����� ���,�̸�,�޿��� ����Ͻÿ�.
--1) �ִ� �޿��� ����Ѵ�. select max(salary) from employees;
--2) �ִ� �޿��� ���� �޿��� �޴� ����� �����Ѵ�.
select employee_id, first_name, salary
from employees
where salary = (select max(salary) from employees);

--��ձ޿����� ���� �޿��� �޴� ����� ���, �̸�,�޿��� ����Ͻÿ�.
select avg(salary)
from employees;

select employee_id, first_name, salary
from employees
where salary > (select avg(salary) from employees); 

--�ִ�޿��� �޴� ����� ���� �μ����� �ٹ��ϴ� ������� ���,�̸�,�޿�,�μ���ȣ�� ����Ͻÿ�.
--1)�ִ�޿��� �޴� ����� �μ���ȣ�� �˻��Ѵ�. 
--2)1�� ���� �μ���ȣ�� ���� ����� ���.
select employee_id, first_name,salary,department_id
from employees
where department_id=(select department_id
                     from employees
                     where salary =(select max(salary) from employees));
-----------------------------------------------------------------------------------
--������ ��������

--�μ��� �ִ�޿��� ����Ͻÿ�.
select department_id, max(salary)
from employees
group by department_id;

--�μ��� �ִ�޿����� ���� �޿��� �޴� ������� ���,�̸�,�μ���ȣ,�޿��� ����Ͻÿ�.
--1)�μ��� �ִ�޿��� ����ϴ�.
--2)�μ��� �ִ�޿����� ���� �޿��� �޴� ������� ���,�̸�,�μ���ȣ,�޿����
select employee_id, first_name, department_id,salary
from employees
where salary > (select max(salary) from employees group by department_id); --(x)

--in
select employee_id, first_name, department_id,salary
from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);  -- 11�� null�μ� ����

select employee_id, first_name, department_id,salary
from employees
where (nvl(department_id,0), salary) in (select nvl(department_id,0), max(salary) from employees group by department_id);  --12�� null�μ� ����

--=any�� in�� ����.
--<any�� �ִ밪���� �۴�.
-->any�� �ּҰ����� ũ��.
--<all�� �ּҰ����� �۴�.
-->all�� �ִ밪���� ũ��.
select employee_id, first_name, department_id,salary
from employees
where (nvl(department_id,0), salary) =any (select nvl(department_id,0), max(salary) from employees group by department_id); 

--������ ����Ƽ���α��� ������� �ִ�޿����� ���� �޿��� �޴� ����� ���,�̸�,�޿�,������ ����Ͻÿ�.
select employee_id, first_name, job_id, salary
from employees
where job_id = 'IT_PROG';

select employee_id, first_name,job_id, salary
from employees
where salary<(
select max(salary)
from employees
where job_id = 'IT_PROG'); --max���

select employee_id, first_name,job_id, salary
from employees
where salary < any (
select salary
from employees
where job_id = 'IT_PROG'); --<any���

--------------------------------------------------
��å�� president�� ����� ���,�̸��� ����Ͻÿ�.

select employee_id,first_name
from employees
natural join jobs
where job_title = 'President';

select employee_id,first_name
from employees
where job_id
=(select job_id
from jobs
where job_title = 'President');
--------------------------------------------------
--��Į������
--�μ���ȣ, �μ���, �μ��� �޿��Ѿ��� ����Ͻÿ�.
select department_id, department_name, sum(salary)
from employees 
join departments
using(department_id)
group by department_id, department_name;

select department_id,(select department_name from departments where department_id = employees.department_id),sum(salary)
from employees
group by department_id;

---------------------------------------------------------------------------------------------------------------------
--�ǽ�
--16. ���� 'Davies'�� ����� ���� �μ��� �ٹ��ϴ� ������� ���, ��, �̸��� ����Ͻÿ�

select employee_id, first_name,first_name
from employees
where department_id = (select department_id from employees where last_name = 'Davies') 
and last_name != 'Davies';

--'Sales'�μ��� ��ձ޿����� ���� �޿��� �޴� ������� �μ���ȣ,���,�޿��� ����Ͻÿ�.
select department_id,employee_id, salary
from employees
where salary > (
select avg(salary)
from employees
where department_id=(
select department_id
from departments
where department_name = 'Sales'));

--���������� Į������ �� ���̺� �ִٸ� ���������� ���, �ƴ϶�� ���λ��!! 