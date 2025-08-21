--사원의 사번, 이름, 부서번호,부서명을 출력하시오.
select employee_id, first_name,department_id
from employees; --107개 행

select department_id, department_name
from departments; --27개 행

select *
from employees,departments; --2889개 행

select *
from employees,departments
where employees.department_id = departments.department_id; --106건 오라클에서만 가능한 조인표기법

--ansi 조인 표기법.
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
--natural join - on절과 테이블이름 없이도 표현이 됨.
--내츄럴 조인은 별로 권장되지 않음. 조인에 참여한 두테이블의 겹치는 모든 칼럼이 조건이 되서 참조될수잇음.
--사원의 사번, 이름, 직무번호, 직무명을 출력하시오.
select employee_id, first_name, jobs.job_id, job_title
from employees
inner join jobs 
on employees.job_id = jobs.job_id;

select employee_id, first_name, job_id, job_title
from employees
natural join jobs; 

--사원의 사번, 이름, 부서번호,부서명을 출력하시오.
select employee_id, first_name,department_id,department_name
from employees 
natural join departments; --(X)

--using 
--사원의 사번, 이름, 부서번호,부서명을 출력하시오.
select employee_id, first_name,department_id,department_name
from employees 
join departments using (department_id);

--------------------------------------------------------------
--사원의 사번 이름 부서번호 부서명을 출력하시오. --106건
select employee_id, first_name, department_id, department_name
from employees
join departments
using(department_id);

select employee_id, first_name, d.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id; --오라클 조인표기법

--outer join
--부서가 없는 사원의 사번 이름 부서번호 부서명을 출력하시오.
select employee_id, first_name, department_id, department_name
from employees
left join departments
using(department_id);

select employee_id, first_name, d.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id(+); --오라클 조인표기법

--사원의 사번 이름 부서번호 부서명을 출력하시오.
--사원이 없는 부서도 출력한다.
select employee_id, first_name, department_id, department_name
from employees
right join departments
using(department_id);

select employee_id, first_name, d.department_id, department_name
from employees e, departments d
where e.department_id(+) = d.department_id; --오라클 조인표기법

--사원의 사번 이름 부서번호 부서명을 출력하시오.
--사원이 없는 부서도 출력하고 부서가 없는 사원도 출력한다.
select employee_id, first_name, department_id, department_name
from employees
full join departments
using(department_id);

----------------------------------------------------------------
--self join
--사원의 사번, 이름, 관리자번호, 관리자이름을 출력하시오.
select e.employee_id 사번, e.first_name 사원명, m.manager_id 관리자번호, m.first_name 관리자이름
from employees e
join employees m
on e.manager_id = m.employee_id;

--사원의 사번, 이름, 관리자번호, 관리자이름,관리자소속부서을 출력하시오.
select e.employee_id 사번, e.first_name 사원명, m.manager_id 관리자번호, m.first_name 관리자이름,m.department_id
from employees e
join employees m
on e.manager_id = m.employee_id;

--사원의 사번, 이름, 관리자번호, 관리자이름,관리자소속부서을 출력하시오.
--사원부서와 관리자부서가 다른 사원들만 출력하시오.
select e.employee_id 사번, e.first_name 사원명, m.manager_id 관리자번호, m.first_name 관리자이름,m.department_id
from employees e
join employees m
on e.manager_id = m.employee_id
where e.department_id != m.department_id;

--사원의 사번, 이름, 급여 ,관리자번호, 관리자이름,관리자소속부서을 출력하시오.
--사원급여가 관리자급여보다 많은 사원들만 출력하시오.
select e.employee_id 사번, e.first_name 사원명, e.salary 급여,m.manager_id 관리자번호, m.first_name 관리자이름,m.salary 관리자급여,m.department_id
from employees e
join employees m
on e.manager_id = m.employee_id
where e.salary > m.salary;