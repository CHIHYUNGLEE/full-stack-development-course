--����
--����� ����� ������ȣ�� ����Ͻÿ�.
select employee_id, job_id
from employees;

--��������� ���, ����������ȣ�� ����Ͻÿ�.
select employee_id, job_id,start_date, end_date
from job_history;

select employee_id,job_id
from employees
union
select employee_id,job_id
from job_history
order by employee_id;


--176������� ���������� ���������� ����Ͻÿ�. ��, �ߺ������� �����մϴ�. --2��
select employee_id,job_id
from employees
where employee_id = 176
union
select employee_id,job_id
from job_history
where employee_id = 176;

----176������� ���������� ���������� ����Ͻÿ�. union all 3��
select employee_id,job_id
from employees
where employee_id = 176
union all
select employee_id,job_id
from job_history
where employee_id = 176;
----------------------------------------------------------
--������ : intersect
select employee_id,job_id
from employees
intersect
select employee_id,job_id
from job_history;

--������ : minus
select employee_id,job_id
from employees
minus
select employee_id,job_id
from job_history;