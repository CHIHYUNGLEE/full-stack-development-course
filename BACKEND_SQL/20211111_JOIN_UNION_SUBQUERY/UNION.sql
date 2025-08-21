--집합
--사원의 사번과 직무번호를 출력하시오.
select employee_id, job_id
from employees;

--직무경력의 사번, 이전직무번호를 출력하시오.
select employee_id, job_id,start_date, end_date
from job_history;

select employee_id,job_id
from employees
union
select employee_id,job_id
from job_history
order by employee_id;


--176번사원의 이전직무와 현재직무를 출력하시오. 단, 중복직무는 제거합니다. --2건
select employee_id,job_id
from employees
where employee_id = 176
union
select employee_id,job_id
from job_history
where employee_id = 176;

----176번사원의 이전직무와 현재직무를 출력하시오. union all 3건
select employee_id,job_id
from employees
where employee_id = 176
union all
select employee_id,job_id
from job_history
where employee_id = 176;
----------------------------------------------------------
--교집합 : intersect
select employee_id,job_id
from employees
intersect
select employee_id,job_id
from job_history;

--차집합 : minus
select employee_id,job_id
from employees
minus
select employee_id,job_id
from job_history;