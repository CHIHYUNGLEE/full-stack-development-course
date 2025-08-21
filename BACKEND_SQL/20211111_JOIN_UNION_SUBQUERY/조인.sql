--����� ���, �̸�, �μ���ȣ,�μ����� ����Ͻÿ�.
select employee_id, first_name,department_id
from employees; --107�� ��

select department_id, department_name
from departments; --27�� ��

select *
from employees,departments; --2889�� ��

select *
from employees,departments
where employees.department_id = departments.department_id; --106�� ����Ŭ������ ������ ����ǥ���

--ansi ���� ǥ���.
--inner join on
select employees.employee_id, employees.first_name,employees.department_id,departments.department_name
from employees 
inner join departments 
on employees.department_id = departments.department_id
order by employee_id;

select e.employee_id, e.first_name,e.department_id,d.department_name
from employees e
inner join departments d
on e.department_id = d.department_id
order by employee_id;
--natural join - on���� ���̺��̸� ���̵� ǥ���� ��.
--���� ������ ���� ������� ����. ���ο� ������ �����̺��� ��ġ�� ��� Į���� ������ �Ǽ� �����ɼ�����.
--����� ���, �̸�, ������ȣ, �������� ����Ͻÿ�.
select employee_id, first_name, jobs.job_id, job_title
from employees
inner join jobs 
on employees.job_id = jobs.job_id;

select employee_id, first_name, job_id, job_title
from employees
natural join jobs; 

--����� ���, �̸�, �μ���ȣ,�μ����� ����Ͻÿ�.
select employee_id, first_name,department_id,department_name
from employees 
natural join departments; --(X)

--using 
--����� ���, �̸�, �μ���ȣ,�μ����� ����Ͻÿ�.
select employee_id, first_name,department_id,department_name
from employees 
join departments using (department_id);

--------------------------------------------------------------
--����� ��� �̸� �μ���ȣ �μ����� ����Ͻÿ�. --106��
select employee_id, first_name, department_id, department_name
from employees
join departments
using(department_id);

select employee_id, first_name, d.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id; --����Ŭ ����ǥ���

--outer join
--�μ��� ���� ����� ��� �̸� �μ���ȣ �μ����� ����Ͻÿ�.
select employee_id, first_name, department_id, department_name
from employees
left join departments
using(department_id);

select employee_id, first_name, d.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id(+); --����Ŭ ����ǥ���

--����� ��� �̸� �μ���ȣ �μ����� ����Ͻÿ�.
--����� ���� �μ��� ����Ѵ�.
select employee_id, first_name, department_id, department_name
from employees
right join departments
using(department_id);

select employee_id, first_name, d.department_id, department_name
from employees e, departments d
where e.department_id(+) = d.department_id; --����Ŭ ����ǥ���

--����� ��� �̸� �μ���ȣ �μ����� ����Ͻÿ�.
--����� ���� �μ��� ����ϰ� �μ��� ���� ����� ����Ѵ�.
select employee_id, first_name, department_id, department_name
from employees
full join departments
using(department_id);

----------------------------------------------------------------
--self join
--����� ���, �̸�, �����ڹ�ȣ, �������̸��� ����Ͻÿ�.
select e.employee_id ���, e.first_name �����, m.manager_id �����ڹ�ȣ, m.first_name �������̸�
from employees e
join employees m
on e.manager_id = m.employee_id;

--����� ���, �̸�, �����ڹ�ȣ, �������̸�,�����ڼҼӺμ��� ����Ͻÿ�.
select e.employee_id ���, e.first_name �����, m.manager_id �����ڹ�ȣ, m.first_name �������̸�,m.department_id
from employees e
join employees m
on e.manager_id = m.employee_id;

--����� ���, �̸�, �����ڹ�ȣ, �������̸�,�����ڼҼӺμ��� ����Ͻÿ�.
--����μ��� �����ںμ��� �ٸ� ����鸸 ����Ͻÿ�.
select e.employee_id ���, e.first_name �����, m.manager_id �����ڹ�ȣ, m.first_name �������̸�,m.department_id
from employees e
join employees m
on e.manager_id = m.employee_id
where e.department_id != m.department_id;

--����� ���, �̸�, �޿� ,�����ڹ�ȣ, �������̸�,�����ڼҼӺμ��� ����Ͻÿ�.
--����޿��� �����ڱ޿����� ���� ����鸸 ����Ͻÿ�.
select e.employee_id ���, e.first_name �����, e.salary �޿�,m.manager_id �����ڹ�ȣ, m.first_name �������̸�,m.salary �����ڱ޿�,m.department_id
from employees e
join employees m
on e.manager_id = m.employee_id
where e.salary > m.salary;