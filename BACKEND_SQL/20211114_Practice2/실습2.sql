--1. �μ���ձ޿��� 9500 �̻��� �μ�������� �μ��� �ִ�޿�, ��ձ޿�, �ο����� ����Ͻÿ�.��ձ޿��� �Ҽ�����°�ڸ����� �ݿø��Ѵ�
--��, ���μ��� �ִ�޿��� �ּұ޿��� ���� �μ��� �����Ѵ�.

--��������
select department_id �μ� ,max(salary) �ִ�޿�,round(avg(salary),1) ��ձ޿�,count(*) �ο���
from employees
where department_id in (
select department_id
from employees
group by department_id
having avg(salary)>=9500)
group by department_id
having max(salary)!=min(salary);

--�������� ���� �ۼ�
select department_id �μ�,max(salary) �ִ�޿�,round(avg(salary),1) ��ձ޿�,count(*) �ο���
from employees
group by department_id
having avg(salary)>=9500
and max(salary)!=min(salary);

--2. region_name �� "Americas"�� ������ ����޿� �� �ּұ޿����� ����Ͻÿ�

--��������
select min(salary) �ּұ޿�
from employees
where department_id in (
    select department_id
    from departments
    where location_id in(
        select location_id
        from locations
        where country_id in (
                select country_id
                from countries
                where region_id =(select region_id
                                  from regions
                                  where region_name = 'Americas'))));
                                  
--join
select region_name �����̸�, min(salary) �ּұ޿�
from employees e
join departments d on e.department_id = d.department_id
join locations l on l.location_id = d.location_id
join countries c on l.country_id = c.country_id
join regions r on c.region_id = r.region_id 
where region_name = 'Americas'
group by region_name;

--3. job_title �� 'Programmer'�� �Ŵ����� ���� �����޴� ����� �μ�����'IT'�� �μ��� ���, �̸��� ����Ͻÿ�.

select employee_id ��� ,first_name �̸�  
from employees
where department_id 
    =(select department_id
    from departments
    where department_name = 'IT') and manager_id in(
        select employee_id
        from employees
        where job_id=(
            select job_id
            from jobs
            where job_title='Programmer'));

--4. job_title �� Manager �� ������ ������� job_title �� ��� �޿��� ����Ͻÿ�.

--join
select job_title,avg(salary) ��ձ޿�
from employees
join jobs
on employees.job_id = jobs.job_id
where job_title like '%Manager'
group by job_title,employee_id;

--�������� �� ��Į������
select (select job_title from jobs where job_id=employees.job_id) job_title,salary
from employees
where job_id in (select job_id
from jobs
where job_title like '%Manager');

--5. 'Seattle', 'Toronto'���ÿ� �ٹ��ϴ� ������� ���ø�,���, �̸�, �μ� ID, �μ��� �� ����Ͻÿ�(ScalarQuery �� �ϼ�)

--��Į�� ����
select  (select city from locations where location_id = (select location_id from departments where department_id = employees.department_id)) ���ø�,
employee_id ���,first_name �̸�,department_id �μ�ID,
(select department_name from departments where department_id = employees.department_id) �μ���
from employees
where department_id in (select department_id
from departments
where location_id in(
select location_id
from locations
where city in('Seattle','Toronto')));

--join
select l.city ���ø�, e.employee_id ���, e.first_name �̸�, d.department_id �μ�_id, d.department_name �μ���
from departments d
join employees e
on d.department_id = e.department_Id
join locations l
on d.location_id = l.location_id
where city in('Seattle','Toronto');