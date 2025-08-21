--실습
--1.급여가 10000 이거나 14000 인 사원들의 사번, 이름(first_name), 급여를 검색하시오.
select employee_id, first_name, salary
from employees
where salary=10000 or salary=14000;

--2. first_name 에 대소문자구별없이('e', 'E')를 포함하는 모든 사원을 검색하시오
select employee_id, first_name
from employees
where lower(first_name) like '%e%';

--3. first_name 이 'J’로 시작하고 n 문자를 포함하는 사원의 사번, 이름을 검색하시오.
select employee_id, first_name
from employees
where first_name like 'J%n%';

--4. 급여가 10000 이상인 사원의 사번, 부서번호, 이름, 급여, 수당을 출력하시오.단, 부서번호가30 번,60 번, 90 번인 부서는 제외하고 사원을 검색한다.
select employee_id, department_id, first_name,salary,salary*commission_pct
from employees
where salary>=10000 and department_id NOT IN(90, 30, 60);

--5. 급여가 4000 보다 많은 사원들의 부서별 급여평균를 출력하시오. 단 급여평균은 소숫점이하 2 자리에서 반올림합니다.
select department_id, round(avg(salary),1)
from employees
where salary>4000
group by department_id;

--6. 부서배치를 받지 않은 사원은 제외하고 부서별 급여평균을 출력하시오.단 급여평균은 소숫점이하 2 자리에서 반올림합니다
select department_id, round(avg(salary),1)
from employees
where department_id is not null
group by department_id;

--7. 부서배치를 받지 않은 사원은 제외하고 급여평균이 10000 이상인 부서별 급여평균을 출력하시오.단 급여평균은 소숫점이하 2 자리에서 반올림합니다.
select department_id, round(avg(salary),1)
from employees
where department_id is not null
group by department_id
having avg(salary)>=10000;

--8. 직책(job_title)이 'President'인 사원의 사번, 이름을 출력하시오: (NaturalJOIN 으로 표현)
select employee_id,first_name
from employees
natural join jobs
where jobs.job_title = 'President';

--9. 직책(job_title)이 'President'가 아닌 사원의 사번, 이름을 출력하시오(JOIN USING 으로 표현)
select employee_id,first_name
from employees
join jobs
using (job_id)
where jobs.job_title <> 'President';

--10. 부서번호, 부서명, 부서별 급여총액과 평균급여를 출력하시오. 단, 급여총액이 낮은 순으로 정렬하고, 평균급여는 소수점 이하 1 자리까지 나타나도록 반올림해야 한다.
select e.department_id ,  d.department_name, sum(salary), round(avg(salary),1)
from employees e
join departments d
on e.department_id = d.department_id
group by e.department_id, d.department_name
order by sum(salary);


--11. 'Seattle', 'Toronto'도시에 근무하는 사원들의 도시명,사번, 이름, 부서 ID, 부서명 을 출력하시오
select l.city, e.employee_id,e.first_name,e.department_id,d.department_name
from departments d
join employees e
on d.department_id = e.department_id
join locations l
on d.location_id = l.location_id
where l.city  in('Seattle','Toronto');

--12. 'Seattle'을 제외한 도시의 부서별 사원수가 5 명미만인 도시명, 부서 ID, 부서명, 사원수를 출력하시오
select l.city, e.department_id, d.department_name,count(*)
from departments d
join employees e
on d.department_id = e.department_id
join locations l
on d.location_id = l.location_id
where l.city <> 'Seattle'
group by l.city, e.department_id, d.department_name
having count(*)<5;

--13. 부서 ID 가 50 이거나 80 인 부서에 근무하는 사원들의 직무 ID 와 직책(job_title)을 출력하시오. 결과에서 직종(job_id)의 중복은 제거하시오
select distinct j.job_id,j.job_title
from jobs j
join employees e
on e.job_id = j.job_id
where e.department_id in(50,80); 

--14. 사원의 사번, 관리자번호, 부서 ID, 부서명, 부서장 ID 를 출력하시오
select e.employee_id,e.manager_id,d.department_id, d.department_name,d.manager_id
from employees e
join departments d
on e.department_id = d.department_id;

--15. 성이 'Davies'인 사원의 부서 ID 와 급여를 출력하시오.
select department_id, salary
from employees
where last_name = 'Davies';

--16. 성이 'Davies'인 사원과 같은 부서에 근무하는 사원들의 사번, 성, 이름을 출력하시오

select e.employee_id, e.first_name, e.last_name
from employees e join employees davies
on davies.last_name = 'Davies'
where e.department_id = davies.department_id and e.last_name != 'Davies';  
        