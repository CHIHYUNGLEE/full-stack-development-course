--서브쿼리
--서브 쿼리의 위치상 종류
--스칼라 쿼리 : select(select~~)
--인라인 뷰 : from(select~~)
--서브 쿼리 : where 컬럼 비교연산(=select~~)

--서브쿼리의 반환행수별 종류
--단일행서브쿼리 - 일반 비교연산자 사용가능(=,<>,>,>=,<=,<)
--여러행서브쿼리 - in, any, all

--사원중에서 최대 급여를 받는 사원의 급여를 출력하시오.

select max(salary)
from employees;

--사원중에서 최대 급여를 받는 사원의 사번,이름,급여를 출력하시오.
--1) 최대 급여를 계산한다. select max(salary) from employees;
--2) 최대 급여와 같은 급여를 받는 사원을 추출한다.
select employee_id, first_name, salary
from employees
where salary = (select max(salary) from employees);

--평균급여보다 많은 급여를 받는 사원의 사번, 이름,급여를 출력하시오.
select avg(salary)
from employees;

select employee_id, first_name, salary
from employees
where salary > (select avg(salary) from employees); 

--최대급여를 받는 사원과 같은 부서에서 근무하는 사원들의 사번,이름,급여,부서번호를 출력하시오.
--1)최대급여를 받는 사원의 부서번호를 검색한다. 
--2)1과 같은 부서번호를 갇는 사원의 출력.
select employee_id, first_name,salary,department_id
from employees
where department_id=(select department_id
                     from employees
                     where salary =(select max(salary) from employees));
-----------------------------------------------------------------------------------
--여러행 서브쿼리

--부서별 최대급여를 출력하시오.
select department_id, max(salary)
from employees
group by department_id;

--부서별 최대급여보다 많은 급여를 받는 사원들의 사번,이름,부서번호,급여을 출력하시오.
--1)부서별 최대급여를 계산하다.
--2)부서별 최대급여보다 많은 급여를 받는 사원들의 사번,이름,부서번호,급여출력
select employee_id, first_name, department_id,salary
from employees
where salary > (select max(salary) from employees group by department_id); --(x)

--in
select employee_id, first_name, department_id,salary
from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id);  -- 11건 null부서 제외

select employee_id, first_name, department_id,salary
from employees
where (nvl(department_id,0), salary) in (select nvl(department_id,0), max(salary) from employees group by department_id);  --12건 null부서 포함

--=any는 in과 같다.
--<any는 최대값보다 작다.
-->any는 최소값보다 크다.
--<all는 최소값보다 작다.
-->all는 최대값보다 크다.
select employee_id, first_name, department_id,salary
from employees
where (nvl(department_id,0), salary) =any (select nvl(department_id,0), max(salary) from employees group by department_id); 

--직무가 아이티프로그인 사원들의 최대급여보다 작은 급여를 받는 사원의 사번,이름,급여,직무를 출력하시오.
select employee_id, first_name, job_id, salary
from employees
where job_id = 'IT_PROG';

select employee_id, first_name,job_id, salary
from employees
where salary<(
select max(salary)
from employees
where job_id = 'IT_PROG'); --max사용

select employee_id, first_name,job_id, salary
from employees
where salary < any (
select salary
from employees
where job_id = 'IT_PROG'); --<any사용

--------------------------------------------------
직책이 president인 사원의 사번,이름을 출력하시오.

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
--스칼라쿼리
--부서번호, 부서명, 부서별 급여총액을 출력하시오.
select department_id, department_name, sum(salary)
from employees 
join departments
using(department_id)
group by department_id, department_name;

select department_id,(select department_name from departments where department_id = employees.department_id),sum(salary)
from employees
group by department_id;

---------------------------------------------------------------------------------------------------------------------
--실습
--16. 성이 'Davies'인 사원과 같은 부서에 근무하는 사원들의 사번, 성, 이름을 출력하시오

select employee_id, first_name,first_name
from employees
where department_id = (select department_id from employees where last_name = 'Davies') 
and last_name != 'Davies';

--'Sales'부서의 평균급여보다 많은 급여를 받는 사원들의 부서번호,사번,급여를 출력하시오.
select department_id,employee_id, salary
from employees
where salary > (
select avg(salary)
from employees
where department_id=(
select department_id
from departments
where department_name = 'Sales'));

--출력해줘야할 칼럼들이 한 테이블에 있다면 서브쿼리를 사용, 아니라면 조인사용!! 