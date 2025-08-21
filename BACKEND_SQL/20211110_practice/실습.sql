--�ǽ�
--1.�޿��� 10000 �̰ų� 14000 �� ������� ���, �̸�(first_name), �޿��� �˻��Ͻÿ�.
select employee_id, first_name, salary
from employees
where salary=10000 or salary=14000;

--2. first_name �� ��ҹ��ڱ�������('e', 'E')�� �����ϴ� ��� ����� �˻��Ͻÿ�
select employee_id, first_name
from employees
where lower(first_name) like '%e%';

--3. first_name �� 'J���� �����ϰ� n ���ڸ� �����ϴ� ����� ���, �̸��� �˻��Ͻÿ�.
select employee_id, first_name
from employees
where first_name like 'J%n%';

--4. �޿��� 10000 �̻��� ����� ���, �μ���ȣ, �̸�, �޿�, ������ ����Ͻÿ�.��, �μ���ȣ��30 ��,60 ��, 90 ���� �μ��� �����ϰ� ����� �˻��Ѵ�.
select employee_id, department_id, first_name,salary,salary*commission_pct
from employees
where salary>=10000 and department_id NOT IN(90, 30, 60);

--5. �޿��� 4000 ���� ���� ������� �μ��� �޿���ո� ����Ͻÿ�. �� �޿������ �Ҽ������� 2 �ڸ����� �ݿø��մϴ�.
select department_id, round(avg(salary),1)
from employees
where salary>4000
group by department_id;

--6. �μ���ġ�� ���� ���� ����� �����ϰ� �μ��� �޿������ ����Ͻÿ�.�� �޿������ �Ҽ������� 2 �ڸ����� �ݿø��մϴ�
select department_id, round(avg(salary),1)
from employees
where department_id is not null
group by department_id;

--7. �μ���ġ�� ���� ���� ����� �����ϰ� �޿������ 10000 �̻��� �μ��� �޿������ ����Ͻÿ�.�� �޿������ �Ҽ������� 2 �ڸ����� �ݿø��մϴ�.
select department_id, round(avg(salary),1)
from employees
where department_id is not null
group by department_id
having avg(salary)>=10000;

--8. ��å(job_title)�� 'President'�� ����� ���, �̸��� ����Ͻÿ�: (NaturalJOIN ���� ǥ��)
select employee_id,first_name
from employees
natural join jobs
where jobs.job_title = 'President';

--9. ��å(job_title)�� 'President'�� �ƴ� ����� ���, �̸��� ����Ͻÿ�(JOIN USING ���� ǥ��)
select employee_id,first_name
from employees
join jobs
using (job_id)
where jobs.job_title <> 'President';

--10. �μ���ȣ, �μ���, �μ��� �޿��Ѿװ� ��ձ޿��� ����Ͻÿ�. ��, �޿��Ѿ��� ���� ������ �����ϰ�, ��ձ޿��� �Ҽ��� ���� 1 �ڸ����� ��Ÿ������ �ݿø��ؾ� �Ѵ�.
select e.department_id ,  d.department_name, sum(salary), round(avg(salary),1)
from employees e
join departments d
on e.department_id = d.department_id
group by e.department_id, d.department_name
order by sum(salary);


--11. 'Seattle', 'Toronto'���ÿ� �ٹ��ϴ� ������� ���ø�,���, �̸�, �μ� ID, �μ��� �� ����Ͻÿ�
select l.city, e.employee_id,e.first_name,e.department_id,d.department_name
from departments d
join employees e
on d.department_id = e.department_id
join locations l
on d.location_id = l.location_id
where l.city  in('Seattle','Toronto');

--12. 'Seattle'�� ������ ������ �μ��� ������� 5 ��̸��� ���ø�, �μ� ID, �μ���, ������� ����Ͻÿ�
select l.city, e.department_id, d.department_name,count(*)
from departments d
join employees e
on d.department_id = e.department_id
join locations l
on d.location_id = l.location_id
where l.city <> 'Seattle'
group by l.city, e.department_id, d.department_name
having count(*)<5;

--13. �μ� ID �� 50 �̰ų� 80 �� �μ��� �ٹ��ϴ� ������� ���� ID �� ��å(job_title)�� ����Ͻÿ�. ������� ����(job_id)�� �ߺ��� �����Ͻÿ�
select distinct j.job_id,j.job_title
from jobs j
join employees e
on e.job_id = j.job_id
where e.department_id in(50,80); 

--14. ����� ���, �����ڹ�ȣ, �μ� ID, �μ���, �μ��� ID �� ����Ͻÿ�
select e.employee_id,e.manager_id,d.department_id, d.department_name,d.manager_id
from employees e
join departments d
on e.department_id = d.department_id;

--15. ���� 'Davies'�� ����� �μ� ID �� �޿��� ����Ͻÿ�.
select department_id, salary
from employees
where last_name = 'Davies';

--16. ���� 'Davies'�� ����� ���� �μ��� �ٹ��ϴ� ������� ���, ��, �̸��� ����Ͻÿ�

select e.employee_id, e.first_name, e.last_name
from employees e join employees davies
on davies.last_name = 'Davies'
where e.department_id = davies.department_id and e.last_name != 'Davies';  
        