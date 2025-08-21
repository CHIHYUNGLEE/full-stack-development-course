--그룹함수: sum(), count(), avg(), max(), min()..... 
select sum(salary) 급여총합
,count(*) 사원수
,count(department_id) "부서를 갖는 사원수"
,count(commission_pct) "수당을 받는 사원수"
,avg(salary) "급여 평균"
,max(salary) "최대 급여"
,min(salary) "최소 급여"
from employees;

------------------------------------------------------------------
--GROUP BY절에서 사용한 컬럼만 SELECT절에서 그룹함수와 함께 사용할 수있다.
--부서별 사원수를 출력하시오.
select department_id,count(*) --EMPLOYEE_ID, DEPARTMENT_ID,COUNT(*) 불가
from employees
group by department_id
ORDER BY 2 desc;

--2007년에 입사한 사원수와 평균급여 
select count(*) "2007년 입사자수",avg(salary) "년도별입사자급여평균"
from employees
where to_char(hire_date,'YYYY') = '2007';

--년도별 입사한 사원수와 평균급여를 출력하시오, 단 최근연도부터 출력하시오.
select to_char(hire_date,'YYYY') 년도, count(*) "년도별 입사자수",avg(salary) "년도별입사자급여평균" 
from employees
group by to_char(hire_date,'YYYY')
order by to_char(hire_date,'YYYY') desc;

--월별 입사한 사원수와 평균급여를 출력하시오, 단 1월부터 출력하시오.
select to_number(to_char(hire_date,'MM')) 월, count(*) "월별 입사자수",avg(salary) "월별입사자급여평균" 
from employees
group by to_char(hire_date,'MM')
order by 1;

select to_number(to_char(hire_date,'FMMM')) 월, count(*) "월별 입사자수",avg(salary) "월별입사자급여평균" 
from employees
group by to_char(hire_date,'FMMM')
order by 1;

--지역
select location_id, city
from locations;

--부서
select department_id, location_id
from departments;

--지역별 지역번호, 부서수를 출력하시오.
select location_id, count(department_id)
from departments
group by location_id;

--지역별 지역번호, ,도시명, 부서수를 출력하시오. --안됨., 해결하려면 join또는 subquery로 해결.
select location_id, city,count(*)
from departments
group by location_id;

--하반기(7월~12월) 월별 입사자수를 출력하시오. 
select to_number(to_char(hire_date,'MM')) 입사월, count(*) "월별 입사자수"
from employees
where to_number(to_char(hire_date,'MM')) between '7' and '12' 
group by to_number(to_char(hire_date,'MM'))
order by 1;

--having : 그룹에 대한 조건절
--하반기(7월~12월) 월별 입사자수를 출력하시오. 
--단, 입사자수가 7명이상인 월만 출력하시오.

select to_number(to_char(hire_date,'MM')) 입사월, count(*) "월별 입사자수"
from employees
where to_number(to_char(hire_date,'MM')) between '7' and '12' 
group by to_number(to_char(hire_date,'MM'))
having count(*)>=7 
order by 1;

--급여가 5000이상인 사원들의 부서별 평균급여를 출력하시오. 단, 평균급여가 10000이상인 부서만 출력하시오.
select department_id,avg(salary)
from employees
where salary>=5000
group by department_id
having avg(salary)>=10000;

--부서별 사원수를 출력하시오.
select department_id,count(*)
from employees
group by department_id;

--부서별 사원수를 출력하시오. 사원 총합도 출력하시오.
select department_id,count(*)
from employees
group by rollup(department_id);

--부서별,직무별 사원수를 출력하시오.
select department_id,job_id,count(*)
from employees
group by department_id,job_id
order by department_id,job_id;

--부서별, 직무별 사원수를 출력하시오. 총사원수, 부서별 사원수도 출력하시오. 대신 부서가 없는 사원은 제외한다.
select nvl(to_char(department_id),'총사원수')
      ,nvl(job_id,'부서별 사원수')
      ,count(*)
from employees
where department_id is not null
group by rollup(department_id,job_id)
order by department_id,job_id;

--cube
select nvl(to_char(department_id),'총사원수')
      ,nvl(job_id,'부서별 사원수')
      ,count(*)
from employees
where department_id is not null
group by cube(department_id,job_id)
order by department_id,job_id;