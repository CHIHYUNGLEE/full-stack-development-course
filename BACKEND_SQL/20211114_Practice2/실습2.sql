--1. 부서평균급여가 9500 이상인 부서대상으로 부서별 최대급여, 평균급여, 인원수를 출력하시오.평균급여를 소숫점둘째자리에서 반올림한다
--단, 각부서의 최대급여와 최소급여가 같은 부서는 제외한다.

--서브쿼리
select department_id 부서 ,max(salary) 최대급여,round(avg(salary),1) 평균급여,count(*) 인원수
from employees
where department_id in (
select department_id
from employees
group by department_id
having avg(salary)>=9500)
group by department_id
having max(salary)!=min(salary);

--서브쿼리 없이 작성
select department_id 부서,max(salary) 최대급여,round(avg(salary),1) 평균급여,count(*) 인원수
from employees
group by department_id
having avg(salary)>=9500
and max(salary)!=min(salary);

--2. region_name 이 "Americas"인 지역의 사원급여 중 최소급여값을 출력하시오

--서브쿼리
select min(salary) 최소급여
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
select region_name 지역이름, min(salary) 최소급여
from employees e
join departments d on e.department_id = d.department_id
join locations l on l.location_id = d.location_id
join countries c on l.country_id = c.country_id
join regions r on c.region_id = r.region_id 
where region_name = 'Americas'
group by region_name;

--3. job_title 이 'Programmer'인 매니저로 부터 관리받는 사원중 부서명이'IT'인 부서의 사번, 이름을 출력하시오.

select employee_id 사번 ,first_name 이름  
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

--4. job_title 이 Manager 로 끝나는 사원들의 job_title 별 평균 급여을 출력하시오.

--join
select job_title,avg(salary) 평균급여
from employees
join jobs
on employees.job_id = jobs.job_id
where job_title like '%Manager'
group by job_title,employee_id;

--서브쿼리 및 스칼라쿼리
select (select job_title from jobs where job_id=employees.job_id) job_title,salary
from employees
where job_id in (select job_id
from jobs
where job_title like '%Manager');

--5. 'Seattle', 'Toronto'도시에 근무하는 사원들의 도시명,사번, 이름, 부서 ID, 부서명 을 출력하시오(ScalarQuery 로 완성)

--스칼라 쿼리
select  (select city from locations where location_id = (select location_id from departments where department_id = employees.department_id)) 도시명,
employee_id 사번,first_name 이름,department_id 부서ID,
(select department_name from departments where department_id = employees.department_id) 부서명
from employees
where department_id in (select department_id
from departments
where location_id in(
select location_id
from locations
where city in('Seattle','Toronto')));

--join
select l.city 도시명, e.employee_id 사번, e.first_name 이름, d.department_id 부서_id, d.department_name 부서명
from departments d
join employees e
on d.department_id = e.department_Id
join locations l
on d.location_id = l.location_id
where city in('Seattle','Toronto');